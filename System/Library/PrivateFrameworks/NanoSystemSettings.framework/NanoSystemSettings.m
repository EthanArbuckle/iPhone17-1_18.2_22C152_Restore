uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = objc_opt_new();
  v2 = (void *)qword_10003E758;
  qword_10003E758 = v1;

  v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 1;
}

void sub_10000889C(id a1)
{
  +[NSSLocaleInfoCache handleMemoryPressureEvent];
  +[NSSLegalDocumentsCache handleMemoryPressureEvent];
}

uint64_t sub_100008B48(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanosystemsettings"];
  return _objc_release_x1();
}

uint64_t sub_100008C48(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104) = objc_opt_new();
  return _objc_release_x1();
}

void sub_100008DD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = +[NSSUsageData newUsageDataFromUsageRespMsg:a2];
  v6 = +[NSSUsageData createLegacyUsageDictionary:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008FC4(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  id v3 = objc_retainBlock(*(id *)(a1 + 40));
  [v2 addObject:v3];

  if ([v2 count] == (id)1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009150;
    v11[3] = &unk_100034B30;
    id v4 = v2;
    id v12 = v4;
    id v5 = objc_retainBlock(v11);
    v6 = *(void **)(a1 + 32);
    id v7 = objc_opt_new();
    v8 = objc_retainBlock(v5);
    v9 = [v6 sendRequest:v7 expectsResponse:1 replyBlock:v8 replyDictionary:*(void *)(*(void *)(a1 + 32) + 120) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

    if (v9)
    {
      id v10 = objc_retainBlock(*(id *)(a1 + 40));
      [v4 removeObject:v10];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100009150(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (void)v12);
}

void sub_1000093F4(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setBundleIdentifier:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = [v2 sendRequest:v5 expectsResponse:1 replyBlock:v3 replyDictionary:*(void *)(*(void *)(a1 + 40) + 128) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100009694(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 136) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v6;
  }
}

void sub_1000098B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileTransferProgress];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) fileTransferProgress];
    id v5 = [v4 objectForKey:*(void *)(a1 + 40)];
    id v6 = [v5 unsignedIntegerValue];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (v6 == (id)100)
    {
      id v11 = [*(id *)(a1 + 32) fileTransferProgress];
      [v11 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"No file transfer progress found for file: %@", *(void *)(a1 + 40)];
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    long long v15 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v9 = +[NSError errorWithDomain:@"NSSErrorDomain" code:8 userInfo:v8];

    uint64_t v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error while retrieving progress: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100009CC4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 152) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v6;
  }
}

void sub_100009F94(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_new();
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 144) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v6;
  }
}

void sub_10000A15C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_new();
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 168) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v6;
  }
}

void sub_10000A3AC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 168) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v6;
  }
}

void sub_10000A61C(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 setLog:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v5 = [v3 sendRequest:v2 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 40) + 160) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  if (v5)
  {
    id v6 = NSSLogForType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error when trying to send the request", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000A88C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Storage Info received from watch: %@", buf, 0xCu);
  }

  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = +[NRPairedDeviceRegistry sharedInstance];
    id v9 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v27 = v8;
    uint64_t v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
    id v11 = [v10 firstObject];

    v29 = [v11 valueForProperty:NRDevicePropertySystemBuildVersion];
    v26 = v11;
    v28 = [v11 valueForProperty:NRDevicePropertyHWModelString];
    v31[0] = a1[4];
    v30[0] = @"requiredFreeSpace";
    v30[1] = @"availableStorage";
    uint64_t v12 = kNSSAboutAvailableStorageKey;
    long long v13 = [v5 objectForKeyedSubscript:kNSSAboutAvailableStorageKey];
    if (v13)
    {
      NSErrorUserInfoKey v14 = [v5 objectForKeyedSubscript:v12];
    }
    else
    {
      NSErrorUserInfoKey v14 = &off_100036740;
    }
    v31[1] = v14;
    v30[2] = @"purgableSpace";
    uint64_t v15 = kNSSAboutPurgableStorageKey;
    v16 = [v5 objectForKeyedSubscript:kNSSAboutPurgableStorageKey];
    if (v16)
    {
      v17 = [v5 objectForKeyedSubscript:v15];
    }
    else
    {
      v17 = &off_100036740;
    }
    v31[2] = v17;
    v30[3] = @"userDeletableSpace";
    uint64_t v18 = kNSSAboutUserDeletableStorageKey;
    v19 = [v5 objectForKeyedSubscript:kNSSAboutUserDeletableStorageKey];
    if (v19)
    {
      v20 = [v5 objectForKeyedSubscript:v18];
    }
    else
    {
      v20 = &off_100036740;
    }
    CFStringRef v21 = (const __CFString *)a1[5];
    if (!v21) {
      CFStringRef v21 = @"--";
    }
    v31[3] = v20;
    v31[4] = v21;
    v30[4] = @"osBeingUpdatedTo";
    v30[5] = @"watchOS";
    v30[6] = @"watchHardware";
    if (v29) {
      CFStringRef v22 = v29;
    }
    else {
      CFStringRef v22 = @"--";
    }
    CFStringRef v23 = v28;
    if (!v28) {
      CFStringRef v23 = @"--";
    }
    v31[5] = v22;
    v31[6] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];
    if (v19) {

    }
    if (v16) {
    if (v13)
    }

    v25 = NSSLogForType();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[recordSoftwareUpdateSpaceFailure] Sending recordSoftwareUpdateSpaceFailure to CoreAnalytics: %@", buf, 0xCu);
    }

    AnalyticsSendEvent();
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_10000AD9C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_new();
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 176) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v6;
  }
}

void sub_10000B0C8(uint64_t a1)
{
  id v7 = (id)objc_opt_new();
  [v7 setCapability:*(unsigned __int8 *)(a1 + 48)];
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  objc_setAssociatedObject(v2, "kNSSObliterationRequestPreserveeSIMAssociatedObjectKey", v3, (void *)1);

  id v4 = *(void **)(a1 + 32);
  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v4 sendRequest:v7 expectsResponse:0 replyBlock:v5 replyDictionary:*(void *)(*(void *)(a1 + 32) + 184) sendTimeout:1 wantsAcknowledgement:1 bypassDuet:30.0];

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000B344(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setAccountType:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = [v2 sendRequest:v5 expectsResponse:1 replyBlock:v3 replyDictionary:*(void *)(*(void *)(a1 + 40) + 192) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000B550(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_opt_new();
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 200) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v6;
  }
}

void sub_10000B7A4(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setIdentifier:*(void *)(a1 + 32)];
  [v5 setIncludeManagedPayloads:*(unsigned __int8 *)(a1 + 56)];
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = [v2 sendRequest:v5 expectsResponse:1 replyBlock:v3 replyDictionary:*(void *)(*(void *)(a1 + 40) + 208) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000B9FC(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setProfileData:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = [v2 sendRequest:v5 expectsResponse:1 replyBlock:v3 replyDictionary:*(void *)(*(void *)(a1 + 40) + 216) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000BC38(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  [v5 setIdentifier:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = [v2 sendRequest:v5 expectsResponse:1 replyBlock:v3 replyDictionary:*(void *)(*(void *)(a1 + 40) + 224) sendTimeout:0 wantsAcknowledgement:1 bypassDuet:30.0];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10000C040(uint64_t a1)
{
  id v2 = +[NSLocale preferredLanguages];
  id v3 = +[NSSLegalDocumentsCache cachedReplyForPreferredLanguages:v2];
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = objc_opt_new();
    id v5 = [v2 mutableCopy];
    [v4 setPreferredLanguages:v5];

    [v4 setAddUrlToSAR:0];
    objc_msgSend(v4, "setFetchBuiltinApps:", objc_msgSend(*(id *)(a1 + 32), "shouldFetchBuiltinAppsNotice"));
    id v6 = objc_retainBlock(*(id *)(a1 + 40));
    objc_setAssociatedObject(v6, "kNSSLegalDocumentsPreferredLanguagesAssociatedObjectKey", v2, (void *)1);

    id v7 = NSSLogForType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "request: (%@)", (uint8_t *)&v11, 0xCu);
    }

    id v8 = *(void **)(a1 + 32);
    id v9 = objc_retainBlock(*(id *)(a1 + 40));
    uint64_t v10 = [v8 sendRequest:v4 expectsResponse:1 replyBlock:v9 replyDictionary:*(void *)(*(void *)(a1 + 32) + 232) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

    if (v10) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_10000C36C(uint64_t a1)
{
  id v6 = +[NSSLocaleInfoCache cachedReply];
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = objc_opt_new();
    id v4 = objc_retainBlock(*(id *)(a1 + 40));
    id v5 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 240) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

    if (v5) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_10000C5A4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 432);
  if (!v2)
  {
    id v3 = objc_alloc_init(NSSWatchFaceCoordinator);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 432);
    *(void *)(v4 + 432) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 432);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C670;
  v6[3] = &unk_100034C48;
  id v7 = *(id *)(a1 + 40);
  [v2 watchFacesForCurrentDeviceWithCompletion:v6];
}

void sub_10000C670(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_watchFaceCoordinator watchFacesForCurrentDeviceWithCompletion - faces: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000C8E8(void *a1)
{
  id v2 = *(void **)(a1[4] + 432);
  if (!v2)
  {
    id v3 = objc_alloc_init(NSSWatchFaceCoordinator);
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 432);
    *(void *)(v4 + 432) = v3;

    id v2 = *(void **)(a1[4] + 432);
  }
  [v2 selectWatchFaceIdentifier:a1[5] forFocusModeIdentifier:a1[6]];
  id v6 = *(uint64_t (**)(void))(a1[7] + 16);
  return v6();
}

uint64_t sub_10000D78C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D7A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D7BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D7D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, 0, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D7F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D808(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D820(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D838(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D850(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D868(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D880(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D898(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D8B0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D8C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

uint64_t sub_10000D8E0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D8F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D910(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000D928(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

BOOL sub_10000D940(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  __int16 v10 = a4;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = [v9 objectForKey:v8];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      NSErrorUserInfoKey v14 = NSSLogForType();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412802;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2048;
        CFStringRef v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found match for identifier (%@) in container (%@): (%p)", (uint8_t *)&v16, 0x20u);
      }

      [v9 removeObjectForKey:v8];
      v10[2](v10, v12);
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void sub_10000DE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DE98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DEA8(uint64_t a1)
{
}

void sub_10000DEB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = NSSLogForType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unpaired with error: (%@)", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  NSSOSTransactionComplete();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_10000F920(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    if (!v2) {
      goto LABEL_8;
    }
    id v3 = [*(id *)(a1 + 40) fileTransferProgress];
    uint64_t v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v3 setObject:v4 forKey:*(void *)(a1 + 32)];

    goto LABEL_7;
  }
  if (v2)
  {
    uint64_t v5 = [*(id *)(a1 + 40) fileTransferProgress];
    id v6 = [v5 objectForKey:*(void *)(a1 + 32)];

    if (v6)
    {
      id v3 = [*(id *)(a1 + 40) fileTransferProgress];
      [v3 removeObjectForKey:*(void *)(a1 + 32)];
LABEL_7:
    }
  }
LABEL_8:
  if (*(void *)(a1 + 32))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v8 = (const __CFString *)NSSFileTransferProgressChangedNotification;
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 0);
  }
}

void sub_100012484(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];

  if (v6) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

void sub_10001300C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_opt_new();
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 248) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = v6;
  }
}

void sub_100013574(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v6 = [v2 sendRequest:v3 expectsResponse:1 replyBlock:v4 replyDictionary:*(void *)(*(void *)(a1 + 32) + 256) sendTimeout:0 wantsAcknowledgement:0 bypassDuet:30.0];

  id v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v6;
  }
}

id sub_1000146A0(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 20) = -1;
  uint64_t v2 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanosystemsettings"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  return objc_msgSend(v5, "setDelegate:queue:");
}

id sub_100014938(uint64_t a1)
{
  return [*(id *)(a1 + 32) blockUntilPaired];
}

void sub_100014E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014E68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014F50;
    block[3] = &unk_100034E20;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void sub_100014F50(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncSession];

  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 didFetchInfoForApplication:v4 error:v5];
  }
}

void sub_100015418(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained syncSession];

  if (v1) {
    [WeakRetained appConduitTimerFired];
  }
}

void sub_1000156AC(uint64_t a1)
{
  uint64_t v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received AppConduit notification", v5, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 syncSession];

  if (v4) {
    [v3 checkIfAppConduitKnowsAboutVictoryWatchApp];
  }
}

void sub_1000159D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015A04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    CFStringRef v8 = [WeakRetained workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015AD4;
    block[3] = &unk_100034DB0;
    block[4] = v7;
    uint64_t v11 = a2;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

void sub_100015AD4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) syncSession];

  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    [v5 didInstallVictoryAppOnWatchWithState:v3 error:v4];
  }
}

void *sub_10001642C(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[5]) {
    return [result didUpdateVictoryAppInstallationStateOntoWatch:*(void *)(a1 + 40)];
  }
  return result;
}

void *sub_1000164BC(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[5]) {
    return [result checkForCompletionOfVictoryAppInstallationOnPhone];
  }
  return result;
}

void *sub_100016660(void *result)
{
  if (*(void *)(result[4] + 40))
  {
    v1 = result;
    uint64_t v2 = NSSLogForType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Victory app completed installation on Phone", v3, 2u);
    }

    return [(id)v1[4] checkForCompletionOfVictoryAppInstallationOnPhone];
  }
  return result;
}

void sub_100016874(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = NSSLogForType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Victory app uninstalled from Phone", v5, 2u);
    }

    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[NSError errorWithDomain:@"NSSErrorDomain" code:7 userInfo:0];
    [v3 reportSyncCompletionWithError:v4];
  }
}

uint64_t sub_100016B00(uint64_t a1)
{
  qword_10003E778 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_100016F58(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Added Notification request: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100017374(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notification center did finish adding auto exit lpm notification with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100017618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017638()
{
  id v2 = [(id)objc_opt_class() serverProtocol];
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:v2];
  v1 = (void *)qword_10003E790;
  qword_10003E790 = v0;
}

void sub_1000176AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 connectionHandlerLostConnection:v4];

    uint64_t v3 = [v4 connection];
    [v3 setInvalidationHandler:0];

    id WeakRetained = v4;
  }
}

uint64_t sub_100017C84(uint64_t a1)
{
  qword_10003E798 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_100017DCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init((Class)HKSPSleepStore);
    [WeakRetained setSleepStore:v2];

    uint64_t v3 = [WeakRetained sleepStore];
    [v3 addObserver:WeakRetained];

    id v4 = [WeakRetained sleepStore];
    [WeakRetained _loadSleepSettingsFrom:v4];

    id v5 = objc_alloc_init((Class)NPSManager);
    [WeakRetained setNpsManager:v5];

    [WeakRetained _updateSettings];
    [WeakRetained _registerForSleepSettingsChanges];
    if ((uint64_t)[WeakRetained lastKnownPowerLevelBeforeGoingOffCharger] >= 1)
    {
      id v6 = NSSLogForType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Monitoring for power updates.", v7, 2u);
      }

      [WeakRetained _beginMonitoringForPowerUpdates];
      [WeakRetained _beginMonitoringOnWristState];
    }
  }
}

void sub_100017F6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  [*(id *)(a1 + 32) _updatePowerSourceDescription];
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 32);
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Processing battery state %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"Current Capacity"];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:@"Is Charging"];
    if ([v7 BOOLValue])
    {
      CFStringRef v8 = NSSLogForType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Tyring to post notification for %@", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_postNotificationForPowerLevel:", objc_msgSend(v6, "integerValue"));
      [*(id *)(a1 + 32) _beginMonitoringForPowerUpdates];
      [*(id *)(a1 + 32) _beginMonitoringOnWristState];
    }
  }
}

id sub_100018A44(uint64_t a1)
{
  uint64_t v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Power source notification received.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _processOffChargerState];
}

void sub_100018B30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 8);
  if (v3 != -1)
  {
    uint32_t v4 = notify_cancel(v3);
    if (v4)
    {
      uint32_t v5 = v4;
      id v6 = NSSLogForType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        uint64_t v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor:Unregister failed (%lu).", (uint8_t *)&v8, 0xCu);
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = -1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v7 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

id sub_10001931C(uint64_t a1, void *a2)
{
  id result = [a2 isEqualToString:@"com.apple.nanosystemsettingsd.contextstore-registration"];
  if (result)
  {
    uint32_t v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: processing callback with identifier NSSSleepContextStoreRegistrationClientIdentifier", (uint8_t *)&v6, 0xCu);
    }

    return [*(id *)(a1 + 32) _loadSleepSettingsFrom:*(void *)(*(void *)(a1 + 32) + 48)];
  }
  return result;
}

void sub_100019BA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setPowerSourceDescription:0];
    [v3 _updatePowerSourceDescription];
    uint32_t v4 = [v3 powerSourceDescription];

    if (v4)
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v5 = [v3 powerSourceDescription];
        int v6 = [v5 objectForKeyedSubscript:@"Is Charging"];

        LODWORD(v5) = [v6 BOOLValue];
        if (!v5)
        {
          int v8 = NSSLogForType();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v13) = 0;
            id v10 = "Meadow not presenting timed notification the watch is not charging.";
            uint64_t v11 = v8;
            uint32_t v12 = 2;
            goto LABEL_11;
          }
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v7 = *(void *)(a1 + 40);
      }
      else
      {
        uint64_t v7 = 0;
      }
      [v3 _postNotificationForLowPowerModeAutoDisabled:v7];
      int v8 = NSSLogForType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        int v13 = 134217984;
        uint64_t v14 = v9;
        id v10 = "Meadow showing the notification for type:%llu.";
        uint64_t v11 = v8;
        uint32_t v12 = 12;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
}

void sub_100019E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019EBC(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      [WeakRetained _removedFromChargerNotification];
      [v4 _stopMonitoringForPowerUpdates];
      [v4 _stopMonitoringOnWristState];
      id WeakRetained = v4;
    }
  }
}

CFStringRef sub_10001A028()
{
  return @"/";
}

id sub_10001A3FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetIfTheActivePairedDeviceChanges];
}

uint64_t sub_10001A738()
{
  uint64_t v0 = NSSLogForType();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "System language changed", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_10001A7A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, "Notification");
    uint64_t v9 = NSSLogForType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint32_t v12 = string;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v11, 0xCu);
    }

    if (string)
    {
      id v10 = *(void **)(a1 + 32);
      id v4 = +[NSString stringWithUTF8String:string];
      [v10 handleDarwinNotification:v4];
      goto LABEL_11;
    }
    id v4 = NSSLogForType();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v11) = 0;
    uint64_t v5 = "Received unexepectedly NULL notification";
    int v6 = v4;
    uint32_t v7 = 2;
    goto LABEL_4;
  }
  id v4 = NSSLogForType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    uint32_t v12 = (const char *)v3;
    uint64_t v5 = "Received unexpected non-dictionary type event: (%@)";
    int v6 = v4;
    uint32_t v7 = 12;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
  }
LABEL_11:
}

void sub_10001A958(uint64_t a1)
{
  uint64_t v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received memory warning", v4, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&qword_10003E7A8 > 10.0) {
    [*(id *)(a1 + 32) handleMemoryPressureEvent];
  }
  qword_10003E7A8 = *(void *)&Current;
}

void sub_10001ABFC(id a1)
{
  id v3 = (id)_CFCopySystemVersionDictionary();
  uint64_t v1 = [v3 objectForKey:_kCFSystemVersionBuildVersionKey];
  uint64_t v2 = (void *)qword_10003E7B8;
  qword_10003E7B8 = v1;
}

void sub_10001ADA4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.systemsettings"];
  id v3 = (void *)qword_10003E7C0;
  qword_10003E7C0 = (uint64_t)v2;

  [(id)objc_opt_class() associateProtobufHandlers:qword_10003E7C0];
  id v4 = (void *)qword_10003E7C0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 idsQueue];
  [v4 addDelegate:v5 queue:v6];
}

void sub_10001AF60(uint64_t a1)
{
  id v2 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.systemsettings.files"];
  id v3 = (void *)qword_10003E7D0;
  qword_10003E7D0 = (uint64_t)v2;

  id v4 = (void *)qword_10003E7D0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 idsQueue];
  [v4 addDelegate:v5 queue:v6];

  uint32_t v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = qword_10003E7D0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DEBUG: first time this service is inited, do we have one? %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10001CBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10001CBFC(uint64_t a1)
{
  id v2 = NSSLogForType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Timed out waiting for reply to message (%@) in container (%@)", (uint8_t *)&v6, 0x16u);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
  [*(id *)(a1 + 56) removeObjectForKey:*(void *)(a1 + 32)];
  [*(id *)(a1 + 64) removeObjectForKey:*(void *)(a1 + 32)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
}

uint64_t sub_10001CCE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001CCF4(uint64_t a1)
{
}

void sub_10001CCFC(uint64_t a1)
{
  NSSOSTransactionComplete();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10001D830(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = NSSLogForType();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote device successfully received Airplane Mode Mirroring message", (uint8_t *)&v9, 2u);
    }

    [(id)objc_opt_class() tellRadiosPrefsToEnableAirplaneMode:*(unsigned __int8 *)(a1 + 65)];
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Airplane Mode Mirroring message (%@) failed to send with error: (%@)", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) failedToMirrorAirplaneMode:*(unsigned __int8 *)(a1 + 65)];
  }
  NSSOSTransactionComplete();
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

id sub_10001DACC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

id sub_10001DC10(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

void sub_10001DE24(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldSendAPMMessageToOppositeDevice:*(unsigned __int8 *)(a1 + 48)])
  {
    [(id)objc_opt_class() mirrorAirplaneSendTimeout];
    double v3 = v2;
    BOOL v4 = objc_opt_new();
    [v4 setEnabled:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v5 = *(void **)(a1 + 32);
    id v24 = 0;
    uint64_t v6 = [v5 sendMessage:v4 identifier:&v24 sendTimeout:0 wantsAcknowledgement:@"airplaneMode" queueOneIdentifier:1 overBluetoothOnly:v3];
    id v7 = v24;
    __int16 v8 = *(void **)(a1 + 32);
    if (v6)
    {
      [v8 failedToMirrorAirplaneMode:*(unsigned __int8 *)(a1 + 48)];
    }
    else
    {
      __int16 v11 = (void *)v8[10];
      uint64_t v12 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      [v11 setObject:v12 forKey:v7];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x3032000000;
      v27 = sub_10001CCE4;
      v28 = sub_10001CCF4;
      int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s-ids-timeout", "-[NSSServer enableAirplaneMode:completionHandler:]_block_invoke");
      NSSOSTransactionCreate();
      id v29 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(NSObject **)(v14 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001E108;
      block[3] = &unk_100035188;
      block[4] = v14;
      id v16 = v7;
      double v22 = v3;
      char v23 = *(unsigned char *)(a1 + 48);
      id v20 = v16;
      p_long long buf = &buf;
      dispatch_async(v15, block);

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    if (([*(id *)(a1 + 32) mirroringAirplaneMode] & 1) == 0)
    {
      int v9 = NSSLogForType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(a1 + 48)) {
          CFStringRef v10 = @"enable";
        }
        else {
          CFStringRef v10 = @"disable";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not instructing opposite device to %@ airplane mode because mirroring is off", (uint8_t *)&buf, 0xCu);
      }
    }
    [(id)objc_opt_class() tellRadiosPrefsToEnableAirplaneMode:*(unsigned __int8 *)(a1 + 48)];
  }
  NSSOSTransactionComplete();
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

void sub_10001E108(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E1C8;
  v7[3] = &unk_100035160;
  v7[4] = v2;
  char v8 = *(unsigned char *)(a1 + 64);
  [v2 scheduleTimerForIdentifier:v3 requests:0 timeout:v7 timeoutHandler:v2[9] timers:@"airplane" utilityName:v4];
  NSSOSTransactionComplete();
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_10001E1C8(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_10001CCE4;
  v7[4] = sub_10001CCF4;
  double v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s-ids-timeout-handler", "-[NSSServer enableAirplaneMode:completionHandler:]_block_invoke_3");
  NSSOSTransactionCreate();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(NSObject **)(v3 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E2E0;
  block[3] = &unk_100035138;
  char v6 = *(unsigned char *)(a1 + 40);
  block[4] = v3;
  void block[5] = v7;
  dispatch_async(v4, block);
  _Block_object_dispose(v7, 8);
}

void sub_10001E2E0(uint64_t a1)
{
  [*(id *)(a1 + 32) failedToMirrorAirplaneMode:*(unsigned __int8 *)(a1 + 48)];
  NSSOSTransactionComplete();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10001EC6C(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "tellRadiosPrefsToEnableAirplaneMode:", objc_msgSend(*(id *)(a1 + 40), "enabled"));
  NSSOSTransactionComplete();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10001F718(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) stringByDeletingLastPathComponent];
  uint64_t v2 = +[NSFileManager defaultManager];
  NSFileAttributeKey v4 = NSFileProtectionKey;
  NSFileProtectionType v5 = NSFileProtectionNone;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:0];
}

void sub_100020024(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) stringByDeletingLastPathComponent];
  uint64_t v2 = +[NSFileManager defaultManager];
  NSFileAttributeKey v4 = NSFileProtectionKey;
  NSFileProtectionType v5 = NSFileProtectionNone;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:0];
}

void sub_100021168(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  NSFileProtectionType v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 UUIDString];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void sub_1000217DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v28 = a3;
  id v6 = NSSLogForType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: selected face with identifier: %@", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    __int16 v11 = 0;
    uint64_t v12 = *(void *)v31;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v15 = *(void **)(a1 + 32);
        id v16 = objc_msgSend(v14, "faceIdentifier", v28);
        uint64_t v17 = [v16 UUIDString];
        LODWORD(v15) = [v15 isEqualToString:v17];

        if (v15) {
          uint64_t v29 = (uint64_t)[v8 indexOfObject:v14];
        }
        if ([v14 isActive])
        {
          __int16 v18 = [v14 faceIdentifier];
          uint64_t v19 = [v18 UUIDString];

          __int16 v11 = (void *)v19;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v10);
  }
  else
  {
    __int16 v11 = 0;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }

  id v20 = NSSLogForType();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v35 = (uint64_t)v11;
    __int16 v36 = 2112;
    uint64_t v37 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: Active face identifier: %@ expectedCurrentFaceIdentifier: %@", buf, 0x16u);
  }

  double v22 = *(void **)(a1 + 40);
  if (v22 && ([v22 isEqualToString:v11] & 1) == 0)
  {
    id v24 = NSSLogForType();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      v25 = "NSSWatchFaceCoordinator: Aborting switch back to previous face because face was switched manually";
      uint64_t v26 = v24;
      uint32_t v27 = 2;
      goto LABEL_30;
    }
LABEL_31:

    goto LABEL_32;
  }
  char v23 = NSSLogForType();
  id v24 = v23;
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10002243C(v24);
    }
    goto LABEL_31;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NSSWatchFaceCoordinator: match found! setting face to %li", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 48) + 8) setSelectedFaceIndex:v29 suppressingCallbackToObserver:0];
  if (*(unsigned char *)(a1 + 56))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 48), v11);
    [*(id *)(a1 + 48) _saveFocusFaces];
    id v24 = NSSLogForType();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v35 = (uint64_t)v11;
      v25 = "NSSWatchFaceCoordinator: Saved current face identifier: %@";
      uint64_t v26 = v24;
      uint32_t v27 = 12;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
LABEL_32:
}

void sub_100021C7C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

unint64_t sub_100021CBC()
{
  uint64_t v0 = type metadata accessor for ActivityUIDismissalPolicy();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021F38(&qword_10003E750);
  unint64_t result = static Activity.activities.getter();
  unint64_t v5 = result;
  if (!(result >> 62))
  {
    uint64_t v6 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return v6 != 0;
  }
  unint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  char v20 = 0x80;
  uint64_t v7 = v6 - 1;
  if (v6 >= 1)
  {
    uint64_t v13 = v6;
    uint64_t v8 = 0;
    id v9 = (void (**)(char *, uint64_t))(v1 + 8);
    if ((v5 & 0xC000000000000001) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    while (1)
    {
      uint64_t v11 = *(void *)LiveActivityService.shared.unsafeMutableAddressor();
      swift_retain();
      LiveActivityText.init(title:subtitle:)();
      LiveActivityTextMap.init(dynamicIslandExpanded:lockScreen:)();
      LiveActivityImageMap.init(imagePath:)();
      LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)();
      memcpy(v14, v16, 0x1AAuLL);
      static ActivityUIDismissalPolicy.immediate.getter();
      (*(void (**)(uint64_t, unsigned char *, char *))(*(void *)v11 + 88))(v10, v14, v3);
      swift_release();
      swift_release();
      (*v9)(v3, v0);
      memcpy(v15, v14, 0x1AAuLL);
      sub_100021F7C((uint64_t)v15);
      if (v7 == v8) {
        break;
      }
      ++v8;
      if ((v5 & 0xC000000000000001) != 0) {
        goto LABEL_5;
      }
LABEL_6:
      uint64_t v10 = *(void *)(v5 + 8 * v8 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = v13;
    return v6 != 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100021F38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100021F7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 112);
  uint64_t v18 = *(void *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 128);
  uint64_t v16 = *(void *)(a1 + 120);
  uint64_t v25 = *(void *)(a1 + 152);
  uint64_t v26 = *(void *)(a1 + 144);
  uint64_t v23 = *(void *)(a1 + 168);
  uint64_t v24 = *(void *)(a1 + 160);
  uint64_t v21 = *(void *)(a1 + 184);
  uint64_t v22 = *(void *)(a1 + 176);
  uint64_t v19 = *(void *)(a1 + 200);
  uint64_t v20 = *(void *)(a1 + 192);
  uint64_t v14 = *(void *)(a1 + 208);
  unsigned __int8 v9 = *(unsigned char *)(a1 + 216);
  uint64_t v30 = *(void *)(a1 + 232);
  uint64_t v31 = *(void *)(a1 + 224);
  uint64_t v28 = *(void *)(a1 + 248);
  uint64_t v29 = *(void *)(a1 + 240);
  uint64_t v36 = *(void *)(a1 + 264);
  uint64_t v34 = *(void *)(a1 + 280);
  uint64_t v35 = *(void *)(a1 + 272);
  uint64_t v33 = *(void *)(a1 + 288);
  uint64_t v44 = *(void *)(a1 + 312);
  uint64_t v45 = *(void *)(a1 + 304);
  uint64_t v42 = *(void *)(a1 + 328);
  uint64_t v43 = *(void *)(a1 + 320);
  uint64_t v40 = *(void *)(a1 + 344);
  uint64_t v41 = *(void *)(a1 + 336);
  uint64_t v38 = *(void *)(a1 + 360);
  uint64_t v39 = *(void *)(a1 + 352);
  uint64_t v32 = *(void *)(a1 + 368);
  unsigned __int8 v27 = *(unsigned char *)(a1 + 376);
  uint64_t v49 = *(void *)(a1 + 392);
  uint64_t v50 = *(void *)(a1 + 384);
  uint64_t v47 = *(void *)(a1 + 408);
  uint64_t v48 = *(void *)(a1 + 400);
  uint64_t v46 = *(void *)(a1 + 416);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 96);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 136);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 256);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 296);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 424);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000221B0(v2, v3);
  sub_1000221F4(v13, v12, v11, v10, v4);
  sub_100022254(v18, v17, v16, v15, v5);
  sub_100022268(v26, v25, v24, v23, v22, v21, v20, v19, v14, v9);
  sub_1000221F4(v31, v30, v29, v28, v6);
  sub_100022254(v36, v35, v34, v33, v7);
  sub_100022268(v45, v44, v43, v42, v41, v40, v39, v38, v32, v27);
  sub_1000222E0(v50, v49, v48, v47, v46, v37);
  return a1;
}

uint64_t sub_1000221B0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000221F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100022254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_1000221F4(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_100022268(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a5 != 0xFF)
  {
    sub_1000221F4(result, a2, a3, a4, a5);
    return sub_100022254(a6, a7, a8, a9, a10);
  }
  return result;
}

uint64_t sub_1000222E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0x3Fu)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10002232C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no replyblock found, doing nothing", v1, 2u);
}

void sub_100022370(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Loaded NTKPersistentFaceCollection is not current, aborting!", v1, 2u);
}

void sub_1000223B4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100021C7C((void *)&_mh_execute_header, v2, v3, "NSSWatchFaceCoordinator: Error syncing domain accessor: %@", v4, v5, v6, v7, 2u);
}

void sub_10002243C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NSSWatchFaceCoordinator: could not find selected face match, no changes made", v1, 2u);
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)()
{
  return LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)();
}

uint64_t LiveActivityText.init(title:subtitle:)()
{
  return LiveActivityText.init(title:subtitle:)();
}

uint64_t LiveActivityService.shared.unsafeMutableAddressor()
{
  return LiveActivityService.shared.unsafeMutableAddressor();
}

uint64_t LiveActivityTextMap.init(dynamicIslandExpanded:lockScreen:)()
{
  return LiveActivityTextMap.init(dynamicIslandExpanded:lockScreen:)();
}

uint64_t LiveActivityImageMap.init(imagePath:)()
{
  return LiveActivityImageMap.init(imagePath:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return _IOPSCopyPowerSourcesByType();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

uint64_t NSSAboutInfoRespMsgReadFrom()
{
  return _NSSAboutInfoRespMsgReadFrom();
}

uint64_t NSSAccountsInfoRespMsgReadFrom()
{
  return _NSSAccountsInfoRespMsgReadFrom();
}

uint64_t NSSAirplaneModeMsgReadFrom()
{
  return _NSSAirplaneModeMsgReadFrom();
}

uint64_t NSSAirplaneModeSettingsMsgReadFrom()
{
  return _NSSAirplaneModeSettingsMsgReadFrom();
}

uint64_t NSSCancelLogTransferRespMsgReadFrom()
{
  return _NSSCancelLogTransferRespMsgReadFrom();
}

uint64_t NSSDiagnosticLogsInfoRespMsgReadFrom()
{
  return _NSSDiagnosticLogsInfoRespMsgReadFrom();
}

uint64_t NSSInstallProfileRespMsgReadFrom()
{
  return _NSSInstallProfileRespMsgReadFrom();
}

uint64_t NSSLegalDocumentsRespMsgReadFrom()
{
  return _NSSLegalDocumentsRespMsgReadFrom();
}

uint64_t NSSLogDeleteRespMsgReadFrom()
{
  return _NSSLogDeleteRespMsgReadFrom();
}

uint64_t NSSLogForType()
{
  return _NSSLogForType();
}

uint64_t NSSLogTransferProgressMsgReadFrom()
{
  return _NSSLogTransferProgressMsgReadFrom();
}

uint64_t NSSOSTransactionComplete()
{
  return _NSSOSTransactionComplete();
}

uint64_t NSSOSTransactionCreate()
{
  return _NSSOSTransactionCreate();
}

uint64_t NSSProfileDataRespMsgReadFrom()
{
  return _NSSProfileDataRespMsgReadFrom();
}

uint64_t NSSProfilesInfoRespMsgReadFrom()
{
  return _NSSProfilesInfoRespMsgReadFrom();
}

uint64_t NSSRemoveProfileRespMsgReadFrom()
{
  return _NSSRemoveProfileRespMsgReadFrom();
}

uint64_t NSSUsagePurgeBundleRespMsgReadFrom()
{
  return _NSSUsagePurgeBundleRespMsgReadFrom();
}

uint64_t NSSUsageRespMsgReadFrom()
{
  return _NSSUsageRespMsgReadFrom();
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

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
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

void abort(void)
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
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

id objc_msgSend__activeNRDevice(void *a1, const char *a2, ...)
{
  return [a1 _activeNRDevice];
}

id objc_msgSend__beginMonitoringForPowerUpdates(void *a1, const char *a2, ...)
{
  return [a1 _beginMonitoringForPowerUpdates];
}

id objc_msgSend__beginMonitoringOnWristState(void *a1, const char *a2, ...)
{
  return [a1 _beginMonitoringOnWristState];
}

id objc_msgSend__currentDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 _currentDeviceUUID];
}

id objc_msgSend__loadFocusFaces(void *a1, const char *a2, ...)
{
  return [a1 _loadFocusFaces];
}

id objc_msgSend__powerStatusNotifierEnabled(void *a1, const char *a2, ...)
{
  return [a1 _powerStatusNotifierEnabled];
}

id objc_msgSend__processOffChargerState(void *a1, const char *a2, ...)
{
  return [a1 _processOffChargerState];
}

id objc_msgSend__registerForSleepSettingsChanges(void *a1, const char *a2, ...)
{
  return [a1 _registerForSleepSettingsChanges];
}

id objc_msgSend__removedFromChargerNotification(void *a1, const char *a2, ...)
{
  return [a1 _removedFromChargerNotification];
}

id objc_msgSend__resetIfTheActivePairedDeviceChanges(void *a1, const char *a2, ...)
{
  return [a1 _resetIfTheActivePairedDeviceChanges];
}

id objc_msgSend__saveFocusFaces(void *a1, const char *a2, ...)
{
  return [a1 _saveFocusFaces];
}

id objc_msgSend__stopMonitoringForPowerUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringForPowerUpdates];
}

id objc_msgSend__stopMonitoringOnWristState(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringOnWristState];
}

id objc_msgSend__updatePowerSourceDescription(void *a1, const char *a2, ...)
{
  return [a1 _updatePowerSourceDescription];
}

id objc_msgSend__updateSettings(void *a1, const char *a2, ...)
{
  return [a1 _updateSettings];
}

id objc_msgSend_aaIsManaged(void *a1, const char *a2, ...)
{
  return [a1 aaIsManaged];
}

id objc_msgSend_aaPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 aaPrimaryAccount];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activeDeviceIsAltAccount(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceIsAltAccount];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_appConduitTimerFired(void *a1, const char *a2, ...)
{
  return [a1 appConduitTimerFired];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_authenticated(void *a1, const char *a2, ...)
{
  return [a1 authenticated];
}

id objc_msgSend_availableStorageInBytes(void *a1, const char *a2, ...)
{
  return [a1 availableStorageInBytes];
}

id objc_msgSend_batteryCurrentCapacity(void *a1, const char *a2, ...)
{
  return [a1 batteryCurrentCapacity];
}

id objc_msgSend_batteryIsCharging(void *a1, const char *a2, ...)
{
  return [a1 batteryIsCharging];
}

id objc_msgSend_bluetoothOn(void *a1, const char *a2, ...)
{
  return [a1 bluetoothOn];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_builtinApps(void *a1, const char *a2, ...)
{
  return [a1 builtinApps];
}

id objc_msgSend_cachedReply(void *a1, const char *a2, ...)
{
  return [a1 cachedReply];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_cancelActiveLogFileTranfers(void *a1, const char *a2, ...)
{
  return [a1 cancelActiveLogFileTranfers];
}

id objc_msgSend_cancelledLogInTransit(void *a1, const char *a2, ...)
{
  return [a1 cancelledLogInTransit];
}

id objc_msgSend_cellularOn(void *a1, const char *a2, ...)
{
  return [a1 cellularOn];
}

id objc_msgSend_chargingReminders(void *a1, const char *a2, ...)
{
  return [a1 chargingReminders];
}

id objc_msgSend_checkForCompletionOfVictoryAppInstallationOnPhone(void *a1, const char *a2, ...)
{
  return [a1 checkForCompletionOfVictoryAppInstallationOnPhone];
}

id objc_msgSend_checkIfAppConduitKnowsAboutVictoryWatchApp(void *a1, const char *a2, ...)
{
  return [a1 checkIfAppConduitKnowsAboutVictoryWatchApp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_configProfiles(void *a1, const char *a2, ...)
{
  return [a1 configProfiles];
}

id objc_msgSend_configProfilesCount(void *a1, const char *a2, ...)
{
  return [a1 configProfilesCount];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_coordinateNikeAppInstallation(void *a1, const char *a2, ...)
{
  return [a1 coordinateNikeAppInstallation];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentNikePhoneAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 currentNikePhoneAppBundleID];
}

id objc_msgSend_currentNikeWatchAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 currentNikeWatchAppBundleID];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_dSID(void *a1, const char *a2, ...)
{
  return [a1 dSID];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCalendars(void *a1, const char *a2, ...)
{
  return [a1 defaultCalendars];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_directoryPath(void *a1, const char *a2, ...)
{
  return [a1 directoryPath];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_earlyIvarInitialzation(void *a1, const char *a2, ...)
{
  return [a1 earlyIvarInitialzation];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_endBridgeLiveActivity(void *a1, const char *a2, ...)
{
  return [a1 endBridgeLiveActivity];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return [a1 expiryDate];
}

id objc_msgSend_faceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 faceIdentifier];
}

id objc_msgSend_faceLibraryCollection(void *a1, const char *a2, ...)
{
  return [a1 faceLibraryCollection];
}

id objc_msgSend_filePaths(void *a1, const char *a2, ...)
{
  return [a1 filePaths];
}

id objc_msgSend_fileTransferInProgress(void *a1, const char *a2, ...)
{
  return [a1 fileTransferInProgress];
}

id objc_msgSend_fileTransferProgress(void *a1, const char *a2, ...)
{
  return [a1 fileTransferProgress];
}

id objc_msgSend_filesByCategorys(void *a1, const char *a2, ...)
{
  return [a1 filesByCategorys];
}

id objc_msgSend_filesType(void *a1, const char *a2, ...)
{
  return [a1 filesType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceEnabledOverride(void *a1, const char *a2, ...)
{
  return [a1 forceEnabledOverride];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return [a1 friendlyName];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return [a1 fromID];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getActivePairedDeviceIDFromNanoRegistry(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDeviceIDFromNanoRegistry];
}

id objc_msgSend_handleMemoryPressureEvent(void *a1, const char *a2, ...)
{
  return [a1 handleMemoryPressureEvent];
}

id objc_msgSend_hasAaIsManaged(void *a1, const char *a2, ...)
{
  return [a1 hasAaIsManaged];
}

id objc_msgSend_hasAaPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 hasAaPrimaryAccount];
}

id objc_msgSend_hasAltDSID(void *a1, const char *a2, ...)
{
  return [a1 hasAltDSID];
}

id objc_msgSend_hasAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 hasAuthenticated];
}

id objc_msgSend_hasAvailableStorageInBytes(void *a1, const char *a2, ...)
{
  return [a1 hasAvailableStorageInBytes];
}

id objc_msgSend_hasBatteryCurrentCapacity(void *a1, const char *a2, ...)
{
  return [a1 hasBatteryCurrentCapacity];
}

id objc_msgSend_hasBatteryIsCharging(void *a1, const char *a2, ...)
{
  return [a1 hasBatteryIsCharging];
}

id objc_msgSend_hasDSID(void *a1, const char *a2, ...)
{
  return [a1 hasDSID];
}

id objc_msgSend_hasError(void *a1, const char *a2, ...)
{
  return [a1 hasError];
}

id objc_msgSend_hasIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasIdentifier];
}

id objc_msgSend_hasLoaded(void *a1, const char *a2, ...)
{
  return [a1 hasLoaded];
}

id objc_msgSend_hasManagedAppsData(void *a1, const char *a2, ...)
{
  return [a1 hasManagedAppsData];
}

id objc_msgSend_hasMdmProfile(void *a1, const char *a2, ...)
{
  return [a1 hasMdmProfile];
}

id objc_msgSend_hasNumberOfApps(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfApps];
}

id objc_msgSend_hasNumberOfPhotos(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfPhotos];
}

id objc_msgSend_hasNumberOfSongs(void *a1, const char *a2, ...)
{
  return [a1 hasNumberOfSongs];
}

id objc_msgSend_hasPurgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 hasPurgeableSpace];
}

id objc_msgSend_hasRmAccountData(void *a1, const char *a2, ...)
{
  return [a1 hasRmAccountData];
}

id objc_msgSend_hasSarUrlAdded(void *a1, const char *a2, ...)
{
  return [a1 hasSarUrlAdded];
}

id objc_msgSend_hasType(void *a1, const char *a2, ...)
{
  return [a1 hasType];
}

id objc_msgSend_hasUsername(void *a1, const char *a2, ...)
{
  return [a1 hasUsername];
}

id objc_msgSend_hasWatchAKDevice(void *a1, const char *a2, ...)
{
  return [a1 hasWatchAKDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsFileTransferService(void *a1, const char *a2, ...)
{
  return [a1 idsFileTransferService];
}

id objc_msgSend_idsQueue(void *a1, const char *a2, ...)
{
  return [a1 idsQueue];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_initializeIDS(void *a1, const char *a2, ...)
{
  return [a1 initializeIDS];
}

id objc_msgSend_installProgress(void *a1, const char *a2, ...)
{
  return [a1 installProgress];
}

id objc_msgSend_installState(void *a1, const char *a2, ...)
{
  return [a1 installState];
}

id objc_msgSend_installVictoryAppOntoWatch(void *a1, const char *a2, ...)
{
  return [a1 installVictoryAppOntoWatch];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isDefaultPairedDeviceNearby(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDeviceNearby];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInstalledByDeclarativeManagement(void *a1, const char *a2, ...)
{
  return [a1 isInstalledByDeclarativeManagement];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_lastKnownPowerLevelBeforeGoingOffCharger(void *a1, const char *a2, ...)
{
  return [a1 lastKnownPowerLevelBeforeGoingOffCharger];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legalNotices(void *a1, const char *a2, ...)
{
  return [a1 legalNotices];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_levels(void *a1, const char *a2, ...)
{
  return [a1 levels];
}

id objc_msgSend_license(void *a1, const char *a2, ...)
{
  return [a1 license];
}

id objc_msgSend_listenToNanoRegistryAndResetIfTheActivePairedDeviceChanges(void *a1, const char *a2, ...)
{
  return [a1 listenToNanoRegistryAndResetIfTheActivePairedDeviceChanges];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifiers];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logTranferIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 logTranferIdentifiers];
}

id objc_msgSend_managedAppsData(void *a1, const char *a2, ...)
{
  return [a1 managedAppsData];
}

id objc_msgSend_mdmProfile(void *a1, const char *a2, ...)
{
  return [a1 mdmProfile];
}

id objc_msgSend_mirrorAirplaneSendTimeout(void *a1, const char *a2, ...)
{
  return [a1 mirrorAirplaneSendTimeout];
}

id objc_msgSend_mirroringAirplaneMode(void *a1, const char *a2, ...)
{
  return [a1 mirroringAirplaneMode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return [a1 notificationType];
}

id objc_msgSend_npsManager(void *a1, const char *a2, ...)
{
  return [a1 npsManager];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_numberOfApps(void *a1, const char *a2, ...)
{
  return [a1 numberOfApps];
}

id objc_msgSend_numberOfFaces(void *a1, const char *a2, ...)
{
  return [a1 numberOfFaces];
}

id objc_msgSend_numberOfPhotos(void *a1, const char *a2, ...)
{
  return [a1 numberOfPhotos];
}

id objc_msgSend_numberOfSongs(void *a1, const char *a2, ...)
{
  return [a1 numberOfSongs];
}

id objc_msgSend_numberingSystems(void *a1, const char *a2, ...)
{
  return [a1 numberingSystems];
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return [a1 organization];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedWatchVictoryBehavior(void *a1, const char *a2, ...)
{
  return [a1 pairedWatchVictoryBehavior];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_powerSourceDescription(void *a1, const char *a2, ...)
{
  return [a1 powerSourceDescription];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_processBatteryUpdate(void *a1, const char *a2, ...)
{
  return [a1 processBatteryUpdate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return [a1 profileData];
}

id objc_msgSend_profileDescription(void *a1, const char *a2, ...)
{
  return [a1 profileDescription];
}

id objc_msgSend_profilePayloadsSummary(void *a1, const char *a2, ...)
{
  return [a1 profilePayloadsSummary];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_purgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 purgeableSpace];
}

id objc_msgSend_rebootDevice(void *a1, const char *a2, ...)
{
  return [a1 rebootDevice];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastPostedBatteryNotification(void *a1, const char *a2, ...)
{
  return [a1 removeLastPostedBatteryNotification];
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return [a1 reply];
}

id objc_msgSend_resetBecauseTheActivePairedDeviceChanged(void *a1, const char *a2, ...)
{
  return [a1 resetBecauseTheActivePairedDeviceChanged];
}

id objc_msgSend_resetLevels(void *a1, const char *a2, ...)
{
  return [a1 resetLevels];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rmAccountData(void *a1, const char *a2, ...)
{
  return [a1 rmAccountData];
}

id objc_msgSend_rmConfigurationViewModels(void *a1, const char *a2, ...)
{
  return [a1 rmConfigurationViewModels];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sarStatement(void *a1, const char *a2, ...)
{
  return [a1 sarStatement];
}

id objc_msgSend_sarUrlAdded(void *a1, const char *a2, ...)
{
  return [a1 sarUrlAdded];
}

id objc_msgSend_selectedBetaProgramInfo(void *a1, const char *a2, ...)
{
  return [a1 selectedBetaProgramInfo];
}

id objc_msgSend_selectedFace(void *a1, const char *a2, ...)
{
  return [a1 selectedFace];
}

id objc_msgSend_selectedFocusFaces(void *a1, const char *a2, ...)
{
  return [a1 selectedFocusFaces];
}

id objc_msgSend_serverProtocol(void *a1, const char *a2, ...)
{
  return [a1 serverProtocol];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sfClient(void *a1, const char *a2, ...)
{
  return [a1 sfClient];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_shouldFetchBuiltinAppsNotice(void *a1, const char *a2, ...)
{
  return [a1 shouldFetchBuiltinAppsNotice];
}

id objc_msgSend_sleepSchedulePredicate(void *a1, const char *a2, ...)
{
  return [a1 sleepSchedulePredicate];
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return [a1 sleepStore];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAppConduitTimer(void *a1, const char *a2, ...)
{
  return [a1 startAppConduitTimer];
}

id objc_msgSend_startMonitoringAppConduitNotification(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringAppConduitNotification];
}

id objc_msgSend_startMonitoringVictoryAppInstallationOnPhone(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringVictoryAppInstallationOnPhone];
}

id objc_msgSend_stopAppConduitTimer(void *a1, const char *a2, ...)
{
  return [a1 stopAppConduitTimer];
}

id objc_msgSend_stopMonitoringAppConduitNotification(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringAppConduitNotification];
}

id objc_msgSend_stopMonitoringVictoryAppInstallationOnPhone(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringVictoryAppInstallationOnPhone];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_substantialChange(void *a1, const char *a2, ...)
{
  return [a1 substantialChange];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_supportedCalendars(void *a1, const char *a2, ...)
{
  return [a1 supportedCalendars];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return [a1 systemLanguages];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_toMCProfileInfo(void *a1, const char *a2, ...)
{
  return [a1 toMCProfileInfo];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uUID(void *a1, const char *a2, ...)
{
  return [a1 uUID];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_userDeletableSpace(void *a1, const char *a2, ...)
{
  return [a1 userDeletableSpace];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_waitForActivePairedOrAltAccountDevice(void *a1, const char *a2, ...)
{
  return [a1 waitForActivePairedOrAltAccountDevice];
}

id objc_msgSend_watchAKDevice(void *a1, const char *a2, ...)
{
  return [a1 watchAKDevice];
}

id objc_msgSend_watchSleepFeaturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 watchSleepFeaturesEnabled];
}

id objc_msgSend_wifiOn(void *a1, const char *a2, ...)
{
  return [a1 wifiOn];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}