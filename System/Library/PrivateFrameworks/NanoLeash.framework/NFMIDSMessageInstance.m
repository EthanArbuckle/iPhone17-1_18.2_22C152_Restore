@interface NFMIDSMessageInstance
+ (id)newMessageInstanceWithAction:(id)a3 retryCount:(int64_t)a4 retryInterval:(double)a5;
- (double)retryInterval;
- (id)description;
- (id)retryAction;
- (int64_t)retryCount;
- (void)setRetryAction:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setRetryInterval:(double)a3;
@end

@implementation NFMIDSMessageInstance

+ (id)newMessageInstanceWithAction:(id)a3 retryCount:(int64_t)a4 retryInterval:(double)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(NFMIDSMessageInstance);
  [(NFMIDSMessageInstance *)v8 setRetryAction:v7];

  [(NFMIDSMessageInstance *)v8 setRetryCount:a4];
  [(NFMIDSMessageInstance *)v8 setRetryInterval:a5];
  return v8;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)NFMIDSMessageInstance;
  v4 = [(NFMIDSMessageInstance *)&v10 description];
  int64_t retryCount = self->_retryCount;
  double retryInterval = self->_retryInterval;
  id v7 = (void *)MEMORY[0x2455DE870](self->_retryAction);
  v8 = [v3 stringWithFormat:@"(%@) Retries: %d Interval: %f Action: %@", v4, retryCount, *(void *)&retryInterval, v7];

  return v8;
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
}

@end