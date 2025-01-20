@interface PXSlowMotionEditor
+ (UIImage)handleImage;
- (BOOL)_isPoint:(CGPoint)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5;
- (BOOL)_isZoomed;
- (BOOL)isZoomAnimating;
- (CGRect)_handleFrameForValue:(double)a3 isStart:(BOOL)a4;
- (CGRect)_trackFrame;
- (CGRect)_trackFrameNoZoom;
- (CGRect)endHandleFrame;
- (CGRect)startHandleFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (PXSlowMotionEditor)initWithFrame:(CGRect)a3;
- (PXSlowMotionEditorDelegate)delegate;
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
- (id)_handleTintColor;
- (id)_tickColor;
- (id)_trackColor;
- (id)_trackImageForZoom:(BOOL)a3;
- (unint64_t)regionEditorStyle;
- (void)_beginTrackingZoomWithPoint:(CGPoint)a3;
- (void)_cancelTrackingZoom;
- (void)_cancelZoom;
- (void)_cancelZoomTrackingIfNeccessaryWithPoint:(CGPoint)a3;
- (void)_drawCurveWithFlatEndsFromX:(double)a3 fromY:(double)a4 toX:(double)a5 toY:(double)a6;
- (void)_updateSlidersWithPoint:(CGPoint)a3;
- (void)_updateTrack;
- (void)_zoomPressWasHeld;
- (void)handleBeginTrackingAtLocation:(CGPoint)a3;
- (void)handleChangeTrackingAtLocation:(CGPoint)a3;
- (void)handleEndTrackingAtLocation:(CGPoint)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
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

@implementation PXSlowMotionEditor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
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
}

- (PXSlowMotionEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSlowMotionEditorDelegate *)WeakRetained;
}

- (void)_drawCurveWithFlatEndsFromX:(double)a3 fromY:(double)a4 toX:(double)a5 toY:(double)a6
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextAddCurveToPoint(CurrentContext, a5 * 0.5 + a3 * 0.5, a4, a5 * 0.5 + a3 * 0.5, a6, a5, a6);
}

- (id)_handleTintColor
{
  unint64_t v2 = [(PXSlowMotionEditor *)self regionEditorStyle];
  if (v2)
  {
    if (v2 == 2 || v2 == 1)
    {
      v3 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  return v3;
}

- (id)_trackColor
{
  unint64_t v2 = [(PXSlowMotionEditor *)self regionEditorStyle];
  switch(v2)
  {
    case 0uLL:
      v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
      goto LABEL_6;
    case 2uLL:
      v5 = [MEMORY[0x1E4FB1618] clearColor];
      break;
    case 1uLL:
      v3 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_6:
      v4 = v3;
      v5 = [v3 colorWithAlphaComponent:0.1];

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_tickColor
{
  unint64_t v2 = [(PXSlowMotionEditor *)self regionEditorStyle];
  if (v2)
  {
    if (v2 == 2 || v2 == 1)
    {
      v3 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  return v3;
}

- (id)_trackImageForZoom:(BOOL)a3
{
  [(PXSlowMotionEditor *)self _trackFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PXSlowMotionEditor *)self startHandleFrame];
  double v13 = v12;
  double v15 = v14;
  CGFloat v61 = v17;
  CGFloat v62 = v16;
  [(PXSlowMotionEditor *)self endHandleFrame];
  CGFloat rect_24 = v19;
  CGFloat v60 = v18;
  double v20 = v15 - v7;
  double rect_16 = v21 - v5;
  double rect = v13 - v5;
  double rect_8 = v22 - v7;
  CGFloat v23 = *MEMORY[0x1E4F1DAD8];
  CGFloat v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXSlowMotionEditor *)self _trackScale];
  double v26 = v25;
  v27 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v27 scale];
  double v29 = v28;

  int v30 = vcvtpd_s64_f64(v9 * v29);
  int v31 = vcvtpd_s64_f64(v11 * v29);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v33 = CGBitmapContextCreate(0, v30, v31, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v33)
  {
    v65.size.width = (double)v30;
    v65.origin.x = 0.0;
    v65.origin.y = 0.0;
    v65.size.height = (double)v31;
    CGContextClearRect(v33, v65);
    CGContextTranslateCTM(v33, 0.0, (double)v31);
    CGContextScaleCTM(v33, v29, -v29);
    CGContextGetCTM(&v63, v33);
    CGContextSetBaseCTM();
  }
  id v34 = [(PXSlowMotionEditor *)self _trackColor];
  CGContextSetFillColorWithColor(v33, (CGColorRef)[v34 CGColor]);

  v66.origin.x = v23;
  v66.origin.y = v24;
  v66.size.width = v9;
  v66.size.height = v11;
  CGContextFillRect(v33, v66);
  CGContextSetLineWidth(v33, 1.0);
  CGContextSetLineCap(v33, kCGLineCapSquare);
  v67.origin.x = v23;
  v67.origin.y = v24;
  v67.size.width = v9;
  v67.size.height = v11;
  double MinX = CGRectGetMinX(v67);
  v68.origin.x = v23;
  v68.origin.y = v24;
  v68.size.width = v9;
  v68.size.height = v11;
  double MaxX = CGRectGetMaxX(v68);
  v69.origin.x = rect;
  v69.origin.y = v20;
  v69.size.height = v61;
  v69.size.width = v62;
  double MidX = CGRectGetMidX(v69);
  v70.origin.y = rect_8;
  v70.origin.x = rect_16;
  v70.size.height = rect_24;
  v70.size.width = v60;
  double v38 = CGRectGetMidX(v70);
  double v39 = v26 * 3.0;
  double v40 = v26 * 9.0;
  double v41 = 1.0 / v9;
  double startValue = self->_startValue;
  if (v9 == 0.0) {
    double v41 = 0.0;
  }
  double v43 = startValue - self->_minValue;
  double endValue = self->_endValue;
  double v45 = endValue - startValue;
  BOOL v46 = v45 >= v41 && self->_maxValue - endValue < v41;
  if (v43 >= v41 || v45 < v41)
  {
    for (double i = v39 * floor(MinX / v39); i <= MidX; double i = v39 + i)
    {
      CGContextMoveToPoint(v33, i, 0.0);
      CGContextAddLineToPoint(v33, i, 7.0);
    }
    double MinX = MidX;
  }
  if (v46) {
    double v49 = MaxX;
  }
  else {
    double v49 = v38;
  }
  for (double j = v40 * ceil(MinX / v40); j <= v49; double j = v40 + j)
  {
    CGContextMoveToPoint(v33, j, 0.0);
    CGContextAddLineToPoint(v33, j, 7.0);
  }
  if (!v46)
  {
    for (double k = v39 * ceil(v38 / v39); k <= MaxX; double k = v39 + k)
    {
      CGContextMoveToPoint(v33, k, 0.0);
      CGContextAddLineToPoint(v33, k, 7.0);
    }
  }
  id v51 = [(PXSlowMotionEditor *)self _tickColor];
  CGContextSetStrokeColorWithColor(v33, (CGColorRef)[v51 CGColor]);

  CGContextStrokePath(v33);
  Image = CGBitmapContextCreateImage(v33);
  CGContextRelease(v33);
  v53 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:v29];
  CGImageRelease(Image);
  return v53;
}

- (void)_updateTrack
{
  id v3 = [(PXSlowMotionEditor *)self _trackImageForZoom:0];
  [(UIImageView *)self->_trackImageView setImage:v3];
}

- (void)_cancelZoom
{
  if (self->_zoomed)
  {
    self->_zoomed = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained slowMotionEditorRequestForceUnzoom:self];
  }
}

- (void)_zoomPressWasHeld
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_zoomed = [WeakRetained slowMotionEditorRequestForceZoom:self];
}

- (void)_cancelTrackingZoom
{
  if (self->_trackingZoom && !self->_zoomed)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__zoomPressWasHeld object:0];
    self->_trackingZoom = 0;
  }
}

- (void)_cancelZoomTrackingIfNeccessaryWithPoint:(CGPoint)a3
{
  if (vabdd_f64(a3.x, self->_touchLocationWhenTrackingZoomBegan.x) > 4.0) {
    [(PXSlowMotionEditor *)self _cancelTrackingZoom];
  }
}

- (void)_beginTrackingZoomWithPoint:(CGPoint)a3
{
  if (!self->_trackingZoom && !self->_zoomed)
  {
    self->_trackingZoom = 1;
    self->_touchLocationWhenTrackingZoomBegan = a3;
    [(PXSlowMotionEditor *)self performSelector:sel__zoomPressWasHeld withObject:0 afterDelay:self->_zoomDelay];
  }
}

- (void)_updateSlidersWithPoint:(CGPoint)a3
{
  double x = a3.x;
  if ((self->_draggingStart || self->_draggingEnd)
    && ![(PXSlowMotionEditor *)self isZoomAnimating])
  {
    if (self->_draggingStart) {
      [(PXSlowMotionEditor *)self startHandleFrame];
    }
    else {
      [(PXSlowMotionEditor *)self endHandleFrame];
    }
    double v9 = v6;
    double v10 = v7;
    double v11 = v8;
    double v12 = v5 + x - CGRectGetMidX(*(CGRect *)&v5) - self->_touchOffset;
    if (self->_draggingStart)
    {
      -[PXSlowMotionEditor _valueFromStartHandleFrame:](self, "_valueFromStartHandleFrame:", v12, v9, v10, v11);
      -[PXSlowMotionEditor setStartValue:notify:](self, "setStartValue:notify:", 1);
    }
    else
    {
      -[PXSlowMotionEditor _valueFromEndHandleFrame:](self, "_valueFromEndHandleFrame:", v12, v9, v10, v11);
      -[PXSlowMotionEditor setEndValue:notify:](self, "setEndValue:notify:", 1);
    }
  }
}

- (void)handleEndTrackingAtLocation:(CGPoint)a3
{
  -[PXSlowMotionEditor _updateSlidersWithPoint:](self, "_updateSlidersWithPoint:", a3.x, a3.y);
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained slowMotionEditorDidEndEditing:self];

LABEL_5:
  [(PXSlowMotionEditor *)self _cancelTrackingZoom];
  [(PXSlowMotionEditor *)self _cancelZoom];
}

- (void)handleChangeTrackingAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[PXSlowMotionEditor _updateSlidersWithPoint:](self, "_updateSlidersWithPoint:");
  if (*(_WORD *)&self->_draggingStart)
  {
    -[PXSlowMotionEditor _cancelZoomTrackingIfNeccessaryWithPoint:](self, "_cancelZoomTrackingIfNeccessaryWithPoint:", x, y);
    -[PXSlowMotionEditor _beginTrackingZoomWithPoint:](self, "_beginTrackingZoomWithPoint:", x, y);
  }
}

- (void)handleBeginTrackingAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v16 = 1.79769313e308;
  double v17 = 1.79769313e308;
  BOOL v6 = -[PXSlowMotionEditor _isPoint:inHandleIsStart:outTouchOffset:](self, "_isPoint:inHandleIsStart:outTouchOffset:", 1, &v17);
  BOOL v7 = -[PXSlowMotionEditor _isPoint:inHandleIsStart:outTouchOffset:](self, "_isPoint:inHandleIsStart:outTouchOffset:", 0, &v16, x, y);
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
    -[PXSlowMotionEditor _beginTrackingZoomWithPoint:](self, "_beginTrackingZoomWithPoint:", x, y);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained slowMotionEditorDidBeginEditing:self withStartHandle:self->_draggingStart];
  }
}

- (BOOL)_isPoint:(CGPoint)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a4) {
    [(PXSlowMotionEditor *)self startHandleFrame];
  }
  else {
    [(PXSlowMotionEditor *)self endHandleFrame];
  }
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  double MidX = CGRectGetMidX(*(CGRect *)&v8);
  v20.origin.double x = v12;
  v20.origin.double y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  double MidY = CGRectGetMidY(v20);
  BOOL v18 = vabdd_f64(x, MidX) <= 44.0;
  BOOL result = vabdd_f64(y, MidY) <= 44.0 && v18;
  *a5 = x - MidX;
  return result;
}

- (double)_valueFromHandleFrame:(CGRect)a3 isStart:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXSlowMotionEditor *)self _trackFrame];
  if (v10 <= 0.0) {
    return 0.0;
  }
  double v11 = v9;
  double v12 = v10;
  [(PXSlowMotionEditor *)self _trimHandleWidth];
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
  [(PXSlowMotionEditor *)self _trackFrame];
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

  [(PXSlowMotionEditor *)self _trimHandleWidth];
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
  [(PXSlowMotionEditor *)self _trackScale];
  return trimHandleWidth * v3;
}

- (double)_trackScale
{
  [(PXSlowMotionEditor *)self _zoomMinValue];
  double v4 = v3;
  [(PXSlowMotionEditor *)self _zoomMaxValue];
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
  [(PXSlowMotionEditor *)self _trackFrameNoZoom];
  double x = v3;
  CGFloat y = v5;
  double width = v7;
  CGFloat height = v9;
  if ([(PXSlowMotionEditor *)self _isZoomed])
  {
    [(PXSlowMotionEditor *)self _zoomMinValue];
    double v12 = v11;
    [(PXSlowMotionEditor *)self _zoomMaxValue];
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
  [(PXSlowMotionEditor *)self bounds];
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
  -[PXSlowMotionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)_valueFromStartHandleFrame:(CGRect)a3
{
  -[PXSlowMotionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CGRect)endHandleFrame
{
  [(PXSlowMotionEditor *)self _handleFrameForValue:0 isStart:self->_endValue];
  result.size.CGFloat height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)startHandleFrame
{
  [(PXSlowMotionEditor *)self _handleFrameForValue:1 isStart:self->_startValue];
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
    id v4 = [(PXSlowMotionEditor *)self _handleTintColor];
    [(UIImageView *)self->_startHandleView setTintColor:v4];
    [(UIImageView *)self->_endHandleView setTintColor:v4];
    self->_forceLayout = 1;
    [(PXSlowMotionEditor *)self setNeedsLayout];
    [(PXSlowMotionEditor *)self layoutIfNeeded];
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
  [(PXSlowMotionEditor *)self _zoomMinValue];
  double v4 = v3;
  [(PXSlowMotionEditor *)self _zoomMaxValue];
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
  [(PXSlowMotionEditor *)self setNeedsLayout];
  [(PXSlowMotionEditor *)self layoutIfNeeded];
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
      -[PXSlowMotionEditor setStartValue:notify:](self, "setStartValue:notify:", a4);
    }
    [(PXSlowMotionEditor *)self setNeedsLayout];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained slowMotionEditorEndValueChanged:self];
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
      -[PXSlowMotionEditor setEndValue:notify:](self, "setEndValue:notify:", a4);
    }
    [(PXSlowMotionEditor *)self setNeedsLayout];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained slowMotionEditorStartValueChanged:self];
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
      -[PXSlowMotionEditor setMinValue:](self, "setMinValue:");
      double maxValue = self->_maxValue;
    }
    if (self->_endValue > maxValue) {
      -[PXSlowMotionEditor setEndValue:](self, "setEndValue:");
    }
    [(PXSlowMotionEditor *)self setNeedsLayout];
  }
}

- (void)setMinValue:(double)minValue
{
  if (self->_minValue != minValue)
  {
    self->_double minValue = minValue;
    if (self->_maxValue < minValue)
    {
      -[PXSlowMotionEditor setMaxValue:](self, "setMaxValue:");
      double minValue = self->_minValue;
    }
    if (self->_startValue < minValue) {
      -[PXSlowMotionEditor setStartValue:](self, "setStartValue:");
    }
    [(PXSlowMotionEditor *)self setNeedsLayout];
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
    [(PXSlowMotionEditor *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  [(PXSlowMotionEditor *)self bounds];
  -[PXSlowMotionEditor sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.CGFloat height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = fmax(result.height, 22.0);
  result.CGFloat height = v3;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXSlowMotionEditor;
  [(PXSlowMotionEditor *)&v13 layoutSubviews];
  if (self->_forceLayout || !self->_zoomAnimating)
  {
    [(PXSlowMotionEditor *)self _updateTrack];
    [(PXSlowMotionEditor *)self _trackFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    -[UIImageView setFrame:](self->_trackSnapshotView, "setFrame:", v4, v6, v8, v10);
    startHandleView = self->_startHandleView;
    [(PXSlowMotionEditor *)self startHandleFrame];
    -[UIImageView setFrame:](startHandleView, "setFrame:");
    endHandleView = self->_endHandleView;
    [(PXSlowMotionEditor *)self endHandleFrame];
    -[UIImageView setFrame:](endHandleView, "setFrame:");
    self->_forceLayout = 0;
  }
}

- (PXSlowMotionEditor)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PXSlowMotionEditor;
  double v3 = -[PXSlowMotionEditor initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXSlowMotionEditor *)v3 setOpaque:0];
    v4->_regionEditorStyle = 0;
    double v5 = [(id)objc_opt_class() handleImage];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    trackSnapshotView = v4->_trackSnapshotView;
    v4->_trackSnapshotView = (UIImageView *)v11;

    [(UIImageView *)v4->_trackSnapshotView setAlpha:0.0];
    [(PXSlowMotionEditor *)v4 addSubview:v4->_trackSnapshotView];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v13;

    [(PXSlowMotionEditor *)v4 addSubview:v4->_trackImageView];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
    startHandleView = v4->_startHandleView;
    v4->_startHandleView = (UIImageView *)v15;

    [(PXSlowMotionEditor *)v4 addSubview:v4->_startHandleView];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
    endHandleView = v4->_endHandleView;
    v4->_endHandleView = (UIImageView *)v17;

    [(PXSlowMotionEditor *)v4 addSubview:v4->_endHandleView];
    v4->_double minValue = 0.0;
    v4->_double maxValue = 1.0;
    v4->_double startValue = v4->_minValue;
    v4->_double endValue = v4->_maxValue;
    v4->_zoomDelaCGFloat y = 0.5;
  }
  return v4;
}

+ (UIImage)handleImage
{
  return 0;
}

@end