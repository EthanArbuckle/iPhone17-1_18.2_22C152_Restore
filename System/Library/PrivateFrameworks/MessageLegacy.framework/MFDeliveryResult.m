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
  v7.receiver = self;
  v7.super_class = (Class)MFDeliveryResult;
  v4 = [(MFDeliveryResult *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_status = a3;
    v4->_isWifi = [+[MFNetworkController sharedInstance] isFatPipe];
  }
  return v5;
}

- (id)description
{
  unint64_t status = self->_status;
  if (status > 8) {
    v3 = @"MessageDeliveryFatalError";
  }
  else {
    v3 = off_1E68672B0[status];
  }
  return (id)[NSString stringWithFormat:@"status: %@, duration:%f, bytesSent: %d, isWifi: %d", v3, *(void *)&self->_duration, self->_bytesSent, self->_isWifi];
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