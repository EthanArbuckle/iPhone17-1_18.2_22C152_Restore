@interface AF2SyncClient
- (AF2SyncClient)init;
- (BOOL)_hasValidOfflineKeyWithAccountID:(unint64_t)a3;
- (DeviceKeyTypeSupport)_getDeviceKeyTypeSupportInfo;
- (double)_getSubscriptionStatusRefreshInterval;
- (id)_endProvisioningWithPtm:(id)a3 tk:(id)a4;
- (id)_eraseProvisioning;
- (id)_generateClientInfoWithMachineID:(id)a3 hostInfoData:(id)a4 clientData:(id *)a5;
- (id)_generateKeybagRequest:(id *)a3;
- (id)_getApplicationAccountIds;
- (id)_getDeviceCertificate:(id *)a3;
- (id)_getHWInfoString;
- (id)_getKeybagAccountIds;
- (id)_getMediaAccountIds;
- (id)_hostSyncPrepareKeybagResponseForRequest:(id)a3 withDeviceCertificate:(id)a4 hwInfoString:(id)a5 deviceType:(unsigned int)a6 supportVersion:(unsigned int)a7 requestedDSIDs:(id)a8 keyBagResponseData:(id *)a9;
- (id)_importKeybag:(id)a3;
- (id)_importSubsBag:(id)a3;
- (id)_initiateBeginKeybagSyncOnMessageLink:(id)a3;
- (id)_initiateKeybagRequestOnMessageLink:(id)a3;
- (id)_provisionDeviceWithData:(id)a3 clientData:(id *)a4;
- (id)_syncDeviceProvisioningWithSim:(id)a3 srm:(id *)a4;
- (id)supportedDataclasses;
- (unsigned)_fairPlayContext;
- (void)_checkForNewAccountIds;
- (void)_destroyFairPlayContext;
- (void)_destroyProvisioningContext;
- (void)_getMid:(id *)a3 otp:(id *)a4;
- (void)_handleAirTrafficStartedEvent:(id)a3;
- (void)_handleBeginKeybagSyncRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleContentsChangedNotification:(id)a3;
- (void)_handleDeferredAccountChangeCheckEvent:(id)a3;
- (void)_handleKeybagRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleKeybagSyncRequestNotification:(id)a3;
- (void)_handleProvisioningRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleSubscriptionClientInfoRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleSubscriptionImportSubsBagRequest:(id)a3 onMessageLink:(id)a4;
- (void)_initiateKeybagSyncWithPriority:(int)a3;
- (void)_processKeybagResponse:(id)a3 onMessageLink:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)dealloc;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
@end

@implementation AF2SyncClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusController, 0);
  objc_storeStrong((id *)&self->_subscriptionFairPlayController, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_currentMessageLink, 0);

  objc_storeStrong((id *)&self->_currentSyncedAccountIds, 0);
}

- (double)_getSubscriptionStatusRefreshInterval
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_12F99C;
  v23 = sub_12F9AC;
  v3 = +[ISURLBagCache sharedCache];
  id v24 = [v3 URLBagForContext:v2 withOptions:3];

  v4 = (void *)v20[5];
  if (v4) {
    goto LABEL_5;
  }
  v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "no cached bag values - loading from server", (uint8_t *)buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v2];
  objc_initWeak(buf, v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_12F9B4;
  v14[3] = &unk_160428;
  objc_copyWeak(&v17, buf);
  v16 = &v19;
  v8 = v6;
  v15 = v8;
  [v7 setCompletionBlock:v14];
  [v7 start];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  v4 = (void *)v20[5];
  if (v4)
  {
LABEL_5:
    v9 = [v4 valueForKey:@"subscription-status-refresh-interval-in-seconds"];
    v10 = v9;
    if (v9)
    {
      [v9 doubleValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 86400.0;
    }
  }
  else
  {
    double v12 = 86400.0;
  }
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)_importSubsBag:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(AF2SyncClient *)self _fairPlayContext];
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    sub_F10EC();
    int v7 = v6;
    v8 = _ATLogCategorySyncBundle();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "failed to import subscription bag data. err=%ld", buf, 0xCu);
      }

      v10 = +[NSError errorWithDomain:@"AirFair2" code:v7 userInfo:0];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "successfully imported subscription bag data. err=%ld", buf, 0xCu);
      }

      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasValidOfflineKeyWithAccountID:(unint64_t)a3
{
  [(AF2SyncClient *)self _fairPlayContext];
  sub_8FFD0();
  if (v3)
  {
    int v4 = v3;
    id v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "failed to get susbcription status. err=%ld", buf, 0xCu);
    }
  }
  return 0;
}

- (id)_generateClientInfoWithMachineID:(id)a3 hostInfoData:(id)a4 clientData:(id *)a5
{
  uint64_t v27 = 0;
  unsigned int v26 = 0;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(AF2SyncClient *)self _fairPlayContext];
  id v11 = v9;
  id v12 = [v11 bytes];
  id v13 = [v11 length];

  id v14 = v8;
  id v15 = [v14 bytes];
  id v16 = [v14 length];

  sub_3100(v10, (uint64_t)v12, (uint64_t)v13, (uint64_t)v15, (uint64_t)v16, (uint64_t)&v27, (uint64_t)&v26);
  int v18 = v17;
  if (v17 == -42586)
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v21 = "Client is not opted-in";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      uint32_t v24 = 2;
LABEL_8:
      _os_log_impl(&dword_0, v22, v23, v21, buf, v24);
    }
  }
  else
  {
    if (!v17)
    {
      +[NSData dataWithBytes:v27 length:v26];
      uint64_t v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = v18;
      uint64_t v21 = "failed to generate subscription client info. err=%ld";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 12;
      goto LABEL_8;
    }
  }

  uint64_t v19 = +[NSError errorWithDomain:@"AirFair2" code:v18 userInfo:0];
LABEL_10:
  if (v27) {
    sub_F82F8(v27);
  }

  return v19;
}

- (id)_getApplicationAccountIds
{
  v2 = +[NSMutableSet set];
  int v3 = +[LSApplicationWorkspace defaultWorkspace];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_130090;
  v7[3] = &unk_160400;
  id v8 = v2;
  id v4 = v2;
  [v3 enumerateBundlesOfType:1 block:v7];
  id v5 = [v4 allObjects];

  return v5;
}

- (id)_getMediaAccountIds
{
  v2 = +[NSMutableSet set];
  int v3 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_130210;
  v7[3] = &unk_1603D8;
  id v8 = v2;
  id v4 = v2;
  [v3 databaseConnectionAllowingWrites:0 withBlock:v7];

  id v5 = [v4 allObjects];

  return v5;
}

- (id)_getKeybagAccountIds
{
  int v3 = [(AF2SyncClient *)self _getApplicationAccountIds];
  id v4 = [v3 mutableCopy];

  id v5 = [(AF2SyncClient *)self _getMediaAccountIds];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([v4 containsObject:v10] & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_initiateKeybagSyncWithPriority:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "initiating keybag re-sync with priority %d", (uint8_t *)v12, 8u);
  }

  currentMessageLink = self->_currentMessageLink;
  if (currentMessageLink)
  {
    unsigned int v7 = [(ATConcreteMessageLink *)currentMessageLink endpointType];
    uint64_t v8 = self->_currentMessageLink;
    if (v7) {
      id v9 = [(AF2SyncClient *)self _initiateBeginKeybagSyncOnMessageLink:v8];
    }
    else {
      id v11 = [(AF2SyncClient *)self _initiateKeybagRequestOnMessageLink:v8];
    }
  }
  else
  {
    uint64_t v10 = +[ATDeviceService sharedInstance];
    [v10 openDeviceMessageLinkWithPriority:v3 withCompletion:&stru_160388];
  }
}

- (void)_checkForNewAccountIds
{
  uint64_t v3 = +[ATEventScheduler sharedInstance];
  unsigned __int8 v4 = [v3 hasScheduledEvent:@"kAF2DeferredAccountChangeCheckTimerEvent"];

  if ((v4 & 1) == 0)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v6 = v5 - self->_lastAccountChangeCheckTime;
    if (v6 >= 30.0)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      self->_lastAccountChangeCheckTime = v7;
      uint64_t v8 = [(AF2SyncClient *)self _getKeybagAccountIds];
      currentSyncedAccountIds = self->_currentSyncedAccountIds;
      if (!currentSyncedAccountIds || ![(NSArray *)currentSyncedAccountIds isEqualToArray:v8])
      {
        uint64_t v10 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v13 = v8;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "accounts have changed. accountIds=%{public}@", buf, 0xCu);
        }

        [(AF2SyncClient *)self _initiateKeybagSyncWithPriority:1];
      }
    }
    else
    {
      id v11 = +[ATEventScheduler sharedInstance];
      [v11 scheduleEvent:@"kAF2DeferredAccountChangeCheckTimerEvent" afterDelay:0 withUserData:30.0 - v6];
    }
  }
}

- (id)_hostSyncPrepareKeybagResponseForRequest:(id)a3 withDeviceCertificate:(id)a4 hwInfoString:(id)a5 deviceType:(unsigned int)a6 supportVersion:(unsigned int)a7 requestedDSIDs:(id)a8 keyBagResponseData:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  memset(v70, 0, sizeof(v70));
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  int HardwareInfoFromDeviceUDID = 0;
  int HardwareInfoFromDeviceUDID = ICFairPlayGetHardwareInfoFromDeviceUDID();
  if (*((_DWORD *)v58 + 6))
  {
    uint64_t v19 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = *((_DWORD *)v58 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "ICFairPlayGetHardwareInfoFromDeviceUDID failed. error=%d", buf, 8u);
    }

    uint64_t v21 = +[NSError errorWithDomain:@"AirFair2" code:*((int *)v58 + 6) userInfo:0];
    id v22 = 0;
    if (v21) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  v56[0] = a6;
  v56[1] = a7;
  uint64_t v55 = 0;
  uint64_t v23 = [(AF2SyncClient *)self _fairPlayContext];
  id v24 = v16;
  sub_41650(v23, (uint64_t)[v24 bytes], (uint64_t)objc_msgSend(v24, "length"), (uint64_t)v70, (uint64_t)v56);
  *((_DWORD *)v58 + 6) = v25;
  if (v25)
  {
    unsigned int v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = *((_DWORD *)v58 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v27;
      v28 = "FairPlayDeviceSyncBeginCertificate failed. err=%d";
LABEL_12:
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, v28, buf, 8u);
    }
  }
  else
  {
    id v29 = v15;
    [v29 bytes];
    [v29 length];
    sub_FF2BC(v55);
    *((_DWORD *)v58 + 6) = v30;
    if (!v30)
    {
      if (v18) {
        v34 = [v18 mutableCopy];
      }
      else {
        v34 = objc_opt_new();
      }
      unsigned int v26 = v34;
      v35 = +[ICUserIdentityStore defaultIdentityStore];
      v36 = +[ICUserIdentity activeAccount];
      v49 = [v35 DSIDForUserIdentity:v36 outError:0];

      if (v49) {
        [v26 addObject:v49];
      }
      v37 = [(AF2SyncClient *)self _getKeybagAccountIds];
      [v26 addObjectsFromArray:v37];
      v48 = v37;
      v38 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = [v18 count];
        id v39 = [v37 count];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v47;
        __int16 v64 = 2112;
        id v65 = v18;
        __int16 v66 = 2048;
        id v67 = v39;
        __int16 v68 = 2112;
        v69 = v37;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "building keybag with %lu watch DSIDs %@ and %lu companion DSIDs %@", buf, 0x2Au);
      }

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_130EE0;
      v51[3] = &unk_160368;
      id v40 = (id)objc_opt_new();
      id v52 = v40;
      v53 = &v57;
      uint64_t v54 = v55;
      [v26 enumerateObjectsUsingBlock:v51];
      v41 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = [v40 count];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v42;
        __int16 v64 = 2112;
        id v65 = v40;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "finished building keybag with %lu DSIDs %@", buf, 0x16u);
      }

      *(void *)buf = 0;
      unsigned int v50 = 0;
      sub_E830C(v55, (uint64_t)buf, (uint64_t)&v50);
      *((_DWORD *)v58 + 6) = v43;
      if (v43)
      {
        p_super = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          int v45 = *((_DWORD *)v58 + 6);
          *(_DWORD *)v61 = 67109120;
          int v62 = v45;
          _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_ERROR, "FairPlayDeviceSyncEnd failed. err=%d", v61, 8u);
        }
        id v22 = 0;
      }
      else
      {
        id v22 = +[NSData dataWithBytes:*(void *)buf length:v50];
        sub_7A24(*(uint64_t *)buf);
        v46 = v48;
        p_super = &self->_currentSyncedAccountIds->super;
        self->_currentSyncedAccountIds = v46;
      }

      goto LABEL_14;
    }
    unsigned int v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v31 = *((_DWORD *)v58 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v31;
      v28 = "FairPlayDeviceSyncSet failed. err=%d";
      goto LABEL_12;
    }
  }
  id v22 = 0;
LABEL_14:

LABEL_15:
  uint64_t v32 = *((int *)v58 + 6);
  if (v32)
  {
    uint64_t v21 = +[NSError errorWithDomain:@"AirFair2" code:v32 userInfo:0];
    if (!a9) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if (!a9) {
      goto LABEL_21;
    }
  }
  if (!v21)
  {
    id v22 = v22;
    uint64_t v21 = 0;
    *a9 = v22;
  }
LABEL_21:
  _Block_object_dispose(&v57, 8);

  return v21;
}

- (id)_importKeybag:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && ([(AF2SyncClient *)self _fairPlayContext],
        id v5 = v4,
        [v5 bytes],
        [v5 length],
        sub_F2950(),
        v6))
  {
    int v7 = v6;
    uint64_t v8 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      uint64_t v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "failed to import keybag data. err=%ld", (uint8_t *)&v11, 0xCu);
    }

    id v9 = +[NSError errorWithDomain:@"AirFair2" code:v7 userInfo:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_generateKeybagRequest:(id *)a3
{
  id v5 = +[SSAccountStore defaultStore];
  int v6 = [v5 activeLockerAccount];
  int v7 = [v6 uniqueIdentifier];
  id v8 = [v7 unsignedLongLongValue];

  uint64_t v15 = 0;
  unsigned int v14 = 0;
  sub_FFD3C([(AF2SyncClient *)self _fairPlayContext], (uint64_t)v8, 110103, 7, (uint64_t)&v15, (uint64_t)&v14);
  if (v9)
  {
    int v10 = v9;
    int v11 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "failed to generate keybag request. err=%ld", buf, 0xCu);
    }

    uint64_t v12 = +[NSError errorWithDomain:@"AirFair2" code:v10 userInfo:0];
  }
  else
  {
    *a3 = +[NSData dataWithBytes:v15 length:v14];
    sub_46C44(v15);
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_getDeviceCertificate:(id *)a3
{
  unsigned int v10 = 4096;
  sub_FE804([(AF2SyncClient *)self _fairPlayContext], 16777221, (uint64_t)v13, (uint64_t)&v10);
  if (v4)
  {
    int v5 = v4;
    int v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "failed to obtain device certificate. err=%ld", buf, 0xCu);
    }

    id v8 = +[NSError errorWithDomain:@"AirFair2" code:v5 userInfo:0];
  }
  else
  {
    id v7 = +[NSData dataWithBytes:v13 length:v10];
    id v8 = 0;
    *a3 = v7;
  }

  return v8;
}

- (DeviceKeyTypeSupport)_getDeviceKeyTypeSupportInfo
{
  uint64_t v6 = 0;
  sub_1F978((uint64_t)&v6 + 4, (uint64_t)&v6);
  if (v2)
  {
    int v3 = v2;
    int v4 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "FairPlayGetDeviceSupportInfo failed. err=%ld", buf, 0xCu);
    }

    return (DeviceKeyTypeSupport)0;
  }
  else
  {
    return (DeviceKeyTypeSupport)(HIDWORD(v6) | ((unint64_t)v6 << 32));
  }
}

- (id)_getHWInfoString
{
  int v2 = (void *)MGCopyAnswer();

  return v2;
}

- (void)_destroyFairPlayContext
{
  unsigned int fpContextId = self->_fpContextId;
  if (fpContextId)
  {
    sub_273C(fpContextId);
    self->_unsigned int fpContextId = 0;
  }
}

- (unsigned)_fairPlayContext
{
  p_unsigned int fpContextId = &self->_fpContextId;
  if (!self->_fpContextId) {
    goto LABEL_5;
  }
  sub_22784();
  if (v4) {
    [(AF2SyncClient *)self _destroyFairPlayContext];
  }
  unsigned int result = *p_fpContextId;
  if (!*p_fpContextId)
  {
LABEL_5:
    sub_1FA4(0, 0, (uint64_t)"/var/mobile/Media/iTunes_Control/iTunes", (uint64_t)p_fpContextId);
    return *p_fpContextId;
  }
  return result;
}

- (id)_syncDeviceProvisioningWithSim:(id)a3 srm:(id *)a4
{
  uint64_t v16 = 0;
  int v15 = 0;
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  sub_114D50(-1, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16, (uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13);
  if (v8)
  {
    int v9 = v8;
    unsigned int v10 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Provisioning sync failed. err=%ld", buf, 0xCu);
    }

    int v11 = +[NSError errorWithDomain:@"AirFair2" code:v9 userInfo:0];
  }
  else
  {
    +[NSData dataWithBytes:v14 length:v13];
    int v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v14) {
    sub_11C0E8(v14);
  }
  if (v16) {
    sub_11C0E8(v16);
  }

  return v11;
}

- (id)_eraseProvisioning
{
  sub_111244();
  if (v2)
  {
    int v3 = v2;
    int v4 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      uint64_t v8 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Provisioning erase failed. err=%ld", (uint8_t *)&v7, 0xCu);
    }

    id v5 = +[NSError errorWithDomain:@"AirFair2" code:v3 userInfo:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_endProvisioningWithPtm:(id)a3 tk:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  [v7 bytes];
  [v7 length];

  id v8 = v6;
  [v8 bytes];
  [v8 length];

  sub_10A410();
  if (v9)
  {
    int v10 = v9;
    int v11 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134217984;
      uint64_t v15 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Provisioning end failed. err=%ld", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = +[NSError errorWithDomain:@"AirFair2" code:v10 userInfo:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_provisionDeviceWithData:(id)a3 clientData:(id *)a4
{
  uint64_t v16 = 0;
  unsigned int v15 = 0;
  id v6 = a3;
  [(AF2SyncClient *)self _destroyProvisioningContext];
  id v7 = v6;
  id v8 = [v7 bytes];
  id v9 = [v7 length];

  sub_12006C(-1, (uint64_t)v8, (uint64_t)v9, (uint64_t)&v16, (uint64_t)&v15, (uint64_t)&self->_provisioningContextId);
  if (v10)
  {
    int v11 = v10;
    uint64_t v12 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Provisioning start failed. err=%ld", buf, 0xCu);
    }

    unsigned int v13 = +[NSError errorWithDomain:@"AirFair2" code:v11 userInfo:0];
  }
  else
  {
    +[NSData dataWithBytes:v16 length:v15];
    unsigned int v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v16) {
    sub_11C0E8(v16);
  }

  return v13;
}

- (void)_getMid:(id *)a3 otp:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  sub_12A818(-1, (uint64_t)&v12, (uint64_t)&v10 + 4, (uint64_t)&v11, (uint64_t)&v10);
  if (v6)
  {
    int v7 = v6;
    id v8 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to get MID/OTP. err=%ld", buf, 0xCu);
    }

    id v9 = 0;
    *a3 = 0;
  }
  else
  {
    *a3 = +[NSData dataWithBytes:v12 length:HIDWORD(v10)];
    id v9 = +[NSData dataWithBytes:v11 length:v10];
  }
  *a4 = v9;
  if (v12) {
    sub_11C0E8(v12);
  }
  if (v11) {
    sub_11C0E8(v11);
  }
}

- (void)_destroyProvisioningContext
{
  if (self->_provisioningContextId)
  {
    sub_118E48();
    self->_provisioningContextId = 0;
  }
}

- (void)_handleProvisioningRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 parameters];
  id v9 = [v8 objectForKey:@"provisioningAction"];
  if ([v9 isEqualToString:@"syncProvisioning"])
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
    uint64_t v11 = [v8 objectForKey:@"sim"];
    id v25 = 0;
    uint64_t v12 = [(AF2SyncClient *)self _syncDeviceProvisioningWithSim:v11 srm:&v25];
    id v13 = v25;

    id v23 = 0;
    id v24 = 0;
    [(AF2SyncClient *)self _getMid:&v24 otp:&v23];
    id v14 = v24;
    id v15 = v23;
    if (v13) {
      [v10 setObject:v13 forKey:@"srm"];
    }
    if (v14) {
      [v10 setObject:v14 forKey:@"clientMachineIDData"];
    }
  }
  else if ([v9 isEqualToString:@"startProvisioning"])
  {
    uint64_t v16 = [(AF2SyncClient *)self _getHWInfoString];
    uint64_t v10 = +[NSMutableDictionary dictionary];
    uint64_t v17 = [v8 objectForKey:@"spim"];
    id v22 = 0;
    uint64_t v12 = [(AF2SyncClient *)self _provisionDeviceWithData:v17 clientData:&v22];
    id v18 = v22;

    if (v18) {
      [v10 setObject:v18 forKey:@"cpim"];
    }
    if (v16) {
      [v10 setObject:v16 forKey:@"clientHWInfoString"];
    }
  }
  else
  {
    if ([v9 isEqualToString:@"endProvisioning"])
    {
      uint64_t v19 = [v8 objectForKey:@"ptm"];
      int v20 = [v8 objectForKey:@"tk"];
      uint64_t v12 = [(AF2SyncClient *)self _endProvisioningWithPtm:v19 tk:v20];
    }
    else
    {
      if (![v9 isEqualToString:@"eraseProvisioning"])
      {
        uint64_t v10 = 0;
        uint64_t v12 = 0;
        goto LABEL_19;
      }
      uint64_t v12 = [(AF2SyncClient *)self _eraseProvisioning];
    }
    uint64_t v10 = 0;
  }
LABEL_19:
  uint64_t v21 = [v6 responseWithError:v12 parameters:v10];
  [v7 sendResponse:v21 withCompletion:0];
}

- (void)_handleSubscriptionImportSubsBagRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 parameters];
  id v9 = [v8 objectForKey:@"SubsBagData"];
  id v11 = [(AF2SyncClient *)self _importSubsBag:v9];
  uint64_t v10 = [v7 responseWithError:v11 parameters:0];

  [v6 sendResponse:v10 withCompletion:0];
}

- (void)_handleSubscriptionClientInfoRequest:(id)a3 onMessageLink:(id)a4
{
  id v21 = a4;
  id v6 = a3;
  id v7 = [v6 parameters];
  uint64_t v8 = [v7 objectForKey:@"hostInfoData"];
  id v9 = [(AF2SyncClient *)self _getHWInfoString];
  uint64_t v10 = [v7 objectForKey:@"accountId"];
  id v19 = [v10 unsignedLongLongValue];

  id v24 = 0;
  id v25 = 0;
  [(AF2SyncClient *)self _getMid:&v25 otp:&v24];
  id v11 = v25;
  id v12 = v24;
  id v22 = (void *)v8;
  if (v11)
  {
    id v23 = 0;
    int v20 = [(AF2SyncClient *)self _generateClientInfoWithMachineID:v11 hostInfoData:v8 clientData:&v23];
    id v13 = v23;
  }
  else
  {
    id v13 = 0;
    int v20 = 0;
  }
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = +[NSNumber numberWithUnsignedInt:[(AF2SyncClient *)self _getDeviceKeyTypeSupportInfo]];
  if (v9) {
    [v14 setObject:v9 forKey:@"clientHWInfoString"];
  }
  if (v13) {
    [v14 setObject:v13 forKey:@"clientInfoData"];
  }
  if (v11) {
    [v14 setObject:v11 forKey:@"clientMachineIDData"];
  }
  if (v12) {
    [v14 setObject:v12 forKey:@"clientOTPData"];
  }
  [v14 setObject:v15 forKey:@"clientDeviceType"];
  uint64_t v16 = (void *)MGCopyAnswer();
  [v14 setObject:v16 forKey:@"clientVersion"];

  uint64_t v17 = +[NSNumber numberWithBool:[(AF2SyncClient *)self _hasValidOfflineKeyWithAccountID:v19]];
  [v14 setObject:v17 forKey:@"clientState"];

  id v18 = [v6 responseWithError:v20 parameters:v14];

  [v21 sendResponse:v18 withCompletion:&stru_160340];
}

- (void)_processKeybagResponse:(id)a3 onMessageLink:(id)a4
{
  id v5 = a3;
  id v6 = [v5 error];

  if (!v6)
  {
    id v9 = [v5 parameters];
    id v7 = [v9 objectForKey:@"KeybagData"];

    uint64_t v8 = [(AF2SyncClient *)self _importKeybag:v7];
    uint64_t v10 = _ATLogCategorySyncBundle();
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543362;
        uint64_t v17 = v8;
        id v12 = "failed to import keybag response data. err=%{public}@";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 12;
LABEL_9:
        _os_log_impl(&dword_0, v13, v14, v12, (uint8_t *)&v16, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v12 = "keybag transfer successful!";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 2;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = [v5 error];
    int v16 = 138543362;
    uint64_t v17 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "host failed to process keybag request. err=%{public}@", (uint8_t *)&v16, 0xCu);
LABEL_11:
  }
}

- (void)_handleKeybagRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v6;
  id v9 = [v6 parameters];
  uint64_t v10 = [v9 objectForKey:@"DeviceCert"];
  uint64_t v11 = [v9 objectForKey:@"KeybagData"];
  uint64_t v12 = [v9 objectForKey:@"KeybagSig"];
  uint64_t v32 = [v9 objectForKey:@"HWInfoString"];
  id v13 = [v9 objectForKey:@"KeyTypeDeviceType"];
  id v14 = [v13 intValue];

  uint32_t v15 = [v9 objectForKey:@"KeyTypeVersion"];
  id v16 = [v15 intValue];

  [v9 objectForKey:@"AccountDSIDs"];
  v31 = int v30 = v7;
  uint64_t v17 = [v7 signatureProvider];
  id v18 = v17;
  id v29 = (void *)v12;
  if (v17)
  {
    uint64_t v19 = [v17 verifySignature:v12 forData:v11];
    if (v19)
    {
      int v20 = (void *)v19;
      id v21 = _ATLogCategorySyncBundle();
      id v22 = self;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v20;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "failed to verify signature of keybag data. err=%{public}@", buf, 0xCu);
      }
      id v23 = 0;
LABEL_9:
      id v24 = (void *)v11;

      goto LABEL_11;
    }
  }
  id v34 = 0;
  int v20 = [(AF2SyncClient *)self _hostSyncPrepareKeybagResponseForRequest:v11 withDeviceCertificate:v10 hwInfoString:v32 deviceType:v14 supportVersion:v16 requestedDSIDs:v31 keyBagResponseData:&v34];
  id v23 = v34;
  if (v20)
  {
    id v21 = _ATLogCategorySyncBundle();
    id v22 = self;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "failed to prepare keybag response data. err=%{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  id v22 = self;
  id v24 = (void *)v11;
LABEL_11:
  id v25 = (void *)v10;
  unsigned int v26 = +[NSMutableDictionary dictionary];
  int v27 = v26;
  if (v23) {
    [v26 setObject:v23 forKey:@"KeybagData"];
  }
  v28 = [v8 responseWithError:v20 parameters:v27];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1328E8;
  v33[3] = &unk_160300;
  v33[4] = v22;
  [v30 sendResponse:v28 withCompletion:v33];
}

- (id)_initiateKeybagRequestOnMessageLink:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v24 = 0;
  id v6 = [(AF2SyncClient *)self _getDeviceCertificate:&v24];
  id v7 = v24;
  if (v6) {
    goto LABEL_14;
  }
  [v5 setObject:v7 forKey:@"DeviceCert"];
  uint64_t v8 = [(AF2SyncClient *)self _getHWInfoString];
  DeviceKeyTypeSupport v9 = [(AF2SyncClient *)self _getDeviceKeyTypeSupportInfo];
  unint64_t v10 = HIDWORD(*(unint64_t *)&v9);
  [v5 setObject:v8 forKey:@"HWInfoString"];
  uint64_t v11 = +[NSNumber numberWithUnsignedInt:v9];
  [v5 setObject:v11 forKey:@"KeyTypeDeviceType"];

  uint64_t v12 = +[NSNumber numberWithUnsignedInt:v10];
  [v5 setObject:v12 forKey:@"KeyTypeVersion"];

  id v13 = [(AF2SyncClient *)self _getKeybagAccountIds];
  [v5 setObject:v13 forKey:@"AccountDSIDs"];
  id v23 = 0;
  id v6 = [(AF2SyncClient *)self _generateKeybagRequest:&v23];
  id v14 = v23;
  if (!v6)
  {
    uint32_t v15 = [v4 signatureProvider];
    id v16 = v15;
    if (v15)
    {
      id v22 = 0;
      id v6 = [v15 createSignature:&v22 forData:v14];
      id v17 = v22;
      if (v6)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v17 = 0;
    }
    if (v14) {
      [v5 setObject:v14 forKey:@"KeybagData"];
    }
    if (v17) {
      [v5 setObject:v17 forKey:@"KeybagSig"];
    }
    id v6 = 0;
    goto LABEL_12;
  }
LABEL_13:

  if (!v6)
  {
    id v18 = [objc_alloc((Class)ATRequest) initWithCommand:@"SyncKeybag" dataClass:@"AirFair2" parameters:v5];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_132CF0;
    v20[3] = &unk_1602D8;
    v20[4] = self;
    id v21 = v4;
    [v21 sendRequest:v18 withCompletion:v20];

    goto LABEL_17;
  }
LABEL_14:
  id v18 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v26 = v6;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "failed to create keybag request. err=%{public}@", buf, 0xCu);
  }
LABEL_17:

  return v6;
}

- (void)_handleBeginKeybagSyncRequest:(id)a3 onMessageLink:(id)a4
{
  id v8 = a4;
  id v6 = [a3 responseWithError:0 parameters:0];
  [v8 sendResponse:v6 withCompletion:0];

  id v7 = [(AF2SyncClient *)self _initiateKeybagRequestOnMessageLink:v8];
}

- (id)_initiateBeginKeybagSyncOnMessageLink:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ATRequest) initWithCommand:@"BeginKeybagSync" dataClass:@"AirFair2" parameters:0];
  [v3 sendRequest:v4 withCompletion:&stru_1602B0];

  return 0;
}

- (void)_handleKeybagSyncRequestNotification:(id)a3
{
}

- (void)_handleContentsChangedNotification:(id)a3
{
}

- (void)_handleDeferredAccountChangeCheckEvent:(id)a3
{
}

- (void)_handleAirTrafficStartedEvent:(id)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  applicationWorkspace = self->_applicationWorkspace;
  self->_applicationWorkspace = v4;

  [(LSApplicationWorkspace *)self->_applicationWorkspace addObserver:self];
  [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleKeybagSyncRequestNotification:" name:@"ATSyncKeybagToPairedDeviceRequestNotification" object:0];
  [(NSNotificationCenter *)self->_notificationCenter addObserver:self selector:"_handleContentsChangedNotification:" name:ML3MusicLibraryContentsDidChangeNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_13303C, @"com.apple.fairplayd.resync-fpkeybag", 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    id v18 = self;
    char v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        buf[0] = 0;
        uint64_t v11 = [v10 bundleURL];
        uint64_t v12 = [v11 path];
        id v13 = [v12 stringByAppendingPathComponent:@"Watch"];

        id v14 = +[NSFileManager defaultManager];
        unsigned __int8 v15 = [v14 fileExistsAtPath:v13 isDirectory:buf];
        if (buf[0]) {
          unsigned __int8 v16 = v15;
        }
        else {
          unsigned __int8 v16 = 0;
        }

        v7 |= v16;
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
    if (v7)
    {
      id v17 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "watchkit app installed - initiating key sync now", buf, 2u);
      }

      [(AF2SyncClient *)v18 _initiateKeybagSyncWithPriority:0];
    }
  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 command];
  unsigned int v9 = [v8 isEqualToString:@"SyncKeybag"];

  if (v9)
  {
    [(AF2SyncClient *)self _handleKeybagRequest:v7 onMessageLink:v6];
  }
  else
  {
    unint64_t v10 = [v7 command];
    unsigned int v11 = [v10 isEqualToString:@"GetClientInfo"];

    if (v11)
    {
      [(AF2SyncClient *)self _handleSubscriptionClientInfoRequest:v7 onMessageLink:v6];
    }
    else
    {
      uint64_t v12 = [v7 command];
      unsigned int v13 = [v12 isEqualToString:@"ImportSubsBag"];

      if (v13)
      {
        [(AF2SyncClient *)self _handleSubscriptionImportSubsBagRequest:v7 onMessageLink:v6];
      }
      else
      {
        id v14 = [v7 command];
        unsigned int v15 = [v14 isEqualToString:@"ProvisionAction"];

        if (v15)
        {
          [(AF2SyncClient *)self _handleProvisioningRequest:v7 onMessageLink:v6];
        }
        else
        {
          unsigned __int8 v16 = [v7 command];
          unsigned int v17 = [v16 isEqualToString:@"BeginKeybagSync"];

          if (v17)
          {
            [(AF2SyncClient *)self _handleBeginKeybagSyncRequest:v7 onMessageLink:v6];
          }
          else
          {
            id v18 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = [v7 command];
              int v22 = 138543362;
              long long v23 = v19;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "received unknown request %{public}@", (uint8_t *)&v22, 0xCu);
            }
            long long v20 = +[NSError errorWithDomain:@"ATError" code:23 userInfo:0];
            long long v21 = [v7 responseWithError:v20 parameters:0];
            [v6 sendResponse:v21 withCompletion:0];
          }
        }
      }
    }
  }
}

- (void)messageLinkWasClosed:(id)a3
{
  id v5 = (ATConcreteMessageLink *)a3;
  [(AF2SyncClient *)self _destroyFairPlayContext];
  id v4 = v5;
  if (self->_currentMessageLink == v5)
  {
    self->_currentMessageLink = 0;

    id v4 = v5;
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v5 = a3;
  if (![v5 endpointType]) {
    id v4 = [(AF2SyncClient *)self _initiateKeybagRequestOnMessageLink:v5];
  }
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4 = a3;
  [v4 addRequestHandler:self forDataClass:@"AirFair2"];
  currentMessageLink = self->_currentMessageLink;
  self->_currentMessageLink = (ATConcreteMessageLink *)v4;
}

- (void)dealloc
{
  [(AF2SyncClient *)self _destroyFairPlayContext];
  [(AF2SyncClient *)self _destroyProvisioningContext];
  [(LSApplicationWorkspace *)self->_applicationWorkspace removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)AF2SyncClient;
  [(AF2SyncClient *)&v3 dealloc];
}

- (AF2SyncClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)AF2SyncClient;
  int v2 = [(AF2SyncClient *)&v12 init];
  objc_super v3 = v2;
  if (v2)
  {
    currentSyncedAccountIds = v2->_currentSyncedAccountIds;
    *(void *)&v2->_unsigned int fpContextId = 0;
    v2->_currentSyncedAccountIds = 0;

    v3->_lastAccountChangeCheckTime = 0.0;
    uint64_t v5 = +[ICMusicSubscriptionFairPlayController sharedController];
    subscriptionFairPlayController = v3->_subscriptionFairPlayController;
    v3->_subscriptionFairPlayController = (ICMusicSubscriptionFairPlayController *)v5;

    uint64_t v7 = +[ICMusicSubscriptionStatusController sharedStatusController];
    subscriptionStatusController = v3->_subscriptionStatusController;
    v3->_subscriptionStatusController = (ICMusicSubscriptionStatusController *)v7;

    uint64_t v9 = +[NSNotificationCenter defaultCenter];
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = (NSNotificationCenter *)v9;

    [(NSNotificationCenter *)v3->_notificationCenter addObserver:v3 selector:"_handleAirTrafficStartedEvent:" name:ATStartupCompleteNotification object:0];
    [(NSNotificationCenter *)v3->_notificationCenter addObserver:v3 selector:"_handleDeferredAccountChangeCheckEvent:" name:@"kAF2DeferredAccountChangeCheckTimerEvent" object:0];
  }
  return v3;
}

- (id)supportedDataclasses
{
  return &off_1609F0;
}

@end