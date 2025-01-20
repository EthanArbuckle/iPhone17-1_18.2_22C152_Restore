@interface SAInitiateHandoffOnCompanion
+ (id)initiateHandoffOnCompanion;
- (BOOL)requiresResponse;
- (NSNumber)isSiriXRequest;
- (NSString)lockScreenText;
- (NSString)lockScreenTextDialogIdentifier;
- (NSString)notificationText;
- (NSString)notificationTextDialogIdentifier;
- (SAHandoffPayload)handoffPayload;
- (SARemoteDevice)targetDevice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHandoffPayload:(id)a3;
- (void)setIsSiriXRequest:(id)a3;
- (void)setLockScreenText:(id)a3;
- (void)setLockScreenTextDialogIdentifier:(id)a3;
- (void)setNotificationText:(id)a3;
- (void)setNotificationTextDialogIdentifier:(id)a3;
- (void)setTargetDevice:(id)a3;
@end

@implementation SAInitiateHandoffOnCompanion

+ (id)initiateHandoffOnCompanion
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"InitiateHandoffOnCompanion";
}

- (SAHandoffPayload)handoffPayload
{
  return (SAHandoffPayload *)AceObjectAceObjectForProperty(self, @"handoffPayload");
}

- (void)setHandoffPayload:(id)a3
{
}

- (NSNumber)isSiriXRequest
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isSiriXRequest"];
}

- (void)setIsSiriXRequest:(id)a3
{
}

- (NSString)lockScreenText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lockScreenText"];
}

- (void)setLockScreenText:(id)a3
{
}

- (NSString)lockScreenTextDialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lockScreenTextDialogIdentifier"];
}

- (void)setLockScreenTextDialogIdentifier:(id)a3
{
}

- (NSString)notificationText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationText"];
}

- (void)setNotificationText:(id)a3
{
}

- (NSString)notificationTextDialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationTextDialogIdentifier"];
}

- (void)setNotificationTextDialogIdentifier:(id)a3
{
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, @"targetDevice");
}

- (void)setTargetDevice:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end