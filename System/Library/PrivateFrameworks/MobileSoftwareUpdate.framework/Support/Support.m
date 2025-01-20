BOOL NRDGetUpdateBrainConnection(void *a1, void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  NRDUpdateDaemonClientImpl *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  void v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  NSErrorUserInfoKey v36;
  CFStringRef v37;
  void v38[4];
  void v39[4];

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v8 = objc_alloc_init(NRDUpdateDaemonClientImpl);
  if (v8)
  {
    v38[0] = @"ActionText";
    v38[1] = @"ElapsedTime";
    v39[0] = @"Connecting to RecoveryOSUpdateBrain...";
    v39[1] = &off_1000649B0;
    v38[2] = @"PercentComplete";
    v38[3] = @"PercentBytesComplete";
    v39[2] = &off_1000649B0;
    v39[3] = &off_1000649B0;
    v9 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    v10 = (void *)v9;
    if (a3) {
      a3(v9, a4);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __NRDGetUpdateBrainConnection_block_invoke;
    v15[3] = &unk_100059020;
    v17 = &v30;
    v18 = &v20;
    v19 = &v24;
    v11 = dispatch_semaphore_create(0);
    v16 = v11;
    [(NRDUpdateDaemonClientImpl *)v8 acquireNRDUpdateBrain:0 reply:v15];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v36 = NSDebugDescriptionErrorKey;
    v37 = @"could not alloc/init NRDUpdated object";
    v10 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v12 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:14 userInfo:v10];
    v11 = v25[5];
    v25[5] = v12;
  }

  if (a1) {
    *a1 = (id) v31[5];
  }
  if (a2) {
    *a2 = (id) v25[5];
  }
  v13 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v13;
}

void sub_10000456C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __NRDGetUpdateBrainConnection_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (a3)
  {
    id v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id NRDAcquireActivityLock(void *a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  id v5 = a1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__281;
  v20 = __Block_byref_object_dispose__282;
  id v21 = 0;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v6 = v5;
    v22[0] = @"ActionText";
    v22[1] = @"ElapsedTime";
    v23[0] = @"Waiting for RecoveryOSUpdateBrain...";
    v23[1] = &off_1000649B0;
    v22[2] = @"PercentComplete";
    v22[3] = @"PercentBytesComplete";
    v23[2] = &off_1000649B0;
    v23[3] = &off_1000649B0;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    v8 = (void *)v7;
    if (a2) {
      a2(v7, a3);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __NRDAcquireActivityLock_block_invoke;
    v13[3] = &unk_100059048;
    v15 = &v16;
    id v9 = dispatch_semaphore_create(0);
    v14 = v9;
    [v6 finishNeRDUpdate:v13];
    dispatch_time_t v10 = dispatch_time(0, 300000000000);
    dispatch_semaphore_wait(v9, v10);
  }
  id v11 = objc_retainBlock((id)v17[5]);
  _Block_object_dispose(&v16, 8);

  return v11;
}

void sub_100004888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __Block_byref_object_copy__281(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__282(uint64_t a1)
{
}

intptr_t __NRDAcquireActivityLock_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

void NRDReleaseActivityLock(void *a1)
{
  if (a1)
  {
    v1 = objc_retainBlock(a1);
    v1[2]();
  }
}

BOOL NRDQueryRecoveryOS(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void (*a8)(uint64_t, uint64_t), uint64_t a9)
{
  id v16 = a1;
  id v28 = a2;
  id v17 = a3;
  id v18 = a4;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  if ([v16 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v19 = v16;
    v59[0] = @"ActionText";
    v59[1] = @"ElapsedTime";
    v60[0] = @"Checking for RecoveryOS update...";
    v60[1] = &off_1000649B0;
    v59[2] = @"PercentComplete";
    v59[3] = @"PercentBytesComplete";
    v60[2] = &off_1000649B0;
    v60[3] = &off_1000649B0;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
    id v21 = (void *)v20;
    if (a8) {
      a8(v20, a9);
    }
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    id v23 = [&off_100064AD8 mutableCopy];
    [v23 addEntriesFromDictionary:v18];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __NRDQueryRecoveryOS_block_invoke;
    v29[3] = &unk_100059070;
    v31 = &v45;
    v32 = &v51;
    v33 = &v35;
    v34 = &v39;
    v24 = v22;
    v30 = v24;
    [v19 queryNeRDUpdate:v28 build:v17 options:v23 callback:v29];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v57[0] = NSDebugDescriptionErrorKey;
    v57[1] = @"InvalidArgument";
    v58[0] = @"bad brain connection object";
    +[NSString stringWithFormat:@"brainConn=%@", v16];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v58[1] = v19;
    id v21 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    uint64_t v25 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:9 userInfo:v21];
    v24 = v40[5];
    v40[5] = v25;
  }

  if (a5) {
    *a5 = (id) v52[5];
  }
  if (a6) {
    *a6 = (id) v46[5];
  }
  if (a7) {
    *a7 = (id) v40[5];
  }
  BOOL v26 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v26;
}

void sub_100004D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void __NRDQueryRecoveryOS_block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v43 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (!v9) {
      goto LABEL_29;
    }
    goto LABEL_17;
  }
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"targetNeRDOSIsRequired"];
    id v18 = [v43 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
    goto LABEL_8;
  }
  if (v9)
  {
    uint64_t v20 = [v9 objectForKeyedSubscript:@"ProductVersion"];
    if (v20)
    {
LABEL_8:

      if (!v43) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  if (!v43) {
    goto LABEL_16;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__kCFBooleanFalse forKeyedSubscript:@"targetNeRDOSIsRequired"];
  id v21 = [v43 copy];
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  id v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

LABEL_12:
  v24 = [v43 objectForKeyedSubscript:@"OSVersion"];

  if (v24)
  {
    uint64_t v25 = [v43 objectForKeyedSubscript:@"OSVersion"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v25 forKeyedSubscript:@"targetNeRDOSVersion"];
  }
  BOOL v26 = [v43 objectForKeyedSubscript:@"Build"];

  if (v26)
  {
    v27 = [v43 objectForKeyedSubscript:@"Build"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v27 forKeyedSubscript:@"targetNeRDOSBuild"];
  }
LABEL_16:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (!v9) {
    goto LABEL_29;
  }
LABEL_17:
  id v28 = [v9 objectForKeyedSubscript:@"ProductBuild"];

  if (v28)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v29 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
    v32 = [v9 objectForKeyedSubscript:@"ProductBuild"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v32 forKeyedSubscript:@"currentNeRDOSVersion"];
  }
  v33 = [v9 objectForKeyedSubscript:@"ReleaseType"];

  if (v33)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v34 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
      v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;
    }
    uint64_t v37 = [v9 objectForKeyedSubscript:@"ReleaseType"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v37 forKeyedSubscript:@"currentNeRDOSType"];
  }
  char v38 = [v9 objectForKeyedSubscript:@"BrainVersion"];

  if (v38)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v39 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
    v42 = [v9 objectForKeyedSubscript:@"BrainVersion"];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v42 forKeyedSubscript:@"nerdBrainVersion"];
  }
LABEL_29:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL NRDDownloadRecoveryOS(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v13 = a1;
  id v23 = a2;
  id v24 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy_;
  uint64_t v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v14 = v13;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v44[0] = @"Foreground";
    v44[1] = @"Timeout";
    v45[0] = &__kCFBooleanTrue;
    uint64_t v16 = +[NSNumber numberWithUnsignedInteger:3600];
    v45[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
    id v18 = [v17 mutableCopy];

    [v18 addEntriesFromDictionary:v24];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __NRDDownloadRecoveryOS_block_invoke;
    v31[3] = &__block_descriptor_48_e8_v16__0d8l;
    v31[4] = a6;
    v31[5] = a7;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __NRDDownloadRecoveryOS_block_invoke_2;
    v25[3] = &unk_1000590B8;
    uint64_t v29 = a6;
    uint64_t v30 = a7;
    v27 = &v36;
    id v28 = &v32;
    uint64_t v19 = v15;
    BOOL v26 = v19;
    [v14 downloadNeRDUpdate:v23 options:v18 progress:v31 completion:v25];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v42[0] = NSDebugDescriptionErrorKey;
    v42[1] = @"InvalidArgument";
    v43[0] = @"bad brain connection object";
    +[NSString stringWithFormat:@"brainConn=%@", v13];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v43[1] = v14;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v20 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:9 userInfo:v19];
    id v18 = (id)v37[5];
    v37[5] = v20;
  }

  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = (id) v37[5];
  }
  BOOL v21 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

void sub_100005528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __NRDDownloadRecoveryOS_block_invoke(uint64_t a1, double a2)
{
  id v3 = +[NSNumber numberWithDouble:a2 * 100.0 * 0.075 + 90.0];
  v7[0] = @"ActionText";
  v7[1] = @"ElapsedTime";
  v8[0] = @"Downloading RecoveryOS update...";
  v8[1] = &off_1000649B0;
  v7[2] = @"PercentComplete";
  v7[3] = @"PercentBytesComplete";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v5 = (void *)v4;
  id v6 = *(void (**)(uint64_t, void))(a1 + 32);
  if (v6) {
    v6(v4, *(void *)(a1 + 40));
  }
}

intptr_t __NRDDownloadRecoveryOS_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!a2)
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Downloading RecoveryOS completed.";
    v12[1] = &off_1000649B0;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_100064B78;
    v12[3] = &off_100064B78;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    v8 = (void *)v7;
    id v9 = *(void (**)(uint64_t, void))(a1 + 56);
    if (v9) {
      v9(v7, *(void *)(a1 + 64));
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL NRDInstallRecoveryOS(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy_;
  uint64_t v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v16 = v13;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __NRDInstallRecoveryOS_block_invoke;
    v31[3] = &__block_descriptor_48_e8_v16__0d8l;
    v31[4] = a6;
    v31[5] = a7;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __NRDInstallRecoveryOS_block_invoke_2;
    v24[3] = &unk_100059120;
    uint64_t v29 = a6;
    uint64_t v30 = a7;
    v27 = &v36;
    id v28 = &v32;
    id v18 = v16;
    id v25 = v18;
    uint64_t v19 = v17;
    BOOL v26 = v19;
    [v18 installNeRDUpdate:v14 options:v15 progress:v31 completion:v24];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v20 = v25;
  }
  else
  {
    v42[0] = NSDebugDescriptionErrorKey;
    v42[1] = @"InvalidArgument";
    v43[0] = @"bad brain connection object";
    +[NSString stringWithFormat:@"brainConn=%@", v13];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v43[1] = v18;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v21 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:9 userInfo:v19];
    uint64_t v20 = (void *)v37[5];
    v37[5] = v21;
  }

  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = (id) v37[5];
  }
  BOOL v22 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void sub_100005A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void __NRDInstallRecoveryOS_block_invoke(uint64_t a1, double a2)
{
  id v3 = +[NSNumber numberWithDouble:(a2 * 0.025 + 0.075) * 100.0 + 90.0];
  v7[0] = @"ActionText";
  v7[1] = @"ElapsedTime";
  v8[0] = @"Installing RecoveryOS update...";
  v8[1] = &off_1000649B0;
  v7[2] = @"PercentComplete";
  v7[3] = @"PercentBytesComplete";
  v8[2] = v3;
  v8[3] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  uint64_t v5 = (void *)v4;
  id v6 = *(void (**)(uint64_t, void))(a1 + 32);
  if (v6) {
    v6(v4, *(void *)(a1 + 40));
  }
}

intptr_t __NRDInstallRecoveryOS_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (a2)
  {
    [*(id *)(a1 + 32) purgeNeRDUpdate:&__block_literal_global];
  }
  else
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Installing RecoveryOS completed.";
    v12[1] = &off_1000649B0;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_100064B88;
    v12[3] = &off_100064B88;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    v8 = (void *)v7;
    id v9 = *(void (**)(uint64_t, void))(a1 + 64);
    if (v9) {
      v9(v7, *(void *)(a1 + 72));
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL NRDCancelRecoveryOSUpdate(void *a1, void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  id v7 = a1;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___NRDUpdateBrainClientInterface])
  {
    id v8 = v7;
    v33[0] = @"ActionText";
    v33[1] = @"ElapsedTime";
    v34[0] = @"Canceling RecoveryOS update...";
    v34[1] = &off_1000649B0;
    v33[2] = @"PercentComplete";
    v33[3] = @"PercentBytesComplete";
    v34[2] = &off_1000649B0;
    v34[3] = &off_1000649B0;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    id v10 = (void *)v9;
    if (a3) {
      a3(v9, a4);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __NRDCancelRecoveryOSUpdate_block_invoke;
    v15[3] = &unk_1000590B8;
    uint64_t v19 = a3;
    uint64_t v20 = a4;
    dispatch_semaphore_t v17 = &v25;
    id v18 = &v21;
    id v11 = dispatch_semaphore_create(0);
    id v16 = v11;
    [v8 cancelNeRDUpdate:0 callback:v15];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v32[0] = @"bad brain connection object";
    v31[0] = NSDebugDescriptionErrorKey;
    v31[1] = @"InvalidArgument";
    +[NSString stringWithFormat:@"brainConn=%@", v7];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v32[1] = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    uint64_t v12 = +[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:9 userInfo:v10];
    id v11 = v26[5];
    v26[5] = v12;
  }

  if (a2) {
    *a2 = (id) v26[5];
  }
  BOOL v13 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void sub_10000600C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t __NRDCancelRecoveryOSUpdate_block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!a2)
  {
    v11[0] = @"ActionText";
    v11[1] = @"ElapsedTime";
    v12[0] = @"Canceling RecoveryOS update completed.";
    v12[1] = &off_1000649B0;
    v11[2] = @"PercentComplete";
    v11[3] = @"PercentBytesComplete";
    v12[2] = &off_1000649B0;
    v12[3] = &off_1000649B0;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    id v8 = (void *)v7;
    uint64_t v9 = *(void (**)(uint64_t, void))(a1 + 56);
    if (v9) {
      v9(v7, *(void *)(a1 + 64));
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t progressCallback(uint64_t a1, void *a2)
{
  return 0;
}

void sub_1000071E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_100008C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_100009108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef copy_nvram_variable_with_system_nvram_check(const __CFString *a1)
{
  mach_port_t mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    CFStringRef v7 = @"Could not get master port\n";
  }
  else
  {
    io_registry_entry_t v9 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v9)
    {
      io_object_t v10 = v9;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v9, a1, kCFAllocatorDefault, 0);
      IOObjectRelease(v10);
      return CFProperty;
    }
    CFStringRef v7 = @"Could not get options entry from the device tree\n";
  }
  logfunction("", 1, v7, v2, v3, v4, v5, v6, v12);
  return 0;
}

CFTypeRef copy_nvram_variable(const __CFString *a1)
{
  return copy_nvram_variable_with_system_nvram_check(a1);
}

BOOL set_nvram_object(const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return set_nvram_object_with_system_nvram_check(a1, a2, 0, a4, a5, a6, a7, a8);
}

BOOL set_nvram_object_with_system_nvram_check(const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  char v20;

  if (!a1)
  {
    id v18 = @"Can't insert nil key into registry\n";
LABEL_10:
    logfunction("", 1, v18, a4, a5, a6, a7, a8, v20);
    return 0;
  }
  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't insert nil object into registry\n", a4, a5, a6, a7, a8, v20);
    return v8;
  }
  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
  if (!v10)
  {
    id v18 = @"Failed to locate IODeviceTree options in IO registry\n";
    goto LABEL_10;
  }
  io_object_t v11 = v10;
  char v12 = IORegistryEntrySetCFProperty(v10, a1, (CFTypeRef)v8);
  BOOL v8 = v12 == 0;
  if (v12) {
    logfunction("", 1, @"Failed to set key %@ in IO registry: %d\n", v13, v14, v15, v16, v17, (char)a1);
  }
  IOObjectRelease(v11);
  return v8;
}

uint64_t delete_nvram_variable(const __CFString *a1)
{
  return msu_delete_nvram_variable_if_exists(a1, &v2);
}

uint64_t msu_delete_nvram_variable_if_exists(const __CFString *a1, unsigned char *a2)
{
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v15 = 0u;
  BOOL v4 = msu_nvram_exists(a1);
  CFStringGetCString(a1, buffer, 511, 0x8000100u);
  if (!v4)
  {
    CFStringRef v12 = @"%s: NVRAM %s not found..Nothing to do\n\n";
    goto LABEL_5;
  }
  BOOL v10 = set_nvram_object_with_system_nvram_check(@"IONVRAM-DELETE-PROPERTY", (BOOL)a1, 0, v5, v6, v7, v8, v9);
  uint64_t v11 = 0;
  if (v10)
  {
    CFStringRef v12 = @"%s: Deleted value %s\n\n";
LABEL_5:
    uint64_t v11 = 1;
    logfunction("", 1, v12, v5, v6, v7, v8, v9, (char)"msu_delete_nvram_variable_if_exists");
  }
  *a2 = v4;
  return v11;
}

BOOL msu_nvram_exists(const __CFString *a1)
{
  CFTypeRef v1 = copy_nvram_variable_with_system_nvram_check(a1);
  CFTypeRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0;
}

BOOL msu_sync_nvram(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    CFStringRef v8 = @"IONVRAM-FORCESYNCNOW-PROPERTY";
  }
  else {
    CFStringRef v8 = @"IONVRAM-SYNCNOW-PROPERTY";
  }
  return set_nvram_object_with_system_nvram_check(v8, (BOOL)v8, 0, a4, a5, a6, a7, a8);
}

uint64_t gpu_dynamic_stats()
{
  return 0;
}

uint64_t msuSharedLogger()
{
  if (msuSharedLogger_pred != -1) {
    dispatch_once(&msuSharedLogger_pred, &__block_literal_global_2);
  }
  return msuSharedLogger___instance;
}

void __msuSharedLogger_block_invoke(id a1)
{
  msuSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "daemon");
}

id MSUCopyPreviousUpdateAllToleratedFailures()
{
  v0 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }
  id v1 = copyPreviousToleratedFailures(1);
  CFTypeRef v2 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[NSDictionary safeSummaryForDictionary:v1];
    int v5 = 138412546;
    CFStringRef v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | DONE | toleratedFailures:%@", (uint8_t *)&v5, 0x16u);
  }
  return v1;
}

id copyPreviousToleratedFailures(int a1)
{
  if (!a1)
  {
    CFStringRef v6 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"];
    long long v16 = 0;
    uint64_t v17 = (uint64_t)&v16;
    uint64_t v18 = 0x3052000000;
    long long v19 = __Block_byref_object_copy__2;
    long long v20 = __Block_byref_object_dispose__2;
    id v21 = 0;
    id v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3052000000;
    long long v25 = __Block_byref_object_copy__2;
    long long v26 = __Block_byref_object_dispose__2;
    uint64_t v27 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke;
    v15[3] = &unk_100059400;
    void v15[4] = &v16;
    v15[5] = &v22;
    [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v15];
    __int16 v7 = *(void **)(v17 + 40);
    if (v7)
    {
      BOOL v8 = 0;
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke_2;
      v14[3] = &unk_100059400;
      v14[4] = &v16;
      v14[5] = &v22;
      [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v14];
      __int16 v7 = *(void **)(v17 + 40);
      BOOL v8 = v7 != 0;
      if (!v7) {
        goto LABEL_13;
      }
    }
    id v9 = objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"StepName"), "compare:", @"update_baseband");
    BOOL v10 = &kMSUUpdateToleratedStepValueUpdateBaseband;
    if (v9) {
      BOOL v10 = &kMSUUpdateToleratedStepValueUnrecognizedStep;
    }
    uint64_t v11 = *v10;
    if (*v10)
    {
      id v3 = objc_alloc_init((Class)NSMutableDictionary);
      [v3 setObject:v11 forKeyedSubscript:@"StepIdentifier"];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"StepName"), @"StepName");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", v23[5]), @"EventUnique");
      if (v8)
      {
        [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"RebootRetry"];
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"RetryFailureNumber"), @"FailureNumber");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"RetryResult"), @"Result");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"RetryError"), @"Error");
        CFStringRef v12 = @"RetrySkipped";
      }
      else
      {
        [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"RebootRetry"];
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"InitialFailureNumber"), @"FailureNumber");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"InitialResult"), @"Result");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", @"InitialError"), @"Error");
        CFStringRef v12 = @"InitialSkipped";
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v17 + 40), "objectForKeyedSubscript:", v12), @"Skipped");
      goto LABEL_16;
    }
LABEL_13:
    id v3 = 0;
LABEL_16:
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v16, 8);
    return v3;
  }
  id v1 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"];
  if (!v1) {
    return 0;
  }
  CFTypeRef v2 = v1;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = (uint64_t)__retrieve_previous_update_all_tolerated_failures_block_invoke;
  long long v19 = (void (*)(uint64_t, uint64_t))&unk_100059428;
  long long v20 = (void (*)(uint64_t))@"retrieve_previous_update_all_tolerated_failures";
  id v21 = v4;
  [(NSDictionary *)v2 enumerateKeysAndObjectsUsingBlock:&v16];
  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"Index" ascending:1];
  id v22 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1)), @"toleratedStepsArray");

  return v3;
}

void sub_100009D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose((const void *)(v14 - 104), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id __retrieve_previous_update_first_tolerated_failure_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 isEqualToString:@"uuid"];
  if ((result & 1) == 0)
  {
    id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"), "BOOLValue");
    if (result)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v7 + 40);
      BOOL v8 = (void *)(v7 + 40);
      id result = v9;
      if (v9)
      {
        id v10 = [result objectForKeyedSubscript:@"InitialFailureNumber"];
        id v11 = [a3 objectForKeyedSubscript:@"InitialFailureNumber"];
        LODWORD(v10) = [v10 intValue];
        id result = [v11 intValue];
        if ((int)result > (int)v10) {
          return result;
        }
        BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      void *v8 = a3;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    }
  }
  return result;
}

id __retrieve_previous_update_first_tolerated_failure_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue");
  if (result)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v7 + 40);
    BOOL v8 = (void *)(v7 + 40);
    id result = v9;
    if (v9)
    {
      id v10 = [result objectForKeyedSubscript:@"RetryFailureNumber"];
      id v11 = [a3 objectForKeyedSubscript:@"RetryFailureNumber"];
      LODWORD(v10) = [v10 intValue];
      id result = [v11 intValue];
      if ((int)result > (int)v10) {
        return result;
      }
      BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    void *v8 = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  return result;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (([a2 isEqualToString:@"uuid"] & 1) == 0)
  {
    if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"), "BOOLValue"))
    {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
      if (v5)
      {
        CFStringRef v6 = v5;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"StepName"), @"CheckPoint");
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialFailureNumber"), @"Index");
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialError"), @"Description");
        [v6 setObject:@"initial" forKeyedSubscript:@"Attempt"];
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialResult"), @"rcode");
        [*(id *)(a1 + 40) addObject:v6];
      }
      else
      {
        uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue"))
    {
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      if (v14)
      {
        long long v15 = v14;
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"StepName"), @"CheckPoint");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryFailureNumber"), @"Index");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryError"), @"Description");
        [v15 setObject:@"reboot-retry" forKeyedSubscript:@"Attempt"];
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryResult"), @"rcode");
        [*(id *)(a1 + 40) addObject:v15];
      }
      else
      {
        long long v16 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_10000CEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t trigger_cache_delete(uint64_t a1, void *a2, int a3, void *a4)
{
  char v6 = a1;
  uint64_t valuePtr = a1;
  int v37 = a3;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2000000000;
  uint64_t v36 = 0;
  if (&_os_variant_uses_ephemeral_storage && os_variant_uses_ephemeral_storage())
  {
    uint64_t v12 = 1;
    logfunction("", 1, @"Skipping CacheDelete for %lld bytes (urgencyLevel=%d), %s\n", v7, v8, v9, v10, v11, v6);
    goto LABEL_22;
  }
  uint64_t v18 = dispatch_semaphore_create(0);
  if (v18)
  {
    logfunction("", 1, @"Triggering CacheDelete for %lld bytes (urgencyLevel=%d)\n", v13, v14, v15, v16, v17, v6);
    CFNumberRef v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v37);
    *(_OWORD *)keys = *(_OWORD *)off_1000596A0;
    CFStringRef v41 = @"CACHE_DELETE_URGENCY_LIMIT";
    values[0] = a2;
    values[1] = v19;
    values[2] = v20;
    CFDictionaryRef v21 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryRef v27 = v21;
    if (v21)
    {
      CFRetain(v21);
      dispatch_retain(v18);
      long long v28 = (const void *)CacheDeletePurgeSpaceWithInfo();
      dispatch_time_t v29 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v18, v29);
      uint64_t v12 = 1;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    logfunction("", 1, @"Failed to create info dictionary\n", v22, v23, v24, v25, v26, v32);
    long long v28 = 0;
  }
  else
  {
    logfunction("", 1, @"Failed to create semaphore for CacheDelete\n", v13, v14, v15, v16, v17, v31);
    CFNumberRef v19 = 0;
    CFDictionaryRef v27 = 0;
    long long v28 = 0;
    CFNumberRef v20 = 0;
  }
  uint64_t v12 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v34[3];
LABEL_12:
  if (v18) {
    dispatch_release(v18);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v20) {
    CFRelease(v20);
  }
LABEL_22:
  _Block_object_dispose(&v33, 8);
  return v12;
}

void __trigger_cache_delete_block_invoke(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(a2)))
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"CACHE_DELETE_AMOUNT");
    if (Value)
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
      char v12 = valuePtr;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = valuePtr;
      logfunction("", 1, @"Purged %lld bytes (%lld MB)\n", v13, v14, v15, v16, v17, v12);
    }
  }
  else
  {
    logfunction("", 1, @"results dictionary is NULL\n", a4, a5, a6, a7, a8, v18);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

BOOL is_user_volume()
{
  bzero(v2, 0x40CuLL);
  v1[2] = 0;
  v1[0] = 5;
  v1[1] = 2147491840;
  return getattrlist("/private/var/mobile", v1, v2, 0x40CuLL, 0) != -1
      && !strncmp((const char *)v3 + v3[0], "User", 4uLL);
}

uint64_t purgeable_space(const void *a1, int a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int valuePtr = a2;
  uint64_t v38 = -1;
  if (&_os_variant_uses_ephemeral_storage && (os_variant_uses_ephemeral_storage() & 1) != 0) {
    return 0;
  }
  if (a1)
  {
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v11)
    {
      CFNumberRef v12 = v11;
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable)
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 14, 0, 0, @"failed to allocate info dictionary for cache delete.", v14, v15, v16, v36);
        if (a3)
        {
          *a3 = error_internal_cf;
LABEL_30:
          CFRelease(v12);
          return v38;
        }
LABEL_29:
        CFRelease(error_internal_cf);
        goto LABEL_30;
      }
      uint64_t v17 = Mutable;
      CFDictionarySetValue(Mutable, @"CACHE_DELETE_URGENCY", v12);
      CFDictionarySetValue(v17, @"CACHE_DELETE_VOLUME", a1);
      uint64_t v18 = CacheDeleteCopyPurgeableSpaceWithInfo();
      if (!v18)
      {
        CFErrorRef v34 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"CacheDeleteCopyPurgeableSpaceWithInfo failed", v21, v22, v23, v36);
        if (a3)
        {
          *a3 = v34;
LABEL_28:
          CFErrorRef error_internal_cf = v17;
          goto LABEL_29;
        }
LABEL_27:
        CFRelease(v34);
        goto LABEL_28;
      }
      CFDictionaryRef v24 = (const __CFDictionary *)v18;
      logfunction("", 1, @"CacheDeleteCopyPurgeableSpaceWithInfo() => %@\n", v19, v20, v21, v22, v23, v18);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v24, @"CACHE_DELETE_TOTAL_AVAILABLE");
      if (Value || (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v24, @"CACHE_DELETE_AMOUNT")) != 0)
      {
        if (CFNumberGetValue(Value, kCFNumberSInt64Type, &v38))
        {
LABEL_26:
          CFErrorRef v34 = v24;
          goto LABEL_27;
        }
        CFStringRef v29 = @"failed to convert purgeableNum to int64";
      }
      else
      {
        CFStringRef v29 = @"CACHE_DELETE_TOTAL_AVAILABLE_KEY and CACHE_DELETE_AMOUNT_KEY are both NULL";
      }
      CFErrorRef v35 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, v29, v26, v27, v28, v37);
      if (a3) {
        *a3 = v35;
      }
      else {
        CFRelease(v35);
      }
      goto LABEL_26;
    }
    CFStringRef v30 = @"failed to allocate urgency number.";
    CFIndex v31 = 14;
  }
  else
  {
    CFStringRef v30 = @"Unable to determine purgeable space for null path";
    CFIndex v31 = 9;
  }
  CFErrorRef v32 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", v31, 0, 0, v30, a6, a7, a8, v36);
  if (a3) {
    *a3 = v32;
  }
  else {
    CFRelease(v32);
  }
  return -1;
}

uint64_t purgeable_data_space(int a1, CFErrorRef *a2)
{
  if (is_user_volume())
  {
    uint64_t v14 = purgeable_space(@"/private/var/mobile", a1, a2, v4, v5, v6, v7, v8);
    if (!a2) {
      v14 += purgeable_space(@"/private/var", a1, 0, v9, v10, v11, v12, v13);
    }
    return v14;
  }
  else
  {
    return purgeable_space(@"/private/var", a1, a2, v4, v5, v6, v7, v8);
  }
}

uint64_t openRestoreLogFile(int a1)
{
  return openRestoreLogFileWithPath("/private/var/mobile/MobileSoftwareUpdate/restore.log", a1);
}

uint64_t openRestoreLogFileWithPath(const char *a1, int a2)
{
  uint64_t v2 = _restoreLogFD;
  if (_restoreLogFD < 0)
  {
    if (!a2 && _restoreLogFD == -2) {
      return 0xFFFFFFFFLL;
    }
    _restoreLogFD = -2;
    if (mkparentdir((uint64_t)a1, 0x1EDu))
    {
      __error();
      uint64_t v4 = __error();
      strerror(*v4);
      CFStringRef v5 = @"Could not create path %s: %s\n";
    }
    else
    {
      uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420);
      if ((v2 & 0x80000000) == 0) {
        goto LABEL_10;
      }
      if (*__error() == 13 || *__error() == 1)
      {
        if (unlink(a1) == -1 && *__error() != 2)
        {
          uint64_t v8 = __error();
          strerror(*v8);
          CFStringRef v5 = @"Failed to unlink '%s': %s\n";
          goto LABEL_6;
        }
        uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420);
        if ((v2 & 0x80000000) == 0)
        {
LABEL_10:
          atomic_store(0, &_restoreLogGrowth);
          _restoreLogFD = v2;
          rotateRestoreLogFD(v2);
          return v2;
        }
      }
      __error();
      uint64_t v7 = __error();
      strerror(*v7);
      CFStringRef v5 = @"Could not open '%s': %s\n";
    }
LABEL_6:
    logfunction("", 0, v5);
    return 0xFFFFFFFFLL;
  }
  return v2;
}

int *rotateRestoreLogFD(int a1)
{
  memset(&v9, 0, sizeof(v9));
  if (fstat(a1, &v9)) {
    return __error();
  }
  flock(a1, 2);
  if (v9.st_size > 3145728)
  {
    id v3 = malloc_type_malloc(0x100000uLL, 0xD11D0637uLL);
    if ((((v9.st_size >= 0x100000uLL) + (v9.st_size >> 63) + 1) & 1) != (unint64_t)(v9.st_size - 0x100000) >> 63) {
      off_t v4 = 0;
    }
    else {
      off_t v4 = v9.st_size - 0x100000;
    }
    ssize_t v5 = pread(a1, v3, 0x100000uLL, v4);
    if (v5 >= 1 && (ssize_t v6 = v5, (v7 = (char *)memchr(v3, 10, v5)) != 0))
    {
      size_t v8 = (unsigned char *)v3 - (v7 + 1) + v6;
      pwrite(a1, v7 + 1, v8, 0);
    }
    else
    {
      size_t v8 = 0;
    }
    ftruncate(a1, v8);
    free(v3);
  }
  return (int *)flock(a1, 8);
}

uint64_t closeRestoreLogFile()
{
  uint64_t result = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0) {
    uint64_t result = close(_restoreLogFD);
  }
  atomic_store(0, &_restoreLogGrowth);
  _restoreLogFD = -2;
  return result;
}

uint64_t checkForRestoreLogFD(int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(&v69, 0, sizeof(v69));
  logfunction("", 0, @"entering %s\n", a4, a5, a6, a7, a8, (char)"checkForRestoreLogFD");
  if (fstat(a1, &v69) != -1)
  {
    logfunction("", 0, @"found restore log (size = %llu)\n", v10, v11, v12, v13, v14, v69.st_size);
    if (v69.st_size < 3145728)
    {
      long long v42 = (char *)malloc_type_malloc(v69.st_size + 1, 0xBA40E0B5uLL);
      if (v42)
      {
        uint64_t v26 = v42;
        ssize_t v43 = read(a1, v42, v69.st_size);
        if ((v43 & 0x8000000000000000) == 0)
        {
          ssize_t v44 = v43;
LABEL_21:
          uint64_t result = 0;
          v26[v44] = 0;
          *a2 = v26;
          return result;
        }
        uint64_t v47 = __error();
        char v67 = strerror(*v47);
        logfunction("", 0, @"unable to read from restore log file: %s\n", v48, v49, v50, v51, v52, v67);
        goto LABEL_28;
      }
    }
    else
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      *(_OWORD *)__str = 0u;
      long long v71 = 0u;
      logfunction("", 0, @"restore log is suspiciously large - truncating\n", v15, v16, v17, v18, v19, v65);
      uint64_t v20 = (char *)malloc_type_malloc(0x300000uLL, 0xCC603D00uLL);
      if (v20)
      {
        uint64_t v26 = v20;
        ssize_t v27 = read(a1, v20, 0x180000uLL);
        if ((v27 & 0x8000000000000000) == 0)
        {
          uint64_t v28 = v27;
          if (lseek(a1, v27 - 3145727, 2) < 0)
          {
            CFStringRef v46 = @"unable to seek in restore log file: %s\n";
            goto LABEL_27;
          }
          CFStringRef v29 = &v26[v28];
          ssize_t v30 = read(a1, &v26[v28], 3145727 - v28);
          if (v30 != -1)
          {
            int64_t v31 = v30;
            CFErrorRef v32 = &v26[v28];
            do
            {
              if (v28 >= 1)
              {
                v26[v28 - 1] = 0;
                uint64_t v33 = strrchr(v26, 10);
                if (v33) {
                  CFErrorRef v34 = v33 + 1;
                }
                else {
                  CFErrorRef v34 = v26;
                }
                char *v34 = 0;
                uint64_t v28 = v34 - v26;
              }
              if (v31 < 1) {
                break;
              }
              CFErrorRef v35 = (char *)memchr(v29, 10, v31);
              if (!v35)
              {
                int64_t v31 = 0;
                break;
              }
              CFStringRef v29 = v35 + 1;
              int64_t v31 = &v32[v31] - (v35 + 1);
              CFErrorRef v32 = v35 + 1;
            }
            while (v35 + 1 - &v26[v28] < 160);
            snprintf(__str, 0xA0uLL, "--------------------\n------ Truncated %lld bytes ------\n--------------------\n", v69.st_size - (v28 + v31));
            v59 = &v26[v28];
            long long v60 = v77;
            *((_OWORD *)v59 + 6) = v76;
            *((_OWORD *)v59 + 7) = v60;
            long long v61 = v79;
            *((_OWORD *)v59 + 8) = v78;
            *((_OWORD *)v59 + 9) = v61;
            long long v62 = v73;
            *((_OWORD *)v59 + 2) = v72;
            *((_OWORD *)v59 + 3) = v62;
            long long v63 = v75;
            *((_OWORD *)v59 + 4) = v74;
            *((_OWORD *)v59 + 5) = v63;
            long long v64 = v71;
            *(_OWORD *)v59 = *(_OWORD *)__str;
            *((_OWORD *)v59 + 1) = v64;
            ssize_t v44 = strlen(__str) + v28;
            if (v31)
            {
              if (v29 > &v26[v44])
              {
                memmove(&v26[v44], v29, v31);
                v44 += v31;
              }
            }
            goto LABEL_21;
          }
        }
        CFStringRef v46 = @"unable to read from restore log file: %s\n";
LABEL_27:
        uint64_t v53 = __error();
        char v68 = strerror(*v53);
        logfunction("", 0, v46, v54, v55, v56, v57, v58, v68);
LABEL_28:
        free(v26);
        return 0xFFFFFFFFLL;
      }
    }
    logfunction("", 0, @"unable to allocate memory to read restore log\n", v21, v22, v23, v24, v25, v65);
    return 0xFFFFFFFFLL;
  }
  char v36 = __error();
  char v66 = strerror(*v36);
  logfunction("", 1, @"fstat on restore log failed: %s\n", v37, v38, v39, v40, v41, v66);
  return 0xFFFFFFFFLL;
}

size_t writeToRestoreLogFile(void *__buf, size_t __nbyte)
{
  size_t v2 = __nbyte;
  int v3 = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0)
  {
    ssize_t v4 = write(_restoreLogFD, __buf, __nbyte);
    size_t v2 = v4;
    if (v4 >= 1)
    {
      uint64_t v5 = atomic_fetch_add_explicit((atomic_ullong *volatile)&_restoreLogGrowth, v4, memory_order_relaxed) + v4;
      if (v5 > 0x10000)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)&_restoreLogGrowth, -v5, memory_order_relaxed);
        rotateRestoreLogFD(v3);
      }
    }
  }
  return v2;
}

uint64_t submitRestoreLogFile(__CFError *a1, uint64_t a2, const char *a3, const char *a4)
{
  return submitRestoreLogFileToLogDir(a1, a2, a3, a4, 0);
}

uint64_t submitRestoreLogFileToLogDir(__CFError *a1, uint64_t a2, const char *a3, const char *a4, const __CFString *a5)
{
  v124 = 0;
  bzero(v138, 0x400uLL);
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = "/private/var/mobile/MobileSoftwareUpdate/restore.log";
  }
  int v11 = open(v10, 2);
  int v18 = v11;
  if (v11 == -1)
  {
    ssize_t v27 = __error();
    strerror(*v27);
    logfunction("", 1, @"unable to open restore log (%s): %s (%d)\n", v28, v29, v30, v31, v32, (char)v10);
    uint64_t v25 = 0;
    goto LABEL_12;
  }
  int v19 = checkForRestoreLogFD(v11, &v124, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = v124;
  if (v19) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v124 == 0;
  }
  if (v26)
  {
    logfunction("", 1, @"unable to read from restore log file\n", v20, v21, v22, v23, v24, v115);
LABEL_12:
    CFStringRef v33 = 0;
    goto LABEL_43;
  }
  rotateRestoreLogFD(v18);
  CFStringRef v34 = (const __CFString *)MGCopyAnswer();
  CFStringRef v33 = v34;
  if (!v34)
  {
    CFStringRef v48 = @"failed to query device serial number\n";
LABEL_42:
    logfunction("", 1, v48, v35, v36, v37, v38, v39, v115);
LABEL_43:
    free(v25);
    CFStringRef v50 = 0;
    CFStringRef v51 = 0;
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!v33) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (CFStringGetLength(v34) < 1)
  {
    CFStringRef v49 = @"device has no serial number for scrubbing\n";
LABEL_23:
    logfunction("", 1, v49, v40, v41, v42, v43, v44, v115);
    goto LABEL_24;
  }
  *(_OWORD *)buffer = 0u;
  long long v140 = 0u;
  if (CFStringGetCString(v33, buffer, 32, 0x8000100u) != 1)
  {
    CFStringRef v49 = @"unable to get c string for device serial number\n";
    goto LABEL_23;
  }
  long long v45 = strcasestr(v25, buffer);
  if (v45)
  {
    CFStringRef v46 = v45;
    do
    {
      size_t v47 = strlen(buffer);
      memset(v46, 88, v47);
      CFStringRef v46 = strcasestr(v46, buffer);
    }
    while (v46);
  }
LABEL_24:
  if (_AMRRegexSubstitution(v25, "'[^\n]*' has been added", "'<<File name>>' has been added ")
    || _AMRRegexSubstitution(v25, "verify_callback: '[^\n]*' did not verify and is not on the exception list.", "verify_callback: '<<File name>>' did not verify and is not on the exception list.")|| _AMRRegexSubstitution(v25, "'[^\n]*' is on the exception list", "'<<File name>>' is on the exception list")
    || _AMRRegexSubstitution(v25, "[:-][0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [a-zA-Z0-9]{18}[[:>:]]", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-][a-zA-Z0-9]{8}[:-][a-zA-Z0-9]{16}", "XXXX")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{40}", "<<<<<<<<<<<<<<<<<<UDID>>>>>>>>>>>>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{20}", "<<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{19}", "<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9]{15}", "<<<<<IMEI>>>>>>")
    || _AMRRegexSubstitution(v25, "ecid=0x[0-9a-fA-F]*,", "ecid=0xXXXXXXXXXXX")
    || _AMRRegexSubstitution(v25, "\"ApECID\"[^\n]*value = [+-][0-9<>IMEI]*", "\"ApECID\"} = X {X")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{14}", "<<<<<MEID>>>>>")
    || _AMRRegexSubstitution(v25, "\"ChipSerialNo\"[^\n]*bytes = 0x[0-9a-fA-F]*}", "\"ChipSerialNo\" ")
    || _AMRRegexSubstitution(v25, "snum=0x[0-9a-fA-F]*,", "snum=0xXXXXXXXX")
    || _AMRRegexSubstitution(v25, "BbSNUM[^\n]*", "\"BbSNUM\"} = 0xXXXXXXXX }"))
  {
    goto LABEL_41;
  }
  err = a1;
  size_t v54 = strlen(v25);
  if (v54)
  {
    size_t v55 = v54;
    uint64_t v56 = v25;
    do
    {
      __darwin_ct_rune_t v57 = *v56;
      if (v57 < 0)
      {
        if (!__maskrune(*v56, 0x40000uLL))
        {
          __uint32_t v58 = __maskrune(v57, 0x4000uLL);
LABEL_60:
          if (!v58) {
            *uint64_t v56 = 46;
          }
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v57] & 0x40000) == 0)
      {
        __uint32_t v58 = _DefaultRuneLocale.__runetype[v57] & 0x4000;
        goto LABEL_60;
      }
      ++v56;
      --v55;
    }
    while (v55);
  }
  CFStringRef cf = CFStringCreateWithCString(kCFAllocatorDefault, v25, 0x8000100u);
  if (!cf)
  {
LABEL_41:
    CFStringRef v48 = @"failed to scrub log\n";
    goto LABEL_42;
  }
  theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    logfunction("", 1, @"failed to create crashReporterDictionary\n", v59, v60, v61, v62, v63, v115);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
    CFStringRef v69 = 0;
    CFStringRef v118 = 0;
LABEL_85:
    CFStringRef erra = 0;
    goto LABEL_103;
  }
  if (err)
  {
    CFDictionaryRef v64 = CFErrorCopyUserInfo(err);
    if (v64)
    {
      CFDictionaryRef v65 = v64;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v64, @"target_update");
      char Code = CFErrorGetCode(err);
      CFRelease(v65);
    }
    else
    {
      char Code = CFErrorGetCode(err);
      CFStringRef Value = 0;
    }
  }
  else
  {
    CFStringRef Value = 0;
    char Code = -1;
  }
  CFStringRef v70 = @"Unknown";
  if (!Value) {
    CFStringRef Value = @"Unknown";
  }
  uint64_t v71 = MGCopyAnswer();
  if (v71) {
    CFStringRef v70 = (const __CFString *)v71;
  }
  CFDictionarySetValue(theDict, @"itunes_version", v70);
  CFDictionarySetValue(theDict, @"restore_payload_version", Value);
  CFDictionarySetValue(theDict, @"restore_type", @"OTAUpdate");
  CFDictionarySetValue(theDict, @"name", @"iPhoneRestore");
  CFStringRef v118 = v70;
  CFDictionarySetValue(theDict, @"os_version", v70);
  CFDictionarySetValue(theDict, @"bug_type", @"183");
  CFStringRef erra = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%ld");
  if (!erra)
  {
    logfunction("", 1, @"failed to create CFString from %ld\n", v72, v73, v74, v75, v76, Code);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
    CFStringRef v69 = 0;
    goto LABEL_85;
  }
  CFDictionarySetValue(theDict, @"restore_error", erra);
  if (!a4)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFURLRef v68 = CFURLCreateWithFileSystemPath(Default, @"/private/var/mobile/Library/Logs/CrashReporter", kCFURLPOSIXPathStyle, 0);
    goto LABEL_87;
  }
  CFStringRef v77 = CFStringCreateWithCString(0, a4, 0x8000100u);
  if (!v77)
  {
    CFStringRef v112 = @"failed to create dataPartitionMountPointStr\n";
LABEL_99:
    logfunction("", 1, v112, v78, v79, v80, v81, v82, Code);
    CFURLRef v67 = 0;
    CFURLRef v68 = 0;
LABEL_102:
    CFStringRef v69 = 0;
    goto LABEL_103;
  }
  CFStringRef v83 = v77;
  CFAllocatorRef v84 = CFAllocatorGetDefault();
  CFURLRef v85 = CFURLCreateWithFileSystemPath(v84, v83, kCFURLPOSIXPathStyle, 0);
  CFRelease(v83);
  if (!v85)
  {
    CFStringRef v112 = @"failed to create mountPointURL\n";
    goto LABEL_99;
  }
  if (a5) {
    CFStringRef v86 = a5;
  }
  else {
    CFStringRef v86 = @"/mobile/Library/Logs/CrashReporter";
  }
  CFURLRef v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v85, v86, 1u);
  CFRelease(v85);
  if (!v68)
  {
    CFStringRef v92 = @"mountPointURL CFURLCreateCopyAppendingPathComponent failed\n";
LABEL_101:
    logfunction("", 1, v92, v87, v88, v89, v90, v91, Code);
    CFURLRef v67 = 0;
    goto LABEL_102;
  }
LABEL_87:
  uint64_t v137 = 0;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  *(_OWORD *)v125 = 0u;
  long long v126 = 0u;
  time_t v123 = 0;
  if (a2 <= 0) {
    a2 = time(0);
  }
  time_t v123 = a2;
  v94 = localtime(&v123);
  if (!v94)
  {
    CFStringRef v92 = @"localtime failed\n";
    goto LABEL_101;
  }
  if (!strftime(v125, 0xC8uLL, "%F-%H-%M-%S", v94))
  {
    CFStringRef v92 = @"strftime failed\n";
    goto LABEL_101;
  }
  CFAllocatorRef v95 = CFAllocatorGetDefault();
  v116 = v125;
  CFStringRef v69 = CFStringCreateWithFormat(v95, 0, @"OTAUpdate-%s.ips");
  if (!v69)
  {
    logfunction("", 1, @"failed to create crashReporterFileName\n", v96, v97, v98, v99, v100, (char)v125);
    CFURLRef v67 = 0;
    goto LABEL_103;
  }
  CFURLRef v101 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v68, v69, 0);
  CFURLRef v67 = v101;
  if (!v101)
  {
    CFStringRef v113 = @"failed to create log file name\n";
LABEL_116:
    logfunction("", 1, v113, v102, v103, v104, v105, v106, (char)v116);
LABEL_103:
    free(v25);
    CFRelease(cf);
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!theDict) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  if (!CFURLGetFileSystemRepresentation(v101, 1u, v138, 1024))
  {
    LOBYTE(v116) = (_BYTE)v67;
    CFStringRef v113 = @"Could not get file path from %@\n";
    goto LABEL_116;
  }
  logfunction("", 1, @"Trying to write crashreporter log file %s\n", v102, v103, v104, v105, v106, (char)v138);
  if (store_ips_with_mode(theDict, cf, (const char *)v138))
  {
    logfunction("", 1, @"failed to create %s\n", v107, v108, v109, v110, v111, (char)v138);
    goto LABEL_103;
  }
  int v114 = ftruncate(v18, 0);
  if (a4 || v114) {
    unlink(v10);
  }
  free(v25);
  CFRelease(cf);
  uint64_t v52 = 0;
LABEL_104:
  CFRelease(theDict);
LABEL_105:
  if (v67) {
    CFRelease(v67);
  }
  if (v68) {
    CFRelease(v68);
  }
  if (v69) {
    CFRelease(v69);
  }
  CFStringRef v50 = v118;
  CFStringRef v51 = erra;
  if (v33) {
LABEL_44:
  }
    CFRelease(v33);
LABEL_45:
  if (v50) {
    CFRelease(v50);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v18 != -1 && close(v18) == -1) {
    submitRestoreLogFileToLogDir_cold_1();
  }
  return v52;
}

uint64_t store_ips_with_mode(const __CFDictionary *a1, const __CFString *a2, const char *a3)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  int v7 = open(a3, 1537);
  if (v7 != -1)
  {
    int v13 = v7;
    CFStringAppend(Mutable, @"{");
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)append_item_to_string, Mutable);
    CFStringTrim(Mutable, @",");
    CFStringAppend(Mutable, @"}\n");
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, Mutable, 0x8000100u, 0x3Fu);
    CFDataRef v20 = ExternalRepresentation;
    if (!ExternalRepresentation) {
      goto LABEL_11;
    }
    size_t Length = CFDataGetLength(ExternalRepresentation);
    BytePtr = CFDataGetBytePtr(v20);
    if (write(v13, BytePtr, Length) != Length)
    {
      CFStringRef v34 = @"write hdr\n";
      goto LABEL_15;
    }
    CFRelease(v20);
    CFDataRef v23 = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0x3Fu);
    CFDataRef v20 = v23;
    if (v23)
    {
      size_t v24 = CFDataGetLength(v23);
      uint64_t v25 = CFDataGetBytePtr(v20);
      if (write(v13, v25, v24) == v24)
      {
        BOOL v26 = getpwnam("mobile");
        if (v26)
        {
          if (!chown(a3, v26->pw_uid, v26->pw_gid))
          {
            uint64_t v33 = 0;
LABEL_17:
            close(v13);
            if (!Mutable) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
          ssize_t v27 = __error();
          strerror(*v27);
          logfunction("", 1, @"unable to chown file '%s': %s\n\n", v28, v29, v30, v31, v32, (char)a3);
LABEL_16:
          uint64_t v33 = 0xFFFFFFFFLL;
          goto LABEL_17;
        }
        CFStringRef v34 = @"unable to look up mobile user uid/gid. Defaulting to 501/501\n\n";
      }
      else
      {
        CFStringRef v34 = @"write payload\n";
      }
    }
    else
    {
LABEL_11:
      CFStringRef v34 = @"CFStringCreateExternalRepresentation\n";
    }
LABEL_15:
    logfunction("", 1, v34, v15, v16, v17, v18, v19, 164);
    goto LABEL_16;
  }
  logfunction("", 1, @"open\n", v8, v9, v10, v11, v12, 164);
  CFDataRef v20 = 0;
  uint64_t v33 = 0xFFFFFFFFLL;
  if (Mutable) {
LABEL_18:
  }
    CFRelease(Mutable);
LABEL_19:
  if (v20) {
    CFRelease(v20);
  }
  return v33;
}

uint64_t _AMRRegexSubstitution(const char *a1, const char *a2, const char *a3)
{
  char v4 = (char)a2;
  memset(&v23, 0, sizeof(v23));
  if (regcomp(&v23, a2, 1))
  {
    logfunction("", 1, @"unable to compile regex '%s': %d\n", v6, v7, v8, v9, v10, v4);
    return 0xFFFFFFFFLL;
  }
  else
  {
    __pmatch.rm_so = 0;
    for (__pmatch.rm_eo = 0; ; a1 += __pmatch.rm_eo)
    {
      int v12 = regexec(&v23, a1, 1uLL, &__pmatch, 0);
      if (v12) {
        break;
      }
      size_t v18 = __pmatch.rm_eo - __pmatch.rm_so;
      int64_t v19 = strlen(a3);
      int v20 = LODWORD(__pmatch.rm_eo) - LODWORD(__pmatch.rm_so) - v19;
      if (v19 < __pmatch.rm_eo - __pmatch.rm_so) {
        size_t v18 = v19;
      }
      memcpy((void *)&a1[__pmatch.rm_so], a3, v18);
      if (v20 >= 1)
      {
        memset((void *)&a1[__pmatch.rm_so + v18], 62, v20);
        a1 += v20;
      }
    }
    if (v12 == 1)
    {
      uint64_t v11 = 0;
    }
    else
    {
      logfunction("", 1, @"regex matching failed for '%s': %d\n", v13, v14, v15, v16, v17, v4);
      uint64_t v11 = 0xFFFFFFFFLL;
    }
    regfree(&v23);
  }
  return v11;
}

void append_item_to_string(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
}

uint64_t get_system_partition_padding(const __CFDictionary *a1)
{
  uint64_t valuePtr = 0;
  if (!a1) {
    goto LABEL_41;
  }
  CFDictionaryRef v2 = IOBSDNameMatching(kIOMasterPortDefault, 0, "disk0");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if (!MatchingService)
  {
    logfunction("", 1, @"Could not find service for device with BSD name %s\n", v4, v5, v6, v7, v8, (char)"disk0");
LABEL_41:
    uint64_t v53 = 0;
    return v53 << 20;
  }
  io_object_t v9 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"Size", kCFAllocatorDefault, 0);
  uint64_t v16 = CFProperty;
  if (!CFProperty || (CFTypeID v17 = CFGetTypeID(CFProperty), v17 != CFNumberGetTypeID()))
  {
    logfunction("", 1, @"Invalid value '%@' for property key '%@'\n", v11, v12, v13, v14, v15, (char)v16);
    uint64_t v53 = 0;
    goto LABEL_38;
  }
  if (!CFNumberGetValue((CFNumberRef)v16, kCFNumberLongLongType, &valuePtr))
  {
    logfunction("", 1, @"Failed to convert '%@' to primitive value\n", v18, v19, v20, v21, v22, (char)v16);
LABEL_45:
    IOObjectRelease(v9);
    uint64_t v53 = 0;
LABEL_46:
    CFRelease(v16);
    return v53 << 20;
  }
  if (valuePtr >= 0) {
    unint64_t v23 = valuePtr;
  }
  else {
    unint64_t v23 = valuePtr + 0x3FFFFFFF;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"SystemPartitionPadding");
  if (!Value)
  {
    logfunction("", 1, @"No padding dictionary specified, returning default padding value %llu\n\n", v25, v26, v27, v28, v29, 0);
    goto LABEL_45;
  }
  CFDictionaryRef v30 = Value;
  size_t Count = CFDictionaryGetCount(Value);
  if (!Count)
  {
    logfunction("", 1, @"No padding entries, returning default padding value %llu\n\n", v32, v33, v34, v35, v36, 0);
    goto LABEL_45;
  }
  int64_t v37 = Count;
  uint64_t v38 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  uint64_t v39 = (const void **)malloc_type_calloc(v37, 8uLL, 0x6004044C4A2DFuLL);
  long long v45 = v39;
  if (!v38 || !v39)
  {
    logfunction("", 1, @"Failed to allocate key/value buffers to fetch system padding value\n\n", v40, v41, v42, v43, v44, v63);
    uint64_t v53 = 0;
    if (v38) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  CFDictionaryGetKeysAndValues(v30, v38, v39);
  __int16 v70 = 0;
  *(void *)buffer = 0;
  if (v37 < 1)
  {
    uint64_t v53 = 0;
    goto LABEL_51;
  }
  uint64_t v51 = 0;
  int v52 = 0;
  uint64_t v53 = 0;
  unint64_t v64 = v23 >> 30;
  int v65 = 0;
  do
  {
    CFStringRef v54 = (const __CFString *)v38[v51];
    CFNumberRef v55 = (const __CFNumber *)v45[v51];
    uint64_t v67 = 0;
    int v66 = 0;
    if (!v54)
    {
      CFStringRef v61 = @"Failed to get marketing size key from padding dict\n\n";
LABEL_33:
      logfunction("", 1, v61, v46, v47, v48, v49, v50, v63);
      goto LABEL_34;
    }
    if (!v55)
    {
      CFStringRef v61 = @"Failed to get padding size for key in padding dict\n\n";
      goto LABEL_33;
    }
    __int16 v70 = 0;
    *(void *)buffer = 0;
    if (!CFStringGetCString(v54, buffer, 10, 0x8000100u))
    {
      CFStringRef v61 = @"Failed to get C string from CFStringRef padding key\n\n";
      goto LABEL_33;
    }
    if (!sscanf(buffer, "%d", &v66))
    {
      CFStringRef v61 = @"Failed to parse out padding value from capacity string\n\n";
      goto LABEL_33;
    }
    if (!CFNumberGetValue(v55, kCFNumberSInt64Type, &v67))
    {
      CFStringRef v61 = @"Failed to convert CFNumberRef value into int\n\n";
      goto LABEL_33;
    }
    int v56 = v64 - v66;
    if ((int)v64 - v66 < 0) {
      int v56 = v66 - v64;
    }
    BOOL v57 = v51 != 0;
    BOOL v58 = v56 > v52;
    BOOL v59 = !v57 || !v58;
    if (v57 && v58)
    {
      int v60 = v65;
    }
    else
    {
      uint64_t v53 = v67;
      int v60 = v66;
    }
    int v65 = v60;
    if (v59) {
      int v52 = v56;
    }
LABEL_34:
    ++v51;
  }
  while (v37 != v51);
  if (v52 >= 11) {
    logfunction("", 1, @"Closest marketing capacity entry for padding was %dGB however this device is %dGB, this might not be optimal\n\n", v46, v47, v48, v49, v50, v65);
  }
LABEL_51:
  free(v38);
LABEL_52:
  if (v45) {
    free(v45);
  }
LABEL_38:
  IOObjectRelease(v9);
  if (v16) {
    goto LABEL_46;
  }
  return v53 << 20;
}

CFPropertyListRef load_plist_with_mutability_option(CFURLRef fileURL, CFOptionFlags a2)
{
  if (!fileURL) {
    return 0;
  }
  int v3 = CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if (CFReadStreamOpen(v3)) {
    CFPropertyListRef v5 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v4, 0, a2, 0, 0);
  }
  else {
    CFPropertyListRef v5 = 0;
  }
  CFReadStreamClose(v4);
  CFRelease(v4);
  return v5;
}

CFPropertyListRef load_dict(char *cStr)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    CFPropertyListRef plist_with_mutability_option = load_plist_with_mutability_option(v3, 0);
    CFRelease(v4);
  }
  else
  {
    CFPropertyListRef plist_with_mutability_option = 0;
  }
  CFRelease(v2);
  return plist_with_mutability_option;
}

uint64_t mkparentdir(uint64_t a1, mode_t a2)
{
  bzero(&v8, 0x400uLL);
  if (a1)
  {
    __strlcpy_chk();
    if (v8 == 47) {
      CFURLRef v4 = v9;
    }
    else {
      CFURLRef v4 = &v8;
    }
    do
    {
      if (!*v4) {
        break;
      }
      CFPropertyListRef v5 = strchr(v4, 47);
      CFURLRef v4 = v5;
      if (v5 > &v8)
      {
        memset(&v7, 0, sizeof(v7));
        *CFPropertyListRef v5 = 0;
        if (lstat(&v8, &v7) == -1 && mkdir(&v8, a2) == -1 && *__error() != 17) {
          return 0xFFFFFFFFLL;
        }
        *v4++ = 47;
      }
    }
    while (v4);
    return 0;
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
}

CFErrorRef _create_error_internal_with_userinfo_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, a5, a6, &a9);
}

CFErrorRef _vcreate_error_internal_with_userinfo_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14 = *__error();
  if (a5) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a5);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v16 = MutableCopy;
  if (MutableCopy)
  {
    CFStringRef v17 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a6, a7);
    if (v17)
    {
      CFStringRef v23 = v17;
      logfunction("", 1, @"%@ error %ld - %@\n", v18, v19, v20, v21, v22, (char)a1);
      CFDictionaryAddValue(v16, kCFErrorLocalizedDescriptionKey, v23);
      CFRelease(v23);
    }
    if (a3) {
      CFDictionaryAddValue(v16, kCFErrorUnderlyingErrorKey, a3);
    }
    if (a4) {
      CFDictionaryAddValue(v16, @"target_update", a4);
    }
    CFErrorRef v24 = CFErrorCreate(kCFAllocatorDefault, a1, a2, v16);
    CFRelease(v16);
  }
  else
  {
    CFErrorRef v24 = 0;
  }
  *__error() = v14;
  return v24;
}

CFErrorRef _create_error_internal_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0, a5, &a9);
}

__CFString *get_short_error_domain(__CFString *result)
{
  if (result)
  {
    CFStringRef Domain = CFErrorGetDomain((CFErrorRef)result);
    if (CFStringCompare(Domain, @"MobileSoftwareUpdateErrorDomain", 0))
    {
      if (CFStringCompare(Domain, @"RamrodErrorDomain", 0))
      {
        if (CFStringCompare(Domain, @"NRDUpdateErrorDomain", 0)) {
          return (__CFString *)Domain;
        }
        else {
          return @"NRD";
        }
      }
      else
      {
        return @"RRD";
      }
    }
    else
    {
      return @"MSU";
    }
  }
  return result;
}

__CFString *copy_underlying_error_description(__CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef v1 = a1;
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    unsigned int v3 = 0;
    do
    {
      short_error_domain = get_short_error_domain(v1);
      CFStringAppend(Mutable, short_error_domain);
      CFIndex Code = CFErrorGetCode((CFErrorRef)v1);
      CFStringAppendFormat(Mutable, 0, @" %ld", Code);
      CFDictionaryRef v6 = CFErrorCopyUserInfo((CFErrorRef)v1);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        CFDictionaryRef Value = CFDictionaryGetValue(v6, kCFErrorLocalizedDescriptionKey);
        if (Value
          || (CFDictionaryRef Value = CFDictionaryGetValue(v7, kCFErrorDescriptionKey)) != 0
          || (CFDictionaryRef Value = CFDictionaryGetValue(v7, kCFErrorLocalizedFailureReasonKey)) != 0
          || (CFDictionaryRef Value = CFDictionaryGetValue(v7, @"NSDebugDescription")) != 0)
        {
          CFStringAppendFormat(Mutable, 0, @" (%@)", Value);
        }
        CFStringRef v1 = (__CFString *)CFDictionaryGetValue(v7, kCFErrorUnderlyingErrorKey);
        CFRelease(v7);
      }
      CFStringAppend(Mutable, @";");
      if (!v1) {
        break;
      }
    }
    while (v3++ < 9);
  }
  return Mutable;
}

CFDictionaryRef cferror_to_dictionary(__CFError *a1)
{
  return cferror_to_dictionary_embedded(a1, 0);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  CFIndex valuePtr = CFErrorGetCode(a1);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  CFDictionaryRef v5 = CFErrorCopyUserInfo(a1);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  if (!v6)
  {
    logfunction("", 1, @"could not create cfnumber\n", v7, v8, v9, v10, v11, v29);
    CFDictionaryRef v19 = 0;
    if (!v5) {
      return v19;
    }
    goto LABEL_22;
  }
  CFNumberRef v12 = v6;
  *(_OWORD *)keys = *(_OWORD *)off_1000596E0;
  long long v35 = *(_OWORD *)&off_1000596F0;
  values[0] = v6;
  values[1] = (void *)Domain;
  CFDictionaryRef v32 = v5;
  uint64_t v33 = 0;
  if (!v5)
  {
    int v14 = 0;
    CFIndex v20 = 2;
    if (!a2) {
      goto LABEL_17;
    }
    uint64_t v21 = &v32;
    uint64_t v22 = 3;
    goto LABEL_16;
  }
  CFDictionaryRef Value = (__CFDictionary *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
  int v14 = Value;
  if (Value)
  {
    CFTypeID v15 = CFGetTypeID(Value);
    if (v15 == CFErrorGetTypeID() && (uint64_t v16 = cferror_to_dictionary_embedded(v14, 0)) != 0)
    {
      CFStringRef v17 = (const void *)v16;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v5);
      int v14 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, v17);
        CFDictionaryRef v32 = v14;
      }
      CFRelease(v17);
    }
    else
    {
      int v14 = 0;
    }
  }
  CFIndex v20 = 3;
  if (a2)
  {
    uint64_t v21 = (CFBooleanRef *)&v33;
    uint64_t v22 = 4;
LABEL_16:
    keys[v20] = @"_MSU_Embedded_Error";
    *uint64_t v21 = kCFBooleanTrue;
    CFIndex v20 = v22;
  }
LABEL_17:
  CFDictionaryRef v19 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v20, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v19) {
    logfunction("", 1, @"could not create cfdictionary\n", v23, v24, v25, v26, v27, v29);
  }
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(v12);
  if (v5) {
LABEL_22:
  }
    CFRelease(v5);
  return v19;
}

CFStringRef copy_dictionary_to_cferror(const void *a1)
{
  CFIndex valuePtr = 0;
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    CFStringRef v21 = @"marshalled cferror is not a dictionary.\n";
LABEL_17:
    logfunction("", 1, v21, v3, v4, v5, v6, v7, v23);
    return 0;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Code");
  if (!Value)
  {
    CFStringRef v21 = @"marshalled cferror is incomplete. missing code.\n";
    goto LABEL_17;
  }
  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    CFStringRef v21 = @"code not convert cfnumber code to cfindex\n";
    goto LABEL_17;
  }
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Domain");
  if (!v14)
  {
    logfunction("", 1, @"marshalled cferror is incomplete. missing domain.\n", v9, v10, v11, v12, v13, v23);
    return v14;
  }
  CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"UserInfo");
  if (!v15)
  {
    CFStringRef v21 = @"marshalled cferror is incomplete. missing \"UserInfo\".\n";
    goto LABEL_17;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v15);
  if (!MutableCopy)
  {
    CFStringRef v21 = @"code not create mutable copy of userInfo\n";
    goto LABEL_17;
  }
  CFStringRef v17 = MutableCopy;
  uint64_t v18 = CFDictionaryGetValue(MutableCopy, kCFErrorUnderlyingErrorKey);
  CFDictionaryRef v19 = (const void *)copy_dictionary_to_cferror(v18);
  if (v19)
  {
    CFIndex v20 = v19;
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, v19);
    CFRelease(v20);
  }
  CFStringRef v14 = (const __CFString *)CFErrorCreate(kCFAllocatorDefault, v14, valuePtr, v17);
  CFRelease(v17);
  return v14;
}

uint64_t calculate_snapshot_overhead(uint64_t a1)
{
  return (uint64_t)((double)a1 * 1.05 + 293601280.0);
}

uint64_t performCryptegraftSemiSplat(const void *a1, const __CFString **a2)
{
  uint64_t v4 = copy_shared_cryptegraft_service_connection();
  if (v4)
  {
    uint64_t v8 = (_xpc_connection_s *)v4;
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "Command", "CryptegraftSemiSplat");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (a1)
    {
      CFTypeID v16 = CFGetTypeID(a1);
      if (v16 == CFStringGetTypeID()) {
        CFDictionarySetValue(Mutable, @"TargetVolume", a1);
      }
    }
    msu_serialize_cf_object_into_xpc_dict(v9, "CommandParameters", Mutable, v10, v11, v12, v13, v14);
    if (Mutable) {
      CFRelease(Mutable);
    }
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v8, v9);
    uint64_t v22 = msu_demux_reply(v17, 0, 0, a2, v18, v19, v20, v21);
    xpc_release(v9);
    if (v17) {
      xpc_release(v17);
    }
    xpc_release(v8);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cryptegraft connection", v5, v6, v7, v25);
    if (a2)
    {
      uint64_t v22 = 0;
      *a2 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v22;
}

uint64_t copy_shared_cryptegraft_service_connection()
{
  if (get_cryptegraft_service_queue_queue_once != -1) {
    dispatch_once(&get_cryptegraft_service_queue_queue_once, &__block_literal_global_26);
  }
  dispatch_sync((dispatch_queue_t)get_cryptegraft_service_queue_queue, &__block_literal_global_5);
  return copy_shared_cryptegraft_service_connection_service_connection;
}

uint64_t performCryptegraftDownlevel(const void *a1, const void *a2, const __CFString **a3)
{
  uint64_t v6 = copy_shared_cryptegraft_service_connection();
  if (v6)
  {
    uint64_t v10 = (_xpc_connection_s *)v6;
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v11, "Command", "CryptegraftDownlevel");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (a1)
    {
      CFTypeID v18 = CFGetTypeID(a1);
      if (v18 == CFStringGetTypeID()) {
        CFDictionarySetValue(Mutable, @"TargetVolume", a1);
      }
    }
    if (a2)
    {
      CFTypeID v19 = CFGetTypeID(a2);
      if (v19 == CFURLGetTypeID()) {
        CFDictionarySetValue(Mutable, @"SourcePath", a2);
      }
    }
    msu_serialize_cf_object_into_xpc_dict(v11, "CommandParameters", Mutable, v12, v13, v14, v15, v16);
    if (Mutable) {
      CFRelease(Mutable);
    }
    xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(v10, v11);
    uint64_t v25 = msu_demux_reply(v20, 0, 0, a3, v21, v22, v23, v24);
    xpc_release(v11);
    if (v20) {
      xpc_release(v20);
    }
    xpc_release(v10);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cryptegraft connection", v7, v8, v9, v28);
    if (a3)
    {
      uint64_t v25 = 0;
      *a3 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v25;
}

void __copy_shared_cryptegraft_service_connection_block_invoke(id a1)
{
  CFStringRef v1 = (void *)copy_shared_cryptegraft_service_connection_service_connection;
  if (!copy_shared_cryptegraft_service_connection_service_connection)
  {
    if (!dlopen("/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework/MobileSoftwareUpdate", 1))
    {
      char v13 = dlerror();
      logfunction("", 1, @"failed to dlopen(3) MobileSoftwareUpdate framework: %s\n", v8, v9, v10, v11, v12, v13);
      return;
    }
    if (get_cryptegraft_service_queue_queue_once != -1) {
      dispatch_once(&get_cryptegraft_service_queue_queue_once, &__block_literal_global_26);
    }
    CFTypeID v2 = xpc_connection_create("com.apple.MobileSoftwareUpdate.CryptegraftService", (dispatch_queue_t)get_cryptegraft_service_queue_queue);
    copy_shared_cryptegraft_service_connection_service_connection = (uint64_t)v2;
    if (!v2)
    {
      logfunction("", 1, @"Could not create connection to service %s\n", v3, v4, v5, v6, v7, (char)"com.apple.MobileSoftwareUpdate.CryptegraftService");
      return;
    }
    xpc_connection_set_event_handler(v2, &__block_literal_global_23);
    xpc_connection_resume((xpc_connection_t)copy_shared_cryptegraft_service_connection_service_connection);
    CFStringRef v1 = (void *)copy_shared_cryptegraft_service_connection_service_connection;
  }
  xpc_retain(v1);
}

void __copy_shared_cryptegraft_service_connection_block_invoke_2(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && copy_shared_cryptegraft_service_connection_service_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_cryptegraft_service_connection_service_connection);
    copy_shared_cryptegraft_service_connection_service_connection = 0;
  }
}

void __get_cryptegraft_service_queue_block_invoke(id a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  *(_OWORD *)__str = 0u;
  long long v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.MobileSoftwareUpdate.CryptegraftService");
  get_cryptegraft_service_queue_queue = (uint64_t)dispatch_queue_create(__str, 0);
}

uint64_t get_msubrain()
{
  return msubrain;
}

int main(int argc, const char **argv, const char **envp)
{
  openlog("softwareupdated", 1, 24);
  long long v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MAIN] softwareupdated starting up", buf, 2u);
  }
  if ((openRestoreLogFile(1) & 0x80000000) != 0)
  {
    long long v5 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      main_cold_6(v5);
    }
  }
  uint64_t v6 = atexit((void (*)(void))closeRestoreLogFile);
  if (v6)
  {
    uint64_t v6 = os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR);
    if (v6) {
      main_cold_5();
    }
  }
  CFTypeRef cf = 0;
  int v14 = msu_running_in_limited_environment(v6, v7, v8, v9, v10, v11, v12, v13);
  long long v15 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MAIN] softwareupdated running in limited environment..Skipping cleanup and saveCurrentEnv calls", buf, 2u);
    }
    goto LABEL_62;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MAIN] softwareupdated running in regular environment..Performing cleanup and saveCurrentEnv calls", buf, 2u);
  }
  handle_update_metrics();
  xpc_object_t v17 = +[NSFileManager defaultManager];
  if (is_first_boot_after_update())
  {
    *(void *)uint64_t v47 = 0;
    [(NSFileManager *)v17 removeItemAtPath:@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/updateDate" error:v47];
    if (*(void *)v47)
    {
      CFTypeID v18 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = *(void *)v47;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MAIN] Unable to remove date file : %{public}@", buf, 0xCu);
      }
    }
    CFTypeID v19 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[MAIN] Creating new date file", buf, 2u);
    }
    CFStringRef v46 = 0;
    xpc_object_t v20 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDate date], 1, &v46);
    if (!v20 || v46)
    {
      char v28 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = v46;
        if (!v46) {
          CFStringRef v29 = @"Unknown Error";
        }
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v29;
        uint64_t v25 = "[MAIN] Unable to create date data : %{public}@";
        uint64_t v26 = v28;
        uint32_t v27 = 12;
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v21 = v20;
      id v22 = [@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/updateDate" stringByDeletingLastPathComponent];
      if (![(NSFileManager *)v17 fileExistsAtPath:v22])
      {
        uint64_t v45 = 0;
        [(NSFileManager *)v17 createDirectoryAtPath:v22 withIntermediateDirectories:1 attributes:0 error:&v45];
        if (v45)
        {
          uint64_t v23 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v45;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[MAIN] Unable to create controller folder for softwareupdated: %{public}@", buf, 0xCu);
          }
        }
      }
      [(NSFileManager *)v17 createFileAtPath:@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/updateDate" contents:v21 attributes:0];
      uint64_t v24 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v25 = "[MAIN] Done writing update date";
        uint64_t v26 = v24;
        uint32_t v27 = 2;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
  }
  unsigned int previous_update_state = retrieve_previous_update_state();
  if (is_first_boot_after_update() && previous_update_state == 2)
  {
    char v31 = perform_cleanup_and_disable_staged_assets_command(0, 0, (const __CFString **)&cf);
    CFDictionaryRef v32 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v34 = "[MAIN] Called clean up prepare path and staged assets";
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      main_cold_3();
    }
LABEL_46:
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    goto LABEL_48;
  }
  char v35 = perform_cleanup_command(0, 1, 0, (const __CFString **)&cf);
  uint64_t v36 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v33 = v36;
  if ((v35 & 1) == 0)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      main_cold_4();
    }
    goto LABEL_46;
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v34 = "[MAIN] Called clean up prepare path";
    goto LABEL_41;
  }
LABEL_48:
  int64_t v37 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[MAIN] Cleaning up RecoveryOS state files", buf, 2u);
  }
  *(void *)buf = 0;
  char v38 = perform_cleanup_recoveryos_saved_state_command((const __CFString **)buf);
  uint64_t v39 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v40 = v39;
  if (v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[MAIN] Successfully cleaned up RecoveryOS state files", v47, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      main_cold_2();
    }
    if (*(void *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(void *)buf = 0;
    }
  }
  if (msu_should_save_env_info_for_recovery())
  {
    if ((saveCurrentEnvInfoForNeRD(0) & 1) == 0)
    {
      uint64_t v41 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        main_cold_1(v41);
      }
    }
  }
  xpc_activity_register("com.apple.softwareupdated.logs-cleanup", XPC_ACTIVITY_CHECK_IN, &__block_literal_global_6);
LABEL_62:
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_12);
  uint64_t v43 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[MAIN] softwareupdated ready to handle client messages", buf, 2u);
  }
  xpc_connection_resume(mach_service);
  CFRunLoopRun();
  return 0;
}

void handle_update_metrics()
{
  v0 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | BEGIN", buf, 0xCu);
  }
  id v1 = +[UMEventRecorder recorder];
  CFTypeRef cf = 0;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  long long v3 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v57 = @"handle_update_metrics";
      __int16 v58 = 2112;
      CFStringRef v59 = @"TestInhibitPromptForTTR";
      __int16 v60 = 2112;
      CFStringRef v61 = @"msu-test-inhibit-ttr";
      long long v5 = "[UPDATE_METRICS] %@ | softwareupdated supporting TTR prompt disable [preference %@, NVRAM %@]";
      uint64_t v6 = v3;
      uint32_t v7 = 32;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else if (v4)
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    long long v5 = "[UPDATE_METRICS] %@ | softwareupdated running on iOS";
    uint64_t v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_8;
  }
  uint64_t previous_update_unresolved_tolerated_failures_count = get_previous_update_unresolved_tolerated_failures_count();
  id updated = MSUCopyPreviousUpdateAllToleratedFailures();
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  if (updated || (id updated = objc_alloc_init((Class)NSMutableDictionary)) != 0)
  {
    uint64_t v11 = [[+[NSString stringWithFormat:@"%@", updated] stringByReplacingOccurrencesOfString:@"\n" withString:@" "] stringByReplacingOccurrencesOfString:@"=" withString:@":"];
    if (v10)
    {
      [v10 setObject:v11 forKeyedSubscript:@"toleratedSteps"];
      objc_msgSend(v10, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", previous_update_unresolved_tolerated_failures_count), @"toleratedFailureCount");
    }
  }
  else
  {
    uint32_t v27 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v12 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v12) {
      handle_update_metrics_cold_3(v27, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  if ((msu_running_in_limited_environment(v12, v13, v14, v15, v16, v17, v18, v19) & 1) == 0)
  {
    xpc_object_t v20 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS]: | Attempting to read asset audience", buf, 2u);
    }
    uint64_t v21 = MAGetPallasAudience();
    id v22 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v57 = (const __CFString *)v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS]: | Asset audience %{public}@ found", buf, 0xCu);
      }
      if (v10)
      {
        [v10 setValue:v21 forKey:@"MobileAssetAssetAudience"];
        uint64_t v24 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v25 = "[UPDATE_METRICS]: | Set asset audience in dict";
LABEL_29:
          uint64_t v26 = v24;
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v24 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v25 = "[UPDATE_METRICS]: | Dict does not exist. Unable to set asset audience";
          goto LABEL_29;
        }
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "[UPDATE_METRICS]: | Unable to determine asset audience";
      uint64_t v26 = v22;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    }
  }
  uint64_t v28 = gpu_dynamic_stats();
  if (v28 && v10) {
    [v10 setValue:v28 forKey:@"GPUDynamicStats"];
  }
  int v29 = MSUShouldPromptTTR();
  CFDictionaryRef v30 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v29)
  {
    if (v31)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = @"handle_update_metrics";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | record updateFinished (should prompt for TTR)", buf, 0xCu);
    }
    softwareupdated_add_additional_analytics_data_for_phase(v10);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = __handle_update_metrics_block_invoke;
    v54[3] = &unk_100059B30;
    v54[4] = @"handle_update_metrics";
    [v1 recordPostUpdateEvent:@"updateFinished" additionalInfo:v10 withCallback:v54];
    if (!v10) {
      goto LABEL_43;
    }
LABEL_42:

    goto LABEL_43;
  }
  if (v31)
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | record updateFinished", buf, 0xCu);
  }
  softwareupdated_add_additional_analytics_data_for_phase(v10);
  [v1 recordPostUpdateEvent:@"updateFinished" additionalInfo:v10];
  if (v10) {
    goto LABEL_42;
  }
LABEL_43:
  CFDictionaryRef v32 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | Clean up NVRAM", buf, 0xCu);
  }
  if ((perform_cleanup_NVRAM_command((const __CFString **)&cf) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      handle_update_metrics_cold_2();
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  uint64_t v33 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | Submit any accumulated events", buf, 0xCu);
  }
  id v34 = [v1 submitEventsInBackground:1];
  if ((msu_running_in_limited_environment((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41) & 1) == 0)
  {
    uint64_t v42 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = @"handle_update_metrics";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | Flushing RecoveryOS controller events", buf, 0xCu);
    }
    id v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s/%s", "/private/var/MobileSoftwareUpdate/", "Controller/NeRD");
    if (v43)
    {
      uint64_t v44 = v43;
      objc_msgSend(+[SUCoreEventReporter initSharedReporterStoringToPath:](SUCoreEventReporter, "initSharedReporterStoringToPath:", v43), "flushEvent");
    }
    else
    {
      uint64_t v45 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        handle_update_metrics_cold_1(v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
  }
  uint64_t v53 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = @"handle_update_metrics";
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | DONE", buf, 0xCu);
  }
}

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  CFTypeRef cf = 0;
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  long long v5 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "clean_update_logs";
    __int16 v34 = 2048;
    xpc_activity_state_t v35 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s state=%ld", buf, 0x16u);
  }
  xpc_object_t v6 = xpc_activity_copy_criteria(a2);
  xpc_object_t v7 = v6;
  if (state == 2)
  {
    if (xpc_activity_should_defer(a2))
    {
      BOOL v11 = xpc_activity_set_state(a2, 3);
      BOOL v12 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v13 = "failure";
      if (v11) {
        uint64_t v13 = "success";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "clean_update_logs";
      __int16 v34 = 2080;
      xpc_activity_state_t v35 = (xpc_activity_state_t)v13;
      uint64_t v14 = "%s should defer activity, %s";
      uint64_t v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_17;
    }
  }
  else
  {
    if (state) {
      goto LABEL_18;
    }
    if (v6)
    {
      int64_t int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY);
      uint64_t v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (int64 != XPC_ACTIVITY_INTERVAL_7_DAYS)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v33 = "clean_update_logs";
          __int16 v34 = 2048;
          xpc_activity_state_t v35 = int64;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s activity already set, delay=%lld", buf, 0x16u);
        }
        goto LABEL_38;
      }
      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "clean_update_logs";
        __int16 v34 = 2048;
        xpc_activity_state_t v35 = int64;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s activity is set with default retention %lld", buf, 0x16u);
      }
    }
  }
  if (os_variant_is_recovery())
  {
    uint64_t v17 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = "clean_update_logs";
    uint64_t v14 = "%s os variant is recovery";
    uint64_t v15 = v17;
    uint32_t v16 = 12;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_18:
    if (!v7) {
      goto LABEL_39;
    }
LABEL_38:
    xpc_release(v7);
    goto LABEL_39;
  }
  uint64_t v30 = -1;
  if (perform_logs_cleanup_command(XPC_ACTIVITY_INTERVAL_7_DAYS, &v30, (const __CFString **)&cf))
  {
    int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY;
    if (v30 >= 0) {
      int64_t v19 = XPC_ACTIVITY_INTERVAL_7_DAYS - v30;
    }
    else {
      int64_t v19 = XPC_ACTIVITY_INTERVAL_7_DAYS;
    }
    if (XPC_ACTIVITY_INTERVAL_7_DAYS - v30 >= XPC_ACTIVITY_INTERVAL_1_DAY) {
      int64_t v20 = v19;
    }
    else {
      int64_t v20 = XPC_ACTIVITY_INTERVAL_1_DAY;
    }
    uint64_t v21 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = "clean_update_logs";
      __int16 v34 = 2048;
      xpc_activity_state_t v35 = v30;
      __int16 v36 = 2048;
      int64_t v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s oldest=%lld, new delay=%lld", buf, 0x20u);
    }
    if (v7) {
      goto LABEL_37;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __main_block_invoke_cold_2();
    }
    int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY;
    int64_t v20 = XPC_ACTIVITY_INTERVAL_1_DAY;
    if (v7) {
      goto LABEL_37;
    }
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
LABEL_37:
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, v20);
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, v18);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_activity_set_criteria(a2, v7);
    goto LABEL_38;
  }
  id v22 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __main_block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
  }
LABEL_39:
  if (cf) {
    CFRelease(cf);
  }
}

void __main_block_invoke_2(id a1, OS_xpc_object *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(a2, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __main_block_invoke_3;
    handler[3] = &unk_100059B08;
    handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    if ((msu_client_is_entitled(a2, (uint64_t)"com.apple.private.softwareupdated-helpers") & 1) == 0)
    {
      if (get_peer_connections_queue_peer_connections_queue_once != -1) {
        dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_479);
      }
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = __main_block_invoke_15;
      v4[3] = &unk_100059AE0;
      v4[4] = a2;
      dispatch_sync((dispatch_queue_t)get_peer_connections_queue_peer_connections_queue, v4);
    }
    xpc_connection_resume(a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __main_block_invoke_2_cold_1(a2);
    }
    exit(0);
  }
}

void __main_block_invoke_3(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      uint32_t v16 = xpc_copy_description(object);
      if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        __main_block_invoke_3_cold_2();
      }
      free(v16);
      return;
    }
    if (get_peer_connections_queue_peer_connections_queue_once != -1) {
      dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_479);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __main_block_invoke_4;
    block[3] = &unk_100059AE0;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync((dispatch_queue_t)get_peer_connections_queue_peer_connections_queue, block);
    if (object == &_xpc_error_connection_interrupted)
    {
      int64_t v20 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      string = xpc_dictionary_get_string(&_xpc_error_connection_interrupted, _xpc_error_key_description);
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = string;
      id v22 = "[PEER_CONNECTION] Remote service has exited (%s) | Connection remains live as means to trigger remote servic"
            "e re-launch on-demand";
    }
    else
    {
      if (object != &_xpc_error_connection_invalid)
      {
        int64_t v18 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        int64_t v19 = v18;
        if (object != &_xpc_error_termination_imminent)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __main_block_invoke_3_cold_1(object);
          }
          return;
        }
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        uint64_t v25 = xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
        *(_DWORD *)buf = 136315138;
        uint64_t v28 = v25;
        id v22 = "[PEER_CONNECTION] Connection will terminate soon (%s) | All outstanding transactions must be wound down, n"
              "o new transactions";
        uint64_t v24 = v19;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        return;
      }
      int64_t v20 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v23 = xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = v23;
      id v22 = "[PEER_CONNECTION] Connection has become invalid (%s) | Connection is no longer part of the XPC namespace";
    }
    uint64_t v24 = v20;
    goto LABEL_22;
  }
  uint64_t v17 = *(_xpc_connection_s **)(a1 + 32);
  handle_message(v17, object, (uint64_t)&jump_table, 27, v12, v13, v14, v15, a9);
}

uint64_t get_peer_connections_queue()
{
  if (get_peer_connections_queue_peer_connections_queue_once != -1) {
    dispatch_once(&get_peer_connections_queue_peer_connections_queue_once, &__block_literal_global_479);
  }
  return get_peer_connections_queue_peer_connections_queue;
}

id __main_block_invoke_4(uint64_t a1)
{
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_482);
  }
  long long v2 = (void *)get_peer_connections_array_peer_connections_array;
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 removeObject:v3];
}

id __main_block_invoke_15(uint64_t a1)
{
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_482);
  }
  long long v2 = (void *)get_peer_connections_array_peer_connections_array;
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 addObject:v3];
}

id initDecodeClasses()
{
  id v0 = objc_alloc((Class)NSSet);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v1 = +[NSArray arrayWithObjects:&v3 count:9];
  id result = objc_msgSend(v0, "initWithArray:", v1, v3, v4, v5, v6, v7, v8, v9, v10);
  _decodeClasses = (uint64_t)result;
  return result;
}

void softwareupdated_add_additional_analytics_data_for_phase(void *a1)
{
  long long v2 = [[MSUAnalytics alloc] initWithPhase:5];
  id v3 = [(MSUAnalytics *)v2 copyAnalyticsData];
  char v4 = MGGetBoolAnswer();
  if (v3)
  {
    char v5 = v4;
    id v6 = [v3 mutableCopy];
    if (v6)
    {
      uint64_t v7 = v6;
      if ((v5 & 1) == 0)
      {
        [v6 removeObjectForKey:@"personId"];
        [v7 removeObjectForKey:@"serialNumber"];
      }
      uint64_t v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS]: Adding additional data to eventStats: %@", (uint8_t *)&v10, 0xCu);
      }
      [a1 addEntriesFromDictionary:v7];
    }
    else
    {
      uint64_t v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS]: Failed to make a copy of the analyticsData dict", (uint8_t *)&v10, 2u);
      }
    }
  }
}

void __handle_update_metrics_block_invoke(uint64_t a1, void *a2)
{
  char v5 = &APFSContainerGetSpaceInfo_ptr;
  id v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = &off_100040000;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    CFStringRef v57 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | updateFinished callback | BEGIN", buf, 0xCu);
  }
  id v9 = [a2 objectForKeyedSubscript:@"otaOutcome"];
  id v10 = [a2 objectForKeyedSubscript:@"failureReason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if ([a2 objectForKeyedSubscript:@"migratorMetrics"]
    && (objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"migratorMetrics"), "containsString:", @"result=0") & 1) == 0)
  {
    if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/lastOTA/apfs_migrator_verification.log"])
    {
      CFStringRef v13 = @"during APFS Migrator";
      int v12 = 1;
    }
    else
    {
      id v55 = v10;
      uint64_t v21 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found migrator failure, but no verification log", buf, 2u);
      }
      int v12 = 0;
      CFStringRef v13 = 0;
      id v10 = v55;
    }
  }
  else
  {
    int v12 = 0;
    CFStringRef v13 = 0;
  }
  if (!v11) {
    goto LABEL_13;
  }
  unsigned int v14 = [v11 isEqualToString:@"success"] ^ 1;
  if (v10) {
    unsigned int v14 = 1;
  }
  if ((v12 | v14) == 1)
  {
LABEL_13:
    uint64_t v53 = v4;
    id v54 = v10;
    uint64_t v15 = a1;
    id v16 = [a2 objectForKeyedSubscript:@"deviceModel"];
    id v17 = [a2 objectForKeyedSubscript:@"targetOSVersion"];
    id v18 = [a2 objectForKeyedSubscript:@"originalOSVersion"];
    id v19 = [a2 objectForKeyedSubscript:@"toleratedFailureCount"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v19 = 0;
    }
    if ([v11 containsString:@"fail_forward"])
    {
      CFStringRef v13 = @"while cleaning up, but booted the new OS anyway";
    }
    else if ([v11 containsString:@"back"])
    {
      CFStringRef v13 = @"to install";
    }
    else if (v19 && ![v19 isEqualToNumber:&off_1000649E0])
    {
      CFStringRef v13 = @"to update all device firmware";
    }
    else
    {
      unsigned int v20 = [v11 isEqualToString:@"success_on_reboot_retry"];
      if (v20) {
        CFStringRef v13 = @"initially and had to restart";
      }
      if (((v12 | v20) & 1) == 0)
      {
        if ([v11 isEqualToString:@"success"]) {
          CFStringRef v13 = @"in a non-fatal way";
        }
        else {
          CFStringRef v13 = @"in an unexpected way";
        }
      }
    }
    a1 = v15;
    id v22 = +[NSString stringWithFormat:@"Your OTA update failed %@", v13];
    uint64_t v23 = +[NSString stringWithFormat:@"%@/%@: OTA Update outcome %@ with reason %@", v16, v17, v9, v54];
    uint64_t v24 = +[NSString stringWithFormat:@"My OTA update attempt from %@ to %@ failed %@...\n\nEvent details:\n%@", v18, v17, v13, a2];
    CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
    AppBooleanCFNumberRef Value = CFPreferencesGetAppBooleanValue(@"TestInhibitPromptForTTR", @"com.apple.MobileSoftwareUpdate", 0);
    char v5 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v26 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (AppBooleanValue)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v57 = @"is_tap_to_radar_inhibited";
        __int16 v58 = 2114;
        CFStringRef v59 = @"TestInhibitPromptForTTR";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %{public}@ | %{public}@=true | not prompting for TTR", buf, 0x16u);
      }
LABEL_36:
      uint64_t v28 = objc_msgSend(objc_msgSend(v5[444], "sharedLogger"), "oslog");
      char v4 = v53;
      uint64_t v7 = &off_100040000;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        CFStringRef v57 = v29;
        __int16 v58 = 2112;
        CFStringRef v59 = (const __CFString *)v22;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | updateFinished callback | WARNING(INTERNAL-ONLY) | not prompting for TTR: %@", buf, 0x16u);
      }
      goto LABEL_60;
    }
    if (v27)
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v57 = @"is_tap_to_radar_inhibited";
      __int16 v58 = 2114;
      CFStringRef v59 = @"TestInhibitPromptForTTR";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %{public}@ | checked %{public}@ | no preference based inhibit of prompting for TTR", buf, 0x16u);
    }
    io_registry_entry_t v30 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (!v30)
    {
      uint64_t v38 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v57 = @"is_tap_to_radar_inhibited";
        uint64_t v39 = "[UPDATE_METRICS] %{public}@ | WARNING | unable to obtain reference to IO device tree options";
        uint64_t v40 = v38;
        uint32_t v41 = 12;
LABEL_56:
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
      }
LABEL_57:
      uint64_t v49 = objc_msgSend(objc_msgSend(v5[444], "sharedLogger"), "oslog");
      char v4 = v53;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v50 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        CFStringRef v57 = v50;
        __int16 v58 = 2112;
        CFStringRef v59 = (const __CFString *)v22;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | updateFinished callback | prompting for TTR: %@", buf, 0x16u);
      }
      MSUPromptForTTR((uint64_t)v22, (uint64_t)v23, (uint64_t)v24);
      uint64_t v7 = &off_100040000;
      goto LABEL_60;
    }
    io_object_t v31 = v30;
    CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v30, @"msu-test-inhibit-ttr", kCFAllocatorDefault, 0);
    IOObjectRelease(v31);
    if (CFProperty)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = (const char *)[CFProperty bytes];
        id v34 = objc_alloc((Class)NSString);
        size_t v35 = strnlen(v33, (size_t)[CFProperty length]);
        __int16 v36 = v34;
        char v5 = &APFSContainerGetSpaceInfo_ptr;
        id v37 = [v36 initWithBytes:v33 length:v35 encoding:4];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_54;
        }
        id v37 = [CFProperty copy];
      }
      uint64_t v42 = v37;

      if (v42)
      {
        unsigned int v43 = [v42 isEqualToString:@"true"];
        uint64_t v44 = v5;
        unsigned int v45 = v43;
        uint64_t v46 = objc_msgSend(objc_msgSend(v44[444], "sharedLogger"), "oslog");
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        if (v45)
        {
          if (v47)
          {
            *(_DWORD *)buf = 138543618;
            CFStringRef v57 = @"is_tap_to_radar_inhibited";
            __int16 v58 = 2114;
            CFStringRef v59 = @"msu-test-inhibit-ttr";
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %{public}@ | %{public}@=true | not prompting for TTR", buf, 0x16u);
          }

          char v5 = &APFSContainerGetSpaceInfo_ptr;
          goto LABEL_36;
        }
        if (v47)
        {
          *(_DWORD *)buf = 138543874;
          CFStringRef v57 = @"is_tap_to_radar_inhibited";
          __int16 v58 = 2114;
          CFStringRef v59 = @"msu-test-inhibit-ttr";
          __int16 v60 = 2114;
          CFStringRef v61 = v42;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %{public}@ | %{public}@=%{public}@ | no NVRAM based inhibit of prompting for TTR", buf, 0x20u);
        }

        char v5 = &APFSContainerGetSpaceInfo_ptr;
        goto LABEL_57;
      }
    }
LABEL_54:
    uint64_t v48 = objc_msgSend(objc_msgSend(v5[444], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v57 = @"is_tap_to_radar_inhibited";
      __int16 v58 = 2114;
      CFStringRef v59 = @"msu-test-inhibit-ttr";
      uint64_t v39 = "[UPDATE_METRICS] %{public}@ | checked %{public}@ | no valid value for NVRAM based inhibit of prompting for TTR";
      uint64_t v40 = v48;
      uint32_t v41 = 22;
      goto LABEL_56;
    }
    goto LABEL_57;
  }
LABEL_60:
  uint64_t v51 = objc_msgSend(objc_msgSend(v5[444], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v52 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = *((void *)v7 + 355);
    CFStringRef v57 = v52;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[UPDATE_METRICS] %@ | updateFinished callback | DONE", buf, 0xCu);
  }
}

void handle_create_update_brain_connection(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0;
  CFStringRef v6 = msu_deserialize_cf_object_from_xpc_dict(a2, "UpdateAttributes");
  CFTypeRef v7 = (id)CFMakeCollectable(v6);
  if (get_softwareupdated_queue_queue_once != -1) {
    dispatch_once(&get_softwareupdated_queue_queue_once, &__block_literal_global_223);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __copy_shared_update_brain_connection_block_invoke;
  block[3] = &unk_100059BA0;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  block[7] = v6;
  block[8] = &cf;
  dispatch_sync((dispatch_queue_t)get_softwareupdated_queue_queue, block);
  uint64_t v11 = (_xpc_connection_s *)copy_shared_update_brain_connection_brain_connection;
  CFErrorRef error_internal_cf = (__CFString *)cf;
  if (copy_shared_update_brain_connection_brain_connection)
  {
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __handle_create_update_brain_connection_block_invoke;
    v15[3] = &unk_100059B58;
    void v15[4] = a3;
    v15[5] = v7;
    if (handle_create_update_brain_connection_onceToken != -1) {
      dispatch_once(&handle_create_update_brain_connection_onceToken, v15);
    }
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    xpc_endpoint_t v14 = xpc_endpoint_create(v11);
    xpc_dictionary_set_value(reply, "UpdateBrainServiceEndPoint", v14);
    xpc_connection_send_message(a1, reply);
    xpc_release(reply);
    xpc_release(v11);
    xpc_release(v14);
  }
  else
  {
    if (!cf)
    {
      CFErrorRef error_internal_cf = (__CFString *)_create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No service connection", v8, v9, v10, v15[0]);
      CFTypeRef cf = error_internal_cf;
    }
    record_brain_load_event(a3, (uint64_t)v7, error_internal_cf);
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf) {
      CFRelease(cf);
    }
  }
}

void handle_purge_suspended_update(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0;
  if (theDict) {
    CFNumberRef Value = CFDictionaryGetValue(theDict, @"TargetUUID");
  }
  else {
    CFNumberRef Value = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  id v7 = +[UMEventRecorder recorder];
  [v7 recordEvent:@"purge" information:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __handle_purge_suspended_update_block_invoke;
  v8[3] = &unk_100059AE0;
  void v8[4] = v7;
  dispatch_async(global_queue, v8);
  if (perform_cleanup_staged_assets_command(1, Value, (const __CFString **)&cf))
  {
    msu_send_status(a1, a2, 0);
  }
  else
  {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
    CFRelease(cf);
  }
}

void handle_calculate_prepare_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t v18 = 0;
  uint64_t valuePtr = 0;
  CFErrorRef error_internal_cf = 0;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    uint64_t v10 = CFDictionaryGetValue(theDict, @"TargetUUID");
    if (MSUAssetCalculatePrepareSizes_server((uint64_t)v10, Value, &valuePtr, &v18, &error_internal_cf))
    {
      CFDictionaryRef Value = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (Value)
      {
        id v14 = +[NSMutableDictionary dictionary];
        [v14 setObject:Value forKeyedSubscript:@"Size"];
        objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v18), @"SnapshotSize");
        msu_send_status(a1, a2, v14);
      }
      else
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Could not create CFNumber from %llu", v11, v12, v13, valuePtr);
        msu_send_error(a1, a2, error_internal_cf, 1);
      }
    }
    else
    {
      msu_send_error(a1, a2, error_internal_cf, 1);
      CFDictionaryRef Value = 0;
    }
    uint64_t v15 = error_internal_cf;
    if (error_internal_cf) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"No asset properties in request", v6, v7, v8, v16);
    CFErrorRef error_internal_cf = v15;
    msu_send_error(a1, a2, v15, 1);
    if (v15)
    {
LABEL_10:
      CFRelease(v15);
      CFErrorRef error_internal_cf = 0;
    }
  }
  if (Value) {
    CFRelease(Value);
  }
}

void handle_calculate_apply_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t v17 = 0;
  uint64_t valuePtr = 0;
  CFErrorRef error_internal_cf = 0;
  CFDictionaryRef Value = (void *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    if (MSUAssetCalculateApplySizes_server(Value, &valuePtr, &v17, &error_internal_cf))
    {
      CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (v12)
      {
        id v13 = +[NSMutableDictionary dictionary];
        [v13 setObject:v12 forKeyedSubscript:@"Size"];
        objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17), @"SnapshotSize");
        msu_send_status(a1, a2, v13);
      }
      else
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Could not create CFNumber from %llu", v9, v10, v11, valuePtr);
        msu_send_error(a1, a2, error_internal_cf, 1);
      }
    }
    else
    {
      msu_send_error(a1, a2, error_internal_cf, 1);
      CFNumberRef v12 = 0;
    }
    id v14 = error_internal_cf;
    if (error_internal_cf) {
      goto LABEL_10;
    }
  }
  else
  {
    id v14 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"No asset properties in request", v6, v7, v8, v15);
    CFErrorRef error_internal_cf = v14;
    msu_send_error(a1, a2, v14, 1);
    CFNumberRef v12 = 0;
    if (v14)
    {
LABEL_10:
      CFRelease(v14);
      CFErrorRef error_internal_cf = 0;
    }
  }
  if (v12) {
    CFRelease(v12);
  }
}

id handle_ma_load_brain(void *a1, void *a2, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"AssetProperties");
  id ObjectFromMessage = getObjectFromMessage(a2);
  if (ObjectFromMessage)
  {
    if (objc_opt_respondsToSelector())
    {
      id ObjectFromMessage = [ObjectFromMessage objectForKey:@"DownloadOptions"];
      logfunction("", 1, @"Caller has pased in downloadOptions: %@\n", v13, v14, v15, v16, v17, (char)ObjectFromMessage);
    }
    else
    {
      id ObjectFromMessage = 0;
    }
  }
  logfunction("", 1, @"The attributes are: %@\n", v7, v8, v9, v10, v11, (char)Value);
  uint64_t v18 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:Value];
  xpc_retain(a1);
  xpc_retain(a2);
  uint64_t v19 = os_transaction_create();
  if (ObjectFromMessage)
  {
    id v20 = ObjectFromMessage;
  }
  else
  {
    id ObjectFromMessage = (id)objc_opt_new();
    [ObjectFromMessage setDiscretionary:0];
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __handle_ma_load_brain_block_invoke;
  v22[3] = &unk_100059C08;
  void v22[4] = v18;
  v22[5] = theDict;
  v22[6] = Value;
  v22[7] = a1;
  v22[8] = a2;
  v22[9] = v19;
  v22[10] = ObjectFromMessage;
  return [(MSUUpdateBrainLocator *)v18 installMAUpdateBrain:ObjectFromMessage handler:v22];
}

void handle_cancel_load_brain(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"AssetProperties");
  if (Value)
  {
    uint64_t v16 = 0;
    if ([+[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:Value] cancelInstall:&v16])
    {
      msu_send_status(a1, a2, 0);
    }
    else
    {
      logfunction("", 1, @"Failed to cancel update brain: %@\n", v9, v10, v11, v12, v13, (char)v16);
      msu_send_error(a1, a2, v16, 1);
    }
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"No asset attributes in request", v6, v7, v8, v15);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFRelease(error_internal_cf);
  }
}

void handle_adjust_load_brain_options(void *a1, void *a2, CFDictionaryRef theDict)
{
  if (CFDictionaryGetValue(theDict, @"AssetProperties"))
  {
    xpc_retain(a1);
    xpc_retain(a2);
    id v10 = (id)os_transaction_create();
    msu_send_status((_xpc_connection_s *)a1, a2, 0);
    xpc_release(a1);
    xpc_release(a2);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"No asset attributes in request", v5, v6, v7, v9);
    msu_send_error((_xpc_connection_s *)a1, a2, error_internal_cf, 1);
    CFRelease(error_internal_cf);
  }
}

void handle_ma_adjust_load_brain_options(void *a1, void *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction("", 1, @"in handle_ma_adjust_load_brain_options\n", a4, a5, a6, a7, a8, v24);
  CFDictionaryRef Value = CFDictionaryGetValue(a3, @"AssetProperties");
  id ObjectFromMessage = getObjectFromMessage(a2);
  if (ObjectFromMessage)
  {
    uint64_t v18 = ObjectFromMessage;
    logfunction("", 1, @"The secure encoded object is: %@\n", v13, v14, v15, v16, v17, (char)ObjectFromMessage);
    if (objc_opt_respondsToSelector())
    {
      id v19 = [(NSData *)v18 objectForKey:@"DownloadConfig"];
      if (Value)
      {
        id v20 = v19;
        if (v19)
        {
          uint64_t v21 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:Value];
          xpc_retain(a1);
          xpc_retain(a2);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = __handle_ma_adjust_load_brain_options_block_invoke;
          v26[3] = &unk_100059C30;
          v26[4] = a1;
          v26[5] = a2;
          v26[6] = os_transaction_create();
          [(MSUUpdateBrainLocator *)v21 adjustMADownloadOptions:v20 callback:v26];
          return;
        }
      }
    }
    CFStringRef v22 = @"No asset attributes or config in request";
  }
  else
  {
    CFStringRef v22 = @"No secure encoded object in request";
  }
  CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, v22, v15, v16, v17, v25);
  msu_send_error((_xpc_connection_s *)a1, a2, error_internal_cf, 1);
  CFRelease(error_internal_cf);
}

void handle_purge_update_brains(_xpc_connection_s *a1, void *a2)
{
  char v9 = 0;
  [+[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:0] purgeInstalledUpdateBrains:&v9];
  if (v9)
  {
    logfunction("", 1, @"Failed to purge update brains: %@\n", v4, v5, v6, v7, v8, (char)v9);
    msu_send_error(a1, a2, v9, 0);
  }
  else
  {
    msu_send_status(a1, a2, 0);
  }
}

uint64_t handle_mark_self_dirty(int a1, xpc_object_t xdict)
{
  if (handle_mark_self_dirty_arrayOnce != -1) {
    dispatch_once(&handle_mark_self_dirty_arrayOnce, &__block_literal_global_374);
  }
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "IsDirty");
  uint64_t v4 = (void *)handle_mark_self_dirty_outstandingJobs;
  objc_sync_enter((id)handle_mark_self_dirty_outstandingJobs);
  if (v3)
  {
    [(id)handle_mark_self_dirty_outstandingJobs addObject:os_transaction_create()];
  }
  else if ([(id)handle_mark_self_dirty_outstandingJobs count])
  {

    [(id)handle_mark_self_dirty_outstandingJobs removeLastObject];
  }
  return objc_sync_exit(v4);
}

void sub_100014620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id handle_required_disk_space(void *a1, void *a2, CFDictionaryRef theDict)
{
  if (theDict) {
    theDict = (CFDictionaryRef)CFDictionaryGetValue(theDict, @"AssetProperties");
  }
  uint64_t v5 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:theDict];
  xpc_retain(a1);
  xpc_retain(a2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __handle_required_disk_space_block_invoke;
  v7[3] = &unk_100059C78;
  void v7[4] = a1;
  v7[5] = a2;
  v7[6] = os_transaction_create();
  return [(MSUUpdateBrainLocator *)v5 requiredDiskSpace:v7];
}

void handle_reboot_to_nerd_call(_xpc_connection_s *a1, void *a2)
{
  uint64_t v12 = 0;
  int v4 = saveCurrentEnvInfoForNeRD(0);
  CFStringRef v10 = @"Failed to save";
  if (v4) {
    CFStringRef v10 = @"Successfully saved";
  }
  logfunction("", 1, @"%@ booted os state for NeRD\n", v5, v6, v7, v8, v9, (char)v10);
  if (!perform_reboot_to_nerd_command((const __CFString **)&v12) || v12) {
    uint64_t v11 = cferror_to_dictionary((__CFError *)v12);
  }
  else {
    uint64_t v11 = kCFNull;
  }
  msu_send_status(a1, a2, v11);
}

void handle_check_preparation_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t valuePtr = 0;
  uint64_t v23 = 0;
  CFTypeRef cf = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"ClientOptions");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
    MSUCheckPreparationSize_server(valuePtr, &v23, &cf);
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v23);
      if (v16)
      {
        CFDictionarySetValue(Mutable, @"RequiredSize", v16);
        if (cf)
        {
          CFTypeID TypeID = CFErrorGetTypeID();
          if (TypeID == CFGetTypeID(cf))
          {
            CFDictionaryRef v18 = cferror_to_dictionary((__CFError *)cf);
            CFDictionarySetValue(Mutable, @"ErrorInfo", v18);
            CFRelease(v18);
          }
        }
        msu_send_status(a1, a2, Mutable);
      }
      else
      {
        CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Could not create CFNumber from %llu", v13, v14, v15, v23);
        msu_send_error(a1, a2, (__CFError *)cf, 1);
      }
    }
    else
    {
      CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 14, 0, 0, @"Could not allocate CFMutableDictionary", v9, v10, v11, v20);
      msu_send_error(a1, a2, (__CFError *)cf, 1);
      CFNumberRef v16 = 0;
    }
    CFErrorRef error_internal_cf = (void *)cf;
    if (cf) {
      goto LABEL_13;
    }
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"No prep size in request", v6, v7, v8, v20);
    CFTypeRef cf = error_internal_cf;
    msu_send_error(a1, a2, (__CFError *)error_internal_cf, 1);
    CFNumberRef v16 = 0;
    CFMutableStringRef Mutable = 0;
    if (error_internal_cf)
    {
LABEL_13:
      CFRelease(error_internal_cf);
      CFTypeRef cf = 0;
    }
  }
  if (v16) {
    CFRelease(v16);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void handle_check_installation_size(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0;
  uint64_t valuePtr = 0;
  CFNumberRef Value = (void *)CFDictionaryGetValue(theDict, @"AssetProperties");
  if (!Value)
  {
    CFStringRef v12 = @"No asset properties in request";
    CFIndex v13 = 9;
    CFTypeRef v11 = 0;
    goto LABEL_5;
  }
  MSUCheckInstallationSize_server(Value, &valuePtr, (CFErrorRef *)&cf, v6, v7, v8, v9, v10);
  CFTypeRef v11 = cf;
  if (cf)
  {
    CFStringRef v12 = @"MSUCheckInstallationSize_server failed";
    CFIndex v13 = 7;
LABEL_5:
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", v13, v11, 0, v12, v8, v9, v10, v23);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFNumberRef v15 = 0;
    CFMutableStringRef Mutable = 0;
    goto LABEL_6;
  }
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    if (v15)
    {
      CFDictionarySetValue(Mutable, @"RequiredSize", v15);
      msu_send_status(a1, a2, Mutable);
      CFErrorRef error_internal_cf = 0;
    }
    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Could not create CFNumber from %llu", v20, v21, v22, valuePtr);
      msu_send_error(a1, a2, error_internal_cf, 1);
    }
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 14, 0, 0, @"Could not allocate CFMutableDictionary", v17, v18, v19, v23);
    msu_send_error(a1, a2, error_internal_cf, 1);
    CFNumberRef v15 = 0;
  }
LABEL_6:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (error_internal_cf) {
    CFRelease(error_internal_cf);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void handle_brain_is_loadable(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0;
  logfunction("", 1, @"Entering handle_brain_is_loadable\n", a4, a5, a6, a7, a8, v35);
  if (brain_is_loaded == 1)
  {
    logfunction("", 1, @"brain has been loaded\n", v10, v11, v12, v13, v14, v36);
    CFNumberRef v15 = 0;
LABEL_3:
    msu_send_status(a1, a2, 0);
    free(v15);
    return;
  }
  CFNumberRef v15 = (__CFString *)msu_deserialize_cf_object_from_xpc_dict(a2, "UpdateAttributes");
  if (v15)
  {
    uint64_t v21 = +[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:v15];
    CFRelease(v15);
    uint64_t v22 = [(MSUUpdateBrainLocator *)v21 copyUpdateBrainPath:&cf];
    if (v22)
    {
      CFNumberRef v15 = (__CFString *)v22;
      if (load_trust_cache((uint64_t)v22, (NSError **)&cf)) {
        goto LABEL_3;
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend((id)cf, "userInfo"), "objectForKeyedSubscript:", @"ShouldPurgeBrain"), "isEqual:", &__kCFBooleanTrue))
      {
        CFStringRef v38 = @"LoadTrustCachePurgedBrain";
        uint64_t v39 = &__kCFBooleanTrue;
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      }
      else
      {
        uint64_t v28 = 0;
      }
      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf(@"MobileSoftwareUpdateErrorDomain", 39, 0, 0, (const __CFDictionary *)v28, @"Failed to load update brain trust cache", v26, v27, v36);
    }
    else
    {
      if (cf)
      {
        error_internal_with_userinfo_CFTypeRef cf = (__CFError *)CFRetain(cf);
        logfunction("", 1, @"Error locating installed update brain: %@\n", v30, v31, v32, v33, v34, (char)error_internal_with_userinfo_cf);
      }
      else
      {
        error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 28, 0, 0, @"No update brain is installed", v23, v24, v25, v36);
      }
      CFNumberRef v15 = 0;
    }
  }
  else
  {
    logfunction("", 1, @"failed to get update attributs\n", v16, v17, v18, v19, v20, v36);
    error_internal_with_userinfo_CFTypeRef cf = 0;
  }
  msu_send_error(a1, a2, error_internal_with_userinfo_cf, 1);
  free(v15);
  if (error_internal_with_userinfo_cf) {
    CFRelease(error_internal_with_userinfo_cf);
  }
}

void handle_retreive_last_update_result(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"handle_retreive_last_update_result";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v9, 0xCu);
  }
  id updated = MSURetrievePreviousUpdateResults_server();
  uint64_t v6 = updated;
  if (updated) {
    uint64_t v7 = cferror_to_dictionary(updated);
  }
  else {
    uint64_t v7 = kCFNull;
  }
  msu_send_status(a1, a2, v7);
  if (v7) {
    CFRelease(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v8 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"handle_retreive_last_update_result";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v9, 0xCu);
  }
}

void handle_retreive_previous_update_state(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = @"handle_retreive_previous_update_state";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }
  unsigned int valuePtr = retrieve_previous_update_state();
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v5) {
    CFNullRef v6 = v5;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = @"handle_retreive_previous_update_state";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", buf, 0xCu);
  }
}

void handle_is_first_boot_after_update(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_is_first_boot_after_update";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }
  BOOL boot_after_update = is_first_boot_after_update();
  CFNullRef v6 = (void **)&kCFBooleanTrue;
  if (!boot_after_update) {
    CFNullRef v6 = (void **)&kCFBooleanFalse;
  }
  msu_send_status(a1, a2, *v6);
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_is_first_boot_after_update";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }
}

void handle_retrieve_previous_update_date(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_retrieve_previous_update_date";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }
  CFNullRef previous_update_date = (const __CFNull *)retrieve_previous_update_date();
  if (previous_update_date) {
    CFNullRef v6 = previous_update_date;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_retrieve_previous_update_date";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }
}

void handle_get_stashed_connectivity_data_command(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }
  id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s/%s/%s", "/private/var/MobileSoftwareUpdate/", "Controller/NeRD", "ConnectivityData.plist");
  CFTypeRef cf = 0;
  CFNullRef v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_1(v7, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    __int16 v50 = 2112;
    id v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | Attempting to load connectivity data from %@", buf, 0x16u);
  }
  id v8 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v5];
  if (!v8)
  {
    uint64_t v30 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_17:
    id v9 = 0;
    CFDataRef v10 = 0;
    goto LABEL_18;
  }
  id v9 = v8;
  CFDataRef v10 = (const __CFData *)[v8 objectForKey:@"BootedOSEncryptedWiFiData"];
  if (!v10)
  {
LABEL_18:
    id v12 = 0;
    goto LABEL_19;
  }

  if ((NRDCryptoDecrypt(v10, (CFDataRef *)&cf) & 1) == 0)
  {
    uint64_t v39 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_5(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    id v9 = 0;
    goto LABEL_18;
  }
  *(void *)buf = 0;
  id v11 = objc_alloc((Class)NSKeyedUnarchiver);
  id v12 = [v11 initForReadingFromData:cf error:buf];
  if (v12)
  {
    id v13 = objc_alloc((Class)NSSet);
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v48[2] = objc_opt_class();
    v48[3] = objc_opt_class();
    id v14 = objc_msgSend(v13, "initWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
    id v9 = [v12 decodeObjectOfClasses:v14 forKey:NSKeyedArchiveRootObjectKey];

    if (v9) {
      goto LABEL_19;
    }
    CFNumberRef v15 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      handle_get_stashed_connectivity_data_command_cold_4(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      handle_get_stashed_connectivity_data_command_cold_3();
    }
  }
  id v9 = 0;
LABEL_19:
  msu_send_status(a1, a2, v9);

  if (cf) {
    CFRelease(cf);
  }
  CFStringRef v38 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", buf, 0xCu);
  }
}

void handle_retrieve_previous_restore_date(_xpc_connection_s *a1, void *a2)
{
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_retrieve_previous_restore_date";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }
  CFNullRef previous_restore_date = (const __CFNull *)retrieve_previous_restore_date();
  if (previous_restore_date) {
    CFNullRef v6 = previous_restore_date;
  }
  else {
    CFNullRef v6 = kCFNull;
  }
  msu_send_status(a1, a2, v6);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = @"handle_retrieve_previous_restore_date";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v8, 0xCu);
  }
}

void handle_perform_report_and_cleanup_command(_xpc_connection_s *a1, void *a2)
{
  CFTypeRef cf = 0;
  int v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = @"handle_perform_report_and_cleanup_command";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }
  handle_update_metrics();
  if (perform_cleanup_staged_assets_command(0, 0, (const __CFString **)&cf))
  {
    CFBooleanRef v5 = kCFBooleanTrue;
    CFNullRef v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = @"handle_perform_report_and_cleanup_command";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | SUCCESS | Completed cleanup command on behalf of client", buf, 0xCu);
    }
  }
  else
  {
    CFBooleanRef v5 = kCFBooleanFalse;
    if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      handle_perform_report_and_cleanup_command_cold_2();
    }
  }
  msu_send_status(a1, a2, v5);
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    handle_perform_report_and_cleanup_command_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_get_update_information_command(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFNullRef v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    CFStringRef v13 = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", (uint8_t *)&v12, 0xCu);
  }
  id v7 = +[MSUSupport sharedSupport];
  id v8 = [a3 objectForKey:@"TargetUUID"];
  id v9 = objc_msgSend(v7, "MSUSupportGetUpdateInfo:for:", v8, objc_msgSend(a3, "objectForKey:", @"AssetProperties"));
  if (!v9)
  {
    uint64_t v10 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      CFStringRef v13 = @"handle_get_stashed_connectivity_data_command";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | getUpdateInfo didn't get any update information, assuming no update process on going for targetUUID %@", (uint8_t *)&v12, 0x16u);
    }
  }
  msu_send_status(a1, a2, v9);
  uint64_t v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    CFStringRef v13 = @"handle_get_stashed_connectivity_data_command";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | DONE", (uint8_t *)&v12, 0xCu);
  }
}

void handle_perform_cryptegraft_semisplat(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0;
  CFNullRef v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = @"handle_perform_cryptegraft_semisplat";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }
  id v7 = [a3 objectForKey:@"TargetVolume"];
  if (v7)
  {
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
  }
  char v9 = performCryptegraftSemiSplat(v7, (const __CFString **)&cf);
  uint64_t v10 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v22 = @"handle_perform_cryptegraft_semisplat";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | SUCCESS | Completed cryptegraft semi-splat command on behalf of client", buf, 0xCu);
    }
    msu_send_status(a1, a2, kCFBooleanTrue);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      handle_perform_cryptegraft_semisplat_cold_2();
    }
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  int v12 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    handle_perform_cryptegraft_semisplat_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

void handle_perform_cryptegraft_downlevel(_xpc_connection_s *a1, void *a2, void *a3)
{
  CFTypeRef cf = 0;
  CFNullRef v6 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = @"handle_perform_cryptegraft_downlevel";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | BEGIN", buf, 0xCu);
  }
  id v7 = [a3 objectForKey:@"TargetVolume"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v7 = 0;
    }
  }
  id v8 = [a3 objectForKey:@"SourcePath"];
  if (v8)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  char v11 = performCryptegraftDownlevel(v7, v10, (const __CFString **)&cf);
  int v12 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = @"handle_perform_cryptegraft_downlevel";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[HANDLER] %@ | SUCCESS | Completed cryptegraft downlevel command on behalf of client", buf, 0xCu);
    }
    msu_send_status(a1, a2, kCFBooleanTrue);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      handle_perform_cryptegraft_downlevel_cold_2();
    }
    msu_send_error(a1, a2, (__CFError *)cf, 0);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  uint64_t v14 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    handle_perform_cryptegraft_downlevel_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

void handle_perform_rv_nerd_update(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logfunction("", 1, @"[RV] Triggering forced NeRD OS update for Release Validation testing\n", a4, a5, a6, a7, a8, v22);
  msu_send_status(a1, a2, kCFNull);
  uint64_t v10 = +[MSUNRDUpdateBrainController sharedInstance];
  char v11 = [(MSUNRDUpdateBrainController *)v10 status];
  logfunction("", 1, @"[RV] NeRD update status: %@\n", v12, v13, v14, v15, v16, v11);
  [(MSUNRDUpdateBrainController *)v10 startForMSUUpdate:&__NSDictionary0__struct withMSUBrainVersion:0 withOptions:&off_100064B28];
  logfunction("", 1, @"[RV] NeRD update started\n", v17, v18, v19, v20, v21, v23);
  msu_send_status(a1, a2, kCFNull);
  if (kCFNull)
  {
    CFRelease(kCFNull);
  }
}

void record_brain_load_event(void *a1, uint64_t a2, __CFString *a3)
{
  id v6 = +[UMEventRecorder recorder];
  if (v6)
  {
    id v7 = v6;
    id v8 = [a1 objectForKeyedSubscript:@"ClientOptions"];
    [v7 startRecordingInstall:a2];
    if (v8) {
      id v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [v8 objectForKeyedSubscript:@"EventStats"]);
    }
    else {
      id v9 = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
    }
    uint64_t v10 = v9;
    [(NSMutableDictionary *)v9 setObject:targetBrainVersion forKeyedSubscript:@"targetBrainVersion"];
    if (a3)
    {
      char v11 = +[NSString stringWithFormat:@"%@ %ld", get_short_error_domain(a3), [(__CFString *)a3 code]];
      uint64_t v12 = copy_underlying_error_description(a3);
      CFStringRef v13 = (id)CFMakeCollectable(v12);
      if (v11) {
        CFStringRef v14 = (const __CFString *)v11;
      }
      else {
        CFStringRef v14 = @"unknown error";
      }
      [(NSMutableDictionary *)v10 setObject:v14 forKeyedSubscript:@"result"];
      if (v13) {
        CFStringRef v15 = v13;
      }
      else {
        CFStringRef v15 = @"unknown reason";
      }
      CFStringRef v16 = @"failureReason";
    }
    else
    {
      CFStringRef v15 = @"success";
      CFStringRef v16 = @"result";
    }
    [(NSMutableDictionary *)v10 setObject:v15 forKeyedSubscript:v16];
    [v7 recordEvent:@"brainLoad" information:v10];
    global_queue = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __record_brain_load_event_block_invoke;
    block[3] = &unk_100059B58;
    block[4] = v7;
    void block[5] = v8;
    dispatch_async(global_queue, block);
  }
}

void __handle_create_update_brain_connection_block_invoke(uint64_t a1)
{
}

void __copy_shared_update_brain_connection_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  long long v2 = (void *)copy_shared_update_brain_connection_brain_connection;
  if (!copy_shared_update_brain_connection_brain_connection)
  {
    int v4 = [+[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:*(void *)(a1 + 56)] copyUpdateBrainPath:&cf];
    if (v4)
    {
      BOOL v3 = v4;
      if (load_trust_cache((uint64_t)v4, (NSError **)&cf))
      {
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s/%s.xpc", v3, "com.apple.MobileSoftwareUpdate.UpdateBrainService");
        char v11 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = __str;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BRAIN_CONNECTION] Loading update brain bundle at %s", buf, 0xCu);
        }
        xpc_add_bundle();
        copy_shared_update_brain_connection_brain_connection = (uint64_t)xpc_connection_create("com.apple.MobileSoftwareUpdate.UpdateBrainService", 0);
        xpc_connection_set_event_handler((xpc_connection_t)copy_shared_update_brain_connection_brain_connection, &__block_literal_global_216);
        xpc_connection_resume((xpc_connection_t)copy_shared_update_brain_connection_brain_connection);
        xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v12, "Command", "PingService");
        Name = protocol_getName([+[MSUBrainDelegateImpl_softwareupdated sharedInstance] delegateProtocol]);
        CFStringRef v14 = protocol_getName([+[MSUBrainDelegateImpl_softwareupdated sharedInstance] brainProtocol]);
        xpc_dictionary_set_string(v12, "MSUBrainDelegateNSXPCInterfaceName", Name);
        xpc_dictionary_set_string(v12, "MSUBrainNSXPCInterfaceName", v14);
        xpc_object_t v15 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)copy_shared_update_brain_connection_brain_connection, v12);
        CFStringRef v16 = v15;
        p_vtable = &OBJC_METACLASS___MSURemoteableBlock.vtable;
        uint64_t v18 = (void *)msubrain;
        if (v15)
        {
          xpc_object_t value = xpc_dictionary_get_value(v15, "MSUBrainEndpoint");
          if (value)
          {
            xpc_object_t v20 = value;
            id v21 = objc_alloc_init((Class)NSXPCListenerEndpoint);
            if (v21)
            {
              char v22 = v21;
              uint64_t v33 = v18;
              string = (NSString *)xpc_dictionary_get_string(v16, "MSUBrainVersion");
              CFStringRef v24 = (NSString *)xpc_dictionary_get_string(v16, "MSUBrainUUID");
              if (string) {
                string = +[NSString stringWithUTF8String:string];
              }
              if (v24) {
                CFStringRef v24 = +[NSString stringWithUTF8String:v24];
              }
              [v22 _setEndpoint:v20];
              id v25 = [[MSUBrainClientImpl alloc] init:v24 version:string endpoint:v22 delgate:+[MSUBrainDelegateImpl_softwareupdated sharedInstance]];
              p_vtable = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
              uint64_t v18 = v33;
              goto LABEL_34;
            }
            NSErrorUserInfoKey v41 = NSDebugDescriptionErrorKey;
            *(void *)buf = @"Could not create NSXPCListenerEndpoint";
            uint64_t v28 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v41 count:1];
            uint64_t v29 = 1363;
          }
          else
          {
            NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
            CFStringRef v40 = @"UpdateBrainService did not return MSUBrainInterface endpoint";
            uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            uint64_t v29 = 1301;
          }
        }
        else
        {
          NSErrorUserInfoKey v37 = NSDebugDescriptionErrorKey;
          CFStringRef v38 = @"reply message is nil";
          uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          uint64_t v29 = 1350;
        }
        if (+[NSError errorWithDomain:@"MobileSoftwareUpdateErrorDomain" code:v29 userInfo:v28])
        {
          msubrain = 0;

          uint64_t v30 = msuSharedLogger();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            __copy_shared_update_brain_connection_block_invoke_cold_2();
          }
LABEL_36:
          xpc_release(v12);
          xpc_release(v16);
          brain_is_loaded = 1;
          long long v2 = (void *)copy_shared_update_brain_connection_brain_connection;
          if (!copy_shared_update_brain_connection_brain_connection) {
            goto LABEL_25;
          }
          goto LABEL_3;
        }
        id v25 = 0;
LABEL_34:
        p_vtable[399] = v25;

        uint64_t v31 = msuSharedLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully copied MSUBrain endpoint from ping reply", buf, 2u);
        }
        goto LABEL_36;
      }
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 39, cf, 0, @"Failed to load update brain trust cache", v8, v9, v10, v32);
      uint64_t v27 = *(void **)(a1 + 64);
      if (!v27)
      {
        CFRelease(error_internal_cf);
        goto LABEL_25;
      }
    }
    else if (cf)
    {
      if (os_log_type_enabled((os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        __copy_shared_update_brain_connection_block_invoke_cold_1();
      }
      CFErrorRef error_internal_cf = CFRetain(cf);
      BOOL v3 = 0;
      uint64_t v27 = *(void **)(a1 + 64);
    }
    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 28, 0, 0, @"No update brain is installed", v5, v6, v7, v32);
      uint64_t v27 = *(void **)(a1 + 64);
      if (!v27)
      {
        CFRelease(error_internal_cf);
        BOOL v3 = 0;
        goto LABEL_25;
      }
      BOOL v3 = 0;
    }
    void *v27 = error_internal_cf;
    goto LABEL_25;
  }
  BOOL v3 = 0;
LABEL_3:
  xpc_retain(v2);
LABEL_25:
  free(v3);
}

uint64_t load_trust_cache(uint64_t a1, NSError **a2)
{
  uint64_t trust_cache_at_path = load_trust_cache_at_path([[+[NSString stringWithUTF8String:a1] stringByAppendingPathComponent:@".TrustCache"] fileSystemRepresentation], a2);
  if (a2)
  {
    if (*a2)
    {
      if ([(NSDictionary *)[(NSError *)*a2 userInfo] objectForKeyedSubscript:@"ShouldPurgeBrain"])
      {
        if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSError userInfo](*a2, "userInfo"), "objectForKeyedSubscript:", @"ShouldPurgeBrain"), "isEqual:", &__kCFBooleanTrue))
        {
          logfunction("", 1, @"Load TrustCache failed with: %@, attempting to purge update brains\n", v4, v5, v6, v7, v8, (char)*a2);
          uint64_t v15 = 0;
          [+[MSUUpdateBrainLocator brainLocatorWithUpdateAttributes:0] purgeInstalledUpdateBrains:&v15];
          if (v15) {
            logfunction("", 1, @"Failed to purge update brains: %@\n", v9, v10, v11, v12, v13, v15);
          }
        }
      }
    }
  }
  return trust_cache_at_path;
}

void __copy_shared_update_brain_connection_block_invoke_214(id a1, OS_xpc_object *a2)
{
  BOOL v3 = xpc_copy_description(a2);
  uint64_t v4 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_CONNECTION] Update brain connection handler | %s", (uint8_t *)&v6, 0xCu);
  }
  free(v3);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error && copy_shared_update_brain_connection_brain_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_update_brain_connection_brain_connection);
    copy_shared_update_brain_connection_brain_connection = 0;
  }
}

void __get_softwareupdated_queue_block_invoke(id a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  *(_OWORD *)__str = 0u;
  long long v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.mobile.softwareupdated");
  get_softwareupdated_queue_queue = (uint64_t)dispatch_queue_create(__str, 0);
}

id __record_brain_load_event_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitEventsWithUpdateOptions:*(void *)(a1 + 40)];
}

id __handle_purge_suspended_update_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) submitEvents];
  long long v2 = *(void **)(a1 + 32);
  return [v2 stopRecordingInstall];
}

NSData *getObjectFromMessage(void *a1)
{
  size_t length = (unint64_t)xpc_dictionary_get_double(a1, (const char *)objc_msgSend(objc_msgSend(@"SecureEncodedObjects", "stringByAppendingString:", @"Length"), "UTF8String"));
  logfunction("", 1, @"The secure object length value is: %ld\n", v2, v3, v4, v5, v6, length);
  if (!length) {
    return 0;
  }
  data = xpc_dictionary_get_data(a1, (const char *)[@"SecureEncodedObjects" UTF8String], &length);
  if (!data)
  {
    char v22 = [@"SecureEncodedObjects" UTF8String];
    logfunction("", 1, @"nil bytes from xpc message for key %s\n", v23, v24, v25, v26, v27, v22);
    return 0;
  }
  long long v13 = +[NSData dataWithBytes:data length:length];
  if (!v13)
  {
    CFStringRef v21 = @"nil data from xpc message\n";
    goto LABEL_11;
  }
  uint64_t v30 = 0;
  id v14 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v13 error:&v30];
  long long v13 = (NSData *)[v14 decodeObjectOfClasses:_decodeClasses forKey:NSKeyedArchiveRootObjectKey];
  if ([v14 error])
  {
    char v15 = [v14 error];
    logfunction("", 1, @"Error while decoding archived object from xpc message: %@\n", v16, v17, v18, v19, v20, v15);
  }
  [v14 finishDecoding];

  if (!v13)
  {
    CFStringRef v21 = @"decoded object from xpc message\n";
LABEL_11:
    logfunction("", 1, v21, v8, v9, v10, v11, v12, v29);
  }
  return v13;
}

void __handle_ma_load_brain_block_invoke(uint64_t a1, void *a2, __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 1) == 0)
  {
    id v11 = [*(id *)(a1 + 32) brainVersion];
    logfunction("", 1, @"Setting targetBrainVersion to %@\n", v12, v13, v14, v15, v16, (char)v11);

    targetBrainVersion = (uint64_t)[v11 copy];
  }
  if (a3)
  {
    logfunction("", 1, @"Failed to install update brain: %@\n", a4, a5, a6, a7, a8, (char)a3);
    record_brain_load_event(*(void **)(a1 + 40), *(void *)(a1 + 48), a3);
    msu_send_error(*(_xpc_connection_s **)(a1 + 56), 0, (__CFError *)a3, 1);
  }
  else if (a2 && [a2 objectForKey:@"CommitSelfDestruct"])
  {
    if (get_softwareupdated_queue_queue_once != -1) {
      dispatch_once(&get_softwareupdated_queue_queue_once, &__block_literal_global_223);
    }
    dispatch_sync((dispatch_queue_t)get_softwareupdated_queue_queue, &__block_literal_global_318);
    msu_send_progress(*(_xpc_connection_s **)(a1 + 56), a2);
  }
  logfunction("", 1, @"Sending load complete without error\n", a4, a5, a6, a7, a8, v18);
  msu_send_status(*(_xpc_connection_s **)(a1 + 56), 0, 0);
  xpc_release(*(xpc_object_t *)(a1 + 56));
  xpc_release(*(xpc_object_t *)(a1 + 64));

  uint64_t v17 = *(void **)(a1 + 80);
}

void __handle_ma_load_brain_block_invoke_2(id a1)
{
  if (brain_is_loaded == 1)
  {
    id v1 = dispatch_group_create();
    peer_connections_queue = get_peer_connections_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __perform_self_destruct_block_invoke;
    block[3] = &unk_100059AE0;
    block[4] = v1;
    dispatch_sync(peer_connections_queue, block);
    dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v1);
    exit(0);
  }
}

id __perform_self_destruct_block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (get_peer_connections_array_peer_connections_array_once != -1) {
    dispatch_once(&get_peer_connections_array_peer_connections_array_once, &__block_literal_global_482);
  }
  id result = objc_msgSend((id)get_peer_connections_array_peer_connections_array, "countByEnumeratingWithState:objects:count:", &v10, v14, 16, get_peer_connections_array_peer_connections_array);
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(_xpc_connection_s **)(*((void *)&v10 + 1) + 8 * (void)v5);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v7, "Command", "ResendMessage");
        xpc_connection_send_message(v6, v7);
        xpc_release(v7);
        barrier[0] = _NSConcreteStackBlock;
        barrier[1] = 3221225472;
        barrier[2] = __perform_self_destruct_block_invoke_2;
        barrier[3] = &unk_100059AE0;
        barrier[4] = *(void *)(a1 + 32);
        xpc_connection_send_barrier(v6, barrier);
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id result = [obj countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v3 = result;
    }
    while (result);
  }
  return result;
}

void __perform_self_destruct_block_invoke_2(uint64_t a1)
{
}

void __handle_ma_adjust_load_brain_options_block_invoke(uint64_t a1, __CFError *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    logfunction("", 1, @"Failed to adjust brain madownload config: %@\n", a4, a5, a6, a7, a8, (char)a2);
    msu_send_error(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), a2, 1);
  }
  else
  {
    msu_send_status(*(_xpc_connection_s **)(a1 + 32), *(void **)(a1 + 40), 0);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  long long v10 = *(void **)(a1 + 48);
}

void __handle_mark_self_dirty_block_invoke(id a1)
{
  handle_mark_self_dirty_outstandingJobs = (uint64_t)objc_alloc_init((Class)NSMutableArray);
}

void __handle_required_disk_space_block_invoke(uint64_t a1, void *a2, __CFError *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    msu_send_status(*(_xpc_connection_s **)(a1 + 32), *(void **)(a1 + 40), a2);
  }
  else
  {
    logfunction("", 1, @"Failed to compute required disk space: %@\n", a4, a5, a6, a7, a8, (char)a3);
    msu_send_error(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), a3, 1);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  long long v10 = *(void **)(a1 + 48);
}

void __get_peer_connections_queue_block_invoke(id a1)
{
  get_peer_connections_queue_peer_connections_queue = (uint64_t)dispatch_queue_create("com.apple.mobile.softwareupdated.peer_connections", 0);
}

void __get_peer_connections_array_block_invoke(id a1)
{
  get_peer_connections_array_peer_connections_array = (uint64_t)objc_alloc_init((Class)NSMutableArray);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

int *logfunctionv(const char *a1, int a2, const __CFString *a3, va_list a4)
{
  int v8 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = "";
  }
  if (logfunctionv_onceToken != -1) {
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global_7);
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0, 0, a3, a4);
  pthread_t v11 = pthread_self();
  CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%08llx %s: %@", v11, v9, v10);
  CFRelease(v10);
  if (v12)
  {
    long long v13 = __dst;
    if (CFStringGetCString(v12, __dst, 1024, 0x8000100u))
    {
      uint64_t v14 = 0;
    }
    else
    {
      CFIndex Length = CFStringGetLength(v12);
      CFIndex v17 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      uint64_t v14 = (char *)malloc_type_malloc(v17, 0x5CBFF54EuLL);
      CFStringGetCString(v12, v14, v17, 0x8000100u);
      long long v13 = v14;
    }
    size_t v15 = strlen(v13);
    CFRelease(v12);
  }
  else
  {
    uint64_t v14 = 0;
    long long v13 = 0;
    size_t v15 = 0;
  }
  char v18 = logfunctionv_logObject;
  if (logfunctionv_logObject
    || (char v18 = os_log_create("com.apple.MobileSoftwareUpdate", "Info"), (logfunctionv_logObject = (uint64_t)v18) != 0))
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      CFStringRef v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }
  if (console_fd != -1) {
    write(console_fd, v13, v15);
  }
  if (a2)
  {
    openRestoreLogFile(0);
    writeToRestoreLogFile(v13, v15);
  }
  fprintf(__stderrp, "%s: %s", v9, v13);
  free(v14);
  id result = __error();
  *id result = v8;
  return result;
}

void __logfunctionv_block_invoke(id a1)
{
  if (getenv("__OSINSTALL_ENVIRONMENT")) {
    console_fd = open("/dev/console", 131082);
  }
}

int *logfunction(const char *a1, int a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, a2, a3, &a9);
}

uint64_t CryptoPerformEncryptDecrypt(const __CFData *a1, CFDataRef *a2, int a3)
{
  kern_return_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  io_connect_t v27;
  size_t v28;
  const UInt8 *BytePtr;
  unsigned int *v30;
  unsigned int *v31;
  const UInt8 *v32;
  unsigned int *v33;
  UInt8 *v34;
  UInt8 *v35;
  UInt8 *v36;
  UInt8 *v37;
  kern_return_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CFStringRef v44;
  uint64_t v45;
  CFAllocatorRef v46;
  const UInt8 *v47;
  unint64_t v48;
  CFDataRef v49;
  char v51;
  size_t outputStructCnt;
  io_connect_t connect[2];
  UInt8 *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  long long v60;
  long long v61;
  int v62;
  uint64_t v63;

  CFIndex Length = CFDataGetLength(a1);
  connect[0] = 0;
  CFMutableDictionaryRef v7 = IOServiceMatching("IOAESAccelerator");
  if (!v7)
  {
    logfunction("", 1, @"Could not allocate matching dict for kIOAESAcceleratorClass\n", v8, v9, v10, v11, v12, v51);
    return 0;
  }
  CFDictionaryRef v13 = v7;
  CFRetain(v7);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v13);
  if (!MatchingService)
  {
    logfunction("", 1, @"Could not find kIOAESAcceleratorClass\n", v15, v16, v17, v18, v19, v51);
    CFRelease(v13);
    return 0;
  }
  io_object_t v20 = MatchingService;
  CFStringRef v21 = IOServiceOpen(MatchingService, mach_task_self_, 0, connect);
  if (v21) {
    logfunction("", 1, @"Return %d trying to open kIOAESAcceleratorClass\n", v22, v23, v24, v25, v26, v21);
  }
  CFRelease(v13);
  IOObjectRelease(v20);
  uint64_t v27 = connect[0];
  if (!connect[0]) {
    return 0;
  }
  uint64_t v28 = (int)Length;
  if (a3)
  {
    if (Length << 32)
    {
      BytePtr = CFDataGetBytePtr(a1);
      uint64_t v30 = (unsigned int *)CryptoBufferAllocate(((int)Length + 19) & 0xFFFFFFFFFFFFFFF0);
      if (v30)
      {
        uint64_t v31 = v30;
        NSObject *v30 = Length;
        memcpy(v30 + 1, BytePtr, (int)Length);
        uint64_t v28 = ((int)Length + 19) & 0xFFFFFFFFFFFFFFF0;
        goto LABEL_13;
      }
    }
    goto LABEL_24;
  }
  if (Length < 5uLL
    || (char v32 = CFDataGetBytePtr(a1), (v33 = (unsigned int *)CryptoBufferAllocate(v28)) == 0))
  {
LABEL_24:
    IOServiceClose(v27);
    return 0;
  }
  uint64_t v31 = v33;
  memcpy(v33, v32, v28);
LABEL_13:
  uint64_t v34 = (UInt8 *)CryptoBufferAllocate(v28);
  uint64_t v35 = v34;
  if (!v34)
  {
LABEL_23:
    uint64_t v45 = 0;
    goto LABEL_32;
  }
  char v63 = 0;
  outputStructCnt = 88;
  if (a3) {
    uint64_t v36 = (UInt8 *)v31;
  }
  else {
    uint64_t v36 = v34;
  }
  if (a3) {
    NSErrorUserInfoKey v37 = v34;
  }
  else {
    NSErrorUserInfoKey v37 = (UInt8 *)v31;
  }
  *(void *)connect = v36;
  id v54 = v37;
  id v55 = v28;
  CFStringRef v57 = 0;
  int v56 = 0;
  __int16 v58 = a3 ^ 1;
  CFStringRef v59 = 128;
  __int16 v60 = 0u;
  CFStringRef v61 = 0u;
  uint64_t v62 = 2108;
  CFStringRef v38 = IOConnectCallStructMethod(v27, 1u, connect, 0x58uLL, connect, &outputStructCnt);
  if (v38)
  {
    id v51 = v38;
    uint64_t v44 = @"perform aes => %d\n";
LABEL_22:
    logfunction("", 1, v44, v39, v40, v41, v42, v43, v51);
    goto LABEL_23;
  }
  if (a3)
  {
    uint64_t v46 = kCFAllocatorDefault;
    BOOL v47 = v35;
    uint64_t v48 = v28;
  }
  else
  {
    uint64_t v48 = *(unsigned int *)v35;
    if (v28 - 4 < v48) {
      goto LABEL_23;
    }
    uint64_t v46 = kCFAllocatorDefault;
    BOOL v47 = v35 + 4;
  }
  uint64_t v49 = CFDataCreate(v46, v47, v48);
  *a2 = v49;
  if (!v49)
  {
    uint64_t v44 = @"Unable to allocate return crypto CFData\n";
    goto LABEL_22;
  }
  uint64_t v45 = 1;
LABEL_32:
  IOServiceClose(v27);
  free(v31);
  if (v35) {
    free(v35);
  }
  return v45;
}

uint64_t NRDCryptoDecrypt(const __CFData *a1, CFDataRef *a2)
{
  return CryptoPerformEncryptDecrypt(a1, a2, 0);
}

void *CryptoBufferAllocate(size_t size)
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x10uLL, size, 0x113DE5EFuLL)) {
    logfunction("", 1, @"Failed to allocate aligned crypto buffer\n\n", v2, v3, v4, v5, v6, v8);
  }
  else {
    bzero(memptr, size);
  }
  return memptr;
}

void log_xpc_event(char a1, xpc_object_t object)
{
  char v8 = xpc_copy_description(object);
  logfunction("", 1, @"%s: %s\n", v3, v4, v5, v6, v7, a1);
  free(v8);
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3 && !*a3)
    {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *a3 = Mutable;
      CFDictionarySetValue(Mutable, a1, v6);
    }
    CFRelease(v6);
  }
}

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFDictionaryGetTypeID())
  {
    CFDictionaryRef context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization, &context);
    if (context)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a1);
      CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
      CFRelease(context);
      return MutableCopy;
    }
    return 0;
  }
  if (v2 == CFArrayGetTypeID())
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      CFMutableDictionaryRef MutableCopy = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
        uint64_t v8 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
        if (v8)
        {
          uint64_t v9 = (const void *)v8;
          if (!MutableCopy) {
            CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a1);
          }
          CFArraySetValueAtIndex(MutableCopy, v6, v9);
          CFRelease(v9);
        }
        ++v6;
      }
      while (v5 != v6);
      return MutableCopy;
    }
    return 0;
  }
  if (v2 != CFErrorGetTypeID()) {
    return 0;
  }
  return cferror_to_dictionary_embedded((__CFError *)a1, 1);
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void msu_serialize_cf_object_into_xpc_dict(void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3)
  {
    logfunction("", 1, @"%s: API misuse - object is NULL\n", a4, a5, a6, a7, a8, (char)"msu_serialize_cf_object_into_xpc_dict");
    return;
  }
  CFDictionaryRef v10 = msu_process_cf_object_for_xpc_serialization(a3);
  if (!v10)
  {
    uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v12) {
      goto LABEL_4;
    }
LABEL_9:
    logfunction("", 1, @"could not create object for key %s:%@\n", v13, v14, v15, v16, v17, (char)a2);
    return;
  }
  CFDictionaryRef v11 = v10;
  uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  CFRelease(v11);
  if (!v12) {
    goto LABEL_9;
  }
LABEL_4:
  xpc_dictionary_set_value(a1, a2, v12);
  xpc_release(v12);
}

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    if (a3 && !*a3)
    {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *a3 = Mutable;
      CFDictionarySetValue(Mutable, a1, v6);
    }
    CFRelease(v6);
  }
}

CFStringRef msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0;
        CFMutableDictionaryRef MutableCopy = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v9 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v9)
          {
            CFDictionaryRef v10 = (const void *)v9;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }
          ++v6;
        }
        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }
    return 0;
  }
  if (!CFDictionaryContainsKey((CFDictionaryRef)a1, @"_MSU_Embedded_Error"))
  {
    CFDictionaryRef context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization, &context);
    if (context)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a1);
      CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
      CFRelease(context);
      return (const __CFString *)MutableCopy;
    }
    return 0;
  }
  return copy_dictionary_to_cferror(a1);
}

CFStringRef msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0;
  }
  CFTypeID v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  CFStringRef v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFRelease(v2);
    return v4;
  }
  return (const __CFString *)v2;
}

void handle_message(_xpc_connection_s *a1, xpc_object_t xdict, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  string = xpc_dictionary_get_string(xdict, "Command");
  if (string)
  {
    uint64_t v19 = string;
    CFStringRef v23 = msu_deserialize_cf_object_from_xpc_dict(xdict, "CommandParameters");
    if (a4)
    {
      uint64_t v24 = 0;
      uint64_t v25 = (uint64_t *)(a3 + 16);
      while (1)
      {
        size_t v26 = strlen((const char *)*(v25 - 2));
        if (!strncmp(v19, (const char *)*(v25 - 2), v26)) {
          break;
        }
        ++v24;
        v25 += 3;
        if (a4 == v24) {
          goto LABEL_14;
        }
      }
      if ((msu_client_is_entitled(a1, *v25) & 1) == 0)
      {
        CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Client does not have entitlement %s", v27, v28, v29, *v25);
        goto LABEL_16;
      }
      uint64_t v30 = (void *)os_transaction_create();
      ((void (*)(_xpc_connection_s *, xpc_object_t, const __CFString *))*(v25 - 1))(a1, xdict, v23);
      os_release(v30);
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if (v24 != a4)
    {
LABEL_18:
      if (v23)
      {
        CFRelease(v23);
      }
      return;
    }
LABEL_14:
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Unknown command '%s'", v20, v21, v22, (char)v19);
LABEL_16:
    char v32 = error_internal_cf;
    msu_send_error(a1, 0, error_internal_cf, 0);
    if (v32) {
      CFRelease(v32);
    }
    goto LABEL_18;
  }
  logfunction("", 1, @"No command in request\n", v14, v15, v16, v17, v18, a9);
}

uint64_t msu_client_is_entitled(_xpc_connection_s *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  char v2 = a2;
  CFStringRef v4 = (void *)xpc_connection_copy_entitlement_value();
  if (v4)
  {
    CFIndex v5 = v4;
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL)
    {
      if (xpc_BOOL_get_value(v5))
      {
        uint64_t v12 = 1;
LABEL_17:
        xpc_release(v5);
        return v12;
      }
      CFStringRef v11 = @"Value for entitlement '%s' is false\n";
    }
    else
    {
      CFStringRef v11 = @"Entitlement '%s' is not a BOOLean\n";
    }
    logfunction("", 1, v11, v6, v7, v8, v9, v10, v2);
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  pid_t pid = xpc_connection_get_pid(a1);
  bzero(buffer, 0x400uLL);
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  memset(&audittoken, 0, sizeof(audittoken));
  xpc_connection_get_audit_token();
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 1)
  {
    int v21 = proc_pidinfo(pid, 13, 0, &v24, 64);
    uint64_t v20 = (const char *)v25;
    if (!v21) {
      uint64_t v20 = "<unknown>";
    }
  }
  else
  {
    uint64_t v14 = strrchr(buffer, 47);
    if (v14) {
      LOBYTE(v20) = (_BYTE)v14 + 1;
    }
    else {
      uint64_t v20 = buffer;
    }
  }
  logfunction("", 1, @"Client %s[%d] does not have the '%s' entitlement\n", v15, v16, v17, v18, v19, (char)v20);
  return 0;
}

void msu_send_error(_xpc_connection_s *a1, xpc_object_t original, __CFError *a3, int a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Error");
    if (a3)
    {
      CFDictionaryRef v9 = cferror_to_dictionary(a3);
      if (v9)
      {
        CFDictionaryRef v15 = v9;
        msu_serialize_cf_object_into_xpc_dict(v8, "ErrorInfo", v9, v10, v11, v12, v13, v14);
        CFRelease(v15);
      }
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
    if (a4)
    {
      submitRestoreLogFile(a3, 0, 0, 0);
    }
  }
}

void msu_send_status(_xpc_connection_s *a1, void *a2, void *a3)
{
}

void msu_send_status_with_reply(_xpc_connection_s *a1, xpc_object_t original, void *a3, uint64_t a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Complete");
    if (a3) {
      msu_serialize_cf_object_into_xpc_dict(v8, "Results", a3, v9, v10, v11, v12, v13);
    }
    if (a4) {
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v8);
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }
}

void msu_send_progress(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "IPCStatus", "Callback");
  if (a2) {
    msu_serialize_cf_object_into_xpc_dict(v4, "CallbackStatus", a2, v5, v6, v7, v8, v9);
  }
  xpc_connection_send_message(a1, v4);
  xpc_release(v4);
}

uint64_t msu_demux_reply(void *a1, const __CFString **a2, __CFDictionary **a3, const __CFString **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    CFStringRef v18 = @"No reply from daemon";
LABEL_9:
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, v18, a6, a7, a8, v28);
LABEL_10:
    CFErrorRef v19 = error_internal_cf;
    if (a4)
    {
      uint64_t result = 0;
      *a4 = (const __CFString *)v19;
      return result;
    }
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(a1, "IPCStatus");
  if (!string)
  {
    CFStringRef v18 = @"No status key in reply from daemon";
    goto LABEL_9;
  }
  uint64_t v13 = string;
  if (!strncmp(string, "Complete", 8uLL))
  {
    if (a2) {
      *a2 = msu_deserialize_cf_object_from_xpc_dict(a1, "Results");
    }
    return 1;
  }
  if (!strncmp(v13, "Callback", 8uLL))
  {
    if (a3)
    {
      CFStringRef v21 = msu_deserialize_cf_object_from_xpc_dict(a1, "CallbackStatus");
      CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)v21, @"StallError");
      if (Value)
      {
        CFStringRef v23 = Value;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)v21);
        if (v21) {
          CFRelease(v21);
        }
        CFStringRef v25 = copy_dictionary_to_cferror(v23);
        if (v25)
        {
          CFStringRef v26 = v25;
          CFDictionarySetValue(MutableCopy, @"StallError", v25);
          CFRelease(v26);
        }
      }
      else
      {
        CFMutableDictionaryRef MutableCopy = (__CFDictionary *)v21;
      }
      *a3 = MutableCopy;
    }
    return 1;
  }
  if (strncmp(v13, "Error", 5uLL))
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Unexpected IPC status %s in reply hander", v14, v15, v16, (char)v13);
    goto LABEL_10;
  }
  if (!a4) {
    return 0;
  }
  uint64_t result = (uint64_t)msu_deserialize_cf_object_from_xpc_dict(a1, "ErrorInfo");
  if (result)
  {
    uint64_t v27 = (__CFError *)result;
    *a4 = copy_dictionary_to_cferror((const void *)result);
    CFErrorRef error_internal_cf = v27;
LABEL_12:
    CFRelease(error_internal_cf);
    return 0;
  }
  return result;
}

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4) {
    return v4;
  }
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_8);
  }
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      CFPropertyListRef v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }
  return CFPreferencesCopyValue(a1, a2, @"mobile", kCFPreferencesAnyHost);
}

CFPropertyListRef _MSUPreferencesCopyValue(const __CFString *a1)
{
  return _MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
}

void ___getManagedPreferencesDict_block_invoke(id a1)
{
  CFStringRef v1 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@/%@.plist", @"/Library/Managed Preferences/mobile", @"com.apple.MobileSoftwareUpdate");
  if (v1)
  {
    CFStringRef v2 = v1;
    _getManagedPreferencesDict__managedPreferencesCache = (uint64_t)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:v1];
    CFRelease(v2);
  }
}

uint64_t _perform_cleanup_command(int a1, int a2, int a3, char a4, const void *a5, const __CFString **a6)
{
  uint64_t v12 = copy_shared_cleanup_service_connection();
  if (v12)
  {
    uint64_t v16 = (_xpc_connection_s *)v12;
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v17, "Command", "CleanupPreparePath");
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFErrorRef v19 = Mutable;
    if (a1) {
      CFBooleanRef v20 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v20 = kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"ShouldPurge", v20);
    if (a2) {
      CFBooleanRef v21 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v21 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v19, @"ShouldPurgeStagedAssets", v21);
    if (a3) {
      CFBooleanRef v22 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v22 = kCFBooleanFalse;
    }
    CFDictionarySetValue(v19, @"ShouldDisableAssetStaging", v22);
    if ((a4 & 1) == 0) {
      CFDictionarySetValue(v19, @"ShouldResetAPFSReserve", kCFBooleanFalse);
    }
    if (a5) {
      CFDictionarySetValue(v19, @"TargetUUID", a5);
    }
    msu_serialize_cf_object_into_xpc_dict(v17, "CommandParameters", v19, v23, v24, v25, v26, v27);
    if (v19) {
      CFRelease(v19);
    }
    xpc_object_t v28 = xpc_connection_send_message_with_reply_sync(v16, v17);
    uint64_t v33 = msu_demux_reply(v28, 0, 0, a6, v29, v30, v31, v32);
    xpc_release(v17);
    if (v28) {
      xpc_release(v28);
    }
    xpc_release(v16);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cleanup service connection", v13, v14, v15, v36);
    if (a6)
    {
      uint64_t v33 = 0;
      *a6 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v33;
}

uint64_t copy_shared_cleanup_service_connection()
{
  if (get_cleanup_service_queue_queue_once != -1) {
    dispatch_once(&get_cleanup_service_queue_queue_once, &__block_literal_global_49);
  }
  dispatch_sync((dispatch_queue_t)get_cleanup_service_queue_queue, &__block_literal_global_9);
  return copy_shared_cleanup_service_connection_service_connection;
}

uint64_t perform_cleanup_staged_assets_command(int a1, const void *a2, const __CFString **a3)
{
  return _perform_cleanup_command(a1, 1, 0, 1, a2, a3);
}

uint64_t perform_cleanup_and_disable_staged_assets_command(int a1, const void *a2, const __CFString **a3)
{
  return _perform_cleanup_command(a1, 1, 1, 1, a2, a3);
}

uint64_t perform_cleanup_command(int a1, char a2, const void *a3, const __CFString **a4)
{
  return _perform_cleanup_command(a1, 0, 0, a2, a3, a4);
}

uint64_t perform_cleanup_recoveryos_saved_state_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "Command", "CleanupRecoveryOSSavedState");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0, 0, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cleanup service connection to cleanup recoveryOS state", v3, v4, v5, v16);
    if (a1)
    {
      uint64_t v13 = 0;
      *a1 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v13;
}

uint64_t perform_cleanup_NVRAM_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "Command", "CleanupNVRAM");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0, 0, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cleanup service connection", v3, v4, v5, v16);
    if (a1)
    {
      uint64_t v13 = 0;
      *a1 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v13;
}

uint64_t perform_reboot_to_nerd_command(const __CFString **a1)
{
  uint64_t v2 = copy_shared_cleanup_service_connection();
  if (v2)
  {
    uint64_t v6 = (_xpc_connection_s *)v2;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "Command", "RebootToNerd");
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
    uint64_t v13 = msu_demux_reply(v8, 0, 0, a1, v9, v10, v11, v12);
    xpc_release(v7);
    if (v8) {
      xpc_release(v8);
    }
    xpc_release(v6);
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cleanup service connection", v3, v4, v5, v16);
    if (a1)
    {
      uint64_t v13 = 0;
      *a1 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
  }
  return v13;
}

uint64_t perform_logs_cleanup_command(uint64_t a1, void *a2, const __CFString **a3)
{
  CFTypeRef cf = 0;
  uint64_t valuePtr = a1;
  uint64_t v5 = copy_shared_cleanup_service_connection();
  if (!v5)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"No cleanup service connection", v6, v7, v8, v31);
    if (a3)
    {
      uint64_t v23 = 0;
      *a3 = (const __CFString *)error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      return 0;
    }
    return v23;
  }
  uint64_t v9 = (_xpc_connection_s *)v5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "Command", "CleanupLogs");
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(Mutable, @"LogsRetention", v12);
  msu_serialize_cf_object_into_xpc_dict(v10, "CommandParameters", Mutable, v13, v14, v15, v16, v17);
  if (Mutable) {
    CFRelease(Mutable);
  }
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v9, v10);
  uint64_t v23 = msu_demux_reply(v18, (const __CFString **)&cf, 0, a3, v19, v20, v21, v22);
  if (cf)
  {
    CFTypeID v24 = CFGetTypeID(cf);
    if (v24 == CFNumberGetTypeID())
    {
      if (a2)
      {
        uint64_t v32 = 0;
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &v32);
        *a2 = v32;
        if (!v12) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    else
    {
      CFErrorRef v29 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"oldest is not a number", v25, v26, v27, v31);
      if (!a3)
      {
        CFRelease(v29);
        uint64_t v23 = 0;
        if (!v12) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      uint64_t v23 = 0;
      *a3 = (const __CFString *)v29;
    }
  }
  if (v12) {
LABEL_14:
  }
    CFRelease(v12);
LABEL_15:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  xpc_release(v10);
  if (v18) {
    xpc_release(v18);
  }
  xpc_release(v9);
  return v23;
}

void __copy_shared_cleanup_service_connection_block_invoke(id a1)
{
  CFStringRef v1 = (void *)copy_shared_cleanup_service_connection_service_connection;
  if (!copy_shared_cleanup_service_connection_service_connection)
  {
    if (!dlopen("/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework/MobileSoftwareUpdate", 1))
    {
      char v13 = dlerror();
      logfunction("", 1, @"failed to dlopen(3) MobileSoftwareUpdate framework: %s\n", v8, v9, v10, v11, v12, v13);
      return;
    }
    if (get_cleanup_service_queue_queue_once != -1) {
      dispatch_once(&get_cleanup_service_queue_queue_once, &__block_literal_global_49);
    }
    uint64_t v2 = xpc_connection_create("com.apple.MobileSoftwareUpdate.CleanupPreparePathService", (dispatch_queue_t)get_cleanup_service_queue_queue);
    copy_shared_cleanup_service_connection_service_connection = (uint64_t)v2;
    if (!v2)
    {
      logfunction("", 1, @"Could not create connection to service %s\n", v3, v4, v5, v6, v7, (char)"com.apple.MobileSoftwareUpdate.CleanupPreparePathService");
      return;
    }
    xpc_connection_set_event_handler(v2, &__block_literal_global_45);
    xpc_connection_resume((xpc_connection_t)copy_shared_cleanup_service_connection_service_connection);
    CFStringRef v1 = (void *)copy_shared_cleanup_service_connection_service_connection;
  }
  xpc_retain(v1);
}

void __copy_shared_cleanup_service_connection_block_invoke_2(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && copy_shared_cleanup_service_connection_service_connection != 0)
  {
    xpc_release((xpc_object_t)copy_shared_cleanup_service_connection_service_connection);
    copy_shared_cleanup_service_connection_service_connection = 0;
  }
}

void __get_cleanup_service_queue_block_invoke(id a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  *(_OWORD *)__str = 0u;
  long long v2 = 0u;
  snprintf(__str, 0x100uLL, "%s.queue", "com.apple.MobileSoftwareUpdate.CleanupPreparePathService");
  get_cleanup_service_queue_queue = (uint64_t)dispatch_queue_create(__str, 0);
}

uint64_t get_nonsnapshot_preparation_size(void *a1, void *a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum];
  id v7 = [a1 objectForKey:@"InstallationSize"];
  if (v7)
  {
    id v13 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v14, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
      id v13 = [v14 numberFromString:v13];
      CFStringRef v15 = @"update_attributes[\"InstallationSize\"] (string)";
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v15 = @"update_attributes[\"InstallationSize\"] (number)";
LABEL_7:
      id v25 = [v13 longLongValue];
      [v6 add:v25 annotation:v15];
      uint64_t v26 = 1;
      logfunction("", 1, @"nonsnapshot preparation size : %lld (%lld MB)\n", v27, v28, v29, v30, v31, (char)v25);
      logfunction("", 1, @"\n%s():%@\n", v32, v33, v34, v35, v36, (char)"get_nonsnapshot_preparation_size");
      if (!a2) {
        return v26;
      }
      goto LABEL_12;
    }
    logfunction("", 1, @"InstallationSize has invalid type in update attributes\n", v20, v21, v22, v23, v24, v39);
    CFStringRef v19 = @"Invalid update attributes: invalid type InstallationSize";
  }
  else
  {
    logfunction("", 1, @"InstallationSize not present in update attributes\n", v8, v9, v10, v11, v12, v39);
    CFStringRef v19 = @"Invalid update attributes: missing InstallationSize";
  }
  CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, v19, v16, v17, v18, v40);
  if (!a3)
  {
    CFRelease(error_internal_cf);
    id v25 = 0;
    uint64_t v26 = 0;
    if (!a2) {
      return v26;
    }
    goto LABEL_12;
  }
  id v25 = 0;
  uint64_t v26 = 0;
  *a3 = error_internal_cf;
  if (a2) {
LABEL_12:
  }
    *a2 = v25;
  return v26;
}

uint64_t get_snapshot_preparation_size(void *a1, char **a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum];
  id v7 = [a1 objectForKey:@"InstallationSize-Snapshot"];
  if (v7)
  {
    id v13 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v14, "setFormatterBehavior:", +[NSNumberFormatter defaultFormatterBehavior](NSNumberFormatter, "defaultFormatterBehavior"));
      id v13 = [v14 numberFromString:v13];
      CFStringRef v15 = @"update_attributes[\"InstallationSize-Snapshot\"] (string)";
LABEL_10:
      uint64_t v46 = (char *)[v13 longLongValue];
      [v6 add:v46 annotation:v15];
      uint64_t updated = cryptex_size_requirement_for_update_type(0, a1);
      uint64_t v34 = &v46[updated];
      [v6 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_snapshot)"];
      uint64_t v35 = 1;
      logfunction("", 1, @"snapshot preparation size (mastered) : %lld (%lld MB)\n", v48, v49, v50, v51, v52, (char)v34);
      logfunction("", 1, @"\n%s():%@\n", v53, v54, v55, v56, v57, (char)"get_snapshot_preparation_size");
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v15 = @"update_attributes[\"InstallationSize-Snapshot\"] (number)";
      goto LABEL_10;
    }
    logfunction("", 1, @"InstallationSize-Snapshot has invalid type in update attributes\n", v41, v42, v43, v44, v45, v63);
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Invalid update attributes: invalid type InstallationSize-Snapshot", v59, v60, v61, v67);
    if (a3)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      *a3 = error_internal_cf;
    }
    else
    {
      CFRelease(error_internal_cf);
      uint64_t v34 = 0;
      uint64_t v35 = 0;
    }
  }
  else
  {
    logfunction("", 1, @"InstallationSize-Snapshot not present in update attributes\n", v8, v9, v10, v11, v12, v63);
    uint64_t v16 = (NSNumber *)[a1 objectForKey:@"ActualMinimumSystemPartition"];
    if (!v16)
    {
      logfunction("", 1, @"ActualMinimumSystemPartition not present in update attributes\n", v17, v18, v19, v20, v21, v64);
      uint64_t v16 = (NSNumber *)[a1 objectForKey:@"MinimumSystemPartition"];
      if (!v16)
      {
        logfunction("", 1, @"MinimumSystemPartition not present in update attributes. Using the default.\n", v22, v23, v24, v25, v26, v65);
        logfunction("", 1, @"*** Warning *** This is not a normal path *** Users shouldn't get here *** Engineers can\n", v27, v28, v29, v30, v31, v66);
        uint64_t v16 = +[NSNumber numberWithInt:2500];
      }
    }
    uint64_t v32 = calculate_snapshot_overhead([(NSNumber *)v16 longLongValue] << 20);
    uint64_t v33 = cryptex_size_requirement_for_update_type(0, a1);
    uint64_t v34 = (char *)(v33 + v32);
    uint64_t v35 = 1;
    logfunction("", 1, @"snapshot preparation size (worst case) : %lld (%lld MB)\n", v36, v37, v38, v39, v40, v33 + v32);
  }
LABEL_11:
  if (a2) {
    *a2 = v34;
  }
  return v35;
}

uint64_t cryptex_size_requirement_for_update_type(int a1, void *a2)
{
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v31[1] = 3221225472;
  v31[0] = _NSConcreteStackBlock;
  uint64_t v32 = __cryptex_size_requirement_for_update_type_block_invoke;
  uint64_t v33 = &unk_100059E20;
  id v34 = +[MSULogAnnotatedSum sum];
  uint64_t v35 = &v37;
  int v36 = a1;
  if (a2)
  {
    id v9 = [a2 objectForKeyedSubscript:@"CryptexSizeInfo"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v10 = [a2 objectForKeyedSubscript:@"ComboAsset"];
      if (!v10) {
        goto LABEL_31;
      }
      uint64_t v11 = MGCopyAnswer();
      long long v44 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v41 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v12) {
        goto LABEL_31;
      }
      uint64_t v13 = *(void *)v42;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        CFStringRef v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        id v16 = [v15 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v16)
        {
          if ([v16 isEqualToString:v11]) {
            break;
          }
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_31;
        }
      }
      id v9 = [v15 objectForKeyedSubscript:@"CryptexSizeInfo"];
      if (!v9) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
    }
    id v17 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"cryptex-system-arm64e", @"cryptex-app", 0);
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v41 = 0u;
        id v18 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v42;
          uint64_t v20 = -1;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v42 != v19) {
                objc_enumerationMutation(v9);
              }
              uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v23 = [v22 objectForKey:@"CryptexTag"];
                if (v23)
                {
                  if ([v17 containsObject:v23]) {
                    v32((uint64_t)v31, (uint64_t)i + v20 + 1, (uint64_t)v23, v22);
                  }
                }
              }
            }
            id v18 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
            v20 += (uint64_t)i;
          }
          while (v18);
        }
      }
    }
  }
LABEL_31:
  logfunction("", 1, @"cryptex size requirement: %lld (%lld MB)\n", v4, v5, v6, v7, v8, v38[3]);
  logfunction("", 1, @"\n%s(%s):%@\n", v24, v25, v26, v27, v28, (char)"cryptex_size_requirement_for_update_type");
  uint64_t v29 = v38[3];
  _Block_object_dispose(&v37, 8);
  return v29;
}

void sub_100019AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t get_nonsnapshot_apply_and_reserve_sizes(const __CFDictionary *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v181 = 0;
  bzero(&v185, 0x878uLL);
  uint64_t v180 = 0;
  int valuePtr = 2500;
  id v10 = +[MSULogAnnotatedSum sum];
  [v10 add:314572800 annotation:@"UPDATE_PARTITION_SIZE * 2"];
  [v10 add:104857600 annotation:@"UPDATE_APFS_RESERVE"];
  uint64_t system_partition_padding = get_system_partition_padding(a1);
  [v10 add:system_partition_padding annotation:@"systemPartitionPadding = get_system_partition_padding()"];
  uint64_t updated = cryptex_size_requirement_for_update_type(1, a1);
  uint64_t v176 = system_partition_padding + 419430400 + updated;
  [v10 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_legacy)"];
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"ActualMinimumSystemPartition");
  if (Value || (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"MinimumSystemPartition")) != 0)
  {
    CFNumberRef v14 = Value;
    CFRetain(Value);
  }
  else
  {
    logfunction("", 1, @"Couldn't find ActualMinimumSystemPartition or MinimumSystemPartition in the asset properties\n", v15, v16, v17, v18, v19, (char)v166);
    CFNumberRef v14 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }
  unint64_t v178 = 0;
  LOBYTE(v182.st_dev) = 0;
  APFSShouldSealSystemVolume();
  if (LOBYTE(v182.st_dev))
  {
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a1, @"SystemVolumeSealingOverhead");
    if (v20)
    {
      CFNumberGetValue(v20, kCFNumberSInt64Type, &v178);
      logfunction("", 1, @"Sealing requires %d MiB overhead\n", v21, v22, v23, v24, v25, v178);
      unint64_t v26 = v178;
      uint64_t v27 = a4;
      CFDictionaryRef v28 = a1;
      unint64_t v29 = a5;
      uint64_t v30 = system_partition_padding;
      CFNumberRef v31 = v14;
      uint64_t v32 = a2;
      uint64_t v33 = a3;
      v178 <<= 20;
      unint64_t v34 = v178;
      v176 += v26 << 20;
      CFStringRef v166 = @"SystemVolumeSealingOverhead";
      uint64_t v35 = +[NSString stringWithFormat:@"update_attributes[\"%@\"]"];
      uint64_t v36 = v34;
      a3 = v33;
      a2 = v32;
      CFNumberRef v14 = v31;
      uint64_t system_partition_padding = v30;
      a5 = v29;
      a1 = v28;
      a4 = v27;
      [v10 add:v36 annotation:v35];
    }
  }
  if (RCGetSystemPartitionExtrasSizeForDevice(0, a1, &v180, 0))
  {
    v174 = a3;
    v175 = a4;
    uint64_t v42 = v180;
    long long v43 = v10;
    [v10 add:v180 annotation:@"RCGetSystemPartitionExtrasSizeForDevice()"];
    CFNumberGetValue(v14, kCFNumberSInt64Type, &v181);
    uint64_t v44 = v181;
    v181 <<= 20;
    objc_msgSend(v10, "add:annotation:");
    logfunction("", 1, @"Minimum system partition is %llu (%llu MB)\n", v45, v46, v47, v48, v49, v181);
    logfunction("", 1, @"System partition padding is %llu (%llu MB)\n", v50, v51, v52, v53, v54, system_partition_padding);
    logfunction("", 1, @"System partition firmware is %llu (%llu MB)\n", v55, v56, v57, v58, v59, v180);
    bzero(&v185, 0x878uLL);
    uint64_t v60 = statfs("/", &v185);
    if (v60)
    {
      logfunction("", 1, @"Failed to statfs / to find free filesystem space\n", v63, v64, v65, v66, v67, v167);
      CFURLRef v68 = __error();
      CFErrorRef error_internal_cf = _create_error_internal_cf(kCFErrorDomainPOSIX, *v68, 0, 0, @"statfs(\"/\") failed", v69, v70, v71, v168);
      a4 = v175;
      if (a5)
      {
        unint64_t v73 = 0;
        unint64_t v74 = 0;
        uint64_t v75 = (void *)a5;
        a5 = 0;
        uint64_t v76 = 0;
        *uint64_t v75 = error_internal_cf;
      }
      else
      {
        CFRelease(error_internal_cf);
        unint64_t v73 = 0;
        unint64_t v74 = 0;
        uint64_t v76 = 0;
      }
LABEL_52:
      a3 = v174;
      goto LABEL_53;
    }
    uint64_t v82 = v42 + v176 + (v44 << 20);
    CFNumberRef v173 = v14;
    if (!is_storage_apfs(v60, v61, v62, v63, v64, v65, v66, v67))
    {
      uint64_t v101 = v185.f_blocks * v185.f_bsize;
      logfunction("", 1, @"HFS system partition has size of %llu (%llu MB)\n", v83, v84, v85, v86, v87, LOBYTE(v185.f_blocks) * LOBYTE(v185.f_bsize));
      CFStringRef v102 = @"-currentSystemPartitionSize (statfs) HFS+";
      goto LABEL_36;
    }
    if (os_variant_is_recovery())
    {
      *(void *)&v182.st_dev = 0;
      get_main_container_space_info(&v182, 0, 0, 0, 0, v88, v89, v90);
      logfunction("", 1, @"get_main_container_space_info: system volume is using %llu (%llu MB)\n", v91, v92, v93, v94, v95, v182.st_dev);
      uint64_t v101 = *(void *)&v182.st_dev;
      CFStringRef v102 = @"-currentSystemPartitionSize (get_main_container_space_info)";
    }
    else
    {
      memset(v177, 0, 12);
      *(void *)&v182.st_uid = 0;
      *(void *)&v182.st_dev = 5;
      v182.st_ino = 2155872256;
      if (getattrlist("/", &v182, v177, 0xCuLL, 0))
      {
        uint64_t v103 = __error();
        logfunction("", 1, @"getattrlist(ATTR_VOL_SPACEUSED) to get filesystem used space failed: %d\n", v104, v105, v106, v107, v108, *v103);
        uint64_t v101 = (v185.f_blocks - v185.f_bfree) * v185.f_bsize;
        CFStringRef v102 = @"-currentSystemPartitionSize (statfs)";
      }
      else
      {
        CFStringRef v102 = @"-currentSystemPartitionSize (getattrlist)";
        uint64_t v101 = *(uint64_t *)((char *)v177 + 4);
      }
    }
    logfunction("", 1, @"APFS system volume is using %llu (%llu MB)\n", v96, v97, v98, v99, v100, v101);
    logfunction("", 1, @"Checking for overprovisioning volume\n", v109, v110, v111, v112, v113, v170);
    id v114 = objc_msgSend(objc_msgSend(+[LPMedia mediaForPath:](LPMedia, "mediaForPath:", @"/"), "container"), "devNodePath");
    v177[0] = 0;
    BOOL v120 = v114 != 0;
    if (v114)
    {
      v121 = v114;
      logfunction("", 1, @"Attempting to check container %@ for overprovisioning volume\n", v115, v116, v117, v118, v119, (char)v114);
      [v121 UTF8String];
      if (APFSVolumeRoleFind() || ![v177[0] count])
      {
        BOOL v120 = 0;
LABEL_30:
        memset(&v182, 0, sizeof(v182));
        logfunction("", 1, @"Checking for overprovisioning file\n", v115, v116, v117, v118, v119, v171);
        if (lstat("/private/var/.overprovisioning_file", &v182) && *__error() == 2)
        {
          if (!v120)
          {
            logfunction("", 1, @"nand is %@\n", v123, v124, v125, v126, v127, (char)@"not overprovisioned");
            goto LABEL_36;
          }
        }
        else
        {
          logfunction("", 1, @"nand already over-provisioned(overprovisioning file present)\n", v123, v124, v125, v126, v127, v172);
        }
        logfunction("", 1, @"nand is %@\n", v123, v124, v125, v126, v127, (char)@"overprovisioned");
        v82 -= system_partition_padding;
        [v43 add:-system_partition_padding annotation:@"-systemPartitionPadding (nand already over-provisioned)"];
LABEL_36:
        a5 = v82 - v101;
        [v43 add:-(uint64_t)v101 annotation:v102];
        CFStringRef v183 = @"PrebootMountpoint";
        CFStringRef v184 = @"/private/preboot";
        char v128 = 1;
        long long v129 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
        uint64_t v130 = 0;
        do
        {
          char v131 = v128;
          long long v132 = get_nonsnapshot_apply_and_reserve_sizes_CRYPTEX_TAGS[v130];
          id v133 = ramrod_splat_copy_object_path(v132, v129);
          long long v134 = (id)CFMakeCollectable(v133);
          long long v135 = (const char *)[v134 fileSystemRepresentation];
          if (v135)
          {
            memset(&v182, 0, sizeof(v182));
            if (!stat(v135, &v182))
            {
              a5 -= v182.st_blocks << 9;
              [v43 add:-512 * v182.st_blocks, @"-%@ (%s)", v134, v132 annotationFormat];
            }
          }
          char v128 = 0;
          uint64_t v130 = 1;
        }
        while ((v131 & 1) != 0);
        if ((a5 & 0x8000000000000000) != 0)
        {
          logfunction("", 1, @"\n%s():\nrequiredFreeSpace:%@\n", v136, v137, v138, v139, v140, (char)"get_nonsnapshot_apply_and_reserve_sizes");
          id v147 = +[MSULogAnnotatedSum sum];
          unint64_t v148 = 419430400;
          [v147 add:419430400, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE" annotation];
          LOBYTE(v182.st_dev) = 0;
          APFSShouldSealSystemVolume();
          CFNumberRef v14 = v173;
          if (LOBYTE(v182.st_dev))
          {
            uint64_t v154 = (v178 + a5) & ~((uint64_t)(v178 + a5) >> 63);
            unint64_t v148 = v154 + 419430400;
            [v147 add:v154, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"MAX(requiredFreeSpace + systemPartitionSealingOverhead, 0) == MAX(%lld + %lld, 0) == MAX(%lld, 0)", -(uint64_t)((unint64_t)-(uint64_t)a5 >> 20), v178 >> 20, (v178 >> 20) - ((unint64_t)-(uint64_t)a5 >> 20)) annotation];
          }
          uint64_t v76 = 1;
          logfunction("", 1, @"%llu MB minimum free space required for personalization and Update volume\n", v149, v150, v151, v152, v153, v148 >> 20);
          logfunction("", 1, @"\n%s():%@\n", v155, v156, v157, v158, v159, (char)"get_nonsnapshot_apply_and_reserve_sizes");
          unint64_t v73 = 0;
          unint64_t v74 = 0;
          a5 = v148;
          a4 = v175;
        }
        else
        {
          CFNumberRef v14 = v173;
          if (get_apfs_preallocate_min_is_allowed(a1))
          {
            unint64_t v73 = a5 - 419430400;
            a4 = v175;
            if (a5 < 0x19000001
              || (logfunction("", 1, @"%llu MB reserve file will be needed (non-snapshot)\n", v141, v142, v143, v144, v145, v73 >> 20), apfs_preallocate_min = get_apfs_preallocate_min(a5 - 419430400), unint64_t v74 = apfs_preallocate_min - v73, apfs_preallocate_min <= v73))
            {
              unint64_t v74 = 0;
            }
            else
            {
              logfunction("", 1, @"preallocating a %lld MB reserve file will require an additional %lld MB of free space\n", v141, v142, v143, v144, v145, v73 >> 20);
              a5 += v74;
              [v43 add:v74, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"get_apfs_preallocate_min(%lld MB)", v73 >> 20, v74 >> 20) annotation];
            }
          }
          else
          {
            unint64_t v73 = 0;
            unint64_t v74 = 0;
            a4 = v175;
          }
          uint64_t v76 = 1;
          logfunction("", 1, @"free space required is %lld (%lld MB)\n", v141, v142, v143, v144, v145, a5);
          logfunction("", 1, @"\n%s():%@\n", v160, v161, v162, v163, v164, (char)"get_nonsnapshot_apply_and_reserve_sizes");
        }
        goto LABEL_52;
      }
      CFStringRef v122 = @"Found overprovisioning volume\n";
    }
    else
    {
      CFStringRef v122 = @"Failed to get container path. Unable to check for overprovisioning volume\n";
    }
    logfunction("", 1, v122, v115, v116, v117, v118, v119, v171);
    goto LABEL_30;
  }
  logfunction("", 1, @"Failed to get the system partition extras size\n", v37, v38, v39, v40, v41, (char)v166);
  CFErrorRef v80 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"failed to query partition sizes", v77, v78, v79, v169);
  if (a5)
  {
    unint64_t v73 = 0;
    unint64_t v74 = 0;
    uint64_t v81 = (void *)a5;
    a5 = 0;
    uint64_t v76 = 0;
    *uint64_t v81 = v80;
  }
  else
  {
    CFRelease(v80);
    unint64_t v73 = 0;
    unint64_t v74 = 0;
    uint64_t v76 = 0;
  }
LABEL_53:
  if (v14) {
    CFRelease(v14);
  }
  if (a2) {
    *a2 = a5;
  }
  if (a3) {
    *a3 = v73 & ~((uint64_t)v73 >> 63);
  }
  if (a4) {
    *a4 = v74;
  }
  return v76;
}

uint64_t get_apfs_preallocate_min_is_allowed(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"SUDisableAPFSGetPreallocateMin"];
  if (!v1)
  {
    CFStringRef v9 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is not expressly disallowed by asset attributes\n";
LABEL_8:
    uint64_t v8 = 1;
    logfunction("", 1, v9, v2, v3, v4, v5, v6, (char)v11);
    return v8;
  }
  uint64_t v7 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v11 = @"SUDisableAPFSGetPreallocateMin";
    CFStringRef v9 = @"%@ property has an unexpected type\n";
    goto LABEL_8;
  }
  if (![v7 BOOLValue])
  {
    CFStringRef v9 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is expressly allowed by asset attributes\n";
    goto LABEL_8;
  }
  logfunction("", 1, @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is disabled by asset attributes\n", v2, v3, v4, v5, v6, (char)v11);
  return 0;
}

unint64_t get_apfs_preallocate_min(unint64_t a1)
{
  uint64_t v2 = "/private/var/MobileSoftwareUpdate/.reserved";
  int v3 = open("/private/var/MobileSoftwareUpdate/.reserved", 1538, 438);
  if (v3 == -1)
  {
    if (*__error() != 1 && *__error() != 13
      || (v2 = "/tmp/.reserved", int v4 = open("/tmp/.reserved", 1538, 438), v4 == -1))
    {
      uint64_t v5 = __error();
      strerror(*v5);
      logfunction("", 1, @"open(\"%s\") failed: (%s)\n", v6, v7, v8, v9, v10, (char)v2);
      return a1;
    }
  }
  else
  {
    int v4 = v3;
  }
  v19[0] = 0;
  v19[1] = a1;
  unint64_t v20 = 0;
  if (ffsctl(v4, 0xC0184A68uLL, v19, 0) == -1)
  {
    CFStringRef v11 = __error();
    char v12 = strerror(*v11);
    logfunction("", 1, @"ffsctl() failed: (%s)\n", v13, v14, v15, v16, v17, v12);
  }
  else if (v20 > a1)
  {
    a1 = v20;
  }
  close(v4);
  unlink(v2);
  return a1;
}

uint64_t get_snapshot_apply_and_reserve_sizes(void *a1, void *a2, void *a3, void *a4)
{
  objc_msgSend(+[MSULogAnnotatedSum sum](MSULogAnnotatedSum, "sum"), "add:annotation:", 419430400, @"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE");
  APFSShouldSealSystemVolume();
  get_apfs_preallocate_min_is_allowed(a1);
  logfunction("", 1, @"snapshot application size : %lld (%lld MB)\n", v8, v9, v10, v11, v12, 0);
  logfunction("", 1, @"\n%s():%@\n", v13, v14, v15, v16, v17, (char)"get_snapshot_apply_and_reserve_sizes");
  if (a2) {
    *a2 = 419430400;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

NSDictionary *snapshot_is_prepared(void *a1)
{
  int v3 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/Update.plist"];
  int v4 = v3;
  if (v3)
  {
    id v5 = [(NSDictionary *)v3 objectForKey:@"update-asset-attributes"];
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [v5 objectForKey:@"Build"];
    id v7 = [a1 objectForKey:@"Build"];
    if (!v7) {
      id v7 = [a1 objectForKey:@"TargetUpdate"];
    }
    if ([v7 isEqualToString:v6]) {
      int v4 = (NSDictionary *)objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", @"prepare-snapshot"), "BOOLValue");
    }
    else {
LABEL_7:
    }
      int v4 = 0;
  }
  return v4;
}

uint64_t saveCurrentEnvInfoForNeRD(uint64_t a1)
{
  uint64_t v202 = 0;
  char v201 = 0;
  id v200 = 0;
  id v1 = +[NSFileManager defaultManager];
  int v2 = MGGetBoolAnswer();
  uint64_t v8 = MGCopyAnswer();
  if (!v8) {
    logfunction("", 1, @"Failed to get currentOSVersion\n", v3, v4, v5, v6, v7, v183);
  }
  v196 = (void *)MGCopyAnswer();
  if (!v196) {
    logfunction("", 1, @"Failed to get currentProductVersion\n", v9, v10, v11, v12, v13, v183);
  }
  id v19 = (id)MGCopyAnswer();
  if (!v19)
  {
    logfunction("", 1, @"currentOSType indicated as nil. Overriding it to be %@\n", v14, v15, v16, v17, v18, (char)@"BootedOSReleaseTypeUnknown");
    id v19 = [objc_alloc((Class)NSString) initWithString:@"BootedOSReleaseTypeUnknown"];
  }
  v193 = [+[NSLocale currentLocale] languageCode];
  if (v193)
  {
    if (!v2) {
      goto LABEL_16;
    }
  }
  else
  {
    logfunction("", 1, @"Failed to get device locale\n", v20, v21, v22, v23, v24, v183);
    if (!v2)
    {
LABEL_16:
      BOOL v191 = 0;
      goto LABEL_17;
    }
  }
  CFBooleanRef v25 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUDisableRedRingUI", @"com.apple.nerd", @"root", kCFPreferencesAnyHost);
  if (!v25) {
    goto LABEL_16;
  }
  CFBooleanRef v26 = v25;
  CFTypeID v27 = CFGetTypeID(v25);
  if (v27 != CFBooleanGetTypeID()) {
    goto LABEL_16;
  }
  int Value = CFBooleanGetValue(v26);
  BOOL v191 = Value != 0;
  unint64_t v34 = "FALSE(No effect)";
  if (Value) {
    unint64_t v34 = "TRUE";
  }
  logfunction("", 1, @"RedRingUIForceDisable is %s\n", v29, v30, v31, v32, v33, (char)v34);
LABEL_17:
  uint64_t v35 = (__CFString *)CFPreferencesCopyAppValue(@"EnableLiveAssetServerV2", @"com.apple.MobileAsset");
  v197 = v19;
  v198 = (void *)v8;
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v41 = v35;
  CFTypeID v42 = CFGetTypeID(v35);
  long long v43 = v41;
  if (v42 != CFStringGetTypeID())
  {
    CFTypeID v45 = CFGetTypeID(v41);
    if (v45 == CFNumberGetTypeID())
    {
      long long v43 = (__CFString *)[(__CFString *)v41 stringValue];
      CFRelease(v41);
      if (!v43) {
        goto LABEL_34;
      }
      goto LABEL_20;
    }
    CFTypeID v46 = CFGetTypeID(v41);
    if (v46 != CFBooleanGetTypeID())
    {
      CFRelease(v41);
      goto LABEL_34;
    }
    if (CFBooleanGetValue((CFBooleanRef)v41)) {
      long long v43 = @"YES";
    }
    else {
      long long v43 = @"NO";
    }
  }
  CFRelease(v41);
LABEL_20:
  if (([(__CFString *)v43 isEqual:@"off"] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"false"] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"NO"] & 1) != 0
    || ([(__CFString *)v43 isEqual:&__kCFBooleanFalse] & 1) != 0
    || ([(__CFString *)v43 isEqual:@"0"] & 1) != 0)
  {
    char v190 = 0;
    CFStringRef v44 = @"Pallas is disabled via default\n";
    goto LABEL_35;
  }
LABEL_34:
  char v190 = 1;
  CFStringRef v44 = @"Pallas is enabled\n";
LABEL_35:
  logfunction("", 1, v44, v36, v37, v38, v39, v40, v183);
  uint64_t v52 = MAGetPallasAudience();
  if (!v52) {
    logfunction("", 1, @"Failed to get pallas audience\n", v47, v48, v49, v50, v51, v184);
  }
  CFPropertyListRef v53 = CFPreferencesCopyAppValue(@"MobileAssetTokenFile", @"com.apple.MobileAsset");
  uint64_t v54 = (void *)v53;
  if (v53)
  {
    CFTypeID v55 = CFGetTypeID(v53);
    if (v55 == CFStringGetTypeID())
    {
      if (!objc_msgSend(objc_msgSend(v54, "pathComponents"), "containsObject:", @".."))
      {
        id v61 = [objc_alloc((Class)NSString) initWithFormat:@"/var/MobileSoftwareUpdate/%@", v54];
        goto LABEL_42;
      }
      logfunction("", 1, @"Invalid value set for TokenFile default\n", v56, v57, v58, v59, v60, v184);
    }
  }
  id v61 = 0;
LABEL_42:
  CFPropertyListRef v62 = CFPreferencesCopyAppValue(@"MobileAssetTokenOverride", @"com.apple.MobileAsset");
  uint64_t v63 = (void *)v62;
  CFTypeRef cf = v54;
  if (v62)
  {
    CFTypeID v64 = CFGetTypeID(v62);
    if (v64 == CFStringGetTypeID())
    {
      if (!v61) {
        id v61 = [objc_alloc((Class)NSString) initWithString:@"/var/MobileSoftwareUpdate/MobileAsset/token.tok"];
      }
      logfunction("", 1, @"Using %@ for token path\n", v65, v66, v67, v68, v69, (char)v61);
      uint64_t v199 = 0;
      if ([v63 writeToFile:v61 atomically:1 encoding:4 error:&v199]) {
        logfunction("", 1, @"Successfully wrote token to file %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
      else {
        logfunction("", 1, @"Failed to write token to file %@ : %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
    }
  }
  uint64_t v75 = ASServerURLForAssetType();
  LOBYTE(v81) = v202;
  if (v202 || (uint64_t v82 = (void *)v75) == 0)
  {
    if (!v202) {
      CFStringRef v81 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get update asset URL: %@\n", v76, v77, v78, v79, v80, (char)v81);
    uint64_t v82 = 0;
    uint64_t v202 = 0;
  }
  uint64_t v83 = ASServerURLForAssetType();
  LOBYTE(v89) = v202;
  if (v202 || (uint64_t v90 = (void *)v83) == 0)
  {
    if (!v202) {
      CFStringRef v89 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Brain asset URL: %@\n", v84, v85, v86, v87, v88, (char)v89);
    uint64_t v90 = 0;
    uint64_t v202 = 0;
  }
  uint64_t v91 = ASServerURLForAssetType();
  LOBYTE(v97) = v202;
  if (v202 || (uint64_t v98 = (void *)v91) == 0)
  {
    if (!v202) {
      CFStringRef v97 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Documentation asset URL: %@\n", v92, v93, v94, v95, v96, (char)v97);
    uint64_t v98 = 0;
    uint64_t v202 = 0;
  }
  v189 = v1;
  uint64_t v99 = ASServerURLForAssetType();
  LOBYTE(v105) = v202;
  if (v202 || (uint64_t v106 = (void *)v99) == 0)
  {
    if (!v202) {
      CFStringRef v105 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Watch Documentation asset URL: %@\n", v100, v101, v102, v103, v104, (char)v105);
    uint64_t v106 = 0;
    uint64_t v202 = 0;
  }
  [v82 absoluteString];
  [v90 absoluteString];
  [v98 absoluteString];
  [v106 absoluteString];
  logfunction("", 1, @"SU configuration:\n Asset Audience : %@\n SU Asset URL: %@\n Brain URL: %@\n Documentation URL: %@\n WatchDocumentation URL: %@\n", v107, v108, v109, v110, v111, v52);
  CFBooleanRef v112 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"RetainOriginalBootedOSState", @"com.apple.MobileSoftwareUpdate");
  CFBooleanRef v113 = v112;
  if (v112 {
    && (CFTypeID v114 = CFGetTypeID(v112), v114 == CFBooleanGetTypeID())
  }
    && CFBooleanGetValue(v113)
    && (logfunction("", 1, @"default set for retaining original bootedOSState plist, will not remove unchanged properties\n", v115, v116, v117, v118, v119, (char)v185), v185 = "/private/var/MobileSoftwareUpdate/", (id v120 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/%s/%s"]) != 0))
  {
    v192 = v120;
    id v126 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v120];
  }
  else
  {
    id v126 = objc_alloc_init((Class)NSMutableDictionary);
    v192 = 0;
  }
  if (v191) {
    [v126 setValue:@"YES" forKey:@"RedRingDisabled"];
  }
  if (v198) {
    [v126 setValue:v198 forKey:@"BootedOSVersion"];
  }
  if (v197) {
    [v126 setValue:v197 forKey:@"BootedOSType"];
  }
  if (v193) {
    [v126 setValue:v193 forKey:@"BootedOSLanguage"];
  }
  if (v82) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v82, "absoluteString"), @"BootedOSSUAssetURL");
  }
  if (v98) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v98, "absoluteString"), @"BootedOSDocumentationURL");
  }
  if (v106) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v106, "absoluteString"), @"BootedOSWatchDocumentationURL");
  }
  if (v90) {
    objc_msgSend(v126, "setValue:forKey:", objc_msgSend(v90, "absoluteString"), @"BootedOSBrainURL");
  }
  if (v52) {
    [v126 setValue:v52 forKey:@"BootedOSAssetAudience"];
  }
  if (v196) {
    [v126 setValue:v196 forKey:@"BootedOSProductVersion"];
  }
  if ((v190 & 1) == 0)
  {
    logfunction("", 1, @"Updating BootedOSState to indicate pallas is disabled\n", v121, v122, v123, v124, v125, (char)v185);
    [v126 setValue:@"YES" forKey:@"BootedOSHasPallasDisabled"];
  }
  if (v61)
  {
    logfunction("", 1, @"Updating BootedOSState with token path\n", v121, v122, v123, v124, v125, (char)v185);
    [v126 setValue:v61 forKey:@"BootedOSDawTokenPath"];
  }
  if (a1) {
    objc_msgSend(v126, "addEntriesFromDictionary:");
  }
  logfunction("", 1, @"Dictionary is %@\n", v121, v122, v123, v124, v125, (char)v126);
  v186 = "/private/var/MobileSoftwareUpdate/";
  id v132 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%s"];
  if (!v132)
  {
    CFStringRef v162 = @"Failed to allocate path string to save Booted OS state\n";
LABEL_113:
    logfunction("", 1, v162, v127, v128, v129, v130, v131, (char)v186);
    id v143 = 0;
    goto LABEL_123;
  }
  if (![(NSFileManager *)v189 fileExistsAtPath:v132 isDirectory:&v201])
  {
    logfunction("", 1, @"Creating directory(%@) to save current OS state\n", v133, v134, v135, v136, v137, (char)v132);
    if (![(NSFileManager *)v189 createDirectoryAtPath:v132 withIntermediateDirectories:1 attributes:0 error:&v200])
    {
      LOBYTE(v186) = (_BYTE)v200;
      CFStringRef v162 = @"Failed to create directory : %@\n";
      goto LABEL_113;
    }
  }
  LOBYTE(v187) = (_BYTE)v132;
  id v143 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s"];
  if (!v143)
  {
    CFStringRef v163 = @"Failed to allocate string to save the path for the state file\n";
LABEL_122:
    logfunction("", 1, v163, v138, v139, v140, v141, v142, (char)v187);
    goto LABEL_123;
  }
  logfunction("", 1, @"Saving env data to %@\n", v138, v139, v140, v141, v142, (char)v143);
  if (([v126 writeToFile:v143 atomically:1] & 1) == 0)
  {
    CFStringRef v163 = @"Failed to write env data to file\n";
    goto LABEL_122;
  }
  logfunction("", 1, @"Updating file permissions\n", v138, v139, v140, v141, v142, (char)v187);
  uint64_t v144 = (const char *)[v143 UTF8String];
  if (!v144)
  {
    logfunction("", 1, @"%s: Failed to get c string representation of the bootedOSStateFile path to fixup permissions..Deleting the file\n", v145, v146, v147, v148, v149, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  uint64_t v150 = v144;
  if (chmod(v144, 0x1F8u))
  {
    __error();
    uint64_t v151 = __error();
    strerror(*v151);
    logfunction("", 1, @"%s: Failed to chmod bootedOsStateFile at %@ errno=%d: (%s)..Deleting the file\n", v152, v153, v154, v155, v156, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  uint64_t v164 = getpwnam("mobile");
  if (!v164)
  {
    logfunction("", 1, @"%s: Failed to get uid/gid for mobile user to chown the bootedOSState file..Deleting the file at %@\n", v165, v166, v167, v168, v169, (char)"fixup_permissions_for_bootedos_state_file");
LABEL_120:
    logfunction("", 1, @"Failed to set permissions on BootedOSState file..Deleting it\n", v157, v158, v159, v160, v161, v188);
    uint64_t v199 = 0;
    [(NSFileManager *)v189 removeItemAtPath:v143 error:&v199];
    if (v199)
    {
      v187 = "saveCurrentEnvInfoForNeRD";
      CFStringRef v163 = @"%s: Failed to delete BootedOsState file at %@. Error: %@\n";
      goto LABEL_122;
    }
LABEL_123:
    uint64_t v181 = 0;
    goto LABEL_124;
  }
  if (chown(v150, v164->pw_uid, v164->pw_gid))
  {
    __error();
    v175 = __error();
    strerror(*v175);
    logfunction("", 1, @"%s: Failed to chown bootedOSStateFile at %@ errno=%d: (%s)..Deleting the file\n", v176, v177, v178, v179, v180, (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }
  uint64_t v181 = 1;
  logfunction("", 1, @"%s: Successfully fixed up permissions for %@\n", v170, v171, v172, v173, v174, (char)"fixup_permissions_for_bootedos_state_file");
LABEL_124:

  if (v63) {
    CFRelease(v63);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v181;
}

uint64_t msu_running_in_limited_environment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (&_os_variant_uses_ephemeral_storage)
  {
    uint64_t v8 = os_variant_uses_ephemeral_storage();
    if (v8) {
      CFStringRef v9 = @"MSU running in limited env\n";
    }
    else {
      CFStringRef v9 = @"MSU running in normal env\n";
    }
  }
  else
  {
    uint64_t v8 = 1;
    CFStringRef v9 = @"MSU running in normal env(default)\n";
  }
  logfunction("", 1, v9, a4, a5, a6, a7, a8, v11);
  return v8;
}

uint64_t msu_should_save_env_info_for_recovery()
{
  return 1;
}

id __cryptex_size_requirement_for_update_type_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = +[NSString stringWithFormat:@"update_attributes[\"%@\"][%lu(%@)]", @"CryptexSizeInfo", a2, a3];
  id v7 = [a4 objectForKeyedSubscript:@"CryptexSize"];
  id v8 = [v7 unsignedLongLongValue];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += ((void)v8 << 20) / 5uLL + ((void)v8 << 20);
    [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSize"];
  }
  id v9 = [a4 objectForKeyedSubscript:@"ReversePatchSize"];
  id v10 = [v9 unsignedLongLongValue];
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += (void)v10 << 20;
    [*(id *)(a1 + 32) add:(void)v10 << 20, @"%@[\"%@\"]", v6, @"ReversePatchSize" annotationFormat];
  }
  id v11 = [a4 objectForKeyedSubscript:@"CryptexSizeDelta"];
  id result = [v11 unsignedLongLongValue];
  if (v11)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += (void)result << 20;
      return [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSizeDelta"];
    }
  }
  return result;
}

void sub_10001BDA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, id a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking MSUBrain";
    a13 = [v14 description];
    (*(void (**)(uint64_t, NSError *))(v13 + 16))(v13, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1365, +[NSDictionary dictionaryWithObjects:&a12 forKeys:&a10 count:2]));
    objc_end_catch();
    JUMPOUT(0x10001BD74);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001BEE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_10001C384(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D5AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

CFErrorRef MSURetrievePreviousUpdateResults_server()
{
  CFDictionaryRef dict = (const __CFDictionary *)load_dict("/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (dict)
  {
    CFDictionaryRef v1 = dict;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(dict, @"ota-result");
    unsigned __int8 v3 = CFDictionaryGetValue(v1, @"ota-failure-reason");
    if (!Value) {
      goto LABEL_30;
    }
    char v4 = v3;
    if (CFStringCompare(Value, @"crash", 1uLL) == kCFCompareEqualTo)
    {
      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf(@"MobileSoftwareUpdateErrorDomain", 1105, 0, 0, v1, @"OTA failed. Preserved reason: %@", v5, v6, v4);
      goto LABEL_36;
    }
    if (CFStringCompare(Value, @"panic", 1uLL) == kCFCompareEqualTo)
    {
      error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf(@"MobileSoftwareUpdateErrorDomain", 1104, 0, 0, v1, @"OTA failed. Preserved reason: %@", v7, v8, v4);
      goto LABEL_36;
    }
    if (CFStringCompare(Value, @"success", 1uLL) == kCFCompareEqualTo)
    {
LABEL_30:
      CFErrorRef v33 = 0;
      goto LABEL_37;
    }
    char v36 = v4;
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, Value, @";");
    if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
    {
      CFErrorRef v13 = 0;
      if (!ArrayBySeparatingStrings) {
        goto LABEL_27;
      }
    }
    else
    {
      CFIndex v12 = 0;
      CFErrorRef v13 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v12);
        char v15 = (char)ValueAtIndex;
        CFArrayRef v16 = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, ValueAtIndex, @" ");
        if (v16)
        {
          CFArrayRef v17 = v16;
          if (CFArrayGetCount(v16) < 2)
          {
            if (CFArrayGetCount(v17) == 1 && !v13) {
              CFErrorRef v13 = _create_error_internal_with_userinfo_cf(@"MobileSoftwareUpdateErrorDomain", 1106, 0, 0, 0, @"%@", v27, v28, v15);
            }
          }
          else
          {
            CFStringRef v18 = (const __CFString *)CFArrayGetValueAtIndex(v17, 0);
            CFStringRef v19 = (const __CFString *)CFArrayGetValueAtIndex(v17, 1);
            IntCFStringRef Value = CFStringGetIntValue(v19);
            CFComparisonResult v23 = CFStringCompare(v18, @"MSU", 1uLL);
            CFStringRef v24 = @"MobileSoftwareUpdateErrorDomain";
            if (v23)
            {
              if (CFStringCompare(v18, @"RRD", 1uLL)) {
                CFStringRef v24 = v18;
              }
              else {
                CFStringRef v24 = @"RamrodErrorDomain";
              }
            }
            if (IntValue) {
              int v25 = IntValue;
            }
            else {
              int v25 = 1106;
            }
            CFErrorRef v26 = _create_error_internal_with_userinfo_cf(v24, v25, v13, 0, 0, @"%@", v21, v22, v15);
            if (v13) {
              CFRelease(v13);
            }
            CFErrorRef v13 = v26;
          }
          CFRelease(v17);
        }
        ++v12;
      }
      while (CFArrayGetCount(ArrayBySeparatingStrings) > v12);
      if (!ArrayBySeparatingStrings) {
        goto LABEL_27;
      }
    }
    CFRelease(ArrayBySeparatingStrings);
LABEL_27:
    if (v13)
    {
      CFStringRef Domain = CFErrorGetDomain(v13);
      CFIndex Code = CFErrorGetCode(v13);
      CFErrorRef v33 = _create_error_internal_with_userinfo_cf(Domain, Code, v13, 0, v1, @"OTA failed. Preserved reason: %@", v31, v32, v36);
      CFRelease(v13);
LABEL_37:
      CFRelease(v1);
      return v33;
    }
    error_internal_with_userinfo_CFTypeRef cf = _create_error_internal_with_userinfo_cf(@"MobileSoftwareUpdateErrorDomain", 1106, 0, 0, v1, @"OTA failed. Preserved reason: %@", v10, v11, v36);
LABEL_36:
    CFErrorRef v33 = error_internal_with_userinfo_cf;
    goto LABEL_37;
  }
  return 0;
}

uint64_t MSUAssetCalculatePrepareSizes_server(uint64_t a1, const __CFDictionary *a2, void *a3, void *a4, CFErrorRef *a5)
{
  id v61 = 0;
  CFPropertyListRef v62 = 0;
  uint64_t msubrain = get_msubrain();
  if (msubrain)
  {
    CFArrayRef v16 = (void *)msubrain;
    uint64_t v59 = 0;
    id v60 = 0;
    id v17 = +[NSMutableDictionary dictionary];
    [v17 setObject:a1 forKeyedSubscript:@"TargetUUID"];
    if ([v17 count]) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    if (![v16 calculateUpdateStorageRequirements:40 attributes:a2 options:v18 info:&v60 error:&v59])
    {
      logfunction("", 1, @"Using OS prepare calculation because MSUBrain call failed: %@\n", v19, v20, v21, v22, v23, v59);
      goto LABEL_14;
    }
    id v24 = [v60 objectForKeyedSubscript:@"PrepareSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      logfunction("", 1, @"Using MSUBrain prepare calculation\n", v25, v26, v27, v28, v29, v56);
      CFPropertyListRef v62 = (char *)[v24 unsignedLongLongValue];
      id v30 = [v60 objectForKeyedSubscript:@"SnapshotPrepareSize"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v61 = (char *)[v30 unsignedLongLongValue];
        uint64_t v31 = 1;
        goto LABEL_28;
      }
      char v56 = objc_opt_class();
      CFStringRef v32 = @"Using OS prepare calculation because MSUBrain returned an invalid object type (snapshot) : %@\n";
    }
    else
    {
      char v56 = objc_opt_class();
      CFStringRef v32 = @"Using OS prepare calculation because MSUBrain returned invalid object type : %@\n";
    }
  }
  else
  {
    CFStringRef v32 = @"Using OS prepare calculation because MSUBrain is not loaded\n";
  }
  logfunction("", 1, v32, v11, v12, v13, v14, v15, v56);
LABEL_14:
  if (a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a2, @"SplatOnly");
    if (Value && (v42 = Value, CFTypeID v43 = CFGetTypeID(Value), v43 == CFBooleanGetTypeID()) && CFBooleanGetValue(v42))
    {
      logfunction("", 1, @"Returning snapshot preparation size for splat\n", v37, v38, v39, v40, v41, v57);
      if ((get_snapshot_preparation_size(a2, &v62, a5) & 1) == 0)
      {
        logfunction("", 1, @"Error determining snapshot preparation size: %@.\n", v44, v45, v46, v47, v48, (char)*a5);
        goto LABEL_27;
      }
    }
    else
    {
      logfunction("", 1, @"Returning non-snapshot preparation size\n", v37, v38, v39, v40, v41, v57);
      if ((get_nonsnapshot_preparation_size(a2, &v62, a5) & 1) == 0)
      {
        logfunction("", 1, @"Error determining the non-snapshot preparation size: %@.\n", v44, v45, v46, v47, v48, (char)*a5);
        goto LABEL_27;
      }
    }
    uint64_t v31 = 1;
    logfunction("", 1, @"Also returning snapshot prepare size\n", v44, v45, v46, v47, v48, v58);
    if (get_snapshot_preparation_size(a2, &v61, a5)) {
      goto LABEL_28;
    }
    logfunction("", 1, @"Error determining the snapshot prepare size: %@.\n", v49, v50, v51, v52, v53, (char)*a5);
    goto LABEL_27;
  }
  CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Update attributes dictionary is NULL", v33, v34, v35, v57);
  if (a5)
  {
    uint64_t v31 = 0;
    *a5 = error_internal_cf;
    goto LABEL_28;
  }
  CFRelease(error_internal_cf);
LABEL_27:
  uint64_t v31 = 0;
LABEL_28:
  if (a3) {
    *a3 = v62;
  }
  if (a4) {
    *a4 = v61;
  }
  return v31;
}

uint64_t _MSUAssetCalculateApplyAndReserveSizes(void *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5, CFErrorRef *a6)
{
  id v68 = 0;
  id v69 = 0;
  uint64_t msubrain = (void *)get_msubrain();
  if (msubrain)
  {
    uint64_t v66 = 0;
    id v67 = 0;
    if (![msubrain calculateUpdateStorageRequirements:80 attributes:a1 options:0 info:&v67 error:&v66])
    {
      logfunction("", 1, @"Using OS apply calculation because MSUBrain call failed: %@\n", v18, v19, v20, v21, v22, v66);
      goto LABEL_11;
    }
    id v23 = [v67 objectForKeyedSubscript:@"ApplySize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      logfunction("", 1, @"Using MSUBrain apply calculation\n", v24, v25, v26, v27, v28, v62);
      id v69 = [v23 unsignedLongLongValue];
      id v29 = [v67 objectForKeyedSubscript:@"SnapshotApplySize"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = 1;
        logfunction("", 1, @"Using MSUBrain apply calculation (snapshot)\n", v30, v31, v32, v33, v34, v63);
        id v68 = [v29 unsignedLongLongValue];
        goto LABEL_24;
      }
      char v62 = objc_opt_class();
      CFStringRef v36 = @"Using OS apply calculation because MSUBrain returned an invalid object type (snapshot) : %@\n";
    }
    else
    {
      char v62 = objc_opt_class();
      CFStringRef v36 = @"Using OS apply calculation because MSUBrain returned an invalid object type : %@\n";
    }
  }
  else
  {
    CFStringRef v36 = @"Using OS apply calculation because MSUBrain is not loaded\n";
  }
  logfunction("", 1, v36, v13, v14, v15, v16, v17, v62);
LABEL_11:
  if (a1)
  {
    if (snapshot_is_prepared(a1))
    {
      logfunction("", 1, @"Returning snapshot apply size\n", v40, v41, v42, v43, v44, v64);
      if (get_snapshot_apply_and_reserve_sizes(a1, &v69, a4, a5))
      {
        id v68 = v69;
        uint64_t v35 = 1;
        goto LABEL_24;
      }
      logfunction("", 1, @"Error determining what the snapshot apply size: %@.\n", v45, v46, v47, v48, v49, (char)*a6);
    }
    else
    {
      logfunction("", 1, @"Returning non-snapshot apply size\n", v40, v41, v42, v43, v44, v64);
      if (get_nonsnapshot_apply_and_reserve_sizes((const __CFDictionary *)a1, (unint64_t *)&v69, a4, a5, (unint64_t)a6))
      {
        uint64_t v35 = 1;
        logfunction("", 1, @"Also returning snapshot apply size\n", v51, v52, v53, v54, v55, v65);
        if (get_snapshot_apply_and_reserve_sizes(a1, &v68, 0, 0)) {
          goto LABEL_24;
        }
        logfunction("", 1, @"Error determining the snapshot apply size: %@.\n", v56, v57, v58, v59, v60, (char)*a6);
      }
      else
      {
        logfunction("", 1, @"Error determining the non-snapshot apply size: %@.\n", v51, v52, v53, v54, v55, (char)*a6);
      }
    }
  }
  else
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 9, 0, 0, @"Update attributes dictionary is NULL", v37, v38, v39, v64);
    if (a6)
    {
      uint64_t v35 = 0;
      *a6 = error_internal_cf;
      goto LABEL_24;
    }
    CFRelease(error_internal_cf);
  }
  uint64_t v35 = 0;
LABEL_24:
  if (a2) {
    *a2 = v69;
  }
  if (a3) {
    *a3 = v68;
  }
  return v35;
}

uint64_t MSUAssetCalculateApplySizes_server(void *a1, void *a2, void *a3, CFErrorRef *a4)
{
  return _MSUAssetCalculateApplyAndReserveSizes(a1, a2, a3, 0, 0, a4);
}

uint64_t check_available_size(unint64_t a1, void *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    uint64_t available_space = get_available_space(a3);
    if (*a3) {
      return 0;
    }
    uint64_t v17 = a1 - available_space;
    if (a1 <= available_space) {
      goto LABEL_15;
    }
    logfunction("", 1, @"sizeNeeded = (%lld - %lld) = %lld\n", v12, v13, v14, v15, v16, a1);
    if (trigger_cache_delete(v17, @"/private/var", 4, 0))
    {
      uint64_t v21 = get_available_space(a3);
      if (!*a3)
      {
        if (a1 > v21)
        {
          *a2 = a1 - v21;
          logfunction("", 1, @"prequiredsize = (%lld - %lld) = %lld\n", v12, v13, v14, v15, v16, a1);
          CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 20, 0, 0, @"There is not enough space to proceed with the update. %lld is required", v22, v23, v24, *a2);
          *a3 = error_internal_cf;
          CFTypeID v26 = CFGetTypeID(error_internal_cf);
          CFTypeID TypeID = CFErrorGetTypeID();
          uint64_t v33 = "not";
          if (v26 == TypeID) {
            uint64_t v33 = "";
          }
          logfunction("", 1, @"*perrorinfo (%s error)= %@\n", v28, v29, v30, v31, v32, (char)v33);
          return 0;
        }
LABEL_15:
        uint64_t v38 = 1;
        logfunction("", 1, @"Required space (%lld) is available (%lld)\n", v12, v13, v14, v15, v16, a1);
        *a2 = 0;
        return v38;
      }
      return 0;
    }
    CFErrorRef v37 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 7, 0, 0, @"Cache delete failed", v18, v19, v20, v41);
  }
  else
  {
    logfunction("", 1, @"No point in calculating needed size since out param is NULL\n", a4, a5, a6, a7, a8, v40);
    CFErrorRef v37 = _create_error_internal_cf(kCFErrorDomainPOSIX, 22, 0, 0, @"missing prequiredsize parameter", v34, v35, v36, v42);
    if (!a3)
    {
      CFRelease(v37);
      return 0;
    }
  }
  uint64_t v38 = 0;
  *a3 = v37;
  return v38;
}

uint64_t MSUCheckInstallationSize_server(void *a1, void *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0;
  unint64_t v19 = 0;
  if (a1)
  {
    if (_MSUAssetCalculateApplyAndReserveSizes(a1, &v19, 0, 0, 0, (CFErrorRef *)&cf))
    {
      uint64_t v12 = check_available_size(v19, a2, a3, v10, v11, a6, a7, a8);
      goto LABEL_9;
    }
    CFTypeRef v15 = cf;
    CFStringRef v13 = @"Failed to calculate apply size";
    CFIndex v14 = 7;
  }
  else
  {
    CFStringRef v13 = @"No asset properties provided";
    CFIndex v14 = 9;
    CFTypeRef v15 = 0;
  }
  CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", v14, v15, 0, v13, a6, a7, a8, (char)cf);
  if (a3)
  {
    uint64_t v12 = 0;
    *a3 = error_internal_cf;
  }
  else
  {
    CFRelease(error_internal_cf);
    uint64_t v12 = 0;
  }
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

uint64_t get_available_space(CFErrorRef *a1)
{
  bzero(&v8, 0x878uLL);
  if (!statfs("/private/var", &v8)) {
    return v8.f_bavail * v8.f_bsize;
  }
  int v2 = __error();
  CFErrorRef error_internal_cf = _create_error_internal_cf(kCFErrorDomainPOSIX, *v2, 0, 0, @"Failed to get filesystem stats", v3, v4, v5, v8.f_bsize);
  if (a1) {
    *a1 = error_internal_cf;
  }
  else {
    CFRelease(error_internal_cf);
  }
  return -1;
}

void sub_10001E714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E7B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001EBA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MSUShouldPromptTTR()
{
  return os_variant_has_internal_diagnostics();
}

void MSUPromptForTTR(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (os_variant_has_internal_diagnostics())
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __MSUPromptForTTR_block_invoke;
    v11[3] = &unk_100059FF8;
    void v11[4] = a1;
    v11[5] = @"MSUPromptForTTR";
    v11[6] = a2;
    v11[7] = a3;
    BOOL v6 = MSUTTRIsKeybagLocked();
    if (v6)
    {
      uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"MSUTTRWaitForUnlock";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Waiting for first unlock to prompt", (uint8_t *)&buf, 0xCu);
      }
      statfs v8 = "com.apple.mobile.keybagd.first_unlock";
    }
    else
    {
      statfs v8 = 0;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3052000000;
    uint64_t v21 = __Block_byref_object_copy__5;
    uint64_t v22 = __Block_byref_object_dispose__5;
    id v23 = 0;
    id v23 = [v11 copy];
    if (v6)
    {
      int out_token = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = __MSUTTRWaitForUnlock_block_invoke;
      handler[3] = &unk_10005A020;
      handler[4] = @"MSUTTRWaitForUnlock";
      void handler[5] = &buf;
      notify_register_dispatch(v8, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
      if (MSUTTRIsKeybagLocked())
      {
LABEL_15:
        _Block_object_dispose(&buf, 8);
        return;
      }
      id v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = @"MSUTTRWaitForUnlock";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Device now ready, cancelling notification", (uint8_t *)&block, 0xCu);
      }
      notify_cancel(out_token);
    }
    uint64_t v10 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = @"MSUTTRWaitForUnlock";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Device unlocked and available, queueing up async prompt", (uint8_t *)&block, 0xCu);
    }
    *(void *)&long long block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472;
    CFTypeRef v15 = __MSUTTRWaitForUnlock_block_invoke_38;
    uint64_t v16 = &unk_10005A048;
    CFStringRef v17 = @"MSUTTRWaitForUnlock";
    p_long long buf = &buf;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &block);
    goto LABEL_15;
  }
}

void sub_10001EF28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __MSUPromptForTTR_block_invoke(uint64_t a1)
{
  SInt32 error = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  v18[0] = kCFUserNotificationAlertHeaderKey;
  v18[1] = kCFUserNotificationAlertMessageKey;
  v19[0] = v2;
  v19[1] = @"File a radar now?";
  v18[2] = kCFUserNotificationDefaultButtonTitleKey;
  v18[3] = kCFUserNotificationAlternateButtonTitleKey;
  void v19[2] = @"OK";
  v19[3] = @"Cancel";
  uint64_t v3 = CFUserNotificationCreate(kCFAllocatorSystemDefault, 0.0, 0, &error, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4]);
  if (v3 && !error)
  {
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v3, (CFUserNotificationCallBack)MSUTTRUserNotificationCallback, 0);
    if (RunLoopSource)
    {
      uint64_t v5 = RunLoopSource;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __MSUPromptForTTR_block_invoke_30;
      v11[3] = &unk_100059FD0;
      long long v12 = *(_OWORD *)(a1 + 48);
      if (callbackBlock)
      {

        callbackBlock = 0;
      }
      callbackBlock = (uint64_t)[v11 copy];
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v5, kCFRunLoopCommonModes);
      uint64_t v3 = v5;
    }
    else
    {
      id v9 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | FAILURE | Failed to create run loop source for TTR notification", buf, 0xCu);
      }
    }
LABEL_13:
    CFRelease(v3);
    return;
  }
  uint64_t v7 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 1024;
    SInt32 v17 = error;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | FAILURE | Failed to display TTR prompt with code %d", buf, 0x12u);
  }
  if (v3) {
    goto LABEL_13;
  }
}

void MSUTTRUserNotificationCallback()
{
  id v0 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    CFStringRef v4 = @"MSUTTRUserNotificationCallback";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | BEGIN", (uint8_t *)&v3, 0xCu);
  }
  if (callbackBlock)
  {
    (*(void (**)(void))(callbackBlock + 16))();

    callbackBlock = 0;
  }
  else
  {
    uint64_t v1 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      CFStringRef v4 = @"MSUTTRUserNotificationCallback";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | ERROR | Callback not defined", (uint8_t *)&v3, 0xCu);
    }
  }
  uint64_t v2 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    CFStringRef v4 = @"MSUTTRUserNotificationCallback";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | DONE", (uint8_t *)&v3, 0xCu);
  }
}

void __MSUPromptForTTR_block_invoke_30(uint64_t a1, CFTypeRef cf, char a3)
{
  if ((a3 & 3) == 0)
  {
    uint64_t v5 = *(__CFString **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (objc_opt_class())
    {
      uint64_t v32 = v4;
      uint64_t v33 = v6;
      if (CFStringGetLength(v5) >= 241) {
        uint64_t v5 = (__CFString *)[(__CFString *)v5 substringToIndex:240];
      }
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      [v7 setObject:kDefaultClassification forKeyedSubscript:@"Classification"];
      [v7 setObject:kMSUComponentId forKeyedSubscript:@"ComponentID"];
      [v7 setObject:kMSUComponentName forKeyedSubscript:@"ComponentName"];
      [v7 setObject:kMSUComponentVersion forKeyedSubscript:@"ComponentVersion"];
      [v7 setObject:kDefaultReproducibility forKeyedSubscript:@"Reproducibility"];
      [v7 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@", v5), @"Title" forKeyedSubscript];
      [v7 setObject:kASUOTAAnomalyKeyword forKeyedSubscript:@"Keywords"];
      uint64_t v8 = +[NSMutableArray arrayWithArray:&off_100064BC8];
      id v9 = +[NSFileManager defaultManager];
      if ([(NSMutableArray *)v8 count])
      {
        unint64_t v10 = 0;
        do
        {
          id v11 = [(NSMutableArray *)v8 objectAtIndexedSubscript:v10];
          char v34 = 0;
          unsigned int v12 = [(NSFileManager *)v9 fileExistsAtPath:v11 isDirectory:&v34];
          if (!v12 || v34)
          {
            [(NSMutableArray *)v8 removeObjectAtIndex:v10--];
            if (v12)
            {
              CFStringRef v13 = [(NSFileManager *)v9 contentsOfDirectoryAtPath:v11 error:0];
              if (v13)
              {
                CFIndex v14 = v13;
                long long v37 = 0u;
                long long v38 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
                if (v15)
                {
                  id v16 = v15;
                  uint64_t v17 = *(void *)v36;
                  do
                  {
                    for (i = 0; i != v16; i = (char *)i + 1)
                    {
                      if (*(void *)v36 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      -[NSMutableArray addObject:](v8, "addObject:", [v11 stringByAppendingPathComponent:*(void *)(*((void *)&v35 + 1) + 8 * i)]);
                    }
                    id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
                  }
                  while (v16);
                }
              }
            }
          }
          ++v10;
        }
        while (v10 < (unint64_t)[(NSMutableArray *)v8 count]);
      }
      if ([(NSMutableArray *)v8 count] && v8)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", -[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", @","), @"Attachments");
        unint64_t v19 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)v8 count]];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v20 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v36;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v36 != v22) {
                objc_enumerationMutation(v8);
              }
              -[NSMutableArray addObject:](v19, "addObject:", [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) lastPathComponent]);
            }
            id v21 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v21);
        }
        uint64_t v24 = +[NSString stringWithFormat:@"%@\nExpected attachments:\n(sysdiagnose)\n%@", v32, [(NSMutableArray *)v19 componentsJoinedByString:@"\n"]];
      }
      else
      {
        uint64_t v24 = +[NSString stringWithFormat:@"%@\nExpected attachments:\n(sysdiagnose)", v32, v31];
      }
      [v7 setObject:v24 forKeyedSubscript:@"Description"];
      uint64_t v25 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
      CFTypeID v26 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v27 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v36;
        do
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v26, "addObject:", +[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", *(void *)(*((void *)&v35 + 1) + 8 * (void)k), objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * (void)k))));
          }
          id v28 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v28);
      }
      [(NSURLComponents *)v25 setQueryItems:v26];
      objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "openURL:configuration:completionHandler:", -[NSURLComponents URL](v25, "URL"), 0, 0);

      BOOL v6 = v33;
    }
  }
  CFRelease(cf);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __MSUTTRWaitForUnlock_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v3 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Got notification, prompting for TTR", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Got notification, but already prompted", (uint8_t *)&v7, 0xCu);
  }
}

void __MSUTTRWaitForUnlock_block_invoke_38(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  else
  {
    int v3 = objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[TTR] %@ | Called async to prompt, but already prompted", (uint8_t *)&v5, 0xCu);
    }
  }
}

BOOL MSUTTRIsKeybagLocked()
{
  return MKBGetDeviceLockState() != 3 && MKBDeviceUnlockedSinceBoot() != 1;
}

id retrieve_previous_update_state()
{
  id v0 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist"];
  if (!v0) {
    goto LABEL_5;
  }
  id v6 = [(NSDictionary *)v0 objectForKey:@"PreviousUpdateState"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v6 longValue];
      goto LABEL_6;
    }
LABEL_5:
    id v6 = 0;
  }
LABEL_6:
  logfunction("", 1, @"%s: found previous update state MSUPreviousUpdateState=%u\n", v1, v2, v3, v4, v5, (char)"retrieve_previous_update_state");
  return v6;
}

BOOL is_first_boot_after_update()
{
  BOOL v0 = [+[NSFileManager defaultManager] fileExistsAtPath:@"/var/run/FirstBootAfterUpdate"];
  logfunction("", 1, @"%s: is first boot: %@\n", v1, v2, v3, v4, v5, (char)"is_first_boot_after_update");
  return v0;
}

const void *retrieve_previous_update_date()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist"];
  if (!v0) {
    return 0;
  }
  id v1 = [(NSDictionary *)v0 objectForKey:@"PreviousUpdateDate"];
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFDateGetTypeID())
    {
      CFRetain(v2);
      return v2;
    }
    return 0;
  }
  return v2;
}

uint64_t get_previous_update_unresolved_tolerated_failures_count()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"];
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  if (v0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __get_previous_update_unresolved_tolerated_failures_count_block_invoke;
    v3[3] = &unk_10005A070;
    v3[4] = &v4;
    [(NSDictionary *)v0 enumerateKeysAndObjectsUsingBlock:v3];
    uint64_t v1 = *((unsigned int *)v5 + 6);
  }
  else
  {
    uint64_t v1 = 0;
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001FD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __get_previous_update_unresolved_tolerated_failures_count_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 isEqualToString:@"uuid"];
  if ((result & 1) == 0)
  {
    if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"), "BOOLValue"))BOOL v6 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"InitialResult"), "intValue") != 0; {
    else
    }
      BOOL v6 = 0;
    id result = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue");
    if (result)
    {
      id result = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"RetryResult"), "intValue");
      if (!result) {
        return result;
      }
    }
    else if (!v6)
    {
      return result;
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

const void *retrieve_previous_restore_date()
{
  BOOL v0 = +[NSDictionary dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/last_update_result.plist"];
  if (!v0) {
    return 0;
  }
  id v1 = [(NSDictionary *)v0 objectForKey:@"PreviousRestoreDate"];
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFDateGetTypeID())
    {
      CFRetain(v2);
      return v2;
    }
    return 0;
  }
  return v2;
}

uint64_t load_trust_cache_at_path(const char *a1, NSError **a2)
{
  char v3 = (char)a1;
  memset(&v66, 0, sizeof(v66));
  io_connect_t connect = 0;
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    uint64_t v16 = *__error();
    NSErrorUserInfoKey v78 = NSDebugDescriptionErrorKey;
    uint64_t v17 = __error();
    uint64_t v79 = +[NSString stringWithFormat:@"open() failed: %s", strerror(*v17)];
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v16, +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1]);
    uint64_t v18 = __error();
    strerror(*v18);
    logfunction("", 1, @"Could not open trust cache at path %s: %s.\n", v19, v20, v21, v22, v23, v3);
    CFBooleanRef v24 = (const __CFBoolean *)MGCopyAnswer();
    if (v24 == kCFBooleanFalse
      && (bzero(__s1, 0x400uLL), size_t v64 = 1024, !sysctlbyname("kern.bootargs", __s1, &v64, 0, 0))
      && strstr(__s1, "msu_eng_brain=1"))
    {
      uint64_t v15 = 1;
      logfunction("", 1, @"System policy for update brain is in effect.\n", v53, v54, v55, v56, v57, outputStructa);
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v15 = 0;
    }
    CFRelease(v24);
    goto LABEL_9;
  }
  int v5 = v4;
  if (fstat(v4, &v66))
  {
    uint64_t v6 = *__error();
    NSErrorUserInfoKey v75 = NSDebugDescriptionErrorKey;
    int v7 = __error();
    uint64_t v76 = +[NSString stringWithFormat:@"fstat() failed: %s", strerror(*v7)];
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v6, +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1]);
    id v9 = __error();
    char outputStructb = strerror(*v9);
    logfunction("", 1, @"Could not fstat trust cache: %s\n", v10, v11, v12, v13, v14, outputStructb);
LABEL_4:
    close(v5);
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  CFTypeID v26 = mmap(0, v66.st_size, 1, 1026, v5, 0);
  if (v26 == (void *)-1)
  {
    uint64_t v39 = *__error();
    NSErrorUserInfoKey v73 = NSDebugDescriptionErrorKey;
    char v40 = __error();
    uint64_t v74 = +[NSString stringWithFormat:@"mmap() failed: %s", strerror(*v40)];
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v39, +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1]);
    char v41 = __error();
    strerror(*v41);
    logfunction("", 1, @"Could not map file %s: %s\n", v42, v43, v44, v45, v46, v3);
    goto LABEL_4;
  }
  id v27 = v26;
  CFDictionaryRef v28 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v28);
  io_object_t v30 = MatchingService;
  if (!MatchingService)
  {
    NSErrorUserInfoKey v71 = NSDebugDescriptionErrorKey;
    CFStringRef v72 = @"Could not find AppleMobileFileIntegrity service";
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 3, +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1]);
    CFStringRef v52 = @"Could not find AppleMobileFileIntegrity service\n";
LABEL_22:
    logfunction("", 1, v52, v47, v48, v49, v50, v51, outputStruct);
    goto LABEL_23;
  }
  uint64_t v31 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
  if (!v31)
  {
    uint64_t v58 = IOConnectCallMethod(connect, 2u, 0, 0, v27, v66.st_size, 0, 0, 0, 0);
    if (!v58)
    {
      uint64_t v8 = 0;
      uint64_t v15 = 1;
      goto LABEL_24;
    }
    char v59 = v58;
    uint64_t v60 = (int)v58;
    NSErrorUserInfoKey v67 = NSDebugDescriptionErrorKey;
    id v68 = +[NSString stringWithFormat:@"IOConnectCallMethod() failed: 0x%x", v58];
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"IOKitErrorDomain", v60, +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1]);
    char outputStruct = v59;
    CFStringRef v52 = @"Unable to load trust cache: 0x%x\n";
    goto LABEL_22;
  }
  char v32 = v31;
  uint64_t v33 = (int)v31;
  NSErrorUserInfoKey v69 = NSDebugDescriptionErrorKey;
  uint64_t v70 = +[NSString stringWithFormat:@"IOServiceOpen() failed: 0x%x", v31];
  uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"IOKitErrorDomain", v33, +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1]);
  logfunction("", 1, @"Unable to open user client: 0x%x\n", v34, v35, v36, v37, v38, v32);
LABEL_23:
  uint64_t v15 = 0;
LABEL_24:
  close(v5);
  munmap(v27, v66.st_size);
  if (connect) {
    IOServiceClose(connect);
  }
  if (v30) {
    IOObjectRelease(v30);
  }
LABEL_9:
  if (a2) {
    *a2 = v8;
  }
  return v15;
}

void sub_10002072C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

id nrdSharedLogger()
{
  if (nrdSharedLogger_pred != -1) {
    dispatch_once(&nrdSharedLogger_pred, &__block_literal_global_11);
  }
  BOOL v0 = (void *)nrdSharedLogger___instance;
  return v0;
}

void __nrdSharedLogger_block_invoke(id a1)
{
  nrdSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "NRD");
  _objc_release_x1();
}

void sub_1000218FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, NSErrorUserInfoKey a10, const __CFString *a11, const __CFString *a12, uint64_t a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    a10 = NSDebugDescriptionErrorKey;
    a11 = @"ExceptionDescription";
    a12 = @"Exception invoking NRDUpdateBrain";
    uint64_t v15 = [v14 description];
    a13 = (uint64_t)v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&a12 forKeys:&a10 count:2];
    uint64_t v17 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:113 userInfo:v16];

    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v17);
    objc_end_catch();
    JUMPOUT(0x1000218B0);
  }
  _Unwind_Resume(exception_object);
}

void sub_100021A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100021E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_100022080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100022574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100022FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100025880(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

BOOL iterateSafely(io_iterator_t a1, int a2, id a3, void *a4)
{
  int v7 = (void (**)(id, void))a3;
  uint64_t v8 = a4;
  if (a2 < 1)
  {
    BOOL v10 = 0;
LABEL_10:
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v13 + 14) = a2;
    _LPLogPack(1);
  }
  else
  {
    int v9 = 0;
    BOOL v10 = 1;
    while (1)
    {
      uint64_t v11 = IOIteratorNext(a1);
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          v7[2](v7, v12);
          IOObjectRelease(v12);
          uint64_t v12 = IOIteratorNext(a1);
        }
        while (v12);
      }
      if (IOIteratorIsValid(a1)) {
        break;
      }
      IOIteratorReset(a1);
      v8[2](v8);
      BOOL v10 = ++v9 < a2;
      if (v9 == a2) {
        goto LABEL_10;
      }
    }
  }

  return v10;
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  unsigned int value = 0;
  uint64_t v2 = removefile_state_alloc();
  removefile_state_set(v2, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v2, 2u, &value);
  removefile_state_set(v2, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v2, 4u, &value);
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v3 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v3 = 136380675;
  *(void *)(v3 + 4) = a1;
  _LPLogPack(1);
  if (removefile(a1, v2, 3u))
  {
    if (!value) {
      unsigned int value = *__error();
    }
  }
  else
  {
    strcpy(path, ".XXXXXXXX");
    int v4 = open(a1, 1048832);
    if (v4 == -1)
    {
      int v8 = *__error();
    }
    else
    {
      int v5 = v4;
      int v6 = mkstempsat_np(v4, path, 8);
      if (v6 == -1)
      {
        int v8 = *__error();
      }
      else
      {
        int v7 = v6;
        if (unlinkat(v5, path, 0) || fcopyfile(v7, v5, 0, 5u)) {
          int v8 = *__error();
        }
        else {
          int v8 = 0;
        }
        close(v7);
      }
      close(v5);
    }
    unsigned int value = v8;
    if (v8)
    {
      _os_log_pack_size();
      __chkstk_darwin();
      uint64_t v9 = _os_log_pack_fill();
      BOOL v10 = strerror(value);
      *(_DWORD *)uint64_t v9 = 136380931;
      *(void *)(v9 + 4) = a1;
      *(_WORD *)(v9 + 12) = 2080;
      *(void *)(v9 + 14) = v10;
      _LPLogPack(1);
    }
  }
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v11 = _os_log_pack_fill();
  unsigned int v12 = value;
  uint64_t v13 = "failed";
  *(_DWORD *)uint64_t v11 = 136381187;
  *(void *)(v11 + 4) = a1;
  if (!v12) {
    uint64_t v13 = "succeeded";
  }
  *(_WORD *)(v11 + 12) = 2080;
  *(void *)(v11 + 14) = v13;
  *(_WORD *)(v11 + 22) = 1024;
  *(_DWORD *)(v11 + 24) = v12;
  _LPLogPack(1);
  removefile_state_free(v2);
  return value;
}

uint64_t _execForLibpartition(const char **a1)
{
  pid_t v31 = 0;
  *(void *)uint64_t v33 = -1;
  if (pipe(v33))
  {
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v2 = _os_log_pack_fill();
    uint64_t v3 = *a1;
    int v4 = __error();
    int v5 = strerror(*v4);
    *(_DWORD *)uint64_t v2 = 136315394;
    *(void *)(v2 + 4) = v3;
    *(_WORD *)(v2 + 12) = 2080;
    *(void *)(v2 + 14) = v5;
    _LPLogPack(1);
    return 0xFFFFFFFFLL;
  }
  posix_spawnattr_t v29 = 0;
  posix_spawn_file_actions_t v30 = 0;
  posix_spawn_file_actions_init(&v30);
  posix_spawn_file_actions_adddup2(&v30, v33[1], 1);
  posix_spawn_file_actions_addclose(&v30, v33[0]);
  posix_spawnattr_init(&v29);
  posix_spawnattr_setflags(&v29, 0x4000);
  uint64_t v7 = posix_spawn(&v31, *a1, &v30, 0, (char *const *)a1, 0);
  if (v7)
  {
    uint64_t v6 = v7;
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v8 = _os_log_pack_fill();
    uint64_t v9 = *a1;
    BOOL v10 = strerror(v6);
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = v9;
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v8 + 14) = v10;
    _LPLogPack(1);
    close(v33[0]);
    goto LABEL_5;
  }
  bzero(v32, 0x400uLL);
  int v12 = v33[0];
  close(v33[1]);
  v33[1] = -1;
  ssize_t v13 = read(v12, v32, 0x400uLL);
  if (v13 >= 1)
  {
    do
    {
      execlogfunction(v13, v14, v15, v16, v17, v18, v19, v20, v13);
      ssize_t v13 = read(v12, v32, 0x400uLL);
    }
    while (v13 > 0);
  }
  int v28 = 0;
  if (waitpid(v31, &v28, 0) == -1)
  {
    uint64_t v6 = *__error();
    _os_log_pack_size();
    __chkstk_darwin();
    uint64_t v21 = _os_log_pack_fill();
    uint64_t v22 = *a1;
    uint64_t v23 = __error();
    CFBooleanRef v24 = strerror(*v23);
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = v22;
    *(_WORD *)(v21 + 12) = 2080;
    *(void *)(v21 + 14) = v24;
    _LPLogPack(1);
  }
  else
  {
    if ((v28 & 0x7F) == 0x7F)
    {
      _os_log_pack_size();
      __chkstk_darwin();
      uint64_t v25 = _os_log_pack_fill();
      CFTypeID v26 = *a1;
      int v27 = v28 >> 8;
    }
    else
    {
      if ((v28 & 0x7F) == 0)
      {
        uint64_t v6 = BYTE1(v28);
        goto LABEL_5;
      }
      _os_log_pack_size();
      __chkstk_darwin();
      uint64_t v25 = _os_log_pack_fill();
      CFTypeID v26 = *a1;
      int v27 = v28 & 0x7F;
    }
    *(_DWORD *)uint64_t v25 = 136315394;
    *(void *)(v25 + 4) = v26;
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v27;
    _LPLogPack(1);
    uint64_t v6 = 0xFFFFFFFFLL;
  }
LABEL_5:
  posix_spawnattr_destroy(&v29);
  posix_spawn_file_actions_destroy(&v30);
  if (v33[1] != -1) {
    close(v33[1]);
  }
  return v6;
}

void ___is_running_in_ramdisk_block_invoke(id a1)
{
  bzero(__s1, 0x400uLL);
  size_t v1 = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, &v1, 0, 0))
  {
    if (strstr(__s1, "-restore")) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }
}

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, int *a3)
{
  int v5 = __error();
  int v6 = *v5;
  *a3 = *v5;
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v7 = _os_log_pack_fill();
  uint64_t v8 = strerror(v6);
  *(_DWORD *)uint64_t v7 = 136380931;
  *(void *)(v7 + 4) = a2;
  *(_WORD *)(v7 + 12) = 2080;
  *(void *)(v7 + 14) = v8;
  _LPLogPack(1);
  return 2;
}

void execlogfunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%.*s" arguments:&a9];
  _os_log_pack_size();
  __chkstk_darwin();
  uint64_t v10 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v10 = 138412290;
  *(void *)(v10 + 4) = v9;
  _LPLogPack(3);
}

id _LPLogObject()
{
  if (_LPLogObject_onceToken != -1) {
    dispatch_once(&_LPLogObject_onceToken, &__block_literal_global_14);
  }
  BOOL v0 = (void *)_LPLogObject_obj;
  return v0;
}

void _LPLogPack(int a1)
{
  if (sLogLevel >= a1)
  {
    id v1 = _LPLogObject();
    uint64_t v2 = (char *)os_log_pack_compose();

    if (sLogToStandardOut) {
      fprintf(__stdoutp, "%s\n", v2);
    }
    if (sLogToOSLog)
    {
      id v3 = _LPLogObject();
      os_log_pack_send();
    }
    if (sLogToConsole) {
      dprintf(sConsoleFD, "%s\n", v2);
    }
    free(v2);
  }
}

id __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

id _longFromNVRAMVar(id a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a1 = [objc_alloc((Class)NSString) initWithData:a1 encoding:4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (!a1) {
    return 0;
  }
  return [a1 longLongValue];
}

void __copy_helper_block_e8_32o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o(uint64_t a1)
{
}

void _log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a2 arguments:&a9];
  logfunction("", 1, @"%@\n", v10, v11, v12, v13, v14, (char)v9);
}

void __copy_helper_block_e8_32o40o(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  int v4 = *(const void **)(a2 + 40);
  _Block_object_assign((void *)(a1 + 40), v4, 3);
}

void __destroy_helper_block_e8_32o40o(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 3);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 3);
  _Block_object_assign((void *)(a1 + 64), *(const void **)(a2 + 64), 3);
  _Block_object_assign((void *)(a1 + 72), *(const void **)(a2 + 72), 3);
  int v4 = *(const void **)(a2 + 80);
  _Block_object_assign((void *)(a1 + 80), v4, 7);
}

void __destroy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 80), 7);
  _Block_object_dispose(*(const void **)(a1 + 72), 3);
  _Block_object_dispose(*(const void **)(a1 + 64), 3);
  _Block_object_dispose(*(const void **)(a1 + 56), 3);
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32o40o48o56o64b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 3);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 3);
  int v4 = *(const void **)(a2 + 64);
  _Block_object_assign((void *)(a1 + 64), v4, 7);
}

void __destroy_helper_block_e8_32o40o48o56o64b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 64), 7);
  _Block_object_dispose(*(const void **)(a1 + 56), 3);
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

void __copy_helper_block_e8_32o40o48o(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 3);
  int v4 = *(const void **)(a2 + 48);
  _Block_object_assign((void *)(a1 + 48), v4, 3);
}

void __destroy_helper_block_e8_32o40o48o(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 3);
  _Block_object_dispose(*(const void **)(a1 + 40), 3);
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_object_dispose(v2, 3);
}

uint64_t _partition_log(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

uint64_t partition_probe_media(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = 0;
  char v9 = 0;
  p_vtable = &OBJC_METACLASS___MSURemoteableBlock.vtable;
  uint64_t v11 = &OBJC_METACLASS___MSURemoteableBlock.vtable;
  do
  {
    io_iterator_t iterator = 0;
    CFTypeRef cf = 0;
    storage_device_node_path = 0;
    *((unsigned char *)p_vtable + 3520) = 0;
    *((unsigned char *)v11 + 3680) = 0;
    data_device_node_path = 0;
    user_device_node_path = 0;
    baseband_data_partition_device_node_path = 0;
    update_device_node_path = 0;
    scratch_device_node_path = 0;
    xart_device_node_path = 0;
    apfs_recovery_os_container_device_node_path = 0;
    recovery_os_volume_device_node_path = 0;
    preboot_partition_device_node_path = 0;
    iboot_system_container_device_node_path = 0;
    using_APFS = 0;
    if (!_partition_wait_for_device(&storage_device_node_path, a2, a3, a4, a5, a6, a7, a8))
    {
      _partition_log((uint64_t)"Unable to find storage device node for service named: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"EmbeddedDeviceTypeRoot");
      int v37 = 0;
      io_registry_entry_t v28 = 0;
      goto LABEL_7;
    }
    _partition_log((uint64_t)"entering %s.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"_partition_probe_media_should_retry");
    CFDictionaryRef v19 = IOBSDNameMatching(kIOMasterPortDefault, 0, byte_10006CF25);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v19);
    io_registry_entry_t v28 = MatchingService;
    if (!MatchingService)
    {
      _partition_log((uint64_t)"unable to find service for %s", v21, v22, v23, v24, v25, v26, v27, (uint64_t)byte_10006CF25);
      io_object_t v38 = 0;
LABEL_9:
      int v37 = 1;
      goto LABEL_102;
    }
    IOServiceWaitQuiet(MatchingService, 0);
    uint64_t v29 = IORegistryEntryCreateIterator(v28, "IOService", 1u, &iterator);
    if (v29)
    {
      _partition_log((uint64_t)"unable to create child iterator: 0c%.8x", v30, v31, v32, v33, v34, v35, v36, v29);
      int v37 = 0;
LABEL_7:
      io_object_t v38 = 0;
      goto LABEL_102;
    }
    io_object_t v38 = IOIteratorNext(iterator);
    if (!v38) {
      goto LABEL_9;
    }
    uint64_t v118 = 0;
    int v39 = 0;
    while (1)
    {
      if (!IOObjectConformsTo(v38, "IOMedia"))
      {
LABEL_77:
        IOObjectRelease(v38);
        goto LABEL_78;
      }
      memset(name, 0, sizeof(name));
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      IORegistryEntryGetName(v38, name);
      uint64_t CFProperties = IORegistryEntryCreateCFProperties(v38, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
      if (CFProperties)
      {
        _partition_log((uint64_t)"unable to get properies for media registry entry: 0x%.8x", v41, v42, v43, v44, v45, v46, v47, CFProperties);
        goto LABEL_100;
      }
      if (v39
        || (CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name")) != 0
        && CFEqual(Value, @"disk0s1s1"))
      {
        char v48 = 0;
        int v39 = 1;
      }
      else
      {
        int v39 = 0;
        char v48 = 1;
      }
      uint64_t v50 = CFDictionaryGetValue((CFDictionaryRef)cf, @"Content Hint");
      if (!v50) {
        break;
      }
      uint64_t v58 = v50;
      if (!CFEqual(v50, @"LightweightVolumeManager_Media"))
      {
        if (!CFEqual(v58, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"52637672-7900-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"69646961-6700-11AA-AA11-00306543ECAC")
          && !CFEqual(v58, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
        {
          break;
        }
        CFStringRef v83 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (!v83)
        {
          uint64_t v116 = "APFS Container object with no bsd name";
          goto LABEL_119;
        }
        *(_OWORD *)buffer = 0u;
        long long v122 = 0u;
        CFStringGetCString(v83, buffer, 32, 0x8000100u);
        uint64_t v11 = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
        if (CFEqual(v58, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
        {
          uint64_t v91 = &apfs_recovery_os_container_device_node_path;
          if (!strstr(name, "RecoveryOSContainer"))
          {
            if (*(void *)name ^ 0x737953746F6F4269 | *(void *)&name[8] ^ 0x61746E6F436D6574 | *(void *)&name[13] ^ 0x72656E6961746ELL) {
              uint64_t v91 = &apfs_container_device_node_path;
            }
            else {
              uint64_t v91 = &iboot_system_container_device_node_path;
            }
          }
          snprintf(v91, 0x20uLL, "%s%s", "/dev/", buffer);
          _partition_log((uint64_t)"APFS Container '%s' %s\n", v92, v93, v94, v95, v96, v97, v98, (uint64_t)name);
          goto LABEL_90;
        }
        int v99 = CFEqual(v58, @"EF57347C-0000-11AA-AA11-00306543ECAC");
        uint64_t v91 = v118;
        if (v99 == 1)
        {
          if (v118 && *v118)
          {
            _partition_log((uint64_t)"Found synthesized APFS container. Using %s instead of %s\n", v100, v101, v102, v103, v104, v105, v106, (uint64_t)buffer);
            snprintf(v118, 0x20uLL, "%s%s", "/dev/", buffer);
            goto LABEL_92;
          }
          _partition_log((uint64_t)"found synthesized container without original device node\n", v100, v101, v102, v103, v104, v105, v106, v117);
        }
        if (v118)
        {
LABEL_90:
          uint64_t v118 = v91;
          if (!*v91)
          {
            snprintf(v91, 0x20uLL, "%s%s", "/dev/", buffer);
            _partition_log((uint64_t)"APFS Container '%s' %s\n", v108, v109, v110, v111, v112, v113, v114, (uint64_t)name);
          }
          goto LABEL_93;
        }
LABEL_92:
        uint64_t v118 = 0;
LABEL_93:
        using_APFS = 1;
        IOObjectRelease(v38);
        CFRelease(cf);
        CFTypeRef cf = 0;
        goto LABEL_78;
      }
      uint64_t v11 = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
LABEL_78:
      io_object_t v38 = IOIteratorNext(iterator);
      int v37 = 1;
      if (!v38) {
        goto LABEL_101;
      }
    }
    BOOL v59 = *(_DWORD *)name == 1953724755 && *(_DWORD *)&name[3] == 7169396;
    if (v59 || strstr(name, "OS"))
    {
      int v39 = 1;
      uint64_t v60 = "found system volume not at disk0s1s1: %s\n";
      id v61 = &system_device_node_path;
      if (v48) {
        goto LABEL_33;
      }
    }
    else if (*(_DWORD *)name ^ 0x61746144 | name[4])
    {
      if (*(_DWORD *)name ^ 0x72657355 | name[4])
      {
        if (*(void *)name == 0x646E616265736142 && *(void *)&name[6] == 0x6174614420646ELL)
        {
          id v61 = &baseband_data_partition_device_node_path;
        }
        else if (*(_DWORD *)name == 1633972309 && *(_DWORD *)&name[3] == 6648929)
        {
          id v61 = &update_device_node_path;
        }
        else
        {
          if (system_device_node_path) {
            char v82 = 0;
          }
          else {
            char v82 = v39;
          }
          if (v82)
          {
            uint64_t v60 = "looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n";
LABEL_33:
            _partition_log((uint64_t)v60, v51, v52, v53, v54, v55, v56, v57, (uint64_t)name);
            id v61 = &system_device_node_path;
          }
          else if (*(void *)name == 0x68637461726353)
          {
            id v61 = &scratch_device_node_path;
          }
          else if (*(_DWORD *)name ^ 0x54524178 | name[4])
          {
            if (*(void *)name ^ 0x797265766F636552 | name[8])
            {
              if (*(void *)name != 0x746F6F62657250)
              {
                _partition_log((uint64_t)"unexpected partition '%s' - skipping", v51, v52, v53, v54, v55, v56, v57, (uint64_t)name);
                id v61 = 0;
                char v62 = 1;
                goto LABEL_36;
              }
              id v61 = &preboot_partition_device_node_path;
            }
            else
            {
              id v61 = &recovery_os_volume_device_node_path;
            }
          }
          else
          {
            id v61 = &xart_device_node_path;
          }
        }
      }
      else
      {
        id v61 = &user_device_node_path;
      }
    }
    else
    {
      id v61 = &data_device_node_path;
    }
    if (*v61)
    {
      _partition_log((uint64_t)"encountered second '%s' partition; original was '%s'",
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        (uint64_t)name);
    }
    else
    {
      char v62 = 0;
LABEL_36:
      while (1)
      {
        CFBooleanRef v63 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Leaf");
        if (v63)
        {
          if (CFBooleanGetValue(v63) == 1) {
            break;
          }
        }
        IOObjectRelease(v38);
        CFRelease(cf);
        CFTypeRef cf = 0;
        io_object_t v64 = IOIteratorNext(iterator);
        if (!v64)
        {
LABEL_98:
          _partition_log((uint64_t)"ran out of registry entries without finding a leaf media object", v65, v66, v67, v68, v69, v70, v71, v117);
          io_object_t v38 = 0;
          goto LABEL_99;
        }
        io_object_t v38 = v64;
        while (!IOObjectConformsTo(v38, "IOMedia"))
        {
          IOObjectRelease(v38);
          io_object_t v38 = IOIteratorNext(iterator);
          if (!v38) {
            goto LABEL_98;
          }
        }
        uint64_t v72 = IORegistryEntryCreateCFProperties(v38, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
        if (v72)
        {
          _partition_log((uint64_t)"unable to get properies for media registry entry: 0x%.8x", v73, v74, v75, v76, v77, v78, v79, v72);
          goto LABEL_99;
        }
      }
      if (v62)
      {
LABEL_76:
        uint64_t v11 = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
        goto LABEL_77;
      }
      CFStringRef v107 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
      if (v107)
      {
        *(_OWORD *)buffer = 0u;
        long long v122 = 0u;
        CFStringGetCString(v107, buffer, 32, 0x8000100u);
        snprintf(v61, 0x20uLL, "%s%s", "/dev/", buffer);
        goto LABEL_76;
      }
      uint64_t v116 = "leaf media object with no bsd name";
LABEL_119:
      _partition_log((uint64_t)v116, v84, v85, v86, v87, v88, v89, v90, v117);
    }
LABEL_99:
    uint64_t v11 = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
LABEL_100:
    int v37 = 0;
LABEL_101:
    p_vtable = (void **)(&OBJC_METACLASS___MSURemoteableBlock + 24);
LABEL_102:
    if (iterator && !IOIteratorIsValid(iterator))
    {
      char v9 = 1;
      int v37 = 0;
    }
    if (v38) {
      IOObjectRelease(v38);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (iterator) {
      IOObjectRelease(iterator);
    }
    if (v28) {
      IOObjectRelease(v28);
    }
    if (v37) {
      return 1;
    }
    uint64_t result = 0;
    if (!v9) {
      break;
    }
    ++v8;
  }
  while (v8 != 3);
  return result;
}

BOOL is_storage_apfs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return partition_probe_media(a1, a2, a3, a4, a5, a6, a7, a8) && (using_APFS & 1) != 0;
}

uint64_t _partition_wait_for_device(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _partition_log((uint64_t)"entering %s: '%s'\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"_partition_wait_for_device");
  if (!a1)
  {
    uint64_t v41 = "path argument is NULL";
    goto LABEL_16;
  }
  CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, "EmbeddedDeviceTypeRoot", 0x8000100u);
  if (!v16)
  {
LABEL_15:
    uint64_t v41 = "failed to allocate device lookup dict";
LABEL_16:
    _partition_log((uint64_t)v41, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v111);
    return 0;
  }
  CFStringRef v17 = v16;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFDictionaryRef v19 = (__CFDictionary *)v17;
LABEL_14:
    CFRelease(v19);
    goto LABEL_15;
  }
  CFDictionaryRef v19 = Mutable;
  CFDictionaryAddValue(Mutable, v17, kCFBooleanTrue);
  uint64_t v20 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v20)
  {
    CFRelease(v17);
    goto LABEL_14;
  }
  uint64_t v21 = v20;
  CFDictionaryAddValue(v20, @"IOPropertyMatch", v19);
  CFRelease(v17);
  CFRelease(v19);
  unsigned int v22 = 0;
  while (1)
  {
    CFRetain(v21);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
    if (MatchingService) {
      break;
    }
    if (30 - v22 >= 3) {
      unsigned int v24 = 3;
    }
    else {
      unsigned int v24 = 30 - v22;
    }
    CFStringRef v25 = CFCopyDescription(v21);
    CStringPtr = CFStringGetCStringPtr(v25, 0);
    _partition_log((uint64_t)"waiting for matching IOKit service: %s\n", v27, v28, v29, v30, v31, v32, v33, (uint64_t)CStringPtr);
    sleep(v24);
    v22 += v24;
    CFRelease(v25);
    if (v22 >= 0x1E)
    {
      CFRelease(v21);
      _partition_log((uint64_t)"failed to lookup IO service for %s", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"EmbeddedDeviceTypeRoot");
      return 0;
    }
  }
  io_object_t v44 = MatchingService;
  CFRelease(v21);
  IOObjectRetain(v44);
  io_registry_entry_t v45 = v44;
  do
  {
    io_iterator_t iterator = 0;
    if (IORegistryEntryGetChildIterator(v45, "IOService", &iterator))
    {
      uint64_t v73 = "Could not create child iterator";
      goto LABEL_36;
    }
    io_object_t v53 = IOIteratorNext(iterator);
    uint64_t v54 = 0;
    if (!v53)
    {
      io_iterator_t v55 = iterator;
LABEL_35:
      IOObjectRelease(v55);
      uint64_t v111 = v54;
      uint64_t v73 = "Found %d child nodes (expected 1)";
LABEL_36:
      _partition_log((uint64_t)v73, v46, v47, v48, v49, v50, v51, v52, (uint64_t)v111);
      LODWORD(v64) = 0;
      goto LABEL_37;
    }
    io_iterator_t v55 = 0;
    do
    {
      if (v55) {
        IOObjectRelease(v53);
      }
      else {
        io_iterator_t v55 = v53;
      }
      io_object_t v53 = IOIteratorNext(iterator);
      uint64_t v54 = (const char *)(v54 + 1);
    }
    while (v53);
    IOObjectRelease(iterator);
    if (v54 != 1) {
      goto LABEL_35;
    }
    IOObjectRelease(v45);
    io_registry_entry_t v45 = v55;
  }
  while (!IOObjectConformsTo(v55, "IOMedia"));
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v55, @"Whole", kCFAllocatorDefault, 0);
  CFBooleanRef v64 = CFProperty;
  if (!CFProperty)
  {
    _partition_log((uint64_t)"Did not find Whole property on IOMedia class", v57, v58, v59, v60, v61, v62, v63, (uint64_t)v111);
    goto LABEL_38;
  }
  CFTypeID v65 = CFGetTypeID(CFProperty);
  if (v65 != CFBooleanGetTypeID())
  {
    uint64_t v102 = "Expected Whole to be BOOLean";
LABEL_63:
    _partition_log((uint64_t)v102, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v111);
    io_registry_entry_t v45 = v55;
    io_iterator_t v55 = 0;
    goto LABEL_64;
  }
  if (!CFBooleanGetValue(v64))
  {
    uint64_t v102 = "Expected Whole=true";
    goto LABEL_63;
  }
  io_registry_entry_t v45 = 0;
LABEL_64:
  CFRelease(v64);
  LODWORD(v64) = v55;
LABEL_37:
  io_iterator_t v55 = v45;
  if (!v45) {
    goto LABEL_39;
  }
LABEL_38:
  IOObjectRelease(v55);
LABEL_39:
  if (v64)
  {
    CFStringRef v74 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)v64, @"BSD Name", kCFAllocatorDefault, 0);
    if (v74)
    {
      CFStringRef v82 = v74;
      CFTypeID v83 = CFGetTypeID(v74);
      if (v83 == CFStringGetTypeID())
      {
        strcpy(a1, "/dev/");
        size_t v91 = strlen(a1);
        if (CFStringGetCString(v82, &a1[v91], 32 - v91, 0x8000100u))
        {
          _partition_log((uint64_t)"Using device path %s for %s\n", v92, v93, v94, v95, v96, v97, v98, (uint64_t)a1);
          int v99 = -10;
          while (1)
          {
            if (!access(a1, 0))
            {
              uint64_t v42 = 1;
              goto LABEL_59;
            }
            if (*__error() != 2) {
              break;
            }
            sleep(3u);
            if (__CFADD__(v99++, 1)) {
              goto LABEL_56;
            }
          }
          uint64_t v103 = __error();
          strerror(*v103);
          _partition_log((uint64_t)"stat error while waiting for device '%s': %s\n", v104, v105, v106, v107, v108, v109, v110, (uint64_t)a1);
LABEL_56:
          uint64_t v111 = "EmbeddedDeviceTypeRoot";
          uint64_t v101 = "timeout waiting for %s";
        }
        else
        {
          uint64_t v101 = "failed to create C string from BSD name";
        }
        _partition_log((uint64_t)v101, v92, v93, v94, v95, v96, v97, v98, (uint64_t)v111);
      }
      else
      {
        _partition_log((uint64_t)"returnbed BSD device name for service %s is wrong type", v84, v85, v86, v87, v88, v89, v90, (uint64_t)"EmbeddedDeviceTypeRoot");
      }
      uint64_t v42 = 0;
LABEL_59:
      CFRelease(v82);
    }
    else
    {
      _partition_log((uint64_t)"no BSD device name for service %s", v75, v76, v77, v78, v79, v80, v81, (uint64_t)"EmbeddedDeviceTypeRoot");
      uint64_t v42 = 0;
    }
    IOObjectRelease((io_object_t)v64);
  }
  else
  {
    uint64_t v42 = 0;
  }
  IOObjectRelease(v44);
  return v42;
}

uint64_t get_main_container_space_info(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _partition_log((uint64_t)"entering %s\n", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (uint64_t)"get_main_container_space_info");
  if (apfs_container_device_node_path)
  {
    uint64_t SpaceInfo = APFSContainerGetSpaceInfo();
    if (SpaceInfo) {
      _partition_log((uint64_t)"APFSContainerGetSpaceInfo failed with result:%d", v21, v22, v23, v24, v25, v26, v27, SpaceInfo);
    }
  }
  else
  {
    _partition_log((uint64_t)"No container device found, can't retrieve space info", v13, v14, v15, v16, v17, v18, v19, v52);
  }
  if (system_device_node_path)
  {
    uint64_t v28 = APFSVolumeGetSpaceInfo();
    if (v28) {
      _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for system volume failed with result:%d", v29, v30, v31, v32, v33, v34, v35, v28);
    }
  }
  else
  {
    _partition_log((uint64_t)"No system device found, can't retrieve space info", v21, v22, v23, v24, v25, v26, v27, v52);
  }
  if (data_device_node_path)
  {
    uint64_t v36 = APFSVolumeGetSpaceInfo();
    if (v36) {
      _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for data volume failed with result:%d", v37, v38, v39, v40, v41, v42, v43, v36);
    }
  }
  else
  {
    _partition_log((uint64_t)"No data device found, can't retrieve space info", v29, v30, v31, v32, v33, v34, v35, v52);
  }
  if (!preboot_partition_device_node_path)
  {
    uint64_t result = _partition_log((uint64_t)"No preboot device found, can't retrieve space info", v37, v38, v39, v40, v41, v42, v43, v52);
LABEL_17:
    if (!a1) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t result = APFSVolumeGetSpaceInfo();
  if (result)
  {
    uint64_t result = _partition_log((uint64_t)"APFSVolumeGetSpaceInfo for preboot volume failed with result:%d", v45, v46, v47, v48, v49, v50, v51, result);
    goto LABEL_17;
  }
  if (a1) {
LABEL_18:
  }
    *a1 = 0;
LABEL_19:
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return result;
}

BOOL RCGetSystemPartitionExtrasSizeForDevice(int a1, CFDictionaryRef theDict, void *a3, CFStringRef *a4)
{
  if (a3)
  {
    if (theDict
      && (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"SystemFirmwareExtrasSize")) != 0)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, a3);
      unint64_t v7 = *a3;
      if (a4)
      {
        *a4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d MB as defined by the value of the SystemFirmwareExtrasSize in the options dictionary.", v7 >> 20);
        unint64_t v7 = *a3;
      }
    }
    else
    {
      if (a4) {
        *a4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d MB for APFS padding + %d MB for Restore Log + %d MB for Baseband FW + %d MB for Calibration Data + %d MB for SEP FW + 5 MB of wiggle room.", 25, 1, 80, 5, 5);
      }
      unint64_t v7 = 121;
    }
    *a3 = v7 << 20;
  }
  return a3 != 0;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0;
      }
    }
    return *__error();
  }
  return result;
}

uint64_t ramrod_remove_log_fd_no_locking(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  id v3 = &log_fds;
  if (v2) {
    id v3 = &log_fds_fileonly;
  }
  int v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30;
    goto LABEL_13;
  }
  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    uint64_t v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  long long context = 0u;
  *(_OWORD *)theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&log_fds_mutex);
  if (a1 && __PAIR128__(log_fds, log_fds_fileonly) != 0)
  {
    *(void *)&long long context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (log_fds) {
      CFSetApplyFunction((CFSetRef)log_fds, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    ramrod_log_msg_to_all_fds_bytes_to_sync += a2;
    if (ramrod_log_msg_to_all_fds_bytes_to_sync)
    {
      LOBYTE(theArray[1]) = 1;
      ramrod_log_msg_to_all_fds_bytes_to_sync = 0;
    }
    if (log_fds_fileonly) {
      CFSetApplyFunction((CFSetRef)log_fds_fileonly, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            ramrod_remove_log_fd_no_locking(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&log_fds_mutex);
  return 0;
}

void ramrod_log_to_fd_set_applier(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (a1)
  {
    if (a2)
    {
      if (*(void *)a2)
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
        {
          if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
          {
            fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
            CFMutableStringRef Mutable = *(__CFArray **)(a2 + 16);
            if (!Mutable)
            {
              CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
              *(void *)(a2 + 16) = Mutable;
            }
            CFArrayAppendValue(Mutable, a1);
          }
          else if (*(unsigned char *)(a2 + 24))
          {
            fsync(valuePtr);
          }
        }
        else
        {
          fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
        }
      }
      return;
    }
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25;
  }
  else
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30;
  }
  fwrite(v6, v7, 1uLL, v5);
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void do_ramrod_log_msg(int a1, const char *a2, va_list a3)
{
  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&log_mutex);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (_log_handler) {
        _log_handler(__s);
      }
    }
    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!_log_buffermsgs) {
      goto LABEL_23;
    }
    CFIndex v5 = (char *)log_buffer;
    if (!log_buffer)
    {
      CFIndex v5 = (char *)malloc(0x100000uLL);
      log_buffer = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&log_mutex);
        goto LABEL_24;
      }
      log_buffer_head = (uint64_t)v5;
      log_buffer_tail = (uint64_t)v5;
    }
    char v6 = *__s;
    if (*__s)
    {
      size_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)log_buffer_tail;
      uint64_t v9 = log_buffer_head;
      int v10 = __s + 1;
      do
      {
        char *v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        log_buffer_tail = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          log_buffer_head = v9;
        }
        int v11 = *v10++;
        char v6 = v11;
      }
      while (v11);
    }
    goto LABEL_23;
  }
  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_create_error_internal_va(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }
      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }
}

id _options_get_BOOL(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

id _get_os_preboot_path(void *a1)
{
  id v2 = [a1 objectForKeyedSubscript:@"PrebootDirOverride"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
  {
    id v2 = [a1 objectForKeyedSubscript:@"PrebootMountpoint"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v2)
    {
      ramrod_log_msg("%s: RAMROD_SPLAT_OPT_PREBOOT_MOUNTPOINT is required\n", v3, v4, v5, v6, v7, v8, v9, (char)"_get_os_preboot_path");
      return 0;
    }
  }
  return v2;
}

BOOL _get_splat_preboot_paths(void *a1, void *a2, void *a3, void *a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (_options_get_BOOL(a2, @"SafariDownlevelUpdate")) {
      CFStringRef v11 = @"downlevel";
    }
    else {
      CFStringRef v11 = @"cryptex1";
    }
    id v12 = [a1 stringByAppendingPathComponent:v11];
    uint64_t v13 = v12;
    if (a3) {
      *a3 = [v12 stringByAppendingPathComponent:@"current"];
    }
    if (a4) {
      *a4 = [v13 stringByAppendingPathComponent:@"proposed"];
    }
  }
  else
  {
    ramrod_log_msg("%s: %s\n", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (char)"_get_splat_preboot_paths");
    ramrod_create_error_cf(a5, @"RamrodErrorDomain", 2001, 0, @"%s", v15, v16, v17, (char)"preboot directory is nil");
  }
  return a1 != 0;
}

id ramrod_splat_copy_object_path(const char *a1, void *a2)
{
  uint64_t v13 = 0;
  CFStringRef v14 = 0;
  id os_preboot_path = _get_os_preboot_path(a2);
  BOOL splat_preboot_paths = _get_splat_preboot_paths(os_preboot_path, a2, &v14, &v13, 0, v5, v6, v7);
  id result = 0;
  if (splat_preboot_paths)
  {
    int v10 = v14;
    if (_options_get_BOOL(a2, @"StageToProposed")) {
      CFStringRef v11 = v13;
    }
    else {
      CFStringRef v11 = v10;
    }
    if (!a1)
    {
      if (!v11) {
        return 0;
      }
      return (id)CFRetain(v11);
    }
    uint64_t v12 = 0;
    while (splat_objects[v12] || strcmp(*(const char **)&splat_objects[v12 + 2], a1))
    {
      v12 += 16;
      if (v12 == 144) {
        return 0;
      }
    }
    id result = objc_msgSend(v11, "stringByAppendingPathComponent:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(void *)&splat_objects[v12 + 8]));
    CFStringRef v11 = result;
    if (result) {
      return (id)CFRetain(v11);
    }
  }
  return result;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void submitRestoreLogFileToLogDir_cold_1()
{
}

void main_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[MAIN] Failed to write current environment information", v1, 2u);
}

void main_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "[MAIN] Unable to cleanup RecoveryOS state files: %@", v2, v3, v4, v5, v6);
}

void main_cold_3()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "[MAIN] Could not clean up prepare path and staged assets: %@", v2, v3, v4, v5, v6);
}

void main_cold_4()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "[MAIN] Could not clean up prepare path: %@", v2, v3, v4, v5, v6);
}

void main_cold_5()
{
  BOOL v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v1, v2, "[MAIN] Could not register atexit: %s", v3, v4, v5, v6, v7);
}

void main_cold_6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[MAIN] Could not open log file", v1, 2u);
}

void handle_update_metrics_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_update_metrics_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "[UPDATE_METRICS] %@ | FAILURE | Could not clean up NVRAM: %@", v2, v3, v4, v5, 2u);
}

void handle_update_metrics_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __main_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __main_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "%s perform_logs_cleanup_command failed:%@", v2, v3, v4, v5, 2u);
}

void __main_block_invoke_2_cold_1(void *a1)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v1, v2, "[PEER_CONNECTION] XPC error on peer listener connection: %s", v3, v4, v5, v6, v7);
}

void __main_block_invoke_3_cold_1(void *a1)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v1, v2, "[PEER_CONNECTION] Unexpected XPC error on peer connection (%s) | Potential connection issue", v3, v4, v5, v6, v7);
}

void __main_block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "[PEER_CONNECTION] Unexpected XPC type on peer connection: %s", v2, v3, v4, v5, v6);
}

void handle_get_stashed_connectivity_data_command_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_3()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "[HANDLER] %@ | FAILURE | Failed to allocate unarchiver: %@", v2, v3, v4, v5, 2u);
}

void handle_get_stashed_connectivity_data_command_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_get_stashed_connectivity_data_command_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_report_and_cleanup_command_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_report_and_cleanup_command_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "[HANDLER] %@ | FAILURE | Failed to perform cleanup command on behalf of client, error:%@", v2, v3, v4, v5, 2u);
}

void handle_perform_cryptegraft_semisplat_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_cryptegraft_semisplat_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "[HANDLER] %@ | FAILURE | Failed to perform cryptegraft semi-splat command on behalf of client, error:%@", v2, v3, v4, v5, 2u);
}

void handle_perform_cryptegraft_downlevel_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handle_perform_cryptegraft_downlevel_cold_2()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "[HANDLER] %@ | FAILURE | Failed to perform cryptegraft downlevel command on behalf of client, error:%@", v2, v3, v4, v5, 2u);
}

void __copy_shared_update_brain_connection_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(__stack_chk_guard);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "[BRAIN_CONNECTION] Error locating installed update brain: %@", v2, v3, v4, v5, v6);
}

void __copy_shared_update_brain_connection_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Failed to copy to MSUBrain endpoint from ping reply: %@", v2, v3, v4, v5, v6);
}

uint64_t APFSContainerGetSpaceInfo()
{
  return _APFSContainerGetSpaceInfo();
}

uint64_t APFSDecodeMetricsString()
{
  return _APFSDecodeMetricsString();
}

uint64_t APFSShouldSealSystemVolume()
{
  return _APFSShouldSealSystemVolume();
}

uint64_t APFSVolumeCreate()
{
  return _APFSVolumeCreate();
}

uint64_t APFSVolumeCreateForMSU()
{
  return _APFSVolumeCreateForMSU();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeGetSpaceInfo()
{
  return _APFSVolumeGetSpaceInfo();
}

uint64_t APFSVolumeGetVEKState()
{
  return _APFSVolumeGetVEKState();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

uint64_t ASServerURLForAssetType()
{
  return _ASServerURLForAssetType();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return _CFErrorGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyPurgeableSpaceWithInfo();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return _CacheDeletePurgeSpaceWithInfo();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return _IORegistryIteratorExitEntry(iterator);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

uint64_t MAGetPallasAudience()
{
  return _MAGetPallasAudience();
}

uint64_t MAStringForMAAssetState()
{
  return _MAStringForMAAssetState();
}

uint64_t MAStringForMACancelDownloadResult()
{
  return _MAStringForMACancelDownloadResult();
}

uint64_t MAStringForMADownloadResult()
{
  return _MAStringForMADownloadResult();
}

uint64_t MAStringForMAOperationResult()
{
  return _MAStringForMAOperationResult();
}

uint64_t MAStringForMAPurgeResult()
{
  return _MAStringForMAPurgeResult();
}

uint64_t MAStringForMAQueryResult()
{
  return _MAStringForMAQueryResult();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_pack_fill()
{
  return __os_log_pack_fill();
}

uint64_t _os_log_pack_size()
{
  return __os_log_pack_size();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int atexit(void (*a1)(void))
{
  return _atexit(a1);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void exit(int a1)
{
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_create(a1, a2, a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_delete(a1, a2, a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return _fs_snapshot_list(a1, a2, a3, a4, a5);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return _fs_snapshot_rename(a1, a2, a3, a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_revert(a1, a2, a3);
}

uint64_t fs_snapshot_root()
{
  return _fs_snapshot_root();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_posix_memalign(memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkstempsat_np(int dfd, char *path, int slen)
{
  return _mkstempsat_np(dfd, path, slen);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return _nanosleep(__rqtp, __rmtp);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

void openlog(const char *a1, int a2, int a3)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return _os_log_pack_compose();
}

uint64_t os_log_pack_send()
{
  return _os_log_pack_send();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t os_variant_is_recovery()
{
  return _os_variant_is_recovery();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return _protocol_getName(p);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return _protocol_isEqual(proto, other);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return _regcomp(a1, a2, a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return _regexec(a1, a2, a3, __pmatch, a5);
}

void regfree(regex_t *a1)
{
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

uint64_t xpc_add_bundle()
{
  return _xpc_add_bundle();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_SSOQueue(void *a1, const char *a2, ...)
{
  return [a1 SSOQueue];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cleanupInstallState(void *a1, const char *a2, ...)
{
  return [a1 _cleanupInstallState];
}

id objc_msgSend__copyLiveFilesystemIOMediaForRootedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _copyLiveFilesystemIOMediaForRootedSnapshot];
}

id objc_msgSend__currentBaseOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentBaseOSVersion];
}

id objc_msgSend__currentEAPFSMode(void *a1, const char *a2, ...)
{
  return [a1 _currentEAPFSMode];
}

id objc_msgSend__currentOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentOSVersion];
}

id objc_msgSend__currentTimeInMilliseconds(void *a1, const char *a2, ...)
{
  return [a1 _currentTimeInMilliseconds];
}

id objc_msgSend__defaultSession(void *a1, const char *a2, ...)
{
  return [a1 _defaultSession];
}

id objc_msgSend__defaults(void *a1, const char *a2, ...)
{
  return [a1 _defaults];
}

id objc_msgSend__eventDirectory(void *a1, const char *a2, ...)
{
  return [a1 _eventDirectory];
}

id objc_msgSend__getDeviceModel(void *a1, const char *a2, ...)
{
  return [a1 _getDeviceModel];
}

id objc_msgSend__getDiskUsage(void *a1, const char *a2, ...)
{
  return [a1 _getDiskUsage];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__installInProgress(void *a1, const char *a2, ...)
{
  return [a1 _installInProgress];
}

id objc_msgSend__installInProgressAfterApply(void *a1, const char *a2, ...)
{
  return [a1 _installInProgressAfterApply];
}

id objc_msgSend__installInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _installInfoFile];
}

id objc_msgSend__invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 _invalidateConnection];
}

id objc_msgSend__legacyEventDirectory(void *a1, const char *a2, ...)
{
  return [a1 _legacyEventDirectory];
}

id objc_msgSend__legacyInstallInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _legacyInstallInfoFile];
}

id objc_msgSend__legacySupportDirectory(void *a1, const char *a2, ...)
{
  return [a1 _legacySupportDirectory];
}

id objc_msgSend__loadUnsubmittedEvents(void *a1, const char *a2, ...)
{
  return [a1 _loadUnsubmittedEvents];
}

id objc_msgSend__retryInterval(void *a1, const char *a2, ...)
{
  return [a1 _retryInterval];
}

id objc_msgSend__scheduleEventSubmissionRetry(void *a1, const char *a2, ...)
{
  return [a1 _scheduleEventSubmissionRetry];
}

id objc_msgSend__serverCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 _serverCompatibilityVersion];
}

id objc_msgSend__serverURL(void *a1, const char *a2, ...)
{
  return [a1 _serverURL];
}

id objc_msgSend__supportDirectory(void *a1, const char *a2, ...)
{
  return [a1 _supportDirectory];
}

id objc_msgSend__syncNvram(void *a1, const char *a2, ...)
{
  return [a1 _syncNvram];
}

id objc_msgSend__topic(void *a1, const char *a2, ...)
{
  return [a1 _topic];
}

id objc_msgSend__uptime(void *a1, const char *a2, ...)
{
  return [a1 _uptime];
}

id objc_msgSend__writeInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _writeInfoFile];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allMedia(void *a1, const char *a2, ...)
{
  return [a1 allMedia];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_attributeDict(void *a1, const char *a2, ...)
{
  return [a1 attributeDict];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_baseServerURL(void *a1, const char *a2, ...)
{
  return [a1 baseServerURL];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brainAsset(void *a1, const char *a2, ...)
{
  return [a1 brainAsset];
}

id objc_msgSend_brainProtocol(void *a1, const char *a2, ...)
{
  return [a1 brainProtocol];
}

id objc_msgSend_brainVersion(void *a1, const char *a2, ...)
{
  return [a1 brainVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSync];
}

id objc_msgSend_cancelQueue(void *a1, const char *a2, ...)
{
  return [a1 cancelQueue];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connectToServerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 connectToServerIfNecessary];
}

id objc_msgSend_connectionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 connectionInterrupted];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentTypeToSubclassMap(void *a1, const char *a2, ...)
{
  return [a1 contentTypeToSubclassMap];
}

id objc_msgSend_contentTypesForPartitionMedia(void *a1, const char *a2, ...)
{
  return [a1 contentTypesForPartitionMedia];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_controlCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 controlCharacterSet];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyAnalyticsData(void *a1, const char *a2, ...)
{
  return [a1 copyAnalyticsData];
}

id objc_msgSend_copyAnalyticsDataForPreflight(void *a1, const char *a2, ...)
{
  return [a1 copyAnalyticsDataForPreflight];
}

id objc_msgSend_copyAppleConnectPersonID(void *a1, const char *a2, ...)
{
  return [a1 copyAppleConnectPersonID];
}

id objc_msgSend_copyGenericAnalyticsData(void *a1, const char *a2, ...)
{
  return [a1 copyGenericAnalyticsData];
}

id objc_msgSend_copySerialNumber(void *a1, const char *a2, ...)
{
  return [a1 copySerialNumber];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMSUUpdateAttributes(void *a1, const char *a2, ...)
{
  return [a1 currentMSUUpdateAttributes];
}

id objc_msgSend_currentRecoveryOSInfo(void *a1, const char *a2, ...)
{
  return [a1 currentRecoveryOSInfo];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_dataMountPoint(void *a1, const char *a2, ...)
{
  return [a1 dataMountPoint];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultFormatterBehavior(void *a1, const char *a2, ...)
{
  return [a1 defaultFormatterBehavior];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegateProtocol(void *a1, const char *a2, ...)
{
  return [a1 delegateProtocol];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_devNodePath(void *a1, const char *a2, ...)
{
  return [a1 devNodePath];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_droppedEvents(void *a1, const char *a2, ...)
{
  return [a1 droppedEvents];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventAttributes(void *a1, const char *a2, ...)
{
  return [a1 eventAttributes];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_flushEvent(void *a1, const char *a2, ...)
{
  return [a1 flushEvent];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_getStringForPhase(void *a1, const char *a2, ...)
{
  return [a1 getStringForPhase];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installTonight(void *a1, const char *a2, ...)
{
  return [a1 installTonight];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_ioMedia(void *a1, const char *a2, ...)
{
  return [a1 ioMedia];
}

id objc_msgSend_isEmbeddedDeviceTypeRoot(void *a1, const char *a2, ...)
{
  return [a1 isEmbeddedDeviceTypeRoot];
}

id objc_msgSend_isPrimaryMedia(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryMedia];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_isWhole(void *a1, const char *a2, ...)
{
  return [a1 isWhole];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSuccessForTargetMainOSBuild(void *a1, const char *a2, ...)
{
  return [a1 lastSuccessForTargetMainOSBuild];
}

id objc_msgSend_lastSuccessForTargetRecoveryOSBuild(void *a1, const char *a2, ...)
{
  return [a1 lastSuccessForTargetRecoveryOSBuild];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locatorsDictionary(void *a1, const char *a2, ...)
{
  return [a1 locatorsDictionary];
}

id objc_msgSend_locatorsStateQueue(void *a1, const char *a2, ...)
{
  return [a1 locatorsStateQueue];
}

id objc_msgSend_logAsset(void *a1, const char *a2, ...)
{
  return [a1 logAsset];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mediaUUID(void *a1, const char *a2, ...)
{
  return [a1 mediaUUID];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newBrainQuery(void *a1, const char *a2, ...)
{
  return [a1 newBrainQuery];
}

id objc_msgSend_newFilteredBrainQuery(void *a1, const char *a2, ...)
{
  return [a1 newFilteredBrainQuery];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noteConnectionDropped(void *a1, const char *a2, ...)
{
  return [a1 noteConnectionDropped];
}

id objc_msgSend_nrdLock(void *a1, const char *a2, ...)
{
  return [a1 nrdLock];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_nvramPath(void *a1, const char *a2, ...)
{
  return [a1 nvramPath];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return [a1 oslog];
}

id objc_msgSend_padding(void *a1, const char *a2, ...)
{
  return [a1 padding];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_primaryMedia(void *a1, const char *a2, ...)
{
  return [a1 primaryMedia];
}

id objc_msgSend_progressCB(void *a1, const char *a2, ...)
{
  return [a1 progressCB];
}

id objc_msgSend_progressContext(void *a1, const char *a2, ...)
{
  return [a1 progressContext];
}

id objc_msgSend_progressStatus(void *a1, const char *a2, ...)
{
  return [a1 progressStatus];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_recorder(void *a1, const char *a2, ...)
{
  return [a1 recorder];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_safeSummary(void *a1, const char *a2, ...)
{
  return [a1 safeSummary];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedSupport(void *a1, const char *a2, ...)
{
  return [a1 sharedSupport];
}

id objc_msgSend_snapshotMountPoints(void *a1, const char *a2, ...)
{
  return [a1 snapshotMountPoints];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateQueue(void *a1, const char *a2, ...)
{
  return [a1 stateQueue];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopRecordingInstall(void *a1, const char *a2, ...)
{
  return [a1 stopRecordingInstall];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_submissionPending(void *a1, const char *a2, ...)
{
  return [a1 submissionPending];
}

id objc_msgSend_submitEvents(void *a1, const char *a2, ...)
{
  return [a1 submitEvents];
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return [a1 submitter];
}

id objc_msgSend_sum(void *a1, const char *a2, ...)
{
  return [a1 sum];
}

id objc_msgSend_supportedContentTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedContentTypes];
}

id objc_msgSend_systemMountPoint(void *a1, const char *a2, ...)
{
  return [a1 systemMountPoint];
}

id objc_msgSend_targetOSVersion(void *a1, const char *a2, ...)
{
  return [a1 targetOSVersion];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateAssetAttributes(void *a1, const char *a2, ...)
{
  return [a1 updateAssetAttributes];
}

id objc_msgSend_updateMountPoint(void *a1, const char *a2, ...)
{
  return [a1 updateMountPoint];
}

id objc_msgSend_updatePhase(void *a1, const char *a2, ...)
{
  return [a1 updatePhase];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_volumeGroupUUID(void *a1, const char *a2, ...)
{
  return [a1 volumeGroupUUID];
}

id objc_msgSend_volumes(void *a1, const char *a2, ...)
{
  return [a1 volumes];
}

id objc_msgSend_waitForBlockStorage(void *a1, const char *a2, ...)
{
  return [a1 waitForBlockStorage];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}