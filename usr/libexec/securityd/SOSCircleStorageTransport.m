@interface SOSCircleStorageTransport
- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4;
- (BOOL)flushChanges:(__CFError *)a3;
- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5;
- (SOSAccount)account;
- (SOSCircleStorageTransport)init;
- (SOSCircleStorageTransport)initWithAccount:(id)a3;
- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4;
- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4;
- (int64_t)circleGetTypeID;
- (int64_t)getTransportType;
- (void)setAccount:(id)a3;
@end

@implementation SOSCircleStorageTransport

- (void).cxx_destruct
{
}

- (void)setAccount:(id)a3
{
}

- (SOSAccount)account
{
  return self->account;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
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
  return 0;
}

- (int64_t)circleGetTypeID
{
  return 0;
}

- (SOSCircleStorageTransport)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOSCircleStorageTransport;
  v5 = [(SOSCircleStorageTransport *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SOSCircleStorageTransport *)v5 setAccount:v4];
  }

  return v6;
}

- (SOSCircleStorageTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)SOSCircleStorageTransport;
  return [(SOSCircleStorageTransport *)&v3 init];
}

@end