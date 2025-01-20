@interface MBXPCBackupActivity
- (OS_dispatch_source)deferralTimer;
- (OS_xpc_object)runnableXPCActivity;
- (id)description;
- (void)setDeferralTimer:(id)a3;
- (void)setRunnableXPCActivity:(id)a3;
@end

@implementation MBXPCBackupActivity

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: runnableXPCActivity=%@, deferralTimer=%@>", objc_opt_class(), self->_runnableXPCActivity, self->_deferralTimer];
}

- (OS_xpc_object)runnableXPCActivity
{
  return self->_runnableXPCActivity;
}

- (void)setRunnableXPCActivity:(id)a3
{
}

- (OS_dispatch_source)deferralTimer
{
  return self->_deferralTimer;
}

- (void)setDeferralTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferralTimer, 0);
  objc_storeStrong((id *)&self->_runnableXPCActivity, 0);
}

@end