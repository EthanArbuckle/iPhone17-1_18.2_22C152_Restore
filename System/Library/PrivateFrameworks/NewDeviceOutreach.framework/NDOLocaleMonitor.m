@interface NDOLocaleMonitor
- (NDOAgentProtocol)agent;
- (NDOLocaleMonitor)init;
- (NDOLocaleMonitor)initWithAgent:(id)a3;
- (void)dealloc;
- (void)localeDidChange;
- (void)setAgent:(id)a3;
- (void)start;
@end

@implementation NDOLocaleMonitor

- (NDOLocaleMonitor)init
{
  v3 = [[NDOAgent alloc] initWithCallingProcessBundleID:@"com.apple.ndoagent.locale"];
  v4 = [(NDOLocaleMonitor *)self initWithAgent:v3];

  return v4;
}

- (NDOLocaleMonitor)initWithAgent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOLocaleMonitor;
  v5 = [(NDOLocaleMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NDOLocaleMonitor *)v5 setAgent:v4];
  }

  return v6;
}

- (void)start
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005100;
  v4[3] = &unk_10001C770;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.language.changed", &self->_languageNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)localeDidChange
{
  id v3 = objc_opt_new();
  if ([v3 pendingFollowUpCount])
  {
    id v4 = _NDOLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Locale changed and one or more followups are being displayed. Refresh warranty if needed.", v6, 2u);
    }

    id v5 = [(NDOLocaleMonitor *)self agent];
    [v5 getAllFUPEligibleDeviceInfosUsingPolicy:2 updateFollowUps:1 withReply:&stru_10001C790];
  }
  else
  {
    xpc_transaction_exit_clean();
  }
}

- (void)dealloc
{
  notify_cancel(self->_languageNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)NDOLocaleMonitor;
  [(NDOLocaleMonitor *)&v3 dealloc];
}

- (NDOAgentProtocol)agent
{
  return (NDOAgentProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end