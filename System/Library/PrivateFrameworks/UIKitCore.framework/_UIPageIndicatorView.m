@interface _UIPageIndicatorView
- (BOOL)_hasOngoingExpandTransition;
- (BOOL)_isDefaultSymbolImage;
- (BOOL)isActive;
- (BOOL)isInvalidated;
- (BOOL)supportsExpandedIndicator;
- (CAColorMatrix)activeVibrantColorMatrix;
- (CAColorMatrix)vibrantColorMatrix;
- (CGAffineTransform)contentTransform;
- (CGSize)_adjustedDefaultModeSize;
- (CGSize)_adjustedExpandedModeSize;
- (CGSize)defaultModeSize;
- (CGSize)expandedModeSize;
- (CGSize)sizeForImage:(id)a3 traits:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)activeIndicatorColor;
- (UIColor)indicatorColor;
- (UIEdgeInsets)_currentImageContentInsets;
- (UIImage)activeImage;
- (UIImage)image;
- (UIViewFloatAnimatableProperty)expandProgress;
- (_UIPageIndicatorImageView)imageView;
- (_UIPageIndicatorProgressView)progressView;
- (_UIPageIndicatorView)initWithCoder:(id)a3;
- (_UIPageIndicatorView)initWithFrame:(CGRect)a3;
- (double)currentExpandProgress;
- (double)imageDisplayScaleFactor;
- (float)currentProgress;
- (id)debugDescription;
- (int64_t)_transitionDirection;
- (int64_t)direction;
- (int64_t)mode;
- (int64_t)offsetDirection;
- (int64_t)page;
- (void)_updateImage;
- (void)_updateImageDisplayScaleOverride;
- (void)_updateIndicatorExpandProgress;
- (void)_updateProgressBar;
- (void)_updateVibrantColorMatrix;
- (void)invalidate;
- (void)layoutSubviews;
- (void)prepare;
- (void)setActive:(BOOL)a3;
- (void)setActiveImage:(id)a3;
- (void)setActiveIndicatorColor:(id)a3;
- (void)setActiveVibrantColorMatrix:(CAColorMatrix *)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setCurrentProgress:(float)a3;
- (void)setDefaultModeSize:(CGSize)a3;
- (void)setDirection:(int64_t)a3;
- (void)setExpandedModeSize:(CGSize)a3;
- (void)setImage:(id)a3;
- (void)setImageDisplayScaleFactor:(double)a3;
- (void)setIndicatorColor:(id)a3;
- (void)setMode:(int64_t)a3 direction:(int64_t)a4;
- (void)setPage:(int64_t)a3;
- (void)setSupportsExpandedIndicator:(BOOL)a3;
- (void)setVibrantColorMatrix:(CAColorMatrix *)a3;
@end

@implementation _UIPageIndicatorView

- (int64_t)page
{
  return self->_page;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setExpandedModeSize:(CGSize)a3
{
  self->_expandedModeSize = a3;
}

- (void)setDefaultModeSize:(CGSize)a3
{
  self->_defaultModeSize = a3;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)_UIPageIndicatorView;
  [(UIView *)&v26 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIPageIndicatorView *)self _currentImageContentInsets];
  -[UIView setFrame:](self->_progressView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  int64_t v15 = [(_UIPageIndicatorView *)self _transitionDirection];
  v16 = [(_UIPageIndicatorView *)self image];
  [(_UIPageIndicatorView *)self sizeForImage:v16 traits:0];
  double v18 = v17;
  double v20 = v19;

  double v21 = *MEMORY[0x1E4F1DAD8];
  double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  int64_t v23 = [(_UIPageIndicatorView *)self direction];
  double v24 = v21;
  double v25 = v22;
  switch(v23)
  {
    case 0:
      double v24 = v21;
      double v25 = v22;
      if (v15 == 1) {
        goto LABEL_5;
      }
      break;
    case 1:
      double v24 = v21;
      double v25 = v22;
      if (v15 == 2)
      {
LABEL_5:
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        double v24 = CGRectGetWidth(v27) - v18;
        double v25 = v22;
      }
      break;
    case 2:
      double v24 = v21;
      double v25 = v22;
      if (v15 == 1) {
        goto LABEL_9;
      }
      break;
    case 3:
      double v24 = v21;
      double v25 = v22;
      if (v15 == 2)
      {
LABEL_9:
        v28.origin.x = v4;
        v28.origin.y = v6;
        v28.size.width = v8;
        v28.size.height = v10;
        double v25 = CGRectGetHeight(v28) - v20;
        double v24 = v21;
      }
      break;
    default:
      break;
  }
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v18 * 0.5 + v24, v20 * 0.5 + v25);
  -[UIImageView setBounds:](self->_imageView, "setBounds:", v21, v22, v18, v20);
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)_transitionDirection
{
  if ([(_UIPageIndicatorView *)self _hasOngoingExpandTransition]) {
    return self->_offsetDirection;
  }
  else {
    return 0;
  }
}

- (BOOL)_hasOngoingExpandTransition
{
  double v3 = [(_UIPageIndicatorView *)self expandProgress];
  [v3 value];
  double v5 = v4;
  double v6 = [(_UIPageIndicatorView *)self expandProgress];
  [v6 presentationValue];
  BOOL v8 = v5 != v7;

  return v8;
}

- (UIEdgeInsets)_currentImageContentInsets
{
  v2 = [(_UIPageIndicatorView *)self imageView];
  double v3 = [v2 _currentImage];
  [v3 contentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)currentExpandProgress
{
  v2 = [(_UIPageIndicatorView *)self expandProgress];
  [v2 presentationValue];
  double v4 = fmax(fmin(v3, 1.0), 0.0);

  return v4;
}

- (UIViewFloatAnimatableProperty)expandProgress
{
  return self->_expandProgress;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(_UIPageIndicatorView *)self imageView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setMode:(int64_t)a3 direction:(int64_t)a4
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    self->_offsetDirection = a4;
    double v5 = 0.0;
    if (a3 == 1)
    {
      double v5 = 1.0;
      if (![(_UIPageIndicatorView *)self supportsExpandedIndicator])
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v8 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Cannot change the mode to expanded if the indicator does not support expanded indicators", buf, 2u);
          }
        }
        else
        {
          double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setMode_direction____s_category) + 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)double v9 = 0;
            _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Cannot change the mode to expanded if the indicator does not support expanded indicators", v9, 2u);
          }
        }
      }
    }
    double v6 = [(_UIPageIndicatorView *)self expandProgress];
    [v6 setValue:v5];

    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateProgressBar];
    [(_UIPageIndicatorView *)self _updateIndicatorExpandProgress];
  }
}

- (void)_updateIndicatorExpandProgress
{
  if ([(_UIPageIndicatorView *)self supportsExpandedIndicator])
  {
    [(_UIPageIndicatorView *)self currentExpandProgress];
    double v4 = v3;
    if ([(_UIPageIndicatorView *)self _isDefaultSymbolImage])
    {
      double v5 = [(_UIPageIndicatorView *)self imageView];
      [v5 setHidden:v4 != 0.0];

      double v6 = [(_UIPageIndicatorView *)self imageView];
      [v6 setAlpha:1.0];

      double v7 = [(_UIPageIndicatorView *)self progressView];
      [v7 setHidden:v4 == 0.0];

      double v8 = [(_UIPageIndicatorView *)self progressView];
      [v8 setAlpha:1.0];

      double v9 = [(_UIPageIndicatorView *)self progressView];
      double v10 = [v9 backgroundView];
      [v10 setAlpha:1.0];

      if (self->_active) {
        double v4 = 1.0;
      }
    }
    else
    {
      double v11 = [(_UIPageIndicatorView *)self imageView];
      [v11 setHidden:0];

      double v12 = [(_UIPageIndicatorView *)self imageView];
      [v12 setAlpha:1.0 - v4];

      double v13 = [(_UIPageIndicatorView *)self progressView];
      [v13 setHidden:0];

      double v14 = [(_UIPageIndicatorView *)self progressView];
      [v14 setAlpha:v4];

      if (self->_active) {
        double v15 = v4;
      }
      else {
        double v15 = 1.0;
      }
      v16 = [(_UIPageIndicatorView *)self progressView];
      double v17 = [v16 backgroundView];
      [v17 setAlpha:v15];

      if (self->_active) {
        double v4 = 1.0;
      }
    }
    id v19 = [(_UIPageIndicatorView *)self progressView];
    double v18 = [v19 filledView];
    [v18 setAlpha:v4];
  }
}

- (BOOL)supportsExpandedIndicator
{
  return self->_supportsExpandedIndicator;
}

- (void)setVibrantColorMatrix:(CAColorMatrix *)a3
{
  p_vibrantColorMatrix = &self->_vibrantColorMatrix;
  long long v6 = *(_OWORD *)&self->_vibrantColorMatrix.m33;
  v14[2] = *(_OWORD *)&self->_vibrantColorMatrix.m24;
  v14[3] = v6;
  v14[4] = *(_OWORD *)&self->_vibrantColorMatrix.m42;
  long long v7 = *(_OWORD *)&self->_vibrantColorMatrix.m15;
  v14[0] = *(_OWORD *)&self->_vibrantColorMatrix.m11;
  v14[1] = v7;
  long long v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  long long v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  if (!_UICAColorMatrixIsEqualToCAColorMatrix((float *)v14, (float *)v13, 0.0))
  {
    *(_OWORD *)&p_vibrantColorMatrix->m11 = *(_OWORD *)&a3->m11;
    long long v10 = *(_OWORD *)&a3->m15;
    long long v11 = *(_OWORD *)&a3->m24;
    long long v12 = *(_OWORD *)&a3->m42;
    *(_OWORD *)&p_vibrantColorMatrix->m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&p_vibrantColorMatrix->m42 = v12;
    *(_OWORD *)&p_vibrantColorMatrix->m15 = v10;
    *(_OWORD *)&p_vibrantColorMatrix->m24 = v11;
    [(_UIPageIndicatorView *)self _updateVibrantColorMatrix];
  }
}

- (void)setIndicatorColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_indicatorColor != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_indicatorColor, a3);
    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateProgressBar];
    double v5 = v6;
  }
}

- (void)setActiveVibrantColorMatrix:(CAColorMatrix *)a3
{
  p_activeVibrantColorMatrix = &self->_activeVibrantColorMatrix;
  long long v6 = *(_OWORD *)&self->_activeVibrantColorMatrix.m33;
  v14[2] = *(_OWORD *)&self->_activeVibrantColorMatrix.m24;
  v14[3] = v6;
  v14[4] = *(_OWORD *)&self->_activeVibrantColorMatrix.m42;
  long long v7 = *(_OWORD *)&self->_activeVibrantColorMatrix.m15;
  v14[0] = *(_OWORD *)&self->_activeVibrantColorMatrix.m11;
  v14[1] = v7;
  long long v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  long long v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  if (!_UICAColorMatrixIsEqualToCAColorMatrix((float *)v14, (float *)v13, 0.0))
  {
    *(_OWORD *)&p_activeVibrantColorMatrix->m11 = *(_OWORD *)&a3->m11;
    long long v10 = *(_OWORD *)&a3->m15;
    long long v11 = *(_OWORD *)&a3->m24;
    long long v12 = *(_OWORD *)&a3->m42;
    *(_OWORD *)&p_activeVibrantColorMatrix->m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&p_activeVibrantColorMatrix->m42 = v12;
    *(_OWORD *)&p_activeVibrantColorMatrix->m15 = v10;
    *(_OWORD *)&p_activeVibrantColorMatrix->m24 = v11;
    [(_UIPageIndicatorView *)self _updateVibrantColorMatrix];
  }
}

- (void)setActiveIndicatorColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_activeIndicatorColor != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_activeIndicatorColor, a3);
    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateProgressBar];
    double v5 = v6;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateProgressBar];
    [(_UIPageIndicatorView *)self _updateVibrantColorMatrix];
    [(_UIPageIndicatorView *)self _updateIndicatorExpandProgress];
  }
}

- (void)_updateVibrantColorMatrix
{
  v27[1] = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  if ([(_UIPageIndicatorView *)self isActive]) {
    [(_UIPageIndicatorView *)self activeVibrantColorMatrix];
  }
  else {
    [(_UIPageIndicatorView *)self vibrantColorMatrix];
  }
  long long v19 = v24;
  long long v20 = v25;
  long long v21 = v26;
  long long v17 = v22;
  long long v18 = v23;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  v16[3] = v3;
  v16[4] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  v16[0] = *MEMORY[0x1E4F39AD8];
  v16[1] = v4;
  if (_UICAColorMatrixIsEqualToCAColorMatrix((float *)&v17, (float *)v16, 0.0))
  {
    double v5 = [(_UIPageIndicatorView *)self imageView];
    long long v6 = [v5 layer];
    [v6 setFilters:0];
  }
  else
  {
    long long v19 = v24;
    long long v20 = v25;
    long long v21 = v26;
    long long v17 = v22;
    long long v18 = v23;
    double v5 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v17];
    long long v7 = [(_UIPageIndicatorView *)self imageView];
    long long v8 = [v7 layer];
    long long v9 = [v8 filters];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      long long v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
      v27[0] = v11;
      long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      double v13 = [(_UIPageIndicatorView *)self imageView];
      double v14 = [v13 layer];
      [v14 setFilters:v12];
    }
    long long v6 = [(_UIPageIndicatorView *)self imageView];
    double v15 = [v6 layer];
    [v15 setValue:v5 forKeyPath:@"filters.vibrantColorMatrix.inputColorMatrix"];
  }
}

- (void)_updateProgressBar
{
  long long v3 = [(_UIPageIndicatorView *)self indicatorColor];
  long long v4 = [(_UIPageIndicatorView *)self progressView];
  double v5 = [v4 backgroundView];
  [v5 setBackgroundColor:v3];

  long long v6 = [(_UIPageIndicatorView *)self activeIndicatorColor];
  long long v7 = [(_UIPageIndicatorView *)self progressView];
  long long v8 = [v7 filledView];
  [v8 setBackgroundColor:v6];

  id v9 = [(_UIPageIndicatorView *)self progressView];
  [v9 setNeedsLayout];
}

- (_UIPageIndicatorProgressView)progressView
{
  return self->_progressView;
}

- (void)_updateImage
{
  if (![(_UIPageIndicatorView *)self isActive] || [(_UIPageIndicatorView *)self mode])
  {
    int v3 = 0;
LABEL_4:
    long long v4 = [(_UIPageIndicatorView *)self image];
    double v5 = 0;
    int v6 = 0;
    int v7 = 1;
    goto LABEL_5;
  }
  uint64_t v12 = [(_UIPageIndicatorView *)self activeImage];
  if (!v12)
  {
    int v3 = 1;
    goto LABEL_4;
  }
  double v5 = (void *)v12;
  long long v4 = [(_UIPageIndicatorView *)self activeImage];
  int v7 = 0;
  int v3 = 1;
  int v6 = 1;
LABEL_5:
  long long v8 = [(_UIPageIndicatorView *)self imageView];
  [v8 setImage:v4];

  if (!v7)
  {
    if (!v6) {
      goto LABEL_7;
    }
LABEL_10:

    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

  if (v6) {
    goto LABEL_10;
  }
LABEL_7:
  if (v3)
  {
LABEL_8:

    uint64_t v9 = [(_UIPageIndicatorView *)self activeIndicatorColor];
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v9 = [(_UIPageIndicatorView *)self indicatorColor];
LABEL_12:
  uint64_t v10 = (void *)v9;
  long long v11 = [(_UIPageIndicatorView *)self imageView];
  [v11 setTintColor:v10];

  id v13 = [(_UIPageIndicatorView *)self imageView];
  [v13 setNeedsLayout];
}

- (_UIPageIndicatorImageView)imageView
{
  return self->_imageView;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIColor)activeIndicatorColor
{
  return self->_activeIndicatorColor;
}

- (UIImage)activeImage
{
  return self->_activeImage;
}

- (BOOL)isInvalidated
{
  return self->_page == -1;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (CGSize)sizeForImage:(id)a3 traits:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(_UIPageIndicatorView *)self imageView];
  [v8 sizeForImage:v7 traits:v6];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)invalidate
{
  self->_page = -1;
  self->_currentProgress = 0.0;
  [(_UIPageIndicatorView *)self setMode:0 direction:0];
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateIndicatorExpandProgress];
    double v5 = v6;
  }
}

- (void)setActiveImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_activeImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_activeImage, a3);
    [(_UIPageIndicatorView *)self _updateImage];
    [(_UIPageIndicatorView *)self _updateIndicatorExpandProgress];
    double v5 = v6;
  }
}

- (void)setSupportsExpandedIndicator:(BOOL)a3
{
  if (self->_supportsExpandedIndicator != a3)
  {
    BOOL v3 = a3;
    self->_supportsExpandedIndicator = a3;
    -[UIImageView _setSuppressPixelAlignment:](self->_imageView, "_setSuppressPixelAlignment:");
    if (v3)
    {
      double v5 = [_UIPageIndicatorProgressView alloc];
      id v6 = -[_UIPageIndicatorProgressView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      progressView = self->_progressView;
      self->_progressView = v6;

      [(_UIPageIndicatorProgressView *)self->_progressView setIndicatorView:self];
      [(UIView *)self insertSubview:self->_progressView atIndex:0];
      [(_UIPageIndicatorView *)self _updateProgressBar];
      [(_UIPageIndicatorView *)self _updateIndicatorExpandProgress];
    }
    else
    {
      [(UIView *)self->_progressView removeFromSuperview];
      long long v8 = self->_progressView;
      self->_progressView = 0;

      double v9 = [(_UIPageIndicatorView *)self imageView];
      [v9 setHidden:0];

      id v10 = [(_UIPageIndicatorView *)self imageView];
      [v10 setAlpha:1.0];
    }
  }
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (_UIPageIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorView;
  BOOL v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v4 = v3;
  if (v3) {
    [(_UIPageIndicatorView *)v3 prepare];
  }
  return v4;
}

- (void)prepare
{
  v19[1] = *MEMORY[0x1E4F143B8];
  [(_UIPageIndicatorView *)self setPage:-1];
  [(UIView *)self setMaximumContentSizeCategory:@"UICTContentSizeCategoryXXL"];
  BOOL v3 = [_UIPageIndicatorImageView alloc];
  long long v4 = -[_UIPageIndicatorImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  [(UIView *)self->_imageView setMaximumContentSizeCategory:@"UICTContentSizeCategoryXXL"];
  [(_UIPageIndicatorImageView *)self->_imageView setIndicatorView:self];
  [(UIView *)self addSubview:self->_imageView];
  objc_super v6 = (long long *)MEMORY[0x1E4F39AD8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v7;
  long long v9 = v6[2];
  long long v8 = v6[3];
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v9;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v8;
  long long v10 = *v6;
  long long v11 = v6[1];
  *(_OWORD *)&self->_vibrantColorMatrix.m11 = *v6;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v11;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m33 = v8;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m42 = v7;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m15 = v11;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m24 = v9;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m11 = v10;
  self->_imageDisplayScaleFactor = 1.0;
  double v12 = (UIViewFloatAnimatableProperty *)objc_opt_new();
  expandProgress = self->_expandProgress;
  self->_expandProgress = v12;

  [(UIViewFloatAnimatableProperty *)self->_expandProgress setValue:0.0];
  objc_initWeak(&location, self);
  double v14 = [(_UIPageIndicatorView *)self expandProgress];
  v19[0] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __31___UIPageIndicatorView_prepare__block_invoke;
  v16[3] = &unk_1E52DC308;
  objc_copyWeak(&v17, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v15 presentationValueChangedCallback:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (int64_t)mode
{
  return self->_mode;
}

- (CAColorMatrix)activeVibrantColorMatrix
{
  long long v3 = *(_OWORD *)&self[8].m31;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[8].m22;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[8].m35;
  long long v4 = *(_OWORD *)&self[8].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[7].m44;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (CAColorMatrix)vibrantColorMatrix
{
  long long v3 = *(_OWORD *)&self[7].m31;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[7].m22;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[7].m35;
  long long v4 = *(_OWORD *)&self[7].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[6].m44;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (_UIPageIndicatorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorView;
  long long v3 = [(UIView *)&v6 initWithCoder:a3];
  long long v4 = v3;
  if (v3) {
    [(_UIPageIndicatorView *)v3 prepare];
  }
  return v4;
}

- (CGAffineTransform)contentTransform
{
  CGSize result = (CGAffineTransform *)self->_imageView;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(UIView *)self->_imageView setTransform:v4];
}

- (void)setImageDisplayScaleFactor:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPageIndicatorView.m", 135, @"imageDisplayScaleFactor (%f) must be greater than 0.", *(void *)&a3);
  }
  if (self->_imageDisplayScaleFactor != a3)
  {
    self->_imageDisplayScaleFactor = a3;
    displayScaleTraitChangeRegistration = self->_displayScaleTraitChangeRegistration;
    if (fabs(a3 + -1.0) >= 2.22044605e-16)
    {
      if (!displayScaleTraitChangeRegistration)
      {
        v13[0] = objc_opt_class();
        long long v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        long long v8 = [(UIView *)self registerForTraitChanges:v7 withAction:sel__updateImageDisplayScaleOverride];
        long long v9 = self->_displayScaleTraitChangeRegistration;
        self->_displayScaleTraitChangeRegistration = v8;
      }
      [(_UIPageIndicatorView *)self _updateImageDisplayScaleOverride];
    }
    else
    {
      if (displayScaleTraitChangeRegistration)
      {
        -[UIView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
        objc_super v6 = self->_displayScaleTraitChangeRegistration;
        self->_displayScaleTraitChangeRegistration = 0;
      }
      id v12 = [(UIView *)self->_imageView traitOverrides];
      [v12 removeTrait:objc_opt_class()];
    }
  }
}

- (void)setCurrentProgress:(float)a3
{
  if (self->_currentProgress != a3)
  {
    self->_currentProgress = a3;
    id v3 = [(_UIPageIndicatorView *)self progressView];
    [v3 setNeedsLayout];
  }
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t page = self->_page;
  BOOL v6 = [(_UIPageIndicatorView *)self isInvalidated];
  [(UIView *)self center];
  uint64_t v8 = v7;
  [(UIView *)self bounds];
  v17.double width = v9;
  v17.double height = v10;
  long long v11 = NSStringFromCGSize(v17);
  [(UIView *)self transform];
  id v12 = NSStringFromCGAffineTransform(&transform);
  double v13 = [v3 stringWithFormat:@"<%@: %p>, page = %ld, invalidated = %d, position = %.2f, size = %@, transform = %@", v4, self, page, v6, v8, v11, v12];

  return v13;
}

- (void)_updateImageDisplayScaleOverride
{
  id v3 = [(UIView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;
  [(_UIPageIndicatorView *)self imageDisplayScaleFactor];
  double v7 = ceil(v5 * v6);

  id v8 = [(UIView *)self->_imageView traitOverrides];
  [v8 setDisplayScale:v7];
}

- (CGSize)_adjustedDefaultModeSize
{
  [(_UIPageIndicatorView *)self defaultModeSize];
  double v4 = v3;
  double v6 = v5;
  [(_UIPageIndicatorView *)self _currentImageContentInsets];
  double v9 = v4 - (v7 + v8);
  double v12 = v6 - (v10 + v11);
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (CGSize)_adjustedExpandedModeSize
{
  [(_UIPageIndicatorView *)self expandedModeSize];
  double v4 = v3;
  double v6 = v5;
  [(_UIPageIndicatorView *)self _currentImageContentInsets];
  double v9 = v4 - (v7 + v8);
  double v12 = v6 - (v10 + v11);
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (BOOL)_isDefaultSymbolImage
{
  double v3 = [(_UIPageIndicatorView *)self image];
  if ([v3 isSymbolImage])
  {
    double v4 = [(_UIPageIndicatorView *)self image];
    _UIImageName(v4);
    double v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    double v6 = v5;
    if (v5 == @"circlebadge.fill")
    {
      char v7 = 1;
    }
    else if (v5)
    {
      char v7 = [(__CFString *)v5 isEqual:@"circlebadge.fill"];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (float)currentProgress
{
  return self->_currentProgress;
}

- (CGSize)defaultModeSize
{
  double width = self->_defaultModeSize.width;
  double height = self->_defaultModeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)expandedModeSize
{
  double width = self->_expandedModeSize.width;
  double height = self->_expandedModeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)imageDisplayScaleFactor
{
  return self->_imageDisplayScaleFactor;
}

- (int64_t)offsetDirection
{
  return self->_offsetDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activeIndicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_displayScaleTraitChangeRegistration, 0);
}

@end