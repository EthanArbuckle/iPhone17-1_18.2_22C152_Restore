@interface SALocalSearchPhoneNumber
+ (id)phoneNumber;
- (NSString)type;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SALocalSearchPhoneNumber

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"PhoneNumber";
}

+ (id)phoneNumber
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end