@interface _TUICachedTintedImageResource
+ (id)sizedKeyForColor:(id)a3 imageResource:(id)a4;
+ (id)unsizedKeyForColor:(id)a3 imageResource:(id)a4;
- (UIColor)color;
- (_TUICachedTintedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 resource:(id)a6 color:(id)a7;
- (id)debugFunctionalDescription;
- (id)newImageResourceWithSize:(CGSize)a3;
- (id)sizedKey;
- (id)unsizedKey;
- (void)applyToImage:(id)a3 completion:(id)a4;
@end

@implementation _TUICachedTintedImageResource

- (id)debugFunctionalDescription
{
  v3 = [(_TUICachedPipelineImageResource *)self imageResource];
  v4 = [v3 debugFunctionalDescription];
  v5 = +[NSString stringWithFormat:@"(%@).tintColor(%@)", v4, self->_color];

  return v5;
}

- (_TUICachedTintedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 resource:(id)a6 color:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [v13 naturalSize];
  double v18 = v17;
  double v20 = v19;
  [v13 contentsScale];
  v26.receiver = self;
  v26.super_class = (Class)_TUICachedTintedImageResource;
  v22 = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v26, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", v16, v15, v14, v13, v18, v20, v21);

  if (v22)
  {
    uint64_t v23 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v12 CGColor]);
    color = v22->_color;
    v22->_color = (UIColor *)v23;
  }
  return v22;
}

+ (id)sizedKeyForColor:(id)a3 imageResource:(id)a4
{
  id v5 = a3;
  v6 = [a4 sizedKey];
  id v7 = v5;
  id v8 = [v7 CGColor];

  v9 = +[UIColor colorWithCGColor:v8];
  v10 = [v6 cacheKeyWithColor:v9];

  return v10;
}

+ (id)unsizedKeyForColor:(id)a3 imageResource:(id)a4
{
  id v5 = a3;
  v6 = [a4 unsizedKey];
  id v7 = v5;
  id v8 = [v7 CGColor];

  v9 = +[UIColor colorWithCGColor:v8];
  v10 = [v6 cacheKeyWithColor:v9];

  return v10;
}

- (id)sizedKey
{
  v6.receiver = self;
  v6.super_class = (Class)_TUICachedTintedImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v6 sizedKey];
  v4 = [v3 cacheKeyWithColor:self->_color];

  return v4;
}

- (id)unsizedKey
{
  v6.receiver = self;
  v6.super_class = (Class)_TUICachedTintedImageResource;
  v3 = [(_TUICachedPipelineImageResource *)&v6 unsizedKey];
  v4 = [v3 cacheKeyWithColor:self->_color];

  return v4;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v11 = a3;
  objc_super v6 = (void (**)(id, id))a4;
  id v7 = [v11 image];
  id v8 = [v7 newImage];
  v9 = [v8 tui_imageMaskWithColor:self->_color];

  if (v9) {
    id v10 = [objc_alloc((Class)BCUPurgeableImage) initWithImage:v9];
  }
  else {
    id v10 = 0;
  }
  [v11 insets];
  v6[2](v6, v10);
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._cache);
  id v7 = [(_TUICachedPipelineImageResource *)self imageResource];
  id v8 = [v7 newImageResourceWithSize:width, height];
  v9 = [WeakRetained imageResource:v8 tintedWithColor:self->_color];

  return v9;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_tintedImage, 0);
}

@end