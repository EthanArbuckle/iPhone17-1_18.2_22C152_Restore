@interface SASyncServerSyncDataResponse
- (BOOL)lastBatch;
- (BOOL)requiresResponse;
- (NSArray)dataBatch;
- (NSString)assistantId;
- (NSString)responseCode;
- (NSString)serverGeneration;
- (NSString)syncType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)batchNumber;
- (void)setAssistantId:(id)a3;
- (void)setBatchNumber:(int64_t)a3;
- (void)setDataBatch:(id)a3;
- (void)setLastBatch:(BOOL)a3;
- (void)setResponseCode:(id)a3;
- (void)setServerGeneration:(id)a3;
- (void)setSyncType:(id)a3;
@end

@implementation SASyncServerSyncDataResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ServerSyncDataResponse";
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (int64_t)batchNumber
{
  return AceObjectIntegerForProperty(self, @"batchNumber");
}

- (void)setBatchNumber:(int64_t)a3
{
}

- (NSArray)dataBatch
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"dataBatch", v3);
}

- (void)setDataBatch:(id)a3
{
}

- (BOOL)lastBatch
{
  return AceObjectBoolForProperty(self, @"lastBatch");
}

- (void)setLastBatch:(BOOL)a3
{
}

- (NSString)responseCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseCode"];
}

- (void)setResponseCode:(id)a3
{
}

- (NSString)serverGeneration
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serverGeneration"];
}

- (void)setServerGeneration:(id)a3
{
}

- (NSString)syncType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"syncType"];
}

- (void)setSyncType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end