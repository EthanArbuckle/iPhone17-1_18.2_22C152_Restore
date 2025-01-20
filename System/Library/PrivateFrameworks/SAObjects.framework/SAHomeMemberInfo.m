@interface SAHomeMemberInfo
- (BOOL)userAvailable;
- (NSArray)attributes;
- (NSString)companionAssistantId;
- (NSString)companionSpeechId;
- (NSString)enrollmentName;
- (NSString)lastVisitedAceHost;
- (NSString)loggableCompanionAssistantId;
- (NSString)loggableMultiUserSharedUserId;
- (NSString)loggableSharedUserId;
- (NSString)personaIdentifier;
- (NSString)sharedUserId;
- (NSString)speechId;
- (SAHomeMemberSettings)homeMemberSettings;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributes:(id)a3;
- (void)setCompanionAssistantId:(id)a3;
- (void)setCompanionSpeechId:(id)a3;
- (void)setEnrollmentName:(id)a3;
- (void)setHomeMemberSettings:(id)a3;
- (void)setLastVisitedAceHost:(id)a3;
- (void)setLoggableCompanionAssistantId:(id)a3;
- (void)setLoggableMultiUserSharedUserId:(id)a3;
- (void)setLoggableSharedUserId:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setUserAvailable:(BOOL)a3;
@end

@implementation SAHomeMemberInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"HomeMemberInfo";
}

- (NSArray)attributes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"attributes"];
}

- (void)setAttributes:(id)a3
{
}

- (NSString)companionAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"companionAssistantId"];
}

- (void)setCompanionAssistantId:(id)a3
{
}

- (NSString)companionSpeechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"companionSpeechId"];
}

- (void)setCompanionSpeechId:(id)a3
{
}

- (NSString)enrollmentName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"enrollmentName"];
}

- (void)setEnrollmentName:(id)a3
{
}

- (SAHomeMemberSettings)homeMemberSettings
{
  return (SAHomeMemberSettings *)AceObjectAceObjectForProperty(self, @"homeMemberSettings");
}

- (void)setHomeMemberSettings:(id)a3
{
}

- (NSString)lastVisitedAceHost
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastVisitedAceHost"];
}

- (void)setLastVisitedAceHost:(id)a3
{
}

- (NSString)loggableCompanionAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loggableCompanionAssistantId"];
}

- (void)setLoggableCompanionAssistantId:(id)a3
{
}

- (NSString)loggableMultiUserSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loggableMultiUserSharedUserId"];
}

- (void)setLoggableMultiUserSharedUserId:(id)a3
{
}

- (NSString)loggableSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loggableSharedUserId"];
}

- (void)setLoggableSharedUserId:(id)a3
{
}

- (NSString)personaIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personaIdentifier"];
}

- (void)setPersonaIdentifier:(id)a3
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

- (BOOL)userAvailable
{
  return AceObjectBoolForProperty(self, @"userAvailable");
}

- (void)setUserAvailable:(BOOL)a3
{
}

@end