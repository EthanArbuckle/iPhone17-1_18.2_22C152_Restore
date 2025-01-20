@interface _TUICachedMediaBackdropImageResource
+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResource:(id)a5;
+ (id)unsizedKeyForContentsScale:(double)a3 imageResource:(id)a4;
- (_TUICachedMediaBackdropImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8;
- (id)debugFunctionalDescription;
- (id)sizedKey;
- (id)unsizedKey;
- (void)applyToImage:(id)a3 completion:(id)a4;
@end

@implementation _TUICachedMediaBackdropImageResource

- (_TUICachedMediaBackdropImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8
{
  v9.receiver = self;
  v9.super_class = (Class)_TUICachedMediaBackdropImageResource;
  result = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v9, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", a3, a4, a5, a8, a6.width, a6.height, a7);
  if (result) {
    result->_operationLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)debugFunctionalDescription
{
  v2 = [(_TUICachedPipelineImageResource *)self imageResource];
  v3 = [v2 debugFunctionalDescription];
  v4 = +[NSString stringWithFormat:@"(%@).MediaBackdropSnapshot", v3];

  return v4;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_TUICachedImageResource *)self contentsScale];
  double v9 = v8;
  [(_TUICachedImageResource *)self naturalSize];
  double v11 = v9 * v10;
  [(_TUICachedImageResource *)self naturalSize];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_A7550;
  v15[3] = &unk_2546A8;
  double v13 = v9 * v12;
  v15[4] = self;
  id v16 = v6;
  double v17 = v9;
  id v14 = v6;
  +[TUIMediaBackdropSnapshotRenderer renderWithContent:size:contentScale:completionHandler:](TUIMediaBackdropSnapshotRenderer, "renderWithContent:size:contentScale:completionHandler:", v7, v15, v11, v13, v9);
}

- (id)sizedKey
{
  v13.receiver = self;
  v13.super_class = (Class)_TUICachedMediaBackdropImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v13 sizedKey];
  v4 = [_TUICachedImageFilterInfo alloc];
  [(_TUICachedImageResource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  [(_TUICachedImageResource *)self contentsScale];
  double v10 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v4, "initWithFilter:naturalSize:contentsScale:", 0, v6, v8, v9);
  double v11 = [v3 cacheKeyWithFilterInfo:v10];

  return v11;
}

- (id)unsizedKey
{
  v9.receiver = self;
  v9.super_class = (Class)_TUICachedMediaBackdropImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v9 unsizedKey];
  v4 = [_TUICachedImageFilterInfo alloc];
  [(_TUICachedImageResource *)self contentsScale];
  double v6 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v4, "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, v5);
  double v7 = [v3 cacheKeyWithFilterInfo:v6];

  return v7;
}

+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResource:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  double v8 = [a5 sizedKey];
  objc_super v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, width, height, a4);
  double v10 = [v8 cacheKeyWithFilterInfo:v9];

  return v10;
}

+ (id)unsizedKeyForContentsScale:(double)a3 imageResource:(id)a4
{
  double v5 = [a4 unsizedKey];
  double v6 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, a3);
  double v7 = [v5 cacheKeyWithFilterInfo:v6];

  return v7;
}

@end