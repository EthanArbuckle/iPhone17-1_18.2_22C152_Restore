@interface SXLineComponentView
- (BOOL)userInteractable;
- (CALayer)strokeLayer;
- (SXSolidBorderView)borderView;
- (void)discardContents;
- (void)loadComponent:(id)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)setBorderView:(id)a3;
- (void)setStrokeLayer:(id)a3;
@end

@implementation SXLineComponentView

- (void)loadComponent:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentView *)self component];
  v6 = [v5 stroke];

  v10.receiver = self;
  v10.super_class = (Class)SXLineComponentView;
  [(SXComponentView *)&v10 loadComponent:v4];

  v7 = [(SXComponentView *)self component];
  v8 = [v7 stroke];
  char v9 = [v8 isEqual:v6];

  if ((v9 & 1) == 0) {
    [(SXLineComponentView *)self discardContents];
  }
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXLineComponentView;
  [(SXComponentView *)&v5 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if (var0) {
    [(SXLineComponentView *)self discardContents];
  }
}

- (void)renderContents
{
  v47.receiver = self;
  v47.super_class = (Class)SXLineComponentView;
  [(SXComponentView *)&v47 renderContents];
  v3 = [(SXComponentView *)self component];
  id v4 = [v3 stroke];

  if (!v4) {
    return;
  }
  [(SXComponentView *)self contentFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SXComponentView *)self componentLayout];
  [v13 maximumContentWidth];
  uint64_t v15 = v14;

  if (v15)
  {
    v16 = [(SXComponentView *)self unitConverter];
    v17 = [(SXComponentView *)self componentLayout];
    uint64_t v18 = [v17 maximumContentWidth];
    objc_msgSend(v16, "convertValueToPoints:", v18, v19);
    double v21 = v20;

    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.width = v10;
    v48.size.height = v12;
    double Width = CGRectGetWidth(v48);
    double v10 = v21 >= Width ? Width : v21;
    [(SXComponentView *)self contentFrame];
    if (CGRectGetWidth(v49) > v21)
    {
      v23 = [(SXComponentView *)self componentLayout];
      if ([v23 horizontalContentAlignment])
      {
        v24 = [(SXComponentView *)self componentLayout];
        uint64_t v25 = [v24 horizontalContentAlignment];

        if (v25 == 3)
        {
          [(SXComponentView *)self contentFrame];
          double MaxX = CGRectGetMaxX(v52);
          v53.origin.x = v6;
          v53.origin.y = v8;
          v53.size.width = v10;
          v53.size.height = v12;
          double v6 = MaxX - CGRectGetWidth(v53);
          goto LABEL_14;
        }
        if (v25 != 2) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      [(SXComponentView *)self contentFrame];
      double v26 = CGRectGetWidth(v50);
      v51.origin.x = v6;
      v51.origin.y = v8;
      v51.size.width = v10;
      v51.size.height = v12;
      double v6 = (v26 - CGRectGetWidth(v51)) * 0.5;
    }
  }
LABEL_14:
  v28 = [(SXComponentView *)self component];
  v29 = [v28 stroke];
  int v30 = [v29 style];

  if (v30 == 1)
  {
    v31 = [SXSolidBorderView alloc];
    v32 = [(SXComponentView *)self component];
    v33 = [v32 stroke];
    v34 = [(SXSolidBorderView *)v31 initWithStrokeStyle:v33];
    [(SXLineComponentView *)self setBorderView:v34];

    v35 = [(SXLineComponentView *)self borderView];
    objc_msgSend(v35, "setFrame:", v6, v8, v10, v12);

    v36 = [(SXComponentView *)self contentView];
    id v37 = [(SXLineComponentView *)self borderView];
    [v36 addSubview:v37];
  }
  else
  {
    v38 = [MEMORY[0x263F157E8] layer];
    [(SXLineComponentView *)self setStrokeLayer:v38];

    v36 = -[SXStrokeRenderer initWithComponentView:]((id *)[SXStrokeRenderer alloc], self);
    v39 = [(SXComponentView *)self component];
    v40 = [v39 stroke];
    v41 = -[SXStrokeRenderer lineForStyle:andFrame:]((id *)v36, v40, v6, v8, v10, v12);

    v42 = [(SXLineComponentView *)self strokeLayer];
    id v37 = v41;
    objc_msgSend(v42, "setContents:", objc_msgSend(v37, "CGImage"));

    v43 = [(SXLineComponentView *)self strokeLayer];
    objc_msgSend(v43, "setFrame:", v6, v8, v10, v12);

    v44 = [(SXComponentView *)self contentView];
    v45 = [v44 layer];
    v46 = [(SXLineComponentView *)self strokeLayer];
    [v45 addSublayer:v46];
  }
}

- (void)discardContents
{
  v5.receiver = self;
  v5.super_class = (Class)SXLineComponentView;
  [(SXComponentView *)&v5 discardContents];
  v3 = [(SXLineComponentView *)self strokeLayer];
  [v3 removeFromSuperlayer];

  [(SXLineComponentView *)self setStrokeLayer:0];
  id v4 = [(SXLineComponentView *)self borderView];
  [v4 removeFromSuperview];

  [(SXLineComponentView *)self setBorderView:0];
}

- (BOOL)userInteractable
{
  return 0;
}

- (CALayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
}

- (SXSolidBorderView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_strokeLayer, 0);
}

@end