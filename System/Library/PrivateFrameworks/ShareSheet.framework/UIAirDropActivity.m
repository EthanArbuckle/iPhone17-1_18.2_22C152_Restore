@interface UIAirDropActivity
+ (BOOL)canPerformActivityWithItemClasses:(id)a3;
+ (CGSize)_thumbnailSize;
+ (id)classNamesForItems:(id)a3;
+ (id)classesForClassNames:(id)a3;
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (CGSize)_thumbnailSize;
- (id)_activityImageUTI;
- (id)activityTitle;
- (id)activityType;
@end

@implementation UIAirDropActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.AirDrop";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"AirDrop" value:@"AirDrop" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() classNamesForItems:v3];

  v5 = [(id)objc_opt_class() classesForClassNames:v4];
  char v6 = [(id)objc_opt_class() canPerformActivityWithItemClasses:v5];

  return v6;
}

- (id)_activityImageUTI
{
  return @"com.apple.graphic-icon.airdrop";
}

- (CGSize)_thumbnailSize
{
  uint64_t v2 = objc_opt_class();
  [v2 _thumbnailSize];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)_thumbnailSize
{
  uint64_t v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  SFSuggestedAirDropThumbnailSize();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

+ (id)classNamesForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        objc_msgSend(v4, "addObject:", v11, v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)classesForClassNames:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        Class v10 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8 * i));
        if (v10) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)canPerformActivityWithItemClasses:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v9 = [v8 description];
        if ((unint64_t)[v9 length] >= 0x3D)
        {
          Class v10 = [v8 description];
          uint64_t v11 = [v10 substringToIndex:60];

          v9 = (void *)v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v5);
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * j) isSubclassOfClass:objc_opt_class()];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    BOOL v20 = 0;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8 * v22);
        BOOL v20 = v20
           || (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class(), (void)v26) & 1) != 0
           || ([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || [v23 isSubclassOfClass:objc_opt_class()];
        if (([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || ([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v23 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v20 = 1;
        }
        if (([v23 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v23 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v20 = 1;
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v24 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
      uint64_t v19 = v24;
    }
    while (v24);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

@end