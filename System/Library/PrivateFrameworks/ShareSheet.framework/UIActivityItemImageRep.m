@interface UIActivityItemImageRep
+ (id)activityItemImageRepWithAsset:(id)a3 thumbnailProvider:(id)a4 dataProvider:(id)a5;
- (id)asset;
- (id)data;
- (id)dataProvider;
- (id)thumbnail;
- (id)thumbnailProvider;
- (void)setAsset:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setThumbnailProvider:(id)a3;
@end

@implementation UIActivityItemImageRep

+ (id)activityItemImageRepWithAsset:(id)a3 thumbnailProvider:(id)a4 dataProvider:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(UIActivityItemImageRep);
  [(UIActivityItemImageRep *)v10 setAsset:v9];

  [(UIActivityItemImageRep *)v10 setThumbnailProvider:v8];
  [(UIActivityItemImageRep *)v10 setDataProvider:v7];

  return v10;
}

- (id)thumbnail
{
  return (id)(*((uint64_t (**)(void))self->_thumbnailProvider + 2))();
}

- (id)data
{
  return (id)(*((uint64_t (**)(void))self->_dataProvider + 2))();
}

- (id)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (id)thumbnailProvider
{
  return self->_thumbnailProvider;
}

- (void)setThumbnailProvider:(id)a3
{
}

- (id)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataProvider, 0);
  objc_storeStrong(&self->_thumbnailProvider, 0);
  objc_storeStrong(&self->_asset, 0);
}

@end