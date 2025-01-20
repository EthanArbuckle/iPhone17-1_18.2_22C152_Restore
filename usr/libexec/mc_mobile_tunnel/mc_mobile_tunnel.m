void sub_100004494(id a1)
{
  uint64_t vars8;

  qword_100014BB0 = objc_opt_new();

  _objc_release_x1();
}

void sub_100004664(uint64_t a1)
{
  v3 = [[MMTConnection alloc] initWithLockdownConnection:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) activeConnections];
  [v2 addObject:v3];

  [(MMTConnection *)v3 start];
}

void sub_10000481C(uint64_t a1)
{
  [*(id *)(a1 + 32) lockdownConnection];
  lockdown_disconnect();
  id v2 = [*(id *)(a1 + 40) activeConnections];
  [v2 removeObject:*(void *)(a1 + 32)];
}

void sub_100004A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004A70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained parser];
  [v1 setEscalationBlock:0];

  id v2 = objc_opt_new();
  [WeakRetained setParser:v2];
}

id sub_100004B74(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

id sub_1000058B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

void sub_1000058C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005978;
  v7[3] = &unk_100010750;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100005978(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) parseErrorFromResponse:];
    uint64_t v3 = kMDMPSettingsStatusKey;
    v4 = [v2 objectForKey:kMDMPSettingsStatusKey];
    uint64_t v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = [*(id *)(a1 + 40) parseErrorFromResponse:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)];
            [v5 addObject:v11];

            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      [v2 setObject:v5 forKey:v3];
    }
    [*(id *)(a1 + 40) sendMessage:v2];
    v12 = [*(id *)(a1 + 40) workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005B78;
    block[3] = &unk_1000107A0;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v12, block);
  }
}

id sub_100005B78(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

uint64_t start()
{
  v1 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mc_mobile_tunnel starting.", (uint8_t *)v12, 2u);
  }
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v3 = dispatch_queue_create("mc_mobile_tunnel Catalyst Queue", v2);
  CATSetCatalystQueue();

  v4 = getpwnam("mobile");
  if (v4) {
    uid_t pw_uid = v4->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  geteuid();
  if (seteuid(pw_uid)) {
    sub_10000B450();
  }
  int v6 = lockdown_checkin_xpc();
  if (v6)
  {
    int v10 = v6;
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to checkin with lockdown: 0x%08x", (uint8_t *)v12, 8u);
    }
    exit(1);
  }

  id v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  id v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "mc_mobile_tunnel shutting down.", (uint8_t *)v12, 2u);
  }
  return 0;
}

void sub_100005DF4(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  id v4 = +[MMTConnectionManager sharedInstance];
  [v4 createConnectionForLockdownConnection:a2];
}

void sub_1000060A4(void *a1, void *a2)
{
  id v8 = a2;
  dispatch_queue_t v3 = [v8 objectForKeyedSubscript:kMCTPStatusKey];
  if ([v3 isEqualToString:kMCTPStatusError])
  {
    id v4 = [v8 objectForKey:kMCTPErrorObjectKey];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = [v4 domain];
      if ([v6 isEqualToString:MDMErrorDomain])
      {
        id v7 = [v5 code];

        if (v7 != (id)12021) {
          goto LABEL_9;
        }
LABEL_7:
        [*(id *)(a1[4] + 8) processRequest:a1[5] assertion:a1[6] completionBlock:a1[7]];
        goto LABEL_10;
      }
    }
  }
  else if ([v3 isEqualToString:kMCTPStatusCommandFormatError])
  {
    goto LABEL_7;
  }
LABEL_9:
  (*(void (**)(void))(a1[7] + 16))();
LABEL_10:
}

id sub_100006270(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSSet);
  v16[0] = kMDMPRequestTypeDeviceInformation;
  v16[1] = kMDMPRequestTypeProfileList;
  v16[2] = kMDMPRequestTypeRemoveProfile;
  v16[3] = kMDMPRequestTypeInstallProfile;
  v16[4] = kMDMPRequestTypeDeviceLock;
  v16[5] = kMDMPRequestTypeEraseDevice;
  v16[6] = kMDMPRequestTypeRestartDevice;
  v16[7] = kMDMPRequestTypeShutDownDevice;
  v16[8] = kMDMPRequestTypeCertificateList;
  v16[9] = kMDMPRequestTypeProvisioningProfileList;
  v16[10] = kMDMPRequestTypeInstallProvisioningProfile;
  v16[11] = kMDMPRequestTypeRemoveProvisioningProfile;
  v16[12] = kMDMPRequestTypeInstalledApplicationList;
  v16[13] = kMDMPRequestTypeValidateApplications;
  v16[14] = kMDMPRequestTypeRestrictions;
  v16[15] = kMDMPRequestTypeSecurityInfo;
  v16[16] = kMDMPRequestTypeClearPasscode;
  v16[17] = kMDMPRequestTypeClearRestrictionsPassword;
  v16[18] = kMDMPRequestTypeSettings;
  v16[19] = kMDMPRequestTypeRequestMirroring;
  v16[20] = kMDMPRequestTypeStopMirroring;
  v16[21] = kMDMPRequestTypeActivationLockBypassCode;
  v16[22] = kMDMPRequestTypeClearActivationLockBypassCode;
  v16[23] = kMDMPRequestTypeDeviceConfigured;
  v16[24] = kMDMPRequestTypeScheduleOSUpdate;
  v16[25] = kMDMPRequestTypeScheduleOSUpdateScan;
  v16[26] = kMDMPRequestTypeAvailableOSUpdates;
  v16[27] = kMDMPRequestTypeOSUpdateStatus;
  dispatch_queue_t v3 = +[NSArray arrayWithObjects:v16 count:28];
  id v4 = [v2 initWithArray:v3];
  uint64_t v5 = (void *)qword_100014BD0;
  qword_100014BD0 = (uint64_t)v4;

  id v6 = objc_alloc((Class)NSSet);
  v15[0] = @"DefaultMDMOptions";
  v15[1] = @"SetDefaultMDMOptions";
  v15[2] = @"ProceedWithKeybagMigration";
  v15[3] = kMDMPRequestTypeInstallProfileSilent;
  v15[4] = kMDMPRequestTypeRequestUnlockToken;
  v15[5] = @"GetProfileList";
  v15[6] = @"InstallProfile";
  v15[7] = @"RemoveProfile";
  v15[8] = @"StoreProfile";
  v15[9] = @"GetStoredProfile";
  v15[10] = @"GetCloudConfiguration";
  v15[11] = @"SetCloudConfiguration";
  v15[12] = @"Flush";
  id v7 = +[NSArray arrayWithObjects:v15 count:13];
  id v8 = [v6 initWithArray:v7];
  uint64_t v9 = (void *)qword_100014BD8;
  qword_100014BD8 = (uint64_t)v8;

  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)MTChaperoneParser;
  int v10 = [super _allCommands];
  id v11 = [v10 mutableCopy];
  v12 = (void *)qword_100014BC8;
  qword_100014BC8 = (uint64_t)v11;

  [(id)qword_100014BC8 intersectSet:qword_100014BD0];
  return [(id)qword_100014BC8 unionSet:qword_100014BD8];
}

void sub_1000066F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MTChaperoneParser responseWithStatus:kMCTPStatusCommandFormatError];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100006DF4(id a1)
{
  if (IOMainPort(bootstrap_port, (mach_port_t *)&dword_100014BE8))
  {
    uint64_t v1 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v4 = 0;
    id v2 = "Cannot create IO port to read NVRAM values.";
    dispatch_queue_t v3 = (uint8_t *)&v4;
    goto LABEL_4;
  }
  dword_100014BEC = IORegistryEntryFromPath(dword_100014BE8, "IODeviceTree:/options");
  if (!dword_100014BEC)
  {
    uint64_t v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      __int16 v5 = 0;
      id v2 = "Cannot create IO Registry entry.";
      dispatch_queue_t v3 = (uint8_t *)&v5;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, v2, v3, 2u);
    }
  }
}

void sub_100007390(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MTChaperoneParser responseWithStatus:kMCTPStatusAcknowledged];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100007400(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[MTChaperoneParser responseWithStatus:kMCTPStatusAcknowledged];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

id sub_100007484(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitUntilKeybagRollingHasBeenPerformedCompletionBlock:*(void *)(a1 + 40) timeRemaining:*(double *)(a1 + 48) - *(double *)(a1 + 56)];
}

void sub_100007498(uint64_t a1)
{
  id v4 = +[NSError errorWithDomain:DMCKeybagErrorDomain code:37001 userInfo:0];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = +[MTChaperoneParser responseWithError:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_100007530(uint64_t a1)
{
  id v4 = +[NSError errorWithDomain:DMCKeybagErrorDomain code:37000 userInfo:0];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = +[MTChaperoneParser responseWithError:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_100008498(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    dispatch_queue_t v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      __int16 v5 = [(NSError *)v2 DMCVerboseDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Store profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000086E8(uint64_t a1, void *a2)
{
  id v5 = a2;
  dispatch_queue_t v3 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"ProfileData"];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void sub_100008AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
    goto LABEL_9;
  }
  if (![*(id *)(a1 + 32) _isXPCInterruptionError:v3]
    || (uint64_t)[*(id *)(a1 + 32) setCloudConfigurationCommandRetryCount] > 2)
  {
    [*(id *)(a1 + 32) setSetCloudConfigurationCommandRetryCount:0];
    uint64_t v6 = +[MTIPCUTunnelParser responseWithError:v3];
LABEL_9:
    id v5 = (void *)v6;
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) setSetCloudConfigurationCommandRetryCount:((char *)[*(id *)(a1 + 32) setCloudConfigurationCommandRetryCount]) + 1];
  uint64_t v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Couldn't communicate with the helper application, retrying the commandSetCloudConfiguration", v8, 2u);
  }
  [*(id *)(a1 + 32) _commandSetCloudConfiguration:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  id v5 = 0;
LABEL_10:
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);
  }
}

void sub_10000900C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:kMCTPErrorObjectKey];
  if (v4
    && [*(id *)(a1 + 32) _isXPCInterruptionError:v4]
    && (uint64_t)[*(id *)(a1 + 32) downloadAndApplyCloudConfigurationCommandRetryCount] <= 2)
  {
    [*(id *)(a1 + 32) setDownloadAndApplyCloudConfigurationCommandRetryCount:[*(id *)(a1 + 32) downloadAndApplyCloudConfigurationCommandRetryCount] + 1];
    id v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Couldn't communicate with the helper application, retrying the commandDownloadAndApplyCloudConfiguration", buf, 2u);
    }
    [*(id *)(a1 + 32) _commandDownloadAndApplyCloudConfiguration:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 32) setDownloadAndApplyCloudConfigurationCommandRetryCount:0];
    uint64_t v6 = *(void **)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = dispatch_get_global_queue(0, 0);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000918C;
      v8[3] = &unk_1000109A8;
      id v10 = v6;
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t sub_10000918C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000091A0(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1[4] _configuratorCloudConfigurationErrorWithCloudConfigDetails:v5 error:a2];
  if (v6)
  {
    uint64_t v7 = (void (**)(id, void *))a1[6];
    id v8 = [(id)objc_opt_class() responseWithError:v6];
    v7[2](v7, v8);
  }
  else
  {
    id v9 = [a1[5] objectForKeyedSubscript:@"MDMUsername"];
    id v10 = [a1[5] objectForKeyedSubscript:@"MDMPassword"];
    id v11 = [v5 objectForKeyedSubscript:kCCConfigurationURLKey];
    v12 = +[NSURL URLWithString:v11];

    v13 = [v5 objectForKeyedSubscript:kCCAnchorCertificatesKey];
    objc_super v14 = certificatesFromDERCertificateDataArray();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000938C;
    v17[3] = &unk_100010AD0;
    id v15 = a1[6];
    id v16 = a1[4];
    id v19 = v15;
    v17[4] = v16;
    id v18 = v5;
    +[MDMMCInterface retrieveCloudConfigurationFromURL:v12 username:v9 password:v10 anchorCertificates:v14 completion:v17];
  }
}

void sub_10000938C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [(id)objc_opt_class() responseWithError:v5];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_1000094B8;
    v12[3] = &unk_100010AA8;
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v15 = v10;
    v12[4] = v11;
    id v13 = v6;
    id v14 = *(id *)(a1 + 40);
    +[MDMMCInterface storeCloudConfigurationDetails:v9 completion:v12];
  }
}

void sub_1000094B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [(id)objc_opt_class() responseWithError:v3];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000095D8;
    v9[3] = &unk_100010A80;
    id v10 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v13 = v7;
    uint64_t v11 = v8;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v6, v9);
  }
}

void sub_1000095D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009694;
  v6[3] = &unk_100010A58;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v8 = v3;
  v6[4] = v4;
  id v7 = v5;
  +[MDMMCInterface storeProfileData:v2 completion:v6];
}

void sub_100009694(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [(id)objc_opt_class() responseWithError:v3];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100009790;
    v8[3] = &unk_100010980;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    id v11 = *(id *)(a1 + 48);
    +[MDMMCInterface installStoredProfileDataWithCompletion:v8];
  }
}

void sub_100009790(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    +[MDMMCInterface storeCloudConfigurationDetails:*(void *)(a1 + 32) completion:&stru_1000109F0];
    +[MDMMCInterface storeProfileData:0 completion:&stru_100010A30];
    [(id)objc_opt_class() responseWithError:v5];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationWasAppliedKey];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];
    +[MDMMCInterface storeCloudConfigurationDetails:v3 completion:&stru_100010A10];

    +[MDMMCInterface storeProfileData:0 completion:&stru_100010A30];
    [(id)objc_opt_class() responseWithStatus:kMCTPStatusAcknowledged];
  uint64_t v4 = };
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000098E4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to revert to original cloud configuration. This means that AwaitDeviceConfigured will remain set to YES. Error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000998C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to set ConfigurationWasApplied to YES. Error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100009A38(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = v3;
      id v5 = [(NSError *)v2 DMCVerboseDescription];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Clearing store profile error. Error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100009BB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    +[MTIPCUTunnelParser responseWithError:v3];
  }
  else {
  int v4 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    int v6 = dispatch_get_global_queue(0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009CBC;
    v7[3] = &unk_1000109A8;
    id v9 = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void sub_100009CBC(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  uint64_t v1 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Even more Logging", v2, 2u);
  }
}

void sub_100009FC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      int v6 = [v3 DMCVerboseDescription];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not erase device: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_10000A7F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A8BC;
    v6[3] = &unk_1000109A8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t sub_10000A8BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000A8D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = [*(id *)(a1 + 32) _configuratorProvisionalEnrollmentErrorWithDetails:v5 error:a2];
  if (v9)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [(id)objc_opt_class() responseWithError:v9];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    id v8 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
    id v7 = v8;
    if (v5) {
      [v8 setObject:v5 forKeyedSubscript:@"ProvisionalEnrollmentDetails"];
    }
    (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
  }
}

void sub_10000B424(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10000B450()
{
  v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "seteuid failed. Exiting.", v1, 2u);
  }
  abort();
}

void sub_10000B4A8()
{
  sub_10000B440();
  sub_10000B410();
  sub_10000B424((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_10000B530()
{
  sub_10000B440();
  sub_10000B410();
  sub_10000B424((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_10000B5B8()
{
  sub_10000B440();
  sub_10000B410();
  sub_10000B424((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_10000B640()
{
  sub_10000B440();
  sub_10000B410();
  sub_10000B424((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

void sub_10000B6C8()
{
  sub_10000B440();
  sub_10000B410();
  sub_10000B424((void *)&_mh_execute_header, v0, v1, "<%s %s:%lu>", v2, v3, v4, v5, v6);
}

uint64_t CATSetCatalystQueue()
{
  return _CATSetCatalystQueue();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

uint64_t DMCErrorArray()
{
  return _DMCErrorArray();
}

uint64_t DMCHCUCopyCertificateFromKeychainForMappedLabel()
{
  return _DMCHCUCopyCertificateFromKeychainForMappedLabel();
}

uint64_t DMCHCUCopyHostCertificateForMappedLabel()
{
  return _DMCHCUCopyHostCertificateForMappedLabel();
}

uint64_t DMCHCUCreateCSR()
{
  return _DMCHCUCreateCSR();
}

uint64_t DMCHCUSetCertificateDataForMappedLabel()
{
  return _DMCHCUSetCertificateDataForMappedLabel();
}

uint64_t DMCIsSetupBuddyDone()
{
  return _DMCIsSetupBuddyDone();
}

uint64_t DMCLogObjects()
{
  return _DMCLogObjects();
}

uint64_t DMCStringForBool()
{
  return _DMCStringForBool();
}

uint64_t DMCUnformattedErrorArray()
{
  return _DMCUnformattedErrorArray();
}

uint64_t DMIsMigrationNeeded()
{
  return _DMIsMigrationNeeded();
}

uint64_t DMPerformMigrationIfNeeded()
{
  return _DMPerformMigrationIfNeeded();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t MDMKeybagCreateSupervisionEscrowWithPasscode()
{
  return _MDMKeybagCreateSupervisionEscrowWithPasscode();
}

uint64_t MDMKeybagRetrieveSupervisionEscrowSecret()
{
  return _MDMKeybagRetrieveSupervisionEscrowSecret();
}

uint64_t MDMSendTriggerRollKeybagsNotification()
{
  return _MDMSendTriggerRollKeybagsNotification();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBKeyBagGetSystemGeneration()
{
  return _MKBKeyBagGetSystemGeneration();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return _SecCMSVerifyCopyDataAndAttributes();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateNotValidAfter()
{
  return _SecCertificateNotValidAfter();
}

uint64_t SecCertificateNotValidBefore()
{
  return _SecCertificateNotValidBefore();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return _SecPolicyCreateBasicX509();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetPower()
{
  return _WiFiManagerClientGetPower();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetPower()
{
  return _WiFiManagerClientSetPower();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint64_t certificatesFromDERCertificateDataArray()
{
  return _certificatesFromDERCertificateDataArray();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_CSR(void *a1, const char *a2, ...)
{
  return [a1 CSR];
}

id objc_msgSend_DMCAppendGreenteaSuffix(void *a1, const char *a2, ...)
{
  return [a1 DMCAppendGreenteaSuffix];
}

id objc_msgSend_DMCCopyAsPrimaryError(void *a1, const char *a2, ...)
{
  return [a1 DMCCopyAsPrimaryError];
}

id objc_msgSend_DMCUSEnglishDescription(void *a1, const char *a2, ...)
{
  return [a1 DMCUSEnglishDescription];
}

id objc_msgSend_DMCVerboseDescription(void *a1, const char *a2, ...)
{
  return [a1 DMCVerboseDescription];
}

id objc_msgSend__isLockdownModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isLockdownModeEnabled];
}

id objc_msgSend_activeConnections(void *a1, const char *a2, ...)
{
  return [a1 activeConnections];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return [a1 challenge];
}

id objc_msgSend_challengeCertificate(void *a1, const char *a2, ...)
{
  return [a1 challengeCertificate];
}

id objc_msgSend_cloudConfigurationDetails(void *a1, const char *a2, ...)
{
  return [a1 cloudConfigurationDetails];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionQueue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultMDMOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultMDMOptions];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadAndApplyCloudConfigurationCommandRetryCount(void *a1, const char *a2, ...)
{
  return [a1 downloadAndApplyCloudConfigurationCommandRetryCount];
}

id objc_msgSend_escalationBlock(void *a1, const char *a2, ...)
{
  return [a1 escalationBlock];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_hostIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hostIdentifier];
}

id objc_msgSend_ipcuProfileList(void *a1, const char *a2, ...)
{
  return [a1 ipcuProfileList];
}

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return [a1 isAppleTV];
}

id objc_msgSend_isKeybagRollingNeeded(void *a1, const char *a2, ...)
{
  return [a1 isKeybagRollingNeeded];
}

id objc_msgSend_isLockdownModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLockdownModeEnabled];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lockdownConnection(void *a1, const char *a2, ...)
{
  return [a1 lockdownConnection];
}

id objc_msgSend_mdmProfileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mdmProfileIdentifier];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parser(void *a1, const char *a2, ...)
{
  return [a1 parser];
}

id objc_msgSend_personaID(void *a1, const char *a2, ...)
{
  return [a1 personaID];
}

id objc_msgSend_powerAssertion(void *a1, const char *a2, ...)
{
  return [a1 powerAssertion];
}

id objc_msgSend_receiveMessage(void *a1, const char *a2, ...)
{
  return [a1 receiveMessage];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setCloudConfigurationCommandRetryCount(void *a1, const char *a2, ...)
{
  return [a1 setCloudConfigurationCommandRetryCount];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_systemConnection(void *a1, const char *a2, ...)
{
  return [a1 systemConnection];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}