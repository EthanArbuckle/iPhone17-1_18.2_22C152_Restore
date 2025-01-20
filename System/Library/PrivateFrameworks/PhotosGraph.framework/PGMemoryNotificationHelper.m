@interface PGMemoryNotificationHelper
+ (BOOL)memoriesOfTheDayAreWorthNotifyingWithPhotoLibrary:(id)a3;
+ (id)_memoryFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)lastTriggeredNotificationDateWithPhotoLibrary:(id)a3;
+ (id)nextPossibleNotificationDateWithPhotoLibrary:(id)a3;
@end

@implementation PGMemoryNotificationHelper

+ (id)_memoryFetchOptionsWithPhotoLibrary:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [a3 librarySpecificFetchOptions];
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v8[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v3 setSortDescriptors:v6];

  [v3 setIncludePendingMemories:0];
  [v3 setIncludeRejectedMemories:1];
  return v3;
}

+ (BOOL)memoriesOfTheDayAreWorthNotifyingWithPhotoLibrary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [v6 startOfDayForDate:v5];

  v8 = [a1 _memoryFetchOptionsWithPhotoLibrary:v4];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %d && (%K >= %@) && (%K <= %@)", @"category", 401, @"creationDate", v7, @"creationDate", v5];
  [v8 setPredicate:v9];

  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v15 isGreat] & 1) != 0
          || ([v15 isStellar] & 1) != 0
          || ([v15 isMustSee] & 1) != 0)
        {
          BOOL v16 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v16 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_14:

  return v16;
}

+ (id)lastTriggeredNotificationDateWithPhotoLibrary:(id)a3
{
  v3 = [a1 _memoryFetchOptionsWithPhotoLibrary:a3];
  [v3 setFetchLimit:1];
  [v3 setChunkSizeForFetch:100];
  objc_msgSend(v3, "setCacheSizeForFetch:", objc_msgSend(v3, "chunkSizeForFetch"));
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"notificationState", 0);
  [v3 setPredicate:v4];

  v5 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  v6 = [v5 firstObject];
  v7 = [v6 creationDate];

  return v7;
}

+ (id)nextPossibleNotificationDateWithPhotoLibrary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [a1 _memoryFetchOptionsWithPhotoLibrary:v4];
  [v6 setChunkSizeForFetch:100];
  objc_msgSend(v6, "setCacheSizeForFetch:", objc_msgSend(v6, "chunkSizeForFetch"));
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 401);
  [v6 setPredicate:v7];

  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      if ([v13 category] != 101) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v14 = [v13 creationDate];

    if (v14) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_9:
  }
  v14 = [v5 objectForKey:@"PGManagerNotificationUserDefaultsDateOfFirstTimeUsage"];
  if (!v14)
  {
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setObject:v14 forKey:@"PGManagerNotificationUserDefaultsDateOfFirstTimeUsage"];
  }
LABEL_13:
  v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v16 = [MEMORY[0x1E4F1C9C8] date];
  if ([v15 isDateInWeekend:v16])
  {
    v17 = +[PGLogging sharedLogging];
    long long v18 = [v17 loggingConnection];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "Memories Notification generated over the weekend, special time interval between notification applied.", buf, 2u);
    }

    double v19 = 259200.0;
  }
  else
  {
    double v19 = 518400.0;
  }
  long long v20 = [v5 objectForKey:@"PGManagerNotificationUserDefaultsRegularTimeIntervalBeforeNotifying"];
  long long v21 = v20;
  if (v20)
  {
    [v20 doubleValue];
    double v19 = v22;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    id v35 = v4;
    uint64_t v26 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        if ([*(id *)(*((void *)&v36 + 1) + 8 * i) notificationState] == 1)
        {
          v28 = [v5 objectForKey:@"PGManagerNotificationUserDefaultsExtendedTimeIntervalBeforeNotifying"];
          v29 = v28;
          if (v28)
          {
            [v28 doubleValue];
            double v19 = v30;
          }
          else
          {
            double v19 = 2592000.0;
          }
          v31 = +[PGLogging sharedLogging];
          v32 = [v31 loggingConnection];

          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "Extending notification time interval because one or more memories are still in the state PHMemoryNotificationStateRequested", buf, 2u);
          }

          goto LABEL_35;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v25) {
        continue;
      }
      break;
    }
LABEL_35:
    id v4 = v35;
  }

  v33 = [v14 dateByAddingTimeInterval:v19];

  return v33;
}

@end