@interface PXAnimationTracker
+ (void)_scrollAnimationOccurred:(int64_t)a3 isBegin:(BOOL)a4;
+ (void)_transitionAnimationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6;
+ (void)_transitionPreparationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6;
+ (void)scrollAnimationDidBegin:(int64_t)a3;
+ (void)scrollAnimationDidEnd:(int64_t)a3;
+ (void)transitionAnimationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5;
+ (void)transitionAnimationDidEnd:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5;
+ (void)transitionPreparationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5;
@end

@implementation PXAnimationTracker

+ (void)_transitionAnimationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v11 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUndefined";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUndefined";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v60 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v60, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUndefined";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUndefined";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v61 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v61, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v62 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v62, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 1:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v14 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v14, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMoments";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMoments";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v63 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v63, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMoments";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMoments";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v64 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v64, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v65 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v65, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 2:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v15 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v15, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCollections";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCollections";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v66 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v66, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCollections";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCollections";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v67 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v67, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v68 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v68, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 3:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v16 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v16, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromYears";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromYears";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v69 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v69, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYears";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYears";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v70 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v70, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v71 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v71, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 4:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v17 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromRecentsAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromRecentsAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v72 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v72, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromRecentsAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromRecentsAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v73 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v73, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v74 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v74, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 5:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v20 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v20, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromFavoritesAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromFavoritesAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v75 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v75, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromFavoritesAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromFavoritesAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v76 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v76, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v77 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v77, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 6:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v21 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v21, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromSharedAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromSharedAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v78 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v78, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromSharedAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromSharedAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v79 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v79, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v80 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v80, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 7:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v22 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v22, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromPlacesAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromPlacesAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v81 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v81, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromPlacesAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromPlacesAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v82 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v82, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v83 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v83, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 8:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v23 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v23, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMediaTypeAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMediaTypeAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v84 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v84, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMediaTypeAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMediaTypeAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v85 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v85, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v86 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v86, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 9:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v24 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v24, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromUserAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromUserAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v87 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v87, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromUserAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromUserAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v88 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v88, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v89 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v89, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 10:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v25 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v25, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromImportsAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromImportsAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v90 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v90, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromImportsAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromImportsAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v91 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v91, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v92 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v92, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 11:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v26 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v26, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromHiddenAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromHiddenAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v93 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v93, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromHiddenAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromHiddenAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v94 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v94, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v95 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v95, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 12:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v27 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v27, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromRecentlyDeleted";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromRecentlyDeleted";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v96 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v96, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromRecentlyDeleted";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromRecentlyDeleted";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v97 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v97, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v98 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v98, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 13:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v28 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v28, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCompleteMyMoment";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCompleteMyMoment";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v99 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v99, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCompleteMyMoment";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCompleteMyMoment";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v100 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v100, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v101 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v101, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 14:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v29 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v29, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMomentsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMomentsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v102 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v102, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMomentsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMomentsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v103 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v103, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v104 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v104, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 15:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v30 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v30, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMomentsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMomentsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v105 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v105, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMomentsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMomentsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v106 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v106, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v107 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v107, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 16:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v31 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v31, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCollectionsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCollectionsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v108 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v108, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCollectionsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCollectionsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v109 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v109, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v110 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v110, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 17:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v32 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v32, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCollectionsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCollectionsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v111 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v111, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCollectionsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCollectionsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v112 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v112, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v113 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v113, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 18:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v33 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v33, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromYearsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromYearsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v114 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v114, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYearsDetail";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYearsDetail";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v115 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v115, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v116 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v116, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 19:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v34 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v34, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromYearsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromYearsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v117 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v117, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYearsDetailShowMore";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYearsDetailShowMore";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v118 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v118, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v119 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v119, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 20:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v35 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v35, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMemoriesDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMemoriesDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v120 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v120, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMemoriesDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMemoriesDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v121 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v121, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v122 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v122, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 21:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v36 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v36, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMemoriesDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMemoriesDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v123 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v123, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMemoriesDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMemoriesDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v124 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v124, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v125 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v125, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 22:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v37 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v37, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromRelatedDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromRelatedDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v126 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v126, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromRelatedDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromRelatedDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v127 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v127, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v128 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v128, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 23:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v38 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v38, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromRelatedDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromRelatedDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v129 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v129, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromRelatedDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromRelatedDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v130 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v130, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v131 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v131, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 24:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v39 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v39, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPeopleDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPeopleDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v132 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v132, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPeopleDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPeopleDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v133 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v133, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v134 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v134, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 25:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v40 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v40, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPeopleDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPeopleDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v135 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v135, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPeopleDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPeopleDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v136 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v136, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v137 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v137, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 26:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v41 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v41, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUserAlbumDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUserAlbumDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v138 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v138, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUserAlbumDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUserAlbumDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v139 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v139, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v140 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v140, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 27:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v42 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v42, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v141 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v141, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v142 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v142, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v143 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v143, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 28:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v43 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v43, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPlacesDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPlacesDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v144 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v144, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPlacesDetail";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPlacesDetail";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v145 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v145, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v146 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v146, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 29:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v44 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v44, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPlacesDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPlacesDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v147 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v147, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPlacesDetailShowMore";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPlacesDetailShowMore";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v148 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v148, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v149 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v149, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 30:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v45 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v45, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromSearchTopResults";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromSearchTopResults";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v150 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v150, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromSearchTopResults";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromSearchTopResults";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v151 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v151, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v152 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v152, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 31:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v46 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v46, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromSearchResults";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromSearchResults";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v153 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v153, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromSearchResults";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromSearchResults";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v154 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v154, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v155 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v155, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 37:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v58 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v58, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCamera";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCamera";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v195 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v195, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCamera";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCamera";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v190 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v190, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v191 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v191, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 38:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v47 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v47, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromNotification";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromNotification";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v156 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v156, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromNotification";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromNotification";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v157 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v157, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v158 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v158, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 39:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v48 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v48, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCuratedLibraryDays";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCuratedLibraryDays";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v159 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v159, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCuratedLibraryDays";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCuratedLibraryDays";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v160 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v160, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v161 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v161, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 40:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v59 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v59, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosOneColumn";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosOneColumn";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v192 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v192, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosOneColumn";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosOneColumn";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v193 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v193, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v194 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v194, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 41:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v49 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v49, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosThreeColumns";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosThreeColumns";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v162 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v162, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosThreeColumns";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosThreeColumns";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v163 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v163, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v164 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v164, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 42:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v50 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v50, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosFiveColumns";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosFiveColumns";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v165 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v165, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosFiveColumns";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosFiveColumns";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v166 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v166, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetails";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v167 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v167, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetails";
LABEL_722:
              v180 = v10;
              os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1236:
              os_signpost_id_t v200 = v12;
              goto LABEL_1237;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetails";
LABEL_1235:
            v180 = v10;
            os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1236;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 43:
      switch(a3)
      {
        case 1:
          v51 = PLAnimationTelemetryGetLog();
          v52 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v53 = os_signpost_id_make_with_pointer(v52, v9);

          if (v6)
          {
            if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v53, "EnterOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
            }

            goto LABEL_190;
          }
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v51, OS_SIGNPOST_INTERVAL_END, v53, "EnterOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
          }

          goto LABEL_835;
        case 2:
          v168 = PLAnimationTelemetryGetLog();
          v169 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v170 = os_signpost_id_make_with_pointer(v169, v9);

          if (v6)
          {
            if (v170 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v168, OS_SIGNPOST_INTERVAL_BEGIN, v170, "ExitOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
            }

            goto LABEL_661;
          }
          if (v170 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v168, OS_SIGNPOST_INTERVAL_END, v170, "ExitOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
          }

          goto LABEL_1175;
        case 3:
          v171 = PLAnimationTelemetryGetLog();
          v172 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v173 = os_signpost_id_make_with_pointer(v172, v9);

          if (v6)
          {
            if (v173 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v171))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v171, OS_SIGNPOST_INTERVAL_BEGIN, v173, "EnterDetails", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
            }

            goto LABEL_665;
          }
          if (v173 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v171))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v171, OS_SIGNPOST_INTERVAL_END, v173, "EnterDetails", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
          }

          goto LABEL_1182;
        case 4:
          v174 = PLAnimationTelemetryGetLog();
          v175 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v176 = os_signpost_id_make_with_pointer(v175, v9);

          if (v6)
          {
            if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v174))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v174, OS_SIGNPOST_INTERVAL_BEGIN, v176, "ExitDetails", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
            }

            goto LABEL_669;
          }
          if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v174))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v174, OS_SIGNPOST_INTERVAL_END, v176, "ExitDetails", " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
          }

          break;
        default:
          goto LABEL_1239;
      }
LABEL_1189:
      v10 = PLAnimationTelemetryGetLog();
      v199 = PLAnimationTelemetryGetLog();
      os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v199, v9);

      if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
        goto LABEL_1238;
      }
      *(_WORD *)v201 = 0;
      v13 = "ExitDetails";
LABEL_1192:
      v180 = v10;
      os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_END;
LABEL_1193:
      os_signpost_id_t v200 = v55;
LABEL_1237:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v180, v181, v200, v13, " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
      goto LABEL_1238;
    case 44:
      switch(a3)
      {
        case 1:
          if (v6)
          {
LABEL_190:
            v10 = PLAnimationTelemetryGetLog();
            v54 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v54, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbum";
              goto LABEL_672;
            }
          }
          else
          {
LABEL_835:
            v10 = PLAnimationTelemetryGetLog();
            v196 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v196, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbum";
              goto LABEL_1192;
            }
          }
          goto LABEL_1238;
        case 2:
          if (v6)
          {
LABEL_661:
            v10 = PLAnimationTelemetryGetLog();
            v177 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v177, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbum";
              goto LABEL_672;
            }
          }
          else
          {
LABEL_1175:
            v10 = PLAnimationTelemetryGetLog();
            v197 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v197, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbum";
              goto LABEL_1192;
            }
          }
          goto LABEL_1238;
        case 3:
          if (!v6)
          {
LABEL_1182:
            v10 = PLAnimationTelemetryGetLog();
            v198 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v198, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetails";
              goto LABEL_1192;
            }
            goto LABEL_1238;
          }
LABEL_665:
          v10 = PLAnimationTelemetryGetLog();
          v178 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v178, v9);

          if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_1238;
          }
          *(_WORD *)v201 = 0;
          v13 = "EnterDetails";
LABEL_672:
          v180 = v10;
          os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_BEGIN;
          break;
        case 4:
          if (!v6) {
            goto LABEL_1189;
          }
LABEL_669:
          v10 = PLAnimationTelemetryGetLog();
          v179 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v179, v9);

          if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_1238;
          }
          *(_WORD *)v201 = 0;
          v13 = "ExitDetails";
          goto LABEL_672;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1193;
    case 45:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v56 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v56, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromSharedLibraryAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromSharedLibraryAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v182 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v182, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromSharedLibraryAlbum";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromSharedLibraryAlbum";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v183 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v183, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v184 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v184, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 46:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v57 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v57, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromForYouSharedLibrarySharingSuggestion";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromForYouSharedLibrarySharingSuggestion";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v185 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v185, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromForYouSharedLibrarySharingSuggestion";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromForYouSharedLibrarySharingSuggestion";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v186 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v186, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetails";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetails";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v187 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v187, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetails";
LABEL_697:
              v188 = v10;
              os_signpost_type_t v189 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1213:
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v188, v189, v18, v19, " enableTelemetry=YES  isAnimation=YES ", v201, 2u);
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetails";
LABEL_1212:
            v188 = v10;
            os_signpost_type_t v189 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1213;
          }
LABEL_1238:

LABEL_1239:
          return;
        default:
          goto LABEL_1239;
      }
    default:
      goto LABEL_1239;
  }
}

+ (void)transitionAnimationDidEnd:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
}

+ (void)transitionAnimationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
  id v8 = a5;
  [a1 _transitionPreparationOccurred:a3 fromOrigin:a4 transitionObject:v8 isBegin:0];
  [a1 _transitionAnimationOccurred:a3 fromOrigin:a4 transitionObject:v8 isBegin:1];
}

+ (void)_transitionPreparationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v11 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUndefinedPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUndefinedPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v60 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v60, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUndefinedPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUndefinedPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v61 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v61, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v62 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v62, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 1:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v14 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v14, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMomentsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMomentsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v63 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v63, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMomentsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMomentsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v64 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v64, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v65 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v65, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 2:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v15 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v15, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCollectionsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCollectionsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v66 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v66, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCollectionsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCollectionsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v67 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v67, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v68 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v68, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 3:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v16 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v16, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromYearsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromYearsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v69 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v69, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYearsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYearsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v70 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v70, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v71 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v71, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 4:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v17 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromRecentsAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromRecentsAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v72 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v72, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromRecentsAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromRecentsAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v73 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v73, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v74 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v74, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 5:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v20 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v20, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromFavoritesAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromFavoritesAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v75 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v75, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromFavoritesAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromFavoritesAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v76 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v76, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v77 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v77, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 6:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v21 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v21, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromSharedAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromSharedAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v78 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v78, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromSharedAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromSharedAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v79 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v79, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v80 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v80, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 7:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v22 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v22, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromPlacesAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromPlacesAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v81 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v81, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromPlacesAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromPlacesAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v82 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v82, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v83 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v83, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 8:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v23 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v23, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMediaTypeAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMediaTypeAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v84 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v84, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMediaTypeAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMediaTypeAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v85 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v85, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v86 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v86, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 9:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v24 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v24, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromUserAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromUserAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v87 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v87, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromUserAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromUserAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v88 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v88, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v89 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v89, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 10:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v25 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v25, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromImportsAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromImportsAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v90 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v90, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromImportsAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromImportsAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v91 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v91, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v92 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v92, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 11:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v26 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v26, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromHiddenAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromHiddenAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v93 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v93, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromHiddenAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromHiddenAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v94 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v94, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v95 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v95, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 12:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v27 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v27, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromRecentlyDeletedPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromRecentlyDeletedPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v96 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v96, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromRecentlyDeletedPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromRecentlyDeletedPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v97 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v97, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v98 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v98, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 13:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v28 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v28, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCompleteMyMomentPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCompleteMyMomentPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v99 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v99, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCompleteMyMomentPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCompleteMyMomentPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v100 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v100, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v101 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v101, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 14:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v29 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v29, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMomentsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMomentsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v102 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v102, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMomentsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMomentsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v103 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v103, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v104 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v104, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 15:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v30 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v30, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromMomentsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromMomentsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v105 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v105, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromMomentsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromMomentsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v106 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v106, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v107 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v107, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 16:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v31 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v31, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCollectionsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCollectionsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v108 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v108, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCollectionsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCollectionsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v109 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v109, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v110 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v110, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 17:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v32 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v32, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromCollectionsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromCollectionsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v111 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v111, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromCollectionsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromCollectionsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v112 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v112, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v113 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v113, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 18:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v33 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v33, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromYearsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromYearsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v114 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v114, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYearsDetailPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYearsDetailPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v115 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v115, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v116 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v116, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 19:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v34 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v34, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromYearsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromYearsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v117 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v117, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromYearsDetailShowMorePreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromYearsDetailShowMorePreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v118 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v118, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v119 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v119, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 20:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v35 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v35, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMemoriesDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMemoriesDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v120 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v120, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMemoriesDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMemoriesDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v121 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v121, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v122 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v122, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 21:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v36 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v36, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromMemoriesDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromMemoriesDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v123 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v123, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromMemoriesDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromMemoriesDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v124 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v124, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v125 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v125, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 22:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v37 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v37, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromRelatedDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromRelatedDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v126 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v126, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromRelatedDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromRelatedDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v127 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v127, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v128 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v128, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 23:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v38 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v38, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromRelatedDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromRelatedDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v129 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v129, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromRelatedDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromRelatedDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v130 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v130, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v131 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v131, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 24:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v39 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v39, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPeopleDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPeopleDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v132 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v132, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPeopleDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPeopleDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v133 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v133, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v134 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v134, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 25:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v40 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v40, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPeopleDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPeopleDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v135 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v135, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPeopleDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPeopleDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v136 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v136, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v137 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v137, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 26:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v41 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v41, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v138 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v138, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v139 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v139, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v140 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v140, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 27:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v42 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v42, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v141 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v141, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v142 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v142, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v143 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v143, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 28:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v43 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v43, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPlacesDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPlacesDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v144 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v144, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPlacesDetailPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPlacesDetailPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v145 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v145, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v146 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v146, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 29:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v44 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v44, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromPlacesDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromPlacesDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v147 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v147, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromPlacesDetailShowMorePreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromPlacesDetailShowMorePreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v148 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v148, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v149 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v149, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 30:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v45 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v45, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromSearchTopResultsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromSearchTopResultsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v150 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v150, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromSearchTopResultsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromSearchTopResultsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v151 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v151, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v152 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v152, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 31:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v46 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v46, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromSearchResultsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromSearchResultsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v153 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v153, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromSearchResultsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromSearchResultsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v154 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v154, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v155 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v155, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 37:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v58 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v58, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCameraPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCameraPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v195 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v195, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCameraPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCameraPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v190 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v190, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v191 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v191, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 38:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v47 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v47, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromNotificationPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromNotificationPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v156 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v156, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromNotificationPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromNotificationPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v157 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v157, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v158 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v158, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 39:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v48 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v48, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromCuratedLibraryDaysPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromCuratedLibraryDaysPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v159 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v159, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromCuratedLibraryDaysPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromCuratedLibraryDaysPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v160 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v160, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v161 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v161, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 40:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v59 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v59, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosOneColumnPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosOneColumnPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v192 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v192, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosOneColumnPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosOneColumnPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v193 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v193, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v194 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v194, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 41:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v49 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v49, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosThreeColumnsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosThreeColumnsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v162 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v162, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosThreeColumnsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosThreeColumnsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v163 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v163, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v164 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v164, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1235;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 42:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v50 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v50, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromAllPhotosFiveColumnsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterOneUpFromAllPhotosFiveColumnsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v165 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v165, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromAllPhotosFiveColumnsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitOneUpFromAllPhotosFiveColumnsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v166 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v166, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_722;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1235;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v167 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v167, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitDetailsPreparation";
LABEL_722:
              v180 = v10;
              os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1236:
              os_signpost_id_t v200 = v12;
              goto LABEL_1237;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v13 = "ExitDetailsPreparation";
LABEL_1235:
            v180 = v10;
            os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1236;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 43:
      switch(a3)
      {
        case 1:
          v51 = PLAnimationTelemetryGetLog();
          v52 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v53 = os_signpost_id_make_with_pointer(v52, v9);

          if (v6)
          {
            if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v53, "EnterOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v201, 2u);
            }

            goto LABEL_190;
          }
          if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v51, OS_SIGNPOST_INTERVAL_END, v53, "EnterOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v201, 2u);
          }

          goto LABEL_835;
        case 2:
          v168 = PLAnimationTelemetryGetLog();
          v169 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v170 = os_signpost_id_make_with_pointer(v169, v9);

          if (v6)
          {
            if (v170 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v168, OS_SIGNPOST_INTERVAL_BEGIN, v170, "ExitOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v201, 2u);
            }

            goto LABEL_661;
          }
          if (v170 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v168, OS_SIGNPOST_INTERVAL_END, v170, "ExitOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v201, 2u);
          }

          goto LABEL_1175;
        case 3:
          v171 = PLAnimationTelemetryGetLog();
          v172 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v173 = os_signpost_id_make_with_pointer(v172, v9);

          if (v6)
          {
            if (v173 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v171))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v171, OS_SIGNPOST_INTERVAL_BEGIN, v173, "EnterDetailsPreparation", " enableTelemetry=YES ", v201, 2u);
            }

            goto LABEL_665;
          }
          if (v173 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v171))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v171, OS_SIGNPOST_INTERVAL_END, v173, "EnterDetailsPreparation", " enableTelemetry=YES ", v201, 2u);
          }

          goto LABEL_1182;
        case 4:
          v174 = PLAnimationTelemetryGetLog();
          v175 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v176 = os_signpost_id_make_with_pointer(v175, v9);

          if (v6)
          {
            if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v174))
            {
              *(_WORD *)v201 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v174, OS_SIGNPOST_INTERVAL_BEGIN, v176, "ExitDetailsPreparation", " enableTelemetry=YES ", v201, 2u);
            }

            goto LABEL_669;
          }
          if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v174))
          {
            *(_WORD *)v201 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v174, OS_SIGNPOST_INTERVAL_END, v176, "ExitDetailsPreparation", " enableTelemetry=YES ", v201, 2u);
          }

          break;
        default:
          goto LABEL_1239;
      }
LABEL_1189:
      v10 = PLAnimationTelemetryGetLog();
      v199 = PLAnimationTelemetryGetLog();
      os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v199, v9);

      if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
        goto LABEL_1238;
      }
      *(_WORD *)v201 = 0;
      v13 = "ExitDetailsPreparation";
LABEL_1192:
      v180 = v10;
      os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_END;
LABEL_1193:
      os_signpost_id_t v200 = v55;
LABEL_1237:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v180, v181, v200, v13, " enableTelemetry=YES ", v201, 2u);
      goto LABEL_1238;
    case 44:
      switch(a3)
      {
        case 1:
          if (v6)
          {
LABEL_190:
            v10 = PLAnimationTelemetryGetLog();
            v54 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v54, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_672;
            }
          }
          else
          {
LABEL_835:
            v10 = PLAnimationTelemetryGetLog();
            v196 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v196, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_1192;
            }
          }
          goto LABEL_1238;
        case 2:
          if (v6)
          {
LABEL_661:
            v10 = PLAnimationTelemetryGetLog();
            v177 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v177, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_672;
            }
          }
          else
          {
LABEL_1175:
            v10 = PLAnimationTelemetryGetLog();
            v197 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v197, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_1192;
            }
          }
          goto LABEL_1238;
        case 3:
          if (!v6)
          {
LABEL_1182:
            v10 = PLAnimationTelemetryGetLog();
            v198 = PLAnimationTelemetryGetLog();
            os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v198, v9);

            if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_1192;
            }
            goto LABEL_1238;
          }
LABEL_665:
          v10 = PLAnimationTelemetryGetLog();
          v178 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v178, v9);

          if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_1238;
          }
          *(_WORD *)v201 = 0;
          v13 = "EnterDetailsPreparation";
LABEL_672:
          v180 = v10;
          os_signpost_type_t v181 = OS_SIGNPOST_INTERVAL_BEGIN;
          break;
        case 4:
          if (!v6) {
            goto LABEL_1189;
          }
LABEL_669:
          v10 = PLAnimationTelemetryGetLog();
          v179 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v179, v9);

          if (v55 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
            goto LABEL_1238;
          }
          *(_WORD *)v201 = 0;
          v13 = "ExitDetailsPreparation";
          goto LABEL_672;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1193;
    case 45:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v56 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v56, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromSharedLibraryAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromSharedLibraryAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v182 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v182, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromSharedLibraryAlbumPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromSharedLibraryAlbumPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v183 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v183, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v184 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v184, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
            goto LABEL_1212;
          }
          break;
        default:
          goto LABEL_1239;
      }
      goto LABEL_1238;
    case 46:
      switch(a3)
      {
        case 1:
          v10 = PLAnimationTelemetryGetLog();
          v57 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v57, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 2:
          v10 = PLAnimationTelemetryGetLog();
          v185 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v185, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 3:
          v10 = PLAnimationTelemetryGetLog();
          v186 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v186, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "EnterDetailsPreparation";
              goto LABEL_697;
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "EnterDetailsPreparation";
            goto LABEL_1212;
          }
          goto LABEL_1238;
        case 4:
          v10 = PLAnimationTelemetryGetLog();
          v187 = PLAnimationTelemetryGetLog();
          os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v187, v9);

          if (v6)
          {
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v201 = 0;
              v19 = "ExitDetailsPreparation";
LABEL_697:
              v188 = v10;
              os_signpost_type_t v189 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1213:
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v188, v189, v18, v19, " enableTelemetry=YES ", v201, 2u);
            }
          }
          else if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v201 = 0;
            v19 = "ExitDetailsPreparation";
LABEL_1212:
            v188 = v10;
            os_signpost_type_t v189 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1213;
          }
LABEL_1238:

LABEL_1239:
          return;
        default:
          goto LABEL_1239;
      }
    default:
      goto LABEL_1239;
  }
}

+ (void)transitionPreparationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
}

+ (void)_scrollAnimationOccurred:(int64_t)a3 isBegin:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      v5 = PLAnimationTelemetryGetLog();
      BOOL v10 = os_signpost_enabled(v5);
      if (v4)
      {
        if (v10)
        {
          __int16 v16 = 0;
          v7 = "ScrollAlbums";
          id v8 = (uint8_t *)&v16;
          goto LABEL_13;
        }
        goto LABEL_22;
      }
      if (!v10) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      v7 = "ScrollAlbums";
      id v8 = buf;
    }
    else
    {
      if (a3 != 1) {
        return;
      }
      v5 = PLAnimationTelemetryGetLog();
      BOOL v6 = os_signpost_enabled(v5);
      if (v4)
      {
        if (v6)
        {
          __int16 v18 = 0;
          v7 = "ScrollForYou";
          id v8 = (uint8_t *)&v18;
LABEL_13:
          v11 = v5;
          os_signpost_type_t v12 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_21:
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, v12, 0xEEEEB0B5B2B2EEEELL, v7, " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (!v6) {
        goto LABEL_22;
      }
      __int16 v17 = 0;
      v7 = "ScrollForYou";
      id v8 = (uint8_t *)&v17;
    }
LABEL_20:
    v11 = v5;
    os_signpost_type_t v12 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_21;
  }
  v5 = PLAnimationTelemetryGetLog();
  BOOL v9 = os_signpost_enabled(v5);
  if (!v4)
  {
    if (!v9) {
      goto LABEL_22;
    }
    __int16 v13 = 0;
    v7 = "ScrollSearch";
    id v8 = (uint8_t *)&v13;
    goto LABEL_20;
  }
  if (v9)
  {
    __int16 v14 = 0;
    v7 = "ScrollSearch";
    id v8 = (uint8_t *)&v14;
    goto LABEL_13;
  }
LABEL_22:
}

+ (void)scrollAnimationDidEnd:(int64_t)a3
{
}

+ (void)scrollAnimationDidBegin:(int64_t)a3
{
}

@end