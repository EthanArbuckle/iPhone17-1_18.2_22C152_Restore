@interface UIDebuggingZoomLoupeView
- (CGPoint)currentlyInspectedPoint;
- (UIDebuggingZoomDelegate)delegate;
- (UIDebuggingZoomLoupeView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setCurrentlyInspectedPoint:(CGPoint)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UIDebuggingZoomLoupeView

- (UIDebuggingZoomLoupeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIDebuggingZoomLoupeView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [(UIView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(UIView *)self window];
  v5 = [v4 _screen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  v10 = [(UIView *)self window];
  v11 = [v10 layer];

  if (v11)
  {
    v12 = +[UIDebuggingInformationOverlay overlay];
    id v51 = [v12 inspectedWindow];

    v13 = [v51 layer];
    [(UIView *)self frame];
    objc_msgSend(v13, "convertRect:toLayer:", 0);
    double v15 = v14;
    double v17 = v16;

    double v18 = v15 / 1.2;
    double v19 = v17 / 1.2;
    [(UIDebuggingZoomLoupeView *)self currentlyInspectedPoint];
    double v21 = v20 - v18 * 0.5;
    [(UIDebuggingZoomLoupeView *)self currentlyInspectedPoint];
    double v23 = v22 - v17 / 1.2 * 0.5;
    double v24 = v18 + v21;
    double v25 = v18 * 0.2 * 0.5;
    double v26 = v7 + v25;
    double v27 = -v25;
    double v28 = 0.0;
    if (v21 >= -v25)
    {
      double v28 = v21;
      double v27 = v21;
    }
    double v29 = v7 - v18 + v25;
    if (v24 > v26) {
      double v30 = v7 - v18;
    }
    else {
      double v30 = v28;
    }
    if (v24 > v26) {
      double v31 = v29;
    }
    else {
      double v31 = v27;
    }
    double v32 = v19 * 0.2 * 0.5;
    if (v19 + v23 <= v9 + v32)
    {
      double v34 = -v32;
      double v33 = v23;
      if (v23 < v34)
      {
        double v23 = 0.0;
        double v33 = v34;
      }
    }
    else
    {
      double v23 = v9 - v19;
      double v33 = v9 - v19 + v32;
    }
    [(UIDebuggingZoomLoupeView *)self currentlyInspectedPoint];
    double v50 = (v35 - v30) * 1.2;
    [(UIDebuggingZoomLoupeView *)self currentlyInspectedPoint];
    double v37 = (v36 - v23) * 1.2;
    v38 = [(UIDebuggingZoomLoupeView *)self delegate];
    v39 = (CGImage *)objc_msgSend(v38, "newCaptureSnapshotAtRect:window:", v51, v31, v33, v18, v19);

    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v41 = 0;
    }
    else {
      v41 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v41);
    CGFloat v42 = *MEMORY[0x1E4F1DAD8];
    CGFloat v43 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UIView *)self frame];
    CGFloat width = v53.size.width;
    CGFloat height = v53.size.height;
    v53.origin.x = v42;
    v53.origin.y = v43;
    CGContextClipToRect(v41, v53);
    CGContextScaleCTM(v41, 1.2, 1.2);
    CGContextTranslateCTM(v41, fabs(v18) * -0.1, fabs(v19) * -0.1);
    CGContextTranslateCTM(v41, 0.0, height);
    CGContextScaleCTM(v41, 1.0, -1.0);
    v54.origin.x = v42;
    v54.origin.y = v43;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    CGContextDrawImage(v41, v54, v39);
    CGImageRelease(v39);
    CGContextRestoreGState(v41);
    CGContextSaveGState(v41);
    v46 = +[UIColor redColor];
    [v46 set];

    v47 = +[UIScreen mainScreen];
    [v47 scale];
    CGFloat v49 = 1.0 / v48;

    v55.origin.x = v50 + -2.0;
    v55.origin.y = v37 + -2.0;
    v55.size.CGFloat width = 4.0;
    v55.size.CGFloat height = 4.0;
    CGContextStrokeRectWithWidth(v41, v55, v49);
    CGContextRestoreGState(v41);
  }
}

- (void)setCurrentlyInspectedPoint:(CGPoint)a3
{
  self->_currentlyInspectedPoint = a3;
  [(UIView *)self setNeedsDisplay];
}

- (CGPoint)currentlyInspectedPoint
{
  double x = self->_currentlyInspectedPoint.x;
  double y = self->_currentlyInspectedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIDebuggingZoomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDebuggingZoomDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end