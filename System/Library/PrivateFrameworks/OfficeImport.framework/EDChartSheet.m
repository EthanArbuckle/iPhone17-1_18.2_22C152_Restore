@interface EDChartSheet
- (BOOL)areBoundsSet;
- (CGRect)bounds;
- (id)mainChart;
- (void)addDrawable:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setMainChart:(id)a3;
- (void)teardown;
@end

@implementation EDChartSheet

- (void)setBounds:(CGRect)a3
{
  self->mIsBoundsSet = 1;
  self->mBounds = a3;
}

- (void)setMainChart:(id)a3
{
  v5 = (CHDChart *)a3;
  mMainChart = self->mMainChart;
  v7 = v5;
  if (mMainChart != v5)
  {
    [(CHDChart *)mMainChart setSheet:0];
    objc_storeStrong((id *)&self->mMainChart, a3);
    [(CHDChart *)self->mMainChart setSheet:self];
  }
}

- (BOOL)areBoundsSet
{
  return self->mIsBoundsSet;
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)mainChart
{
  return self->mMainChart;
}

- (void)addDrawable:(id)a3
{
  id v4 = a3;
  mMainChart = self->mMainChart;
  if (mMainChart)
  {
    [(CHDChart *)mMainChart addChild:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(EDChartSheet *)self setMainChart:v4];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)EDChartSheet;
      [(EDSheet *)&v6 addDrawable:v4];
    }
  }
}

- (void)teardown
{
  [(CHDChart *)self->mMainChart setSheet:0];
  mMainChart = self->mMainChart;
  self->mMainChart = 0;

  v4.receiver = self;
  v4.super_class = (Class)EDChartSheet;
  [(EDSheet *)&v4 teardown];
}

- (void).cxx_destruct
{
}

@end