@interface PGHighlightItemRestorer
+ (id)restoreExistingHighlightItemListsFromBackingHighlightItems:(id)a3 usingModelReader:(id)a4 progressBlock:(id)a5;
@end

@implementation PGHighlightItemRestorer

+ (id)restoreExistingHighlightItemListsFromBackingHighlightItems:(id)a3 usingModelReader:(id)a4 progressBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (char *)_Block_copy(a5);
  unint64_t v10 = [v7 count];
  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = 1.0 / (double)v10;
    uint64_t v16 = *(void *)v29;
    v26 = v9 + 16;
    double v17 = 0.0;
    double v18 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        double v17 = v15 + v17;
        v21 = objc_msgSend(v8, "fetchChildHighlightItemsForHighlightItem:sharingFilter:", v20, 2, v26);
        v22 = [[PGHighlightItemList alloc] initWithParentHighlightItem:v20 childHighlightItems:v21];
        [v11 addObject:v22];
        if (v9)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v18 >= 0.01)
          {
            char v27 = 0;
            (*((void (**)(char *, char *, double))v9 + 2))(v9, &v27, v17);
            if (v27)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v33 = 35;
                __int16 v34 = 2080;
                v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemRestorer.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v24 = (id)MEMORY[0x1E4F1CBF0];
              goto LABEL_16;
            }
            double v18 = Current;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v24 = v11;
LABEL_16:

  return v24;
}

@end