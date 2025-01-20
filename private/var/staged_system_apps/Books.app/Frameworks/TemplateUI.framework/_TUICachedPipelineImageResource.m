@interface _TUICachedPipelineImageResource
- (BOOL)allowsMultipleUpdates;
- (TUIImageResource)imageResource;
- (_TUICachedPipelineImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8;
- (id)resource;
- (id)sizedKey;
- (id)unprocessedImageResource;
- (id)unsizedKey;
- (void)_updateWithContent:(id)a3;
- (void)applyToImage:(id)a3 completion:(id)a4;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)loadIntrinsicSize;
- (void)loadResource;
@end

@implementation _TUICachedPipelineImageResource

- (_TUICachedPipelineImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_TUICachedPipelineImageResource;
  v17 = -[_TUICachedImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:](&v20, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:", a3, a4, a5, width, height, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageResource, a8);
    [(TUIImageResource *)v18->_imageResource addObserver:v18];
  }

  return v18;
}

- (id)unprocessedImageResource
{
  return self->_imageResource;
}

- (id)resource
{
  return [(TUIImageResource *)self->_imageResource resource];
}

- (void)loadIntrinsicSize
{
}

- (BOOL)allowsMultipleUpdates
{
  return 1;
}

- (void)_updateWithContent:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_A5234;
  v3[3] = &unk_2545A8;
  v3[4] = self;
  [(_TUICachedPipelineImageResource *)self applyToImage:a3 completion:v3];
}

- (void)loadResource
{
  [(_TUICachedImageResource *)self loadLargestLoadedImageAsTemporary];
  v3 = [(TUIImageResource *)self->_imageResource loadImage];
  if (v3)
  {
    v4 = v3;
    [(_TUICachedPipelineImageResource *)self _updateWithContent:v3];
    v3 = v4;
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4 = [a3 imageContentWithOptions:1];
  [(_TUICachedPipelineImageResource *)self _updateWithContent:v4];
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = [v7 image];
  [v7 insets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  (*((void (**)(id, id, double, double, double, double))a4 + 2))(v6, v16, v9, v11, v13, v15);
}

- (id)sizedKey
{
  return [(TUIImageResource *)self->_imageResource sizedKey];
}

- (id)unsizedKey
{
  return [(TUIImageResource *)self->_imageResource unsizedKey];
}

- (TUIImageResource)imageResource
{
  return self->_imageResource;
}

- (void).cxx_destruct
{
}

@end