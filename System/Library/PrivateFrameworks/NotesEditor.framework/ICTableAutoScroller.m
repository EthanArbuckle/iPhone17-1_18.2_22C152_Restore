@interface ICTableAutoScroller
- (BOOL)isScrolling;
- (CGRect)targetFrame;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (ICTableAutoScroller)initWithTableAttachmentViewController:(id)a3 scrollDirectionMode:(unint64_t)a4;
- (ICTableAutoScrollerDelegate)delegate;
- (ICTableScrollView)horizontalScrollView;
- (NSTimer)autoscrollTimer;
- (UIScrollView)targetScrollView;
- (UIScrollView)verticalScrollView;
- (double)bottomThresholdDistance;
- (double)scrollFactorForScrollDirectionMode:(unint64_t)a3;
- (double)topThresholdDistance;
- (unint64_t)scrollDirectionMode;
- (void)autoScrollWithScrollFactor:(double)a3 scrollDirectionMode:(unint64_t)a4;
- (void)setAutoscrollTimer:(id)a3;
- (void)setBottomThresholdDistance:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalScrollView:(id)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setScrollDirectionMode:(unint64_t)a3;
- (void)setTableAttachmentViewController:(id)a3;
- (void)setTargetFrame:(CGRect)a3;
- (void)setTopThresholdDistance:(double)a3;
- (void)setVerticalScrollView:(id)a3;
- (void)stopAutoscrollTimer;
- (void)updateAutoscrollTimer:(id)a3;
@end

@implementation ICTableAutoScroller

- (ICTableAutoScroller)initWithTableAttachmentViewController:(id)a3 scrollDirectionMode:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAutoScroller;
  v7 = [(ICTableAutoScroller *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_tableAttachmentViewController, v6);
    v8->_scrollDirectionMode = a4;
    v9 = [v6 noteScrollView];
    objc_storeWeak((id *)&v8->_verticalScrollView, v9);

    v10 = [v6 scrollView];
    objc_storeWeak((id *)&v8->_horizontalScrollView, v10);
  }
  return v8;
}

- (void)setTargetFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(ICTableAutoScroller *)self targetFrame];
  v46.origin.CGFloat x = v8;
  v46.origin.CGFloat y = v9;
  v46.size.CGFloat width = v10;
  v46.size.CGFloat height = v11;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  if (CGRectEqualToRect(v37, v46)) {
    return;
  }
  self->_targetFrame.origin.CGFloat x = x;
  self->_targetFrame.origin.CGFloat y = y;
  self->_targetFrame.size.CGFloat width = width;
  self->_targetFrame.size.CGFloat height = height;
  objc_super v12 = [(ICTableAutoScroller *)self tableAttachmentViewController];
  [v12 viewport];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v38.origin.CGFloat x = v14;
  v38.origin.CGFloat y = v16;
  v38.size.CGFloat width = v18;
  v38.size.CGFloat height = v20;
  double MinY = CGRectGetMinY(v38);
  [(ICTableAutoScroller *)self topThresholdDistance];
  double v33 = v21;
  v39.origin.CGFloat x = v14;
  v39.origin.CGFloat y = v16;
  v39.size.CGFloat width = v18;
  v39.size.CGFloat height = v20;
  double MaxY = CGRectGetMaxY(v39);
  [(ICTableAutoScroller *)self bottomThresholdDistance];
  double v30 = v22;
  v40.origin.CGFloat x = v14;
  v40.origin.CGFloat y = v16;
  v40.size.CGFloat width = v18;
  v40.size.CGFloat height = v20;
  double MinX = CGRectGetMinX(v40);
  v41.origin.CGFloat x = v14;
  v41.origin.CGFloat y = v16;
  v41.size.CGFloat width = v18;
  v41.size.CGFloat height = v20;
  double MaxX = CGRectGetMaxX(v41);
  unint64_t v24 = [(ICTableAutoScroller *)self scrollDirectionMode];
  if (v24 == 1)
  {
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    if (MinX <= CGRectGetMinX(v44))
    {
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      if (MaxX >= CGRectGetMaxX(v45))
      {
LABEL_15:
        v29 = [(ICTableAutoScroller *)self autoscrollTimer];

        if (v29)
        {
          [(ICTableAutoScroller *)self stopAutoscrollTimer];
        }
        return;
      }
    }
  }
  else
  {
    if (v24) {
      goto LABEL_15;
    }
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    if (MinY + v33 <= CGRectGetMinY(v42))
    {
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      if (MaxY - v30 >= CGRectGetMaxY(v43)) {
        goto LABEL_15;
      }
    }
  }
  v25 = [(ICTableAutoScroller *)self autoscrollTimer];

  if (!v25)
  {
    v26 = [(ICTableAutoScroller *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(ICTableAutoScroller *)self delegate];
      [v28 tableAutoScrollerWillStartScrolling:self];
    }
    [(ICTableAutoScroller *)self setIsScrolling:1];
    id v35 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_updateAutoscrollTimer_ selector:0 userInfo:1 repeats:0.02];
    [(ICTableAutoScroller *)self setAutoscrollTimer:v35];
  }
}

- (void)updateAutoscrollTimer:(id)a3
{
  unint64_t v4 = [(ICTableAutoScroller *)self scrollDirectionMode];
  [(ICTableAutoScroller *)self scrollFactorForScrollDirectionMode:v4];
  float v6 = v5;
  if (v6 == 0.0)
  {
    [(ICTableAutoScroller *)self stopAutoscrollTimer];
  }
  else
  {
    double v7 = v6;
    [(ICTableAutoScroller *)self autoScrollWithScrollFactor:v4 scrollDirectionMode:v7];
  }
}

- (double)scrollFactorForScrollDirectionMode:(unint64_t)a3
{
  double v5 = [(ICTableAutoScroller *)self tableAttachmentViewController];
  [v5 viewport];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(ICTableAutoScroller *)self targetFrame];
  CGFloat v18 = v15;
  CGFloat v19 = v17;
  double v20 = 0.0;
  if (a3 != 1)
  {
    if (a3) {
      return v20;
    }
    CGFloat v49 = v16;
    CGFloat v51 = v14;
    double MaxY = CGRectGetMaxY(*(CGRect *)&v14);
    v53.origin.CGFloat x = v7;
    v53.origin.CGFloat y = v9;
    v53.size.CGFloat width = v11;
    v53.size.CGFloat height = v13;
    CGFloat rect = v19;
    double v22 = CGRectGetMaxY(v53);
    [(ICTableAutoScroller *)self bottomThresholdDistance];
    if (MaxY > v22 - v23)
    {
      v54.origin.CGFloat x = v7;
      v54.origin.CGFloat y = v9;
      v54.size.CGFloat width = v11;
      v54.size.CGFloat height = v13;
      double v24 = CGRectGetMaxY(v54);
      v25 = [(ICTableAutoScroller *)self verticalScrollView];
      [v25 contentSize];
      double v27 = v26;

      if (v24 < v27)
      {
        v55.size.CGFloat width = v49;
        v55.origin.CGFloat x = v51;
        v55.origin.CGFloat y = v18;
        v55.size.CGFloat height = rect;
        double v28 = CGRectGetMaxY(v55);
        v56.origin.CGFloat x = v7;
        v56.origin.CGFloat y = v9;
        v56.size.CGFloat width = v11;
        v56.size.CGFloat height = v13;
        double v29 = v28 - CGRectGetMaxY(v56);
        double v20 = 2.0;
        if (v29 > 0.0)
        {
          v57.size.CGFloat width = v49;
          v57.origin.CGFloat x = v51;
          v57.origin.CGFloat y = v18;
          v57.size.CGFloat height = rect;
          double Height = CGRectGetHeight(v57);
LABEL_10:
          float v34 = v29 / (Height * 0.5) * 8.0 * (v29 / (Height * 0.5)) + 2.0;
          return floorf(v34);
        }
        return v20;
      }
    }
    v62.size.CGFloat width = v49;
    v62.origin.CGFloat x = v51;
    v62.origin.CGFloat y = v18;
    v62.size.CGFloat height = rect;
    double MinY = CGRectGetMinY(v62);
    v63.origin.CGFloat x = v7;
    v63.origin.CGFloat y = v9;
    v63.size.CGFloat width = v11;
    v63.size.CGFloat height = v13;
    double v37 = CGRectGetMinY(v63);
    [(ICTableAutoScroller *)self topThresholdDistance];
    if (MinY >= v37 + v38) {
      return v20;
    }
    v64.origin.CGFloat x = v7;
    v64.origin.CGFloat y = v9;
    v64.size.CGFloat width = v11;
    v64.size.CGFloat height = v13;
    double v39 = CGRectGetMinY(v64);
    [(ICTableAutoScroller *)self topThresholdDistance];
    if (v39 <= -v40) {
      return v20;
    }
    v65.size.CGFloat width = v49;
    v65.origin.CGFloat x = v51;
    v65.origin.CGFloat y = v18;
    v65.size.CGFloat height = rect;
    double v41 = CGRectGetMinY(v65);
    v66.origin.CGFloat x = v7;
    v66.origin.CGFloat y = v9;
    v66.size.CGFloat width = v11;
    v66.size.CGFloat height = v13;
    double v42 = v41 - CGRectGetMinY(v66);
    double v20 = -2.0;
    if (v42 >= 0.0) {
      return v20;
    }
    v67.size.CGFloat width = v49;
    v67.origin.CGFloat x = v51;
    v67.origin.CGFloat y = v18;
    v67.size.CGFloat height = rect;
    double Width = CGRectGetHeight(v67);
LABEL_18:
    float v46 = v42 / (Width * 0.5) * 8.0 * (v42 / (Width * 0.5)) + 2.0;
    return (float)-floorf(v46);
  }
  CGFloat v50 = v15;
  CGFloat v52 = v14;
  CGFloat v31 = v16;
  double MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  v58.origin.CGFloat x = v7;
  v58.origin.CGFloat y = v9;
  v58.size.CGFloat width = v11;
  v58.size.CGFloat height = v13;
  if (MaxX <= CGRectGetMaxX(v58))
  {
    v68.origin.CGFloat y = v50;
    v68.origin.CGFloat x = v52;
    v68.size.CGFloat width = v31;
    v68.size.CGFloat height = v19;
    double MinX = CGRectGetMinX(v68);
    v69.origin.CGFloat x = v7;
    v69.origin.CGFloat y = v9;
    v69.size.CGFloat width = v11;
    v69.size.CGFloat height = v13;
    if (MinX >= CGRectGetMinX(v69)) {
      return v20;
    }
    v70.origin.CGFloat y = v50;
    v70.origin.CGFloat x = v52;
    v70.size.CGFloat width = v31;
    v70.size.CGFloat height = v19;
    double v45 = CGRectGetMinX(v70);
    v71.origin.CGFloat x = v7;
    v71.origin.CGFloat y = v9;
    v71.size.CGFloat width = v11;
    v71.size.CGFloat height = v13;
    double v42 = v45 - CGRectGetMinX(v71);
    double v20 = -2.0;
    if (v42 >= 0.0) {
      return v20;
    }
    v72.origin.CGFloat y = v50;
    v72.origin.CGFloat x = v52;
    v72.size.CGFloat width = v31;
    v72.size.CGFloat height = v19;
    double Width = CGRectGetWidth(v72);
    goto LABEL_18;
  }
  v59.origin.CGFloat y = v50;
  v59.origin.CGFloat x = v52;
  v59.size.CGFloat width = v31;
  v59.size.CGFloat height = v19;
  double v33 = CGRectGetMaxX(v59);
  v60.origin.CGFloat x = v7;
  v60.origin.CGFloat y = v9;
  v60.size.CGFloat width = v11;
  v60.size.CGFloat height = v13;
  double v29 = v33 - CGRectGetMaxX(v60);
  double v20 = 2.0;
  if (v29 > 0.0)
  {
    v61.origin.CGFloat y = v50;
    v61.origin.CGFloat x = v52;
    v61.size.CGFloat width = v31;
    v61.size.CGFloat height = v19;
    double Height = CGRectGetWidth(v61);
    goto LABEL_10;
  }
  return v20;
}

- (void)autoScrollWithScrollFactor:(double)a3 scrollDirectionMode:(unint64_t)a4
{
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  if (a4 == 1)
  {
    double v27 = [(ICTableAutoScroller *)self horizontalScrollView];
    [v27 contentOffset];
    double v29 = v28;
    double v13 = v30;

    double v31 = v29 + a3;
    v32 = [(ICTableAutoScroller *)self horizontalScrollView];
    [v32 contentSize];
    double v34 = v33;
    id v35 = [(ICTableAutoScroller *)self horizontalScrollView];
    [v35 bounds];
    double v37 = v36;

    double v10 = 0.0;
    if (v31 >= 0.0)
    {
      double v10 = v31;
      if (v31 > v34 - v37) {
        double v10 = v34 - v37;
      }
    }
    double v38 = [(ICTableAutoScroller *)self horizontalScrollView];
    double v7 = a3;
    goto LABEL_16;
  }
  double v7 = *MEMORY[0x263F00148];
  if (a4) {
    goto LABEL_17;
  }
  double v8 = [(ICTableAutoScroller *)self verticalScrollView];
  [v8 contentOffset];
  double v10 = v9;
  double v12 = v11;

  double v13 = v12 + a3;
  CGFloat v14 = [(ICTableAutoScroller *)self verticalScrollView];
  [v14 contentInset];
  double v16 = -v15;

  double v17 = [(ICTableAutoScroller *)self verticalScrollView];
  [v17 contentSize];
  double v19 = v18;
  double v20 = [(ICTableAutoScroller *)self verticalScrollView];
  [v20 bounds];
  double v22 = v19 - v21;
  double v23 = [(ICTableAutoScroller *)self verticalScrollView];
  [v23 contentInset];
  double v25 = v22 + v24;

  if (v25 <= v16) {
    double v26 = v16;
  }
  else {
    double v26 = v25;
  }
  if (v13 < v16)
  {
    double v13 = v16;
LABEL_14:
    a3 = v6;
    goto LABEL_15;
  }
  if (v13 > v26)
  {
    double v13 = v26;
    goto LABEL_14;
  }
LABEL_15:
  double v38 = [(ICTableAutoScroller *)self verticalScrollView];
  double v6 = a3;
LABEL_16:
  objc_msgSend(v38, "setContentOffset:", v10, v13);

LABEL_17:
  double v39 = [(ICTableAutoScroller *)self delegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    id v41 = [(ICTableAutoScroller *)self delegate];
    objc_msgSend(v41, "tableAutoScroller:scrollOffsetDelta:", self, v7, v6);
  }
}

- (void)stopAutoscrollTimer
{
  v3 = [(ICTableAutoScroller *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(ICTableAutoScroller *)self delegate];
    [v5 tableAutoScrollerWillStopScrolling:self];
  }
  double v6 = [(ICTableAutoScroller *)self autoscrollTimer];
  [v6 invalidate];

  [(ICTableAutoScroller *)self setAutoscrollTimer:0];

  [(ICTableAutoScroller *)self setIsScrolling:0];
}

- (UIScrollView)targetScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetScrollView);

  return (UIScrollView *)WeakRetained;
}

- (ICTableAutoScrollerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICTableAutoScrollerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)scrollDirectionMode
{
  return self->_scrollDirectionMode;
}

- (void)setScrollDirectionMode:(unint64_t)a3
{
  self->_scrollDirectionMode = a3;
}

- (double)topThresholdDistance
{
  return self->_topThresholdDistance;
}

- (void)setTopThresholdDistance:(double)a3
{
  self->_topThresholdDistance = a3;
}

- (double)bottomThresholdDistance
{
  return self->_bottomThresholdDistance;
}

- (void)setBottomThresholdDistance:(double)a3
{
  self->_bottomThresholdDistance = a3;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);

  return (ICTableAttachmentViewController *)WeakRetained;
}

- (void)setTableAttachmentViewController:(id)a3
{
}

- (UIScrollView)verticalScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_verticalScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setVerticalScrollView:(id)a3
{
}

- (ICTableScrollView)horizontalScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_horizontalScrollView);

  return (ICTableScrollView *)WeakRetained;
}

- (void)setHorizontalScrollView:(id)a3
{
}

- (NSTimer)autoscrollTimer
{
  return self->_autoscrollTimer;
}

- (void)setAutoscrollTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_destroyWeak((id *)&self->_horizontalScrollView);
  objc_destroyWeak((id *)&self->_verticalScrollView);
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_targetScrollView);
}

@end