@interface WipeAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDServiceProvider)provider;
- (NSString)description;
- (WipeAction)initWithProvider:(id)a3;
- (double)maxDelayInterval;
- (id)actionType;
- (void)_abortWipe;
- (void)_ackWipeCommand:(id)a3 withStatus:(int64_t)a4;
- (void)_sendWipeAck;
- (void)_wipeNow;
- (void)performWipe;
- (void)runWithCompletion:(id)a3;
- (void)setMaxDelayInterval:(double)a3;
- (void)setProvider:(id)a3;
@end

@implementation WipeAction

- (WipeAction)initWithProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WipeAction;
  v5 = [(WipeAction *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WipeAction *)v5 setProvider:v4];
  }

  return v6;
}

- (id)actionType
{
  return @"WipeAction";
}

- (void)runWithCompletion:(id)a3
{
  int64_t v4 = +[FMDPreferencesMgr wipeState];
  v5 = +[FMDPreferencesMgr wipeInfo];
  v6 = [v5 objectForKeyedSubscript:@"authId"];

  v7 = [(WipeAction *)self provider];
  objc_super v8 = [v7 account];

  if (v8
    && ([v8 authId],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqualToString:v6],
        v9,
        (v10 & 1) != 0))
  {
    [v8 setActivityState:2];
    if (v4 == 2)
    {
      v16 = sub_100004238();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wiping the device now...", v17, 2u);
      }

      [(WipeAction *)self _wipeNow];
    }
    else if (v4 == 1)
    {
      v11 = [v8 authToken];
      id v12 = [v11 length];

      v13 = sub_100004238();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending wipe ack...", buf, 2u);
        }

        [(WipeAction *)self _sendWipeAck];
      }
      else
      {
        if (v14)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Aborting wipe because ack was pending & no authToken available anymore", v18, 2u);
        }

        [(WipeAction *)self _abortWipe];
      }
    }
  }
  else
  {
    v15 = sub_100004238();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Deleting old wipe state since the account info has changed", v20, 2u);
    }

    +[FMDPreferencesMgr setWipeState:0];
    +[FMDPreferencesMgr setWipeInfo:0];
  }
}

- (BOOL)shouldCancelAction:(id)a3
{
  return 1;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Wipe(0x%p)", self];
}

- (void)_sendWipeAck
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending wipe ack...", v6, 2u);
  }

  int64_t v4 = +[FMDPreferencesMgr wipeInfo];
  v5 = [v4 objectForKeyedSubscript:@"commandParams"];
  [(WipeAction *)self _ackWipeCommand:v5 withStatus:200];
}

- (void)_ackWipeCommand:(id)a3 withStatus:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"ackURL"];
  objc_super v8 = [(WipeAction *)self provider];
  if (v7)
  {
    v9 = +[NSURL URLWithString:v7];
    unsigned __int8 v10 = [[FMDRequestAckWipe alloc] initWithProvider:v8 wipeCommand:v6 cmdStatusCode:a4 ackURL:v9];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A5370;
    v12[3] = &unk_1002DCAE8;
    v12[4] = self;
    [(FMDRequest *)v10 setCompletionHandler:v12];
    [v8 enqueueRequest:v10];
  }
  else
  {
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not acking the wipe command because there is no ack URL", v11, 2u);
    }
  }
}

- (void)_abortWipe
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Aborting wipe...", v6, 2u);
  }

  +[FMDPreferencesMgr setWipeInfo:0];
  +[FMDPreferencesMgr setWipeState:0];
  int64_t v4 = [(WipeAction *)self provider];
  v5 = [v4 account];
  [v5 setActivityState:0];
  [v4 reinitializeProviderWithAccount:v5];
}

- (void)_wipeNow
{
  v3 = +[FMDPowerMgr sharedInstance];
  [v3 powerAssertionEnableWithReason:@"Wiping" type:@"PreventSystemSleep" timeout:300 appliesOnLidClose:1];

  int64_t v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initiating Remote Wipe now...", buf, 2u);
  }

  v5 = +[FMDPreferencesMgr wipeInfo];
  id v6 = [v5 objectForKeyedSubscript:@"wipeMode"];
  if (+[FMDPreferencesMgr simulateWipe]
    || [v6 isEqualToString:@"fake"])
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initiating Simulated Remote Wipe now...", buf, 2u);
    }

    id v8 = objc_alloc_init((Class)FMAlert);
    [v8 setMsgText:@"Simulated Wipe: Your device would have been wiped now."];
    [v8 setMsgTitle:@"iCloud Remote Wipe"];
    [v8 setShowMsgInLockScreen:1];
    [v8 setDismissMsgOnUnlock:0];
    [v8 setDismissMsgOnLock:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A583C;
    v10[3] = &unk_1002D9378;
    v10[4] = self;
    [v8 setDefaultButtonAction:v10];
    v9 = +[FMAlertManager sharedInstance];
    [v9 activateAlert:v8];
  }
  else
  {
    [(WipeAction *)self performWipe];
  }
}

- (void)performWipe
{
  id v9 = (id)objc_opt_new();
  v3 = objc_opt_new();
  [(WipeAction *)self maxDelayInterval];
  [v3 setMaxDelayInterval:];
  int64_t v4 = +[FMSystemInfo sharedInstance];
  unsigned int v5 = [v4 isInternalBuild];

  if (v5)
  {
    uint64_t v6 = (uint64_t)+[FMPreferencesUtil integerForKey:@"wipeDelay" inDomain:kFMDPrefDomain];
    if (v6 >= 1) {
      [v3 setCustomDelay:(double)v6];
    }
  }
  v7 = +[FMSystemInfo sharedInstance];
  unsigned int v8 = [v7 isInternalBuild];

  if (v8) {
    [v3 setBrickDevice:+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", @"EnableRemoteBrickWithWipe", kFMDPrefDomain)];
  }
  [v9 eraseDeviceWithOptions:v3 completion:&stru_1002DCB08];
}

- (double)maxDelayInterval
{
  return self->_maxDelayInterval;
}

- (void)setMaxDelayInterval:(double)a3
{
  self->_maxDelayInterval = a3;
}

- (FMDServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end