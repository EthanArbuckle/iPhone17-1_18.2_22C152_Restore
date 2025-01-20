@interface SACreateAssistant
+ (id)createAssistant;
- (BOOL)requiresResponse;
- (NSData)activationToken;
- (NSData)linkedValidationData;
- (NSData)validationData;
- (NSString)appleConnectServiceTicket;
- (NSString)appleConnectSessionToken;
- (NSString)connectionMode;
- (NSString)connectionType;
- (NSString)language;
- (NSString)linkedAssistantId;
- (NSString)linkedSpeechId;
- (NSString)speechId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivationToken:(id)a3;
- (void)setAppleConnectServiceTicket:(id)a3;
- (void)setAppleConnectSessionToken:(id)a3;
- (void)setConnectionMode:(id)a3;
- (void)setConnectionType:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLinkedAssistantId:(id)a3;
- (void)setLinkedSpeechId:(id)a3;
- (void)setLinkedValidationData:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setValidationData:(id)a3;
@end

@implementation SACreateAssistant

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CreateAssistant";
}

+ (id)createAssistant
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

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)linkedAssistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"linkedAssistantId"];
}

- (void)setLinkedAssistantId:(id)a3
{
}

- (NSString)linkedSpeechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"linkedSpeechId"];
}

- (void)setLinkedSpeechId:(id)a3
{
}

- (NSData)linkedValidationData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"linkedValidationData"];
}

- (void)setLinkedValidationData:(id)a3
{
}

- (NSString)speechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechId"];
}

- (void)setSpeechId:(id)a3
{
}

- (NSData)validationData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"validationData"];
}

- (void)setValidationData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end