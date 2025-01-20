@interface _UIPreviewInteractionSystemHighlighter
- (BOOL)blinderViewEnabled;
- (UIView)blinderView;
- (UIView)initialSnapshotView;
- (UIView)updatedSnapshotView;
- (id)_newSnapshotViewForPreviewingContext:(id)a3 afterScreenUpdates:(BOOL)a4;
- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5;
- (void)finalizeHighlightForPreviewingContext:(id)a3;
- (void)prepareHighlightWithPreviewingContext:(id)a3;
- (void)setBlinderView:(id)a3;
- (void)setBlinderViewEnabled:(BOOL)a3;
- (void)setInitialSnapshotView:(id)a3;
- (void)setUpdatedSnapshotView:(id)a3;
@end

@implementation _UIPreviewInteractionSystemHighlighter

- (void)prepareHighlightWithPreviewingContext:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIPreviewInteractionSystemHighlighter *)self _newSnapshotViewForPreviewingContext:v4 afterScreenUpdates:0];
  v5 = [v4 sourceView];

  [v5 addSubview:v6];
  [(_UIPreviewInteractionSystemHighlighter *)self setInitialSnapshotView:v6];
}

- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v9 sourceView];
  v12 = [v11 layer];
  uint64_t v13 = [v12 flipsHorizontalAxis];

  [v10 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(_UIPreviewInteractionSystemHighlighter *)self initialSnapshotView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(_UIPreviewInteractionSystemHighlighter *)self initialSnapshotView];
  v24 = [v23 layer];
  [v24 setFlipsHorizontalAxis:v13];

  v25 = [(_UIPreviewInteractionSystemHighlighter *)self initialSnapshotView];
  [v10 addSubview:v25];

  id v26 = [(_UIPreviewInteractionSystemHighlighter *)self _newSnapshotViewForPreviewingContext:v9 afterScreenUpdates:1];
  [v10 bounds];
  objc_msgSend(v26, "setFrame:");
  [(_UIPreviewInteractionSystemHighlighter *)self setUpdatedSnapshotView:v26];
  v27 = [(_UIPreviewInteractionSystemHighlighter *)self updatedSnapshotView];
  v28 = [v27 layer];
  [v28 setFlipsHorizontalAxis:v13];

  v29 = [(_UIPreviewInteractionSystemHighlighter *)self initialSnapshotView];
  [v10 insertSubview:v26 belowSubview:v29];

  v30 = [v9 sourceView];
  v31 = [v30 backgroundColor];
  [v10 setBackgroundColor:v31];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __122___UIPreviewInteractionSystemHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke;
  v42[3] = &unk_1E52D9F70;
  v42[4] = self;
  v32 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:4 delay:v42 options:0 animations:0.2 completion:0.0];
  id v33 = v8;
  if ([(_UIPreviewInteractionSystemHighlighter *)self blinderViewEnabled])
  {
    [v9 preferredSourceViewRectInCoordinateSpace:v33];
    v38 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v34, v35, v36, v37);
    v39 = [v9 sourceView];
    v40 = [v39 backgroundColor];
    [(UIView *)v38 setBackgroundColor:v40];

    [v33 insertSubview:v38 atIndex:0];
    [(_UIPreviewInteractionSystemHighlighter *)self setBlinderView:v38];
  }
  return v32;
}

- (void)finalizeHighlightForPreviewingContext:(id)a3
{
  id v4 = [(_UIPreviewInteractionSystemHighlighter *)self initialSnapshotView];
  [v4 removeFromSuperview];

  v5 = [(_UIPreviewInteractionSystemHighlighter *)self updatedSnapshotView];
  [v5 removeFromSuperview];

  id v6 = [(_UIPreviewInteractionSystemHighlighter *)self blinderView];
  [v6 removeFromSuperview];
}

- (id)_newSnapshotViewForPreviewingContext:(id)a3 afterScreenUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 sourceView];
  [v5 preferredSourceViewRectInCoordinateSpace:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = objc_msgSend(v6, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, v8, v10, v12, v14, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  [v15 setUserInteractionEnabled:0];
  [v15 setAutoresizingMask:18];

  return v15;
}

- (UIView)initialSnapshotView
{
  return self->_initialSnapshotView;
}

- (void)setInitialSnapshotView:(id)a3
{
}

- (UIView)updatedSnapshotView
{
  return self->_updatedSnapshotView;
}

- (void)setUpdatedSnapshotView:(id)a3
{
}

- (BOOL)blinderViewEnabled
{
  return self->_blinderViewEnabled;
}

- (void)setBlinderViewEnabled:(BOOL)a3
{
  self->_blinderViewEnabled = a3;
}

- (UIView)blinderView
{
  return self->_blinderView;
}

- (void)setBlinderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinderView, 0);
  objc_storeStrong((id *)&self->_updatedSnapshotView, 0);
  objc_storeStrong((id *)&self->_initialSnapshotView, 0);
}

@end