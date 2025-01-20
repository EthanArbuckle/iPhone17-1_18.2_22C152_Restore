void sub_100005004(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005018(id a1)
{
  qword_1000722A8 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

void sub_1000057E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000057FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

void sub_100005950(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;
  }
}

id sub_100005B28(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateAllSnapshots];
}

void sub_100005C88(uint64_t a1)
{
  v3 = +[NTKFace faceWithInstanceDescriptor:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 24) updateSnapshotForFace:v3];
}

id sub_100005E4C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) performAfterCompletingCurrentlyPendingSnapshots:*(void *)(a1 + 40)];
}

void sub_100005FF8(void *a1)
{
  v3 = +[NTKFace faceWithInstanceDescriptor:a1[4]];
  [*(id *)(a1[5] + 24) snapshotFace:v3 options:a1[6] completion:a1[7]];
}

id sub_10000620C(void *a1)
{
  return [*(id *)(a1[4] + 24) snapshotLibrarySelectedFaceForDeviceUUID:a1[5] options:a1[6] completion:a1[7]];
}

void sub_1000062B4(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (objc_class *)objc_opt_class();
      uint64_t v4 = NSStringFromClass(v3);
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412546;
      v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ faceSnapshotChangedForKey:%@", (uint8_t *)&v7, 0x16u);
    }
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
    [v6 faceSnapshotChangedForKey:*(void *)(a1 + 40)];
  }
}

void sub_100006468(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.facesnapshotclient.busy");
}

uint64_t sub_100006748(uint64_t a1)
{
  qword_1000722B8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100006964(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = +[LSApplicationProxy applicationProxyForIdentifier:v3];
  uint64_t v5 = [v4 applicationType];
  unsigned __int8 v6 = [v5 isEqualToString:LSSystemApplicationType];

  if ((v6 & 1) == 0)
  {
    id v12 = 0;
    id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v12];
    id v8 = v12;
    if (v7)
    {
      __int16 v9 = +[INAppInfo appInfoWithApplicationRecord:v7];
      uint64_t v10 = [v9 supportedActionsByExtensions];
      id v11 = [v10 count];

      if (v11) {
        [*(id *)(a1 + 32) addObject:v3];
      }
    }
    else
    {
      __int16 v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100042C9C((uint64_t)v3, (uint64_t)v8, v9);
      }
    }
  }
}

id sub_100006BA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateDeviceDataSourcesInNanoPreferences");
}

id sub_100006C44(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_buildInitialSetOfIdentifiersIfNeeded");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      unsigned __int8 v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v6) bundleIdentifier];
        [*(id *)(*(void *)(a1 + 32) + 16) addObject:v7];

        unsigned __int8 v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "applicationsDidInstall will rewrite available data sources to NPS", v10, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "queue_updateDeviceDataSourcesInNanoPreferences");
}

id sub_100006E50(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_buildInitialSetOfIdentifiersIfNeeded");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      unsigned __int8 v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v6) bundleIdentifier];
        [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v7];

        unsigned __int8 v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "applicationsDidUninstall will rewrite available data sources to NPS", v10, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "queue_updateDeviceDataSourcesInNanoPreferences");
}

void sub_100007030(id a1)
{
  id v1 = objc_alloc((Class)NSXPCListener);
  id v2 = [v1 initWithMachServiceName:NTKCollectionMachService];
  id v3 = (void *)qword_1000722C8;
  qword_1000722C8 = (uint64_t)v2;

  id v4 = (void *)qword_1000722C8;
  uint64_t v5 = +[NTKDCollectionCoordinator sharedInstance];
  [v4 setDelegate:v5];

  unsigned __int8 v6 = (void *)qword_1000722C8;

  [v6 resume];
}

void sub_100007110(id a1)
{
  qword_1000722D8 = objc_alloc_init(NTKDCollectionCoordinator);

  _objc_release_x1();
}

void sub_100007328(uint64_t a1)
{
  id v2 = [[NTKDCollectionClient alloc] initWithConnection:*(void *)(a1 + 32)];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000073E4;
  v3[3] = &unk_100060BE0;
  v3[4] = *(void *)(a1 + 40);
  [(NTKDCollectionClient *)v2 setInvalidationHandler:v3];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v2];
  [*(id *)(a1 + 32) _setQueue:*(void *)(*(void *)(a1 + 40) + 64)];
  [*(id *)(a1 + 32) resume];
}

void sub_1000073E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007480;
  v7[3] = &unk_100060AB8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_100007480(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_10000756C(uint64_t a1)
{
  id v2 = +[NTKDCollectionStoreKey keyWithCollectionIdentifier:*(void *)(a1 + 32) deviceUUID:*(void *)(a1 + 40)];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007804;
  v15[3] = &unk_100060C30;
  id v3 = *(void **)(a1 + 56);
  v15[4] = *(void *)(a1 + 48);
  id v16 = v3;
  uint64_t v4 = objc_retainBlock(v15);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKey:v2];
  if (v5)
  {
    id v6 = v5;
    ((void (*)(void *, uint64_t))v4[2])(v4, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_queue_addCheckoutHandler:forStoreKey:", v4, v2);
    id v7 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKey:v2];

    id v6 = _NTKLoggingObjectForDomain();
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v2;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "added new checkout handler pending curation of store key %@", buf, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v2;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "curating store for key %@", buf, 0xCu);
      }

      __int16 v9 = [[NTKDCollectionStore alloc] initWithCollectionIdentifier:*(void *)(a1 + 32) deviceUUID:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 48) + 24) setObject:v9 forKey:v2];
      uint64_t v10 = *(void **)(a1 + 48);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000078D4;
      v11[3] = &unk_100060C58;
      id v12 = v2;
      long long v13 = v9;
      uint64_t v14 = *(void *)(a1 + 48);
      id v6 = v9;
      objc_msgSend(v10, "_queue_curateStore:withCompletion:", v6, v11);
    }
  }
}

void sub_100007804(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) checkoutStore:v3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000078C0;
  v7[3] = &unk_100060C08;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_msgSend(v4, "_onCalloutQueue_async:", v7);
}

uint64_t sub_1000078C0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_1000078D4(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "finished curation for store key %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 48) + 16) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 48) + 24) removeObjectForKey:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 48), "_queue_notifyObserversStoreCreated:", *(void *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_queue_invokeCheckoutHandlersForStoreKey:withStore:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_100007D38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 56) || [*(id *)(a1 + 32) containsObject:v6])
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100007EC0;
    v22 = sub_100007ED0;
    id v23 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    __int16 v8 = *(void **)(a1 + 40);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_100007ED8;
    v15 = &unk_100060C80;
    v17 = &v18;
    uint64_t v9 = v7;
    id v16 = v9;
    [v8 checkoutStoreForCollectionIdentifier:v5 deviceUUID:v6 withHandler:&v12];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v19[5], v10, v11);
    objc_msgSend(*(id *)(a1 + 40), "relinquishStore:", v19[5], v12, v13, v14, v15);

    _Block_object_dispose(&v18, 8);
  }
}

void sub_100007EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007EC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007ED0(uint64_t a1)
{
}

void sub_100007ED8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007FCC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008070;
  v4[3] = &unk_100060CD0;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_100008070(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008120;
  v7[3] = &unk_100060AB8;
  id v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  objc_msgSend(v5, "_onCalloutQueue_async:", v7);
}

id sub_100008120(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStoreHasBeenCreated:*(void *)(a1 + 40)];
}

id sub_1000081C4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

void sub_100008264(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) collectionIdentifier];
  id v4 = [v2 objectForKey:v3];

  if (objc_opt_respondsToSelector()) {
    [v4 resetStoreDefaults:*(void *)(a1 + 40)];
  }
}

id sub_1000083B4(void *a1)
{
  return [*(id *)(a1[4] + 40) setObject:a1[5] forKey:a1[6]];
}

void sub_10000868C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[NTKDCollectionStoreKey keyWithCollectionIdentifier:a2 deviceUUID:a3];
  [v3 addObject:v4];
}

void sub_1000086F0(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  dispatch_semaphore_t v7 = +[NTKDCollectionStoreKey keyWithCollectionIdentifier:v8 deviceUUID:v5];
  LODWORD(v6) = [v6 containsObject:v7];

  if (v6) {
    [*(id *)(a1 + 40) checkoutStoreForCollectionIdentifier:v8 deviceUUID:v5 withHandler:&stru_100060D38];
  }
}

void sub_10000879C(id a1, NTKDCollectionStore *a2)
{
}

void sub_10000884C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectioncoordinator.busy");
}

void sub_100008930(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectioncoordinator.callout");
}

id sub_100008BA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStoreHasBeenCreated:*(void *)(a1 + 40)];
}

void sub_100008E98(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "beginning curation of store %@", buf, 0xCu);
  }

  sub_10000B618(@"com.apple.ntkd.curatecollection.", *(void **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008FEC;
  v7[3] = &unk_100060D88;
  id v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(a1 + 64);
  void v7[4] = *(void *)(a1 + 56);
  id v9 = v6;
  id v8 = *(id *)(a1 + 40);
  [v5 curateCollectionStore:v4 completion:v7];
}

void sub_100008FEC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_async:", *(void *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 40);

  sub_10000B878(@"com.apple.ntkd.curatecollection.", v2);
}

id sub_1000090CC()
{
  v0 = sub_100009124();
  id v1 = [v0 valueForProperty:NRDevicePropertyPairingID];

  return v1;
}

id sub_100009124()
{
  if (qword_1000722F0 != -1) {
    dispatch_once(&qword_1000722F0, &stru_100060DD0);
  }
  v0 = (void *)qword_1000722E8;
  id v1 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  uint64_t v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

void sub_1000091C8(id a1)
{
  qword_1000722E8 = +[NRPairedDeviceRegistry sharedInstance];

  _objc_release_x1();
}

void sub_100009208(void *a1, void *a2, void *a3)
{
}

void sub_10000921C(void *a1, void *a2, void *a3, char a4, void *a5, char a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  if (NTKInternalBuild())
  {
    v15 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009354;
    block[3] = &unk_100060E20;
    char v21 = a6;
    id v17 = v11;
    id v18 = v12;
    char v22 = a4;
    id v19 = v14;
    id v20 = v13;
    dispatch_async(v15, block);
  }
}

void sub_100009354(uint64_t a1)
{
  CFOptionFlags v31 = 0;
  if (!*(unsigned char *)(a1 + 64)
    || (CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"OK", @"Cancel", 0, &v31), !v31))
  {
    BOMCopierNew();
    CFStringRef v36 = @"createPKZip";
    v37 = &__kCFBooleanTrue;
    uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    uint64_t v3 = +[NSFileManager defaultManager];
    uint64_t v4 = NSTemporaryDirectory();
    id v5 = +[NSUUID UUID];
    id v6 = [v5 UUIDString];
    dispatch_semaphore_t v7 = [v4 stringByAppendingPathComponent:v6];

    [v3 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    id v8 = [v7 stringByAppendingPathComponent:@"NanoTimeKit.zip"];
    NTKHomeDirectory();
    id v9 = objc_claimAutoreleasedReturnValue();
    [v9 fileSystemRepresentation];
    uint64_t v10 = v8;
    [(__CFString *)v10 fileSystemRepresentation];
    LODWORD(v6) = BOMCopierCopyWithOptions();

    BOMCopierFree();
    id v11 = +[NSMutableString stringWithString:@"tap-to-radar://new?ComponentName=Watch Faces&ComponentVersion=all&ComponentID=568147&Classification=Serious Bug&Reproducibility=Not Applicable&AutoDiagnostics=phone,watch&Description=Summary: \n\nSteps to Reproduce: "];
    id v12 = +[NSMutableString string];
    id v13 = v12;
    if (v6)
    {
      if (!*(unsigned char *)(a1 + 65)) {
        goto LABEL_10;
      }
      CFStringRef v14 = @"\n\n(NOTE: Please attach contents of /var/mobile/Library/NanoTimeKit from both devices to this radar.)&";
      id v12 = v11;
    }
    else
    {
      CFStringRef v14 = v10;
    }
    [v12 appendString:v14];
LABEL_10:
    v15 = *(void **)(a1 + 48);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000097C0;
    v29[3] = &unk_100060DF8;
    id v16 = v13;
    id v30 = v16;
    [v15 enumerateObjectsUsingBlock:v29];
    if ([v16 length]) {
      [v11 appendFormat:@"&Attachments=%@&", v16];
    }
    [v11 appendFormat:@"Title=%@", *(void *)(a1 + 56)];
    id v17 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v18 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v17];
    id v19 = +[NSURL URLWithString:v18];

    id v20 = +[LSApplicationWorkspace defaultWorkspace];
    id v28 = 0;
    unsigned int v21 = [v20 openURL:v19 withOptions:&__NSDictionary0__struct error:&v28];
    id v22 = v28;

    id v23 = _NTKLoggingObjectForDomain();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v33 = v19;
        v25 = "successfully launched Tap-to-Radar: %@";
        v26 = v23;
        uint32_t v27 = 12;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
    else if (v24)
    {
      *(_DWORD *)buf = 138412546;
      v33 = v19;
      __int16 v34 = 2112;
      id v35 = v22;
      v25 = "failed to launch Tap-to-Radar: %@ %@";
      v26 = v23;
      uint32_t v27 = 22;
      goto LABEL_17;
    }

    goto LABEL_19;
  }
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "user declined to open Tap-to-Radar", buf, 2u);
  }
LABEL_19:
}

void sub_1000097C0(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 path];
  if (v3)
  {
    id v4 = v3;
    if ([*(id *)(a1 + 32) length]) {
      [*(id *)(a1 + 32) appendString:@","];
    }
    [*(id *)(a1 + 32) appendString:v4];
    uint64_t v3 = v4;
  }
}

id sub_100009838()
{
  id v6 = 0;
  id v0 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Bridge" allowPlaceholder:0 error:&v6];
  id v1 = v6;
  if (!v0)
  {
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100042D24();
    }
  }
  uint64_t v3 = [v0 applicationState];
  id v4 = [v3 isInstalled];

  return v4;
}

void sub_1000098FC(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NTKDZIPArchivist sharedArchivist];
  }
  id v28 = v13;
  CFStringRef v14 = +[NSFileManager defaultManager];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100009B6C;
  v37[3] = &unk_100060E48;
  id v15 = v10;
  id v38 = v15;
  id v16 = objc_retainBlock(v37);
  id v17 = NSTemporaryDirectory();
  id v18 = +[NSUUID UUID];
  id v19 = [v18 UUIDString];
  id v20 = [v17 stringByAppendingPathComponent:v19];

  [v14 removeItemAtPath:v20 error:0];
  [v14 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100009BF0;
  v29[3] = &unk_100060F08;
  id v30 = v20;
  id v31 = v14;
  char v36 = a3;
  id v34 = v15;
  id v35 = v16;
  id v32 = v9;
  id v33 = v8;
  id v21 = v8;
  id v22 = v16;
  id v23 = v15;
  id v24 = v9;
  id v25 = v14;
  id v26 = v20;
  [v28 unzipFile:v21 toPath:v26 completionHandler:v29];
}

void sub_100009B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100042D8C();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009BF0(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"face.json"];
    if (![*(id *)(a1 + 40) fileExistsAtPath:v3])
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_31:

      return;
    }
    id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:1 error:0];
    if (!v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_30:

      goto LABEL_31;
    }
    v44[0] = 0;
    id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:v44];
    id v6 = v44[0];
    dispatch_semaphore_t v7 = v6;
    if (v5)
    {
      id v29 = v6;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10000A1AC;
      v36[3] = &unk_100060E70;
      id v8 = v5;
      id v37 = v8;
      id v38 = *(id *)(a1 + 48);
      char v43 = *(unsigned char *)(a1 + 80);
      id v39 = *(id *)(a1 + 32);
      id v40 = *(id *)(a1 + 40);
      id v41 = *(id *)(a1 + 64);
      id v42 = *(id *)(a1 + 72);
      id v9 = objc_retainBlock(v36);
      id v10 = [v8 objectForKeyedSubscript:NTKFaceBundleArgonDescriptorKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = objc_alloc((Class)NTKArgonKeyDescriptor);
        id v12 = objc_msgSend(v11, "argon_initWithJSONRepresentation:", v10);
      }
      else
      {
        id v12 = 0;
      }
      id v20 = [v8 objectForKeyedSubscript:NTKFaceBundleIdentifierKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v21 = +[NTKFaceBundleManager sharedManager];
        uint32_t v27 = v20;
        uint64_t v22 = [v21 faceBundleForBundleIdentifier:v20 onDevice:*(void *)(a1 + 48)];

        id v28 = (void *)v22;
        if (v22)
        {
          ((void (*)(void *))v9[2])(v9);
          int v23 = 1;
        }
        else
        {
          id v24 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
          [v12 fileName];
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_10000A278;
          v34[3] = &unk_100060E98;
          id v35 = (id)objc_claimAutoreleasedReturnValue();
          id v26 = v35;
          [v24 beginRecordingForIdentifier:v26 method:3 completion:v34];
          id v25 = +[NTKDArgonService sharedService];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10000A350;
          v30[3] = &unk_100060EC0;
          id v32 = v9;
          id v33 = *(id *)(a1 + 72);
          id v31 = v12;
          [v25 ingestKeyDescriptor:v31 withMethod:3 completion:v30];

          int v23 = 0;
        }
        dispatch_semaphore_t v7 = v29;

        id v20 = v27;
      }
      else
      {
        ((void (*)(void *))v9[2])(v9);
        int v23 = 1;
        dispatch_semaphore_t v7 = v29;
      }

      if (v23)
      {

LABEL_29:
        goto LABEL_30;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }

    goto LABEL_29;
  }
  if (NTKInternalBuild())
  {
    id v13 = NTKHomeDirectory();
    CFStringRef v14 = [v13 stringByAppendingPathComponent:@"tmp"];
    id v15 = +[NSUUID UUID];
    id v16 = [v15 UUIDString];
    id v17 = [v14 stringByAppendingPathComponent:v16];

    [*(id *)(a1 + 40) createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:0];
    id v18 = [v17 stringByAppendingPathComponent:@"data"];
    if ([*(id *)(a1 + 40) copyItemAtPath:*(void *)(a1 + 56) toPath:v18 error:0])
    {
      id v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100042DF4();
      }

      if (qword_1000722F8 != -1) {
        dispatch_once(&qword_1000722F8, &stru_100060EE0);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10000A1AC(uint64_t a1)
{
  id v3 = +[NTKFace faceWithJSONObjectRepresentation:*(void *)(a1 + 32) forDevice:*(void *)(a1 + 40) forMigration:*(unsigned __int8 *)(a1 + 80) allowFallbackFromInvalidFaceStyle:1];
  if (v3)
  {
    uint64_t v2 = [*(id *)(a1 + 48) stringByAppendingPathComponent:@"Resources"];
    if ([*(id *)(a1 + 56) fileExistsAtPath:v2]) {
      [v3 setResourceDirectory:v2];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_10000A278(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Couldn't record being for %@ - %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10000A350(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) fileName];
    id v4 = +[NSString stringWithFormat:@"couldn't decrypt face JSON from key descriptor %@", v5];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void sub_10000A404(id a1)
{
  id v1 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100042E5C(v1);
  }

  sub_10000921C(@"Clock Face Sync Error", @"A rare error has occurred while syncing clock faces between your watch and phone. Please tap 'OK' to open Tap-to-Radar and file a bug. (Internal alert only.)", @"Sync: New Face Failed to Unzip After Syncing from Gizmo (via Prompt)", 1, &__NSArray0__struct, 1);
}

id sub_10000A480(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NTKDZIPArchivist sharedArchivist];
    }
    id v10 = objc_msgSend(v5, "JSONObjectRepresentation", v8);
    id v32 = 0;
    id v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v32];
    id v12 = v32;

    if (v12)
    {
      id v13 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100042EA0(v5, (uint64_t)v12, v13);
      }
    }
    CFStringRef v14 = NSTemporaryDirectory();
    id v15 = +[NSUUID UUID];
    id v16 = [v15 UUIDString];
    id v17 = [v14 stringByAppendingPathComponent:v16];

    id v18 = +[NSFileManager defaultManager];

    id v31 = 0;
    [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v19 = v31;
    if (v19)
    {
      id v20 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v27 = [v5 faceStyle];
        *(_DWORD *)buf = 134218498;
        id v34 = v27;
        __int16 v35 = 2114;
        char v36 = v17;
        __int16 v37 = 2114;
        id v38 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to create directory at path to backup face data. Face style: %lu - bundle location: %{public}@ - error: %{public}@", buf, 0x20u);
      }
    }
    id v21 = [v17 stringByAppendingPathComponent:@"face.json"];
    [v11 writeToFile:v21 atomically:1];

    uint64_t v22 = [v5 resourceDirectory];
    if (v22)
    {

      int v23 = +[NSFileManager defaultManager];
      id v24 = [v17 stringByAppendingPathComponent:@"Resources"];
      id v30 = 0;
      [v23 copyItemAtPath:v22 toPath:v24 error:&v30];
      id v19 = v30;

      if (v19)
      {
        id v25 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v28 = [v5 faceStyle];
          *(_DWORD *)buf = 134218498;
          id v34 = v28;
          __int16 v35 = 2114;
          char v36 = v22;
          __int16 v37 = 2114;
          id v38 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to link resource path for face. Face style: %lu - resource Path: %{public}@ - error: %{public}@", buf, 0x20u);
        }
      }
    }
    id v9 = [v29 zippedDataForPath:v17 toZipFile:v7];
    [v18 removeItemAtPath:v17 error:0];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_10000A838(uint64_t a1)
{
  key = [@"DateOfLastActivity_" stringByAppendingString:a1];
  id v1 = +[NSDate date];
  CFPreferencesSetAppValue(key, v1, NTKDaemonPreferencesDomain);
}

void sub_10000A8A4(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [@"DateOfLastActivity_" stringByAppendingString:v5];
  id v8 = (void *)CFPreferencesCopyAppValue(v7, NTKDaemonPreferencesDomain);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
  }
  id v9 = +[NSDate date];
  id v10 = v9;
  if (v8 && ([v9 timeIntervalSinceDate:v8], v11 <= a3))
  {
    id v13 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v5;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "not performing activity for identifier %@ because minimum interval %g has not elapsed since last performed (%@)", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    id v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v5;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "performing activity for identifier %@ because minimum interval %g has elapsed since last performed (%@)", (uint8_t *)&v14, 0x20u);
    }

    v6[2](v6);
    sub_10000A838((uint64_t)v5);
  }
}

void sub_10000AB08(id a1)
{
  qword_100072300 = objc_alloc_init(NTKDActivityTracker);

  _objc_release_x1();
}

id sub_10000AC5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginActivity:", *(void *)(a1 + 40));
}

id sub_10000AD00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endActivity:", *(void *)(a1 + 40));
}

void sub_10000ADA8(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    xpc_activity_state_t state = xpc_activity_get_state(v2);
    id v5 = "checkin";
    if (state == 2) {
      id v5 = "run";
    }
    int v6 = 136315138;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "checkin complete with xpc_activity_state_t state = %s", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10000AE80(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_beginActivity:", @"guard-early-jetsam");
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 32);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000AF80;
  handler[3] = &unk_100060A90;
  handler[4] = v7;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
}

id sub_10000AF80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_queue_endActivity:", @"guard-early-jetsam");
}

void sub_10000B444(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "xpc activity handler unexpectedly invoked -- we should have adjusted it further into the future before it fired", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B514;
  block[3] = &unk_100060A90;
  void block[4] = v3;
  dispatch_async(v4, block);
}

id sub_10000B514(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setOrUpdateActivityAndTimer");
}

unsigned char *sub_10000B51C(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "adjust xpc activity criteria timer fired", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  result = *(unsigned char **)(a1 + 32);
  if (result[40]) {
    return objc_msgSend(result, "_queue_setOrUpdateActivityAndTimer");
  }
  return result;
}

void sub_10000B610(void *a1)
{
}

void sub_10000B618(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = sub_10000B6C0();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B714;
  v6[3] = &unk_100060AB8;
  v6[4] = v4;
  v6[5] = v3;
  dispatch_sync(v5, v6);
}

id sub_10000B6C0()
{
  if (qword_100072318 != -1) {
    dispatch_once(&qword_100072318, &stru_100060FB0);
  }
  id v0 = (void *)qword_100072310;

  return v0;
}

void sub_10000B714(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  id v4 = v2;
  id v5 = v4;
  dispatch_time_t v6 = v4;
  if (v3)
  {
    dispatch_time_t v6 = [v4 stringByAppendingString:v3];
  }
  uint64_t v7 = sub_10000BBD4();
  id v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = sub_10000BBD4();
    [v9 setObject:v8 forKey:v6];
  }
  id v14 = v5;
  id v10 = v14;
  if (v3)
  {
    id v10 = [v14 stringByAppendingString:v3];
  }
  id v11 = v10;
  [v11 UTF8String];

  id v12 = (void *)os_transaction_create();
  [v8 addObject:v12];
  id v13 = +[NTKJetsamMonitor sharedJetsamMonitor];
  [v13 incrementTransactionCount];
}

void sub_10000B870(void *a1)
{
}

void sub_10000B878(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = sub_10000B6C0();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B920;
  v6[3] = &unk_100060AB8;
  v6[4] = v4;
  v6[5] = v3;
  dispatch_sync(v5, v6);
}

void sub_10000B920(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = objc_msgSend(v2, "stringByAppendingString:");

    id v3 = (void *)v4;
  }
  id v5 = [v3 stringByAppendingString:@"--30s-extension"];

  id v6 = v5;
  [v6 UTF8String];

  uint64_t v7 = (void *)os_transaction_create();
  id v8 = +[NTKJetsamMonitor sharedJetsamMonitor];
  [v8 incrementTransactionCount];

  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  id v10 = sub_10000B6C0();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BB4C;
  block[3] = &unk_100060A90;
  id v11 = v7;
  id v23 = v11;
  dispatch_after(v9, v10, block);

  id v12 = *(void **)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v14 = v12;
  id v15 = v13;
  id v16 = v14;
  double v17 = v16;
  __int16 v18 = v16;
  if (v15)
  {
    __int16 v18 = [v16 stringByAppendingString:v15];
  }
  id v19 = sub_10000BBD4();
  id v20 = [v19 objectForKey:v18];

  if ([v20 count])
  {
    [v20 removeLastObject];
    id v21 = +[NTKJetsamMonitor sharedJetsamMonitor];
    [v21 decrementTransactionCount];
  }
  else
  {
    id v21 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100042F38();
    }
  }
}

void sub_10000BB4C()
{
  id v0 = +[NTKJetsamMonitor sharedJetsamMonitor];
  [v0 decrementTransactionCount];
}

void sub_10000BB94(id a1)
{
  qword_100072310 = (uint64_t)dispatch_queue_create("com.apple.nanotimekit.daemon-transaction-queue", 0);

  _objc_release_x1();
}

id sub_10000BBD4()
{
  if (qword_100072328 != -1) {
    dispatch_once(&qword_100072328, &stru_100060FD0);
  }
  id v0 = (void *)qword_100072320;

  return v0;
}

void sub_10000BC28(id a1)
{
  qword_100072320 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

void sub_10000BC64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000BDBC()
{
  if (qword_100072338 != -1) {
    dispatch_once(&qword_100072338, &stru_100061018);
  }
  return byte_100072340;
}

__CFString *sub_10000BF74()
{
  if (qword_100072330 != -1) {
    dispatch_once(&qword_100072330, &stru_100060FF8);
  }
  id v0 = off_100071A60;

  return v0;
}

void sub_10000BFC8(id a1)
{
  off_100071A60 = (__CFString *)CFPreferencesCopyAppValue(@"LastSystemVersionMigrated", NTKFacePreferencesDomain);

  _objc_release_x1();
}

void sub_10000C010(id a1)
{
  NTKBuildVersion();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = sub_10000BF74();
  byte_100072340 = [v2 isEqualToString:v1] ^ 1;
}

uint64_t start()
{
  return 0;
}

void sub_10000C35C(id a1)
{
  qword_100072350 = (uint64_t)[objc_alloc((Class)NTKFirstUnlockQueue) initWithName:"com.apple.ntkd.galleryphotosfacescurator"];

  _objc_release_x1();
}

uint64_t sub_10000C558(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) collectionIdentifier];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 40) deviceUUID];
    int v9 = 138412546;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: initialCurationWithCompletion(%@-%@)", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_setStoreDataForStore:", *(void *)(*(void *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setSyncedAlbumDataForStore:", *(void *)(*(void *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_syncStoreWithSyncedAlbum");
  [*(id *)(*(void *)(a1 + 32) + 40) markInitialSetupComplete];
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) collectionIdentifier];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 40) deviceUUID];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: finished initialCurationWithCompletion(%@-%@)", (uint8_t *)&v9, 0x16u);
  }
  sub_10000B870(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C7DC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = sub_1000090CC();
  unsigned int v4 = [v2 isEqual:v3];

  id v5 = _NTKLoggingObjectForDomain();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: collectionTargetLibraryDidUpdate(%@)", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_queue_setSyncedAlbumDataForStore:", *(void *)(*(void *)(a1 + 40) + 40));
    objc_msgSend(*(id *)(a1 + 40), "_queue_syncStoreWithSyncedAlbum");
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: collectionTargetLibraryDidUpdate(%@) ignored; not the active device",
        (uint8_t *)&v9,
        0xCu);
    }
  }
  sub_10000B870(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
}

void sub_10000C9F8(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = objc_msgSend(*(id *)(a1 + 40), "changeDetailsForFetchResult:");
    id v3 = _NTKLoggingObjectForDomain();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 48);
        int v10 = 138412290;
        uint64_t v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: photoLibraryDidChange(%@)", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v6 = [v2 fetchResultAfterChanges];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 32);
      *(void *)(v7 + 32) = v6;

      objc_msgSend(*(id *)(a1 + 32), "_queue_syncStoreWithSyncedAlbum");
    }
    else
    {
      if (v4)
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: photoLibraryDidChange(%@), but no real changes", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  sub_10000B870(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
}

void sub_10000CCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CCF0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (a3)
  {
    uint64_t v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:   face %ld is over the limit, removing %@", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeFaceForUUID:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 40) faceForUUID:v6];
    if (NTKPhotosIsSyncedAlbumPhotosFace())
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
      uint64_t v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(void **)(*(void *)(a1 + 32) + 48);
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:   found synced album photos face, keeping %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:   first face is not a synced album photos face, removing %@", (uint8_t *)&v12, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 40) removeFaceForUUID:v6];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void sub_10000DC1C(id a1)
{
  qword_100072358 = objc_alloc_init(NTKDCompanionGalleryPhotosFacesCurator);

  _objc_release_x1();
}

void sub_10000DF28(id a1)
{
  BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.ntkd.collectionclient.shared", v1);
  id v3 = (void *)qword_100072368;
  qword_100072368 = (uint64_t)v2;
}

void sub_10000E120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

void sub_10000E1F4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
  BOOL v4 = +[NTKDCollectionCoordinator sharedInstance];
  [v4 relinquishStore:*(void *)(*(void *)(a1 + 32) + 24)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10000E3B0(int8x16_t *a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    uint64_t v4 = a1[2].i64[1];
    uint64_t v5 = a1[3].i64[0];
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "register for <%@,%@> with seqId %@", buf, 0x20u);
  }

  id v6 = +[NTKDCollectionCoordinator sharedInstance];
  uint64_t v7 = a1[2].i64[0];
  uint64_t v8 = a1[2].i64[1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E528;
  v11[3] = &unk_1000610C8;
  int8x16_t v10 = a1[3];
  id v9 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  [v6 checkoutStoreForCollectionIdentifier:v7 deviceUUID:v8 withHandler:v11];

  sub_10000B870(@"com.apple.ntkd.collectionclient.register");
}

void sub_10000E528(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E5E4;
  block[3] = &unk_100060C58;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

id sub_10000E5E4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 24) addObserver:*(void *)(a1 + 32) withSeqId:*(void *)(a1 + 48)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeAllObjects", (void)v8);
}

void sub_10000E81C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectionclient.busy");
}

void sub_10000E858(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 24))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = *(void **)(v1 + 32);
    id v4 = [*(id *)(a1 + 40) copy];
    [v3 addObject:v4];
  }
}

void sub_10000E98C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectionclient.busy");
}

id sub_10000EA64(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) collectionIdentifier];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) deviceUUID];
    uint64_t v5 = (void *)v4;
    uint64_t v6 = *(void *)(a1 + 40);
    CFStringRef v7 = @"YES";
    int v8 = *(unsigned __int8 *)(a1 + 48);
    int v10 = 138413058;
    if (!v8) {
      CFStringRef v7 = @"NO";
    }
    long long v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    CFStringRef v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> setSelectedFaceUUID: %@, suppressingCallback: %@", (uint8_t *)&v10, 0x2Au);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setSelectedUUID:suppressingCallbackToObserver:", *(void *)(a1 + 40));
}

id sub_10000EC44(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) collectionIdentifier];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    int v8 = v3;
    __int16 v9 = 2112;
    int v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> setOrderedFaceUUIDs: %@", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) setOrderedUUIDs:*(void *)(a1 + 40)];
}

void sub_10000EE10(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) faceForUUID:a1[5]];
  id v3 = [v2 device];
  id v4 = [v2 faceStyle];
  uint64_t v5 = +[NTKFaceBundleManager sharedManager];
  if (v4 == (id)44)
  {
    uint64_t v6 = [v2 bundleIdentifier];
    id v7 = [v5 faceBundleForBundleIdentifier:v6 onDevice:v3];
  }
  else
  {
    id v8 = objc_msgSend(v5, "faceBundleForFaceStyle:onDevice:", objc_msgSend(v2, "faceStyle"), v3);
  }

  id v9 = [objc_alloc((Class)NTKFaceConfiguration) initWithJSONDictionary:a1[6] editModeMapping:v2 forDevice:v3];
  int v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [*(id *)(a1[4] + 24) collectionIdentifier];
    uint64_t v12 = [*(id *)(a1[4] + 24) deviceUUID];
    uint64_t v13 = a1[5];
    int v14 = 138413058;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    CFStringRef v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@,%@> updateFaceForUUID: %@ withConfiguration: %@", (uint8_t *)&v14, 0x2Au);
  }
  [*(id *)(a1[4] + 24) updateFaceForUUID:a1[5] withConfiguration:v9];
}

id sub_10000F0BC(void *a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1[4] + 24) collectionIdentifier];
    id v4 = [*(id *)(a1[4] + 24) deviceUUID];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> updateFaceForUUID: %@ withResourceDirectory: %@", (uint8_t *)&v8, 0x2Au);
  }
  return [*(id *)(a1[4] + 24) updateFaceForUUID:a1[5] withResourceDirectory:a1[6]];
}

void sub_10000F298(void *a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1[4] + 24) collectionIdentifier];
    id v4 = [*(id *)(a1[4] + 24) deviceUUID];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> upgradeFaceInstanceDescriptor:ForUUID: %@  face: %@ ", (uint8_t *)&v8, 0x2Au);
  }
  id v7 = +[NTKFace faceWithInstanceDescriptor:a1[6]];
  [*(id *)(a1[4] + 24) upgradeFace:v7 forUUID:a1[5]];
}

void sub_10000F490(void *a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1[4] + 24) collectionIdentifier];
    id v4 = [*(id *)(a1[4] + 24) deviceUUID];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> addFaceInstanceDescriptor: %@ face: %@", (uint8_t *)&v8, 0x2Au);
  }
  id v7 = +[NTKFace faceWithInstanceDescriptor:a1[6]];
  [*(id *)(a1[4] + 24) addFace:v7 forUUID:a1[5]];
}

id sub_10000F658(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) collectionIdentifier];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    int v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> removeFaceForUUID: %@", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) removeFaceForUUID:*(void *)(a1 + 40)];
}

void sub_10000F7D0(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) collectionIdentifier];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) deviceUUID];
    int v6 = 138412546;
    int v7 = v3;
    __int16 v8 = 2112;
    __int16 v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> resetCollection", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = +[NTKDCollectionCoordinator sharedInstance];
  [v5 resetStoreDefaults:*(void *)(*(void *)(a1 + 32) + 24)];
}

void sub_10000F97C(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) collectionIdentifier];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    __int16 v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "<%@,%@> flushUpdatesWithIdentifier: %@", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 24);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FAEC;
  v8[3] = &unk_100060AB8;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  [v7 flushWithObserverCallback:v8];
}

void sub_10000FAEC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000FB7C;
  v2[3] = &unk_100060AB8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _onQueue:v2];
}

void sub_10000FB7C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
  [v2 flushCompleteForIdentifier:*(void *)(a1 + 40)];
}

void sub_10000FD38(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    char v36 = v3;
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2112;
    uint64_t v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> load %@ faces (seqId = %@)", buf, 0x2Au);
  }
  int v7 = *(void **)(*(void *)(a1 + 56) + 8);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001007C;
  v32[3] = &unk_100061140;
  id v33 = *(id *)(a1 + 80);
  __int16 v8 = [v7 remoteObjectProxyWithErrorHandler:v32];
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [*(id *)(a1 + 40) copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        CFStringRef v17 = [v11 objectForKey:v16];
        uint64_t v18 = [v17 instanceDescriptor];
        uint64_t v19 = (void *)v18;
        if (v16) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20) {
          [v9 setObject:v18 forKey:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v13);
  }

  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  id v23 = [v9 copy];
  uint64_t v24 = *(void *)(a1 + 48);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001008C;
  v26[3] = &unk_100060B30;
  id v27 = *(id *)(a1 + 80);
  [v8 loadFullCollectionWithOrderedUUIDs:v21 selectedUUID:v22 facesDescriptorsByUUID:v23 seqId:v24 completion:v26];
}

uint64_t sub_10001007C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001008C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001017C(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> update selected uuid to %@ (seqId = %@)", (uint8_t *)&v8, 0x2Au);
  }
  int v7 = [*(id *)(*(void *)(a1 + 56) + 8) remoteObjectProxy];
  [v7 updateSelectedFaceUUID:*(void *)(a1 + 40) seqId:*(void *)(a1 + 48)];
}

void sub_10001037C(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> update ordered uuids to %@ (seqId = %@)", (uint8_t *)&v8, 0x2Au);
  }
  int v7 = [*(id *)(*(void *)(a1 + 56) + 8) remoteObjectProxy];
  [v7 updateOrderedFaceUUIDs:*(void *)(a1 + 40) seqId:*(void *)(a1 + 48)];
}

void sub_1000105A8(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v12 = 138413314;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> update face for UUID %@ to config %@ (seqId = %@)", (uint8_t *)&v12, 0x34u);
  }
  int v8 = [*(id *)(a1 + 32) faceForUUID:*(void *)(a1 + 40)];
  if (v8)
  {
    id v9 = [*(id *)(*(void *)(a1 + 64) + 8) remoteObjectProxy];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v8 configurationJSONRepresentation];
    [v9 updateFaceForUUID:v10 withConfigurationJSONRepresentation:v11 seqId:*(void *)(a1 + 56)];
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100043038(v9);
    }
  }
}

void sub_100010878(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413314;
    __int16 v18 = v3;
    __int16 v19 = 2112;
    __int16 v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> update face for UUID %@ with resource directory %@ (seqId = %@)", buf, 0x34u);
  }
  int v8 = *(void **)(*(void *)(a1 + 64) + 8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010A7C;
  v15[3] = &unk_100061140;
  id v16 = *(id *)(a1 + 72);
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v15];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010A8C;
  v13[3] = &unk_100060B30;
  id v14 = *(id *)(a1 + 72);
  [v9 updateFaceForUUID:v10 withResourceDirectory:v11 seqId:v12 completion:v13];
}

uint64_t sub_100010A7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100010A8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010BA8(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v10 = 138413314;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> upgrade face %@ for UUID %@ (seqId = %@)", (uint8_t *)&v10, 0x34u);
  }
  int v8 = [*(id *)(*(void *)(a1 + 64) + 8) remoteObjectProxy];
  id v9 = [*(id *)(a1 + 40) instanceDescriptor];
  [v8 upgradeFaceInstanceDescriptor:v9 forUUID:*(void *)(a1 + 48) seqID:*(void *)(a1 + 56)];
}

void sub_100010DFC(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v10 = 138413314;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> add face %@ for UUID %@ (seqId = %@)", (uint8_t *)&v10, 0x34u);
  }
  int v8 = [*(id *)(*(void *)(a1 + 64) + 8) remoteObjectProxy];
  id v9 = [*(id *)(a1 + 40) instanceDescriptor];
  [v8 addFaceInstanceDescriptor:v9 forUUID:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56)];
}

void sub_100011054(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    uint64_t v5 = NTKFaceStyleDescription();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413314;
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    __int16 v20 = 2112;
    __int16 v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> remove face of style %@ for UUID %@ (seqId = %@)", buf, 0x34u);
  }
  int v8 = *(void **)(*(void *)(a1 + 56) + 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011260;
  v14[3] = &unk_100061140;
  id v15 = *(id *)(a1 + 64);
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v14];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011270;
  v12[3] = &unk_100060B30;
  id v13 = *(id *)(a1 + 64);
  [v9 removeFaceForUUID:v10 seqId:v11 completion:v12];
}

uint64_t sub_100011260(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011340(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) collectionIdentifier];
    id v4 = [*(id *)(a1 + 32) deviceUUID];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "outgoing to client: <%@,%@> reset collection store ", buf, 0x16u);
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011508;
  v9[3] = &unk_100061140;
  id v10 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011584;
  v7[3] = &unk_100060B30;
  id v8 = *(id *)(a1 + 48);
  [v6 resetClientCollectionWithCompletion:v7];
}

void sub_100011508(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10004307C((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011634(id a1)
{
  id v1 = objc_alloc((Class)NSXPCListener);
  id v2 = [v1 initWithMachServiceName:NTKFaceSnapshotMachService];
  id v3 = (void *)qword_100072378;
  qword_100072378 = (uint64_t)v2;

  id v4 = +[NTKDFaceSnapshotCoordinator sharedInstance];
  [v4 _setupXPCEventListner];
  [(id)qword_100072378 setDelegate:v4];
  [(id)qword_100072378 resume];
}

void sub_100011718(id a1)
{
  qword_100072388 = objc_alloc_init(NTKDFaceSnapshotCoordinator);

  _objc_release_x1();
}

void sub_100011AA0(uint64_t a1)
{
  id v2 = [[NTKDFaceSnapshotClientHandler alloc] initWithConnection:*(void *)(a1 + 32) snapshotController:*(void *)(*(void *)(a1 + 40) + 16)];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011B60;
  v3[3] = &unk_100061270;
  v3[4] = *(void *)(a1 + 40);
  [(NTKDFaceSnapshotClientHandler *)v2 setInvalidationHandler:v3];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v2];
  [*(id *)(a1 + 32) _setQueue:*(void *)(*(void *)(a1 + 40) + 32)];
  [*(id *)(a1 + 32) resume];
}

void sub_100011B60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NTKDFaceSnapshotClientHandler %p invalidated %@", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 24);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011CA0;
  v9[3] = &unk_100060AB8;
  void v9[4] = v6;
  id v10 = v3;
  id v8 = v3;
  dispatch_async(v7, v9);
}

id sub_100011CA0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

BOOL sub_100011DF8(id a1)
{
  return 1;
}

void sub_100011E00(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    BOOL v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updated gallery snapshots - %ld", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100011FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100011FE8(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (!strcmp(string, "LanguageChange")
    || !strcmp(string, "LocaleChange")
    || (uint64_t result = strcmp(string, "SignificantTimeChange"), !result))
  {
    BOOL v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = string;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to %s", (uint8_t *)&v6, 0xCu);
    }

    return (uint64_t)[*(id *)(a1 + 32) _updateAllSnapshots];
  }
  return result;
}

void sub_1000120FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = _NTKLoggingObjectForDomain();
  int v6 = v5;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000430F4((uint64_t)v3, v6);
    }

    if (xpc_activity_set_state(v3, 5))
    {
      uint64_t v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        id v8 = "Prewarm: Snapshotting marked as finished (but failed).";
        id v9 = v7;
        uint32_t v10 = 2;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      xpc_activity_state_t state = xpc_activity_get_state(v3);
      uint64_t v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        xpc_activity_state_t v13 = state;
        id v8 = "Prewarm: Snapshotting failed to mark as finished (but failed) - In State %ld.";
        id v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    xpc_activity_state_t v13 = (xpc_activity_state_t)v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prewarm: Upgrade/Restore Check-In. %@", (uint8_t *)&v12, 0xCu);
  }

  [WeakRetained _prewarmForActivity:v3];
LABEL_14:
}

uint64_t sub_100012448(uint64_t a1)
{
  id v1 = *(_xpc_activity_s **)(a1 + 32);
  if (!v1 || !xpc_activity_should_defer(v1)) {
    return 1;
  }
  BOOL v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Prewarm: Snapshotting asked to defer.", v4, 2u);
  }

  return 0;
}

void sub_1000124D8(uint64_t a1, int a2)
{
  int v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Prewarm: Snapshotting is done.", (uint8_t *)&v12, 2u);
  }

  BOOL v5 = *(_xpc_activity_s **)(a1 + 32);
  if (a2)
  {
    if (xpc_activity_set_state(v5, 5))
    {
      int v6 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        uint64_t v7 = "Prewarm: Snapshotting successfully finished.";
LABEL_10:
        id v8 = v6;
        uint32_t v9 = 2;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
    int v6 = _NTKLoggingObjectForDomain();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v12 = 134217984;
    xpc_activity_state_t v13 = state;
    uint64_t v7 = "Prewarm: Snapshotting failed to mark as finished - In State %ld.";
LABEL_15:
    id v8 = v6;
    uint32_t v9 = 12;
    goto LABEL_16;
  }
  if (!xpc_activity_set_state(v5, 3))
  {
    xpc_activity_state_t v11 = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
    int v6 = _NTKLoggingObjectForDomain();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v12 = 134217984;
    xpc_activity_state_t v13 = v11;
    uint64_t v7 = "Prewarm: Snapshotting failed to mark as deferred - In State %ld.";
    goto LABEL_15;
  }
  int v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    uint64_t v7 = "Prewarm: Snapshotting successfully deferred.";
    goto LABEL_10;
  }
LABEL_17:
}

void sub_100012B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012BB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Snapshot delay elapsed; starting", v4, 2u);
    }

    id v3 = [WeakRetained queue];
    dispatch_activate(v3);

    sub_10000B870(@"delaying-snapshots");
  }
}

void sub_100012C5C(uint64_t a1)
{
  BOOL v2 = +[NTKDCollectionCoordinator sharedInstance];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100013340;
  v31[3] = &unk_100061398;
  id v32 = *(id *)(a1 + 32);
  [v2 enumerateAllStoresWithHandler:v31];

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"_loadComplicationCollection" name:CLKActiveDeviceChangedNotification object:0];

  [*(id *)(a1 + 32) _loadComplicationCollection];
  if (NTKDebugRegenerateAllSnapshots())
  {
    int v4 = +[NSMutableDictionary dictionary];
  }
  else
  {
    id v5 = objc_alloc((Class)NSData);
    int v6 = sub_1000181E0();
    id v7 = [v5 initWithContentsOfFile:v6 options:1 error:0];

    id v8 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v7 error:0];
    [v8 setDecodingFailurePolicy:0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    xpc_activity_state_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    int v4 = [v8 decodeObjectOfClasses:v11 forKey:NSKeyedArchiveRootObjectKey];
    if (v4)
    {
      objc_opt_class();
      objc_opt_class();
      NTKValidateDictionary();
    }

    if (!v4)
    {
      int v4 = +[NSMutableDictionary dictionary];
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v4);

  id v12 = objc_alloc((Class)NSData);
  xpc_activity_state_t v13 = sub_1000182F4();
  id v14 = [v12 initWithContentsOfFile:v13 options:1 error:0];

  id v15 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v14 error:0];
  [v15 setDecodingFailurePolicy:0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [v15 decodeObjectOfClasses:v17 forKey:NSKeyedArchiveRootObjectKey];
  if (v18)
  {
    objc_opt_class();
    NTKValidateArray();
  }

  uint64_t v19 = *(void *)(a1 + 32);
  __int16 v20 = *(void **)(v19 + 16);
  *(void *)(v19 + 16) = v18;

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000133C4;
  v29[3] = &unk_100060A90;
  id v30 = *(id *)(a1 + 32);
  sub_10000A8A4(@"CleanSnapshotCache", v29, 432000.0);
  __int16 v21 = [*(id *)(a1 + 32) _currentContext];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  __int16 v22 = *(void **)(*(void *)(a1 + 32) + 24);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100013480;
  v26[3] = &unk_1000613C0;
  id v23 = v21;
  id v27 = v23;
  long long v28 = &v33;
  [v22 enumerateKeysAndObjectsUsingBlock:v26];
  if (*((unsigned char *)v34 + 24))
  {
    __int16 v24 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "update all snapshots as context is stale", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllSnapshots");
  }

  _Block_object_dispose(&v33, 8);
}

void sub_100013170(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100013340(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  CFStringRef v5 = (const __CFString *)[v3 _preferencesKeyForCollectionStore:v4];
  id v6 = (id)CFPreferencesCopyAppValue(v5, NTKDaemonPreferencesDomain);
  [v4 addObserver:*(void *)(a1 + 32) withSeqId:v6];
}

id sub_1000133C4(uint64_t a1)
{
  BOOL v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = 5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clean snapshot caches due not having been cleaned in the last %lu days", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_cleanCache");
}

void sub_100013480(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (![v6 localeMatchesContext:*(void *)(a1 + 32)]
    || ([v6 buildVersionMatchesContext:*(void *)(a1 + 32)] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_1000135D8(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

id sub_100013810(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllSnapshots");
}

void sub_10001392C(uint64_t a1)
{
  BOOL v2 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "key", (void)v9);
        [v2 addObject:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_cleanCacheExcludingKeys:", v2);
  sub_10000A838(@"CleanAllFaceSnapshots");
}

uint64_t sub_100013B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

uint64_t sub_100014258(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_100014270(uint64_t a1)
{
  BOOL v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]_block_invoke_2";
    *(_WORD *)&buf[22] = 2112;
    v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: %s operation block started with face: %@", buf, 0x20u);
  }
  uint64_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v51 = sub_1000147A4;
  v52 = sub_1000147B4;
  id v53 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.NTKFaceSnapshotService"];
  id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NTKFaceSnapshotServiceProtocol];
  [*(id *)(*(void *)&buf[8] + 40) setRemoteObjectInterface:v7];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000147BC;
  v32[3] = &unk_100061460;
  char v39 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v33 = v8;
  uint64_t v34 = v9;
  __int16 v37 = v40;
  id v36 = *(id *)(a1 + 56);
  id v38 = buf;
  long long v10 = v6;
  uint64_t v35 = v10;
  long long v11 = objc_retainBlock(v32);
  [*(id *)(*(void *)&buf[8] + 40) resume];
  long long v12 = *(void **)(*(void *)&buf[8] + 40);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100014C0C;
  v30[3] = &unk_100061140;
  xpc_activity_state_t v13 = v11;
  id v31 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v30];
  id v15 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v42 = 138413058;
    char v43 = v17;
    __int16 v44 = 2080;
    v45 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]_block_invoke";
    __int16 v46 = 2112;
    uint64_t v47 = v18;
    __int16 v48 = 2112;
    v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: %s face: %@ calling proxy: %@", v42, 0x2Au);
  }
  uint64_t v19 = [*(id *)(a1 + 40) instanceDescriptor];
  __int16 v20 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 48);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100014C90;
  v27[3] = &unk_100061488;
  v27[4] = *(void *)(a1 + 32);
  id v28 = v20;
  __int16 v22 = v13;
  id v29 = v22;
  [v14 provideSnapshotOfFaceInstanceDescriptor:v19 options:v21 completion:v27];
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v23 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    uint64_t v26 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v42 = 138412802;
    char v43 = v25;
    __int16 v44 = 2080;
    v45 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]_block_invoke";
    __int16 v46 = 2112;
    uint64_t v47 = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: %s face: %@ Done!", v42, 0x20u);
  }
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(buf, 8);
}

void sub_100014758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000147A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000147B4(uint64_t a1)
{
}

void sub_1000147BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v8 = NTKCacheSnapshotOfFace();
      uint64_t v9 = (void *)v8;
      if (v8) {
        long long v10 = (void *)v8;
      }
      else {
        long long v10 = v6;
      }
      id v7 = v10;
    }
  }
  else
  {
    id v7 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001491C;
  block[3] = &unk_100061438;
  int8x16_t v14 = *(int8x16_t *)(a1 + 32);
  id v11 = (id)v14.i64[0];
  int8x16_t v17 = vextq_s8(v14, v14, 8uLL);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v12 = (id)v15;
  long long v20 = v15;
  char v22 = a2;
  id v18 = v7;
  uint64_t v21 = *(void *)(a1 + 72);
  id v19 = *(id *)(a1 + 48);
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10001491C(uint64_t a1)
{
  BOOL v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 138413058;
    id v18 = v4;
    __int16 v19 = 2080;
    long long v20 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]_block_invoke_2";
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 1024;
    int v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: %s face: %@ callbackExecuted: %d.", buf, 0x26u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014AF4;
    block[3] = &unk_100061410;
    id v14 = *(id *)(a1 + 64);
    char v16 = *(unsigned char *)(a1 + 88);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 80);
    id v12 = v9;
    uint64_t v15 = v10;
    id v13 = *(id *)(a1 + 56);
    dispatch_async(v8, block);
  }
}

void sub_100014AF4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  if (NTKUseComplicationSnapshotService())
  {
    id v4 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v4);
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014C04;
    block[3] = &unk_100060A90;
    id v7 = *(id *)(a1 + 40);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100014C04(uint64_t a1)
{
}

void sub_100014C0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100043228((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014C90(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138413314;
    id v11 = v8;
    __int16 v12 = 2080;
    id v13 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %s face: %@ provideSnapshotOfFace competionBlock: %d %@.", (uint8_t *)&v10, 0x30u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100014FD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 selectedUUID];
  if (v4
    || ([v3 orderedUUIDs],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 firstObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    int v6 = [v3 faceForUUID:v4];
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 name];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "snapshot selected face:%@", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) snapshotFace:v6 options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000432E4((uint64_t)v3, a1, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_100015228(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateAddableAndGallerySnapshotsWithContinuationBlock:finishedBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_1000156DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose((const void *)(v14 - 208), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10001572C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collectionIdentifier];
  unsigned int v5 = [v4 isEqualToString:NTKCollectionIdentifierLibraryFaces];

  int v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 collectionIdentifier];
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = v5 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prewarm: Checking if %@ needs snapshot prewarm. %lu", (uint8_t *)&v8, 0x16u);
  }
  if ((v5 & 1) == 0)
  {
    [*(id *)(a1 + 32) checkoutStore:v3];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t sub_10001585C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100015874(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000158A0(uint64_t a1)
{
}

void sub_1000158A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015988;
  v7[3] = &unk_100061578;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 72);
  id v11 = v3;
  uint64_t v13 = v4;
  id v8 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  objc_msgSend(v2, "_onQueue_async:", v7);
}

void sub_100015988(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 && ((*(uint64_t (**)(void))(v2 + 16))() & 1) == 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "relinquishStore:");
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      __int16 v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
  else
  {
    id v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) collectionIdentifier];
      *(_DWORD *)buf = 138412290;
      char v43 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Prewarm: Snapshotting next face in store %@….", buf, 0xCu);
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) firstObject];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) removeObjectAtIndex:0];
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) faceForUUID:v5];
      id v7 = [v6 device];
      id v8 = [v7 nrDeviceUUID];
      id v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) deviceUUID];
      unsigned __int8 v10 = [v8 isEqual:v9];

      if (v10)
      {
        id v11 = +[NTKFaceSnapshotter defaultModernSnapshotOptions];
        id v12 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) collectionIdentifier];
          *(_DWORD *)buf = 138412546;
          char v43 = v13;
          __int16 v44 = 2112;
          id v45 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Prewarm: Store %@ will snapshot face %@.", buf, 0x16u);
        }
        long long v14 = *(void **)(a1 + 48);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100015F30;
        v38[3] = &unk_100061550;
        uint64_t v40 = *(void *)(a1 + 72);
        id v15 = v6;
        uint64_t v16 = *(void *)(a1 + 80);
        id v39 = v15;
        uint64_t v41 = v16;
        [v14 snapshotFace:v15 options:v11 completion:v38];
      }
      else
      {
        uint64_t v35 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_100043370(v6, a1 + 72, v35);
        }

        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) + 16))();
      }
    }
    else
    {
      __int16 v21 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) collectionIdentifier];
        *(_DWORD *)buf = 138412290;
        char v43 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Prewarm: Store %@ finished.", buf, 0xCu);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "relinquishStore:");
        uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
        int v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = 0;
      }
      if ([*(id *)(a1 + 40) count])
      {
        uint64_t v25 = [*(id *)(a1 + 40) objectAtIndex:0];
        uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
        id v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        [*(id *)(a1 + 40) removeObjectAtIndex:0];
        id v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) orderedUUIDs];
        id v29 = [v28 mutableCopy];
        uint64_t v30 = *(void *)(*(void *)(a1 + 88) + 8);
        id v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        id v32 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) collectionIdentifier];
          id v34 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
          *(_DWORD *)buf = 138412546;
          char v43 = v33;
          __int16 v44 = 2048;
          id v45 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Prewarm: Store %@ has %lu face UUIDs to enumerate.", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8);
        __int16 v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = 0;
      }
    }
  }
}

void sub_100015F30(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1[5] + 8) + 40) collectionIdentifier];
    uint64_t v6 = a1[4];
    int v7 = 138412802;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Prewarm: Store %@ generated snapshot %@ face %@.", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
}

void sub_1000160D4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016158;
  block[3] = &unk_100060B30;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100016158(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100016360(uint64_t a1)
{
  return [*(id *)(a1 + 32) faceSnapshotChangedForKey:*(void *)(a1 + 40)];
}

void sub_10001645C(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)[*(id *)(a1 + 32) _preferencesKeyForCollectionStore:*(void *)(a1 + 40)];
  id v3 = (id)CFPreferencesCopyAppValue(v2, NTKDaemonPreferencesDomain);
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) withSeqId:v3];
}

id sub_1000165B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

void sub_100016A78(void *a1)
{
  CFStringRef v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating snapshots due to loading all faces for collection store", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100016B5C;
  v5[3] = &unk_1000615C8;
  id v3 = (void *)a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

id sub_100016B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSnapshotForFace:a3 inStore:*(void *)(a1 + 40)];
}

void sub_100016F70(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017024;
  v4[3] = &unk_100061618;
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 _enumerateAllFacesForDeviceUUID:v3 block:v4];
}

void sub_100017024(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000170E0;
  v6[3] = &unk_1000615F0;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  [v4 _enumerateRemoteComplicationsForFace:v5 block:v6];
}

void sub_1000170E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 clientIdentifier];
  unsigned int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 clientIdentifier];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to updated template for client identifier %@ and face %@", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 48), "_queue_updateSnapshotForFace:complicationTemplateChanged:", *(void *)(a1 + 40), 1);
  }
}

void sub_100017260(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001739C;
  v4[3] = &unk_100061640;
  v4[4] = *(void *)(a1 + 32);
  void v4[5] = &v5;
  sub_10000A8A4(@"CleanAllFaceSnapshots", v4, 86400.0);
  if (!*((unsigned char *)v6 + 24) && *(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    CFStringRef v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "updating all snapshots as updatedSnapshotsDueToMinimalTimeInterval has not elapsed and needToupdateForFacesWithThirdPartyComplications", v3, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllSnapshots");
  }
  _Block_object_dispose(&v5, 8);
}

void sub_100017380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_10001739C(uint64_t a1)
{
  CFStringRef v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting flag to clean all snapshots due to not having been cleaned in last day", v4, 2u);
  }

  id result = objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllSnapshots");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_100017930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100017988(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 orderedUUIDs];
  id v5 = [v4 mutableCopy];

  id v6 = [v3 selectedUUID];
  if (v6 && [v5 indexOfObject:v6] != (id)0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", 0, objc_msgSend(v5, "indexOfObject:", v6));
  }
  uint64_t v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_msgSend(v3, "faceForUUID:", v13, (void)v21);
        if (v15) {
          [v7 addObject:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [v3 deviceUUID];
  unsigned int v17 = [v16 isEqual:*(void *)(a1 + 32)];
  __int16 v18 = [v3 collectionIdentifier];
  unsigned int v19 = [v18 isEqualToString:NTKCollectionIdentifierLibraryFaces];

  if (v19 && v17)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  }
  else if (v19)
  {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v16];
  }
  else
  {
    long long v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v16];
    if (!v20)
    {
      long long v20 = objc_opt_new();
      [*(id *)(a1 + 48) setObject:v20 forKeyedSubscript:v16];
    }
    objc_msgSend(v20, "addObjectsFromArray:", v7, (void)v21);
  }
}

void sub_100017C08(uint64_t a1, void *a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v10 = objc_msgSend(*(id *)(a1 + 32), "_queue_snapshotObjectsForFace:", v8, (void)v11);
        [*(id *)(a1 + 40) addObjectsFromArray:v10];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

id sub_1000181E0()
{
  id v0 = NTKCacheDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"SnapshotContexts.archive"];

  return v1;
}

id sub_1000182F4()
{
  id v0 = NTKCacheDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"SnapshotKeysWithBlankComplications.archive"];

  return v1;
}

void sub_10001841C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 orderedUUIDs];
  id v5 = [v4 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(v3, "faceForUUID:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v10), (void)v17);
        long long v12 = v11;
        if (v11)
        {
          long long v13 = *(void **)(a1 + 32);
          long long v14 = [v11 dailySnapshotKey];
          [v13 addObject:v14];

          if ([v12 wantsUnadornedSnapshot])
          {
            id v15 = *(void **)(a1 + 32);
            uint64_t v16 = [v12 unadornedSnapshotKey];
            [v15 addObject:v16];
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

void sub_100018740(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    sub_10000B610(@"com.apple.ntkd.facesnapshotcontroller.asyncmappedimagecachework");
    id v4 = NTKSnapshotMappedImageCache();
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100018804;
    v5[3] = &unk_100060A90;
    id v6 = v3;
    [v4 removeImageForKey:v6 withCompletion:v5];
  }
}

void sub_100018804(uint64_t a1)
{
  CFStringRef v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing snapshot for key: %@", (uint8_t *)&v4, 0xCu);
  }

  sub_10000B870(@"com.apple.ntkd.facesnapshotcontroller.asyncmappedimagecachework");
}

void sub_1000188C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v3];
    objc_msgSend(*(id *)(a1 + 40), "_queue_cleanContexts");
  }
}

void sub_1000189E4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.facesnapshotcontroller.asyncwork");
}

void sub_100018AC8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.facesnapshotcontroller.asyncobservercallback");
}

void sub_100018CD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 deviceUUID];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(v3, "orderedUUIDs", 0);
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [v3 faceForUUID:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

void sub_100018ED8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  if ([v3 complicationType] == (id)31) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_100019018(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSnapshotForFace:inStore:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

BOOL sub_1000195BC(id a1, _NTKDFaceSnapshotObject *a2, unint64_t a3, BOOL *a4)
{
  return [(_NTKDFaceSnapshotObject *)a2 snapshotStale];
}

void sub_1000195C4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _endSnapshottingActivityDidTakeSnapshot:a2];
  id v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  [v3 setDevice:0];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  id v6 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = 0;

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    (*(void (**)(void))(v9 + 16))();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_unsafeClaimAutoreleasedReturnValue((id)(*(uint64_t (**)(void))(*(void *)(*((void *)&v30 + 1)
                                                                                             + 8 * (void)v14)
                                                                                 + 16))());
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    id v16 = *(id *)(*(void *)(a1 + 32) + 88);
    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(void **)(v17 + 88);
    *(void *)(v17 + 88) = 0;

    id v19 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v20 = *(void *)(a1 + 32);
    long long v21 = *(void **)(v20 + 96);
    *(void *)(v20 + 96) = 0;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100019894;
    v28[3] = &unk_100060A90;
    id v22 = v19;
    id v29 = v22;
    long long v23 = objc_retainBlock(v28);
    if ([v16 count])
    {
      long long v24 = *(void **)(a1 + 32);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100019990;
      v25[3] = &unk_100061208;
      v25[4] = v24;
      id v26 = v16;
      id v27 = v23;
      objc_msgSend(v24, "_onQueue_async:", v25);
    }
    else
    {
      ((void (*)(void *))v23[2])(v23);
    }
  }
}

void sub_100019894(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_unsafeClaimAutoreleasedReturnValue((id)(*(uint64_t (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v5)
                                                                                           + 16))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v5)));
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

id sub_100019990(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSnapshots:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_1000199A0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanContexts");
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_100019C08(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] < 2)
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, (char *)objc_msgSend(*(id *)(a1 + 32), "count") - 1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_queue_snapshotFaces:completion:", v3, *(void *)(a1 + 48));
  }
}

void sub_100019CB4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019DB0;
  v9[3] = &unk_100061820;
  void v9[4] = v6;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v8 = v5;
  objc_msgSend(v6, "_onQueue_async:", v9);
}

void sub_100019DB0(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 80)) {
      goto LABEL_7;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 80)) {
      goto LABEL_7;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanSnapshotKeysWithBlankComplications");
LABEL_7:
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "writing snapshot to disk", buf, 2u);
  }

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 64), 0xFFFFFFFFFFFFFFFFLL);
  sub_10000B610(@"com.apple.ntkd.facesnapshotcontroller.asyncmappedimagecachework");
  id v3 = NTKSnapshotMappedImageCache();
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100019F8C;
  id v14 = &unk_1000617D8;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v15 = v6;
  uint64_t v16 = v7;
  id v17 = v8;
  id v18 = *(id *)(a1 + 56);
  [v3 setImage:v6 forKey:v5 withCompletion:&v11];

  long long v9 = *(void **)(*(void *)(a1 + 32) + 24);
  id v10 = objc_msgSend(*(id *)(a1 + 64), "context", v11, v12, v13, v14);
  [v9 setObject:v10 forKey:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanContexts");
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1000617F8);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_100019F8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = _NTKLoggingObjectForDomain();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "did write snapshot to disk", v8, 2u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_100043494(v6);
    }
  }
  if (NTKDebugWriteSnapshotsToDiskAsPNGs()) {
    [*(id *)(a1 + 40) _writeImageToDisk:v4 imageName:*(void *)(a1 + 48)];
  }
  uint64_t v7 = NTKSnapshotMappedImageCache();
  [v7 _noteExternalChangeForKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) _notifyFaceSnapshotChangedForKey:*(void *)(a1 + 48)];
  sub_10000B870(@"com.apple.ntkd.facesnapshotcontroller.asyncmappedimagecachework");
  [*(id *)(a1 + 56) logCurrentInterval];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 64));
}

void sub_10001A094(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:CLKClearCacheRequestNotification object:0];
}

void sub_10001AC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ACC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001ACD0(uint64_t a1)
{
}

id sub_10001ACD8()
{
  if (qword_1000723C0 != -1) {
    dispatch_once(&qword_1000723C0, &stru_100061C90);
  }
  id v0 = (void *)qword_1000723B8;

  return v0;
}

id sub_10001AD2C(uint64_t a1)
{
  id v2 = sub_10001B434();
  id v3 = sub_1000254FC(v2);

  id v4 = [v3 mutableCopy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) indexOfObject:NTKCollectionIdentifierLibraryFaces];
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = result;
    long long v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v9 exchangeObjectAtIndex:0 withObjectAtIndex:v8];
  }
  return result;
}

uint64_t sub_10001ADEC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_10001AE34();

  return _objc_release_x1();
}

id sub_10001AE34()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = +[NSFileManager defaultManager];
  id v2 = sub_1000252C0();
  id v3 = [v1 contentsOfDirectoryAtPath:v2 error:0];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        if (v8) {
          [v0 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v0;
}

id sub_10001AFAC(uint64_t a1)
{
  id v2 = sub_10001B3B8(*(void **)(a1 + 32));
  id v3 = sub_1000254FC(v2);

  id v4 = [v3 mutableCopy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) indexOfObject:NTKCollectionIdentifierLibraryFaces];
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = result;
    long long v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v9 exchangeObjectAtIndex:0 withObjectAtIndex:v8];
  }
  return result;
}

void sub_10001B114(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned face collection stores...", buf, 2u);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = sub_10001AE34();
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138412290;
    long long v18 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9, v18, (void)v19) & 1) == 0)
        {
          long long v10 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            long long v24 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "...deleting face collection stores for device uuid %@", buf, 0xCu);
          }

          long long v11 = +[NSFileManager defaultManager];
          long long v12 = sub_10001B3B8(v9);
          [v11 removeItemAtPath:v12 error:0];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  long long v13 = sub_10001AE34();
  id v14 = [v13 count];

  if (v14)
  {
    id v15 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "...deleting GLOBAL face collection stores", buf, 2u);
    }

    uint64_t v16 = +[NSFileManager defaultManager];
    id v17 = sub_10001B434();
    [v16 removeItemAtPath:v17 error:0];
  }
}

id sub_10001B3B8(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000252C0();
  id v3 = [v1 UUIDString];

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id sub_10001B434()
{
  id v0 = sub_10002526C();
  id v1 = [v0 stringByAppendingPathComponent:@"GlobalStores"];

  return v1;
}

void sub_10001B4DC(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ntkd.collectionstore.shared", v3);
  id v2 = (void *)qword_100072398;
  qword_100072398 = (uint64_t)v1;
}

void sub_10001B594(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ntkd.collectionstore.observers", v3);
  id v2 = (void *)qword_1000723A8;
  qword_1000723A8 = (uint64_t)v1;
}

void sub_10001BCB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint8_t buf)
{
  if (a2 == 1)
  {
    id v32 = objc_begin_catch(exception_object);
    if (a13)
    {
      long long v33 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = [a10 stringByAppendingPathComponent:@"deleted.plist"];
        uint64_t v35 = [v32 reason];
        sub_1000434D8(v34, v35, &buf, v33);
      }
    }
    [v31 removeAllObjects];

    objc_end_catch();
    JUMPOUT(0x10001BB84);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001BD88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    id v3 = *(id *)(v1 + 16);
    id v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:v3 error:0];

    uint64_t v1 = *(void *)(a1 + 32);
  }
  id v5 = *(id *)(v1 + 16);
  id v8 = +[NSFileManager defaultManager];
  [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
  id v6 = [v5 stringByAppendingPathComponent:@"Faces"];
  [v8 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v7 = [v5 stringByAppendingPathComponent:@"Resources"];

  [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
}

id sub_10001BEB4(uint64_t a1)
{
  uint64_t v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:0];
  id v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 integerValue]);

  return v2;
}

void sub_10001BFE8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    if (([*(id *)(a1 + 48) isEqual:v2[3]] & 1) == 0)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
      sub_10001BEB4((uint64_t)v4);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v5 = sub_10001C0DC(*(void **)(a1 + 48), v8);
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      if (v5) {
        objc_msgSend(v6, "_queue_loadFullCollectionForObserver:completion:", v7, 0);
      }
      else {
        objc_msgSend(v6, "_queue_playbackChangesForObserver:fromSeqId:", v7, *(void *)(a1 + 48));
      }
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    objc_msgSend(v2, "_queue_loadFullCollectionForObserver:completion:", v3, 0);
  }
}

BOOL sub_10001C0DC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 unsignedIntegerValue];
  BOOL v5 = [v3 unsignedIntegerValue];

  if (v4 <= v5) {
    id v6 = v5;
  }
  else {
    id v6 = v4;
  }
  if (v4 >= v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v4;
  }
  if ((unint64_t)(v6 - v7) >= 0x7FFFFFFFFFFFFFFFLL) {
    return v4 > v5;
  }
  else {
    return v4 < v5;
  }
}

id sub_10001C1E0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

id sub_10001C284(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

id sub_10001C354(id *a1)
{
  objc_storeStrong((id *)a1[4] + 5, a1[5]);
  id v2 = a1[4];
  if (a1[6])
  {
    if (([a1[6] isEqual:v2[3]] & 1) == 0) {
      objc_msgSend(a1[4], "_queue_playbackChangesForObserver:fromSeqId:", a1[5], a1[6]);
    }
  }
  else
  {
    objc_msgSend(v2, "_queue_loadFullCollectionForObserver:completion:", a1[5], 0);
  }
  id v3 = a1[4];
  id v4 = a1[6];

  return objc_msgSend(v3, "_queue_clearRemovalsThroughSeqId:", v4);
}

void sub_10001C444(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10001C500(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathComponent:@"version.string"];
  id v3 = +[NSString stringWithContentsOfFile:v2 encoding:4 error:0];

  [v3 floatValue];
  int v5 = v4;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void sub_10001C600(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v3 + 96);
    uint64_t v4 = *(void *)(v3 + 104);
    double v6 = *(float *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2048;
    double v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "store<%@,%@> set version: %f", buf, 0x20u);
  }

  double v7 = *(float *)(a1 + 40);
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  long long v9 = +[NSString stringWithFormat:@"%f", *(void *)&v7];
  long long v10 = [v8 stringByAppendingPathComponent:@"version.string"];

  [v9 writeToFile:v10 atomically:1 encoding:4 error:0];
}

void sub_10001C858(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathComponent:@"build-version.string"];
  uint64_t v3 = +[NSString stringWithContentsOfFile:v2 encoding:4 error:0];

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001CA44(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v3 + 96);
    uint64_t v5 = *(void *)(v3 + 104);
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "store<%@,%@> set build version: %@", (uint8_t *)&v11, 0x20u);
  }

  double v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  id v9 = v7;
  long long v10 = [v8 stringByAppendingPathComponent:@"build-version.string"];
  [v9 writeToFile:v10 atomically:1 encoding:4 error:0];
}

uint64_t sub_10001CCCC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 57);
  return result;
}

uint64_t sub_10001CD50(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 57) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t sub_10001CE0C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

void sub_10001CE8C(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v3 + 96);
    uint64_t v4 = *(void *)(v3 + 104);
    int v10 = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "store<%@,%@> mark initial setup complete", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 56))
  {
    *(unsigned char *)(v6 + 56) = 1;
    id v7 = *(id *)(*(void *)(a1 + 32) + 16);
    id v8 = +[NSData data];
    id v9 = [v7 stringByAppendingPathComponent:@"setup-complete"];

    [v8 writeToFile:v9 atomically:1];
  }
}

id sub_10001D074(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_queue_isEmpty");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10001D198(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) orderedUUIDs];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001D2F0(uint64_t a1)
{
}

id sub_10001D3D4(void *a1)
{
  id result = [*(id *)(a1[4] + 64) faceStyleForUUID:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_10001D51C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001D6AC(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)v2[2];
  id v8 = [v2 deviceUUID];
  uint64_t v5 = sub_10001D734(v4, v3, v8, 1);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

NSObject *sub_10001D734(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = objc_alloc((Class)NSData);
  uint64_t v11 = sub_1000253F4(v7, v8);
  id v25 = 0;
  id v12 = [v10 initWithContentsOfFile:v11 options:1 error:&v25];
  id v13 = v25;

  if (v12) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  if (v14)
  {
    if (v12)
    {
      id v24 = v13;
      uint64_t v16 = +[NSJSONSerialization JSONObjectWithData:v12 options:0 error:&v24];
      id v15 = v24;

      id v13 = v15;
      if (v16) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (v13)
    {
      long long v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000435B4();
      }
      long long v18 = 0;
      goto LABEL_21;
    }
LABEL_17:
    if (v9) {
      +[CLKDevice deviceForNRDeviceUUID:v9];
    }
    else {
    long long v20 = +[CLKDevice currentDevice];
    }
    long long v21 = +[NTKFace faceWithJSONObjectRepresentation:v16 forDevice:v20 forMigration:a4 allowFallbackFromInvalidFaceStyle:1];

    long long v22 = sub_10001F444(v7, v8);
    [v21 setResourceDirectory:v22];
    long long v19 = v21;

    long long v18 = v19;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v16 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10004354C();
  }
  long long v18 = 0;
LABEL_22:

  return v18;
}

void sub_10001DCD0(uint64_t a1)
{
  id v2 = +[NSMutableSet set];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) orderedUUIDs];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DDA8;
  v5[3] = &unk_100061978;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];

  sub_10001DE38(*(void **)(*(void *)(a1 + 32) + 16), v4);
}

void sub_10001DDA8(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v7 resourceDirectory];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [v3 lastPathComponent];
    [v5 addObject:v6];
  }
}

void sub_10001DE38(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSFileManager defaultManager];
  id v17 = v3;
  id v6 = [v3 stringByAppendingPathComponent:@"Resources"];
  long long v18 = v5;
  [v5 contentsOfDirectoryAtPath:v6 error:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 lastPathComponent];
        id v13 = [v6 stringByAppendingPathComponent:v11];
        LOBYTE(v11) = [v4 containsObject:v12];
        BOOL v14 = _NTKLoggingObjectForDomain();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_RemoveResourceDirectoriesExceptUUIDs: Keeping %@", buf, 0xCu);
          }
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_RemoveResourceDirectoriesExceptUUIDs: Removing %@", buf, 0xCu);
          }

          id v20 = 0;
          [v18 removeItemAtPath:v13 error:&v20];
          BOOL v14 = v20;
          if (v14)
          {
            uint64_t v16 = _NTKLoggingObjectForDomain();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v26 = v13;
              __int16 v27 = 2112;
              id v28 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not remove Resources directory at path (%@) with error (%@)", buf, 0x16u);
            }
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v8);
  }
}

void sub_10001E25C(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_setOrderedUUIDs:", *(void *)(a1 + 40)))
  {
    id v2 = *(id **)(a1 + 32);
    id v4 = [v2[8] orderedUUIDs];
    id v3 = [v4 copy];
    objc_msgSend(v2, "_queue_notifyDidUpdateOrderedUUIDs:skipSyncObserver:", v3, *(unsigned __int8 *)(a1 + 48));
  }
}

id sub_10001E3C4(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_queue_setSelectedUUID:", *(void *)(a1 + 40));
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[10];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 48);
    return objc_msgSend(v3, "_queue_notifyDidUpdateSelectedUUID:skipSyncObserver:suppressingCallbackToObserver:", v4, v5, v6);
  }
  return result;
}

void sub_10001E4E8(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_addFace:forUUID:", *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) copy];
    objc_msgSend(v2, "_queue_notifyDidAddFace:forUUID:skipSyncObserver:", v3, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }
}

void sub_10001E62C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  if ([v2 applyConfiguration:*(void *)(a1 + 48)])
  {
    sub_10001E7B0(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40), v2);
    objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = sub_10001E8F4(*(void **)(v3 + 16), *(void **)(a1 + 40));
    sub_10001E86C(v4, v5);

    uint64_t v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = v7[12];
      uint64_t v10 = v7[13];
      uint64_t v11 = v7[3];
      uint64_t v12 = *(void *)(a1 + 48);
      int v16 = 138544642;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      __int16 v27 = v2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@, %{public}@, %{public}@> update face for UUID %{public}@: configuration = %{public}@ - face = %{public}@", (uint8_t *)&v16, 0x3Eu);
    }

    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) copy];
    objc_msgSend(v13, "_queue_notifyDidUpdateFaceForUUID:withConfiguration:skipSyncObserver:", v14, v15, *(unsigned __int8 *)(a1 + 56));
  }
}

void sub_10001E7B0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v9 = [a3 JSONObjectRepresentation];
  id v7 = +[NSJSONSerialization dataWithJSONObject:v9 options:0 error:0];
  uint64_t v8 = sub_1000253F4(v6, v5);

  [v7 writeToFile:v8 atomically:1];
}

void sub_10001E86C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSString stringWithFormat:@"%@", a1];
  [v4 writeToFile:v3 atomically:1 encoding:4 error:0];
}

id sub_10001E8F4(void *a1, void *a2)
{
  id v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"configuration-sequence-id.string"];

  return v3;
}

void sub_10001EA10(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 resourceDirectory];
    id v5 = sub_10001EC3C(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40), *(void **)(a1 + 48));
    [v3 setResourceDirectory:v5];
    objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 24);
    uint64_t v8 = sub_10001EDB0(*(void **)(v6 + 16), *(void **)(a1 + 40));
    sub_10001E86C(v7, v8);

    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = v10[12];
      uint64_t v13 = v10[13];
      uint64_t v14 = v10[3];
      *(_DWORD *)buf = 138413314;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@,%@,%@> update face for UUID %@: new resource directory = %@", buf, 0x34u);
    }

    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(unsigned __int8 *)(a1 + 56);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001EE04;
    v23[3] = &unk_100060A90;
    id v24 = v4;
    id v18 = v4;
    objc_msgSend(v15, "_queue_notifyDidUpdateFaceForUUID:withResourceDirectory:skipSyncObserver:completion:", v16, v5, v17, v23);
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = [v3 configuration];
    id v22 = [v21 copy];
    objc_msgSend(v19, "_queue_notifyDidUpdateFaceForUUID:withConfiguration:skipSyncObserver:", v20, v22, *(unsigned __int8 *)(a1 + 56));
  }
}

id sub_10001EC3C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = +[NSUUID UUID];
    id v9 = [v5 stringByAppendingPathComponent:@"Resources"];
    uint64_t v10 = [v8 UUIDString];
    uint64_t v11 = [v9 stringByAppendingPathComponent:v10];

    uint64_t v12 = +[NSFileManager defaultManager];
    LOBYTE(v10) = [v12 copyItemAtPath:v7 toPath:v11 error:0];

    if ((v10 & 1) == 0)
    {

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = sub_1000253A0(v5, v6);
  uint64_t v14 = +[NSFileManager defaultManager];
  [v14 removeItemAtPath:v13 error:0];

  if (v11)
  {
    id v15 = +[NSFileManager defaultManager];
    [v15 createSymbolicLinkAtPath:v13 withDestinationPath:v11 error:0];
  }

  return v11;
}

id sub_10001EDB0(void *a1, void *a2)
{
  id v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"resources-sequence-id.string"];

  return v3;
}

void sub_10001EE04(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

id sub_10001EF28(id result)
{
  uint64_t v1 = (void *)*((void *)result + 4);
  if (v1)
  {
    id v2 = (id *)result;
    sub_10001E7B0(*(void **)(*((void *)result + 5) + 16), *((void **)result + 6), v1);
    objc_msgSend(v2[5], "_queue_incrementSeqId");
    id v3 = v2[5];
    uint64_t v4 = *((void *)v3 + 3);
    id v5 = sub_10001F058(*((void **)v3 + 2), v2[6]);
    sub_10001E86C(v4, v5);

    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v2[5];
      id v8 = v2[6];
      uint64_t v9 = v7[12];
      uint64_t v10 = v7[13];
      uint64_t v11 = v7[3];
      int v12 = 138413058;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@,%@,%@> upgrade face for UUID %@", (uint8_t *)&v12, 0x2Au);
    }

    return objc_msgSend(v2[5], "_queue_notifyDidUpgradeFace:forUUID:skipSyncObserver:", v2[4], v2[6], *((unsigned __int8 *)v2 + 56));
  }
  return result;
}

id sub_10001F058(void *a1, void *a2)
{
  id v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"upgrade-sequence-id.string"];

  return v3;
}

void sub_10001F148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 57)
    && (unsigned int v3 = objc_msgSend((id)v2, "_queue_isEmptyExceptForUUID:", *(void *)(a1 + 40)),
        uint64_t v2 = *(void *)(a1 + 32),
        v3))
  {
    objc_msgSend((id)v2, "_queue_faceForUUID:", *(void *)(a1 + 40));
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidAddFace:forUUID:skipSyncObserver:");
  }
  else
  {
    id v4 = [*(id *)(v2 + 64) faceStyleForUUID:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 64) removeUUID:*(void *)(a1 + 40)])
    {
      id v5 = sub_10001F444(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40));
      [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(a1 + 40)];
      sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
      id v6 = *(void **)(a1 + 40);
      id v7 = *(id *)(*(void *)(a1 + 32) + 16);
      id v8 = v6;
      uint64_t v9 = +[NSFileManager defaultManager];
      uint64_t v10 = sub_100025314(v7, v8);

      [v9 removeItemAtPath:v10 error:0];
      objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 24);
      uint64_t v13 = [*(id *)(v11 + 16) stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
      sub_10001E86C(v12, v13);

      [*(id *)(*(void *)(a1 + 32) + 88) setObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:*(void *)(a1 + 40)];
      sub_10001F528(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 88));
      __int16 v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = v15[12];
        uint64_t v18 = v15[13];
        uint64_t v19 = v15[3];
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        uint64_t v30 = v18;
        __int16 v31 = 2112;
        uint64_t v32 = v19;
        __int16 v33 = 2112;
        uint64_t v34 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@,%@,%@> remove face for UUID %@", buf, 0x2Au);
      }

      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(unsigned __int8 *)(a1 + 48);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001F684;
      v25[3] = &unk_100060A90;
      id v26 = v5;
      id v23 = v5;
      objc_msgSend(v20, "_queue_notifyDidRemoveFaceOfStyle:forUUID:skipSyncObserver:completion:", v4, v21, v22, v25);
    }
  }
}

id sub_10001F444(void *a1, void *a2)
{
  uint64_t v2 = sub_1000253A0(a1, a2);
  unsigned int v3 = +[NSFileManager defaultManager];
  id v4 = [v3 destinationOfSymbolicLinkAtPath:v2 error:0];

  return v4;
}

void sub_10001F4B8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 stringByAppendingPathComponent:@"manifest.plist"];
  [v3 writeToFile:v4 atomically:1];
}

void sub_10001F528(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (+[UIApplication isRunningInStoreDemoMode]
    && +[UIApplication runningInStoreDemoModeFProgramNumber] != (id)300)
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not executing _WriteRemovals as we are in demo mode and have no companion", buf, 2u);
    }
  }
  else
  {
    +[NSMutableDictionary dictionary];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100025448;
    v7[3] = &unk_100061C70;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    id v6 = [v3 stringByAppendingPathComponent:@"deleted.plist"];
    [v5 writeToFile:v6 atomically:1];
  }
}

void sub_10001F684(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

void sub_10001F7C0(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v2 stringByAppendingPathComponent:@"Faces"];
  [v3 removeItemAtPath:v4 error:0];

  id v5 = [v2 stringByAppendingPathComponent:@"Faces"];

  [v3 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllUUIDs];
  sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "_queue_clearRemovalsThroughSeqId:", *(void *)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 24);
  id v8 = [*(id *)(v6 + 16) stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
  sub_10001E86C(v7, v8);

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10001FC20;
  void v40[3] = &unk_1000619C8;
  uint64_t v9 = *(void **)(a1 + 40);
  v40[4] = *(void *)(a1 + 32);
  [v9 enumerateKeysAndObjectsUsingBlock:v40];
  objc_msgSend(*(id *)(a1 + 32), "_queue_setOrderedUUIDs:", *(void *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_queue_setSelectedUUID:", *(void *)(a1 + 56));
  [*(id *)(*(void *)(a1 + 32) + 40) collectionStore:*(void *)(a1 + 32) didSuppressNotificationForSeqId:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v10 = dispatch_group_create();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = a1;
  id v12 = *(id *)(*(void *)(a1 + 32) + 32);
  id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v10);
          uint64_t v18 = *(void **)(v11 + 32);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_10001FC2C;
          v34[3] = &unk_100060A90;
          uint64_t v35 = v10;
          objc_msgSend(v18, "_queue_reloadFullCollectionForObserver:completion:", v17, v34);
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v14);
  }

  uint64_t v19 = +[NSMutableSet set];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001FC34;
  v28[3] = &unk_1000619F0;
  void v28[4] = *(void *)(v11 + 32);
  __int16 v31 = v32;
  id v29 = *(id *)(v11 + 48);
  id v30 = v19;
  id v20 = v19;
  uint64_t v21 = objc_retainBlock(v28);
  uint64_t v22 = *(id *)(*(void *)(v11 + 32) + 8);
  dispatch_group_notify(v10, v22, v21);
  dispatch_time_t v23 = dispatch_time(0, 60000000000);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001FDFC;
  v25[3] = &unk_100061A18;
  id v26 = v21;
  __int16 v27 = v32;
  void v25[4] = *(void *)(v11 + 32);
  id v24 = v21;
  dispatch_after(v23, v22, v25);

  _Block_object_dispose(v32, 8);
}

id sub_10001FC20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addFace:forUUID:", a3, a2);
}

void sub_10001FC2C(uint64_t a1)
{
}

void sub_10001FC34(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(*(void *)(v2 + 24) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100043684();
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001FD6C;
    v7[3] = &unk_100061978;
    uint64_t v6 = *(void **)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    [v6 enumerateObjectsUsingBlock:v7];
    sub_10001DE38(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 48));
  }
  objc_sync_exit(v3);
}

void sub_10001FD54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001FD6C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v7 resourceDirectory];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v3 lastPathComponent];
    [v5 addObject:v6];
  }
}

uint64_t sub_10001FDFC(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100043704();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

void sub_10001FF20(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001FFA8;
  v2[3] = &unk_100060B30;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_onObserverQueue_async:", v2);
}

uint64_t sub_10001FFA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002004C(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_computeValidationHash");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020104;
  v6[3] = &unk_100060C08;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  objc_msgSend(v3, "_onObserverQueue_async:", v6);
}

uint64_t sub_100020104(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000201C0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectionstore.asyncwork");
}

void sub_1000202A4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.collectionstore.asyncobservercallback");
}

id sub_100020810(void *a1, void *a2)
{
  uint64_t v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"added-sequence-id.string"];

  return v3;
}

void sub_100020F7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!sub_10001C0DC(*(void **)(a1 + 32), a3)) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_1000215A8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 complication];
    [*(id *)(a1 + 32) setComplication:v4 forSlot:v5];
  }
}

void sub_100021E90(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [a3 copy];
  id v6 = objc_retainBlock(v7);
  [v4 setObject:v6 forKey:v5];
}

void sub_100021F0C(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 80);
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    id v18 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] update selected uuid: %@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022078;
  v10[3] = &unk_1000610F0;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v2;
  id v14 = v8;
  id v9 = v2;
  objc_msgSend(v5, "_onObserverQueue_async:", v10);
}

id sub_100022078(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateSelectedUUID:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56)];
}

void sub_100022088(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) orderedUUIDs];
  id v3 = [v2 copy];

  uint64_t v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 firstObject];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] update ordered uuids (first uuid = %@))", buf, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022220;
  v12[3] = &unk_1000610F0;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v3;
  id v16 = v10;
  id v11 = v3;
  objc_msgSend(v7, "_onObserverQueue_async:", v12);
}

id sub_100022220(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateOrderedUUIDs:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56)];
}

void sub_100022230(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  id v3 = [v2 copy];

  uint64_t v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] add face %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000223B0;
  v11[3] = &unk_100061190;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v3;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v10 = v3;
  objc_msgSend(v6, "_onObserverQueue_async:", v11);
}

id sub_1000223B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didAddFace:*(void *)(a1 + 48) forUUID:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

void sub_1000223C4(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  id v3 = [v2 copy];

  uint64_t v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] upgrade face %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100022544;
  v11[3] = &unk_100061190;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v3;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v10 = v3;
  objc_msgSend(v6, "_onObserverQueue_async:", v11);
}

id sub_100022544(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpgradeFace:*(void *)(a1 + 48) forUUID:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

void sub_100022558(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  uint64_t v4 = [v3 configuration];
  id v5 = [v4 copy];

  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] update face configuration %@", buf, 0x16u);
  }

  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100022734;
    v10[3] = &unk_100061190;
    id v11 = *(id *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 32);
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_onObserverQueue_async:", v10);

    uint64_t v9 = v11;
  }
  else
  {
    uint64_t v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1000437F0(v2, a1, v9);
    }
  }
}

id sub_100022734(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateFaceForUUID:*(void *)(a1 + 48) withConfiguration:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

void sub_100022748(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_faceForUUID:", *(void *)(a1 + 40));
  id v3 = [v2 resourceDirectory];

  uint64_t v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] update face resource directory %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000228D0;
  v8[3] = &unk_100061190;
  id v9 = *(id *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 32);
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  objc_msgSend(v6, "_onObserverQueue_async:", v8);
}

id sub_1000228D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateFaceForUUID:*(void *)(a1 + 48) withResourceDirectory:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64) acknowledge:&stru_100061AD0];
}

void sub_1000228F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (sub_10001C0DC(*(void **)(a1 + 32), v6))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000229EC;
    v11[3] = &unk_1000610F0;
    id v12 = v6;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 40);
    long long v10 = *(void **)(a1 + 48);
    id v13 = v8;
    uint64_t v14 = v9;
    id v15 = v10;
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v12, v11);
  }
}

void sub_1000229EC(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[playback changes - seqId %@] remove face for uuid %@", buf, 0x16u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022B48;
  v8[3] = &unk_1000610F0;
  id v5 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  int8x16_t v7 = *(int8x16_t *)(a1 + 40);
  id v6 = (id)v7.i64[0];
  int8x16_t v10 = vextq_s8(v7, v7, 8uLL);
  id v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_onObserverQueue_async:", v8);
}

id sub_100022B48(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didRemoveFaceOfStyle:-1 forUUID:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56) acknowledge:&stru_100061AF0];
}

int64_t sub_100022B68(id a1, NSNumber *a2, NSNumber *a3)
{
  if (sub_10001C0DC(a2, a3)) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_100022D04(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022DBC;
  v7[3] = &unk_100060B30;
  id v8 = *(id *)(a1 + 80);
  [v1 collectionStore:v2 loadOrderedUUIDs:v3 selectedUUID:v4 facesByUUID:v5 seqId:v6 acknowledge:v7];
}

uint64_t sub_100022DBC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100022EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022EFC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100022FB0;
    v3[3] = &unk_100061208;
    id v4 = a1[4];
    id v5 = WeakRetained;
    id v6 = a1[5];
    objc_msgSend(WeakRetained, "_onObserverQueue_async:", v3);
  }
}

void sub_100022FB0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023040;
  v3[3] = &unk_100060B30;
  id v4 = *(id *)(a1 + 48);
  [v1 resetCollectionStore:v2 acknowledge:v3];
}

uint64_t sub_100023040(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_1000232A4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 collectionStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return [v3 collectionStore:v4 didUpdateSelectedUUID:*(void *)(a1 + 56) seqId:*(void *)(a1 + 48)];
  }
}

id sub_1000232C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateSelectedUUID:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56)];
}

id sub_100023508(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 collectionStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return [v3 collectionStore:v4 didUpdateOrderedUUIDs:*(void *)(a1 + 56) seqId:*(void *)(a1 + 48)];
  }
}

id sub_10002352C(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateOrderedUUIDs:*(void *)(a1 + 48) seqId:*(void *)(a1 + 56)];
}

id sub_1000237A4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 collectionStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return [v3 collectionStore:v4 didUpdateFaceForUUID:*(void *)(a1 + 56) withConfiguration:*(void *)(a1 + 64) seqId:*(void *)(a1 + 48)];
  }
}

id sub_1000237CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpdateFaceForUUID:*(void *)(a1 + 48) withConfiguration:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

id sub_100023A48(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 collectionStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return [v3 collectionStore:v4 didUpgradeFace:*(void *)(a1 + 56) forUUID:*(void *)(a1 + 64) seqId:*(void *)(a1 + 48)];
  }
}

id sub_100023A70(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didUpgradeFace:*(void *)(a1 + 48) forUUID:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

id sub_100023DE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
}

void sub_100023DF4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100023EA4;
  v6[3] = &unk_100060A90;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 collectionStore:v2 didUpdateFaceForUUID:v3 withResourceDirectory:v4 seqId:v5 acknowledge:v6];
}

void sub_100023EA4(uint64_t a1)
{
}

void sub_100023EAC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100023F5C;
  v6[3] = &unk_100060A90;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 collectionStore:v2 didUpdateFaceForUUID:v3 withResourceDirectory:v4 seqId:v5 acknowledge:v6];
}

void sub_100023F5C(uint64_t a1)
{
}

id sub_1000241CC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 collectionStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return [v3 collectionStore:v4 didAddFace:*(void *)(a1 + 56) forUUID:*(void *)(a1 + 64) seqId:*(void *)(a1 + 48)];
  }
}

id sub_1000241F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didAddFace:*(void *)(a1 + 48) forUUID:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

id sub_100024540(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionStore:*(void *)(a1 + 40) didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
}

void sub_100024550(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024600;
  v6[3] = &unk_100060A90;
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v1 collectionStore:v2 didRemoveFaceOfStyle:v5 forUUID:v3 seqId:v4 acknowledge:v6];
}

void sub_100024600(uint64_t a1)
{
}

void sub_100024608(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000246B8;
  v6[3] = &unk_100060A90;
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v1 collectionStore:v2 didRemoveFaceOfStyle:v5 forUUID:v3 seqId:v4 acknowledge:v6];
}

void sub_1000246B8(uint64_t a1)
{
}

void sub_100024E00(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043880();
    }

    objc_end_catch();
    JUMPOUT(0x100024DBCLL);
  }
  _Unwind_Resume(exception_object);
}

id sub_10002526C()
{
  id v0 = NTKHomeDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"CollectionStores"];

  return v1;
}

id sub_1000252C0()
{
  id v0 = sub_10002526C();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"PerDeviceStores"];

  return v1;
}

id sub_100025314(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 stringByAppendingPathComponent:@"Faces"];
  uint64_t v5 = [v3 UUIDString];

  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

id sub_1000253A0(void *a1, void *a2)
{
  uint64_t v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"Resources"];

  return v3;
}

id sub_1000253F4(void *a1, void *a2)
{
  uint64_t v2 = sub_100025314(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"face.json"];

  return v3;
}

void sub_100025448(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 UUIDString];
  [v4 setObject:v5 forKey:v6];
}

void sub_1000254BC(id a1)
{
  qword_1000723B8 = (uint64_t)dispatch_queue_create("com.apple.ntkd.collectionstorecreation", 0);

  _objc_release_x1();
}

id sub_1000254FC(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = +[NSFileManager defaultManager];
    id v45 = 0;
    id v3 = [v2 contentsOfDirectoryAtPath:v1 error:&v45];
    id v4 = v45;
    id v5 = v4;
    if (v3)
    {
      id v31 = v4;
      char v33 = v2;
      uint64_t v34 = v1;
      id v6 = +[NSMutableArray array];
      id v7 = +[NSMutableArray array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v32 = v3;
      id obj = v3;
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      long long v36 = v7;
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v42;
        uint64_t v11 = NTKCollectionIdentifierLibraryFaces;
        uint64_t v12 = NTKCollectionIdentifierPhotosFaces;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            __int16 v14 = v6;
            if (*(void *)v42 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v47[0] = v11;
            v47[1] = v12;
            uint64_t v16 = +[NSArray arrayWithObjects:v47 count:2];
            unsigned int v17 = [v16 containsObject:v15];

            BOOL v18 = v17 == 0;
            id v6 = v14;
            id v7 = v36;
            if (v18) {
              __int16 v19 = v36;
            }
            else {
              __int16 v19 = v14;
            }
            [v19 addObject:v15];
          }
          id v9 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v9);
      }

      uint64_t v2 = v33;
      id v1 = v34;
      if ([v7 count])
      {
        if (qword_1000723D0 != -1) {
          dispatch_once(&qword_1000723D0, &stru_100061CB0);
        }
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1000258BC;
        v37[3] = &unk_100060C58;
        long long v38 = v7;
        id v39 = v34;
        uint64_t v40 = v33;
        id v20 = objc_retainBlock(v37);
        dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v20);
        dispatch_async((dispatch_queue_t)qword_1000723C8, v21);

        id v7 = v36;
      }
      id v22 = [v6 copy];

      id v5 = v31;
      id v3 = v32;
    }
    else
    {
      id v6 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100043958();
      }
      id v22 = &__NSArray0__struct;
    }
  }
  else
  {
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000438E8(v2, v23, v24, v25, v26, v27, v28, v29);
    }
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

void sub_10002587C(id a1)
{
  qword_1000723C8 = (uint64_t)dispatch_queue_create("com.apple.nanotimekit.collectionstore.cleanup", 0);

  _objc_release_x1();
}

void sub_1000258BC(id *a1)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v24;
    *(void *)&long long v4 = 138412546;
    long long v21 = v4;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(a1[5], "stringByAppendingPathComponent:", *(void *)(*((void *)&v23 + 1) + 8 * i), v21);
        id v9 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to remove store at path %@", buf, 0xCu);
        }

        if (([a1[6] fileExistsAtPath:v8] & 1) == 0)
        {
          __int16 v14 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000439C0((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
          }

          goto LABEL_19;
        }
        id v10 = a1[6];
        id v22 = 0;
        unsigned __int8 v11 = [v10 removeItemAtPath:v8 error:&v22];
        id v12 = v22;
        if ((v11 & 1) == 0)
        {
          uint64_t v13 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            uint64_t v28 = v8;
            __int16 v29 = 2112;
            id v30 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't remove store at path %@ - %@", buf, 0x16u);
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

void sub_100025B3C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100025BA4(id a1)
{
  id v1 = objc_alloc((Class)NSXPCListener);
  id v2 = [v1 initWithMachServiceName:NTKComplicationStoreMachService];
  id v3 = (void *)qword_1000723D8;
  qword_1000723D8 = (uint64_t)v2;

  uint64_t v4 = (void *)qword_1000723D8;
  id v5 = +[NTKDComplicationStoreCoordinator sharedInstance];
  [v4 setDelegate:v5];

  uint64_t v6 = (void *)qword_1000723D8;

  [v6 resume];
}

void sub_100025C84(id a1)
{
  qword_1000723E8 = objc_alloc_init(NTKDComplicationStoreCoordinator);

  _objc_release_x1();
}

void sub_100025E40(uint64_t a1)
{
  id v2 = [[NTKDComplicationCollectionClient alloc] initWithConnection:*(void *)(a1 + 32)];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100025EF0;
  v3[3] = &unk_100061D18;
  void v3[4] = *(void *)(a1 + 40);
  [(NTKDComplicationCollectionClient *)v2 setInvalidationHandler:v3];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v2];
  [*(id *)(a1 + 32) resume];
}

void sub_100025EF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025F8C;
  v7[3] = &unk_100060AB8;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_100025F8C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_100026078(void *a1)
{
  id v2 = +[NTKDCollectionStoreKey keyWithCollectionIdentifier:a1[4] deviceUUID:a1[5]];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000261A0;
  id v10 = &unk_100061D40;
  id v3 = (void *)a1[7];
  uint64_t v11 = a1[6];
  id v12 = v3;
  uint64_t v4 = objc_retainBlock(&v7);
  uint64_t v5 = objc_msgSend(*(id *)(a1[6] + 16), "objectForKey:", v2, v7, v8, v9, v10, v11);
  if (v5)
  {
    id v6 = (NTKDComplicationStore *)v5;
  }
  else
  {
    id v6 = [[NTKDComplicationStore alloc] initWithCollectionIdentifier:a1[4] deviceUUID:a1[5]];
    [*(id *)(a1[6] + 16) setObject:v6 forKey:v2];
    objc_msgSend((id)a1[6], "_queue_notifyObserversStoreCreated:", v6);
  }
  ((void (*)(void ***, NTKDComplicationStore *))v4[2])(v4, v6);
}

void sub_1000261A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) checkoutStore:v3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002625C;
  v7[3] = &unk_100060C08;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_msgSend(v4, "_onCalloutQueue_async:", v7);
}

uint64_t sub_10002625C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002630C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000263B0;
  v4[3] = &unk_100061D68;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_1000263B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026460;
  v7[3] = &unk_100060AB8;
  id v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  objc_msgSend(v5, "_onCalloutQueue_async:", v7);
}

id sub_100026460(uint64_t a1)
{
  return [*(id *)(a1 + 32) complicationCollectionStoreHasBeenCreated:*(void *)(a1 + 40)];
}

id sub_100026504(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

void sub_1000265B8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationcollectioncoordinator.busy");
}

void sub_10002669C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationcollectioncoordinator.callout");
}

id sub_10002684C(uint64_t a1)
{
  return [*(id *)(a1 + 32) complicationCollectionStoreHasBeenCreated:*(void *)(a1 + 40)];
}

uint64_t sub_10002696C(uint64_t a1)
{
  qword_1000723F8 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

void sub_100026B2C(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSXPCListener);
  id v3 = [v2 initWithMachServiceName:NTKTrackedPhotosMachServiceName];
  id v4 = (void *)qword_100072408;
  qword_100072408 = (uint64_t)v3;

  [(id)qword_100072408 setDelegate:*(void *)(a1 + 32)];
  [(id)qword_100072408 resume];
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started XPC listener for Tracked Photos service…", v6, 2u);
  }
}

void sub_100026DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026E20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];
}

id sub_100026F5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchTrackedPhotosPriorityList:", *(void *)(a1 + 40));
}

void sub_10002717C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Faces loaded in collection %@", buf, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) _priorityListFromCollection:v3];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000272C0;
  v9[3] = &unk_100060AB8;
  void v9[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

id sub_1000272C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handlePriorityList:", *(void *)(a1 + 40));
}

uint64_t sub_100027848(uint64_t a1)
{
  qword_100072418 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

void sub_100027A14(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanotimekit.devicelibraryserver"];
  id v3 = (void *)qword_100072428;
  qword_100072428 = (uint64_t)v2;

  [(id)qword_100072428 setDelegate:*(void *)(a1 + 32)];
  [(id)qword_100072428 resume];
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started XPC listener for Device Library service…", v5, 2u);
  }
}

id sub_100027BC0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchLibraryAsJSON:", *(void *)(a1 + 40));
}

void sub_100027D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027D70(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 instanceDescriptor];
  uint64_t v6 = +[NSNumber numberWithInt:*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]];
  id v7 = [v5 faceJSONRepresentation];
  id v12 = 0;
  id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    id v10 = (void *)a1[4];
    v13[0] = @"selected";
    v13[1] = @"faceJSON";
    v14[0] = v6;
    v14[1] = v8;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v10 addObject:v11];
  }
  else
  {
    uint64_t v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100043AA4((uint64_t)v9, v11);
    }
  }

  ++*(void *)(*(void *)(a1[5] + 8) + 24);
}

void sub_1000283BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000283E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];
}

void sub_100028634(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Face loaded for JSON in collection %@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  id v15 = 0;
  uint64_t v6 = [v5 _jsonFromCollection:v3 error:&v15];
  id v7 = v15;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000287A4;
  v12[3] = &unk_100060C58;
  void v12[4] = v8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);
}

id sub_1000287A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleFaceJSON:error:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

id sub_1000288A8()
{
  if (qword_100072440 != -1) {
    dispatch_once(&qword_100072440, &stru_100062108);
  }
  id v0 = (void *)qword_100072438;

  return v0;
}

void sub_1000288FC(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned complication stores...", buf, 2u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = +[NSFileManager defaultManager];
  id v5 = sub_10002F470();
  uint64_t v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:buf count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        if (v11) {
          [v3 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:buf count:16];
    }
    while (v8);
  }

  id v12 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v23;
    *(void *)&long long v13 = 138412290;
    long long v21 = v13;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v3);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v17, v21, (void)v22) & 1) == 0)
        {
          uint64_t v18 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            uint64_t v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "...deleting complication stores for device uuid %@", buf, 0xCu);
          }

          uint64_t v19 = +[NSFileManager defaultManager];
          uint64_t v20 = sub_100028BF8(v17);
          [v19 removeItemAtPath:v20 error:0];
        }
      }
      id v14 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }
}

id sub_100028BF8(void *a1)
{
  id v1 = a1;
  id v2 = sub_10002F470();
  id v3 = [v1 UUIDString];

  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id sub_100028F80(void *a1, void *a2)
{
  id v3 = a1;
  if (a2) {
    sub_100028BF8(a2);
  }
  else {
  id v4 = sub_10002F41C();
  }
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

void sub_100028FFC(uint64_t a1)
{
}

void sub_100029008(void *a1)
{
  id v1 = a1;
  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:0];
  id v2 = [v1 stringByAppendingPathComponent:@"Complications"];
  [v4 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

  id v3 = [v1 stringByAppendingPathComponent:@"ComplicationDescriptors"];

  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
}

id sub_1000290E0(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"sequence-id.string"];
}

id sub_1000290EC(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"reset-sequence-id.string"];
}

_NTKDComplicationCollectionManifest *sub_1000290F8(void *a1)
{
  id v1 = a1;
  id v2 = [_NTKDComplicationCollectionManifest alloc];
  id v3 = [v1 stringByAppendingPathComponent:@"manifest.plist"];

  id v4 = [(_NTKDComplicationCollectionManifest *)v2 initWithContentsOfFile:v3];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[_NTKDComplicationCollectionManifest emptyManifest];
  }
  uint64_t v6 = v5;

  return v6;
}

id sub_10002919C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 stringByAppendingPathComponent:@"deleted.plist"];
  id v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];

  id v4 = +[NSMutableDictionary dictionary];
  if (v3)
  {
    objc_opt_class();
    objc_opt_class();
    NTKValidateDictionary();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F7B8;
    v6[3] = &unk_100062038;
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }

  return v4;
}

void sub_1000294C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000294DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 64) complicationDescriptorIdentifiersForClientIdentifier:v3];
  id v5 = [v4 copy];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000295AC;
  v7[3] = &unk_100061E08;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_1000295AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:*(void *)(a1 + 32) complicationIdentifier:v3];
  id v6 = sub_100029734(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(a1 + 32), v3);
  if (v6)
  {

    id v7 = [*(id *)(*(void *)(a1 + 40) + 64) familiesWithSampleTemplateForKey:v4];
    id v8 = [v7 copy];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000297BC;
    v12[3] = &unk_100061DE0;
    void v12[4] = *(void *)(a1 + 40);
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    id v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100043B88((uint64_t)v4, v11);
    }

    [*(id *)(*(void *)(a1 + 40) + 64) removeSampleTemplatesForKey:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

id sub_100029734(void *a1, void *a2, void *a3)
{
  id v3 = sub_10002F6FC(a1, a2, a3);
  id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v3];
  if (v4) {
    id v5 = [objc_alloc((Class)CLKComplicationDescriptor) initWithJSONObjectRepresentation:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_1000297BC(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v8 = (void *)a1[5];
  id v9 = *(void **)(a1[4] + 16);
  [v6 intValue];
  uint64_t v10 = sub_1000298A8(v9, v8);
  if (!v10)
  {
    id v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100043C00(v6, a1 + 5, v11);
    }

    [*(id *)(a1[4] + 64) removeSampleTemplatesForKey:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_1000298A8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_100029F48(v3, v4);
  id v12 = 0;
  id v6 = [objc_alloc((Class)NSData) initWithContentsOfFile:v5 options:1 error:&v12];
  id v7 = v12;
  if (v7)
  {
    id v8 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100043D10();
    }

    id v9 = 0;
  }
  else
  {
    id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
    [v10 setDecodingFailurePolicy:0];
    id v9 = [v10 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  }

  return v9;
}

void sub_100029A70(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(a1 + 32) + 24));
  sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  id v4 = [*(id *)(v2 + 16) stringByAppendingPathComponent:@"reset-sequence-id.string"];
  sub_10001E86C(v3, v4);

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 24);
  id v7 = [*(id *)(v5 + 16) stringByAppendingPathComponent:@"manifest-sequence-id.string"];
  sub_10001E86C(v6, v7);

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 48))
  {
    objc_msgSend((id)v8, "_queue_loadFullCollectionForObserver:");
    uint64_t v8 = *(void *)(a1 + 32);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(v8 + 40);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_loadFullCollectionForObserver:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14);
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

id sub_100029BF8(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"manifest-sequence-id.string"];
}

id sub_100029D70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _faultInSampleDataForKey:a2];
}

id sub_100029F48(void *a1, void *a2)
{
  uint64_t v2 = sub_10002F5B4(a1, a2);
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"sample-template"];

  return v3;
}

void sub_10002A2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A320(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:a1[4] descriptor:v3];

  (*(void (**)(void))(a1[5] + 16))();
  id v4 = [v5 complicationIdentifier];
  LODWORD(v3) = [v4 isEqualToString:CLKDefaultComplicationIdentifier];

  if (v3) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_10002A584(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
  sub_10001BEB4((uint64_t)v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (sub_10001C0DC(v5, *(void **)(*(void *)(a1 + 32) + 32)))
  {
    id v3 = *(id *)(*(void *)(a1 + 32) + 32);

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [*(id *)(a1 + 32) _setupObserver:*(void *)(a1 + 40) withSeqId:*(void *)(a1 + 48) reloadSeqId:v4];
}

id sub_10002A644(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
}

id sub_10002A6E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

id sub_10002A7B8(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _setupObserver:*(void *)(a1 + 40) withSeqId:*(void *)(a1 + 48) reloadSeqId:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return objc_msgSend(v2, "_queue_clearRemovalsThroughSeqId:", v3);
}

void sub_10002A930(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

void sub_10002A9EC(uint64_t a1)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_10002AA24(*(void **)(*(void *)(a1 + 32) + 16));
}

float sub_10002AA24(void *a1)
{
  uint64_t v1 = [a1 stringByAppendingPathComponent:@"version.string"];
  uint64_t v2 = +[NSString stringWithContentsOfFile:v1 encoding:4 error:0];

  [v2 floatValue];
  float v4 = v3;

  return v4;
}

void sub_10002AB08(uint64_t a1)
{
}

void sub_10002AB1C(void *a1, float a2)
{
  double v2 = a2;
  id v3 = a1;
  id v5 = +[NSString stringWithFormat:@"%f", *(void *)&v2];
  float v4 = [v3 stringByAppendingPathComponent:@"version.string"];

  [v5 writeToFile:v4 atomically:1 encoding:4 error:0];
}

uint64_t sub_10002ACB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002ACC4(uint64_t a1)
{
}

void sub_10002ACCC(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) clientIds];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  float v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002AE90(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_sampleTemplateForKey:family:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  float v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10002B014(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_queue_hasSampleTemplateForKey:family:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10002B160(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_complicationDescriptorsForClientIdentifier:", *(void *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  float v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002B5E0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [*(id *)(a1 + 32) supportedFamilies];
  id v41 = v2;
  id v45 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v45)
  {
    uint64_t v4 = *(void *)v56;
    *(void *)&long long v3 = 138544130;
    long long v38 = v3;
    uint64_t v40 = *(void *)v56;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v56 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "integerValue", v38);
        if ([*(id *)(*(void *)(a1 + 40) + 64) addKey:*(void *)(a1 + 48) supportForSampleTemplateForFamily:v7])objc_msgSend(v2, "addObject:", v6); {
        uint64_t v8 = [*(id *)(a1 + 32) templatePathForFamily:v7];
        }
        if (!v8)
        {
          uint64_t v8 = sub_100029F48(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(a1 + 48));
          [*(id *)(a1 + 32) setTemplatePath:v8 forFamily:v7];
        }
        sub_10002BB84(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(a1 + 48));
        id v9 = [*(id *)(a1 + 32) templateForFamily:v7];
        if (_os_feature_enabled_impl())
        {
          id v10 = objc_alloc_init((Class)CLKKeyedHashingEncoder);
          [v10 encodeRootObject:v9];
          long long v44 = v10;
          long long v43 = [v10 encodedData];
          id v11 = objc_msgSend(v43, "clk_hexEncodedString");
          uint64_t v12 = sub_10002BBF4(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(a1 + 48), (uint64_t)v7);
          LODWORD(v10) = [v12 isEqualToString:v11];
          id v13 = _NTKLoggingObjectForDomain();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v10)
          {
            if (v14)
            {
              uint64_t v15 = *(void *)(a1 + 48);
              long long v16 = CLKStringForComplicationFamily();
              *(_DWORD *)buf = 138543618;
              uint64_t v62 = v15;
              __int16 v63 = 2114;
              v64 = v16;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipped updating sample template for key %{public}@, family %{public}@: previously-stored template content is identical.", buf, 0x16u);
            }
            uint64_t v4 = v40;
            id v2 = v41;
            goto LABEL_22;
          }
          if (v14)
          {
            uint64_t v39 = *(void *)(a1 + 48);
            long long v17 = CLKStringForComplicationFamily();
            *(_DWORD *)buf = v38;
            uint64_t v62 = v39;
            __int16 v63 = 2114;
            v64 = v17;
            __int16 v65 = 2114;
            v66 = v12;
            __int16 v67 = 2114;
            v68 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating sample template for key %{public}@, family %{public}@: previously-stored template content hash %{public}@ differs from new hash %{public}@.", buf, 0x2Au);
          }
          uint64_t v4 = v40;
          id v2 = v41;
        }
        else
        {
          id v11 = 0;
        }
        sub_10002BDCC(*(void **)(*(void *)(a1 + 40) + 16), (uint64_t)v9, *(void **)(a1 + 48), (uint64_t)v7);
        if (v11) {
          sub_10002BF50(*(void **)(*(void *)(a1 + 40) + 16), v11, *(void **)(a1 + 48));
        }
        [v2 addObject:v6];
LABEL_22:
      }
      id v45 = [obj countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v45);
  }

  if ([v2 count])
  {
    sub_10001F4B8(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(*(void *)(a1 + 40) + 64));
    objc_msgSend(*(id *)(a1 + 40), "_queue_incrementSeqId");
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(v18 + 24);
    uint64_t v20 = [*(id *)(v18 + 16) stringByAppendingPathComponent:@"manifest-sequence-id.string"];
    sub_10001E86C(v19, v20);

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v21 = v2;
    id v22 = [v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(a1 + 40);
          long long v27 = *(void **)(a1 + 48);
          long long v29 = *(void **)(v26 + 16);
          uint64_t v28 = *(void *)(v26 + 24);
          [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) integerValue];
          id v30 = sub_10002C0B8(v29, v27);
          sub_10001E86C(v28, v30);
        }
        id v23 = [v21 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v23);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v31 = v21;
    id v32 = [v31 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v48;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v48 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)k) integerValue];
          long long v37 = [*(id *)(a1 + 32) templateReferenceForFamily:v36];
          objc_msgSend(*(id *)(a1 + 40), "_queue_notifyDidUpdateSampleTemplateReference:forKey:family:skipSyncObserver:", v37, *(void *)(a1 + 48), v36, *(unsigned __int8 *)(a1 + 56));
        }
        id v33 = [v31 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v33);
    }

    id v2 = v41;
  }
}

void sub_10002BB84(void *a1, void *a2)
{
  sub_10002F5B4(a1, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[NSFileManager defaultManager];
  [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
}

NSObject *sub_10002BBF4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10002F628(a1, v5);
  id v15 = 0;
  id v7 = [objc_alloc((Class)NSData) initWithContentsOfFile:v6 options:0 error:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    id v10 = v9;
    if (v9)
    {
      id v10 = v9;
      id v11 = v10;
    }
    else
    {
      uint64_t v12 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100043D80((uint64_t)v5, a3, v12);
      }

      id v11 = 0;
    }
  }
  else
  {
    id v10 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = CLKStringForComplicationFamily();
      *(_DWORD *)buf = 138543874;
      id v17 = v5;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Failed to load complication sample template content hash for key %{public}@, family %{public}@: %{public}@. This error is expected on fresh pairing or if the complication store has been removed.", buf, 0x20u);
    }
    id v11 = 0;
  }

  return v11;
}

void sub_10002BDCC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
  id v10 = sub_100029F48(v7, v8);
  unsigned int v11 = [v9 writeToFile:v10 atomically:1];

  uint64_t v12 = CLKLoggingObjectForDomain();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = CLKStringForComplicationFamily();
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully wrote complication sample template for key %@, family %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100043E34((uint64_t)v8, a4, v13);
  }

  sub_10002F750(v7, v8);
}

void sub_10002BF50(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = sub_10002F628(a1, v5);
  id v8 = [v6 dataUsingEncoding:4];

  id v13 = 0;
  unsigned __int8 v9 = [v8 writeToFile:v7 options:1 error:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    unsigned int v11 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = CLKStringForComplicationFamily();
      *(_DWORD *)buf = 138543874;
      id v15 = v5;
      __int16 v16 = 2114;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to write complication sample template content hash for key %{public}@, family %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

id sub_10002C0B8(void *a1, void *a2)
{
  id v2 = sub_10002F5B4(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"sample-template-sequence-id.string"];

  return v3;
}

void sub_10002C204(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) addKey:*(void *)(a1 + 40) supportForSampleTemplateForFamily:*(void *)(a1 + 64)];
  id v2 = [*(id *)(a1 + 48) templatePathForFamily:*(void *)(a1 + 64)];
  if (!v2)
  {
    id v2 = sub_100029F48(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40));
    [*(id *)(a1 + 48) setTemplatePath:v2 forFamily:*(void *)(a1 + 64)];
  }
  sub_10002BB84(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40));
  if (_os_feature_enabled_impl())
  {
    id v3 = objc_alloc_init((Class)CLKKeyedHashingEncoder);
    [v3 encodeRootObject:*(void *)(a1 + 56)];
    uint64_t v4 = [v3 encodedData];
    id v5 = objc_msgSend(v4, "clk_hexEncodedString");
    id v6 = sub_10002BBF4(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40), *(void *)(a1 + 64));
    unsigned int v7 = [v6 isEqualToString:v5];
    id v8 = _NTKLoggingObjectForDomain();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 40);
        unsigned int v11 = CLKStringForComplicationFamily();
        int v20 = 138543618;
        uint64_t v21 = v10;
        __int16 v22 = 2114;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipped updating sample template for key %{public}@, family %{public}@: previously-stored template content is identical.", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_15;
    }
    if (v9)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = CLKStringForComplicationFamily();
      int v20 = 138544130;
      uint64_t v21 = v12;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2114;
      long long v25 = v6;
      __int16 v26 = 2114;
      long long v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating sample template for key %{public}@, family %{public}@: previously-stored template content hash %{public}@ differs from new hash %{public}@.", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    id v5 = 0;
  }
  sub_10002BDCC(*(void **)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 56), *(void **)(a1 + 40), *(void *)(a1 + 64));
  if (v5) {
    sub_10002BF50(*(void **)(*(void *)(a1 + 32) + 16), v5, *(void **)(a1 + 40));
  }
  sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 24);
  __int16 v16 = [*(id *)(v14 + 16) stringByAppendingPathComponent:@"manifest-sequence-id.string"];
  sub_10001E86C(v15, v16);

  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(v17 + 24);
  id v19 = sub_10002C0B8(*(void **)(v17 + 16), *(void **)(a1 + 40));
  sub_10001E86C(v18, v19);

  id v3 = [*(id *)(a1 + 48) templateReferenceForFamily:*(void *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidUpdateSampleTemplateReference:forKey:family:skipSyncObserver:", v3, *(void *)(a1 + 40), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
LABEL_15:
}

void sub_10002C740(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v3 = sub_10002CAD0(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40));
  [v2 removeItemAtPath:v3 error:0];

  uint64_t v4 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = *(id *)(a1 + 48);
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    uint64_t v31 = 138412802;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unsigned int v11 = objc_msgSend(v10, "identifier", v31);
        if (v11)
        {
          [v4 addObject:v11];
          sub_10002CB44(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40), v11);
          sub_10002CBB4(*(void **)(*(void *)(a1 + 32) + 16), v10, *(void **)(a1 + 40), v11);
        }
        else
        {
          uint64_t v12 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v13 = [v10 displayName];
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v31;
            long long v43 = v10;
            __int16 v44 = 2112;
            id v45 = v13;
            __int16 v46 = 2112;
            uint64_t v47 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No identifier for descriptor %@ (%@) of client %@", buf, 0x20u);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v7);
  }

  id v32 = v4;
  [*(id *)(*(void *)(a1 + 32) + 64) setClientId:*(void *)(a1 + 40) supportForComplicationDescriptorIdentifiers:v4];
  sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
  objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(v15 + 24);
  uint64_t v17 = [*(id *)(v15 + 16) stringByAppendingPathComponent:@"manifest-sequence-id.string"];
  sub_10001E86C(v16, v17);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = *(id *)(a1 + 48);
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        uint64_t v25 = *(void *)(a1 + 32);
        __int16 v26 = *(void **)(a1 + 40);
        uint64_t v28 = *(void **)(v25 + 16);
        uint64_t v27 = *(void *)(v25 + 24);
        long long v29 = [v23 identifier];
        id v30 = sub_10002CD30(v28, v26, v29);
        sub_10001E86C(v27, v30);
      }
      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v20);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidUpdateComplicationDescriptors:forClientIdentifier:skipSyncObserver:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
}

id sub_10002CAD0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 stringByAppendingPathComponent:@"ComplicationDescriptors"];
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

void sub_10002CB44(void *a1, void *a2, void *a3)
{
  sub_10002F688(a1, a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[NSFileManager defaultManager];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
}

void sub_10002CBB4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  unsigned int v11 = [v7 JSONObjectRepresentation];
  uint64_t v12 = sub_10002F6FC(v10, v8, v9);

  LODWORD(v9) = [v11 writeToFile:v12 atomically:1];
  id v13 = CLKLoggingObjectForDomain();
  uint64_t v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 identifier];
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully wrote complication descriptor %@ for %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_100043EE0(v7, (uint64_t)v8, v14);
  }
}

id sub_10002CD30(void *a1, void *a2, void *a3)
{
  id v3 = sub_10002F688(a1, a2, a3);
  id v4 = [v3 stringByAppendingPathComponent:@"descriptor-sequence-id.string"];

  return v4;
}

id sub_10002CE20(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 64) removeSampleTemplatesForKey:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 40) clientIdentifier];
      id v5 = [*(id *)(a1 + 40) complicationIdentifier];
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NTKDComplicationStore, removing sample data for %@, %@", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectForKey:*(void *)(a1 + 40)];
    sub_10001F4B8(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 64));
    sub_10002CFBC(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    objc_msgSend(*(id *)(a1 + 32), "_queue_incrementSeqId");
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 24);
    id v8 = [*(id *)(v6 + 16) stringByAppendingPathComponent:@"last-delete-sequence-id.string"];
    sub_10001E86C(v7, v8);

    [*(id *)(*(void *)(a1 + 32) + 104) setObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:*(void *)(a1 + 40)];
    sub_10002D12C(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(*(void *)(a1 + 32) + 104));
    return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidRemoveComplicationForKey:skipSyncObserver:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

void sub_10002CFBC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[NSFileManager defaultManager];
  uint64_t v6 = sub_10002F4F4(v4, v3);

  unsigned int v7 = [v5 removeItemAtPath:v6 error:0];
  id v8 = CLKLoggingObjectForDomain();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v3 clientIdentifier];
      __int16 v11 = [v3 complicationIdentifier];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed complication sample data for %@, %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100043F88(v3, v9);
  }
}

void sub_10002D12C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  +[NSMutableDictionary dictionary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F8C8;
  v7[3] = &unk_100062060;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  uint64_t v6 = [v4 stringByAppendingPathComponent:@"deleted.plist"];

  [v5 writeToFile:v6 atomically:1];
}

void sub_10002D470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002D490(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  unsigned int v7 = [v10 identifier];
  id v8 = [*(id *)(a1 + 32) complicationIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_10002D5FC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationstore.asyncwork");
}

void sub_10002D6E0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationstore.asyncobservercallback");
}

void sub_10002DB94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!sub_10001C0DC(*(void **)(a1 + 32), a3)) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10002E0F4(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [a3 copy];
  id v6 = objc_retainBlock(v7);
  [v4 setObject:v6 forKey:v5];
}

void sub_10002E170(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_complicationDescriptorsForClientIdentifier:", *(void *)(a1 + 40));
  id v3 = [v2 copy];

  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002E258;
  v9[3] = &unk_100061190;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  uint64_t v13 = v7;
  id v14 = *(id *)(a1 + 56);
  id v8 = v3;
  objc_msgSend(v4, "_onObserverQueue_async:", v9);
}

id sub_10002E258(uint64_t a1)
{
  return [*(id *)(a1 + 32) complicationStore:*(void *)(a1 + 40) didUpdateComplicationDescriptors:*(void *)(a1 + 48) forClientIdentifier:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

void sub_10002E26C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 64) familiesWithSampleTemplateForKey:v3];
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v8) integerValue];
        id v10 = sub_10002C0B8(*(void **)(*(void *)(a1 + 32) + 16), v3);
        uint64_t v11 = sub_10001BEB4((uint64_t)v10);

        if (v11 && sub_10001C0DC(*(void **)(a1 + 40), v11))
        {
          uint64_t v12 = *(void *)(a1 + 56);
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          void v13[2] = sub_10002E478;
          v13[3] = &unk_100061F68;
          void v13[4] = *(void *)(a1 + 32);
          id v14 = v3;
          id v17 = v9;
          id v15 = *(id *)(a1 + 48);
          id v16 = v11;
          (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v16, v13);
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

void sub_10002E478(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_sampleTemplateReferenceForKey:family:", *(void *)(a1 + 40), *(void *)(a1 + 64));
  id v3 = [v2 copy];

  id v4 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E578;
  v12[3] = &unk_100061C48;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v3;
  id v8 = v7;
  id v10 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v16 = v8;
  uint64_t v18 = v9;
  id v17 = v10;
  id v11 = v3;
  objc_msgSend(v4, "_onObserverQueue_async:", v12);
}

void sub_10002E578(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) clientIdentifier];
  id v5 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 56)];
  [v2 complicationStore:v3 didUpdateSampleTemplateReference:v4 forClientIdentifier:v6 descriptor:v5 family:*(void *)(a1 + 72) seqId:*(void *)(a1 + 64)];
}

void sub_10002E60C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (sub_10001C0DC(*(void **)(a1 + 32), v6))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002E700;
    v9[3] = &unk_1000610F0;
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    void v9[4] = *(void *)(a1 + 40);
    id v10 = v7;
    id v11 = v5;
    id v12 = v6;
    (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v12, v9);
  }
}

void sub_10002E700(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002E7B8;
  v5[3] = &unk_1000610F0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_onObserverQueue_async:", v5);
}

void sub_10002E7B8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) clientIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 48)];
  [v2 complicationStore:v3 didRemoveComplicationSampleTemplatesForClientIdentifier:v5 descriptor:v4 seqId:*(void *)(a1 + 56)];
}

int64_t sub_10002E83C(id a1, NSNumber *a2, NSNumber *a3)
{
  if (sub_10001C0DC(a2, a3)) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_10002E928(uint64_t a1)
{
  [*(id *)(a1 + 32) _faultInAllClientData];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 96));
  [*(id *)(a1 + 40) complicationStore:*(void *)(a1 + 32) loadFullCollectionWithLocalizableSampleTemplates:v3 complicationDescriptors:v2 seqId:*(void *)(a1 + 48)];
}

void sub_10002EC48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    [v5 complicationStore:v3 didSuppressNotificationForSeqId:v4];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = [*(id *)(a1 + 64) clientIdentifier];
    uint64_t v7 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 64)];
    [v2 complicationStore:v3 didUpdateSampleTemplateReference:v6 forClientIdentifier:v8 descriptor:v7 family:*(void *)(a1 + 72) seqId:*(void *)(a1 + 48)];
  }
}

void sub_10002ED1C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) clientIdentifier];
  id v5 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 56)];
  [v2 complicationStore:v3 didUpdateSampleTemplateReference:v4 forClientIdentifier:v6 descriptor:v5 family:*(void *)(a1 + 72) seqId:*(void *)(a1 + 64)];
}

id sub_10002F018(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 complicationStore:v4 didSuppressNotificationForSeqId:*(void *)(a1 + 48)];
  }
  else {
    return objc_msgSend(v3, "complicationStore:didUpdateComplicationDescriptors:forClientIdentifier:seqId:", v4, *(void *)(a1 + 56));
  }
}

id sub_10002F040(uint64_t a1)
{
  return [*(id *)(a1 + 32) complicationStore:*(void *)(a1 + 40) didUpdateComplicationDescriptors:*(void *)(a1 + 48) forClientIdentifier:*(void *)(a1 + 56) seqId:*(void *)(a1 + 64)];
}

void sub_10002F284(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    [v5 complicationStore:v3 didSuppressNotificationForSeqId:v4];
  }
  else
  {
    id v7 = [*(id *)(a1 + 56) clientIdentifier];
    id v6 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 56)];
    [v2 complicationStore:v3 didRemoveComplicationSampleTemplatesForClientIdentifier:v7 descriptor:v6 seqId:*(void *)(a1 + 48)];
  }
}

void sub_10002F344(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) clientIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) _descriptorForKey:*(void *)(a1 + 48)];
  [v2 complicationStore:v3 didRemoveComplicationSampleTemplatesForClientIdentifier:v5 descriptor:v4 seqId:*(void *)(a1 + 56)];
}

id sub_10002F3C8()
{
  id v0 = NTKHomeDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"ComplicationCollectionStores"];

  return v1;
}

id sub_10002F41C()
{
  id v0 = sub_10002F3C8();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"GlobalStores"];

  return v1;
}

id sub_10002F470()
{
  id v0 = sub_10002F3C8();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"PerDeviceStores"];

  return v1;
}

id sub_10002F4C4(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"manifest.plist"];
}

id sub_10002F4D0(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"version.string"];
}

id sub_10002F4DC(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"deleted.plist"];
}

id sub_10002F4E8(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"Complications"];
}

id sub_10002F4F4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 stringByAppendingPathComponent:@"Complications"];
  id v5 = [v3 clientIdentifier];
  id v6 = [v4 stringByAppendingPathComponent:v5];
  id v7 = [v3 complicationIdentifier];

  id v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

id sub_10002F5B4(void *a1, void *a2)
{
  int v2 = sub_10002F4F4(a1, a2);
  id v3 = CLKStringForComplicationFamily();
  uint64_t v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

id sub_10002F628(void *a1, void *a2)
{
  int v2 = sub_10002F5B4(a1, a2);
  id v3 = [v2 stringByAppendingPathComponent:@"sample-template-content-hash.string"];

  return v3;
}

id sub_10002F67C(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"ComplicationDescriptors"];
}

id sub_10002F688(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10002CAD0(a1, a2);
  id v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

id sub_10002F6FC(void *a1, void *a2, void *a3)
{
  id v3 = sub_10002F688(a1, a2, a3);
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"descriptor"];

  return v4;
}

void sub_10002F750(void *a1, void *a2)
{
  sub_10002F628(a1, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  int v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtPath:v3 error:0];
}

void sub_10002F7B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  objc_opt_class();
  NTKValidateDictionary();
  id v7 = objc_alloc((Class)NTKComplicationKey);
  id v8 = [v6 objectForKeyedSubscript:@"clientID"];
  id v9 = [v6 objectForKeyedSubscript:@"typeID"];

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = CLKDefaultComplicationIdentifier;
  }
  id v11 = [v7 initWithClientIdentifier:v8 complicationIdentifier:v10];

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v11];
}

void sub_10002F8C8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = @"clientID";
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 clientIdentifier];
  v11[1] = @"typeID";
  v12[0] = v7;
  id v8 = [v6 complicationIdentifier];

  id v9 = CLKDefaultComplicationIdentifier;
  if (v8) {
    id v9 = v8;
  }
  v12[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v4 setObject:v5 forKey:v10];
}

void sub_10003032C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    id v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100044044();
    }

    objc_end_catch();
    JUMPOUT(0x100030284);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000303EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  objc_opt_class();
  NTKValidateDictionary();
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000304F0;
  v8[3] = &unk_100062098;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void sub_1000304F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  NTKValidateArray();
  id v9 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:*(void *)(a1 + 32) complicationIdentifier:v6];

  id v7 = *(void **)(*(void *)(a1 + 40) + 16);
  id v8 = [v5 mutableCopy];

  [v7 setObject:v8 forKey:v9];
}

void sub_100030878(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 clientIdentifier];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    if (!v8)
    {
      id v8 = +[NSMutableDictionary dictionary];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
    }
    uint64_t v9 = [v5 complicationIdentifier];
    id v10 = (void *)v9;
    id v11 = CLKDefaultComplicationIdentifier;
    if (v9) {
      id v11 = (NSString *)v9;
    }
    id v12 = v11;

    [v8 setObject:v6 forKeyedSubscript:v12];
  }
  else
  {
    id v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000440B4(v8);
    }
  }
}

void sub_1000309E4(id a1)
{
  qword_100072438 = (uint64_t)dispatch_queue_create("com.apple.ntkd.collectionstorecreation", 0);

  _objc_release_x1();
}

void sub_100030A24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id sub_100030FD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetSync");
}

id sub_100031050(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deltaSync_async");
}

void sub_100031164(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!a2)
  {
    id v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100044160();
    }
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  switch(v9)
  {
    case 3:
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v15 = 138412290;
        uint64_t v16 = v13;
        id v12 = "sent up next log collection message to companion: %@";
        goto LABEL_13;
      }
LABEL_14:

      break;
    case 2:
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 138412290;
        uint64_t v16 = v14;
        id v12 = "sent memory viewed with collection identifier to companion: %@";
        goto LABEL_13;
      }
      goto LABEL_14;
    case 1:
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v15 = 138412290;
        uint64_t v16 = v11;
        id v12 = "sent library validation hash to companion: %@";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
  }
}

id sub_100031404(uint64_t a1)
{
  int v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "reset sync successfully requested", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) setNeedsResetSync];
}

id sub_1000314F8(uint64_t a1)
{
  int v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "delta sync successfully requested", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) setHasChangesAvailable];
}

void sub_1000315EC(uint64_t a1)
{
  int v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "delta sync request queued", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000316BC;
  block[3] = &unk_100060A90;
  void block[4] = v3;
  dispatch_async(v4, block);
}

id sub_1000316BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setHasChangesAvailable];
}

uint64_t sub_10003195C(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return result;
}

void *sub_100032A5C(void *result)
{
  if (*(unsigned char *)(result[4] + 32))
  {
    uint64_t v1 = result;
    int v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "requesting new reset sync after previous failure", v3, 2u);
    }

    ++*(void *)(v1[4] + 40);
    *(unsigned char *)(v1[4] + 32) = 0;
    return objc_msgSend((id)v1[4], "_queue_resetSync");
  }
  return result;
}

id sub_100033980(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    ++*(void *)(v2 + 40);
  }
  else
  {
    *(void *)(v2 + 40) = 0;
    [*(id *)(a1 + 40) _resetBackoffPeriod];
  }
  id result = [*(id *)(a1 + 48) isResetSync];
  if (result) {
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 0;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v4 + 64))
    {
      *(unsigned char *)(v4 + 64) = 0;
      uint64_t v5 = *(void **)(a1 + 40);
      return objc_msgSend(v5, "_queue_deltaSync");
    }
    else if (*(unsigned char *)(v4 + 65))
    {
      *(unsigned char *)(v4 + 65) = 0;
      id v6 = *(void **)(a1 + 40);
      return objc_msgSend(v6, "_queue_resetSync");
    }
  }
  return result;
}

void sub_100033B9C(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Pairing ID did switched. Reset _resetSyncRequested to NO.", v3, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

id sub_100033FA4()
{
  if (qword_100072450 != -1) {
    dispatch_once(&qword_100072450, &stru_100062150);
  }
  id v0 = (void *)qword_100072448;

  return v0;
}

void sub_1000349F8(id a1)
{
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"sync.wideloadstaging"];
  uint64_t v3 = (void *)qword_100072448;
  qword_100072448 = v2;

  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:qword_100072448 withIntermediateDirectories:1 attributes:0 error:0];
}

void sub_100034A98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100034AB4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100034AF0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100034CD0(uint64_t a1)
{
  if (sub_100009838())
  {
    int v2 = NTKDebugDaemonRunningSnapshotTestingTool();
    uint64_t v3 = *(void **)(a1 + 32);
    if (v2)
    {
      return [v3 runSnapshotTool];
    }
    else
    {
      return [v3 runDaemon];
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 killDaemon];
  }
}

void sub_100034F88(id a1)
{
  uint64_t v1 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v2 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v3 = [v2 getAllDevices];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = NRDevicePropertyPairingID;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) valueForProperty:v7];
        [v1 addObject:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v1;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned stores and sync data with current device uuids: %@", buf, 0xCu);
  }

  +[NTKDCollectionStore cleanupOrphanedStoresWithCurrentDeviceUUIDs:v1];
  +[NTKDComplicationStore cleanupOrphanedStoresWithCurrentDeviceUUIDs:v1];
  +[NTKDSyncController cleanupOrphanedSyncDirectoriesWithCurrentDeviceUUIDs:v1];
}

intptr_t sub_100035164(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003516C(id a1)
{
  id v1 = +[NTKDCollectionCoordinator sharedInstance];
  [v1 removeOrphanedResourceDirectories];
}

void sub_1000351B4(id a1)
{
  id v1 = +[NTKDSiriDataSourcesObserver sharedInstance];
  [v1 updateDeviceDataSourcesInNanoPreferences];

  id v2 = +[NTKSiriDefaults sharedInstance];
  [v2 migrateIfNecessary];
}

void sub_100035368(id a1)
{
  id v1 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&stru_100062210 block:10.0];
}

void sub_1000353A0(id a1, NSTimer *a2)
{
  id v2 = a2;
  uint64_t v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "daemon exiting", v4, 2u);
  }

  exit(0);
}

void sub_100035680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000356A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

void sub_100035754(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
  id v4 = +[NTKDComplicationStoreCoordinator sharedInstance];
  [v4 relinquishStore:*(void *)(*(void *)(a1 + 32) + 24)];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_100035928(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationcollectionclient.busy");
}

void sub_100035964(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 24))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void **)(v1 + 32);
    id v4 = [*(id *)(a1 + 40) copy];
    [v3 addObject:v4];
  }
}

void sub_100035A98(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.complicationcollectionclient.busy");
}

void sub_100035BD0(void *a1)
{
  uint64_t v2 = +[NTKDComplicationStoreCoordinator sharedInstance];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100035C98;
  v6[3] = &unk_100062298;
  uint64_t v5 = (void *)a1[7];
  void v6[4] = a1[6];
  id v7 = v5;
  [v2 checkoutStoreForComplicationCollectionIdentifier:v3 deviceUUID:v4 withHandler:v6];

  sub_10000B870(@"com.apple.ntkd.complicaitoncollectionclient.register");
}

void sub_100035C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035D54;
  block[3] = &unk_100060C58;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

id sub_100035D54(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 24) addObserver:*(void *)(a1 + 32) withSeqId:*(void *)(a1 + 48)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeAllObjects", (void)v8);
}

id sub_100035F68(void *a1)
{
  return [*(id *)(a1[4] + 24) updateLocalizableSampleDataTemplate:a1[5] forClientIdentifier:a1[6] descriptor:a1[7] family:a1[8]];
}

id sub_100036040(void *a1)
{
  return [*(id *)(a1[4] + 24) updateComplicationDescriptors:a1[5] forClientIdentifier:a1[6]];
}

id sub_100036114(void *a1)
{
  return [*(id *)(a1[4] + 24) removeComplicationSampleTemplatesForClientIdentifier:a1[5] descriptor:a1[6]];
}

void sub_100036208(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) remoteObjectProxy];
  [v2 loadFullCollectionWithLocalizableSampleTemplates:a1[5] complicationDescriptors:a1[6] seqId:a1[7]];
}

void sub_1000363D0(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) remoteObjectProxy];
  [v2 updateSampleTemplateReference:a1[5] forClientIdentifier:a1[6] descriptor:a1[7] family:a1[9] seqId:a1[8]];
}

void sub_100036510(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) remoteObjectProxy];
  [v2 updateComplicationDescriptors:a1[5] forClientIdentifier:a1[6] seqId:a1[7]];
}

void sub_10003664C(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) remoteObjectProxy];
  [v2 removeComplicationSampleTemplatesForClientIdentifier:a1[5] descriptor:a1[6] seqId:a1[7]];
}

void sub_100036774(id a1)
{
  qword_100072458 = objc_alloc_init(NTKDSyncController);

  _objc_release_x1();
}

id sub_100036A44()
{
  id v0 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v1 = +[NSFileManager defaultManager];
  id v2 = sub_100042758();
  id v3 = [v1 contentsOfDirectoryAtPath:v2 error:0];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        if (v8) {
          [v0 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v0;
}

void sub_100036CD0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldEnableSyncPrintingLogs:1])
  {
    [*(id *)(a1 + 32) setUp];
  }
  else
  {
    id v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SYNC DISABLED.", v5, 2u);
    }
  }
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"handleDeviceTinkerStateChangedNotification" name:CLKActiveDeviceChangedTinkerState object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"handleActiveDeviceChangedNotification" name:CLKActiveDeviceChangedNotification object:0];
}

id sub_10003706C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) shouldEnableSyncPrintingLogs:1];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 setUp];
  }
  else
  {
    return [v3 tearDown];
  }
}

id sub_10003719C(uint64_t a1)
{
  uint64_t v2 = +[CLKDevice currentDevice];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  unsigned int v5 = [*(id *)(a1 + 32) shouldEnableSyncPrintingLogs:1];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    return [v6 setUp];
  }
  else
  {
    return [v6 tearDown];
  }
}

id sub_100037974(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NTKPigmentSyncReceiver);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_applyIncomingMessageLists");
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
  unsigned int v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_queue_requestSyncIfNecessary");
}

id sub_100037BDC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) enumerateKeysAndObjectsUsingBlock:&stru_1000622F8];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 80) enumerateKeysAndObjectsUsingBlock:&stru_100062338];
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v2 removeAllObjects];
}

void sub_100037C48(id a1, id a2, NTKDCollectionStore *a3, BOOL *a4)
{
}

void sub_100037C50(id a1, id a2, NSDictionary *a3, BOOL *a4)
{
}

void sub_100037C60(id a1, NSString *a2, NTKDComplicationStore *a3, BOOL *a4)
{
}

id sub_100037DFC(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if ([*(id *)(a1 + 32) syncSessionType]) {
      uint64_t v3 = "QWS";
    }
    else {
      uint64_t v3 = "RESET";
    }
    id v4 = [*(id *)(a1 + 32) sessionIdentifier];
    int v8 = 136315394;
    long long v9 = v3;
    __int16 v10 = 2112;
    long long v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "starting paired sync %s session with ID = %@", (uint8_t *)&v8, 0x16u);
  }
  if ([*(id *)(a1 + 40) shouldEnableSync]) {
    return [*(id *)(*(void *)(a1 + 40) + 8) syncCoordinator:*(void *)(a1 + 48) beginSyncSession:*(void *)(a1 + 32)];
  }
  uint64_t v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) sessionIdentifier];
    int v8 = 138412290;
    long long v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying pairedSync session completed with ID = %@", (uint8_t *)&v8, 0xCu);
  }
  return [*(id *)(a1 + 32) syncDidComplete];
}

void sub_1000381D4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100038264;
  v2[3] = &unk_100060AB8;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 ensureSyncIsActive:v2];
}

id sub_100038264(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) syncCoordinatorDidChangeSyncRestriction:*(void *)(a1 + 40)];
}

uint64_t sub_100038420(uint64_t a1)
{
  +[CLKDevice resetCurrentDevice];
  uint64_t v2 = +[CLKDevice currentDevice];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  unsigned int v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100044C10(a1 + 32, v5);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000385D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000385F0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[1] requestDeltaSync];
    id WeakRetained = v2;
  }
}

void sub_1000386FC(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) deviceUUID];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 72);
  id v4 = sub_1000387C0(v9);
  [v3 setObject:v2 forKey:v4];

  unsigned int v5 = objc_msgSend(*(id *)(a1 + 40), "_queue_storeStatusForDeviceUUID:", v9);
  [*(id *)(a1 + 32) clearSyncObserver];
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  int v8 = [v5 seqId];
  [v7 setSyncObserver:v6 withSeqId:v8];
}

id sub_1000387C0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  id v4 = v3;

  return v4;
}

void sub_1000388E4(uint64_t a1)
{
  [*(id *)(a1 + 32) clearSyncObserver];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 72);
  id v5 = [v2 deviceUUID];
  id v4 = sub_1000387C0(v5);
  [v3 removeObjectForKey:v4];
}

void sub_1000389EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) deviceUUID];
  id v3 = *(void **)(*(void *)(a1 + 40) + 80);
  id v20 = v2;
  id v4 = sub_1000387C0(v2);
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  __int16 v10 = *(void **)(a1 + 32);
  long long v11 = [v10 collectionIdentifier];
  [v9 setObject:v10 forKeyedSubscript:v11];

  long long v12 = *(void **)(*(void *)(a1 + 40) + 80);
  long long v13 = sub_1000387C0(v20);
  [v12 setObject:v9 forKey:v13];

  long long v14 = *(void **)(a1 + 40);
  int v15 = [*(id *)(a1 + 32) collectionIdentifier];
  uint64_t v16 = objc_msgSend(v14, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v20, v15);

  [*(id *)(a1 + 32) clearSyncObserver];
  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  long long v19 = [v16 seqId];
  [v18 setSyncObserver:v17 withSeqId:v19];
}

void sub_100038BF0(uint64_t a1)
{
  [*(id *)(a1 + 32) clearSyncObserver];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 80);
  id v5 = [v2 deviceUUID];
  id v4 = sub_1000387C0(v5);
  [v3 removeObjectForKey:v4];
}

void sub_100038DD8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_storeStatusForDeviceUUID:", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setNeedsResetSync:1];
  [v4 setSeqId:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100038FE4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:4];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_100039204(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:5];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_100039470(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:1 withFaceUUID:*(void *)(a1 + 48)];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003970C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:2 withFaceUUID:*(void *)(a1 + 48)];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10003998C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:9 withFaceUUID:*(void *)(a1 + 48)];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_100039BFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:0 withFaceUUID:*(void *)(a1 + 48)];
  [v9 enqueueMessage:v4];

  id v5 = +[NTKDSyncMessage messageOfType:5];
  [v9 enqueueMessage:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) deviceUUID];
  id v8 = objc_msgSend(v6, "_queue_storeStatusForDeviceUUID:", v7);

  [v8 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_100039EC4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = +[NTKDSyncMessage messageOfType:3 withFaceUUID:*(void *)(a1 + 48)];
  [v8 enqueueMessage:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) deviceUUID];
  id v7 = objc_msgSend(v5, "_queue_storeStatusForDeviceUUID:", v6);

  [v7 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10003A120(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_storeStatusForDeviceUUID:", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setSeqId:*(void *)(a1 + 48)];
}

void sub_10003A300(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  objc_msgSend(v2, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setNeedsResetSync:1];
  [v5 setSeqId:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003A58C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = +[NSNumber numberWithInteger:*(void *)(a1 + 72)];
  id v8 = +[NTKDSyncMessage messageOfType:8 withCollectionIdentifier:v4 clientId:v5 descriptor:v6 family:v7];
  [v13 enqueueMessage:v8];

  id v9 = *(void **)(a1 + 32);
  __int16 v10 = [*(id *)(a1 + 40) deviceUUID];
  long long v11 = [*(id *)(a1 + 40) collectionIdentifier];
  long long v12 = objc_msgSend(v9, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v10, v11);

  [v12 setSeqId:*(void *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003A85C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  uint64_t v5 = +[NTKDSyncMessage messageOfType:10 withCollectionIdentifier:v4 clientId:*(void *)(a1 + 48)];
  [v10 enqueueMessage:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) deviceUUID];
  id v8 = [*(id *)(a1 + 40) collectionIdentifier];
  id v9 = objc_msgSend(v6, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v7, v8);

  [v9 setSeqId:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003AB28(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  objc_msgSend(v2, "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  uint64_t v5 = +[NTKDSyncMessage messageOfType:7 withCollectionIdentifier:v4 clientId:*(void *)(a1 + 48) descriptor:*(void *)(a1 + 56) family:0];
  [v10 enqueueMessage:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) deviceUUID];
  id v8 = [*(id *)(a1 + 40) collectionIdentifier];
  id v9 = objc_msgSend(v6, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v7, v8);

  [v9 setSeqId:*(void *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003ADAC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  objc_msgSend(v2, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setSeqId:*(void *)(a1 + 48)];
}

id sub_10003AF78(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) deviceUUID];
  id v4 = [*(id *)(a1 + 40) collectionIdentifier];
  id v5 = objc_msgSend(v2, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v3, v4);
  [v5 setNeedsResetSync:1];

  uint64_t v6 = *(void **)(a1 + 32);

  return objc_msgSend(v6, "_queue_requestSyncIfNecessary");
}

id sub_10003B0E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
}

void sub_10003B164(uint64_t a1)
{
  sub_10000B610(@"com.apple.ntkd.synccontroller.outgoingsession");
  ++*(void *)(*(void *)(a1 + 32) + 168);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) nrDevice];
  id v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = LogBool();
    *(_DWORD *)buf = 138412546;
    long long v54 = v5;
    __int16 v55 = 2112;
    long long v56 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "outgoing session (reset=%@) did start for device with UUID: %@", buf, 0x16u);
  }
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_queue_checkoutLibraryStoreForDeviceUUID:", v3);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v6;

  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_queue_storeStatusForDeviceUUID:", v3);
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v9;

  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "_queue_checkoutComplicationStoresForDeviceUUID:", v3);
  uint64_t v13 = *(void *)(a1 + 32);
  long long v14 = *(void **)(v13 + 128);
  *(void *)(v13 + 128) = v12;

  int v15 = *(id **)(a1 + 32);
  uint64_t v16 = [v15[16] allKeys];
  uint64_t v17 = objc_msgSend(v15, "_queue_complicationStoreStatusesForDeviceUUID:withIdentifiers:", v3, v16);
  uint64_t v18 = *(void *)(a1 + 32);
  long long v19 = *(void **)(v18 + 112);
  *(void *)(v18 + 112) = v17;

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 40);
  if ([*(id *)(*(void *)(a1 + 32) + 184) prepareForSyncing:*(unsigned __int8 *)(a1 + 40)])
  {
    id v20 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#color-sync Prepared for syncing pigment list.", buf, 2u);
    }
  }
  int v21 = *(unsigned __int8 *)(a1 + 40);
  __int16 v22 = objc_msgSend(*(id *)(a1 + 32), "_queue_outgoingMessageListForDeviceUUID:", v3);
  id v23 = v22;
  if (v21)
  {
    [v22 clearAllMessages];

    __int16 v24 = [[_MessageList alloc] initWithPersistencePath:0];
    uint64_t v25 = *(void *)(a1 + 32);
    __int16 v26 = *(void **)(v25 + 96);
    *(void *)(v25 + 96) = v24;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 120) orderedUUIDs];
    id v28 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*(void *)(a1 + 32) + 96);
          long long v33 = +[NTKDSyncMessage messageOfType:0 withFaceUUID:*(void *)(*((void *)&v48 + 1) + 8 * (void)v31)];
          [v32 enqueueMessage:v33];

          uint64_t v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v29);
    }

    long long v34 = *(void **)(*(void *)(a1 + 32) + 96);
    long long v35 = +[NTKDSyncMessage messageOfType:5];
    [v34 enqueueMessage:v35];

    long long v36 = *(void **)(*(void *)(a1 + 32) + 96);
    long long v37 = +[NTKDSyncMessage messageOfType:4];
    [v36 enqueueMessage:v37];

    uint64_t v38 = *(void *)(a1 + 32);
    long long v39 = *(void **)(v38 + 128);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    void v47[2] = sub_10003B630;
    v47[3] = &unk_1000623C8;
    v47[4] = v38;
    [v39 enumerateKeysAndObjectsUsingBlock:v47];
  }
  else
  {
    uint64_t v40 = *(void *)(a1 + 32);
    id v41 = *(void **)(v40 + 96);
    *(void *)(v40 + 96) = v22;
  }
  *(void *)(*(void *)(a1 + 32) + 144) = [*(id *)(*(void *)(a1 + 32) + 96) count];
  *(void *)(*(void *)(a1 + 32) + 152) = 0;
  long long v42 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    long long v43 = *(void **)(*(void *)(a1 + 32) + 144);
    *(_DWORD *)buf = 134217984;
    long long v54 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "estimated number of messages to send (except color-sync): %lu", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) suspendCoalescing];
  uint64_t v44 = [*(id *)(*(void *)(a1 + 32) + 96) messageEnumerator];
  uint64_t v45 = *(void *)(a1 + 32);
  __int16 v46 = *(void **)(v45 + 160);
  *(void *)(v45 + 160) = v44;
}

void sub_10003B630(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = a3;
  id obj = [v15 clients];
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v11 = [v15 complicationDescriptorsForClientIdentifier:v10];
        uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 96);
        uint64_t v13 = +[NTKDSyncMessage messageOfType:10 withCollectionIdentifier:v5 clientId:v10];
        [v12 enqueueMessage:v13];

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10003B814;
        v16[3] = &unk_1000623A0;
        v16[4] = *(void *)(a1 + 32);
        id v17 = v5;
        uint64_t v18 = v10;
        [v11 enumerateObjectsUsingBlock:v16];
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

void sub_10003B814(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1[4] + 96);
  id v3 = +[NTKDSyncMessage messageOfType:6 withCollectionIdentifier:a1[5] clientId:a1[6] descriptor:a2 family:0];
  [v2 enqueueMessage:v3];
}

void sub_10003BA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003BA28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003BA38(uint64_t a1)
{
}

void sub_10003BA40(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 184) isSyncing])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
    id v19 = 0;
    id v3 = [v2 nextSyncData:&v19];
    id v4 = v19;
    id v5 = v4;
    if (v3)
    {
      id v6 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#color-sync Sending color sync data to outgoing session.", buf, 2u);
      }

      uint64_t v7 = +[NTKDSyncMessage colorSyncMessageWithData:v3 domain:v5];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      return;
    }
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 160) nextObject];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    ++*(void *)(*(void *)(a1 + 32) + 152);
    uint64_t v13 = *(void **)(a1 + 32);
    unint64_t v14 = v13[18];
    if (v14)
    {
      double v15 = (double)(unint64_t)v13[19] / (double)v14;
      uint64_t v16 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 144);
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 152);
        *(_DWORD *)buf = 134218496;
        uint64_t v21 = v18;
        __int16 v22 = 2048;
        uint64_t v23 = v17;
        __int16 v24 = 2048;
        double v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "progress: %lu / %lu => %f", buf, 0x20u);
      }

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setProgress:", fmin(v15, 1.0));
      uint64_t v13 = *(void **)(a1 + 32);
    }
    objc_msgSend(v13, "_queue_addPayloadToMessage:withFaceStore:complicationStores:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v13[15], v13[16]);
  }
}

id sub_10003BE14(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 136))
    {
      [*(id *)(v2 + 104) setNeedsResetSync:0];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", 0);
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v24;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v24 != v6) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * (void)v7) setNeedsResetSync:0];
            uint64_t v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          id v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v5);
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(v2 + 96) clearMessageCount:*(void *)(v2 + 152)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_endGuardingOutgoingSessionRequest");
  }
  else
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100044CE8(a1, v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_endGuardingOutgoingSessionRequest");
    objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessary");
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 160);
  *(void *)(v9 + 160) = 0;

  [*(id *)(*(void *)(a1 + 32) + 96) resumeCoalescing];
  uint64_t v11 = +[NTKDCollectionCoordinator sharedInstance];
  [v11 relinquishStore:*(void *)(*(void *)(a1 + 32) + 120)];

  [*(id *)(*(void *)(a1 + 32) + 128) enumerateKeysAndObjectsUsingBlock:&stru_1000623E8];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 120);
  *(void *)(v12 + 120) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = *(void **)(v14 + 128);
  *(void *)(v14 + 128) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 104);
  *(void *)(v16 + 104) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 112);
  *(void *)(v18 + 112) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 96);
  *(void *)(v20 + 96) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 184) finishSyncing:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10003C050(id a1, NSString *a2, NTKDComplicationStore *a3, BOOL *a4)
{
  id v4 = a3;
  id v5 = +[NTKDComplicationStoreCoordinator sharedInstance];
  [v5 relinquishStore:v4];
}

void sub_10003C0B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSetup])
  {
    sub_10000B870(@"com.apple.ntkd.synccontroller.outgoingsession");
    --*(void *)(*(void *)(a1 + 32) + 168);
  }
}

void sub_10003C174(uint64_t a1)
{
  sub_10000B610(@"com.apple.ntkd.synccontroller.incomingsession");
  ++*(void *)(*(void *)(a1 + 32) + 176);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) nrDevice];
  id v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = LogBool();
    int v23 = 138412546;
    long long v24 = v5;
    __int16 v25 = 2112;
    long long v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "incoming session (reset=%@) did start for device with UUID: %@", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_queue_checkoutLibraryStoreForDeviceUUID:", v3);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v6;

  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_queue_storeStatusForDeviceUUID:", v3);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 104);
  *(void *)(v10 + 104) = v9;

  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "_queue_checkoutComplicationStoresForDeviceUUID:", v3);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 128);
  *(void *)(v13 + 128) = v12;

  double v15 = *(id **)(a1 + 32);
  uint64_t v16 = [v15[16] allKeys];
  uint64_t v17 = objc_msgSend(v15, "_queue_complicationStoreStatusesForDeviceUUID:withIdentifiers:", v3, v16);
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 112);
  *(void *)(v18 + 112) = v17;

  uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_queue_incomingMessageListForDeviceUUID:", v3);
  uint64_t v21 = *(void *)(a1 + 32);
  __int16 v22 = *(void **)(v21 + 96);
  *(void *)(v21 + 96) = v20;

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 40);
}

void sub_10003C3DC(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "incoming session: enqueuing request to reset data store", v5, 2u);
  }

  id v3 = *(void **)(*(void *)(a1 + 32) + 96);
  id v4 = +[NTKDSyncMessage messageOfType:-1];
  [v3 enqueueMessage:v4];
}

void sub_10003C5B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) messageType] == (id)11)
  {
    uint64_t v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "#color-sync Received color sync data.", v10, 2u);
    }

    id v3 = [*(id *)(*(void *)(a1 + 40) + 24) nrDevice];
    id v4 = [v3 valueForProperty:NRDevicePropertyPairingID];

    id v5 = *(void **)(*(void *)(a1 + 40) + 192);
    uint64_t v6 = [*(id *)(a1 + 32) payloadData];
    uint64_t v7 = [*(id *)(a1 + 32) label];
    [v5 processSyncData:v6 domain:v7 deviceUUID:v4];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 96);
    [v9 enqueueMessage:v8];
  }
}

void sub_10003C860(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) nrDevice];
  id v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  [*(id *)(*(void *)(a1 + 32) + 192) finishSyncingForDeviceUUID:v3 success:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 136))
    {
      [*(id *)(v4 + 104) setNeedsResetSync:0];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v5 = [*(id *)(*(void *)(a1 + 32) + 112) allValues];
      id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v24;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) setNeedsResetSync:0];
          }
          id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v7);
      }

      uint64_t v4 = *(void *)(a1 + 32);
    }
    objc_msgSend((id)v4, "_queue_applyIncomingMessageList:collectionStore:complicationStores:storeStatus:", *(void *)(v4 + 96), *(void *)(v4 + 120), *(void *)(v4 + 128), *(void *)(v4 + 104));
  }
  else
  {
    uint64_t v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "clearing incoming message list after unsuccessful sync session", v22, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 96) clearAllMessages];
    objc_msgSend(*(id *)(a1 + 32), "_queue_requestSyncIfNecessaryAndForceDeltaRequestOtherwise:", 1);
  }
  uint64_t v11 = +[NTKDCollectionCoordinator sharedInstance];
  [v11 relinquishStore:*(void *)(*(void *)(a1 + 32) + 120)];

  [*(id *)(*(void *)(a1 + 32) + 128) enumerateKeysAndObjectsUsingBlock:&stru_100062408];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 120);
  *(void *)(v12 + 120) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = *(void **)(v14 + 128);
  *(void *)(v14 + 128) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 96);
  *(void *)(v16 + 96) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 104);
  *(void *)(v18 + 104) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 112);
  *(void *)(v20 + 112) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
}

void sub_10003CAD8(id a1, NSString *a2, NTKDComplicationStore *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  id v5 = +[NTKDComplicationStoreCoordinator sharedInstance];
  [v5 relinquishStore:v4];
}

void sub_10003CB3C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSetup])
  {
    sub_10000B870(@"com.apple.ntkd.synccontroller.incomingsession");
    --*(void *)(*(void *)(a1 + 32) + 176);
  }
}

void sub_10003CC1C(uint64_t a1)
{
  sub_10000B610(@"com.apple.ntkd.synccontroller.libraryvalidation");
  uint64_t v2 = sub_1000090CC();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CCEC;
  v6[3] = &unk_100060C58;
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v4;
  id v9 = v3;
  id v5 = v2;
  objc_msgSend(v4, "_queue_executeIfSyncQueuesAreEmpty:", v6);
  sub_10000B870(@"com.apple.ntkd.synccontroller.libraryvalidation");
}

void sub_10003CCEC(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "validating library store for device UUID: %@", buf, 0xCu);
  }

  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_checkoutLibraryStoreForDeviceUUID:", *(void *)(a1 + 32));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10003CE3C;
  uint64_t v10 = &unk_100062430;
  id v5 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v5;
  [v4 flushAndComputeValidationHashWithObserverCallback:&v7];
  id v6 = +[NTKDCollectionCoordinator sharedInstance];
  [v6 relinquishStore:v4];
}

void sub_10003CE3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CEF4;
  v6[3] = &unk_100060C58;
  void v6[4] = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  objc_msgSend(v4, "_onQueue_async:", v6);
}

void sub_10003CEF4(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CF98;
  v5[3] = &unk_100060C58;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  objc_msgSend(v2, "_queue_executeIfSyncQueuesAreEmpty:", v5);
}

uint64_t sub_10003CF98(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if ([*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)])
  {
    id v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *v2;
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "library store validation succeeded -- hash matches between gizmo and companion: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (NTKInternalBuild() {
         && CFPreferencesGetAppBooleanValue(@"EnableSyncFailureAlerts", NTKFacePreferencesDomain, 0))
  }
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100044DD4();
    }

    sub_100009208(@"Validation Failure", @"A discrepancy between the clock faces on your Watch and iPhone has been detected. Tap 'OK' to raise a radar. Please compare the faces between your devices and note any differences in the radar. (Internal alert only.)", @"Sync: Inconsistent Clock Faces Library State Detected (via Prompt)");
  }
  else
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100044D64();
    }

    [*(id *)(*(void *)(a1 + 48) + 8) requestResetSync];
    objc_msgSend(*(id *)(a1 + 48), "_queue_beginGuardingOutgoingSessionRequest");
  }
  return NTKSubmitClockFacesValidation();
}

void sub_10003D2FC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  sub_10000B870(@"com.apple.ntkd.synccontroller.busy");
}

void sub_10003D5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003D604(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003D940(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = +[NTKDComplicationStoreCoordinator sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003DA2C;
  v7[3] = &unk_100062458;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  [v4 checkoutStoreForComplicationCollectionIdentifier:v6 deviceUUID:v5 withHandler:v7];
}

void sub_10003DA2C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

id sub_10003DA70()
{
  v2[0] = NTKComplicationCollectionIdentifierRemoteComplications;
  v2[1] = NTKComplicationCollectionIdentifierWidgetComplications;
  v2[2] = NTKComplicationCollectionIdentifierBundleComplications;
  id v0 = +[NSArray arrayWithObjects:v2 count:3];

  return v0;
}

uint64_t sub_10003DB0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003DBF4(void *a1)
{
  id v1 = a1;
  id v3 = +[NSFileManager defaultManager];
  uint64_t v2 = sub_1000426BC(v1);

  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];
}

id sub_10003DC7C(void *a1)
{
  id v1 = sub_1000426BC(a1);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"outgoing-messages.plist"];

  return v2;
}

id sub_10003DDA8(void *a1)
{
  id v1 = sub_1000426BC(a1);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"incoming-messages.plist"];

  return v2;
}

id sub_10003DED4(void *a1)
{
  id v1 = sub_1000426BC(a1);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"store-status.plist"];

  return v2;
}

id sub_10003E07C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 UUIDString];
  uint64_t v5 = +[NSString stringWithFormat:@"%@-%@", v4, v3];

  return v5;
}

id sub_10003E104(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSString stringWithFormat:@"%@.plist", a2];
  uint64_t v5 = sub_10004283C(v3);

  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

void sub_10003E78C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 hasMessages])
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10003EA08(v5);
      *(_DWORD *)buf = 138412290;
      long long v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "incoming message list for device uuid '%@' has messages; will apply...",
        buf,
        0xCu);
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = sub_10003EA08(v5);
    uint64_t v11 = objc_msgSend(v9, "_queue_checkoutLibraryStoreForDeviceUUID:", v10);

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = sub_10003EA08(v5);
    uint64_t v14 = objc_msgSend(v12, "_queue_checkoutComplicationStoresForDeviceUUID:", v13);

    double v15 = *(void **)(a1 + 32);
    uint64_t v16 = sub_10003EA08(v5);
    uint64_t v17 = objc_msgSend(v15, "_queue_storeStatusForDeviceUUID:", v16);

    long long v26 = (void *)v17;
    objc_msgSend(*(id *)(a1 + 32), "_queue_applyIncomingMessageList:collectionStore:complicationStores:storeStatus:", v6, v11, v14, v17);
    uint64_t v18 = +[NTKDCollectionCoordinator sharedInstance];
    [v18 relinquishStore:v11];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v14;
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        long long v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v23);
          long long v25 = +[NTKDComplicationStoreCoordinator sharedInstance];
          [v25 relinquishStore:v24];

          long long v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v21);
    }
  }
}

id sub_10003EA08(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

void sub_10003F4E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10003F544(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];

  id v5 = (id)objc_opt_new();
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v3];
}

id sub_10003F5D8()
{
  if (qword_100072470 != -1) {
    dispatch_once(&qword_100072470, &stru_100062620);
  }
  id v0 = (void *)qword_100072468;

  return v0;
}

void sub_10003F62C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];

  if ([v5 count] || objc_msgSend(v6, "count"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F7B4;
    v15[3] = &unk_1000624F8;
    id v8 = v7;
    id v16 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_10003F7C0;
    uint64_t v13 = &unk_100062520;
    id v9 = v8;
    id v14 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:&v10];
    objc_msgSend(v9, "synchronize", v10, v11, v12, v13);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

id sub_10003F7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) withoutNotifyingUpdateComplicationDescriptors:a3 forClientIdentifier:a2];
}

void sub_10003F7C0(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 inflatedCopy];
  id v9 = [v11 clientIdentifier];
  id v10 = [v11 descriptor];
  [v7 withoutNotifyingSyncObserverSetComplicationSampleData:v8 forClientIdentifier:v9 descriptor:v10];
}

void sub_100040260(id a1, NSString *a2, NTKDComplicationStore *a3, BOOL *a4)
{
}

void sub_100040F14(_Unwind_Exception *a1)
{
}

id sub_100041220(void *a1)
{
  uint64_t v1 = qword_100072490;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_100072490, &stru_1000626B0);
  }
  id v3 = (id)qword_100072488;
  id v4 = [v2 stringByAppendingPathExtension:@"data"];

  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

void sub_1000413CC(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 32) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [a2 objectForKey:@"payload-id"];
    if (v6)
    {
      id v4 = +[NSFileManager defaultManager];
      id v5 = sub_100041220(v6);
      [v4 removeItemAtPath:v5 error:0];
    }
  }
}

void sub_10004154C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100041564(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureCoalescingSuspended];
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) _messageAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }

  return v3;
}

uint64_t sub_100041D48(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _getMessageType:v4];
  id v6 = *(id *)(a1 + 80);
  id v7 = [*(id *)(a1 + 32) _getFaceUUID:v4];
  uint64_t v8 = NTKEqualObjects();

  id v9 = [*(id *)(a1 + 32) _getClientID:v4];
  int v10 = NTKEqualObjects();

  id v11 = [*(id *)(a1 + 32) _getFamily:v4];
  int v12 = NTKEqualObjects();

  uint64_t v13 = [*(id *)(a1 + 32) _getComplicationDescriptor:v4];
  int v14 = NTKEqualObjects();

  double v15 = [*(id *)(a1 + 32) _getComplicationCollectionIdentifier:v4];

  unsigned int v16 = NTKEqualObjects();
  switch(*(void *)(a1 + 80))
  {
    case 0:
    case 3:
      return v8;
    case 1:
    case 2:
      if (v5 == v6) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0;
      }
      break;
    case 4:
    case 5:
      uint64_t v8 = v5 == v6;
      break;
    case 6:
    case 7:
      int v17 = v10 & v14;
      goto LABEL_12;
    case 8:
      uint64_t v8 = v10 & v12 & v14 & v16;
      break;
    case 9:
    case 0xBLL:
      uint64_t v8 = 0;
      break;
    case 0xALL:
      if (v5 == v6) {
        int v17 = v10;
      }
      else {
        int v17 = 0;
      }
LABEL_12:
      uint64_t v8 = v17 & v16;
      break;
    default:
      uint64_t v8 = 1;
      break;
  }
  return v8;
}

void sub_100041F14(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) _messageAtIndex:a3];
      int v11 = 138412290;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pruning enqueued message made obsolete by new message. Pruned message: %@", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) addIndex:a3];
    uint64_t v8 = [v5 objectForKey:@"payload-id"];
    if (v8)
    {
      id v9 = +[NSFileManager defaultManager];
      int v10 = sub_100041220(v8);
      [v9 removeItemAtPath:v10 error:0];
    }
  }
}

void sub_100042400(_Unwind_Exception *a1)
{
}

void sub_10004262C(id a1)
{
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"sync.zippedpayloads"];
  id v3 = (void *)qword_100072468;
  qword_100072468 = v2;

  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:qword_100072468 withIntermediateDirectories:1 attributes:0 error:0];
}

id sub_1000426BC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100042758();
  id v3 = v2;
  if (v1)
  {
    id v4 = [v1 UUIDString];
    id v5 = [v3 stringByAppendingPathComponent:v4];
  }
  else
  {
    id v5 = [v2 stringByAppendingPathComponent:@"Global"];
  }

  return v5;
}

id sub_100042758()
{
  if (qword_100072480 != -1) {
    dispatch_once(&qword_100072480, &stru_100062640);
  }
  id v0 = (void *)qword_100072478;

  return v0;
}

void sub_1000427AC(id a1)
{
  id v1 = NTKHomeDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Sync"];
  id v3 = (void *)qword_100072478;
  qword_100072478 = v2;

  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:qword_100072478 withIntermediateDirectories:1 attributes:0 error:0];
}

id sub_10004283C(void *a1)
{
  id v1 = sub_1000426BC(a1);
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"ComplicationStoreStatus"];

  return v2;
}

void sub_100042890(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = sub_10003DED4(v9);
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [[_StoreStatus alloc] initWithPersistencePath:v3];
    uint64_t v8 = sub_1000387C0(v9);
    [v6 setObject:v7 forKey:v8];
  }
}

void sub_100042958(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = sub_10003E104(v9, (uint64_t)&stru_100062B50);
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [[_StoreStatus alloc] initWithPersistencePath:v3];
    uint64_t v8 = sub_1000387C0(v9);
    [v6 setObject:v7 forKey:v8];
  }
}

void sub_100042A28(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = sub_10003DDA8(v9);
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [[_MessageList alloc] initWithPersistencePath:v3];
    uint64_t v8 = sub_1000387C0(v9);
    [v6 setObject:v7 forKey:v8];
  }
}

void sub_100042AF0(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = sub_10003DC7C(v9);
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [[_MessageList alloc] initWithPersistencePath:v3];
    uint64_t v8 = sub_1000387C0(v9);
    [v6 setObject:v7 forKey:v8];
  }
}

void sub_100042BB8(id a1)
{
  id v1 = sub_100042758();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"MessagePayloads"];
  id v3 = (void *)qword_100072488;
  qword_100072488 = v2;

  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:qword_100072488 withIntermediateDirectories:1 attributes:0 error:0];
}

void sub_100042C9C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't make record for %@ - %@", (uint8_t *)&v3, 0x16u);
}

void sub_100042D24()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "Couldn't find bridge record - %@", v2, v3, v4, v5, v6);
}

void sub_100042D8C()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "Failed to create face from data: %@", v2, v3, v4, v5, v6);
}

void sub_100042DF4()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "unzip failed, data written to disk for analysis: %@", v2, v3, v4, v5, v6);
}

void sub_100042E5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "prompting to raise a radar re: unzip failure", v1, 2u);
}

void sub_100042EA0(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 faceStyle];
  sub_10000BC80();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to archive face to json data. Face style: %lu - error: %{public}@", v5, 0x16u);
}

void sub_100042F38()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "****** imbalanced transactions for reason '%@' -- please file a radar on Watch Faces ******", v2, v3, v4, v5, v6);
}

void sub_100042FA0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_NTKDPhotosFacesCuratorStore:    *** CANNOT CREATE RESOURCE DIRECTORY FOR LIBRARY PHOTO (%@) ***", (uint8_t *)&v4, 0xCu);
}

void sub_100043038(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Face is nil, skipping configuration update", v1, 2u);
}

void sub_10004307C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to reset collection store with proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000430F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Prewarm: Coordinator vanished for activity. %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004316C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Prewarm: No activity given. Skipping…", v1, 2u);
}

void sub_1000431B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error decoding face snapshot contexts: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100043228(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PROXY ERROR: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000432A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "nil deviceUUID. Nothing to snapshot.", v1, 2u);
}

void sub_1000432E4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Library (%@) for deviceUUID (%@) doesn't have any faces. Nothing to snapshot.", (uint8_t *)&v4, 0x16u);
}

void sub_100043370(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v6 = [a1 device];
  BOOL v7 = [v6 deviceCategory] != (id)1;
  uint64_t v8 = [a1 device];
  id v9 = [v8 nrDeviceUUID];
  int v10 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) deviceUUID];
  int v11 = 138413058;
  int v12 = a1;
  __int16 v13 = 1024;
  BOOL v14 = v7;
  __int16 v15 = 2112;
  unsigned int v16 = v9;
  __int16 v17 = 2112;
  uint64_t v18 = v10;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Prewarm: Face(%@)'s device(isLuxo: %d ID: %@) doesn't match the store device's ID(%@)", (uint8_t *)&v11, 0x26u);
}

void sub_100043494(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to write snapshot to disk", v1, 2u);
}

void sub_1000434D8(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to read removals dictionary at path %@: %@", buf, 0x16u);
}

void sub_10004354C()
{
  sub_100025B24();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "Attempted to load face with UUID %@ but encountered error: %@");
}

void sub_1000435B4()
{
  sub_100025B24();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "Attempted to decode JSON for face with UUID %@ but encountered error: %@");
}

void sub_10004361C()
{
  sub_100025B24();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "Unable to extract face from JSON object. Error = %@. JSON object = %@");
}

void sub_100043684()
{
  sub_100025B5C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "<%@,%@,%@> called collection reset completion block again", v1, 0x20u);
}

void sub_100043704()
{
  sub_100025B5C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "<%@,%@,%@> timed out waiting for observers to acknowledge collection reset", v1, 0x20u);
}

void sub_100043784(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000437F0(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "NTKFaceConfiguration nil: Found a nil NTKFaceConfiguration playing back collection store history, face uuid=%@ seqId=%@", (uint8_t *)&v5, 0x16u);
}

void sub_100043880()
{
  sub_100025B24();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "Unable to read manifest at path %@: %@");
}

void sub_1000438E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043958()
{
  sub_100025B24();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "Couldn't find anything at path %@ - %@");
}

void sub_1000439C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043A2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't write JSON: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100043AA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "JSON didn't decode: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100043B1C(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_100030A24((void *)&_mh_execute_header, a4, a3, "Error reading removals dictionary at path %@: %@", (uint8_t *)a3);
}

void sub_100043B88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Corrupted manifest - manifest says we should have descriptor %@, but the file was corrupted or not found", (uint8_t *)&v2, 0xCu);
}

void sub_100043C00(void *a1, uint64_t *a2, NSObject *a3)
{
  unsigned int v5 = [a1 intValue];
  uint64_t v6 = *a2;
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Corrupted manifest - manifest says we should have sample template with family %i for %@, but the file was not found or corrupted", (uint8_t *)v7, 0x12u);
}

void sub_100043CA0()
{
  sub_100025B24();
  sub_100030A24((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error decoding sample complication template at path %@: %@", v1);
}

void sub_100043D10()
{
  sub_100025B24();
  sub_100030A24((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error loading data for sample complication template at path %@: %@", v1);
}

void sub_100043D80(uint64_t a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = CLKStringForComplicationFamily();
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Failed to load complication sample template content hash for key %{public}@, family %{public}@: invalid UTF-8.", (uint8_t *)&v6, 0x16u);
}

void sub_100043E34(uint64_t a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = CLKStringForComplicationFamily();
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  int v10 = v5;
  sub_100030A24((void *)&_mh_execute_header, a3, v6, "Failed to write complication sample template for key %@, family %@", (uint8_t *)&v7);
}

void sub_100043EE0(void *a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = [a1 identifier];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_100030A24((void *)&_mh_execute_header, a3, v6, "Failed to write complication descriptor %@ for %@", (uint8_t *)&v7);
}

void sub_100043F88(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 clientIdentifier];
  unsigned int v5 = [a1 complicationIdentifier];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  sub_100030A24((void *)&_mh_execute_header, a2, v6, "Failed to remove complication sample data for %@, %@", (uint8_t *)&v7);
}

void sub_100044044()
{
  sub_100025B24();
  sub_100030A24((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to read manifest at path %@: %@", v1);
}

void sub_1000440B4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Encountered nil client identifier while writing manifest!", v1, 2u);
}

void sub_1000440F8()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "error resuming companion sync: %@", v2, v3, v4, v5, v6);
}

void sub_100044160()
{
  sub_100034B10();
  sub_100034AB4((void *)&_mh_execute_header, v0, v1, "error sending out of band message [%ld, %@], error: %@");
}

void sub_1000441D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_100044250()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "%s: cannnot create incoming queue for partial message %@; dropping it!",
    v2,
    v3,
    v4,
    v5,
    2u);
}

void sub_1000442C8(void *a1)
{
  uint64_t v1 = [a1 wideLoadId];
  sub_100034A88();
  sub_100034AF0((void *)&_mh_execute_header, v2, v3, "%s: cannot retrieve wide load from incoming queue %@; dropping it!",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void sub_10004435C()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "%s: cannot add partial message %@ to its incoming queue; dropping it!",
    v2,
    v3,
    v4,
    v5,
    2u);
}

void sub_1000443D4(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v6 = [*a2 wideLoadId];
  id v7 = [*a2 partsRemaining];
  [*a2 partsAdded];
  sub_100034B10();
  uint64_t v11 = a1;
  __int16 v12 = v8;
  __int16 v13 = v6;
  __int16 v14 = 2048;
  id v15 = v7;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: %@; discarding outgoing queue for id %@ that still has %lu/%lu messages left",
    v10,
    0x34u);
}

void sub_1000444C0()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "sync service encountered an error: %@", v2, v3, v4, v5, v6);
}

void sub_100044528()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "error decoding message (%@): %@", v2, v3, v4, v5, 2u);
}

void sub_100044598(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "UNEXPECTED SYNC OUTCOME: please file a radar w/ co-sysdiagnose under 'Watch Faces'", v1, 2u);
}

void sub_1000445DC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  sub_10000BC80();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No rate limiter for session %{public}@", v4, 0xCu);
}

void sub_100044670()
{
  sub_10000BC80();
  sub_10000BC64((void *)&_mh_execute_header, v0, v1, "failed to unarchive sync message: %@", v2, v3, v4, v5, v6);
}

void sub_1000446D8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  sub_100034A88();
  sub_100034AF0((void *)&_mh_execute_header, v3, v4, "sync session ended with error: %@, id: %@", v5, v6, v7, v8, 2u);
}

void sub_100044774()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "error decoding sync message (%@): %@", v2, v3, v4, v5, 2u);
}

void sub_1000447E4()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "%s: trying to create an outgoing queue with bad wide load message %@", v2, v3, v4, v5, 2u);
}

void sub_10004485C()
{
  int v2 = 136315650;
  sub_100034AD4();
  sub_100034AB4((void *)&_mh_execute_header, v0, v1, "%s: trying to get a part from an empty outgoing queue (%lu/%lu)", v2, v3, v4);
}

void sub_1000448D8()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "%s: bad partial message template for the incoming queue %@", v2, v3, v4, v5, 2u);
}

void sub_100044950()
{
  sub_100034A88();
  sub_100034A98((void *)&_mh_execute_header, v0, v1, "%s: bad partial message for the incoming queue %@", v2, v3, v4, v5, 2u);
}

void sub_1000449C8()
{
  int v2 = 136315650;
  sub_100034AD4();
  sub_100034AB4((void *)&_mh_execute_header, v0, v1, "%s: trying to add a part to an already full incoming queue (%lu/%lu)", v2, v3, v4);
}

void sub_100044A44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044ABC(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to _set_user_dir_suffix for nanotimekitcompaniond: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_100044B4C(NSObject *a1)
{
  int v2 = +[CLKDevice activeNRDevice];
  uint64_t v3 = +[CLKDevice CLKDeviceUUIDForNRDevice:v2];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "paired sync restriction lifted but we don't have a nano registry device. activeNRDevice: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100044C10(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  int v4 = [v3 nrDevice];
  uint64_t v5 = +[CLKDevice CLKDeviceUUIDForNRDevice:v4];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Current device forced update - _device: %{public}@ - activeNRDevice: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100044CE8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100044D64()
{
  sub_100042C48();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "library store validation hashes differ: %@, %@ -- requesting reset sync");
}

void sub_100044DD4()
{
  sub_100042C48();
  sub_100025B3C((void *)&_mh_execute_header, v0, v1, "library store validation hashes differ: %@, %@");
}

void sub_100044E44(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unsuccessful reset sync! no face or complication changes. not applying changes, will request new reset sync.", v1, 2u);
}

void sub_100044E88(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a2 messageType]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "**** ignoring unexpected message type %@ in reset sync message list (this should not be possible: please file a radar on Watch Faces) ****", a1, 0xCu);
}

void sub_100044F14(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to make temporary copy of reset sync complication sample data", buf, 2u);
}

void sub_100044F54(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "**** ignoring unexpected 'reset' message inside delta message list (this should not be possible: please file a radar on Watch Faces) ****", buf, 2u);
}

void sub_100044F94(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "unable to read message list at path %@: %@", buf, 0x16u);
}

void sub_100044FFC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to persist message payload", v1, 2u);
}

void sub_100045040(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to persist message dictionaries: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000450B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to persist status: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BOMCopierCopyWithOptions()
{
  return _BOMCopierCopyWithOptions();
}

uint64_t BOMCopierFree()
{
  return _BOMCopierFree();
}

uint64_t BOMCopierNew()
{
  return _BOMCopierNew();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD5(data, len, md);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t CLKComplicationFamilyDescription()
{
  return _CLKComplicationFamilyDescription();
}

uint64_t CLKLoggingObjectForDomain()
{
  return _CLKLoggingObjectForDomain();
}

uint64_t CLKStringForComplicationFamily()
{
  return _CLKStringForComplicationFamily();
}

uint64_t LogBool()
{
  return _LogBool();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t NTKBuildVersion()
{
  return _NTKBuildVersion();
}

uint64_t NTKCacheDirectory()
{
  return _NTKCacheDirectory();
}

uint64_t NTKCacheSnapshotOfFace()
{
  return _NTKCacheSnapshotOfFace();
}

uint64_t NTKCachedSnapshotForFace()
{
  return _NTKCachedSnapshotForFace();
}

uint64_t NTKCollectionClientInterface()
{
  return _NTKCollectionClientInterface();
}

uint64_t NTKCollectionServerInterface()
{
  return _NTKCollectionServerInterface();
}

uint64_t NTKComplicationStoreClientInterface()
{
  return _NTKComplicationStoreClientInterface();
}

uint64_t NTKComplicationStoreServerInterface()
{
  return _NTKComplicationStoreServerInterface();
}

uint64_t NTKDClientSampleDataFromPayloadData()
{
  return _NTKDClientSampleDataFromPayloadData();
}

uint64_t NTKDClientSampleTemplateFromPayloadData()
{
  return _NTKDClientSampleTemplateFromPayloadData();
}

uint64_t NTKDComplicationDescriptorsFromPayloadData()
{
  return _NTKDComplicationDescriptorsFromPayloadData();
}

uint64_t NTKDFaceConfigurationFromPayloadData()
{
  return _NTKDFaceConfigurationFromPayloadData();
}

uint64_t NTKDFaceFromPayloadPath()
{
  return _NTKDFaceFromPayloadPath();
}

uint64_t NTKDFaceResourceDirectoryFromPayloadPath()
{
  return _NTKDFaceResourceDirectoryFromPayloadPath();
}

uint64_t NTKDOrderedUUIDsFromPayloadData()
{
  return _NTKDOrderedUUIDsFromPayloadData();
}

uint64_t NTKDPayloadDataFromComplicationDescriptors()
{
  return _NTKDPayloadDataFromComplicationDescriptors();
}

uint64_t NTKDPayloadDataFromComplicationSampleData()
{
  return _NTKDPayloadDataFromComplicationSampleData();
}

uint64_t NTKDPayloadDataFromComplicationTemplate()
{
  return _NTKDPayloadDataFromComplicationTemplate();
}

uint64_t NTKDPayloadDataFromFaceConfiguration()
{
  return _NTKDPayloadDataFromFaceConfiguration();
}

uint64_t NTKDPayloadDataFromOrderedUUIDs()
{
  return _NTKDPayloadDataFromOrderedUUIDs();
}

uint64_t NTKDPayloadDataFromSelectedUUID()
{
  return _NTKDPayloadDataFromSelectedUUID();
}

uint64_t NTKDSelectedUUIDFromPayloadData()
{
  return _NTKDSelectedUUIDFromPayloadData();
}

uint64_t NTKDebugDaemonRunningSnapshotTestingTool()
{
  return _NTKDebugDaemonRunningSnapshotTestingTool();
}

uint64_t NTKDebugDisableSnapshotting()
{
  return _NTKDebugDisableSnapshotting();
}

uint64_t NTKDebugLoadLocaleOverride()
{
  return _NTKDebugLoadLocaleOverride();
}

uint64_t NTKDebugRegenerateAllSnapshots()
{
  return _NTKDebugRegenerateAllSnapshots();
}

uint64_t NTKDebugSnapshotInNanoTimeKitDaemon()
{
  return _NTKDebugSnapshotInNanoTimeKitDaemon();
}

uint64_t NTKDebugWriteSnapshotsToDiskAsPNGs()
{
  return _NTKDebugWriteSnapshotsToDiskAsPNGs();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKEqualStrings()
{
  return _NTKEqualStrings();
}

uint64_t NTKFaceSnapshotClientInterface()
{
  return _NTKFaceSnapshotClientInterface();
}

uint64_t NTKFaceSnapshotServerInterface()
{
  return _NTKFaceSnapshotServerInterface();
}

uint64_t NTKFaceStyleDescription()
{
  return _NTKFaceStyleDescription();
}

uint64_t NTKHomeDirectory()
{
  return _NTKHomeDirectory();
}

uint64_t NTKInternalBuild()
{
  return _NTKInternalBuild();
}

uint64_t NTKPeerDeviceHandlesWideLoads()
{
  return _NTKPeerDeviceHandlesWideLoads();
}

uint64_t NTKPhotosConfirmMemoryWasViewed()
{
  return _NTKPhotosConfirmMemoryWasViewed();
}

uint64_t NTKPhotosIsSyncedAlbumPhotosFace()
{
  return _NTKPhotosIsSyncedAlbumPhotosFace();
}

uint64_t NTKSnapshotMappedImageCache()
{
  return _NTKSnapshotMappedImageCache();
}

uint64_t NTKSubmitClockFacesValidation()
{
  return _NTKSubmitClockFacesValidation();
}

uint64_t NTKSubmitSyncMessage()
{
  return _NTKSubmitSyncMessage();
}

uint64_t NTKSubmitSyncSession()
{
  return _NTKSubmitSyncSession();
}

uint64_t NTKTrackedPhotosServerInterface()
{
  return _NTKTrackedPhotosServerInterface();
}

uint64_t NTKUpNextFileRadarWithData()
{
  return _NTKUpNextFileRadarWithData();
}

uint64_t NTKUseComplicationSnapshotService()
{
  return _NTKUseComplicationSnapshotService();
}

uint64_t NTKValidateArray()
{
  return _NTKValidateArray();
}

uint64_t NTKValidateDictionary()
{
  return _NTKValidateDictionary();
}

uint64_t NTKValidateDictionaryValue()
{
  return _NTKValidateDictionaryValue();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
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

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return _nanosleep(__rqtp, __rmtp);
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return _nw_parameters_set_source_application_by_bundle_id();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
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

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_JSONObjectRepresentation(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectRepresentation];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
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

id objc_msgSend__collectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _collectionIdentifier];
}

id objc_msgSend__currentContext(void *a1, const char *a2, ...)
{
  return [a1 _currentContext];
}

id objc_msgSend__deviceBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 _deviceBuildVersion];
}

id objc_msgSend__ensureCoalescingSuspended(void *a1, const char *a2, ...)
{
  return [a1 _ensureCoalescingSuspended];
}

id objc_msgSend__faultInAllClientData(void *a1, const char *a2, ...)
{
  return [a1 _faultInAllClientData];
}

id objc_msgSend__getNextSyncBackoffPeriod(void *a1, const char *a2, ...)
{
  return [a1 _getNextSyncBackoffPeriod];
}

id objc_msgSend__handleInvalidation(void *a1, const char *a2, ...)
{
  return [a1 _handleInvalidation];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__loadComplicationCollection(void *a1, const char *a2, ...)
{
  return [a1 _loadComplicationCollection];
}

id objc_msgSend__persistMessageDictionaries(void *a1, const char *a2, ...)
{
  return [a1 _persistMessageDictionaries];
}

id objc_msgSend__resetBackoffPeriod(void *a1, const char *a2, ...)
{
  return [a1 _resetBackoffPeriod];
}

id objc_msgSend__setupXPCEventListner(void *a1, const char *a2, ...)
{
  return [a1 _setupXPCEventListner];
}

id objc_msgSend__sharedCollectionStoreObserverQueue(void *a1, const char *a2, ...)
{
  return [a1 _sharedCollectionStoreObserverQueue];
}

id objc_msgSend__sharedCollectionStoreQueue(void *a1, const char *a2, ...)
{
  return [a1 _sharedCollectionStoreQueue];
}

id objc_msgSend__startSnapshottingActivity(void *a1, const char *a2, ...)
{
  return [a1 _startSnapshottingActivity];
}

id objc_msgSend__storeBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 _storeBuildVersion];
}

id objc_msgSend__updateAllSnapshots(void *a1, const char *a2, ...)
{
  return [a1 _updateAllSnapshots];
}

id objc_msgSend__validateManifestEntries(void *a1, const char *a2, ...)
{
  return [a1 _validateManifestEntries];
}

id objc_msgSend_activeNRDevice(void *a1, const char *a2, ...)
{
  return [a1 activeNRDevice];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetCollections(void *a1, const char *a2, ...)
{
  return [a1 assetCollections];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return [a1 checkin];
}

id objc_msgSend_clearAllMessages(void *a1, const char *a2, ...)
{
  return [a1 clearAllMessages];
}

id objc_msgSend_clearSyncObserver(void *a1, const char *a2, ...)
{
  return [a1 clearSyncObserver];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_clientIds(void *a1, const char *a2, ...)
{
  return [a1 clientIds];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 collectionIdentifier];
}

id objc_msgSend_companionSyncWrapperCanSendData(void *a1, const char *a2, ...)
{
  return [a1 companionSyncWrapperCanSendData];
}

id objc_msgSend_companionSyncWrapperDidRequestActivePairedSyncSession(void *a1, const char *a2, ...)
{
  return [a1 companionSyncWrapperDidRequestActivePairedSyncSession];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationClientID(void *a1, const char *a2, ...)
{
  return [a1 complicationClientID];
}

id objc_msgSend_complicationCollectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 complicationCollectionIdentifier];
}

id objc_msgSend_complicationDescriptor(void *a1, const char *a2, ...)
{
  return [a1 complicationDescriptor];
}

id objc_msgSend_complicationFamily(void *a1, const char *a2, ...)
{
  return [a1 complicationFamily];
}

id objc_msgSend_complicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 complicationIdentifier];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_complications(void *a1, const char *a2, ...)
{
  return [a1 complications];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationJSONRepresentation(void *a1, const char *a2, ...)
{
  return [a1 configurationJSONRepresentation];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyWithoutPayload(void *a1, const char *a2, ...)
{
  return [a1 copyWithoutPayload];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dailySnapshotKey(void *a1, const char *a2, ...)
{
  return [a1 dailySnapshotKey];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decrementTransactionCount(void *a1, const char *a2, ...)
{
  return [a1 decrementTransactionCount];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultModernSnapshotOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultModernSnapshotOptions];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dequeueFirstMessage(void *a1, const char *a2, ...)
{
  return [a1 dequeueFirstMessage];
}

id objc_msgSend_dequeueNextPart(void *a1, const char *a2, ...)
{
  return [a1 dequeueNextPart];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_emptyManifest(void *a1, const char *a2, ...)
{
  return [a1 emptyManifest];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceJSONRepresentation(void *a1, const char *a2, ...)
{
  return [a1 faceJSONRepresentation];
}

id objc_msgSend_faceStyle(void *a1, const char *a2, ...)
{
  return [a1 faceStyle];
}

id objc_msgSend_faceUUID(void *a1, const char *a2, ...)
{
  return [a1 faceUUID];
}

id objc_msgSend_fetchResultAfterChanges(void *a1, const char *a2, ...)
{
  return [a1 fetchResultAfterChanges];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstMessage(void *a1, const char *a2, ...)
{
  return [a1 firstMessage];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getAllDevices(void *a1, const char *a2, ...)
{
  return [a1 getAllDevices];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_getWideLoad(void *a1, const char *a2, ...)
{
  return [a1 getWideLoad];
}

id objc_msgSend_hasLoaded(void *a1, const char *a2, ...)
{
  return [a1 hasLoaded];
}

id objc_msgSend_hasMessages(void *a1, const char *a2, ...)
{
  return [a1 hasMessages];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incrementTransactionCount(void *a1, const char *a2, ...)
{
  return [a1 incrementTransactionCount];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_inflatedCopy(void *a1, const char *a2, ...)
{
  return [a1 inflatedCopy];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_instanceDescriptor(void *a1, const char *a2, ...)
{
  return [a1 instanceDescriptor];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBuildVersionOutdated(void *a1, const char *a2, ...)
{
  return [a1 isBuildVersionOutdated];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isFull(void *a1, const char *a2, ...)
{
  return [a1 isFull];
}

id objc_msgSend_isInitialSetupComplete(void *a1, const char *a2, ...)
{
  return [a1 isInitialSetupComplete];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isPartial(void *a1, const char *a2, ...)
{
  return [a1 isPartial];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return [a1 isPrimary];
}

id objc_msgSend_isResetSync(void *a1, const char *a2, ...)
{
  return [a1 isResetSync];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSending(void *a1, const char *a2, ...)
{
  return [a1 isSending];
}

id objc_msgSend_isSetup(void *a1, const char *a2, ...)
{
  return [a1 isSetup];
}

id objc_msgSend_isSyncing(void *a1, const char *a2, ...)
{
  return [a1 isSyncing];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return [a1 isTinker];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logCurrentInterval(void *a1, const char *a2, ...)
{
  return [a1 logCurrentInterval];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_markInitialSetupComplete(void *a1, const char *a2, ...)
{
  return [a1 markInitialSetupComplete];
}

id objc_msgSend_maxPartSize(void *a1, const char *a2, ...)
{
  return [a1 maxPartSize];
}

id objc_msgSend_messageEnumerator(void *a1, const char *a2, ...)
{
  return [a1 messageEnumerator];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_migrateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 migrateIfNecessary];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsResetSync(void *a1, const char *a2, ...)
{
  return [a1 needsResetSync];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_nrDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceUUID];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfParts(void *a1, const char *a2, ...)
{
  return [a1 numberOfParts];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orderedUUIDs(void *a1, const char *a2, ...)
{
  return [a1 orderedUUIDs];
}

id objc_msgSend_outgoingSyncSessionGetNextMessage(void *a1, const char *a2, ...)
{
  return [a1 outgoingSyncSessionGetNextMessage];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_partNumber(void *a1, const char *a2, ...)
{
  return [a1 partNumber];
}

id objc_msgSend_partsAdded(void *a1, const char *a2, ...)
{
  return [a1 partsAdded];
}

id objc_msgSend_partsExpected(void *a1, const char *a2, ...)
{
  return [a1 partsExpected];
}

id objc_msgSend_partsRemaining(void *a1, const char *a2, ...)
{
  return [a1 partsRemaining];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payloadData(void *a1, const char *a2, ...)
{
  return [a1 payloadData];
}

id objc_msgSend_payloadSize(void *a1, const char *a2, ...)
{
  return [a1 payloadSize];
}

id objc_msgSend_persistCurrentBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 persistCurrentBuildVersion];
}

id objc_msgSend_photosFacesCuratorQueue(void *a1, const char *a2, ...)
{
  return [a1 photosFacesCuratorQueue];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllUUIDs(void *a1, const char *a2, ...)
{
  return [a1 removeAllUUIDs];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_removeOrphanedResourceDirectories(void *a1, const char *a2, ...)
{
  return [a1 removeOrphanedResourceDirectories];
}

id objc_msgSend_requestDeltaSync(void *a1, const char *a2, ...)
{
  return [a1 requestDeltaSync];
}

id objc_msgSend_requestResetSync(void *a1, const char *a2, ...)
{
  return [a1 requestResetSync];
}

id objc_msgSend_resetCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 resetCurrentDevice];
}

id objc_msgSend_resourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 resourceDirectory];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeCoalescing(void *a1, const char *a2, ...)
{
  return [a1 resumeCoalescing];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runCollectionServer(void *a1, const char *a2, ...)
{
  return [a1 runCollectionServer];
}

id objc_msgSend_runComplicationStoreServer(void *a1, const char *a2, ...)
{
  return [a1 runComplicationStoreServer];
}

id objc_msgSend_runPostMigrator(void *a1, const char *a2, ...)
{
  return [a1 runPostMigrator];
}

id objc_msgSend_runPreMigrator(void *a1, const char *a2, ...)
{
  return [a1 runPreMigrator];
}

id objc_msgSend_runSnapshotServer(void *a1, const char *a2, ...)
{
  return [a1 runSnapshotServer];
}

id objc_msgSend_runningInStoreDemoModeFProgramNumber(void *a1, const char *a2, ...)
{
  return [a1 runningInStoreDemoModeFProgramNumber];
}

id objc_msgSend_selectedFace(void *a1, const char *a2, ...)
{
  return [a1 selectedFace];
}

id objc_msgSend_selectedFaceIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedFaceIndex];
}

id objc_msgSend_selectedUUID(void *a1, const char *a2, ...)
{
  return [a1 selectedUUID];
}

id objc_msgSend_sentChangeByteCount(void *a1, const char *a2, ...)
{
  return [a1 sentChangeByteCount];
}

id objc_msgSend_sentChangeCount(void *a1, const char *a2, ...)
{
  return [a1 sentChangeCount];
}

id objc_msgSend_seqId(void *a1, const char *a2, ...)
{
  return [a1 seqId];
}

id objc_msgSend_serializer(void *a1, const char *a2, ...)
{
  return [a1 serializer];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_sessionMetadata(void *a1, const char *a2, ...)
{
  return [a1 sessionMetadata];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setHasChangesAvailable(void *a1, const char *a2, ...)
{
  return [a1 setHasChangesAvailable];
}

id objc_msgSend_setNeedsResetSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSync];
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return [a1 setUp];
}

id objc_msgSend_sharedAppLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedAppLibrary];
}

id objc_msgSend_sharedArchivist(void *a1, const char *a2, ...)
{
  return [a1 sharedArchivist];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedJetsamMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedJetsamMonitor];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_sharedRecorder(void *a1, const char *a2, ...)
{
  return [a1 sharedRecorder];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shouldEnableSync(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableSync];
}

id objc_msgSend_snapshotStale(void *a1, const char *a2, ...)
{
  return [a1 snapshotStale];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_supportedActionsByExtensions(void *a1, const char *a2, ...)
{
  return [a1 supportedActionsByExtensions];
}

id objc_msgSend_supportedFamilies(void *a1, const char *a2, ...)
{
  return [a1 supportedFamilies];
}

id objc_msgSend_supportsCompanionSync(void *a1, const char *a2, ...)
{
  return [a1 supportsCompanionSync];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_suspendCoalescing(void *a1, const char *a2, ...)
{
  return [a1 suspendCoalescing];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncDidCompleteSending(void *a1, const char *a2, ...)
{
  return [a1 syncDidCompleteSending];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_trackedPhotosContent(void *a1, const char *a2, ...)
{
  return [a1 trackedPhotosContent];
}

id objc_msgSend_unadornedSnapshotKey(void *a1, const char *a2, ...)
{
  return [a1 unadornedSnapshotKey];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateAllSnapshots(void *a1, const char *a2, ...)
{
  return [a1 updateAllSnapshots];
}

id objc_msgSend_updateDeviceDataSourcesInNanoPreferences(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceDataSourcesInNanoPreferences];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_wantsUnadornedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 wantsUnadornedSnapshot];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_wideLoadId(void *a1, const char *a2, ...)
{
  return [a1 wideLoadId];
}

id objc_msgSend_zippedDataForPath_toZipFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zippedDataForPath:toZipFile:");
}