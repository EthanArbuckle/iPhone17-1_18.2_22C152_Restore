@interface SASyncServerSyncDataRequest
- (BOOL)requiresResponse;
- (NSString)assistantId;
- (NSString)clientGeneration;
- (NSString)syncToken;
- (NSString)syncType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssistantId:(id)a3;
- (void)setClientGeneration:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setSyncType:(id)a3;
@end

@implementation SASyncServerSyncDataRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ServerSyncDataRequest";
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)clientGeneration
{
  return (NSString *)[(AceObject *)self propertyForKey:@"clientGeneration"];
}

- (void)setClientGeneration:(id)a3
{
}

- (NSString)syncType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"syncType"];
}

- (void)setSyncType:(id)a3
{
}

- (NSString)syncToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"syncToken"];
}

- (void)setSyncToken:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end