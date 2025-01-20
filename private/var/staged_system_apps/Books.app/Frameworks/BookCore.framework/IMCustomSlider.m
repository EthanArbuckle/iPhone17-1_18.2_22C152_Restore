@interface IMCustomSlider
- (BOOL)_controlScrubbing;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)fineScrubbing;
- (BOOL)scrubToPointingDevice;
- (CALayer)breadcrumbLayer;
- (CGPoint)offset;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (IMCustomSlider)initWithCoder:(id)a3;
- (IMCustomSlider)initWithFrame:(CGRect)a3;
- (IMCustomSliderDelegate)delegate;
- (NSMutableDictionary)perStateContent;
- (UIImage)highlightedThumb;
- (UIImage)thumb;
- (double)fineScrubbingVerticalRange;
- (float)_scaleForIdealValueForVerticalPosition:(double)a3;
- (float)_scaleForVerticalPosition:(double)a3;
- (float)breadcrumbValue;
- (id)_imageForKey:(id)a3 forState:(unint64_t)a4;
- (id)trackBreadcrumbImageForState:(unint64_t)a3;
- (int)speed;
- (void)_setImage:(id)a3 key:(id)a4 forState:(unint64_t)a5;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setBreadcrumbLayer:(id)a3;
- (void)setBreadcrumbValue:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setFineScrubbing:(BOOL)a3;
- (void)setFineScrubbingVerticalRange:(double)a3;
- (void)setHighlightedThumb:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setPerStateContent:(id)a3;
- (void)setScrubToPointingDevice:(BOOL)a3;
- (void)setSpeed:(int)a3;
- (void)setThumb:(id)a3;
- (void)setTrackBreadcrumbImage:(id)a3 forState:(unint64_t)a4;
- (void)updateFactor:(double)a3;
@end

@implementation IMCustomSlider

- (IMCustomSlider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMCustomSlider;
  result = [(IMCustomSlider *)&v4 initWithCoder:a3];
  if (result) {
    result->_fineScrubbingVerticalRange = 220.0;
  }
  return result;
}

- (IMCustomSlider)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMCustomSlider;
  result = -[IMCustomSlider initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_fineScrubbingVerticalRange = 220.0;
  }
  return result;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  thumb = self->_thumb;
  self->_thumb = 0;

  perStateContent = self->_perStateContent;
  self->_perStateContent = 0;

  [(CALayer *)self->_breadcrumbLayer removeFromSuperlayer];
  v5.receiver = self;
  v5.super_class = (Class)IMCustomSlider;
  [(IMCustomSlider *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)IMCustomSlider;
  [(IMCustomSlider *)&v36 layoutSubviews];
  v3 = [(IMCustomSlider *)self breadcrumbLayer];
  if (v3)
  {
    [(IMCustomSlider *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    -[IMCustomSlider trackRectForBounds:](self, "trackRectForBounds:");
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(IMCustomSlider *)self value];
    LODWORD(v34) = v20;
    double v35 = v15;
    -[IMCustomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v5, v7, v9, v11, v13, v15, v17, v19, v34);
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [(IMCustomSlider *)self breadcrumbValue];
    double v30 = v13 + v29 * v17;
    v37.origin.x = v22;
    v37.origin.y = v24;
    v37.size.width = v26;
    v37.size.height = v28;
    if (v30 >= CGRectGetMinX(v37))
    {
      v39.origin.x = v22;
      v39.origin.y = v24;
      v39.size.width = v26;
      v39.size.height = v28;
      CGFloat MaxX = CGRectGetMaxX(v39);
      v40.origin.x = v22;
      v40.origin.y = v24;
      v40.size.width = v26;
      v40.size.height = v28;
      double v31 = v30 - CGRectGetMaxX(v40);
      double v30 = MaxX;
    }
    else
    {
      v38.origin.x = v22;
      v38.origin.y = v24;
      v38.size.width = v26;
      v38.size.height = v28;
      double v31 = CGRectGetMinX(v38) - v30;
    }
    double v33 = fmax(v31, 0.0);
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [v3 setFrame:v30, v35, v33, v19];
    +[CATransaction commit];
  }
}

- (void)setThumb:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_thumb != v5)
  {
    objc_storeStrong((id *)&self->_thumb, a3);
    [(IMCustomSlider *)self setThumbImage:v5 forState:0];
    [(IMCustomSlider *)self setThumbImage:v5 forState:1];
  }
}

- (id)trackBreadcrumbImageForState:(unint64_t)a3
{
  return [(IMCustomSlider *)self _imageForKey:@"breadcrumbImage" forState:a3];
}

- (void)setTrackBreadcrumbImage:(id)a3 forState:(unint64_t)a4
{
  [(IMCustomSlider *)self _setImage:a3 key:@"breadcrumbImage" forState:a4];
  id v7 = [(IMCustomSlider *)self trackBreadcrumbImageForState:[(IMCustomSlider *)self state]];
  id v5 = [v7 CGImage];
  double v6 = [(IMCustomSlider *)self breadcrumbLayer];
  [v6 setContents:v5];
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v25.receiver = self;
  v25.super_class = (Class)IMCustomSlider;
  -[IMCustomSlider thumbRectForBounds:trackRect:value:](&v25, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  double x = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  p_offset = &self->_offset;
  if (self->_offset.x != 0.0)
  {
    [(IMCustomSlider *)self maximumValue];
    float v16 = v15 * 0.5;
    if ((float)(v15 * 0.5) == 0.0)
    {
      double x = p_offset->x;
    }
    else
    {
      double v17 = v16;
      double v18 = a5;
      double v19 = p_offset->x;
      if (v16 >= a5) {
        double x = x - v19 * (1.0 - v18 / v17);
      }
      else {
        double x = x + (v18 - v17) * v19 / v17;
      }
    }
  }
  double v20 = v9 + self->_offset.y;
  double v21 = x;
  double v22 = v11;
  double v23 = v13;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.double x = v21;
  return result;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  unsigned int v5 = [(IMCustomSlider *)self fineScrubbing];
  LODWORD(v6) = 1.0;
  if (v5)
  {
    [(IMCustomSlider *)self fineScrubbingVerticalRange];
    double v8 = vabdd_f64(a3, self->_beginLocation.y);
    if (v7 >= v8) {
      double v7 = v8;
    }
    double v9 = v7 + -20.0;
    BOOL v10 = v7 <= 20.0;
    double v11 = 0.0;
    if (!v10) {
      double v11 = v9;
    }
    float v12 = v11;
    double v13 = v12;
    [(IMCustomSlider *)self fineScrubbingVerticalRange];
    float v15 = v13 / (v14 + -20.0);
    if (v15 <= 0.15)
    {
      float v15 = v15 / 0.15;
      float v16 = 0.33333;
    }
    else
    {
      float v16 = 0.025;
    }
    float v17 = powf(v15, v16);
    if (v17 <= 0.0) {
      float v18 = 1.0;
    }
    else {
      float v18 = 1.0 - v17;
    }
    if (v18 > 1.0) {
      float v18 = 1.0;
    }
    *(float *)&double v6 = fmaxf(v18, 0.0);
  }
  return *(float *)&v6;
}

- (float)_scaleForVerticalPosition:(double)a3
{
  unsigned int v5 = [(IMCustomSlider *)self fineScrubbing];
  float result = 1.0;
  if (v5)
  {
    if (isPad()) {
      double v7 = 20.0;
    }
    else {
      double v7 = 0.0;
    }
    [(IMCustomSlider *)self fineScrubbingVerticalRange];
    double v9 = vabdd_f64(a3, self->_beginLocation.y);
    if (v8 >= v9) {
      double v8 = v9;
    }
    if (v7 >= v8) {
      double v10 = v7;
    }
    else {
      double v10 = v8;
    }
    if (isPad()) {
      double v11 = 20.0;
    }
    else {
      double v11 = 0.0;
    }
    float v12 = v10 - v11;
    double v13 = v12;
    [(IMCustomSlider *)self fineScrubbingVerticalRange];
    double v15 = v14;
    if (isPad()) {
      double v16 = 20.0;
    }
    else {
      double v16 = 0.0;
    }
    float v17 = v13 / (v15 - v16);
    float result = 1.0 - v17;
    if (result < 0.09) {
      return 0.09;
    }
  }
  return result;
}

- (void)updateFactor:(double)a3
{
  self->_factor = a3;
  if (a3 <= 0.1)
  {
    int v4 = 3;
  }
  else if (a3 > 0.35 || a3 <= 0.1)
  {
    int v4 = a3 > 0.35 && a3 <= 0.75;
  }
  else
  {
    int v4 = 2;
  }
  if (v4 != self->_speed)
  {
    self->_speed = v4;
    id v5 = [(IMCustomSlider *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 fineScrubSpeedChanged:self];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMCustomSlider;
  BOOL v7 = [(IMCustomSlider *)&v19 beginTrackingWithTouch:v6 withEvent:a4];
  double v8 = [(IMCustomSlider *)self delegate];
  if (v7)
  {
    double v9 = [(IMCustomSlider *)self trackBreadcrumbImageForState:[(IMCustomSlider *)self state]];
    if (v9)
    {
      [(IMCustomSlider *)self value];
      -[IMCustomSlider setBreadcrumbValue:](self, "setBreadcrumbValue:");
      double v10 = +[CALayer layer];
      [v10 setContents:[v9 CGImage]];
      double v11 = [(IMCustomSlider *)self layer];
      [v11 addSublayer:v10];

      [(IMCustomSlider *)self setBreadcrumbLayer:v10];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v6 locationInView:self];
    [v8 tapped:self];
  }
  float v12 = [(IMCustomSlider *)self highlightedThumb];
  if (v12) {
    BOOL v13 = v7;
  }
  else {
    BOOL v13 = 0;
  }

  if (v13)
  {
    double v14 = [(IMCustomSlider *)self highlightedThumb];
    [(IMCustomSlider *)self setThumbImage:v14 forState:0];

    double v15 = [(IMCustomSlider *)self highlightedThumb];
    [(IMCustomSlider *)self setThumbImage:v15 forState:1];
  }
  if (v7)
  {
    if ([(IMCustomSlider *)self _controlScrubbing])
    {
      [v6 locationInView:self];
      self->_previousLocation.double x = v16;
      self->_previousLocation.y = v17;
      self->_beginLocation = self->_previousLocation;
      [(IMCustomSlider *)self updateFactor:1.0];
    }
    if (objc_opt_respondsToSelector()) {
      [v8 beginTracking:self];
    }
  }

  return v7;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IMCustomSlider *)self _controlScrubbing])
  {
    if ([(IMCustomSlider *)self isTracking])
    {
      [v6 locationInView:self];
      double v9 = v8;
      double v11 = v10;
      [(IMCustomSlider *)self _scaleForVerticalPosition:v10];
      double v13 = v12;
      [(IMCustomSlider *)self updateFactor:v12];
      UIUserInterfaceLayoutDirection v14 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(IMCustomSlider *)self semanticContentAttribute]];
      double v15 = v9 - self->_previousLocation.x;
      [(IMCustomSlider *)self maximumValue];
      float v17 = v16;
      [(IMCustomSlider *)self minimumValue];
      double v19 = (float)(v17 - v18);
      [(IMCustomSlider *)self bounds];
      -[IMCustomSlider trackRectForBounds:](self, "trackRectForBounds:");
      double v20 = v15 * (v19 / CGRectGetWidth(v57));
      if (v14 == UIUserInterfaceLayoutDirectionRightToLeft) {
        double v21 = -v20;
      }
      else {
        double v21 = v20;
      }
      [(IMCustomSlider *)self value];
      float v23 = v22;
      double v24 = v22 + v21 * v13;
      double y = self->_previousLocation.y;
      double v26 = v11 - y;
      BOOL v27 = v11 - y < 0.0;
      BOOL v28 = v11 > y;
      double v29 = -(v11 - y);
      if (v28 && v27) {
        double v11 = -v11;
      }
      else {
        double v29 = v26;
      }
      if (v29 > 0.0)
      {
        double v55 = v11;
        [(IMCustomSlider *)self minimumValue];
        float v31 = v30;
        [(IMCustomSlider *)self maximumValue];
        float v33 = v32;
        uint64_t v34 = self;
        [(IMCustomSlider *)v34 bounds];
        double v35 = v9;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        -[IMCustomSlider trackRectForBounds:](v34, "trackRectForBounds:");
        v58.origin.double y = v37;
        v58.size.height = v39;
        CGRect v59 = CGRectInset(v58, -2.0, 0.0);
        double x = v59.origin.x;
        double width = v59.size.width;
        v42 = [(IMCustomSlider *)v34 currentThumbImage];

        [v42 size];
        double v44 = v43;

        double v45 = v35 - x;
        double v9 = v35;
        *(float *)&double v45 = v45 + v44 * -0.5;
        float v46 = (float)((float)(v33 - v31) * *(float *)&v45) / (width - v44) + v31;
        if (v14 == UIUserInterfaceLayoutDirectionRightToLeft) {
          float v46 = v33 - (float)(v46 - v31);
        }
        if (v46 >= v31)
        {
          float v31 = v46;
          if (v46 > v33) {
            float v31 = v33;
          }
        }
        double v11 = v55;
        [(IMCustomSlider *)v34 _scaleForIdealValueForVerticalPosition:v55];
        double v24 = v24 + (float)((float)(v31 - v23) * v47);
      }
      [(IMCustomSlider *)self minimumValue];
      float v49 = v48;
      [(IMCustomSlider *)self maximumValue];
      double v51 = v50;
      if (v24 <= v51) {
        double v51 = v24;
      }
      if (v51 <= v49) {
        *(float *)&double v51 = v49;
      }
      else {
        *(float *)&double v51 = v51;
      }
      [(IMCustomSlider *)self setValue:0 animated:v51];
      [(IMCustomSlider *)self sendActionsForControlEvents:4096];
      self->_previousLocation.double x = v9;
      self->_previousLocation.double y = v11;
    }
    unsigned __int8 v52 = [(IMCustomSlider *)self isTracking];
  }
  else
  {
    v56.receiver = self;
    v56.super_class = (Class)IMCustomSlider;
    unsigned __int8 v52 = [(IMCustomSlider *)&v56 continueTrackingWithTouch:v6 withEvent:v7];
  }
  BOOL v53 = v52;

  return v53;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(IMCustomSlider *)self highlightedThumb];

  if (v8)
  {
    double v9 = [(IMCustomSlider *)self thumb];
    [(IMCustomSlider *)self setThumbImage:v9 forState:0];

    double v10 = [(IMCustomSlider *)self thumb];
    [(IMCustomSlider *)self setThumbImage:v10 forState:1];
  }
  double v11 = [(IMCustomSlider *)self delegate];
  if [(IMCustomSlider *)self isTracking] && (objc_opt_respondsToSelector()) {
    [v11 endTracking:self];
  }
  float v12 = [(IMCustomSlider *)self breadcrumbLayer];
  [v12 removeFromSuperlayer];

  [(IMCustomSlider *)self setBreadcrumbLayer:0];
  if (![(IMCustomSlider *)self _controlScrubbing])
  {
    v13.receiver = self;
    v13.super_class = (Class)IMCustomSlider;
    [(IMCustomSlider *)&v13 endTrackingWithTouch:v6 withEvent:v7];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  int v4 = [(IMCustomSlider *)self breadcrumbLayer];
  [v4 removeFromSuperlayer];

  [(IMCustomSlider *)self setBreadcrumbLayer:0];
  id v5 = [(IMCustomSlider *)self highlightedThumb];

  if (v5)
  {
    id v6 = [(IMCustomSlider *)self thumb];
    [(IMCustomSlider *)self setThumbImage:v6 forState:0];

    id v7 = [(IMCustomSlider *)self thumb];
    [(IMCustomSlider *)self setThumbImage:v7 forState:1];
  }
}

- (id)_imageForKey:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IMCustomSlider *)self perStateContent];
  double v8 = +[NSNumber numberWithUnsignedInteger:a4];
  double v9 = [v7 objectForKeyedSubscript:v8];
  double v10 = [v9 objectForKeyedSubscript:v6];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    objc_super v13 = [(IMCustomSlider *)self perStateContent];
    UIUserInterfaceLayoutDirection v14 = [v13 objectForKeyedSubscript:&off_2E2628];
    id v12 = [v14 objectForKeyedSubscript:v6];
  }

  return v12;
}

- (void)_setImage:(id)a3 key:(id)a4 forState:(unint64_t)a5
{
  id v16 = a3;
  id v8 = a4;
  double v9 = [(IMCustomSlider *)self perStateContent];

  if (!v9)
  {
    double v10 = +[NSMutableDictionary dictionary];
    [(IMCustomSlider *)self setPerStateContent:v10];
  }
  double v11 = [(IMCustomSlider *)self perStateContent];
  id v12 = +[NSNumber numberWithUnsignedInteger:a5];
  objc_super v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    objc_super v13 = +[NSMutableDictionary dictionary];
    UIUserInterfaceLayoutDirection v14 = [(IMCustomSlider *)self perStateContent];
    double v15 = +[NSNumber numberWithUnsignedInteger:a5];
    [v14 setObject:v13 forKeyedSubscript:v15];
  }
  [v13 setObject:v16 forKeyedSubscript:v8];
}

- (BOOL)_controlScrubbing
{
  if ([(IMCustomSlider *)self fineScrubbing]) {
    return 1;
  }

  return [(IMCustomSlider *)self scrubToPointingDevice];
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)fineScrubbing
{
  return self->_fineScrubbing;
}

- (void)setFineScrubbing:(BOOL)a3
{
  self->_fineScrubbing = a3;
}

- (BOOL)scrubToPointingDevice
{
  return self->_scrubToPointingDevice;
}

- (void)setScrubToPointingDevice:(BOOL)a3
{
  self->_scrubToPointingDevice = a3;
}

- (IMCustomSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMCustomSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)speed
{
  return self->_speed;
}

- (void)setSpeed:(int)a3
{
  self->_speed = a3;
}

- (UIImage)highlightedThumb
{
  return self->_highlightedThumb;
}

- (void)setHighlightedThumb:(id)a3
{
}

- (UIImage)thumb
{
  return self->_thumb;
}

- (double)fineScrubbingVerticalRange
{
  return self->_fineScrubbingVerticalRange;
}

- (void)setFineScrubbingVerticalRange:(double)a3
{
  self->_fineScrubbingVerticalRange = a3;
}

- (NSMutableDictionary)perStateContent
{
  return self->_perStateContent;
}

- (void)setPerStateContent:(id)a3
{
}

- (CALayer)breadcrumbLayer
{
  return self->_breadcrumbLayer;
}

- (void)setBreadcrumbLayer:(id)a3
{
}

- (float)breadcrumbValue
{
  return self->_breadcrumbValue;
}

- (void)setBreadcrumbValue:(float)a3
{
  self->_breadcrumbValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbLayer, 0);
  objc_storeStrong((id *)&self->_perStateContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlightedThumb, 0);

  objc_storeStrong((id *)&self->_thumb, 0);
}

@end