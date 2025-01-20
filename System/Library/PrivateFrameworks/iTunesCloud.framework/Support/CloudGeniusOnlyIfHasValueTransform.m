@interface CloudGeniusOnlyIfHasValueTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfHasValueTransform

- (id)geniusValueForMLValue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CloudGeniusOnlyIfHasValueTransform;
  v3 = [(CloudGeniusHasValueTransform *)&v7 geniusValueForMLValue:a3];
  if ([v3 BOOLValue]) {
    v4 = &__kCFBooleanTrue;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end