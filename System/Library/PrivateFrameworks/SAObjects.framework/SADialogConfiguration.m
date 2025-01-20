@interface SADialogConfiguration
- (NSString)gender;
- (NSString)languageCode;
- (SAAceSerializable)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
- (void)setGender:(id)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation SADialogConfiguration

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DialogConfiguration";
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"context");
}

- (void)setContext:(id)a3
{
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

@end