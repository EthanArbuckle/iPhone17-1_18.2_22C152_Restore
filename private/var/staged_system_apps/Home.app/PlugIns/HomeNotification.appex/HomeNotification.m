void sub_100004178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000041A4(uint64_t a1, int a2)
{
  v3 = (id *)(a1 + 40);
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000042B8;
    block[3] = &unk_1000184D8;
    v5 = &v10;
    objc_copyWeak(&v10, v3);
    id v9 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004308;
    v6[3] = &unk_100018500;
    v5 = &v7;
    objc_copyWeak(&v7, v3);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  objc_destroyWeak(v5);
}

void sub_1000042B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configureWithContextDictionary:*(void *)(a1 + 32)];
}

void sub_100004308(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained extensionContext];
  [v1 dismissNotificationContentExtension];
}

void sub_100004BEC(uint64_t a1, uint64_t a2)
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      CFStringRef v5 = @"Succeeded";
    }
    else {
      CFStringRef v5 = @"Failed";
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) faceUnknownSignificantEvents];
    int v12 = 138412802;
    CFStringRef v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    id v17 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to identify %lu unknown persons", (uint8_t *)&v12, 0x20u);
  }
  v8 = objc_opt_new();
  id v9 = [*(id *)(a1 + 40) faceUnknownSignificantEvents];
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
  [v8 setObject:v10 forKeyedSubscript:HFAnalyticsFaceRecognitionNotificationAssociatePersonCountKey];

  v11 = +[NSNumber numberWithBool:a2];
  [v8 setObject:v11 forKeyedSubscript:HFAnalyticsFaceRecognitionNotificationAssociatePersonSuccessKey];

  +[HFAnalytics sendEvent:5 withData:v8];
}

void sub_100004D98(uint64_t a1, uint64_t a2)
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"Failed";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      CFStringRef v5 = @"Succeeded";
    }
    int v11 = 138412546;
    CFStringRef v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to identify an unknown person", (uint8_t *)&v11, 0x16u);
  }

  id v7 = objc_opt_new();
  v8 = [*(id *)(a1 + 40) faceUnknownSignificantEvents];
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
  [v7 setObject:v9 forKeyedSubscript:HFAnalyticsFaceRecognitionNotificationAssociatePersonCountKey];

  id v10 = +[NSNumber numberWithBool:a2];
  [v7 setObject:v10 forKeyedSubscript:HFAnalyticsFaceRecognitionNotificationAssociatePersonSuccessKey];

  +[HFAnalytics sendEvent:5 withData:v7];
}

void sub_100004F24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000E28C();
    }

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [v5 na_safeSetObject:v3 forKey:HFAnalyticsDataErrorKey];
    +[HFAnalytics sendEvent:3 withData:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v6 = HFURLComponentsHome;
    v20 = [*(id *)(a1 + 40) home];
    v19 = [v20 uniqueIdentifier];
    v18 = [v19 UUIDString];
    id v7 = +[NSURLQueryItem queryItemWithName:v6 value:v18];
    v25[0] = v7;
    uint64_t v8 = HFURLComponentsCameraProfile;
    id v9 = [*(id *)(a1 + 40) cameraProfile];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v10 UUIDString];
    CFStringRef v12 = +[NSURLQueryItem queryItemWithName:v8 value:v11];
    v25[1] = v12;
    __int16 v13 = +[NSArray arrayWithObjects:v25 count:2];
    uint64_t v14 = +[HFURLComponents homeKitObjectURLForDestination:10 secondaryDestination:0 UUID:v17 queryItems:v13];

    uint64_t v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for person URL: %@", buf, 0xCu);
    }

    __int16 v16 = [*(id *)(a1 + 40) extensionContext];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000524C;
    v21[3] = &unk_100018578;
    id v22 = v14;
    id v5 = v14;
    [v16 openURL:v5 completionHandler:v21];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000524C(uint64_t a1, int a2)
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"Failed";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      CFStringRef v5 = @"Succeeded";
    }
    int v7 = 138412546;
    CFStringRef v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to correct a misidentified person", (uint8_t *)&v7, 0x16u);
  }
}

id sub_100005670(id a1, NSString *a2)
{
  v2 = a2;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:v2];

  return v3;
}

void sub_1000056C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    CFStringRef v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000E2F8((uint64_t)v4, a1);
    }

    [*(id *)(a1 + 40) _showErrorText:v4];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) home];
    int v7 = [v6 hf_serviceWithIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setAffectedService:v7];

    CFStringRef v8 = [*(id *)(a1 + 40) _configureCameraProfileWithUUID:*(void *)(a1 + 56)];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005834;
    v10[3] = &unk_100018658;
    v10[4] = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 32);
    id v9 = [v8 addCompletionBlock:v10];
  }
}

void sub_100005834(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  CFStringRef v5 = HFLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000E3BC(v6);
    }

    [*(id *)(a1 + 32) _showErrorText:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [*(id *)(a1 + 32) home];
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) cameraProfile];
      uint64_t v10 = [v9 uniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found home %@. Using UUID:%@ for camera profile:%@. Configure and set instance properties.", buf, 0x20u);
    }
    id v11 = [*(id *)(a1 + 32) _configureCameraSignificantEventsWithUUIDs:*(void *)(a1 + 48)];
    v23[0] = v11;
    id v12 = [*(id *)(a1 + 32) _configureNotificationSnapshot];
    v23[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v23 count:2];
    uint64_t v14 = +[NAFuture combineAllFutures:v13];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005AC0;
    v22[3] = &unk_100018608;
    v22[4] = *(void *)(a1 + 32);
    id v15 = [v14 addSuccessBlock:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100005AFC;
    v19[3] = &unk_100018630;
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 32);
    id v20 = v16;
    uint64_t v21 = v17;
    id v18 = [v14 addFailureBlock:v19];
  }
}

id sub_100005AC0(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupContentViewController];
  v2 = *(void **)(a1 + 32);

  return _[v2 _setupNotificationActions];
}

void sub_100005AFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E400((uint64_t)v3, a1);
  }

  [*(id *)(a1 + 40) _showErrorText:v3];
}

void sub_100005C64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _homeWithUUID:*(void *)(a1 + 40) retryDelay:1.0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005DE4;
  v12[3] = &unk_1000186A8;
  id v5 = v3;
  id v13 = v5;
  uint64_t v6 = [v4 addFailureBlock:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005DF0;
  v9[3] = &unk_1000186D0;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v7 = v5;
  id v10 = v7;
  id v8 = [v6 addSuccessBlock:v9];

  objc_destroyWeak(&v11);
}

void sub_100005DD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100005DE4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void sub_100005DF0(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setHome:v4];

  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100005F54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005F70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _cameraProfileWithUUID:*(void *)(a1 + 40) retryDelay:1.0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000060D4;
  v12[3] = &unk_1000186A8;
  id v5 = v3;
  id v13 = v5;
  uint64_t v6 = [v4 addFailureBlock:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000060E0;
  v9[3] = &unk_100018720;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v7 = v5;
  id v10 = v7;
  id v8 = [v6 addSuccessBlock:v9];

  objc_destroyWeak(&v11);
}

void sub_1000060C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_1000060D4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void sub_1000060E0(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setCameraProfile:v4];

  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100006244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006260(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cameraProfile];
  BOOL v5 = v4 == 0;

  uint64_t v6 = HFLogForCategory();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000E4C4((id *)(a1 + 32));
    }

    [v3 finishWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempt to fetch significant events for uuids:%@.", buf, 0xCu);
    }

    id v9 = [*(id *)(a1 + 32) cameraProfile];
    id v10 = [v9 clipManager];
    uint64_t v12 = *(void *)(a1 + 40);
    id v11 = (id *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006444;
    v13[3] = &unk_100018770;
    objc_copyWeak(&v16, v11 + 1);
    id v14 = *v11;
    id v15 = v3;
    [v10 fetchSignificantEventsWithUUIDs:v12 completion:v13];

    objc_destroyWeak(&v16);
  }
}

void sub_100006428(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006444(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = HFLogForCategory();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000E550();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Did fetch significant events:%@ for uuids:%@.", buf, 0x16u);
  }

  [WeakRetained setCameraSignificantEvents:v5];
  id v11 = +[NSMutableSet set];
  uint64_t v12 = +[NSMutableSet set];
  id v13 = [WeakRetained cameraSignificantEvents];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_100006644;
  v19 = &unk_100018748;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  [v13 na_each:&v16];

  [WeakRetained setFaceKnownSignificantEvents:v15, v16, v17, v18, v19];
  [WeakRetained setFaceUnknownSignificantEvents:v14];
  [*(id *)(a1 + 40) finishWithNoResult];
}

void sub_100006644(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 faceClassification];
  id v4 = [v3 person];
  id v5 = [v4 name];

  if ([v5 length])
  {
    id v6 = (id *)(a1 + 32);
  }
  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    id v6 = (id *)(a1 + 40);
  }
  [*v6 addObject:v7];
LABEL_6:
}

void sub_1000067B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000067D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) cameraProfile];
  BOOL v6 = v5 == 0;

  id v7 = HFLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000E5BC((id *)(a1 + 32));
    }

    [v3 finishWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*v4 cameraProfile];
      uint64_t v10 = [v9 snapshotControl];
      id v11 = [*v4 context];
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(NC) Attempt fetch snapshot from control:%@ using bulletionContext:%@.", buf, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) cameraProfile];
    id v13 = [v12 snapshotControl];
    id v14 = [*(id *)(a1 + 32) context];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000069F4;
    v15[3] = &unk_100018798;
    objc_copyWeak(&v17, (id *)(a1 + 40));
    id v16 = v3;
    [v13 fetchCameraSnapshotForBulletinContext:v14 completionHandler:v15];

    objc_destroyWeak(&v17);
  }
}

void sub_1000069D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000069F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController: Configured with snapshot:%@ and error:%@.", (uint8_t *)&v9, 0x16u);
  }

  [WeakRetained setNotificationSnapshot:v5];
  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100006F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100006F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained contentViewController];
  id v3 = [v2 view];
  id v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:1.0];
  [WeakRetained setHeightConstraint:v5];

  v32 = [WeakRetained contentViewController];
  v31 = [v32 view];
  v29 = [v31 topAnchor];
  v30 = [WeakRetained view];
  __int16 v28 = [v30 topAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28];
  v33[0] = v27;
  __int16 v26 = [WeakRetained contentViewController];
  uint64_t v25 = [v26 view];
  id v23 = [v25 leadingAnchor];
  __int16 v24 = [WeakRetained view];
  id v22 = [v24 leadingAnchor];
  id v21 = [v23 constraintEqualToAnchor:v22];
  v33[1] = v21;
  __int16 v20 = [WeakRetained contentViewController];
  v19 = [v20 view];
  id v17 = [v19 trailingAnchor];
  uint64_t v18 = [WeakRetained view];
  id v6 = [v18 trailingAnchor];
  id v7 = [v17 constraintEqualToAnchor:v6];
  v33[2] = v7;
  uint64_t v8 = [WeakRetained contentViewController];
  int v9 = [v8 view];
  id v10 = [v9 bottomAnchor];
  __int16 v11 = [WeakRetained view];
  id v12 = [v11 bottomAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  v33[3] = v13;
  id v14 = [WeakRetained heightConstraint];
  v33[4] = v14;
  id v16 = +[NSArray arrayWithObjects:v33 count:5];

  return v16;
}

void sub_100007728(uint64_t a1)
{
  id v3 = +[UIColor systemGrayColor];
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

void sub_100007794(uint64_t a1)
{
  id v9 = 0;
  id v10 = 0;
  +[HFCameraItem getErrorDescription:&v10 detailedErrorDescription:&v9 forCameraStreamError:*(void *)(a1 + 32)];
  uint64_t v2 = v10;
  id v3 = v9;
  id v4 = v2;
  id v5 = [HomeNotificationStatusView alloc];
  id v6 = [*(id *)(a1 + 40) view];
  [v6 bounds];
  id v7 = -[HomeNotificationStatusView initWithFrame:](v5, "initWithFrame:");

  [(HomeNotificationStatusView *)v7 setStatusText:v3];
  uint64_t v8 = [*(id *)(a1 + 40) view];

  [v8 addSubview:v7];
}

id sub_10000794C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100007AD0;
  id v13 = &unk_100018838;
  id v14 = *(id *)(a1 + 32);
  id v4 = [v3 na_firstObjectPassingTest:&v10];
  if (v4)
  {
    id v5 = +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4, v10, v11, v12, v13);
  }
  else
  {
    if (v3) {
      id v6 = v3;
    }
    else {
      id v6 = &__NSArray0__struct;
    }
    CFStringRef v15 = @"HOMES";
    id v16 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v10, v11, v12, v13);
    uint64_t v8 = sub_100007B14(2, v7);
    id v5 = +[NAFuture futureWithError:v8];
  }

  return v5;
}

id sub_100007AD0(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_100007B14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [v4 na_safeSetObject:0 forKey:@"HomeNotificationErrorContext"];
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  id v5 = +[NSError errorWithDomain:@"com.apple.Home.HomeNotificationViewController" code:a1 userInfo:v4];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000E68C();
  }

  return v5;
}

id sub_100007CC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E700();
  }

  id v5 = objc_opt_new();
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  id v7 = [v6 homeManager];

  uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:*(double *)(a1 + 48)];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007E2C;
  v15[3] = &unk_1000188B0;
  id v9 = *(void **)(a1 + 40);
  void v15[4] = *(void *)(a1 + 32);
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  id v11 = [v7 _refreshBeforeDate:v8 completionHandler:v15];

  id v12 = v17;
  id v13 = v10;

  return v13;
}

void sub_100007E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _homeWithUUID:*(void *)(a1 + 40)];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007EFC;
  v7[3] = &unk_100018888;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  id v6 = [v4 addCompletionBlock:v7];
}

void sub_100007EFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "HomeNotificationViewController: Found home: %@ Error: %@ Error from refreshing home manager: %@", (uint8_t *)&v9, 0x20u);
  }

  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

void sub_100008224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 hf_cameraProfileWithIdentifier:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(NC): Home manager refresh. Found camera profile for UUID:%@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 48) finishWithResult:v5];
  }
  else
  {
    uint64_t v8 = sub_100007B14(5, 0);
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000E7F8();
    }

    [*(id *)(a1 + 48) finishWithError:v8];
  }
}

void sub_100008710(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008730(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100008794(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100008CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008CF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained playerViewController];

  if (v1)
  {
    uint64_t v2 = [WeakRetained nearbyAccessoriesViewController];
    id v3 = [v2 itemManager];
    uint64_t v4 = [v3 allDisplayedItems];
    id v5 = [v4 count];
    id v6 = [WeakRetained playerViewController];
    [v6 setNumberOfAssociatedAccessoriesDisplayed:v5];
  }
  uint64_t v7 = [WeakRetained tableView];
  [v7 reloadData];
}

id HomeNotificationActionOperationErrorWithContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    id v3 = [v4 localizedDescription];

    if (v3)
    {
      id v3 = [v5 localizedDescription];
    }
  }
  id v6 = objc_opt_new();
  [v6 na_safeSetObject:v5 forKey:NSUnderlyingErrorKey];
  [v6 na_safeSetObject:v3 forKey:NSLocalizedDescriptionKey];
  uint64_t v7 = +[NSError errorWithDomain:HomeNotificationActionOperationErrorDomain code:v5 == 0 userInfo:v6];

  return v7;
}

void sub_1000099B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000099CC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

uint64_t sub_100009AC0(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

void sub_100009B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009BB0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t sub_100009C94(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

id sub_100009EBC(uint64_t a1)
{
  [*(id *)(a1 + 32) setError:];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setFinished:1];
}

void sub_100009EFC(uint64_t a1)
{
  id v2 = objc_alloc((Class)HFSimpleItemManager);
  uint64_t v3 = *(void *)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A0E8;
  v13[3] = &unk_1000189C8;
  void v13[4] = v3;
  id v14 = *(id *)(a1 + 40);
  id v4 = [v2 initWithDelegate:v3 itemProvidersCreator:v13];
  [*(id *)(a1 + 32) setItemManager:v4];

  id v5 = [*(id *)(a1 + 32) itemManager];
  id v6 = [v5 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 56)];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A2CC;
  v11[3] = &unk_1000189F0;
  a1 += 48;
  objc_copyWeak(&v12, (id *)a1);
  id v7 = [v6 addFailureBlock:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A358;
  v9[3] = &unk_100018A40;
  objc_copyWeak(&v10, (id *)a1);
  id v8 = [v6 addSuccessBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
}

void sub_10000A0C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10000A0E8(uint64_t a1)
{
  id v2 = objc_alloc((Class)HFServiceItemProvider);
  uint64_t v3 = [*(id *)(a1 + 32) home];
  id v4 = [v2 initWithHome:v3 serviceTypes:0];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A218;
  v7[3] = &unk_1000189A0;
  id v8 = *(id *)(a1 + 40);
  [v4 setFilter:v7];
  id v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

id sub_10000A218(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    NSLog(@"Expected an HMService %@", v4);
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 uniqueIdentifier];
  id v9 = [v7 containsObject:v8];

  return v9;
}

void sub_10000A2CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000E86C((uint64_t)v3, v5);
  }

  [WeakRetained setError:v3];
  [WeakRetained setFinished:1];
}

void sub_10000A358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = +[NAFuture futureWithNoResult];
  id v7 = [WeakRetained action];
  id v8 = [v7 identifier];
  unsigned int v9 = [v8 isEqualToString:@"lightbulb"];

  if (v9)
  {
    uint64_t v10 = [WeakRetained _toggleLightbulbsForItems:v3];
  }
  else
  {
    uint64_t v11 = [WeakRetained action];
    id v12 = [v11 identifier];
    if ([v12 isEqualToString:@"security-system"])
    {
    }
    else
    {
      __int16 v13 = [WeakRetained action];
      id v14 = [v13 identifier];
      unsigned int v15 = [v14 isEqualToString:@"lock-mechanism"];

      if (!v15)
      {
        id v16 = [WeakRetained action];
        uint64_t v18 = [v16 identifier];
        NSLog(@"Unknown action identifier %@", v18);

        goto LABEL_8;
      }
    }
    uint64_t v10 = [WeakRetained _unlockLocksAndDisarmSecuritySystemsForItems:v3];
  }
  id v16 = v6;
  id v6 = (void *)v10;
LABEL_8:

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000A578;
  v19[3] = &unk_100018A18;
  objc_copyWeak(&v20, v4);
  id v17 = [v6 addCompletionBlock:v19];
  objc_destroyWeak(&v20);
}

void sub_10000A564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000A578(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFinished:1];
}

id sub_10000A7C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E928((uint64_t)v3, v4);
  }

  id v5 = HomeNotificationBundle();
  id v6 = [v5 localizedStringForKey:@"HONActionErrorCameraNotResponding" value:&stru_100019140 table:@"HONLocalizable"];
  id v7 = HomeNotificationActionOperationErrorWithContext(v6, v3);
  [*(id *)(a1 + 32) setError:v7];

  id v8 = [*(id *)(a1 + 32) error];
  unsigned int v9 = +[NAFuture futureWithError:v8];

  return v9;
}

BOOL sub_10000AA60(id a1, HFItem *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id sub_10000AAAC(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 2) {
    id v2 = @"HONActionLightTurnedOn";
  }
  else {
    id v2 = @"HONActionLightTurnedOff";
  }
  id v3 = v2;
  id v4 = HomeNotificationBundle();
  id v5 = [*(id *)(a1 + 40) count];
  id v6 = v3;
  if ((unint64_t)v5 >= 2)
  {
    id v6 = [(__CFString *)v3 stringByAppendingString:@"Plural"];
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_100019140 table:@"HONLocalizable"];
  [*(id *)(a1 + 32) setResultString:v7];

  if ((unint64_t)v5 >= 2) {
  id v8 = +[NAFuture futureWithNoResult];
  }

  return v8;
}

id sub_10000ABAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HomeNotificationBundle();
  if ((unint64_t)[*(id *)(a1 + 32) count] <= 1)
  {
    id v6 = [v4 localizedStringForKey:@"HONActionErrorLightNotResponding" value:&stru_100019140 table:@"HONLocalizable"];
  }
  else
  {
    id v5 = [@"HONActionErrorLightNotResponding" stringByAppendingString:@"Plural"];
    id v6 = [v4 localizedStringForKey:v5 value:&stru_100019140 table:@"HONLocalizable"];
  }
  id v7 = HomeNotificationActionOperationErrorWithContext(v6, v3);
  [*(id *)(a1 + 40) setError:v7];

  id v8 = +[NAFuture futureWithError:v3];

  return v8;
}

BOOL sub_10000AF8C(id a1, HFItem *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_10000AFD8(id a1, HFItem *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_10000B024(id a1, HFItem *a2)
{
  id v2 = [(HFItem *)a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:HFResultPrimaryStateKey];
  BOOL v4 = [v3 integerValue] != (id)2;

  return v4;
}

BOOL sub_10000B088(id a1, HFItem *a2)
{
  id v2 = [(HFItem *)a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:HFResultPrimaryStateKey];
  BOOL v4 = [v3 integerValue] != (id)1;

  return v4;
}

id sub_10000B0EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) itemManager];
  id v5 = [v4 childItemsForItem:v3];
  id v6 = [v5 na_firstObjectPassingTest:&stru_100018BC0];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 32) itemManager];
    id v8 = [v7 childItemsForItem:v3];
    NSLog(@"No matching control item found on security system item %@ with control items: %@", v3, v8);
  }
  unsigned int v9 = [v6 writeValue:&off_1000196A8];

  return v9;
}

BOOL sub_10000B1D8(id a1, HFItem *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  id v6 = [(HFItem *)v5 characteristicOptions];
  id v7 = [v6 objectForKeyedSubscript:&off_100019690];
  unsigned __int8 v8 = [v7 containsObject:HMCharacteristicTypeTargetSecuritySystemState];

  return v8;
}

NAFuture *sub_10000B28C(id *a1)
{
  if ([a1[4] count] && objc_msgSend(a1[5], "count"))
  {
    id v2 = HomeNotificationBundle();
    id v3 = [a1[4] count];
    if ((unint64_t)v3 >= 2)
    {
      BOOL v4 = @"HONActionLockUnlockedAndSecuritySystemDisarmed";
LABEL_8:
      id v5 = [(__CFString *)v4 stringByAppendingString:@"Plural"];
      goto LABEL_13;
    }
    id v5 = @"HONActionLockUnlockedAndSecuritySystemDisarmed";
  }
  else
  {
    if (![a1[4] count])
    {
      if (![a1[5] count]) {
        goto LABEL_16;
      }
      id v2 = HomeNotificationBundle();
      id v5 = [v2 localizedStringForKey:@"HONActionSecuritySystemDisarmed" value:&stru_100019140 table:@"HONLocalizable"];
      [a1[6] setResultString:v5];
      goto LABEL_14;
    }
    id v2 = HomeNotificationBundle();
    id v3 = [a1[4] count];
    if ((unint64_t)v3 >= 2)
    {
      BOOL v4 = @"HONActionLockUnlocked";
      goto LABEL_8;
    }
    id v5 = @"HONActionLockUnlocked";
  }
LABEL_13:
  id v6 = [v2 localizedStringForKey:v5 value:&stru_100019140 table:@"HONLocalizable"];
  [a1[6] setResultString:v6];

  if ((unint64_t)v3 > 1) {
LABEL_14:
  }

LABEL_16:

  return +[NAFuture futureWithNoResult];
}

id sub_10000B408(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  if ([v3 count] && objc_msgSend(a1[5], "count"))
  {
    id v5 = HomeNotificationBundle();
    id v6 = (char *)[a1[4] count];
    id v7 = &v6[(void)[a1[5] count]];
    if ((unint64_t)v7 < 2)
    {
      unsigned __int8 v8 = @"HONActionErrorAccessoryNotResponding";
    }
    else
    {
      unsigned __int8 v8 = [@"HONActionErrorAccessoryNotResponding" stringByAppendingString:@"Plural"];
    }
    uint64_t v11 = [v5 localizedStringForKey:v8 value:&stru_100019140 table:@"HONLocalizable"];
    if ((unint64_t)v7 >= 2) {

    }
    goto LABEL_16;
  }
  if ([a1[4] count])
  {
    id v5 = HomeNotificationBundle();
    id v9 = [a1[4] count];
    if ((unint64_t)v9 < 2)
    {
      uint64_t v10 = @"HONActionErrorLockNotResponding";
    }
    else
    {
      uint64_t v10 = [@"HONActionErrorLockNotResponding" stringByAppendingString:@"Plural"];
    }
    uint64_t v11 = [v5 localizedStringForKey:v10 value:&stru_100019140 table:@"HONLocalizable"];
    if ((unint64_t)v9 >= 2) {

    }
    goto LABEL_16;
  }
  if ([a1[5] count])
  {
    id v5 = HomeNotificationBundle();
    uint64_t v11 = [v5 localizedStringForKey:@"HONActionErrorSecuritySystemNotResponding" value:&stru_100019140 table:@"HONLocalizable"];
LABEL_16:

    goto LABEL_17;
  }
  NSLog(@"Action failed despite not writing any values!");
  uint64_t v11 = 0;
LABEL_17:
  id v12 = HomeNotificationActionOperationErrorWithContext(v11, v4);
  [a1[6] setError:v12];

  __int16 v13 = +[NAFuture futureWithError:v4];

  return v13;
}

id sub_10000B7A4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 itemManager];
  id v6 = [v5 childItemsForItem:v4 ofClass:objc_opt_class() conformingToProtocol:&OBJC_PROTOCOL___HFPrimaryStateWriter];

  id v7 = [v6 anyObject];

  unsigned __int8 v8 = [v7 writePrimaryState:*(void *)(a1 + 40)];

  return v8;
}

BOOL sub_10000B9C4(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:HFResultPrimaryStateKey];
  BOOL v5 = [v4 integerValue] == *(id *)(a1 + 32);

  return v5;
}

uint64_t sub_10000BA30(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

void sub_10000C7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C7F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) statusText];
  id v3 = [*(id *)(a1 + 32) statusAccessoryImage];
  [WeakRetained _updateStatusText:v2 accessoryImage:v3 animated:*(unsigned __int8 *)(a1 + 48)];
}

id sub_10000D1E4()
{
  if (qword_10001F120 != -1) {
    dispatch_once(&qword_10001F120, &stru_100018D10);
  }
  v0 = (void *)qword_10001F128;

  return v0;
}

void sub_10000D238(id a1)
{
  qword_10001F128 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_10000DB7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [[HomeNotificationAction alloc] initWithDictionary:v3];

  id v4 = [(HomeNotificationAction *)v7 identifier];

  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [(HomeNotificationAction *)v7 identifier];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

void sub_10000DE28(id a1)
{
  qword_10001F130 = +[NSSet setWithObjects:@"identifier", @"itemType", @"shouldDismiss", @"title", @"services.uuid", 0];

  _objc_release_x1();
}

id sub_10000DEA4(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:v2];

  return v3;
}

id HomeNotificationTableViewController.nearbyAccessoriesViewControllerDidUpdate(viewController:)()
{
  return [v0 updateNearbyAccessoriesViewController];
}

id sub_10000E158(uint64_t a1)
{
  return [v1 nearbyAccessoriesViewControllerDidUpdateWithViewController:a1];
}

unint64_t sub_10000E16C()
{
  unint64_t result = qword_10001F110;
  if (!qword_10001F110)
  {
    sub_10000E1C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001F110);
  }
  return result;
}

unint64_t sub_10000E1C4()
{
  unint64_t result = qword_10001F118;
  if (!qword_10001F118)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001F118);
  }
  return result;
}

void sub_10000E204(void *a1)
{
  v1 = [a1 notificationRequestIdentifier];
  sub_100008750();
  sub_100008710((void *)&_mh_execute_header, v2, v3, "HomeNotificationViewController already active for previous notification with request identifier %@", v4, v5, v6, v7, v8);
}

void sub_10000E28C()
{
  sub_10000877C();
  sub_100008730((void *)&_mh_execute_header, v0, v1, "HomeNotificationViewController failed to handle misclassification for significant event %@ (error: %@)");
}

void sub_10000E2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 32) objectForKeyedSubscript:HMBulletinContextHomeIDKey];
  uint64_t v4 = [*(id *)(a2 + 32) objectForKeyedSubscript:HMBulletinCameraNotificationIDKey];
  sub_10000875C();
  sub_100008794((void *)&_mh_execute_header, v5, v6, "Failed to find home after waiting. Showing error text because configuration failed with error:%@ for homeUUID:%@ cameraProfileUUID:%@.", v7, v8, v9, v10, v11);
}

void sub_10000E3BC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to configure camera profile. Displaying error content.", v1, 2u);
}

void sub_10000E400(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 32) objectForKeyedSubscript:HMBulletinContextHomeIDKey];
  uint64_t v4 = [*(id *)(a2 + 32) objectForKeyedSubscript:HMBulletinCameraNotificationIDKey];
  sub_10000875C();
  sub_100008794((void *)&_mh_execute_header, v5, v6, "Showing error text because configuration failed with error:%@ for homeUUID:%@ cameraProfileUUID:%@.", v7, v8, v9, v10, v11);
}

void sub_10000E4C4(id *a1)
{
  os_log_t v1 = [*a1 cameraProfile];
  sub_100008750();
  sub_100008710((void *)&_mh_execute_header, v2, v3, "Unable to attempt to fetch the clips with missing camera profile:%@.", v4, v5, v6, v7, v8);
}

void sub_10000E550()
{
  sub_10000877C();
  sub_100008730((void *)&_mh_execute_header, v0, v1, "HomeNotificationViewController: Failed to fetch significant events for uuids %@ (error: %@)");
}

void sub_10000E5BC(id *a1)
{
  os_log_t v1 = [*a1 cameraProfile];
  sub_100008750();
  sub_100008710((void *)&_mh_execute_header, v2, v3, "Unable to fetch the snapshot with missing camera profile:%@.", v4, v5, v6, v7, v8);
}

void sub_10000E648(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to setup camera content for missing profile.", v1, 2u);
}

void sub_10000E68C()
{
  sub_100008750();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error: %@", v1, 0xCu);
}

void sub_10000E700()
{
  sub_100008750();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not fetch home. Attempting to refresh home manager: %@", v1, 0xCu);
}

void sub_10000E774(void *a1)
{
  os_log_t v1 = [a1 home];
  sub_100008750();
  sub_100008710((void *)&_mh_execute_header, v2, v3, "Camera profile unavailable for home:%@. Attempting to refresh home manager", v4, v5, v6, v7, v8);
}

void sub_10000E7F8()
{
  sub_100008750();
  sub_100008730((void *)&_mh_execute_header, v0, v1, "(NC): Could not fetch camera profile: %@ Error after refreshing home manager: %@");
}

void sub_10000E86C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "HFSimpleItemManager failed to retrieve items: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000E8E4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempted to perform a microphone action on a camera that does not have a microphone control!", v1, 2u);
}

void sub_10000E928(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to toggle microphone state; error: %@",
    (uint8_t *)&v2,
    0xCu);
}

uint64_t sub_10000E9A0()
{
  return dispatch thunk of NearbyAccessoriesViewController.nearbyAccessoriesDelegate.setter();
}

uint64_t sub_10000E9B0()
{
  return NearbyAccessoriesViewController.init(sourceItem:supportsQuickControls:)();
}

uint64_t sub_10000E9C0()
{
  return type metadata accessor for NearbyAccessoriesViewController();
}

uint64_t HFLogForCategory()
{
  return _HFLogForCategory();
}

uint64_t HFToggledPrimaryState()
{
  return _HFToggledPrimaryState();
}

uint64_t HUImageNamed()
{
  return _HUImageNamed();
}

uint64_t HULocalizedString()
{
  return _HULocalizedString();
}

uint64_t HULocalizedStringWithFormat()
{
  return _HULocalizedStringWithFormat();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__cameraProfileWithUUID_retryDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cameraProfileWithUUID:retryDelay:");
}

id objc_msgSend__clearUpContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _clearUpContentViewController];
}

id objc_msgSend__configureCameraProfileWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 _configureCameraProfileWithUUID:];
}

id objc_msgSend__configureCameraSignificantEventsWithUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureCameraSignificantEventsWithUUIDs:");
}

id objc_msgSend__configureHomeWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 _configureHomeWithUUID:];
}

id objc_msgSend__configureNotificationSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 _configureNotificationSnapshot];
}

id objc_msgSend__configureWithContextDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureWithContextDictionary:");
}

id objc_msgSend__createNearbyAccessoryViewControllerWithSourceItem_supportsQuickControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNearbyAccessoryViewControllerWithSourceItem:supportsQuickControls:");
}

id objc_msgSend__currentSectionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _currentSectionIdentifiers];
}

id objc_msgSend__homeWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 _homeWithUUID];
}

id objc_msgSend__homeWithUUID_retryDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeWithUUID:retryDelay:");
}

id objc_msgSend__identifierForSection_(void *a1, const char *a2, ...)
{
  return [a1 _identifierForSection:];
}

id objc_msgSend__itemsToInvertPrimaryStateForItems_preferredPrimaryState_targetPrimaryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemsToInvertPrimaryStateForItems:preferredPrimaryState:targetPrimaryState:");
}

id objc_msgSend__numberOfSectionsToShow(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfSectionsToShow];
}

id objc_msgSend__refreshBeforeDate_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _refreshBeforeDate:completionHandler:];
}

id objc_msgSend__setupContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _setupContentViewController];
}

id objc_msgSend__showErrorText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showErrorText:");
}

id objc_msgSend__toggleLightbulbsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleLightbulbsForItems:");
}

id objc_msgSend__toggleMicrophoneState_(void *a1, const char *a2, ...)
{
  return [a1 _toggleMicrophoneState:];
}

id objc_msgSend__unlockLocksAndDisarmSecuritySystemsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unlockLocksAndDisarmSecuritySystemsForItems:");
}

id objc_msgSend__updateStatusText_accessoryImage_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStatusText:accessoryImage:animated:");
}

id objc_msgSend__writePrimaryState_forItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writePrimaryState:forItems:");
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessQueue];
}

id objc_msgSend_accessoryImage(void *a1, const char *a2, ...)
{
  return _[a1 accessoryImage];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_actionResultText(void *a1, const char *a2, ...)
{
  return _[a1 actionResultText];
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return [a1 actionWithIdentifier:title:options:];
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return [a1 actionWithIdentifier:title:options:icon:];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 activateIfNeeded];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 addCompletionBlock:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFailureBlock:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return [a1 addSuccessBlock:];
}

id objc_msgSend_affectedService(void *a1, const char *a2, ...)
{
  return _[a1 affectedService];
}

id objc_msgSend_afterDelay_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 afterDelay:performBlock:];
}

id objc_msgSend_allDisplayedItems(void *a1, const char *a2, ...)
{
  return _[a1 allDisplayedItems];
}

id objc_msgSend_allHomesFuture(void *a1, const char *a2, ...)
{
  return _[a1 allHomesFuture];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_aspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 aspectRatio];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_backgroundWithBlurEffect_(void *a1, const char *a2, ...)
{
  return [a1 backgroundWithBlurEffect:];
}

id objc_msgSend_backgroundWithFillColor_(void *a1, const char *a2, ...)
{
  return [a1 backgroundWithFillColor:];
}

id objc_msgSend_beginTransactionWithReason_(void *a1, const char *a2, ...)
{
  return [a1 beginTransactionWithReason:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_cameraClipUUID(void *a1, const char *a2, ...)
{
  return _[a1 cameraClipUUID];
}

id objc_msgSend_cameraFeedbackQueryString(void *a1, const char *a2, ...)
{
  return _[a1 cameraFeedbackQueryString];
}

id objc_msgSend_cameraNotificationUUID(void *a1, const char *a2, ...)
{
  return _[a1 cameraNotificationUUID];
}

id objc_msgSend_cameraProfile(void *a1, const char *a2, ...)
{
  return _[a1 cameraProfile];
}

id objc_msgSend_cameraSignificantEvents(void *a1, const char *a2, ...)
{
  return _[a1 cameraSignificantEvents];
}

id objc_msgSend_cameraSource(void *a1, const char *a2, ...)
{
  return _[a1 cameraSource];
}

id objc_msgSend_cameraStream(void *a1, const char *a2, ...)
{
  return _[a1 cameraStream];
}

id objc_msgSend_cameraView(void *a1, const char *a2, ...)
{
  return _[a1 cameraView];
}

id objc_msgSend_canEvaluatePolicy_error_(void *a1, const char *a2, ...)
{
  return [a1 canEvaluatePolicy:error:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_characteristicOptions(void *a1, const char *a2, ...)
{
  return _[a1 characteristicOptions];
}

id objc_msgSend_childItemsForItem_(void *a1, const char *a2, ...)
{
  return [a1 childItemsForItem:];
}

id objc_msgSend_childItemsForItem_ofClass_conformingToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 childItemsForItem:ofClass:conformingToProtocol:];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clipManager(void *a1, const char *a2, ...)
{
  return _[a1 clipManager];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:];
}

id objc_msgSend_combineAllFutures_(void *a1, const char *a2, ...)
{
  return [a1 combineAllFutures:];
}

id objc_msgSend_combineAllFutures_ignoringErrors_scheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineAllFutures:ignoringErrors:scheduler:");
}

id objc_msgSend_commitTransactionWithReason_(void *a1, const char *a2, ...)
{
  return [a1 commitTransactionWithReason:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:constant:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_contentWithVibrancyEffect_(void *a1, const char *a2, ...)
{
  return [a1 contentWithVibrancyEffect:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return _[a1 dismissNotificationContentExtension];
}

id objc_msgSend_dispatcher(void *a1, const char *a2, ...)
{
  return _[a1 dispatcher];
}

id objc_msgSend_effectForBlurEffect_(void *a1, const char *a2, ...)
{
  return [a1 effectForBlurEffect:];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorContent(void *a1, const char *a2, ...)
{
  return _[a1 errorContent];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_evaluatePolicy_localizedReason_reply_(void *a1, const char *a2, ...)
{
  return [a1 evaluatePolicy:localizedReason:reply:];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_faceClassification(void *a1, const char *a2, ...)
{
  return _[a1 faceClassification];
}

id objc_msgSend_faceKnownSignificantEvents(void *a1, const char *a2, ...)
{
  return _[a1 faceKnownSignificantEvents];
}

id objc_msgSend_faceRecognitionSettingsURLForHome_(void *a1, const char *a2, ...)
{
  return [a1 faceRecognitionSettingsURLForHome:];
}

id objc_msgSend_faceUnknownSignificantEvents(void *a1, const char *a2, ...)
{
  return _[a1 faceUnknownSignificantEvents];
}

id objc_msgSend_fetchCameraSnapshotForBulletinContext_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchCameraSnapshotForBulletinContext:completionHandler:];
}

id objc_msgSend_fetchSignificantEventsWithUUIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchSignificantEventsWithUUIDs:completion:];
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return [a1 finishWithError:];
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return _[a1 finishWithNoResult];
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return [a1 finishWithResult:];
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 finishWithResult:error:];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flatMap_(void *a1, const char *a2, ...)
{
  return [a1 flatMap:];
}

id objc_msgSend_futureWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 futureWithBlock:];
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return [a1 futureWithError:];
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return _[a1 futureWithNoResult];
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return [a1 futureWithResult:];
}

id objc_msgSend_getErrorDescription_detailedErrorDescription_forCameraStreamError_(void *a1, const char *a2, ...)
{
  return [a1 getErrorDescription:detailedErrorDescription:forCameraStreamError:];
}

id objc_msgSend_handleFaceMisclassificationForSignificantEvent_completion_(void *a1, const char *a2, ...)
{
  return [a1 handleFaceMisclassificationForSignificantEvent:completion:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 heightConstraint];
}

id objc_msgSend_hf_cameraProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hf_cameraProfileWithIdentifier:];
}

id objc_msgSend_hf_characteristicValueManager(void *a1, const char *a2, ...)
{
  return [a1 hf_characteristicValueManager];
}

id objc_msgSend_hf_currentUserIsAdministrator(void *a1, const char *a2, ...)
{
  return [a1 hf_currentUserIsAdministrator];
}

id objc_msgSend_hf_errorWithCode_(void *a1, const char *a2, ...)
{
  return [a1 hf_errorWithCode:];
}

id objc_msgSend_hf_keyColor(void *a1, const char *a2, ...)
{
  return [a1 hf_keyColor];
}

id objc_msgSend_hf_serviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hf_serviceWithIdentifier:];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _[a1 home];
}

id objc_msgSend_homeKitObjectURLForDestination_secondaryDestination_UUID_queryItems_(void *a1, const char *a2, ...)
{
  return [a1 homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return _[a1 homeManager];
}

id objc_msgSend_hu_preloadContent(void *a1, const char *a2, ...)
{
  return [a1 hu_preloadContent];
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return [a1 iconWithSystemImageName:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithBadgeView_(void *a1, const char *a2, ...)
{
  return [a1 initWithBadgeView:];
}

id objc_msgSend_initWithCameraProfile_cameraStream_valueManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCameraProfile:cameraStream:valueManager:];
}

id objc_msgSend_initWithCameraProfile_notificationUUID_clipUUID_imageURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithCameraProfile:notificationUUID:clipUUID:imageURL:];
}

id objc_msgSend_initWithDelegate_itemProvidersCreator_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithHome_serviceTypes_(void *a1, const char *a2, ...)
{
  return [a1 initWithHome:serviceTypes:];
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:];
}

id objc_msgSend_initWithNotification_home_cameraProfile_notificationUUID_clipUUID_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotification:home:cameraProfile:notificationUUID:clipUUID:snapshot:");
}

id objc_msgSend_initWithOwningView_constraintBuilder_(void *a1, const char *a2, ...)
{
  return [a1 initWithOwningView:constraintBuilder:];
}

id objc_msgSend_initWithProfile_valueSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithProfile:valueSource:];
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectsSet:];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceUnlocked];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isOutgoingAudioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isOutgoingAudioEnabled];
}

id objc_msgSend_itemManager(void *a1, const char *a2, ...)
{
  return _[a1 itemManager];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_latestResults(void *a1, const char *a2, ...)
{
  return _[a1 latestResults];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _[a1 mainThreadScheduler];
}

id objc_msgSend_microphoneControl(void *a1, const char *a2, ...)
{
  return _[a1 microphoneControl];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_na_each_(void *a1, const char *a2, ...)
{
  return [a1 na_each:];
}

id objc_msgSend_na_filter_(void *a1, const char *a2, ...)
{
  return [a1 na_filter:];
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 na_firstObjectPassingTest:];
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return [a1 na_map:];
}

id objc_msgSend_na_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 na_safeSetObject:forKey:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nearbyAccessoriesViewController(void *a1, const char *a2, ...)
{
  return _[a1 nearbyAccessoriesViewController];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationRequestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 notificationRequestIdentifier];
}

id objc_msgSend_notificationSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 notificationSnapshot];
}

id objc_msgSend_numberOfSectionsDisplayed(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSectionsDisplayed];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:completionHandler:];
}

id objc_msgSend_person(void *a1, const char *a2, ...)
{
  return _[a1 person];
}

id objc_msgSend_playerViewController(void *a1, const char *a2, ...)
{
  return _[a1 playerViewController];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_recover_(void *a1, const char *a2, ...)
{
  return [a1 recover:];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_reloadAfterNotificationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 reloadAfterNotificationUpdate];
}

id objc_msgSend_reloadAndUpdateAllItemsFromSenderSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAndUpdateAllItemsFromSenderSelector:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sendEvent_withData_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:withData:];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return _[a1 serviceType];
}

id objc_msgSend_serviceUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 serviceUUIDs];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessQueue_(void *a1, const char *a2, ...)
{
  return [a1 setAccessQueue:];
}

id objc_msgSend_setAccessoryImage_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryImage:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActionResultText_(void *a1, const char *a2, ...)
{
  return [a1 setActionResultText:];
}

id objc_msgSend_setAffectedService_(void *a1, const char *a2, ...)
{
  return [a1 setAffectedService:];
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSelection:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundEffect_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundEffect:];
}

id objc_msgSend_setBadgeHidden_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeHidden:];
}

id objc_msgSend_setBadgeOffset_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeOffset:];
}

id objc_msgSend_setCameraClipUUID_(void *a1, const char *a2, ...)
{
  return [a1 setCameraClipUUID:];
}

id objc_msgSend_setCameraNotificationUUID_(void *a1, const char *a2, ...)
{
  return [a1 setCameraNotificationUUID:];
}

id objc_msgSend_setCameraProfile_(void *a1, const char *a2, ...)
{
  return [a1 setCameraProfile:];
}

id objc_msgSend_setCameraSignificantEvents_(void *a1, const char *a2, ...)
{
  return [a1 setCameraSignificantEvents:];
}

id objc_msgSend_setCameraSource_(void *a1, const char *a2, ...)
{
  return [a1 setCameraSource];
}

id objc_msgSend_setCameraView_(void *a1, const char *a2, ...)
{
  return [a1 setCameraView:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setConstraints:];
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return [a1 setContent:];
}

id objc_msgSend_setContentEffect_(void *a1, const char *a2, ...)
{
  return [a1 setContentEffect:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setContentInsetAdjustmentBehavior:];
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return [a1 setContentViewController:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setErrorContent_(void *a1, const char *a2, ...)
{
  return [a1 setErrorContent:];
}

id objc_msgSend_setErrorContent_animated_(void *a1, const char *a2, ...)
{
  return [a1 setErrorContent:animated:];
}

id objc_msgSend_setExecuting_(void *a1, const char *a2, ...)
{
  return [a1 setExecuting:];
}

id objc_msgSend_setFaceKnownSignificantEvents_(void *a1, const char *a2, ...)
{
  return [a1 setFaceKnownSignificantEvents:];
}

id objc_msgSend_setFaceUnknownSignificantEvents_(void *a1, const char *a2, ...)
{
  return [a1 setFaceUnknownSignificantEvents:];
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return [a1 setFilter:];
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return [a1 setFinished:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setHeightConstraint:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return [a1 setHidesWhenStopped:];
}

id objc_msgSend_setHome_(void *a1, const char *a2, ...)
{
  return [a1 setHome:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setItemManager_(void *a1, const char *a2, ...)
{
  return [a1 setItemManager:];
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMargins:];
}

id objc_msgSend_setNearbyAccessoriesViewController_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyAccessoriesViewController:];
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return [a1 setNotification:];
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationActions:];
}

id objc_msgSend_setNotificationRequestIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationRequestIdentifier:];
}

id objc_msgSend_setNotificationSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationSnapshot];
}

id objc_msgSend_setNumberOfAssociatedAccessoriesDisplayed_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfAssociatedAccessoriesDisplayed:];
}

id objc_msgSend_setNumberOfSectionsDisplayed_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfSectionsDisplayed:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOutgoingAudioEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setOutgoingAudioEnabled:];
}

id objc_msgSend_setOverrideHome_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideHome:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setResultString_(void *a1, const char *a2, ...)
{
  return [a1 setResultString:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setSectionContentInsetFollowsLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setSectionContentInsetFollowsLayoutMargins:];
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorInset:];
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorStyle:];
}

id objc_msgSend_setServiceUUIDs_(void *a1, const char *a2, ...)
{
  return [a1 setServiceUUIDs:];
}

id objc_msgSend_setShouldDismiss_(void *a1, const char *a2, ...)
{
  return [a1 setShouldDismiss:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setSpinner_(void *a1, const char *a2, ...)
{
  return [a1 setSpinner:];
}

id objc_msgSend_setStaticConstraintSet_(void *a1, const char *a2, ...)
{
  return [a1 setStaticConstraintSet:];
}

id objc_msgSend_setStatusAccessoryImage_(void *a1, const char *a2, ...)
{
  return [a1 setStatusAccessoryImage:];
}

id objc_msgSend_setStatusAccessoryImageView_(void *a1, const char *a2, ...)
{
  return [a1 setStatusAccessoryImageView:];
}

id objc_msgSend_setStatusBarView_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarView:];
}

id objc_msgSend_setStatusDisplayStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStatusDisplayStyle:];
}

id objc_msgSend_setStatusLabel_(void *a1, const char *a2, ...)
{
  return [a1 setStatusLabel:];
}

id objc_msgSend_setStatusText_(void *a1, const char *a2, ...)
{
  return [a1 setStatusText:];
}

id objc_msgSend_setStatusTextOverrideCancellationToken_(void *a1, const char *a2, ...)
{
  return [a1 setStatusTextOverrideCancellationToken:];
}

id objc_msgSend_setStatusView_(void *a1, const char *a2, ...)
{
  return [a1 setStatusView:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:];
}

id objc_msgSend_setWantsPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setWantsPreferredContentSize:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return _[a1 sharedDispatcher];
}

id objc_msgSend_shouldDismiss(void *a1, const char *a2, ...)
{
  return _[a1 shouldDismiss];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_snapshotControl(void *a1, const char *a2, ...)
{
  return _[a1 snapshotControl];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return _[a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_staticConstraintSet(void *a1, const char *a2, ...)
{
  return _[a1 staticConstraintSet];
}

id objc_msgSend_statusAccessoryImage(void *a1, const char *a2, ...)
{
  return _[a1 statusAccessoryImage];
}

id objc_msgSend_statusAccessoryImageView(void *a1, const char *a2, ...)
{
  return _[a1 statusAccessoryImageView];
}

id objc_msgSend_statusBarView(void *a1, const char *a2, ...)
{
  return _[a1 statusBarView];
}

id objc_msgSend_statusDisplayStyle(void *a1, const char *a2, ...)
{
  return _[a1 statusDisplayStyle];
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return _[a1 statusLabel];
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return _[a1 statusText];
}

id objc_msgSend_statusTextOverrideCancellationToken(void *a1, const char *a2, ...)
{
  return _[a1 statusTextOverrideCancellationToken];
}

id objc_msgSend_statusView(void *a1, const char *a2, ...)
{
  return _[a1 statusView];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_streamControl(void *a1, const char *a2, ...)
{
  return _[a1 streamControl];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_writePrimaryState_(void *a1, const char *a2, ...)
{
  return [a1 writePrimaryState:];
}

id objc_msgSend_writeValue_(void *a1, const char *a2, ...)
{
  return [a1 writeValue:];
}