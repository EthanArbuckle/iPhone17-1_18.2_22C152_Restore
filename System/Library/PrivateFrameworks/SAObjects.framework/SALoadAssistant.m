@interface SALoadAssistant
+ (id)loadAssistant;
- (BOOL)gmDevice;
- (BOOL)requiresResponse;
- (NSArray)experiments;
- (NSData)activationToken;
- (NSData)linkedSessionValidationData;
- (NSData)sessionValidationData;
- (NSNumber)deviceAuthVersion;
- (NSNumber)rpiEnabled;
- (NSString)appleConnectServiceTicket;
- (NSString)appleConnectSessionToken;
- (NSString)assistantId;
- (NSString)connectionMode;
- (NSString)connectionType;
- (NSString)dataSharingOptInStatus;
- (NSString)ephemeralUserId;
- (NSString)hubAssistantId;
- (NSString)language;
- (NSString)lastKnownAceHostOfCompanion;
- (NSString)linkedAssistantId;
- (NSString)linkedSpeechId;
- (NSString)loggableAssistantId;
- (NSString)loggableSharedUserId;
- (NSString)selfClockId;
- (NSString)sharedUserId;
- (NSString)speechId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivationToken:(id)a3;
- (void)setAppleConnectServiceTicket:(id)a3;
- (void)setAppleConnectSessionToken:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setConnectionMode:(id)a3;
- (void)setConnectionType:(id)a3;
- (void)setDataSharingOptInStatus:(id)a3;
- (void)setDeviceAuthVersion:(id)a3;
- (void)setEphemeralUserId:(id)a3;
- (void)setExperiments:(id)a3;
- (void)setGmDevice:(BOOL)a3;
- (void)setHubAssistantId:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastKnownAceHostOfCompanion:(id)a3;
- (void)setLinkedAssistantId:(id)a3;
- (void)setLinkedSessionValidationData:(id)a3;
- (void)setLinkedSpeechId:(id)a3;
- (void)setLoggableAssistantId:(id)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setRpiEnabled:(id)a3;
- (void)setSelfClockId:(id)a3;
- (void)setSessionValidationData:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setSpeechId:(id)a3;
@end

@implementation SALoadAssistant

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"LoadAssistant";
}

+ (id)loadAssistant
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)activationToken
{
  return (NSData *)[(AceObject *)self propertyForKey:@"activationToken"];
}

- (void)setActivationToken:(id)a3
{
}

- (NSString)appleConnectServiceTicket
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appleConnectServiceTicket"];
}

- (void)setAppleConnectServiceTicket:(id)a3
{
}

- (NSString)appleConnectSessionToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appleConnectSessionToken"];
}

- (void)setAppleConnectSessionToken:(id)a3
{
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)connectionMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"connectionMode"];
}

- (void)setConnectionMode:(id)a3
{
}

- (NSString)connectionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"connectionType"];
}

- (void)setConnectionType:(id)a3
{
}

- (NSString)dataSharingOptInStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dataSharingOptInStatus"];
}

- (void)setDataSharingOptInStatus:(id)a3
{
}

- (NSNumber)deviceAuthVersion
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"deviceAuthVersion"];
}

- (void)setDeviceAuthVersion:(id)a3
{
}

- (NSString)ephemeralUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ephemeralUserId"];
}

- (void)setEphemeralUserId:(id)a3
{
}

- (NSArray)experiments
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"experiments", v3);
}

- (void)setExperiments:(id)a3
{
}

- (BOOL)gmDevice
{
  return AceObjectBoolForProperty(self, @"gmDevice");
}

- (void)setGmDevice:(BOOL)a3
{
}

- (NSString)hubAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hubAssistantId"];
}

- (void)setHubAssistantId:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)lastKnownAceHostOfCompanion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastKnownAceHostOfCompanion"];
}

- (void)setLastKnownAceHostOfCompanion:(id)a3
{
}

- (NSString)linkedAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"linkedAssistantId"];
}

- (void)setLinkedAssistantId:(id)a3
{
}

- (NSData)linkedSessionValidationData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"linkedSessionValidationData"];
}

- (void)setLinkedSessionValidationData:(id)a3
{
}

- (NSString)linkedSpeechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"linkedSpeechId"];
}

- (void)setLinkedSpeechId:(id)a3
{
}

- (NSString)loggableAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loggableAssistantId"];
}

- (void)setLoggableAssistantId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loggableSharedUserId"];
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSNumber)rpiEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"rpiEnabled"];
}

- (void)setRpiEnabled:(id)a3
{
}

- (NSString)selfClockId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selfClockId"];
}

- (void)setSelfClockId:(id)a3
{
}

- (NSData)sessionValidationData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"sessionValidationData"];
}

- (void)setSessionValidationData:(id)a3
{
}

- (NSString)sharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserId"];
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)speechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechId"];
}

- (void)setSpeechId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end