@interface PXFocusRing
+ (void)updateView:(id)a3 infoProviderBlock:(id)a4;
- (PXFocusRing)initWithFrame:(CGRect)a3;
- (void)_updateColors;
- (void)_updateWithInfo:(id)a3;
- (void)_updateWithView:(id)a3;
- (void)_updateWithView:(id)a3 focusRect:(CGRect)a4 cornerRadius:(double)a5 innerBorderWidth:(double)a6 outerBorderWidth:(double)a7;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXFocusRing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLayer, 0);
  objc_storeStrong((id *)&self->_focusLayer, 0);
  objc_storeStrong((id *)&self->_outerLayer, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXFocusRing *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(PXFocusRing *)self _updateColors];
  }
}

- (void)_updateWithInfo:(id)a3
{
  id v4 = a3;
  [v4 cornerRadius];
  double v6 = v5 + 4.0;
  double v7 = 0.0;
  if (v6 >= 0.0) {
    double v8 = v6;
  }
  else {
    double v8 = 0.0;
  }
  v9 = [v4 view];
  [v9 bounds];
  CGRect v18 = CGRectInset(v17, -4.0, -4.0);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;

  if ([v4 wantsInnerBorder]) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0;
  }
  if ([v4 wantsOuterBorder]) {
    double v7 = 1.0;
  }
  id v15 = [v4 view];

  -[PXFocusRing _updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:](self, "_updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:", v15, x, y, width, height, v8, v14, v7);
}

- (void)_updateWithView:(id)a3
{
  id v5 = a3;
  id v4 = [v5 layer];
  [v4 cornerRadius];

  [v5 bounds];
  -[PXFocusRing _updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:](self, "_updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:", v5);
}

- (void)_updateWithView:(id)a3 focusRect:(CGRect)a4 cornerRadius:(double)a5 innerBorderWidth:(double)a6 outerBorderWidth:(double)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v25 = a3;
  id v15 = [(PXFocusRing *)self superview];
  if (!v15) {
    goto LABEL_23;
  }
  [v25 bounds];
  objc_msgSend(v15, "convertRect:fromView:", v25);
  -[PXFocusRing setFrame:](self, "setFrame:");
  -[CALayer setFrame:](self->_focusLayer, "setFrame:", x, y, width, height);
  [(CALayer *)self->_focusLayer setBorderWidth:3.0];
  [(CALayer *)self->_focusLayer setCornerRadius:a5];
  innerLayer = self->_innerLayer;
  if (a6 > 0.0 && !innerLayer)
  {
    CGRect v17 = [MEMORY[0x1E4F39BE8] layer];
    CGRect v18 = self->_innerLayer;
    self->_innerLayer = v17;

    [(CALayer *)self->_innerLayer setBorderWidth:1.0];
    double v19 = a5 + -3.0;
    if (a5 + -3.0 < 0.0) {
      double v19 = 0.0;
    }
    [(CALayer *)self->_innerLayer setCornerRadius:v19];
    v20 = [(PXFocusRing *)self layer];
    [v20 addSublayer:self->_innerLayer];
    goto LABEL_10;
  }
  if (a6 <= 0.0 && innerLayer)
  {
    [(CALayer *)innerLayer removeFromSuperlayer];
    v20 = self->_innerLayer;
    self->_innerLayer = 0;
LABEL_10:

    innerLayer = self->_innerLayer;
  }
  if (innerLayer)
  {
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGRect v28 = CGRectInset(v27, 3.0, 3.0);
    -[CALayer setFrame:](self->_innerLayer, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  }
  outerLayer = self->_outerLayer;
  if (a7 <= 0.0 || outerLayer)
  {
    if (a7 > 0.0 || !outerLayer) {
      goto LABEL_20;
    }
    [(CALayer *)outerLayer removeFromSuperlayer];
    v24 = self->_outerLayer;
    self->_outerLayer = 0;
  }
  else
  {
    v22 = [MEMORY[0x1E4F39BE8] layer];
    v23 = self->_outerLayer;
    self->_outerLayer = v22;

    [(CALayer *)self->_outerLayer setBorderWidth:1.0];
    [(CALayer *)self->_outerLayer setCornerRadius:a5 + 1.0];
    v24 = [(PXFocusRing *)self layer];
    [v24 addSublayer:self->_outerLayer];
  }

  outerLayer = self->_outerLayer;
LABEL_20:
  if (outerLayer)
  {
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    CGRect v30 = CGRectInset(v29, -1.0, -1.0);
    -[CALayer setFrame:](self->_outerLayer, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  }
  [(PXFocusRing *)self _updateColors];
LABEL_23:
}

- (void)_updateColors
{
  v3 = [(PXFocusRing *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PXFocusRing__updateColors__block_invoke;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

void __28__PXFocusRing__updateColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tintColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setBorderColor:", objc_msgSend(v2, "CGColor"));

  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setBorderColor:", objc_msgSend(v3, "CGColor"));

  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setBorderColor:", objc_msgSend(v4, "CGColor"));
}

- (PXFocusRing)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXFocusRing;
  id v3 = -[PXFocusRing initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(PXFocusRing *)v3 setUserInteractionEnabled:0];
    uint64_t v5 = [MEMORY[0x1E4F39BE8] layer];
    focusLayer = v4->_focusLayer;
    v4->_focusLayer = (CALayer *)v5;

    double v7 = [(PXFocusRing *)v4 layer];
    [v7 addSublayer:v4->_focusLayer];
  }
  return v4;
}

+ (void)updateView:(id)a3 infoProviderBlock:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    double v8 = (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    double v8 = 0;
  }
  objc_super v9 = [v8 view];
  v10 = [v9 superview];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [v21 superview];
    if (v13) {
      double v14 = v13;
    }
    else {
      double v14 = v21;
    }
    id v12 = v14;
  }
  id v15 = NSStringFromClass((Class)a1);
  uint64_t v16 = [v15 hash];

  CGRect v17 = [v12 viewWithTag:v16];
  int v18 = [v21 isFocused];
  int v19 = v18;
  if (!v17 && v18)
  {
    v20 = [PXFocusRing alloc];
    [v21 bounds];
    CGRect v17 = -[PXFocusRing initWithFrame:](v20, "initWithFrame:");
    [(PXFocusRing *)v17 setTag:v16];
  }
  if (v19)
  {
    [v12 addSubview:v17];
    if (v8) {
      [(PXFocusRing *)v17 _updateWithInfo:v8];
    }
    else {
      [(PXFocusRing *)v17 _updateWithView:v21];
    }
  }
  else
  {
    [(PXFocusRing *)v17 removeFromSuperview];
  }
}

@end