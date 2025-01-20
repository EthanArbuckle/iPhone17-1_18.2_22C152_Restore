@interface CloudGeniusOnlyIfNonEmptyStringTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfNonEmptyStringTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end