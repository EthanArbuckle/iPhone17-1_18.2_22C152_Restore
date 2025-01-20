@interface SASyncGetCachedSyncAnchorsResponse
+ (id)getCachedSyncAnchorsResponse;
- (BOOL)requiresResponse;
- (NSArray)anchors;
- (NSString)interactionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnchors:(id)a3;
- (void)setInteractionId:(id)a3;
@end

@implementation SASyncGetCachedSyncAnchorsResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"GetCachedSyncAnchorsResponse";
}

+ (id)getCachedSyncAnchorsResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)anchors
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"anchors", v3);
}

- (void)setAnchors:(id)a3
{
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

@end