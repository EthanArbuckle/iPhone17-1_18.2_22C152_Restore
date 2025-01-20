@interface _BCPPTCacheManager
- (_BCPPTCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8;
- (id)describedImagesFromProductProfile:(id)a3;
- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5;
- (id)metadataForIdentifier:(id)a3;
- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7;
- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4;
- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)imageColorForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _BCPPTCacheManager

- (id)describedImagesFromProductProfile:(id)a3
{
  v3 = +[_BCPPTFlawlessImageEntry entry];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4
{
  id v10 = a4;
  v4 = +[_BCPPTFlawlessImageEntry entry];
  v5 = sub_1B7CC((uint64_t)v4);

  v6 = [v5 filePath];
  if (v6)
  {
    v7 = +[NSURL fileURLWithPath:v6];
  }
  else
  {
    v7 = 0;
  }
  id v8 = objc_retainBlock(v10);
  v9 = v8;
  if (v8) {
    (*((void (**)(id, void *))v8 + 2))(v8, v7);
  }
}

- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  double height = a4.height;
  double width = a4.width;
  id v7 = objc_alloc_init((Class)CALayer);
  -[_BCPPTImageSet imageColor]_0();
  id v8 = objc_claimAutoreleasedReturnValue();
  [v7 setBackgroundColor:[v8 CGColor]];

  [v7 setFrame:CGPointZero.x, CGPointZero.y, width, height];

  return v7;
}

- (_BCPPTCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8
{
  v9 = (_BCPPTCacheManager *)objc_alloc_init((Class)objc_opt_class());

  return v9;
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *))objc_retainBlock(a5);
  if (v7)
  {
    v5 = +[_BCPPTFlawlessImageEntry entry];
    v6 = sub_1B7CC((uint64_t)v5);
    v7[2](v7, v6);
  }
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7
{
  v9 = (void (**)(id, void *))objc_retainBlock(a7);
  if (v9)
  {
    id v7 = +[_BCPPTFlawlessImageEntry entry];
    id v8 = sub_1B7CC((uint64_t)v7);
    v9[2](v9, v8);
  }
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v4 = v5;
  }
}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))objc_retainBlock(a4);
  if (v5)
  {
    id v4 = -[_BCPPTImageSet imageColor]_0();
    v5[2](v5, v4);
  }
}

- (id)metadataForIdentifier:(id)a3
{
  return 0;
}

@end