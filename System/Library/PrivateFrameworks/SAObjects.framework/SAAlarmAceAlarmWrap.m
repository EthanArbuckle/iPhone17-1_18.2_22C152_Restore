@interface SAAlarmAceAlarmWrap
+ (id)aceAlarmWrap;
- (NSNumber)generation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGeneration:(id)a3;
@end

@implementation SAAlarmAceAlarmWrap

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"AceAlarmWrap";
}

+ (id)aceAlarmWrap
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)generation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"generation"];
}

- (void)setGeneration:(id)a3
{
}

@end