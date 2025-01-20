@interface BKScrubberSliderContainerView
- (UIEdgeInsets)thumbTouchInsets;
- (UIImageView)thumbView;
- (UIView)bufferedView;
- (UIView)sessionIndicatorView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setBufferedView:(id)a3;
- (void)setSessionIndicatorView:(id)a3;
- (void)setThumbTouchInsets:(UIEdgeInsets)a3;
- (void)setThumbView:(id)a3;
@end

@implementation BKScrubberSliderContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(BKScrubberSliderContainerView *)self sessionIndicatorView];
  [v8 convertPoint:self x:y];
  unsigned int v9 = [v8 pointInside:v7];

  if (!v9) {
    goto LABEL_3;
  }
  [v8 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18 = [(BKScrubberSliderContainerView *)self thumbView];
  [v18 frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(BKScrubberSliderContainerView *)self thumbView];
  [v8 convertRect:v27 fromView:v20];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  [(BKScrubberSliderContainerView *)self thumbTouchInsets];
  CGFloat v37 = v31 + v36;
  CGFloat v40 = v33 - (v38 + v39);
  v45.size.height = v35 - (v36 + v41);
  v45.origin.double x = v29 + v38;
  v45.origin.double y = v37;
  v45.size.width = v40;
  v46.origin.double x = v11;
  v46.origin.double y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  if (!CGRectIntersectsRect(v45, v46)) {
    id v42 = v8;
  }
  else {
LABEL_3:
  }
    id v42 = 0;

  return v42;
}

- (UIView)bufferedView
{
  return self->_bufferedView;
}

- (void)setBufferedView:(id)a3
{
}

- (UIView)sessionIndicatorView
{
  return self->_sessionIndicatorView;
}

- (void)setSessionIndicatorView:(id)a3
{
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
}

- (UIEdgeInsets)thumbTouchInsets
{
  double top = self->_thumbTouchInsets.top;
  double left = self->_thumbTouchInsets.left;
  double bottom = self->_thumbTouchInsets.bottom;
  double right = self->_thumbTouchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setThumbTouchInsets:(UIEdgeInsets)a3
{
  self->_thumbTouchInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorView, 0);

  objc_storeStrong((id *)&self->_bufferedView, 0);
}

@end