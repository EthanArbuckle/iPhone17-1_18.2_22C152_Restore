@interface FMDInternalAccessoryConnectionMonitor
+ (id)sharedMonitor;
- (void)accessoryDidDisconnect:(id)a3;
- (void)accessoryDidUpdate:(id)a3;
@end

@implementation FMDInternalAccessoryConnectionMonitor

+ (id)sharedMonitor
{
  if (qword_10031EBE8 != -1) {
    dispatch_once(&qword_10031EBE8, &stru_1002DCE48);
  }
  v2 = (void *)qword_10031EBE0;

  return v2;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v3 = a3;
  id v8 = objc_alloc_init((Class)FMAlert);
  [v8 setMsgTitle:@"Accessory connected"];
  v4 = [v3 name];

  v5 = +[NSDate date];
  v6 = +[NSString stringWithFormat:@"'%@' connected at %@", v4, v5];
  [v8 setMsgText:v6];

  [v8 setDefaultButtonTitle:@"OK"];
  [v8 setShowMsgInLockScreen:1];
  [v8 setDismissMsgOnUnlock:1];
  v7 = +[FMAlertManager sharedInstance];
  [v7 activateAlert:v8];
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v3 = a3;
  id v8 = objc_alloc_init((Class)FMAlert);
  [v8 setMsgTitle:@"Accessory disconnected"];
  v4 = [v3 name];

  v5 = +[NSDate date];
  v6 = +[NSString stringWithFormat:@"'%@' disconnected at %@", v4, v5];
  [v8 setMsgText:v6];

  [v8 setDefaultButtonTitle:@"OK"];
  [v8 setShowMsgInLockScreen:1];
  [v8 setDismissMsgOnUnlock:1];
  v7 = +[FMAlertManager sharedInstance];
  [v7 activateAlert:v8];
}

@end