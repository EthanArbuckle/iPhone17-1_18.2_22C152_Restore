@interface SAReminderPhonePayload
+ (id)phonePayload;
- (NSString)phoneCallType;
- (NSString)recipient;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhoneCallType:(id)a3;
- (void)setRecipient:(id)a3;
@end

@implementation SAReminderPhonePayload

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"PhonePayload";
}

+ (id)phonePayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)phoneCallType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneCallType"];
}

- (void)setPhoneCallType:(id)a3
{
}

- (NSString)recipient
{
  return (NSString *)[(AceObject *)self propertyForKey:@"recipient"];
}

- (void)setRecipient:(id)a3
{
}

@end