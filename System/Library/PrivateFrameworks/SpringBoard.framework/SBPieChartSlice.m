@interface SBPieChartSlice
+ (id)sliceWithValue:(double)a3 fillColor:(id)a4;
- (SBPieChartSlice)initWithValue:(double)a3 fillColor:(id)a4;
- (UIColor)fillColor;
- (double)value;
@end

@implementation SBPieChartSlice

- (SBPieChartSlice)initWithValue:(double)a3 fillColor:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBPieChartSlice;
  v8 = [(SBPieChartSlice *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_fillColor, a4);
    v10 = v9;
  }

  return v9;
}

+ (id)sliceWithValue:(double)a3 fillColor:(id)a4
{
  id v5 = a4;
  v6 = [[SBPieChartSlice alloc] initWithValue:v5 fillColor:a3];

  return v6;
}

- (double)value
{
  return self->_value;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end