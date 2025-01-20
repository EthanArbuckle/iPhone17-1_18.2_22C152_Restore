@interface _RMSSessionRecord
- (TVRMSPowerAssertion)powerAssertion;
- (TVRMSRunAssertion)runAssertion;
- (id)session;
- (int)refreshCount;
- (int)timeout;
- (void)setPowerAssertion:(id)a3;
- (void)setRefreshCount:(int)a3;
- (void)setRunAssertion:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeout:(int)a3;
@end

@implementation _RMSSessionRecord

- (int)refreshCount
{
  return self->_refreshCount;
}

- (void)setRefreshCount:(int)a3
{
  self->_refreshCount = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (id)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (TVRMSPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (TVRMSRunAssertion)runAssertion
{
  return self->_runAssertion;
}

- (void)setRunAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runAssertion, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);

  objc_storeStrong(&self->_session, 0);
}

@end