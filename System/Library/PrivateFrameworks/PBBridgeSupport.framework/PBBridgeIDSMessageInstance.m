@interface PBBridgeIDSMessageInstance
+ (id)newMessageInstanceOfType:(unsigned __int16)a3 retryCount:(int64_t)a4 retryInterval:(double)a5 withAction:(id)a6;
- (NSNumber)sentAbsoluteTime;
- (PBBridgeIDSMessageInstance)init;
- (double)retryInterval;
- (id)description;
- (id)retryAction;
- (int64_t)retryCount;
- (unsigned)typeID;
- (void)setRetryAction:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setRetryInterval:(double)a3;
- (void)setSentAbsoluteTime:(id)a3;
- (void)setTypeID:(unsigned __int16)a3;
@end

@implementation PBBridgeIDSMessageInstance

+ (id)newMessageInstanceOfType:(unsigned __int16)a3 retryCount:(int64_t)a4 retryInterval:(double)a5 withAction:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  v10 = objc_alloc_init(PBBridgeIDSMessageInstance);
  v11 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  [(PBBridgeIDSMessageInstance *)v10 setSentAbsoluteTime:v11];

  [(PBBridgeIDSMessageInstance *)v10 setTypeID:v8];
  [(PBBridgeIDSMessageInstance *)v10 setRetryAction:v9];

  [(PBBridgeIDSMessageInstance *)v10 setRetryCount:a4];
  [(PBBridgeIDSMessageInstance *)v10 setRetryInterval:a5];
  return v10;
}

- (PBBridgeIDSMessageInstance)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBBridgeIDSMessageInstance;
  result = [(PBBridgeIDSMessageInstance *)&v3 init];
  if (result) {
    result->_typeID = -1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PBBridgeIDSMessageInstance;
  v4 = [(PBBridgeIDSMessageInstance *)&v10 description];
  int64_t retryCount = self->_retryCount;
  double retryInterval = self->_retryInterval;
  v7 = (void *)MEMORY[0x21D4A74C0](self->_retryAction);
  uint64_t v8 = [v3 stringWithFormat:@"(%@) Retries: %d Interval: %f Action: %@", v4, retryCount, *(void *)&retryInterval, v7];

  return v8;
}

- (NSNumber)sentAbsoluteTime
{
  return self->_sentAbsoluteTime;
}

- (void)setSentAbsoluteTime:(id)a3
{
}

- (unsigned)typeID
{
  return self->_typeID;
}

- (void)setTypeID:(unsigned __int16)a3
{
  self->_typeID = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_int64_t retryCount = a3;
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (void)setRetryInterval:(double)a3
{
  self->_double retryInterval = a3;
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryAction, 0);
  objc_storeStrong((id *)&self->_sentAbsoluteTime, 0);
}

@end