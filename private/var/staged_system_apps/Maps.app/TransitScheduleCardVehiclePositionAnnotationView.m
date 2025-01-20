@interface TransitScheduleCardVehiclePositionAnnotationView
+ (double)shadowBlur;
- (CGSize)intrinsicContentSize;
@end

@implementation TransitScheduleCardVehiclePositionAnnotationView

- (CGSize)intrinsicContentSize
{
  v3 = [(TransitScheduleCardVehiclePositionAnnotationView *)self layer];
  [v3 size];
  double v5 = v4;

  v6 = [(TransitScheduleCardVehiclePositionAnnotationView *)self layer];
  [v6 size];
  double v8 = v7;

  double v9 = v8;
  double v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (double)shadowBlur
{
  return 2.0;
}

@end