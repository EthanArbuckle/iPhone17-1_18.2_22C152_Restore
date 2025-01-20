@interface CloudGeniusOnlyIfNegatedBooleanTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfNegatedBooleanTransform

- (id)geniusValueForMLValue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CloudGeniusOnlyIfNegatedBooleanTransform;
  v3 = [(CloudGeniusBooleanTransform *)&v7 geniusValueForMLValue:a3];
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