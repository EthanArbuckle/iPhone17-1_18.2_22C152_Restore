@interface SDActivityRequestRecord
- (NSDate)requestCreatedDate;
- (NSError)error;
- (NSString)deviceIdentifier;
- (NSTimer)timeoutTimer;
- (NSUUID)requestIdentifier;
- (SDActivityRequestRecord)init;
- (id)completionHandler;
- (id)description;
- (int64_t)timeoutTimeInterval;
- (void)setCompletionHandler:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestCreatedDate:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTimeoutTimeInterval:(int64_t)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation SDActivityRequestRecord

- (SDActivityRequestRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDActivityRequestRecord;
  v2 = [(SDActivityRequestRecord *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requestCreatedDate = v2->_requestCreatedDate;
    v2->_requestCreatedDate = (NSDate *)v3;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = [(SDActivityRequestRecord *)self requestIdentifier];
  v4 = [v3 UUIDString];
  v5 = [(SDActivityRequestRecord *)self deviceIdentifier];
  requestCreatedDate = self->_requestCreatedDate;
  v7 = [(SDActivityRequestRecord *)self completionHandler];
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  v9 = [(SDActivityRequestRecord *)self timeoutTimer];
  v10 = [(SDActivityRequestRecord *)self error];
  v11 = +[NSString stringWithFormat:@"message/requestIdentifier:%@, deviceIdentifier:%@, requestCreated:%@, hasCompletionHandler:%@, _timeoutTimer:%@, error:%@", v4, v5, requestCreatedDate, v8, v9, v10];

  return v11;
}

- (NSDate)requestCreatedDate
{
  return self->_requestCreatedDate;
}

- (void)setRequestCreatedDate:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (int64_t)timeoutTimeInterval
{
  return self->_timeoutTimeInterval;
}

- (void)setTimeoutTimeInterval:(int64_t)a3
{
  self->_timeoutTimeInterval = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_requestCreatedDate, 0);
}

@end