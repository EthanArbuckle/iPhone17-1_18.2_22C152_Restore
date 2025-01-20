@interface NIServerFindableDeviceProxySessionManager
+ (id)sharedInstance;
+ (int)_queryNumPairedFinderWatches_r121951698;
- (BOOL)_isTokenFindable:(id)a3;
- (BOOL)_shouldApplyBTScanMitigation_r121951698;
- (BOOL)_shouldHoldOSTransactionWhileFindable;
- (BOOL)_shouldInteract;
- (BOOL)supportsCameraAssistance;
- (id).cxx_construct;
- (id)_enableInteractionWithPersistedTokens;
- (id)_initInternal;
- (id)_internalPrepareTokenCache;
- (id)_internalPrintableState;
- (id)_internalSetFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4 logInEventBuffer:(BOOL)a5;
- (id)_setTokenCacheForGroup:(id)a3;
- (id)_tokensFromAllGroups;
- (id)findableDiscoveryTokensForGroup:(id)a3;
- (id)getQueueForInputingData;
- (id)interactingFinderDiscoveryTokensForGroup:(id)a3;
- (id)printableState;
- (id)setFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (id)setLocalDeviceDebugParameters:(id)a3;
- (id)startBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (id)stopBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (int)_selectedTechnology;
- (void)DataCallback:(id)a3;
- (void)_activateAssertionsWhileFindable;
- (void)_activateAssertionsWhileInteracting;
- (void)_activateProvidersLazy;
- (void)_activateSensors;
- (void)_advertiseAndRangeWithPeer:(id)a3 peerAdvertisement:(id)a4;
- (void)_configureKeepAliveTimeoutForPeer:(id)a3 useCase:(int)a4 isKeepAliveBluetooth:(BOOL)a5;
- (void)_deactivateAssertionsWhileFindable;
- (void)_deactivateAssertionsWhileInteracting;
- (void)_deactivateSensors;
- (void)_disableInteractionAndKeepPersistedTokens;
- (void)_handleRangingTerminatedCallbackForPeer:(id)a3;
- (void)_kickKeepAliveForPeer:(id)a3;
- (void)_nanoRegistryDevicePairingChanged_r121951698:(id)a3;
- (void)_nearbydLogRange:(double)a3 token:(id)a4;
- (void)_setUpAlgorithmsContainerForToken:(id)a3;
- (void)_startAltitudeUpdates;
- (void)_startDeviceMotionUpdates;
- (void)_startDevicePDRUpdates;
- (void)_startMotionActivityUpdates;
- (void)_startPedometerDataUpdates;
- (void)_startPedometerEventUpdates;
- (void)_tearDownAlgorithmsContainerForToken:(id)a3;
- (void)_updatePeerTrackingForToken:(id)a3 newAdvertisingState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newDiscoveryState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newNbUwbAcquisitionChannelIdx:(id)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newRangingState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newTrackingState:(id)a4;
- (void)_updateReceivedSignalFlags:(unsigned __int8)a3 toPeerTrackingForToken:(id)a4;
- (void)addObserver:(id)a3;
- (void)bluetoothDiscoveryBecameAvailable;
- (void)bluetoothDiscoveryBecameUnavailable;
- (void)bluetoothDiscoveryFinishedActivating;
- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4;
- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5;
- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4;
- (void)didLosePeer:(id)a3;
- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4;
- (void)didRangingAuthorizationFailForPeer:(id)a3;
- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5;
- (void)didStopAdvertisingToPeer:(id)a3;
- (void)didStopRangingWithPeer:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)notifyDeviceUnlockedSinceBoot;
- (void)processClientDiscoveryEventForToken:(id)a3 sharedConfigurationData:(id)a4;
- (void)processClientRemovePeerEventForToken:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)rangingBecameAvailable;
- (void)rangingBecameUnavailable;
- (void)removeObserver:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5;
@end

@implementation NIServerFindableDeviceProxySessionManager

+ (id)sharedInstance
{
  if (qword_1008A44E8 != -1) {
    dispatch_once(&qword_1008A44E8, &stru_100858D28);
  }
  v2 = (void *)qword_1008A44E0;

  return v2;
}

- (void)notifyDeviceUnlockedSinceBoot
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,notifyDeviceUnlockedSinceBoot", buf, 2u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E29C8;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)_internalPrepareTokenCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (self->_preparedTokenCache)
    {
      id v3 = 0;
      goto LABEL_34;
    }
    v5 = +[NSUserDefaults standardUserDefaults];
    [v5 removeObjectForKey:@"FindingLocalDeviceLastUnlockUUID"];

    memset(v41, 0, sizeof(v41));
    size_t v30 = 37;
    if (sysctlbyname("kern.bootsessionuuid", v41, &v30, 0, 0))
    {
      v6 = 0;
    }
    else
    {
      v6 = +[NSString stringWithUTF8String:v41];
    }
    v7 = +[NSUserDefaults standardUserDefaults];
    v8 = [v7 stringForKey:@"FindableDeviceProxyTokenCacheBootUUID"];

    if (v6)
    {
      if (v8) {
        unsigned int v9 = [v8 isEqualToString:v6] ^ 1;
      }
      else {
        unsigned int v9 = 1;
      }
      v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-proxy,Prepare token cache (once per launch). First time after reboot: %d", buf, 8u);
      }
      if (!v9)
      {
        v16 = +[NIServerKeychainManager sharedInstance];
        v10 = [v16 readAllItemsWithService:@"FindingTokens" synchronizable:0 systemKeychain:0];

        *(void *)buf = 0;
        v32 = buf;
        uint64_t v33 = 0x3032000000;
        v34 = sub_1001E3110;
        v35 = sub_1001E3120;
        id v36 = 0;
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x2020000000;
        int v29 = 0;
        uint64_t v22 = 0;
        v23 = &v22;
        uint64_t v24 = 0x2020000000;
        int v25 = 0;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1001E3128;
        v21[3] = &unk_100858D50;
        v21[4] = self;
        v21[5] = buf;
        v21[6] = &v26;
        v21[7] = &v22;
        [v10 enumerateObjectsUsingBlock:v21];
        if (*((void *)v32 + 5))
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
            sub_10041C1E0();
          }
          v17 = +[NSString stringWithFormat:@"Prepare token cache: error restoring from cache: %@", *((void *)v32 + 5)];
          sub_1002E11D4(v17, &self->_tokenEventLogBuffer.__map_.__first_);

          id v3 = *((id *)v32 + 5);
        }
        else
        {
          v18 = +[NSUserDefaults standardUserDefaults];
          [v18 setObject:v6 forKey:@"FindableDeviceProxyTokenCacheBootUUID"];

          self->_preparedTokenCache = 1;
          v19 = +[NSString stringWithFormat:@"Prepare token cache: restore success (%d groups, %d tokens)", *((unsigned int *)v27 + 6), *((unsigned int *)v23 + 6)];
          sub_1002E11D4(v19, &self->_tokenEventLogBuffer.__map_.__first_);

          id v3 = 0;
        }
        _Block_object_dispose(&v22, 8);
        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_32;
      }
      v13 = +[NIServerKeychainManager sharedInstance];
      unsigned __int8 v14 = [v13 deleteAllItemsWithService:@"FindingTokens" synchronizable:0 systemKeychain:0];

      if (v14)
      {
        v15 = +[NSUserDefaults standardUserDefaults];
        [v15 setObject:v6 forKey:@"FindableDeviceProxyTokenCacheBootUUID"];

        self->_preparedTokenCache = 1;
        sub_1002E11D4(@"Prepare token cache: reset success", &self->_tokenEventLogBuffer.__map_.__first_);
        id v3 = 0;
LABEL_33:

        goto LABEL_34;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041C1AC();
      }
      sub_1002E11D4(@"Prepare token cache: reset failed", &self->_tokenEventLogBuffer.__map_.__first_);
      NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v38 = @"Prepare token cache: reset failed";
      v10 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041C178();
      }
      sub_1002E11D4(@"Prepare token cache: could not get current boot UUID", &self->_tokenEventLogBuffer.__map_.__first_);
      NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v40 = @"Prepare token cache: could not get current boot UUID";
      v10 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    }
    id v3 = (id)v11;
LABEL_32:

    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10041C250();
  }
  sub_1002E11D4(@"Prepare token cache: not ready", &self->_tokenEventLogBuffer.__map_.__first_);
  NSErrorUserInfoKey v42 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v43 = @"Prepare token cache: not ready";
  v4 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  id v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v4];

LABEL_34:

  return v3;
}

- (id)_internalSetFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4 logInEventBuffer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v44 = a4;
  v41 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v52 = 0;
  v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_1001E3110;
  v56 = sub_1001E3120;
  id v57 = 0;
  [(NIServerFindableDeviceProxySessionManager *)self _activateProvidersLazy];
  CFStringRef v40 = +[NSSet setWithArray:v8];
  NSErrorUserInfoKey v39 = [(NSMutableDictionary *)self->_groupedFindableTokens objectForKey:v44];
  BOOL v42 = v5;
  CFStringRef v38 = objc_opt_new();
  unsigned int v9 = objc_opt_new();
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001E3A58;
  v49[3] = &unk_100858D78;
  id v10 = v40;
  id v50 = v10;
  id v11 = v38;
  id v51 = v11;
  [v39 enumerateObjectsUsingBlock:v49];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001E3ACC;
  v46[3] = &unk_100858D78;
  id v43 = v39;
  id v47 = v43;
  id v12 = v9;
  id v48 = v12;
  [v10 enumerateObjectsUsingBlock:v46];
  v13 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v14 = [v10 allObjects];
    v15 = sub_1002E15E0(v14, 10, 0);
    *(_DWORD *)buf = 138478083;
    id v59 = v44;
    __int16 v60 = 2113;
    v61 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-proxy,_internalSetFindableDiscoveryTokens. Group: %{private}@. New tokens: %{private}@", buf, 0x16u);
  }
  v16 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v43 allObjects];
    v18 = sub_1002E15E0(v17, 10, 0);
    *(_DWORD *)buf = 138477827;
    id v59 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-proxy,Old tokens: %{private}@.", buf, 0xCu);
  }
  v19 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v12 allObjects];
    v21 = sub_1002E15E0(v20, 10, 0);
    *(_DWORD *)buf = 138477827;
    id v59 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-proxy,Tokens added: %{private}@.", buf, 0xCu);
  }
  uint64_t v22 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v11 allObjects];
    uint64_t v24 = sub_1002E15E0(v23, 10, 0);
    *(_DWORD *)buf = 138477827;
    id v59 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-proxy,Tokens removed: %{private}@.", buf, 0xCu);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1001E3B40;
  v45[3] = &unk_100858DA0;
  v45[4] = self;
  v45[5] = &v52;
  [v11 enumerateObjectsUsingBlock:v45];
  id v25 = [v10 count];
  groupedFindableTokens = self->_groupedFindableTokens;
  if (v25)
  {
    id v27 = [v10 mutableCopy];
    [(NSMutableDictionary *)groupedFindableTokens setObject:v27 forKey:v44];
  }
  else
  {
    [(NSMutableDictionary *)self->_groupedFindableTokens removeObjectForKey:v44];
  }
  uint64_t v28 = [(NIServerFindableDeviceProxySessionManager *)self _setTokenCacheForGroup:v44];
  if (v28)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041C2EC();
    }
    objc_storeStrong(v53 + 5, v28);
  }
  if ([(NIServerFindableDeviceProxySessionManager *)self _shouldInteract])
  {
    int v29 = [(NIServerFindableDeviceProxySessionManager *)self _enableInteractionWithPersistedTokens];
    if (v29)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041C284();
      }
      objc_storeStrong(v53 + 5, v29);
    }
  }
  if ([(NIServerFindableDeviceProxySessionManager *)self _shouldHoldOSTransactionWhileFindable])
  {
    if ([(NSMutableDictionary *)self->_groupedFindableTokens count]) {
      [(NIServerFindableDeviceProxySessionManager *)self _activateAssertionsWhileFindable];
    }
    else {
      [(NIServerFindableDeviceProxySessionManager *)self _deactivateAssertionsWhileFindable];
    }
  }
  if (v42)
  {
    id v30 = [v12 count];
    if ((char *)[v11 count] + (void)v30)
    {
      id v31 = [v10 count];
      id v32 = [v43 count];
      id v33 = [v12 count];
      id v34 = [v11 count];
      v35 = +[NSString stringWithFormat:@"Set tokens. Group: %@. New: %d. Old: %d. Added: %d. Removed: %d. Error: %@", v44, v31, v32, v33, v34, v53[5]];
      sub_1002E11D4(v35, &self->_tokenEventLogBuffer.__map_.__first_);
    }
  }
  id v36 = v53[5];

  _Block_object_dispose(&v52, 8);

  return v36;
}

- (id)setFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,setFindableDiscoveryTokens (%d tokens). Group: %{private}@", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&long long v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001E3110;
  v21 = sub_1001E3120;
  id v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E3E9C;
  v14[3] = &unk_100858DC8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v17 = buf;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (id)startBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,startBeingFindableWithDiscoveryTokens (%d tokens to add). Group: %{private}@", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&long long v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001E3110;
  v21 = sub_1001E3120;
  id v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E413C;
  v14[3] = &unk_100858DC8;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (id)stopBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,stopBeingFindableWithDiscoveryTokens (%d tokens to remove). Group: %{private}@", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&long long v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001E3110;
  v21 = sub_1001E3120;
  id v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E447C;
  v14[3] = &unk_100858DC8;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (id)setLocalDeviceDebugParameters:(id)a3
{
  id v4 = a3;
  BOOL v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,setLocalDeviceDebugParameters", buf, 2u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E46EC;
  v9[3] = &unk_100846588;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);

  return 0;
}

- (void)processClientDiscoveryEventForToken:(id)a3 sharedConfigurationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E47F4;
  block[3] = &unk_100855EB0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processClientRemovePeerEventForToken:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E4BE8;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (id)findableDiscoveryTokensForGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,findableDiscoveryTokensForGroup: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001E3110;
  id v16 = sub_1001E3120;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E4ED0;
  block[3] = &unk_100856FA8;
  id v11 = v4;
  p_long long buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

- (id)interactingFinderDiscoveryTokensForGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,interactingFinderDiscoveryTokensForGroup: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001E3110;
  id v16 = sub_1001E3120;
  id v17 = (id)objc_opt_new();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E5114;
  block[3] = &unk_100858E40;
  block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E5320;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E5648;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (id)printableState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001E3110;
  id v10 = sub_1001E3120;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E57C8;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = sub_1001E3110;
  v90 = sub_1001E3120;
  id v91 = (id)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (void *)v87[5];
  BOOL v5 = +[NSDate now];
  uint64_t v6 = sub_1002E10F4(v5);
  id v7 = sub_1002E10F4(self->_initDate);
  [(NSDate *)self->_initDate timeIntervalSinceNow];
  id v9 = +[NSString stringWithFormat:@"Now: %@. Init: %@. Runtime: %.0f s. Cache: %d. Observers: %d", v6, v7, -v8, self->_preparedTokenCache, [(NSHashTable *)self->_observers count]];
  [v4 addObject:v9];

  id v10 = (void *)v87[5];
  id v11 = +[NSString stringWithFormat:@"Sensors: %d. Assertions: OST-interacting %d, PA-interacting %d, OST-findable %d.", self->_sensorsOn, self->_osTransactionWhileInteracting != 0, self->_powerAssertionWhileInteracting != 0, self->_osTransactionWhileFindable != 0];
  [v10 addObject:v11];

  id v12 = (void *)v87[5];
  id v13 = +[NSString stringWithFormat:@"BT available: %d. Ranging available: %d. Should interact: %d.", self->_bluetoothDiscoveryAvailable, self->_rangingAvailable, [(NIServerFindableDeviceProxySessionManager *)self _shouldInteract]];
  [v12 addObject:v13];

  uint64_t v14 = (void *)v87[5];
  id v15 = +[NSString stringWithFormat:@"Paired finder watches: %d. Should apply BT scan mitigation [r121951698]: %d.", self->_numPairedFinderWatches_r121951698, [(NIServerFindableDeviceProxySessionManager *)self _shouldApplyBTScanMitigation_r121951698]];
  [v14 addObject:v15];

  id v16 = (void *)v87[5];
  id v17 = +[NSString stringWithFormat:@"Findable tokens (%d groups)", [(NSMutableDictionary *)self->_groupedFindableTokens count]];
  [v16 addObject:v17];

  groupedFindableTokens = self->_groupedFindableTokens;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1001E6278;
  v85[3] = &unk_100858E90;
  v85[4] = &v86;
  [(NSMutableDictionary *)groupedFindableTokens enumerateKeysAndObjectsUsingBlock:v85];
  long long v19 = (void *)v87[5];
  v20 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider printableState];
  [v19 addObjectsFromArray:v20];

  v21 = (void *)v87[5];
  id v22 = [(NIServerFindingRangingProvider *)self->_rangingProvider printableState];
  [v21 addObjectsFromArray:v22];

  v23 = (void *)v87[5];
  uint64_t v24 = +[NSString stringWithFormat:@"Tracking state for %d peers", [(NSMutableDictionary *)self->_peerTracking count]];
  [v23 addObject:v24];

  peerTracking = self->_peerTracking;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1001E63A0;
  v84[3] = &unk_100858EB8;
  v84[4] = &v86;
  [(NSMutableDictionary *)peerTracking enumerateKeysAndObjectsUsingBlock:v84];
  uint64_t v26 = (void *)v87[5];
  id v27 = +[NSString stringWithFormat:@"Algorithm containers for %d peers", [(NSMutableDictionary *)self->_peerAlgorithmContainers count]];
  [v26 addObject:v27];

  uint64_t v28 = (void *)v87[5];
  int v29 = [(NSMutableDictionary *)self->_peerAlgorithmContainers allKeys];
  id v30 = sub_1002E15E0(v29, 10, 1);
  [v28 addObjectsFromArray:v30];

  id v31 = (void *)v87[5];
  id v32 = +[NSString stringWithFormat:@"Keep-alives for %d peers", [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds count]];
  [v31 addObject:v32];

  keepAliveTimeoutsSeconds = self->_keepAliveTimeoutsSeconds;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1001E6490;
  v83[3] = &unk_100858EE0;
  v83[4] = &v86;
  [(NSMutableDictionary *)keepAliveTimeoutsSeconds enumerateKeysAndObjectsUsingBlock:v83];
  id v34 = (void *)v87[5];
  v35 = +[NSString stringWithFormat:@"Last discovery event: %@", self->_lastDiscoveryEvent];
  [v34 addObject:v35];

  id v36 = (void *)v87[5];
  NSErrorUserInfoKey v37 = +[NSString stringWithFormat:@"Last range measurement: %@", self->_lastRangingMeasurement];
  [v36 addObject:v37];

  CFStringRef v38 = (void *)v87[5];
  NSErrorUserInfoKey v39 = +[NSString stringWithFormat:@"Last range poll: %@", self->_lastRangingPoll];
  [v38 addObject:v39];

  CFStringRef v40 = (void *)v87[5];
  v41 = +[NSString stringWithFormat:@"Token events (max %d)", self->_tokenEventLogBuffer.__size_.__value_];
  [v40 addObject:v41];

  begin = self->_tokenEventLogBuffer.__map_.__begin_;
  if (self->_tokenEventLogBuffer.__map_.__end_ != begin)
  {
    unint64_t start = self->_tokenEventLogBuffer.__start_;
    unint64_t v44 = (unint64_t)begin[start / 0xAA] + 24 * (start % 0xAA);
    unint64_t v45 = (unint64_t)begin[(self->_tokenEventLogBuffer.__size_.__value_ + start) / 0xAA]
        + 24 * ((self->_tokenEventLogBuffer.__size_.__value_ + start) % 0xAA);
    if (v44 != v45)
    {
      v46 = &begin[start / 0xAA];
      do
      {
        if (*(char *)(v44 + 23) < 0)
        {
          sub_100002DE4(__p, *(void **)v44, *(void *)(v44 + 8));
        }
        else
        {
          long long v47 = *(_OWORD *)v44;
          uint64_t v82 = *(void *)(v44 + 16);
          *(_OWORD *)__p = v47;
        }
        if (SHIBYTE(v82) < 0)
        {
          if (!__p[1]) {
            goto LABEL_13;
          }
          v49 = v87;
          id v48 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v82)) {
            goto LABEL_14;
          }
          id v48 = __p;
          v49 = v87;
        }
        id v50 = (void *)v49[5];
        id v51 = +[NSString stringWithFormat:@"    %s", v48];
        [v50 addObject:v51];

        if (SHIBYTE(v82) < 0) {
LABEL_13:
        }
          operator delete(__p[0]);
LABEL_14:
        v44 += 24;
        if (v44 - (void)*v46 == 4080)
        {
          unint64_t v52 = (unint64_t)v46[1];
          ++v46;
          unint64_t v44 = v52;
        }
      }
      while (v44 != v45);
    }
  }
  v53 = (void *)v87[5];
  uint64_t v54 = +[NSString stringWithFormat:@"Session events (max %d)", self->_sessionEventLogBuffer.__size_.__value_];
  [v53 addObject:v54];

  v55 = self->_sessionEventLogBuffer.__map_.__begin_;
  if (self->_sessionEventLogBuffer.__map_.__end_ != v55)
  {
    unint64_t v56 = self->_sessionEventLogBuffer.__start_;
    unint64_t v57 = (unint64_t)v55[v56 / 0xAA] + 24 * (v56 % 0xAA);
    unint64_t v58 = (unint64_t)v55[(self->_sessionEventLogBuffer.__size_.__value_ + v56) / 0xAA]
        + 24 * ((self->_sessionEventLogBuffer.__size_.__value_ + v56) % 0xAA);
    if (v57 != v58)
    {
      id v59 = &v55[v56 / 0xAA];
      do
      {
        if (*(char *)(v57 + 23) < 0)
        {
          sub_100002DE4(__p, *(void **)v57, *(void *)(v57 + 8));
        }
        else
        {
          long long v60 = *(_OWORD *)v57;
          uint64_t v82 = *(void *)(v57 + 16);
          *(_OWORD *)__p = v60;
        }
        if (SHIBYTE(v82) < 0)
        {
          if (!__p[1]) {
            goto LABEL_29;
          }
          v62 = v87;
          v61 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v82)) {
            goto LABEL_30;
          }
          v61 = __p;
          v62 = v87;
        }
        v63 = (void *)v62[5];
        v64 = +[NSString stringWithFormat:@"    %s", v61];
        [v63 addObject:v64];

        if (SHIBYTE(v82) < 0) {
LABEL_29:
        }
          operator delete(__p[0]);
LABEL_30:
        v57 += 24;
        if (v57 - (void)*v59 == 4080)
        {
          unint64_t v65 = (unint64_t)v59[1];
          ++v59;
          unint64_t v57 = v65;
        }
      }
      while (v57 != v58);
    }
  }
  v66 = (void *)v87[5];
  v67 = +[NSString stringWithFormat:@"Misc events (max %d)", self->_miscEventLogBuffer.__size_.__value_];
  [v66 addObject:v67];

  v68 = self->_miscEventLogBuffer.__map_.__begin_;
  if (self->_miscEventLogBuffer.__map_.__end_ != v68)
  {
    unint64_t v69 = self->_miscEventLogBuffer.__start_;
    unint64_t v70 = (unint64_t)v68[v69 / 0xAA] + 24 * (v69 % 0xAA);
    unint64_t v71 = (unint64_t)v68[(self->_miscEventLogBuffer.__size_.__value_ + v69) / 0xAA]
        + 24 * ((self->_miscEventLogBuffer.__size_.__value_ + v69) % 0xAA);
    if (v70 != v71)
    {
      v72 = &v68[v69 / 0xAA];
      do
      {
        if (*(char *)(v70 + 23) < 0)
        {
          sub_100002DE4(__p, *(void **)v70, *(void *)(v70 + 8));
        }
        else
        {
          long long v73 = *(_OWORD *)v70;
          uint64_t v82 = *(void *)(v70 + 16);
          *(_OWORD *)__p = v73;
        }
        if (SHIBYTE(v82) < 0)
        {
          if (!__p[1]) {
            goto LABEL_45;
          }
          v75 = v87;
          v74 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v82)) {
            goto LABEL_46;
          }
          v74 = __p;
          v75 = v87;
        }
        v76 = (void *)v75[5];
        v77 = +[NSString stringWithFormat:@"    %s", v74];
        [v76 addObject:v77];

        if (SHIBYTE(v82) < 0) {
LABEL_45:
        }
          operator delete(__p[0]);
LABEL_46:
        v70 += 24;
        if (v70 - (void)*v72 == 4080)
        {
          unint64_t v78 = (unint64_t)v72[1];
          ++v72;
          unint64_t v70 = v78;
        }
      }
      while (v70 != v71);
    }
  }
  id v79 = (id)v87[5];
  _Block_object_dispose(&v86, 8);

  return v79;
}

- (id)_initInternal
{
  id v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,_initInternal", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)NIServerFindableDeviceProxySessionManager;
  id v4 = [(NIServerFindableDeviceProxySessionManager *)&v12 init];
  if (v4)
  {
    BOOL v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nearbyd.finding.proxy-session", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    double v8 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E669C;
    block[3] = &unk_1008473B0;
    id v11 = v4;
    dispatch_sync(v8, block);
  }
  return v4;
}

- (void)_activateSensors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sensorsOn)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,turning on sensors for findee algorithms.", buf, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NILocalDeviceActivatingSensors", 0, 0, 1u);
    if ([(NIServerFindableDeviceProxySessionManager *)self supportsCameraAssistance])
    {
      BOOL v5 = +[NIServerVisionDataDistributor sharedProvider];
      [v5 registerForVisionInput:self];
    }
    dispatch_queue_t v6 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    motionManager = self->_motionManager;
    self->_motionManager = v6;

    if (self->_motionManager)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _startDeviceMotionUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C528();
    }
    double v8 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = v8;

    if (self->_altimeterManager)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _startAltitudeUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C4F4();
    }
    id v10 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = v10;

    if (self->_pedometerManager)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _startPedometerDataUpdates];
      [(NIServerFindableDeviceProxySessionManager *)self _startPedometerEventUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C4C0();
    }
    objc_super v12 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = v12;

    if (self->_motionActivityManager)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _startMotionActivityUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C48C();
    }
    uint64_t v14 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
    pdrManager = self->_pdrManager;
    self->_pdrManager = v14;

    if (self->_pdrManager)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _startDevicePDRUpdates];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C458();
    }
    id v16 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/FMF.framework" delegate:self onQueue:self->_queue];
    locationManager = self->_locationManager;
    self->_locationManager = v16;

    v18 = self->_locationManager;
    if (v18)
    {
      [(CLLocationManager *)v18 setActivityType:3];
      [(CLLocationManager *)self->_locationManager setDistanceFilter:kCLDistanceFilterNone];
      [(CLLocationManager *)self->_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
      [(CLLocationManager *)self->_locationManager setDelegate:self];
      [(CLLocationManager *)self->_locationManager startUpdatingLocation];
      long long v19 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-proxy,startUpdatingLocation", v23, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
    {
      sub_10041C424();
    }
    id v20 = [objc_alloc((Class)NSBundle) initWithPath:@"/System/Library/PrivateFrameworks/FMF.framework"];
    if (!self->_gnssExtensionsManager)
    {
      v21 = [[NIGnssExtensionsManager alloc] initWithQueue:self->_queue bundle:v20 reason:@"NIServerFindableDeviceProxySessionManager"];
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v21;

      [(NIGnssExtensionsManager *)self->_gnssExtensionsManager setDelegate:self];
    }
    self->_sensorsOn = 1;
  }
}

- (void)_deactivateSensors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_sensorsOn)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,turning off sensors for findee algorithms.  ", v14, 2u);
    }
    [(CMAltimeter *)self->_altimeterManager stopRelativeAltitudeUpdates];
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = 0;

    [(CMPedometer *)self->_pedometerManager stopPedometerUpdates];
    [(CMPedometer *)self->_pedometerManager stopPedometerEventUpdates];
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = 0;

    [(CMMotionActivityManager *)self->_motionActivityManager stopActivityUpdates];
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
    motionManager = self->_motionManager;
    self->_motionManager = 0;

    [(CMOdometryManager *)self->_pdrManager stopOdometryUpdates];
    pdrManager = self->_pdrManager;
    self->_pdrManager = 0;

    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    [(CLLocationManager *)self->_locationManager setDelegate:0];
    locationManager = self->_locationManager;
    self->_locationManager = 0;

    gnssExtensionsManager = self->_gnssExtensionsManager;
    if (gnssExtensionsManager)
    {
      [(NIGnssExtensionsManager *)gnssExtensionsManager invalidate];
      id v11 = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = 0;
    }
    if ([(NIServerFindableDeviceProxySessionManager *)self supportsCameraAssistance])
    {
      objc_super v12 = +[NIServerVisionDataDistributor sharedProvider];
      [v12 unregisterForVisionInput:self];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NILocalDeviceDeactivatingSensors", 0, 0, 1u);
    self->_sensorsOn = 0;
  }
}

- (void)_activateAssertionsWhileFindable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_osTransactionWhileFindable)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate OS transaction while findable", v6, 2u);
    }
    id v4 = (OS_os_transaction *)os_transaction_create();
    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = v4;

    if (!self->_osTransactionWhileFindable && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C55C();
    }
  }
}

- (void)_deactivateAssertionsWhileFindable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_osTransactionWhileFindable)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate OS transaction (no longer findable)", v5, 2u);
    }
    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = 0;
  }
}

- (void)_activateAssertionsWhileInteracting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_osTransactionWhileInteracting)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate OS transaction while interacting", buf, 2u);
    }
    id v4 = (OS_os_transaction *)os_transaction_create();
    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = v4;

    if (!self->_osTransactionWhileInteracting && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C608();
    }
  }
  unsigned int powerAssertionWhileInteracting = self->_powerAssertionWhileInteracting;
  p_unsigned int powerAssertionWhileInteracting = &self->_powerAssertionWhileInteracting;
  if (!powerAssertionWhileInteracting)
  {
    double v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate power assertion while interacting", v11, 2u);
    }
    IOReturn v9 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.nearbyd.finding.proxy-session.while-interacting", p_powerAssertionWhileInteracting);
    if (v9 || !*p_powerAssertionWhileInteracting)
    {
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041C590(v9, v10);
      }
      unsigned int *p_powerAssertionWhileInteracting = 0;
    }
  }
}

- (void)_deactivateAssertionsWhileInteracting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_osTransactionWhileInteracting)
  {
    id v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate OS transaction (no longer interacting)", buf, 2u);
    }
    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = 0;
  }
  if (self->_powerAssertionWhileInteracting)
  {
    BOOL v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)IOReturn v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate power assertion while interacting", v9, 2u);
    }
    IOReturn v6 = IOPMAssertionRelease(self->_powerAssertionWhileInteracting);
    self->_unsigned int powerAssertionWhileInteracting = 0;
    if (v6)
    {
      int v7 = v6;
      double v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041C63C(v7, v8);
      }
    }
  }
}

- (void)_activateProvidersLazy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider activate];
  rangingProvider = self->_rangingProvider;

  [(NIServerFindingRangingProvider *)rangingProvider activate];
}

- (void)_updatePeerTrackingForToken:(id)a3 newDiscoveryState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  IOReturn v6 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
  if (v6)
  {
    int v7 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = +[NIServerFindingPeerTracking peerTrackingInitialState];
  }

  [v8 setDiscoveryState:v4];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v9 newTrackingState:v8];
}

- (void)_updatePeerTrackingForToken:(id)a3 newAdvertisingState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  IOReturn v6 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
  if (v6)
  {
    int v7 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = +[NIServerFindingPeerTracking peerTrackingInitialState];
  }

  [v8 setAdvertisingState:v4];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v9 newTrackingState:v8];
}

- (void)_updatePeerTrackingForToken:(id)a3 newRangingState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  IOReturn v6 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
  if (v6)
  {
    int v7 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = +[NIServerFindingPeerTracking peerTrackingInitialState];
  }

  [v8 setRangingState:v4];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v9 newTrackingState:v8];
}

- (void)_updateReceivedSignalFlags:(unsigned __int8)a3 toPeerTrackingForToken:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  IOReturn v6 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
  if (v6)
  {
    int v7 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v9];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = +[NIServerFindingPeerTracking peerTrackingInitialState];
  }

  [v8 setReceivedSignalFlags:v4];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v9 newTrackingState:v8];
}

- (void)_updatePeerTrackingForToken:(id)a3 newNbUwbAcquisitionChannelIdx:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v10];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v10];
    id v9 = [v8 copy];
  }
  else
  {
    id v9 = +[NIServerFindingPeerTracking peerTrackingInitialState];
  }

  [v9 setNbUwbAcquisitionChannelIdx:v6];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v10 newTrackingState:v9];
}

- (void)_updatePeerTrackingForToken:(id)a3 newTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v7 copy];
  id v9 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
    id v11 = [v10 copy];
  }
  else
  {
    id v10 = +[NIServerFindingPeerTracking peerTrackingInitialState];
    id v11 = v10;
  }

  if ([v11 rangingState] == 3
    && ([v8 rangingState] == 1 || objc_msgSend(v8, "rangingState") == 2))
  {
    [v8 setRangingState:[v11 rangingState]];
  }
  if ([v11 rangingState] == 2 && objc_msgSend(v8, "rangingState") == 1) {
    [v8 setRangingState:[v11 rangingState]];
  }
  if ([v11 discoveryState] == 3
    && ([v8 discoveryState] == 1 || objc_msgSend(v8, "discoveryState") == 2))
  {
    [v8 setDiscoveryState:[v11 discoveryState]];
  }
  if (([v11 isDoingAnything] & 1) == 0
    && ([v8 isDoingAnything] & 1) == 0)
  {
    id v12 = [v11 copy];

    id v8 = v12;
  }
  if ([v11 discoveryState] == 1 && objc_msgSend(v8, "discoveryState") == 2
    || [v11 discoveryState] == 2 && objc_msgSend(v8, "discoveryState") == 1)
  {
    [v8 setDiscoveryState:3];
  }
  if ([v8 hasReceivedRangingData]
    && ([v8 receivedSignalFlags] & 1) != 0)
  {
    [v8 setTellClientAboutPeer:1];
  }
  if (![v8 isDoingAnything]
    || ([v8 receivedSignalFlags] & 1) == 0)
  {
    [v8 setTellClientAboutPeer:0];
  }
  if (([v11 isEqual:v8] & 1) == 0)
  {
    unsigned int v13 = [v8 isDoingAnything];
    peerTracking = self->_peerTracking;
    if (v13) {
      [(NSMutableDictionary *)peerTracking setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)peerTracking removeObjectForKey:v6];
    }
    if (([v11 isDoingAnything] & 1) == 0
      && [v8 isDoingAnything])
    {
      id v15 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        sub_1002E0FD8((uint64_t)"SessionStarted", 0, v6, 0);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);
      }
      id v17 = [v6 descriptionInternal];
      v18 = +[NSString stringWithFormat:@"%@: SessionStarted", v17];
      sub_1002E11D4(v18, &self->_sessionEventLogBuffer.__map_.__first_);
    }
    long long v19 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = +[NSString stringWithFormat:@"Change: %@ -> %@", v11, v8];
      sub_1002E0FD8((uint64_t)"StateChange", 0, v6, v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);
    }
    id v22 = [v6 descriptionInternal];
    v23 = +[NSString stringWithFormat:@"%@: %@", v22, v8];
    p_sessionEventLogBuffer = &self->_sessionEventLogBuffer;
    sub_1002E11D4(v23, &self->_sessionEventLogBuffer.__map_.__first_);

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    uint64_t v46 = 0;
    long long v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    id v25 = self->_peerTracking;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001E85D4;
    v45[3] = &unk_100858F08;
    v45[4] = &buf;
    v45[5] = &v46;
    [(NSMutableDictionary *)v25 enumerateKeysAndObjectsUsingBlock:v45];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      [(NIServerFindableDeviceProxySessionManager *)self _activateAssertionsWhileInteracting];
    }
    if (*((unsigned char *)v47 + 24)) {
      [(NIServerFindableDeviceProxySessionManager *)self _activateSensors];
    }
    else {
      [(NIServerFindableDeviceProxySessionManager *)self _deactivateSensors];
    }
    if (!*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      [(NIServerFindableDeviceProxySessionManager *)self _deactivateAssertionsWhileInteracting];
    }
    if (([v11 isDoingAnything] & 1) == 0
      && [v8 isDoingAnything])
    {
      [(NIServerFindableDeviceProxySessionManager *)self _setUpAlgorithmsContainerForToken:v6];
    }
    if ([v11 isDoingAnything]
      && ([v8 isDoingAnything] & 1) == 0)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _tearDownAlgorithmsContainerForToken:v6];
    }
    if (([v11 hasReceivedRangingData] & 1) == 0
      && [v8 hasReceivedRangingData])
    {
      uint64_t v26 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
      id v27 = [v26 updatesEngine];
      [v27 acceptDiscoveryEventForPeer:v6];

      uint64_t v28 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
      int v29 = [v28 analyticsManager];
      id v30 = +[_FindableDeviceAlgorithmsContainer configurationForContainerObjects];
      [v29 sessionSuccessfullyRanWithConfig:v30 withTimestamp:sub_100006C38()];
    }
    if ([v11 isAttemptingToRange]
      && ([v8 isAttemptingToRange] & 1) == 0)
    {
      [(NIServerFindableDeviceProxySessionManager *)self _tearDownAlgorithmsContainerForToken:v6];
      [(NIServerFindableDeviceProxySessionManager *)self _setUpAlgorithmsContainerForToken:v6];
    }
    if ([v11 discoveryState] || !objc_msgSend(v8, "discoveryState")) {
      goto LABEL_66;
    }
    if ([v8 discoveryState] == 2)
    {
      id v31 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
      id v32 = [v31 analyticsManager];
      [v32 updateWithAcquisitionReason:1];
    }
    else
    {
      if ([v8 discoveryState] != 1) {
        goto LABEL_66;
      }
      id v31 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
      id v32 = [v31 analyticsManager];
      [v32 updateWithAcquisitionReason:3];
    }

LABEL_66:
    if (([v11 tellClientAboutPeer] & 1) == 0
      && [v8 tellClientAboutPeer])
    {
      id v33 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = +[NSString stringWithFormat:@"Sent: %@", @"NILocalDeviceStartedInteractingWithTokenNotification"];
        sub_1002E0FD8((uint64_t)"NotifiedClient", 0, v6, v34);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)id v50 = 138412290;
        id v51 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v50, 0xCu);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NILocalDeviceStartedInteractingWithTokenNotification", 0, 0, 1u);
    }
    if ([v11 tellClientAboutPeer]
      && ([v8 tellClientAboutPeer] & 1) == 0)
    {
      NSErrorUserInfoKey v37 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v38 = +[NSString stringWithFormat:@"Sent: %@", @"NILocalDeviceStoppedInteractingWithTokenNotification"];
        sub_1002E0FD8((uint64_t)"NotifiedClient", 0, v6, v38);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)id v50 = 138412290;
        id v51 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v50, 0xCu);
      }
      CFStringRef v40 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v40, @"NILocalDeviceStoppedInteractingWithTokenNotification", 0, 0, 1u);
    }
    if ([v11 isDoingAnything]
      && ([v8 isDoingAnything] & 1) == 0)
    {
      v41 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        sub_1002E0FD8((uint64_t)"SessionStopped", 0, v6, 0);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)id v50 = 138412290;
        id v51 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v50, 0xCu);
      }
      id v43 = [v6 descriptionInternal];
      unint64_t v44 = +[NSString stringWithFormat:@"%@: SessionStopped", v43];
      sub_1002E11D4(v44, p_sessionEventLogBuffer);
    }
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_advertiseAndRangeWithPeer:(id)a3 peerAdvertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NIServerFindableDeviceProxySessionManager *)self _selectedTechnology];
  BOOL v9 = [(NIServerFindingRangingProvider *)self->_rangingProvider canRangeWithPeer:v6 technology:v8];
  unsigned int v49 = [v7 canRange];
  if (v7) {
    [v7 supportedTechnologies];
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  BOOL v48 = sub_1002E1AE8(__p, v8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  id v10 = [NIServerFindingAdvertisement alloc];
  uint64_t v11 = (uint64_t)[(NIServerFindingDiscoveryProvider *)self->_discoveryProvider advertisingAddress];
  LODWORD(__p[0]) = v11;
  WORD2(__p[0]) = WORD2(v11);
  id v12 = [(NIServerFindingAdvertisement *)v10 initForFinder:0 address:__p];
  [v12 setCanRange:v9];
  [v12 setUseCase:[v7 useCase]];
  unsigned int v13 = operator new(4uLL);
  char v54 = v13;
  _DWORD *v13 = v8;
  v55 = v13 + 1;
  unint64_t v56 = v13 + 1;
  [v12 setSupportedTechnologies:&v54];
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  [v12 setProtocolVersion:1];
  uint64_t v14 = sub_1002F6464();
  uint64_t v15 = *((void *)v14 + 406);
  id v16 = (std::__shared_weak_count *)*((void *)v14 + 407);
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002CE8FC(v15);
  int v17 = sub_1003A8B68((unsigned __int8 **)v53);
  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }
  if (v16) {
    sub_10001A970(v16);
  }
  BOOL v47 = v9;
  if ([v7 narrowBandMask])
  {
    unsigned int v18 = [v7 narrowBandMask];
  }
  else
  {
    long long v19 = operator new(1uLL);
    id v50 = v19;
    unsigned char *v19 = 1;
    id v51 = v19 + 1;
    unint64_t v52 = v19 + 1;
    unsigned int v18 = sub_1003A8B68((unsigned __int8 **)&v50);
    if (v50)
    {
      id v51 = v50;
      operator delete(v50);
    }
  }
  int v20 = v18 & v17;
  [v12 setNarrowBandMask:v18 & v17];
  id v21 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = [v7 narrowBandMask];
    LODWORD(__p[0]) = 67109632;
    HIDWORD(__p[0]) = v22;
    LOWORD(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 2) = v17;
    HIWORD(__p[1]) = 1024;
    LODWORD(__p[2]) = v18 & v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-proxy,Finder nb_mask %hu, findee nb_mask %hu, shared nb_mask %hu", (uint8_t *)__p, 0x14u);
  }

  v23 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
  uint64_t v24 = [v23 nbUwbAcquisitionChannelIdx];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    id v46 = v6;
    uint64_t v26 = +[NSUserDefaults standardUserDefaults];
    id v27 = [v26 objectForKey:@"FindingNapChannel"];

    if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned __int8 v28 = [v27 intValue];
      int v29 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p[0]) = 67109120;
        HIDWORD(__p[0]) = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#find-proxy,Using NAP channel %d from defaults writes", (uint8_t *)__p, 8u);
      }
    }
    else
    {
      id v30 = [v46 getIRK];
      if (!v30) {
        __assert_rtn("_pickRandomNbUwbAcquisitionChannelInGivenRange", "NIServerFindableDeviceProxySessionManager.mm", 2554, "IRK != nil");
      }
      id v31 = v30;
      [v31 bytes];
      unint64_t v32 = SipHash();

      unsigned __int8 v28 = v32 % 7 + 5;
    }

    id v33 = +[NSNumber numberWithInt:v28];
    [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v46 newNbUwbAcquisitionChannelIdx:v33];
  }
  id v34 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
  id v35 = [v34 nbUwbAcquisitionChannelIdx];
  if (!v35) {
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager _advertiseAndRangeWithPeer:peerAdvertisement:]", "NIServerFindableDeviceProxySessionManager.mm", 1435, "[_peerTracking objectForKey:token].nbUwbAcquisitionChannelIdx != nil");
  }

  id v36 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
  NSErrorUserInfoKey v37 = [v36 nbUwbAcquisitionChannelIdx];
  [v12 setNbUwbAcquisitionChannelIdx:v37];

  double v38 = sub_1002E0CF8(@"FindingBTAdvertisingTimeoutSecondsOverride", 120.0);
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v6 newAdvertisingState:1];
  id v39 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider startAdvertisingToPeer:v6 advertisement:v12 timeout:v38];
  if (v39 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10041C71C();
  }
  if (v20) {
    BOOL v40 = v48;
  }
  else {
    BOOL v40 = 0;
  }
  if ((v47 & v49) == 1 && v40)
  {
    [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v6 newRangingState:1];
    v41 = [(NSMutableDictionary *)self->_peerTracking objectForKey:v6];
    id v42 = [v41 nbUwbAcquisitionChannelIdx];
    LOBYTE(__p[0]) = [v42 intValue];
    BYTE1(__p[0]) = v20;

    id v43 = [(NIServerFindingRangingProvider *)self->_rangingProvider startRangingWithPeer:v6 technology:v8 peerAdvertisement:v7 OOBRangingParameters:__p];
    if (v43)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041C6B4();
      }
      [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v6 newRangingState:4];
    }
  }
  else
  {
    unint64_t v44 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v45 = sub_1002E1ABC(v8);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v45;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v47;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v49;
      __int16 v58 = 1024;
      BOOL v59 = v48;
      __int16 v60 = 1024;
      int v61 = v20;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#find-proxy,Not attempting to range (selectedTech: %s). localDeviceCanRange: %d. peerDeviceCanRange: %d. peerDeviceSupportsTech: %d. sharedNBMask: %d", (uint8_t *)__p, 0x24u);
    }
  }
}

- (int)_selectedTechnology
{
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    [(NIServerFindingRangingProvider *)rangingProvider supportedTechnologies];
  }
  else
  {
    __p = 0;
    id v6 = 0;
    uint64_t v7 = 0;
  }
  if (sub_1002E1AE8(&__p, 1))
  {
    int v3 = 1;
  }
  else if (+[NIPlatformInfo isInternalBuild])
  {
    int v3 = 2;
  }
  else
  {
    int v3 = 0;
  }
  if (__p)
  {
    id v6 = __p;
    operator delete(__p);
  }
  return v3;
}

- (id)_setTokenCacheForGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_groupedFindableTokens objectForKey:v4];
  id v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [NIServerKeychainItem alloc];
    uint64_t v8 = [(NSMutableDictionary *)self->_groupedFindableTokens objectForKey:v4];
    BOOL v9 = +[NIDiscoveryToken serialize:v8];
    id v10 = [(NIServerKeychainItem *)v7 initWithService:@"FindingTokens" account:v4 data:v9];

    uint64_t v11 = +[NIServerKeychainManager sharedInstance];
    LOBYTE(v7) = [v11 writeItem:v10 synchronizable:0 systemKeychain:0];

    if (v7)
    {
      id v12 = 0;
    }
    else
    {
      NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v18 = @"Tokens not fully cached";
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v15];
    }
  }
  else
  {
    unsigned int v13 = +[NIServerKeychainManager sharedInstance];
    uint64_t v14 = [v13 deleteItemWithService:@"FindingTokens" account:v4 synchronizable:0 systemKeychain:0];

    if (v14)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v20 = @"Tokens not fully deleted";
    id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v12 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
  }

LABEL_9:

  return v12;
}

- (id)_tokensFromAllGroups
{
  int v3 = objc_opt_new();
  groupedFindableTokens = self->_groupedFindableTokens;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E9318;
  v7[3] = &unk_100858F30;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)groupedFindableTokens enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (BOOL)_isTokenFindable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  groupedFindableTokens = self->_groupedFindableTokens;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E940C;
  v8[3] = &unk_100858F58;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  [(NSMutableDictionary *)groupedFindableTokens enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(groupedFindableTokens) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)groupedFindableTokens;
}

- (BOOL)_shouldHoldOSTransactionWhileFindable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v2 = 1;
  int v3 = sub_1002E0C44(1);
  if (v3 != 19)
  {
    if (v3 != 26) {
      sub_10041C784();
    }
    return 0;
  }
  return v2;
}

- (void)_setUpAlgorithmsContainerForToken:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v7];

  if (!v4)
  {
    peerAlgorithmContainers = self->_peerAlgorithmContainers;
    id v6 = [[_FindableDeviceAlgorithmsContainer alloc] initWithToken:v7 queue:self->_queue delegate:self];
    [(NSMutableDictionary *)peerAlgorithmContainers setObject:v6 forKey:v7];
  }
}

- (void)_tearDownAlgorithmsContainerForToken:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v7];

  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v7];
    id v6 = [v5 updatesEngine];
    [v6 invalidate];

    [(NSMutableDictionary *)self->_peerAlgorithmContainers removeObjectForKey:v7];
  }
}

- (void)_nanoRegistryDevicePairingChanged_r121951698:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E96D0;
  v7[3] = &unk_100846588;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

+ (int)_queryNumPairedFinderWatches_r121951698
{
  BOOL v2 = +[NRPairedDeviceRegistry sharedInstance];
  int v3 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100858F98];

  LODWORD(v2) = [v3 count];
  return (int)v2;
}

- (BOOL)_shouldApplyBTScanMitigation_r121951698
{
  int v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"r121951698_DisableMitigation"];

  if (v4)
  {
    id v5 = qword_1008ABDE0;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: mitigation disabled via defaults write", (uint8_t *)&v18, 2u);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    id v8 = [v7 objectForKey:@"r121951698_TokenGroupOverride"];

    if (v8)
    {
      objc_opt_class();
      id v9 = @"com.apple.findmy.findmylocated";
      if (objc_opt_isKindOfClass())
      {
        id v10 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          *(void *)NSErrorUserInfoKey v19 = @"com.apple.findmy.findmylocated";
          *(_WORD *)&v19[8] = 2112;
          CFStringRef v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: override token group %@ to defaults write %@", (uint8_t *)&v18, 0x16u);
        }
        id v9 = v8;
      }
    }
    else
    {
      id v9 = @"com.apple.findmy.findmylocated";
    }
    uint64_t v11 = [(NIServerFindableDeviceProxySessionManager *)self _tokensFromAllGroups];
    id v12 = [v11 count];

    uint64_t v13 = [(NSMutableDictionary *)self->_groupedFindableTokens objectForKey:v9];
    id v14 = [v13 count];

    BOOL v6 = 0;
    if (v12 == (id)1 && v14 == (id)1) {
      BOOL v6 = self->_numPairedFinderWatches_r121951698 == 0;
    }
    uint64_t v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int numPairedFinderWatches_r121951698 = self->_numPairedFinderWatches_r121951698;
      int v18 = 67109888;
      *(_DWORD *)NSErrorUserInfoKey v19 = v6;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v12;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v14;
      HIWORD(v20) = 1024;
      int v21 = numPairedFinderWatches_r121951698;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: should apply BT scan mitigation: %d. Total tokens: %d. Tokens from group: %d. Paired finder watches: %d", (uint8_t *)&v18, 0x1Au);
    }
  }
  return v6;
}

- (void)_kickKeepAliveForPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds objectForKeyedSubscript:v4];
  if (v5)
  {
    BOOL v6 = [(NSMutableDictionary *)self->_keepAliveTimeoutTimers objectForKey:v4];
    id v7 = v6;
    if (v6)
    {
      dispatch_source_cancel(v6);
      [(NSMutableDictionary *)self->_keepAliveTimeoutTimers removeObjectForKey:v4];
    }
    else
    {
      id v8 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = sub_1002E0FD8((uint64_t)"KeepAlive", 0, v4, @"Started");
        *(_DWORD *)long long buf = 138412290;
        int v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }
    }
    id v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);

    [v5 doubleValue];
    dispatch_time_t v12 = dispatch_time(0, (unint64_t)(v11 * 1000000000.0));
    dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_1001E9F4C;
    NSErrorUserInfoKey v17 = &unk_1008463A0;
    objc_copyWeak(&v19, (id *)buf);
    id v13 = v4;
    id v18 = v13;
    dispatch_source_set_event_handler(v10, &v14);
    dispatch_resume(v10);
    -[NSMutableDictionary setObject:forKey:](self->_keepAliveTimeoutTimers, "setObject:forKey:", v10, v13, v14, v15, v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_configureKeepAliveTimeoutForPeer:(id)a3 useCase:(int)a4 isKeepAliveBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v9 = sub_1002E0DB8(a4, v5);
  if (v9 > 0.0)
  {
    id v10 = [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds objectForKeyedSubscript:v8];

    if (!v10)
    {
      id v14 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = +[NSString stringWithFormat:@"Configure. BT: %d. Timeout: %0.1f s", v5, *(void *)&v9];
        CFStringRef v20 = sub_1002E0FD8((uint64_t)"KeepAlive", 0, v8, v19);
        *(_DWORD *)long long buf = 138412290;
        v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }
      goto LABEL_9;
    }
    double v11 = [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds objectForKeyedSubscript:v8];
    [v11 doubleValue];
    double v13 = v12;

    if (v9 < v13)
    {
      id v14 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds objectForKeyedSubscript:v8];
        [v15 doubleValue];
        NSErrorUserInfoKey v17 = +[NSString stringWithFormat:@"Reconfigure. BT: %d. Timeout: %0.1f s -> %0.1f s", v5, v16, *(void *)&v9];
        id v18 = sub_1002E0FD8((uint64_t)"KeepAlive", 0, v8, v17);
        *(_DWORD *)long long buf = 138412290;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }
LABEL_9:

      int v21 = +[NSNumber numberWithDouble:v9];
      [(NSMutableDictionary *)self->_keepAliveTimeoutsSeconds setObject:v21 forKeyedSubscript:v8];
    }
  }
}

- (BOOL)_shouldInteract
{
  return self->_rangingAvailable;
}

- (id)_enableInteractionWithPersistedTokens
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Enable interaction with persisted tokens", buf, 2u);
  }
  if ([(NIServerFindableDeviceProxySessionManager *)self _shouldInteract])
  {
    id v4 = [(NIServerFindableDeviceProxySessionManager *)self _tokensFromAllGroups];
    BOOL v5 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider setPeersEligibleForDiscovery:v4 requestScan:[(NIServerFindableDeviceProxySessionManager *)self _shouldApplyBTScanMitigation_r121951698] ^ 1];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10041C880();
      }
      id v6 = v5;
    }
    unsigned int v7 = [(NIServerFindingRangingProvider *)self->_rangingProvider rangingTriggerType];
    id v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v7 ? "TriggerRequired" : "NoTriggerRequired";
      sub_100004950(buf, v9);
      id v10 = v14 >= 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,ranging trigger type = %s", v15, 0xCu);
      if (v14 < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (!v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001EA724;
      v12[3] = &unk_100858FC0;
      v12[4] = self;
      [v4 enumerateObjectsUsingBlock:v12];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C8E8();
    }
    BOOL v5 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:0];
  }

  return v5;
}

- (void)_disableInteractionAndKeepPersistedTokens
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Disable all interaction. Keep persisted tokens.", buf, 2u);
  }
  if ([(NIServerFindableDeviceProxySessionManager *)self _shouldInteract])
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C91C();
    }
  }
  else
  {
    *(void *)long long buf = 0;
    unsigned int v7 = buf;
    uint64_t v8 = 0x3032000000;
    double v9 = sub_1001E3110;
    id v10 = sub_1001E3120;
    id v11 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider setPeersEligibleForDiscovery:0 requestScan:0];
    if (*((void *)v7 + 5) && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041C950();
    }
    id v4 = [(NIServerFindableDeviceProxySessionManager *)self _tokensFromAllGroups];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001EAB30;
    v5[3] = &unk_100858FE8;
    v5[4] = self;
    v5[5] = buf;
    [v4 enumerateObjectsUsingBlock:v5];

    _Block_object_dispose(buf, 8);
  }
}

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSString stringWithFormat:@"BT: %d. PeerAdv: %@", v5, v9];
    double v12 = sub_1002E0FD8((uint64_t)"DiscoveredPeer", 0, v8, v11);
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v13 = +[NSDate now];
  char v14 = sub_1002E10F4(v13);
  uint64_t v15 = [v8 descriptionInternal];
  uint64_t v16 = +[NSString stringWithFormat:@"%@: Peer: %@. BT: %d. Adv: %@", v14, v15, v5, v9];
  lastDiscoveryEvent = self->_lastDiscoveryEvent;
  self->_lastDiscoveryEvent = v16;

  if (v5) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 1;
  }
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v8 newDiscoveryState:v18];
  [(NIServerFindableDeviceProxySessionManager *)self _advertiseAndRangeWithPeer:v8 peerAdvertisement:v9];
  -[NIServerFindableDeviceProxySessionManager _configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:](self, "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:", v8, [v9 useCase], v5);
  [(NIServerFindableDeviceProxySessionManager *)self _kickKeepAliveForPeer:v8];
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"LostPeer", 0, v4, 0);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v7 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider stopAdvertisingToPeer:v4];
  if (v7 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10041C818();
  }
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v4 newAdvertisingState:2];
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v4 newDiscoveryState:4];
}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"NotifyStopAdv", 0, v4, 0);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v4 newAdvertisingState:2];
}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  id v16 = a3;
  id v17 = a4;
  id v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = +[NSString stringWithFormat:@"SelfAdv: %@", v16];
    int v8 = sub_1002E0FD8((uint64_t)"GeneratedAdv", 0, v17, v7);
    *(_DWORD *)long long buf = 138412290;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [v16 byteRepresentation];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = self->_observers;
  id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v13);
        if (v14)
        {
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) getQueueForInputingData];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001EB444;
          block[3] = &unk_100855EB0;
          void block[4] = v14;
          id v19 = v9;
          id v20 = v17;
          dispatch_async(v15, block);
        }
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

- (void)bluetoothDiscoveryFinishedActivating
{
  int v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_1002E0FD8((uint64_t)"DiscActivated", 0, 0, 0);
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  int v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSString stringWithFormat:@"Previous: %d", self->_bluetoothDiscoveryAvailable];
    int v5 = sub_1002E0FD8((uint64_t)"DiscUnavailable", 0, 0, v4);
    *(_DWORD *)long long buf = 138412290;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 0;
    id v6 = +[NSString stringWithFormat:@"BT available: %d", 0];
    sub_1002E11D4(v6, &self->_miscEventLogBuffer.__map_.__first_);

    if (![(NIServerFindableDeviceProxySessionManager *)self _shouldInteract]) {
      [(NIServerFindableDeviceProxySessionManager *)self _disableInteractionAndKeepPersistedTokens];
    }
  }
}

- (void)bluetoothDiscoveryBecameAvailable
{
  int v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSString stringWithFormat:@"Previous: %d", self->_bluetoothDiscoveryAvailable];
    int v5 = sub_1002E0FD8((uint64_t)"DiscAvailable", 0, 0, v4);
    *(_DWORD *)long long buf = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 1;
    id v6 = +[NSString stringWithFormat:@"BT available: %d", 1];
    sub_1002E11D4(v6, &self->_miscEventLogBuffer.__map_.__first_);

    if ([(NIServerFindableDeviceProxySessionManager *)self _shouldInteract]) {
      id v7 = [(NIServerFindableDeviceProxySessionManager *)self _enableInteractionWithPersistedTokens];
    }
  }
}

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6 = a3;
  if (*((_DWORD *)a4 + 8) != 1)
  {
    id v17 = "solution.type == rose::RoseSolutionType::RoseRawOnly";
    int v18 = 1992;
    goto LABEL_12;
  }
  if (!*((unsigned char *)a4 + 600))
  {
    id v17 = "solution.raw_rose_measurement.has_value()";
    int v18 = 1993;
LABEL_12:
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager didRangeWithPeer:newSolution:]", "NIServerFindableDeviceProxySessionManager.mm", v18, v17);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    id v7 = +[NSDate now];
    int v8 = sub_1002E10F4(v7);
    uint64_t v9 = [v6 descriptionInternal];
    id v10 = (void *)v9;
    if (!*((unsigned char *)a4 + 600)) {
      sub_10000AE44();
    }
    id v11 = +[NSString stringWithFormat:@"%@: Peer: %@. Range: %0.2f m", v8, v9, *((void *)a4 + 44)];
    lastRangingMeasurement = self->_lastRangingMeasurement;
    self->_lastRangingMeasurement = v11;

    [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v6 newRangingState:3];
    if (!*((unsigned char *)a4 + 600)) {
      sub_10000AE44();
    }
    [(NIServerFindableDeviceProxySessionManager *)self _nearbydLogRange:v6 token:*((double *)a4 + 44)];
    uint64_t v13 = *((void *)a4 + 5);
    uint64_t v14 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
    [v14 setCurrentSolutionMacAddress:v13];

    uint64_t v15 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
    id v16 = [v15 updatesEngine];
    [v16 acceptRoseSolution:a4];

    [(NIServerFindableDeviceProxySessionManager *)self _kickKeepAliveForPeer:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041CA90();
  }
}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6 = a3;
  if (!*((unsigned char *)a4 + 600)) {
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager didAttemptRangingWithPeer:unsuccessfulSolution:]", "NIServerFindableDeviceProxySessionManager.mm", 2019, "solution.raw_rose_measurement.has_value()");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    id v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = sub_1002E0FD8((uint64_t)"RangeFailure", 0, v6, 0);
      sub_10041CAF8(v8, buf, v7);
    }

    if (*((unsigned char *)a4 + 600) && *((_WORD *)a4 + 72) == 96)
    {
      uint64_t v9 = +[NSDate now];
      id v10 = sub_1002E10F4(v9);
      id v11 = [v6 descriptionInternal];
      uint64_t v12 = +[NSString stringWithFormat:@"%@: Peer: %@", v10, v11];
      lastRangingPoll = self->_lastRangingPoll;
      self->_lastRangingPoll = v12;

      [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v6 newRangingState:2];
      [(NIServerFindableDeviceProxySessionManager *)self _kickKeepAliveForPeer:v6];
    }
    uint64_t v14 = *((void *)a4 + 5);
    uint64_t v15 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
    [v15 setCurrentSolutionMacAddress:v14];

    id v16 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v6];
    id v17 = [v16 updatesEngine];
    [v17 acceptUnsuccessfulRoseSolution:a4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041CAC4();
  }
}

- (void)_nearbydLogRange:(double)a3 token:(id)a4
{
  id v6 = a4;
  double v7 = sub_100006C38();
  int v8 = +[NSString stringWithFormat:@"Range: %0.2f m", *(void *)&a3];
  uint64_t v9 = sub_1002E0FD8((uint64_t)"RangeSuccess", 0, v6, v8);

  id v10 = qword_1008ABDE0;
  if (v7 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_10041CB50();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
    }
    self->_lastLogMachContTime = v7;
  }
}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4 = a3;
  int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"NotifyStopRange", 0, v4, 0);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindableDeviceProxySessionManager *)self _handleRangingTerminatedCallbackForPeer:v4];
}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4 = a3;
  int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FD8((uint64_t)"NotifyAuthFail", 0, v4, 0);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NIServerFindableDeviceProxySessionManager *)self _handleRangingTerminatedCallbackForPeer:v4];
}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NIServerFindingDiscoveryProvider *)self->_discoveryProvider stopAdvertisingToPeer:v4];
    if (v5 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C818();
    }
    [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v4 newAdvertisingState:2];
    id v6 = [(NIServerFindingRangingProvider *)self->_rangingProvider stopRangingWithPeer:v4];
    if (v6 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C7B0();
    }
    [(NIServerFindableDeviceProxySessionManager *)self _updatePeerTrackingForToken:v4 newRangingState:4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041CBC4();
  }
}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  id v10 = a3;
  if (*((unsigned char *)a5 + 7)) {
    [(NIServerFindableDeviceProxySessionManager *)self _updateReceivedSignalFlags:*((unsigned __int8 *)a5 + 6) toPeerTrackingForToken:v10];
  }
  int v7 = *((unsigned __int8 *)a5 + 8);
  int v8 = [(NSMutableDictionary *)self->_peerAlgorithmContainers objectForKeyedSubscript:v10];
  uint64_t v9 = [v8 updatesEngine];
  [v9 acceptPeerDeviceType:v7 != 0];
}

- (void)rangingBecameUnavailable
{
  int v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSString stringWithFormat:@"Previous: %d", self->_rangingAvailable];
    int v5 = sub_1002E0FD8((uint64_t)"RangeUnavailable", 0, 0, v4);
    *(_DWORD *)long long buf = 138412290;
    int v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_rangingAvailable)
  {
    self->_rangingAvailable = 0;
    id v6 = +[NSString stringWithFormat:@"Ranging available: %d", 0];
    sub_1002E11D4(v6, &self->_miscEventLogBuffer.__map_.__first_);

    if (![(NIServerFindableDeviceProxySessionManager *)self _shouldInteract]) {
      [(NIServerFindableDeviceProxySessionManager *)self _disableInteractionAndKeepPersistedTokens];
    }
  }
}

- (void)rangingBecameAvailable
{
  int v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSString stringWithFormat:@"Previous: %d", self->_rangingAvailable];
    int v5 = sub_1002E0FD8((uint64_t)"RangeAvailable", 0, 0, v4);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_rangingAvailable)
  {
    self->_rangingAvailable = 1;
    id v6 = +[NSString stringWithFormat:@"Ranging available: %d", 1];
    sub_1002E11D4(v6, &self->_miscEventLogBuffer.__map_.__first_);

    if ([(NIServerFindableDeviceProxySessionManager *)self _shouldInteract]) {
      id v7 = [(NIServerFindableDeviceProxySessionManager *)self _enableInteractionWithPersistedTokens];
    }
  }
}

- (void)_startAltitudeUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1001EC6A8;
  id v7 = &unk_100859030;
  objc_copyWeak(&v8, &location);
  int v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startPedometerDataUpdates
{
  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_1001EC9BC;
  uint64_t v9 = &unk_100859078;
  objc_copyWeak(&v10, &location);
  int v3 = objc_retainBlock(&v6);
  pedometerManager = self->_pedometerManager;
  uint64_t v5 = +[NSDate now];
  [(CMPedometer *)pedometerManager startPedometerUpdatesFromDate:v5 withHandler:v3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startPedometerEventUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1001ECE4C;
  uint64_t v7 = &unk_1008590C0;
  objc_copyWeak(&v8, &location);
  int v3 = objc_retainBlock(&v4);
  -[CMPedometer startPedometerEventUpdatesWithHandler:](self->_pedometerManager, "startPedometerEventUpdatesWithHandler:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startMotionActivityUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1001ED198;
  uint64_t v7 = &unk_100859108;
  objc_copyWeak(&v8, &location);
  int v3 = objc_retainBlock(&v4);
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](self->_motionActivityManager, "startActivityUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDevicePDRUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1001ED49C;
  uint64_t v7 = &unk_100859150;
  objc_copyWeak(&v8, &location);
  int v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  [(CMOdometryManager *)self->_pdrManager startOdometryUpdatesToQueue:self->_deviceOperationQueue withHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDeviceMotionUpdates
{
  objc_initWeak(&location, self);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_1001EDB98;
  uint64_t v7 = &unk_100859198;
  objc_copyWeak(&v8, &location);
  int v3 = objc_retainBlock(&v4);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.01, v4, v5, v6, v7);
  [(CMMotionManager *)self->_motionManager startDeviceMotionUpdatesToQueue:self->_deviceOperationQueue withHandler:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7 = a5;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041CFE8();
  }
  [(NIServerFindingRangingProvider *)self->_rangingProvider setAlgorithmAidingData:a4 forPeer:v7];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,didUpdateLocations", buf, 2u);
  }
  if (v5)
  {
    id v7 = [v5 lastObject];
    id v8 = v7;
    if (v7)
    {
      [v7 coordinate];
      uint64_t v36 = v9;
      [v8 coordinate];
      uint64_t v35 = v10;
      id v11 = [v8 timestamp];
      [v11 timeIntervalSinceReferenceDate];
      uint64_t v34 = v12;
      [v8 course];
      uint64_t v14 = v13;
      [v8 courseAccuracy];
      uint64_t v16 = v15;
      [v8 speed];
      uint64_t v18 = v17;
      [v8 speedAccuracy];
      uint64_t v20 = v19;
      [v8 horizontalAccuracy];
      uint64_t v22 = v21;
      [v8 verticalAccuracy];
      uint64_t v24 = v23;
      [v8 altitude];
      uint64_t v26 = v25;
      [v8 ellipsoidalAltitude];
      uint64_t v28 = v27;
      int v29 = [v8 floor];
      unsigned int v30 = [v29 level];
      unsigned int v31 = [v8 type];
      unsigned int v32 = [v8 signalEnvironmentType];

      peerAlgorithmContainers = self->_peerAlgorithmContainers;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1001EE2D0;
      v37[3] = &unk_1008591B8;
      v37[4] = v36;
      v37[5] = v35;
      v37[6] = v34;
      v37[7] = v14;
      v37[8] = v16;
      v37[9] = v18;
      v37[10] = v20;
      v37[11] = v22;
      v37[12] = v24;
      v37[13] = v26;
      v37[14] = v28;
      unsigned int v38 = v30;
      unsigned int v39 = v31;
      unsigned int v40 = v32;
      [(NSMutableDictionary *)peerAlgorithmContainers enumerateKeysAndObjectsUsingBlock:v37];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_10041D050();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10041D01C();
  }
}

- (void)DataCallback:(id)a3
{
  id v4 = a3;
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EE3E8;
  v7[3] = &unk_1008591E0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)peerAlgorithmContainers enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [v5 code];
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_10041D0EC();
      }
      [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041D084();
      }
      [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
      [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    }
  }
  else
  {
    id v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-proxy,location is unknown", v8, 2u);
    }
  }
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture];
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EE658;
  v7[3] = &unk_1008591E0;
  id v6 = v4;
  id v8 = v6;
  [(NSMutableDictionary *)peerAlgorithmContainers enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)getQueueForInputingData
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRangingPoll, 0);
  objc_storeStrong((id *)&self->_lastRangingMeasurement, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryEvent, 0);
  sub_1001EF240(&self->_miscEventLogBuffer.__map_.__first_);
  sub_1001EF240(&self->_sessionEventLogBuffer.__map_.__first_);
  sub_1001EF240(&self->_tokenEventLogBuffer.__map_.__first_);
  objc_storeStrong((id *)&self->_gnssExtensionsManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_osTransactionWhileInteracting, 0);
  objc_storeStrong((id *)&self->_osTransactionWhileFindable, 0);
  objc_storeStrong((id *)&self->_keepAliveTimeoutsSeconds, 0);
  objc_storeStrong((id *)&self->_keepAliveTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_peerAlgorithmContainers, 0);
  objc_storeStrong((id *)&self->_peerTracking, 0);
  objc_storeStrong((id *)&self->_groupedFindableTokens, 0);
  objc_storeStrong((id *)&self->_rangingProvider, 0);
  objc_storeStrong((id *)&self->_discoveryProvider, 0);
  objc_storeStrong((id *)&self->_initDate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_miscEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_miscEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_miscEventLogBuffer.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__map_.__first_ = 0u;
  return self;
}

@end