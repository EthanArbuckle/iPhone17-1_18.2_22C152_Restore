@interface UIPrintSegmentedSlider
- (BOOL)isSegmented;
- (BOOL)locksToSegment;
- (BOOL)snapsToSegment;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (UIPrintSegmentedSlider)initWithFrame:(CGRect)a3;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3;
- (unint64_t)numberOfTicks;
- (unint64_t)segmentCount;
- (void)controlInteractionBegan:(id)a3;
- (void)controlInteractionEnded:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setLocksToSegment:(BOOL)a3;
- (void)setSegmentCount:(unint64_t)a3;
- (void)setSegmented:(BOOL)a3;
- (void)setSnapsToSegment:(BOOL)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)sliderTapped:(id)a3;
@end

@implementation UIPrintSegmentedSlider

- (UIPrintSegmentedSlider)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIPrintSegmentedSlider;
  v3 = -[UIPrintSegmentedSlider initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[UIPrintNonMovableTapGestureRecognizer alloc] initWithTarget:v3 action:sel_sliderTapped_];
    [(UIPrintSegmentedSlider *)v3 addGestureRecognizer:v4];
    [(UIPrintSegmentedSlider *)v3 addTarget:v3 action:sel_controlInteractionBegan_ forControlEvents:1];
    [(UIPrintSegmentedSlider *)v3 addTarget:v3 action:sel_controlInteractionEnded_ forControlEvents:448];

    v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.596078431 alpha:1.0];
    uint64_t v6 = [(UIPrintSegmentedSlider *)v3 _accessibilityHigherContrastTintColorForColor:v5];
    trackMarkersColor = v3->_trackMarkersColor;
    v3->_trackMarkersColor = (UIColor *)v6;

    v3->_locksToSegment = 1;
    v8 = [(UIPrintSegmentedSlider *)v3 layer];
    [v8 setNeedsDisplayOnBoundsChange:1];
  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(UIPrintSegmentedSlider *)self bounds];
  -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  char v14 = [(UIPrintSegmentedSlider *)self _shouldReverseLayoutDirection];
  CGFloat v15 = v7;
  CGFloat v16 = v9;
  CGFloat v17 = v11;
  CGFloat v18 = v13;
  if (v14) {
    double v19 = CGRectGetMaxX(*(CGRect *)&v15) - v5;
  }
  else {
    double v19 = v5 - CGRectGetMinX(*(CGRect *)&v15);
  }
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  double v20 = v19 / CGRectGetWidth(v29);
  if (v20 > 1.0) {
    double v20 = 1.0;
  }
  double v21 = fmax(v20, 0.0);
  [(UIPrintSegmentedSlider *)self maximumValue];
  float v23 = v22;
  [(UIPrintSegmentedSlider *)self minimumValue];
  double v25 = (float)(v23 - v24);
  [(UIPrintSegmentedSlider *)self minimumValue];
  double v27 = v26 + v21 * v25;
  *(float *)&double v27 = v27;
  [(UIPrintSegmentedSlider *)self setValue:1 animated:v27];
  [(UIPrintSegmentedSlider *)self sendActionsForControlEvents:4096];
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->_segmentCount = a3;
}

- (void)setSegmented:(BOOL)a3
{
  self->_segmented = a3;
}

- (unint64_t)numberOfTicks
{
  unint64_t segmentCount = self->_segmentCount;
  if (segmentCount)
  {
    return (unint64_t)(float)(segmentCount + 1);
  }
  else
  {
    [(UIPrintSegmentedSlider *)self maximumValue];
    float v6 = v5;
    [(UIPrintSegmentedSlider *)self minimumValue];
    return (unint64_t)(float)((float)(v6 - v7) + 1.0);
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  [(UIPrintSegmentedSlider *)self maximumValue];
  float v6 = v5;
  [(UIPrintSegmentedSlider *)self minimumValue];
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_segmented)
  {
    [(UIPrintSegmentedSlider *)self offsetBetweenTicksForNumberOfTicks:[(UIPrintSegmentedSlider *)self numberOfTicks]];
    float v8 = v7;
    [(UIPrintSegmentedSlider *)self minimumValue];
    float v10 = roundf((float)(a3 - v9) / v8);
    [(UIPrintSegmentedSlider *)self minimumValue];
    float v12 = v11 + (float)(v8 * (float)(int)v10);
    if (self->_locksToSegment || self->_snapsToSegment && vabds_f32(v12, a3) < 0.015)
    {
      if ([(UIPrintSegmentedSlider *)self isTracking])
      {
        [(UIPrintSegmentedSlider *)self value];
        if (v12 != v13) {
          [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
        }
      }
      a3 = v12;
    }
  }
  [(UIPrintSegmentedSlider *)self value];
  if (a3 != *(float *)&v14)
  {
    v15.receiver = self;
    v15.super_class = (Class)UIPrintSegmentedSlider;
    *(float *)&double v14 = a3;
    [(UIPrintSegmentedSlider *)&v15 setValue:v4 animated:v14];
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v8 = [(UIPrintSegmentedSlider *)self _minTrackView];
  [v8 setHidden:self->_segmented];

  float v9 = [(UIPrintSegmentedSlider *)self _maxTrackView];
  [v9 setHidden:self->_segmented];

  if (self->_segmented)
  {
    [(UIPrintSegmentedSlider *)self bounds];
    -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:");
    double v11 = v10;
    double v33 = v12;
    double v14 = v13;
    double v16 = v15;
    id v35 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
    [(UIColor *)self->_trackMarkersColor set];
    [v35 setLineWidth:v16];
    unint64_t v17 = [(UIPrintSegmentedSlider *)self numberOfTicks];
    [(UIPrintSegmentedSlider *)self offsetBetweenTicksForNumberOfTicks:v17];
    if (v17)
    {
      float v19 = v18;
      uint64_t v20 = 0;
      double v21 = v33 + v16 * 0.5;
      double v22 = v21 + -3.5;
      double v23 = v21 + 3.5;
      do
      {
        [(UIPrintSegmentedSlider *)self minimumValue];
        float v25 = v24 + (float)((float)(int)v20 * v19);
        [(UIPrintSegmentedSlider *)self minimumValue];
        float v27 = v25 - v26;
        [(UIPrintSegmentedSlider *)self maximumValue];
        float v29 = v28;
        [(UIPrintSegmentedSlider *)self minimumValue];
        double v31 = _roundToPixel(v11 + (float)(v27 / (float)(v29 - v30)) * v14);
        objc_msgSend(v35, "moveToPoint:", v31, _roundToPixel(v22));
        objc_msgSend(v35, "addLineToPoint:", v31, _roundToPixel(v23));
        ++v20;
      }
      while (v17 != v20);
    }
    objc_msgSend(v35, "stroke", *(void *)&v33);
    v32 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v11, v34, v14, v16);
    [v32 fill];
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)UIPrintSegmentedSlider;
    -[UIPrintSegmentedSlider drawRect:](&v36, sel_drawRect_, x, y, width, height);
  }
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  int v13 = [(UIPrintSegmentedSlider *)self _shouldReverseLayoutDirection];
  v42.receiver = self;
  v42.super_class = (Class)UIPrintSegmentedSlider;
  double v39 = x;
  double v40 = width;
  -[UIPrintSegmentedSlider thumbRectForBounds:trackRect:value:](&v42, sel_thumbRectForBounds_trackRect_value_, v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (self->_segmented)
  {
    [(UIPrintSegmentedSlider *)self minimumValue];
    if (v22 == a5 || ([(UIPrintSegmentedSlider *)self maximumValue], v23 == a5))
    {
      -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:", v11, v10, v9, v8);
      double v24 = v21;
      double v26 = v25;
      [(UIPrintSegmentedSlider *)self minimumValue];
      if (v27 == a5) {
        double v28 = -v26;
      }
      else {
        double v28 = v26;
      }
      double v21 = v24;
      double v15 = v15 + v28;
    }
    else
    {
      [(UIPrintSegmentedSlider *)self minimumValue];
      float v34 = a5 - v33;
      [(UIPrintSegmentedSlider *)self maximumValue];
      float v36 = v35;
      [(UIPrintSegmentedSlider *)self minimumValue];
      float v38 = v34 / (float)(v36 - v37);
      if (v13) {
        float v38 = 1.0 - v38;
      }
      double v15 = v39 + v19 * -0.5 + v38 * v40;
    }
  }
  double v29 = v15;
  double v30 = v17;
  double v31 = v19;
  double v32 = v21;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)controlInteractionBegan:(id)a3
{
  BOOL v4 = (UISelectionFeedbackGenerator *)objc_opt_new();
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v4;

  float v6 = self->_feedbackGenerator;
  [(UISelectionFeedbackGenerator *)v6 prepare];
}

- (void)controlInteractionEnded:(id)a3
{
  self->_feedbackGenerator = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)isSegmented
{
  return self->_segmented;
}

- (BOOL)locksToSegment
{
  return self->_locksToSegment;
}

- (void)setLocksToSegment:(BOOL)a3
{
  self->_locksToSegment = a3;
}

- (BOOL)snapsToSegment
{
  return self->_snapsToSegment;
}

- (void)setSnapsToSegment:(BOOL)a3
{
  self->_snapsToSegment = a3;
}

- (unint64_t)segmentCount
{
  return self->_segmentCount;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackMarkersColor, 0);
}

@end