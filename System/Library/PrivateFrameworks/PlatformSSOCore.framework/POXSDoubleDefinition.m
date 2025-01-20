@interface POXSDoubleDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSDoubleDefinition

- (id)valueFromString:(id)a3
{
  v3 = NSNumber;
  [a3 doubleValue];
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

- (id)stringFromValue:(id)a3
{
  return (id)[a3 stringValue];
}

@end