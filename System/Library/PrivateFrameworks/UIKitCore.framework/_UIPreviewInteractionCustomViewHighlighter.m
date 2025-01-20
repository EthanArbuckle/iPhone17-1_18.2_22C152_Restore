@interface _UIPreviewInteractionCustomViewHighlighter
- (BOOL)customViewFlipsHorizontalAxis;
- (UIView)customView;
- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5;
- (void)finalizeHighlightForPreviewingContext:(id)a3;
- (void)prepareHighlightWithPreviewingContext:(id)a3;
- (void)setCustomView:(id)a3;
- (void)setCustomViewFlipsHorizontalAxis:(BOOL)a3;
@end

@implementation _UIPreviewInteractionCustomViewHighlighter

- (void)prepareHighlightWithPreviewingContext:(id)a3
{
  id v20 = a3;
  v4 = [v20 sourceView];
  [v20 preferredSourceViewRectInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [v20 customViewForInteractiveHighlight];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  v14 = [v13 layer];
  -[_UIPreviewInteractionCustomViewHighlighter setCustomViewFlipsHorizontalAxis:](self, "setCustomViewFlipsHorizontalAxis:", [v14 flipsHorizontalAxis]);

  v15 = [v4 layer];
  int v16 = [v15 flipsHorizontalAxis];

  if (v16)
  {
    uint64_t v17 = [(_UIPreviewInteractionCustomViewHighlighter *)self customViewFlipsHorizontalAxis] ^ 1;
    v18 = [v13 layer];
    [v18 setFlipsHorizontalAxis:v17];
  }
  v19 = [v20 sourceView];
  [v19 addSubview:v13];

  [(_UIPreviewInteractionCustomViewHighlighter *)self setCustomView:v13];
}

- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5
{
  id v6 = a3;
  double v7 = [(_UIPreviewInteractionCustomViewHighlighter *)self customView];
  BOOL v8 = [(_UIPreviewInteractionCustomViewHighlighter *)self customViewFlipsHorizontalAxis];
  double v9 = [v7 layer];
  [v9 setFlipsHorizontalAxis:v8];

  [v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v6 addSubview:v7];

  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __126___UIPreviewInteractionCustomViewHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke;
    v12[3] = &unk_1E52D9F70;
    id v13 = v7;
    double v10 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:4 delay:v12 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)finalizeHighlightForPreviewingContext:(id)a3
{
  id v3 = [(_UIPreviewInteractionCustomViewHighlighter *)self customView];
  [v3 removeFromSuperview];
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setCustomView:(id)a3
{
}

- (BOOL)customViewFlipsHorizontalAxis
{
  return self->_customViewFlipsHorizontalAxis;
}

- (void)setCustomViewFlipsHorizontalAxis:(BOOL)a3
{
  self->_customViewFlipsHorizontalAxis = a3;
}

- (void).cxx_destruct
{
}

@end