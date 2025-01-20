@interface PLDayPhotosHighlightTitleGenerator
+ (id)assetsToUseForDayHighlight:(id)a3 withFilter:(unsigned __int16)a4;
+ (id)titleForHighlight:(id)a3 filter:(unsigned __int16)a4 dateRangeTitleGenerator:(id)a5 options:(unint64_t)a6;
@end

@implementation PLDayPhotosHighlightTitleGenerator

+ (id)assetsToUseForDayHighlight:(id)a3 withFilter:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  v6 = v5;
  switch(v4)
  {
    case 2:
      v7 = [v5 extendedAssetsShared];
      if ([v7 count]) {
        goto LABEL_12;
      }
      uint64_t v8 = [v6 assetsShared];
      goto LABEL_10;
    case 1:
      v7 = [v5 extendedAssetsPrivate];
      if ([v7 count]) {
        goto LABEL_12;
      }
      uint64_t v8 = [v6 assetsPrivate];
      goto LABEL_10;
    case 0:
      v7 = [v5 extendedAssets];
      if ([v7 count]) {
        goto LABEL_12;
      }
      uint64_t v8 = [v6 assets];
LABEL_10:
      v9 = (void *)v8;

      v7 = v9;
      goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (id)titleForHighlight:(id)a3 filter:(unsigned __int16)a4 dateRangeTitleGenerator:(id)a5 options:(unint64_t)a6
{
  uint64_t v7 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v26 = a5;
  id v9 = a3;
  v25 = +[PLDayPhotosHighlightTitleGenerator assetsToUseForDayHighlight:v9 withFilter:v7];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v27[0] = v10;
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v27[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v13 = [v25 sortedArrayUsingDescriptors:v12];

  v24 = [v13 firstObject];
  v14 = [v13 lastObject];
  v15 = [v24 dateCreated];
  v16 = objc_msgSend(v15, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v9, "startTimeZoneOffset"));

  v17 = [v14 dateCreated];
  v18 = objc_msgSend(v17, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v9, "endTimeZoneOffset"));

  if (_os_feature_enabled_impl()) {
    a6 |= 8uLL;
  }
  uint64_t v19 = [v9 category];
  uint64_t v20 = [v9 kind];
  uint64_t v21 = [v9 type];

  v22 = [v26 dateRangeTitleWithStartDate:v16 endDate:v18 category:v19 kind:v20 type:v21 options:a6];

  return v22;
}

@end