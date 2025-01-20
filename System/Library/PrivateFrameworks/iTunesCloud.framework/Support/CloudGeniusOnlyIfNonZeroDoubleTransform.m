@interface CloudGeniusOnlyIfNonZeroDoubleTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfNonZeroDoubleTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v3 doubleValue], v4 == 0.0)) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

@end