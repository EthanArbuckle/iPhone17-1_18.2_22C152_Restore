uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = objc_opt_new();
  v2 = (void *)qword_1000115A8;
  qword_1000115A8 = v1;

  v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 0;
}

void sub_100003438(uint64_t a1)
{
  id v2 = objc_alloc((Class)NFMProtoPlaySoundAndFlashLEDRequest);
  v3 = [*(id *)(a1 + 32) data];
  id v4 = [v2 initWithData:v3];

  [v4 timeStamp];
  double v6 = v5;
  v7 = +[NSDate date];
  [v7 timeIntervalSince1970];
  double v9 = v8 - v6;

  v10 = nfm_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134217984;
    double v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "########### playSoundAndFlash timeSinceReferenceDate %f", (uint8_t *)&v23, 0xCu);
  }

  if (v9 >= 30.0)
  {
    v12 = nfm_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100007EB0();
    }

    id v11 = 0;
  }
  else
  {
    id v11 = [*(id *)(*(void *)(a1 + 40) + 32) playSoundAndFlash];
  }
  +[NFMFindLocallyCAReporter recordPingMyFiredSuccessfully:v11 wantedTorch:1 withDeliveryDuration:v9];
  id v13 = objc_alloc_init((Class)NFMProtoDidPlaySoundAndFlashLEDResponse);
  [v13 setDidPlay:v11];
  id v14 = objc_alloc((Class)IDSProtobuf);
  v15 = [v13 data];
  id v16 = [v14 initWithProtobufData:v15 type:2 isResponse:1];

  v17 = nfm_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    double v24 = *(double *)&v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "########### Sending Response %@", (uint8_t *)&v23, 0xCu);
  }

  v18 = *(void **)(a1 + 40);
  v19 = [v18 gizmoService];
  v20 = [v16 context];
  v21 = [v20 outgoingResponseIdentifier];
  id v22 = [v18 sendProtoBuf:v16 service:v19 priority:300 responseIdentifier:v21 expectsResponse:0 retryCount:0 retryInterval:0.0];
}

void sub_100003778(uint64_t a1)
{
  id v2 = objc_alloc((Class)NFMProtoPlaySoundRequest);
  v3 = [*(id *)(a1 + 32) data];
  id v4 = [v2 initWithData:v3];

  [v4 timeStamp];
  double v6 = v5;
  unsigned __int16 v7 = (unsigned __int16)[v4 behaviorOverride];
  double v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  double v10 = v9 - v6;

  id v11 = nfm_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 134217984;
    double v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "########### playSound timeSinceReferenceDate %f", (uint8_t *)&v32, 0xCu);
  }

  if (v10 >= 30.0)
  {
    v17 = nfm_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100007EE4();
    }
  }
  else
  {
    switch(v7)
    {
      case 0u:
        v12 = nfm_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "########### NPRFPPingMyPhoneBehaviorDefault", (uint8_t *)&v32, 2u);
        }

        id v13 = [*(id *)(*(void *)(a1 + 40) + 32) playFindLocallySound];
        id v14 = objc_alloc_init((Class)NFMProtoDidPlaySoundResponse);
        [v14 setDidPlay:v13];
        v15 = [v14 data];
        +[NFMFindLocallyCAReporter recordPingMyFiredSuccessfully:v13 wantedTorch:0 withDeliveryDuration:v10];
        uint64_t v16 = 1;
        goto LABEL_24;
      case 1u:
        v18 = nfm_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "########### NPRFPPingMyPhoneBehaviorToneTorch", (uint8_t *)&v32, 2u);
        }

        id v19 = [*(id *)(*(void *)(a1 + 40) + 32) playSoundAndFlash];
        id v14 = objc_alloc_init((Class)NFMProtoDidPlaySoundAndFlashLEDResponse);
        [v14 setDidPlay:v19];
        v15 = [v14 data];
        +[NFMFindLocallyCAReporter recordPingMyFiredSuccessfully:v19 wantedTorch:1 withDeliveryDuration:v10];
        uint64_t v16 = 2;
        goto LABEL_24;
      case 2u:
        v20 = nfm_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "########### NPRFPPingMyPhoneBehaviorTorch", (uint8_t *)&v32, 2u);
        }

        id v21 = [*(id *)(*(void *)(a1 + 40) + 32) flashLights];
        id v14 = objc_alloc_init((Class)NFMProtoDidPlaySoundResponse);
        [v14 setDidPlay:v21];
        v15 = [v14 data];
        uint64_t v16 = 1;
        uint64_t v22 = (uint64_t)v21;
        uint64_t v23 = 1;
        goto LABEL_23;
      case 3u:
        double v24 = nfm_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "########### playNearbySound", (uint8_t *)&v32, 2u);
        }

        [*(id *)(*(void *)(a1 + 40) + 32) playNearbySound];
        break;
      case 4u:
        v25 = nfm_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "########### NPRFPPingMyPhoneBehaviorNone", (uint8_t *)&v32, 2u);
        }

        id v14 = objc_alloc_init((Class)NFMProtoDidPlaySoundResponse);
        uint64_t v16 = 1;
        [v14 setDidPlay:1];
        v15 = [v14 data];
        uint64_t v22 = 1;
        uint64_t v23 = 0;
LABEL_23:
        +[NFMFindLocallyCAReporter recordPingMyFiredSuccessfully:v22 wantedTorch:v23 withDeliveryDuration:v10];
LABEL_24:

        if (v15)
        {
          id v26 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v15 type:v16 isResponse:1];
          v27 = *(void **)(a1 + 40);
          v28 = [v27 gizmoService];
          v29 = [v26 context];
          v30 = [v29 outgoingResponseIdentifier];
          id v31 = [v27 sendProtoBuf:v26 service:v28 priority:300 responseIdentifier:v30 expectsResponse:0 retryCount:0 retryInterval:0.0];
        }
        break;
      default:
        break;
    }
  }
}

void sub_10000435C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004380(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000444C;
  v6[3] = &unk_10000C408;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_10000444C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained session];
    id v4 = [v3 findingNotifier];
    [v4 notifyRemovedNearbyObjectWithToken:*(void *)(a1 + 32)];

    [v5 _cleanUpSession];
    id WeakRetained = v5;
  }
}

void sub_100004750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

uint64_t sub_100004784(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004794(uint64_t a1)
{
}

void sub_10000479C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFMWhereIsMyCompanionConnectionProtocol];
  [v2 setRemoteObjectInterface:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFMFindMyController];
  [v4 setExportedInterface:v5];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
  double v6 = nfm_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "########### Had proper entitlement", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained localConnections];
  [v8 setObject:*(void *)(a1 + 32) forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  double v9 = *(void **)(a1 + 32);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004A2C;
  v16[3] = &unk_10000C480;
  long long v17 = *(_OWORD *)(a1 + 40);
  objc_copyWeak(&v18, (id *)(a1 + 56));
  [v9 setInterruptionHandler:v16];
  double v10 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004B64;
  v13[3] = &unk_10000C480;
  long long v14 = *(_OWORD *)(a1 + 40);
  objc_copyWeak(&v15, (id *)(a1 + 56));
  [v10 setInvalidationHandler:v13];
  [*(id *)(a1 + 32) resume];
  id v11 = [*(id *)(a1 + 32) remoteObjectProxy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004CF0;
  v12[3] = &unk_10000C4A8;
  v12[4] = *(void *)(a1 + 48);
  [v11 applicationIdentifierWithReply:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
}

void sub_100004A04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004A2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serialQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004AE0;
  v3[3] = &unk_10000C458;
  v3[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v4, (id *)(a1 + 48));
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
}

void sub_100004AE0(uint64_t a1)
{
  id v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100007F4C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained localConnections];
  [v4 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void sub_100004B64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serialQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004C18;
  v3[3] = &unk_10000C458;
  v3[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v4, (id *)(a1 + 48));
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
}

void sub_100004C18(uint64_t a1)
{
  id v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100007FC4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained localConnections];
  id v5 = [v4 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v6 localConnections];
  [v7 removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  [v5 setExportedObject:0];
}

void sub_100004CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nfm_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "########### Added application: %@ with process ID: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100005150(uint64_t a1)
{
  id v9 = objc_alloc_init((Class)NFMProtoPlaySoundRequest);
  [v9 setBehaviorOverride:*(unsigned __int16 *)(a1 + 40)];
  id v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  objc_msgSend(v9, "setTimeStamp:");

  id v3 = objc_alloc((Class)IDSProtobuf);
  id v4 = [v9 data];
  id v5 = [v3 initWithProtobufData:v4 type:1 isResponse:0];

  int v6 = *(void **)(a1 + 32);
  id v7 = [v6 gizmoService];
  id v8 = [v6 sendProtoBuf:v5 service:v7 priority:300 responseIdentifier:0 expectsResponse:0 retryCount:1 retryInterval:0.25];
}

id sub_1000053C4(uint64_t a1)
{
  [*(id *)(a1 + 32) _initializeSessionIfNeeded];
  id v2 = *(void **)(a1 + 32);
  return [v2 _startRangingSession];
}

void sub_100005520(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpSession];
  id v8 = objc_alloc_init((Class)NFMProtoStopRangingOnPhone);
  id v2 = objc_alloc((Class)IDSProtobuf);
  id v3 = [v8 data];
  id v4 = [v2 initWithProtobufData:v3 type:5 isResponse:0];

  id v5 = *(void **)(a1 + 32);
  int v6 = [v5 gizmoService];
  id v7 = [v5 sendProtoBuf:v4 service:v6 priority:300 responseIdentifier:0 expectsResponse:0 retryCount:1 retryInterval:0.25];
}

void sub_100005748(uint64_t a1)
{
  id v8 = objc_alloc_init((Class)NFMProtoSendSharedConfiguration);
  [v8 setSharedConfiguration:*(void *)(a1 + 32)];
  id v2 = objc_alloc((Class)IDSProtobuf);
  id v3 = [v8 data];
  id v4 = [v2 initWithProtobufData:v3 type:4 isResponse:1];

  id v5 = *(void **)(a1 + 40);
  int v6 = [v5 gizmoService];
  id v7 = [v5 sendProtoBuf:v4 service:v6 priority:300 responseIdentifier:0 expectsResponse:0 retryCount:1 retryInterval:0.25];
}

void sub_100005BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100005BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005CC8;
  block[3] = &unk_10000C548;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
}

void sub_100005CC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = [objc_alloc((Class)NIFindingConfiguration) initWithRole:1 discoveryToken:*(void *)(a1 + 32) preferredUpdateRate:3];
      id v4 = nfm_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 40) sharedConfigData];
        int v11 = 138412546;
        v12 = v3;
        __int16 v13 = 2112;
        long long v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Running session with config: %@ - shared config: %@", (uint8_t *)&v11, 0x16u);
      }
      id v6 = [WeakRetained session];
      [v6 runWithConfiguration:v3];

      id v7 = [WeakRetained session];
      id v8 = [v7 findingNotifier];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) sharedConfigData];
      [v8 notifyDiscoveredNearbyObjectWithToken:v9 sharedConfigurationData:v10];
    }
    else
    {
      id v3 = nfm_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10000803C();
      }
    }
  }
}

void sub_1000062F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006320(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_100006534()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007E48(v0, qword_1000115B8);
  sub_1000065FC(v0, (uint64_t)qword_1000115B8);
  id result = (id)nfm_log();
  if (result) {
    return (id)Logger.init(_:)();
  }
  __break(1u);
  return result;
}

uint64_t sub_100006598()
{
  if (qword_1000115B0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return sub_1000065FC(v0, (uint64_t)qword_1000115B8);
}

uint64_t sub_1000065FC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006634@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000115B0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = sub_1000065FC(v2, (uint64_t)qword_1000115B8);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1000066DC()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100011528 + dword_100011528);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000677C;
  return v3();
}

uint64_t sub_10000677C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000069D8(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100011528 + dword_100011528);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006A80;
  return v4();
}

uint64_t sub_100006A80(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_100006BAC()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id sub_100006BE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TokenManager();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100006C54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TokenManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006C88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100007EAC;
  return v6();
}

uint64_t sub_100006D54(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100007EAC;
  return v7();
}

uint64_t sub_100006E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007CF8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100006FC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000070A0;
  return v6(a1);
}

uint64_t sub_1000070A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007198()
{
  uint64_t v1 = type metadata accessor for ClientOrigin();
  v0[8] = v1;
  v0[9] = *(void *)(v1 - 8);
  v0[10] = swift_task_alloc();
  type metadata accessor for RequestOrigin();
  v0[11] = swift_task_alloc();
  return _swift_task_switch(sub_1000072AC, 0, 0);
}

uint64_t sub_1000072AC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  v0[5] = 0;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for ClientOrigin.other(_:), v2);
  RequestOrigin.init(_:)();
  type metadata accessor for Session();
  swift_allocObject();
  v0[12] = Session.init(_:)();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000073D4;
  return Session.ownerToken()();
}

uint64_t sub_1000073D4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100007774;
  }
  else {
    uint64_t v4 = sub_100007514;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100007514()
{
  uint64_t v1 = (void *)v0[14];
  v0[5] = v1;
  uint64_t v2 = qword_1000115B0;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000065FC(v4, (uint64_t)qword_1000115B8);
  id v5 = v3;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v0[14];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    if (v8)
    {
      v0[7] = v5;
      id v11 = v5;
    }
    else
    {
      v0[6] = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v10 = v0[14];

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Owner token: %@", v9, 0xCu);
    sub_100007908(&qword_1000115A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_release();

  swift_beginAccess();
  uint64_t v12 = v0[5];
  swift_task_dealloc();
  swift_task_dealloc();
  __int16 v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v12);
}

uint64_t sub_100007774()
{
  swift_release();
  if (qword_1000115B0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000065FC(v1, (uint64_t)qword_1000115B8);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to retrieve token from find my", v4, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5(0);
}

uint64_t type metadata accessor for TokenManager()
{
  return self;
}

uint64_t sub_100007908(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000794C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007984()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100007A30;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_100011560 + dword_100011560);
  return v4(v2);
}

uint64_t sub_100007A30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007B28()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_100007EAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100011570 + dword_100011570);
  return v6(v2, v3, v4);
}

uint64_t sub_100007BEC()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007C2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100007EAC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100011580 + dword_100011580);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100007CF8(uint64_t a1)
{
  uint64_t v2 = sub_100007908(&qword_100011558);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007D58()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007D90(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007A30;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100011590 + dword_100011590);
  return v6(a1, v4);
}

uint64_t *sub_100007E48(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100007EB0()
{
  sub_100006314();
  sub_1000062F8((void *)&_mh_execute_header, v0, v1, "########### Dropped (Sound+Flash); too old.", v2, v3, v4, v5, v6);
}

void sub_100007EE4()
{
  sub_100006314();
  sub_1000062F8((void *)&_mh_execute_header, v0, v1, "########### Dropped (Sound); too old.", v2, v3, v4, v5, v6);
}

void sub_100007F18()
{
  sub_100006314();
  sub_1000062F8((void *)&_mh_execute_header, v0, v1, "########### Warning: Missing entitlement to play sounds on Companion.", v2, v3, v4, v5, v6);
}

void sub_100007F4C()
{
  sub_100006320(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "########### Interrupt process ID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007FC4()
{
  sub_100006320(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "########### Invalidate process ID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000803C()
{
  sub_100006314();
  sub_1000062F8((void *)&_mh_execute_header, v0, v1, "Got a nil token from findmy, can't start ranging over magnet link", v2, v3, v4, v5, v6);
}

uint64_t type metadata accessor for ClientOrigin()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t type metadata accessor for RequestOrigin()
{
  return type metadata accessor for RequestOrigin();
}

uint64_t RequestOrigin.init(_:)()
{
  return RequestOrigin.init(_:)();
}

uint64_t type metadata accessor for Session()
{
  return type metadata accessor for Session();
}

uint64_t Session.init(_:)()
{
  return Session.init(_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t nfm_log()
{
  return _nfm_log();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend__behaviorModeOverride(void *a1, const char *a2, ...)
{
  return _[a1 _behaviorModeOverride];
}

id objc_msgSend__cleanUpSession(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpSession];
}

id objc_msgSend__initializeSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _initializeSessionIfNeeded];
}

id objc_msgSend__startRangingSession(void *a1, const char *a2, ...)
{
  return _[a1 _startRangingSession];
}

id objc_msgSend__tellPhoneToPlaySoundWithBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tellPhoneToPlaySoundWithBehavior:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_applicationIdentifierWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIdentifierWithReply:");
}

id objc_msgSend_behaviorOverride(void *a1, const char *a2, ...)
{
  return _[a1 behaviorOverride];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didPlay(void *a1, const char *a2, ...)
{
  return _[a1 didPlay];
}

id objc_msgSend_findingNotifier(void *a1, const char *a2, ...)
{
  return _[a1 findingNotifier];
}

id objc_msgSend_flashLights(void *a1, const char *a2, ...)
{
  return _[a1 flashLights];
}

id objc_msgSend_getTokenWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTokenWithCompletionHandler:");
}

id objc_msgSend_gizmoService(void *a1, const char *a2, ...)
{
  return _[a1 gizmoService];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithRole_discoveryToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRole:discoveryToken:preferredUpdateRate:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_localConnections(void *a1, const char *a2, ...)
{
  return _[a1 localConnections];
}

id objc_msgSend_notifyDiscoveredNearbyObjectWithToken_sharedConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDiscoveredNearbyObjectWithToken:sharedConfigurationData:");
}

id objc_msgSend_notifyRemovedNearbyObjectWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyRemovedNearbyObjectWithToken:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingResponseIdentifier];
}

id objc_msgSend_playFindLocallySound(void *a1, const char *a2, ...)
{
  return _[a1 playFindLocallySound];
}

id objc_msgSend_playNearbySound(void *a1, const char *a2, ...)
{
  return _[a1 playNearbySound];
}

id objc_msgSend_playSoundAndFlash(void *a1, const char *a2, ...)
{
  return _[a1 playSoundAndFlash];
}

id objc_msgSend_playedSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playedSound:");
}

id objc_msgSend_playedSoundAndLED_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playedSoundAndLED:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_recordPingMyFiredSuccessfully_wantedTorch_withDeliveryDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordPingMyFiredSuccessfully:wantedTorch:withDeliveryDuration:");
}

id objc_msgSend_reloadControlsForExtension_kind_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadControlsForExtension:kind:reason:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithConfiguration:");
}

id objc_msgSend_sendEvent_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:with:");
}

id objc_msgSend_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setBehaviorOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBehaviorOverride:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDidPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidPlay:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setProtobufAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtobufAction:forIncomingRequestsOfType:");
}

id objc_msgSend_setProtobufAction_forIncomingResponsesOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtobufAction:forIncomingResponsesOfType:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSharedConfigData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedConfigData:");
}

id objc_msgSend_setSharedConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedConfiguration:");
}

id objc_msgSend_setTimeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStamp:");
}

id objc_msgSend_sharedConfigData(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfigData];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return _[a1 timeStamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_updatePingMyWatchSupportStateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updatePingMyWatchSupportStateIfNeeded];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}