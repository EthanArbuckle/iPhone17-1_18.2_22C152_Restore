@interface SKUIStackedImageView
+ (SKUIStackedImageConfiguration)_configurationForSize:(SEL)a3;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (CGPoint)vanishingPoint;
- (MPUBorderDrawingCache)borderDrawingCache;
- (SKUIStackedImageView)initWithFrame:(CGRect)a3;
- (UIView)perspectiveTargetView;
- (int64_t)numberOfItemsInStackView:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBorderDrawingCache:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPerspectiveTargetView:(id)a3;
- (void)setVanishingPoint:(CGPoint)a3;
- (void)stackView:(id)a3 applyAttributesToItem:(id)a4 atIndex:(int64_t)a5;
- (void)stackView:(id)a3 didCreateItem:(id)a4;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SKUIStackedImageView

- (SKUIStackedImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackedImageView initWithFrame:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStackedImageView;
  v8 = -[SKUIStackedImageView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_stackDepth = 3;
    uint64_t v10 = SKUIMPUFoundationFramework();
    id v11 = SKUIWeakLinkedClassForString(&cfstr_Mpuborderedima.isa, v10);
    id v12 = objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Mpustackview.isa, v10));
    [(SKUIStackedImageView *)v9 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:itemClass:itemReuseIdentifier:", v11, @"0");
    stackView = v9->_stackView;
    v9->_stackView = (MPUStackView *)v13;

    [(MPUStackView *)v9->_stackView setDataSource:v9];
    [(MPUStackView *)v9->_stackView setForcesIntegralY:1];
    [(SKUIStackedImageView *)v9 addSubview:v9->_stackView];
  }
  return v9;
}

- (void)dealloc
{
  [(MPUStackView *)self->_stackView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIStackedImageView;
  [(SKUIStackedImageView *)&v3 dealloc];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = objc_opt_class();
  if (v5)
  {
    objc_msgSend(v5, "_configurationForSize:", width, height, 0);
    float v6 = 0.0 * (double)0;
  }
  else
  {
    float v6 = 0.0;
  }
  return floorf(v6);
}

- (UIView)perspectiveTargetView
{
  return (UIView *)[(MPUStackView *)self->_stackView perspectiveTargetView];
}

- (void)setBorderDrawingCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (MPUBorderDrawingCache *)a3;
  if (self->_borderDrawingCache != v5)
  {
    objc_storeStrong((id *)&self->_borderDrawingCache, a3);
    float v6 = [(MPUStackView *)self->_stackView items];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setBorderDrawingCache:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setImage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SKUIStackedImageView *)self image];

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SKUIStackedImageView;
    [(SKUIImageView *)&v15 setImage:v4];
    float v6 = [(MPUStackView *)self->_stackView items];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setImage:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPUStackView setBaseSize:](self->_stackView, "setBaseSize:");
  int64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  float v6 = objc_opt_class();
  if (v6)
  {
    objc_msgSend(v6, "_configurationForSize:", width, height);
    double v8 = *((double *)&v10 + 1);
    double v7 = *(double *)&v10;
  }
  else
  {
    int64_t v12 = 0;
    double v8 = 0.0;
    double v7 = 0.0;
    long long v10 = 0u;
    long long v11 = 0u;
  }
  -[MPUStackView setMaximumRelativeOffsetStep:](self->_stackView, "setMaximumRelativeOffsetStep:", v7, v8);
  [(MPUStackView *)self->_stackView setSizeInsetStep:v11];
  if (self->_stackDepth != v12)
  {
    self->_stackDepth = v12;
    [(MPUStackView *)self->_stackView reloadData];
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStackedImageView;
  -[SKUIImageView setImageSize:](&v9, sel_setImageSize_, width, height);
}

- (void)setPerspectiveTargetView:(id)a3
{
}

- (void)setVanishingPoint:(CGPoint)a3
{
}

- (void)updateForChangedDistanceFromVanishingPoint
{
}

- (CGPoint)vanishingPoint
{
  [(MPUStackView *)self->_stackView vanishingPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKUIStackedImageView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIStackedImageView;
    -[SKUIStackedImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(SKUIStackedImageView *)self setNeedsLayout];
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SKUIStackedImageView *)self center];
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SKUIStackedImageView;
    -[SKUIStackedImageView setCenter:](&v9, sel_setCenter_, x, y);
    [(SKUIStackedImageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SKUIImageView *)self imageSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v6 = [(SKUIStackedImageView *)self image];
    [v6 size];
  }
  stackView = self->_stackView;
  [(SKUIStackedImageView *)self bounds];
  SKUIImageRectForBounds();
  -[MPUStackView setFrame:](stackView, "setFrame:");
  [(MPUStackView *)self->_stackView updateForChangedDistanceFromVanishingPoint];
  v8.receiver = self;
  v8.super_class = (Class)SKUIStackedImageView;
  [(SKUIImageView *)&v8 layoutSubviews];
}

- (int64_t)numberOfItemsInStackView:(id)a3
{
  return self->_stackDepth;
}

- (void)stackView:(id)a3 applyAttributesToItem:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  borderConfiguration = self->_borderConfiguration;
  if (!borderConfiguration)
  {
    uint64_t v11 = SKUIMPUFoundationFramework();
    objc_super v12 = (MPUBorderConfiguration *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Mpuborderconfi.isa, v11));
    CGRect v13 = self->_borderConfiguration;
    self->_borderConfiguration = v12;

    if (stackView_applyAttributesToItem_atIndex__sOnce != -1) {
      dispatch_once(&stackView_applyAttributesToItem_atIndex__sOnce, &__block_literal_global_17);
    }
    CGRect v14 = self->_borderConfiguration;
    objc_super v15 = [MEMORY[0x1E4FB1618] whiteColor];
    [(MPUBorderConfiguration *)v14 setDropShadowColor:v15];

    [(MPUBorderConfiguration *)self->_borderConfiguration setDropShadowEdges:11];
    [(MPUBorderConfiguration *)self->_borderConfiguration setDropShadowWidth:1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale];
    uint64_t v16 = self->_borderConfiguration;
    uint64_t v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [(MPUBorderConfiguration *)v16 setBorderColor:v17];

    [(MPUBorderConfiguration *)self->_borderConfiguration setBorderWidth:1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale];
    v18 = self->_borderConfiguration;
    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    [(MPUBorderConfiguration *)v18 setFillColor:v19];

    borderConfiguration = self->_borderConfiguration;
  }
  if ((unint64_t)a5 >= 5) {
    a5 = 5;
  }
  [(MPUBorderConfiguration *)borderConfiguration setFillAlpha:stackView_applyAttributesToItem_atIndex__sItemOverlayCenterWhiteAlphas[a5]];
  [(MPUBorderConfiguration *)self->_borderConfiguration setBorderAlpha:stackView_applyAttributesToItem_atIndex__sItemOverlayBorderWhiteAlphas[a5]];
  [v9 setBorderConfiguration:self->_borderConfiguration];
  [v9 setImageAlpha:stackView_applyAttributesToItem_atIndex__sItemImageAlphas[a5]];
  objc_msgSend(v9, "setImageContentsRect:", stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 1], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 2], stackView_applyAttributesToItem_atIndex__sItemImageContentRects[4 * a5 + 3]);
  unint64_t v20 = a5 - 1;
  long long v21 = *MEMORY[0x1E4F1DAB8];
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v28.c = v22;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v28.tdouble x = v23;
  if (((0x15uLL >> a5) & 1) == 0 || v20 <= 1)
  {
    double v24 = 1.0;
    if ((0x15uLL >> a5)) {
      double v25 = 1.0;
    }
    else {
      double v25 = -1.0;
    }
    if (v20 < 2) {
      double v24 = -1.0;
    }
    *(_OWORD *)&v27.a = v21;
    *(_OWORD *)&v27.c = v22;
    *(_OWORD *)&v27.tdouble x = v23;
    CGAffineTransformScale(&v28, &v27, v25, v24);
  }
  CGAffineTransform v27 = v28;
  [v9 setImageTransform:&v27];
  v26 = [(SKUIStackedImageView *)self image];
  [v9 setImage:v26];
}

void __64__SKUIStackedImageView_stackView_applyAttributesToItem_atIndex___block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  stackView_applyAttributesToItem_atIndex__sScreenScale = v0;
}

- (void)stackView:(id)a3 didCreateItem:(id)a4
{
}

+ (SKUIStackedImageConfiguration)_configurationForSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  CGPoint result = (SKUIStackedImageConfiguration *)os_variant_has_internal_content();
  if (result)
  {
    CGPoint result = (SKUIStackedImageConfiguration *)_os_feature_enabled_impl();
    if (result)
    {
      CGPoint result = (SKUIStackedImageConfiguration *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (result) {
        +[SKUIStackedImageView _configurationForSize:]();
      }
    }
  }
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 3;
  if (height >= width) {
    double v8 = width;
  }
  else {
    double v8 = height;
  }
  if (v8 < 50.0)
  {
    *(_OWORD *)&retstr->var0.vertical = xmmword_1C1CCB820;
    retstr->var1.double height = 1.0;
    return result;
  }
  if (v8 < 80.0)
  {
    __asm { FMOV            V1.2D, #2.0 }
    retstr->var0 = (UIOffset)xmmword_1C1CCB810;
    retstr->var1 = _Q1;
    retstr->var2 = 4;
    return result;
  }
  if (v8 >= 100.0)
  {
    if (v8 >= 120.0)
    {
      if (v8 >= 160.0) {
        __asm { FMOV            V0.2D, #9.0 }
      }
      else {
        __asm { FMOV            V0.2D, #6.0 }
      }
      __asm { FMOV            V1.2D, #3.0 }
      goto LABEL_21;
    }
    __asm { FMOV            V0.2D, #4.0 }
  }
  else
  {
    __asm { FMOV            V0.2D, #3.0 }
  }
  __asm { FMOV            V1.2D, #2.0 }
LABEL_21:
  retstr->var0 = _Q0;
  retstr->var1 = _Q1;
  return result;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  return self->_borderDrawingCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_borderConfiguration, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIStackedImageView initWithFrame:]";
}

+ (void)_configurationForSize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "+[SKUIStackedImageView _configurationForSize:]";
}

@end