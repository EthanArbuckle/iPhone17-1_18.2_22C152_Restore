@interface SOSCKCircleStorage
- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4;
- (BOOL)flushChanges:(__CFError *)a3;
- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5;
- (SOSCKCircleStorage)init;
- (SOSCKCircleStorage)initWithAccount:(id)a3;
- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4;
- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4;
- (int64_t)getTransportType;
@end

@implementation SOSCKCircleStorage

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return 1;
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 1;
}

- (int64_t)getTransportType
{
  return 6;
}

- (SOSCKCircleStorage)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOSCKCircleStorage;
  v5 = [(SOSCircleStorageTransport *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SOSCircleStorageTransport *)v5 setAccount:v4];
  }

  return v6;
}

- (SOSCKCircleStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)SOSCKCircleStorage;
  v2 = [(SOSCircleStorageTransport *)&v5 init];
  v3 = v2;
  if (v2) {
    sub_10020C938(v2);
  }
  return v3;
}

@end