@interface _UIResizableImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_isResizable;
- (BOOL)_isSubimage;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3;
- (BOOL)_suppressesAccessibilityHairlineThickening;
- (BOOL)isEqual:(id)a3;
- (CGRect)_contentRectInPixels;
- (CGRect)_contentRectInPixelsApplyingInsets:(UIEdgeInsets)a3 emptySizeFallback:(id)a4;
- (CGRect)_contentStretchInPixels;
- (UIEdgeInsets)_subimageInsets;
- (UIEdgeInsets)capInsets;
- (_UIResizableImage)initWithCoder:(id)a3;
- (_UIResizableImage)initWithImage:(id)a3 capInsets:(UIEdgeInsets)a4;
- (id)_resizableImageWithCapMask:(int)a3;
- (int64_t)resizingMode;
- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4;
- (void)_setAlwaysStretches:(BOOL)a3;
- (void)_setCapInsets:(UIEdgeInsets)a3;
- (void)_setSubimageInsets:(UIEdgeInsets)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIResizableImage

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  return 1;
}

- (BOOL)_isResizable
{
  return 1;
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  if (*(unsigned char *)&self->_rImageFlags) {
    return 0;
  }
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self size];
  if (v6 - self->_capInsets.left - self->_capInsets.right > 1.0 && width != v6) {
    return 1;
  }
  if (height == v7) {
    return 0;
  }
  return v7 - self->_capInsets.top - self->_capInsets.bottom > 1.0;
}

- (BOOL)_isSubimage
{
  return (*(unsigned char *)&self->_rImageFlags >> 1) & 1;
}

- (CGRect)_contentStretchInPixels
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___UIResizableImage__contentStretchInPixels__block_invoke;
  v6[3] = &unk_1E52F1760;
  v6[4] = self;
  -[_UIResizableImage _contentRectInPixelsApplyingInsets:emptySizeFallback:](self, "_contentRectInPixelsApplyingInsets:emptySizeFallback:", v6, self->_capInsets.top, self->_capInsets.left, self->_capInsets.bottom, self->_capInsets.right);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_contentRectInPixelsApplyingInsets:(UIEdgeInsets)a3 emptySizeFallback:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v9 = (double (**)(void))a4;
  v10 = [(UIImage *)self content];
  [v10 sizeInPixels];
  double v13 = v12;
  double v14 = v11;
  if (v12 <= 0.0 || v11 <= 0.0)
  {
    if (v9)
    {
      double v21 = v9[2](v9);
      double v22 = v23;
      double v13 = v24;
      double v14 = v25;
    }
    else
    {
      double v21 = *MEMORY[0x1E4F1DAD8];
      double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
  }
  else
  {
    [v10 scale];
    double v16 = top * v15;
    double v17 = bottom * v15;
    double v18 = *MEMORY[0x1E4F1DAD8] + left * v15;
    double v19 = top * v15 + *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v20 = v13 - (left * v15 + right * v15);
    double v21 = fmax(v18, 0.0);
    double v22 = fmax(v19, 0.0);
    double v13 = fmax(v20, 0.0);
    double v14 = fmax(v14 - (v16 + v17), 0.0);
  }

  double v26 = v21;
  double v27 = v22;
  double v28 = v13;
  double v29 = v14;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v21.receiver = self;
    v21.super_class = (Class)_UIResizableImage;
    if ([(UIImage *)&v21 isEqual:v5])
    {
      [(_UIResizableImage *)self capInsets];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      [v5 capInsets];
      BOOL v17 = 0;
      if (v9 == v18 && v7 == v14 && v13 == v16 && v11 == v15)
      {
        int64_t v19 = [(_UIResizableImage *)self resizingMode];
        BOOL v17 = v19 == [v5 resizingMode];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_resizableImageWithCapMask:(int)a3
{
  char v3 = a3;
  [(_UIResizableImage *)self capInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIImage *)self alignmentRectInsets];
  long long v53 = 0u;
  long long v54 = 0u;
  double v17 = 0.0;
  if ((v3 & 1) == 0)
  {
    double v14 = 0.0;
    double v51 = 0.0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    double v50 = 0.0;
    if ((v3 & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  *((double *)&v53 + 1) = v14;
  double v51 = v8;
  double v8 = 0.0;
  if ((v3 & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  *(double *)&long long v53 = v13;
  double v17 = v13;
  double v50 = v6;
  double v6 = 0.0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    *((double *)&v54 + 1) = v16;
    double v18 = v12;
    double v12 = 0.0;
    goto LABEL_8;
  }
LABEL_7:
  double v16 = 0.0;
  double v18 = 0.0;
LABEL_8:
  double v48 = v16;
  double v49 = v14;
  double v47 = v17;
  if ((v3 & 8) != 0)
  {
    *(void *)&long long v54 = v15;
    uint64_t v45 = v15;
    double v19 = v10;
    double v10 = 0.0;
  }
  else
  {
    uint64_t v45 = 0;
    double v19 = 0.0;
  }
  double v20 = *MEMORY[0x1E4F1DAD8];
  double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIImage *)self size];
  double v22 = v8 + v20;
  double v23 = v6 + v21;
  double v25 = v24 - (v8 + v12);
  double v27 = v26 - (v6 + v10);
  v56.origin.CGFloat x = v22;
  v56.origin.CGFloat y = v23;
  v56.size.CGFloat width = v25;
  v56.size.CGFloat height = v27;
  if (CGRectIsEmpty(v56))
  {
    double v28 = 0;
  }
  else
  {
    [(UIImage *)self scale];
    double v30 = v29;
    CGAffineTransformMakeScale(&v52, v29, v29);
    v57.origin.CGFloat x = v22;
    v57.origin.CGFloat y = v23;
    v57.size.CGFloat width = v25;
    v57.size.CGFloat height = v27;
    CGRect v58 = CGRectApplyAffineTransform(v57, &v52);
    CGFloat x = v58.origin.x;
    CGFloat y = v58.origin.y;
    CGFloat width = v58.size.width;
    CGFloat height = v58.size.height;
    v35 = self;
    v36 = [(UIImage *)v35 CGImage];
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    v37 = CGImageCreateWithImageInRect(v36, v59);
    v38 = [[UIImage alloc] initWithCGImage:v37 scale:[(UIImage *)v35 imageOrientation] orientation:v30];
    CGImageRelease(v37);
    v39 = -[UIImage resizableImageWithCapInsets:](v38, "resizableImageWithCapInsets:", v50, v51, v19, v18);
    double v28 = v39;
    if ((void)v53) {
      BOOL v40 = 0;
    }
    else {
      BOOL v40 = *((void *)&v53 + 1) == 0;
    }
    if (v40 && (void)v54 == 0 && *((void *)&v54 + 1) == 0)
    {
      uint64_t v43 = objc_msgSend(v39, "imageWithAlignmentRectInsets:", v47, v49, v46, v48);

      double v28 = (void *)v43;
    }
    if (*(unsigned char *)&v35->_rImageFlags) {
      [v28 _setAlwaysStretches:1];
    }
  }
  return v28;
}

- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIResizableImage;
  [(UIImage *)&v8 _configureImage:v6 assumePreconfigured:v4];
  if ([v6 _isResizable])
  {
    [(_UIResizableImage *)self capInsets];
    objc_msgSend(v6, "_setCapInsets:");
    *((unsigned char *)v6 + 208) = *((unsigned char *)v6 + 208) & 0xFD | *(unsigned char *)&self->_rImageFlags & 2;
    long long v7 = *(_OWORD *)&self->_subimageInsets.bottom;
    *((_OWORD *)v6 + 11) = *(_OWORD *)&self->_subimageInsets.top;
    *((_OWORD *)v6 + 12) = v7;
    [v6 _setAlwaysStretches:*(unsigned char *)&self->_rImageFlags & 1];
  }
}

- (void)_setAlwaysStretches:(BOOL)a3
{
  *(unsigned char *)&self->_rImageFlags = *(unsigned char *)&self->_rImageFlags & 0xFE | a3;
}

- (UIEdgeInsets)capInsets
{
  double top = self->_capInsets.top;
  double left = self->_capInsets.left;
  double bottom = self->_capInsets.bottom;
  double right = self->_capInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setCapInsets:(UIEdgeInsets)a3
{
  self->_capInsets = a3;
}

- (_UIResizableImage)initWithImage:(id)a3 capInsets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v9.receiver = self;
  v9.super_class = (Class)_UIResizableImage;
  UIEdgeInsets result = [(UIImage *)&v9 _initWithOtherImage:a3];
  if (result)
  {
    result->_capInsets.CGFloat top = top;
    result->_capInsets.CGFloat left = left;
    result->_capInsets.CGFloat bottom = bottom;
    result->_capInsets.CGFloat right = right;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIResizableImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIResizableImage;
  double v5 = [(UIImage *)&v15 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    p_CGFloat top = &v5->_capInsets.top;
    [v4 decodeUIEdgeInsetsForKey:@"UICapInsets"];
    *(void *)p_CGFloat top = v8;
    v6->_capInsets.CGFloat left = v9;
    v6->_capInsets.CGFloat bottom = v10;
    v6->_capInsets.CGFloat right = v11;
    if ([v4 containsValueForKey:@"UILeftCapWidth"])
    {
      v6->_capInsets.CGFloat left = (double)[v4 decodeIntegerForKey:@"UILeftCapWidth"];
      *p_CGFloat top = (double)[v4 decodeIntegerForKey:@"UITopCapHeight"];
      [(UIImage *)v6 size];
      v6->_capInsets.CGFloat right = v12 - v6->_capInsets.left + -1.0;
      [(UIImage *)v6 size];
      v6->_capInsets.CGFloat bottom = v13 - *p_top + -1.0;
    }
    *(unsigned char *)&v6->_rImageFlags = *(unsigned char *)&v6->_rImageFlags & 0xFE | ([v4 decodeIntForKey:@"UIResizingMode"] != 0);
    *(_OWORD *)&v6->_subimageInsets.CGFloat top = 0u;
    *(_OWORD *)&v6->_subimageInsets.CGFloat bottom = 0u;
    *(unsigned char *)&v6->_rImageFlags &= ~2u;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIResizableImage;
  id v4 = a3;
  [(UIImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UICapInsets", self->_capInsets.top, self->_capInsets.left, self->_capInsets.bottom, self->_capInsets.right, v5.receiver, v5.super_class);
  [v4 encodeInt:*(unsigned char *)&self->_rImageFlags & 1 forKey:@"UIResizingMode"];
}

- (void)_setSubimageInsets:(UIEdgeInsets)a3
{
  if (a3.top == 0.0 && a3.left == 0.0 && a3.right == 0.0 && a3.bottom == 0.0) {
    char v6 = 0;
  }
  else {
    char v6 = 2;
  }
  *(unsigned char *)&self->_rImageFlags = *(unsigned char *)&self->_rImageFlags & 0xFD | v6;
  self->_subimageInsets = a3;
}

- (UIEdgeInsets)_subimageInsets
{
  double top = self->_subimageInsets.top;
  double left = self->_subimageInsets.left;
  double bottom = self->_subimageInsets.bottom;
  double right = self->_subimageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)resizingMode
{
  return *(unsigned char *)&self->_rImageFlags & 1;
}

- (CGRect)_contentRectInPixels
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___UIResizableImage__contentRectInPixels__block_invoke;
  v6[3] = &unk_1E52F1760;
  v6[4] = self;
  -[_UIResizableImage _contentRectInPixelsApplyingInsets:emptySizeFallback:](self, "_contentRectInPixelsApplyingInsets:emptySizeFallback:", v6, self->_subimageInsets.top, self->_subimageInsets.left, self->_subimageInsets.bottom, self->_subimageInsets.right);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

@end