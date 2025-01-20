@interface SSPhotosFromAppSectionBuilder
+ (id)supportedBundleIds;
- (NSString)appBundleId;
- (id)buildButtonItem;
- (id)buildTitle;
- (int64_t)maxCardSections;
- (void)setAppBundleId:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation SSPhotosFromAppSectionBuilder

+ (id)supportedBundleIds
{
  if (supportedBundleIds_onceToken != -1) {
    dispatch_once(&supportedBundleIds_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)supportedBundleIds_bundleIDs;
  return v2;
}

void __51__SSPhotosFromAppSectionBuilder_supportedBundleIds__block_invoke()
{
  v0 = SSBundleIdentifiersForSyndicatedPhotos();
  v1 = (void *)[v0 mutableCopy];

  [v1 removeObject:@"com.apple.mobileslideshow"];
  v2 = (void *)supportedBundleIds_bundleIDs;
  supportedBundleIds_bundleIDs = (uint64_t)v1;
}

- (void)setSection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSPhotosFromAppSectionBuilder;
  id v4 = a3;
  [(SSSectionBuilder *)&v8 setSection:v4];
  v5 = objc_msgSend(v4, "results", v8.receiver, v8.super_class);

  v6 = [v5 firstObject];
  v7 = [v6 applicationBundleIdentifier];
  [(SSPhotosFromAppSectionBuilder *)self setAppBundleId:v7];
}

- (id)buildButtonItem
{
  v3 = [(SSSectionBuilder *)self queryContext];
  id v4 = [v3 searchEntities];
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [v5 searchString];
    if ([v6 length]) {
      [v5 searchString];
    }
    else {
    v7 = [v5 displayString];
    }
  }
  else
  {
    v7 = [v3 searchString];
  }
  objc_super v8 = objc_opt_new();
  v9 = [(SSPhotosFromAppSectionBuilder *)self appBundleId];
  [v8 setApplicationBundleIdentifier:v9];

  [v8 setSearchString:v7];
  v10 = [(id)objc_opt_class() searchInAppButtonItemWithCommand:v8];

  return v10;
}

- (id)buildTitle
{
  v3 = [(SSSectionBuilder *)self queryContext];
  id v4 = [v3 searchEntities];
  v5 = [v4 firstObject];
  char v6 = [v5 isPhotosEntitySearch];

  v7 = [(SSPhotosFromAppSectionBuilder *)self appBundleId];
  SSAppNameForBundleId(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) == 0)
  {
    v9 = v8;
    if (([v7 isEqualToString:@"com.apple.mobileslideshow"] & 1) == 0)
    {
      v10 = NSString;
      v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"PHOTOS_TITLE_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
      v9 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v8);
    }
  }
  v13 = [MEMORY[0x1E4F9A378] textWithString:v9];

  return v13;
}

- (int64_t)maxCardSections
{
  if (SSSnippetModernizationEnabled())
  {
    char v6 = self;
    v3 = &v6;
  }
  else
  {
    if (isMacOS()) {
      return 12;
    }
    v5 = self;
    v3 = &v5;
  }
  v3[1] = (SSPhotosFromAppSectionBuilder *)SSPhotosFromAppSectionBuilder;
  return (int64_t)objc_msgSendSuper2((objc_super *)v3, sel_maxCardSections, v5);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end