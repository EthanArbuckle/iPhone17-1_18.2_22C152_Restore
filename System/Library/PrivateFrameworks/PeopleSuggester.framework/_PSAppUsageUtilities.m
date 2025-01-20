@interface _PSAppUsageUtilities
+ (id)addBiomeDataToCache:(id)a3 event:(id)a4;
+ (id)appUsageDurations;
+ (id)boostAppsForSourceBundleId:(id)a3;
+ (id)mostUsedAppBundleIdsUsingPredicate:(id)a3 knowledgeStore:(id)a4;
+ (id)mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3 sourceBundleId:(id)a4 sharesFromSourceToTargetBundle:(id)a5 appUsageDurations:(id)a6;
+ (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4 knowledgeStore:(id)a5;
+ (id)shareExtensionsUsedAndInstalledDaysAgo:(int64_t)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4 knowledgeStore:(id)a5;
+ (id)sharesFromSourceToTargetBundleValues;
+ (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4;
+ (id)suggestionsFromAppBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4;
+ (id)suggestionsFromShareBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4;
+ (void)cacheAppUsageDurations:(id)a3;
+ (void)cacheSharesForEachApp;
@end

@implementation _PSAppUsageUtilities

+ (id)mostUsedAppBundleIdsUsingPredicate:(id)a3 knowledgeStore:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F5B518];
  v8 = [MEMORY[0x1E4F5B5F8] appUsageStream];
  v53[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v52 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v36 = v5;
  v12 = [v7 eventQueryWithPredicate:v5 eventStreams:v9 offset:0 limit:5000 sortDescriptors:v11];

  v13 = [NSString stringWithUTF8String:"_PSAppUsageUtilities.m"];
  v14 = objc_msgSend(v13, "stringByAppendingFormat:", @":%d", 39);
  [v12 setClientName:v14];

  [v12 setTracker:&__block_literal_global_22];
  [v12 setExecuteConcurrently:1];
  [v12 setResultType:5];
  [v12 setGroupByProperties:&unk_1EF676308];
  id v49 = 0;
  v34 = v12;
  v35 = v6;
  v15 = [v6 executeQuery:v12 error:&v49];
  id v33 = v49;
  v40 = v15;
  v16 = [v15 valueForKeyPath:@"@distinctUnionOfObjects.valueString"];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v16;
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v38 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueString == %@", v20];
        v22 = [v40 filteredArrayUsingPredicate:v21];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v42;
          double v26 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              v28 = [*(id *)(*((void *)&v41 + 1) + 8 * j) objectForKeyedSubscript:@"duration"];
              [v28 doubleValue];
              double v26 = v26 + v29;
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v24);
        }
        else
        {
          double v26 = 0.0;
        }
        v30 = [NSNumber numberWithDouble:v26];
        [v39 setObject:v30 forKey:v20];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v18);
  }

  v31 = [v39 keysSortedByValueUsingComparator:&__block_literal_global_33_0];

  return v31;
}

+ (id)shareExtensionsUsedAndInstalledDaysAgo:(int64_t)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4 knowledgeStore:(id)a5
{
  v104[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F5B5D0];
  v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a3)];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [v9 predicateForEventsWithStartInDateRangeFrom:v10 to:v11];

  v13 = (void *)MEMORY[0x1E4F5B5D0];
  v14 = [v7 allKeys];
  uint64_t v15 = [v13 predicateForEventsWithStringValueInValues:v14];

  v16 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v17 = (void *)MEMORY[0x1E4F28BA0];
  v70 = (void *)v15;
  v71 = (void *)v12;
  v104[0] = v12;
  v104[1] = v15;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
  v19 = [v17 andPredicateWithSubpredicates:v18];
  uint64_t v20 = [MEMORY[0x1E4F5B5F8] appInstallStream];
  v103 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v22 = [v16 eventQueryWithPredicate:v19 eventStreams:v21 offset:0 limit:8 sortDescriptors:0];

  uint64_t v23 = [NSString stringWithUTF8String:"_PSAppUsageUtilities.m"];
  uint64_t v24 = objc_msgSend(v23, "stringByAppendingFormat:", @":%d", 83);
  [v22 setClientName:v24];

  [v22 setTracker:&__block_literal_global_38];
  [v22 setExecuteConcurrently:1];
  id v96 = 0;
  v77 = v8;
  v69 = v22;
  uint64_t v25 = [v8 executeQuery:v22 error:&v96];
  id v68 = v96;
  double v26 = [MEMORY[0x1E4F1CA80] set];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v25;
  uint64_t v27 = [obj countByEnumeratingWithState:&v92 objects:v102 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v93 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = [*(id *)(*((void *)&v92 + 1) + 8 * i) value];
        v32 = [v31 stringValue];

        if (v32)
        {
          id v33 = [v7 objectForKey:v32];

          if (v33) {
            [v26 addObject:v32];
          }
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v92 objects:v102 count:16];
    }
    while (v28);
  }

  if ([v26 count] && (unint64_t)objc_msgSend(v26, "count") <= 2)
  {
    v35 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
    v101 = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];

    v37 = (void *)MEMORY[0x1E4F5B518];
    uint64_t v38 = [MEMORY[0x1E4F5B5F8] appUsageStream];
    v100 = v38;
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    v66 = (void *)v36;
    v40 = [v37 eventQueryWithPredicate:0 eventStreams:v39 offset:0 limit:1 sortDescriptors:v36];

    long long v41 = [NSString stringWithUTF8String:"_PSAppUsageUtilities.m"];
    long long v42 = objc_msgSend(v41, "stringByAppendingFormat:", @":%d", 112);
    [v40 setClientName:v42];

    [v40 setTracker:&__block_literal_global_41];
    [v40 setExecuteConcurrently:1];
    v76 = v40;
    [v40 setResultType:2];
    v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v26, "count"));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v74 = v26;
    uint64_t v43 = [v74 countByEnumeratingWithState:&v88 objects:v99 count:16];
    v67 = v26;
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v89;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v89 != v45) {
            objc_enumerationMutation(v74);
          }
          uint64_t v47 = *(void *)(*((void *)&v88 + 1) + 8 * j);
          long long v48 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:v47];
          [v76 setPredicate:v48];
          id v87 = 0;
          id v49 = [v77 executeQuery:v76 error:&v87];
          id v50 = v87;
          v51 = [v49 firstObject];
          v52 = v51;
          if (v51)
          {
            v53 = [v51 startDate];
            [v73 setObject:v53 forKeyedSubscript:v47];
          }
        }
        uint64_t v44 = [v74 countByEnumeratingWithState:&v88 objects:v99 count:16];
      }
      while (v44);
    }

    v54 = [v73 keysSortedByValueUsingComparator:&__block_literal_global_43];
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v72 = v54;
    uint64_t v55 = [v72 countByEnumeratingWithState:&v83 objects:v98 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      id v75 = *(id *)v84;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(id *)v84 != v75) {
            objc_enumerationMutation(v72);
          }
          id v58 = v7;
          v59 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v83 + 1) + 8 * k)];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          uint64_t v60 = [v59 countByEnumeratingWithState:&v79 objects:v97 count:16];
          if (v60)
          {
            uint64_t v61 = v60;
            uint64_t v62 = *(void *)v80;
            do
            {
              for (uint64_t m = 0; m != v61; ++m)
              {
                if (*(void *)v80 != v62) {
                  objc_enumerationMutation(v59);
                }
                v64 = [[_PSSuggestion alloc] initWithBundleID:*(void *)(*((void *)&v79 + 1) + 8 * m) conversationIdentifier:0 groupName:0 recipients:0];
                if (v64) {
                  [v34 addObject:v64];
                }
              }
              uint64_t v61 = [v59 countByEnumeratingWithState:&v79 objects:v97 count:16];
            }
            while (v61);
          }

          id v7 = v58;
        }
        uint64_t v56 = [v72 countByEnumeratingWithState:&v83 objects:v98 count:16];
      }
      while (v56);
    }

    double v26 = v67;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v34;
}

+ (id)suggestionsFromAppBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      uint64_t v23 = v9;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * v11)];
        v13 = v12;
        if (v12 && [v12 count])
        {
          id v14 = v6;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = [[_PSSuggestion alloc] initWithBundleID:*(void *)(*((void *)&v25 + 1) + 8 * i) conversationIdentifier:0 groupName:0 recipients:0];
                if (v20) {
                  [v7 addObject:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v17);
          }

          id v6 = v14;
          uint64_t v10 = v22;
          uint64_t v9 = v23;
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)suggestionsFromShareBundleIds:(id)a3 appBundleIdsToShareExtensionBundleIdsMapping:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v8, "containsObject:", v20, (void)v23))
        {
          v21 = [[_PSSuggestion alloc] initWithBundleID:v20 conversationIdentifier:0 groupName:0 recipients:0];
          if (v21) {
            [v7 addObject:v21];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  return v7;
}

+ (id)boostAppsForSourceBundleId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1A6243860]();
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = +[_PSConstants mobilePhotosBundleId];
  id v7 = +[_PSConstants appleNewsBundleId];
  uint64_t v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  LODWORD(v6) = [v8 containsObject:v3];
  id v9 = +[_PSLogging heuristicsChannel];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Rank default (Journal > Reminders) apps for source bundleId: %@", buf, 0xCu);
    }

    uint64_t v11 = +[_PSConstants notesBundleId];
    v20[0] = v11;
    uint64_t v12 = +[_PSConstants journalBundleId];
    v20[1] = v12;
    v13 = +[_PSConstants remindersBundleId];
    v20[2] = v13;
    id v14 = +[_PSConstants freeformBundleId];
    v20[3] = v14;
    id v15 = +[_PSConstants booksBundleId];
    v20[4] = v15;
    uint64_t v16 = v20;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Rank default (Reminders > Journal) apps for source bundleId: %@", buf, 0xCu);
    }

    uint64_t v11 = +[_PSConstants notesBundleId];
    v19[0] = v11;
    uint64_t v12 = +[_PSConstants remindersBundleId];
    v19[1] = v12;
    v13 = +[_PSConstants journalBundleId];
    v19[2] = v13;
    id v14 = +[_PSConstants booksBundleId];
    v19[3] = v14;
    id v15 = +[_PSConstants freeformBundleId];
    v19[4] = v15;
    uint64_t v16 = v19;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];

  return v17;
}

+ (id)mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3 sourceBundleId:(id)a4 sharesFromSourceToTargetBundle:(id)a5 appUsageDurations:(id)a6
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 objectForKeyedSubscript:v11];

  if (v14)
  {
    id v15 = [v12 objectForKeyedSubscript:v11];
    uint64_t v16 = [v15 keysSortedByValueUsingComparator:&__block_literal_global_50];
    uint64_t v17 = [a1 suggestionsFromShareBundleIds:v16 appBundleIdsToShareExtensionBundleIdsMapping:v10];

    if (v13)
    {
LABEL_3:
      id v36 = v12;
      uint64_t v18 = [v13 keysSortedByValueUsingComparator:&__block_literal_global_53];
      uint64_t v19 = [a1 suggestionsFromAppBundleIds:v18 appBundleIdsToShareExtensionBundleIdsMapping:v10];
      uint64_t v33 = [a1 boostAppsForSourceBundleId:v11];
      id v37 = v10;
      uint64_t v20 = objc_msgSend(a1, "suggestionsFromAppBundleIds:appBundleIdsToShareExtensionBundleIdsMapping:");
      v34 = (void *)v19;
      uint64_t v35 = v17;
      v45[0] = v17;
      v45[1] = v20;
      long long v32 = (void *)v20;
      v45[2] = v19;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        long long v25 = (void *)MEMORY[0x1E4F1CBF0];
        do
        {
          uint64_t v26 = 0;
          long long v27 = v25;
          do
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v25 = [a1 suggestionArrayWithArray:v27 appendingUniqueElementsByBundleIdFromArray:*(void *)(*((void *)&v38 + 1) + 8 * v26)];

            ++v26;
            long long v27 = v25;
          }
          while (v23 != v26);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v23);
      }
      else
      {
        long long v25 = (void *)MEMORY[0x1E4F1CBF0];
      }

      long long v29 = +[_PSLogging heuristicsChannel];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        long long v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v30;
        _os_log_impl(&dword_1A314B000, v29, OS_LOG_TYPE_INFO, "Returning %@ share extension suggestions based on sharing app usage and most shared apps", buf, 0xCu);
      }
      id v12 = v36;
      id v10 = v37;
      uint64_t v17 = v35;
      goto LABEL_21;
    }
  }
  else
  {
    long long v28 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "No value for app shares found, returning no share extension suggestions based on app share values.", buf, 2u);
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "No value for app usage durations found, returning no share extension suggestions based on app usage.", buf, 2u);
  }
  long long v25 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v25;
}

+ (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4 knowledgeStore:(id)a5
{
  v84[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (v7 && [v7 count])
  {
    id v9 = (void *)MEMORY[0x1E4F5B5D0];
    id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a4)];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = [v9 predicateForEventsWithStartInDateRangeFrom:v10 to:v11];

    id v60 = v7;
    uint64_t v13 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValueInValues:v7];
    id v14 = (void *)MEMORY[0x1E4F28BA0];
    v57 = (void *)v13;
    id v58 = (void *)v12;
    v84[0] = v12;
    v84[1] = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
    uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];

    uint64_t v17 = (void *)MEMORY[0x1E4F5B518];
    uint64_t v18 = [MEMORY[0x1E4F5B5F8] appUsageStream];
    long long v83 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    uint64_t v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    long long v82 = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
    uint64_t v56 = (void *)v16;
    uint64_t v22 = [v17 eventQueryWithPredicate:v16 eventStreams:v19 offset:0 limit:5000 sortDescriptors:v21];

    uint64_t v23 = [NSString stringWithUTF8String:"_PSAppUsageUtilities.m"];
    uint64_t v24 = objc_msgSend(v23, "stringByAppendingFormat:", @":%d", 287);
    [v22 setClientName:v24];

    [v22 setTracker:&__block_literal_global_55];
    [v22 setResultType:5];
    [v22 setGroupByProperties:&unk_1EF676320];
    [v22 setExecuteConcurrently:1];
    id v78 = 0;
    id v59 = v8;
    uint64_t v55 = v22;
    long long v25 = [v8 executeQuery:v22 error:&v78];
    id v54 = v78;
    v64 = v25;
    uint64_t v26 = [v25 valueForKeyPath:@"@distinctUnionOfObjects.valueString"];
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = v26;
    unint64_t v27 = 0x1E4F28000uLL;
    uint64_t v65 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v65)
    {
      uint64_t v62 = *(void *)v75;
      double v28 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v75 != v62) {
            objc_enumerationMutation(obj);
          }
          unint64_t v30 = v27;
          uint64_t v31 = *(void *)(*((void *)&v74 + 1) + 8 * i);
          long long v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueString == %@", v31];
          uint64_t v33 = [v64 filteredArrayUsingPredicate:v32];
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v71;
            double v37 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v71 != v36) {
                  objc_enumerationMutation(v33);
                }
                long long v39 = [*(id *)(*((void *)&v70 + 1) + 8 * j) objectForKeyedSubscript:@"duration"];
                [v39 doubleValue];
                double v37 = v37 + v40;
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v70 objects:v80 count:16];
            }
            while (v35);
          }
          else
          {
            double v37 = 0.0;
          }
          double v28 = v28 + v37;
          unint64_t v27 = v30;
          long long v41 = [*(id *)(v30 + 3792) numberWithDouble:v37];
          [v63 setObject:v41 forKey:v31];
        }
        uint64_t v65 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v65);
    }
    else
    {
      double v28 = 0.0;
    }

    long long v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v43 = v63;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v67;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v67 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = *(void *)(*((void *)&v66 + 1) + 8 * k);
          id v49 = *(void **)(v27 + 3792);
          id v50 = [v43 objectForKeyedSubscript:v48];
          [v50 doubleValue];
          v52 = [v49 numberWithDouble:v51 / v28];
          [v42 setObject:v52 forKeyedSubscript:v48];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v79 count:16];
      }
      while (v45);
    }

    id v8 = v59;
    id v7 = v60;
  }
  else
  {
    long long v42 = 0;
  }

  return v42;
}

+ (id)sharesFromSourceToTargetBundleValues
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  id v3 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/appShares/value"];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (id)appUsageDurations
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  id v3 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/appUsage/durations"];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

+ (void)cacheAppUsageDurations:(id)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/appUsage/durations"];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v3 lastModifiedDateForContextualKeyPath:v4];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  [v5 timeIntervalSinceDate:v6];
  if (v7 <= 0.0 || v7 >= 72000.0)
  {
    long long v41 = v6;
    long long v42 = v5;
    id v43 = v4;
    uint64_t v44 = v3;
    double v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v11 = 0x1E4F5B000uLL;
    do
    {
      uint64_t v49 = MEMORY[0x1A6243860]();
      uint64_t v12 = (void *)MEMORY[0x1E4F5B518];
      uint64_t v13 = [*(id *)(v11 + 1528) appUsageStream];
      v68[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
      id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
      long long v67 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      uint64_t v17 = [v12 eventQueryWithPredicate:0 eventStreams:v14 offset:v9 limit:500 sortDescriptors:v16];

      uint64_t v18 = [NSString stringWithUTF8String:"_PSAppUsageUtilities.m"];
      uint64_t v19 = objc_msgSend(v18, "stringByAppendingFormat:", @":%d", 379);
      [v17 setClientName:v19];

      [v17 setTracker:&__block_literal_global_68];
      [v17 setResultType:5];
      [v17 setGroupByProperties:&unk_1EF676338];
      [v17 setExecuteConcurrently:1];
      id v62 = 0;
      uint64_t v20 = [v48 executeQuery:v17 error:&v62];
      id v21 = v62;
      if (v21)
      {
        obuint64_t j = +[_PSLogging generalChannel];
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v66 = (uint64_t)v21;
          _os_log_error_impl(&dword_1A314B000, obj, OS_LOG_TYPE_ERROR, "_PSAppUsageUtilities: Error fetching app usage %@", buf, 0xCu);
        }
        uint64_t v22 = (void *)v49;
      }
      else
      {
        uint64_t v45 = v17;
        uint64_t v47 = v9;
        uint64_t v46 = [v20 count];
        uint64_t v23 = [v20 valueForKeyPath:@"@distinctUnionOfObjects.valueString"];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        obuint64_t j = v23;
        uint64_t v53 = [v23 countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (v53)
        {
          uint64_t v52 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v59 != v52) {
                objc_enumerationMutation(obj);
              }
              uint64_t v25 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"valueString == %@", v25];
              unint64_t v27 = v20;
              double v28 = [v20 filteredArrayUsingPredicate:v26];
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v55;
                double v32 = 0.0;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v55 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v34 = [*(id *)(*((void *)&v54 + 1) + 8 * j) objectForKeyedSubscript:@"duration"];
                    [v34 doubleValue];
                    double v32 = v32 + v35;
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
                }
                while (v30);
              }
              else
              {
                double v32 = 0.0;
              }
              uint64_t v36 = [NSNumber numberWithDouble:v32];
              [v51 setObject:v36 forKey:v25];

              uint64_t v20 = v27;
            }
            uint64_t v53 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
          }
          while (v53);
        }
        uint64_t v10 = v46;
        uint64_t v9 = v47 + 500;
        unint64_t v11 = 0x1E4F5B000;
        uint64_t v22 = (void *)v49;
        id v21 = 0;
        uint64_t v17 = v45;
      }

      if (v21) {
        break;
      }
      BOOL v37 = v10 == 500;
      uint64_t v10 = 500;
    }
    while (v37);
    long long v38 = +[_PSLogging heuristicsChannel];
    id v8 = v51;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v51 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v66 = v39;
      _os_log_impl(&dword_1A314B000, v38, OS_LOG_TYPE_DEFAULT, "Caching sharing app usage durations for %tu apps", buf, 0xCu);
    }

    id v40 = [v51 copy];
    v4 = v43;
    id v3 = v44;
    [v44 setObject:v40 forKeyedSubscript:v43];

    id v6 = v41;
    id v5 = v42;
  }
  else
  {
    id v8 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "Sharing app usage is still fresh, skipping refresh.", buf, 2u);
    }
  }
}

+ (id)addBiomeDataToCache:(id)a3 event:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 eventBody];
  id v8 = [v7 sourceBundleID];

  if (v8)
  {
    uint64_t v9 = [v6 eventBody];
    uint64_t v10 = [v9 targetBundleID];

    if (v10)
    {
      [v6 timestamp];
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [v11 timeIntervalSinceNow];
      double v13 = v12 / -86400.0;
      id v14 = (void *)[v5 mutableCopy];
      id v15 = v14;
      if (v13 <= 32.0) {
        double v16 = v13 * 0.03125;
      }
      else {
        double v16 = 1.0;
      }
      uint64_t v17 = [v14 objectForKeyedSubscript:v8];

      if (v17)
      {
        uint64_t v18 = [v5 objectForKeyedSubscript:v8];
        uint64_t v19 = (void *)[v18 mutableCopy];
        [v15 setObject:v19 forKeyedSubscript:v8];
      }
      else
      {
        uint64_t v18 = objc_opt_new();
        [v15 setObject:v18 forKeyedSubscript:v8];
      }

      uint64_t v22 = [v15 objectForKeyedSubscript:v8];
      uint64_t v23 = [v22 objectForKeyedSubscript:v10];

      if (v23)
      {
        uint64_t v24 = [v15 objectForKeyedSubscript:v8];
        uint64_t v25 = [v24 objectForKeyedSubscript:v10];

        [v25 doubleValue];
        unint64_t v27 = [NSNumber numberWithDouble:v16 * -0.5 + 1.0 + v26];
        double v28 = [v15 objectForKeyedSubscript:v8];
        [v28 setObject:v27 forKeyedSubscript:v10];
      }
      else
      {
        uint64_t v25 = [NSNumber numberWithDouble:v16 * -0.5 + 1.0];
        unint64_t v27 = [v15 objectForKeyedSubscript:v8];
        [v27 setObject:v25 forKeyedSubscript:v10];
      }
    }
    else
    {
      id v21 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[_PSAppUsageUtilities addBiomeDataToCache:event:](v6);
      }

      id v15 = v5;
    }
  }
  else
  {
    uint64_t v20 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[_PSAppUsageUtilities addBiomeDataToCache:event:](v6);
    }

    id v15 = v5;
  }

  return v15;
}

+ (void)cacheSharesForEachApp
{
  id v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "Caching share extension counts for each share extension", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F5B6A8] userContext];
  uint64_t v5 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/appShares/value"];
  *(void *)buf = 0;
  uint64_t v33 = buf;
  uint64_t v34 = 0x3032000000;
  double v35 = __Block_byref_object_copy__8;
  uint64_t v36 = __Block_byref_object_dispose__8;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = BiomeLibrary();
  double v7 = [v6 ShareSheet];
  id v8 = [v7 Feedback];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v9 setMonth:-1];
  uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v12 = [v10 dateByAddingComponents:v9 toDate:v11 options:0];
  uint64_t v29 = v10;
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v11 endDate:v12 maxEvents:-1 lastN:0 reversed:1];
  id v14 = [v8 publisherWithOptions:v13];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_78;
  v31[3] = &unk_1E5AE0420;
  v31[4] = buf;
  v31[5] = a1;
  id v15 = (id)[v14 sinkWithCompletion:&__block_literal_global_77 receiveInput:v31];

  [v4 setObject:*((void *)v33 + 5) forKeyedSubscript:v5];
  unint64_t v27 = (void *)v12;
  double v28 = v8;
  double v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.coreduetd.shareSheetFeedback.biomeQueue", v16);

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.coreduetd.ShareSheetFeedBackSubscription" targetQueue:v17];
  uint64_t v19 = (void *)v5;
  double v26 = v4;
  uint64_t v20 = BiomeLibrary();
  id v21 = [v20 ShareSheet];
  uint64_t v22 = [v21 Feedback];

  uint64_t v23 = [v22 DSLPublisher];
  uint64_t v24 = [v23 subscribeOn:v18];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __45___PSAppUsageUtilities_cacheSharesForEachApp__block_invoke_88;
  v30[3] = &__block_descriptor_40_e22_v16__0__BMStoreEvent_8l;
  v30[4] = a1;
  uint64_t v25 = [v24 sinkWithCompletion:&__block_literal_global_87 receiveInput:v30];

  _Block_object_dispose(buf, 8);
}

+ (id)suggestionArrayWithArray:(id)a3 appendingUniqueElementsByBundleIdFromArray:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 arrayByAddingObjectsFromArray:a4];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "bundleID", (void)v17);
        char v14 = [v6 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          [v5 addObject:v12];
          id v15 = [v12 bundleID];
          [v6 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v5;
}

+ (void)addBiomeDataToCache:(void *)a1 event:.cold.1(void *a1)
{
  v1 = [a1 eventBody];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v2, v3, "Event was missing sourceBundleID: %{private}@", v4, v5, v6, v7, v8);
}

+ (void)addBiomeDataToCache:(void *)a1 event:.cold.2(void *a1)
{
  v1 = [a1 eventBody];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v2, v3, "Event was missing targetBundleID: %{private}@", v4, v5, v6, v7, v8);
}

@end