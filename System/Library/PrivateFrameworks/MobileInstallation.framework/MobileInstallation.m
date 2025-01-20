id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t vars8;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17) {
    v19 = [v17 mutableCopy];
  }
  else {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)[[NSString alloc] initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v22 = [NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6F540]];

  v23 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F6F568]];

  v24 = [MEMORY[0x1E4F28C58] errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  v9 = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return v9;
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return v9;
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  v16 = _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v17 = [v16 userInfo];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v20 = [v15 domain];
      [v15 code];
      v21 = [v15 userInfo];
      v23 = [v21 objectForKeyedSubscript:v18];
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  uint64_t v3 = *MEMORY[0x1E4F6F548];
  if ([v2 isEqualToString:*MEMORY[0x1E4F6F548]] && objc_msgSend(v1, "code") == 12)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v1 domain];
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == 11)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [v1 domain];
      if ([v6 isEqualToString:v3]) {
        BOOL v4 = [v1 code] == 35;
      }
      else {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    v2 = [NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }
  return v2;
}

void sub_1B5087F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t immutable_open(int a1, char *a2, int a3, unsigned int a4)
{
  uint64_t v4 = open(a2, a3, a4);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if (fcntl(v4, 68, 1) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v6 = __error();
      v10 = strerror(*v6);
      MOLogWrite();
    }
    if (fcntl(v5, 48, 1, v10) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v7 = __error();
      v11 = strerror(*v7);
      MOLogWrite();
    }
    if (fcntl(v5, 76, 1, v11) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
  }
  return v5;
}

uint64_t bom_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = BOMCopierUserData();
  if (v4)
  {
    *(_DWORD *)uint64_t v4 = a3;
    *(unsigned char *)(v4 + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    MOLogWrite();
  }
  return 2;
}

uint64_t bom_fatal_error_handler()
{
  uint64_t v0 = BOMCopierUserData();
  if (v0) {
    *(unsigned char *)(v0 + 4) = 1;
  }
  uint64_t result = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_fatal_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = BOMCopierUserData();
  if (result)
  {
    *(_DWORD *)uint64_t result = a3;
    *(unsigned char *)(result + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_copier_copy_file_finished_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = BOMCopierUserData();
  if (result) {
    *(void *)(result + 16) += a4;
  }
  return result;
}

unint64_t *bom_copier_copy_file_update_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (unint64_t *)BOMCopierUserData();
  if (result)
  {
    v5.n128_f64[0] = (double)(result[2] + a3) / (double)result[1] * 100.0;
    v6 = *(uint64_t (**)(unint64_t, __n128))(result[3] + 16);
    unint64_t v7 = result[3];
    return (unint64_t *)v6(v7, v5);
  }
  return result;
}

void sub_1B50884B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B5088710(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _ShouldContinueAfterIncrementingFreed(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1] + a2;
  a1[1] = v3;
  BOOL v4 = v2 < 0 || v3 < v2;
  uint64_t v5 = v4;
  if (v4)
  {
    if (a2 && gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      goto LABEL_15;
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
LABEL_15:
    MOLogWrite();
  }
  return v5;
}

uint64_t _PurgeDirectory(void *a1)
{
  id v1 = a1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v2 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v16 = 0;
  char v3 = [v2 itemExistsAtURL:v1 error:&v16];
  id v4 = v16;
  uint64_t v5 = v4;
  if ((v3 & 1) == 0)
  {
    v11 = [v4 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v12 = [v5 code];

      if (v12 == 2)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_16;
    }
LABEL_15:
    v13 = [v1 path];
    MOLogWrite();

LABEL_16:
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  v6 = removefile_state_alloc();
  removefile_state_set(v6, 3u, _RemovefileErrorCallback);
  id v7 = v1;
  [v7 fileSystemRepresentation];
  char v8 = TraverseDirectoryWithPostTraversal();
  id v9 = v5;

  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    id v15 = [v7 path];
    MOLogWrite();
  }
  removefile_state_free(v6);
  uint64_t v10 = v18[3];
  uint64_t v5 = v9;
LABEL_17:

  _Block_object_dispose(&v17, 8);
  return v10;
}

void sub_1B508BAC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t _RemovefileErrorCallback(_removefile_state *a1)
{
  int dst = 0;
  removefile_state_get(a1, 5u, &dst);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(dst);
    MOLogWrite();
  }
  return 0;
}

uint64_t _ProcessDataContainer(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  v6 = [v5 rootURL];
  id v7 = [v5 identifier];

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [v6 path];
    v17 = id v16 = v7;
    uint64_t v15 = (uint64_t)a2;
    MOLogWrite();
  }
  if (a2 == (void *)7 || a2 == (void *)13) {
    goto LABEL_11;
  }
  char v8 = [v6 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  uint64_t v9 = _PurgeDirectory(v8);
  if (v9 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    id v16 = a2;
    uint64_t v17 = v7;
    uint64_t v15 = v9;
    MOLogWrite();
  }
  int ShouldContinueAfterIncrementingFreed = _ShouldContinueAfterIncrementingFreed(a3, v9);

  if (ShouldContinueAfterIncrementingFreed)
  {
LABEL_11:
    v11 = objc_msgSend(v6, "MI_URLByAppendingPathComponents:lastIsDirectory:", &unk_1F0DCF140, 1, v15, v16, v17);
    uint64_t v12 = _PurgeDirectory(v11);
    if (v12 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)) {
      MOLogWrite();
    }
    uint64_t v13 = _ShouldContinueAfterIncrementingFreed(a3, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t _AppURLContainsEmbeddedMobileProvisionFile(void *a1)
{
  uint64_t v1 = [a1 URLByAppendingPathComponent:@"embedded.mobileprovision" isDirectory:0];
  uint64_t v2 = [MEMORY[0x1E4F6F5B8] defaultManager];
  uint64_t v3 = [v2 itemExistsAtURL:v1];

  return v3;
}

BOOL _AppContainsNetworkExtension(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 firstNetworkExtension];
  uint64_t v3 = v2;
  if (v2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    id v4 = [v2 bundleID];
    v6 = [v1 bundleURL];
    MOLogWrite();
  }
  return v3 != 0;
}

id _FirstBuildInSeriesForBuildNumber(void *a1)
{
  id v1 = a1;
  if (_FirstBuildInSeriesForBuildNumber_onceToken != -1) {
    dispatch_once(&_FirstBuildInSeriesForBuildNumber_onceToken, &__block_literal_global);
  }
  uint64_t v2 = [MEMORY[0x1E4F28FE8] scannerWithString:v1];
  unsigned int v9 = 0;
  if ([v2 scanInt:&v9] && v9 - 100 >= 0xFFFFFF9D)
  {
    id v8 = 0;
    int v4 = [v2 scanCharactersFromSet:_FirstBuildInSeriesForBuildNumber_uppercaseEnglishCharacterSet intoString:&v8];
    id v5 = v8;
    v6 = v5;
    uint64_t v3 = 0;
    if (v4)
    {
      if ([v5 length] == 1)
      {
        uint64_t v3 = [NSString stringWithFormat:@"%d%@1", v9, v6];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t MIPurgeExpendableAppsAndDataForRestore(__CFString *a1, int a2, uint64_t a3, uint64_t a4)
{
  v98[16] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v79 = a4;
  uint64_t v80 = 0;
  uint64_t v6 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v73 = (__CFString *)a3;
    uint64_t v74 = a4;
    uint64_t v7 = 78;
    if (a2) {
      uint64_t v7 = 89;
    }
    v71 = a1;
    v72 = (__CFString *)v7;
    uint64_t v6 = MOLogWrite();
  }
  context = (void *)MEMORY[0x1BA9969B0](v6);
  v77 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:a1 isDirectory:1 relativeToURL:0];
  if (!a2) {
    goto LABEL_29;
  }
  id v8 = v77;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
  BOOL v9 = 0;
  unint64_t v10 = 0;
  v11 = &unk_1B50ACE10;
  id v75 = v8;
  while (1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = (__CFString *)v11[v10];
    id v14 = v8;
    uint64_t v15 = objc_opt_new();
    *(void *)&long long v85 = MEMORY[0x1E4F143A8];
    *((void *)&v85 + 1) = 3221225472;
    *(void *)&long long v86 = ___PurgeExpendableDataContainerContentForContainerClass_block_invoke;
    *((void *)&v86 + 1) = &unk_1E60C4DD0;
    id v16 = v15;
    *(void *)&long long v87 = v16;
    MIEnumerateContainersOfClass(v14, (uint64_t)v13, &v85);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v17 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v71 = v13;
      v72 = v17;
      MOLogWrite();
    }
    if (!objc_msgSend(v16, "count", v71, v72, v73, v74))
    {

      goto LABEL_26;
    }
    id v18 = (id)[v16 sortedArrayUsingComparator:&__block_literal_global_82];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v94 objects:v98 count:16];
    if (v20) {
      break;
    }
LABEL_24:

    id v8 = v75;
LABEL_26:
    BOOL v9 = v10++ > 1;
    v11 = v12;
    if (v10 == 3)
    {

      goto LABEL_29;
    }
  }
  uint64_t v21 = *(void *)v95;
LABEL_18:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v95 != v21) {
      objc_enumerationMutation(v19);
    }
    if (!_ProcessDataContainer(*(void **)(*((void *)&v94 + 1) + 8 * v22), v13, &v79)) {
      break;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v19 countByEnumeratingWithState:&v94 objects:v98 count:16];
      if (v20) {
        goto LABEL_18;
      }
      goto LABEL_24;
    }
  }

  if (!v9) {
    goto LABEL_136;
  }
LABEL_29:
  id v23 = v77;
  MICopyCurrentBuildVersion();
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "MI_URLByAppendingPathComponents:lastIsDirectory:", &unk_1F0DCF158, 0);

  if (v24)
  {
    v98[0] = 0;
    v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "MI_dictionaryWithContentsOfURL:options:error:", v25, 1, v98);
    v27 = (__CFString *)v98[0];
    v28 = v27;
    if (v26)
    {
      v29 = [v26 objectForKeyedSubscript:@"LastSystemVersion"];
      objc_opt_class();
      id v30 = v29;
      if (objc_opt_isKindOfClass()) {
        v31 = (__CFString *)v30;
      }
      else {
        v31 = 0;
      }

      if (v31)
      {
        if ([(__CFString *)v24 isEqualToString:v31])
        {
          _FirstBuildInSeriesForBuildNumber(v24);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v72 = v31;
              v73 = v34;
              v71 = @"LastSystemVersion";
              MOLogWrite();
            }
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, @"LastSystemVersion", v71, v72, v73);
          }
          else
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v71 = v24;
              v72 = @"LastSystemVersion";
              MOLogWrite();
            }
            objc_msgSend(v26, "removeObjectForKey:", @"LastSystemVersion", v71, v72);
          }

          goto LABEL_61;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v72 = v31;
          v73 = v24;
          v71 = @"LastSystemVersion";
          MOLogWrite();
        }
        goto LABEL_74;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v71 = @"LastSystemVersion";
        MOLogWrite();
      }
      objc_msgSend(v26, "removeObjectForKey:", @"LastSystemVersion", v71);
LABEL_61:
      *(void *)&long long v94 = v28;
      char v35 = objc_msgSend(v26, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:format:error:", v25, 200, &v94);
      v32 = (__CFString *)(id)v94;

      if (v35)
      {
        v28 = v32;
        goto LABEL_74;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v33 = [v25 path];
        v71 = v33;
        v72 = v32;
        MOLogWrite();
LABEL_66:
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v25, "path", v71);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v71 = v33;
        v72 = v28;
        MOLogWrite();
        v26 = 0;
        v31 = 0;
        v32 = v28;
        goto LABEL_66;
      }
      v26 = 0;
      v31 = 0;
      v32 = v27;
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    v32 = 0;
    v26 = 0;
    v31 = 0;
  }
  v36 = objc_msgSend(MEMORY[0x1E4F6F5B8], "defaultManager", v71, v72);
  *(void *)&long long v85 = v32;
  char v37 = [v36 removeItemAtURL:v25 error:&v85];
  v28 = (__CFString *)(id)v85;

  uint64_t v38 = gLogHandle;
  if ((v37 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_74;
    }
    v71 = [v25 path];
    v72 = v28;
    MOLogWrite();

    uint64_t v38 = gLogHandle;
  }
  if (!v38 || *(int *)(v38 + 44) >= 5) {
    MOLogWrite();
  }
LABEL_74:

  id v39 = v23;
  v40 = objc_opt_new();
  *(void *)&long long v85 = MEMORY[0x1E4F143A8];
  *((void *)&v85 + 1) = 3221225472;
  *(void *)&long long v86 = ___ResetLaunchServicesDatabase_block_invoke;
  *((void *)&v86 + 1) = &unk_1E60C4DD0;
  id v41 = v40;
  *(void *)&long long v87 = v41;
  v42 = (void *)MEMORY[0x1BA996BD0](&v85);
  MIEnumerateContainersOfClass(v39, 12, v42);
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v43 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v71 = @"com.apple.lsd";
    v72 = v43;
    MOLogWrite();
  }
  MIEnumerateContainersOfClass(v39, 10, v42);
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v71 = @"com.apple.lsd";
    v72 = v44;
    MOLogWrite();
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v45 = v41;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v95 != v47) {
          objc_enumerationMutation(v45);
        }
        _ProcessDataContainer(*(void **)(*((void *)&v94 + 1) + 8 * i), (void *)0xC, &v79);
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v94 objects:v98 count:16];
    }
    while (v46);
  }

  if ([v45 count])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }

    id v49 = v39;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    v50 = objc_opt_new();
    v51 = objc_opt_new();
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = ___OffloadApps_block_invoke;
    v90[3] = &unk_1E60C4E18;
    id v52 = v51;
    id v91 = v52;
    uint64_t v93 = a3;
    id v53 = v50;
    id v92 = v53;
    MIEnumerateContainersOfClass(v49, 1, v90);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v54 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v71 = v54;
      MOLogWrite();
    }
    if (objc_msgSend(v52, "count", v71, v72, v73) || objc_msgSend(v53, "count"))
    {
      [v52 sortUsingComparator:&__block_literal_global_146];
      v89 = v54;
      char v55 = MIAssumeIdentityOfUsername();
      v56 = v89;

      v54 = v56;
      if (v55)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
          MOLogWrite();
        }
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v57 = v52;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v85 objects:v98 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v86;
LABEL_108:
          uint64_t v60 = 0;
          while (1)
          {
            if (*(void *)v86 != v59) {
              objc_enumerationMutation(v57);
            }
            v61 = *(void **)(*((void *)&v85 + 1) + 8 * v60);
            v62 = (void *)MEMORY[0x1BA9969B0]();
            LODWORD(v61) = _ProcessBundleContainer(a3, v61, &v79);
            if (!v61) {
              break;
            }
            if (v58 == ++v60)
            {
              uint64_t v58 = [v57 countByEnumeratingWithState:&v85 objects:v98 count:16];
              if (v58) {
                goto LABEL_108;
              }
              goto LABEL_114;
            }
          }
LABEL_127:
        }
        else
        {
LABEL_114:

          uint64_t v63 = [v53 count];
          if (a3 && v63)
          {
            [v53 sortUsingComparator:&__block_literal_global_146];
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
              MOLogWrite();
            }
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v57 = v53;
            uint64_t v64 = [v57 countByEnumeratingWithState:&v81 objects:&v94 count:16];
            if (v64)
            {
              uint64_t v65 = *(void *)v82;
LABEL_121:
              uint64_t v66 = 0;
              while (1)
              {
                if (*(void *)v82 != v65) {
                  objc_enumerationMutation(v57);
                }
                v67 = *(void **)(*((void *)&v81 + 1) + 8 * v66);
                v68 = (void *)MEMORY[0x1BA9969B0]();
                LODWORD(v67) = _ProcessBundleContainer(a3, v67, &v79);
                if (!v67) {
                  break;
                }
                if (v64 == ++v66)
                {
                  uint64_t v64 = [v57 countByEnumeratingWithState:&v81 objects:&v94 count:16];
                  if (v64) {
                    goto LABEL_121;
                  }
                  goto LABEL_127;
                }
              }
            }
            goto LABEL_127;
          }
        }
        MIRestoreIdentity();
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        MOLogWrite();
      }
    }
  }
  else
  {

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
LABEL_136:

  uint64_t v69 = v80;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
  return v69;
}

void sub_1B508CF38(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exc_buf);
      JUMPOUT(0x1B508CDF4);
    }
    id v9 = objc_begin_catch(exc_buf);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    objc_exception_throw(v9);
  }
  _Unwind_Resume(exc_buf);
}

void sub_1B508D020(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B508CFB0);
  }
  JUMPOUT(0x1B508D0E8);
}

void sub_1B508D034(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1B508D054);
}

void sub_1B508D048(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v9 = objc_begin_catch(exception_object);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }

      objc_end_catch();
      JUMPOUT(0x1B508CEB4);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B508D0B4(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B508D0C0);
  }
  _Unwind_Resume(a1);
}

void sub_1B508D0D0(_Unwind_Exception *a1)
{
}

uint64_t _ProcessBundleContainer(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 rootURL];
  uint64_t v7 = [v5 identifier];
  if (a1 != 1)
  {
LABEL_4:
    id v9 = [v5 appURL];
    if (!v9)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_12;
      }
LABEL_11:
      unint64_t v10 = [v6 path];
      MOLogWrite();

LABEL_12:
      uint64_t ShouldContinueAfterIncrementingFreed = 1;
LABEL_112:

      goto LABEL_113;
    }
    if ([v5 isPlaceholder])
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v72 = a3;
    id v18 = v5;
    uint64_t v19 = [v18 identifier];
    uint64_t v20 = [v18 appURL];
    uint64_t v69 = MICopyCurrentBuildVersion();
    uint64_t v21 = [MIPlaceholderConstructor alloc];
    v83[0] = 0;
    id v78 = (id)v20;
    uint64_t v22 = [(MIPlaceholderConstructor *)v21 initWithSource:v20 byPreservingFullInfoPlist:0 error:v83];
    id v23 = v83[0];
    v70 = (void *)v19;
    v67 = v9;
    v68 = v22;
    if (v22)
    {
      if (a1 == 2)
      {
LABEL_22:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          [v78 path];
          uint64_t v59 = v56 = v19;
          MOLogWrite();
        }
        v24 = objc_msgSend(v18, "rootURL", v56, v59);
        v25 = [v24 URLByAppendingPathComponent:@"com.apple.emergencyoffload.temp" isDirectory:1];

        [(MIPlaceholderConstructor *)v22 setPerformPlaceholderInstallActions:1];
        id v82 = v23;
        BOOL v26 = [(MIPlaceholderConstructor *)v22 materializeIntoBundleDirectory:v25 error:&v82];
        id v27 = v82;

        v76 = v6;
        if (v26)
        {
          v28 = [v18 rootURL];
          uint64_t v29 = [v28 URLByAppendingPathComponent:@"BundleMetadata.plist" isDirectory:0];

          id v30 = (void *)v29;
          id v81 = v27;
          v31 = [MEMORY[0x1E4F6F5B0] metadataFromURL:v29 error:&v81];
          id v32 = v81;

          uint64_t v66 = v30;
          if (!v31)
          {
            uint64_t v39 = 0;
            id v27 = v32;
            goto LABEL_72;
          }
          uint64_t v64 = v32;
          [v31 setInstallType:9];
          v33 = [MEMORY[0x1E4F1C9C8] now];
          [v31 setInstallDate:v33];

          v34 = v72;
          if (v69) {
            objc_msgSend(v31, "setInstallBuildVersion:");
          }
          id v35 = v25;
          v36 = (const char *)[v35 fileSystemRepresentation];
          id v63 = v78;
          if (renamex_np(v36, (const char *)[v63 fileSystemRepresentation], 2u))
          {
            int v37 = *__error();
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              uint64_t v38 = [v35 path];
              uint64_t v60 = [v63 path];
              v61 = strerror(v37);
              id v57 = v38;
              MOLogWrite();

              v34 = v72;
            }
            uint64_t v39 = 0;
            id v27 = v64;
            goto LABEL_73;
          }
          id v80 = v64;
          char v62 = [v31 serializeToURL:v66 error:&v80];
          id v27 = v80;

          if (v62)
          {
            uint64_t v39 = _PurgeDirectory(v35);
            id v53 = [MEMORY[0x1E4F6F5B8] defaultManager];
            unint64_t v65 = [v53 diskUsageForURL:v63];

            if (v39 <= v65)
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                uint64_t v60 = (void *)v65;
                v61 = (char *)v39;
                id v57 = v70;
                MOLogWrite();
              }
            }
            else
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
              {
                uint64_t v60 = (void *)v39;
                v61 = (char *)v65;
                id v57 = v70;
                MOLogWrite();
              }
              v39 -= v65;
            }
            goto LABEL_72;
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            id v57 = [v66 path];
            uint64_t v60 = v27;
            MOLogWrite();
          }
        }
        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            id v57 = [v25 path];
            uint64_t v60 = v27;
            MOLogWrite();
          }
          v31 = 0;
          uint64_t v66 = 0;
        }
        uint64_t v39 = 0;
LABEL_72:
        v34 = v72;
LABEL_73:

        if (v25)
        {
          id v45 = [MEMORY[0x1E4F6F5B8] defaultManager];
          id v79 = 0;
          char v46 = [v45 removeItemAtURL:v25 error:&v79];
          id v47 = v79;

          v48 = v7;
          if ((v46 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            id v49 = v25;
          }
          else
          {
            id v49 = v25;
            uint64_t v58 = objc_msgSend(v25, "path", v57, v60, v61);
            MOLogWrite();
          }
          v34 = v72;
          uint64_t v6 = v76;
        }
        else
        {
          v48 = v7;
          id v49 = 0;
          id v47 = 0;
          uint64_t v6 = v76;
        }
        v50 = v31;
        v51 = v18;
        if (v39 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)) {
          MOLogWrite();
        }
        id v52 = v66;
        goto LABEL_111;
      }
      v42 = [(MIPlaceholderConstructor *)v22 entitlements];
      if (MIHasBetaReportsActiveEntitlement(v42))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_109;
        }
      }
      else if (MIHasMarketplaceEntitlement(v42))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_109;
        }
      }
      else if (_AppContainsNetworkExtension(v22))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_109;
        }
      }
      else if ([(MIPlaceholderConstructor *)v22 isLaunchProhibited])
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_109;
        }
      }
      else
      {
        if (!_AppURLContainsEmbeddedMobileProvisionFile(v78))
        {

          goto LABEL_22;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
          goto LABEL_109;
        }
      }
      v54 = [v78 path];
      MOLogWrite();
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_110;
      }
      v42 = [v78 path];
      MOLogWrite();
    }
LABEL_109:

LABEL_110:
    v48 = v7;
    v51 = v18;

    id v47 = 0;
    v50 = 0;
    id v52 = 0;
    id v49 = 0;
    uint64_t v39 = 0;
    v34 = v72;
LABEL_111:
    uint64_t ShouldContinueAfterIncrementingFreed = _ShouldContinueAfterIncrementingFreed(v34, v39);

    uint64_t v7 = v48;
    id v9 = v67;
    goto LABEL_112;
  }
  id v8 = v5;
  if ([v8 isAppleApp])
  {

    goto LABEL_4;
  }
  id v75 = v6;
  uint64_t v12 = [v8 rootURL];
  uint64_t v13 = [v8 identifier];
  id v14 = [v12 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];
  v83[0] = 0;
  uint64_t v15 = [MEMORY[0x1E4F6F5C8] metadataFromPlistAtURL:v14 error:v83];
  id v77 = v83[0];
  if (!v15)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
      goto LABEL_41;
    }
    uint64_t v17 = [v14 path];
    id v41 = v77;
    MOLogWrite();
LABEL_103:

    goto LABEL_104;
  }
  id v16 = [v15 itemID];
  uint64_t v17 = v16;
  if (!v16 || ![v16 unsignedLongLongValue])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      goto LABEL_36;
    }
    goto LABEL_102;
  }
  if (![v15 sideLoadedDeviceBasedVPP])
  {
    if ([v15 deviceBasedVPP])
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
        goto LABEL_36;
      }
      goto LABEL_102;
    }
    v73 = a3;
    v43 = [v15 appleID];

    if (!v43)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
        goto LABEL_36;
      }
      goto LABEL_102;
    }
    v44 = [v15 purchaserID];
    v40 = v44;
    if (v44 && [v44 unsignedLongLongValue])
    {
      v71 = [v15 altDSID];

      if (v71)
      {

        a3 = v73;
        uint64_t v6 = v75;
        goto LABEL_4;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 5) {
        goto LABEL_37;
      }
    }
    else if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
    {
      goto LABEL_37;
    }
    uint64_t v74 = [v12 path];
    MOLogWrite();

    goto LABEL_37;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
  {
LABEL_102:
    id v41 = v77;
    goto LABEL_103;
  }
LABEL_36:
  v40 = [v12 path];
  MOLogWrite();
LABEL_37:

LABEL_41:
LABEL_104:

  uint64_t ShouldContinueAfterIncrementingFreed = 1;
  uint64_t v6 = v75;
LABEL_113:

  return ShouldContinueAfterIncrementingFreed;
}

void sub_1B508E244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id MobileInstallationHelperServiceProtocolInterface()
{
  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallationHelperServiceProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallationHelperServiceProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DD4638];
    objc_storeWeak(&MobileInstallationHelperServiceProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallationHelperServiceProtocolInterface_lock);
  return WeakRetained;
}

void sub_1B508E778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5097AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5097DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_1B5097FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5098200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5098424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B5098654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50987FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50989B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationInstallForInstallCoordinationWithError(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = (objc_class *)MEMORY[0x1E4F6F5A8];
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  id v19 = a1;
  id v20 = [v15 alloc];
  uint64_t v21 = [v18 bundleIdentifier];
  uint64_t v22 = (void *)[v20 initWithBundleID:v21];

  id v27 = 0;
  uint64_t v23 = MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(v19, v22, a2, v18, v17, &v27, a6, a7, v16, 0);

  id v24 = v27;
  if (a5 && v23)
  {
    uint64_t v28 = *MEMORY[0x1E4F6F5E0];
    v25 = [MEMORY[0x1E4F6F578] bundleRecordArrayToInfoDictionaryArray:v24];
    v29[0] = v25;
    *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  }
  return v23;
}

uint64_t MobileInstallationInstallApplicationWithIdentityWithError(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  return MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

uint64_t MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v31 = a1;
  id v30 = a2;
  id v29 = a4;
  id v14 = a5;
  id v15 = a9;
  id v16 = a10;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  char v62 = __Block_byref_object_dispose__0;
  id v63 = 0;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  char v55 = __Block_byref_object_copy__0;
  uint64_t v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v36[3] = &unk_1E60C51F8;
  uint64_t v39 = v50;
  id v26 = v15;
  id v38 = v26;
  id v17 = v14;
  id v37 = v17;
  id v18 = (void *)MEMORY[0x1BA996BD0](v36);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v33[3] = &unk_1E60C51D0;
  id v19 = v16;
  id v35 = v19;
  id v20 = v17;
  id v34 = v20;
  uint64_t v21 = (void *)MEMORY[0x1BA996BD0](v33);
  uint64_t v22 = +[MIInstallerClient installerWithProgressBlock:v18 releaseTerminationAssertionBlock:v21];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
  v32[3] = &unk_1E60C5248;
  v32[4] = &v44;
  v32[5] = &v52;
  v32[6] = &v58;
  v32[7] = &v40;
  [v22 installURL:v31 identity:v30 targetingDomain:a3 withOptions:v29 returningResultInfo:a6 != 0 completion:v32];

  if (*((unsigned char *)v41 + 24))
  {
    if (a6) {
      *a6 = (id) v59[5];
    }
  }
  else
  {
    if (a8)
    {
      *a8 = (id) v45[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v18, (void *)v45[5]);
  }
  if (a7) {
    *a7 = (id) v53[5];
  }
  uint64_t v23 = *((unsigned __int8 *)v41 + 24);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v23;
}

void sub_1B509909C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 232), 8);
  _Block_object_dispose((const void *)(v42 - 200), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = [v3 objectForKeyedSubscript:@"Error"];

    if (v5) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    uint64_t v6 = (void (**)(void, void))a1[5];
    if (v6)
    {
      uint64_t v7 = a1[4];
      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2;
        v8[3] = &unk_1E60C51D0;
        unint64_t v10 = v6;
        id v9 = v4;
        dispatch_sync(v7, v8);
      }
      else
      {
        ((void (**)(void, void *))v6)[2](v6, v4);
      }
    }
  }
}

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4;
      block[3] = &unk_1E60C5220;
      uint64_t v6 = v2;
      dispatch_sync(v3, block);
    }
    else
    {
      int v4 = (void (*)(void))v2[2];
      v4();
    }
  }
}

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a5);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a2;
  }
}

void _SendError(void *a1, void *a2)
{
  id v15 = a1;
  id v3 = a2;
  int v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if (v4)
  {
    id v5 = [v3 domain];
    uint64_t v6 = v5;
    if (v5 != (void *)*MEMORY[0x1E4F281F8])
    {

LABEL_4:
      uint64_t v7 = [v3 userInfo];
      id v8 = [v7 objectForKeyedSubscript:@"LegacyErrorString"];

      id v9 = v8;
      if (!v8)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
          MOLogWrite();
        }
        id v9 = @"APIInternalError";
      }
      [v4 setObject:v9 forKeyedSubscript:@"Error"];
      id v10 = [v3 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F550]];

      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:@"ErrorDetail"];
      }

      goto LABEL_19;
    }
    if ([v3 code] == 4097)
    {
    }
    else
    {
      uint64_t v12 = [v3 code];

      if (v12 != 4099) {
        goto LABEL_4;
      }
    }
    [v4 setObject:@"ServiceConnectionInterrupted" forKeyedSubscript:@"Error"];
LABEL_19:
    uint64_t v13 = [v3 userInfo];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v14) {
      [v4 setObject:v14 forKeyedSubscript:@"ErrorDescription"];
    }
    v15[2](v15, v4);

    goto LABEL_22;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
LABEL_22:
}

id MobileInstallationStageApplicationUpdateWithIdentityWithError(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v12 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __MobileInstallationStageApplicationUpdateWithIdentityWithError_block_invoke;
  v15[3] = &unk_1E60C5270;
  v15[4] = &v16;
  v15[5] = &v22;
  [v12 stageInstallURL:v9 identity:v10 targetingDomain:a3 withOptions:v11 completion:v15];

  if (!v17[5])
  {
    if (a5)
    {
      *a5 = (id) v23[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_1B5099800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationStageApplicationUpdateWithIdentityWithError_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  void *v6 = v8;
}

uint64_t MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v25 = a1;
  id v11 = a2;
  id v12 = a6;
  id v13 = a7;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  char v55 = __Block_byref_object_copy__0;
  uint64_t v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__0;
  uint64_t v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke;
  v30[3] = &unk_1E60C51F8;
  v33 = v44;
  id v14 = v12;
  id v32 = v14;
  id v15 = v11;
  id v31 = v15;
  uint64_t v16 = (void *)MEMORY[0x1BA996BD0](v30);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_3;
  v27[3] = &unk_1E60C51D0;
  id v17 = v13;
  id v29 = v17;
  id v18 = v15;
  id v28 = v18;
  id v19 = (void *)MEMORY[0x1BA996BD0](v27);
  id v20 = +[MIInstallerClient installerWithProgressBlock:v16 releaseTerminationAssertionBlock:v19];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_5;
  v26[3] = &unk_1E60C5248;
  v26[4] = &v38;
  v26[5] = &v46;
  v26[6] = &v52;
  v26[7] = &v34;
  [v20 finalizeStagedInstallForUUID:v25 returningResultInfo:a3 != 0 completion:v26];

  if (*((unsigned char *)v35 + 24))
  {
    if (a3) {
      *a3 = (id) v53[5];
    }
    if (a4) {
      *a4 = (id) v47[5];
    }
  }
  else
  {
    if (a5)
    {
      *a5 = (id) v39[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v16, (void *)v39[5]);
  }
  uint64_t v21 = *((unsigned __int8 *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v21;
}

void sub_1B5099C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = [v3 objectForKeyedSubscript:@"Error"];

    if (v5) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    uint64_t v6 = (void (**)(void, void))a1[5];
    if (v6)
    {
      uint64_t v7 = a1[4];
      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_2;
        v8[3] = &unk_1E60C51D0;
        id v10 = v6;
        id v9 = v4;
        dispatch_sync(v7, v8);
      }
      else
      {
        ((void (**)(void, void *))v6)[2](v6, v4);
      }
    }
  }
}

uint64_t __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_4;
      block[3] = &unk_1E60C5220;
      uint64_t v6 = v2;
      dispatch_sync(v3, block);
    }
    else
    {
      int v4 = (void (*)(void))v2[2];
      v4();
    }
  }
}

uint64_t __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_5(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a5);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a2;
  }
}

uint64_t MobileInstallationCancelStagedUpdateForUUIDWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  int v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke;
  v7[3] = &unk_1E60C5298;
  v7[4] = &v8;
  v7[5] = &v12;
  [v4 cancelUpdateForStagedUUID:v3 completion:v7];

  if (!*((unsigned char *)v9 + 24))
  {
    if (a2)
    {
      *a2 = (id) v13[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_1B509A12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

id MobileInstallationRegisterPlaceholderForReference(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  int v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MobileInstallationRegisterPlaceholderForReference_block_invoke;
  v7[3] = &unk_1E60C52C0;
  v7[4] = &v14;
  v7[5] = &v8;
  [v4 registerPlaceholderForReference:v3 completion:v7];

  if (!v15[5])
  {
    if (a2)
    {
      *a2 = (id) v9[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_1B509A39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRegisterPlaceholderForReference_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

uint64_t MobileInstallationRevertForInstallCoordinationWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  char v11 = (objc_class *)MEMORY[0x1E4F6F5A8];
  id v12 = a6;
  id v13 = a3;
  id v14 = a2;
  id v15 = a1;
  uint64_t v16 = (void *)[[v11 alloc] initWithBundleID:v15];

  uint64_t v17 = MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(v16, v14, v13, a4, a5, v12, 0);
  return v17;
}

uint64_t MobileInstallationRevertApplicationWithIdentityWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = a1;
  id v13 = a2;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__0;
  v56[4] = __Block_byref_object_dispose__0;
  id v57 = 0;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = __Block_byref_object_copy__0;
  uint64_t v54 = __Block_byref_object_dispose__0;
  id v55 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__0;
  uint64_t v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v36[3] = &unk_1E60C51F8;
  uint64_t v39 = v58;
  id v17 = v15;
  id v38 = v17;
  id v18 = v14;
  id v37 = v18;
  id v19 = (void *)MEMORY[0x1BA996BD0](v36);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v33[3] = &unk_1E60C51D0;
  id v20 = v16;
  id v35 = v20;
  id v21 = v18;
  id v34 = v21;
  uint64_t v23 = (void *)MEMORY[0x1BA996BD0](v33);
  if (v12)
  {
    uint64_t v24 = (void *)MEMORY[0x1BA9969B0]();
    id v25 = +[MIInstallerClient installerWithProgressBlock:v19 releaseTerminationAssertionBlock:v23];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
    v32[3] = &unk_1E60C5248;
    v32[4] = &v40;
    v32[5] = v56;
    v32[6] = &v50;
    v32[7] = &v46;
    [v25 revertIdentity:v12 withOptions:v13 completion:v32];
  }
  else
  {
    uint64_t v26 = _CreateAndLogError((uint64_t)"MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError", 1709, (void *)*MEMORY[0x1E4F6F548], 25, 0, &unk_1F0DCF118, @"Bundle ID supplied to revert was nil.", v22, v30);
    id v27 = (void *)v41[5];
    v41[5] = v26;
  }
  if (a4 && *((unsigned char *)v47 + 24))
  {
    *a4 = (id) v51[5];
  }
  else if (!*((unsigned char *)v47 + 24))
  {
    if (a5)
    {
      *a5 = (id) v41[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v19, (void *)v41[5]);
  }
  uint64_t v28 = *((unsigned __int8 *)v47 + 24);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

  return v28;
}

void sub_1B509A94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = [v3 objectForKeyedSubscript:@"Error"];

    if (v5) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    id v6 = (void (**)(void, void))a1[5];
    if (v6)
    {
      id v7 = a1[4];
      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2;
        v8[3] = &unk_1E60C51D0;
        id v10 = v6;
        id v9 = v4;
        dispatch_sync(v7, v8);
      }
      else
      {
        ((void (**)(void, void *))v6)[2](v6, v4);
      }
    }
  }
}

uint64_t __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4;
      block[3] = &unk_1E60C5220;
      id v6 = v2;
      dispatch_sync(v3, block);
    }
    else
    {
      int v4 = (void (*)(void))v2[2];
      v4();
    }
  }
}

uint64_t __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a5);
  }
}

id MobileInstallationUninstallForInstallCoordinationWithError(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v5 = (void *)MEMORY[0x1E4F6F598];
  id v6 = MobileInstallationICLRecordsUninstallForInstallCoordinationWithError(a1, a2, a3, a4, a5);
  id v7 = [v5 uninstallRecordArrayToDictionary:v6];

  return v7;
}

id MobileInstallationICLRecordsUninstallForInstallCoordinationWithError(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__0;
  uint64_t v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__0;
  id v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke;
  v24[3] = &unk_1E60C51F8;
  id v27 = v40;
  id v13 = v12;
  id v26 = v13;
  id v14 = v11;
  id v25 = v14;
  id v15 = (void *)MEMORY[0x1BA996BD0](v24);
  id v16 = +[MIInstallerClient installerWithProgressBlock:v13];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3;
  v20[3] = &unk_1E60C52E8;
  uint64_t v22 = &v28;
  id v17 = v15;
  id v21 = v17;
  uint64_t v23 = &v34;
  [v16 uninstallIdentifiers:v9 withOptions:v10 completion:v20];

  if (!v35[5])
  {
    if (a4)
    {
      *a4 = (id) v29[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  id v18 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(v40, 8);
  return v18;
}

void sub_1B509AF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = [v3 objectForKeyedSubscript:@"Error"];

    if (v5) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    id v6 = (void (**)(void, void))a1[5];
    if (v6)
    {
      id v7 = a1[4];
      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2;
        v8[3] = &unk_1E60C51D0;
        id v10 = v6;
        id v9 = v4;
        dispatch_sync(v7, v8);
      }
      else
      {
        ((void (**)(void, void *))v6)[2](v6, v4);
      }
    }
  }
}

uint64_t __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    _SendError(*(void **)(a1 + 32), v6);
  }
  else if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

uint64_t MobileInstallationUninstallAppWithIdentity(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v7 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __MobileInstallationUninstallAppWithIdentity_block_invoke;
  v10[3] = &unk_1E60C5310;
  v10[4] = &v11;
  v10[5] = &v17;
  [v7 uninstallIdentity:v5 withOptions:v6 completion:v10];

  if (!*((unsigned char *)v18 + 24))
  {
    if (a3)
    {
      *a3 = (id) v12[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  uint64_t v8 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1B509B32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUninstallAppWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id MIFinalizeReferenceForInstalledAppWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MIFinalizeReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_1E60C52C0;
  v7[4] = &v8;
  v7[5] = &v14;
  [v4 finalizeReference:v3 withCompletion:v7];

  if (!v9[5])
  {
    if (a2)
    {
      *a2 = (id) v15[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_1B509B58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __MIFinalizeReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

id MIAcquireReferenceForInstalledAppWithError(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v9 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MIAcquireReferenceForInstalledAppWithError_block_invoke;
  v12[3] = &unk_1E60C5338;
  v12[4] = &v13;
  v12[5] = &v19;
  [v9 acquireReferenceforInstalledAppWithIdentity:v7 inDomain:a2 matchingInstallSessionID:v8 withCompletion:v12];

  if (!v14[5])
  {
    if (a4)
    {
      *a4 = (id) v20[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1B509B82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIAcquireReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

uint64_t MIInvalidateReferenceForInstalledAppWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __MIInvalidateReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_1E60C5310;
  v7[4] = &v12;
  v7[5] = &v8;
  [v4 invalidateReference:v3 withCompletion:v7];

  if (!*((unsigned char *)v9 + 24))
  {
    if (a2)
    {
      *a2 = (id) v13[5];
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_1B509BA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIInvalidateReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t MobileInstallationLookupUninstalled(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v3 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if (!a1)
  {
    id v4 = objc_opt_new();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __MobileInstallationLookupUninstalled_block_invoke;
    v6[3] = &unk_1E60C5360;
    v6[4] = &v7;
    [v4 lookupUninstalledWithOptions:0 completion:v6];

    uint64_t v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1B509BBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationLookupUninstalled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  }
}

uint64_t MobileInstallationClearUninstalled(const __CFArray *a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (a2)
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else if (CFArrayGetCount(a1))
  {
    id v6 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __MobileInstallationClearUninstalled_block_invoke;
    v8[3] = &unk_1E60C5180;
    void v8[4] = &v9;
    [v6 clearUninstalledIdentifiers:a1 withOptions:0 completion:v8];

    uint64_t v5 = *((unsigned int *)v10 + 6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

void sub_1B509BDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MobileInstallationClearUninstalled_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v3 = (id)gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v6 = v4;
      id v3 = (id)MOLogWrite();
      id v4 = v6;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t MobileInstallationLookupSystemAppState(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __MobileInstallationLookupSystemAppState_block_invoke;
  v6[3] = &unk_1E60C5360;
  v6[4] = &v7;
  [v3 lookupSystemAppStateWithOptions:a1 completion:v6];

  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1B509BF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationLookupSystemAppState_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  }
}

uint64_t MobileInstallationUpdateSystemAppState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  id v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationUpdateSystemAppState_block_invoke;
  v8[3] = &unk_1E60C5180;
  void v8[4] = &v9;
  [v5 updateSystemAppStateForIdentifier:a1 appState:a2 completion:v8];

  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_1B509C0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MobileInstallationUpdateSystemAppState_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v3 = (id)gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v6 = v4;
      id v3 = (id)MOLogWrite();
      id v4 = v6;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t MobileInstallationCopyInstalledDeveloperAppsForLaunchServices()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  return 0;
}

BOOL MobileInstallationRegisterContentsForDiskImageAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __MobileInstallationRegisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_1E60C5310;
  v9[4] = &v14;
  v9[5] = &v10;
  [v5 registerContentsForDiskImageAtURL:v3 completion:v9];

  int v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((unsigned char *)v11 + 24))
  {
    *a2 = (id) v15[5];
    int v6 = *((unsigned __int8 *)v11 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_1B509C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRegisterContentsForDiskImageAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

BOOL MobileInstallationUnregisterContentsForDiskImageAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __MobileInstallationUnregisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_1E60C5310;
  v9[4] = &v14;
  v9[5] = &v10;
  [v5 unregisterContentsForDiskImageAtURL:v3 completion:v9];

  int v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((unsigned char *)v11 + 24))
  {
    *a2 = (id) v15[5];
    int v6 = *((unsigned __int8 *)v11 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_1B509C568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUnregisterContentsForDiskImageAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id MobileInstallationEnumerateAllInstalledItemDictionaries(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  char v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v5 = +[MIInstallerClient installerWithAppDictionaryEnumerator:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationEnumerateAllInstalledItemDictionaries_block_invoke;
  v8[3] = &unk_1E60C5180;
  void v8[4] = &v9;
  [v5 enumerateInstalledAppsWithOptions:v3 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B509C764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationEnumerateAllInstalledItemDictionaries_block_invoke(uint64_t a1, void *a2)
{
}

id MobileInstallationUpdatePlaceholderMetadata(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v11 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __MobileInstallationUpdatePlaceholderMetadata_block_invoke;
  v14[3] = &unk_1E60C5180;
  v14[4] = &v15;
  [v11 updatePlaceholderMetadataForApp:v9 installType:a2 failureReason:a3 underlyingError:v10 failureSource:a5 completion:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_1B509C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUpdatePlaceholderMetadata_block_invoke(uint64_t a1, void *a2)
{
}

id MobileInstallationCopyAppMetadata(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  char v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationCopyAppMetadata_block_invoke;
  v8[3] = &unk_1E60C5388;
  void v8[4] = &v9;
  void v8[5] = &v15;
  [v4 getAppMetadataForApp:v3 completion:v8];

  id v5 = (void *)v10[5];
  if (a2 && !v5)
  {
    *a2 = (id) v16[5];
    id v5 = (void *)v10[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void sub_1B509CA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopyAppMetadata_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id MobileInstallationCopyFrameworkInfoForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v7 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __MobileInstallationCopyFrameworkInfoForLaunchServices_block_invoke;
  v11[3] = &unk_1E60C53B0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 fetchInfoForFrameworkAtURL:v5 options:v6 completion:v11];

  uint64_t v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    uint64_t v8 = (void *)v19[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_1B509CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopyFrameworkInfoForLaunchServices_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F6F578] bundleRecordArrayToInfoDictionaryArray:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

id MobileInstallationGetFrameworkBundleRecordsForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v7 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __MobileInstallationGetFrameworkBundleRecordsForLaunchServices_block_invoke;
  v11[3] = &unk_1E60C53B0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 fetchInfoForFrameworkAtURL:v5 options:v6 completion:v11];

  uint64_t v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    uint64_t v8 = (void *)v19[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_1B509CF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetFrameworkBundleRecordsForLaunchServices_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id MobileInstallationCopyContainerizedAppInfoForLaunchServices(void *a1, void *a2, void *a3)
{
  id v3 = (void *)MEMORY[0x1E4F6F578];
  id v4 = MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(a1, a2, a3);
  id v5 = [v3 bundleRecordArrayToInfoDictionaryArray:v4];

  return v5;
}

id MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  id v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v7 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v8 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices_block_invoke;
  v12[3] = &unk_1E60C53B0;
  v12[4] = &v13;
  v12[5] = &v19;
  [v8 fetchInfoForContainerizedAppWithBundleID:v5 options:v6 completion:v12];

  uint64_t v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    uint64_t v9 = (void *)v20[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1B509D1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

uint64_t MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL", 2175, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL");
  uint64_t v10 = v9;
  if (a3) {
    *a3 = v9;
  }

  return 0;
}

uint64_t MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL", 2205, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL");
  uint64_t v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return 0;
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL", 2229, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL");
  uint64_t v10 = v9;
  if (a4 && v9) {
    *a4 = v9;
  }

  return v10 == 0;
}

uint64_t MobileInstallationCopyDiskUsageForLaunchServices(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  if (!a2)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFTypeID v5 = CFGetTypeID(a1);
  if (CFStringGetTypeID() != v5)
  {
    if (CFArrayGetTypeID() == v5)
    {
      id v6 = a1;
      goto LABEL_9;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_13:
      uint64_t v9 = 0;
      goto LABEL_14;
    }
LABEL_12:
    MOLogWrite();
    goto LABEL_13;
  }
  v11[0] = a1;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
LABEL_9:
  uint64_t v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F6F5A0] defaultWorkspace];
  uint64_t v9 = [v8 diskUsageForLaunchServicesWithBundleIDs:v7 options:a2 withError:0];

LABEL_14:
  return v9;
}

uint64_t MobileInstallationRegisterSafeHarbor(uint64_t a1, uint64_t a2, const char *a3)
{
  CFTypeID v5 = (void *)MEMORY[0x1BA9969B0]();
  id v6 = [NSString stringWithFileSystemRepresentation:a3 length:strlen(a3)];
  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6F5A8]) initWithBundleID:a2];
    uint64_t v8 = (MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(v6, v7, 2, 0, 0) - 1);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

BOOL MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  uint64_t v13 = (void *)MEMORY[0x1BA9969B0]();
  if (v11)
  {
    uint64_t v14 = _CreateAndLogError((uint64_t)"MobileInstallationRegisterSafeHarborForContainerClassWithIdentity", 2311, (void *)*MEMORY[0x1E4F6F548], 25, 0, 0, @"The options parameter is currently unused and must be nil", v12, v19[0]);
    uint64_t v15 = (void *)v21[5];
    v21[5] = v14;
  }
  else
  {
    uint64_t v15 = objc_opt_new();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__MobileInstallationRegisterSafeHarborForContainerClassWithIdentity_block_invoke;
    v19[3] = (uint64_t)&unk_1E60C5310;
    v19[4] = (uint64_t)&v20;
    v19[5] = (uint64_t)&v26;
    [v15 registerSafeHarborAtPath:v9 forIdentity:v10 ofType:a3 withOptions:0 completion:v19];
  }

  int v16 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((unsigned char *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v16 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

void sub_1B509D828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationRegisterSafeHarborForContainerType(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6F5A8]) initWithBundleID:a2];
  uint64_t v8 = _ContainerTypeForMCMContainerType(a3);
  BOOL v9 = MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(a1, v7, v8, 0, 0);

  return v9;
}

uint64_t _ContainerTypeForMCMContainerType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xF) {
    return 0;
  }
  return result;
}

void __MobileInstallationRegisterSafeHarborForContainerClassWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t MobileInstallationRemoveSafeHarbor(uint64_t a1, uint64_t a2)
{
  return (MobileInstallationRemoveSafeHarborForContainerType(a2, 2) - 1);
}

BOOL MobileInstallationRemoveSafeHarborForContainerType(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F6F5A8]) initWithBundleID:a1];
  uint64_t v6 = _ContainerTypeForMCMContainerType(a2);
  BOOL v7 = MobileInstallationRemoveSafeHarborForContainerClassWithIdentity(v5, v6, 0, 0);

  return v7;
}

BOOL MobileInstallationRemoveSafeHarborForContainerClassWithIdentity(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v10 = (void *)MEMORY[0x1BA9969B0]();
  if (v8)
  {
    uint64_t v11 = _CreateAndLogError((uint64_t)"MobileInstallationRemoveSafeHarborForContainerClassWithIdentity", 2371, (void *)*MEMORY[0x1E4F6F548], 25, 0, 0, @"The options parameter is currently unused and must be nil", v9, v16[0]);
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__MobileInstallationRemoveSafeHarborForContainerClassWithIdentity_block_invoke;
    v16[3] = (uint64_t)&unk_1E60C5310;
    v16[4] = (uint64_t)&v17;
    v16[5] = (uint64_t)&v23;
    [v12 removeSafeHarborForIdentity:v7 ofType:a2 withOptions:0 completion:v16];
  }

  int v13 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v13 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_1B509DBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRemoveSafeHarborForContainerClassWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t MobileInstallationCopySafeHarbors()
{
  return MobileInstallationCopySafeHarborsForContainerType(2);
}

uint64_t MobileInstallationCopySafeHarborsForContainerType(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v3 = _ContainerTypeForMCMContainerType(a1);
  id v4 = [MEMORY[0x1E4F6F5C0] sharedInstance];
  id v5 = [v4 primaryPersonaString];
  uint64_t v6 = MobileInstallationCopySafeHarborsForContainerClass(v3, v5, 0, 0);

  return v6;
}

id MobileInstallationCopySafeHarborsForContainerClass(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__0;
  id v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v10 = (void *)MEMORY[0x1BA9969B0]();
  if (v8)
  {
    uint64_t v11 = _CreateAndLogError((uint64_t)"MobileInstallationCopySafeHarborsForContainerClass", 2425, (void *)*MEMORY[0x1E4F6F548], 25, 0, 0, @"The options parameter is currently unused and must be nil", v9, v16[0]);
  }
  else
  {
    if (v7)
    {
      uint64_t v12 = objc_opt_new();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = (uint64_t)__MobileInstallationCopySafeHarborsForContainerClass_block_invoke;
      v16[3] = (uint64_t)&unk_1E60C53D8;
      v16[4] = (uint64_t)&v17;
      v16[5] = (uint64_t)&v23;
      [v12 listSafeHarborsOfType:a1 forPersona:v7 withOptions:0 completion:v16];
      goto LABEL_6;
    }
    uint64_t v11 = _CreateAndLogError((uint64_t)"MobileInstallationCopySafeHarborsForContainerClass", 2431, (void *)*MEMORY[0x1E4F6F548], 25, 0, 0, @"The persona parameter must be specified", v9, v16[0]);
  }
  uint64_t v12 = (void *)v18[5];
  v18[5] = v11;
LABEL_6:

  int v13 = v24;
  if (a4 && !v24[5])
  {
    *a4 = (id) v18[5];
    int v13 = v24;
  }
  id v14 = (id)v13[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_1B509DFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopySafeHarborsForContainerClass_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v6 + 40))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    id v7 = (void **)(v6 + 40);
    uint64_t v8 = v5;
  }
  else
  {
    if (!v11) {
      goto LABEL_9;
    }
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;

LABEL_9:
}

uint64_t MobileInstallationCheckCapabilitiesMatch(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationCheckCapabilitiesMatch_block_invoke;
  v8[3] = &unk_1E60C5360;
  void v8[4] = &v9;
  [v5 checkCapabilities:a1 withOptions:a2 completion:v8];

  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_1B509E180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCheckCapabilitiesMatch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  }
}

id MobileInstallationUpdateSinfDataForInstallCoordination(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  char v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v10 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v11 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __MobileInstallationUpdateSinfDataForInstallCoordination_block_invoke;
  v15[3] = &unk_1E60C5400;
  v15[4] = &v16;
  v15[5] = &v22;
  [v11 updateSinfForIXWithIdentifier:v7 withOptions:v8 sinfData:v9 completion:v15];

  uint64_t v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = (id) v17[5];
    uint64_t v12 = (void *)v23[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_1B509E40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUpdateSinfDataForInstallCoordination_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v5;
  }
  else
  {
    if (!v10) {
      goto LABEL_9;
    }
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v10;
  }
  id v8 = v7;
  id v9 = *v6;
  void *v6 = v8;

LABEL_9:
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordination(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  id v7 = (void *)MEMORY[0x1BA9969B0]();
  id v8 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke;
  v12[3] = &unk_1E60C5180;
  v12[4] = &v13;
  [v8 updateiTunesMetadataForIXWithIdentifier:v5 metadata:v6 completion:v12];

  id v9 = (void *)v14[5];
  if (a3 && v9)
  {
    *a3 = v9;
    id v9 = (void *)v14[5];
  }
  BOOL v10 = v9 == 0;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void sub_1B509E644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t MobileInstallationAppLaunchEnabled()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  return 0;
}

uint64_t MobileInstallationSetAppLaunchState(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationSetAppLaunchState", 2583, (void *)*MEMORY[0x1E4F6F548], 10, 0, 0, @"MobileInstallationSetAppLaunchState called on unsupported OS for %@", a8, a1);
  BOOL v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return 0;
}

uint64_t MobileInstallationWatchKitInstallerSnapshotWKApp(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = (void *)MEMORY[0x1BA9969B0]();
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v9 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __MobileInstallationWatchKitInstallerSnapshotWKApp_block_invoke;
  v13[3] = &unk_1E60C53D8;
  v13[4] = &v14;
  v13[5] = &v18;
  [v9 snapshotWKAppInCompanionAppID:a1 toURL:a2 options:a3 completion:v13];

  if (a4 && !v19[3])
  {
    *a4 = v15[3];
  }
  else
  {
    BOOL v10 = (const void *)v15[3];
    if (v10) {
      CFRelease(v10);
    }
  }
  uint64_t v11 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1B509E8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationWatchKitInstallerSnapshotWKApp_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    id v6 = v8;
    uint64_t v7 = *(void *)(a1 + 40);
  }
  *(void *)(*(void *)(v7 + 8) + 24) = v6;
LABEL_9:
}

BOOL MobileInstallationSetSystemAppMigrationComplete(void *a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationSetSystemAppMigrationComplete_block_invoke;
  v8[3] = &unk_1E60C5180;
  void v8[4] = &v9;
  [v3 setSystemAppMigrationComplete:v8];

  uint64_t v4 = v10;
  if (a1)
  {
    id v5 = (void *)v10[5];
    if (v5)
    {
      *a1 = v5;
      uint64_t v4 = v10;
    }
  }
  BOOL v6 = v4[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B509EAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationSetSystemAppMigrationComplete_block_invoke(uint64_t a1, void *a2)
{
}

BOOL MobileInstallationWaitForSystemAppMigrationToComplete(void *a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  char HasCompleted = MISystemAppMigrationHasCompleted();
  if ((HasCompleted & 1) == 0)
  {
    uint64_t v4 = objc_opt_new();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke;
    v8[3] = &unk_1E60C5310;
    void v8[4] = &v9;
    void v8[5] = &v13;
    [v4 waitForSystemAppMigratorToComplete:v8];
  }
  if (HasCompleted)
  {
    BOOL v5 = 1;
  }
  else
  {
    if (a1)
    {
      BOOL v6 = (void *)v14[5];
      if (v6) {
        *a1 = v6;
      }
    }
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void sub_1B509EC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v4 = v5;
  }
}

void MobileInstallationWaitForSystemAppMigrationWithCompletion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1BA9969B0]();
  if (MISystemAppMigrationHasCompleted())
  {
    v1[2](v1, 0);
  }
  else
  {
    id v3 = objc_opt_new();
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __MobileInstallationWaitForSystemAppMigrationWithCompletion_block_invoke;
    v4[3] = &unk_1E60C5428;
    id v5 = v1;
    [v3 waitForSystemAppMigratorWithCompletion:v4];
  }
}

uint64_t __MobileInstallationWaitForSystemAppMigrationWithCompletion_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t MobileInstallationGetSystemAppMigrationStatus(unsigned char *a1, void *a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v4 = (void *)MEMORY[0x1BA9969B0]();
  int HasCompleted = MISystemAppMigrationHasCompleted();
  char v6 = HasCompleted;
  if (HasCompleted)
  {
    *a1 = 1;
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __MobileInstallationGetSystemAppMigrationStatus_block_invoke;
    v11[3] = &unk_1E60C5450;
    v11[4] = &v12;
    v11[5] = a1;
    [v7 systemAppMigratorHasCompleted:v11];
  }
  if (v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 1;
    if (a2)
    {
      uint64_t v9 = (void *)v13[5];
      if (v9)
      {
        uint64_t v8 = 0;
        *a2 = v9;
      }
    }
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void sub_1B509EF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetSystemAppMigrationStatus_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    **(unsigned char **)(a1 + 40) = a2;
  }
}

uint64_t MobileInstallationGetInstalldPid()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9969B0]();
  id v1 = objc_opt_new();
  uint64_t v2 = [v1 pidForTesting];

  return v2;
}

void MobileInstallationKillInstalld()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9969B0]();
  id v1 = objc_opt_new();
  [v1 dieForTesting];
}

id MobileInstallationSimulateExceptionInDaemon()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9969B0]();
  id v1 = objc_opt_new();
  uint64_t v2 = [v1 raiseException];

  return v2;
}

uint64_t MobileInstallationGetHelperServicePid()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = -1;
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
  if (v0)
  {
    id v1 = MobileInstallationHelperServiceProtocolInterface();
    [v0 setRemoteObjectInterface:v1];

    [v0 resume];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __MobileInstallationGetHelperServicePid_block_invoke;
    v7[3] = &unk_1E60C5478;
    id v2 = v0;
    id v8 = v2;
    id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __MobileInstallationGetHelperServicePid_block_invoke_2;
    v6[3] = &unk_1E60C5158;
    v6[4] = &v9;
    [v3 getPidForTestingWithCompletion:v6];

    [v2 invalidate];
    uint64_t v4 = *((unsigned int *)v10 + 6);
  }
  else
  {
    NSLog(&cfstr_WarningCouldnT.isa, @"com.apple.MobileInstallationHelperService");
    uint64_t v4 = *((unsigned int *)v10 + 6);
  }

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_1B509F264(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetHelperServicePid_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serviceName];
  NSLog(&cfstr_WarningCouldnT_0.isa, v4, v3);
}

uint64_t __MobileInstallationGetHelperServicePid_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void MobileInstallationKillHelperService()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
  if (v0)
  {
    uint64_t v1 = MobileInstallationHelperServiceProtocolInterface();
    [v0 setRemoteObjectInterface:v1];

    [v0 resume];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __MobileInstallationKillHelperService_block_invoke;
    v4[3] = &unk_1E60C5478;
    id v2 = v0;
    id v5 = v2;
    id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v4];
    [v3 dieForTesting];

    [v2 invalidate];
  }
  else
  {
    NSLog(&cfstr_WarningCouldnT.isa, @"com.apple.MobileInstallationHelperService");
  }
}

void __MobileInstallationKillHelperService_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serviceName];
  NSLog(&cfstr_WarningCouldnT_1.isa, v4, v3);
}

uint64_t MobileInstallationSetTestMode(void *a1)
{
  id v2 = (void *)MEMORY[0x1BA9969B0]();
  id v3 = objc_opt_new();
  id v7 = 0;
  uint64_t v4 = [v3 setTestMode:&v7];
  id v5 = v7;

  if (a1 && (v4 & 1) == 0) {
    *a1 = v5;
  }

  return v4;
}

uint64_t MobileInstallationEndTestMode(void *a1)
{
  id v2 = (void *)MEMORY[0x1BA9969B0]();
  id v3 = objc_opt_new();
  id v7 = 0;
  uint64_t v4 = [v3 endTestMode:&v7];
  id v5 = v7;

  if (a1 && (v4 & 1) == 0) {
    *a1 = v5;
  }

  return v4;
}

uint64_t MobileInstallationGetTestModeEnabled(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  id v9 = 0;
  uint64_t v6 = [v5 getTestModeEnabled:a1 outError:&v9];
  id v7 = v9;

  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationSetTestFlags(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  id v9 = 0;
  uint64_t v6 = [v5 setTestFlags:a1 withError:&v9];
  id v7 = v9;

  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationClearTestFlags(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  id v9 = 0;
  uint64_t v6 = [v5 clearTestFlags:a1 withError:&v9];
  id v7 = v9;

  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationSetEligibilityTestOverrides(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x1BA9969B0]();
  id v5 = objc_opt_new();
  id v9 = 0;
  uint64_t v6 = [v5 setEligibilityTestOverrides:v3 withError:&v9];
  id v7 = v9;

  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

BOOL MICreateSerializedPlaceholderForInstalledApplication(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v10 = [MEMORY[0x1E4F6F5B8] defaultManager];
  uint64_t v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  uint64_t v12 = [v10 deviceForURLOrFirstAvailableParent:v9 error:&obj];
  objc_storeStrong(v11, obj);

  if (v12 != -1)
  {
    uint64_t v13 = objc_opt_new();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __MICreateSerializedPlaceholderForInstalledApplication_block_invoke;
    v17[3] = &unk_1E60C5310;
    v17[4] = &v19;
    v17[5] = &v25;
    [v13 createSerializedPlaceholderForInstalledAppWithBundeID:v7 personaUniqueString:v8 atResultURL:v9 onDevice:v12 withCompletion:v17];
  }
  int v14 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    *a4 = (id) v20[5];
    int v14 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_1B509F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __MICreateSerializedPlaceholderForInstalledApplication_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

BOOL MISetLaunchWarning(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v10 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __MISetLaunchWarning_block_invoke;
  v14[3] = &unk_1E60C5310;
  v14[4] = &v15;
  void v14[5] = &v21;
  [v10 setLaunchWarningForApp:v7 withUniqueInstallIdentifier:v8 warningData:v9 completion:v14];

  int v11 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((unsigned char *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v11 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v12 = v11 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void sub_1B509FBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MISetLaunchWarning_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id MIGetReferencesForBundleWithIdentifier(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  uint64_t v6 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __MIGetReferencesForBundleWithIdentifier_block_invoke;
  v10[3] = &unk_1E60C53D8;
  v10[4] = &v11;
  v10[5] = &v17;
  [v6 referencesForBundleWithIdentifier:v5 inDomain:a2 withCompletion:v10];

  id v7 = (void *)v18[5];
  if (a3 && !v7)
  {
    *a3 = (id) v12[5];
    id v7 = (void *)v18[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1B509FE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIGetReferencesForBundleWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

uint64_t MobileInstallationSetPersonaForDataSeparatedApps(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationSetPersonaForDataSeparatedApps", 3024, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationSetPersonaForDataSeparatedApps");
  uint64_t v10 = v9;
  if (a3) {
    *a3 = v9;
  }

  return 0;
}

uint64_t MobileInstallationAddDataSeparatedAppsToPersona(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationAddDataSeparatedAppsToPersona", 3048, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationAddDataSeparatedAppsToPersona");
  uint64_t v10 = v9;
  if (a3) {
    *a3 = v9;
  }

  return 0;
}

uint64_t MobileInstallationRemoveDataSeparatedAppsFromPersona(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = _CreateAndLogError((uint64_t)"MobileInstallationRemoveDataSeparatedAppsFromPersona", 3072, (void *)*MEMORY[0x1E4F6F548], 161, 0, 0, @"%s is unavailable on this platform", a8, (uint64_t)"MobileInstallationRemoveDataSeparatedAppsFromPersona");
  uint64_t v10 = v9;
  if (a3) {
    *a3 = v9;
  }

  return 0;
}

id MobileInstallationLinkedBundleIDsForIdentity(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v4 = [v3 bundleID];
  if (([v4 isEqualToString:@"com.apple.Playgrounds"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.mock.Playgrounds"] & 1) != 0)
  {
    id v5 = objc_opt_new();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __MobileInstallationLinkedBundleIDsForIdentity_block_invoke;
    v10[3] = &unk_1E60C54A0;
    v10[4] = &v17;
    v10[5] = &v11;
    [v5 linkedBundleIDsForAppIdentity:v3 withCompletion:v10];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
    id v5 = (void *)v12[5];
    void v12[5] = v6;
  }

  id v7 = (void *)v12[5];
  if (a2 && !v7)
  {
    *a2 = (id) v18[5];
    id v7 = (void *)v12[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_1B50A0218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationLinkedBundleIDsForIdentity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

uint64_t MIGetBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [a1 objectForKeyedSubscript:v5];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a3 = [v6 BOOLValue];
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }
    else
    {
      a3 = 0;
    }
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (MIGetBooleanEntitlement(v5, *(void **)(*((void *)&v13 + 1) + 8 * v10), a3))
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

uint64_t MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0);
}

uint64_t MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.container-required", 1);
}

uint64_t MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-container", 0);
}

uint64_t MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-sandbox", 0);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"seatbelt-profiles"];
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"platform-application", 0);
}

uint64_t MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.security.system-container", 0);
}

uint64_t MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0);
}

uint64_t MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.system-application", 0);
}

uint64_t MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.webkit.pushbundle", 0);
}

uint64_t MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.marketplace.app-installation", 0);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  uint64_t v1 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  BOOL v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v1];

  return v2;
}

uint64_t MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  uint64_t v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return _MICommonCopyGroupEntitlement(a1, @"com.apple.security.application-groups");
}

id _MICommonCopyGroupEntitlement(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (isKindOfClass)
  {
    if (MIArrayContainsOnlyClass(v4))
    {
      id v6 = v4;
LABEL_7:
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      uint64_t v8 = [v7 allObjects];

      goto LABEL_16;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
LABEL_13:
    MOLogWrite();
LABEL_14:
    id v6 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  if (v6) {
    goto LABEL_7;
  }
LABEL_15:
  uint64_t v8 = 0;
LABEL_16:

  return v8;
}

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  uint64_t v1 = _MICommonCopyGroupEntitlement(a1, @"com.apple.security.application-groups");
  BOOL v2 = v1 != 0;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1 = a1;
  BOOL v2 = _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-groups");
  id v3 = v2;
  if (!v2 || ![v2 count])
  {
    uint64_t v4 = _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-group-containers");

    id v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  id v1 = MICopySystemGroupEntitlement(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.on-demand-install-capable", 0);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.parent-application-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"application-identifier"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"previous-application-identifiers"];
  objc_opt_class();
  id v2 = MIArrayifyThing(v1);

  return v2;
}

uint64_t MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"beta-reports-active", 0);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"keychain-access-groups"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

uint64_t MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.swift-playgrounds-app", 0);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  id v1 = MICopyAppManagementDomainEntitlement(a1);
  uint64_t v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.networking.networkextension"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.associated-appclip-app-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

uint64_t MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.driverkit", 0);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (!v4)
  {
    id v5 = [v1 objectForKeyedSubscript:@"data-protection-class"];
    objc_opt_class();
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      uint64_t v7 = [v1 objectForKeyedSubscript:@"DataProtectionClass"];
      objc_opt_class();
      id v8 = v7;
      if (objc_opt_isKindOfClass()) {
        id v4 = v8;
      }
      else {
        id v4 = 0;
      }
    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    id v4 = v2;
  }
  else
  {
    objc_opt_class();
    id v5 = v2;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

uint64_t MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.host", 0);
}

uint64_t MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.embedded-web-browser-engine", 0);
}

uint64_t MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.rendering", 0);
}

uint64_t MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.networking", 0);
}

uint64_t MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.webcontent", 0);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-accept"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-send"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser", 0);
}

uint64_t MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.browser.app-installation", 0);
}

uint64_t MISystemAppMigrationHasCompleted()
{
  uint64_t v0 = [MEMORY[0x1E4F6F5C0] sharedInstance];
  id v1 = [v0 migrationPlistURL];
  uint64_t v2 = MIIsBuildUpgrade() ^ 1;

  return v2;
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  long long v9 = (void *)[v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_1E60C54C8;
  void v8[4] = &v9;
  void v8[5] = a2;
  void v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B50A26A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MIDictionaryContainsOnlyClasses_block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = [NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (MIArrayContainsOnlyClass(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        v6[0] = v1;
        id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (MIArrayContainsOnlyClass(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

id MIEnumerateContainersOfClass(void *a1, uint64_t a2, void *a3)
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F6F5B8] defaultManager];
  id v8 = v5;
  uint64_t v9 = v8;
  switch(a2)
  {
    case 1:
      long long v10 = &unk_1F0DCF170;
      goto LABEL_14;
    case 2:
      v26[0] = @"mobile";
      v26[1] = @"Containers";
      v26[2] = @"Data";
      v26[3] = @"Application";
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      char v12 = v26;
      goto LABEL_12;
    case 4:
      v25[0] = @"mobile";
      v25[1] = @"Containers";
      v25[2] = @"Data";
      v25[3] = @"PluginKitPlugin";
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      char v12 = v25;
      goto LABEL_12;
    case 7:
      v24[0] = @"mobile";
      v24[1] = @"Containers";
      v24[2] = @"Shared";
      v24[3] = @"AppGroup";
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      char v12 = v24;
      goto LABEL_12;
    case 10:
      v23[0] = @"mobile";
      v23[1] = @"Containers";
      v23[2] = @"Data";
      v23[3] = @"InternalDaemon";
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      char v12 = v23;
LABEL_12:
      long long v14 = [v11 arrayWithObjects:v12 count:4];
      long long v15 = objc_msgSend(v9, "MI_URLByAppendingPathComponents:lastIsDirectory:", v14, 1);

      goto LABEL_15;
    case 12:
      long long v10 = &unk_1F0DCF188;
      goto LABEL_14;
    case 13:
      long long v10 = &unk_1F0DCF1A0;
LABEL_14:
      long long v15 = objc_msgSend(v8, "MI_URLByAppendingPathComponents:lastIsDirectory:", v10, 1);
LABEL_15:

      if (!v15) {
        goto LABEL_18;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __MIEnumerateContainersOfClass_block_invoke;
      v21[3] = &unk_1E60C54F0;
      id v22 = v6;
      uint64_t v16 = [v7 enumerateURLsForItemsInDirectoryAtURL:v15 ignoreSymlinks:1 withBlock:v21];

      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = v17;
      }
      else
      {
        uint64_t v18 = 0;
        id v17 = 0;
      }
      break;
    default:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }

LABEL_18:
      _CreateAndLogError((uint64_t)"MIEnumerateContainersOfClass", 75, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"Failed to get the path to containers of class %llu in %@", v13, a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      long long v15 = 0;
      uint64_t v18 = 0;
      break;
  }
  id v19 = v17;

  return v19;
}

uint64_t __MIEnumerateContainersOfClass_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1BA9969B0]();
  if (a3 == 4)
  {
    id v7 = [v5 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];
    id v18 = 0;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7 error:&v18];
    id v9 = v18;
    if (v8)
    {
      long long v10 = [v8 objectForKeyedSubscript:@"MCMMetadataIdentifier"];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      long long v14 = [v8 objectForKeyedSubscript:@"MCMMetadataInfo"];
      objc_opt_class();
      id v15 = v14;
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }

      uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        uint64_t v13 = 1;
        goto LABEL_15;
      }
      id v12 = [v7 path];
      MOLogWrite();
      uint64_t v13 = 1;
    }

LABEL_15:
    goto LABEL_16;
  }
  uint64_t v13 = 1;
LABEL_16:

  return v13;
}

void _MILogTransactionStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  switch(a2)
  {
    case 1:
      id v18 = "Start";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    case 2:
      if (!v16)
      {
        id v19 = "Fail";
        if (a3) {
          id v19 = "Success";
        }
        if ((unint64_t)(a1 - 1) > 0xD) {
          id v20 = "Unknown";
        }
        else {
          id v20 = off_1E60C5510[a1 - 1];
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%s (%s) : %s", v19, "End", v20, 0);
        goto LABEL_21;
      }
      break;
    case 3:
      id v18 = "Start (Asynch)";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    default:
      id v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        if ((unint64_t)(a1 - 1) > 0xD) {
          id v22 = "Unknown";
        }
        else {
          id v22 = off_1E60C5510[a1 - 1];
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%s : %s", v18, v22, v24, 0);
        uint64_t v21 = LABEL_21:;
        goto LABEL_22;
      }
      break;
  }
  uint64_t v21 = [[NSString alloc] initWithFormat:v16 arguments:&a9];
LABEL_22:
  uint64_t v23 = (void *)v21;
  +[AITransactionLog logStep:a1 byParty:7 phase:a2 success:a3 forBundleID:v14 persona:v15 description:v21];
}

void sub_1B50A42AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_1B50A51EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UUIDData()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  v2[1] = 0;
  MEMORY[0x1BA996EE0](v2);
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v2 length:16];
  return v0;
}

id MobileInstallerDelegateProtocolInterface()
{
  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerDelegateProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DD17F8];
    objc_storeWeak(&MobileInstallerDelegateProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  return WeakRetained;
}

id MobileInstallerProtocolInterface()
{
  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    WeakRetained = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DD4698];
    id v1 = ICLKnownBundleRecordClasses();
    id v2 = [v1 setByAddingObject:objc_opt_class()];

    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    id v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    [WeakRetained setClasses:v7 forSelector:sel_checkCapabilities_withOptions_completion_ argumentIndex:0 ofReply:0];

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    long long v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    [WeakRetained setClasses:v10 forSelector:sel_uninstallIdentifiers_withOptions_completion_ argumentIndex:0 ofReply:1];

    [WeakRetained setClasses:v2 forSelector:sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForFrameworkAtURL_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_cancelUpdateForStagedUUID_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_finalizeStagedInstallForUUID_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    objc_storeWeak(&MobileInstallerProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  return WeakRetained;
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierCountFilesInArchive()
{
  return MEMORY[0x1F410CFD0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNewWithSys()
{
  return MEMORY[0x1F410CFE8]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x1F410CFF0]();
}

uint64_t BOMCopierSetCopyFileUpdateHandler()
{
  return MEMORY[0x1F410D000]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1F410D008]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1F410D010]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x1F410D020]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1F410D028]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1F410D030]();
}

uint64_t BomSys_free()
{
  return MEMORY[0x1F410D038]();
}

uint64_t BomSys_init()
{
  return MEMORY[0x1F410D040]();
}

uint64_t BomSys_set_open()
{
  return MEMORY[0x1F410D048]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t ICLKnownBundleRecordClasses()
{
  return MEMORY[0x1F4124E10]();
}

uint64_t IFCaptureIconContent()
{
  return MEMORY[0x1F4124C88]();
}

uint64_t IFTopLevelAppBundlePlistKeys()
{
  return MEMORY[0x1F4124C90]();
}

uint64_t MIAssertHighResourceUsage()
{
  return MEMORY[0x1F4124E18]();
}

uint64_t MIAssumeIdentityOfUsername()
{
  return MEMORY[0x1F4124E20]();
}

uint64_t MIClearResourceAssertion()
{
  return MEMORY[0x1F4124E28]();
}

uint64_t MICopyCurrentBuildVersion()
{
  return MEMORY[0x1F4124E30]();
}

uint64_t MIIsBuildUpgrade()
{
  return MEMORY[0x1F4124E38]();
}

uint64_t MILoadInfoPlistWithError()
{
  return MEMORY[0x1F4124E40]();
}

uint64_t MILoadRawInfoPlist()
{
  return MEMORY[0x1F4124E48]();
}

uint64_t MIRestoreIdentity()
{
  return MEMORY[0x1F4124E50]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x1F412FD50]();
}

void NSLog(NSString *format, ...)
{
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1F40F6D48](code, *(void *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1F40F7120](path, *(void *)&flags, staticCode);
}

uint64_t TraverseDirectoryWithPostTraversal()
{
  return MEMORY[0x1F4124E60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1F40CDD20]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1F40CDD28](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1F40CDD30](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1F40CDD38](state, *(void *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

void uuid_generate(uuid_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}