@interface SAUIShowSmsMessage
+ (id)showSmsMessage;
- (BOOL)showAsDraft;
- (SASmsSms)sms;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setShowAsDraft:(BOOL)a3;
- (void)setSms:(id)a3;
@end

@implementation SAUIShowSmsMessage

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ShowSmsMessage";
}

+ (id)showSmsMessage
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)showAsDraft
{
  return AceObjectBoolForProperty(self, @"showAsDraft");
}

- (void)setShowAsDraft:(BOOL)a3
{
}

- (SASmsSms)sms
{
  return (SASmsSms *)AceObjectAceObjectForProperty(self, @"sms");
}

- (void)setSms:(id)a3
{
}

@end