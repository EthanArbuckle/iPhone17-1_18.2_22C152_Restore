@interface SALocalSearchSendToProtobufConduitCompleted
+ (id)sendToProtobufConduitCompleted;
- (BOOL)requiresResponse;
- (NSData)rawResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRawResponse:(id)a3;
@end

@implementation SALocalSearchSendToProtobufConduitCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"SendToProtobufConduitCompleted";
}

+ (id)sendToProtobufConduitCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)rawResponse
{
  return (NSData *)[(AceObject *)self propertyForKey:@"rawResponse"];
}

- (void)setRawResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end