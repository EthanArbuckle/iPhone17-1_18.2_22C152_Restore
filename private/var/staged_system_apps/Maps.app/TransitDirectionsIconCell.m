@interface TransitDirectionsIconCell
+ (Class)stepViewClass;
- (TransitDirectionsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TransitDirectionsIconCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (TransitDirectionsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsIconCell;
  v4 = [(TransitDirectionsCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(TransitDirectionsCell *)v4 stepView];
    id v7 = [(TransitDirectionsIconCell *)v5 _mapkit_forceSeparatorFrameToCGRectZero];
    [(TransitDirectionsIconCell *)v5 set_mapkit_forceSeparatorFrameToCGRectZero:0];
    [(TransitDirectionsCell *)v5 _separatorFrame];
    [v6 _setCalculatedSeparatorHeight:v8];
    [(TransitDirectionsIconCell *)v5 set_mapkit_forceSeparatorFrameToCGRectZero:v7];
  }
  return v5;
}

@end