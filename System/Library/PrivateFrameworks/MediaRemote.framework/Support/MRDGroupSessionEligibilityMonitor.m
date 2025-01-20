@interface MRDGroupSessionEligibilityMonitor
+ (id)sharedMonitor;
- (BOOL)isCarPlay;
- (BOOL)needsAcknowledgement;
- (CARSessionStatus)carStatus;
- (CUSystemMonitor)systemMonitor;
- (IDSAccountController)accountController;
- (MRDGroupSessionEligibilityMonitor)init;
- (MRGroupSessionEligibilityStatus)eligibilityStatus;
- (NSHashTable)observers;
- (NSString)description;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (unint64_t)bestHostingStateForUserStates:(id)a3 reason:(id *)a4;
- (unint64_t)hostingStateForEligibilityStatus:(id)a3 reason:(id *)a4;
- (unint64_t)hostingStateForUserState:(id)a3 reason:(id *)a4;
- (unint64_t)joiningStateForEligibilityStatus:(id)a3 reason:(id *)a4;
- (unsigned)pickedRouteType;
- (void)_onQueue_notifyObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleCloudStateChangeNotification:(id)a3;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)handleEndpointNotification:(id)a3;
- (void)initializeObserversAndState;
- (void)reevaluateState;
- (void)removeObserver:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setCarStatus:(id)a3;
- (void)setEligibilityStatus:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation MRDGroupSessionEligibilityMonitor

+ (id)sharedMonitor
{
  if (qword_10047E518 != -1) {
    dispatch_once(&qword_10047E518, &stru_10041FB20);
  }
  v2 = (void *)qword_10047E520;

  return v2;
}

- (MRDGroupSessionEligibilityMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)MRDGroupSessionEligibilityMonitor;
  v2 = [(MRDGroupSessionEligibilityMonitor *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MRDGroupSessionEligibilityMonitor.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MRDGroupSessionEligibilityMonitor.notification", v8);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v11;

    v13 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100172288;
    block[3] = &unk_100415CC8;
    v16 = v2;
    dispatch_async(v13, block);
  }
  return v2;
}

- (void)initializeObserversAndState
{
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = MRAVEndpointDidAddOutputDeviceNotification;
  dispatch_queue_t v5 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v3 addObserver:self selector:"handleEndpointNotification:" name:v4 object:v5];

  v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = MRAVEndpointDidChangeOutputDeviceNotification;
  v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v6 addObserver:self selector:"handleEndpointNotification:" name:v7 object:v8];

  dispatch_queue_t v9 = +[NSNotificationCenter defaultCenter];
  uint64_t v10 = MRAVEndpointDidRemoveOutputDeviceNotification;
  uint64_t v11 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v9 addObserver:self selector:"handleEndpointNotification:" name:v10 object:v11];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"handleCloudStateChangeNotification:" name:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0];

  id v13 = objc_alloc((Class)IDSAccountController);
  v14 = +[IDSService mr_sharedGroupSessionServiceName];
  v15 = (IDSAccountController *)[v13 initWithService:v14];
  accountController = self->_accountController;
  self->_accountController = v15;

  [(IDSAccountController *)self->_accountController addDelegate:self queue:self->_queue];
  objc_super v17 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
  carStatus = self->_carStatus;
  self->_carStatus = v17;

  [(CARSessionStatus *)self->_carStatus addSessionObserver:self];
  v19 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v19;

  [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_queue];
  v21 = self->_systemMonitor;
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100172654;
  v30[3] = &unk_100419F00;
  v22 = v21;
  v31 = v22;
  objc_copyWeak(&v32, &location);
  [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v30];
  v23 = self->_systemMonitor;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100172718;
  v27[3] = &unk_100419F00;
  v24 = v22;
  v28 = v24;
  objc_copyWeak(&v29, &location);
  [(CUSystemMonitor *)v23 activateWithCompletion:v27];
  v25 = _MRLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionEligibilityMonitor] Initialized", (uint8_t *)&v26, 2u);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionEligibilityMonitor] Dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDGroupSessionEligibilityMonitor;
  [(MRDGroupSessionEligibilityMonitor *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  dispatch_queue_t v5 = [(MRDGroupSessionEligibilityMonitor *)self eligibilityStatus];
  id v6 = [v3 initWithFormat:@"<%@: eligibility: %@>", v4, v5];

  return (NSString *)v6;
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_1001729E4;
  uint64_t v10 = sub_1001729F4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001729FC;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRGroupSessionEligibilityStatus *)v3;
}

- (void)reevaluateState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (MRGroupSessionEligibilityStatus *)objc_alloc_init((Class)MRGroupSessionEligibilityStatus);
  [(MRGroupSessionEligibilityStatus *)v3 setIsManateeEnabled:[(CUSystemMonitor *)self->_systemMonitor manateeAvailable]];
  uint64_t v4 = +[IDSAccount mr_activeGroupSessionAccount];
  [(MRGroupSessionEligibilityStatus *)v3 setIdsAccountIsValid:v4 != 0];

  [(MRGroupSessionEligibilityStatus *)v3 setRouteType:[(MRDGroupSessionEligibilityMonitor *)self pickedRouteType]];
  [(MRGroupSessionEligibilityStatus *)v3 setRouteIsValidForHosting:[(MRGroupSessionEligibilityStatus *)v3 routeType] != 0];
  [(MRGroupSessionEligibilityStatus *)v3 setMediaAccountHostingState:0];
  [(MRGroupSessionEligibilityStatus *)v3 setMediaAccountJoiningState:0];
  if ([(MRGroupSessionEligibilityStatus *)v3 idsAccountIsValid]
    && [(MRGroupSessionEligibilityStatus *)v3 routeIsValidForHosting])
  {
    unsigned int v5 = [(MRGroupSessionEligibilityStatus *)v3 isManateeEnabled];
  }
  else
  {
    unsigned int v5 = 0;
  }
  uint64_t v6 = +[MRDMusicUserStateCenter sharedCenter];
  unsigned __int8 v7 = [v6 cachedStateLoaded];

  if ((v7 & 1) != 0 || v5)
  {
    uint64_t v10 = +[MRDMusicUserStateCenter sharedCenter];
    id v11 = [v10 localActiveUserState];
    v12 = [v11 frameworkState];
    [(MRGroupSessionEligibilityStatus *)v3 setCurrentMediaUserState:v12];

    id v13 = +[MRDMusicUserStateCenter sharedCenter];
    v14 = [v13 localUserStates];
    v15 = objc_msgSend(v14, "msv_map:", &stru_10041FB60);
    [(MRGroupSessionEligibilityStatus *)v3 setMediaUserStates:v15];

    id v33 = 0;
    unint64_t v16 = [(MRDGroupSessionEligibilityMonitor *)self hostingStateForEligibilityStatus:v3 reason:&v33];
    dispatch_queue_t v9 = (MRGroupSessionEligibilityStatus *)v33;
    [(MRGroupSessionEligibilityStatus *)v3 setMediaAccountHostingState:v16];
    id v32 = 0;
    unint64_t v17 = [(MRDGroupSessionEligibilityMonitor *)self joiningStateForEligibilityStatus:v3 reason:&v32];
    uint64_t v8 = (MRGroupSessionEligibilityStatus *)v32;
    [(MRGroupSessionEligibilityStatus *)v3 setMediaAccountJoiningState:v17];
  }
  else
  {
    uint64_t v8 = 0;
    dispatch_queue_t v9 = 0;
  }
  BOOL v18 = [(MRGroupSessionEligibilityStatus *)v3 isManateeEnabled]
     && [(MRGroupSessionEligibilityStatus *)v3 idsAccountIsValid]
     && [(MRGroupSessionEligibilityStatus *)v3 mediaAccountJoiningState] == (id)5;
  [(MRGroupSessionEligibilityStatus *)v3 setIsEligibleForJoiningGroupSession:v18];
  BOOL v19 = [(MRGroupSessionEligibilityStatus *)v3 routeIsValidForHosting]
     && [(MRGroupSessionEligibilityStatus *)v3 idsAccountIsValid]
     && [(MRGroupSessionEligibilityStatus *)v3 isManateeEnabled]
     && (unint64_t)[(MRGroupSessionEligibilityStatus *)v3 mediaAccountHostingState] > 4;
  [(MRGroupSessionEligibilityStatus *)v3 setIsEligibleForHostingGroupSessionExcludingAcknowledgements:v19];
  if ([(MRGroupSessionEligibilityStatus *)v3 isEligibleForHostingGroupSessionExcludingAcknowledgements])BOOL v20 = [(MRGroupSessionEligibilityStatus *)v3 mediaAccountHostingState] == (id)6; {
  else
  }
    BOOL v20 = 0;
  [(MRGroupSessionEligibilityStatus *)v3 setIsEligibleForHostingGroupSession:v20];
  v21 = self->_eligibilityStatus;
  if (v3 == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = v3;
    unsigned __int8 v24 = [(MRGroupSessionEligibilityStatus *)v23 isEqual:v22];

    if ((v24 & 1) == 0)
    {
      v25 = _MRLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionEligibilityMonitor] Eligibility status changed: %{public}@", buf, 0xCu);
      }

      if (v9)
      {
        __int16 v26 = _MRLogForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v9;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionEligibilityMonitor] \tHosting state reason: %{public}@", buf, 0xCu);
        }
      }
      if (v8)
      {
        v27 = _MRLogForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v8;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionEligibilityMonitor] \tJoining state reason: %{public}@", buf, 0xCu);
        }
      }
      v28 = _MRLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [(MRGroupSessionEligibilityStatus *)v23 differenceFrom:self->_eligibilityStatus];
        *(_DWORD *)buf = 138412290;
        v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[MRDGroupSessionEligibilityMonitor] Eligibility changes: %@", buf, 0xCu);
      }
      v30 = (MRGroupSessionEligibilityStatus *)[(MRGroupSessionEligibilityStatus *)v23 copy];
      eligibilityStatus = self->_eligibilityStatus;
      self->_eligibilityStatus = v30;

      [(MRDGroupSessionEligibilityMonitor *)self _onQueue_notifyObservers:v23];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172FB4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100173130;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_onQueue_notifyObservers:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSHashTable *)self->_observers allObjects];
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173208;
  block[3] = &unk_1004159B8;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (unint64_t)joiningStateForEligibilityStatus:(id)a3 reason:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 currentMediaUserState];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 userIdentity];
    dispatch_queue_t v9 = v8;
    if (v8)
    {
      if ([v8 type] == (id)1)
      {
        if ([v7 identitySupportsCollaboration])
        {
          id v10 = [v5 currentMediaUserState];
          id v11 = [v10 identifier];
          id v12 = [v9 identifier];
          id v13 = +[NSNumber numberWithBool:1];
          +[NSString stringWithFormat:@"<id=%@ - %@ - collab=%@>", v11, v12, v13];
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          unint64_t v14 = 5;
        }
        else
        {
          *a4 = @"Identity does not support collaboration";
          unint64_t v14 = 4;
        }
        goto LABEL_10;
      }
      v15 = @"Non-resolvable identity";
    }
    else
    {
      v15 = @"No media user identity";
    }
    *a4 = v15;
    unint64_t v14 = 3;
LABEL_10:

    goto LABEL_11;
  }
  *a4 = @"No current media user";
  unint64_t v14 = 2;
LABEL_11:

  return v14;
}

- (unint64_t)hostingStateForEligibilityStatus:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  if (MSVDeviceIsAudioAccessory())
  {
    id v7 = [v6 mediaUserStates];

    unint64_t v8 = [(MRDGroupSessionEligibilityMonitor *)self bestHostingStateForUserStates:v7 reason:a4];
  }
  else
  {
    id v7 = [v6 currentMediaUserState];

    unint64_t v8 = [(MRDGroupSessionEligibilityMonitor *)self hostingStateForUserState:v7 reason:a4];
  }
  unint64_t v9 = v8;

  return v9;
}

- (unint64_t)bestHostingStateForUserStates:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001736CC;
    v21[3] = &unk_10041FB88;
    v21[4] = self;
    id v7 = [objc_alloc((Class)NSMutableString) initWithString:@"{"];
    id v22 = v7;
    unint64_t v8 = objc_msgSend(v6, "mr_map:", v21);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue];
          if (v11 <= (unint64_t)v14) {
            unint64_t v11 = (unint64_t)v14;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v10);
    }
    else
    {
      unint64_t v11 = 0;
    }
    id v15 = v7;
    *a4 = v15;
  }
  else
  {
    *a4 = @"No media user states";
    unint64_t v11 = 1;
  }

  return v11;
}

- (unint64_t)hostingStateForUserState:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 userIdentity];
    if ([v7 isFullSubscriber])
    {
      id v9 = [v7 isMinor];
      id v10 = [v7 groupSessionsSupportedForAccountRegion];
      id v11 = v10;
      if ((v9 & 1) != 0 || !v10)
      {
        v23 = +[NSNumber numberWithBool:v9];
        unsigned __int8 v24 = +[NSNumber numberWithBool:v11];
        +[NSString stringWithFormat:@"Restricted: ageRestricted=%@, regionRestricted=%@", v23, v24];
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        unint64_t v22 = 4;
      }
      else
      {
        if (v8)
        {
          uint64_t v12 = +[NSNumber numberWithInt:1];
          id v13 = +[NSNumber numberWithBool:0];
          id v14 = +[NSNumber numberWithBool:1];
          id v15 = +[NSNumber numberWithBool:1];
          unint64_t v16 = +[NSMutableString stringWithFormat:@"hasIdentity=%@, ageRestricted=%@, sub=%@, validRegion=%@", v12, v13, v14, v15];

          if ([(MRDGroupSessionEligibilityMonitor *)self needsAcknowledgement])
          {
            id v17 = [v7 hasAcceptedPrivacyAcknowledgement];
            id v18 = [v7 hasAcceptedDisplayNameAcknowledgement];
            long long v19 = +[NSNumber numberWithBool:v17];
            long long v20 = +[NSNumber numberWithBool:v18];
            v21 = +[NSString stringWithFormat:@"privacyAck=%@, displayNameAck=%@", v19, v20];

            if (!v17 || (v18 & 1) == 0)
            {
              *a4 = +[NSString stringWithFormat:@"Missing acknowledgements: %@", v21];

              unint64_t v22 = 5;
              goto LABEL_16;
            }
            [v16 appendFormat:@", %@", v21];
          }
          *a4 = v16;
          unint64_t v22 = 6;
LABEL_16:

          goto LABEL_17;
        }
        *a4 = @"Missing identity";
        unint64_t v22 = 3;
      }
    }
    else
    {
      *a4 = @"Not a subscriber";
      unint64_t v22 = 2;
    }
LABEL_17:

    goto LABEL_18;
  }
  *a4 = @"No media user state";
  unint64_t v22 = 1;
LABEL_18:

  return v22;
}

- (unsigned)pickedRouteType
{
  id v3 = +[MRUserSettings currentSettings];
  unsigned __int8 v4 = [v3 startGroupSessionsForAllRoutes];

  if ((v4 & 1) != 0 || [(MRDGroupSessionEligibilityMonitor *)self isCarPlay]) {
    return 2;
  }
  id v6 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  id v7 = [v6 outputDevices];
  unsigned __int8 v8 = MRGroupSessionRouteTypeForOutputDevices();

  return v8;
}

- (BOOL)needsAcknowledgement
{
  return 1;
}

- (BOOL)isCarPlay
{
  v2 = [(MRDGroupSessionEligibilityMonitor *)self carStatus];
  id v3 = [v2 currentSession];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)handleCloudStateChangeNotification:(id)a3
{
  BOOL v4 = [(MRDGroupSessionEligibilityMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173BA0;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleEndpointNotification:(id)a3
{
  BOOL v4 = [(MRDGroupSessionEligibilityMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173C30;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = MRGetDeviceInfoFromUserInfo();

  id v6 = +[MRDeviceInfoRequest localDeviceInfo];
  id v7 = [v5 identifier];
  unsigned __int8 v8 = [v6 identifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100173D3C;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  BOOL v4 = [(MRDGroupSessionEligibilityMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173DDC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  BOOL v4 = [(MRDGroupSessionEligibilityMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173E6C;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)setEligibilityStatus:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CARSessionStatus)carStatus
{
  return self->_carStatus;
}

- (void)setCarStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carStatus, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_eligibilityStatus, 0);
}

@end