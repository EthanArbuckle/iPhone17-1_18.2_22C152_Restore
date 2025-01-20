@interface AEAnnotationFacebookActivityItemProvider
- (id)expandedItemProviders;
- (id)supportedActivityTypes;
- (unint64_t)characterLimit;
@end

@implementation AEAnnotationFacebookActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v4 = UIActivityTypePostToFacebook;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (unint64_t)characterLimit
{
  return 63000;
}

- (id)expandedItemProviders
{
  v3 = +[NSMutableArray arrayWithCapacity:3];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2CF50;
  v18[3] = &unk_2C4B10;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_2CFA8;
  v17[3] = &unk_2C4B38;
  v17[4] = self;
  UIActivityType v4 = [[IMBlockActivityItemPlusThumbnailProvider alloc] initWithUTI:@"public.plain-text" resolutionBlock:v18 thumbnailResolutionBlock:v17];
  v5 = [(AEAnnotationFacebookActivityItemProvider *)self supportedActivityTypes];
  [(IMBlockActivityItemProvider *)v4 setSupportedActivityTypes:v5];

  [v3 addObject:v4];
  v15[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_2CFF8;
  v16[3] = &unk_2C4B10;
  v16[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2D108;
  v15[3] = &unk_2C4B38;
  v6 = [[IMBlockActivityItemPlusThumbnailProvider alloc] initWithUTI:@"public.html" resolutionBlock:v16 thumbnailResolutionBlock:v15];
  v7 = [(AEAnnotationFacebookActivityItemProvider *)self supportedActivityTypes];
  [(IMBlockActivityItemProvider *)v6 setSupportedActivityTypes:v7];

  [v3 addObject:v6];
  v8 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  unsigned int v9 = [v8 isStoreAsset];

  if (v9)
  {
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2D158;
    v14[3] = &unk_2C4B10;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_2D1A8;
    v13[3] = &unk_2C4B38;
    v10 = [[IMBlockActivityItemPlusThumbnailProvider alloc] initWithUTI:@"public.url" resolutionBlock:v14 thumbnailResolutionBlock:v13];
    v11 = [(AEAnnotationFacebookActivityItemProvider *)self supportedActivityTypes];
    [(IMBlockActivityItemProvider *)v10 setSupportedActivityTypes:v11];

    [v3 addObject:v10];
  }

  return v3;
}

@end