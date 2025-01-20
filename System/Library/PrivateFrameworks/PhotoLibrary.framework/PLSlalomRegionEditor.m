@interface PLSlalomRegionEditor
- (BOOL)_isTouch:(id)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5;
- (BOOL)_isZoomed;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isZoomAnimating;
- (CGRect)_handleFrameForValue:(double)a3 isStart:(BOOL)a4;
- (CGRect)_trackFrame;
- (CGRect)_trackFrameNoZoom;
- (CGRect)endHandleFrame;
- (CGRect)startHandleFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (PLSlalomRegionEditor)initWithFrame:(CGRect)a3;
- (PLSlalomRegionEditorDelegate)delegate;
- (UIEdgeInsets)trackInsets;
- (double)_trackScale;
- (double)_trimHandleWidth;
- (double)_valueFromEndHandleFrame:(CGRect)a3;
- (double)_valueFromHandleFrame:(CGRect)a3 isStart:(BOOL)a4;
- (double)_valueFromStartHandleFrame:(CGRect)a3;
- (double)_zoomMaxValue;
- (double)_zoomMinValue;
- (double)endValue;
- (double)maxValue;
- (double)minValue;
- (double)startValue;
- (double)trimHandleWidth;
- (double)zoomDelay;
- (id)_handleImage;
- (id)_handleTintColor;
- (id)_tickColor;
- (id)_trackColor;
- (id)_trackImageForZoom:(BOOL)a3;
- (unint64_t)regionEditorStyle;
- (void)_beginTrackingZoomWithTouch:(id)a3;
- (void)_cancelTrackingZoom;
- (void)_cancelZoom;
- (void)_cancelZoomTrackingIfNeccessaryWithTouch:(id)a3;
- (void)_drawCurveWithFlatEndsFromX:(double)a3 fromY:(double)a4 toX:(double)a5 toY:(double)a6;
- (void)_stopTrackingAndSendControlEvents:(unint64_t)a3;
- (void)_updateSlidersWithTouch:(id)a3;
- (void)_updateTrack;
- (void)_zoomPressWasHeld;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndValue:(double)a3;
- (void)setEndValue:(double)minValue notify:(BOOL)a4;
- (void)setMaxValue:(double)maxValue;
- (void)setMinValue:(double)minValue;
- (void)setRegionEditorStyle:(unint64_t)a3;
- (void)setStartValue:(double)a3;
- (void)setStartValue:(double)minValue notify:(BOOL)a4;
- (void)setTrackInsets:(UIEdgeInsets)a3;
- (void)setTrimHandleWidth:(double)a3;
- (void)setZoomAnimating:(BOOL)a3;
- (void)setZoomDelay:(double)a3;
- (void)setZoomMinValue:(double)a3 maxValue:(double)a4;
@end

@implementation PLSlalomRegionEditor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackSnapshotView, 0);
  objc_storeStrong((id *)&self->_trackImageView, 0);
  objc_storeStrong((id *)&self->_endHandleView, 0);
  objc_storeStrong((id *)&self->_startHandleView, 0);
}

- (BOOL)isZoomAnimating
{
  return self->_zoomAnimating;
}

- (void)setZoomDelay:(double)a3
{
  self->_zoomDelay = a3;
}

- (double)zoomDelay
{
  return self->_zoomDelay;
}

- (double)endValue
{
  return self->_endValue;
}

- (double)startValue
{
  return self->_startValue;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (double)minValue
{
  return self->_minValue;
}

- (unint64_t)regionEditorStyle
{
  return self->_regionEditorStyle;
}

- (void)setTrimHandleWidth:(double)a3
{
  self->_trimHandleWidth = a3;
}

- (double)trimHandleWidth
{
  return self->_trimHandleWidth;
}

- (UIEdgeInsets)trackInsets
{
  double top = self->_trackInsets.top;
  double left = self->_trackInsets.left;
  double bottom = self->_trackInsets.bottom;
  double right = self->_trackInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PLSlalomRegionEditorDelegate *)a3;
}

- (PLSlalomRegionEditorDelegate)delegate
{
  return self->_delegate;
}

- (id)_handleImage
{
  v2 = PLPhotoLibraryFrameworkBundle();
  v3 = [MEMORY[0x1E4F42A80] imageNamed:@"PLSlalomGrabberHandle.png" inBundle:v2];
  v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

- (void)_drawCurveWithFlatEndsFromX:(double)a3 fromY:(double)a4 toX:(double)a5 toY:(double)a6
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextAddCurveToPoint(CurrentContext, a5 * 0.5 + a3 * 0.5, a4, a5 * 0.5 + a3 * 0.5, a6, a5, a6);
}

- (id)_handleTintColor
{
  unint64_t v2 = [(PLSlalomRegionEditor *)self regionEditorStyle];
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F428B8] blackColor];
  }
  return v3;
}

- (id)_trackColor
{
  unint64_t v2 = [(PLSlalomRegionEditor *)self regionEditorStyle];
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = [MEMORY[0x1E4F428B8] whiteColor];
LABEL_5:
    v4 = v3;
    v5 = [v3 colorWithAlphaComponent:0.1];

    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  return v5;
}

- (id)_tickColor
{
  unint64_t v2 = [(PLSlalomRegionEditor *)self regionEditorStyle];
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  return v3;
}

- (id)_trackImageForZoom:(BOOL)a3
{
  [(PLSlalomRegionEditor *)self _trackFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [(PLSlalomRegionEditor *)self startHandleFrame];
  double v13 = v12;
  double v15 = v14;
  CGFloat v57 = v17;
  CGFloat v58 = v16;
  [(PLSlalomRegionEditor *)self endHandleFrame];
  CGFloat v55 = v19;
  CGFloat v56 = v18;
  CGFloat v20 = v13 - v5;
  CGFloat v21 = v15 - v7;
  CGFloat v53 = v23 - v7;
  CGFloat v54 = v22 - v5;
  CGFloat v25 = *MEMORY[0x1E4F1DAD8];
  CGFloat v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PLSlalomRegionEditor *)self _trackScale];
  double v27 = v26;
  v28 = [MEMORY[0x1E4F42D90] mainScreen];
  [v28 scale];
  CGFloat v30 = v29;
  v60.width = v9;
  v60.height = v11;
  UIGraphicsBeginImageContextWithOptions(v60, 0, v30);

  CurrentContext = UIGraphicsGetCurrentContext();
  v32 = [(PLSlalomRegionEditor *)self _trackColor];
  [v32 setFill];

  v61.origin.x = v25;
  v61.origin.y = v24;
  v61.size.width = v9;
  v61.size.height = v11;
  CGContextFillRect(CurrentContext, v61);
  CGContextSetLineWidth(CurrentContext, 1.0);
  CGContextSetLineCap(CurrentContext, kCGLineCapSquare);
  v62.origin.x = v25;
  v62.origin.y = v24;
  v62.size.width = v9;
  v62.size.height = v11;
  double MinX = CGRectGetMinX(v62);
  v63.origin.x = v25;
  v63.origin.y = v24;
  v63.size.width = v9;
  v63.size.height = v11;
  double MaxX = CGRectGetMaxX(v63);
  v64.origin.x = v20;
  v64.origin.y = v21;
  v64.size.height = v57;
  v64.size.width = v58;
  double MidX = CGRectGetMidX(v64);
  v65.origin.y = v53;
  v65.origin.x = v54;
  v65.size.height = v55;
  v65.size.width = v56;
  double v36 = CGRectGetMidX(v65);
  double v37 = v27 * 3.0;
  double v38 = v27 * 9.0;
  double v39 = 1.0 / v9;
  double startValue = self->_startValue;
  if (v9 == 0.0) {
    double v39 = 0.0;
  }
  double v41 = startValue - self->_minValue;
  double endValue = self->_endValue;
  double v43 = endValue - startValue;
  BOOL v44 = v43 >= v39 && self->_maxValue - endValue < v39;
  if (v41 >= v39 || v43 < v39)
  {
    for (double i = v37 * floor(MinX / v37); i <= MidX; double i = v37 + i)
    {
      CGContextMoveToPoint(CurrentContext, i, 0.0);
      CGContextAddLineToPoint(CurrentContext, i, 7.0);
    }
    double MinX = MidX;
  }
  if (v44) {
    double v47 = MaxX;
  }
  else {
    double v47 = v36;
  }
  for (double j = v38 * ceil(MinX / v38); j <= v47; double j = v38 + j)
  {
    CGContextMoveToPoint(CurrentContext, j, 0.0);
    CGContextAddLineToPoint(CurrentContext, j, 7.0);
  }
  if (!v44)
  {
    for (double k = v37 * ceil(v36 / v37); k <= MaxX; double k = v37 + k)
    {
      CGContextMoveToPoint(CurrentContext, k, 0.0);
      CGContextAddLineToPoint(CurrentContext, k, 7.0);
    }
  }
  v49 = [(PLSlalomRegionEditor *)self _tickColor];
  [v49 setStroke];

  CGContextStrokePath(CurrentContext);
  v50 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v50;
}

- (void)_updateTrack
{
  id v3 = [(PLSlalomRegionEditor *)self _trackImageForZoom:0];
  [(UIImageView *)self->_trackImageView setImage:v3];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!*(_WORD *)&self->_draggingStart) {
    goto LABEL_14;
  }
  double v6 = [v4 view];

  if (v6 == self) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 numberOfTouchesRequired] != 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v5 minimumNumberOfTouches] <= 1)
    {
      [v5 translationInView:self];
      BOOL v18 = fabs(v19) <= fabs(v20);
      goto LABEL_15;
    }
LABEL_14:
    BOOL v18 = 1;
    goto LABEL_15;
  }
  double v7 = [v5 view];
  -[PLSlalomRegionEditor convertPoint:toView:](self, "convertPoint:toView:", v7, 10.0, 10.0);
  double v9 = v8;
  double v11 = v10;

  double v12 = [v5 view];
  -[PLSlalomRegionEditor convertPoint:toView:](self, "convertPoint:toView:", v12, 20.0, 10.0);
  double v14 = v13;
  double v16 = v15;

  if (([v5 direction] & 3) == 0 || (v18 = 0, double v17 = v9 - v14, v9 - v14 >= 0.0) && v9 - v14 <= 0.0) {
    BOOL v18 = (objc_msgSend(v5, "direction", v17) & 0xC) == 0 || v11 - v16 == 0.0;
  }
LABEL_15:

  return v18;
}

- (void)_cancelZoom
{
  if (self->_zoomed)
  {
    self->_zoomed = 0;
    [(PLSlalomRegionEditorDelegate *)self->_delegate slalomRegionEditorRequestForceUnzoom:self];
  }
}

- (void)_zoomPressWasHeld
{
  self->_zoomed = [(PLSlalomRegionEditorDelegate *)self->_delegate slalomRegionEditorRequestForceZoom:self];
}

- (void)_cancelTrackingZoom
{
  if (self->_trackingZoom && !self->_zoomed)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__zoomPressWasHeld object:0];
    self->_trackingZoom = 0;
  }
}

- (void)_cancelZoomTrackingIfNeccessaryWithTouch:(id)a3
{
  [a3 locationInView:self];
  if (vabdd_f64(v4, self->_touchLocationWhenTrackingZoomBegan.x) > 4.0)
  {
    [(PLSlalomRegionEditor *)self _cancelTrackingZoom];
  }
}

- (void)_beginTrackingZoomWithTouch:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_zoomed)
  {
    self->_trackingZoom = 1;
    id v7 = v4;
    [v4 locationInView:self];
    self->_touchLocationWhenTrackingZoomBegan.x = v5;
    self->_touchLocationWhenTrackingZoomBegan.y = v6;
    [(PLSlalomRegionEditor *)self performSelector:sel__zoomPressWasHeld withObject:0 afterDelay:self->_zoomDelay];
    id v4 = v7;
  }
}

- (void)_updateSlidersWithTouch:(id)a3
{
  id v4 = a3;
  if (v4 && (self->_draggingStart || self->_draggingEnd))
  {
    double v16 = v4;
    if (![(PLSlalomRegionEditor *)self isZoomAnimating])
    {
      if (self->_draggingStart) {
        [(PLSlalomRegionEditor *)self startHandleFrame];
      }
      else {
        [(PLSlalomRegionEditor *)self endHandleFrame];
      }
      double v9 = v5;
      double v10 = v6;
      double v11 = v7;
      double v12 = v8;
      [v16 locationInView:self];
      double v14 = v13;
      v18.origin.x = v9;
      v18.origin.y = v10;
      v18.size.width = v11;
      v18.size.height = v12;
      double v15 = v9 + v14 - CGRectGetMidX(v18) - self->_touchOffset;
      if (self->_draggingStart)
      {
        -[PLSlalomRegionEditor _valueFromStartHandleFrame:](self, "_valueFromStartHandleFrame:", v15, v10, v11, v12);
        -[PLSlalomRegionEditor setStartValue:notify:](self, "setStartValue:notify:", 1);
      }
      else
      {
        -[PLSlalomRegionEditor _valueFromEndHandleFrame:](self, "_valueFromEndHandleFrame:", v15, v10, v11, v12);
        -[PLSlalomRegionEditor setEndValue:notify:](self, "setEndValue:notify:", 1);
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)_stopTrackingAndSendControlEvents:(unint64_t)a3
{
  if (self->_draggingStart)
  {
    self->_draggingStart = 0;
    self->_BOOL draggingEnd = 0;
  }
  else
  {
    BOOL draggingEnd = self->_draggingEnd;
    self->_draggingStart = 0;
    self->_BOOL draggingEnd = 0;
    if (!draggingEnd) {
      goto LABEL_5;
    }
  }
  [(PLSlalomRegionEditorDelegate *)self->_delegate slalomRegionEditorDidEndEditing:self];
  [(PLSlalomRegionEditor *)self sendActionsForControlEvents:a3];
LABEL_5:
  [(PLSlalomRegionEditor *)self _cancelTrackingZoom];
  [(PLSlalomRegionEditor *)self _cancelZoom];
}

- (void)cancelTrackingWithEvent:(id)a3
{
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[PLSlalomRegionEditor _updateSlidersWithTouch:](self, "_updateSlidersWithTouch:", a3, a4);
  [(PLSlalomRegionEditor *)self _stopTrackingAndSendControlEvents:64];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(PLSlalomRegionEditor *)self _updateSlidersWithTouch:v5];
  if (*(_WORD *)&self->_draggingStart)
  {
    [(PLSlalomRegionEditor *)self _cancelZoomTrackingIfNeccessaryWithTouch:v5];
    [(PLSlalomRegionEditor *)self _beginTrackingZoomWithTouch:v5];
  }

  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v16 = 1.79769313e308;
  double v17 = 1.79769313e308;
  BOOL v6 = [(PLSlalomRegionEditor *)self _isTouch:v5 inHandleIsStart:1 outTouchOffset:&v17];
  BOOL v7 = [(PLSlalomRegionEditor *)self _isTouch:v5 inHandleIsStart:0 outTouchOffset:&v16];
  double v9 = v16;
  double v8 = v17;
  double v10 = fabs(v17);
  double v11 = fabs(v16);
  BOOL v12 = v10 < v11;
  BOOL v13 = v10 >= v11;
  if (!v7)
  {
    BOOL v12 = v6;
    BOOL v13 = 0;
  }
  if (!v6)
  {
    BOOL v12 = 0;
    BOOL v13 = v7;
  }
  self->_draggingStart = v12;
  self->_BOOL draggingEnd = v13;
  if (!v12) {
    double v8 = v9;
  }
  self->_touchOffset = v8;
  if (self->_draggingStart || v13)
  {
    [(PLSlalomRegionEditor *)self _beginTrackingZoomWithTouch:v5];
    [(PLSlalomRegionEditorDelegate *)self->_delegate slalomRegionEditorDidBeginEditing:self withStartHandle:self->_draggingStart];
    [(PLSlalomRegionEditor *)self sendActionsForControlEvents:1];
  }

  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLSlalomRegionEditor *)self isEnabled] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PLSlalomRegionEditor;
    [(PLSlalomRegionEditor *)&v6 setEnabled:v3];
    if ([(PLSlalomRegionEditor *)self isEnabled]) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.5;
    }
    [(UIImageView *)self->_startHandleView setAlpha:v5];
    [(UIImageView *)self->_endHandleView setAlpha:v5];
    [(UIImageView *)self->_trackImageView setAlpha:v5];
    [(UIImageView *)self->_trackSnapshotView setAlpha:v5];
  }
}

- (BOOL)_isTouch:(id)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5
{
  BOOL v6 = a4;
  [a3 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  if (v6) {
    [(PLSlalomRegionEditor *)self startHandleFrame];
  }
  else {
    [(PLSlalomRegionEditor *)self endHandleFrame];
  }
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  CGFloat v18 = v14;
  CGFloat v19 = v15;
  double MidX = CGRectGetMidX(*(CGRect *)&v12);
  v24.origin.x = v16;
  v24.origin.y = v17;
  v24.size.width = v18;
  v24.size.height = v19;
  double MidY = CGRectGetMidY(v24);
  BOOL v22 = vabdd_f64(v9, MidX) <= 44.0;
  BOOL result = vabdd_f64(v11, MidY) <= 44.0 && v22;
  *a5 = v9 - MidX;
  return result;
}

- (double)_valueFromHandleFrame:(CGRect)a3 isStart:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PLSlalomRegionEditor *)self _trackFrame];
  if (v10 <= 0.0) {
    return 0.0;
  }
  double v11 = v9;
  double v12 = v10;
  [(PLSlalomRegionEditor *)self _trimHandleWidth];
  double v14 = v13;
  double v15 = v12 + v13 * -2.0;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  return self->_minValue + (CGRectGetMidX(v17) - (v11 + v14)) / v15 * (self->_maxValue - self->_minValue);
}

- (CGRect)_handleFrameForValue:(double)a3 isStart:(BOOL)a4
{
  [(PLSlalomRegionEditor *)self _trackFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double minValue = self->_minValue;
  double maxValue = self->_maxValue;
  if (minValue == maxValue) {
    double v16 = 0.0;
  }
  else {
    double v16 = (a3 - minValue) / (maxValue - minValue);
  }
  CGRect v17 = [(UIImageView *)self->_startHandleView image];
  [v17 size];
  double v19 = v18;
  double v21 = v20;

  [(PLSlalomRegionEditor *)self _trimHandleWidth];
  float v23 = v19 * -0.5 + (v11 + v22 * -2.0) * v16;
  double v24 = v7 + v22 + roundf(v23);
  float v25 = (v13 - v21) * 0.5;
  double v26 = v9 + roundf(v25);
  double v27 = v19;
  double v28 = v21;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v24;
  return result;
}

- (double)_trimHandleWidth
{
  double trimHandleWidth = self->_trimHandleWidth;
  [(PLSlalomRegionEditor *)self _trackScale];
  return trimHandleWidth * v3;
}

- (double)_trackScale
{
  [(PLSlalomRegionEditor *)self _zoomMinValue];
  double v4 = v3;
  [(PLSlalomRegionEditor *)self _zoomMaxValue];
  double v6 = v5 - v4;
  double v7 = self->_maxValue - self->_minValue;
  BOOL v8 = v7 == 0.0 || v6 == 0.0;
  double result = v7 / v6;
  if (v8) {
    return 1.0;
  }
  return result;
}

- (CGRect)_trackFrame
{
  [(PLSlalomRegionEditor *)self _trackFrameNoZoom];
  double x = v3;
  CGFloat y = v5;
  double width = v7;
  CGFloat height = v9;
  if ([(PLSlalomRegionEditor *)self _isZoomed])
  {
    [(PLSlalomRegionEditor *)self _zoomMinValue];
    double v12 = v11;
    [(PLSlalomRegionEditor *)self _zoomMaxValue];
    double v14 = v13 - v12;
    if (v14 != 0.0)
    {
      double minValue = self->_minValue;
      double v16 = self->_maxValue - minValue;
      if (v16 != 0.0)
      {
        double v17 = v16 / v14;
        v22.size.double width = width * v17;
        v22.origin.double x = x
                     - ((v12 - minValue) / v16 * (width * v17 + v17 * -2.0 * self->_trimHandleWidth)
                      + (v17 + -1.0) * self->_trimHandleWidth);
        v22.origin.CGFloat y = y;
        v22.size.CGFloat height = height;
        CGRect v23 = CGRectIntegral(v22);
        double x = v23.origin.x;
        CGFloat y = v23.origin.y;
        double width = v23.size.width;
        CGFloat height = v23.size.height;
      }
    }
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_trackFrameNoZoom
{
  [(PLSlalomRegionEditor *)self bounds];
  double top = self->_trackInsets.top;
  double left = self->_trackInsets.left;
  double v6 = v5 + left;
  double v9 = v8 - (left + self->_trackInsets.right);
  *(float *)&double v10 = (v10 - (top + self->_trackInsets.bottom) + -7.0) * 0.5;
  double v11 = v7 + top + roundf(*(float *)&v10);
  double v12 = 7.0;
  return CGRectIntegral(*(CGRect *)&v6);
}

- (double)_valueFromEndHandleFrame:(CGRect)a3
{
  -[PLSlalomRegionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)_valueFromStartHandleFrame:(CGRect)a3
{
  -[PLSlalomRegionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CGRect)endHandleFrame
{
  [(PLSlalomRegionEditor *)self _handleFrameForValue:0 isStart:self->_endValue];
  result.size.CGFloat height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)startHandleFrame
{
  [(PLSlalomRegionEditor *)self _handleFrameForValue:1 isStart:self->_startValue];
  result.size.CGFloat height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setRegionEditorStyle:(unint64_t)a3
{
  if (self->_regionEditorStyle != a3)
  {
    self->_regionEditorStyle = a3;
    id v4 = [(PLSlalomRegionEditor *)self _handleTintColor];
    [(UIImageView *)self->_startHandleView setTintColor:v4];
    [(UIImageView *)self->_endHandleView setTintColor:v4];
    self->_forceLayout = 1;
    [(PLSlalomRegionEditor *)self setNeedsLayout];
    [(PLSlalomRegionEditor *)self layoutIfNeeded];
  }
}

- (void)setZoomAnimating:(BOOL)a3
{
  if (self->_zoomAnimating != a3)
  {
    self->_zoomAnimating = a3;
    if (!a3) {
      [(UIImageView *)self->_trackSnapshotView setImage:0];
    }
  }
}

- (BOOL)_isZoomed
{
  [(PLSlalomRegionEditor *)self _zoomMinValue];
  double v4 = v3;
  [(PLSlalomRegionEditor *)self _zoomMaxValue];
  return v4 > self->_minValue || v5 < self->_maxValue;
}

- (double)_zoomMaxValue
{
  double result = self->_zoomMaxValue;
  if (result == 0.0) {
    return self->_maxValue;
  }
  return result;
}

- (double)_zoomMinValue
{
  return self->_zoomMinValue;
}

- (void)setZoomMinValue:(double)a3 maxValue:(double)a4
{
  if (self->_zoomMinValue == a3)
  {
    p_zoomMaxValue = &self->_zoomMaxValue;
    if (self->_zoomMaxValue == a4) {
      return;
    }
  }
  else
  {
    self->_zoomMinValue = a3;
    p_zoomMaxValue = &self->_zoomMaxValue;
    if (self->_zoomMaxValue == a4) {
      goto LABEL_6;
    }
  }
  double *p_zoomMaxValue = a4;
LABEL_6:
  p_trackSnapshotView = &self->_trackSnapshotView;
  double v7 = self->_trackSnapshotView;
  objc_storeStrong((id *)&self->_trackSnapshotView, self->_trackImageView);
  trackImageView = self->_trackImageView;
  self->_trackImageView = v7;
  double v9 = v7;

  self->_forceLayout = 1;
  [(PLSlalomRegionEditor *)self setNeedsLayout];
  [(PLSlalomRegionEditor *)self layoutIfNeeded];
  [(UIImageView *)self->_trackImageView setAlpha:1.0];
  [(UIImageView *)*p_trackSnapshotView setAlpha:0.0];
}

- (void)setEndValue:(double)minValue notify:(BOOL)a4
{
  if (self->_minValue > minValue) {
    double minValue = self->_minValue;
  }
  if (minValue > self->_maxValue) {
    double minValue = self->_maxValue;
  }
  if (self->_endValue != minValue)
  {
    BOOL v4 = a4;
    self->_double endValue = minValue;
    if (self->_startValue > minValue) {
      -[PLSlalomRegionEditor setStartValue:notify:](self, "setStartValue:notify:", a4);
    }
    [(PLSlalomRegionEditor *)self setNeedsLayout];
    if (v4)
    {
      delegate = self->_delegate;
      [(PLSlalomRegionEditorDelegate *)delegate slalomRegionEditorEndValueChanged:self];
    }
  }
}

- (void)setEndValue:(double)a3
{
}

- (void)setStartValue:(double)minValue notify:(BOOL)a4
{
  if (self->_minValue > minValue) {
    double minValue = self->_minValue;
  }
  if (minValue > self->_maxValue) {
    double minValue = self->_maxValue;
  }
  if (self->_startValue != minValue)
  {
    BOOL v4 = a4;
    self->_double startValue = minValue;
    if (self->_endValue < minValue) {
      -[PLSlalomRegionEditor setEndValue:notify:](self, "setEndValue:notify:", a4);
    }
    [(PLSlalomRegionEditor *)self setNeedsLayout];
    if (v4)
    {
      delegate = self->_delegate;
      [(PLSlalomRegionEditorDelegate *)delegate slalomRegionEditorStartValueChanged:self];
    }
  }
}

- (void)setStartValue:(double)a3
{
}

- (void)setMaxValue:(double)maxValue
{
  if (self->_maxValue != maxValue)
  {
    self->_double maxValue = maxValue;
    if (self->_minValue > maxValue)
    {
      -[PLSlalomRegionEditor setMinValue:](self, "setMinValue:");
      double maxValue = self->_maxValue;
    }
    if (self->_endValue > maxValue) {
      -[PLSlalomRegionEditor setEndValue:](self, "setEndValue:");
    }
    [(PLSlalomRegionEditor *)self setNeedsLayout];
  }
}

- (void)setMinValue:(double)minValue
{
  if (self->_minValue != minValue)
  {
    self->_double minValue = minValue;
    if (self->_maxValue < minValue)
    {
      -[PLSlalomRegionEditor setMaxValue:](self, "setMaxValue:");
      double minValue = self->_minValue;
    }
    if (self->_startValue < minValue) {
      -[PLSlalomRegionEditor setStartValue:](self, "setStartValue:");
    }
    [(PLSlalomRegionEditor *)self setNeedsLayout];
  }
}

- (void)setTrackInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_trackInsets.left
    || a3.top != self->_trackInsets.top
    || a3.right != self->_trackInsets.right
    || a3.bottom != self->_trackInsets.bottom)
  {
    self->_trackInsets = a3;
    [(PLSlalomRegionEditor *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  [(PLSlalomRegionEditor *)self bounds];
  -[PLSlalomRegionEditor sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.CGFloat height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = fmax(result.height, 21.0);
  result.CGFloat height = v3;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PLSlalomRegionEditor;
  [(PLSlalomRegionEditor *)&v13 layoutSubviews];
  if (self->_forceLayout || !self->_zoomAnimating)
  {
    [(PLSlalomRegionEditor *)self _updateTrack];
    [(PLSlalomRegionEditor *)self _trackFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    -[UIImageView setFrame:](self->_trackSnapshotView, "setFrame:", v4, v6, v8, v10);
    startHandleView = self->_startHandleView;
    [(PLSlalomRegionEditor *)self startHandleFrame];
    -[UIImageView setFrame:](startHandleView, "setFrame:");
    endHandleView = self->_endHandleView;
    [(PLSlalomRegionEditor *)self endHandleFrame];
    -[UIImageView setFrame:](endHandleView, "setFrame:");
    self->_forceLayout = 0;
  }
}

- (PLSlalomRegionEditor)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PLSlalomRegionEditor;
  double v3 = -[PLSlalomRegionEditor initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PLSlalomRegionEditor *)v3 setOpaque:0];
    v4->_regionEditorStyle = 0;
    double v5 = [(PLSlalomRegionEditor *)v4 _handleImage];
    id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    trackSnapshotView = v4->_trackSnapshotView;
    v4->_trackSnapshotView = (UIImageView *)v11;

    [(UIImageView *)v4->_trackSnapshotView setAlpha:0.0];
    [(PLSlalomRegionEditor *)v4 addSubview:v4->_trackSnapshotView];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v7, v8, v9, v10);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v13;

    [(PLSlalomRegionEditor *)v4 addSubview:v4->_trackImageView];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    startHandleView = v4->_startHandleView;
    v4->_startHandleView = (UIImageView *)v15;

    double v17 = v4->_startHandleView;
    double v18 = [(PLSlalomRegionEditor *)v4 _handleTintColor];
    [(UIImageView *)v17 setTintColor:v18];

    [(PLSlalomRegionEditor *)v4 addSubview:v4->_startHandleView];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    endHandleView = v4->_endHandleView;
    v4->_endHandleView = (UIImageView *)v19;

    double v21 = v4->_endHandleView;
    CGRect v22 = [(PLSlalomRegionEditor *)v4 _handleTintColor];
    [(UIImageView *)v21 setTintColor:v22];

    [(PLSlalomRegionEditor *)v4 addSubview:v4->_endHandleView];
    v4->_double minValue = 0.0;
    v4->_double maxValue = 1.0;
    v4->_double startValue = v4->_minValue;
    v4->_double endValue = v4->_maxValue;
    v4->_zoomDelaCGFloat y = 0.5;
  }
  return v4;
}

@end