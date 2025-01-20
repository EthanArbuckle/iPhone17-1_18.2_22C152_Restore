@interface FMFFenceTriggerManager
- (FMFFenceTriggerManager)initWithDelegate:(id)a3;
- (FMFFenceTriggerManagerDelegate)delegate;
- (FMFScheduler)scheduler;
- (NSArray)fences;
- (NSArray)scheduledFences;
- (NSDate)cachedFirstInvitedDate;
- (NSMutableDictionary)statusByWindowStartDateByFenceID;
- (id)firstFutureStartDateFromHiddenScheduledFences:(id)a3 order:(int64_t)a4;
- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3;
- (void)_graceTimerFired;
- (void)_inviteTimerFired;
- (void)_updateInviteTimer;
- (void)checkForChangedFencesPastInviteDate:(id)a3;
- (void)clearStaleFenceStatusForFenceID:(id)a3;
- (void)clearStaleFenceTriggerForFence:(id)a3;
- (void)handleAlarmForAlarmName:(int64_t)a3;
- (void)inviteFencesPastInviteDate:(id)a3;
- (void)receiveTriggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8;
- (void)registerAlarms;
- (void)schedulerCurrentSchedulesDidChange:(id)a3;
- (void)setCachedFirstInvitedDate:(id)a3;
- (void)setFences:(id)a3;
- (void)triggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9;
@end

@implementation FMFFenceTriggerManager

- (FMFFenceTriggerManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMFFenceTriggerManager;
  v5 = [(FMFFenceTriggerManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (FMFScheduler *)[objc_alloc((Class)FMFScheduler) initWithDelegate:v6];
    scheduler = v6->_scheduler;
    v6->_scheduler = v7;

    [(FMFFenceTriggerManager *)v6 registerAlarms];
  }

  return v6;
}

- (void)setFences:(id)a3
{
  id v4 = (NSArray *)a3;
  [(FMFFenceTriggerManager *)self checkForChangedFencesPastInviteDate:v4];
  fences = self->_fences;
  self->_fences = v4;

  uint64_t v6 = [(FMFFenceTriggerManager *)self scheduledFences];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(FMFFenceTriggerManager *)self scheduledFences];
    id v9 = [v8 count];

    if (v9)
    {
      objc_super v10 = [(FMFFenceTriggerManager *)self scheduledFences];
      v11 = [v10 fm_map:&stru_1000A2DC0];
      v12 = [(FMFFenceTriggerManager *)self scheduler];
      [v12 setSchedules:v11];
    }
  }

  [(FMFFenceTriggerManager *)self _updateInviteTimer];
}

- (id)firstFutureStartDateFromHiddenScheduledFences:(id)a3 order:(int64_t)a4
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v4)
  {
    id v6 = 0;
    id v18 = 0;
    goto LABEL_16;
  }
  id v5 = v4;
  id v6 = 0;
  id v18 = 0;
  uint64_t v7 = *(void *)v22;
  uint64_t v8 = FMFFenceAcceptanceStatusPendingHidden;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(obj);
      }
      objc_super v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      v11 = [v10 inviteDate];
      v12 = v11;
      if (!v6 || [v11 compare:v6] == (id)a4)
      {
        v13 = [v10 acceptanceStatus];
        if ([v13 isEqualToString:v8])
        {
          v14 = +[NSDate now];
          id v15 = [v14 compare:v12];

          if (v15 != (id)-1) {
            goto LABEL_12;
          }
          id v16 = v10;

          v13 = v6;
          id v6 = v12;
          id v18 = v16;
        }
      }
LABEL_12:
    }
    id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v5);
LABEL_16:

  return v18;
}

- (void)triggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = (char *)a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  long long v21 = (void (**)(id, void))a9;
  long long v22 = sub_100005560();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v46 = "-[FMFFenceTriggerManager triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:]";
    __int16 v47 = 2112;
    id v48 = v15;
    __int16 v49 = 2112;
    id v50 = v17;
    __int16 v51 = 2112;
    id v52 = v18;
    __int16 v53 = 2112;
    v54 = v16;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if ([v16 isMuted])
  {
    long long v23 = sub_100005560();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Triggered fence %@ is muted", buf, 0xCu);
    }

    v43[0] = @"fenceTriggerIsMuted";
    v43[1] = @"fenceTriggerType";
    v44[0] = &off_1000A8FB0;
    long long v24 = [v16 trigger];
    v44[1] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    AnalyticsSendEvent();

    v21[2](v21, 0);
  }
  else
  {
    v26 = [v16 acceptanceStatus];
    unsigned int v27 = [v26 isEqualToString:FMFFenceAcceptanceStatusAccepted];

    if (v27)
    {
      [v16 triggerWithUUID:v15 status:v17 atDate:v18 triggerLocation:v19 completion:v21];
    }
    else
    {
      v28 = [v16 acceptanceStatus];
      if ([v28 isEqualToString:FMFFenceAcceptanceStatusPendingHidden])
      {
        unsigned __int8 v29 = [v17 isEqualToString:FMFFenceTriggerStatusIn];

        if ((v29 & 1) == 0)
        {
          v30 = +[NSUserDefaults standardUserDefaults];
          unsigned int v31 = [v30 BOOLForKey:@"FMFScheduledFenceInviteOnTrigger"];

          if (v31)
          {
            uint64_t v32 = FMFFenceTriggerScheduled;
          }
          else
          {
            v33 = [v16 trigger];
            uint64_t v32 = FMFFenceTriggerScheduled;
            unsigned __int8 v37 = [v33 isEqualToString:FMFFenceTriggerScheduled];

            if (v37) {
              goto LABEL_18;
            }
          }
          [v16 setAcceptanceStatus:FMFFenceAcceptanceStatusPending];
          v34 = [v16 trigger];
          unsigned __int8 v35 = [v34 isEqualToString:v32];

          if ((v35 & 1) == 0) {
            [v16 setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:v17 date:v18 location:v19];
          }
          v36 = [(FMFFenceTriggerManager *)self delegate];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100049FB4;
          v38[3] = &unk_1000A2DE8;
          v39 = v16;
          id v40 = v15;
          id v41 = v18;
          v42 = v21;
          [v36 triggerManager:self didModifyFence:v39 clientSession:v20 withCompletion:v38];
        }
      }
      else
      {
      }
    }
  }
LABEL_18:
}

- (void)receiveTriggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  id v13 = a3;
  v14 = (char *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void))a8;
  id v19 = sub_100005560();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "-[FMFFenceTriggerManager receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:]";
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if ([v14 isMuted])
  {
    id v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Triggered fence %@ is muted", buf, 0xCu);
    }

    long long v21 = [v14 trigger:@"fenceTriggerIsMuted" :@"fenceTriggerType" :&off_1000A8FB0];
    v24[1] = v21;
    long long v22 = +[NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:2];
    AnalyticsSendEvent();

    v18[2](v18, 0);
  }
  else
  {
    [v14 receiveTriggerWithUUID:v13 status:v15 atDate:v16 triggerLocation:v17 completion:v18];
  }
}

- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3
{
  return _[a3 triggerForRepeatedFenceBeforeAcceptance];
}

- (void)clearStaleFenceTriggerForFence:(id)a3
{
}

- (void)clearStaleFenceStatusForFenceID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
  [v4 removeObjectForKey:v3];

  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
  [v6 setObject:v5 forKey:@"FMFScheduledFenceStatus"];
}

- (NSArray)scheduledFences
{
  v2 = [(FMFFenceTriggerManager *)self fences];
  id v3 = [v2 fm_filter:&stru_1000A2E28];

  return (NSArray *)v3;
}

- (void)checkForChangedFencesPastInviteDate:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 removeObjectsInArray:self->_fences];
  [(FMFFenceTriggerManager *)self inviteFencesPastInviteDate:v4];
}

- (void)inviteFencesPastInviteDate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A4BC;
  v5[3] = &unk_1000A1468;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)registerAlarms
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004A864;
    handler[3] = &unk_1000A2218;
    handler[4] = self;
    xpc_set_event_stream_handler(FMFFenceTimerAlarmStream, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)handleAlarmForAlarmName:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      [(FMFFenceTriggerManager *)self _graceTimerFired];
      break;
    case 1:
      id v4 = [(FMFFenceTriggerManager *)self scheduler];
      [v4 scheduleTimerFired];

      break;
    case 0:
      [(FMFFenceTriggerManager *)self _inviteTimerFired];
      break;
  }
}

- (void)_updateInviteTimer
{
  uint64_t v3 = [(FMFFenceTriggerManager *)self scheduledFences];
  id v4 = [(FMFFenceTriggerManager *)self firstFutureStartDateFromHiddenScheduledFences:v3 order:-1];

  id v5 = [v4 inviteDate];
  id v6 = [(FMFFenceTriggerManager *)self cachedFirstInvitedDate];
  unsigned __int8 v7 = [v5 isEqualToDate:v6];

  if (v4 && v5 && (v7 & 1) == 0)
  {
    [(FMFFenceTriggerManager *)self setCachedFirstInvitedDate:v5];
    uint64_t v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "UpdateInviteTimer for date: %@ fence: %@ ", (uint8_t *)&v13, 0x16u);
    }

    xpc_set_event();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    [v5 timeIntervalSinceNow];
    double v11 = v10;
    time_t v12 = time(0);
    xpc_dictionary_set_date(v9, FMFFenceTimerAlarmDateKey, (uint64_t)((ceil(v11) + (double)v12) * 1000000000.0));
    xpc_dictionary_set_BOOL(v9, FMFFenceTimerAlarmUserVisible, 1);
    xpc_set_event();
  }
}

- (void)_inviteTimerFired
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = +[NSDate now];
    *(_DWORD *)buf = 138412290;
    v34 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "inviteTimer called for date: %@", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(FMFFenceTriggerManager *)self fences];
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = FMFFenceAcceptanceStatusPendingHidden;
    uint64_t v23 = v27;
    uint64_t v24 = FMFFenceAcceptanceStatusPending;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
        time_t v12 = +[NSDate now];
        int v13 = [v11 inviteDate];
        id v14 = [v12 compare:v13];

        if (v14 == (id)1)
        {
          __int16 v15 = [v11 acceptanceStatus];
          if (([v15 isEqualToString:v9] & 1) == 0) {
            goto LABEL_16;
          }
          id v16 = [v11 schedule];
          id v17 = +[NSDate date];
          if (([v16 isCurrentAt:v17] & 1) == 0)
          {

LABEL_16:
            goto LABEL_17;
          }
          unsigned int v18 = [v11 isOnMe];

          if (v18)
          {
            id v19 = sub_100005560();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v11 identifier];
              *(_DWORD *)buf = v22;
              v34 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "inviteTimer invite valid fence: %@", buf, 0xCu);
            }
            [v11 setAcceptanceStatus:v24];
            long long v21 = [(FMFFenceTriggerManager *)self delegate];
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v27[0] = sub_10004AF9C;
            v27[1] = &unk_1000A2E50;
            v27[2] = v11;
            [v21 triggerManager:self didModifyFence:v11 withCompletion:v26];
          }
        }
LABEL_17:
        double v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  [(FMFFenceTriggerManager *)self _updateInviteTimer];
}

- (void)_graceTimerFired
{
  uint64_t v3 = +[NSDate date];
  id v4 = [(FMFFenceTriggerManager *)self scheduledFences];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004B1F4;
  v18[3] = &unk_1000A2970;
  v18[4] = v3;
  id v5 = [v4 fm_filter:v18];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = FMFFenceTriggerStatusUndetermined;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        AnalyticsSendEvent();
        time_t v12 = +[NSUUID UUID];
        [v11 triggerWithUUID:v12 status:v9 atDate:v3 triggerLocation:0 completion:0];

        double v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)schedulerCurrentSchedulesDidChange:(id)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  time_t v3 = time(0);
  xpc_dictionary_set_date(xdict, FMFFenceTimerAlarmDateKey, (uint64_t)(((double)v3 + 90.0) * 1000000000.0));
  xpc_dictionary_set_BOOL(xdict, FMFFenceTimerAlarmUserVisible, 1);
  xpc_set_event();
}

- (FMFFenceTriggerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMFFenceTriggerManagerDelegate *)WeakRetained;
}

- (NSArray)fences
{
  return self->_fences;
}

- (NSMutableDictionary)statusByWindowStartDateByFenceID
{
  return self->_statusByWindowStartDateByFenceID;
}

- (FMFScheduler)scheduler
{
  return self->_scheduler;
}

- (NSDate)cachedFirstInvitedDate
{
  return self->_cachedFirstInvitedDate;
}

- (void)setCachedFirstInvitedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFirstInvitedDate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_statusByWindowStartDateByFenceID, 0);
  objc_storeStrong((id *)&self->_fences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end