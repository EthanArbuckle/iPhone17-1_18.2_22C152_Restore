@interface SASyncGetCachedSyncAnchors
+ (id)getCachedSyncAnchors;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)interactionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInteractionId:(id)a3;
@end

@implementation SASyncGetCachedSyncAnchors

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"GetCachedSyncAnchors";
}

+ (id)getCachedSyncAnchors
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end