@interface PXTitleSubtitleUILabel
- (BOOL)diagnosticsEnabled;
- (BOOL)rendersTextAsynchronously;
- (BOOL)shouldRasterizeTextLayer;
- (CALayer)_contentLayer;
- (CGRect)contentBounds;
- (NSArray)diagnosticsRenderedLines;
- (NSString)subtitleText;
- (NSString)titleText;
- (PXTitleSubtitleCALayerPromise)_layerPromise;
- (PXTitleSubtitleLabelSpec)spec;
- (PXTitleSubtitleUILabel)initWithCoder:(id)a3;
- (PXTitleSubtitleUILabel)initWithFrame:(CGRect)a3;
- (double)lastBaseline;
- (int64_t)typesettingMode;
- (void)_PXTitleSubtitleUILabelCommonInitialization;
- (void)_handleChangeFromBounds:(CGRect)a3;
- (void)_invalidateLayerPromise;
- (void)_setContentLayer:(id)a3;
- (void)_setLayerPromise:(id)a3;
- (void)_updateContentLayer;
- (void)_updateLayerPromiseIfNeeded;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBounds:(CGRect)a3;
- (void)setDiagnosticsEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setRendersTextAsynchronously:(BOOL)a3;
- (void)setShouldRasterizeTextLayer:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTypesettingMode:(int64_t)a3;
@end

@implementation PXTitleSubtitleUILabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentLayer, 0);
  objc_storeStrong((id *)&self->__layerPromise, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (BOOL)diagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (CALayer)_contentLayer
{
  return self->__contentLayer;
}

- (PXTitleSubtitleCALayerPromise)_layerPromise
{
  return self->__layerPromise;
}

- (BOOL)shouldRasterizeTextLayer
{
  return self->_shouldRasterizeTextLayer;
}

- (BOOL)rendersTextAsynchronously
{
  return self->_rendersTextAsynchronously;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXLayerPromiseObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXTitleSubtitleUILabel.m" lineNumber:233 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXTitleSubtitleUILabel *)self _updateContentLayer];
    id v9 = v11;
  }
}

- (void)_updateContentLayer
{
  id v4 = [(PXTitleSubtitleUILabel *)self _layerPromise];
  v3 = [v4 layer];
  objc_msgSend(v3, "setShouldRasterize:", -[PXTitleSubtitleUILabel shouldRasterizeTextLayer](self, "shouldRasterizeTextLayer"));
  [v4 contentsScale];
  objc_msgSend(v3, "setRasterizationScale:");
  if (v3) {
    [(PXTitleSubtitleUILabel *)self _setContentLayer:v3];
  }
}

- (void)_updateLayerPromiseIfNeeded
{
  if (self->_needsUpdateLayerPromise)
  {
    self->_needsUpdateLayerPromise = 0;
    v3 = [(PXTitleSubtitleUILabel *)self spec];
    if (v3) {
      [v3 padding];
    }
    [(PXTitleSubtitleUILabel *)self bounds];
    PXEdgeInsetsInsetRect();
  }
}

void __53__PXTitleSubtitleUILabel__updateLayerPromiseIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 80);
  double v6 = *(double *)(a1 + 88);
  id v7 = a2;
  objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
  [v7 setContentsScale:*(double *)(a1 + 96)];
  objc_msgSend(v7, "setRendersAsynchronously:", objc_msgSend(*(id *)(a1 + 32), "rendersTextAsynchronously"));
  [v7 setTitleText:*(void *)(a1 + 40)];
  [v7 setSubtitleText:*(void *)(a1 + 48)];
  [v7 setSpec:*(void *)(a1 + 56)];
  objc_msgSend(v7, "setTypesettingMode:", objc_msgSend(*(id *)(a1 + 32), "typesettingMode"));
}

- (void)_invalidateLayerPromise
{
  self->_needsUpdateLayerPromise = 1;
  [(PXTitleSubtitleUILabel *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabel;
  [(PXTitleSubtitleUILabel *)&v3 layoutSubviews];
  [(PXTitleSubtitleUILabel *)self _updateLayerPromiseIfNeeded];
}

- (CGRect)contentBounds
{
  [(PXTitleSubtitleUILabel *)self _updateLayerPromiseIfNeeded];
  objc_super v3 = [(PXTitleSubtitleUILabel *)self _layerPromise];
  [v3 layerContentBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_setContentLayer:(id)a3
{
  double v5 = (CALayer *)a3;
  p_contentLayer = &self->__contentLayer;
  contentLayer = self->__contentLayer;
  if (contentLayer != v5)
  {
    v28 = v5;
    [(CALayer *)contentLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->__contentLayer, a3);
    double v5 = v28;
    if (v28)
    {
      double v8 = +[PXMemoriesRelatedSettings sharedInstance];
      int v9 = [v8 showMemoryTitleLayer];

      if (v9)
      {
        double v10 = [MEMORY[0x1E4FB1618] redColor];
        id v11 = [v10 colorWithAlphaComponent:0.5];
        -[CALayer setBackgroundColor:](v28, "setBackgroundColor:", [v11 CGColor]);
      }
      double v12 = [(PXTitleSubtitleUILabel *)self layer];
      [v12 bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      -[CALayer setAnchorPoint:](v28, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [(CALayer *)v28 bounds];
      double v22 = v21;
      if ([(PXTitleSubtitleUILabel *)self effectiveUserInterfaceLayoutDirection] == 1)
      {
        v30.origin.x = v14;
        v30.origin.y = v16;
        v30.size.width = v18;
        v30.size.height = v20;
        double Width = CGRectGetWidth(v30);
        [(CALayer *)v28 bounds];
        double v22 = Width - CGRectGetMaxX(v31);
      }
      [(CALayer *)v28 bounds];
      double Height = CGRectGetHeight(v32);
      v25 = [(PXTitleSubtitleUILabel *)self _layerPromise];
      [v25 layerLastBaseline];
      double v27 = Height - v26;

      -[CALayer setPosition:](v28, "setPosition:", v22, v27);
      [v12 addSublayer:*p_contentLayer];

      double v5 = v28;
    }
  }
}

- (void)_setLayerPromise:(id)a3
{
  double v5 = (PXTitleSubtitleCALayerPromise *)a3;
  p_layerPromise = &self->__layerPromise;
  layerPromise = self->__layerPromise;
  if (layerPromise != v5)
  {
    double v8 = v5;
    [(PXTitleSubtitleCALayerPromise *)layerPromise unregisterChangeObserver:self context:PXLayerPromiseObservationContext];
    objc_storeStrong((id *)&self->__layerPromise, a3);
    [(PXTitleSubtitleCALayerPromise *)*p_layerPromise registerChangeObserver:self context:PXLayerPromiseObservationContext];
    [(PXCALayerPromise *)*p_layerPromise startLayerRealization];
    [(PXTitleSubtitleUILabel *)self _updateContentLayer];
    double v5 = v8;
  }
}

- (NSArray)diagnosticsRenderedLines
{
  v2 = [(PXTitleSubtitleUILabel *)self _layerPromise];
  objc_super v3 = [v2 diagnosticsRenderedLines];

  return (NSArray *)v3;
}

- (double)lastBaseline
{
  [(PXTitleSubtitleUILabel *)self _updateLayerPromiseIfNeeded];
  objc_super v3 = [(PXTitleSubtitleUILabel *)self _layerPromise];
  [v3 layerLastBaseline];
  double v5 = v4;

  return v5;
}

- (void)setShouldRasterizeTextLayer:(BOOL)a3
{
  if (self->_shouldRasterizeTextLayer != a3)
  {
    self->_shouldRasterizeTextLayer = a3;
    [(PXTitleSubtitleUILabel *)self _updateContentLayer];
  }
}

- (void)setRendersTextAsynchronously:(BOOL)a3
{
  if (self->_rendersTextAsynchronously != a3)
  {
    self->_rendersTextAsynchronously = a3;
    [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
  }
}

- (void)setTypesettingMode:(int64_t)a3
{
  if (self->_typesettingMode != a3)
  {
    self->_typesettingMode = a3;
    [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
  }
}

- (void)setSpec:(id)a3
{
  double v7 = (PXTitleSubtitleLabelSpec *)a3;
  double v5 = self->_spec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXTitleSubtitleLabelSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
    }
  }
}

- (void)setSubtitleText:(id)a3
{
  double v8 = (NSString *)a3;
  double v4 = self->_subtitleText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      char v6 = (NSString *)[(NSString *)v8 copy];
      subtitleText = self->_subtitleText;
      self->_subtitleText = v6;

      [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
    }
  }
}

- (void)setTitleText:(id)a3
{
  double v8 = (NSString *)a3;
  double v4 = self->_titleText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      char v6 = (NSString *)[(NSString *)v8 copy];
      titleText = self->_titleText;
      self->_titleText = v6;

      [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
    }
  }
}

- (void)_handleChangeFromBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXTitleSubtitleUILabel *)self bounds];
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    [(PXTitleSubtitleUILabel *)self _invalidateLayerPromise];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXTitleSubtitleUILabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PXTitleSubtitleUILabel;
  -[PXTitleSubtitleUILabel setFrame:](&v16, sel_setFrame_, x, y, width, height);
  -[PXTitleSubtitleUILabel _handleChangeFromBounds:](self, "_handleChangeFromBounds:", v9, v11, v13, v15);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXTitleSubtitleUILabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PXTitleSubtitleUILabel;
  -[PXTitleSubtitleUILabel setBounds:](&v16, sel_setBounds_, x, y, width, height);
  -[PXTitleSubtitleUILabel _handleChangeFromBounds:](self, "_handleChangeFromBounds:", v9, v11, v13, v15);
}

- (void)_PXTitleSubtitleUILabelCommonInitialization
{
  objc_super v3 = +[PXKitSettings sharedInstance];
  self->_rendersTextAsynchronousldouble y = [v3 defaultAsyncTextRenderingEnabled];

  id v4 = +[PXKitSettings sharedInstance];
  self->_typesettingMode = [v4 defaultLabelTypesettingMode];
}

- (PXTitleSubtitleUILabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXTitleSubtitleUILabel;
  objc_super v3 = -[PXTitleSubtitleUILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXTitleSubtitleUILabel *)v3 _PXTitleSubtitleUILabelCommonInitialization];
  }
  return v4;
}

- (PXTitleSubtitleUILabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXTitleSubtitleUILabel;
  objc_super v3 = [(PXTitleSubtitleUILabel *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PXTitleSubtitleUILabel *)v3 _PXTitleSubtitleUILabelCommonInitialization];
  }
  return v4;
}

@end