@interface MRJSONTransportExternalDevice
- (BOOL)isPaired;
- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3;
@end

@implementation MRJSONTransportExternalDevice

- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3
{
  uint64_t v3 = qword_10047E0B8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10047E0B8, &stru_10041AD40);
  }
  id v5 = objc_alloc((Class)MRExternalJSONClientConnection);
  id v6 = [v5 initWithConnection:v4 queue:qword_10047E0B0];

  return v6;
}

- (BOOL)isPaired
{
  return 1;
}

@end