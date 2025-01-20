@interface TSDSliderTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSDSliderTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDSliderTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = (NSString *)[(TSDSliderTableViewCellAccessibility *)self tsaxValueForKey:@"sliderValueFormat"];
  [(TSDSliderTableViewCellAccessibility *)self tsaxCGFloatValueForKey:@"sliderValue"];
  uint64_t v5 = v4;
  id v6 = [(TSDSliderTableViewCellAccessibility *)self tsaxValueForKey:@"mLabelSuffix"];
  if (v3) {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  }
  if ([v6 length])
  {
    if ([(NSString *)v3 length]) {
      return [(NSString *)v3 stringByAppendingFormat:@" %@", v6];
    }
    return v6;
  }
  return v3;
}

@end