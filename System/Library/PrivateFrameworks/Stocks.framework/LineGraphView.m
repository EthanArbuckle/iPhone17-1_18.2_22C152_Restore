@interface LineGraphView
- (LineGraphView)initWithFrame:(CGRect)a3;
- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4;
- (void)setGraphImageSet:(id)a3;
- (void)setSelectedLineImage:(id)a3;
- (void)setShowingSelectedLine:(BOOL)a3;
@end

@implementation LineGraphView

- (LineGraphView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LineGraphView;
  v3 = -[LineGraphView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = v3;
  if (v3) {
    [(LineGraphView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setSelectedLineImage:(id)a3
{
  p_lineImage = &self->_lineImage;
  v7 = (UIImage *)a3;
  if (*p_lineImage != v7)
  {
    objc_storeStrong((id *)&self->_lineImage, a3);
    tintedLineView = self->_tintedLineView;
    if (tintedLineView) {
      [(TintedView *)tintedLineView setImage:*p_lineImage];
    }
  }
}

- (void)setGraphImageSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lineGraphImage];
  uint64_t v6 = [v5 CGImage];
  v7 = [(LineGraphView *)self layer];
  [v7 setContents:v6];

  id v8 = [v4 highlightOverlayImage];

  [(LineGraphView *)self setSelectedLineImage:v8];
}

- (void)setShowingSelectedLine:(BOOL)a3
{
  if (self->_showingTintedLine != a3)
  {
    BOOL v3 = a3;
    self->_showingTintedLine = a3;
    if (a3)
    {
      if (!self->_tintedLineView)
      {
        id v5 = objc_alloc_init(TintedView);
        tintedLineView = self->_tintedLineView;
        self->_tintedLineView = v5;

        id v7 = objc_alloc(MEMORY[0x263F1CB60]);
        [(LineGraphView *)self bounds];
        id v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
        tintedLineClipView = self->_tintedLineClipView;
        self->_tintedLineClipView = v8;

        [(UIView *)self->_tintedLineClipView setClipsToBounds:1];
        [(UIView *)self->_tintedLineClipView addSubview:self->_tintedLineView];
        [(UIView *)self->_tintedLineClipView setAlpha:0.0];
        [(LineGraphView *)self addSubview:self->_tintedLineClipView];
      }
      if (self->_lineImage) {
        -[TintedView setImage:](self->_tintedLineView, "setImage:");
      }
    }
    v10 = self->_tintedLineClipView;
    [(UIView *)v10 setAlpha:(double)v3];
  }
}

- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  id v7 = [(TintedView *)self->_tintedLineView layer];
  [v7 removeAllAnimations];

  id v8 = [(UIView *)self->_tintedLineClipView layer];
  [v8 removeAllAnimations];

  [(LineGraphView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[UIView setFrame:](self->_tintedLineClipView, "setFrame:", a3, 0.0, a4 - a3);
  tintedLineView = self->_tintedLineView;
  -[LineGraphView convertRect:toView:](self, "convertRect:toView:", self->_tintedLineClipView, v10, v12, v14, v16);

  -[TintedView setFrame:](tintedLineView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedLineView, 0);
  objc_storeStrong((id *)&self->_tintedLineClipView, 0);

  objc_storeStrong((id *)&self->_lineImage, 0);
}

@end