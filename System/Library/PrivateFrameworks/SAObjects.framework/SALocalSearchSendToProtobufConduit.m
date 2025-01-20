@interface SALocalSearchSendToProtobufConduit
+ (id)sendToProtobufConduit;
- (BOOL)requiresResponse;
- (NSArray)attributes;
- (NSData)rawRequest;
- (NSURL)endpoint;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)timeoutInSeconds;
- (void)setAttributes:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setRawRequest:(id)a3;
- (void)setTimeoutInSeconds:(int64_t)a3;
@end

@implementation SALocalSearchSendToProtobufConduit

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"SendToProtobufConduit";
}

+ (id)sendToProtobufConduit
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attributes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attributes", v3);
}

- (void)setAttributes:(id)a3
{
}

- (NSURL)endpoint
{
  return (NSURL *)AceObjectURLForProperty(self, @"endpoint");
}

- (void)setEndpoint:(id)a3
{
}

- (NSData)rawRequest
{
  return (NSData *)[(AceObject *)self propertyForKey:@"rawRequest"];
}

- (void)setRawRequest:(id)a3
{
}

- (int64_t)timeoutInSeconds
{
  return AceObjectIntegerForProperty(self, @"timeoutInSeconds");
}

- (void)setTimeoutInSeconds:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end