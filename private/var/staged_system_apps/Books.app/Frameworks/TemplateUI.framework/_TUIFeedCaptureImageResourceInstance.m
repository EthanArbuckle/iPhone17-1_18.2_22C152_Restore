@interface _TUIFeedCaptureImageResourceInstance
- (BOOL)isImageLoaded;
- (BOOL)isImageLoading;
- (CGSize)naturalSize;
- (NSURL)url;
- (TUIImageResourceCacheKey)sizedKey;
- (TUIImageResourceCacheKey)unsizedKey;
- (TUIResource)resource;
- (_TUIFeedCaptureImageResourceInstance)initWithDictionary:(id)a3;
- (double)contentsScale;
- (id)debugFunctionalDescription;
- (id)imageContentWithOptions:(unint64_t)a3;
- (id)loadImage;
@end

@implementation _TUIFeedCaptureImageResourceInstance

- (_TUIFeedCaptureImageResourceInstance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_TUIFeedCaptureImageResourceInstance;
  v5 = [(_TUIFeedCaptureImageResourceInstance *)&v49 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"intrinsicSize"];
    uint64_t v7 = objc_opt_class();
    v8 = TUIDynamicCast(v7, v6);
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"width"];
    v11 = TUIDynamicCast(v9, v10);
    [v11 doubleValue];
    CGFloat v13 = v12;

    uint64_t v14 = objc_opt_class();
    v15 = [v8 objectForKeyedSubscript:@"height"];
    v16 = TUIDynamicCast(v14, v15);
    [v16 doubleValue];
    CGFloat v18 = v17;

    v5->_intrinsicSize.width = v13;
    v5->_intrinsicSize.height = v18;

    v19 = [v4 objectForKeyedSubscript:@"insets"];
    uint64_t v20 = objc_opt_class();
    v21 = TUIDynamicCast(v20, v19);
    uint64_t v22 = objc_opt_class();
    v23 = [v21 objectForKeyedSubscript:@"top"];
    v24 = TUIDynamicCast(v22, v23);
    [v24 doubleValue];
    CGFloat v26 = v25;

    uint64_t v27 = objc_opt_class();
    v28 = [v21 objectForKeyedSubscript:@"left"];
    v29 = TUIDynamicCast(v27, v28);
    [v29 doubleValue];
    CGFloat v31 = v30;

    uint64_t v32 = objc_opt_class();
    v33 = [v21 objectForKeyedSubscript:@"bottom"];
    v34 = TUIDynamicCast(v32, v33);
    [v34 doubleValue];
    CGFloat v36 = v35;

    uint64_t v37 = objc_opt_class();
    v38 = [v21 objectForKeyedSubscript:@"right"];
    v39 = TUIDynamicCast(v37, v38);
    [v39 doubleValue];
    CGFloat v41 = v40;

    v5->_insets.top = v26;
    v5->_insets.left = v31;
    v5->_insets.bottom = v36;
    v5->_insets.right = v41;

    v42 = +[NSUUID UUID];
    v43 = [v42 UUIDString];

    v44 = [[TUIImageResourceCacheKey alloc] initWithID:v43];
    unsizedKey = v5->_unsizedKey;
    v5->_unsizedKey = v44;

    uint64_t v46 = -[TUIImageResourceCacheKey cacheKeyWithSize:](v5->_unsizedKey, "cacheKeyWithSize:", v5->_intrinsicSize.width, v5->_intrinsicSize.height);
    sizedKey = v5->_sizedKey;
    v5->_sizedKey = (TUIImageResourceCacheKey *)v46;
  }
  return v5;
}

- (id)debugFunctionalDescription
{
  return &stru_257BF0;
}

- (TUIResource)resource
{
  return 0;
}

- (TUIImageResourceCacheKey)sizedKey
{
  return self->_sizedKey;
}

- (TUIImageResourceCacheKey)unsizedKey
{
  return self->_unsizedKey;
}

- (BOOL)isImageLoaded
{
  return 0;
}

- (BOOL)isImageLoading
{
  return 0;
}

- (NSURL)url
{
  return 0;
}

- (id)loadImage
{
  return 0;
}

- (id)imageContentWithOptions:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    id v4 = -[TUIImageContent initWithIntrinsicSize:flags:]([TUIImageContent alloc], "initWithIntrinsicSize:flags:", 0, self->_intrinsicSize.width, self->_intrinsicSize.height);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CGSize)naturalSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentsScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizedKey, 0);

  objc_storeStrong((id *)&self->_unsizedKey, 0);
}

@end