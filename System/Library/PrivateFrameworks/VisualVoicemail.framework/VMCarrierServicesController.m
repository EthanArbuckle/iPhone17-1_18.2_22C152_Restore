@interface VMCarrierServicesController
- (BOOL)isAccountOnline:(id)a3;
- (BOOL)isAccountSubscribed:(id)a3;
- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3;
- (BOOL)isOnline;
- (BOOL)isRefreshRequestedForAccount:(id)a3 andReset:(BOOL)a4;
- (BOOL)isSubscribed;
- (BOOL)isSyncInProgress;
- (BOOL)wasDeviceRestart;
- (NSMutableDictionary)labelUUIDToGreetingController;
- (NSMutableDictionary)labelUUIDToService;
- (OS_dispatch_queue)queue;
- (VMCarrierBundleClient)carrierBundleClient;
- (VMCarrierServicesController)initWithStateRequestController:(id)a3 transcriptionService:(id)a4 telephonyClient:(id)a5 queue:(id)a6;
- (VMCarrierServicesController)initWithTranscriptionService:(id)a3 queue:(id)a4 telephonyClient:(id)a5;
- (VMCarrierStateRequestController)stateRequestController;
- (VMDCarrierAccountDataSource)carrierAccountDataSource;
- (VMTelephonyClient)telephonyClient;
- (VMTranscriptionService)transcriptionService;
- (VVService)defaultService;
- (id)accountsToRefreshIfNeeded;
- (id)findContextInfoWithLabelUUID:(id)a3;
- (id)findContextInfoWithSubscriptionUUID:(id)a3;
- (id)serviceForLabel:(id)a3;
- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3;
- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3;
- (void)_handleSubscriptionStatusChanged:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)carrierBundleChange:(id)a3;
- (void)connectionAvailability:(id)a3 availableConnections:(id)a4;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)dealloc;
- (void)do_M2A_merge:(id)a3;
- (void)executeHandlerForNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)executeHandlerForVoicemailInfoNotification:(id)a3 userInfo:(id)a4;
- (void)greetingForAccountUUID:(id)a3 completion:(id)a4;
- (void)handleNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)local_voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4;
- (void)markRecordsWithIdentifiersAsRead:(id)a3;
- (void)markRecordsWithUniqueIdentifiersAsRead:(id)a3;
- (void)moveRecordsWithIdentifiersToDeleted:(id)a3;
- (void)moveRecordsWithIdentifiersToInbox:(id)a3;
- (void)moveRecordsWithIdentifiersToTrash:(id)a3;
- (void)moveRecordsWithUniqueIdentifiersToDeleted:(id)a3;
- (void)moveRecordsWithUniqueIdentifiersToInbox:(id)a3;
- (void)moveRecordsWithUniqueIdentifiersToTrash:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)postSmscAddressAvailable:(id)a3 smsc:(id)a4;
- (void)queryAndInitVoicemailServices;
- (void)remapAccount:(id)a3 toAccount:(id)a4;
- (void)reportAccount:(id)a3 subscribed:(BOOL)a4;
- (void)reportTranscriptionProblemForRecord:(void *)a3;
- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forRecord:(void *)a4;
- (void)resetNetworkSettings;
- (void)retrieveDataForRecord:(void *)a3;
- (void)setCarrierAccountDataSource:(id)a3;
- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setLabelUUIDToGreetingController:(id)a3;
- (void)setLabelUUIDToService:(id)a3;
- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setTelephonyClient:(id)a3;
- (void)smsReadyStateChanged:(id)a3 info:(BOOL)a4;
- (void)start;
- (void)subscriberCountryCodeDidChange:(id)a3;
- (void)subscriptionDataOnlyDidChange;
- (void)subscriptionInfoDidChange;
- (void)synchronize;
- (void)updateCarrierBundle:(id)a3 service:(id)a4;
- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4;
@end

@implementation VMCarrierServicesController

- (VMCarrierServicesController)initWithTranscriptionService:(id)a3 queue:(id)a4 telephonyClient:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[VMCarrierStateRequestController alloc] initWithTelephonyClient:v8];
  v12 = [(VMCarrierServicesController *)self initWithStateRequestController:v11 transcriptionService:v10 telephonyClient:v8 queue:v9];

  return v12;
}

- (VMCarrierServicesController)initWithStateRequestController:(id)a3 transcriptionService:(id)a4 telephonyClient:(id)a5 queue:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = a6;
  v16 = sub_100048E70();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "";
    __int16 v36 = 2080;
    v37 = "";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%screating VMCarrierServicesController", buf, 0x16u);
  }

  if (v12)
  {
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, self, @"VMCarrierServicesController.m", 106, @"Invalid parameter not satisfying: %@", @"stateRequestController != nil" object file lineNumber description];

    if (v13)
    {
LABEL_5:
      if (v14) {
        goto LABEL_6;
      }
LABEL_12:
      v29 = +[NSAssertionHandler currentHandler];
      [v29 handleFailureInMethod:a2, self, @"VMCarrierServicesController.m", 108, @"Invalid parameter not satisfying: %@", @"telephonyClient != nil" object file lineNumber description];

      if (v15) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  v28 = +[NSAssertionHandler currentHandler];
  [v28 handleFailureInMethod:a2, self, @"VMCarrierServicesController.m", 107, @"Invalid parameter not satisfying: %@", @"transcriptionService != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_12;
  }
LABEL_6:
  if (v15) {
    goto LABEL_7;
  }
LABEL_13:
  v30 = +[NSAssertionHandler currentHandler];
  [v30 handleFailureInMethod:a2, self, @"VMCarrierServicesController.m", 109, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

LABEL_7:
  v33.receiver = self;
  v33.super_class = (Class)VMCarrierServicesController;
  v17 = [(VMCarrierServicesController *)&v33 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a6);
    dispatch_queue_set_specific(v15, off_1000E0538, v18, 0);
    v19 = objc_opt_new();
    [(VMCarrierServicesController *)v18 setLabelUUIDToGreetingController:v19];

    v20 = objc_opt_new();
    [(VMCarrierServicesController *)v18 setLabelUUIDToService:v20];

    [(VMCarrierServicesController *)v18 setTelephonyClient:v14];
    v21 = [(VMCarrierServicesController *)v18 telephonyClient];
    [v21 addDelegate:v18 queue:v15];

    v22 = [[VMCarrierBundleClient alloc] initWithTelephonyClient:v14 queue:v18->_queue];
    carrierBundleClient = v18->_carrierBundleClient;
    v18->_carrierBundleClient = v22;

    objc_storeStrong((id *)&v18->_stateRequestController, a3);
    objc_storeStrong((id *)&v18->_transcriptionService, a4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048EC4;
    block[3] = &unk_1000C12C0;
    v24 = v18;
    v32 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v24 selector:"_handleSubscriptionStatusChanged:" name:@"VVServiceSubscriptionStatusChangedNotification" object:0];
  }
  return v18;
}

- (void)dealloc
{
  v3 = sub_100048E70();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "";
    __int16 v8 = 2080;
    id v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sdestroying VMCarrierServicesController", buf, 0x16u);
  }

  v4 = [(VMCarrierServicesController *)self telephonyClient];
  [v4 removeDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)VMCarrierServicesController;
  [(VMCarrierServicesController *)&v5 dealloc];
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004914C;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)findContextInfoWithSubscriptionUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(VMCarrierServicesController *)self telephonyClient];
  v6 = [v5 contexts];
  v7 = [v6 subscriptions];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "uuid", (void)v16);
        unsigned __int8 v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)findContextInfoWithLabelUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(VMCarrierServicesController *)self telephonyClient];
  v6 = [v5 contexts];
  v7 = [v6 subscriptions];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "labelID", (void)v17);
        unsigned __int8 v14 = [v4 UUIDString];
        unsigned __int8 v15 = [v13 isEqual:v14];

        if (v15)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)executeHandlerForVoicemailInfoNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100048E70();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    id v13 = "";
    __int16 v14 = 2080;
    unsigned __int8 v15 = "";
    __int16 v16 = 2112;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2112;
    id v19 = v6;
    id v9 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is executing voicemail info handler for subscription %@", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v10 = +[CTVoicemailInfoType voicemailInfoTypeForDictionaryRepresentation:v7];

  [(VMCarrierServicesController *)self local_voicemailInfoAvailableNotification:v6 voicemailInfo:v10];
  v11 = [(VMCarrierServicesController *)self carrierAccountDataSource];
  objc_msgSend(v11, "local_voicemailInfoAvailableNotification:voicemailInfo:", v6, v10);
}

- (void)executeHandlerForNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000496CC;
  block[3] = &unk_1000C11E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100048E70();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    long long v20 = "";
    __int16 v21 = 2080;
    v22 = "";
    __int16 v23 = 2112;
    id v24 = (id)objc_opt_class();
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    id v10 = v24;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling notification with name: %@ userInfo: %@", (uint8_t *)&v19, 0x34u);
  }
  if ([v6 isEqualToString:kVVReloadServiceNotification])
  {
    sub_10007067C(0, 0);
    v11 = [(VMCarrierServicesController *)self defaultService];
    id v12 = [v11 verifier];
    [v12 _checkpointDictionaryChanged];

    id v13 = [(VMCarrierServicesController *)self labelUUIDToService];
    [v13 removeAllObjects];

    __int16 v14 = [(VMCarrierServicesController *)self labelUUIDToGreetingController];
    [v14 removeAllObjects];
LABEL_7:

    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"com.apple.telephonyutilities.callservicesdaemon.voicemailcallended"])
  {
    __int16 v14 = [(VMCarrierServicesController *)self defaultService];
    [v14 synchronize:0 reason:@"CallEnded"];
    goto LABEL_7;
  }
  if (([v6 isEqualToString:@"VVMessageWaitingFallbackNotification"] & 1) == 0
    && ([v6 isEqualToString:@"com.apple.voicemail.changed"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"com.apple.commcenter.InternationalRoamingEDGE.changed"])
    {
      unsigned __int8 v15 = [(VMCarrierServicesController *)self defaultService];
      unsigned __int8 v16 = [v15 ignoresRoamingSwitch];

      if (v16) {
        goto LABEL_8;
      }
      __int16 v14 = [(VMCarrierServicesController *)self defaultService];
      [v14 _dataRoamingStatusChanged];
    }
    else
    {
      if (![v6 isEqualToString:@"kVMVoicemailTranscriptionTaskTranscribeAllVoicemails"])goto LABEL_8; {
      id v17 = sub_100048E70();
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315394;
        long long v20 = "";
        __int16 v21 = 2080;
        v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sGot notification to force us to retranscribe all voicemails", (uint8_t *)&v19, 0x16u);
      }

      +[VMVoicemailTranscriptionTask resetRetranscriptionTaskState];
      __int16 v14 = [(VMCarrierServicesController *)self transcriptionService];
      __int16 v18 = [v14 transcriptionTask];
      [v18 retranscribeAllVoicemails];
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_handleSubscriptionStatusChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "";
    __int16 v12 = 2080;
    id v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s_handleSubscriptionStatusChanged", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [v4 userInfo];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"yesno"];
    id v8 = [v6 objectForKey:@"contextInfo"];
    -[VMCarrierServicesController reportAccount:subscribed:](self, "reportAccount:subscribed:", v8, [v7 BOOLValue]);

    if ([v7 isEqual:&__kCFBooleanTrue])
    {
      id v9 = [v6 objectForKey:@"serviceLabelID"];
      [(VMCarrierServicesController *)self do_M2A_merge:v9];
    }
  }
}

- (BOOL)wasDeviceRestart
{
  v14[0] = 0;
  v14[1] = 0;
  size_t v13 = 16;
  if (sysctlbyname("kern.boottime", v14, &v13, 0, 0))
  {
    v2 = sub_100048E70();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      id v4 = __error();
      objc_super v5 = strerror(*v4);
      *(_DWORD *)buf = 136315906;
      unsigned __int8 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "";
      __int16 v19 = 1024;
      int v20 = v3;
      __int16 v21 = 2080;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I %s%ssysctlbyname(\"kern.boottime\", &bootTime, &bootTimeSize, NULL, 0) - failed with err:%d (%s)", buf, 0x26u);
    }
    BOOL v6 = 0;
  }
  else
  {
    id v7 = +[VMPreferences sharedInstance];
    v2 = [v7 numberForKey:@"LastBootTime" defaultValue:0];

    if (v2 && (id v8 = [v2 longValue], v8 == (id)v14[0]))
    {
      id v9 = sub_100048E70();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned __int8 v16 = "";
        __int16 v17 = 2080;
        __int16 v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sNOT A FIRST TIME BOOTUP", buf, 0x16u);
      }
      BOOL v6 = 0;
    }
    else
    {
      int v10 = +[VMPreferences sharedInstance];
      v11 = +[NSNumber numberWithLong:v14[0]];
      [v10 setNumber:v11 forKey:@"LastBootTime"];

      id v9 = sub_100048E70();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned __int8 v16 = "";
        __int16 v17 = 2080;
        __int16 v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sFIRST TIME BOOTUP", buf, 0x16u);
      }
      BOOL v6 = 1;
    }
  }
  return v6;
}

- (id)accountsToRefreshIfNeeded
{
  int v3 = [(VMCarrierServicesController *)self telephonyClient];
  id v4 = [v3 subscriptions];
  id v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = [(VMCarrierServicesController *)self telephonyClient];
    id v8 = [v7 subscriptions];

    id v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          size_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          __int16 v14 = [v13 labelID];

          if (v14)
          {
            unsigned __int8 v15 = [v13 labelID];
            [v6 addObject:v15];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v10);
    }

    if ([(VMCarrierServicesController *)self wasDeviceRestart])
    {
      id v16 = v6;
LABEL_33:
      v37 = +[VMPreferences sharedInstance];
      id v5 = v16;
      [v37 setPreferencesValue:v16 forKey:@"AccountsToRefreshIfNeeded"];

      v38 = +[VMPreferences sharedInstance];
      [v38 setPreferencesValue:v6 forKey:@"LastActiveAccounts"];

      goto LABEL_34;
    }
    v40 = v6;
    __int16 v17 = +[VMPreferences sharedInstance];
    __int16 v18 = [v17 preferencesValueForKey:@"AccountsToRefreshIfNeeded"];

    __int16 v19 = +[VMPreferences sharedInstance];
    int v20 = [v19 preferencesValueForKey:@"LastActiveAccounts"];

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        __int16 v18 = 0;
      }
    }
    v41 = v18;
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        int v20 = 0;
      }
    }
    __int16 v21 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v22 = [(VMCarrierServicesController *)self telephonyClient];
    __int16 v23 = [v22 subscriptions];

    id obj = v23;
    id v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (!v24)
    {
LABEL_32:

      id v16 = v21;
      BOOL v6 = v40;
      goto LABEL_33;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v44;
LABEL_21:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v44 != v26) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(void **)(*((void *)&v43 + 1) + 8 * v27);
      uint64_t v29 = [v28 labelID];
      if (!v29) {
        goto LABEL_30;
      }
      v30 = (void *)v29;
      v31 = [v28 labelID];
      if ([v20 containsObject:v31])
      {
        [v28 labelID];
        v32 = v21;
        v34 = objc_super v33 = v20;
        unsigned int v35 = [v41 containsObject:v34];

        int v20 = v33;
        __int16 v21 = v32;

        if (!v35) {
          goto LABEL_30;
        }
      }
      else
      {
      }
      __int16 v36 = [v28 labelID];
      [v21 addObject:v36];

LABEL_30:
      if (v25 == (id)++v27)
      {
        id v25 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (!v25) {
          goto LABEL_32;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_34:
  return v5;
}

- (BOOL)isRefreshRequestedForAccount:(id)a3 andReset:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 UUIDString];
  BOOL v6 = +[VMPreferences sharedInstance];
  id v7 = [v6 preferencesValueForKey:@"AccountsToRefreshIfNeeded"];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v8) = [v7 containsObject:v5];
    if (v8) {
      BOOL v9 = !v4;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      id v10 = [v7 mutableCopy];
      [v10 removeObject:v5];
      uint64_t v11 = +[VMPreferences sharedInstance];
      if ([v10 count]) {
        id v12 = v10;
      }
      else {
        id v12 = 0;
      }
      [v11 setPreferencesValue:v12 forKey:@"AccountsToRefreshIfNeeded"];

      id v8 = sub_100048E70();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        unsigned __int8 v15 = "";
        __int16 v16 = 2080;
        __int16 v17 = "";
        __int16 v18 = 2112;
        __int16 v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sMarked account as refreshed: %@", (uint8_t *)&v14, 0x20u);
      }

      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (void)queryAndInitVoicemailServices
{
  int v3 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(VMCarrierServicesController *)self accountsToRefreshIfNeeded];
  id v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v147 = "";
    __int16 v148 = 2080;
    v149 = "";
    __int16 v150 = 2112;
    uint64_t v151 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sAccounts to refresh if needed: %@", buf, 0x20u);
  }
  v114 = (void *)v4;

  v123 = objc_opt_new();
  v126 = self;
  BOOL v6 = [(VMCarrierServicesController *)self telephonyClient];
  id v7 = [v6 contexts];

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v115 = v7;
  id obj = [v7 subscriptions];
  id v8 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v142;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v142 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        size_t v13 = +[NSFileManager defaultManager];
        int v14 = [v12 accountID];
        unsigned __int8 v15 = sub_10006D8F0(v14);
        __int16 v16 = [v15 path];
        unsigned __int8 v17 = [v13 fileExistsAtPath:v16];

        if ((v17 & 1) == 0)
        {
          __int16 v18 = [v12 accountID];
          [v123 addObject:v18];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v141 objects:v159 count:16];
    }
    while (v9);
  }

  __int16 v19 = sub_100048E70();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v147 = "";
    __int16 v148 = 2080;
    v149 = "";
    __int16 v150 = 2112;
    uint64_t v151 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%s===> Creating voicemail services for %@", buf, 0x20u);
  }

  int v20 = v126;
  __int16 v21 = [(VMCarrierServicesController *)v126 carrierAccountDataSource];
  [v21 checkUpdateAccounts];

  v22 = [(VMCarrierServicesController *)v126 carrierAccountDataSource];
  __int16 v23 = [v22 accounts];

  id v24 = [(VMCarrierServicesController *)v126 labelUUIDToService];
  id v113 = [v24 copy];

  id obja = (id)objc_opt_new();
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v25 = v23;
  v119 = v25;
  id v125 = [v25 countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (v125)
  {
    uint64_t v124 = *(void *)v138;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v138 != v124) {
          objc_enumerationMutation(v25);
        }
        uint64_t v27 = *(void **)(*((void *)&v137 + 1) + 8 * (void)v26);
        id v28 = [(VMCarrierServicesController *)v20 telephonyClient];
        uint64_t v29 = [v28 contexts];
        v30 = [v27 UUID];
        sub_10004A5AC(v29, v30);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v32 = sub_100048E70();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v33 = [v27 UUID];
          *(_DWORD *)buf = 136315906;
          v147 = "";
          __int16 v148 = 2080;
          v149 = "";
          __int16 v150 = 2112;
          uint64_t v151 = (uint64_t)v33;
          __int16 v152 = 2112;
          CFStringRef v153 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#I %s%s==> Creating voicemail service for account UUID %@ with context %@", buf, 0x2Au);
        }
        v34 = [(VMCarrierServicesController *)v20 carrierBundleClient];
        unsigned int v35 = [(__CFString *)v31 context];
        __int16 v36 = [v34 serviceNameForSubscription:v35];

        if (v36 && ![v36 caseInsensitiveCompare:@"IMAP"])
        {
          v39 = [v27 UUID];
          [obja addObject:v39];

          v40 = [(VMCarrierServicesController *)v20 labelUUIDToService];
          v41 = [v27 UUID];
          v42 = [v40 objectForKeyedSubscript:v41];

          if (v42)
          {
            v38 = sub_100048E70();
            id v25 = v119;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v147 = "";
              __int16 v148 = 2080;
              v149 = "";
              __int16 v150 = 2112;
              uint64_t v151 = (uint64_t)v31;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#I %s%sService currently exists; skipping service creation for subscription: %@",
                buf,
                0x20u);
            }
          }
          else
          {
            long long v43 = [(VMCarrierServicesController *)v20 telephonyClient];
            long long v44 = [v43 isoCountryCode:v31];

            long long v45 = [(VMCarrierServicesController *)v20 telephonyClient];
            v121 = [v45 countryCode:v31];

            long long v46 = [(VMCarrierServicesController *)v20 telephonyClient];
            v120 = [v46 networkCode:v31];

            long long v47 = [(__CFString *)v31 phoneNumber];
            v122 = v44;
            long long v48 = sub_10001FA20(v47, v44);

            if (!v48 || ![v48 length])
            {
              long long v49 = sub_100048E70();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v98 = [v27 UUID];
                *(_DWORD *)buf = 136315650;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v98;
                _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#E %s%sCould not retrieve a normalized telephone number for account %@", buf, 0x20u);
              }
            }
            long long v50 = [v27 UUID];
            v51 = [(__CFString *)v31 accountID];
            v52 = [(VMCarrierServicesController *)v20 telephonyClient];
            v53 = [(VMCarrierServicesController *)v126 stateRequestController];
            v54 = [(__CFString *)v31 accountID];
            LOBYTE(v112) = [v123 containsObject:v54];
            v118 = v48;
            v55 = +[VVService serviceWithLabel:accountIdentifier:phoneNumber:name:isoCountryCode:countryCode:networkCode:contextInfo:telephonyClient:stateRequestController:newAccount:](VVService, "serviceWithLabel:accountIdentifier:phoneNumber:name:isoCountryCode:countryCode:networkCode:contextInfo:telephonyClient:stateRequestController:newAccount:", v50, v51, v48, v36, v122, v121, v120, v31, v52, v53, v112, v113, v114);

            v56 = v55;
            v57 = [v27 UUID];
            LODWORD(v50) = [(VMCarrierServicesController *)v126 isRefreshRequestedForAccount:v57 andReset:1];

            if (v50) {
              [v55 refreshIfNeeded];
            }
            v58 = [(VMCarrierServicesController *)v126 transcriptionService];
            [v55 setTranscriptionService:v58];

            v59 = sub_100048E70();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v147 = "";
              __int16 v148 = 2080;
              v149 = "";
              __int16 v150 = 2112;
              uint64_t v151 = (uint64_t)v55;
              __int16 v152 = 2112;
              CFStringRef v153 = v31;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "#I %s%sCreated service: %@ for subscription %@", buf, 0x2Au);
            }

            v60 = [[VMVoicemailGreetingController alloc] initWithService:v55];
            v61 = [(VMCarrierServicesController *)v126 labelUUIDToGreetingController];
            v62 = [v27 UUID];
            [v61 setObject:v60 forKeyedSubscript:v62];

            v63 = [(VMCarrierServicesController *)v126 labelUUIDToService];
            v64 = [v27 UUID];
            [v63 setObject:v56 forKeyedSubscript:v64];

            v65 = [(VMCarrierServicesController *)v126 telephonyClient];
            v66 = [(__CFString *)v31 context];
            id v136 = 0;
            v67 = [v65 getConnectionAvailability:v66 connectionType:1 error:&v136];
            id v68 = v136;

            v69 = sub_100048E70();
            v70 = v69;
            v117 = v67;
            if (v67)
            {
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v67;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved data connection availability %@ for subscription %@", buf, 0x2Au);
              }

              objc_msgSend(v56, "setCellularNetworkAvailable:", objc_msgSend(v67, "available"));
            }
            else
            {
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v68;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "#E %s%sRetrieving data connection availability failed with error %@ for subscription %@", buf, 0x2Au);
              }
            }
            v71 = [(VMCarrierServicesController *)v126 telephonyClient];
            v72 = [(__CFString *)v31 context];
            id v135 = v68;
            v73 = [v71 getConnectionState:v72 connectionType:1 error:&v135];
            id v74 = v135;

            v75 = sub_100048E70();
            v76 = v75;
            if (v73)
            {
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v73;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved data connection status %@ for subscription %@", buf, 0x2Au);
              }

              objc_msgSend(v56, "setWiFiNetworkSupported:", objc_msgSend(v73, "publicNetAllowed"));
            }
            else
            {
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v74;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "#E %s%sRetrieving data connection status failed with error %@ for subscription %@", buf, 0x2Au);
              }
            }
            v77 = [(VMCarrierServicesController *)v126 carrierBundleClient];
            id v78 = [v77 isServiceSupportedOnInternetForSubscription:v31];

            v79 = sub_100048E70();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              CFStringRef v80 = @"NOT supported";
              if (v78) {
                CFStringRef v80 = @"supported";
              }
              v147 = "";
              __int16 v148 = 2080;
              v149 = "";
              __int16 v150 = 2112;
              uint64_t v151 = (uint64_t)v80;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved service availability on Internet: service is %@", buf, 0x20u);
            }

            if (v78 != [v56 isWiFiNetworkSupported])
            {
              v81 = sub_100048E70();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
              {
                if (v78) {
                  CFStringRef v82 = @"supported";
                }
                else {
                  CFStringRef v82 = @"NOT supported";
                }
                unsigned int v83 = [v73 publicNetAllowed];
                *(_DWORD *)buf = 136316418;
                CFStringRef v84 = @"NO";
                if (v83) {
                  CFStringRef v84 = @"YES";
                }
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v82;
                __int16 v152 = 2112;
                CFStringRef v153 = v84;
                __int16 v154 = 2112;
                v155 = v73;
                __int16 v156 = 2112;
                v157 = v31;
                _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#I %s%sService is %@ on Internet in carrier bundle, but publicNetAllowed is %@ %@ for subscription %@", buf, 0x3Eu);
              }

              [v56 setWiFiNetworkSupported:v78];
            }
            v116 = v73;
            v85 = [(VMCarrierServicesController *)v126 telephonyClient];
            v86 = [(__CFString *)v31 context];
            id v134 = v74;
            v87 = [v85 getSmscAddress:v86 error:&v134];
            id v88 = v134;

            v89 = sub_100048E70();
            v90 = v89;
            if (v87)
            {
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v87;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved SMSC address '%@' for subscription %@", buf, 0x2Au);
              }

              [v56 setSmscAddress:v87];
            }
            else
            {
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v88;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_error_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "#E %s%sRetrieving SMSC address failed with error %@ for subscription %@", buf, 0x2Au);
              }
            }
            v91 = [(VMCarrierServicesController *)v126 telephonyClient];
            v92 = [(__CFString *)v31 context];
            id v133 = v88;
            v93 = [v91 getSmsReadyState:v92 error:&v133];
            id v94 = v133;

            v95 = sub_100048E70();
            v96 = v95;
            if (v93)
            {
              v97 = v116;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v93;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieved SMS ready state of %@ for subscription %@", buf, 0x2Au);
              }

              objc_msgSend(v56, "setSMSReady:", objc_msgSend(v93, "BOOLValue"));
            }
            else
            {
              v97 = v116;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v147 = "";
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2112;
                uint64_t v151 = (uint64_t)v94;
                __int16 v152 = 2112;
                CFStringRef v153 = v31;
                _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "#E %s%sRetrieving SMS ready state failed with error %@ for subscription %@", buf, 0x2Au);
              }
            }
            int v20 = v126;
            id v25 = v119;
            v38 = v122;
          }
        }
        else
        {
          v37 = sub_100048E70();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v147 = "";
            __int16 v148 = 2080;
            v149 = "";
            __int16 v150 = 2112;
            uint64_t v151 = (uint64_t)v31;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%sCarrier does not support IMAP; cancelling service creation for subscription %@",
              buf,
              0x20u);
          }

          [(VMCarrierServicesController *)v20 reportAccount:v31 subscribed:0];
          v38 = +[VMABCReporter sharedInstance];
          [v38 reportIssueType:@"Carrier Bundle" description:@"Carrier does not support IMAP"];
        }

        uint64_t v26 = (char *)v26 + 1;
      }
      while (v125 != v26);
      id v99 = [v25 countByEnumeratingWithState:&v137 objects:v158 count:16];
      id v125 = v99;
    }
    while (v99);
  }

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v100 = v113;
  id v101 = [v100 countByEnumeratingWithState:&v129 objects:v145 count:16];
  if (v101)
  {
    id v102 = v101;
    uint64_t v103 = *(void *)v130;
    do
    {
      for (j = 0; j != v102; j = (char *)j + 1)
      {
        if (*(void *)v130 != v103) {
          objc_enumerationMutation(v100);
        }
        CFStringRef v105 = *(const __CFString **)(*((void *)&v129 + 1) + 8 * (void)j);
        if (([obja containsObject:v105] & 1) == 0)
        {
          v106 = sub_100048E70();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            v107 = [v100 objectForKeyedSubscript:v105];
            *(_DWORD *)buf = 136315906;
            v147 = "";
            __int16 v148 = 2080;
            v149 = "";
            __int16 v150 = 2112;
            uint64_t v151 = (uint64_t)v107;
            __int16 v152 = 2112;
            CFStringRef v153 = v105;
            _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "#I %s%sdeleting service %@ for labelUUID %@", buf, 0x2Au);
          }
          v108 = [(VMCarrierServicesController *)v126 labelUUIDToService];
          [v108 removeObjectForKey:v105];

          v109 = [(VMCarrierServicesController *)v126 labelUUIDToGreetingController];
          [v109 removeObjectForKey:v105];
        }
      }
      id v102 = [v100 countByEnumeratingWithState:&v129 objects:v145 count:16];
    }
    while (v102);
  }

  v110 = sub_100048E70();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    v111 = [(VMCarrierServicesController *)v126 labelUUIDToService];
    *(_DWORD *)buf = 136315650;
    v147 = "";
    __int16 v148 = 2080;
    v149 = "";
    __int16 v150 = 2112;
    uint64_t v151 = (uint64_t)v111;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "#I %s%slabelUUIDToService: %@", buf, 0x20u);
  }
}

- (void)synchronize
{
  int v3 = [(VMCarrierServicesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BAC0;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (VVService)defaultService
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10004BD60;
  id v9 = sub_10004BD70;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BD78;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMCarrierServicesController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VVService *)v2;
}

- (BOOL)isSubscribed
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BF88;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMCarrierServicesController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isOnline
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004C310;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMCarrierServicesController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isSyncInProgress
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004C698;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  v4[5] = &v5;
  [(VMCarrierServicesController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)reportAccount:(id)a3 subscribed:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(VMCarrierServicesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C870;
  block[3] = &unk_1000C2650;
  BOOL v12 = a4;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)do_M2A_merge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMCarrierServicesController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CA60;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)moveRecordsWithIdentifiersToTrash:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Trash <identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D378;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)moveRecordsWithIdentifiersToInbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Inbox <identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D864;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)moveRecordsWithIdentifiersToDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Deleted <identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004DD50;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)markRecordsWithIdentifiersAsRead:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMCarrierServicesController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E10C;
  v7[3] = &unk_1000C11B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)moveRecordsWithUniqueIdentifiersToTrash:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Trash <uuid identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E5F4;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)moveRecordsWithUniqueIdentifiersToInbox:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Inbox <uuid identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EAE8;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)moveRecordsWithUniqueIdentifiersToDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100048E70();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "";
    __int16 v13 = 2080;
    int v14 = "";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sMove records to Deleted <uuid identifiers=%@>", buf, 0x20u);
  }

  id v6 = [(VMCarrierServicesController *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EFDC;
  v8[3] = &unk_1000C11B8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)markRecordsWithUniqueIdentifiersAsRead:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMCarrierServicesController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F3A0;
  v7[3] = &unk_1000C11B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)remapAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004F814;
  v11[3] = &unk_1000C11B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)resetNetworkSettings
{
  int v3 = [(VMCarrierServicesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FAE4;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)serviceForLabel:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10004BD60;
  int v14 = sub_10004BD70;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100050298;
  v6[3] = &unk_1000C1960;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(VMCarrierServicesController *)v7 performSynchronousBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)retrieveDataForRecord:(void *)a3
{
  CFRetain(a3);
  uint64_t v5 = [(VMCarrierServicesController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000503A4;
  v6[3] = &unk_1000C1DD0;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)reportTranscriptionProblemForRecord:(void *)a3
{
  CFRetain(a3);
  uint64_t v5 = [(VMCarrierServicesController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000504C4;
  v6[3] = &unk_1000C1DD0;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forRecord:(void *)a4
{
  CFRetain(a4);
  id v7 = [(VMCarrierServicesController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000505BC;
  block[3] = &unk_1000C2678;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(v7, block);
}

- (void)subscriptionDataOnlyDidChange
{
  id v3 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100048E70();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "";
    __int16 v7 = 2080;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sCarrierService, Received subscriptionDataOnlyDidChange", (uint8_t *)&v5, 0x16u);
  }

  [(VMCarrierServicesController *)self queryAndInitVoicemailServices];
}

- (void)subscriptionInfoDidChange
{
  char v2 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v2);

  id v3 = sub_100048E70();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "";
    __int16 v6 = 2080;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sCarrierService, Received subscriptionInfoDidChange", (uint8_t *)&v4, 0x16u);
  }
}

- (void)activeSubscriptionsDidChange
{
  id v3 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = sub_100048E70();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "";
    __int16 v7 = 2080;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sCarrierService, Received activeSubscriptionsDidChange", (uint8_t *)&v5, 0x16u);
  }

  [(VMCarrierServicesController *)self queryAndInitVoicemailServices];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000C2698);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  int v5 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v5);

  __int16 v6 = sub_100048E70();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    id v15 = "";
    __int16 v16 = 2080;
    unsigned __int8 v17 = "";
    __int16 v18 = 2112;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2112;
    id v21 = v4;
    id v7 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ received carrier bundle change callback for subscription %@", (uint8_t *)&v14, 0x2Au);
  }
  id v8 = objc_alloc((Class)NSUUID);
  BOOL v9 = [v4 labelID];
  id v10 = [v8 initWithUUIDString:v9];

  if (v10)
  {
    uint64_t v11 = [(VMCarrierServicesController *)self labelUUIDToService];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];

    if (v12)
    {
      id v13 = [v12 contextInfo];
      [(VMCarrierServicesController *)self updateCarrierBundle:v13 service:v12];
    }
    else
    {
      id v13 = sub_100048E70();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100081314();
      }
    }
  }
  else
  {
    uint64_t v12 = sub_100048E70();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000812A0();
    }
  }
}

- (void)updateCarrierBundle:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(VMCarrierServicesController *)self carrierBundleClient];
  id v10 = [v9 isServiceSupportedOnInternetForSubscription:v6];

  uint64_t v11 = sub_100048E70();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    int v15 = 136316162;
    __int16 v16 = "";
    CFStringRef v13 = @"NOT supported";
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2112;
    if (v10) {
      CFStringRef v13 = @"supported";
    }
    __int16 v20 = v12;
    __int16 v21 = 2112;
    CFStringRef v22 = v13;
    __int16 v23 = 2112;
    id v24 = v6;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ updating values from carrier bundle, service on Internet is %@ for subscription %@", (uint8_t *)&v15, 0x34u);
  }
  [v7 setWiFiNetworkSupported:v10];
  [v7 _carrierBundleChanged];
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = sub_100048E70();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 136316162;
    v31 = "";
    __int16 v32 = 2080;
    objc_super v33 = "";
    __int16 v34 = 2112;
    unsigned int v35 = v11;
    __int16 v36 = 2112;
    id v37 = v7;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived delegate callback %@ %@ %@", buf, 0x34u);
  }
  id v12 = objc_alloc((Class)NSUUID);
  CFStringRef v13 = [v7 labelID];
  id v14 = [v12 initWithUUIDString:v13];

  if (v14)
  {
    int v15 = [(VMCarrierServicesController *)self labelUUIDToService];
    __int16 v16 = [v15 objectForKeyedSubscript:v14];

    if (v16)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v8;
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v26;
        uint64_t v21 = kCTDataConnectionServiceTypeVVM;
        while (2)
        {
          CFStringRef v22 = 0;
          do
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v22), "isEqualToString:", v21, (void)v25))
            {
              uint64_t v23 = 1;
              goto LABEL_15;
            }
            CFStringRef v22 = (char *)v22 + 1;
          }
          while (v19 != v22);
          id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
      uint64_t v23 = 0;
LABEL_15:

      [v16 setCellularNetworkAvailable:v23];
    }
    else
    {
      id v24 = sub_100048E70();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100081314();
      }
    }
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v10);

  if (a4 == 1)
  {
    uint64_t v11 = sub_100048E70();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      id v19 = "";
      __int16 v20 = 2080;
      uint64_t v21 = "";
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sData connection state changed %@ for subscription %@", (uint8_t *)&v18, 0x2Au);
    }

    id v12 = objc_alloc((Class)NSUUID);
    CFStringRef v13 = [v8 labelID];
    id v14 = [v12 initWithUUIDString:v13];

    if (v14)
    {
      int v15 = [(VMCarrierServicesController *)self labelUUIDToService];
      __int16 v16 = [v15 objectForKeyedSubscript:v14];

      if (v16)
      {
        objc_msgSend(v16, "setWiFiNetworkSupported:", objc_msgSend(v9, "publicNetAllowed"));
      }
      else
      {
        id v17 = sub_100048E70();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100081314();
        }
      }
    }
  }
}

- (void)smsReadyStateChanged:(id)a3 info:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100048E70();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"not ready";
    int v16 = 136315906;
    __int16 v18 = 2080;
    id v17 = "";
    id v19 = "";
    if (v4) {
      CFStringRef v9 = @"ready";
    }
    __int16 v20 = 2112;
    CFStringRef v21 = v9;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sSMS is %@ for subscription %@", (uint8_t *)&v16, 0x2Au);
  }

  id v10 = objc_alloc((Class)NSUUID);
  uint64_t v11 = [v6 labelID];
  id v12 = [v10 initWithUUIDString:v11];

  if (v12)
  {
    CFStringRef v13 = [(VMCarrierServicesController *)self labelUUIDToService];
    id v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      [v14 setSMSReady:v4];
    }
    else
    {
      int v15 = sub_100048E70();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100081314();
      }
    }
  }
}

- (void)postSmscAddressAvailable:(id)a3 smsc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v8);

  CFStringRef v9 = sub_100048E70();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    id v17 = "";
    __int16 v18 = 2080;
    id v19 = "";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sSMSC address is '%@' for subscription %@", (uint8_t *)&v16, 0x2Au);
  }

  id v10 = objc_alloc((Class)NSUUID);
  uint64_t v11 = [v6 labelID];
  id v12 = [v10 initWithUUIDString:v11];

  if (v12)
  {
    CFStringRef v13 = [(VMCarrierServicesController *)self labelUUIDToService];
    id v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      [v14 setSmscAddress:v7];
    }
    else
    {
      int v15 = sub_100048E70();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100081314();
      }
    }
  }
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100048E70();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "";
    __int16 v9 = 2080;
    id v10 = "";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sISO country code has changed for subscription %@; updating the list of service providers.",
      (uint8_t *)&v7,
      0x20u);
  }

  [(VMCarrierServicesController *)self queryAndInitVoicemailServices];
}

- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = sub_100048E70();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136316162;
    id v10 = "";
    __int16 v11 = 2080;
    id v12 = "";
    __int16 v13 = 2112;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v5;
    id v8 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is suppressing %@ for %@", (uint8_t *)&v9, 0x34u);
  }
}

- (void)local_voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = sub_100048E70();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v17 = 136316162;
    *(void *)&v17[4] = "";
    *(_WORD *)&v17[12] = 2080;
    *(void *)&v17[14] = "";
    *(_WORD *)&v17[22] = 2112;
    id v18 = (id)objc_opt_class();
    *(_WORD *)id v19 = 2112;
    *(void *)&v19[2] = v6;
    *(_WORD *)&v19[10] = 2112;
    *(void *)&v19[12] = v7;
    id v10 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling voicemail info available notification delegate callback for subscription %@, voicemail info %@", v17, 0x34u);
  }
  id v11 = objc_alloc((Class)NSUUID);
  id v12 = [v6 labelID];
  id v13 = [v11 initWithUUIDString:v12];

  if (v13)
  {
    id v14 = [(VMCarrierServicesController *)self labelUUIDToService];
    __int16 v15 = [v14 objectForKeyedSubscript:v13];

    if (v15
      || ([(VMCarrierServicesController *)self queryAndInitVoicemailServices],
          [(VMCarrierServicesController *)self labelUUIDToService],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v16 objectForKeyedSubscript:v13],
          __int16 v15 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15))
    {
      -[NSObject handleVoicemailInfoUpdate:](v15, "handleVoicemailInfoUpdate:", v7, *(_OWORD *)v17, *(void *)&v17[16], v18, *(_OWORD *)v19, *(void *)&v19[16]);
    }
    else
    {
      __int16 v15 = sub_100048E70();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100081314();
      }
    }
  }
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000E0538) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(VMCarrierServicesController *)self queue];
    dispatch_sync(v7, v5);
  }
}

- (BOOL)isAccountSubscribed:(id)a3
{
  id v4 = a3;
  id v5 = [(VMCarrierServicesController *)self labelUUIDToService];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    unsigned __int8 v7 = [v6 isSubscribed];
  }
  else
  {
    id v8 = sub_100048E70();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      id v11 = "";
      __int16 v12 = 2080;
      id v13 = "";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve subscribed status for account UUID %@", (uint8_t *)&v10, 0x20u);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isAccountOnline:(id)a3
{
  id v4 = a3;
  id v5 = [(VMCarrierServicesController *)self labelUUIDToService];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    unsigned __int8 v7 = [v6 isOnline];
  }
  else
  {
    id v8 = sub_100048E70();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      id v11 = "";
      __int16 v12 = 2080;
      id v13 = "";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve online status for account UUID %@", (uint8_t *)&v10, 0x20u);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMCarrierServicesController *)self findContextInfoWithLabelUUID:v4];
  if (v5)
  {
    id v6 = [(VMCarrierServicesController *)self carrierBundleClient];
    unsigned __int8 v7 = [v5 context];
    unsigned int v8 = [v6 isServiceSupportedForSubscription:v7];

    if (v8)
    {
      int v9 = [(VMCarrierServicesController *)self telephonyClient];
      int v10 = [v9 voicemailPhoneNumber:v5];

      BOOL v11 = v10 != 0;
      __int16 v12 = sub_100048E70();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v13)
        {
          int v19 = 136315906;
          __int16 v20 = "";
          __int16 v21 = 2080;
          __int16 v22 = "";
          __int16 v23 = 2112;
          __int16 v24 = v10;
          __int16 v25 = 2112;
          long long v26 = v4;
          __int16 v14 = "#I %s%sCall voicemail with phoneNumber '%@' is supported for account UUID %@";
          id v15 = v12;
          uint32_t v16 = 42;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
        }
      }
      else if (v13)
      {
        int v19 = 136315650;
        __int16 v20 = "";
        __int16 v21 = 2080;
        __int16 v22 = "";
        __int16 v23 = 2112;
        __int16 v24 = v4;
        __int16 v14 = "#I %s%sInvalid voicemail phoneNumber, call voicemail is not supported for account UUID %@";
        id v15 = v12;
        uint32_t v16 = 32;
        goto LABEL_14;
      }

      goto LABEL_16;
    }
    int v10 = sub_100048E70();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      __int16 v20 = "";
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2112;
      __int16 v24 = v4;
      __int16 v17 = "#I %s%sVoicemail service in not supported in carrier bundle, call voicemail is not supported for account UUID %@";
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = sub_100048E70();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      __int16 v20 = "";
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2112;
      __int16 v24 = v4;
      __int16 v17 = "#W %s%sCould not retrieve context, call voicemail is not supported for account UUID %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0x20u);
    }
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMCarrierServicesController *)self labelUUIDToService];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    int64_t v7 = (int)[v6 minimumPasswordLength];
  }
  else
  {
    unsigned int v8 = sub_100048E70();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      BOOL v11 = "";
      __int16 v12 = 2080;
      BOOL v13 = "";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve service provider for account UUID %@", (uint8_t *)&v10, 0x20u);
    }

    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMCarrierServicesController *)self labelUUIDToService];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    int64_t v7 = (int)[v6 maximumPasswordLength];
  }
  else
  {
    unsigned int v8 = sub_100048E70();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      BOOL v11 = "";
      __int16 v12 = 2080;
      BOOL v13 = "";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve service provider for account UUID %@", (uint8_t *)&v10, 0x20u);
    }

    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(VMCarrierServicesController *)self labelUUIDToService];
  __int16 v12 = [v11 objectForKeyedSubscript:v9];

  BOOL v13 = sub_100048E70();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v15 = 136315906;
      uint32_t v16 = "";
      __int16 v17 = 2080;
      id v18 = "";
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sSetting passcode for service %@: accountUUID: %@", (uint8_t *)&v15, 0x2Au);
    }

    [v12 setPasscode:v8 completion:v10];
  }
  else
  {
    if (v14)
    {
      int v15 = 136315650;
      uint32_t v16 = "";
      __int16 v17 = 2080;
      id v18 = "";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve service provider for account UUID %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)greetingForAccountUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VMCarrierServicesController *)self labelUUIDToGreetingController];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [v9 greetingWithCompletion:v7];
  }
  else
  {
    id v10 = sub_100048E70();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      __int16 v12 = "";
      __int16 v13 = 2080;
      BOOL v14 = "";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve greeting controller for account UUID %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(VMCarrierServicesController *)self labelUUIDToGreetingController];
  __int16 v12 = [v11 objectForKeyedSubscript:v9];

  if (v12)
  {
    [v12 setGreeting:v8 completion:v10];
  }
  else
  {
    __int16 v13 = sub_100048E70();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      __int16 v15 = "";
      __int16 v16 = 2080;
      __int16 v17 = "";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not retrieve greeting controller for account UUID %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (VMDCarrierAccountDataSource)carrierAccountDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carrierAccountDataSource);
  return (VMDCarrierAccountDataSource *)WeakRetained;
}

- (void)setCarrierAccountDataSource:(id)a3
{
}

- (VMCarrierBundleClient)carrierBundleClient
{
  return self->_carrierBundleClient;
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VMCarrierStateRequestController)stateRequestController
{
  return self->_stateRequestController;
}

- (VMTranscriptionService)transcriptionService
{
  return self->_transcriptionService;
}

- (NSMutableDictionary)labelUUIDToGreetingController
{
  return self->_labelUUIDToGreetingController;
}

- (void)setLabelUUIDToGreetingController:(id)a3
{
}

- (NSMutableDictionary)labelUUIDToService
{
  return self->_labelUUIDToService;
}

- (void)setLabelUUIDToService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelUUIDToService, 0);
  objc_storeStrong((id *)&self->_labelUUIDToGreetingController, 0);
  objc_storeStrong((id *)&self->_transcriptionService, 0);
  objc_storeStrong((id *)&self->_stateRequestController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_carrierBundleClient, 0);
  objc_destroyWeak((id *)&self->_carrierAccountDataSource);
}

@end