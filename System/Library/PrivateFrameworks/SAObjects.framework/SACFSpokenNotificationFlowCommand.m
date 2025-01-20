@interface SACFSpokenNotificationFlowCommand
+ (id)spokenNotificationFlowCommand;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldPromptUser;
- (NSString)languageCode;
- (NSString)notificationID;
- (NSString)outputVoiceLanguageCode;
- (NSString)userAgent;
- (NSString)userInterfaceIdiom;
- (SAAppInfo)appInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppInfo:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setNotificationID:(id)a3;
- (void)setOutputVoiceLanguageCode:(id)a3;
- (void)setShouldPromptUser:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation SACFSpokenNotificationFlowCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"SpokenNotificationFlowCommand";
}

+ (id)spokenNotificationFlowCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAppInfo)appInfo
{
  return (SAAppInfo *)AceObjectAceObjectForProperty(self, @"appInfo");
}

- (void)setAppInfo:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)notificationID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationID"];
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"outputVoiceLanguageCode"];
}

- (void)setOutputVoiceLanguageCode:(id)a3
{
}

- (BOOL)shouldPromptUser
{
  return AceObjectBoolForProperty(self, @"shouldPromptUser");
}

- (void)setShouldPromptUser:(BOOL)a3
{
}

- (NSString)userAgent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userAgent"];
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)userInterfaceIdiom
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userInterfaceIdiom"];
}

- (void)setUserInterfaceIdiom:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end