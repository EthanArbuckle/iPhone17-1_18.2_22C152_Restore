@interface PDSRequestInfo
- (NSDate)heartbeatDate;
- (PDSRequestInfo)init;
- (PDSRequestInfo)initWithRegistrationReason:(unint64_t)a3 nextHeartbeatDate:(id)a4;
- (unint64_t)regReason;
- (void)setHeartbeatDate:(id)a3;
- (void)setRegReason:(unint64_t)a3;
@end

@implementation PDSRequestInfo

- (PDSRequestInfo)init
{
  return [(PDSRequestInfo *)self initWithRegistrationReason:0 nextHeartbeatDate:0];
}

- (PDSRequestInfo)initWithRegistrationReason:(unint64_t)a3 nextHeartbeatDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDSRequestInfo;
  v8 = [(PDSRequestInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_regReason = a3;
    objc_storeStrong((id *)&v8->_heartbeatDate, a4);
  }

  return v9;
}

- (unint64_t)regReason
{
  return self->_regReason;
}

- (void)setRegReason:(unint64_t)a3
{
  self->_regReason = a3;
}

- (NSDate)heartbeatDate
{
  return self->_heartbeatDate;
}

- (void)setHeartbeatDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end