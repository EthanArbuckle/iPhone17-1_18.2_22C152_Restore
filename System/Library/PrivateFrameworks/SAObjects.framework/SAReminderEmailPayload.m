@interface SAReminderEmailPayload
+ (id)emailPayload;
- (NSArray)recipientsTo;
- (NSString)subject;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecipientsTo:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation SAReminderEmailPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"EmailPayload";
}

+ (id)emailPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)recipientsTo
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"recipientsTo"];
}

- (void)setRecipientsTo:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

@end