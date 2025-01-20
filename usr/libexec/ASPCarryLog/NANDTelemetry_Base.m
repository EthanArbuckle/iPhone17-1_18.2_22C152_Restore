@interface NANDTelemetry_Base
+ (BOOL)shouldRegisterActivity;
+ (void)registerActivityWithIdentifier:(const char *)a3 XpcCriteria:(id)a4 ActivityQ:(id)a5 PersistentState:(BOOL)a6;
- (BOOL)isXpcActivityDeferred;
- (BOOL)tryDeferXpcActivity;
- (NANDTelemetry_Base)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5;
- (PersistentStateManager)stateMgr;
- (TelemetryPrivacyManager)privacyMgr;
- (XpcActivityManager)activityMgr;
- (void)setActivityMgr:(id)a3;
- (void)setPrivacyMgr:(id)a3;
- (void)setStateMgr:(id)a3;
@end

@implementation NANDTelemetry_Base

- (NANDTelemetry_Base)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NANDTelemetry_Base;
  v12 = [(NANDTelemetry_Base *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityMgr, a3);
    objc_storeStrong((id *)&v13->_stateMgr, a4);
    objc_storeStrong((id *)&v13->_privacyMgr, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)tryDeferXpcActivity
{
  v2 = [(NANDTelemetry_Base *)self activityMgr];
  unsigned __int8 v3 = [v2 tryDeferXpcActivity];

  return v3;
}

- (BOOL)isXpcActivityDeferred
{
  v2 = [(NANDTelemetry_Base *)self activityMgr];
  unsigned __int8 v3 = [v2 isXpcActivityDeferred];

  return v3;
}

+ (BOOL)shouldRegisterActivity
{
  return 1;
}

+ (void)registerActivityWithIdentifier:(const char *)a3 XpcCriteria:(id)a4 ActivityQ:(id)a5 PersistentState:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([a1 shouldRegisterActivity])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000305C;
    v12[3] = &unk_100090860;
    v12[4] = a1;
    BOOL v13 = a6;
    SafeXpcActivityRegister(a3, v10, v11, v12);
  }
}

- (XpcActivityManager)activityMgr
{
  return self->_activityMgr;
}

- (void)setActivityMgr:(id)a3
{
}

- (TelemetryPrivacyManager)privacyMgr
{
  return self->_privacyMgr;
}

- (void)setPrivacyMgr:(id)a3
{
}

- (PersistentStateManager)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMgr, 0);
  objc_storeStrong((id *)&self->_privacyMgr, 0);

  objc_storeStrong((id *)&self->_activityMgr, 0);
}

@end