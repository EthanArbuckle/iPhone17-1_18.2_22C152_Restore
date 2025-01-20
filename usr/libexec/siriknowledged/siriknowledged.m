void sub_100001700(uint64_t a1)
{
  NSObject *v1;
  void *val;
  void block[4];
  id v4;
  id location;
  uint64_t vars8;

  val = objc_loadWeakRetained((id *)(a1 + 32));
  if (val)
  {
    objc_initWeak(&location, val);
    v1 = val[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000017CC;
    block[3] = &unk_100018538;
    objc_copyWeak(&v4, &location);
    dispatch_async(v1, block);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

uint64_t sub_1000017CC(uint64_t a1)
{
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    val = WeakRetained;
    if (v3)
    {
      intptr_t v4 = dispatch_source_testcancel(v3);
      v2 = val;
      if (!v4)
      {
        dispatch_source_cancel(v3);
        dispatch_object_t v5 = val[2];
        val[2] = 0;

        v2 = val;
      }
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v2[1]);
    dispatch_object_t v7 = val[2];
    val[2] = v6;

    objc_initWeak(&location, val);
    v8 = val[2];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100001938;
    handler[3] = &unk_100018538;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v8, handler);
    v9 = val[2];
    dispatch_time_t v10 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(val[2]);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return _objc_release_x1();
}

void sub_100001938(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    dispatch_source_cancel(WeakRetained[2]);
    dispatch_source_t v2 = v14[2];
    v14[2] = 0;

    AFSupportPreferencesSynchronize();
    int v3 = AFPreferencesAssistantEnabled();
    intptr_t v4 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = @"enabled";
      if (!v3) {
        CFStringRef v5 = @"disabled";
      }
      *(_DWORD *)buf = 136315394;
      v25 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]";
      __int16 v26 = 2112;
      CFStringRef v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Siri Assistant is now %@", buf, 0x16u);
    }
    if (!v3)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = [&off_1000194A8 countByEnumeratingWithState:&v16 objects:buf count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(&off_1000194A8);
            }
            uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            v12 = CKLogContextDaemon;
            if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v20 = 136315394;
              v21 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]";
              __int16 v22 = 2112;
              uint64_t v23 = v10;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Deleting all values from store with identifier %@", v20, 0x16u);
            }
            v13 = +[CKDaemon sharedDaemon];
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_100001BEC;
            v15[3] = &unk_100018778;
            v15[4] = v10;
            [v13 removeAllValuesFromStoreWithIdentifier:v10 completionHandler:v15];
          }
          id v7 = [&off_1000194A8 countByEnumeratingWithState:&v16 objects:buf count:16];
        }
        while (v7);
      }
    }
    WeakRetained = v14;
  }
}

void sub_100001BEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    intptr_t v4 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = v4;
      id v7 = [v3 localizedDescription];
      int v8 = 136315650;
      v9 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error deleting values from store %@ on Siri deactivation. %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

uint64_t sub_100001E1C(uint64_t a1)
{
  qword_10001DE98 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100001E54(void *a1, uint64_t a2)
{
  id v3 = a1;
  intptr_t v4 = [@"CKPersistentStorageKeysRemoved." stringByAppendingString:a2];
  CFStringRef v7 = @"removed";
  id v8 = v3;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, v4, 0, v5, 1u);
}

void sub_100002374(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  qword_10001DEA0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100002660(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  uint64_t v8 = objc_opt_new();
  v9 = v8;
  if (v6) {
    [v8 addObjectsFromArray:v6];
  }
  if ([*(id *)(a1 + 32) count])
  {
    __int16 v10 = +[CKDaemon sharedDaemon];
    [v10 saveKeysAndValues:*(void *)(a1 + 32) toStoreWithIdentifier:@"synched" completionHandler:&stru_100018578];

    uint64_t v11 = [*(id *)(a1 + 32) allKeys];
    [v9 removeObjectsInArray:v11];
  }
  if ([*(id *)(a1 + 40) count])
  {
    __int16 v12 = +[CKDaemon sharedDaemon];
    [v12 removeValuesForKeys:*(void *)(a1 + 40) fromStoreWithIdentifier:@"synched" completionHandler:&stru_100018598];

    [v9 removeObjectsInArray:*(void *)(a1 + 40)];
  }
  if ([v9 count])
  {
    v13 = +[CKDaemon sharedDaemon];
    [v13 removeValuesForKeys:v9 fromStoreWithIdentifier:@"synched" completionHandler:&stru_1000185B8];
  }
}

void sub_100002848(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100002910(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_1000029D8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100002AA0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100002B68(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100002EAC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]_block_invoke";
      __int16 v6 = 2112;
      uint64_t v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100003184(uint64_t a1, int a2)
{
  if (a1 && *(unsigned __int8 *)(a1 + 9) != a2)
  {
    *(unsigned char *)(a1 + 9) = a2;
    id v4 = +[CKKnowledgeStore userDefaultsKnowledgeStore];
    uint64_t v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 9)];
    [v4 setValue:v3 forKey:@"HasSetUpRecordZoneSubscription"];
  }
}

uint64_t sub_100003228(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_1000032D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableSyncAndDeleteCloudDataWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100003618(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000036FC;
  block[3] = &unk_100018958;
  block[4] = v8;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = *(void *)(a1 + 48);
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void sub_1000036FC(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelSubscriptionSetupTimer];
  if ([*(id *)(a1 + 32) _shouldSync])
  {
    if ([*(id *)(a1 + 40) containsObject:*(void *)(a1 + 48)])
    {
      uint64_t v2 = (void *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void **)(a1 + 48);
        id v4 = v2;
        id v5 = [v3 subscriptionID];
        *(_DWORD *)buf = 136315394;
        v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke";
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Subscription created: (%@)", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 48));
      sub_100003184(*(void *)(a1 + 32), 1);
      [*(id *)(a1 + 32) _fetchChanges];
    }
    else
    {
      int v7 = sub_100003A88(*(void **)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 32);
      if (v7)
      {
        if (*(void *)(v8 + 56))
        {
          [(id)v8 _resetZone];
        }
        else
        {
          sub_100003184(v8, 0);
        }
      }
      else
      {
        dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v8 + 32));
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 80);
        *(void *)(v10 + 80) = v9;

        __int16 v12 = *(NSObject **)(*(void *)(a1 + 32) + 80);
        dispatch_time_t v13 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
        dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        if (*(double *)(a1 + 64) + *(double *)(a1 + 64) <= 86400.0) {
          double v14 = *(double *)(a1 + 64) + *(double *)(a1 + 64);
        }
        else {
          double v14 = 86400.0;
        }
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(NSObject **)(v15 + 80);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100003C24;
        v19[3] = &unk_100018908;
        v19[4] = v15;
        *(double *)&v19[5] = v14;
        dispatch_source_set_event_handler(v16, v19);
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
        id v17 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          long long v18 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
          __int16 v22 = 2112;
          uint64_t v23 = v18;
          __int16 v24 = 2048;
          double v25 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Subscription creation failed with error (%@). Retrying in %f seconds", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    id v6 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Will not retry creating zone subscription", buf, 0xCu);
    }
  }
}

uint64_t sub_100003A88(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];

  if (v2 != CKErrorDomain) {
    goto LABEL_2;
  }
  if ([v1 code] == (id)26)
  {
    uint64_t v3 = 1;
    goto LABEL_17;
  }
  if ([v1 code] == (id)2)
  {
    id v4 = [v1 userInfo];
    id v5 = [v4 objectForKey:CKPartialErrorsByItemIDKey];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = [v5 allValues];
    uint64_t v3 = (uint64_t)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) code] == (id)26)
          {
            uint64_t v3 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v3 = (uint64_t)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
LABEL_2:
    uint64_t v3 = 0;
  }
LABEL_17:

  return v3;
}

id sub_100003C24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupRecordZoneSubscriptionWithRetryInterval:*(double *)(a1 + 40)];
}

void sub_100003D3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createRecordsIDsForKeys:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003DFC;
  v5[3] = &unk_1000189D0;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 _saveRecords:0 recordIDsToDelete:v2 savePolicy:1 completion:v5];
}

void sub_100003DFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = *(void **)(a1 + 40);
  if (v10)
  {
    long long v11 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003EF8;
    v12[3] = &unk_100018B38;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t sub_100003EF8(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100003FD4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createRecordsWithDictionary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004094;
  v5[3] = &unk_1000189D0;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 _saveRecords:v2 recordIDsToDelete:0 savePolicy:1 completion:v5];
}

void sub_100004094(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = *(void **)(a1 + 40);
  if (v10)
  {
    long long v11 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004190;
    v12[3] = &unk_100018B38;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t sub_100004190(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

id sub_10000428C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRecords:*(void *)(a1 + 40) recordIDsToDelete:*(void *)(a1 + 48) savePolicy:1 completion:*(void *)(a1 + 56)];
}

void sub_100004520(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = CKLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to save records into database with error: (%@)", buf, 0x16u);
    }
    if (sub_1000047AC(v9))
    {
      long long v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(NSObject **)(v12 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000497C;
      block[3] = &unk_1000187A0;
      block[4] = v12;
      dispatch_group_t v14 = v11;
      dispatch_group_t v20 = v14;
      dispatch_async(v13, block);
    }
    else
    {
      if (!sub_100003A88(v9)) {
        goto LABEL_12;
      }
      dispatch_group_t v14 = dispatch_group_create();
    }
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(NSObject **)(v15 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100004A40;
    v18[3] = &unk_100018A88;
    v18[4] = v15;
    dispatch_group_notify(v14, v16, v18);
  }
  else
  {
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    dispatch_group_t v14 = v10;
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke_4";
    __int16 v23 = 2048;
    id v24 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Saved %ld records into database", buf, 0x16u);
  }

LABEL_12:
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, id, id))(v17 + 16))(v17, v9, v7, v8);
  }
}

uint64_t sub_1000047AC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];

  if (v2 != CKErrorDomain) {
    goto LABEL_2;
  }
  if ([v1 code] == (id)112)
  {
    uint64_t v3 = 1;
    goto LABEL_19;
  }
  if ([v1 code] == (id)2)
  {
    id v4 = [v1 userInfo];
    id v5 = [v4 objectForKey:CKPartialErrorsByItemIDKey];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [v5 allValues];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 domain];
          if (v12 == v2)
          {
            id v13 = [v11 code];

            if (v13 == (id)112)
            {
              uint64_t v3 = 1;
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v3 = 0;
LABEL_18:
  }
  else
  {
LABEL_2:
    uint64_t v3 = 0;
  }
LABEL_19:

  return v3;
}

void sub_10000497C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) zoneID];
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004A58;
    v4[3] = &unk_100018778;
    uint64_t v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 _deleteRecordZoneWithID:v2 qualityOfService:17 completion:v4];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_100004A40(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1[7]) {
    [v1 _resetZone];
  }
  else {
    sub_100003184((uint64_t)v1, 0);
  }
}

void sub_100004A58(uint64_t a1)
{
}

void sub_1000054B4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    long long v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = v10;
      dispatch_group_t v14 = [v12 zoneName];
      int v15 = 136315650;
      long long v16 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]_block_invoke";
      __int16 v17 = 2112;
      long long v18 = v14;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Error deleting zone (%@): (%@)", (uint8_t *)&v15, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }
}

void sub_100005904(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    long long v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      dispatch_group_t v14 = v10;
      int v15 = [v13 zoneName];
      int v16 = 136315650;
      __int16 v17 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]_block_invoke";
      __int16 v18 = 2112;
      __int16 v19 = v15;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Error creating zone (%@): (%@)", (uint8_t *)&v16, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = [v7 firstObject];
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v9, v12);
  }
}

void sub_100005B88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C70;
  block[3] = &unk_100018958;
  block[4] = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void sub_100005C70(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRecordZoneSetupTimer];
  if ([*(id *)(a1 + 32) _shouldSync])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 48))
    {
      uint64_t v3 = *(void **)(a1 + 48);
      if (!v3)
      {
        id v14 = *(void **)(a1 + 56);
        if (v14)
        {
          uint64_t v15 = (void *)CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            int v16 = v15;
            __int16 v17 = [v14 zoneID];
            __int16 v18 = [v17 zoneName];
            *(_DWORD *)buf = 136315394;
            __int16 v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
            __int16 v27 = 2112;
            v28 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Zone created: (%@)", buf, 0x16u);

            id v14 = *(void **)(a1 + 56);
            uint64_t v2 = *(void *)(a1 + 32);
          }
          if (([v14 isEqual:*(void *)(v2 + 56)] & 1) == 0)
          {
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 56));
            sub_100005FE4(*(void *)(a1 + 32), 0);
          }
          uint64_t v19 = *(void *)(a1 + 32);
          if (*(void *)(v19 + 72) && !*(unsigned char *)(v19 + 9)) {
            [(id)v19 _fetchChanges];
          }
          else {
            [(id)v19 _setupRecordZoneSubscription];
          }
          return;
        }
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100006164;
      v22[3] = &unk_100018930;
      v22[4] = v2;
      uint64_t v24 = *(void *)(a1 + 64);
      id v23 = v3;
      id v4 = objc_retainBlock(v22);
      id v5 = *(void **)(a1 + 48);
      if (v5 && sub_1000047AC(v5))
      {
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100006320;
        v20[3] = &unk_100018C50;
        uint8_t v20[4] = v7;
        id v21 = v4;
        [v7 _deleteRecordZoneWithID:v6 qualityOfService:17 completion:v20];
      }
      else
      {
        ((void (*)(void *))v4[2])(v4);
      }

      id v13 = v23;
    }
    else
    {
      id v12 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_3";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Zone creation error - container no longer exists", buf, 0xCu);
        uint64_t v2 = *(void *)(a1 + 32);
      }
      id v13 = *(void **)(v2 + 56);
      *(void *)(v2 + 56) = 0;
    }

    return;
  }
  id v8 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v8;
    uint64_t v11 = [v9 zoneName];
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_2";
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Will not attempt retry creating zone: (%@)", buf, 0x16u);
  }
}

void sub_100005FE4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    id v7 = *(id *)(a1 + 88);
    uint64_t v6 = (id *)(a1 + 88);
    if (v7 != v4)
    {
      objc_storeStrong(v6, a2);
      id v8 = +[CKKnowledgeStore userDefaultsKnowledgeStore];
      if (v5)
      {
        id v13 = 0;
        id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
        id v10 = v13;
        if (!v10)
        {
          [v8 setValue:v9 forKey:@"ServerChangeToken"];

          goto LABEL_10;
        }
        uint64_t v11 = v10;
        id v12 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v15 = "-[CKNCloudKitManager setServerChangeToken:]";
          __int16 v16 = 2112;
          __int16 v17 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Error unarchihving server change token %@", buf, 0x16u);
        }
      }
      [v8 setValue:0 forKey:@"ServerChangeToken"];
LABEL_10:
    }
  }
}

void sub_100006164(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  if (*(double *)(a1 + 48) + *(double *)(a1 + 48) <= 86400.0) {
    double v7 = *(double *)(a1 + 48) + *(double *)(a1 + 48);
  }
  else {
    double v7 = 86400.0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 64);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006404;
  v12[3] = &unk_100018908;
  void v12[4] = v8;
  *(double *)&v12[5] = v7;
  dispatch_source_set_event_handler(v9, v12);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
  id v10 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Zone creation failed: (%@) Retrying in %f seconds", buf, 0x20u);
  }
}

void sub_100006320(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_t v2 = *(NSObject **)(v1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000063B4;
  v3[3] = &unk_100018890;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t sub_1000063B4(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRecordZoneSetupTimer];
  sub_100003184(*(void *)(a1 + 32), 0);
  dispatch_source_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id sub_100006404(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupRecordZoneWithRetryInterval:*(double *)(a1 + 40)];
}

void sub_100006964(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000069F8;
  v4[3] = &unk_1000188E0;
  dispatch_source_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _fetchChangesFrom:0 completion:v4];
}

void sub_1000069F8(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = *(void **)(a1 + 40);
  if (v12)
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006B04;
    block[3] = &unk_1000188B8;
    id v18 = v12;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    char v19 = a5;
    dispatch_async(v13, block);
  }
}

uint64_t sub_100006B04(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

void sub_100006BB8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[11];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006C50;
  v3[3] = &unk_1000188E0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _fetchChangesFrom:v2 completion:v3];
}

void sub_100006C50(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(NSObject **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D8C;
  block[3] = &unk_100018868;
  id v23 = v11;
  uint64_t v24 = v15;
  id v25 = v14;
  id v17 = *(id *)(a1 + 40);
  id v27 = v13;
  id v28 = v17;
  id v26 = v12;
  char v29 = a5;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = v11;
  dispatch_async(v16, block);
}

uint64_t sub_100006D8C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (!v2)
  {
    if ([(id)a1[5] _shouldSync])
    {
      uint64_t v3 = a1[5];
      id v4 = (void *)a1[6];
LABEL_9:
      sub_100005FE4(v3, v4);
      goto LABEL_10;
    }
    uint64_t v2 = (void *)a1[4];
  }
  id v5 = v2;
  dispatch_time_t v6 = [v5 domain];
  double v7 = v6;
  if (v6 != CKErrorDomain)
  {

    goto LABEL_10;
  }
  id v8 = [v5 code];

  if (v8 == (id)21)
  {
    uint64_t v3 = a1[5];
    id v4 = 0;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t result = a1[9];
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

void sub_100006F88(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(NSObject **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000070B4;
  block[3] = &unk_100018818;
  id v23 = v11;
  uint64_t v24 = v15;
  char v29 = a5;
  id v25 = v14;
  id v26 = v12;
  uint64_t v17 = *(void *)(a1 + 40);
  id v27 = v13;
  uint64_t v28 = v17;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = v11;
  dispatch_async(v16, block);
}

void sub_1000070B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ([*(id *)(a1 + 40) _shouldSync])
    {
      sub_100005FE4(*(void *)(a1 + 40), *(void **)(a1 + 48));
      if (*(unsigned char *)(a1 + 80) || [*(id *)(a1 + 56) count] || objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        uint64_t v3 = [*(id *)(a1 + 40) _createDictionaryFromRecords:*(void *)(a1 + 56)];
        id v4 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v5 = v4;
          dispatch_time_t v6 = [v3 allKeys];
          *(_DWORD *)buf = 136315394;
          id v18 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]_block_invoke_2";
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received keys=[%@]", buf, 0x16u);
        }
        double v7 = [*(id *)(a1 + 40) _createKeysForRecordsIDs:*(void *)(a1 + 64)];
        [*(id *)(*(void *)(a1 + 40) + 96) mergeRecordsWithDictionary:v3 deletedRecordKeys:v7 containsAllChanges:*(unsigned __int8 *)(a1 + 80)];
        id v8 = +[AFAnalytics sharedAnalytics];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10000738C;
        v15[3] = &unk_1000187F0;
        id v16 = *(id *)(a1 + 56);
        [v8 logEventWithType:4102 contextProvider:v15];
      }
      return;
    }
    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v14 = v2;
  id v9 = [v14 domain];
  id v10 = v9;
  if (v9 == CKErrorDomain)
  {
    id v11 = [v14 code];

    if (v11 == (id)21)
    {
      sub_100005FE4(*(void *)(a1 + 40), 0);
      if ([*(id *)(a1 + 40) _shouldSync])
      {
        id v12 = *(void **)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 72) + 1;
        [v12 _fetchChangesWithRetryCount:v13];
      }
    }
  }
  else
  {
  }
}

id sub_10000738C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) count];
  if (v3)
  {
    id v21 = v2;
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = *(id *)(a1 + 32);
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
          id v12 = [v10 recordID];
          uint64_t v13 = [v12 recordName];

          if (v13) {
            [v11 setObject:v13 forKey:@"record name"];
          }
          id v14 = [v10 modificationDate];
          uint64_t v15 = v14;
          if (v14)
          {
            [v14 timeIntervalSince1970];
            id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v11 setObject:v16 forKey:@"modification date"];
          }
          uint64_t v17 = [v10 recordChangeTag];
          if (v17) {
            [v11 setObject:v17 forKey:@"tag"];
          }
          [v4 addObject:v11];
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    id v2 = v21;
    if ([v4 count]) {
      [v21 setObject:v4 forKey:@"changes"];
    }
  }
  id v18 = +[NSDate date];
  [v18 timeIntervalSince1970];
  __int16 v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setObject:v19 forKey:@"now"];

  return v2;
}

void sub_100007C3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007C5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007C6C(uint64_t a1)
{
}

id sub_100007C74(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_100007C80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100007C8C(uint64_t a1, int a2, id obj)
{
}

void sub_100007CA0(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 domain];
    id v16 = v15;
    if (v15 == CKErrorDomain)
    {
      id v23 = [v14 code];

      if (v23 == (id)21)
      {
        long long v24 = (void *)CKLogContextDaemon;
        if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
LABEL_11:
          uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8);
          long long v22 = *(void **)(v31 + 40);
          *(void *)(v31 + 40) = 0;
          goto LABEL_12;
        }
        long long v25 = v24;
        id v26 = [v10 zoneName];
        int v32 = 136315394;
        v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke_4";
        __int16 v34 = 2112;
        v35 = v26;
        id v27 = "%s Change token expired for zone (%@)";
        uint64_t v28 = v25;
        uint32_t v29 = 22;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v32, v29);

        goto LABEL_11;
      }
    }
    else
    {
    }
    v30 = (void *)CKLogContextDaemon;
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    long long v25 = v30;
    id v26 = [v10 zoneName];
    int v32 = 136315650;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v34 = 2112;
    v35 = v26;
    __int16 v36 = 2112;
    v37 = v14;
    id v27 = "%s Failed to fetch changes in zone (%@) with error (%@)";
    uint64_t v28 = v25;
    uint32_t v29 = 32;
    goto LABEL_14;
  }
  uint64_t v17 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    __int16 v19 = [v10 zoneName];
    int v32 = 136315394;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Fetched changes successfully in zone (%@)", (uint8_t *)&v32, 0x16u);
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
  id v21 = v11;
  long long v22 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v21;
LABEL_12:
}

void sub_100007F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    [v5 databaseScope];
    id v7 = CKDatabaseScopeString();
    id v8 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 136315650;
    id v23 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2048;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Finished fetching changes in database (%@), %ld records", buf, 0x20u);
  }
  if (v3)
  {
    id v9 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Failed to fetch changes with error (%@)", buf, 0x16u);
    }
    int v10 = sub_1000047AC(v3);
    if ((sub_100003A88(v3) & 1) != 0 || v10)
    {
      id v11 = dispatch_group_create();
      id v12 = v11;
      if (v10)
      {
        dispatch_group_enter(v11);
        uint64_t v13 = *(void *)(a1 + 48);
        id v14 = *(NSObject **)(v13 + 32);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008200;
        block[3] = &unk_1000187A0;
        void block[4] = v13;
        id v21 = v12;
        dispatch_async(v14, block);
      }
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = *(NSObject **)(v15 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000082C4;
      v19[3] = &unk_100018A88;
      v19[4] = v15;
      dispatch_group_notify(v12, v16, v19);
    }
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17)
    {
      BOOL v18 = 0;
LABEL_15:
      (*(void (**)(uint64_t, id, void, void, BOOL, void))(v17 + 16))(v17, v3, *(void *)(a1 + 40), *(void *)(a1 + 56), v18, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17)
    {
      BOOL v18 = *(unsigned char *)(a1 + 80) != 0;
      goto LABEL_15;
    }
  }
}

void sub_100008200(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) zoneID];
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000082DC;
    v4[3] = &unk_100018778;
    id v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 _deleteRecordZoneWithID:v2 qualityOfService:17 completion:v4];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_1000082C4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[7]) {
    [v1 _resetZone];
  }
  else {
    sub_100003184((uint64_t)v1, 0);
  }
}

void sub_1000082DC(uint64_t a1)
{
}

void sub_10000870C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000087D8;
  block[3] = &unk_100018688;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void sub_1000087D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Error while retrieving account status: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  id v4 = *(void **)(a1 + 40);
  if (v4 && [v4 supportsDeviceToDeviceEncryption])
  {
    [*(id *)(a1 + 48) _handleAccountStatusChange:*(void *)(a1 + 40)];
    return;
  }
  id v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Account status change cannot be handled", (uint8_t *)&v9, 0xCu);
    id v5 = CKLogContextDaemon;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v7)
    {
      int v9 = 136315138;
      id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
      id v8 = "%s AccountInfo DOES NOT supportsDeviceToDeviceEncryption";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    int v9 = 136315138;
    id v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    id v8 = "%s AccountInfo is nil";
    goto LABEL_15;
  }
}

void sub_100008AA0(uint64_t a1)
{
  uint64_t v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 cloudSyncEnabled];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 8) != v3)
  {
    *(unsigned char *)(v4 + 8) = v3;
    id v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
        CFStringRef v6 = @"enabled";
      }
      else {
        CFStringRef v6 = @"disabled";
      }
      int v8 = 136315394;
      int v9 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]_block_invoke";
      __int16 v10 = 2112;
      CFStringRef v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Cloud synch is now %@", (uint8_t *)&v8, 0x16u);
    }
    BOOL v7 = *(unsigned char **)(a1 + 32);
    if (v7[8])
    {
      [v7 _initializeZone];
      [*(id *)(a1 + 32) _setupAccountState];
    }
    else
    {
      [v7 _cleanUpRecordZonesAndSubscriptions];
    }
  }
}

id sub_100008CD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAccount];
}

void *sub_10000933C(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = (void *)a1[3];
    if (!v2)
    {
      id v3 = objc_alloc((Class)APSConnection);
      id v4 = [v3 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.siriknowledged.aps" queue:v1[4]];
      id v5 = (void *)v1[3];
      v1[3] = v4;

      [(id)v1[3] setDelegate:v1];
      uint64_t v2 = (void *)v1[3];
      if (!v2)
      {
        CFStringRef v6 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315138;
          int v9 = "-[CKNCloudKitManager pushConnection]";
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to create push connection", (uint8_t *)&v8, 0xCu);
          uint64_t v2 = (void *)v1[3];
        }
        else
        {
          uint64_t v2 = 0;
        }
      }
    }
    a1 = v2;
  }

  return a1;
}

id sub_1000095A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disablePush];
}

id sub_10000961C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enablePush];
}

id sub_100009B40(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(CKNCloudKitDataStore);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  [*(id *)(a1 + 32) _initializeZone];
  id v5 = *(void **)(a1 + 32);

  return [v5 _setupAccount];
}

id sub_100009B98(uint64_t a1, void *a2)
{
  uint64_t v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    CFStringRef v6 = "_CKNCloudKitPreferenceDidChangeCallback";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CloudKit preferences changed handler called", (uint8_t *)&v5, 0xCu);
  }
  return [a2 _cloudSyncPreferenceDidChange];
}

uint64_t sub_100009D7C(uint64_t a1)
{
  qword_10001DEB8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000A028(uint64_t a1)
{
  if (a1)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", *(dispatch_queue_t *)(a1 + 8), &stru_100018A60);
    uint64_t v2 = *(NSObject **)(a1 + 8);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v2, &stru_100018AA8);
  }
}

void sub_10000A08C(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v3 = string;
    id v4 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[CKEventHandler setupNotifyHandlers]_block_invoke_2";
      __int16 v9 = 2080;
      __int16 v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Received XPC event from distnoted: %s", (uint8_t *)&v7, 0x16u);
    }
    int v5 = +[NSString stringWithUTF8String:v3];
    CFStringRef v6 = +[CKVDispatcher sharedInstance];
    [v6 handleDistributedNotificationEventWithName:v5 completion:0];
  }
}

void sub_10000A19C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    id v4 = string;
    int v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[CKEventHandler setupNotifyHandlers]_block_invoke";
      __int16 v13 = 2080;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received XPC event from notifyd: %s", buf, 0x16u);
    }
    CFStringRef v6 = +[NSString stringWithUTF8String:v4];
    if ([v6 isEqualToString:kAFPreferencesDidChangeDarwinNotification])
    {
      int v7 = +[CKSiriSettingsMonitor sharedInstance];
      [v7 siriSettingsDidChange];
    }
    int v8 = +[CKVDispatcher sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000A344;
    v9[3] = &unk_100018A88;
    __int16 v10 = v2;
    [v8 handleDarwinNotificationEventWithName:v6 completion:v9];
  }
}

void sub_10000A344(uint64_t a1)
{
  id v2 = +[SEMDispatcher sharedInstance];
  [v2 handleXPCEvent:*(void *)(a1 + 32)];
}

void start()
{
  if (_set_user_dir_suffix())
  {
    CKLogInit();
    uint64_t v1 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      BOOL v18 = "main";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s Starting up siriknowledged...", (uint8_t *)&v17, 0xCu);
    }
    +[NSXPCListener enableTransactions];
    id v2 = objc_alloc_init(CKServiceDelegate);
    uint64_t v3 = (void *)qword_10001DEC0;
    qword_10001DEC0 = (uint64_t)v2;

    id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.siriknowledged"];
    [v4 setDelegate:qword_10001DEC0];
    [v4 resume];
    int v5 = objc_alloc_init(CKEventHandler);
    CFStringRef v6 = (void *)qword_10001DEC8;
    qword_10001DEC8 = (uint64_t)v5;

    sub_10000A028(qword_10001DEC8);
    uint64_t v7 = +[CKVDispatcher sharedInstance];
    int v8 = (void *)qword_10001DED0;
    qword_10001DED0 = v7;

    [(id)qword_10001DED0 setupXPCListeners];
    [(id)qword_10001DED0 registerXPCActivities];
    uint64_t v9 = +[SEMDispatcher sharedInstance];
    __int16 v10 = (void *)qword_10001DED8;
    qword_10001DED8 = v9;

    [(id)qword_10001DED8 setupXPCListeners];
    [(id)qword_10001DED8 registerXPCActivities];
    CFStringRef v11 = +[CKNCloudKitManager sharedManager];
    [v11 enablePushNotifications];

    id v12 = objc_alloc_init((Class)UAFXPCService);
    __int16 v13 = (void *)qword_10001DEE0;
    qword_10001DEE0 = (uint64_t)v12;

    [(id)qword_10001DEE0 startAsync];
    UAFRegisterXPCActivities();
    dispatch_main();
  }
  uint64_t v14 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = v14;
    int v16 = *__error();
    int v17 = 136315394;
    BOOL v18 = "main";
    __int16 v19 = 1024;
    int v20 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s _set_user_dir_suffix failed with: %d", (uint8_t *)&v17, 0x12u);
  }
  exit(1);
}

void sub_10000A7A4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v9 = 0;
  id v4 = sub_10000A83C(v2, v3, &v9);
  id v5 = v9;
  if (!v5)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    id v8 = 0;
    [v4 dropLinksBetween:v6 and:v7 error:&v8];
    id v5 = v8;
  }
  (*(void (**)(void))(a1[8] + 16))();
}

id sub_10000A83C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_23;
  }
  uint64_t v6 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Looking for store with identifier %@", (uint8_t *)&v13, 0x16u);
  }
  if (![v5 length])
  {
    __int16 v10 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s identifier is invalid: %@", (uint8_t *)&v13, 0x16u);
      if (a3) {
        goto LABEL_10;
      }
    }
    else if (a3)
    {
LABEL_10:
      +[NSError errorWithDomain:@"com.apple.siriknowledged" code:101 userInfo:&off_1000194D8];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_23:
    id v8 = 0;
    goto LABEL_19;
  }
  id v7 = *(id *)(a1 + 24);
  objc_sync_enter(v7);
  id v8 = [*(id *)(a1 + 24) objectForKey:v5];
  if (v8)
  {
    id v9 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Found in cache", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)CKPersistentStoreHandler) initWithName:v5];
    if (v8)
    {
      CFStringRef v11 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315394;
        uint64_t v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Created new store with identifier %@ and updating cache", (uint8_t *)&v13, 0x16u);
      }
      [*(id *)(a1 + 24) setObject:v8 forKey:v5];
    }
    else if (a3)
    {
      +[NSError errorWithDomain:@"com.apple.siriknowledged" code:102 userInfo:&off_100019500];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  objc_sync_exit(v7);

LABEL_19:

  return v8;
}

void sub_10000AB30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000AC5C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v9 = 0;
  id v4 = sub_10000A83C(v2, v3, &v9);
  id v5 = v9;
  if (!v5)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    id v8 = 0;
    [v4 dropLinksWithLabel:v6 from:v7 error:&v8];
    id v5 = v8;
  }
  (*(void (**)(void))(a1[8] + 16))();
}

void sub_10000AE2C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v10 = 0;
  id v4 = sub_10000A83C(v2, v3, &v10);
  id v5 = v10;
  if (!v5)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    id v9 = 0;
    [v4 dropLinkWithLabel:v6 between:v7 and:v8 error:&v9];
    id v5 = v9;
  }
  (*(void (**)(void))(a1[9] + 16))();
}

void sub_10000B000(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v11 = 0;
  id v4 = sub_10000A83C(v2, v3, &v11);
  id v5 = v11;
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else if ([v4 decreaseWeightForLinkWithLabel:a1[6] between:a1[7] and:a1[8]] == (id)-1)
  {
    v12[0] = @"localizedDescription";
    v12[1] = @"subject";
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    v13[0] = @"Error decreasing link weight";
    v13[1] = v7;
    v12[2] = @"predicate";
    v12[3] = @"object";
    uint64_t v9 = a1[5];
    v13[2] = a1[6];
    v13[3] = v8;
    void v12[4] = @"storeIdentifier";
    v13[4] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.siriknowledged" code:102 userInfo:v10];
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(a1[9] + 16))();
}

void sub_10000B2A4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v11 = 0;
  id v4 = sub_10000A83C(v2, v3, &v11);
  id v5 = v11;
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else if ([v4 increaseWeightForLinkWithLabel:a1[6] between:a1[7] and:a1[8]] == (id)-1)
  {
    v12[0] = @"localizedDescription";
    v12[1] = @"subject";
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    v13[0] = @"Error increasing link weight";
    v13[1] = v7;
    v12[2] = @"predicate";
    v12[3] = @"object";
    uint64_t v9 = a1[5];
    v13[2] = a1[6];
    v13[3] = v8;
    void v12[4] = @"storeIdentifier";
    v13[4] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.siriknowledged" code:102 userInfo:v10];
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(a1[9] + 16))();
}

void sub_10000B550(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[5];
  id v11 = 0;
  id v4 = sub_10000A83C(v2, v3, &v11);
  id v5 = v11;
  if (!v5)
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    uint64_t v9 = a1[10];
    id v10 = 0;
    [v4 setWeightForLinkWithLabel:v6 between:v7 and:v8 toValue:v9 error:&v10];
    id v5 = v10;
  }
  (*(void (**)(void))(a1[9] + 16))();
}

void sub_10000B74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000B838;
    v8[3] = &unk_100018C50;
    id v9 = v6;
    id v10 = *(id *)(a1 + 48);
    [v7 removeValuesForKeys:a3 fromStoreWithIdentifier:v9 completionHandler:v8];
  }
}

void sub_10000B838(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315394;
    uint64_t v7 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Finished removing ALL values in synched store %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000B9E4(uint64_t *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 136315394;
    int v13 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing ALL values in store %@", buf, 0x16u);
  }
  id v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v11 = 0;
  uint64_t v5 = sub_10000A83C(v3, v4, &v11);
  id v6 = v11;
  if (!v6)
  {
    id v10 = 0;
    [v5 removeAllValuesAndReturnError:&v10];
    id v6 = v10;
  }
  uint64_t v7 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    int v13 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Finished removing ALL values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
  if (!v6) {
    sub_100001E54(&__NSArray0__struct, a1[4]);
  }
}

void sub_10000BD30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000BE44;
    v11[3] = &unk_100018C28;
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v6 removeValuesMatchingCondition:v7 fromStoreWithIdentifier:v8 completionHandler:v11];
  }
}

void sub_10000BE44(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000BF58;
    v6[3] = &unk_100018C00;
    id v10 = *(id *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    [v4 keysInStoreWithIdentifier:v5 completionHandler:v6];
    sub_100001E54(*(void **)(a1 + 48), *(void *)(a1 + 40));
  }
}

void sub_10000BF58(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v6 = [a1[4] mutableCopy];
    [v6 removeObjectsInArray:v5];
    id v7 = +[CKNCloudKitManager sharedManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C074;
    v8[3] = &unk_100018BD8;
    id v9 = a1[5];
    id v10 = a1[6];
    id v11 = a1[7];
    [v7 removeValuesForKeys:v6 completion:v8];
  }
}

void sub_10000C074(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = CKLogContextDaemon;
  if (v7 && os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    id v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_4";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Could not remove values for keys with error %@", (uint8_t *)&v15, 0x16u);
    id v10 = CKLogContextDaemon;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)a1[4];
    id v12 = v10;
    id v13 = [v11 description];
    uint64_t v14 = a1[5];
    int v15 = 136315650;
    id v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Finished removing values matching condition %@ in synched store %@", (uint8_t *)&v15, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000C2F8(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (void *)a1[4];
    id v10 = v2;
    id v11 = [v9 description];
    *(_DWORD *)buf = 136315394;
    id v18 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Removing values matching condition %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v16 = 0;
  id v5 = sub_10000A83C(v3, v4, &v16);
  id v6 = v16;
  if (!v6)
  {
    uint64_t v7 = a1[4];
    id v15 = 0;
    [v5 removeValuesMatching:v7 error:&v15];
    id v6 = v15;
  }
  id v8 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (void *)a1[4];
    id v13 = v8;
    uint64_t v14 = [v12 description];
    *(_DWORD *)buf = 136315394;
    id v18 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Finished removing values matching condition %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v6) {
    sub_100001E54(&__NSArray0__struct, a1[6]);
  }
}

void sub_10000C674(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = +[CKNCloudKitManager sharedManager];
    [v4 removeValuesForKeys:a1[4] completion:0];
  }
  id v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 136315650;
    id v9 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Finished removing values for keys %@ in synched store %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000C870(uint64_t *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing values for keys %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v12 = 0;
  id v5 = sub_10000A83C(v3, v4, &v12);
  id v6 = v12;
  if (!v6)
  {
    uint64_t v7 = a1[4];
    id v11 = 0;
    [v5 removeValuesForKeys:v7 error:&v11];
    id v6 = v11;
  }
  int v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Finished removing values for keys %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v6) {
    sub_100001E54((void *)a1[4], a1[6]);
  }
}

void sub_10000CBA0(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = +[CKNCloudKitManager sharedManager];
    uint64_t v15 = a1[4];
    id v5 = +[NSArray arrayWithObjects:&v15 count:1];
    [v4 removeValuesForKeys:v5 completion:0];
  }
  id v6 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 136315650;
    uint64_t v10 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Finished removing value for key %@ in synched store %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000CDC8(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing value for key %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v13 = 0;
  id v5 = sub_10000A83C(v3, v4, &v13);
  id v6 = v13;
  if (!v6)
  {
    uint64_t v7 = a1[4];
    id v12 = 0;
    [v5 removeValueForKey:v7 error:&v12];
    id v6 = v12;
  }
  uint64_t v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Finished removing value for key %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v6)
  {
    uint64_t v14 = a1[4];
    int v9 = +[NSArray arrayWithObjects:&v14 count:1];
    sub_100001E54(v9, a1[6]);
  }
}

void sub_10000D224(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Could not retrieve value for key %@. %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
    }
    else
    {
      int v9 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        __int16 v17 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s value for key %@ in store %@ is not a CKHistoricEvent", buf, 0x20u);
      }
      id v8 = 0;
    }
    id v10 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*(void *)(a1 + 48) endDate:*(void *)(a1 + 56)];
    uint64_t v11 = +[CKPermanentEventStore createEventWithIdentifier:*(void *)(a1 + 32) dateInterval:v10 metadata:*(void *)(a1 + 64) fromEvent:v8];

    id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, *(void *)(a1 + 32), 0);
    [*(id *)(a1 + 72) saveKeysAndValues:v12 toStoreWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 80)];
  }
}

void sub_10000D600(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = +[CKNCloudKitManager sharedManager];
    [v4 saveRecordsWithDictionary:a1[4] completion:0];
  }
  id v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a1[5];
    int v7 = 136315394;
    id v8 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Finished setting all values for keys in synched store %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000D7F4(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)a1[4];
    uint64_t v16 = v2;
    __int16 v17 = [v15 allKeys];
    uint64_t v18 = a1[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v23 = 2112;
    __int16 v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Setting all values for keys=[%@] in store %@", buf, 0x20u);
  }
  id v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v21 = 0;
  id v5 = sub_10000A83C(v3, v4, &v21);
  id v6 = v21;
  if (!v6)
  {
    uint64_t v7 = a1[4];
    id v20 = 0;
    [v5 saveKeysAndValues:v7 error:&v20];
    id v6 = v20;
  }
  id v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (void *)a1[5];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v23 = 2112;
    __int16 v24 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Finished setting all values for keys in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v6)
  {
    __int16 v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    id v11 = v9;
    id v12 = [@"CKPersistentStorageKeysAndValuesUpdated." stringByAppendingString:v10];
    CFStringRef v27 = @"updated";
    *(void *)buf = v11;
    CFDictionaryRef v13 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v27 count:1];

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, v12, 0, v13, 1u);
  }
}

void sub_10000DB18(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)a1[4];
    id v12 = v2;
    CFDictionaryRef v13 = [v11 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Getting triplets matching condition %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v18 = 0;
  id v5 = sub_10000A83C(v3, v4, &v18);
  id v6 = v18;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v9 = a1[4];
    id v17 = 0;
    id v8 = [v5 tripleComponentsMatching:v9 error:&v17];
    id v7 = v17;
  }
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = (void *)a1[4];
    uint64_t v15 = v10;
    uint64_t v16 = [v14 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Finished getting triplets matching condition %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10000DDF0(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)a1[4];
    id v12 = v2;
    CFDictionaryRef v13 = [v11 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Getting all keys and values matching condition %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v18 = 0;
  id v5 = sub_10000A83C(v3, v4, &v18);
  id v6 = v18;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSDictionary0__struct;
  }
  else
  {
    uint64_t v9 = a1[4];
    id v17 = 0;
    id v8 = [v5 keysAndValuesForKeysMatching:v9 error:&v17];
    id v7 = v17;
  }
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = (void *)a1[4];
    uint64_t v15 = v10;
    uint64_t v16 = [v14 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys and values matching condition %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10000E0A8(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all keys and values in store %@", buf, 0x16u);
  }
  id v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v13 = 0;
  id v5 = sub_10000A83C(v3, v4, &v13);
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSDictionary0__struct;
  }
  else
  {
    id v12 = 0;
    id v8 = [v5 keysAndValuesAndReturnError:&v12];
    id v7 = v12;
  }
  uint64_t v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys and values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000E33C(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = (void *)a1[4];
    id v12 = v2;
    id v13 = [v11 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Getting values for keys matching condition %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v18 = 0;
  id v5 = sub_10000A83C(v3, v4, &v18);
  id v6 = v18;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v9 = a1[4];
    id v17 = 0;
    id v8 = [v5 valuesForKeysMatching:v9 error:&v17];
    id v7 = v17;
  }
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = (void *)a1[4];
    uint64_t v15 = v10;
    __int16 v16 = [v14 description];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    long long v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Finished getting values for keys matching condition %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t sub_10000E6B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E6C8(uint64_t a1)
{
}

void sub_10000E6D0(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting values for keys %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = sub_10000A83C(v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[8] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9)
  {
    uint64_t v10 = a1[4];
    id v17 = 0;
    uint64_t v11 = [v6 _valuesForKeys:v10 error:&v17];
    objc_storeStrong(v8, v17);
    uint64_t v12 = *(void *)(a1[9] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  uint64_t v14 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Finished getting values for keys %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10000E96C(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all values in store %@", buf, 0x16u);
  }
  id v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v13 = 0;
  uint64_t v5 = sub_10000A83C(v3, v4, &v13);
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSArray0__struct;
  }
  else
  {
    id v12 = 0;
    id v8 = [v5 valuesAndReturnError:&v12];
    id v7 = v12;
  }
  uint64_t v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished getting all values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000EC00(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting value for key %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v16 = 0;
  uint64_t v5 = sub_10000A83C(v3, v4, &v16);
  id v6 = v16;
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v17 = a1[4];
    id v8 = +[NSArray arrayWithObjects:&v17 count:1];
    id v15 = 0;
    uint64_t v9 = [v5 _valuesForKeys:v8 error:&v15];
    id v7 = v15;
    uint64_t v10 = [v9 firstObject];

    uint64_t v11 = +[NSNull null];
    LODWORD(v9) = [v10 isEqual:v11];

    if (!v9) {
      goto LABEL_8;
    }
  }
  uint64_t v10 = 0;
LABEL_8:
  id v12 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = a1[4];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Finished getting value for key %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10000EF08(void *a1)
{
  uint64_t v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = (void *)a1[4];
    id v12 = v2;
    uint64_t v13 = [v11 description];
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Getting all keys matching condition %@", buf, 0x16u);
  }
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v18 = 0;
  uint64_t v5 = sub_10000A83C(v3, v4, &v18);
  id v6 = v18;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v9 = a1[4];
    id v17 = 0;
    id v8 = [v5 keysMatching:v9 error:&v17];
    id v7 = v17;
  }
  uint64_t v10 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = (void *)a1[4];
    id v15 = v10;
    id v16 = [v14 description];
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys matching condition %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10000F1C0(void *a1)
{
  uint64_t v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all keys in store %@", buf, 0x16u);
  }
  id v4 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v13 = 0;
  uint64_t v5 = sub_10000A83C(v3, v4, &v13);
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    id v8 = &__NSArray0__struct;
  }
  else
  {
    id v12 = 0;
    id v8 = [v5 keysAndReturnError:&v12];
    id v7 = v12;
  }
  uint64_t v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000F4BC(id a1)
{
  qword_10001DEF0 = objc_alloc_init(CKDaemon);

  _objc_release_x1();
}

void sub_10000F62C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[CKGenericAppInteractionProcessor processInteraction:bundleId:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Could not update app interaction donation count %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

uint64_t AFIsHorseman()
{
  return _AFIsHorseman();
}

uint64_t AFPreferencesAssistantEnabled()
{
  return _AFPreferencesAssistantEnabled();
}

uint64_t AFSupportPreferencesSynchronize()
{
  return _AFSupportPreferencesSynchronize();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CKDatabaseScopeString()
{
  return _CKDatabaseScopeString();
}

uint64_t CKLogInit()
{
  return _CKLogInit();
}

uint64_t CKStringFromAccountStatus()
{
  return _CKStringFromAccountStatus();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t UAFRegisterXPCActivities()
{
  return _UAFRegisterXPCActivities();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_main(void)
{
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return _xpc_copy_entitlement_for_self();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_CKServiceXPCInterface(void *a1, const char *a2, ...)
{
  return [a1 CKServiceXPCInterface];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cancelRecordZoneSetupTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelRecordZoneSetupTimer];
}

id objc_msgSend__cancelSubscriptionSetupTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelSubscriptionSetupTimer];
}

id objc_msgSend__cleanUpRecordZoneSubscriptionsTimers(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpRecordZoneSubscriptionsTimers];
}

id objc_msgSend__cleanUpRecordZonesAndSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpRecordZonesAndSubscriptions];
}

id objc_msgSend__cloudSyncPreferenceDidChange(void *a1, const char *a2, ...)
{
  return [a1 _cloudSyncPreferenceDidChange];
}

id objc_msgSend__createCloudKitContainer(void *a1, const char *a2, ...)
{
  return [a1 _createCloudKitContainer];
}

id objc_msgSend__fetchChanges(void *a1, const char *a2, ...)
{
  return [a1 _fetchChanges];
}

id objc_msgSend__initializeZone(void *a1, const char *a2, ...)
{
  return [a1 _initializeZone];
}

id objc_msgSend__setupAccountState(void *a1, const char *a2, ...)
{
  return [a1 _setupAccountState];
}

id objc_msgSend__setupRecordZoneSubscription(void *a1, const char *a2, ...)
{
  return [a1 _setupRecordZoneSubscription];
}

id objc_msgSend__shouldSync(void *a1, const char *a2, ...)
{
  return [a1 _shouldSync];
}

id objc_msgSend_acceptedClasses(void *a1, const char *a2, ...)
{
  return [a1 acceptedClasses];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cloudSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncEnabled];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return [a1 databaseScope];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 dateInterval];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_enablePushNotifications(void *a1, const char *a2, ...)
{
  return [a1 enablePushNotifications];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return [a1 encryptedValuesByKey];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getApplicationIdentifierFromEntitlements(void *a1, const char *a2, ...)
{
  return [a1 getApplicationIdentifierFromEntitlements];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parametersByName(void *a1, const char *a2, ...)
{
  return [a1 parametersByName];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return [a1 recordChangeTag];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordZoneID(void *a1, const char *a2, ...)
{
  return [a1 recordZoneID];
}

id objc_msgSend_registerXPCActivities(void *a1, const char *a2, ...)
{
  return [a1 registerXPCActivities];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setupXPCListeners(void *a1, const char *a2, ...)
{
  return [a1 setupXPCListeners];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalytics];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_siriSettingsDidChange(void *a1, const char *a2, ...)
{
  return [a1 siriSettingsDidChange];
}

id objc_msgSend_startAsync(void *a1, const char *a2, ...)
{
  return [a1 startAsync];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return [a1 subscriptionID];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_userDefaultsKnowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 userDefaultsKnowledgeStore];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_verb(void *a1, const char *a2, ...)
{
  return [a1 verb];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}