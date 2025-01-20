@interface PXWidgetTimeline
+ (BOOL)_requesWidgetTimelineReloadForWidgetKind:(id)a3 withError:(id *)a4;
+ (BOOL)requestAlbumWidgetTimelineReloadWithError:(id *)a3;
+ (BOOL)requestForYouWidgetTimelineReloadWithError:(id *)a3;
+ (id)timelineFromLibrary:(id)a3;
+ (id)timelineFromLibrary:(id)a3 albumIdentifier:(id)a4 widgetIdentifier:(id)a5 widgetSize:(CGSize)a6;
+ (id)timelineFromLibrary:(id)a3 forWidgetSize:(CGSize)a4 timelineSize:(unint64_t)a5;
+ (id)timelineFromLibrary:(id)a3 timelineSize:(unint64_t)a4 withOptions:(id)a5;
+ (void)requestReloadForAllWidgetTimelines;
@end

@implementation PXWidgetTimeline

+ (BOOL)_requesWidgetTimelineReloadForWidgetKind:(id)a3 withError:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLMemoriesGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Calling reloadTimeline on CHSTimelineController for widget kind %@", (uint8_t *)&v12, 0xCu);
  }

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F58DA0]) initWithExtensionBundleIdentifier:@"com.apple.mobileslideshow.PhotosReliveWidget" kind:v5];
  v8 = [v7 reloadTimelineWithReason:@"RequestedByPhotosUI"];
  v9 = PLMemoriesGetLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "CHSTimelineController reloadTimeline error: %@ for widget kind %@", (uint8_t *)&v12, 0x16u);
    }

    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "CHSTimelineController reloadTimeline completed for widget kind %@", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8 == 0;
}

+ (void)requestReloadForAllWidgetTimelines
{
  [a1 requestForYouWidgetTimelineReloadWithError:0];
  [a1 requestAlbumWidgetTimelineReloadWithError:0];
}

+ (BOOL)requestAlbumWidgetTimelineReloadWithError:(id *)a3
{
  PLTimelineGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestAlbumWidgetTimelineReload", " enableTelemetry=YES ", v9, 2u);
    }
  }

  return [a1 _requesWidgetTimelineReloadForWidgetKind:@"com.apple.mobileslideshow.PhotosReliveWidget.collections" withError:a3];
}

+ (BOOL)requestForYouWidgetTimelineReloadWithError:(id *)a3
{
  PLTimelineGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestYouWidgetTimelineReload", " enableTelemetry=YES ", v9, 2u);
    }
  }

  return [a1 _requesWidgetTimelineReloadForWidgetKind:@"com.apple.mobileslideshow.PhotosReliveWidget" withError:a3];
}

+ (id)timelineFromLibrary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v20 = [[PXTimelineDataSourceOptions alloc] initWithMemoriesOnly];
  v21 = v3;
  v19 = [[PXTimelineDataSource alloc] initWithPhotoLibrary:v3 options:v20];
  v4 = [[PXTimelineScheduler alloc] initWithTimelineDataSource:v19];
  id v5 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    os_signpost_id_t v6 = +[PXMemoriesRelatedSettings sharedInstance];
    uint64_t v7 = [v6 timelineSchedulerMode];

    uint64_t v8 = +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:v7];

    v9 = PLMemoriesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", buf, 0xCu);
    }

    id v5 = (PXTimelineSchedulerOptions *)v8;
  }
  v10 = -[PXTimelineScheduler scheduledTimelineEntriesWithOptions:](v4, "scheduledTimelineEntriesWithOptions:", v5, v4);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = PLMemoriesGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v28 = v15;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEBUG, "Timeline Entry: %@", buf, 0xCu);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v10;
}

+ (id)timelineFromLibrary:(id)a3 albumIdentifier:(id)a4 widgetIdentifier:(id)a5 widgetSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (!v11) {
    id v11 = v10;
  }
  id v12 = a3;
  uint64_t v13 = -[PXTimelineDataSource initWithAlbumLocalIdentifier:widgetIdentifier:widgetSize:photoLibrary:]([PXTimelineDataSource alloc], "initWithAlbumLocalIdentifier:widgetIdentifier:widgetSize:photoLibrary:", v10, v11, v12, width, height);

  __int16 v14 = [[PXTimelineScheduler alloc] initWithTimelineDataSource:v13];
  uint64_t v15 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    uint64_t v16 = +[PXMemoriesRelatedSettings sharedInstance];
    uint64_t v17 = [v16 timelineSchedulerMode];

    uint64_t v18 = +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:v17];

    v19 = PLMemoriesGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134217984;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v15 = (PXTimelineSchedulerOptions *)v18;
  }
  v20 = [(PXTimelineScheduler *)v14 scheduledTimelineEntriesWithOptions:v15];

  return v20;
}

+ (id)timelineFromLibrary:(id)a3 timelineSize:(unint64_t)a4 withOptions:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  PLTimelineGetLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, a1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GenerateTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  __int16 v14 = +[PXTimelineSize sizeDescriptionForSizeClass:a4];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:a4];
  [v15 addObject:v16];

  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  id v18 = objc_alloc_init(MEMORY[0x1E4F58DF0]);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __65__PXWidgetTimeline_timelineFromLibrary_timelineSize_withOptions___block_invoke;
  v53[3] = &unk_1E5DAF5C0;
  id v46 = v14;
  id v54 = v46;
  id v48 = v15;
  id v55 = v48;
  SEL v57 = a2;
  id v58 = a1;
  dispatch_group_t group = v17;
  dispatch_group_t v56 = group;
  v42 = v18;
  [v18 allConfiguredWidgetsWithCompletion:v53];
  v41 = [[PXTimelineDataSource alloc] initWithPhotoLibrary:v9 options:v10];
  v19 = [[PXTimelineScheduler alloc] initWithTimelineDataSource:v41];
  v20 = objc_alloc_init(PXTimelineSchedulerOptions);
  if (PFOSVariantHasInternalUI())
  {
    v21 = +[PXMemoriesRelatedSettings sharedInstance];
    uint64_t v22 = [v21 timelineSchedulerMode];

    uint64_t v23 = +[PXMemoriesRelatedSettings schedulerOptionsFromTimelineSchedulerMode:v22];

    uint64_t v24 = PLMemoriesGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v61 = v22;
      _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "Timeline scheduler mode: %lu", buf, 0xCu);
    }

    v20 = (PXTimelineSchedulerOptions *)v23;
  }
  id ptr = a1;
  dispatch_time_t v25 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(group, v25))
  {
    v26 = PLMemoriesGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v61 = (uint64_t)v46;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "WidgetTimeline %@ - failed to get all CHS configurations due to timeout!", buf, 0xCu);
    }
  }
  v44 = v10;
  v45 = v9;
  [(PXTimelineSchedulerOptions *)v20 updateOptionsForTimelineSize:a4 withTimelineSizes:v48];
  v27 = PLMemoriesGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [(PXTimelineSchedulerOptions *)v20 timelineIndex];
    uint64_t v29 = [(PXTimelineSchedulerOptions *)v20 numberOfTimelines];
    *(_DWORD *)buf = 138412802;
    uint64_t v61 = (uint64_t)v46;
    __int16 v62 = 2048;
    uint64_t v63 = v28;
    __int16 v64 = 2048;
    uint64_t v65 = v29;
    _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_DEFAULT, "WidgetTimeline %@ - index: %zd, timelines: %zd", buf, 0x20u);
  }

  v30 = [(PXTimelineScheduler *)v19 scheduledTimelineEntriesWithOptions:v20];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        v36 = PLMemoriesGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v61 = v35;
          _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEBUG, "Timeline Entry: %@", buf, 0xCu);
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v32);
  }
  +[PXProactiveSuggester updateProactiveSuggestionsFromTimelineEntries:v30 forTimelineSize:a4];
  PLTimelineGetLog();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v38 = os_signpost_id_make_with_pointer(v37, ptr);
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v39 = v38;
    if (os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v37, OS_SIGNPOST_INTERVAL_END, v39, "GenerateTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v30;
}

void __65__PXWidgetTimeline_timelineFromLibrary_timelineSize_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PLMemoriesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v38 = v8;
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "WidgetTimeline %@ - failed to get all CHS configuration: %@", buf, 0x16u);
    }
  }
  uint64_t v22 = v6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        id v10 = [*(id *)(*((void *)&v31 + 1) + 8 * v9) widgetConfigurationsForApplicationContainerBundleIdentifier:@"com.apple.mobileslideshow"];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
              uint64_t v16 = [v15 widget];
              uint64_t v17 = PLMemoriesGetLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                id v18 = [v15 uniqueIdentifier];
                *(_DWORD *)buf = 138412546;
                os_signpost_id_t v38 = v18;
                __int16 v39 = 2112;
                id v40 = v16;
                _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEBUG, "Widget reference uniqueIdentifier: %@, widget: %@", buf, 0x16u);
              }
              switch([v16 family])
              {
                case 1:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1F02D5920;
                  break;
                case 2:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1F02D5938;
                  break;
                case 3:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1F02D5950;
                  break;
                case 4:
                  v19 = *(void **)(a1 + 40);
                  v20 = &unk_1F02D5968;
                  break;
                default:
                  PXAssertGetLog();
              }
              [v19 addObject:v20];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v21 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            uint64_t v12 = v21;
          }
          while (v21);
        }

        uint64_t v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (id)timelineFromLibrary:(id)a3 forWidgetSize:(CGSize)a4 timelineSize:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = -[PXTimelineDataSourceOptions initForWidgetWithSize:]([PXTimelineDataSourceOptions alloc], "initForWidgetWithSize:", width, height);
  uint64_t v11 = [a1 timelineFromLibrary:v9 timelineSize:a5 withOptions:v10];

  return v11;
}

@end