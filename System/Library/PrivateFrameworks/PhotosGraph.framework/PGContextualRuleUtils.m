@interface PGContextualRuleUtils
+ (id)dayHighlightContainingAsset:(id)a3;
+ (id)onThisDayLocalDateForYearHighlight:(id)a3 withOptions:(id)a4;
+ (void)returnContextualKeyAssetForHighlightNode:(id)a3 yearHighlight:(id)a4 sharingFilter:(unsigned __int16)a5 score:(double)a6 inPhotoLibrary:(id)a7 loggingConnection:(id)a8 usingBlock:(id)a9;
@end

@implementation PGContextualRuleUtils

+ (id)dayHighlightContainingAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];

  v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = [v3 objectID];

  v8 = [v6 predicateWithFormat:@"assets CONTAINS %@ and kind = %d", v7, 0];
  [v5 setInternalPredicate:v8];

  v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v5];
  v10 = [v9 firstObject];

  return v10;
}

+ (void)returnContextualKeyAssetForHighlightNode:(id)a3 yearHighlight:(id)a4 sharingFilter:(unsigned __int16)a5 score:(double)a6 inPhotoLibrary:(id)a7 loggingConnection:(id)a8 usingBlock:(id)a9
{
  uint64_t v13 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = a8;
  v19 = (void (**)(void, void *, void *, void *, uint8_t *, double))a9;
  v20 = [v15 fetchAssetCollectionInPhotoLibrary:v17];
  if (v20)
  {
    id v38 = v15;
    v39 = v19;
    oslog = v18;
    [v17 librarySpecificFetchOptions];
    v22 = v21 = v16;
    [v22 setFetchLimit:1];
    [v22 setSharingFilter:v13];
    v23 = [MEMORY[0x1E4F39238] fetchParentDayGroupHighlightForHighlight:v20 options:v22];
    v24 = [v23 firstObject];

    if (v24) {
      v25 = v24;
    }
    else {
      v25 = v20;
    }
    v26 = [MEMORY[0x1E4F39238] fetchParentHighlightForHighlight:v25 options:v22];
    v27 = [v26 firstObject];

    v28 = [MEMORY[0x1E4F39238] fetchParentHighlightForHighlight:v27 options:v22];
    v29 = [v28 firstObject];

    v30 = [v29 uuid];
    v40 = v21;
    v31 = [v21 uuid];
    char v32 = [v30 isEqualToString:v31];

    if (v32)
    {
      v33 = [v17 librarySpecificFetchOptions];
      [v33 setSharingFilter:v13];
      [v33 setIncludeGuestAssets:1];
      [v33 setFetchLimit:1];
      v34 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v20 referenceAsset:0 options:v33];
      v35 = [v34 firstObject];

      if (v35 && v27)
      {
        buf[0] = 0;
        v18 = oslog;
        id v15 = v38;
        if (a6 == 0.0)
        {
          [v20 promotionScore];
          a6 = v36;
        }
        v39[2](v39, v35, v20, v27, buf, a6);
      }
      else
      {
        v18 = oslog;
        id v15 = v38;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v42 = v38;
          __int16 v43 = 2112;
          v44 = v20;
          __int16 v45 = 2112;
          v46 = v27;
          __int16 v47 = 2112;
          v48 = v35;
          _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "Did not return contextual key asset for highlight node %@:\n\tHighlight: %@\n\tMonth highlight: %@\n\tKey asset: %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      v18 = oslog;
      id v15 = v38;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v42 = v38;
        __int16 v43 = 2112;
        v44 = v20;
        __int16 v45 = 2112;
        v46 = v29;
        __int16 v47 = 2112;
        v48 = v40;
        _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "Contextual year highlight do not match year highlight for highlight node %@:\n\tContexutal Highlight: %@\n\tContextual Year Highlight: %@\n\tYear highlight: %@\n", buf, 0x2Au);
      }
    }

    v19 = v39;
    id v16 = v40;
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v15;
    _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Cannot find highlight for highlight node %@: graph might be out of date", buf, 0xCu);
  }
}

+ (id)onThisDayLocalDateForYearHighlight:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  v6 = [a3 localDateComponents];
  v7 = [v5 localTodayComponents];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v8, "setYear:", objc_msgSend(v6, "year"));
  objc_msgSend(v8, "setMonth:", objc_msgSend(v7, "month"));
  objc_msgSend(v8, "setDay:", objc_msgSend(v7, "day"));
  [v8 setHour:12];
  [v8 setMinute:0];
  [v8 setSecond:0];
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [v9 dateFromComponents:v8];

  return v10;
}

@end