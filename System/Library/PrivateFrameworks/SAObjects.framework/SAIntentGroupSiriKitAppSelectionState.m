@interface SAIntentGroupSiriKitAppSelectionState
+ (id)siriKitAppSelectionState;
- (NSArray)eligibleApps;
- (NSString)appConfirmationState;
- (NSString)appCorrectionState;
- (SASyncAppIdentifyingInfo)requestedApp;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppConfirmationState:(id)a3;
- (void)setAppCorrectionState:(id)a3;
- (void)setEligibleApps:(id)a3;
- (void)setRequestedApp:(id)a3;
@end

@implementation SAIntentGroupSiriKitAppSelectionState

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitAppSelectionState";
}

+ (id)siriKitAppSelectionState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appConfirmationState
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appConfirmationState"];
}

- (void)setAppConfirmationState:(id)a3
{
}

- (NSString)appCorrectionState
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appCorrectionState"];
}

- (void)setAppCorrectionState:(id)a3
{
}

- (NSArray)eligibleApps
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"eligibleApps", v3);
}

- (void)setEligibleApps:(id)a3
{
}

- (SASyncAppIdentifyingInfo)requestedApp
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, @"requestedApp");
}

- (void)setRequestedApp:(id)a3
{
}

@end