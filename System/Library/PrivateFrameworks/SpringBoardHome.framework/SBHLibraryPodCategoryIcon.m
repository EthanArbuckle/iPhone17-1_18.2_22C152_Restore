@interface SBHLibraryPodCategoryIcon
- (BOOL)isCategoryIcon;
- (SBHLibraryCategory)category;
- (SBHLibraryPodCategoryIcon)initWithCategory:(id)a3;
- (int64_t)labelAccessoryType;
- (void)categoryDidUpdate:(id)a3;
@end

@implementation SBHLibraryPodCategoryIcon

- (SBHLibraryPodCategoryIcon)initWithCategory:(id)a3
{
  id v5 = a3;
  v6 = [v5 leafIdentifier];
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodCategoryIcon;
  v7 = [(SBLeafIcon *)&v10 initWithLeafIdentifier:v6 applicationBundleID:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_category, a3);
    [v5 addObserver:v8];
    [(SBLeafIcon *)v8 addIconDataSource:v5];
    [(SBIcon *)v8 setGridSizeClass:@"SBHIconGridSizeClassSmall"];
  }

  return v8;
}

- (BOOL)isCategoryIcon
{
  return 1;
}

- (int64_t)labelAccessoryType
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodCategoryIcon;
  int64_t result = [(SBLeafIcon *)&v3 labelAccessoryType];
  if (result == 1) {
    return 0;
  }
  return result;
}

- (void)categoryDidUpdate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
}

- (SBHLibraryCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
}

@end