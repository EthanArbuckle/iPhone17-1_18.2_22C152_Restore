@interface TUIImageModel
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoaded;
- (CGSize)size;
- (NSString)urlString;
- (NSURL)baseURL;
- (TUIIdentifier)identifier;
- (TUIImageModel)initWithIdentifier:(id)a3 image:(id)a4 size:(CGSize)a5 renderMode:(int64_t)a6 alignmentRectInsets:(UIEdgeInsets)a7;
- (TUIImageModel)initWithIdentifier:(id)a3 urlString:(id)a4 baseURL:(id)a5 size:(CGSize)a6 renderMode:(int64_t)a7 alignmentRectInsets:(UIEdgeInsets)a8;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)image;
- (id)_configuredImage:(id)a3;
- (int64_t)renderMode;
- (void)loadImageFromResource:(id)a3 placeholderImage:(id)a4;
@end

@implementation TUIImageModel

- (TUIImageModel)initWithIdentifier:(id)a3 image:(id)a4 size:(CGSize)a5 renderMode:(int64_t)a6 alignmentRectInsets:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v17 = a3;
  id v18 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TUIImageModel;
  v19 = [(TUIImageModel *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_size.CGFloat width = width;
    v20->_size.CGFloat height = height;
    v20->_renderMode = a6;
    v20->_alignmentRectInsets.CGFloat top = top;
    v20->_alignmentRectInsets.CGFloat left = left;
    v20->_alignmentRectInsets.CGFloat bottom = bottom;
    v20->_alignmentRectInsets.CGFloat right = right;
    uint64_t v21 = [(TUIImageModel *)v20 _configuredImage:v18];
    image = v20->_image;
    v20->_image = (UIImage *)v21;

    v20->_isLoaded = 1;
  }

  return v20;
}

- (TUIImageModel)initWithIdentifier:(id)a3 urlString:(id)a4 baseURL:(id)a5 size:(CGSize)a6 renderMode:(int64_t)a7 alignmentRectInsets:(UIEdgeInsets)a8
{
  CGFloat right = a8.right;
  CGFloat bottom = a8.bottom;
  CGFloat left = a8.left;
  CGFloat top = a8.top;
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUIImageModel;
  v22 = [(TUIImageModel *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_urlString, a4);
    objc_storeStrong((id *)&v23->_baseURL, a5);
    v23->_size.CGFloat width = width;
    v23->_size.CGFloat height = height;
    v23->_renderMode = a7;
    v23->_alignmentRectInsets.CGFloat top = top;
    v23->_alignmentRectInsets.CGFloat left = left;
    v23->_alignmentRectInsets.CGFloat bottom = bottom;
    v23->_alignmentRectInsets.CGFloat right = right;
  }

  return v23;
}

- (void)loadImageFromResource:(id)a3 placeholderImage:(id)a4
{
  if (!self->_isLoaded)
  {
    id v6 = a4;
    id v7 = a3;
    id v15 = [v7 imageContentWithOptions:1];
    v8 = [v15 image];
    id v9 = [v8 newImage];
    v10 = v9;
    if (v9) {
      v11 = v9;
    }
    else {
      v11 = v6;
    }
    id v12 = v11;

    v13 = [(TUIImageModel *)self _configuredImage:v12];

    image = self->_image;
    self->_image = v13;

    LOBYTE(v13) = [v7 isImageLoaded];
    self->_isLoaded = (char)v13;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    id v7 = TUIDynamicCast(v6, v5);
  }
  return self == a3;
}

- (id)_configuredImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    if (self->_size.width > 0.0)
    {
      uint64_t v6 = v4;
      if (self->_size.height > 0.0)
      {
        [v4 size];
        BOOL v9 = v8 == self->_size.width && v7 == self->_size.height;
        uint64_t v6 = v5;
        if (!v9)
        {
          uint64_t v6 = [v5 imageByPreparingThumbnailOfSize:];
        }
      }
    }
    if ([v5 renderingMode] != self->_renderMode)
    {
      uint64_t v10 = [v6 imageWithRenderingMode:];

      uint64_t v6 = (void *)v10;
    }
    float64x2_t v11 = *(float64x2_t *)&self->_alignmentRectInsets.top;
    float64x2_t v12 = *(float64x2_t *)&self->_alignmentRectInsets.bottom;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v12, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) == 0)
    {
      uint64_t v13 = [v6 imageWithAlignmentRectInsets:*(_OWORD *)&v11, *(_OWORD *)&v12];

      uint64_t v6 = (void *)v13;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)renderMode
{
  return self->_renderMode;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end