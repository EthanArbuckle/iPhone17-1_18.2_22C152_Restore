@interface SUUIStackedImageView
+ (SUUIStackedImageConfiguration)_configurationForSize:(SEL)a3;
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (CGPoint)vanishingPoint;
- (MPUBorderDrawingCache)borderDrawingCache;
- (SUUIStackedImageView)initWithFrame:(CGRect)a3;
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

@implementation SUUIStackedImageView

- (SUUIStackedImageView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIStackedImageView;
  v3 = -[SUUIStackedImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_stackDepth = 3;
    uint64_t v5 = SUUIMPUFoundationFramework();
    id v6 = SUUIWeakLinkedClassForString(&cfstr_Mpuborderedima.isa, v5);
    id v7 = objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Mpustackview.isa, v5));
    [(SUUIStackedImageView *)v4 bounds];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:itemClass:itemReuseIdentifier:", v6, @"0");
    stackView = v4->_stackView;
    v4->_stackView = (MPUStackView *)v8;

    [(MPUStackView *)v4->_stackView setDataSource:v4];
    [(MPUStackView *)v4->_stackView setForcesIntegralY:1];
    [(SUUIStackedImageView *)v4 addSubview:v4->_stackView];
  }
  return v4;
}

- (void)dealloc
{
  [(MPUStackView *)self->_stackView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIStackedImageView;
  [(SUUIStackedImageView *)&v3 dealloc];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = objc_opt_class();
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = (MPUBorderDrawingCache *)a3;
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUUIStackedImageView *)self image];

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIStackedImageView;
    [(SUUIImageView *)&v15 setImage:v4];
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
  v9.super_class = (Class)SUUIStackedImageView;
  -[SUUIImageView setImageSize:](&v9, sel_setImageSize_, width, height);
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
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIStackedImageView *)self frame];
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
    v12.super_class = (Class)SUUIStackedImageView;
    -[SUUIStackedImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(SUUIStackedImageView *)self setNeedsLayout];
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SUUIStackedImageView *)self center];
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUIStackedImageView;
    -[SUUIStackedImageView setCenter:](&v9, sel_setCenter_, x, y);
    [(SUUIStackedImageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIImageView *)self imageSize];
  double v5 = v4;
  double v6 = v3;
  if (v4 == *MEMORY[0x263F001B0] && v3 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    CGFloat v8 = [(SUUIStackedImageView *)self image];
    [v8 size];
    double v5 = v9;
    double v6 = v10;
  }
  stackView = self->_stackView;
  [(SUUIStackedImageView *)self bounds];
  [(MPUStackView *)stackView setFrame:SUUIImageRectForBounds(0, v5, v6, v12, v13, v14, v15)];
  [(MPUStackView *)self->_stackView updateForChangedDistanceFromVanishingPoint];
  v16.receiver = self;
  v16.super_class = (Class)SUUIStackedImageView;
  [(SUUIImageView *)&v16 layoutSubviews];
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
    uint64_t v11 = SUUIMPUFoundationFramework();
    double v12 = (MPUBorderConfiguration *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Mpuborderconfi.isa, v11));
    double v13 = self->_borderConfiguration;
    self->_borderConfiguration = v12;

    if (stackView_applyAttributesToItem_atIndex__sOnce != -1) {
      dispatch_once(&stackView_applyAttributesToItem_atIndex__sOnce, &__block_literal_global_44);
    }
    double v14 = self->_borderConfiguration;
    double v15 = [MEMORY[0x263F825C8] whiteColor];
    [(MPUBorderConfiguration *)v14 setDropShadowColor:v15];

    [(MPUBorderConfiguration *)self->_borderConfiguration setDropShadowEdges:11];
    [(MPUBorderConfiguration *)self->_borderConfiguration setDropShadowWidth:1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale];
    objc_super v16 = self->_borderConfiguration;
    uint64_t v17 = [MEMORY[0x263F825C8] whiteColor];
    [(MPUBorderConfiguration *)v16 setBorderColor:v17];

    [(MPUBorderConfiguration *)self->_borderConfiguration setBorderWidth:1.0 / *(double *)&stackView_applyAttributesToItem_atIndex__sScreenScale];
    v18 = self->_borderConfiguration;
    v19 = [MEMORY[0x263F825C8] whiteColor];
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
  long long v21 = *MEMORY[0x263F000D0];
  long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v28.c = v22;
  long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
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
  v26 = [(SUUIStackedImageView *)self image];
  [v9 setImage:v26];
}

void __64__SUUIStackedImageView_stackView_applyAttributesToItem_atIndex___block_invoke()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  stackView_applyAttributesToItem_atIndex__sScreenScale = v0;
}

- (void)stackView:(id)a3 didCreateItem:(id)a4
{
}

+ (SUUIStackedImageConfiguration)_configurationForSize:(SEL)a3
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 3;
  if (a4.height < a4.width) {
    a4.double width = a4.height;
  }
  if (a4.width < 50.0)
  {
    *(_OWORD *)&retstr->var0.vertical = xmmword_2568A15A0;
    retstr->var1.double height = 1.0;
    return result;
  }
  if (a4.width < 80.0)
  {
    __asm { FMOV            V1.2D, #2.0 }
    retstr->var0 = (UIOffset)xmmword_2568A1590;
    retstr->var1 = _Q1;
    retstr->var2 = 4;
    return result;
  }
  if (a4.width >= 100.0)
  {
    if (a4.width >= 120.0)
    {
      if (a4.width >= 160.0) {
        __asm { FMOV            V0.2D, #9.0 }
      }
      else {
        __asm { FMOV            V0.2D, #6.0 }
      }
      __asm { FMOV            V1.2D, #3.0 }
      goto LABEL_16;
    }
    __asm { FMOV            V0.2D, #4.0 }
  }
  else
  {
    __asm { FMOV            V0.2D, #3.0 }
  }
  __asm { FMOV            V1.2D, #2.0 }
LABEL_16:
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

@end