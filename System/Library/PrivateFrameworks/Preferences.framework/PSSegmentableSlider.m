@interface PSSegmentableSlider
- (BOOL)isSegmented;
- (BOOL)locksToSegment;
- (BOOL)snapsToSegment;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (PSSegmentableSlider)initWithFrame:(CGRect)a3;
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

@implementation PSSegmentableSlider

- (PSSegmentableSlider)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PSSegmentableSlider;
  v3 = -[PSSegmentableSlider initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[PSNonMovableTapGestureRecognizer alloc] initWithTarget:v3 action:sel_sliderTapped_];
    [(PSSegmentableSlider *)v3 addGestureRecognizer:v4];
    [(PSSegmentableSlider *)v3 addTarget:v3 action:sel_controlInteractionBegan_ forControlEvents:1];
    [(PSSegmentableSlider *)v3 addTarget:v3 action:sel_controlInteractionEnded_ forControlEvents:448];

    v5 = +[PSListController appearance];
    v6 = [v5 segmentedSliderTrackColor];

    v7 = v6;
    if (!v6)
    {
      v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.596078431 alpha:1.0];
    }
    uint64_t v8 = [(PSSegmentableSlider *)v3 _accessibilityHigherContrastTintColorForColor:v7];
    trackMarkersColor = v3->_trackMarkersColor;
    v3->_trackMarkersColor = (UIColor *)v8;

    if (!v6) {
    v3->_locksToSegment = 1;
    }
    v10 = [(PSSegmentableSlider *)v3 layer];
    [v10 setNeedsDisplayOnBoundsChange:1];
  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(PSSegmentableSlider *)self bounds];
  -[PSSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  char v14 = [(PSSegmentableSlider *)self _shouldReverseLayoutDirection];
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
  [(PSSegmentableSlider *)self maximumValue];
  float v23 = v22;
  [(PSSegmentableSlider *)self minimumValue];
  double v25 = (float)(v23 - v24);
  [(PSSegmentableSlider *)self minimumValue];
  double v27 = v26 + v21 * v25;
  *(float *)&double v27 = v27;
  [(PSSegmentableSlider *)self setValue:1 animated:v27];
  [(PSSegmentableSlider *)self sendActionsForControlEvents:4096];
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
    [(PSSegmentableSlider *)self maximumValue];
    float v6 = v5;
    [(PSSegmentableSlider *)self minimumValue];
    return (unint64_t)(float)((float)(v6 - v7) + 1.0);
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  [(PSSegmentableSlider *)self maximumValue];
  float v6 = v5;
  [(PSSegmentableSlider *)self minimumValue];
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_segmented)
  {
    [(PSSegmentableSlider *)self offsetBetweenTicksForNumberOfTicks:[(PSSegmentableSlider *)self numberOfTicks]];
    float v8 = v7;
    [(PSSegmentableSlider *)self minimumValue];
    float v10 = roundf((float)(a3 - v9) / v8);
    [(PSSegmentableSlider *)self minimumValue];
    float v12 = v11 + (float)(v8 * (float)(int)v10);
    if (self->_locksToSegment || self->_snapsToSegment && vabds_f32(v12, a3) < 0.015)
    {
      if ([(PSSegmentableSlider *)self isTracking])
      {
        [(PSSegmentableSlider *)self value];
        if (v12 != v13) {
          [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
        }
      }
      a3 = v12;
    }
  }
  [(PSSegmentableSlider *)self value];
  if (a3 != *(float *)&v14)
  {
    v15.receiver = self;
    v15.super_class = (Class)PSSegmentableSlider;
    *(float *)&double v14 = a3;
    [(PSSegmentableSlider *)&v15 setValue:v4 animated:v14];
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v8 = [(PSSegmentableSlider *)self _minTrackView];
  [v8 setHidden:self->_segmented];

  float v9 = [(PSSegmentableSlider *)self _maxTrackView];
  [v9 setHidden:self->_segmented];

  if (self->_segmented)
  {
    [(PSSegmentableSlider *)self bounds];
    -[PSSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:");
    double v11 = v10;
    double v33 = v12;
    double v14 = v13;
    double v16 = v15;
    id v35 = objc_alloc_init(MEMORY[0x1E4F427D0]);
    [(UIColor *)self->_trackMarkersColor set];
    [v35 setLineWidth:v16];
    unint64_t v17 = [(PSSegmentableSlider *)self numberOfTicks];
    [(PSSegmentableSlider *)self offsetBetweenTicksForNumberOfTicks:v17];
    if (v17)
    {
      float v19 = v18;
      uint64_t v20 = 0;
      double v21 = v33 + v16 * 0.5;
      double v22 = v21 + -3.5;
      double v23 = v21 + 3.5;
      do
      {
        [(PSSegmentableSlider *)self minimumValue];
        float v25 = v24 + (float)((float)(int)v20 * v19);
        [(PSSegmentableSlider *)self minimumValue];
        float v27 = v25 - v26;
        [(PSSegmentableSlider *)self maximumValue];
        float v29 = v28;
        [(PSSegmentableSlider *)self minimumValue];
        double v31 = PSRoundToPixel(v11 + (float)(v27 / (float)(v29 - v30)) * v14);
        objc_msgSend(v35, "moveToPoint:", v31, PSRoundToPixel(v22));
        objc_msgSend(v35, "addLineToPoint:", v31, PSRoundToPixel(v23));
        ++v20;
      }
      while (v17 != v20);
    }
    objc_msgSend(v35, "stroke", *(void *)&v33);
    v32 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v11, v34, v14, v16);
    [v32 fill];
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)PSSegmentableSlider;
    -[PSSegmentableSlider drawRect:](&v36, sel_drawRect_, x, y, width, height);
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
  int v13 = [(PSSegmentableSlider *)self _shouldReverseLayoutDirection];
  v42.receiver = self;
  v42.super_class = (Class)PSSegmentableSlider;
  double v39 = x;
  double v40 = width;
  -[PSSegmentableSlider thumbRectForBounds:trackRect:value:](&v42, sel_thumbRectForBounds_trackRect_value_, v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (self->_segmented)
  {
    [(PSSegmentableSlider *)self minimumValue];
    if (v22 == a5 || ([(PSSegmentableSlider *)self maximumValue], v23 == a5))
    {
      -[PSSegmentableSlider trackRectForBounds:](self, "trackRectForBounds:", v11, v10, v9, v8);
      double v24 = v21;
      double v26 = v25;
      [(PSSegmentableSlider *)self minimumValue];
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
      [(PSSegmentableSlider *)self minimumValue];
      float v34 = a5 - v33;
      [(PSSegmentableSlider *)self maximumValue];
      float v36 = v35;
      [(PSSegmentableSlider *)self minimumValue];
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