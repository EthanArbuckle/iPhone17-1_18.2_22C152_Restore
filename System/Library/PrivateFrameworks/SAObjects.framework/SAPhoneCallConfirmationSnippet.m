@interface SAPhoneCallConfirmationSnippet
- (NSArray)persons;
- (NSString)confirmationDisplayText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfirmationDisplayText:(id)a3;
- (void)setPersons:(id)a3;
@end

@implementation SAPhoneCallConfirmationSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallConfirmationSnippet";
}

- (NSString)confirmationDisplayText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"confirmationDisplayText"];
}

- (void)setConfirmationDisplayText:(id)a3
{
}

- (NSArray)persons
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"persons", v3);
}

- (void)setPersons:(id)a3
{
}

@end