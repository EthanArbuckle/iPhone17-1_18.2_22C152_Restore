@interface SASmsRecipientSearch
+ (id)recipientSearch;
- (BOOL)clientShouldResolvePhonesAndEmails;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)recipients;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientShouldResolvePhonesAndEmails:(BOOL)a3;
- (void)setRecipients:(id)a3;
@end

@implementation SASmsRecipientSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"RecipientSearch";
}

+ (id)recipientSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)clientShouldResolvePhonesAndEmails
{
  return AceObjectBoolForProperty(self, @"clientShouldResolvePhonesAndEmails");
}

- (void)setClientShouldResolvePhonesAndEmails:(BOOL)a3
{
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
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end