library(openai)

api_key = "xxx"

# 年齢の範囲（20歳から70歳）
ages <- c(20,30,40,50,60,70)
# 性別
genders <- c("男性", "女性", "その他")
# 職業
occupations <- c("教師", "エンジニア", "医者", "学生", "自営業", "退職者", "フリーランサー")
# 教育レベル
education_levels <- c("高校卒", "専門学校卒", "大学卒", "大学院卒")

# 家族構成
family_structures <- c("独身", "配偶者あり", "配偶者及び子供あり", "シングルペアレント")
# 住んでいる場所
living_areas <- c("都市部", "郊外", "地方")
# 収入レベル
income_levels <- c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)

# メディア消費のリスト
media_consumption <- c("SNSの使用", "テレビ視聴", "新聞読書", "オンライン記事閲覧", "ポッドキャスト聴取", "YouTube視聴")

# デバイス使用のリスト
device_usage <- c("スマートフォン", "タブレット", "PC", "スマートウォッチ")

# 日常のルーティンのリスト
daily_routines <- c("朝のジョギング", "通勤中にポッドキャストを聴く", "昼食後の短い散歩", "仕事後のジム通い", "夜に読書する", "家族との夕食", "就寝前の瞑想")

# 趣味のリスト
hobbies <- c("アウトドア活動", "アートとクラフト", "音楽", "読書", "映画と演劇", "スポーツ", "料理とベーキング", "旅行", "テクノロジー", "自己啓発")

# 価値観のリスト
values <- c("家族との時間", "環境保護", "教育と学習", "健康とウェルネス", "社会正義", "個人の自由", "経済的安定", "創造性とイノベーション", "コミュニティへの貢献", "ライフワークバランス")

# 購買行動のリスト
buying_behaviors <- c("品質重視", "価格意識的", "ブランド忠誠", "エココンシャス", "トレンド追求", "オンラインショッピング", "リサーチ重視", "インパルス購入", "技術愛好家", "体験重視")

# 健康意識のレベルのリスト
health_consciousness_levels <- c("高い", "中程度", "低い", "無関心")

# 食生活のスタイルのリスト
dietary_styles <- c("バランス型", "ヴィーガン", "ベジタリアン", "ローカーボ", "ファストフード愛好", "グルテンフリー")

# 外食の頻度のリスト
eating_out_frequencies <- c("ほとんどなし", "月に1-2回", "週に1-2回", "週に3回以上")

# 飲酒の頻度のリスト
drinking_frequencies <- c("飲まない", "月に1-2回", "週に1-2回", "週に3回以上")

# たばこを吸うか否かのリスト
smoking_statuses <- c("吸わない", "吸う")

# 週に運動する日数のリスト
exercise_days_per_week <- c("0日", "1-2日", "3-4日", "5日以上")

question1 <- "次のようなアプリがあった場合、使いたいと思いますか？あなたのプロフィールを鑑みて、どのプランなら使いたいと思うかどうかを考えてみて、使いたいプラン名を教えてください。もし自分にとって使いたいプランがなければ、「どれも選ばない」と回答してください。
「栄養追跡アプリ」
1.基本プラン:
機能:
基本的な食品追跡: 食べたものの記録と基本的な栄養情報（カロリー、タンパク質、脂質、炭水化物）の追跡。
標準的な食品データベース: 一般的な食品とその栄養情報へのアクセス。
毎日の栄養目標設定: カロリー摂取目標の設定と追跡。
サポート: オンラインヘルプセンター、FAQ。
料金: 無料。
2.中級プラン
機能:
梅プランのすべての機能。
拡張食品データベース: より多くの食品と詳細な栄養情報へのアクセス。
バーコードスキャン: 食品のバーコードをスキャンして迅速に情報を追加。
栄養レポート: 週間または月間の栄養摂取状況の詳細な分析とレポート。
パーソナライズされた食事提案: 健康目標に基づいた食事提案。
サポート: メールによるサポート、優先的なFAQアクセス。
料金: 月額 500円。
3.プレミアムプラン
機能:
竹プランのすべての機能。
専門家によるパーソナライズされた食事プラン: 栄養士による個別の食事プランの作成と調整。
食品アレルギー・好みのカスタマイズ: 特定の食品アレルギーや食生活の好み（ベジタリアン、ヴィーガン、グルテンフリー等）に基づいた食事提案。
ヘルスコーチとの1対1セッション: 健康目標達成のための定期的なオンラインセッション。
統合健康追跡: 他の健康アプリやデバイス（フィットネストラッカー、スマートスケールなど）からのデータ統合。
サポート: 専用のカスタマーサポート、栄養士やヘルスコーチとの直接やり取り。
料金: 月額 1000円"

question2 <- "「どれも選ばない」と回答した方へ:どのプランも選ばなかった理由を教えてください。
それ以外の方へ:1.「あなたが最も価値を見出す機能は何ですか？」2.「あなたにとって不必要な機能はありますか？」3.「どのような目標を達成するためにこのアプリを使用しますか？」?"

question3 <- "これまでの回答を次の項目順に出力してください。出力は半角カンマ区切りで以下の7点のみを出力してください。補足等は不要です。
1.どのプランを使うか(基本プランなら1、中級プランなら2、プレミアムプランなら3、どのプランも使わない場合は0)、
2.あなたが最も価値を見出す機能、
3.価値を見出す理由
4.あなたにとって不必要な機能
5.不必要だと思う理由
6.達成したい目標
7.(どのプランも使わないと回答した人のみ)プランを選ばなかった理由
※どのプランも使わないと回答した人は1～6の回答が不要です。
出力例1:2,バーコードスキャン,買い食いが多いため,オンラインヘルプセンター,使わないため,ダイエット,
出力例2:0,,,,,,健康に関心がない
"

get_persona <- function(seedvalue)
{
    set.seed(seedvalue)
    selected_age <- sample(ages, 1)
    selected_gender <- sample(genders, 1)
    selected_occupation <- sample(occupations, 1)
    selected_education_level <- sample(education_levels, 1)
    selected_family_structure <- sample(family_structures, 1)
    selected_living_area <- sample(living_areas, 1)
    selected_income_level <- sample(income_levels, 1)

    selected_media_consumption <- sample(media_consumption, 1)
    selected_device_usage <- sample(device_usage, 1)
    selected_daily_routine <- sample(daily_routines, 1)

    selected_hobby <- sample(hobbies, 1)
    selected_value <- sample(values, 1)
    selected_buying_behavior <- sample(buying_behaviors, 1)

    selected_health_consciousness <- sample(health_consciousness_levels, 1)
    selected_dietary_style <- sample(dietary_styles, 1)

    selected_eating_out_frequency <- sample(eating_out_frequencies, 1)
    selected_drinking_frequency <- sample(drinking_frequencies, 1)
    selected_smoking_status <- sample(smoking_statuses, 1)
    selected_exercise_days <- sample(exercise_days_per_week, 1)

    role <- paste0(
        "年齢:", selected_age, ",",
        "性別:", selected_gender, ",",
        "職業:", selected_occupation, ",",
        "教育レベル:", selected_education_level, ",",
        "家族構成:", selected_family_structure, ",",
        "住んでいる場所:", selected_living_area, ",",
        "年収(万円):", selected_income_level, ",",
    
        "メディア消費:", selected_media_consumption, ",",
        "デバイス使用:", selected_device_usage, ",",
        "日常のルーティン:", selected_daily_routine, ",",

        "興味・趣味:", selected_hobby, ",",
        "価値観:", selected_value, ",",
        "購買行動:", selected_buying_behavior, ",",

        "健康意識のレベル:", selected_health_consciousness, ",",
        "食生活のスタイル:", selected_dietary_style, ",",
    
        "外食の頻度:", selected_eating_out_frequency, ",",
        "飲酒の頻度:", selected_drinking_frequency, ",",
        "たばこを吸うか否か:", selected_smoking_status, ",",
        "週に運動する日数:", selected_exercise_days, " です。")
        
    return(role)
}

n <- 150 #アンケートに答えてもらう人数
cumm_price <- 0 #入力0.001$/1ktoken,出力0.003$/1ktoken,1$=150円で試算。
outputfilename <- "sapporor_result.txt" #q1,q2は自由に答えてもらう
csvfilename <- "sapporor_result.csv" #q3についてはカンマ区切りで出力してもらう。

hasen <- "-----------------------------\n"

for(i in 1:n)
{
    print(i)
    set.seed(i)
    persona <- get_persona(i)
    res <- create_chat_completion(
        model = "gpt-4-0125-preview",
        messages = list(
            list(
                "role" = "system",
                "content" = paste0("あなたは、", persona)
            ),
            list(
                "role" = "user",
                "content" = question1
            )
        ),
        temperature = 0.2,
        openai_api_key = api_key
    )
    ans <- res$choices$message.content
    #ファイルに出力
    cat(hasen, file = outputfilename, append = TRUE)
    cat(paste0(persona, "\n"), file = outputfilename, append = TRUE)
    cat(paste0(ans, "\n"), file = outputfilename, append = TRUE)

    cumm_price <- cumm_price + res$usage$prompt_tokens * 0.001 * 0.001 * 150
    cumm_price <- cumm_price + res$usage$completion_tokens * 0.003 * 0.001 * 150

    res2 <- create_chat_completion(
        model = "gpt-4-0125-preview",
        messages = list(
            list(
                "role" = "system",
                "content" = paste0("あなたは、", persona)
            ),
            list(
                "role" = "user",
                "content" = question1
            ),
            list(
                "role" = "assistant",
                "content" = ans
            ),
            list(
                "role" = "user",
                "content" = question2
            )
        ),
        temperature = 0.2,
        openai_api_key = api_key
    )
    ans2 <- res2$choices$message.content
    #ファイルに出力
    cat(paste0(ans2, "\n"), file = outputfilename, append = TRUE)
    cumm_price <- cumm_price + res2$usage$prompt_tokens * 0.001 * 0.001 * 150
    cumm_price <- cumm_price + res2$usage$completion_tokens * 0.003 * 0.001 * 150

    res3 <- create_chat_completion(
        model = "gpt-4-0125-preview",
        messages = list(
            list(
                "role" = "system",
                "content" = paste0("あなたは、", persona)
            ),
            list(
                "role" = "user",
                "content" = question1
            ),
            list(
                "role" = "assistant",
                "content" = ans
            ),
            list(
                "role" = "user",
                "content" = question2
            ),
            list(
                "role" = "assistant",
                "content" = ans2
            ),
            list(
                "role" = "user",
                "content" = question3
            )
        ),
        temperature = 0.2,
        openai_api_key = api_key
    )
    ans3 <- res3$choices$message.content
    #ファイルに出力
    cat(paste0(ans3, "\n"), file = outputfilename, append = TRUE)
    cat(paste0(persona, ",", i, ",", ans3, "\n"), file = csvfilename, append = TRUE)
    cumm_price <- cumm_price + res3$usage$prompt_tokens * 0.001 * 0.001 * 150
    cumm_price <- cumm_price + res3$usage$completion_tokens * 0.003 * 0.001 * 150
    print(cumm_price)
}

