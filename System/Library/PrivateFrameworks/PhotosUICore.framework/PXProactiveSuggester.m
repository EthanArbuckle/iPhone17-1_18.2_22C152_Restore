@interface PXProactiveSuggester
+ (id)_clientIDForTimelineSize:(unint64_t)a3;
+ (id)_proactiveSuggestionsFromTimelineEntries:(id)a3 withClient:(id)a4 forTimelineSize:(unint64_t)a5;
+ (id)proactiveCriterionForFeaturedPhoto:(id)a3;
+ (id)proactiveCriterionForMemory:(id)a3;
+ (unint64_t)_applicableLayoutForTimelineSize:(unint64_t)a3;
+ (void)updateProactiveSuggestionsFromTimelineEntries:(id)a3 forTimelineSize:(unint64_t)a4;
@end

@implementation PXProactiveSuggester

+ (unint64_t)_applicableLayoutForTimelineSize:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return qword_1AB35AA00[a3];
  }
}

+ (id)_clientIDForTimelineSize:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E5DB3568[a3];
  }
}

+ (id)_proactiveSuggestionsFromTimelineEntries:(id)a3 withClient:(id)a4 forTimelineSize:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = @"com.apple.mobileslideshow.PhotosReliveWidget";
    v12 = @"com.apple.mobileslideshow.PhotosReliveWidget";
    uint64_t v34 = [a1 _applicableLayoutForTimelineSize:a5];
    id v32 = v8;
    id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        uint64_t v16 = 0;
        uint64_t v36 = v14;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
          v18 = [v17 proactiveCriterion];
          if ([v18 length])
          {
            v19 = [v17 assetLocalIdentifier];
            v20 = [v17 startTime];
            v21 = [v17 endTime];
            if ([v19 length]) {
              BOOL v22 = v20 == 0;
            }
            else {
              BOOL v22 = 1;
            }
            if (v22 || v21 == 0)
            {
              v26 = PLMemoriesGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v17;
                _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "ProactiveSuggester - invalid timeline entry: %@", buf, 0xCu);
              }
            }
            else
            {
              v24 = NSString;
              [v21 timeIntervalSinceReferenceDate];
              v26 = [v24 stringWithFormat:@"%@_%.f", v19, v25];
              uint64_t v27 = [v35 createSuggestionWithAppBundleIdentifier:@"com.apple.mobileslideshow" widgetBundleIdentifier:@"com.apple.mobileslideshow.PhotosReliveWidget" widgetKind:@"com.apple.mobileslideshow.PhotosReliveWidget" criterion:v18 applicableLayouts:v34 suggestionIdentifier:v26 startDate:v20 endDate:v21 intent:0 metadata:0];
              v28 = (void *)v27;
              if (v27)
              {
                [v33 addObject:v27];
              }
              else
              {
                v29 = PLMemoriesGetLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v43 = v17;
                  _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_ERROR, "ProactiveSuggester - failed to create suggestion for entry: %@", buf, 0xCu);
                }
              }
              uint64_t v14 = v36;
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v14);
    }

    v30 = @"com.apple.mobileslideshow.PhotosReliveWidget";
    id v8 = v32;
  }
  else
  {
    v30 = PLMemoriesGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEBUG, "ProactiveSuggester: no timeline entries", buf, 2u);
    }
    id v33 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v33;
}

+ (void)updateProactiveSuggestionsFromTimelineEntries:(id)a3 forTimelineSize:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  PLTimelineGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, a1);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  uint64_t v10 = [a1 _clientIDForTimelineSize:a4];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v11 = (void *)getATXProactiveCardSuggestionClientClass_softClass;
  uint64_t v29 = getATXProactiveCardSuggestionClientClass_softClass;
  if (!getATXProactiveCardSuggestionClientClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getATXProactiveCardSuggestionClientClass_block_invoke;
    v31 = &unk_1E5DD2B08;
    id v32 = &v26;
    __getATXProactiveCardSuggestionClientClass_block_invoke((uint64_t)buf);
    v11 = (void *)v27[3];
  }
  v12 = v11;
  _Block_object_dispose(&v26, 8);
  uint64_t v13 = [[v12 alloc] initWithSourceId:v10];
  if (v13)
  {
    uint64_t v14 = [a1 _proactiveSuggestionsFromTimelineEntries:v6 withClient:v13 forTimelineSize:a4];
    uint64_t v15 = PLMemoriesGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "ProactiveSuggester: %lu suggestions for %@", buf, 0x16u);
    }

    if ([v14 count])
    {
      v17 = v24;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke_48;
      v24[3] = &unk_1E5DD3158;
      v24[4] = v10;
      [v13 updateSuggestions:v14 completionHandler:v24];
    }
    else
    {
      v17 = v25;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke;
      v25[3] = &unk_1E5DD3158;
      v25[4] = v10;
      [v13 clearSuggestionsWithCompletionHandler:v25];
    }

    PLTimelineGetLog();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, a1);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_INTERVAL_END, v23, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  else
  {
LABEL_12:
    v18 = PLMemoriesGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "ProactiveSuggester: client is nil for %tu", buf, 0xCu);
    }

    PLTimelineGetLog();
    uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v14, a1);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v20, "Proactive - UpdateProactiveSuggestionsForTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }
    uint64_t v13 = v14;
  }
}

void __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLMemoriesGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      os_signpost_id_t v9 = "ProactiveSuggester: cleared suggestions for %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    os_signpost_id_t v9 = "ProactiveSuggester - clearSuggestions for %@ error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

void __86__PXProactiveSuggester_updateProactiveSuggestionsFromTimelineEntries_forTimelineSize___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLMemoriesGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      os_signpost_id_t v9 = "ProactiveSuggester: updated suggestions for %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    os_signpost_id_t v9 = "ProactiveSuggester - updateSuggestions for %@ error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

+ (id)proactiveCriterionForFeaturedPhoto:(id)a3
{
  id v3 = a3;
  int v4 = [v3 type];
  int v5 = [v3 subtype];

  id v6 = @"PhotosContentFallback";
  if (v4 == 5) {
    id v6 = @"PhotosFeaturedPhotoOutstander";
  }
  if (v4 == 3) {
    id v6 = @"PhotosFeaturedPhotoRecentInterest";
  }
  if (v5 == 401) {
    return @"PhotosFeaturedPhotoOnThisDay";
  }
  else {
    return v6;
  }
}

+ (id)proactiveCriterionForMemory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 category];
  uint64_t v5 = [v3 subcategory];
  id v6 = (void *)MEMORY[0x1E4F39188];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  LODWORD(v6) = [v6 isMemory:v3 proactiveWorthyAtDate:v7];

  if (v6)
  {
    if (v5 == 210)
    {
      uint64_t v8 = @"PhotosMemoryBirthday";
    }
    else
    {
      if (v4 <= 201)
      {
        if (v4 == 23)
        {
          uint64_t v8 = @"PhotosMemoryDayInHistoryAggregation";
          goto LABEL_5;
        }
        if (v4 == 24)
        {
          uint64_t v8 = @"PhotosMemoryRecentHighlights";
          goto LABEL_5;
        }
      }
      else
      {
        switch(v4)
        {
          case 213:
            uint64_t v8 = @"PhotosMemoryHolidayInHistory";
            goto LABEL_5;
          case 212:
            uint64_t v8 = @"PhotosMemoryCelebratedHolidayInHistory";
            goto LABEL_5;
          case 202:
            uint64_t v8 = @"PhotosMemoryDayInHistory";
            goto LABEL_5;
        }
      }
      if ([v3 isMustSee])
      {
        uint64_t v8 = @"PhotosMemoryFeaturedMustSee";
      }
      else if ([v3 isStellar])
      {
        uint64_t v8 = @"PhotosMemoryFeaturedStellar";
      }
      else if ([v3 isGreat])
      {
        uint64_t v8 = @"PhotosMemoryFeaturedGreat";
      }
      else
      {
        uint64_t v8 = @"PhotosMemoryFeatured";
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_5:

  return v8;
}

@end