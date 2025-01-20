void sub_100004C00(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void v4[6];
  void v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_100007E58;
  v5[4] = sub_100017224;
  v6 = 0;
  v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007FA8;
  v4[3] = &unk_100038F08;
  v4[4] = v2;
  v4[5] = v5;
  dispatch_sync(v3, v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v5, 8);
}

void sub_100004CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004D68(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "activeSessions", 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v6) accessToken];
        if ([v7 accessIntent] == (id)3)
        {
          v8 = *(void **)(a1 + 40);
          v9 = [v7 compositionAVURL];
          [v8 addObject:v9];
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_1000050D8(uint64_t a1)
{
  v2 = +[NSMutableSet set];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004D68;
  v9[3] = &unk_100038D20;
  v9[4] = v3;
  id v10 = v2;
  id v5 = v2;
  dispatch_sync(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v7, v8);
}

void sub_100005358(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = sub_100007E58;
  long long v13 = sub_100017224;
  id v14 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007F5C;
  v8[3] = &unk_100038F08;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v3, v8);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_composedAVURLsWithActiveSessionsOrScheduledWork");
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "performOrphanRecoveryAndCleanupWithExternallyInUseComposedAVURLs:andFinalizingCompositions:restoreFileFutures:", v4, v10[5], objc_msgSend(*(id *)(a1 + 32), "cloudKitIsEnabled"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  _Block_object_dispose(&v9, 8);
}

void sub_100005480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005498(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B798;
  block[3] = &unk_100039168;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100006218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_100006704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007038(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uuid];

  if (!v4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) context];
    [v7 deleteObject:v3];

    [*(id *)(a1 + 32) saveIfNecessary];
    goto LABEL_70;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v3 uuid];
  v45 = [v5 objectForKeyedSubscript:v6];

  if (v45)
  {
    [v45 addObject:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = +[NSMutableArray arrayWithObject:v3];
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = [v3 uuid];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [*(id *)(a1 + 32) _logMissingAudioFutureIfNeeded:v3];
  unsigned int v44 = [v3 localAssetIsCurrent];
  if (v44 && [v3 audioFutureNeedsDownload]) {
    [v3 setAudioFutureNeedsDownload:0];
  }
  uint64_t v11 = [v3 url];
  if (!v11)
  {
    v26 = [v3 syncedAudioFuture];

    if (v26) {
      [v3 setAudioFutureNeedsDownload:1];
    }
    goto LABEL_68;
  }
  [*(id *)(a1 + 48) addURL:v11];
  long long v12 = [v11 URLByDeletingLastPathComponent];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v13 = +[RCCaptureFormat fileExtensionsSupported];
  id v14 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v48;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(a1 + 48);
        v18 = [v12 URLByAppendingPathExtension:*(void *)(*((void *)&v47 + 1) + 8 * i)];
        [v17 addURL:v18];
      }
      id v14 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v14);
  }

  if (![v11 checkResourceIsReachableAndReturnError:0]
    || (*(void *)buf = 0,
        ([v11 getResourceValue:buf forKey:NSURLFileSizeKey error:0] & 1) == 0)
    || ![*(id *)buf unsignedLongLongValue])
  {
    v23 = +[RCComposition compositionBundleURLForComposedAVURL:v11];
    unsigned int v24 = [v23 checkResourceIsReachableAndReturnError:0];

    if (v24)
    {
      v25 = +[RCComposition compositionLoadedForComposedAVURL:v11 createIfNeeded:0];
      if (objc_msgSend(v25, "rcs_allAssetsAreMissing"))
      {
        [v25 deleteFromFilesystem];
      }
      else if (v25)
      {
        v27 = [v25 decomposedFragments];
        if ([v27 count])
        {
          unsigned int v28 = [v3 playable];

          if (v28)
          {
            [*(id *)(a1 + 56) addObject:v11];
            goto LABEL_66;
          }
        }
        else
        {
        }
      }
    }
    unsigned __int8 v29 = [*(id *)(a1 + 64) containsObject:v11];
    v30 = [v3 syncedAudioFuture];
    if (v30) {
      char v31 = v29;
    }
    else {
      char v31 = 1;
    }

    if ((v31 & 1) == 0 && ([v3 audioFutureNeedsDownload] & 1) == 0) {
      [v3 setAudioFutureNeedsDownload:1];
    }
    goto LABEL_67;
  }
  [v3 length];
  if (v19 <= 0.0 || ([v3 playable] & 1) == 0)
  {
    buf[0] = 0;
    if (!FigMovieUsesFragments() && buf[0]) {
      FigConsolidateMovieFragments();
    }
    v20 = +[AVURLAsset rc_preciseTimingAssetWithURL:v11];
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "rc_durationInSeconds");
      if (v22 > 0.0)
      {
        objc_msgSend(v3, "setLength:");
        [v3 setPlayable:1];
      }
    }
    else
    {
      v32 = OSLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [v11 path];
        sub_100022968(v33, v56, v32);
      }
    }
  }
  [v3 length];
  if (v34 > 0.00000011920929 && ([v3 playable] & 1) == 0) {
    [v3 setPlayable:1];
  }
  if ((v44 & 1) != 0 || !*(unsigned char *)(a1 + 80)) {
    goto LABEL_67;
  }
  v35 = [v3 syncedAudioFuture];
  v25 = v35;
  if (v35)
  {
    v36 = [v35 fileURL];
    v37 = v36;
    if (v36)
    {
      id v46 = 0;
      unsigned __int8 v38 = [v36 checkResourceIsReachableAndReturnError:&v46];
      id v39 = v46;
      v40 = v39;
      if (v38)
      {
LABEL_65:

        goto LABEL_66;
      }
      if (!v39)
      {
LABEL_64:
        [v3 setAudioFutureNeedsDownload:1];
        goto LABEL_65;
      }
      v41 = OSLogForCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = [v3 uuid];
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[RCSavedRecordingsModel(RCSOrphanHandling) performOrphanRecoveryAndCleanupWithExternallyIn"
                             "UseComposedAVURLs:andFinalizingCompositions:restoreFileFutures:]_block_invoke";
        __int16 v52 = 2112;
        v53 = v42;
        __int16 v54 = 2112;
        v55 = v40;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s -- Marking recording %@ audioFutureNeedsDownload because audioFuture.fileURL unreachable, reachableError = %@", buf, 0x20u);
      }
    }
    else
    {
      v41 = OSLogForCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v43 = [v3 uuid];
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[RCSavedRecordingsModel(RCSOrphanHandling) performOrphanRecoveryAndCleanupWithExternallyIn"
                             "UseComposedAVURLs:andFinalizingCompositions:restoreFileFutures:]_block_invoke";
        __int16 v52 = 2112;
        v53 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s -- Marking recording %@ audioFutureNeedsDownload because audioFuture.fileURL is nil.", buf, 0x16u);
      }
      v40 = 0;
    }

    goto LABEL_64;
  }
LABEL_66:

LABEL_67:
LABEL_68:

  if ([v3 hasChanges]) {
    [*(id *)(a1 + 32) saveIfNecessary];
  }
LABEL_70:
}

void sub_1000076AC(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x10000764CLL);
  }
  _Unwind_Resume(exc_buf);
}

int64_t sub_100007748(id a1, NSURL *a2, NSURL *a3)
{
  id v4 = a3;
  uint64_t v5 = [(NSURL *)a2 path];
  uint64_t v6 = [(NSURL *)v4 path];

  id v7 = [v5 length];
  if (v7 <= [v6 length])
  {
    id v9 = [v5 length];
    if (v9 >= [v6 length]) {
      int64_t v8 = (int64_t)[v5 compare:v6 options:64];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

void sub_100007DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007E08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007E78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id sub_100007E88(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100020D90;
  v3[3] = &unk_100039940;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t sub_100007F04(uint64_t a1)
{
  [*(id *)(a1 + 32) _onQueuePerformOrphanHandlingIfEnabled];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_100007F5C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  return _objc_release_x1();
}

uint64_t sub_100007FA8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  return _objc_release_x1();
}

void sub_100007FF4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) cloudKitIsEnabled];
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[22];
  if (v2)
  {
    if (v4) {
      return;
    }
    id v20 = 0;
    unsigned int v5 = [v3 _setupCloudMirroring:&v20];
    uint64_t v6 = v20;
    if (v5)
    {
      id v7 = *(id **)(a1 + 32);
      int64_t v8 = [v7[22] store];
      [v7 _registerForCloudKitContainerEventsForMirroringStore:v8];

      id v9 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001A3B4;
      v19[3] = &unk_1000394E0;
      v19[4] = v9;
      [v9 exportRecordingsToCloud:v19];
    }
    else
    {
      v18 = OSLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100024A88();
      }
    }
    goto LABEL_12;
  }
  if (v4)
  {
    id v10 = [v4 store];
    [v3 _unregisterForCloudKitContainerEventsForMirroringStore:v10];

    if (([*(id *)(a1 + 32) _shutdownCloudMirroring] & 1) == 0)
    {
      uint64_t v6 = OSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100024AFC(v6, v11, v12, v13, v14, v15, v16, v17);
      }
LABEL_12:
    }
  }
}

id sub_1000087E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[NSManagedObjectModel rc_newObjectModel];
  int64_t v8 = objc_opt_new();
  v12[0] = NSXPCStorePostUpdateNotificationsKey;
  v12[1] = NSPersistentHistoryTrackingKey;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v12[2] = NSPersistentStoreRemoteChangeNotificationOptionKey;
  v12[3] = NSXPCStoreDaemonizeKey;
  v13[2] = &__kCFBooleanTrue;
  v13[3] = &__kCFBooleanTrue;
  v12[4] = NSXPCStoreServiceNameKey;
  v13[4] = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  id v10 = [[RCXPCStoreServer alloc] initForStoreWithURL:v5 usingModel:v7 options:v9 policy:v8];

  [v10 setShouldAcceptDatabaseConnection:*(void *)(a1 + 32)];
  return v10;
}

void sub_100008B24(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 10000000000);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008BE0;
  v5[3] = &unk_100038958;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_after(v2, v4, v5);
}

id sub_100008BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pollBackupManager:*(void *)(a1 + 40)];
}

void sub_100008BEC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[MobileRestoreObserver _pollBackupManager:]_block_invoke_3";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s -- Mobile Restore has finished.", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v8 = a1 + 40;
  }
  else
  {
    if (v5)
    {
      id v9 = OSLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100022608();
      }
    }
    uint64_t v8 = a1 + 48;
  }
  (*(void (**)(void))(*(void *)v8 + 16))();
}

void sub_100008F78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 88), 8);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100008FA0(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = OSLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1000226FC(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _pollBackupManager:*(void *)(a1 + 32)];
  }
}

uint64_t sub_100009038(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000091D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000091F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000229D4();
    }

    [*(id *)(a1 + 32) mergeRecordings:v6];
  }
}

void sub_10000928C(uint64_t a1)
{
}

void sub_100009294(uint64_t a1)
{
  uint64_t v2 = +[AVURLAsset assetWithURL:*(void *)(a1 + 32)];
  uint64_t v3 = objc_msgSend(v2, "rc_recordingMetadata");
  uint64_t v4 = [v3 objectForKeyedSubscript:@"uniqueID"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) savedRecordingUUID];
  }
  uint64_t v7 = v6;

  objc_msgSend(v2, "rc_durationInSeconds");
  if (v8 == 0.0) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) composedDuration];
  }
  double v9 = v8;
  int v10 = [v3 objectForKeyedSubscript:@"date"];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) creationDate];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      sub_1000095FC(*(void **)(a1 + 32));
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v12 = v15;
  }
  uint64_t v16 = [v3 objectForKeyedSubscript:@"title"];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    double v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) title];
    id v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      RCLocalizedRecordingDateWithOptions();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v18 = v21;
  }
  double v22 = OSLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [*(id *)(a1 + 32) lastPathComponent];
    int v33 = 136315394;
    double v34 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfCompositionsWithInUseComposedAVU"
          "RLs:fileManager:URLsInSavedRecordingsDirectory:]_block_invoke";
    __int16 v35 = 2112;
    v36 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s -- Found orphaned AVURL (%@) with .composition, recover it by inserting it into the database.", (uint8_t *)&v33, 0x16u);
  }
  unsigned int v24 = *(void **)(a1 + 40);
  v25 = [*(id *)(a1 + 32) path];
  v26 = [v24 insertRecordingWithAudioFile:v25 duration:v12 date:v18 customTitleBase:v7 uniqueID:v9];

  if (v26)
  {
    v27 = OSLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      unsigned int v28 = [*(id *)(a1 + 32) lastPathComponent];
      unsigned __int8 v29 = [v26 title];
      int v33 = 136315650;
      double v34 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfCompositionsWithInUseComposedA"
            "VURLs:fileManager:URLsInSavedRecordingsDirectory:]_block_invoke";
      __int16 v35 = 2112;
      v36 = v28;
      __int16 v37 = 2112;
      unsigned __int8 v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s -- Orphaned composed AVURL: inserted '%@' into the database with title '%@'", (uint8_t *)&v33, 0x20u);
    }
    uint64_t v30 = +[RCComposition compositionLoadedForSavedRecording:v26];
    uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
}

id sub_1000095FC(void *a1)
{
  id v6 = 0;
  [a1 getResourceValue:&v6 forKey:NSURLCreationDateKey error:0];
  id v1 = v6;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSDate date];
  }
  uint64_t v4 = v3;

  return v4;
}

uint64_t sub_100009680(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 path];
  id v6 = [v4 _SHA256DataForPath:v5];

  uint64_t v7 = *(void **)(a1 + 40);
  double v8 = [v3 path];
  double v9 = [v7 attributesOfItemAtPath:v8 error:0];

  if (v9)
  {
    id v10 = [v9 fileSize];
    uint64_t v11 = 0;
    if (v6 && v10)
    {
      id v35 = v10;
      uint64_t v31 = v9;
      v32 = v3;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = [*(id *)(a1 + 48) URLs];
      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v13)
      {
        id v14 = v13;
        int v33 = v12;
        uint64_t v34 = *(void *)v37;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v37 != v34) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v18 = *(void **)(a1 + 40);
            double v19 = [v16 path];
            id v20 = [v18 attributesOfItemAtPath:v19 error:0];

            if (v20) {
              id v21 = [v20 fileSize];
            }
            else {
              id v21 = 0;
            }
            if (v35 == v21)
            {
              double v22 = [*(id *)(a1 + 56) objectForKeyedSubscript:v16];
              if (v22) {
                goto LABEL_28;
              }
              v23 = objc_opt_class();
              [v16 path];
              v25 = unsigned int v24 = v6;
              double v22 = [v23 _SHA256DataForPath:v25];

              id v6 = v24;
              id v12 = v33;
              if (v22)
              {
LABEL_28:
                [*(id *)(a1 + 56) setObject:v22 forKey:v16];
                if ([v22 isEqualToData:v6])
                {
                  v26 = OSLogForCategory();
                  id v3 = v32;
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    v27 = [v32 lastPathComponent];
                    [v16 lastPathComponent];
                    v29 = unsigned int v28 = v6;
                    *(_DWORD *)buf = 136315650;
                    v41 = "-[RCSavedRecordingsModel(RCSOrphanHandling) _performOrphanRecoveryAndCleanupOfBareAssetsWithIn"
                          "UseComposedAVURLs:fileManager:URLsInSavedRecordingsDirectory:]_block_invoke";
                    __int16 v42 = 2112;
                    v43 = v27;
                    __int16 v44 = 2112;
                    v45 = v29;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s -- orphanPath = %@ matches existing file = %@", buf, 0x20u);

                    id v6 = v28;
                    id v12 = v33;
                  }

                  uint64_t v11 = 0;
                  goto LABEL_24;
                }
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      id v3 = v32;
      [*(id *)(a1 + 48) addURL:v32];
      [*(id *)(a1 + 56) setObject:v32 forKey:v6];
      uint64_t v11 = 1;
LABEL_24:
      double v9 = v31;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_100009B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009B8C(uint64_t a1)
{
  [*(id *)(a1 + 32) composedDuration];
  double v3 = v2;
  if (v2 <= 2.22044605e-16)
  {
    id v14 = *(void **)(a1 + 32);
    [v14 deleteFromFilesystem];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) recordingWithUniqueID:*(void *)(a1 + 48)];
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) composedAVURL];
      id v6 = [v5 lastPathComponent];

      uint64_t v7 = [v4 fileName];
      unsigned __int8 v8 = [v7 isEqual:v6];

      if ((v8 & 1) == 0) {
        [v4 setFileName:v6];
      }
      [v4 length];
      if (v9 != v3)
      {
        double v10 = v9;
        uint64_t v11 = OSLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = +[NSNumber numberWithDouble:v10];
          id v13 = +[NSNumber numberWithDouble:v3];
          *(_DWORD *)buf = 136316162;
          int v33 = "-[RCSavedRecordingsModel(RCSOrphanHandling) updateRecordingForFinalizedCompositionAndMigrateIfNecessary:]_block_invoke";
          __int16 v34 = 2112;
          id v35 = v6;
          __int16 v36 = 2112;
          long long v37 = v12;
          __int16 v38 = 2112;
          long long v39 = v13;
          __int16 v40 = 2048;
          double v41 = v3 - v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s -- fileName = %@, savedRecording.length was %@, but should be %@ (delta = %.3f).  Fixing it up!", buf, 0x34u);
        }
        [v4 setLength:v3];
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
      }
      if ([*(id *)(a1 + 32) hasMultipleTracks]
        && ([v4 canUpdateWithMultiTrackAsset] & 1) == 0)
      {
        id v15 = *(void **)(a1 + 40);
        uint64_t v16 = [v4 creationDate];
        id v31 = 0;
        uint64_t v17 = [v15 duplicateRecording:v4 copyingResources:1 creationDate:v16 error:&v31];
        id v18 = v31;

        double v19 = [v4 title];
        [v17 setTitle:v19];

        id v20 = OSLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v4 uuid];
          double v22 = [v17 uuid];
          *(_DWORD *)buf = 136315650;
          int v33 = "-[RCSavedRecordingsModel(RCSOrphanHandling) updateRecordingForFinalizedCompositionAndMigrateIfNecessary:]_block_invoke";
          __int16 v34 = 2112;
          id v35 = v21;
          __int16 v36 = 2112;
          long long v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s -- Finalized composition has multitrack asset, migrating uniqueID %@ to multitrack with uniqueID %@", buf, 0x20u);
        }
        [*(id *)(a1 + 40) eraseRecording:v4];
        uint64_t v23 = [v17 uuid];
        uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
        v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;
      }
      else
      {
        [v4 setPlayable:1];
      }
      v26 = *(void **)(a1 + 40);
      id v30 = 0;
      unsigned __int8 v27 = [v26 saveIfNecessary:&v30];
      id v28 = v30;
      if ((v27 & 1) == 0)
      {
        unsigned __int8 v29 = OSLogForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100022ADC();
        }
      }
    }
  }
}

void sub_10000A08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A0A4(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (a3) {
    id v6 = [*(id *)(a1 + 32) updateRecordingForFinalizedCompositionAndMigrateIfNecessary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

void sub_10000A43C(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  double v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A528;
  v13[3] = &unk_100038B28;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t sub_10000A528(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t sub_10000A544(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

id sub_10000A910(id result, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t result = +[NSError errorWithDomain:@"VoiceMemosContainerErrorDomain" code:result userInfo:a2];
    *a3 = result;
  }
  return result;
}

id sub_10000AB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) metadata];
  id v5 = [v4 mutableCopy];

  [v5 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"com.apple.VoiceMemos.DatabaseProperties"];
  [*(id *)(a1 + 32) setMetadata:v5];
  id v6 = [*(id *)(a1 + 48) save:a2];

  return v6;
}

void sub_10000AC74(id a1)
{
  id v1 = [RCServiceContainer alloc];
  RCCloudRecordingsStoreURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v2 = [(RCServiceContainer *)v1 initWithURL:v4];
  double v3 = (void *)qword_100040508;
  qword_100040508 = (uint64_t)v2;
}

void sub_10000B634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000B668(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v6 = [a2 URL];
    [v4 setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t sub_10000B6E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) URL];
  unsigned int v8 = [v5 isEqual:v7];

  id v9 = v6;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 domain];
    if ([v11 isEqualToString:NSCocoaErrorDomain]) {
      BOOL v12 = [v10 code] == (id)134130;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  id v13 = +[NSFileManager defaultManager];
  id v14 = [v5 path];
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  return v8 & v12 & v15;
}

void sub_10000B800(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v10 = 0;
  unsigned int v6 = [v5 _manuallyMigrateCloudRecordingsDatabase:v4 error:&v10];
  id v7 = v10;
  unsigned int v8 = OSLogForCategory();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v12 = "-[RCServiceContainer loadStore:error:]_block_invoke_3";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- Successfully recovered from NSMigrationMissingSourceModelError with manual migration", buf, 0xCu);
    }

    [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v3];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100022DE0();
    }
  }
}

void sub_10000B944(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 path];
  unsigned int v8 = [*(id *)(a1 + 32) fileExistsAtPath:v7];
  id v9 = OSLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
  if (!v8)
  {
    if (v10) {
      sub_100023024(v7, (uint64_t)v6, v9);
    }
    goto LABEL_25;
  }
  if (v10) {
    sub_100022FB0();
  }

  if (sub_10000BCE0(v6))
  {
    if (!RCIsInternalInstall())
    {
      id v21 = *(void **)(a1 + 40);
      id v28 = 0;
      unsigned int v22 = [v21 destroyPersistentStoreAtURL:v5 withType:NSSQLiteStoreType options:0 error:&v28];
      id v9 = v28;
      if (v22)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v24 = OSLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_100022F3C();
      }
LABEL_24:

      goto LABEL_25;
    }
    id v9 = +[NSUUID UUID];
    id v11 = [v7 stringByDeletingPathExtension];
    BOOL v12 = [v9 UUIDString];
    uint64_t v13 = +[NSString stringWithFormat:@"%@-%@.db", v11, v12];

    unsigned __int8 v27 = v13;
    id v14 = +[NSURL fileURLWithPath:v13];
    unsigned int v15 = *(void **)(a1 + 40);
    id v30 = 0;
    LODWORD(v13) = [v15 replacePersistentStoreAtURL:v14 destinationOptions:0 withPersistentStoreFromURL:v5 sourceOptions:0 storeType:NSSQLiteStoreType error:&v30];
    id v26 = v30;
    id v16 = OSLogForCategory();
    char v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v18 = [v14 path];
        *(_DWORD *)buf = 136315394;
        v32 = "-[RCServiceContainer loadStore:error:]_block_invoke";
        __int16 v33 = 2112;
        __int16 v34 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s -- Please file a radar. Moved corrupt database to path '%@'", buf, 0x16u);
      }
      double v19 = *(void **)(a1 + 40);
      id v29 = 0;
      unsigned int v20 = [v19 destroyPersistentStoreAtURL:v5 withType:NSSQLiteStoreType options:0 error:&v29];
      char v17 = v29;
      if (v20)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      else
      {
        v25 = OSLogForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          sub_100022E54();
        }
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      uint64_t v23 = v26;
      sub_100022EC8();
      uint64_t v24 = v27;
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v23 = v26;
    uint64_t v24 = v27;
    goto LABEL_23;
  }
LABEL_26:
}

uint64_t sub_10000BCE0(void *a1)
{
  id v1 = a1;
  id v2 = [v1 code];
  id v3 = [v1 domain];
  id v4 = [v1 userInfo];
  if ([v3 isEqualToString:NSCocoaErrorDomain])
  {
    if (v2 == (id)259)
    {
      uint64_t v10 = 1;
      goto LABEL_32;
    }
    if (v2 != (id)134110)
    {
LABEL_31:
      uint64_t v10 = 0;
      goto LABEL_32;
    }
    id v5 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v5)
    {
      id v6 = [v5 userInfo];

      id v7 = [v6 objectForKeyedSubscript:@"NSSQLiteErrorDomain"];
      int v8 = [v7 integerValue];
      uint64_t v10 = v8 == 11 || v8 == 26;

      id v4 = v6;
      id v1 = v5;
      goto LABEL_32;
    }
LABEL_30:
    id v1 = 0;
    goto LABEL_31;
  }
  if (![v3 isEqualToString:NSSQLiteErrorDomain])
  {
    BOOL v12 = [v4 objectForKeyedSubscript:@"NSSQLiteErrorDomain"];
    uint64_t v13 = v12;
    if (v12)
    {
      int v14 = [v12 integerValue];
      uint64_t v10 = v14 == 11 || v14 == 26;
    }
    else
    {
      uint64_t v16 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (!v16) {
        goto LABEL_30;
      }
      uint64_t v10 = sub_10000BCE0(v16);
      id v1 = (id)v16;
    }

    goto LABEL_32;
  }
  uint64_t v10 = v2 == 11 || v2 == 26;
LABEL_32:

  return v10;
}

void sub_10000BEA0(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v6 = [a2 URL];
    [v4 setObject:v5 forKeyedSubscript:v6];
  }
}

id sub_10000BF1C(uint64_t a1, void *a2)
{
  id v3 = [a2 URL];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_10000C704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C724(uint64_t a1)
{
}

void sub_10000C72C(uint64_t a1, int a2, id obj)
{
}

id sub_10000CAF4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:&__kCFBooleanTrue forKeyedSubscript:@"MigratedMetadataToCloudStore"];
  [*(id *)(a1 + 32) migrate:*(void *)(*(void *)(a1 + 40) + 8)];
  [*(id *)(a1 + 32) save];
  [*(id *)(*(void *)(a1 + 40) + 8) save];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _saveMigrationStep:v3 migrationFlag:@"MigratedMetadataToCloudStore"];
}

void sub_10000CB78(uint64_t a1)
{
  id v2 = +[RCSavedRecording fetchLegacyRecordingsForMigrationWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = OSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v52 = "-[RCServiceContainer _migrateLegacyStore:]_block_invoke_2";
    __int16 v53 = 2048;
    id v54 = [v2 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- original database contains %ld recordings", buf, 0x16u);
  }

  long long v39 = +[NSFileManager defaultManager];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v47;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v10 = [v8 uniqueID];

        if (!v10)
        {
          id v11 = +[NSUUID UUID];
          BOOL v12 = [v11 UUIDString];
          [v8 setUniqueID:v12];

          uint64_t v13 = [v8 url];
          int v14 = [v13 path];

          unsigned int v15 = OSLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v14 lastPathComponent];
            unsigned int v17 = [v39 fileExistsAtPath:v14];
            *(_DWORD *)buf = 136315650;
            CFStringRef v18 = @"NO";
            if (v17) {
              CFStringRef v18 = @"YES";
            }
            __int16 v52 = "-[RCServiceContainer _migrateLegacyStore:]_block_invoke";
            __int16 v53 = 2112;
            id v54 = v16;
            __int16 v55 = 2112;
            CFStringRef v56 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s -- migrating recording '%@', exists = %@", buf, 0x20u);
          }
          id v19 = objc_alloc((Class)RCCloudRecording);
          uint64_t v20 = *(void *)(a1 + 32);
          id v21 = [v8 date];
          id v22 = [v19 initWithContext:v20 andCreationDate:v21];

          uint64_t v23 = [v8 path];
          [v22 setFileName:v23];

          uint64_t v24 = [v8 uniqueID];
          [v22 setUuid:v24];

          [v8 duration];
          objc_msgSend(v22, "setLength:");
          v25 = [v8 customLabel];
          [v22 setTitle:v25];

          objc_msgSend(v22, "setAudioFutureNeedsDownload:", objc_msgSend(v8, "pendingRestore"));
          [v22 setPlayable:1];
          [*(id *)(a1 + 40) _saveMigrationStep:*(void *)(a1 + 32) migrationFlag:@"CloudRecordingsMigrated"];
          [*(id *)(a1 + 32) refreshObject:v22 mergeChanges:0];
          [*(id *)(a1 + 32) refreshObject:v8 mergeChanges:0];

          uint64_t v6 = v40;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CloudRecordingsMigrated"];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CloudRecordingsMarkedPlayableAndEvicted"];
  [*(id *)(*(void *)(a1 + 40) + 8) save];
  +[RCSavedRecording deleteOrphanedEntityRevisionsWithContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _saveMigrationStep:*(void *)(a1 + 32) migrationFlag:@"CloudRecordingsMigrated"];
  id v26 = [*(id *)(a1 + 40) _cloudRecordingsInContext:*(void *)(a1 + 32)];
  unsigned __int8 v27 = OSLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v26 count];
    *(_DWORD *)buf = 136315394;
    __int16 v52 = "-[RCServiceContainer _migrateLegacyStore:]_block_invoke";
    __int16 v53 = 2048;
    id v54 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s -- new database contains %ld recordings", buf, 0x16u);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v29 = v26;
  id v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v43;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v29);
        }
        __int16 v34 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        id v35 = OSLogForCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v52 = "-[RCServiceContainer _migrateLegacyStore:]_block_invoke";
          __int16 v53 = 2112;
          id v54 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s -- migrated cloudRecording = %@", buf, 0x16u);
        }

        __int16 v36 = *(void **)(a1 + 40);
        long long v37 = [v34 uuid];
        __int16 v38 = [v36 _legacyRecordingWithUniqueID:v37 context:*(void *)(a1 + 32)];

        [*(id *)(a1 + 40) _validateMigratedRecording:v34 legacyRecording:v38];
        [*(id *)(a1 + 32) refreshObject:v34 mergeChanges:0];
        [*(id *)(a1 + 32) refreshObject:v38 mergeChanges:0];
      }
      id v31 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v31);
  }
}

id sub_10000D4EC(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudRecordingsInContext:", *(void *)(a1 + 40), 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) setPlayable:1];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CloudRecordingsMarkedPlayableAndEvicted"];
  [*(id *)(*(void *)(a1 + 32) + 8) save];
  return [*(id *)(a1 + 32) _saveMigrationStep:*(void *)(a1 + 40) migrationFlag:@"CloudRecordingsMarkedPlayableAndEvicted"];
}

void sub_10000D628(uint64_t a1)
{
  +[NSFileManager defaultManager];
  v17 = uint64_t v16 = a1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = [*(id *)(a1 + 32) _cloudRecordingsInContext:*(void *)(a1 + 40)];
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v8 = [v7 fileName];
        long long v9 = v8;
        if (v8)
        {
          long long v10 = [v8 lastPathComponent];
          long long v11 = RCRecordingsDirectoryURL();
          BOOL v12 = [v11 URLByAppendingPathComponent:v10];

          uint64_t v13 = [v12 path];
          id v14 = [v17 fileExistsAtPath:v13 isDirectory:0];

          if (v14) {
            unsigned int v15 = v10;
          }
          else {
            unsigned int v15 = 0;
          }
          [v7 setFileName:v15];
          [v7 setPlayable:v14];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(v16 + 32) + 8) setObject:@"RCRecordingsRelativePath" forKeyedSubscript:@"RCRecordingsDirectory"];
  [*(id *)(*(void *)(v16 + 32) + 8) save];
  [*(id *)(v16 + 32) _saveMigrationStep:*(void *)(v16 + 40) migrationFlag:@"RCRecordingsDirectory"];
}

id sub_10000D81C(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudRecordingsInContext:", *(void *)(a1 + 40), 0);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) url];
        if (v7) {
          +[RCComposition migrateBackupExclusionFlag:v7];
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"BackupExclusionFlagMigrated"];
  return [*(id *)(*(void *)(a1 + 32) + 8) save];
}

id sub_10000D96C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudRecordingsInContext:", *(void *)(a1 + 40), 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) synchronizeRecordingMetadata];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CloudRecordingsHaveCompleteMetadata"];
  [*(id *)(*(void *)(a1 + 32) + 8) save];
  return [*(id *)(a1 + 32) _saveMigrationStep:*(void *)(a1 + 40) migrationFlag:@"CloudRecordingsHaveCompleteMetadata"];
}

id sub_10000DAA4(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudRecordingsInContext:", *(void *)(a1 + 40), 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) migrateLocalProperties];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"kRCCloudRecordingsLocalPropertiesUpdated"];
  [*(id *)(*(void *)(a1 + 32) + 8) save];
  return [*(id *)(a1 + 32) _saveMigrationStep:*(void *)(a1 + 40) migrationFlag:@"kRCCloudRecordingsLocalPropertiesUpdated"];
}

id sub_10000DCAC(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudRecordingsInContext:", *(void *)(a1 + 40), 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) migrateSyncedUUIDs];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CloudRecordingsSyncedUUIDMigrated"];
  [*(id *)(*(void *)(a1 + 32) + 8) save];
  return [*(id *)(a1 + 32) _saveMigrationStep:*(void *)(a1 + 40) migrationFlag:@"CloudRecordingsSyncedUUIDMigrated"];
}

id sub_10000DF58(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "allRecordings", 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) migrateCustomLabelIfNeeded];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) saveIfNecessary];
}

void sub_10000E210(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, id a15, long long a16)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    unsigned int v17 = OSLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      long long v18 = [v16 userInfo];
      LODWORD(buf) = 136315906;
      *(void *)((char *)&buf + 4) = "-[RCServiceContainer _saveMigrationStep:migrationFlag:]";
      WORD6(buf) = 2112;
      a14 = 2112;
      a15 = v16;
      LOWORD(a16) = 2112;
      *(void *)((char *)&a16 + 2) = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s -- ERROR: Save threw an exception - migration flag = %@, exception = %@ - userInfo = %@", (uint8_t *)&buf, 0x2Au);
    }
    exit(0);
  }
  _Unwind_Resume(a1);
}

void sub_10000E724(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_10000E918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E930(uint64_t a1)
{
}

intptr_t sub_10000E938(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

void sub_10000EB70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000ECD8;
    v11[3] = &unk_100038DC0;
    id v4 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v4 performSynchronizedStepWithDescription:@"update index (purge all)" block:v11];
  }
  uint64_t v5 = [v3 allRecordings];
  uint64_t v6 = objc_msgSend(v5, "na_map:", &stru_100038E00);

  if ([v6 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000ED88;
    v8[3] = &unk_100038E28;
    id v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v6;
    [v7 performSynchronizedStepWithDescription:@"update index (update all)" block:v8];
  }
}

void sub_10000ECD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000ED70;
  v6[3] = &unk_100038D98;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteAllSearchableItemsWithCompletionHandler:v6];
}

uint64_t sub_10000ED70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CSSearchableItem *__cdecl sub_10000ED80(id a1, RCCloudRecording *a2)
{
  return (CSSearchableItem *)RCSearchableItemForRecording();
}

void sub_10000ED88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EE2C;
  v7[3] = &unk_100038D98;
  id v8 = v3;
  id v6 = v3;
  [v5 indexSearchableItems:v4 completionHandler:v7];
}

uint64_t sub_10000EE2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EE3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) transactionError];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void sub_10000F0B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSSet setWithArray:*(void *)(a1 + 32)];
  id v5 = [v4 setByAddingObjectsFromArray:*(void *)(a1 + 40)];
  id v6 = [v5 allObjects];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F2CC;
  v18[3] = &unk_100038E78;
  id v7 = v3;
  id v19 = v7;
  id v8 = objc_msgSend(v6, "na_map:", v18);
  id v9 = objc_msgSend(*(id *)(a1 + 48), "na_map:", &stru_100038EB8);
  if ([v8 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000F2F4;
    v15[3] = &unk_100038E28;
    id v10 = *(void **)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = v8;
    [v10 performSynchronizedStepWithDescription:@"update index (update items)" block:v15];
  }
  if ([v9 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F3A8;
    v12[3] = &unk_100038E28;
    long long v11 = *(void **)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    id v14 = v9;
    [v11 performSynchronizedStepWithDescription:@"update index (delete items)" block:v12];
  }
}

id sub_10000F2CC(uint64_t a1, uint64_t a2)
{
  return +[SavedRecordingSearchIndexController _lookupSearchableItemForRecordingInModel:*(void *)(a1 + 32) recordingURI:a2];
}

NSString *__cdecl sub_10000F2E4(id a1, NSURL *a2)
{
  return (NSString *)+[RCCloudRecording searchableItemIdentifierForSavedRecordingURI:a2];
}

void sub_10000F2F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F398;
  v7[3] = &unk_100038D98;
  id v8 = v3;
  id v6 = v3;
  [v5 indexSearchableItems:v4 completionHandler:v7];
}

uint64_t sub_10000F398(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F3A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F44C;
  v7[3] = &unk_100038D98;
  id v8 = v3;
  id v6 = v3;
  [v5 deleteSearchableItemsWithIdentifiers:v4 completionHandler:v7];
}

uint64_t sub_10000F44C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F45C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) transactionError];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void sub_10000F748(uint64_t a1)
{
  id v2 = +[RCServiceContainer sharedContainer];
  id v3 = [v2 newBackgroundModel];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F988;
  v18[3] = &unk_100038958;
  id v4 = v3;
  id v19 = v4;
  id v20 = *(id *)(a1 + 40);
  [v4 performBlockAndWait:v18];
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FA08;
  block[3] = &unk_100038F08;
  block[4] = v5;
  void block[5] = &v14;
  dispatch_sync(v6, block);
  if (*((unsigned char *)v15 + 24))
  {
    id v7 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000FA1C;
    v12[3] = &unk_100038DC0;
    void v12[4] = v7;
    [v7 performSynchronizedStepWithDescription:@"update index (end batching)" isSkippedIfPreviousErrors:0 isIndexUpdatingStep:0 block:v12];
  }
  id v8 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FAF0;
  v10[3] = &unk_100038B78;
  id v9 = *(id *)(a1 + 48);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  dispatch_async(v8, v10);

  _Block_object_dispose(&v14, 8);
}

void sub_10000F970(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F988(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  id v3 = +[NSQueryGenerationToken currentQueryGenerationToken];
  [v2 setQueryGenerationFromToken:v3 error:0];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t sub_10000FA08(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 41);
  return result;
}

void sub_10000FA1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = +[NSData data];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FAE0;
  v7[3] = &unk_100038D98;
  id v8 = v3;
  id v6 = v3;
  [v4 endIndexBatchWithClientState:v5 completionHandler:v7];
}

uint64_t sub_10000FAE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FAF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
}

void *sub_10000FCF0(void *result)
{
  if (*((unsigned char *)result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = result[4];
    if (!*(unsigned char *)(v2 + 41))
    {
      if (*(unsigned char *)(v2 + 40))
      {
        uint64_t result = [*(id *)(v2 + 56) beginIndexBatch];
        *(unsigned char *)(v1[4] + 41) = 1;
      }
    }
  }
  return result;
}

void sub_10000FD40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FDEC;
  v7[3] = &unk_100038D20;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_sync(v5, v7);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void *sub_10000FDEC(void *result)
{
  if (result[4]) {
    return objc_msgSend(*(id *)(result[5] + 32), "addObject:");
  }
  return result;
}

void sub_1000103AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000103C4(uint64_t a1)
{
}

uint64_t sub_1000103CC(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  return _objc_release_x1();
}

id sub_1000104E4(void *a1)
{
  id result = [*(id *)(a1[4] + 24) setObject:a1[6] forKeyedSubscript:a1[5]];
  *(unsigned char *)(a1[4] + 32) = 1;
  return result;
}

void sub_100010594(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    id v3 = [*(id *)(v1 + 8) metadata];
    id v5 = [v3 mutableCopy];

    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
    [v5 setObject:v4 forKeyedSubscript:@"com.apple.VoiceMemos.DatabaseProperties"];

    [*(id *)(*(void *)(a1 + 32) + 8) setMetadata:v5];
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

void sub_10001079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000107B4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return _objc_release_x1();
}

void sub_100010800(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000108A4;
  v3[3] = &unk_100038FD8;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
}

id sub_1000108A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setObject:a3 forKeyedSubscript:a2];
}

id sub_100010A64(id *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(a1[5], "recordingWithID:", v7, (void)v10);
        [v8 setAudioFutureNeedsExport:1];
        [a1[6] _validateCorrectStore:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [a1[5] saveIfNecessary];
  return [a1[6] _checkProgressOfExportingRecordings:a1[5]];
}

void sub_100010C54(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordingWithID:*(void *)(a1 + 40)];
  id v2 = [v3 syncedAudioFuture];

  if (v2)
  {
    [v3 setAudioFutureNeedsExport:1];
    [*(id *)(a1 + 48) _validateCorrectStore:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) saveIfNecessary];
  }
}

void sub_10001103C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectIDsForRecordingsNeedingAssetExport];
  if ([v2 count]) {
    [*(id *)(a1 + 40) _fetchProgressAndUpdateIfNeeded:v2 mirroringModel:*(void *)(a1 + 32)];
  }
}

void sub_100011138(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) _processExportProgressResult:v5 mirroringModel:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100023380();
    }
  }
}

void sub_1000112A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectIDToLastExportedToken];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011348;
  v4[3] = &unk_100039028;
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

id sub_100011348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _checkProgressAndUpdateIfNeeded:a2 latestToken:a3 model:*(void *)(a1 + 40)];
}

void sub_100011BA4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    long long v13 = OSLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s -- ERROR: fetchError = %@", buf, 0x16u);
    }
  }
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    id v14 = [*(id *)(a1 + 32) _newBackgroundMirroringModel];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100011D60;
    v18[3] = &unk_100039050;
    id v19 = v10;
    id v20 = v14;
    id v15 = v11;
    uint64_t v16 = *(void *)(a1 + 32);
    id v21 = v15;
    uint64_t v22 = v16;
    id v17 = v14;
    [v17 performBlockAndWait:v18];
  }
}

id sub_100011D60(id *a1)
{
  uint64_t v1 = a1;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v46;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v46 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = [v1[5] recordingWithID:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        id v44 = 0;
        unsigned __int8 v7 = [v6 synchronizeWithExistingAudioFuture:&v44];
        id v8 = v44;
        if ((v7 & 1) == 0)
        {
          id v9 = OSLogForCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = [v6 uuid];
            *(_DWORD *)buf = 136315650;
            long long v50 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]_block_invoke";
            __int16 v51 = 2112;
            __int16 v52 = v10;
            __int16 v53 = 2112;
            id v54 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- synchronizeWithExistingAudioFuture failed - recordingID = %@, error = %@", buf, 0x20u);
          }
        }
        id v11 = [v6 url];
        id v12 = v11;
        if (v11 && [v11 checkResourceIsReachableAndReturnError:0])
        {
          long long v13 = OSLogForCategory();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          id v14 = [v6 uuid];
          *(_DWORD *)buf = 136315394;
          long long v50 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]_block_invoke";
          __int16 v51 = 2112;
          __int16 v52 = v14;
          id v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          id v17 = "%s -- fetched recording %@";
        }
        else
        {
          long long v13 = OSLogForCategory();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
            goto LABEL_17;
          }
          id v14 = [v6 uuid];
          *(_DWORD *)buf = 136315394;
          long long v50 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]_block_invoke";
          __int16 v51 = 2112;
          __int16 v52 = v14;
          id v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_INFO;
          id v17 = "%s -- failed to fetch recording %@";
        }
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v17, buf, 0x16u);

LABEL_17:
      }
      id v3 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v3);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v37 = [v1[6] allKeys];
  id v18 = [v37 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v41;
    uint64_t v22 = kVMLogCategoryService;
    *(void *)&long long v19 = 136315906;
    long long v35 = v19;
    do
    {
      uint64_t v23 = 0;
      id v36 = v20;
      do
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v37);
        }
        uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v23);
        __int16 v25 = objc_msgSend(v1[5], "recordingWithID:", v24, v35);
        id v26 = [v1[6] objectForKeyedSubscript:v24];
        id v27 = [v1[7] _shouldRetryFutureDownloadForError:v26];
        id v28 = OSLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v25 uuid];
          +[NSNumber numberWithBool:v27];
          id obja = v25;
          id v30 = v1;
          uint64_t v31 = v22;
          __int16 v33 = v32 = v21;
          *(_DWORD *)buf = v35;
          long long v50 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]_block_invoke";
          __int16 v51 = 2112;
          __int16 v52 = v29;
          __int16 v53 = 2112;
          id v54 = v26;
          __int16 v55 = 2112;
          CFStringRef v56 = v33;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s -- download of recording %@ failed - error = %@ - retrying = %@", buf, 0x2Au);

          uint64_t v21 = v32;
          uint64_t v22 = v31;
          uint64_t v1 = v30;
          __int16 v25 = obja;

          id v20 = v36;
        }

        if (v27) {
          [v1[7] importAudioFuture:v24 mirroringModel:v1[5]];
        }

        uint64_t v23 = (char *)v23 + 1;
      }
      while (v20 != v23);
      id v20 = [v37 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v20);
  }

  return [v1[5] saveIfNecessary];
}

void sub_100012370(void *a1)
{
  id v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    id v9 = [v2 lastObject];
    if (v9 && (unint64_t)[v9 count] <= 0x63)
    {
      [v9 addObject:a1[5]];
      id v3 = v9;
    }
    else
    {
      uint64_t v4 = +[NSMutableArray arrayWithObject:a1[5]];

      [*(id *)(a1[4] + 8) addObject:v4];
      id v3 = (void *)v4;
    }
  }
  else
  {
    id v5 = +[NSMutableArray arrayWithObject:a1[5]];
    uint64_t v6 = +[NSMutableArray arrayWithObject:v5];
    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_100012578(uint64_t a1)
{
}

void sub_100012580(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    [v5 removeObjectAtIndex:0];
  }
}

void sub_1000126C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000126D8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
  }
}

void sub_1000128D8(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "___popAudioFutureBatch");
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) _newBackgroundMirroringModel];
    uint64_t v6 = [*(id *)(a1 + 32) _audioFutureEntityToAttributesDict];
    uint64_t v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100012A5C;
      v11[3] = &unk_100039118;
      id v10 = *(void **)(a1 + 40);
      void v11[4] = *(void *)(a1 + 32);
      id v12 = v10;
      long long v13 = v3;
      [v5 fetchObjectsFromCloud:v4 entityToAttributesToFetch:v7 forStore:0 completionHandler:v11];
    }
  }
  else
  {
    id v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100023480(v9);
    }

    v3[2](v3);
  }
}

void sub_100012A5C(uint64_t a1, void *a2, void *a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012B48;
  v9[3] = &unk_1000390F0;
  id v10 = a2;
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v7 = v11;
  id v8 = v10;
  [v5 _performOnSchedulerQueue:v9];
}

void sub_100012B48(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 madeChanges]);
  }
  id v10 = v2;
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) error];
  }
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 updatedObjectIDs];
    id v9 = [v7 failedObjectIDsToError];
    (*(void (**)(uint64_t, id, void *, void *, void *))(v6 + 16))(v6, v10, v8, v9, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 48), "___fetchNextAudioFutureBatch:", *(void *)(a1 + 56));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100012ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012EF0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012F94;
  block[3] = &unk_100039168;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100012F94(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t start()
{
  v0 = OSLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    os_log_type_t v16 = "main";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s -- voicememod launched", (uint8_t *)&v15, 0xCu);
  }

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    id v14 = OSLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      os_log_type_t v16 = "main";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s -- _set_user_dir_suffix failed, exiting", (uint8_t *)&v15, 0xCu);
    }

    exit(0);
  }
  +[SavedRecordingService moveRecordingsDirectoryIfNeeded];
  uint64_t v1 = @"+removeDatabaseDirectories";
  dispatch_time_t v2 = RCRecordingsDirectoryURL();
  uint64_t v3 = [v2 URLByAppendingPathComponent:v1 isDirectory:0];

  id v4 = +[NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  id v5 = [(__CFString *)v1 rc_reversedString];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6) {
    +[SavedRecordingService removeDatabaseDirectories];
  }
  id v7 = OSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002370C(v7);
  }

  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002360C(v8);
  }

  id v10 = +[SavedRecordingService sharedInstance];
  [v10 start];

  id v11 = +[NSRunLoop currentRunLoop];
  [v11 run];

  uint64_t v12 = OSLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100023588(v12);
  }

  return 0;
}

void sub_1000134C0(id a1)
{
  qword_100040518 = [[SavedRecordingService alloc] _init];
  _objc_release_x1();
}

void sub_100013B3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 176)
    || ([*(id *)(v2 + 160) waitingForMobileRestoreToFinish] & 1) != 0)
  {
    id v3 = 0;
  }
  else
  {
    id v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[SavedRecordingService enableCloudRecordingsWithCompletionBlock:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Warning, enabling iCloud while automatic scheduling is unsupported. Proceed with caution.", buf, 0xCu);
    }

    unsigned int v6 = *(void **)(a1 + 32);
    id v9 = 0;
    unsigned __int8 v7 = [v6 _setupCloudMirroring:&v9];
    id v3 = v9;
    if ((v7 & 1) == 0)
    {
      id v8 = OSLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[SavedRecordingService enableCloudRecordingsWithCompletionBlock:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -- Voice Memos iCloud setup failed:  %@", buf, 0x16u);
      }
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100014004(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = OSLogForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100023804();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v5 madeChanges];
    id v10 = "NO";
    if (v9) {
      id v10 = "YES";
    }
    int v14 = 136315394;
    int v15 = "-[SavedRecordingService importRecordingsFromCloud:]_block_invoke";
    __int16 v16 = 2080;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -- CloudKit import succeeded, madeChanges = %s", (uint8_t *)&v14, 0x16u);
  }

  id v11 = [*(id *)(a1 + 32) _serviceErrorForInternalError:v6 code:402];
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 madeChanges]);
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v11);
}

void sub_100014324(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = OSLogForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100023878();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v5 madeChanges];
    id v10 = "NO";
    if (v9) {
      id v10 = "YES";
    }
    int v14 = 136315394;
    int v15 = "-[SavedRecordingService exportRecordingsToCloud:]_block_invoke";
    __int16 v16 = 2080;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -- CloudKit export succeeded, madeChanges = %s", (uint8_t *)&v14, 0x16u);
  }

  id v11 = [*(id *)(a1 + 32) _serviceErrorForInternalError:v6 code:401];
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 madeChanges]);
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v11);
}

void sub_100014644(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = [v5 _serviceErrorForInternalError:a3 code:403];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [v6 madeChanges];

  unsigned int v9 = +[NSNumber numberWithBool:v8];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v10);
}

void sub_1000148E0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014988;
  v4[3] = &unk_100039208;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _onServiceQueueOpenAccessSessionNamed:@"capture" compositionAVURL:v2 accessIntent:3 xpcConnection:v3 accessSessionHandler:v4];
}

void sub_100014988(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 accessToken];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_100014BF4(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    uint64_t v3 = RCSSavedRecordingServiceErrorDomain;
    uint64_t v4 = a1[5];
    NSErrorUserInfoKey v22 = NSURLErrorKey;
    uint64_t v23 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v6 = +[NSError errorWithDomain:v3 code:301 userInfo:v5];
LABEL_3:
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  id v8 = [RCSAssetWriter alloc];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  id v21 = 0;
  id v5 = [(RCSAssetWriter *)v8 initForWriting:v9 settings:v10 error:&v21];
  id v6 = v21;
  if (!v5) {
    goto LABEL_3;
  }
  if (a1[7])
  {
    id v11 = +[RCCaptureFormat AVAssetAuthoringMetadataWithRecordingMetadata:](RCCaptureFormat, "AVAssetAuthoringMetadataWithRecordingMetadata:");
    [v5 setMetadata:v11];
  }
  id v20 = v6;
  unsigned int v12 = [v5 startWritingAudioFile:&v20];
  id v13 = v20;

  if (v12)
  {
    uint64_t v7 = +[RCSSavedRecordingAccessToken tokenWithName:@"audioFile" accessIntent:3 compositionAVURL:a1[5]];
    v24[0] = RCSSavedRecordingAccessTokenUserInfoKey_FileFormat;
    int v14 = [v5 fileFormat];
    v25[0] = v14;
    v24[1] = RCSSavedRecordingAccessTokenUserInfoKey_ProcessingFormat;
    int v15 = [v5 processingFormat];
    uint64_t v16 = a1[6];
    id v17 = (void *)a1[7];
    v25[1] = v15;
    v25[2] = v16;
    v24[2] = RCSSavedRecordingAccessTokenUserInfoKey_Settings;
    v24[3] = RCSSavedRecordingAccessTokenUserInfoKey_Metadata;
    if (v17) {
      id v18 = v17;
    }
    else {
      id v18 = &__NSDictionary0__struct;
    }
    v25[3] = v18;
    long long v19 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    [v7 setUserInfo:v19];

    [v5 setAccessToken:v7];
    [v5 setXpcConnection:a1[8]];
    [*(id *)(a1[4] + 104) setObject:v5 forKeyedSubscript:a1[5]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v6 = v13;
LABEL_14:

  (*(void (**)(void))(a1[9] + 16))();
}

void sub_10001503C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "objectForKeyedSubscript:");
    id v3 = v2;
    if (v2)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      id v5 = [v2 accessToken];
      LODWORD(v4) = [v4 isEqual:v5];

      if (v4)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10001523C;
        v10[3] = &unk_100039230;
        v10[4] = *(void *)(a1 + 40);
        id v3 = v3;
        id v11 = v3;
        id v12 = *(id *)(a1 + 32);
        id v13 = *(id *)(a1 + 56);
        [v3 finishWritingAudioFile:v10];

        goto LABEL_11;
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  NSErrorUserInfoKey v14 = NSURLErrorKey;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = +[NSNull null];
  }
  int v15 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  uint64_t v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v8];

  if (!v6) {
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

LABEL_11:
}

void sub_10001523C(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000152F4;
  v5[3] = &unk_100039230;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v2 _performOnServiceQueue:v5];
}

void sub_1000152F4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessToken:0];
  [*(id *)(*(void *)(a1 + 40) + 104) removeObjectForKey:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) status] == (id)2)
  {
    uint64_t v2 = OSLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) frameCount];
      uint64_t v4 = [*(id *)(a1 + 48) path];
      int v9 = 136315650;
      uint64_t v10 = "-[SavedRecordingService closeAudioFile:completionBlock:]_block_invoke_3";
      __int16 v11 = 2048;
      id v12 = v3;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s -- Successfully wrote %lld frames to audio file %@", (uint8_t *)&v9, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) error];
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 48) path];
      id v8 = [*(id *)(a1 + 32) status];
      int v9 = 136315906;
      uint64_t v10 = "-[SavedRecordingService closeAudioFile:completionBlock:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s -- Failed to finish writing to audio file %@, status = %ld, error = %@", (uint8_t *)&v9, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001561C(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  id v3 = v2;
  if (!v2)
  {
    uint64_t v8 = a1[5];
    NSErrorUserInfoKey v10 = NSURLErrorKey;
    uint64_t v11 = v8;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v6 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v7];
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v4 = a1[6];
  id v9 = 0;
  unsigned __int8 v5 = [v2 writeFromBuffer:v4 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100023B68();
    }
    goto LABEL_6;
  }
LABEL_7:
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10001595C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015A04;
  v4[3] = &unk_100039208;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _onServiceQueueOpenAccessSessionNamed:@"preview" compositionAVURL:v2 accessIntent:1 xpcConnection:v3 accessSessionHandler:v4];
}

void sub_100015A04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 accessToken];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_100015C64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015D28;
  v8[3] = &unk_1000392D0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v10 = v5;
  void v8[4] = v6;
  id v9 = v7;
  [v2 _onServiceQueueOpenAccessSessionNamed:@"export" compositionAVURL:v3 accessIntent:2 xpcConnection:v4 accessSessionHandler:v8];
}

void sub_100015D28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015E34;
    v9[3] = &unk_1000392A8;
    void v9[4] = v7;
    id v12 = *(id *)(a1 + 48);
    id v10 = v5;
    id v11 = v6;
    [v7 _attemptFinalizationOfCompositionAVURL:v8 ignoredAccessSession:v10 completionBlock:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100015E34(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015EF4;
  v6[3] = &unk_100039280;
  char v11 = a2;
  id v10 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 _performOnServiceQueue:v6];
}

void sub_100015EF4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v4 = [*(id *)(a1 + 32) accessToken];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    [*(id *)(a1 + 40) _onQueueCloseAccessSession:*(void *)(a1 + 32) normalTermination:1 completionBlock:0];
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void sub_100016188(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016230;
  v4[3] = &unk_100039208;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _onServiceQueueOpenAccessSessionNamed:@"trimming" compositionAVURL:v2 accessIntent:3 xpcConnection:v3 accessSessionHandler:v4];
}

void sub_100016230(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 accessToken];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_100016B8C(uint64_t a1)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) activeSessions];
  id v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) closeSession:*(void *)(*((void *)&v19 + 1) + 8 * (void)v6)];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v4);
  }

  id v7 = *(void **)(*(void *)(a1 + 40) + 152);
  id v18 = 0;
  unsigned __int8 v8 = [v7 deleteSearchMetadata:&v18];
  id v9 = v18;
  if ((v8 & 1) == 0)
  {
    id v10 = v9;
    char v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[SavedRecordingService removeAllUserDataWithCompletion:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s -- ERROR:  deleteSearchMetadata failed:  %@", buf, 0x16u);
    }
  }
  +[SavedRecordingService setLocalChangeToken:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) _wipeCloudKitCaches];
  [*(id *)(a1 + 40) _stopMonitoringDemoMovieIfNeeded];
  uint64_t v12 = RCRecordingsDirectoryURL();
  uint64_t v13 = [(id)v12 URLByAppendingPathComponent:@"+removeDatabaseDirectories" isDirectory:0];

  objc_msgSend(@"+removeDatabaseDirectories", "rc_reversedString");
  id v17 = 0;
  LOBYTE(v12) = [(id)objc_claimAutoreleasedReturnValue() writeToURL:v13 atomically:1 encoding:4 error:&v17];
  id v14 = v17;
  if ((v12 & 1) == 0)
  {
    id v15 = v14;
    uint64_t v16 = OSLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[SavedRecordingService removeAllUserDataWithCompletion:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s -- sentinelError = %@", buf, 0x16u);
    }
  }
  exit(0);
}

void sub_100016F34(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) activeSessionWithAccessToken:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 32) _onQueueCloseAccessSession:v2 normalTermination:1 completionBlock:*(void *)(a1 + 48)];
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v3 = RCSSavedRecordingServiceErrorDomain;
    uint64_t v4 = *(void *)(a1 + 40);
    CFStringRef v7 = @"accessToken";
    uint64_t v8 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v6 = +[NSError errorWithDomain:v3 code:302 userInfo:v5];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_10001713C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDisabledOrphanCleanupForCompositionAVURL:*(void *)(a1 + 40) xpcConnection:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
}

id sub_100017214(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeDisabledOrphanCleanupForCompositionAVURL:*(void *)(a1 + 40) xpcConnection:*(void *)(a1 + 48)];
}

void sub_100017224(uint64_t a1)
{
}

void sub_10001722C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RCComposition compositionLoadedForComposedAVURL:*(void *)(a1 + 32) createIfNeeded:0];
  if (v3)
  {
    uint64_t v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      CFStringRef v7 = "-[SavedRecordingService _onQueuePerformOrphanHandlingIfEnabled]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- ERROR:  finalizing editing composition = %@, error = %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

id sub_100017330(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadAssets];
}

void sub_1000173D4(uint64_t a1)
{
  uint64_t v2 = +[NSMutableSet set];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017498;
  v9[3] = &unk_100038D20;
  void v9[4] = v3;
  id v10 = v2;
  id v5 = v2;
  dispatch_sync(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v7, v8);
}

void sub_100017498(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "activeSessions", 0);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) accessToken];
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_100017648(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 152);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000176D8;
  v2[3] = &unk_100038D98;
  id v3 = *(id *)(a1 + 40);
  [v1 reloadExistingSearchMetadataWithCompletionBlock:v2];
}

uint64_t sub_1000176D8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100017784(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 152);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100017814;
  v2[3] = &unk_100038D98;
  id v3 = *(id *)(a1 + 40);
  [v1 clearAndReloadSearchMetadataWithCompletionBlock:v2];
}

uint64_t sub_100017814(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100017938(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 152);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000179E0;
  v5[3] = &unk_100038D98;
  id v6 = *(id *)(a1 + 64);
  [v2 updateSearchMetadataWithRecordingURIsToInsert:v1 recordingURIsToUpdate:v3 recordingURIsToDelete:v4 completionBlock:v5];
}

uint64_t sub_1000179E0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100017CFC(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "changes", 0);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v6);
        [*(id *)(a1 + 40) _processImportChange:v7 model:*(void *)(a1 + 48)];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

BOOL sub_1000180BC(id a1, NSPropertyDescription *a2)
{
  uint64_t v2 = [(NSPropertyDescription *)a2 name];
  if ([v2 isEqualToString:RCCloudRecording_AudioFuture]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:RCCloudRecording_MtAudioFuture];
  }

  return v3;
}

BOOL sub_100018124(id a1, NSPropertyDescription *a2)
{
  uint64_t v2 = [(NSPropertyDescription *)a2 name];
  if ([v2 isEqualToString:RCCloudRecording_EncryptedTitle]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:RCCloudRecording_CustomLabel];
  }

  return v3;
}

BOOL sub_100018C84(id a1, NSPropertyDescription *a2)
{
  uint64_t v2 = [(NSPropertyDescription *)a2 name];
  if ([v2 isEqualToString:RCCloudRecording_AudioFuture]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:RCCloudRecording_MtAudioFuture];
  }

  return v3;
}

BOOL sub_100018CEC(id a1, NSPropertyDescription *a2)
{
  uint64_t v2 = [(NSPropertyDescription *)a2 name];
  if ([v2 isEqualToString:RCCloudRecording_LocalTitle]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:RCCloudRecording_EncryptedTitle];
  }

  return v3;
}

void sub_100019040(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  unsigned __int8 v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000191A4;
  v18[3] = &unk_100039428;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v19 = v5;
  uint64_t v20 = v6;
  id v21 = v7;
  id v8 = v2;
  id v22 = v8;
  uint64_t v9 = [v3 enumerateChangeHistorySinceToken:v4 forStore:0 usingBlock:v18];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 144);
  *(void *)(v10 + 144) = v9;

  if ([v8 count])
  {
    long long v12 = *(void **)(a1 + 32);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000192D8;
    v15[3] = &unk_100038D20;
    id v13 = v8;
    uint64_t v14 = *(void *)(a1 + 32);
    id v16 = v13;
    uint64_t v17 = v14;
    [v12 _performOnServiceQueue:v15];
  }
}

void sub_1000191A4(uint64_t a1, void *a2)
{
  id v11 = a2;
  unsigned __int8 v3 = [v11 author];
  uint64_t v4 = [v3 componentsSeparatedByString:@"."];

  id v5 = [v4 firstObject];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 176);
  unsigned int v8 = [v5 isEqualToString:@"NSCloudKitMirroringDelegate"];
  if (v6 == v7)
  {
    if (v8)
    {
      uint64_t v10 = [v4 lastObject];
      if ([v10 isEqualToString:@"import"])
      {
        [*(id *)(a1 + 40) _processImportTransaction:v11 model:*(void *)(a1 + 48)];
      }
      else if ([v10 isEqualToString:@"reset"])
      {
        [*(id *)(a1 + 40) _processResetTransaction:v11 model:*(void *)(a1 + 48)];
      }

      goto LABEL_11;
    }
LABEL_7:
    [*(id *)(a1 + 40) _processLocalTransaction:v11 model:*(void *)(a1 + 48)];
LABEL_11:
    id v9 = v11;
    goto LABEL_12;
  }
  id v9 = v11;
  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_12:
  [*(id *)(a1 + 40) _processSpotlightTransaction:v9 changes:*(void *)(a1 + 56)];
}

void sub_1000192D8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"inserts"];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"updates"];
  unsigned __int8 v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"deletes"];
  [*(id *)(*(void *)(a1 + 40) + 152) updateSearchMetadataWithRecordingURIsToInsert:v4 recordingURIsToUpdate:v2 recordingURIsToDelete:v3 completionBlock:0];
}

id sub_100019420(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRemoteChangeNotificationOnServiceQueue:*(void *)(a1 + 40)];
}

void sub_1000198B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000198D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconcileMigrationStates];
}

void sub_100019B34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 200) encryptedFieldsAccountStatus];
  unsigned int v5 = [v3 encryptedFieldsMigrationExists];
  if (v4 == (id)1 && (v5 & 1) == 0)
  {
    [*(id *)(a1 + 32) _createAccountStatusUpdatedMigration:v3];
LABEL_8:
    [*(id *)(a1 + 32) performLocalEncryptedTitleMigrationIfNeeded:v3];
    uint64_t v7 = 1;
    int v8 = 1;
    goto LABEL_10;
  }
  if (v4 == (id)1) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }
  if (v6 == 1) {
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  int v8 = 2;
LABEL_10:
  *(_DWORD *)(*(void *)(a1 + 32) + 212) = v8;
  id v9 = OSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"disabled";
    if (v7) {
      CFStringRef v10 = @"enabled";
    }
    int v11 = 136315394;
    long long v12 = "-[SavedRecordingService _updateMigrationStatusIfNeeded]_block_invoke";
    __int16 v13 = 2112;
    CFStringRef v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- Encrypted fields status is %@", (uint8_t *)&v11, 0x16u);
  }

  [*(id *)(a1 + 32) _notifyEncryptedFieldsMigrationStatusKnown:v7];
  [*(id *)(a1 + 32) _validateOnFirstImport:v3];
}

void sub_100019E4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) createEncryptedFieldsMigration:3];
  [*(id *)(a1 + 32) saveIfNecessary];
  id v3 = OSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unsigned int v5 = "-[SavedRecordingService _initiateImplicitEncryptedTitleMigration]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- Created encrypted fields migration %@", (uint8_t *)&v4, 0x16u);
  }
}

void sub_10001A3B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[SavedRecordingService _handleiCloudAvailabilityChanged]_block_invoke_2";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s -- CloudKit export finished, madeChanges = %@, error = %@", (uint8_t *)&v8, 0x20u);
  }

  [*(id *)(a1 + 32) importRecordingsFromCloud:&stru_1000394B8];
}

void sub_10001A4B4(id a1, NSNumber *a2, NSError *a3)
{
  int v4 = a2;
  id v5 = a3;
  id v6 = OSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[SavedRecordingService _handleiCloudAvailabilityChanged]_block_invoke";
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s -- CloudKit import finished, madeChanges = %@, error = %@", (uint8_t *)&v7, 0x20u);
  }
}

void sub_10001AD4C(uint64_t a1)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = a1;
  id obj = *(id *)(a1 + 32);
  id v1 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v20;
    do
    {
      int v4 = 0;
      do
      {
        if (*(void *)v20 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v4);
        id v18 = 0;
        if (objc_msgSend(v5, "getResourceValue:forKey:error:", &v18, NSURLContentModificationDateKey, 0, v15))
        {
          id v6 = v18;
          int v7 = [v5 lastPathComponent];
          int v8 = [v7 stringByDeletingPathExtension];

          __int16 v9 = *(void **)(v15 + 40);
          __int16 v10 = [v5 path];
          __int16 v11 = [v9 insertRecordingWithAudioFile:v10 duration:v6 date:v8 customTitleBase:0 uniqueID:-1.0];

          __int16 v12 = [v11 uuid];
          id v13 = +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:v6 title:v8 uniqueID:v12];

          CFStringRef v14 = [v11 url];
          uint64_t v17 = 0;
          +[AVAsset rc_updateMetadataInFile:v14 withMetadata:v13 error:&v17];
        }
        int v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      id v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v2);
  }
}

id sub_10001AF5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetupRequiringMobileRestoreCompletion];
}

id sub_10001B12C(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadExistingSearchMetadataWithCompletionBlock:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001B1B8;
  v3[3] = &unk_1000390C8;
  return [*(id *)(a1 + 32) _performOnServiceQueue:v3];
}

void sub_10001B1B8(uint64_t a1)
{
  [*(id *)(a1 + 32) _onQueuePerformOrphanHandlingIfEnabled];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_10001B4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B51C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

BOOL sub_10001B530(uint64_t a1, uint64_t a2)
{
  BOOL v3 = +[SavedRecordingService shouldAcceptXPCConnection:a2];
  if (v3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 208) = 1;
    [*(id *)(a1 + 32) _handleiCloudAvailabilityChanged];
  }
  return v3;
}

void sub_10001B580(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = objc_loadWeakRetained(a1 + 7);
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100024F1C();
  }

  if (v4 && WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v4 _handleXPCDisconnect:v6];
  }
  if ([a1[4] isEqualToString:RCVoiceMemosBundleID])
  {
    *((_DWORD *)a1[5] + 12) = 0;
    int v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100024EA4(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    if (+[SavedRecordingService reloadStockRecordings]) {
      [a1[5] removeAllUserDataWithCompletion:&stru_100039588];
    }
  }
}

void sub_10001B6A0(id a1, NSError *a2)
{
  uint64_t v2 = OSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100024F90(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10001B6F0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100025008();
  }

  if (v4 && WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v4 _handleXPCDisconnect:v6];
  }
}

void sub_10001B798(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10001B840(uint64_t a1)
{
  uint64_t v2 = +[RCServiceContainer sharedContainer];
  id v3 = [v2 newBackgroundModel];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B904;
  v6[3] = &unk_100038B78;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v5 performBlockAndWait:v6];
}

uint64_t sub_10001B904(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001BBD8(uint64_t a1, uint64_t a2)
{
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000250F0(a1, a2, v4);
  }

  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:302 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001BD48;
    v10[3] = &unk_100039600;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v15 = v9;
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [v7 _performOnServiceQueue:v10];
  }
}

id sub_10001BD48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onServiceQueueOpenAccessSessionNamed:*(void *)(a1 + 40) compositionAVURL:*(void *)(a1 + 48) accessIntent:*(void *)(a1 + 72) xpcConnection:*(void *)(a1 + 56) accessSessionHandler:*(void *)(a1 + 64)];
}

uint64_t sub_10001BD5C(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10001C280(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = OSLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[SavedRecordingService _onQueueCloseAccessSession:normalTermination:completionBlock:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s -- Finally closing access session: %@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 112) closeSession:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _onServiceQueueAttemptToRunningDeferredWorkAfterClosingSession:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) accessToken];
    id v7 = [v6 compositionAVURL];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001C448;
    v9[3] = &unk_100039678;
    id v8 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    [v5 _attemptFinalizationOfCompositionAVURL:v7 ignoredAccessSession:v10 completionBlock:v9];
  }
}

void sub_10001C448(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C4F0;
  v3[3] = &unk_1000392F8;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performOnServiceQueue:v3];
}

uint64_t sub_10001C4F0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 112) closeSession:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _onServiceQueueAttemptToRunningDeferredWorkAfterClosingSession:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10001C71C(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C7E0;
  v4[3] = &unk_1000396C8;
  void v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 _onServiceQueueOpenAccessSessionNamed:@"finalize" compositionAVURL:v5 accessIntent:2 xpcConnection:0 accessSessionHandler:v4];
}

void sub_10001C7E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(id **)(a1 + 32);
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001C8C4;
    v7[3] = &unk_100039678;
    void v7[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    [v5 _attemptFinalizationOfCompositionAVURL:v6 ignoredAccessSession:v8 completionBlock:v7];
  }
  else
  {
    [v5[9] addObject:*(void *)(a1 + 40)];
  }
}

void sub_10001C8C4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C96C;
  v3[3] = &unk_1000392F8;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performOnServiceQueue:v3];
}

id sub_10001C96C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueCloseAccessSession:*(void *)(a1 + 40) normalTermination:1 completionBlock:*(void *)(a1 + 48)];
}

void sub_10001CBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001CBD4(void *a1)
{
  id result = [*(id *)(a1[4] + 96) containsObject:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 96);
    return [v4 addObject:v3];
  }
  return result;
}

void sub_10001CC38(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7 && a3)
  {
    id v9 = +[RCServiceContainer sharedContainer];
    id v10 = [v9 newBackgroundModel];
    id v11 = [v10 updateRecordingForFinalizedCompositionAndMigrateIfNecessary:v7];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(NSObject **)(v12 + 8);
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10001CD6C;
  id v18 = &unk_100038D20;
  uint64_t v19 = v12;
  id v20 = *(id *)(a1 + 40);
  dispatch_sync(v13, &v15);
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v7 != 0);
  }
  notify_post((const char *)objc_msgSend(RCSavedRecordingServiceDidChangeCompositionAVURLsBeingExportedDistributedNotification, "UTF8String", v15, v16, v17, v18, v19));
}

id sub_10001CD6C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
}

void sub_10001D220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  if (a2)
  {
    _Block_object_dispose(&a29, 8);
    objc_begin_catch(exception_object);
    if (!v29) {
      JUMPOUT(0x10001D1CCLL);
    }
    JUMPOUT(0x10001D1BCLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001D2A8(uint64_t a1)
{
  uint64_t v13 = +[RCComposition uriRepresentationForLegacyComposedAVURL:*(void *)(a1 + 32)];
  if (v13)
  {
    uint64_t v2 = [*(id *)(a1 + 40) recordingWithURIRepresentation:v13];
    uint64_t v3 = [v2 uuid];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) lastPathComponent];
    id v8 = [v6 recordingWithFileName:v7];

    uint64_t v9 = [v8 uuid];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  return _objc_release_x1();
}

void sub_10001D3A0(id a1, RCCompositionFragment *a2, BOOL *a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(RCCompositionFragment *)v3 AVOutputURL];
    uint64_t v6 = [v5 path];
    int v7 = 136315394;
    id v8 = "-[SavedRecordingService _attemptOrphanedFragmentsCleanupForCompositionAVURL:ignoredAccessSession:completionBloc"
         "k:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s -- NOTE: cleaning (deleting) orphaned fragment '%@' no longer in use.", (uint8_t *)&v7, 0x16u);
  }
  [(RCCompositionFragment *)v3 deleteFromFilesystem];
}

id sub_10001D4A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10001D4AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10001D4B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10001DD08(uint64_t a1)
{
  [*(id *)(a1 + 32) composedDuration];
  if (v2 > 0.0)
  {
    double v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 40) recordingWithUniqueID:*(void *)(a1 + 48)];
    if (v4)
    {
      id v5 = v4;
      [v4 setLength:v3];
      [*(id *)(a1 + 40) saveIfNecessary];
      uint64_t v4 = v5;
    }
  }
}

void sub_10001DE2C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "rcs_setValid:", 0);
  double v2 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v3 = [*(id *)(*(void *)(a1 + 40) + 104) allValues];
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v26;
    *(void *)&long long v5 = 136315394;
    long long v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "xpcConnection", v19);
        id v11 = *(void **)(a1 + 32);

        if (v10 == v11)
        {
          uint64_t v12 = OSLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v9 url];
            *(_DWORD *)buf = v19;
            id v30 = "-[SavedRecordingService _handleXPCDisconnect:]_block_invoke";
            __int16 v31 = 2112;
            uint64_t v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s -- cleaning up still-open audio file: %@", buf, 0x16u);
          }
          uint64_t v14 = [v9 accessToken];
          dispatch_group_enter(v2);
          uint64_t v15 = *(void **)(a1 + 40);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10001E11C;
          v22[3] = &unk_1000397A8;
          v22[4] = v15;
          id v23 = v14;
          uint64_t v24 = v2;
          id v16 = v14;
          [v15 closeAudioFile:v16 completionBlock:v22];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(NSObject **)(v17 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E20C;
  block[3] = &unk_100038D20;
  block[4] = v17;
  id v21 = *(id *)(a1 + 32);
  dispatch_group_notify(v2, v18, block);
}

void sub_10001E11C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = OSLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[SavedRecordingService _handleXPCDisconnect:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s -- error = %@", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__cleanupInterruptedRecording:", *(void *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10001E20C(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 112) activeSessionsWithXPCConnection:*(void *)(a1 + 40)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v13;
    *(void *)&long long v4 = 136315650;
    long long v11 = v4;
    do
    {
      __int16 v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        __int16 v9 = OSLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = *(void *)(a1 + 40);
          *(_DWORD *)buf = v11;
          uint64_t v17 = "-[SavedRecordingService _handleXPCDisconnect:]_block_invoke";
          __int16 v18 = 2112;
          uint64_t v19 = v8;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s -- Terminating access session %@ for terminated connection: %@", buf, 0x20u);
        }

        [*(id *)(a1 + 32) _onQueueCloseAccessSession:v8 normalTermination:0 completionBlock:0];
        __int16 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "_removeDisabledOrphanCleanupAVURLsForConnection:", *(void *)(a1 + 40), v11);
}

void sub_10001E3B8(int8x16_t *a1)
{
  double v2 = objc_opt_new();
  uint64_t v3 = RCCloudRecording_Duration;
  v14[0] = RCCloudRecording_Duration;
  v14[1] = RCCloudRecording_Flags;
  v14[2] = RCCloudRecording_FileName;
  v14[3] = RCCloudRecording_UniqueID;
  long long v4 = +[NSArray arrayWithObjects:v14 count:4];
  id v5 = +[NSSortDescriptor sortDescriptorWithKey:v3 ascending:1];
  long long v13 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v13 count:1];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E578;
  v10[3] = &unk_1000397D0;
  int8x16_t v9 = a1[2];
  id v7 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  id v8 = v2;
  id v12 = v8;
  [v7 enumerateExistingRecordingsWithProperties:v4 sortDescriptors:v6 block:v10];
  if ([v8 count]) {
    [*(id *)(a1[2].i64[1] + 168) markRecordingsAsNeedingExportAndCheckProgress:v8 mirroringModel:a1[2].i64[0]];
  }
}

void sub_10001E578(void *a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 url];
  if ([v3 audioFutureNeedsDownload])
  {
    id v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v3 uuid];
      int v11 = 136315394;
      id v12 = "-[SavedRecordingService _downloadAssets]_block_invoke_2";
      __int16 v13 = 2112;
      long long v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Attempting to download a pending restore recording %@", (uint8_t *)&v11, 0x16u);
    }
    id v7 = *(void **)(a1[4] + 168);
    id v8 = [v3 objectID];
    [v7 importAudioFuture:v8 mirroringModel:a1[5]];
  }
  else if (v4 {
         && (+[RCCloudRecording isRecordingExported:v4] & 1) == 0)
  }
  {
    int8x16_t v9 = (void *)a1[6];
    uint64_t v10 = [v3 objectID];
    [v9 addObject:v10];
  }
}

void sub_10001EB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001EB48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleDebugSignal];
    id WeakRetained = v2;
  }
}

void sub_10001EB8C(id a1)
{
  uint64_t v1 = OSLogForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100025250(v1, v2, v3, v4, v5, v6, v7, v8);
  }

  xpc_transaction_exit_clean();
}

void sub_10001EBE0(uint64_t a1, void *a2, void *a3)
{
  dispatch_block_t handler = a3;
  int v5 = [a2 intValue];
  uint64_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v5, 0, *(dispatch_queue_t *)(a1 + 32));
  uint64_t v7 = v6;
  if (v6)
  {
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v7);
    [*(id *)(*(void *)(a1 + 40) + 128) addObject:v7];
    signal(v5, (void (__cdecl *)(int))1);
  }
}

id sub_10001EE00(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) dumpState];
}

void sub_10001F2B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_10001F2E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001F304(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001F320(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10001F348()
{
  return v0;
}

void sub_10001F37C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10001F39C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001F3B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10001F3D4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_10001F4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F4EC(uint64_t a1)
{
}

void sub_10001F4F4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [*(id *)(v1 + 32) allRecordings];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10001F860;
  v41[3] = &unk_100039888;
  id v4 = v2;
  id v42 = v4;
  [v3 enumerateObjectsUsingBlock:v41];

  uint64_t v32 = v1;
  int v5 = *(void **)(v1 + 32);
  id v40 = 0;
  LOBYTE(v1) = [v5 saveIfNecessary:&v40];
  id v6 = v40;
  uint64_t v7 = v6;
  if ((v1 & 1) != 0 || !v6)
  {
    uint64_t v10 = +[NSFileManager defaultManager];
    int v11 = RCStockRecordingsURL();
    NSURLResourceKey v44 = NSURLContentModificationDateKey;
    id v12 = +[NSArray arrayWithObjects:&v44 count:1];
    __int16 v13 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:v12 options:5 error:0];

    if (v13)
    {
      uint64_t v29 = v10;
      id v30 = v7;
      id v31 = v4;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v28 = v13;
      id obj = v13;
      id v14 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(obj);
            }
            __int16 v18 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v17);
            id v35 = 0;
            if (objc_msgSend(v18, "getResourceValue:forKey:error:", &v35, NSURLContentModificationDateKey, 0, v28, v29, v30, v31))
            {
              id v19 = v35;
              __int16 v20 = [v18 lastPathComponent];
              uint64_t v21 = [v20 stringByDeletingPathExtension];

              long long v22 = *(void **)(v32 + 32);
              id v23 = [v18 path];
              uint64_t v24 = [v22 insertRecordingWithAudioFile:v23 duration:v19 date:v21 customTitleBase:0 uniqueID:-1.0];

              long long v25 = [v24 uuid];
              long long v26 = +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:v19 title:v21 uniqueID:v25];

              long long v27 = [v24 url];
              uint64_t v34 = 0;
              +[AVAsset rc_updateMetadataInFile:v27 withMetadata:v26 error:&v34];
            }
            uint64_t v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
        }
        while (v15);
      }

      uint64_t v7 = v30;
      id v4 = v31;
      __int16 v13 = v28;
      uint64_t v10 = v29;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(v32 + 40) + 8);
    id v9 = v6;
    uint64_t v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
}

void sub_10001F860(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 url];
  +[RCComposition deleteFromFilesystem:v3];

  [*(id *)(a1 + 32) deleteObject:v4];
}

id sub_10001F8DC(unint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v2 = OSLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_1000253C0();
    }

    uint64_t v1 = (void **)&RCSSavedRecordingServiceEncryptedStatusUnknown;
  }
  else
  {
    uint64_t v1 = (void **)*(&off_1000398D0 + a1);
  }
  uint64_t v3 = *v1;
  return v3;
}

void sub_10001FC74(uint64_t a1, void *a2)
{
  unint64_t v3 = (unint64_t)[a2 walrusStatus];
  if (!RCIsInternalInstall())
  {
    int v5 = 0;
    goto LABEL_9;
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  int v5 = [v4 stringForKey:@"kForcedEncryptedFieldsAccountState"];

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = OSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "accountStatusForStatus";
    __int16 v15 = 2112;
    CFStringRef v16 = @"kForcedEncryptedFieldsAccountState";
    __int16 v17 = 2112;
    __int16 v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s -- %@ user default == %@", (uint8_t *)&v13, 0x20u);
  }

  if ([v5 isEqualToString:RCSSavedRecordingServiceEncryptedStatusUnknown])
  {
LABEL_13:
    unint64_t v3 = 0;
    goto LABEL_14;
  }
  if ([v5 isEqualToString:RCSSavedRecordingServiceEncryptedStatusEnabled])
  {
    unint64_t v3 = 1;
    goto LABEL_14;
  }
  if (([v5 isEqualToString:RCSSavedRecordingServiceEncryptedStatusDisabled] & 1) == 0)
  {
LABEL_9:
    if (v3 < 3) {
      goto LABEL_14;
    }
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100025440();
    }

    goto LABEL_13;
  }
  unint64_t v3 = 2;
LABEL_14:

  uint64_t v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_10001F8DC(v3);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v13 = 136315394;
    id v14 = "-[RCAccountStatusObserver _checkAccountStatus]_block_invoke";
    __int16 v15 = 2112;
    CFStringRef v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s -- account status is %@", (uint8_t *)&v13, 0x16u);
  }
  if (v3 != *(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      sub_10001F8DC(*(void *)(*(void *)(a1 + 32) + 16));
      int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v12 = sub_10001F8DC(v3);
      int v13 = 136315650;
      id v14 = "-[RCAccountStatusObserver _checkAccountStatus]_block_invoke";
      __int16 v15 = 2112;
      CFStringRef v16 = v11;
      __int16 v17 = 2112;
      __int16 v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- effective account status updated from %@ to %@", (uint8_t *)&v13, 0x20u);
    }
    *(void *)(*(void *)(a1 + 32) + 16) = v3;
    [*(id *)(a1 + 32) _notifyDelegate];
  }
}

void sub_100020398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000203E4(uint64_t a1)
{
}

void sub_1000203EC(uint64_t a1)
{
  uint64_t v2 = +[RCSSavedRecordingAccessToken tokenWithName:*(void *)(a1 + 32) accessIntent:*(void *)(a1 + 96) compositionAVURL:*(void *)(a1 + 40)];
  unint64_t v3 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKey:*(void *)(a1 + 40)];
  if ([v2 isExclusive] && objc_msgSend(v3, "count"))
  {
    uint64_t v4 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:301 userInfo:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    if (([v2 isExclusive] & 1) == 0)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v32;
        while (2)
        {
          int v11 = 0;
          do
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) accessToken];
            unsigned int v13 = [v12 isExclusive];

            if (v13)
            {
              uint64_t v23 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:301 userInfo:0];
              uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
              long long v25 = *(void **)(v24 + 40);
              *(void *)(v24 + 40) = v23;

              goto LABEL_19;
            }
            int v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    id v14 = [*(id *)(a1 + 40) path];
    __int16 v15 = +[NSString stringWithFormat:@"Opening access session for compositionAVURL: %@, connection: %@", v14, *(void *)(a1 + 56)];

    id v7 = v15;
    [v7 UTF8String];
    CFStringRef v16 = (void *)os_transaction_create();
    uint64_t v17 = [*(id *)(a1 + 48) _onQueueActiveSessions];
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    __int16 v20 = [[AssetAccessSession alloc] initWithAccessToken:v2 compositionAVURL:*(void *)(a1 + 40) xpcConnection:*(void *)(a1 + 56) xpcTransaction:v16];
    uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    if (v3)
    {
      [v3 addObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    }
    else
    {
      long long v26 = *(void **)(*(void *)(a1 + 48) + 24);
      long long v27 = +[NSMutableSet setWithObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      [v26 setObject:v27 forKey:*(void *)(a1 + 40)];
    }
    uint64_t v28 = [*(id *)(a1 + 48) _onQueueActiveSessions];
    uint64_t v29 = *(void *)(*(void *)(a1 + 88) + 8);
    id v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

LABEL_19:
  }
}

void sub_100020890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000208B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  unint64_t v3 = [*(id *)(a1 + 40) compositionAVURL];
  id v10 = [v2 objectForKey:v3];

  uint64_t v4 = [*(id *)(a1 + 32) _onQueueActiveSessions];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [v10 removeObject:*(void *)(a1 + 40)];
  uint64_t v7 = [*(id *)(a1 + 32) _onQueueActiveSessions];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t sub_100020A80(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _onQueueActiveSessionWithAccessToken:*(void *)(a1 + 40)];
  return _objc_release_x1();
}

uint64_t sub_100020BE0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _onQueueActiveSessionsWithWithCompositionAVURL:*(void *)(a1 + 40)];
  return _objc_release_x1();
}

uint64_t sub_100020D40(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _onQueueActiveSessionsWithXPCConnection:*(void *)(a1 + 40)];
  return _objc_release_x1();
}

void sub_100020D90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

id sub_1000210F4(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 xpcConnection];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_1000211E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void sub_100021288(uint64_t a1, uint64_t a2, void *a3)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      id v6 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_100021470(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_100021620(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000216A8;
  v2[3] = &unk_100039A08;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _onQueueEnumerateActiveSessionsWithBlock:v2];
}

void sub_1000216A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v11 = v3;
  id v5 = [v3 accessToken];
  id v6 = [v5 compositionAVURL];
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = +[NSMutableArray array];
    uint64_t v8 = *(void **)(a1 + 32);
    long long v9 = [v11 accessToken];
    long long v10 = [v9 compositionAVURL];
    [v8 setObject:v7 forKeyedSubscript:v10];
  }
  [v7 addObject:v11];
}

void sub_10002178C(id a1, NSURL *a2, NSArray *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __stderrp;
  id v8 = [(NSURL *)v5 description];
  fprintf(v7, "compositionAVURL = %s\n", (const char *)[v8 UTF8String]);

  long long v9 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v10 = v6;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v14) debugDescription];
        [v9 addObject:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  CFStringRef v16 = __stderrp;
  unsigned int v17 = [v9 count];
  uint64_t v18 = [v9 componentsJoinedByString:@"; "];
  id v19 = [v18 description];
  fprintf(v16, "\tActive Sessions (%d) = %s\n", v17, (const char *)[v19 UTF8String]);

  __int16 v20 = +[RCComposition compositionLoadedForComposedAVURL:v5 createIfNeeded:1];
  uint64_t v21 = __stderrp;
  id v22 = [v20 debugDescription];
  fprintf(v21, "\tComposition Metadata = %s\n\n\n", (const char *)[v22 UTF8String]);
}

void sub_100021E04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) _recordsContainIncompatibleDevice:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id *sub_1000224C0(id *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id *)objc_msgSend(result[4], "addObject:");
  }
  return result;
}

void sub_1000224D0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_3:
    v6();
    goto LABEL_6;
  }
  if (!v7)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  [*(id *)(a1 + 32) _fetchDeviceRecordsWithCursor:v7 results:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_6:
}

void sub_10002257C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[RCMirroringContainer initWithURL:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s -- Failed to set mirroring delegate for store %@", (uint8_t *)&v2, 0x16u);
}

void sub_100022608()
{
  v1[0] = 136315394;
  sub_1000091C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- fetchiCloudRestoreIsCompleteWithCompletion error = %@", (uint8_t *)v1, 0x16u);
}

void sub_100022688()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- registering for %@ notification", v2, v3, v4, v5, 2u);
}

void sub_1000226FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002278C(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "-[MobileRestoreObserver managerDidFinishRestore:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 state];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s -- finished restore state = %d", (uint8_t *)&v3, 0x12u);
}

void sub_10002282C()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- path = %@", v2, v3, v4, v5, 2u);
}

void sub_1000228A0(void *a1, NSObject *a2)
{
  unsigned int v4 = [a1 state];
  [a1 progress];
  int v6 = 136315650;
  id v7 = "-[MobileRestoreObserver managerDidUpdateBackgroundRestoreProgress:]";
  __int16 v8 = 1024;
  unsigned int v9 = v4;
  __int16 v10 = 2048;
  double v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s -- state = %d, progress = %g", (uint8_t *)&v6, 0x1Cu);
}

void sub_100022968(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[RCSavedRecordingsModel(RCSOrphanHandling) performOrphanRecoveryAndCleanupWithExternallyInUseC"
                         "omposedAVURLs:andFinalizingCompositions:restoreFileFutures:]_block_invoke";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s -- could not read audio file:  %@", buf, 0x16u);
}

void sub_1000229D4()
{
  v1[0] = 136315650;
  sub_10000A228();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s -- merging recordings with uniqueID = %@:  %@", (uint8_t *)v1, 0x20u);
}

void sub_100022A58(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[RCSavedRecordingsModel(RCSOrphanHandling) updateRecordingForFinalizedCompositionAndMigrateIfNecessary:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s -- No uuid for composition", (uint8_t *)&v1, 0xCu);
}

void sub_100022ADC()
{
  v1[0] = 136315650;
  sub_10000A228();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- failed to save recording with file name = %@, error = %@", (uint8_t *)v1, 0x20u);
}

void sub_100022B60(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AssetExportController finalizeAssetWithComposition:completionBlock:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s -- Performing asset finalization %@", (uint8_t *)&v2, 0x16u);
}

void sub_100022BEC()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- Failed to remove legacy store - Error = %@", v2, v3, v4, v5, 2u);
}

void sub_100022C60()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Unrecoverable database load errors = %@", v2, v3, v4, v5, 2u);
}

void sub_100022CD4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[RCServiceContainer loadStore:error:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: device has not been unlocked since boot", (uint8_t *)&v1, 0xCu);
}

void sub_100022D58()
{
  v2[0] = 136315650;
  sub_10000E740();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to create Recordings directory (%@): %@", (uint8_t *)v2, 0x20u);
}

void sub_100022DE0()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- Failed recovered from NSMigrationMissingSourceModelError with error %@", v2, v3, v4, v5, 2u);
}

void sub_100022E54()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Could not destroy corrupt database:  destroyError = %@", v2, v3, v4, v5, 2u);
}

void sub_100022EC8()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Could not move corrupt database aside:  replaceError = %@", v2, v3, v4, v5, 2u);
}

void sub_100022F3C()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Could destroy corrupt database:  destroyError = %@", v2, v3, v4, v5, 2u);
}

void sub_100022FB0()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Unable to open existing database, database may be corrupt? (error = %@)", v2, v3, v4, v5, 2u);
}

void sub_100023024(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 lastPathComponent];
  v6[0] = 136315650;
  sub_10000E740();
  uint64_t v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "%s -- ERROR: failed to load persistent store '%@', error = %@", (uint8_t *)v6, 0x20u);
}

void sub_1000230D4()
{
  v1[0] = 136315394;
  sub_1000091C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- Failed to remove legacy asset manifest - Error = %@", (uint8_t *)v1, 0x16u);
}

void sub_100023154()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- Failed to delete legacy store - Error = %@", v2, v3, v4, v5, 2u);
}

void sub_1000231C8()
{
  v1[0] = 136315394;
  sub_1000091C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to fetch cloud recordings (%@.)", (uint8_t *)v1, 0x16u);
}

void sub_100023248(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[RCServiceContainer performLocalEncryptedTitleMigrationIfNeeded]";
  __int16 v4 = 2112;
  CFStringRef v5 = @"CloudRecordingsCustomLabelsMigrated";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to save metadata flag %@, error = %@", (uint8_t *)&v2, 0x20u);
}

void sub_1000232E4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[RCServiceContainer unsetLocalEncryptedTitleMigrationFlag]";
  __int16 v4 = 2112;
  CFStringRef v5 = @"CloudRecordingsCustomLabelsMigrated";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to save metadata flag %@, error = %@", (uint8_t *)&v2, 0x20u);
}

void sub_100023380()
{
  v1[0] = 136315394;
  sub_1000091C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- ERROR: fetchError = %@", (uint8_t *)v1, 0x16u);
}

void sub_100023400()
{
  v1[0] = 136315394;
  sub_1000091C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s -- No recording found for ID: %@", (uint8_t *)v1, 0x16u);
}

void sub_100023480(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[RCAudioFutureSyncManager ___fetchAudioFuturesWithCompletionBlock:]_block_invoke";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s -- unexpected audioFuturesToFetch == nil", (uint8_t *)&v1, 0xCu);
}

void sub_100023504(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[RCAudioFutureSyncManager _validateCorrectStore:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s -- ERROR: Trying to download with wrong AudioFutureSyncManager!", (uint8_t *)&v1, 0xCu);
}

void sub_100023588(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "main";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s -- Exiting xpc service", (uint8_t *)&v1, 0xCu);
}

void sub_10002360C(NSObject *a1)
{
  int v2 = +[RCSSavedRecordingServiceConnection serviceInterface];
  uint64_t v3 = [v2 debugDescription];
  __int16 v4 = +[RCSSavedRecordingServiceConnection clientInterface];
  CFStringRef v5 = [v4 debugDescription];
  int v6 = 136315650;
  uint64_t v7 = "main";
  __int16 v8 = 2112;
  unsigned int v9 = v3;
  __int16 v10 = 2112;
  double v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "%s -- Vending service with interfaces...\n\n***server interface***\n%@\n***client interface***\n%@\n\n \n", (uint8_t *)&v6, 0x20u);
}

void sub_10002370C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "main";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s -- Starting xpc service", (uint8_t *)&v1, 0xCu);
}

void sub_100023790()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Received request to import '%@' ...", v2, v3, v4, v5, 2u);
}

void sub_100023804()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR:  CloudKit import failed:  %@", v2, v3, v4, v5, 2u);
}

void sub_100023878()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR:  CloudKit export failed:  %@", v2, v3, v4, v5, 2u);
}

void sub_1000238EC()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_1000239A8()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100023A64(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v2, v3, "%s -- Received request to prepare '%@' for capture...", v4, v5, v6, v7, 2u);
}

void sub_100023AF4()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Writing to audio file: %@", v2, v3, v4, v5, 2u);
}

void sub_100023B68()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR:  %@", v2, v3, v4, v5, 2u);
}

void sub_100023BDC()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100023C98()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100023D54(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v2, v3, "%s -- Received request to prepare '%@' for preview...", v4, v5, v6, v7, 2u);
}

void sub_100023DE4()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100023EA0()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100023F5C(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v2, v3, "%s -- Received request to prepare '%@' for export...", v4, v5, v6, v7, 2u);
}

void sub_100023FEC()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_1000240A8()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100024164(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v2, v3, "%s -- Received request to prepare '%@' for trimming...", v4, v5, v6, v7, 2u);
}

void sub_1000241F4()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- Couldn't read contents of legacy Recordings - error = %@", v2, v3, v4, v5, 2u);
}

void sub_100024268(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000242E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024358()
{
  sub_1000091C4();
  sub_10000E724((void *)&_mh_execute_header, v0, v1, "%s -- Unexpected - files moved from legacy location to destination location - urls = %@", v2, v3, v4, v5, 2u);
}

void sub_1000243CC(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10001F354();
  sub_10001F37C((void *)&_mh_execute_header, v2, v3, "%s -- legacyRecordings = { path: %@, reachable: %s }", v4, v5, v6, v7, v8);
}

void sub_100024478(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10001F354();
  sub_10001F37C((void *)&_mh_execute_header, v2, v3, "%s -- destinationRecordings = { path: %@, reachable: %s }", v4, v5, v6, v7, v8);
}

void sub_100024524()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR:  clean up of recordings directory failed:  %@", v2, v3, v4, v5, 2u);
}

void sub_100024598()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100024654()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Ending access session: %@.", v2, v3, v4, v5, 2u);
}

void sub_1000246C8()
{
  int v2 = 136315650;
  sub_10000E740();
  sub_10001F3D4((void *)&_mh_execute_header, v0, v1, "%s -- context = %@, error = %@", v2);
}

void sub_100024740(void *a1)
{
  os_log_t v1 = [a1 userInfo];
  int v2 = [v1 objectForKeyedSubscript:NSCloudKitMirroringDelegateResetSyncReasonKey];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v3, v4, "%s -- reason = %@", v5, v6, v7, v8, 2u);
}

void sub_1000247F4(void *a1)
{
  os_log_t v1 = [a1 userInfo];
  int v2 = [v1 objectForKeyedSubscript:NSCloudKitMirroringDelegateResetSyncReasonKey];
  sub_1000091C4();
  sub_10001F2E4((void *)&_mh_execute_header, v3, v4, "%s -- reason = %@", v5, v6, v7, v8, 2u);
}

void sub_1000248A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024920(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024998(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024A10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024A88()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR:  Voice Memos iCloud setup failed:  %@", v2, v3, v4, v5, 2u);
}

void sub_100024AFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024B74()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Created initial container = %@", v2, v3, v4, v5, 2u);
}

void sub_100024BE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024C60()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- handling XPC invocation, sending reply message with invocation: %@", v2, v3, v4, v5, 2u);
}

void sub_100024CD4()
{
  sub_10001F33C();
  uint64_t v1 = NSStringFromSelector((SEL)[v0 selector]);
  sub_10000E740();
  sub_10001F37C((void *)&_mh_execute_header, v2, v3, "%s -- handling XPC invocation, receiving message with selector: %@ (invocation: %@)", v4, v5, v6, v7, 2u);
}

void sub_100024D74(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "+[SavedRecordingService shouldAcceptXPCConnection:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 processIdentifier];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s -- new connection from pid = %d", (uint8_t *)&v3, 0x12u);
}

void sub_100024E14(int *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[SavedRecordingService listener:shouldAcceptNewConnection:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s -- Connection accepted. VoiceMemos PID: %i", (uint8_t *)&v3, 0x12u);
}

void sub_100024EA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024F1C()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Connection invalidated: %@", v2, v3, v4, v5, 2u);
}

void sub_100024F90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025008()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- Connection interrupted: %@", v2, v3, v4, v5, 2u);
}

void sub_10002507C()
{
  sub_1000091C4();
  sub_1000091D8((void *)&_mh_execute_header, v0, v1, "%s -- scheduling deferred access for '%@' request", v2, v3, v4, v5, 2u);
}

void sub_1000250F0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  CFStringRef v3 = @"will re-issue request";
  *(void *)&void v4[4] = "-[SavedRecordingService _onServiceQueueOpenAccessSessionNamed:compositionAVURL:accessIntent:xpcCon"
                      "nection:accessSessionHandler:]_block_invoke";
  *(_DWORD *)uint64_t v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if (a2) {
    CFStringRef v3 = @"was canceled!";
  }
  *(_WORD *)&v4[22] = 2112;
  *(void *)&v4[14] = *(void *)(a1 + 32);
  sub_10001F3D4((void *)&_mh_execute_header, a2, a3, "%s -- running deferred access block for '%@' request -- %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], v3);
}

void sub_100025194()
{
  sub_10001F33C();
  +[NSXPCConnection currentConnection];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)sub_10001F348();
  uint64_t v2 = NSStringFromSelector(v1);
  sub_10001F29C();
  sub_10001F2D4();
  sub_10001F2B4((void *)&_mh_execute_header, v3, v4, "%s -- ERROR: received invalid message on connection %@.  %@ parameter is required for invocations of -%@", v5, v6, v7, v8, 2u);
}

void sub_100025250(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000252C8()
{
  sub_1000091C4();
  sub_10001F320((void *)&_mh_execute_header, v0, v1, "%s -- ERROR: Unable to clean up ckAssetFiles - error: %@", v2, v3, v4, v5, 2u);
}

void sub_10002533C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000253C0()
{
  v1[0] = 136315394;
  sub_100020014();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s -- accountStatus is an unexpected case %li", (uint8_t *)v1, 0x16u);
}

void sub_100025440()
{
  v1[0] = 136315394;
  sub_100020014();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s -- Unknown encrypted fields account status %li", (uint8_t *)v1, 0x16u);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t FigConsolidateMovieFragments()
{
  return _FigConsolidateMovieFragments();
}

uint64_t FigMovieUsesFragments()
{
  return _FigMovieUsesFragments();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OSLogForCategory()
{
  return _OSLogForCategory();
}

uint64_t RCCloudRecordingsStoreURL()
{
  return _RCCloudRecordingsStoreURL();
}

uint64_t RCComputeFileDigest()
{
  return _RCComputeFileDigest();
}

uint64_t RCDeviceUnlockedSinceBoot()
{
  return _RCDeviceUnlockedSinceBoot();
}

uint64_t RCIsInternalInstall()
{
  return _RCIsInternalInstall();
}

uint64_t RCLegacyRecordingsDirectoryURL()
{
  return _RCLegacyRecordingsDirectoryURL();
}

uint64_t RCLibraryRecordingsDirectoryURL()
{
  return _RCLibraryRecordingsDirectoryURL();
}

uint64_t RCLocalizedRecordingDateWithOptions()
{
  return _RCLocalizedRecordingDateWithOptions();
}

uint64_t RCRecordingsDirectoryURL()
{
  return _RCRecordingsDirectoryURL();
}

uint64_t RCSavedRecordingsCloudKitContainerIdentifier()
{
  return _RCSavedRecordingsCloudKitContainerIdentifier();
}

uint64_t RCSearchableItemForRecording()
{
  return _RCSearchableItemForRecording();
}

uint64_t RCStockRecordingsURL()
{
  return _RCStockRecordingsURL();
}

uint64_t RCSupportDirectoryForDatabase()
{
  return _RCSupportDirectoryForDatabase();
}

uint64_t RCTimeRangeMake()
{
  return _RCTimeRangeMake();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSVersionNumberCompare()
{
  return __LSVersionNumberCompare();
}

uint64_t _LSVersionNumberMakeWithString()
{
  return __LSVersionNumberMakeWithString();
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

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_copy_sandbox_token()
{
  return _container_copy_sandbox_token();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_AVOutputURL(void *a1, const char *a2, ...)
{
  return [a1 AVOutputURL];
}

id objc_msgSend_URIRepresentation(void *a1, const char *a2, ...)
{
  return [a1 URIRepresentation];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 URLByStandardizingPath];
}

id objc_msgSend_URLs(void *a1, const char *a2, ...)
{
  return [a1 URLs];
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

id objc_msgSend__audioFutureEntityToAttributesDict(void *a1, const char *a2, ...)
{
  return [a1 _audioFutureEntityToAttributesDict];
}

id objc_msgSend__checkAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 _checkAccountStatus];
}

id objc_msgSend__cloudKitContainer(void *a1, const char *a2, ...)
{
  return [a1 _cloudKitContainer];
}

id objc_msgSend__handleDebugSignal(void *a1, const char *a2, ...)
{
  return [a1 _handleDebugSignal];
}

id objc_msgSend__handleiCloudAvailabilityChanged(void *a1, const char *a2, ...)
{
  return [a1 _handleiCloudAvailabilityChanged];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__initializeCloudKitPushNotifications(void *a1, const char *a2, ...)
{
  return [a1 _initializeCloudKitPushNotifications];
}

id objc_msgSend__metaDataDeviceQueryOperation(void *a1, const char *a2, ...)
{
  return [a1 _metaDataDeviceQueryOperation];
}

id objc_msgSend__migrateDatabaseIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _migrateDatabaseIfNecessary];
}

id objc_msgSend__migrateSyncedUUIDsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _migrateSyncedUUIDsIfNeeded];
}

id objc_msgSend__newBackgroundMirroringModel(void *a1, const char *a2, ...)
{
  return [a1 _newBackgroundMirroringModel];
}

id objc_msgSend__notifyDelegate(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegate];
}

id objc_msgSend__onQueueActiveSessions(void *a1, const char *a2, ...)
{
  return [a1 _onQueueActiveSessions];
}

id objc_msgSend__onQueuePerformOrphanHandlingIfEnabled(void *a1, const char *a2, ...)
{
  return [a1 _onQueuePerformOrphanHandlingIfEnabled];
}

id objc_msgSend__registerForVoxInitiatedMigrationNotificationName(void *a1, const char *a2, ...)
{
  return [a1 _registerForVoxInitiatedMigrationNotificationName];
}

id objc_msgSend__removeVestigialCloudKitSupportDirectory(void *a1, const char *a2, ...)
{
  return [a1 _removeVestigialCloudKitSupportDirectory];
}

id objc_msgSend__resetEncryptedFieldsMigrationState(void *a1, const char *a2, ...)
{
  return [a1 _resetEncryptedFieldsMigrationState];
}

id objc_msgSend__setupSignalHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupSignalHandlers];
}

id objc_msgSend__shutdownCloudMirroring(void *a1, const char *a2, ...)
{
  return [a1 _shutdownCloudMirroring];
}

id objc_msgSend__startMonitoringDemoMovieIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringDemoMovieIfNeeded];
}

id objc_msgSend__stopMonitoringDemoMovieIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringDemoMovieIfNeeded];
}

id objc_msgSend__tearDownSignalHandlers(void *a1, const char *a2, ...)
{
  return [a1 _tearDownSignalHandlers];
}

id objc_msgSend__updateMigrationStatusIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateMigrationStatusIfNeeded];
}

id objc_msgSend__voiceMemosSearchableIndex(void *a1, const char *a2, ...)
{
  return [a1 _voiceMemosSearchableIndex];
}

id objc_msgSend__wipeCloudKitCaches(void *a1, const char *a2, ...)
{
  return [a1 _wipeCloudKitCaches];
}

id objc_msgSend_accessIntent(void *a1, const char *a2, ...)
{
  return [a1 accessIntent];
}

id objc_msgSend_accessToken(void *a1, const char *a2, ...)
{
  return [a1 accessToken];
}

id objc_msgSend_activeSessions(void *a1, const char *a2, ...)
{
  return [a1 activeSessions];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allRecordings(void *a1, const char *a2, ...)
{
  return [a1 allRecordings];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributesByName(void *a1, const char *a2, ...)
{
  return [a1 attributesByName];
}

id objc_msgSend_audioFutureNeedsDownload(void *a1, const char *a2, ...)
{
  return [a1 audioFutureNeedsDownload];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_beginIndexBatch(void *a1, const char *a2, ...)
{
  return [a1 beginIndexBatch];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_canUpdateWithMultiTrackAsset(void *a1, const char *a2, ...)
{
  return [a1 canUpdateWithMultiTrackAsset];
}

id objc_msgSend_changeID(void *a1, const char *a2, ...)
{
  return [a1 changeID];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return [a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_ckContainer(void *a1, const char *a2, ...)
{
  return [a1 ckContainer];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_cloudKitIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 cloudKitIsEnabled];
}

id objc_msgSend_cloudSyncIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncIsAvailable];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_composedAVURL(void *a1, const char *a2, ...)
{
  return [a1 composedAVURL];
}

id objc_msgSend_composedDuration(void *a1, const char *a2, ...)
{
  return [a1 composedDuration];
}

id objc_msgSend_composedWaveformURLs(void *a1, const char *a2, ...)
{
  return [a1 composedWaveformURLs];
}

id objc_msgSend_compositionAVURL(void *a1, const char *a2, ...)
{
  return [a1 compositionAVURL];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentQueryGenerationToken(void *a1, const char *a2, ...)
{
  return [a1 currentQueryGenerationToken];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_customLabel(void *a1, const char *a2, ...)
{
  return [a1 customLabel];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decomposedFragments(void *a1, const char *a2, ...)
{
  return [a1 decomposedFragments];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultFetchedProperties(void *a1, const char *a2, ...)
{
  return [a1 defaultFetchedProperties];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSortDescriptors(void *a1, const char *a2, ...)
{
  return [a1 defaultSortDescriptors];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteFromFilesystem(void *a1, const char *a2, ...)
{
  return [a1 deleteFromFilesystem];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceTypesToMinimumVersions(void *a1, const char *a2, ...)
{
  return [a1 deviceTypesToMinimumVersions];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_encryptedFieldMigrations(void *a1, const char *a2, ...)
{
  return [a1 encryptedFieldMigrations];
}

id objc_msgSend_encryptedFieldsAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 encryptedFieldsAccountStatus];
}

id objc_msgSend_encryptedFieldsMigrationExists(void *a1, const char *a2, ...)
{
  return [a1 encryptedFieldsMigrationExists];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return [a1 entitiesByName];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_failedObjectIDsToError(void *a1, const char *a2, ...)
{
  return [a1 failedObjectIDsToError];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return [a1 fetchedObjects];
}

id objc_msgSend_fileExtensionsSupported(void *a1, const char *a2, ...)
{
  return [a1 fileExtensionsSupported];
}

id objc_msgSend_fileFormat(void *a1, const char *a2, ...)
{
  return [a1 fileFormat];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSizeOfAssets(void *a1, const char *a2, ...)
{
  return [a1 fileSizeOfAssets];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frameCount(void *a1, const char *a2, ...)
{
  return [a1 frameCount];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasMultipleTracks(void *a1, const char *a2, ...)
{
  return [a1 hasMultipleTracks];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
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

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isContentBeingModified(void *a1, const char *a2, ...)
{
  return [a1 isContentBeingModified];
}

id objc_msgSend_isExclusive(void *a1, const char *a2, ...)
{
  return [a1 isExclusive];
}

id objc_msgSend_isRunningInDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInDemoMode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localAssetIsCurrent(void *a1, const char *a2, ...)
{
  return [a1 localAssetIsCurrent];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_madeChanges(void *a1, const char *a2, ...)
{
  return [a1 madeChanges];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_migrateCustomLabelIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 migrateCustomLabelIfNeeded];
}

id objc_msgSend_migrateLocalProperties(void *a1, const char *a2, ...)
{
  return [a1 migrateLocalProperties];
}

id objc_msgSend_migrateSyncedUUIDs(void *a1, const char *a2, ...)
{
  return [a1 migrateSyncedUUIDs];
}

id objc_msgSend_mirroringDelegate(void *a1, const char *a2, ...)
{
  return [a1 mirroringDelegate];
}

id objc_msgSend_moveRecordingsDirectoryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 moveRecordingsDirectoryIfNeeded];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newBackgroundMirroringModel(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundMirroringModel];
}

id objc_msgSend_newBackgroundModel(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundModel];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_objectIDToLastExportedToken(void *a1, const char *a2, ...)
{
  return [a1 objectIDToLastExportedToken];
}

id objc_msgSend_objectIDsForRecordingsNeedingAssetExport(void *a1, const char *a2, ...)
{
  return [a1 objectIDsForRecordingsNeedingAssetExport];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingRestore(void *a1, const char *a2, ...)
{
  return [a1 pendingRestore];
}

id objc_msgSend_performLocalEncryptedTitleMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 performLocalEncryptedTitleMigrationIfNeeded];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_persistentStore(void *a1, const char *a2, ...)
{
  return [a1 persistentStore];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_playable(void *a1, const char *a2, ...)
{
  return [a1 playable];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reconcileMigrationStates(void *a1, const char *a2, ...)
{
  return [a1 reconcileMigrationStates];
}

id objc_msgSend_recordingsWithNilAudioFutures(void *a1, const char *a2, ...)
{
  return [a1 recordingsWithNilAudioFutures];
}

id objc_msgSend_recordingsWithNilEncryptedTitleOrCustomLabel(void *a1, const char *a2, ...)
{
  return [a1 recordingsWithNilEncryptedTitleOrCustomLabel];
}

id objc_msgSend_recreateAudioFutureIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 recreateAudioFutureIfNecessary];
}

id objc_msgSend_reloadStockRecordings(void *a1, const char *a2, ...)
{
  return [a1 reloadStockRecordings];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeDatabaseDirectories(void *a1, const char *a2, ...)
{
  return [a1 removeDatabaseDirectories];
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return [a1 restoreState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_saveIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 saveIfNecessary];
}

id objc_msgSend_saveMetadataToDefaultLocation(void *a1, const char *a2, ...)
{
  return [a1 saveMetadataToDefaultLocation];
}

id objc_msgSend_savedRecordingUUID(void *a1, const char *a2, ...)
{
  return [a1 savedRecordingUUID];
}

id objc_msgSend_savedRecordingsDirectory(void *a1, const char *a2, ...)
{
  return [a1 savedRecordingsDirectory];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceInterface];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupAssistantNeedsToRun(void *a1, const char *a2, ...)
{
  return [a1 setupAssistantNeedsToRun];
}

id objc_msgSend_sharedContainer(void *a1, const char *a2, ...)
{
  return [a1 sharedContainer];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_startMonitoringAccountChanges(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringAccountChanges];
}

id objc_msgSend_startMonitoringAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringAccountStatus];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return [a1 subscriptionID];
}

id objc_msgSend_succeeded(void *a1, const char *a2, ...)
{
  return [a1 succeeded];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_syncedAudioFuture(void *a1, const char *a2, ...)
{
  return [a1 syncedAudioFuture];
}

id objc_msgSend_synchronizeRecordingMetadata(void *a1, const char *a2, ...)
{
  return [a1 synchronizeRecordingMetadata];
}

id objc_msgSend_tccCloudAccess(void *a1, const char *a2, ...)
{
  return [a1 tccCloudAccess];
}

id objc_msgSend_timeRangeInComposition(void *a1, const char *a2, ...)
{
  return [a1 timeRangeInComposition];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return [a1 tombstone];
}

id objc_msgSend_transactionAuthor(void *a1, const char *a2, ...)
{
  return [a1 transactionAuthor];
}

id objc_msgSend_transactionError(void *a1, const char *a2, ...)
{
  return [a1 transactionError];
}

id objc_msgSend_transactionNumber(void *a1, const char *a2, ...)
{
  return [a1 transactionNumber];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsetLocalEncryptedTitleMigrationFlag(void *a1, const char *a2, ...)
{
  return [a1 unsetLocalEncryptedTitleMigrationFlag];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updatedObjectIDs(void *a1, const char *a2, ...)
{
  return [a1 updatedObjectIDs];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return [a1 updatedProperties];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_voiceMemosMetadata(void *a1, const char *a2, ...)
{
  return [a1 voiceMemosMetadata];
}

id objc_msgSend_waitingForMobileRestoreToFinish(void *a1, const char *a2, ...)
{
  return [a1 waitingForMobileRestoreToFinish];
}

id objc_msgSend_walrusStatus(void *a1, const char *a2, ...)
{
  return [a1 walrusStatus];
}

id objc_msgSend_wipeAllCachesAndDie(void *a1, const char *a2, ...)
{
  return [a1 wipeAllCachesAndDie];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}