void sub_4C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4C54(id a1)
{
  id v1 = sub_4C7C();

  [v1 _repairFilePermissionsIfNeeded];
}

id sub_4C7C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_15A30;
  uint64_t v7 = qword_15A30;
  if (!qword_15A30)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_A9B8;
    v3[3] = &unk_104E0;
    v3[4] = &v4;
    sub_A9B8((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_4D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_4D60(uint64_t a1, void *a2)
{
  return [a2 _NRPairedDeviceRegistryWatchDidBecomeActiveDarwinNotification];
}

void sub_4E70(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[40])
  {
    WeakRetained[40] = 1;
    v3 = sub_4FB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "ATC startup did complete. Adding notfication observers", v8, 2u);
    }

    uint64_t v4 = +[ICEnvironmentMonitor sharedMonitor];
    [v4 registerObserver:v2];
    v2[25] = [v2 _canEnqueueAssetsUnderBatteryAndThermalLevels];
    v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 addObserver:v2];

    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleDownloadInfoDidInvalidateNotification:" name:NMSMediaPinningManagerDownloadInfoDidInvalidateNotification object:0];

    uint64_t v7 = [sub_50C0() sharedInstance];
    [v7 addObserver:v2];

    [v2 _performCleanupTask];
    [v2 _syncPodcastsChangesIfCanEnqueueAssets];
  }
}

id sub_4FB4()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void (*)(void))off_15A38;
  uint64_t v7 = off_15A38;
  if (!off_15A38)
  {
    id v1 = (void *)sub_A844();
    v5[3] = (uint64_t)dlsym(v1, "_MTLogCategoryDatabase");
    off_15A38 = (_UNKNOWN *)v5[3];
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_AF14();
  }
  v2 = v0();

  return v2;
}

void sub_50A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_50C0()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_15A40;
  uint64_t v7 = qword_15A40;
  if (!qword_15A40)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_AA60;
    v3[3] = &unk_104E0;
    v3[4] = &v4;
    sub_AA60((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_518C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_54D4()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_15A50;
  uint64_t v7 = qword_15A50;
  if (!qword_15A50)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_AB10;
    v3[3] = &unk_104E0;
    v3[4] = &v4;
    sub_AB10((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_55A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_55B8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = sub_5634();
  id v5 = [v2 objectForUuid:v3 entityName:v4];

  [*(id *)(a1 + 48) _clearAssetURLForEpisode:v5];
}

id sub_5634()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_15A58;
  uint64_t v7 = qword_15A58;
  if (!qword_15A58)
  {
    id v1 = (void *)sub_A844();
    v5[3] = (uint64_t)dlsym(v1, "kMTEpisodeEntityName");
    qword_15A58 = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_AF14();
  }
  v2 = *v0;

  return v2;
}

void sub_5724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_59A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncPodcastsChangesIfCanEnqueueAssets];
}

void sub_5B80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncPodcastsChangesIfCanEnqueueAssets];
}

void sub_5E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_60B8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  if (!v2)
  {
    v12 = sub_4FB4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
      v14 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138412546;
      v93 = v13;
      __int16 v94 = 2112;
      id v95 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "No episode uuid for asset %@ - %@", buf, 0x16u);
    }
    uint64_t v15 = a1 + 32;
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(v15 + 8);
    uint64_t v11 = +[NSError errorWithDomain:@"ATError" code:9 userInfo:0];
    goto LABEL_9;
  }
  uint64_t v3 = [*(id *)(a1 + 32) error];

  uint64_t v4 = sub_4FB4();
  id v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
      *(_DWORD *)buf = 138412290;
      v93 = v17;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Sync did complete for asset %@", buf, 0xCu);
    }
    v16 = [*(id *)(a1 + 32) path];
    v18 = +[NSFileManager defaultManager];
    if (([v18 fileExistsAtPath:v16] & 1) == 0)
    {
      v39 = sub_4FB4();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138412546;
        v93 = v40;
        __int16 v94 = 2112;
        id v95 = v16;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "Failed to find file for %@ at path %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) _clearAssetURLForEpisodeWithUUID:v2];
      uint64_t v43 = a1 + 32;
      uint64_t v41 = *(void *)(a1 + 32);
      v42 = *(void **)(v43 + 8);
      v19 = +[NSError errorWithDomain:@"ATError" code:3 userInfo:0];
      [v42 _cancelAsset:v41 withError:v19];
      goto LABEL_51;
    }
    v19 = [v16 pathExtension];
    if (!v19)
    {
      v44 = sub_4FB4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138412290;
        v93 = v45;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "Failed to find file extension for %@", buf, 0xCu);
      }
      [*(id *)(a1 + 40) _clearAssetURLForEpisodeWithUUID:v2];
      uint64_t v48 = a1 + 32;
      uint64_t v46 = *(void *)(a1 + 32);
      v47 = *(void **)(v48 + 8);
      v23 = +[NSError errorWithDomain:@"ATError" code:1 userInfo:0];
      [v47 _cancelAsset:v46 withError:v23];
      goto LABEL_50;
    }
    v20 = [sub_4C7C() managedAssetsDirectoryURL];
    v21 = [v20 URLByAppendingPathComponent:v2 isDirectory:0];
    v22 = [v21 URLByAppendingPathExtension:v19];
    v23 = [v22 path];

    if ([v18 fileExistsAtPath:v23])
    {
      v24 = sub_4FB4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138412546;
        v93 = v25;
        __int16 v94 = 2112;
        id v95 = v23;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Will remove existing asset for episode %@ at destination %@", buf, 0x16u);
      }
      id v91 = 0;
      unsigned __int8 v26 = [v18 removeItemAtPath:v23 error:&v91];
      id v27 = v91;
      v28 = v27;
      if ((v26 & 1) == 0)
      {
        v57 = sub_4FB4();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
          *(_DWORD *)buf = 138412546;
          v93 = v58;
          __int16 v94 = 2112;
          id v95 = v28;
          _os_log_impl(&dword_0, v57, OS_LOG_TYPE_ERROR, "Failed to remove existing asset for episode %@ - %@", buf, 0x16u);
        }
        id v90 = 0;
        unsigned __int8 v59 = [v18 removeItemAtPath:v16 error:&v90];
        id v30 = v90;
        if ((v59 & 1) == 0)
        {
          v60 = sub_4FB4();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
            *(_DWORD *)buf = 138412546;
            v93 = v61;
            __int16 v94 = 2112;
            id v95 = v30;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_ERROR, "Failed to remove downloaded asset for episode %@ - %@", buf, 0x16u);
          }
        }
        [*(id *)(a1 + 40) _clearAssetURLForEpisodeWithUUID:v2];
        uint64_t v64 = a1 + 32;
        uint64_t v62 = *(void *)(a1 + 32);
        v63 = *(void **)(v64 + 8);
        id v35 = +[NSError errorWithDomain:@"ATError" code:1 userInfo:0];
        [v63 _cancelAsset:v62 withError:v35];
        goto LABEL_49;
      }
    }
    id v89 = 0;
    unsigned __int8 v29 = [v18 moveItemAtPath:v16 toPath:v23 error:&v89];
    id v30 = v89;
    v31 = sub_4FB4();
    v32 = v31;
    if (v29)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138412802;
        v93 = v33;
        __int16 v94 = 2112;
        id v95 = v16;
        __int16 v96 = 2112;
        v97 = v23;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Successfully moved %@ from %@ to %@", buf, 0x20u);
      }
      id v87 = 0;
      v34 = [v18 attributesOfItemAtPath:v23 error:&v87];
      id v35 = v87;
      v76 = v34;
      id v77 = v30;
      if (v35)
      {
        v36 = sub_4FB4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
          *(_DWORD *)buf = 138412546;
          v93 = v37;
          __int16 v94 = 2112;
          id v95 = v35;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Failed to fetch file attributes for episode %@ - %@", buf, 0x16u);
        }
        v38 = 0;
      }
      else
      {
        v38 = [v34 objectForKeyedSubscript:NSFileSize];
      }
      id v65 = objc_alloc((Class)AVAudioPlayer);
      v66 = +[NSURL fileURLWithPath:v23];
      id v67 = [v65 initWithContentsOfURL:v66 error:0];

      [v67 duration];
      uint64_t v69 = v68;

      v70 = [sub_54D4() sharedInstance];
      v71 = [v70 privateQueueContext];

      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_6B3C;
      v79[3] = &unk_103F0;
      id v80 = v71;
      id v81 = v2;
      int8x16_t v75 = *(int8x16_t *)(a1 + 32);
      id v72 = (id)v75.i64[0];
      int8x16_t v82 = vextq_s8(v75, v75, 8uLL);
      id v83 = v18;
      id v84 = v23;
      id v85 = v38;
      uint64_t v86 = v69;
      id v73 = v38;
      id v74 = v71;
      [v74 performBlock:v79];

      v56 = v76;
      id v30 = v77;
    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v49 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
        *(_DWORD *)buf = 138413058;
        v93 = v49;
        __int16 v94 = 2112;
        id v95 = v16;
        __int16 v96 = 2112;
        v97 = v23;
        __int16 v98 = 2112;
        id v99 = v30;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "Failed to move %@ from %@ to %@ - %@", buf, 0x2Au);
      }
      id v88 = 0;
      unsigned __int8 v50 = [v18 removeItemAtPath:v16 error:&v88];
      id v35 = v88;
      if ((v50 & 1) == 0)
      {
        v51 = sub_4FB4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
          v52 = id v78 = v30;
          *(_DWORD *)buf = 138412546;
          v93 = v52;
          __int16 v94 = 2112;
          id v95 = v35;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_ERROR, "Failed to remove downloaded asset for episode %@ - %@", buf, 0x16u);

          id v30 = v78;
        }
      }
      [*(id *)(a1 + 40) _clearAssetURLForEpisodeWithUUID:v2];
      uint64_t v55 = a1 + 32;
      uint64_t v53 = *(void *)(a1 + 32);
      v54 = *(void **)(v55 + 8);
      v56 = +[NSError errorWithDomain:@"ATError" code:1 userInfo:0];
      [v54 _cancelAsset:v53 withError:v56];
    }

LABEL_49:
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 40) _stringForAsset:*(void *)(a1 + 32)];
    uint64_t v7 = [*(id *)(a1 + 32) error];
    *(_DWORD *)buf = 138412546;
    v93 = v6;
    __int16 v94 = 2112;
    id v95 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Sync did fail for %@ - %@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) _clearAssetURLForEpisodeWithUUID:v2];
  uint64_t v10 = a1 + 32;
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(v10 + 8);
  uint64_t v11 = [v8 error];
LABEL_9:
  v16 = (void *)v11;
  [v9 _cancelAsset:v8 withError:v11];
LABEL_52:
}

void sub_6B3C(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = sub_5634();
  id v5 = [v2 objectForUuid:v3 entityName:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 72) fileURLFromAssetPath];
    [v5 setAssetURL:v6];

    uint64_t v7 = *(void **)(a1 + 80);
    if (v7) {
      objc_msgSend(v5, "setByteSize:", objc_msgSend(v7, "unsignedLongLongValue"));
    }
    [v5 setDuration:*(double *)(a1 + 88)];
    [*(id *)(a1 + 32) saveInCurrentBlock];
    v8 = *(NSObject **)(*(void *)(a1 + 48) + 8);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_6E68;
    v19[3] = &unk_103C8;
    id v20 = *(id *)(a1 + 56);
    dispatch_async(v8, v19);
    id v9 = v20;
  }
  else
  {
    uint64_t v10 = sub_4FB4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 48) _stringForAsset:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Removing downloaded asset for episode no longer available %@", buf, 0xCu);
    }
    v12 = *(void **)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    id v23 = 0;
    unsigned __int8 v14 = [v12 removeItemAtPath:v13 error:&v23];
    id v9 = v23;
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = sub_4FB4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [*(id *)(a1 + 48) _stringForAsset:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to remove downloaded asset after moving for episode %@ - %@", buf, 0x16u);
      }
    }
    uint64_t v17 = *(void *)(a1 + 48);
    v18 = *(NSObject **)(v17 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6DF8;
    block[3] = &unk_103A0;
    block[4] = v17;
    id v22 = *(id *)(a1 + 56);
    dispatch_async(v18, block);
  }
}

void sub_6DF8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NSError errorWithDomain:@"ATError" code:15 userInfo:0];
  [v1 _cancelAsset:v2 withError:v3];
}

void sub_6E68(uint64_t a1)
{
  uint64_t v2 = +[ATAssetLinkController sharedInstance];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = +[NSArray arrayWithObjects:&v4 count:1];
  [v2 installCompleteForAssets:v3];
}

void sub_6FD8(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = sub_4FB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Asset link controller did process all track assets for type %@", (uint8_t *)&v8, 0xCu);
    }

    int v5 = WeakRetained[24];
    uint64_t v6 = sub_4FB4();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Pending sync found", (uint8_t *)&v8, 2u);
      }

      [WeakRetained _syncPodcastsChangesIfCanEnqueueAssets];
    }
    else
    {
      if (v7)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Pending sync not found", (uint8_t *)&v8, 2u);
      }
    }
  }
}

id sub_720C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _syncPodcastsChangesIfCanEnqueueAssets];
}

void sub_7348(uint64_t a1)
{
  uint64_t v2 = +[NSMutableSet set];
  id v3 = +[NMSMediaPinningManager sharedManager];
  uint64_t v4 = [v3 downloadInfo];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_762C;
  v20[3] = &unk_10440;
  id v5 = v2;
  id v21 = v5;
  [v4 enumerateMediaItemsUsingBlock:v20];
  uint64_t v6 = [v5 allObjects];
  +[NMTMetricsUtil setDownloadableEpisodeUUIDs:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v8 = +[NSPredicate predicateWithFormat:@"variantOptions.AssetParts=%d and dataclass=%@ and NOT identifier IN %@", 1, @"Podcasts", v5];
    uint64_t v9 = +[ATAssetLinkController sharedInstance];
    uint64_t v10 = +[NSError errorWithDomain:@"ATError" code:2 userInfo:0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_76B8;
    v17[3] = &unk_10468;
    id v11 = v5;
    id v18 = v11;
    v19 = WeakRetained;
    [v9 cancelAllAssetsMatchingPredicate:v8 excludeActiveDownloads:0 withError:v10 completion:v17];

    v12 = [v11 allObjects];
    uint64_t v13 = [v12 componentsJoinedByString:&stru_105D8];
    id v14 = [v13 hash];

    if (v14 != (id)WeakRetained[4])
    {
      uint64_t v15 = sub_4FB4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = WeakRetained[4];
        *(_DWORD *)buf = 134218240;
        uint64_t v23 = v16;
        __int16 v24 = 2048;
        id v25 = v14;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Added episodes did change since last time assets were enqueued %lu -> %lu", buf, 0x16u);
      }

      [*(id *)(a1 + 32) _syncPodcastsChangesIfCanEnqueueAssets];
    }
    WeakRetained[4] = v14;
  }
}

void sub_762C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 itemType] == (char *)&dword_0 + 1)
  {
    id v3 = [v6 externalLibraryIdentifier];

    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = [v6 externalLibraryIdentifier];
      [v4 addObject:v5];
    }
  }
}

void sub_76B8(uint64_t a1)
{
  uint64_t v2 = sub_5634();
  id v3 = +[NSFetchRequest fetchRequestWithEntityName:v2];

  id v4 = sub_7B8C();
  uint64_t v36 = a1;
  id v5 = [*(id *)(a1 + 32) copy];
  id v6 = [v4 predicateForEpisodeUuids:v5];
  BOOL v7 = [v6 NOT];
  int v8 = [sub_7B8C() predicateForDownloaded:1 excludeHidden:0];
  uint64_t v9 = [v7 AND:v8];
  [v3 setPredicate:v9];

  uint64_t v10 = [sub_7B8C() propertiesToFetchAssetURL];
  id v11 = sub_7C70();
  v54[0] = v11;
  v12 = sub_7D78();
  v54[1] = v12;
  uint64_t v13 = sub_7E80();
  v54[2] = v13;
  id v14 = +[NSArray arrayWithObjects:v54 count:3];
  uint64_t v15 = [v10 arrayByAddingObjectsFromArray:v14];
  [v3 setPropertiesToFetch:v15];

  uint64_t v16 = [sub_54D4() sharedInstance];
  uint64_t v17 = [v16 privateQueueContext];

  id v18 = +[NSMutableDictionary dictionary];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_7F88;
  v45[3] = &unk_10378;
  id v46 = v17;
  id v34 = v3;
  id v47 = v34;
  id v19 = v18;
  id v48 = v19;
  id v35 = v46;
  [v46 performBlockAndWait:v45];
  id v20 = +[NSFileManager defaultManager];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v33 = [v19 copy];
  id v21 = [v33 keyEnumerator];
  id v22 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v42;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v42 != v24) {
          objc_enumerationMutation(v21);
        }
        __int16 v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v27 = [v26 assetPathFromFileURL];
        if ([v20 fileExistsAtPath:v27])
        {
          id v40 = 0;
          unsigned __int8 v28 = [v20 removeItemAtPath:v27 error:&v40];
          unsigned __int8 v29 = v40;
          if ((v28 & 1) == 0)
          {
            id v30 = sub_4FB4();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              unsigned __int8 v50 = v27;
              __int16 v51 = 2112;
              v52 = v29;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "Failed to remove episode asset at path %@ - %@", buf, 0x16u);
            }

            [v19 removeObjectForKey:v26];
          }
        }
        else
        {
          unsigned __int8 v29 = sub_4FB4();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unsigned __int8 v50 = v27;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Tried to remove episode asset at path %@ but file does not exist", buf, 0xCu);
          }
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v23);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_80B4;
  v37[3] = &unk_103A0;
  uint64_t v31 = *(void *)(v36 + 40);
  id v38 = v19;
  uint64_t v39 = v31;
  id v32 = v19;
  [v35 performBlockAndWaitWithSave:v37];
}

id sub_7B8C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_15A68;
  uint64_t v7 = qword_15A68;
  if (!qword_15A68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_AC08;
    v3[3] = &unk_104E0;
    v3[4] = &v4;
    sub_AC08((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_7C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7C70()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_15A70;
  uint64_t v7 = qword_15A70;
  if (!qword_15A70)
  {
    id v1 = (void *)sub_A844();
    v5[3] = (uint64_t)dlsym(v1, "kEpisodeUuid");
    qword_15A70 = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_AF14();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_7D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7D78()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_15A78;
  uint64_t v7 = qword_15A78;
  if (!qword_15A78)
  {
    id v1 = (void *)sub_A844();
    v5[3] = (uint64_t)dlsym(v1, "kEpisodeTitle");
    qword_15A78 = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_AF14();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_7E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7E80()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_15A80;
  uint64_t v7 = qword_15A80;
  if (!qword_15A80)
  {
    id v1 = (void *)sub_A844();
    v5[3] = (uint64_t)dlsym(v1, "kEpisodeStoreTrackId");
    qword_15A80 = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_AF14();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_7F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7F88(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v8 = *(void **)(a1 + 48);
        uint64_t v9 = [v7 assetURL];
        [v8 setObject:v7 forKeyedSubscript:v9];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_80B4(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) objectEnumerator];
  id v2 = [obj countByEnumeratingWithState:&v13 objects:v25 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v7 = sub_4FB4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [v6 uuid];
          uint64_t v9 = [v6 title];
          long long v10 = [v6 assetURL];
          id v11 = [v6 storeTrackId];
          *(_DWORD *)buf = 138413058;
          id v18 = v8;
          __int16 v19 = 2112;
          id v20 = v9;
          __int16 v21 = 2112;
          id v22 = v10;
          __int16 v23 = 2048;
          id v24 = v11;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Deleted unpinned episode <%@ - %@> at path %@ with adam id %lld", buf, 0x2Au);
        }
        [*(id *)(a1 + 40) _clearAssetURLForEpisode:v6];
      }
      id v3 = [obj countByEnumeratingWithState:&v13 objects:v25 count:16];
    }
    while (v3);
  }
}

id sub_8340(uint64_t a1)
{
  return [*(id *)(a1 + 32) _syncPodcastsChangesIfCanEnqueueAssets];
}

void sub_86FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncPodcastsChangesIfCanEnqueueAssets];
}

void sub_8DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8DD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_4FB4();
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_0, WeakRetained, OS_LOG_TYPE_ERROR, "initiateAssetDownloadSessions failed with error %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    isa = WeakRetained[1].isa;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8F30;
    block[3] = &unk_103C8;
    block[4] = WeakRetained;
    dispatch_async(isa, block);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, WeakRetained, OS_LOG_TYPE_DEFAULT, "initiateAssetDownloadSessions succeeded", buf, 2u);
  }
}

id sub_8F30(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  id v2 = sub_4FB4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Perform cleanup task after sync failure", v4, 2u);
  }

  return [*(id *)(a1 + 32) _performCleanupTask];
}

void sub_9548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t sub_A27C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A28C(uint64_t a1)
{
}

void sub_A294(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = (void *)a1[6];
        long long v13 = objc_msgSend(v11, "assetURL", (void)v15);
        long long v14 = [v13 lastPathComponent];
        [v12 setObject:v11 forKeyedSubscript:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

void sub_A3FC(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v13;
    *(void *)&long long v4 = 138412290;
    long long v11 = v4;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v7), v11, (void)v12);
        uint64_t v9 = sub_4FB4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          long long v10 = [v8 title];
          *(_DWORD *)buf = v11;
          long long v17 = v10;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Cleanup task will clear assetURL for episode %@", buf, 0xCu);
        }
        [v8 setAssetURL:0];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

void *sub_A7F4(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  result = dlsym(v2, "_MTLogCategoryDefault");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_15A20 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_A844()
{
  v3[0] = 0;
  if (!qword_15A28)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_A944;
    v3[4] = &unk_10518;
    void v3[5] = v3;
    long long v4 = off_10500;
    uint64_t v5 = 0;
    qword_15A28 = _sl_dlopen();
  }
  uint64_t v0 = qword_15A28;
  id v1 = (void *)v3[0];
  if (!qword_15A28)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_A944()
{
  uint64_t result = _sl_dlopen();
  qword_15A28 = result;
  return result;
}

Class sub_A9B8(uint64_t a1)
{
  sub_A844();
  Class result = objc_getClass("MTConstants");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_AF38();
  }
  qword_15A30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_AA10(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "_MTLogCategoryDatabase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_15A38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_AA60(uint64_t a1)
{
  sub_A844();
  Class result = objc_getClass("MTDBExtensionAccess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_AF60();
  }
  qword_15A40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_AAB8(uint64_t a1)
{
  sub_A844();
  Class result = objc_getClass("PFSecureDownloadRenewalManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_AF88();
  }
  qword_15A48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_AB10(uint64_t a1)
{
  sub_A844();
  Class result = objc_getClass("MTDB");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_AFB0();
  }
  qword_15A50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_AB68(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kMTEpisodeEntityName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_ABB8(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kMTApplicationBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_AC08(uint64_t a1)
{
  sub_A844();
  Class result = objc_getClass("MTEpisode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_AFD8();
  }
  qword_15A68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_AC60(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeUuid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_ACB0(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_AD00(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeStoreTrackId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_AD50(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeEnclosureUrl");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_ADA0(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeGuid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_ADF0(uint64_t a1)
{
  id v2 = (void *)sub_A844();
  Class result = dlsym(v2, "kEpisodeAssetURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_15A98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_AF14()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_AF38(v0);
}

void sub_AF38()
{
  uint64_t v0 = abort_report_np();
  sub_AF60(v0);
}

void sub_AF60()
{
  uint64_t v0 = abort_report_np();
  sub_AF88(v0);
}

void sub_AF88()
{
  uint64_t v0 = abort_report_np();
  sub_AFB0(v0);
}

void sub_AFB0()
{
  uint64_t v0 = abort_report_np();
  sub_AFD8(v0);
}

void sub_AFD8()
{
  uint64_t v0 = (__CFNotificationCenter *)abort_report_np();
  CFNotificationCenterAddObserver(v0, v1, v2, v3, v4, v5);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t ICSystemApplicationIsInstalled()
{
  return _ICSystemApplicationIsInstalled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_NOT(void *a1, const char *a2, ...)
{
  return [a1 NOT];
}

id objc_msgSend__canEnqueueAssetsToSync(void *a1, const char *a2, ...)
{
  return [a1 _canEnqueueAssetsToSync];
}

id objc_msgSend__canEnqueueAssetsUnderBatteryAndThermalLevels(void *a1, const char *a2, ...)
{
  return [a1 _canEnqueueAssetsUnderBatteryAndThermalLevels];
}

id objc_msgSend__downloadableEpisodeUUIDsURL(void *a1, const char *a2, ...)
{
  return [a1 _downloadableEpisodeUUIDsURL];
}

id objc_msgSend__isPodcastsSyncSessionCurrentlyRunning(void *a1, const char *a2, ...)
{
  return [a1 _isPodcastsSyncSessionCurrentlyRunning];
}

id objc_msgSend__performCleanupTask(void *a1, const char *a2, ...)
{
  return [a1 _performCleanupTask];
}

id objc_msgSend__shouldRunPodcastsSyncClient(void *a1, const char *a2, ...)
{
  return [a1 _shouldRunPodcastsSyncClient];
}

id objc_msgSend__syncPodcastsChangesIfCanEnqueueAssets(void *a1, const char *a2, ...)
{
  return [a1 _syncPodcastsChangesIfCanEnqueueAssets];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetPathFromFileURL(void *a1, const char *a2, ...)
{
  return [a1 assetPathFromFileURL];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_attemptToFix(void *a1, const char *a2, ...)
{
  return [a1 attemptToFix];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cachingEnabled(void *a1, const char *a2, ...)
{
  return [a1 cachingEnabled];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 currentBatteryLevel];
}

id objc_msgSend_currentThermalLevel(void *a1, const char *a2, ...)
{
  return [a1 currentThermalLevel];
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

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_downloadInfo(void *a1, const char *a2, ...)
{
  return [a1 downloadInfo];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_enclosureURL(void *a1, const char *a2, ...)
{
  return [a1 enclosureURL];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_externalLibraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalLibraryIdentifier];
}

id objc_msgSend_fileURLFromAssetPath(void *a1, const char *a2, ...)
{
  return [a1 fileURLFromAssetPath];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return [a1 isCharging];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return [a1 isReady];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return [a1 itemType];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_managedAssetsDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 managedAssetsDirectoryURL];
}

id objc_msgSend_networkType(void *a1, const char *a2, ...)
{
  return [a1 networkType];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_prettyName(void *a1, const char *a2, ...)
{
  return [a1 prettyName];
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return [a1 privateQueueContext];
}

id objc_msgSend_propertiesToFetchAssetURL(void *a1, const char *a2, ...)
{
  return [a1 propertiesToFetchAssetURL];
}

id objc_msgSend_requestSecureDeletionOfOrphanedKeys(void *a1, const char *a2, ...)
{
  return [a1 requestSecureDeletionOfOrphanedKeys];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return [a1 saveInCurrentBlock];
}

id objc_msgSend_secureDownloadRenewalManager(void *a1, const char *a2, ...)
{
  return [a1 secureDownloadRenewalManager];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDocumentsDirectory(void *a1, const char *a2, ...)
{
  return [a1 sharedDocumentsDirectory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_storageSpaceAvailable(void *a1, const char *a2, ...)
{
  return [a1 storageSpaceAvailable];
}

id objc_msgSend_storeTrackId(void *a1, const char *a2, ...)
{
  return [a1 storeTrackId];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}