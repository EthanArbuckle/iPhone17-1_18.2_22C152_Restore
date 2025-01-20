@interface MFDeliveryResult
- (BOOL)isWifi;
- (MFDeliveryResult)initWithStatus:(int64_t)a3;
- (double)duration;
- (id)description;
- (int64_t)attributes;
- (int64_t)status;
- (unint64_t)bytesSent;
- (void)setAttributes:(int64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setIsWifi:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation MFDeliveryResult

- (MFDeliveryResult)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFDeliveryResult;
  v4 = [(MFDeliveryResult *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_status = a3;
    v6 = +[MFNetworkController sharedInstance];
    v5->_isWifi = [v6 isFatPipe];
  }
  return v5;
}

- (id)description
{
  unint64_t status = self->_status;
  if (status > 9) {
    v3 = @"EMMessageDeliveryStatusFatalError";
  }
  else {
    v3 = off_1E5D3E550[status];
  }
  v4 = [NSString stringWithFormat:@"status: %@, duration:%f, bytesSent: %d, isWifi: %d", v3, *(void *)&self->_duration, self->_bytesSent, self->_isWifi];
  return v4;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_unint64_t status = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (BOOL)isWifi
{
  return self->_isWifi;
}

- (void)setIsWifi:(BOOL)a3
{
  self->_isWifi = a3;
}

- (int64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(int64_t)a3
{
  self->_attributes = a3;
}

@end