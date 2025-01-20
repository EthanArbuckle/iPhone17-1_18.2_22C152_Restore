@interface UISelectionGrabberDot
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_extendedHitTestingRectWithEvent:(id)a3 includingCalloutBarAdjustments:(BOOL)a4;
- (CGRect)_extendedHitTestingRectWithPrecision:(unint64_t)a3 includingCalloutBarAdjustments:(BOOL)a4;
- (UISelectionGrabber)grabber;
- (UISelectionGrabberDot)initWithFrame:(CGRect)a3 container:(id)a4;
- (id)_rasterizedDotImageForScale:(double)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (int)textEffectsVisibilityLevelInKeyboardWindow;
- (void)redrawRasterizedImageForScale:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrabber:(id)a3;
@end

@implementation UISelectionGrabberDot

- (UISelectionGrabberDot)initWithFrame:(CGRect)a3 container:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UISelectionGrabberDot;
  v4 = -[UIImageView initWithFrame:](&v8, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(UIImageView *)v4 setContentMode:0];
    v6 = v5;
  }

  return v5;
}

- (id)_rasterizedDotImageForScale:(double)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  [(UIView *)self bounds];
  double v8 = v7;
  if (v6 == 0.0 && v7 == 0.0)
  {
    v9 = 0;
    goto LABEL_24;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, a3);
  v10 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v6, v8);
  v11 = [(UISelectionGrabberDot *)self grabber];
  v12 = [v11 hostView];
  v13 = [v12 container];

  if (objc_opt_respondsToSelector()) {
    [v13 selectionBarColor];
  }
  else {
  v14 = +[UIColor selectionGrabberColor];
  }
  [v14 set];
  [v10 fill];
  v15 = [(UISelectionGrabberDot *)self grabber];
  v16 = [v15 customPath];

  if (!v16)
  {
    v17 = [(UISelectionGrabberDot *)self grabber];
    v18 = [v17 window];
    v19 = [(UIView *)self window];

    v20 = [(UISelectionGrabberDot *)self grabber];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [(UISelectionGrabberDot *)self grabber];
    v30 = [v29 superview];
    if (v18 == v19) {
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v30, v22, v24, v26, v28);
    }
    else {
      -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v30, v22, v24, v26, v28);
    }
    double v35 = v31;
    double v36 = v32;
    CGFloat v37 = v33;
    CGFloat v38 = v34;

    v39 = [(UISelectionGrabberDot *)self grabber];
    int v40 = [v39 isPointedDown];

    if (v40)
    {
      [(UIView *)self size];
      double v36 = v41 + -1.0;
    }
    else
    {
      v42 = [(UISelectionGrabberDot *)self grabber];
      int v43 = [v42 isPointedUp];

      if (!v43)
      {
        v44 = [(UISelectionGrabberDot *)self grabber];
        int v45 = [v44 isPointedRight];

        if (v45)
        {
          [(UIView *)self size];
          double v35 = v46 + -1.0;
        }
        else
        {
          v47 = [(UISelectionGrabberDot *)self grabber];
          int v48 = [v47 isPointedLeft];

          if (!v48)
          {
            double v35 = *MEMORY[0x1E4F1DB28];
            double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
            CGFloat v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
            CGFloat v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
            goto LABEL_22;
          }
          double v35 = 0.0;
        }
        CGFloat v37 = 1.0;
LABEL_22:
        UIRectFillUsingOperation(1, v35, v36, v37, v38);
        goto LABEL_23;
      }
      double v36 = 0.0;
    }
    CGFloat v38 = 1.0;
    goto LABEL_22;
  }
LABEL_23:
  v9 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

LABEL_24:
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UISelectionGrabberDot *)self _extendedHitTestingRectWithEvent:a4 includingCalloutBarAdjustments:0];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)_extendedHitTestingRectWithEvent:(id)a3 includingCalloutBarAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 _inputPrecision];
  [(UISelectionGrabberDot *)self _extendedHitTestingRectWithPrecision:v6 includingCalloutBarAdjustments:v4];
  result.size.height = v10;
  result.size.width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)_extendedHitTestingRectWithPrecision:(unint64_t)a3 includingCalloutBarAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (a3 == 2) {
    double v15 = -6.0;
  }
  else {
    double v15 = -15.0;
  }
  [(UIView *)self _scaleFromLayerTransforms];
  if (v16 < 1.0) {
    double v16 = 1.0;
  }
  if (v17 < 1.0) {
    double v17 = 1.0;
  }
  double v18 = v15 / v16;
  double v19 = v15 / v17;
  v36.origin.double x = v8;
  v36.origin.double y = v10;
  v36.size.double width = v12;
  v36.size.double height = v14;
  CGRect v37 = CGRectInset(v36, v18, v19);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  if (v4)
  {
    double v24 = [(UISelectionGrabberDot *)self grabber];
    int v25 = [v24 isVertical];

    double v26 = [(UISelectionGrabberDot *)self grabber];
    double v27 = v26;
    if (v25)
    {
      double height = height + v19;
      int v28 = [v26 isPointedDown];

      double v29 = 0.0;
      if (v28) {
        double v29 = v19;
      }
      double y = y - v29;
    }
    else
    {
      double width = width + v18;
      int v30 = [v26 isPointedLeft];

      double v31 = 0.0;
      if (v30) {
        double v31 = v18;
      }
      double x = x - v31;
    }
  }
  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UISelectionGrabberDot *)self _extendedHitTestingRectWithEvent:a4 includingCalloutBarAdjustments:1];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  if (CGRectContainsPoint(v13, v12))
  {
    double v7 = [(UISelectionGrabberDot *)self grabber];
    CGFloat v8 = [v7 hostView];
  }
  else
  {
    CGFloat v8 = 0;
  }
  if ([v8 isUserInteractionEnabled]) {
    double v9 = v8;
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 11;
}

- (int)textEffectsVisibilityLevel
{
  return 11;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  CGPoint v12 = [(UIView *)self window];
  objc_msgSend(v12, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
  double v14 = v13;

  if (v14 == 1.0)
  {
    double v15 = [(UIView *)self window];
    double x = pixelAlignedRectForRect(v15);
    double y = v16;
    double width = v17;
    double height = v18;
  }
  v19.receiver = self;
  v19.super_class = (Class)UISelectionGrabberDot;
  -[UIImageView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(UISelectionGrabberDot *)self redrawRasterizedImageForScale:1.0];
  }
}

- (void)redrawRasterizedImageForScale:(double)a3
{
  [(UIView *)self _currentScreenScale];
  uint64_t v6 = [(UISelectionGrabberDot *)self _rasterizedDotImageForScale:v5 * a3];
  [(UIImageView *)self setImage:v6];

  [(UIImageView *)self setContentScaleFactor:1.0];
}

- (UISelectionGrabber)grabber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_grabber);
  return (UISelectionGrabber *)WeakRetained;
}

- (void)setGrabber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end