@interface SASmsRecipientSearchCompleted
+ (id)recipientSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)recipients;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecipients:(id)a3;
@end

@implementation SASmsRecipientSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"RecipientSearchCompleted";
}

+ (id)recipientSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)recipients
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recipients", v3);
}

- (void)setRecipients:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end