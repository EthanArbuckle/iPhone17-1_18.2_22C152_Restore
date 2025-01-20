@interface SBPieChartView
- (SBPieChartView)initWithFrame:(CGRect)a3;
- (void)_drawSlice:(id)a3 atValue:(double)a4;
- (void)_rotateContext;
- (void)_updateMetrics;
- (void)drawRect:(CGRect)a3;
- (void)setSlices:(id)a3;
@end

@implementation SBPieChartView

- (SBPieChartView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBPieChartView;
  v3 = -[SBPieChartView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_defaultRotation = -1.57079633;
    [(SBPieChartView *)v3 setClearsContextBeforeDrawing:1];
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBPieChartView *)v4 setBackgroundColor:v5];

    v6 = v4;
  }

  return v4;
}

- (void)setSlices:(id)a3
{
  p_slices = &self->_slices;
  objc_storeStrong((id *)&self->_slices, a3);
  id v6 = a3;
  v7 = [(NSArray *)*p_slices valueForKeyPath:@"@sum.value"];

  [v7 floatValue];
  self->_valueTotal = v8;

  [(SBPieChartView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(SBPieChartView *)self _updateMetrics];
  [(SBPieChartView *)self _rotateContext];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_slices;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        -[SBPieChartView _drawSlice:atValue:](self, "_drawSlice:atValue:", v10, v8, (void)v12);
        [v10 value];
        double v8 = v8 + v11;
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_updateMetrics
{
  [(SBPieChartView *)self bounds];
  double v5 = fmin(v3 * 0.5, v4 * 0.5);
  self->_radius = v5;
  self->_center.x = v5;
  self->_center.y = v5;
}

- (void)_rotateContext
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, self->_radius, self->_radius);
  CGContextRotateCTM(CurrentContext, self->_defaultRotation);
  double v4 = -self->_radius;
  CGContextTranslateCTM(CurrentContext, v4, v4);
}

- (void)_drawSlice:(id)a3 atValue:(double)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F427D0];
  id v7 = a3;
  id v15 = [v6 bezierPath];
  double v8 = (a4 / self->_valueTotal + a4 / self->_valueTotal) * 3.14159265;
  double radius = self->_radius;
  float v10 = v8;
  __float2 v11 = __sincosf_stret(v10);
  [v7 value];
  double v13 = ((v12 + a4) / self->_valueTotal + (v12 + a4) / self->_valueTotal) * 3.14159265;
  objc_msgSend(v15, "moveToPoint:", self->_center.x, self->_center.y);
  objc_msgSend(v15, "addLineToPoint:", radius + radius * v11.__cosval, radius + radius * v11.__sinval);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, self->_center.x, self->_center.y, self->_radius, v8, v13);
  [v15 closePath];
  long long v14 = [v7 fillColor];

  [v14 setFill];
  [v15 fill];
}

- (void).cxx_destruct
{
}

@end