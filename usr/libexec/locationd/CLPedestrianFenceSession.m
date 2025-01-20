@interface CLPedestrianFenceSession
- (CLPedestrianFenceServiceClientProtocol)client;
- (CLPedestrianFenceSession)initWithClient:(id)a3 identifier:(id)a4 atTime:(double)a5 atMonotonicTime:(double)a6;
- (NSMutableDictionary)fenceIDToIndex;
- (NSMutableDictionary)fenceMetadata;
- (NSString)clientIdentifier;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setFenceIDToIndex:(id)a3;
- (void)setFenceMetadata:(id)a3;
@end

@implementation CLPedestrianFenceSession

- (CLPedestrianFenceSession)initWithClient:(id)a3 identifier:(id)a4 atTime:(double)a5 atMonotonicTime:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLPedestrianFenceSession;
  v10 = [(CLPedestrianFenceSession *)&v12 init];
  if (v10)
  {
    v10->_client = (CLPedestrianFenceServiceClientProtocol *)a3;
    v10->_clientIdentifier = (NSString *)a4;
    v10->_fenceIDToIndex = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->_fenceMetadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->_sessionStartTimeSince1970 = a5;
    v10->_sessionStartTime = a6;
    v10->_numFences = 0;
  }
  return v10;
}

- (void)dealloc
{
  self->_client = 0;
  self->_clientIdentifier = 0;

  self->_fenceIDToIndex = 0;
  self->_fenceMetadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceSession;
  [(CLPedestrianFenceSession *)&v3 dealloc];
}

- (CLPedestrianFenceServiceClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSMutableDictionary)fenceIDToIndex
{
  return self->_fenceIDToIndex;
}

- (void)setFenceIDToIndex:(id)a3
{
}

- (NSMutableDictionary)fenceMetadata
{
  return self->_fenceMetadata;
}

- (void)setFenceMetadata:(id)a3
{
}

@end