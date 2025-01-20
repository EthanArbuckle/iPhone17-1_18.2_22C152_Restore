@interface SAReminderSmsPayload
+ (id)smsPayload;
- (NSArray)recipients;
- (NSString)message;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMessage:(id)a3;
- (void)setRecipients:(id)a3;
@end

@implementation SAReminderSmsPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"SmsPayload";
}

+ (id)smsPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"recipients"];
}

- (void)setRecipients:(id)a3
{
}

@end