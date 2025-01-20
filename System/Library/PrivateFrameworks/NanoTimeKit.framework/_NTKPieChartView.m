@interface _NTKPieChartView
+ (Class)layerClass;
- (_NTKPieChartView)initWithFrame:(CGRect)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
@end

@implementation _NTKPieChartView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_NTKPieChartView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_NTKPieChartView;
  v3 = -[_NTKPieChartView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(_NTKPieChartView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    double v7 = v6;
    v8 = [(_NTKPieChartView *)v3 layer];
    [v8 setContentsScale:v7];
  }
  return v3;
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  if (a4)
  {
    id v8 = [(_NTKPieChartView *)self layer];
    [v8 setProgress:a3];
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
    double v6 = [(_NTKPieChartView *)self layer];
    [v6 setProgress:a3];

    double v7 = (void *)MEMORY[0x1E4FB1EB0];
    [v7 setAnimationsEnabled:1];
  }
}

@end