void sub_4A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4A88(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 objectAtIndex:a3];
  LOBYTE(v7) = +[PLSLibraryChangeSnapshot string:v8 equalsString:v9];

  if ((v7 & 1) == 0)
  {
    v10 = +[NSString stringWithFormat:@"album assetUUID not equal"];
    v11 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v12, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_7044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7078(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v10 = [v7 isEqualToAlbum:v8];
    }
    else {
      unsigned __int8 v10 = [v7 isEqualToEvent:v8];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v11 = +[NSString stringWithFormat:@"snapshot albums not equal"];
    int v12 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v13, 0xCu);
    }

    *a4 = 1;
  }
}

void sub_7200(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 objectForKey:a2];
  LOBYTE(a2) = [v9 isEquivalentTo:v8];

  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

int64_t sub_7E50(id a1, id a2, id a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  id v7 = [v5 compare:v6 options:65];
  return (int64_t)v7;
}

void sub_A194(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allKeys", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = +[PLManagedAlbum albumWithUUID:v10 inLibrary:*(void *)(a1 + 40)];
        int v12 = [v11 objectID];
        int v13 = [v12 URIRepresentation];

        if (v13) {
          [*(id *)(*(void *)(a1 + 32) + 96) setObject:v13 forKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void sub_AC64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_AC8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5 = [v3 path];
    unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    if (v6)
    {
      [v4 setStatus:1];
      id v7 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [v7 _addPaths:v8 toRestoreContextFilesForKey:@"kPLSyncRestoreContextUnrecoverableFilesKey"];

      [*(id *)(a1 + 40) _writeRestoreContext];
    }
  }
}

void sub_AD78(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    id v3 = [v5 path];
    unsigned int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

    if (v4)
    {
      [v5 setStatus:2];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void sub_B190(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = PLSyncGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_saveOutstandingSyncJobs: completed call to saveSyncedAssets", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "finishedBlock", (void)v14);

        if (v12)
        {
          int v13 = [v11 finishedBlock];
          ((void (**)(void, id))v13)[2](v13, v4);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
}

void sub_BEE0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) syncProgressAlbum];
  [v1 reducePendingItemsCountBy:1];
}

void sub_BF28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v16 = v5;
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 assetUUIDs];
    uint64_t v9 = [*(id *)(a1 + 32) identifier];
    unsigned __int8 v10 = [v8 containsObject:v9];

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v11 = *(void **)(a1 + 40);
    id v12 = v7;
    int v13 = [v11 eventUUID];
    long long v14 = [v12 uuid];

    LODWORD(v12) = [v13 isEqualToString:v14];
    if (!v12) {
      goto LABEL_9;
    }
  }
  long long v15 = [*(id *)(a1 + 48) _albumURIForAlbumUUID:v16];
  if (v15) {
    [*(id *)(a1 + 56) addObject:v15];
  }

LABEL_9:
}

void sub_C2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C2CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C2DC(uint64_t a1)
{
}

void sub_C2E4(uint64_t a1)
{
  id v132 = 0;
  id v62 = objc_alloc_init((Class)MBManager);
  id v2 = [v62 restoreFilesForDomain:@"CameraRollDomain" error:&v132];
  id v61 = v132;
  if (v61) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  if (v3)
  {
    id v4 = PLSyncGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v61;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Could not retrieve the list of files backed up. Error = %{public}@", buf, 0xCu);
    }
  }
  id v5 = PLSyncGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v2 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<===----- The list of backedup files in the CameraRollDomain (%d total):", buf, 8u);
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = v2;
  id v7 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v129;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v129 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * i), "path", v61);
        v11 = PLSyncGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v10;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "   %{public}@", buf, 0xCu);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) _loadRestoreContext];
  id v12 = [*(id *)(a1 + 40) managedObjectContext];
  v63 = +[PLManagedAsset pathAndDateDictionariesForAllIncompleteAssetsInManagedObjectContext:v12];

  uint64_t v124 = 0;
  v125 = &v124;
  uint64_t v126 = 0x2020000000;
  char v127 = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  v118 = _NSConcreteStackBlock;
  uint64_t v119 = 3221225472;
  v120 = sub_D03C;
  v121 = &unk_249A0;
  v123 = &v124;
  uint64_t v122 = v13;
  PLSafeRunWithUnfairLock();
  if (*((unsigned char *)v125 + 24))
  {
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2020000000;
    char v87 = 0;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v135 = sub_C2CC;
    *(void *)&long long v136 = sub_C2DC;
    *((void *)&v136 + 1) = 0;
    uint64_t v14 = *(void *)(a1 + 32);
    v77 = _NSConcreteStackBlock;
    uint64_t v78 = 3221225472;
    v79 = sub_D308;
    v80 = &unk_24AA8;
    uint64_t v81 = v14;
    v82 = &v84;
    v83 = buf;
    PLSafeRunWithUnfairLock();
    if (!*((unsigned char *)v85 + 24)) {
      goto LABEL_34;
    }
    if (!*(void *)(*(void *)&buf[8] + 40)) {
      goto LABEL_24;
    }
    uint64_t v15 = [*(id *)(a1 + 40) managedObjectContext];
    id v16 = [v15 storeUUID];

    unsigned __int8 v17 = [v16 isEqualToString:*(void *)(*(void *)&buf[8] + 40)];
    *((unsigned char *)v85 + 24) = v17;

    if (*((unsigned char *)v85 + 24))
    {
LABEL_24:
      v18 = PLSyncGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Resuming restore with incomplete files from the database", v76, 2u);
      }

      v19 = *(void **)(a1 + 32);
      v20 = [v63 allKeys];
      id v64 = [v19 _restorePathsFromIncompleteAssetUUIDs:v20 inLibrary:*(void *)(a1 + 40)];
    }
    else
    {
LABEL_34:
      v30 = PLSyncGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Resuming restore without using the database for the asset list", v76, 2u);
      }

      id v64 = [*(id *)(a1 + 32) _restorePathsFromBackupList:obj];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v84, 8);
  }
  else
  {
    v21 = PLSyncGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "First time attempting this restore", buf, 2u);
    }

    [*(id *)(a1 + 32) _createRestoreContext];
    uint64_t v22 = *(void *)(a1 + 32);
    v113 = _NSConcreteStackBlock;
    uint64_t v114 = 3221225472;
    v115 = sub_D058;
    v116 = &unk_24730;
    uint64_t v117 = v22;
    PLSafeRunWithUnfairLock();
    v23 = *(void **)(a1 + 32);
    v24 = [v63 allKeys];
    v25 = [v23 _restorePathsFromIncompleteAssetUUIDs:v24 inLibrary:*(void *)(a1 + 40)];

    v26 = [*(id *)(a1 + 32) _restorePathsFromBackupList:obj];
    if ([v25 count] && !objc_msgSend(obj, "count"))
    {
      v31 = PLSyncGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        unsigned int v32 = [v25 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v32;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Relying on restoring incomplete assets from the database (%d), failed to get the restore files from mobile backup", buf, 8u);
      }

      v33 = [*(id *)(a1 + 40) managedObjectContext];
      v34 = [v33 storeUUID];

      id v35 = v25;
      uint64_t v36 = *(void *)(a1 + 32);
      v106 = _NSConcreteStackBlock;
      uint64_t v107 = 3221225472;
      v108 = sub_D0F0;
      v109 = &unk_248B0;
      uint64_t v110 = v36;
      id v64 = v35;
      id v111 = v64;
      id v112 = v34;
      PLSafeRunWithUnfairLock();
    }
    else
    {
      v27 = PLSyncGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Using the restore files from mobile backup", buf, 2u);
      }

      id v28 = v26;
      uint64_t v29 = *(void *)(a1 + 32);
      v100 = _NSConcreteStackBlock;
      uint64_t v101 = 3221225472;
      v102 = sub_D1BC;
      v103 = &unk_24860;
      uint64_t v104 = v29;
      id v64 = v28;
      id v105 = v64;
      PLSafeRunWithUnfairLock();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    v37 = objc_msgSend(v62, "restoreInfo", v61);
    if ([v37 wasCloudRestore])
    {
      v38 = [v37 backupBuildVersion];
      if ([v38 length])
      {
        uint64_t v39 = *(void *)(a1 + 32);
        v94 = _NSConcreteStackBlock;
        uint64_t v95 = 3221225472;
        v96 = sub_D250;
        v97 = &unk_24860;
        uint64_t v98 = v39;
        id v99 = v38;
        PLSafeRunWithUnfairLock();
        id v40 = [objc_alloc((Class)PLBuildVersion) initWithString:v99];
        id v41 = [objc_alloc((Class)PLBuildVersion) initWithString:@"13C1"];
        BOOL v42 = [v40 compareBuildVersion:v41 withPrecision:2] == (id)-1;
      }
      else
      {
        BOOL v42 = 1;
      }
    }
    else
    {
      BOOL v42 = 0;
    }
    uint64_t v43 = *(void *)(a1 + 32);
    v88 = _NSConcreteStackBlock;
    uint64_t v89 = 3221225472;
    v90 = sub_D264;
    v91 = &unk_24AD0;
    uint64_t v92 = v43;
    BOOL v93 = v42;
    PLSafeRunWithUnfairLock();
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = v42;
    [*(id *)(a1 + 32) _writeRestoreContext];
  }
  uint64_t v44 = *(void *)(a1 + 32);
  v71 = _NSConcreteStackBlock;
  uint64_t v72 = 3221225472;
  v73 = sub_D390;
  v74 = &unk_24730;
  uint64_t v75 = v44;
  PLSafeRunWithUnfairLock();
  [*(id *)(a1 + 32) _populateRestorePathGroupsAndUpdateValidatedRestorePaths:v64];
  v45 = [*(id *)(a1 + 32) _getAssetsToRestoreFromPaths:v64];
  [*(id *)(a1 + 32) _sortATAssetsToRestore:v45 withUUIDPathDict:v63];
  [*(id *)(a1 + 32) _prioritizeAssets:v45];
  id v46 = [v45 copy];
  uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
  v48 = *(void **)(v47 + 40);
  *(void *)(v47 + 40) = v46;

  v49 = PLSyncGetLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v50 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v50;
    _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "ATAssets to restore [%d]:", buf, 8u);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v65 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v51 = [v65 countByEnumeratingWithState:&v67 objects:v133 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v68;
    do
    {
      for (j = 0; j != v51; j = (char *)j + 1)
      {
        if (*(void *)v68 != v52) {
          objc_enumerationMutation(v65);
        }
        v54 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
        v55 = PLSyncGetLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = v45;
          if ([v54 isPrioritized]) {
            CFStringRef v57 = @"Priority ";
          }
          else {
            CFStringRef v57 = &stru_24CC0;
          }
          if (objc_msgSend(v54, "isRestore", v61)) {
            CFStringRef v58 = @"Restore";
          }
          else {
            CFStringRef v58 = @"Sync";
          }
          v59 = [v54 dataclass];
          v60 = [v54 path];
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v57;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v58;
          *(_WORD *)&buf[22] = 2114;
          v135 = v59;
          LOWORD(v136) = 2114;
          *(void *)((char *)&v136 + 2) = v60;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "   %{public}@%{public}@ %{public}@ %{public}@", buf, 0x2Au);

          v45 = v56;
        }
      }
      id v51 = [v65 countByEnumeratingWithState:&v67 objects:v133 count:16];
    }
    while (v51);
  }

  _Block_object_dispose(&v124, 8);
}

void sub_CEF4(_Unwind_Exception *a1)
{
}

void sub_CF8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) restoreKeyToAssetGroup];
  id v3 = [v2 count];

  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = [*(id *)(a1 + 40) otaRestoreProgressAlbum];
  if (v3 != (id)(int)[v5 pendingItemsCount]) {
    [v5 setPendingItemsCount:v3];
  }
  if ([v5 pendingItemsType] != v4) {
    [v5 setPendingItemsType:v4];
  }
}

uint64_t sub_D03C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80) != 0;
  return result;
}

void sub_D058(uint64_t a1)
{
  PLCompleteDateFormatter();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[NSDate date];
  id v3 = [v4 stringFromDate:v2];
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v3 forKeyedSubscript:@"kPLSyncRestoreContextBackgroundPhaseStartDateKey"];
}

id sub_D0F0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:@"Database" forKeyedSubscript:@"kPLSyncRestoreContextAssetsSourceKey"];
  id v2 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v2 forKeyedSubscript:@"kPLSyncRestoreContextAssetsCountKey"];

  id result = [*(id *)(*(void *)(a1 + 32) + 80) setObject:&__kCFBooleanTrue forKeyedSubscript:@"kPLSyncRestoreContextUseDatabaseKey"];
  if (*(void *)(a1 + 48))
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    return objc_msgSend(v4, "setObject:forKeyedSubscript:");
  }
  return result;
}

void sub_D1BC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:@"MobileBackup" forKeyedSubscript:@"kPLSyncRestoreContextAssetsSourceKey"];
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v2 forKeyedSubscript:@"kPLSyncRestoreContextAssetsCountKey"];
}

id sub_D250(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"kPLSyncRestoreContextBackupBuildVersion"];
}

void sub_D264(uint64_t a1)
{
  id v3 = +[PLBuildVersion currentBuildVersionString];
  if ([v3 length]) {
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:v3 forKeyedSubscript:@"kPLSyncRestoreContextRestoreBuildVersion"];
  }
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v2 forKeyedSubscript:@"PLSyncRestoreContextFixAddedDatesKey"];
}

uint64_t sub_D308(void *a1)
{
  id v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:@"kPLSyncRestoreContextUseDatabaseKey"];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v2 BOOLValue];

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:@"kPLSyncRestoreContextUseDatabaseUUIDKey"];

  return _objc_release_x1();
}

uint64_t sub_D390(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:@"PLSyncRestoreContextFixAddedDatesKey"];
  if (v2) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = v3;

  return _objc_release_x1();
}

void sub_D4D0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    id v3 = [v2 mutableCopy];
  }
  else
  {
    id v3 = (id)objc_opt_new();
  }
  id v4 = v3;
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(a1 + 48);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v2, "containsObject:", v10, (void)v11) & 1) == 0) {
          [v2 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void sub_D6B4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    id v3 = [v2 count];
    id v4 = PLSyncGetLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        id v6 = "Writing restore context";
LABEL_9:
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else if (v5)
    {
      *(_WORD *)buf = 0;
      id v6 = "Writing empty restore context";
      goto LABEL_9;
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 80);
    id v15 = 0;
    uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:100 options:0 error:&v15];
    uint64_t v10 = v15;
    if (v9)
    {
      long long v11 = [*(id *)(a1 + 32) _pathToRestoreContext];
      long long v14 = v10;
      unsigned __int8 v12 = [v9 writeToFile:v11 options:1073741825 error:&v14];
      id v7 = v14;

      if ((v12 & 1) == 0)
      {
        long long v13 = PLSyncGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          unsigned __int8 v17 = v7;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Failed to write _restoreContext %{public}@", buf, 0xCu);
        }
      }
      +[PLFileUtilities changeFileOwnerToMobileAtPath:v11 error:0];
    }
    else
    {
      long long v11 = PLSyncGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v17 = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Failed to serialize _restoreContext %{public}@", buf, 0xCu);
      }
      id v7 = v10;
    }

    goto LABEL_20;
  }
  id v7 = PLSyncGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to write nil _restoreContext", buf, 2u);
  }
LABEL_20:
}

id sub_D98C(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    id v2 = PLSyncGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Ignoring request to load restore context (already exists)", v11, 2u);
    }
  }
  else
  {
    id v3 = objc_alloc((Class)NSMutableDictionary);
    id v4 = [*(id *)(a1 + 32) _pathToRestoreContext];
    id v2 = [v3 initWithContentsOfFile:v4];

    id v5 = [v2 count];
    id v6 = PLSyncGetLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Loaded restore context", buf, 2u);
      }

      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = v2;
      id v6 = *(NSObject **)(v8 + 80);
      *(void *)(v8 + 80) = v9;
    }
    else if (v7)
    {
      *(_WORD *)unsigned __int8 v12 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Unable to load restore context", v12, 2u);
    }
  }
  return [(id)objc_opt_class() _logRestoreContext:*(void *)(*(void *)(a1 + 32) + 80)];
}

void sub_DB64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;
}

uint64_t sub_DBE8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init((Class)NSMutableDictionary);

  return _objc_release_x1();
}

void sub_DD84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t sub_E298(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:@"kPLSyncRestoreContextRestoredFilesKey"];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 80) objectForKeyedSubscript:@"kPLSyncRestoreContextUnrecoverableFilesKey"];

  return _objc_release_x1();
}

void sub_E40C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[PLManagedAsset assetWithUUID:a2 inLibrary:*(void *)(a1 + 32)];
  id v4 = [v3 filePathsWithoutThumbs];
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
        [*(id *)(a1 + 40) addObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_E538(id a1, ATAsset *a2, unint64_t a3, BOOL *a4)
{
}

void sub_E970(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"path"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"date"];

  long long v9 = [*(id *)(a1 + 32) _restoreGroupKeyFromATAssetFilePath:v7];
  long long v10 = [*(id *)(a1 + 40) objectForKey:v9];
  long long v11 = v10;
  if (v10)
  {
    [v10 setUUID:v5];
    [v11 setDate:v8];
  }
  else
  {
    long long v12 = PLSyncGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to find sync asset group for path: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

uint64_t sub_EAC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 path];
  uint64_t v7 = [v5 path];

  uint64_t v8 = [*(id *)(a1 + 32) _restoreGroupKeyFromATAssetFilePath:v6];
  long long v9 = [*(id *)(a1 + 32) _restoreGroupKeyFromATAssetFilePath:v7];
  long long v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  long long v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  uint64_t v12 = [v10 date];
  uint64_t v13 = [v11 date];
  long long v14 = (void *)v13;
  if (!v12 || !v13)
  {
    if (v12) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = 1;
    }
    if (v12 | v13) {
      goto LABEL_13;
    }
    id v16 = v9;
    unsigned __int8 v17 = v8;
    goto LABEL_11;
  }
  if (v10 == v11)
  {
LABEL_12:
    uint64_t v15 = (uint64_t)[v7 compare:v6];
    goto LABEL_13;
  }
  uint64_t v15 = (uint64_t)[(id)v13 compare:v12];
  if (!v15)
  {
    id v16 = v7;
    unsigned __int8 v17 = v6;
LABEL_11:
    uint64_t v15 = (uint64_t)[v16 compare:v17];
    if (!v15) {
      goto LABEL_12;
    }
  }
LABEL_13:

  return v15;
}

void sub_F050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(PLSyncAssetGroup);
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  [(PLSyncAssetGroup *)v7 setAssetPairs:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v14, (void)v16);
        uint64_t v15 = [[PLSyncFileStatusPair alloc] initWithPath:v14];
        [v8 addObject:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

void sub_F964(uint64_t a1)
{
  uint64_t v2 = PLCompleteDateFormatter();
  uint64_t v3 = +[NSDate date];
  id v4 = [v2 stringFromDate:v3];
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v4 forKeyedSubscript:@"kPLSyncRestoreContextBackgroundPhaseEndDateKey"];

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = [v5 description];
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:v6 forKeyedSubscript:@"kPLSyncRestoreContextResultKey"];

    uint64_t v7 = PLSyncGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v8;
      id v9 = "Photos restore ended with error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:@"SUCCESS" forKeyedSubscript:@"kPLSyncRestoreContextResultKey"];
    uint64_t v7 = PLSyncGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v9 = "Photos restore ended";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 2;
      goto LABEL_6;
    }
  }
}

void sub_FFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_FFDC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:@"kPLSyncRestoreContextUseDatabaseKey"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue] ^ 1;
}

void sub_10148(uint64_t a1)
{
  id v2 = +[NSFetchRequest fetchRequestWithEntityName:@"Album"];
  uint64_t v3 = +[NSPredicate predicateWithFormat:@"((kind = %d) OR (kind = %d)) AND (assets.@count = 0)", 1550, 1551];
  [v2 setPredicate:v3];

  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  long long v17 = v2;
  id v5 = [v4 executeFetchRequest:v2 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        os_log_type_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint32_t v12 = PLSyncGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v11 uuid];
          uint64_t v14 = [v11 objectID];
          uint64_t v15 = [v11 title];
          *(_DWORD *)buf = 138543874;
          v23 = v13;
          __int16 v24 = 2114;
          v25 = v14;
          __int16 v26 = 2112;
          v27 = v15;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Deleting empty sync album %{public}@ %{public}@ %@", buf, 0x20u);
        }
        [v11 delete];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
  }

  long long v16 = PLSyncGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "_clearEmptySyncAlbums completed", buf, 2u);
  }
}

void sub_10488(uint64_t a1)
{
  id v2 = PLSyncGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 121)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v21 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "_clearPendingCounts: _syncRequested=%@", buf, 0xCu);
  }

  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[121])
  {
    id v5 = [v4 _onDeviceAlbumsByUUID];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = objc_msgSend(v5, "allKeys", 0);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          os_log_type_t v11 = [v5 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10)];
          if ([v11 pendingItemsType] != 1
            || [v11 pendingItemsCount])
          {
            [v11 setPendingItemsType:1];
            [v11 setPendingItemsCount:0];
          }

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint32_t v12 = [*(id *)(a1 + 40) syncProgressAlbum];
    [v12 setPendingItemsType:1];

    int v13 = [*(id *)(a1 + 40) syncProgressAlbum];
    [v13 setPendingItemsCount:0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) otaRestoreProgressAlbum];
    if ([v5 pendingItemsType] != 1 || objc_msgSend(v5, "pendingItemsCount"))
    {
      [v5 setPendingItemsType:1];
      [v5 setPendingItemsCount:0];
    }
  }

  uint64_t v14 = PLSyncGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "_clearPendingCounts completed", buf, 2u);
  }
}

void sub_1177C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_11794(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id v8 = [v7 albumSubclass];
    unsigned int v9 = [v8 intValue];

    if (v9 == 5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
      *a4 = 1;
    }
  }

  return _objc_release_x1();
}

void sub_11A78(uint64_t a1)
{
  id v2 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(*(void *)(a1 + 32) + 136) count]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 136);
  id v4 = [v3 countByEnumeratingWithState:&v62 objects:v81 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v63;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v62 + 1) + 8 * i) identifier];
        [v2 addObject:v8];
        if ([v8 length])
        {
          unsigned int v9 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v8];
          id v10 = [v9 eventUUID];
          if ([v10 length])
          {
            id v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v10];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [*(id *)(a1 + 32) _incrementPendingCountForContainerUUID:v10];
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v62 objects:v81 count:16];
    }
    while (v5);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  id v12 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v59;
    do
    {
      long long v15 = 0;
      id v46 = v13;
      do
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8 * (void)v15);
        long long v17 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v18 = [v17 assetUUIDs];
          id v19 = [v18 countByEnumeratingWithState:&v54 objects:v79 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v55;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v55 != v21) {
                  objc_enumerationMutation(v18);
                }
                if ([v2 containsObject:*(void *)(*((void *)&v54 + 1) + 8 * (void)j)])objc_msgSend(*(id *)(a1 + 32), "_incrementPendingCountForContainerUUID:", v16); {
              }
                }
              id v20 = [v18 countByEnumeratingWithState:&v54 objects:v79 count:16];
            }
            while (v20);
          }

          id v13 = v46;
        }

        long long v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v58 objects:v80 count:16];
    }
    while (v13);
  }

  uint64_t v47 = [*(id *)(a1 + 32) _onDeviceAlbumsByUUID];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v42 = [*(id *)(*(void *)(a1 + 32) + 112) allKeys];
  id obja = [v42 countByEnumeratingWithState:&v50 objects:v78 count:16];
  if (obja)
  {
    uint64_t v24 = *(void *)v51;
    *(void *)&long long v23 = 134217984;
    long long v40 = v23;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (k = 0; k != obja; k = (char *)k + 1)
      {
        if (*(void *)v51 != v24) {
          objc_enumerationMutation(v42);
        }
        __int16 v26 = *(const void **)(*((void *)&v50 + 1) + 8 * (void)k);
        v27 = objc_msgSend(v47, "objectForKey:", v26, v40);
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 112), v26);
        if (Value)
        {
          uint64_t v29 = Value;
          v30 = PLSyncGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v45 = [v27 localizedTitle];
            v31 = objc_opt_class();
            id v44 = v31;
            unsigned int v32 = [v27 _kindDescription];
            v33 = [v27 uuid];
            uint64_t v43 = (int)[v27 pendingItemsCount];
            v34 = [v27 shortObjectIDURI];
            *(_DWORD *)buf = 138413570;
            long long v67 = v45;
            __int16 v68 = 2114;
            long long v69 = v31;
            uint64_t v24 = v41;
            __int16 v70 = 2114;
            v71 = v32;
            __int16 v72 = 2114;
            v73 = v33;
            __int16 v74 = 2048;
            uint64_t v75 = v43;
            __int16 v76 = 2114;
            v77 = v34;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Album: %@ (%{public}@,%{public}@) id=%{public}@ pendingItemsCount=%lu CD_ID=%{public}@", buf, 0x3Eu);
          }
          id v35 = PLSyncGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v40;
            long long v67 = v29;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "     Setting pendingItemsCount to be %lu", buf, 0xCu);
          }

          uint64_t v36 = 2;
          goto LABEL_46;
        }
        if ([v27 pendingItemsType] != 1
          || [v27 pendingItemsCount])
        {
          uint64_t v29 = 0;
          uint64_t v36 = 1;
LABEL_46:
          [v27 setPendingItemsCount:v29];
          [v27 setPendingItemsType:v36];
        }
      }
      id obja = [v42 countByEnumeratingWithState:&v50 objects:v78 count:16];
    }
    while (obja);
  }

  v37 = [*(id *)(a1 + 40) syncProgressAlbum];
  v38 = [*(id *)(a1 + 32) outstandingAssets];
  objc_msgSend(v37, "setPendingItemsCount:", objc_msgSend(v38, "count"));

  uint64_t v39 = [*(id *)(a1 + 40) syncProgressAlbum];
  [v39 setPendingItemsType:2];
}

void sub_1236C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    unsigned int v9 = [v8 uuid];
    if (v9)
    {
      id v10 = [v8 assetUUIDs];
      +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_124BC;
      v12[3] = &unk_248D8;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v13;
      [v10 enumerateObjectsUsingBlock:v12];
      [*(id *)(a1 + 32) setObject:v11 forKey:v9];
    }
  }
}

void sub_124BC(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [v4 setObject:v6 forKey:v5];
}

void sub_125D0(uint64_t a1)
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
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "setSyncEventOrderKey:", (char *)v6 + v4, (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v3 != v6);
      v4 += (uint64_t)v6;
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void sub_12AC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 kind];
  unsigned int v6 = [v5 intValue];

  if (v6 != 15)
  {
    if (v6 == 1551)
    {
      id v11 = [*(id *)(a1 + 56) indexOfObject:v4];
      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        long long v8 = PLSyncGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v16 = 138412290;
          id v17 = v4;
          long long v9 = "===== ERROR ===== Didn't find Event %@ in event list";
          goto LABEL_13;
        }
        goto LABEL_17;
      }
      id v14 = v11;
      [*(id *)(a1 + 64) addObject:v4];
      long long v15 = *(void **)(a1 + 72);
    }
    else
    {
      if (v6 != 1550)
      {
        long long v8 = PLSyncGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v4;
          long long v9 = "_reconcileDeviceAlbumListSortingWithAlbums found an album of an unexpected kind %@";
          id v12 = v8;
          os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      id v7 = [*(id *)(a1 + 32) indexOfObject:v4];
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        long long v8 = PLSyncGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v16 = 138412290;
          id v17 = v4;
          long long v9 = "===== ERROR ===== Didn't find Album %@ in album list";
LABEL_13:
          id v12 = v8;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_16:
          _os_log_impl(&dword_0, v12, v13, v9, (uint8_t *)&v16, 0xCu);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      id v14 = v7;
      [*(id *)(a1 + 40) addObject:v4];
      long long v15 = *(void **)(a1 + 48);
    }
LABEL_21:
    [v15 addIndex:v14];
    goto LABEL_22;
  }
  id v10 = [*(id *)(a1 + 80) indexOfObject:v4];
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = v10;
    [*(id *)(a1 + 88) addObject:v4];
    long long v15 = *(void **)(a1 + 96);
    goto LABEL_21;
  }
  long long v8 = PLSyncGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = v4;
    long long v9 = "===== ERROR ===== Didn't find Face album %@ in face album list";
    goto LABEL_13;
  }
LABEL_17:

LABEL_22:
}

void sub_12D10(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned int v6 = [v5 uuid];

  [v4 setObject:v7 forKey:v6];
}

id sub_12DA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = [a2 uuid];
  id v7 = [*(id *)(a1 + 32) objectForKey:v6];
  long long v8 = [v5 uuid];

  long long v9 = [*(id *)(a1 + 32) objectForKey:v8];
  id v10 = [v7 compare:v9];

  return v10;
}

void sub_13124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_13154(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = [v9 uuid];
  if (v5)
  {
    unsigned int v6 = *(void **)(a1 + 32);
    id v7 = +[NSNumber numberWithUnsignedInteger:a3];
    long long v8 = [v9 uuid];
    [v6 setObject:v7 forKey:v8];
  }
}

void sub_131FC(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  id v4 = [v9 uuid];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) objectForKey:v4];
    unsigned int v6 = v5;
    if (v5 && (int)[v5 intValue] != a2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v7 = *(void **)(a1 + 40);
      long long v8 = +[NSNumber numberWithUnsignedInteger:a2];
      [v7 setObject:v8 forKey:v4];
    }
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

id sub_13300(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = [a2 uuid];
  id v7 = [*(id *)(a1 + 32) objectForKey:v6];
  long long v8 = [v5 uuid];

  id v9 = [*(id *)(a1 + 32) objectForKey:v8];
  id v10 = [v7 compare:v9];

  return v10;
}

void sub_13524(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKey:v4];
}

void sub_1361C(uint64_t a1)
{
  id v1 = PLSyncGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Starting album reconciliation", buf, 2u);
  }

  id v2 = [*(id *)(a1 + 32) _onDeviceAlbumsByUUID];
  id v3 = [v2 allKeys];
  id v4 = +[NSMutableSet setWithArray:v3];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  unsigned int v6 = +[NSSet setWithArray:v5];

  id v7 = PLSyncGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    id v93 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Syncing %ld albums from iTunes", buf, 0xCu);
  }

  id v9 = [v4 mutableCopy];
  unsigned __int8 v59 = [*(id *)(a1 + 32) isResync];
  if ((v59 & 1) == 0) {
    [v9 minusSet:v6];
  }
  long long v58 = v6;
  long long v61 = v4;
  id v10 = PLSyncGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    id v93 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Deleting %ld previously synced, stale albums from iTunes", buf, 0xCu);
  }

  id v12 = [*(id *)(a1 + 32) pathManager];
  long long v63 = [v12 iTunesSyncedFaceAlbumThumbnailsDirectory];

  os_log_type_t v13 = +[NSMutableArray array];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
  long long v62 = v13;
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v88;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v88 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v87 + 1) + 8 * i);
        id v19 = [v2 objectForKey:v18];
        id v20 = [v19 objectID];
        [v13 addObject:v20];

        uint64_t v21 = PLSyncGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v19 uuid];
          unsigned int v23 = [v19 kindValue];
          *(_DWORD *)buf = 138543618;
          id v93 = v22;
          __int16 v94 = 1024;
          LODWORD(v95) = v23;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Preparing to delete album: %{public}@, kind: %d", buf, 0x12u);
        }
        if ([v19 kindValue] == 15)
        {
          uint64_t v24 = [v63 stringByAppendingPathComponent:v18];
          v25 = [v24 stringByAppendingPathExtension:@"JPG"];

          __int16 v26 = +[NSFileManager defaultManager];
          id v86 = 0;
          unsigned __int8 v27 = [v26 removeItemAtPath:v25 error:&v86];
          id v28 = v86;

          if ((v27 & 1) == 0)
          {
            uint64_t v29 = PLUnderlyingPOSIXError();
            v30 = (char *)[v29 code];

            if (v30 != (unsigned char *)&dword_0 + 2)
            {
              v31 = PLSyncGetLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v93 = v25;
                __int16 v94 = 2114;
                id v95 = v28;
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Could not remove face thumbnail at path %{public}@ Error: %{public}@", buf, 0x16u);
              }
            }
          }

          os_log_type_t v13 = v62;
        }
        [v2 removeObjectForKey:v18];
      }
      id v15 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
    }
    while (v15);
  }

  if ([v13 count])
  {
    unsigned int v32 = +[NSPredicate predicateWithFormat:@"self IN %@", v13];
    v33 = [*(id *)(a1 + 40) managedObjectContext];
    v34 = +[PLGenericAlbum entityInManagedObjectContext:v33];

    id v35 = *(void **)(a1 + 40);
    id v85 = 0;
    unsigned __int8 v36 = [v35 batchDeleteObjectsWithEntity:v34 predicate:v32 error:&v85];
    id v37 = v85;
    if ((v36 & 1) == 0)
    {
      v38 = PLSyncGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v93 = obj;
        __int16 v94 = 2114;
        id v95 = v37;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "Failed to delete albums %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
  [v61 minusSet:obj];
  uint64_t v39 = *(void **)(a1 + 40);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_13EB0;
  v78[3] = &unk_24888;
  id v40 = v58;
  id v79 = v40;
  unsigned __int8 v84 = v59;
  id v41 = v61;
  uint64_t v42 = *(void *)(a1 + 32);
  uint64_t v43 = *(void **)(a1 + 40);
  id v80 = v41;
  uint64_t v81 = v42;
  id v82 = v43;
  id v44 = v2;
  id v83 = v44;
  [v39 performTransactionAndWait:v78];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_141D4;
  v75[3] = &unk_248B0;
  v45 = *(void **)(a1 + 40);
  v75[4] = *(void *)(a1 + 32);
  id v46 = v44;
  id v76 = v46;
  id v77 = *(id *)(a1 + 40);
  [v45 performTransactionAndWait:v75];
  if ((v59 & 1) == 0)
  {
    id v47 = [v41 mutableCopy];
    id v66 = v40;
    [v47 intersectSet:v40];
    v48 = PLSyncGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = [v47 count];
      *(_DWORD *)buf = 134217984;
      id v93 = v49;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Updating (if necessary) %ld albums from iTunes", buf, 0xCu);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v50 = v47;
    id v51 = [v50 countByEnumeratingWithState:&v71 objects:v91 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v72;
      do
      {
        for (j = 0; j != v52; j = (char *)j + 1)
        {
          if (*(void *)v72 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v71 + 1) + 8 * (void)j);
          long long v56 = *(void **)(a1 + 40);
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_14248;
          v67[3] = &unk_248B0;
          id v68 = v46;
          uint64_t v69 = v55;
          uint64_t v70 = *(void *)(a1 + 32);
          [v56 performTransactionAndWait:v67];
        }
        id v52 = [v50 countByEnumeratingWithState:&v71 objects:v91 count:16];
      }
      while (v52);
    }

    os_log_type_t v13 = v62;
    id v40 = v66;
  }
}

void sub_13EB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableCopy];
  id v3 = v2;
  if (!*(unsigned char *)(a1 + 72)) {
    [v2 minusSet:*(void *)(a1 + 40)];
  }
  id v4 = PLSyncGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [v3 count];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding %ld albums from iTunes", buf, 0xCu);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138412802;
    long long v25 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * i), v25, (void)v26);
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            os_log_type_t v13 = [v12 albumSubclass];
            unsigned int v14 = [v13 intValue];

            if (v14 == 4) {
              unsigned int v15 = 1551;
            }
            else {
              unsigned int v15 = 1550;
            }
            if (v14 == 3) {
              uint64_t v16 = 15;
            }
            else {
              uint64_t v16 = v15;
            }
            id v17 = [v12 name];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = [v11 name];
            }
            else
            {
              id v17 = 0;
            }
            uint64_t v16 = 1551;
          }
          uint64_t v18 = PLSyncGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v11 uuid];
            *(_DWORD *)buf = v25;
            id v31 = v17;
            __int16 v32 = 2114;
            v33 = v19;
            __int16 v34 = 1024;
            int v35 = v16;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Creating managed album with name \"%@\", uuid: %{public}@, kind: %d", buf, 0x1Cu);
          }
          id v20 = *(void **)(a1 + 48);
          uint64_t v21 = [v11 uuid];
          uint64_t v22 = [v20 _addAlbumNamed:v17 uuid:v21 kindValue:v16 inLibrary:*(void *)(a1 + 56)];

          if (v22)
          {
            unsigned int v23 = *(void **)(a1 + 64);
            uint64_t v24 = [v22 uuid];
            [v23 setObject:v22 forKey:v24];
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v8);
  }
}

void sub_141D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryChangeSnapshot];
  id v3 = [v2 orderedAlbums];

  [*(id *)(a1 + 32) _reconcileDeviceAlbumListSortingWithAlbums:*(void *)(a1 + 40) iTunesAlbumOrder:v3 inLibrary:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistAssetAlbumOrderStructures];
}

void sub_14248(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKey:*(void *)(a1 + 40)];
    if ([v3 conformsToProtocol:&OBJC_PROTOCOL___PLSNamedItem])
    {
      id v4 = [v3 name];
      id v5 = [v2 title];
      unsigned __int8 v6 = [v4 isEqualToString:v5];

      if ((v6 & 1) == 0)
      {
        long long v7 = PLSyncGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 138412546;
          uint64_t v9 = v2;
          __int16 v10 = 2112;
          id v11 = v4;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Updating album %@ to have title %@", (uint8_t *)&v8, 0x16u);
        }

        [v2 setTitle:v4];
      }
    }
    [v2 sortAssetsUsingiTunesAlbumOrder];
  }
}

void sub_14630(uint64_t a1)
{
  unsigned int v137 = [*(id *)(a1 + 32) isResync];
  id v1 = PLSyncGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v2 = @"sync";
    if (v137) {
      CFStringRef v2 = @"resync";
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v2;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Starting reconcile assets (%{public}@)", buf, 0xCu);
  }

  v139 = [*(id *)(a1 + 32) _onDeviceAlbumsByUUID];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 152) allKeys];
  uint64_t v119 = +[NSSet setWithArray:v3];

  id v4 = PLSyncGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v119 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Syncing %ld assets from iTunes", buf, 0xCu);
  }

  long long v7 = +[PLAssetTransactionReason transactionReason:@"[_reconcileAssets] Deleting assets that are not being synced from iTunes."];
  if ((v137 & 1) != 0 || ![v119 count])
  {
    int v8 = 0;
  }
  else
  {
    int v8 = +[NSPredicate predicateWithFormat:@"NOT (uuid IN %@)", v119];
  }
  [*(id *)(a1 + 32) _batchDeleteSyncedAssetsWithReason:v7 subpredicate:v8];

  uint64_t v124 = [*(id *)(a1 + 32) _onDeviceAssetsByUUIDInLibrary:*(void *)(a1 + 40)];
  uint64_t v9 = [v124 allKeys];
  v118 = +[NSMutableSet setWithArray:v9];

  id v10 = [v119 mutableCopy];
  id v11 = v10;
  if ((v137 & 1) == 0) {
    [v10 minusSet:v118];
  }
  id v12 = PLSyncGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v11 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Adding %ld new assets from iTunes", buf, 0xCu);
  }

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v174 objects:v191 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v175;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v175 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v174 + 1) + 8 * i);
        id v19 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v18];
        id v20 = [v19 caption];
        uint64_t v21 = +[ATAsset downloadAssetWithIdentifier:v18 dataclass:@"Photo" prettyName:v20];

        if ([v19 hasVideoComplement]) {
          [v21 setVariantOptions:&off_25C78];
        }
        uint64_t v22 = PLSyncGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = [v21 path];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Downloading synced asset %{public}@ %{public}@", buf, 0x16u);
        }
        [*(id *)(*(void *)(a1 + 32) + 136) addObject:v21];
      }
      id v15 = [v14 countByEnumeratingWithState:&v174 objects:v191 count:16];
    }
    while (v15);
  }

  if ((v137 & 1) == 0)
  {
    id v24 = [v118 mutableCopy];
    [v24 intersectSet:v119];
    long long v25 = PLSyncGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v24 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Updating (if changed) %ld assets from iTunes", buf, 0xCu);
    }

    long long v27 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v24 count]);
    long long v172 = 0u;
    long long v173 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    id v28 = v24;
    id v29 = [v28 countByEnumeratingWithState:&v170 objects:v190 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v171;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v171 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v170 + 1) + 8 * (void)j);
          v33 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v32];
          __int16 v34 = [v33 eventUUID];

          if (v34)
          {
            int v35 = [v33 eventUUID];
            unsigned __int8 v36 = +[NSMutableSet setWithObject:v35];
          }
          else
          {
            unsigned __int8 v36 = +[NSMutableSet set];
          }
          [v27 setObject:v36 forKey:v32];
        }
        id v29 = [v28 countByEnumeratingWithState:&v170 objects:v190 count:16];
      }
      while (v29);
    }

    id v37 = *(void **)(*(void *)(a1 + 32) + 24);
    v168[0] = _NSConcreteStackBlock;
    v168[1] = 3221225472;
    v168[2] = sub_159E4;
    v168[3] = &unk_24810;
    id v120 = v27;
    id v169 = v120;
    [v37 enumerateKeysAndObjectsUsingBlock:v168];
    uint64_t v122 = +[NSMutableArray array];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id obj = v28;
    id v125 = [obj countByEnumeratingWithState:&v164 objects:v189 count:16];
    if (v125)
    {
      uint64_t v123 = *(void *)v165;
      CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v165 != v123)
          {
            uint64_t v40 = v39;
            objc_enumerationMutation(obj);
            uint64_t v39 = v40;
          }
          uint64_t v129 = v39;
          uint64_t v134 = *(void *)(*((void *)&v164 + 1) + 8 * v39);
          id v41 = objc_msgSend(v124, "objectForKey:");
          id v132 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v134];
          uint64_t v42 = [v132 modificationDate];
          [v42 doubleValue];
          long long v130 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v43 - kCFAbsoluteTimeIntervalSince1904];

          id v44 = [v41 modificationDate];
          BOOL v45 = [v130 compare:v44] == 0;

          if (v45)
          {
            long long v131 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:v134];
            [v131 doubleValue];
            double v53 = v52;
            [v41 sortToken];
            if (v131 && vabdd_f64(v54, v53) >= 2.22044605e-16) {
              [v41 setSortToken:v53];
            }
            char v127 = [v132 latitude];
            uint64_t v126 = [v132 longitude];
            double v55 = longitude;
            double latitude = kCLLocationCoordinate2DInvalid.latitude;
            if (v127)
            {
              double v55 = longitude;
              double latitude = kCLLocationCoordinate2DInvalid.latitude;
              if (v126)
              {
                [v127 doubleValue];
                CLLocationDegrees v58 = v57;
                [v126 doubleValue];
                CLLocationCoordinate2D v60 = CLLocationCoordinate2DMake(v58, v59);
                double latitude = v60.latitude;
                double v55 = v60.longitude;
              }
            }
            if (objc_msgSend(v41, "isLocatedAtCoordinates:", latitude, v55))
            {
              long long v61 = PLSyncGetLog();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEBUG, "onDeviceAsset was already located at coords!", buf, 2u);
              }
            }
            else if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:", latitude, v55))
            {
              id v62 = [objc_alloc((Class)CLLocation) initWithLatitude:latitude longitude:v55];
              long long v63 = PLSyncGetLog();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v62;
                _os_log_impl(&dword_0, v63, OS_LOG_TYPE_DEFAULT, "Updating onDeviceAsset for its new location: %@", buf, 0xCu);
              }

              [v41 setLocation:v62];
            }
            else
            {
              long long v64 = PLSyncGetLog();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v134;
                _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "Removing location for asset %{public}@", buf, 0xCu);
              }

              [v41 setLocation:0];
            }
            long long v65 = [v132 getFacesArray];
            id v66 = [v65 mutableCopy];

            v138 = +[NSMutableIndexSet indexSet];
            long long v162 = 0u;
            long long v163 = 0u;
            long long v160 = 0u;
            long long v161 = 0u;
            long long v67 = [v41 legacyFaces];
            id v68 = [v67 countByEnumeratingWithState:&v160 objects:v188 count:16];
            if (v68)
            {
              uint64_t v69 = *(void *)v161;
              do
              {
                for (k = 0; k != v68; k = (char *)k + 1)
                {
                  if (*(void *)v161 != v69) {
                    objc_enumerationMutation(v67);
                  }
                  long long v71 = *(void **)(*((void *)&v160 + 1) + 8 * (void)k);
                  *(void *)buf = 0;
                  *(void *)&uint8_t buf[8] = buf;
                  *(void *)&uint8_t buf[16] = 0x2020000000;
                  LOBYTE(v180) = 0;
                  unsigned int v72 = [v71 identifier];
                  v156[0] = _NSConcreteStackBlock;
                  v156[1] = 3221225472;
                  v156[2] = sub_15B38;
                  v156[3] = &unk_24838;
                  __int16 v159 = v72;
                  v158 = buf;
                  v156[4] = v71;
                  id v157 = v138;
                  [v66 enumerateObjectsUsingBlock:v156];
                  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
                  {
                    long long v73 = PLSyncGetLog();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v186 = 67109120;
                      unsigned int v187 = v72;
                      _os_log_impl(&dword_0, v73, OS_LOG_TYPE_DEFAULT, "Deleting face with index: %d", v186, 8u);
                    }

                    [v71 delete];
                  }

                  _Block_object_dispose(buf, 8);
                }
                id v68 = [v67 countByEnumeratingWithState:&v160 objects:v188 count:16];
              }
              while (v68);
            }

            [v66 removeObjectsAtIndexes:v138];
            long long v154 = 0u;
            long long v155 = 0u;
            long long v152 = 0u;
            long long v153 = 0u;
            id v135 = v66;
            id v74 = [v135 countByEnumeratingWithState:&v152 objects:v185 count:16];
            if (v74)
            {
              uint64_t v75 = *(void *)v153;
              do
              {
                for (m = 0; m != v74; m = (char *)m + 1)
                {
                  if (*(void *)v153 != v75) {
                    objc_enumerationMutation(v135);
                  }
                  id v77 = *(void **)(*((void *)&v152 + 1) + 8 * (void)m);
                  uint64_t v78 = PLSyncGetLog();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v79 = [v77 identifier];
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v79;
                    _os_log_impl(&dword_0, v78, OS_LOG_TYPE_DEFAULT, "adding face: %d", buf, 8u);
                  }

                  [v77 relativeRect];
                  double v81 = v80;
                  double v83 = v82;
                  double v85 = v84;
                  double v87 = v86;
                  id v88 = [v77 identifier];
                  long long v89 = [v77 albumUUID];
                  id v90 = objc_msgSend(v41, "addLegacyFaceWithRelativeRect:identifier:albumUUID:", v88, v89, v81, v83, v85, v87);
                }
                id v74 = [v135 countByEnumeratingWithState:&v152 objects:v185 count:16];
              }
              while (v74);
            }

            v91 = [v41 albums];
            uint64_t v92 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v91 count]);

            long long v150 = 0u;
            long long v151 = 0u;
            long long v148 = 0u;
            long long v149 = 0u;
            id v93 = [v41 albums];
            id v94 = [v93 countByEnumeratingWithState:&v148 objects:v184 count:16];
            if (v94)
            {
              uint64_t v95 = *(void *)v149;
              do
              {
                for (n = 0; n != v94; n = (char *)n + 1)
                {
                  if (*(void *)v149 != v95) {
                    objc_enumerationMutation(v93);
                  }
                  v97 = [*(id *)(*((void *)&v148 + 1) + 8 * (void)n) uuid];
                  [v92 addObject:v97];
                }
                id v94 = [v93 countByEnumeratingWithState:&v148 objects:v184 count:16];
              }
              while (v94);
            }

            long long v128 = [v120 objectForKey:v134];
            id v98 = [v92 mutableCopy];
            [v98 minusSet:v128];
            long long v146 = 0u;
            long long v147 = 0u;
            long long v144 = 0u;
            long long v145 = 0u;
            id v99 = v98;
            id v100 = [v99 countByEnumeratingWithState:&v144 objects:v183 count:16];
            if (v100)
            {
              uint64_t v101 = *(void *)v145;
              do
              {
                for (ii = 0; ii != v100; ii = (char *)ii + 1)
                {
                  if (*(void *)v145 != v101) {
                    objc_enumerationMutation(v99);
                  }
                  uint64_t v103 = *(void *)(*((void *)&v144 + 1) + 8 * (void)ii);
                  uint64_t v104 = [v139 objectForKey:v103];
                  if (([v104 isDeleted] & 1) == 0)
                  {
                    id v105 = [v104 mutableAssets];
                    [v105 removeObject:v41];
                    v106 = PLSyncGetLog();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      *(void *)&uint8_t buf[4] = v41;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v134;
                      *(_WORD *)&buf[22] = 2112;
                      v180 = v104;
                      __int16 v181 = 2114;
                      uint64_t v182 = v103;
                      _os_log_impl(&dword_0, v106, OS_LOG_TYPE_DEFAULT, "Asset %@ %{public}@ removed from album %@ %{public}@", buf, 0x2Au);
                    }
                  }
                }
                id v100 = [v99 countByEnumeratingWithState:&v144 objects:v183 count:16];
              }
              while (v100);
            }

            id v107 = [v128 mutableCopy];
            [v107 minusSet:v92];
            long long v142 = 0u;
            long long v143 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            id v108 = v107;
            id v109 = [v108 countByEnumeratingWithState:&v140 objects:v178 count:16];
            if (v109)
            {
              uint64_t v110 = *(void *)v141;
              do
              {
                for (jj = 0; jj != v109; jj = (char *)jj + 1)
                {
                  if (*(void *)v141 != v110) {
                    objc_enumerationMutation(v108);
                  }
                  uint64_t v112 = *(void *)(*((void *)&v140 + 1) + 8 * (void)jj);
                  v113 = [v139 objectForKey:v112];
                  if (([v113 isDeleted] & 1) == 0)
                  {
                    [v113 addAssetUsingiTunesAlbumOrder:v41];
                    uint64_t v114 = PLSyncGetLog();
                    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      *(void *)&uint8_t buf[4] = v41;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v134;
                      *(_WORD *)&buf[22] = 2112;
                      v180 = v113;
                      __int16 v181 = 2114;
                      uint64_t v182 = v112;
                      _os_log_impl(&dword_0, v114, OS_LOG_TYPE_DEFAULT, "Asset %@ %{public}@ added to album %@ %{public}@", buf, 0x2Au);
                    }
                  }
                }
                id v109 = [v108 countByEnumeratingWithState:&v140 objects:v178 count:16];
              }
              while (v109);
            }
          }
          else
          {
            id v46 = PLSyncGetLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              id v47 = [v41 uuid];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v47;
              _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Deleting stale asset: %{public}@", buf, 0xCu);
            }
            v48 = [v41 objectID];
            [v122 addObject:v48];

            id v49 = PLSyncGetLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v134;
              _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "=========== ASSET %{public}@ HAS CHANGED, RE-REQUESTING DOWNLOAD", buf, 0xCu);
            }

            id v50 = [v132 caption];
            long long v131 = +[ATAsset downloadAssetWithIdentifier:v134 dataclass:@"Photo" prettyName:v50];

            if ([v132 hasVideoComplement]) {
              [v131 setVariantOptions:&off_25CA0];
            }
            id v51 = PLSyncGetLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v131;
              _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "Download request for asset: %@", buf, 0xCu);
            }

            [*(id *)(*(void *)(a1 + 32) + 136) addObject:v131];
          }

          uint64_t v39 = v129 + 1;
        }
        while ((id)(v129 + 1) != v125);
        id v125 = [obj countByEnumeratingWithState:&v164 objects:v189 count:16];
      }
      while (v125);
    }

    if ([v122 count])
    {
      v115 = +[PLAssetTransactionReason transactionReason:@"[_reconcileAssets] Based on the asset date, it is stale.  Deleting"];
      v116 = +[NSPredicate predicateWithFormat:@"SELF in %@", v122];
      [*(id *)(a1 + 32) _batchDeleteSyncedAssetsWithReason:v115 subpredicate:v116];
    }
  }
}

void sub_159C0(_Unwind_Exception *a1)
{
}

void sub_159E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v7 = objc_msgSend(v6, "assetUUIDs", 0);
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
          [v12 addObject:v5];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

void sub_15B38(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  if (*(unsigned __int16 *)(a1 + 56) == (unsigned __int16)[v19 identifier])
  {
    [*(id *)(a1 + 32) relativeRect];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v19 relativeRect];
    v22.origin.x = v15;
    v22.origin.y = v16;
    v22.size.width = v17;
    v22.size.height = v18;
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectEqualToRect(v21, v22);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 40) addIndex:a3];
      *a4 = 1;
    }
  }
}

void sub_15E44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uuid];
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v3 forKey:v4];
  }
  else
  {
    id v5 = PLSyncGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v3 directory];
      double v7 = [v3 filename];
      CGFloat v8 = [v3 objectID];
      int v9 = 138543874;
      CGFloat v10 = v6;
      __int16 v11 = 2114;
      CGFloat v12 = v7;
      __int16 v13 = 2114;
      CGFloat v14 = v8;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Synced asset has nil UUID %{public}@/%{public}@ %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void sub_16788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_167C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PLSyncGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "prepareForSyncWithHostAnchor: %{public}@ - error waiting for cleanup in assetsd: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_16A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_16A18(void *a1)
{
  if (+[PLPhotoLibrary systemPhotoLibraryIsObtainable])
  {
    CFStringRef v2 = (void *)a1[4];
    id v3 = [v2 pathManager];
    id v4 = [v3 libraryURL];
    id v58 = 0;
    uint64_t v5 = [v2 _metricsForLibraryAtURL:v4 error:&v58];
    int v6 = v58;

    uint64_t v7 = PLSyncGetLog();
    __int16 v8 = v7;
    if (!v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v62 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to load system photo library for asset metrics: %{public}@", buf, 0xCu);
      }
      goto LABEL_38;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v62 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "system photo library metrics: %{public}@", buf, 0xCu);
    }

    id v9 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:3];
    CGFloat v10 = (void *)a1[4];
    double v57 = v6;
    __int16 v8 = [v10 _metricsForLibraryAtURL:v9 error:&v57];
    __int16 v11 = v57;

    CGFloat v12 = PLSyncGetLog();
    __int16 v13 = v12;
    id v37 = a1;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v62 = v8;
        CGFloat v14 = "syndication photo library metrics: %{public}@";
        CGFloat v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_0, v15, v16, v14, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v62 = v11;
      CGFloat v14 = "Failed to load syndication photo library for asset metrics: %{public}@";
      CGFloat v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
    unsigned __int8 v36 = v11;

    id v40 = objc_alloc_init((Class)NSMutableDictionary);
    id v17 = objc_alloc_init((Class)NSMutableSet);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v38 = v5;
    id obj = v5;
    id v41 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v41)
    {
      uint64_t v39 = *(void *)v54;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = v18;
          uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8 * v18);
          [v17 addObject:v19];
          id v20 = [obj objectForKeyedSubscript:v19];
          id v47 = objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v45 = v19;
          objc_msgSend(v40, "setObject:forKeyedSubscript:");
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v43 = v20;
          id v48 = [v43 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v48)
          {
            uint64_t v44 = *(void *)v50;
            do
            {
              for (i = 0; i != v48; i = (char *)i + 1)
              {
                if (*(void *)v50 != v44) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                [v17 addObject:v22];
                unsigned int v23 = [obj objectForKeyedSubscript:v45];
                id v24 = [v23 objectForKeyedSubscript:v22];
                long long v25 = (char *)[v24 unsignedIntegerValue];
                id v26 = [v8 objectForKeyedSubscript:v45];
                [v26 objectForKeyedSubscript:v22];
                id v28 = v27 = v8;
                id v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v25[(void)[v28 unsignedIntegerValue]]);
                [v47 setObject:v29 forKeyedSubscript:v22];

                __int16 v8 = v27;
              }
              id v48 = [v43 countByEnumeratingWithState:&v49 objects:v59 count:16];
            }
            while (v48);
          }

          uint64_t v18 = v42 + 1;
        }
        while ((id)(v42 + 1) != v41);
        id v41 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v41);
    }

    objc_storeStrong((id *)(*(void *)(v37[5] + 8) + 40), v40);
    uint64_t v30 = PLSyncGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = *(NSObject **)(*(void *)(v37[5] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      id v62 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Installed Asset Metrics (Photos): %{public}@", buf, 0xCu);
    }

    uint64_t v5 = v38;
    if (([v17 containsObject:@"Photo"] & 1) == 0)
    {
      uint64_t v32 = +[NSAssertionHandler currentHandler];
      [v32 handleFailureInMethod:v37[6], v37[4], @"PLSyncClient.m", 439, @"Invalid parameter not satisfying: %@", @"[foundKeys containsObject:kATAssetTypePhoto]" object file lineNumber description];
    }
    if (([v17 containsObject:@"CameraRoll"] & 1) == 0)
    {
      v33 = +[NSAssertionHandler currentHandler];
      [v33 handleFailureInMethod:v37[6], v37[4], @"PLSyncClient.m", 440, @"Invalid parameter not satisfying: %@", @"[foundKeys containsObject:kATAssetTypeCameraRoll]" object file lineNumber description];
    }
    if (([v17 containsObject:@"_PhysicalSize"] & 1) == 0)
    {
      __int16 v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:v37[6], v37[4], @"PLSyncClient.m", 441, @"Invalid parameter not satisfying: %@", @"[foundKeys containsObject:kATAssetMetricPhysicalSize]" object file lineNumber description];
    }
    if (([v17 containsObject:@"_PurgeableSize"] & 1) == 0)
    {
      int v35 = +[NSAssertionHandler currentHandler];
      [v35 handleFailureInMethod:v37[6], v37[4], @"PLSyncClient.m", 442, @"Invalid parameter not satisfying: %@", @"[foundKeys containsObject:kATAssetMetricPurgeableStorageSize]" object file lineNumber description];
    }
    int v6 = v36;
LABEL_38:
  }
}

void sub_170B8(id a1)
{
  qword_2B608 = (uint64_t)dispatch_queue_create("com.apple.photoSyncClient.isolation", 0);

  _objc_release_x1();
}

uint64_t sub_174C8(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 56))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(v1 + 32) + 56) = +[PLPhotoLibraryPathManager systemLibraryPathManager];
    return _objc_release_x1();
  }
  return result;
}

void sub_175EC(uint64_t a1)
{
  CFStringRef v2 = PLSyncGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 32);
    uint64_t v5 = *(void *)(v3 + 48);
    int v11 = 134218240;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Uninitializing library (%p, group: %p)", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 48);
  if (v7)
  {
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 4_Block_object_dispose(&STACK[0x410], 8) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
  }
  CGFloat v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;
}

void sub_177D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_177E8(uint64_t a1)
{
  CFStringRef v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2) {
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    int v3 = PLHasInternalDiagnostics();
    uint64_t v4 = PLSyncGetLog();
    uint64_t v5 = v4;
    if (v3)
    {
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      uint64_t v6 = "Initializing library [Unexpected nil library, initializing may result in long-lived photo library]";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_FAULT;
    }
    else
    {
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      uint64_t v6 = "Initializing library [Unexpected nil library, initializing may result in long-lived photo library]";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    }
  }
  else
  {
    uint64_t v5 = PLSyncGetLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Initializing library";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_0, v7, v8, v6, buf, 2u);
LABEL_11:

  id v9 = objc_alloc_init((Class)PLPhotoLibraryOptions);
  [v9 setRequiredState:6];
  [v9 setAutomaticallyMergesContext:1];
  [v9 setAutomaticallyPinToFirstFetch:0];
  CGFloat v10 = [*(id *)(a1 + 32) pathManager];
  int v11 = [v10 libraryURL];
  id v26 = 0;
  id v12 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLSyncClient _photoLibraryWithExpectationExists:]_block_invoke", v11, v9, &v26);
  id v13 = v26;
  uint64_t v14 = *(void *)(a1 + 32);
  CGFloat v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v12;

  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 32);
  id v17 = PLSyncGetLog();
  uint64_t v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = "Done initializing library.";
      id v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      uint32_t v22 = 2;
LABEL_16:
      _os_log_impl(&dword_0, v20, v21, v19, buf, v22);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v13;
    uint64_t v19 = "Failed to initialize library, error: %{public}@";
    id v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 12;
    goto LABEL_16;
  }

  CFStringRef v2 = *(void **)(*(void *)(a1 + 32) + 32);
LABEL_18:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    dispatch_group_t v23 = dispatch_group_create();
    uint64_t v24 = *(void *)(a1 + 32);
    long long v25 = *(void **)(v24 + 48);
    *(void *)(v24 + 4_Block_object_dispose(&STACK[0x410], 8) = v23;
  }
}

void sub_17F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_17F90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFStringRef v2 = [WeakRetained managedObjectContext];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_18034;
  v4[3] = &unk_24730;
  id v5 = v2;
  id v3 = v2;
  [v3 performBlock:v4];
}

void sub_18034(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "registeredObjects", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", *(void *)(*((void *)&v10 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasChanges"));
      }
      v6 += (int)v5;
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  id v9 = PLSyncGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Re-faulted %d objects.", buf, 8u);
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return _CGImageSourceGetType(isrc);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.CLLocationDegrees longitude = v3;
  result.double latitude = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t PLAbortWithReason()
{
  return _PLAbortWithReason();
}

uint64_t PLCompleteDateFormatter()
{
  return _PLCompleteDateFormatter();
}

uint64_t PLHasInternalDiagnostics()
{
  return _PLHasInternalDiagnostics();
}

uint64_t PLIsCloudPhotoLibraryEnabledForCurrentUser()
{
  return _PLIsCloudPhotoLibraryEnabledForCurrentUser();
}

uint64_t PLRunWithUnfairLock()
{
  return _PLRunWithUnfairLock();
}

uint64_t PLSafeRunWithUnfairLock()
{
  return _PLSafeRunWithUnfairLock();
}

uint64_t PLSyncGetLog()
{
  return _PLSyncGetLog();
}

uint64_t PLUnderlyingPOSIXError()
{
  return _PLUnderlyingPOSIXError();
}

uint64_t _ATLogCategorySyncBundle()
{
  return __ATLogCategorySyncBundle();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void objc_exception_throw(id exception)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pl_dispatch_once()
{
  return _pl_dispatch_once();
}

uint64_t pl_dispatch_source_set_event_handler()
{
  return _pl_dispatch_source_set_event_handler();
}

uint64_t pl_dispatch_sync()
{
  return _pl_dispatch_sync();
}

id objc_msgSend_URIRepresentation(void *a1, const char *a2, ...)
{
  return [a1 URIRepresentation];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cleanupAfterSyncOrRestore(void *a1, const char *a2, ...)
{
  return [a1 _cleanupAfterSyncOrRestore];
}

id objc_msgSend__clearEmptySyncAlbums(void *a1, const char *a2, ...)
{
  return [a1 _clearEmptySyncAlbums];
}

id objc_msgSend__clearPendingCounts(void *a1, const char *a2, ...)
{
  return [a1 _clearPendingCounts];
}

id objc_msgSend__clearSyncState(void *a1, const char *a2, ...)
{
  return [a1 _clearSyncState];
}

id objc_msgSend__createRestoreContext(void *a1, const char *a2, ...)
{
  return [a1 _createRestoreContext];
}

id objc_msgSend__initializeOutstandingAssets(void *a1, const char *a2, ...)
{
  return [a1 _initializeOutstandingAssets];
}

id objc_msgSend__initializePhotoLibraryIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _initializePhotoLibraryIfNecessary];
}

id objc_msgSend__invalidateRestoreContext(void *a1, const char *a2, ...)
{
  return [a1 _invalidateRestoreContext];
}

id objc_msgSend__itemType(void *a1, const char *a2, ...)
{
  return [a1 _itemType];
}

id objc_msgSend__kindDescription(void *a1, const char *a2, ...)
{
  return [a1 _kindDescription];
}

id objc_msgSend__loadRestoreContext(void *a1, const char *a2, ...)
{
  return [a1 _loadRestoreContext];
}

id objc_msgSend__neededRestoreAssets(void *a1, const char *a2, ...)
{
  return [a1 _neededRestoreAssets];
}

id objc_msgSend__onDeviceAlbumsByUUID(void *a1, const char *a2, ...)
{
  return [a1 _onDeviceAlbumsByUUID];
}

id objc_msgSend__pathToRestoreContext(void *a1, const char *a2, ...)
{
  return [a1 _pathToRestoreContext];
}

id objc_msgSend__persistAssetAlbumOrderStructures(void *a1, const char *a2, ...)
{
  return [a1 _persistAssetAlbumOrderStructures];
}

id objc_msgSend__photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 _photoLibrary];
}

id objc_msgSend__pullOutMasterAlbumFromAlbumsAndEvents(void *a1, const char *a2, ...)
{
  return [a1 _pullOutMasterAlbumFromAlbumsAndEvents];
}

id objc_msgSend__reconcileMetadata(void *a1, const char *a2, ...)
{
  return [a1 _reconcileMetadata];
}

id objc_msgSend__saveOutstandingSyncJobs(void *a1, const char *a2, ...)
{
  return [a1 _saveOutstandingSyncJobs];
}

id objc_msgSend__startListeningToMemoryPressureEvents(void *a1, const char *a2, ...)
{
  return [a1 _startListeningToMemoryPressureEvents];
}

id objc_msgSend__stopListeningToMemoryPressureEvents(void *a1, const char *a2, ...)
{
  return [a1 _stopListeningToMemoryPressureEvents];
}

id objc_msgSend__timeSinceLastSave(void *a1, const char *a2, ...)
{
  return [a1 _timeSinceLastSave];
}

id objc_msgSend__uninitializeLibrary(void *a1, const char *a2, ...)
{
  return [a1 _uninitializeLibrary];
}

id objc_msgSend__writeRestoreContext(void *a1, const char *a2, ...)
{
  return [a1 _writeRestoreContext];
}

id objc_msgSend_activeRestoreType(void *a1, const char *a2, ...)
{
  return [a1 activeRestoreType];
}

id objc_msgSend_albumKeyAssetFaceIndex(void *a1, const char *a2, ...)
{
  return [a1 albumKeyAssetFaceIndex];
}

id objc_msgSend_albumSubclass(void *a1, const char *a2, ...)
{
  return [a1 albumSubclass];
}

id objc_msgSend_albumUUID(void *a1, const char *a2, ...)
{
  return [a1 albumUUID];
}

id objc_msgSend_albums(void *a1, const char *a2, ...)
{
  return [a1 albums];
}

id objc_msgSend_albumsAndEventsByUUID(void *a1, const char *a2, ...)
{
  return [a1 albumsAndEventsByUUID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetPairs(void *a1, const char *a2, ...)
{
  return [a1 assetPairs];
}

id objc_msgSend_assetUUIDs(void *a1, const char *a2, ...)
{
  return [a1 assetUUIDs];
}

id objc_msgSend_assetsByUUID(void *a1, const char *a2, ...)
{
  return [a1 assetsByUUID];
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return [a1 assetsdClient];
}

id objc_msgSend_backupBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 backupBuildVersion];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return [a1 caption];
}

id objc_msgSend_clearAssetOrderByAbumUUIDs(void *a1, const char *a2, ...)
{
  return [a1 clearAssetOrderByAbumUUIDs];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_cloudRestoreContextPath(void *a1, const char *a2, ...)
{
  return [a1 cloudRestoreContextPath];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBuildVersionString(void *a1, const char *a2, ...)
{
  return [a1 currentBuildVersionString];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dataclass(void *a1, const char *a2, ...)
{
  return [a1 dataclass];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decoder(void *a1, const char *a2, ...)
{
  return [a1 decoder];
}

id objc_msgSend_decoderForPhotoUUID(void *a1, const char *a2, ...)
{
  return [a1 decoderForPhotoUUID];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delete(void *a1, const char *a2, ...)
{
  return [a1 delete];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return [a1 deletes];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return [a1 directory];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_encoderForPhotoUUID(void *a1, const char *a2, ...)
{
  return [a1 encoderForPhotoUUID];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return [a1 entityName];
}

id objc_msgSend_eventUUID(void *a1, const char *a2, ...)
{
  return [a1 eventUUID];
}

id objc_msgSend_exposureDate(void *a1, const char *a2, ...)
{
  return [a1 exposureDate];
}

id objc_msgSend_facesInfo(void *a1, const char *a2, ...)
{
  return [a1 facesInfo];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_filePathsWithoutThumbs(void *a1, const char *a2, ...)
{
  return [a1 filePathsWithoutThumbs];
}

id objc_msgSend_fileSystemProperties(void *a1, const char *a2, ...)
{
  return [a1 fileSystemProperties];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_finishedBlock(void *a1, const char *a2, ...)
{
  return [a1 finishedBlock];
}

id objc_msgSend_generateUUIDAsString(void *a1, const char *a2, ...)
{
  return [a1 generateUUIDAsString];
}

id objc_msgSend_getFacesArray(void *a1, const char *a2, ...)
{
  return [a1 getFacesArray];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasVideoComplement(void *a1, const char *a2, ...)
{
  return [a1 hasVideoComplement];
}

id objc_msgSend_iTunesPhotosLastSyncMetadataFilePath(void *a1, const char *a2, ...)
{
  return [a1 iTunesPhotosLastSyncMetadataFilePath];
}

id objc_msgSend_iTunesPhotosSyncCurrentLibraryUUIDPath(void *a1, const char *a2, ...)
{
  return [a1 iTunesPhotosSyncCurrentLibraryUUIDPath];
}

id objc_msgSend_iTunesPhotosSyncMetadataFilePath(void *a1, const char *a2, ...)
{
  return [a1 iTunesPhotosSyncMetadataFilePath];
}

id objc_msgSend_iTunesSyncedAssetsDirectory(void *a1, const char *a2, ...)
{
  return [a1 iTunesSyncedAssetsDirectory];
}

id objc_msgSend_iTunesSyncedFaceAlbumThumbnailsDirectory(void *a1, const char *a2, ...)
{
  return [a1 iTunesSyncedFaceAlbumThumbnailsDirectory];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return [a1 imageProperties];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initForPhotoUUID(void *a1, const char *a2, ...)
{
  return [a1 initForPhotoUUID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isDownload(void *a1, const char *a2, ...)
{
  return [a1 isDownload];
}

id objc_msgSend_isFlagged(void *a1, const char *a2, ...)
{
  return [a1 isFlagged];
}

id objc_msgSend_isFolderSync(void *a1, const char *a2, ...)
{
  return [a1 isFolderSync];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isPrioritized(void *a1, const char *a2, ...)
{
  return [a1 isPrioritized];
}

id objc_msgSend_isRestore(void *a1, const char *a2, ...)
{
  return [a1 isRestore];
}

id objc_msgSend_isResync(void *a1, const char *a2, ...)
{
  return [a1 isResync];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return [a1 isVideo];
}

id objc_msgSend_keyAssetUUID(void *a1, const char *a2, ...)
{
  return [a1 keyAssetUUID];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_kindValue(void *a1, const char *a2, ...)
{
  return [a1 kindValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_legacyFaces(void *a1, const char *a2, ...)
{
  return [a1 legacyFaces];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryChangeSnapshot(void *a1, const char *a2, ...)
{
  return [a1 libraryChangeSnapshot];
}

id objc_msgSend_libraryInternalClient(void *a1, const char *a2, ...)
{
  return [a1 libraryInternalClient];
}

id objc_msgSend_libraryKind(void *a1, const char *a2, ...)
{
  return [a1 libraryKind];
}

id objc_msgSend_librarySnapshot(void *a1, const char *a2, ...)
{
  return [a1 librarySnapshot];
}

id objc_msgSend_libraryURL(void *a1, const char *a2, ...)
{
  return [a1 libraryURL];
}

id objc_msgSend_libraryUUID(void *a1, const char *a2, ...)
{
  return [a1 libraryUUID];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_maskForFinderSyncedAsset(void *a1, const char *a2, ...)
{
  return [a1 maskForFinderSyncedAsset];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableAssets(void *a1, const char *a2, ...)
{
  return [a1 mutableAssets];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_orderedAlbums(void *a1, const char *a2, ...)
{
  return [a1 orderedAlbums];
}

id objc_msgSend_originalFileName(void *a1, const char *a2, ...)
{
  return [a1 originalFileName];
}

id objc_msgSend_otaRestoreProgressAlbum(void *a1, const char *a2, ...)
{
  return [a1 otaRestoreProgressAlbum];
}

id objc_msgSend_outstandingAssets(void *a1, const char *a2, ...)
{
  return [a1 outstandingAssets];
}

id objc_msgSend_outstandingSyncJobs(void *a1, const char *a2, ...)
{
  return [a1 outstandingSyncJobs];
}

id objc_msgSend_parentUUID(void *a1, const char *a2, ...)
{
  return [a1 parentUUID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathManager(void *a1, const char *a2, ...)
{
  return [a1 pathManager];
}

id objc_msgSend_pathToAssetAlbumOrderStructure(void *a1, const char *a2, ...)
{
  return [a1 pathToAssetAlbumOrderStructure];
}

id objc_msgSend_pathToRestoreKey(void *a1, const char *a2, ...)
{
  return [a1 pathToRestoreKey];
}

id objc_msgSend_pendingItemsCount(void *a1, const char *a2, ...)
{
  return [a1 pendingItemsCount];
}

id objc_msgSend_pendingItemsType(void *a1, const char *a2, ...)
{
  return [a1 pendingItemsType];
}

id objc_msgSend_photoBase64String(void *a1, const char *a2, ...)
{
  return [a1 photoBase64String];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return [a1 propertyList];
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return [a1 rating];
}

id objc_msgSend_registeredObjects(void *a1, const char *a2, ...)
{
  return [a1 registeredObjects];
}

id objc_msgSend_relativeRect(void *a1, const char *a2, ...)
{
  return [a1 relativeRect];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_restoreInfo(void *a1, const char *a2, ...)
{
  return [a1 restoreInfo];
}

id objc_msgSend_restoreKeyToAssetGroup(void *a1, const char *a2, ...)
{
  return [a1 restoreKeyToAssetGroup];
}

id objc_msgSend_serializedData(void *a1, const char *a2, ...)
{
  return [a1 serializedData];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedAssetsSaver(void *a1, const char *a2, ...)
{
  return [a1 sharedAssetsSaver];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSystemLibraryAssetsdClient(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemLibraryAssetsdClient];
}

id objc_msgSend_shortObjectIDURI(void *a1, const char *a2, ...)
{
  return [a1 shortObjectIDURI];
}

id objc_msgSend_sortAssetsUsingiTunesAlbumOrder(void *a1, const char *a2, ...)
{
  return [a1 sortAssetsUsingiTunesAlbumOrder];
}

id objc_msgSend_sortToken(void *a1, const char *a2, ...)
{
  return [a1 sortToken];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_storeUUID(void *a1, const char *a2, ...)
{
  return [a1 storeUUID];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_syncClient(void *a1, const char *a2, ...)
{
  return [a1 syncClient];
}

id objc_msgSend_syncInfoPath(void *a1, const char *a2, ...)
{
  return [a1 syncInfoPath];
}

id objc_msgSend_syncProgressAlbum(void *a1, const char *a2, ...)
{
  return [a1 syncProgressAlbum];
}

id objc_msgSend_systemLibraryPathManager(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryPathManager];
}

id objc_msgSend_systemPhotoLibraryIsObtainable(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibraryIsObtainable];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updates(void *a1, const char *a2, ...)
{
  return [a1 updates];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_wasCloudRestore(void *a1, const char *a2, ...)
{
  return [a1 wasCloudRestore];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}