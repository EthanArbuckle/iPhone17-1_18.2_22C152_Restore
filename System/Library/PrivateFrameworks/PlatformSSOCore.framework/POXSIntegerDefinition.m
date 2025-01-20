@interface POXSIntegerDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSIntegerDefinition

- (id)valueFromString:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 integerValue];
  return (id)[v3 numberWithInteger:v4];
}

- (id)stringFromValue:(id)a3
{
  return (id)[a3 stringValue];
}

@end