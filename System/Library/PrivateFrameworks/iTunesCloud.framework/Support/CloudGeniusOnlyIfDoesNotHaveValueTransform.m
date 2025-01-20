@interface CloudGeniusOnlyIfDoesNotHaveValueTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfDoesNotHaveValueTransform

- (id)geniusValueForMLValue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CloudGeniusOnlyIfDoesNotHaveValueTransform;
  v3 = [(CloudGeniusHasValueTransform *)&v7 geniusValueForMLValue:a3];
  if ([v3 BOOLValue]) {
    v4 = 0;
  }
  else {
    v4 = &__kCFBooleanTrue;
  }
  id v5 = v4;

  return v5;
}

@end