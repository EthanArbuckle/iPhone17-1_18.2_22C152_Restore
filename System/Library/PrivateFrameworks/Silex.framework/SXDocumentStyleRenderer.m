@interface SXDocumentStyleRenderer
- (SXDocumentStyleRenderer)initWithViewport:(id)a3 gradientFactory:(id)a4;
- (SXGradientFactory)gradientFactory;
- (SXViewport)viewport;
- (UIView)topBackgroundView;
- (void)applyBackgroundColorForStyle:(id)a3 onView:(id)a4;
- (void)applyStyle:(id)a3 onView:(id)a4;
- (void)applyTopBackgroundForStyle:(id)a3 onView:(id)a4;
- (void)layoutTopBackgroundView;
- (void)setTopBackgroundView:(id)a3;
@end

@implementation SXDocumentStyleRenderer

- (SXDocumentStyleRenderer)initWithViewport:(id)a3 gradientFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDocumentStyleRenderer;
  v9 = [(SXDocumentStyleRenderer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_gradientFactory, a4);
  }

  return v10;
}

- (void)applyStyle:(id)a3 onView:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 superview];
  [(SXDocumentStyleRenderer *)self applyBackgroundColorForStyle:v13 onView:v7];

  id v8 = [v6 superview];
  [(SXDocumentStyleRenderer *)self applyTopBackgroundForStyle:v13 onView:v8];

  if (v13
    && ([v13 backgroundColor],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 brightness],
        double v11 = v10,
        v9,
        v11 <= 0.5))
  {
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v12 = 1;
  }
  [v6 setIndicatorStyle:v12];
}

- (void)applyBackgroundColorForStyle:(id)a3 onView:(id)a4
{
  id v5 = a4;
  id v6 = [a3 backgroundColor];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F1C550] whiteColor];
  }
  id v9 = v8;

  [v5 setBackgroundColor:v9];
}

- (void)applyTopBackgroundForStyle:(id)a3 onView:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  id v7 = [v25 topBackgroundGradient];

  if (v7)
  {
    id v8 = [(SXDocumentStyleRenderer *)self topBackgroundView];

    if (v8) {
      goto LABEL_10;
    }
    id v9 = [(SXDocumentStyleRenderer *)self gradientFactory];
    double v10 = [v25 topBackgroundGradient];
    double v11 = [v10 colorStops];
    uint64_t v12 = [v11 NSArray];
    id v13 = [v25 topBackgroundGradient];
    [v13 angle];
    v14 = objc_msgSend(v9, "gradientForColorStops:angle:", v12);

    v15 = [[SXGradientView alloc] initWithGradient:v14];
    [(SXDocumentStyleRenderer *)self setTopBackgroundView:v15];
    goto LABEL_8;
  }
  v16 = [v25 topBackgroundColor];

  v17 = [(SXDocumentStyleRenderer *)self topBackgroundView];

  if (v16)
  {
    if (!v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F1CB60]);
      v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(SXDocumentStyleRenderer *)self setTopBackgroundView:v19];
    }
    v14 = [(SXDocumentStyleRenderer *)self topBackgroundView];
    v15 = [v25 topBackgroundColor];
    [v14 setBackgroundColor:v15];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if (v17)
  {
    v24 = [(SXDocumentStyleRenderer *)self topBackgroundView];
    [v24 removeFromSuperview];

    [(SXDocumentStyleRenderer *)self setTopBackgroundView:0];
    v14 = [(SXDocumentStyleRenderer *)self viewport];
    [v14 removeViewportChangeListener:self forOptions:4];
    goto LABEL_9;
  }
LABEL_10:
  v20 = [(SXDocumentStyleRenderer *)self topBackgroundView];

  if (v20)
  {
    v21 = [(SXDocumentStyleRenderer *)self topBackgroundView];
    [v6 addSubview:v21];

    v22 = [(SXDocumentStyleRenderer *)self topBackgroundView];
    [v6 sendSubviewToBack:v22];

    [(SXDocumentStyleRenderer *)self layoutTopBackgroundView];
    v23 = [(SXDocumentStyleRenderer *)self viewport];
    [v23 addViewportChangeListener:self forOptions:4];
  }
}

- (void)layoutTopBackgroundView
{
  id v13 = [(SXDocumentStyleRenderer *)self topBackgroundView];
  v3 = [(SXDocumentStyleRenderer *)self viewport];
  [v3 bounds];
  double v5 = -v4;
  id v6 = [(SXDocumentStyleRenderer *)self viewport];
  [v6 bounds];
  double v8 = v5 - v7;
  id v9 = [(SXDocumentStyleRenderer *)self viewport];
  [v9 bounds];
  double v11 = v10;
  uint64_t v12 = [(SXDocumentStyleRenderer *)self viewport];
  [v12 bounds];
  objc_msgSend(v13, "setFrame:", 0.0, v8, v11);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXGradientFactory)gradientFactory
{
  return self->_gradientFactory;
}

- (UIView)topBackgroundView
{
  return self->_topBackgroundView;
}

- (void)setTopBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_storeStrong((id *)&self->_gradientFactory, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end