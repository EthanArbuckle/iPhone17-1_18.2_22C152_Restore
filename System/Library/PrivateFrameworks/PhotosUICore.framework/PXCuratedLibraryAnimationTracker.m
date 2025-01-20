@interface PXCuratedLibraryAnimationTracker
+ (PXCuratedLibraryAnimationTracker)sharedTracker;
+ (void)_scrollAnimationOccurredWithContext:(id)a3 isBegin:(BOOL)a4;
+ (void)scrollAnimationDidBeginWithScrollContext:(id)a3;
+ (void)scrollAnimationDidEndWithScrollContext:(id)a3;
- (NSMutableSet)inFlightAnimations;
- (PXCuratedLibraryAnimationTracker)init;
- (void)_zoomLevelTransitionOccurred:(id)a3 isPreparation:(BOOL)a4 isBegin:(BOOL)a5;
- (void)zoomLevelTransitionDidBegin:(id)a3;
- (void)zoomLevelTransitionDidEnd:(id)a3;
- (void)zoomLevelTransitionPreparationDidBegin:(id)a3;
- (void)zoomLevelTransitionsDidEndEarly;
@end

@implementation PXCuratedLibraryAnimationTracker

- (void).cxx_destruct
{
}

- (NSMutableSet)inFlightAnimations
{
  return self->_inFlightAnimations;
}

- (void)zoomLevelTransitionsDidEndEarly
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCuratedLibraryAnimationTracker *)self inFlightAnimations];
  v4 = (void *)[v3 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PXCuratedLibraryAnimationTracker _zoomLevelTransitionOccurred:isPreparation:isBegin:](self, "_zoomLevelTransitionOccurred:isPreparation:isBegin:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), 0, 0, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_zoomLevelTransitionOccurred:(id)a3 isPreparation:(BOOL)a4 isBegin:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = operator||(v8, @"PXCuratedLibraryZoomLevelChangeFromKey");
  uint64_t v10 = operator||(v8, @"PXCuratedLibraryZoomLevelChangeToKey");
  long long v11 = [(PXCuratedLibraryAnimationTracker *)self inFlightAnimations];
  long long v12 = v11;
  if (v9 | v10)
  {
    if (v5) {
      [v11 addObject:v8];
    }
    if ([v12 containsObject:v8])
    {
      switch(v9)
      {
        case 1:
          switch(v10)
          {
            case 1:
              long long v13 = PLAnimationTelemetryGetLog();
              v14 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              long long v13 = PLAnimationTelemetryGetLog();
              v31 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v31, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              long long v13 = PLAnimationTelemetryGetLog();
              v21 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v21, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              long long v13 = PLAnimationTelemetryGetLog();
              v22 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v22, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "YearsToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "YearsToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 2:
          switch(v10)
          {
            case 1:
              long long v13 = PLAnimationTelemetryGetLog();
              v18 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v18, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              long long v13 = PLAnimationTelemetryGetLog();
              v32 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v32, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              long long v13 = PLAnimationTelemetryGetLog();
              v23 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v23, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              long long v13 = PLAnimationTelemetryGetLog();
              v24 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v24, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "MonthsToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "MonthsToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 3:
          switch(v10)
          {
            case 1:
              long long v13 = PLAnimationTelemetryGetLog();
              v19 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v19, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              long long v13 = PLAnimationTelemetryGetLog();
              v25 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v25, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              long long v13 = PLAnimationTelemetryGetLog();
              v26 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v26, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              long long v13 = PLAnimationTelemetryGetLog();
              v27 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v27, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToAllPhotosPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "DaysToAllPhotos";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "DaysToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              break;
            default:
              goto LABEL_30;
          }
          goto LABEL_255;
        case 4:
          switch(v10)
          {
            case 1:
              long long v13 = PLAnimationTelemetryGetLog();
              v20 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v20, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToYearsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToYearsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToYears";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToYears";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 2:
              long long v13 = PLAnimationTelemetryGetLog();
              v28 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v28, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToMonthsPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToMonthsPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToMonths";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToMonths";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 3:
              long long v13 = PLAnimationTelemetryGetLog();
              v29 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v29, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToDaysPreparation";
                    v17 = " enableTelemetry=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToDaysPreparation";
                  v34 = " enableTelemetry=YES ";
                  goto LABEL_254;
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                  {
                    *(_WORD *)v35 = 0;
                    v16 = "AllPhotosToDays";
                    v17 = " enableTelemetry=YES  isAnimation=YES ";
                    goto LABEL_156;
                  }
                  goto LABEL_157;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToDays";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
              goto LABEL_255;
            case 4:
              long long v13 = PLAnimationTelemetryGetLog();
              v30 = PLAnimationTelemetryGetLog();
              os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v30, v8);

              if (v6)
              {
                if (v5)
                {
                  if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
                    goto LABEL_157;
                  }
                  *(_WORD *)v35 = 0;
                  v16 = "AllPhotosToAllPhotosPreparation";
                  v17 = " enableTelemetry=YES ";
LABEL_156:
                  _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, v16, v17, v35, 2u);
LABEL_157:

                  goto LABEL_257;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToAllPhotosPreparation";
                  v34 = " enableTelemetry=YES ";
LABEL_254:
                  _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_END, v15, v33, v34, v35, 2u);
                }
              }
              else
              {
                if (v5)
                {
                  if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
                    goto LABEL_157;
                  }
                  *(_WORD *)v35 = 0;
                  v16 = "AllPhotosToAllPhotos";
                  v17 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_156;
                }
                if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
                {
                  *(_WORD *)v35 = 0;
                  v33 = "AllPhotosToAllPhotos";
                  v34 = " enableTelemetry=YES  isAnimation=YES ";
                  goto LABEL_254;
                }
              }
LABEL_255:

              break;
            default:
              goto LABEL_30;
          }
          break;
        default:
          goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      if (v5) {
        goto LABEL_257;
      }
    }
    objc_msgSend(v12, "removeObject:", v8, *(void *)v35);
  }
LABEL_257:
}

- (void)zoomLevelTransitionDidEnd:(id)a3
{
}

- (void)zoomLevelTransitionDidBegin:(id)a3
{
  id v4 = a3;
  [(PXCuratedLibraryAnimationTracker *)self _zoomLevelTransitionOccurred:v4 isPreparation:1 isBegin:0];
  [(PXCuratedLibraryAnimationTracker *)self _zoomLevelTransitionOccurred:v4 isPreparation:0 isBegin:1];
}

- (void)zoomLevelTransitionPreparationDidBegin:(id)a3
{
}

- (PXCuratedLibraryAnimationTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibraryAnimationTracker;
  v2 = [(PXCuratedLibraryAnimationTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inFlightAnimations = v2->_inFlightAnimations;
    v2->_inFlightAnimations = v3;
  }
  return v2;
}

+ (void)_scrollAnimationOccurredWithContext:(id)a3 isBegin:(BOOL)a4
{
  uint64_t v25 = v4;
  uint64_t v26 = v5;
  uint64_t v27 = v6;
  BOOL v7 = a4;
  switch(a3.var0)
  {
    case 1:
      switch(a3.var1)
      {
        case 3:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v14 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v14) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollYearsFast";
            goto LABEL_50;
          }
          if (!v14) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollYearsFast";
          goto LABEL_75;
        case 2:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v15 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v15) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollYearsMedium";
            goto LABEL_50;
          }
          if (!v15) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollYearsMedium";
          goto LABEL_75;
        case 1:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v9 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v9) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollYearsSlow";
            goto LABEL_50;
          }
          if (!v9) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollYearsSlow";
          goto LABEL_75;
      }
      return;
    case 2:
      switch(a3.var1)
      {
        case 3:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v16 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v16) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollMonthsFast";
            goto LABEL_50;
          }
          if (!v16) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollMonthsFast";
          goto LABEL_75;
        case 2:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v17 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v17) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollMonthsMedium";
            goto LABEL_50;
          }
          if (!v17) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollMonthsMedium";
          goto LABEL_75;
        case 1:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v11 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v11) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollMonthsSlow";
            goto LABEL_50;
          }
          if (!v11) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollMonthsSlow";
          goto LABEL_75;
      }
      return;
    case 3:
      switch(a3.var1)
      {
        case 3:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v18 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v18) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollDaysFast";
            goto LABEL_50;
          }
          if (!v18) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollDaysFast";
          goto LABEL_75;
        case 2:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v19 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v19) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollDaysMedium";
            goto LABEL_50;
          }
          if (!v19) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollDaysMedium";
          goto LABEL_75;
        case 1:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v12 = os_signpost_enabled(v8);
          if (v7)
          {
            if (!v12) {
              goto LABEL_77;
            }
            *(_WORD *)v24 = 0;
            uint64_t v10 = "ScrollDaysSlow";
            goto LABEL_50;
          }
          if (!v12) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollDaysSlow";
          goto LABEL_75;
      }
      return;
    case 4:
      switch(a3.var1)
      {
        case 3:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v20 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v20)
            {
              *(_WORD *)v24 = 0;
              uint64_t v10 = "ScrollAllPhotosFast";
              goto LABEL_50;
            }
LABEL_77:

            return;
          }
          if (!v20) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollAllPhotosFast";
          break;
        case 2:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v21 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v21)
            {
              *(_WORD *)v24 = 0;
              uint64_t v10 = "ScrollAllPhotosMedium";
              goto LABEL_50;
            }
            goto LABEL_77;
          }
          if (!v21) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollAllPhotosMedium";
          break;
        case 1:
          id v8 = PLAnimationTelemetryGetLog();
          BOOL v13 = os_signpost_enabled(v8);
          if (v7)
          {
            if (v13)
            {
              *(_WORD *)v24 = 0;
              uint64_t v10 = "ScrollAllPhotosSlow";
LABEL_50:
              v22 = v8;
              os_signpost_type_t v23 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_76:
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, v23, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v24, 2u);
              goto LABEL_77;
            }
            goto LABEL_77;
          }
          if (!v13) {
            goto LABEL_77;
          }
          *(_WORD *)v24 = 0;
          uint64_t v10 = "ScrollAllPhotosSlow";
          break;
        default:
          return;
      }
LABEL_75:
      v22 = v8;
      os_signpost_type_t v23 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_76;
    default:
      return;
  }
}

+ (void)scrollAnimationDidEndWithScrollContext:(id)a3
{
}

+ (void)scrollAnimationDidBeginWithScrollContext:(id)a3
{
}

+ (PXCuratedLibraryAnimationTracker)sharedTracker
{
  if (sharedTracker_onceToken != -1) {
    dispatch_once(&sharedTracker_onceToken, &__block_literal_global_117417);
  }
  v2 = (void *)sharedTracker_tracker;
  return (PXCuratedLibraryAnimationTracker *)v2;
}

void __49__PXCuratedLibraryAnimationTracker_sharedTracker__block_invoke()
{
  v0 = objc_alloc_init(PXCuratedLibraryAnimationTracker);
  v1 = (void *)sharedTracker_tracker;
  sharedTracker_tracker = (uint64_t)v0;
}

@end