@interface AEAnnotationTwitterWeiboActivityItemProvider
- (id)expandedItemProviders;
- (id)supportedActivityTypes;
- (id)text;
- (unint64_t)characterLimit;
@end

@implementation AEAnnotationTwitterWeiboActivityItemProvider

- (id)supportedActivityTypes
{
  v4[0] = UIActivityTypePostToTwitter;
  v4[1] = UIActivityTypePostToWeibo;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (unint64_t)characterLimit
{
  v3 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  unsigned int v4 = [v3 isStoreAsset];

  if (!v4) {
    return 138;
  }
  v5 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v6 = [v5 storeShortURL];
  if (v6)
  {
    v7 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
    v8 = [v7 storeShortURL];
    v9 = [v8 absoluteString];
  }
  else
  {
    v9 = &stru_2CE418;
  }

  v11 = IMCommonCoreBundle();
  v12 = [v11 localizedStringForKey:@"%@ %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  id v13 = [objc_alloc((Class)NSString) initWithFormat:v12, &stru_2CE418, v9];
  id v14 = [v13 length];
  id v15 = [(__CFString *)v9 length];
  uint64_t v16 = 138;
  if (!v15) {
    uint64_t v16 = 113;
  }
  unint64_t v10 = v16 - (void)v14;

  return v10;
}

- (id)text
{
  v15.receiver = self;
  v15.super_class = (Class)AEAnnotationTwitterWeiboActivityItemProvider;
  v3 = [(AEAnnotationSocialActivityItemProvider *)&v15 text];
  unsigned int v4 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  unsigned int v5 = [v4 isStoreAsset];

  if (v5)
  {
    v6 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
    v7 = [v6 storeShortURL];
    if (v7)
    {
      v8 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      v9 = [v8 storeShortURL];
      unint64_t v10 = [v9 absoluteString];
    }
    else
    {
      unint64_t v10 = &stru_2CE418;
    }

    v11 = IMCommonCoreBundle();
    v12 = [v11 localizedStringForKey:@"%@ %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v3, v10);

    v3 = (void *)v13;
  }

  return v3;
}

- (id)expandedItemProviders
{
  v3 = [(AEAnnotationTwitterWeiboActivityItemProvider *)self supportedActivityTypes];
  unsigned int v4 = +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2D734;
  v13[3] = &unk_2C4B10;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2D73C;
  v12[3] = &unk_2C4B38;
  v12[4] = self;
  unsigned int v5 = [[IMBlockActivityItemPlusThumbnailProvider alloc] initWithUTI:@"public.plain-text" resolutionBlock:v13 thumbnailResolutionBlock:v12];
  [(IMBlockActivityItemProvider *)v5 setSupportedActivityTypes:v3];
  [v4 addObject:v5];
  v6 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  unsigned int v7 = [v6 isStoreAsset];

  if (v7)
  {
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2D78C;
    v11[3] = &unk_2C4B10;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2D818;
    v10[3] = &unk_2C4B38;
    v8 = [[IMBlockActivityItemPlusThumbnailProvider alloc] initWithUTI:@"public.url" resolutionBlock:v11 thumbnailResolutionBlock:v10];
    [(IMBlockActivityItemProvider *)v8 setSupportedActivityTypes:v3];
    [v4 addObject:v8];
  }

  return v4;
}

@end