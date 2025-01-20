@interface _FMDMonitorRequest
- (FMDSecureLocationContext)context;
- (NSDate)expirationTime;
- (void)setContext:(id)a3;
- (void)setExpirationTime:(id)a3;
@end

@implementation _FMDMonitorRequest

- (FMDSecureLocationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationTime, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end