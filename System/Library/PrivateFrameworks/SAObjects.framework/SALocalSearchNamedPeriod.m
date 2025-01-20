@interface SALocalSearchNamedPeriod
+ (id)namedPeriod;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SALocalSearchNamedPeriod

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"NamedPeriod";
}

+ (id)namedPeriod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end