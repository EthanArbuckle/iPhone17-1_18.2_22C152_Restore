@interface ANCMissedCallAlert
- (ANCMissedCallAlert)initWithRecentCall:(id)a3 manager:(id)a4 queue:(id)a5;
- (BOOL)hasNegativeAction;
- (BOOL)hasPositiveAction;
- (BOOL)performNegativeAction;
- (BOOL)performPositiveAction;
- (CHManager)manager;
- (CHRecentCall)recentCall;
- (OS_dispatch_queue)queue;
- (id)appIdentifier;
- (id)date;
- (id)message;
- (id)negativeActionLabel;
- (id)positiveActionLabel;
- (id)subtitle;
- (id)title;
- (void)setManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentCall:(id)a3;
@end

@implementation ANCMissedCallAlert

- (ANCMissedCallAlert)initWithRecentCall:(id)a3 manager:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ANCMissedCallAlert;
  v12 = [(ANCAlert *)&v15 initWithCategoryID:2];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recentCall, a3);
    objc_storeStrong((id *)&v13->_manager, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

- (id)appIdentifier
{
  id v3 = objc_alloc_init((Class)TUCallProviderManager);
  v4 = [(ANCMissedCallAlert *)self recentCall];
  v5 = [v3 providerForRecentCall:v4];

  v6 = [(ANCAlert *)self _appIdentifierForTUCallProvider:v5];

  return v6;
}

- (id)title
{
  v2 = [(ANCMissedCallAlert *)self recentCall];
  id v3 = [v2 callerNameForDisplay];

  return v3;
}

- (id)subtitle
{
  v2 = [(ANCMissedCallAlert *)self recentCall];
  id v3 = [v2 callerIdLabel];

  return v3;
}

- (id)message
{
  v2 = +[NSBundle mobileBluetoothBundle];
  id v3 = [v2 localizedStringForKey:@"MISSED_CALL" value:@"Missed Call" table:0];

  return v3;
}

- (id)date
{
  v2 = [(ANCMissedCallAlert *)self recentCall];
  id v3 = [v2 date];

  return v3;
}

- (BOOL)hasPositiveAction
{
  v2 = [(ANCMissedCallAlert *)self recentCall];
  id v3 = [v2 callerId];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasNegativeAction
{
  return 1;
}

- (id)positiveActionLabel
{
  v2 = +[NSBundle mobileBluetoothBundle];
  id v3 = [v2 localizedStringForKey:@"DIAL" value:@"Dial" table:0];

  return v3;
}

- (id)negativeActionLabel
{
  v2 = +[NSBundle mobileBluetoothBundle];
  id v3 = [v2 localizedStringForKey:@"CLEAR" value:@"Clear" table:0];

  return v3;
}

- (BOOL)performPositiveAction
{
  id v3 = [(ANCMissedCallAlert *)self recentCall];
  BOOL v4 = [v3 callerId];

  if (!v4) {
    return 0;
  }
  id v5 = objc_alloc_init((Class)TUCallProviderManager);
  v6 = [(ANCMissedCallAlert *)self recentCall];
  v7 = [v5 providerForRecentCall:v6];

  if (v7)
  {
    id v8 = [objc_alloc((Class)TUDialRequest) initWithProvider:v7];
    id v9 = [(ANCMissedCallAlert *)self recentCall];
    id v10 = [v9 callerId];
    id v11 = +[TUHandle handleWithDestinationID:v10];
    [v8 setHandle:v11];

    v12 = [(ANCMissedCallAlert *)self queue];
    v13 = +[TUCallCenter callCenterWithQueue:v12];
    v14 = [v13 dialWithRequest:v8];
    BOOL v15 = v14 != 0;
  }
  else
  {
    v16 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_FAULT)) {
      sub_100075C20(v16, self);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)performNegativeAction
{
  id v3 = [(ANCMissedCallAlert *)self recentCall];
  BOOL v4 = [v3 uniqueId];
  id v5 = +[NSPredicate predicateWithFormat:@"uniqueId == %@", v4];

  v6 = [(ANCMissedCallAlert *)self manager];
  [v6 markAllCallsAsReadWithPredicate:v5];

  return 1;
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
}

- (CHManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end