@interface UIAddToReadingListActivity
+ (id)applicationBundleID;
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_heroActionTitle;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)_addToReadingList:(id)a3 withTitle:(id)a4;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation UIAddToReadingListActivity

+ (unint64_t)_xpcAttributes
{
  return 0;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.AddToReadingList";
}

+ (id)applicationBundleID
{
  return @"com.apple.mobilesafari";
}

- (id)_systemImageName
{
  return @"eyeglasses";
}

- (id)activityTitle
{
  v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"AddToReadingList[Activity]" value:@"Add to Reading List" table:@"Localizable"];

  return v3;
}

- (id)_heroActionTitle
{
  v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Read Later" value:@"Read Later" table:@"Localizable"];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v3 = [(id)objc_opt_class() applicationBundleID];
  char CanDisplayActivityForApplicationWithBundleID = _UIActivityCanDisplayActivityForApplicationWithBundleID((uint64_t)v3);

  if (CanDisplayActivityForApplicationWithBundleID)
  {
    return ((unint64_t)_UIActivityItemTypes() >> 2) & 1;
  }
  else
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "AddToReadingListActivity: Can't display activity", v8, 2u);
    }

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [(UIActivity *)self _subjectForActivityItem:v9];
          [(UIAddToReadingListActivity *)self _addToReadingList:v9 withTitle:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)performActivity
{
}

- (void)_addToReadingList:(id)a3 withTitle:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7 && [v7 isHTTPOrHTTPSURL])
  {
    if (!v5)
    {
      id v5 = [v7 absoluteString];
    }
    uint64_t v6 = [(objc_class *)getSSReadingListClass() defaultReadingList];
    [v6 addReadingListItemWithURL:v7 title:v5 previewText:0 error:0];
  }
}

@end