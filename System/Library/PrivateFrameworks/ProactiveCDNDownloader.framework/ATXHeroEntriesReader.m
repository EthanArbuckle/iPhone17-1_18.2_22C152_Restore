@interface ATXHeroEntriesReader
+ (BOOL)validateReader:(id)a3 pbEntries:(id)a4;
+ (id)appAndClipEntryFromPbEntries:(id)a3 position:(unint64_t)a4;
+ (id)loadAppAndClipEntriesFromData:(id)a3;
+ (id)loadAppAndClipEntriesFromFileURL:(id)a3;
@end

@implementation ATXHeroEntriesReader

+ (id)appAndClipEntryFromPbEntries:(id)a3 position:(unint64_t)a4
{
  id v5 = a3;
  double v6 = (double)*(int *)([v5 deltaLatitudes] + 4 * a4);
  double v7 = (v6 + (double)(int)[v5 tileLatitudeE7]) / 10000000.0;
  int v8 = *(_DWORD *)([v5 deltaLongitudes] + 4 * a4);
  int v9 = [v5 tileLongitudeE7];
  if (v7 < -90.0 || v7 > 90.0 || (double v10 = ((double)v8 + (double)v9) / 10000000.0, v10 < -180.0) || v10 > 180.0)
  {
    v18 = __atxlog_handle_hero();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[ATXHeroEntriesReader appAndClipEntryFromPbEntries:position:](a4, v18);
    }

    v19 = 0;
  }
  else
  {
    uint64_t v11 = *(unsigned int *)([v5 adamIds] + 4 * a4);
    if ([v5 urlHashsCount]
      && ([v5 urlHashs],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 objectAtIndexedSubscript:a4],
          v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 length],
          v13,
          v12,
          v14 == 32))
    {
      v15 = [v5 urlHashs];
      v16 = [v15 objectAtIndexedSubscript:a4];
      v17 = +[ATXDigestConverter binToHex:v16];
    }
    else
    {
      v17 = 0;
    }
    if ([v5 radiusCount]) {
      uint64_t v20 = *(unsigned int *)([v5 radius] + 4 * a4);
    }
    else {
      uint64_t v20 = 0;
    }
    if ([v5 ranksCount]) {
      uint64_t v21 = *(unsigned int *)([v5 ranks] + 4 * a4);
    }
    else {
      uint64_t v21 = 1;
    }
    if ([v5 isTouristAppsCount]) {
      BOOL v22 = *(unsigned char *)([v5 isTouristApps] + a4) != 0;
    }
    else {
      BOOL v22 = 0;
    }
    v23 = [v5 poiCategorys];
    v24 = [v23 objectAtIndexedSubscript:a4];

    if ([v5 muidsCount]) {
      v25 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", *(void *)(objc_msgSend(v5, "muids") + 8 * a4));
    }
    else {
      v25 = 0;
    }
    v19 = -[ATXHeroEntry initWithAdamId:urlHash:location:radiusInMeters:rank:isTouristApp:poiCategory:poiMuid:]([ATXHeroEntry alloc], "initWithAdamId:urlHash:location:radiusInMeters:rank:isTouristApp:poiCategory:poiMuid:", v11, v17, v20, v21, v22, v24, v7, v10, v25);
  }

  return v19;
}

+ (BOOL)validateReader:(id)a3 pbEntries:(id)a4
{
  id v5 = (char *)a4;
  if ((ATXHeroEntriesPbReadFrom(v5, (uint64_t)a3) & 1) == 0)
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.7();
    }
    goto LABEL_22;
  }
  uint64_t v6 = [v5 deltaLatitudesCount];
  if ((unint64_t)(v6 - 100001) < 0xFFFFFFFFFFFE7960
    || (uint64_t v7 = v6, [v5 deltaLongitudesCount] != v6))
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:]();
    }
    goto LABEL_22;
  }
  if ([v5 adamIdsCount] != v7)
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.6();
    }
    goto LABEL_22;
  }
  if ([v5 radiusCount]
    && ((unint64_t)[v5 radiusCount] > 0x186A0 || v7 != objc_msgSend(v5, "radiusCount")))
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.5();
    }
    goto LABEL_22;
  }
  if ([v5 ranksCount]
    && ((unint64_t)[v5 ranksCount] > 0x186A0 || v7 != objc_msgSend(v5, "ranksCount")))
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.4();
    }
    goto LABEL_22;
  }
  if ([v5 urlHashsCount]
    && ((unint64_t)[v5 urlHashsCount] > 0x186A0 || v7 != objc_msgSend(v5, "urlHashsCount")))
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:]();
    }
    goto LABEL_22;
  }
  if ([v5 poiCategorysCount]
    && ((unint64_t)[v5 poiCategorysCount] > 0x186A0 || v7 != objc_msgSend(v5, "poiCategorysCount")))
  {
    int v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ATXHeroEntriesReader validateReader:pbEntries:]();
    }
LABEL_22:

    BOOL v8 = 0;
    goto LABEL_23;
  }
  BOOL v8 = 1;
LABEL_23:

  return v8;
}

+ (id)loadAppAndClipEntriesFromFileURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v3 options:1 error:&v9];
  id v5 = v9;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [(id)objc_opt_class() loadAppAndClipEntriesFromData:v4];
  }
  else
  {
    uint64_t v7 = __atxlog_handle_hero();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_21FF54000, v7, OS_LOG_TYPE_DEFAULT, "ATXCDN: Ignore reading nil or 0-byte file %@: %@", buf, 0x16u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)loadAppAndClipEntriesFromData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ATXHeroEntriesPb);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v4];
  if ([a1 validateReader:v6 pbEntries:v5])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[ATXHeroEntriesPb adamIdsCount](v5, "adamIdsCount"));
    if ([(ATXHeroEntriesPb *)v5 adamIdsCount])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = (void *)MEMORY[0x223C62930]();
        double v10 = [a1 appAndClipEntryFromPbEntries:v5 position:v8];
        if (v10) {
          [v7 addObject:v10];
        }

        ++v8;
      }
      while (v8 < [(ATXHeroEntriesPb *)v5 adamIdsCount]);
    }
    if ([v7 count]) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (void)appAndClipEntryFromPbEntries:(uint64_t)a1 position:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FF54000, a2, OS_LOG_TYPE_DEBUG, "ATXCDN: Skipping malformed entry at position: %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)validateReader:pbEntries:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - lat/lng count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - poiCategory count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - urlHash count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - rank count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - radius count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Malformed protobuf - adamId count mismatch", v2, v3, v4, v5, v6);
}

+ (void)validateReader:pbEntries:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21FF54000, v0, v1, "ATXCDN: Unable deserialize protobuf", v2, v3, v4, v5, v6);
}

@end