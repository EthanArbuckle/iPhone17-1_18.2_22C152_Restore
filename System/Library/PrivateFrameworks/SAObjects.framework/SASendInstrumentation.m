@interface SASendInstrumentation
+ (id)sendInstrumentation;
- (BOOL)requiresResponse;
- (NSArray)instrumentationBatch;
- (NSNumber)eventTransmittedRelativeToBootTimeTimestampNs;
- (NSString)eventTransmittedTimestampRefId;
- (NSString)payloadVersion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(id)a3;
- (void)setEventTransmittedTimestampRefId:(id)a3;
- (void)setInstrumentationBatch:(id)a3;
- (void)setPayloadVersion:(id)a3;
@end

@implementation SASendInstrumentation

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SendInstrumentation";
}

+ (id)sendInstrumentation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)eventTransmittedRelativeToBootTimeTimestampNs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"eventTransmittedRelativeToBootTimeTimestampNs"];
}

- (void)setEventTransmittedRelativeToBootTimeTimestampNs:(id)a3
{
}

- (NSString)eventTransmittedTimestampRefId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"eventTransmittedTimestampRefId"];
}

- (void)setEventTransmittedTimestampRefId:(id)a3
{
}

- (NSArray)instrumentationBatch
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"instrumentationBatch"];
}

- (void)setInstrumentationBatch:(id)a3
{
}

- (NSString)payloadVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"payloadVersion"];
}

- (void)setPayloadVersion:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end