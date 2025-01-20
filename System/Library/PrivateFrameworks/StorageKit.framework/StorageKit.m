SKStateTransitionEntry *transitionEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 action:a3 nextState:a4];
}

SKStateTransitionEntry *transitionEntrySEL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 selector:a3 nextState:a4];
}

SKStateTransitionEntry *endTransitionEntrySEL(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 selector:a3];
}

SKStateTransitionEntry *endTransitionEntry(uint64_t a1, uint64_t a2)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2];
}

void sub_23F4120BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41213C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F412214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F412310(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F4124A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F4126D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F4128D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_23F412A78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F413088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41321C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_23F4133C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F413570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F413760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F413CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F413E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F414974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F414B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F415020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41515C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F415290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F415728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_sync_exit(v33);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_23F415A08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F416214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_23F416A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_23F416C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_23F4170F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_23F4172B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SKHelperConnectionInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F325E08];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_eraseWithEraser_reply_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v14, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v0 setClasses:v12 forSelector:sel_eraseWithEraser_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

id SKHelperClientInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F324130];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_requestWithUUID_didCompleteWithResult_ argumentIndex:1 ofReply:0];

  return v0;
}

uint64_t schemeToFormat(uint64_t a1)
{
  if (a1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 16;
  }
  if (a1 == 1) {
    return 8;
  }
  else {
    return v1;
  }
}

uint64_t diskTypeToScheme(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kSKDiskTypeGPTWholeDisk[0]])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:kSKDiskTypeMBRWholeDisk[0]])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:kSKDiskTypeAPMWholeDisk[0]])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 512;
  }

  return v2;
}

void sub_23F41B2A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41B380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41BC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

id getPersonalityDict(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 infoDictionary];
  uint64_t v5 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:kExtensionAttributesKey];

    uint64_t v4 = (void *)v6;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"FSPersonalities"];
  uint64_t v8 = [v7 objectForKey:v3];

  return v8;
}

uint64_t getCaseSensitive(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 objectForKeyedSubscript:@"FSfileObjectsAreCaseSensitive"];
  if (isValidNSNumber(v4)) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = [v3 isEqualToString:@"NTFS"];
  }
  uint64_t v6 = v5;

  return v6;
}

void sub_23F41F01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F41F50C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41FC54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F41FE14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F420B4C(_Unwind_Exception *exception_object)
{
}

void sub_23F4216EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F421804(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id eraseDisk(void *a1, void *a2, void *a3)
{
  v63[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = +[SKEraseDisk eraseDiskWithRootDisk:v5 error:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 formattableFilesystems];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_4];
      v12 = [v10 filteredArrayUsingPredicate:v11];

      if ([v10 count])
      {
        v45 = [v12 firstObject];
        v13 = [v6 volumeName];
        v14 = +[SKVolumeDescriptor descriptorWithName:v13 filesystem:v45];

        if (v14)
        {
          uint64_t v15 = +[SKPartitionDescriptor descriptorWithVolume:v14];
          v44 = (void *)v15;
          if (v15)
          {
            v63[0] = v15;
            v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
            v43 = +[SKEraseDisk eraseDiskWithRootDisk:v5 descriptors:v16 error:a3];

            if (v43)
            {
              *(void *)&long long v58 = 0;
              *((void *)&v58 + 1) = &v58;
              uint64_t v59 = 0x3032000000;
              v60 = __Block_byref_object_copy__1;
              v61 = __Block_byref_object_dispose__1;
              id v62 = 0;
              uint64_t v50 = 0;
              v51 = &v50;
              uint64_t v52 = 0x3032000000;
              v53 = __Block_byref_object_copy__1;
              v54 = __Block_byref_object_dispose__1;
              id v55 = 0;
              v17 = SKGetOSLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v57 = v5;
                _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_DEFAULT, "Submitting erase on %@", buf, 0xCu);
              }

              v46[0] = MEMORY[0x263EF8330];
              v46[1] = 3221225472;
              v46[2] = __eraseDisk_block_invoke_31;
              v46[3] = &unk_26506BFB0;
              v48 = &v50;
              v49 = &v58;
              v18 = v7;
              v47 = v18;
              uint64_t v19 = [v43 eraseProgressReportingWithCompletionBlock:v46];
              v42 = [[SKProgressObserver alloc] initWithProgress:v19];
              dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
              uint64_t v20 = *((void *)&v58 + 1);
              v41 = (void *)v19;
              if (*(void *)(*((void *)&v58 + 1) + 40))
              {
                v21 = [(SKProgressObserver *)v42 messages];
                BOOL v22 = [v21 count] == 0;

                uint64_t v20 = *((void *)&v58 + 1);
                if (!v22)
                {
                  v23 = [*(id *)(*((void *)&v58 + 1) + 40) userInfo];
                  v40 = (void *)[v23 mutableCopy];

                  v24 = NSString;
                  v39 = [(SKProgressObserver *)v42 messages];
                  v25 = [v39 componentsJoinedByString:@"\n"];
                  v26 = [v24 stringWithFormat:@"%@", v25];
                  [v40 setObject:v26 forKey:*MEMORY[0x263F07F80]];

                  v27 = (void *)MEMORY[0x263F087E8];
                  v28 = [*(id *)(*((void *)&v58 + 1) + 40) domain];
                  uint64_t v29 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, objc_msgSend(*(id *)(*((void *)&v58 + 1) + 40), "code"), v40);
                  v30 = *(void **)(*((void *)&v58 + 1) + 40);
                  *(void *)(*((void *)&v58 + 1) + 40) = v29;

                  uint64_t v20 = *((void *)&v58 + 1);
                }
              }
              if (a3)
              {
                v31 = *(void **)(v20 + 40);
                if (v31) {
                  *a3 = v31;
                }
              }
              id v32 = (id)v51[5];

              _Block_object_dispose(&v50, 8);
              _Block_object_dispose(&v58, 8);

              uint64_t v9 = v43;
            }
            else
            {
              v37 = SKGetOSLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v58) = 136315138;
                *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * "
                                                "_Nonnull __strong, NSError *__autoreleasing * _Nullable)";
                _os_log_impl(&dword_23F40C000, v37, OS_LOG_TYPE_ERROR, "%s: Failed to initialize disk eraser", (uint8_t *)&v58, 0xCu);
              }

              uint64_t v9 = 0;
              id v32 = 0;
            }
          }
          else
          {
            v36 = SKGetOSLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v58) = 0;
              _os_log_impl(&dword_23F40C000, v36, OS_LOG_TYPE_ERROR, "Failed to create volume partition descriptor", (uint8_t *)&v58, 2u);
            }

            id v32 = +[SKError nilWithSKErrorCode:255 error:a3];
          }
        }
        else
        {
          v35 = SKGetOSLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v58) = 0;
            _os_log_impl(&dword_23F40C000, v35, OS_LOG_TYPE_ERROR, "Failed to create volume descriptor", (uint8_t *)&v58, 2u);
          }

          id v32 = +[SKError nilWithSKErrorCode:255 error:a3];
        }
      }
      else
      {
        v33 = +[SKBaseManager sharedManager];
        [v33 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_21];

        v34 = SKGetOSLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v58) = 0;
          _os_log_impl(&dword_23F40C000, v34, OS_LOG_TYPE_FAULT, "Failed to find supported file systems", (uint8_t *)&v58, 2u);
        }

        id v32 = +[SKError nilWithSKErrorCode:255 error:a3];
      }
    }
    else
    {
      v12 = SKGetOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v58) = 136315138;
        *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * _Nonnull"
                                        " __strong, NSError *__autoreleasing * _Nullable)";
        _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_ERROR, "%s: Failed to get formattable filesystems", (uint8_t *)&v58, 0xCu);
      }
      id v32 = 0;
    }
  }
  else
  {
    uint64_t v9 = SKGetOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v58) = 136315138;
      *(void *)((char *)&v58 + 4) = "SKDisk *eraseDisk(SKDisk * _Nonnull __strong, SKDiskImageCreateParams * _Nonnull _"
                                      "_strong, NSError *__autoreleasing * _Nullable)";
      _os_log_impl(&dword_23F40C000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to initialize disk eraser", (uint8_t *)&v58, 0xCu);
    }
    id v32 = 0;
  }

  return v32;
}

void sub_23F422D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __eraseDisk_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEncrypted]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isExtension] ^ 1;
  }

  return v3;
}

id __eraseDisk_block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKDiskImage.m", 44);
  v4[0] = v0;
  id v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
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

void __eraseDisk_block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v11 = SKGetOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "Erase on %@ done", (uint8_t *)&v12, 0xCu);
  }
}

void sub_23F4230D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    uint64_t v11 = +[SKBaseManager sharedManager];
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_43];

    int v12 = SKGetOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v10;
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_FAULT, "Unhandled exception during create: %@", (uint8_t *)&a9, 0xCu);
    }

    +[SKError nilWithSKErrorCode:255 error:v9];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x23F423084);
  }
  _Unwind_Resume(exception_object);
}

void sub_23F423764(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x23F4236BCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_23F4240F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    uint64_t v11 = +[SKBaseManager sharedManager];
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_60];

    int v12 = SKGetOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v10;
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_FAULT, "Unhandled exception during attach: %@", (uint8_t *)&a9, 0xCu);
    }

    +[SKError nilWithSKErrorCode:251 error:v9];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x23F4240A8);
  }
  _Unwind_Resume(exception_object);
}

void sub_23F425354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F4254AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F425604(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F426504(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F426730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F426B14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F427BD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F427CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F427D30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id base64Encode(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", a1, a2);
  uint64_t v3 = [v2 dataUsingEncoding:4];
  uint64_t v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

id SKGetOSLog()
{
  if (SKGetOSLog_onceToken != -1) {
    dispatch_once(&SKGetOSLog_onceToken, &__block_literal_global_5);
  }
  if (logToSys) {
    v0 = &osLogInstallObject;
  }
  else {
    v0 = &osLogObject;
  }
  id v1 = (void *)*v0;

  return v1;
}

uint64_t __SKGetOSLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.storagekit", "general");
  id v1 = (void *)osLogObject;
  osLogObject = (uint64_t)v0;

  osLogInstallObject = (uint64_t)os_log_create("com.apple.storagekit", "storagekit-install");

  return MEMORY[0x270F9A758]();
}

void SKLogSetLogsToConsole()
{
  os_log_t v0 = SKGetOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_23F40C000, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToConsole/Std is deprecated. Please remove this call", v1, 2u);
  }
}

void SKLogSetLogsToStd()
{
  os_log_t v0 = SKGetOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_23F40C000, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToStd is deprecated. Please remove this call", v1, 2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  logToSys = result;
  return result;
}

void SKLogArrayRedacted(os_log_type_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = a2;
    _os_log_impl(&dword_23F40C000, v6, a1, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = SKGetOSLog();
        if (os_log_type_enabled(v13, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl(&dword_23F40C000, v13, a1, "%@", buf, 0xCu);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void sub_23F428C14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F428CF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F42D3C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id alignResizeLimits(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 minBytes] & 0xFFF;
  unint64_t v3 = [v1 minBytes];
  if (v2) {
    unint64_t v3 = v3 - ([v1 minBytes] & 0xFFF) + 4096;
  }
  if (v3 <= [v1 currentBytes]) {
    [v1 setMinBytes:v3];
  }
  uint64_t v4 = [v1 maxBytes];
  unint64_t v5 = v4 - ([v1 maxBytes] & 0xFFF);
  if (v5 >= [v1 currentBytes]) {
    [v1 setMaxBytes:v5];
  }

  return v1;
}

void sub_23F42F7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void tagQueue(void *a1, const void *a2)
{
  queue = a1;
  unint64_t v3 = malloc_type_calloc(8uLL, 1uLL, 0x50B26848uLL);
  void *v3 = 1;
  dispatch_queue_set_specific(queue, a2, v3, MEMORY[0x263EF88C0]);
}

void *currentQueueIsMainQueue()
{
  if (currentQueueIsMainQueue_once != -1) {
    dispatch_once(&currentQueueIsMainQueue_once, &__block_literal_global_8);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0);
  }
  return result;
}

void __currentQueueIsMainQueue_block_invoke()
{
}

uint64_t isValidNSNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL isValidNSString(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 length] != 0;

  return v2;
}

uint64_t isValidNSDictionary(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t isValidNSArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t isValidNSData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t NSNumberToBool(void *a1)
{
  id v1 = a1;
  if (isValidNSNumber(v1)) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t NSNumberToULongLong(void *a1)
{
  id v1 = a1;
  if (isValidNSNumber(v1)) {
    uint64_t v2 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NSStringOrEmpty(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1)) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = &stru_26F313B30;
  }
  unint64_t v3 = v2;

  return v3;
}

BOOL isStringValidUUID(void *a1)
{
  id v1 = a1;
  if (isValidNSString(v1))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v1];
    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t isOptionalString(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalArray(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalDict(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isOptionalNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t isEqualOrBothNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

id commaSeparatedDiskListFromArray(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v1 objectAtIndex:v3];
      unint64_t v5 = [v4 volumeName];

      if (v5) {
        [v4 volumeName];
      }
      else {
      id v6 = [v4 diskIdentifier];
      }
      [v2 appendString:v6];

      if (v3 != [v1 count] - 1) {
        [v2 appendString:@", "];
      }
      if (v3 == [v1 count] - 2) {
        [v2 appendString:@"and "];
      }

      ++v3;
    }
    while ([v1 count] > v3);
  }

  return v2;
}

id userInfoWithDebugDescription(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v5 = *MEMORY[0x263F07F80];
    v6[0] = a1;
    id v1 = NSDictionary;
    id v2 = a1;
    unint64_t v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

void sub_23F435120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_23F4352C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F4359E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_23F435B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F43684C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_23F43858C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (void *)sub_23F4390D0();
  v8[4] = a3;
  v8[5] = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_23F438648;
  v8[3] = &block_descriptor;
  id v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v7);
}

id sub_23F438648(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_23F438F2C();
    uint64_t v4 = (void *)sub_23F4390B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_23F43881C(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_23F438F2C();
  uint64_t v3 = sub_23F4390C0();

  return v3;
}

id SKCoreAnalyticsSink.init()()
{
  return sub_23F438BA4(type metadata accessor for SKCoreAnalyticsSink);
}

uint64_t type metadata accessor for SKCoreAnalyticsSink()
{
  return self;
}

id SKCoreAnalyticsSink.__deallocating_deinit()
{
  return sub_23F438C50(type metadata accessor for SKCoreAnalyticsSink);
}

void sub_23F4388F8()
{
  qword_26AC21EB8 = MEMORY[0x263F8EE78];
}

uint64_t static SKAnalyticsHub.addSink(_:)()
{
  if (qword_26AC21EC0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_unknownObjectRetain();
  MEMORY[0x2455CA850](v0);
  if (*(void *)((qword_26AC21EB8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26AC21EB8 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_23F439110();
  sub_23F439120();
  sub_23F439100();
  return swift_endAccess();
}

id SKAnalyticsHub.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SKAnalyticsHub.init()()
{
  return sub_23F438BA4(type metadata accessor for SKAnalyticsHub);
}

id sub_23F438BA4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_23F438BF4(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id SKAnalyticsHub.__deallocating_deinit()
{
  return sub_23F438C50(type metadata accessor for SKAnalyticsHub);
}

id sub_23F438C50(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t _s10StorageKit14SKAnalyticsHubC9sendEvent4name19eventPayloadBuilderySS_SDySSSo8NSObjectCGSgyctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_26AC21EC0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = qword_26AC21EB8;
  if (!((unint64_t)qword_26AC21EB8 >> 62))
  {
    uint64_t v6 = *(void *)((qword_26AC21EB8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v6) {
      goto LABEL_5;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_23F439140();
  uint64_t v6 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_5:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        uint64_t v9 = (void *)MEMORY[0x2455CA890](v8, v5);
      }
      else
      {
        uint64_t v9 = *(void **)(v5 + 8 * v8 + 32);
        swift_unknownObjectRetain();
      }
      ++v8;
      uint64_t v10 = (void *)sub_23F4390D0();
      aBlock[4] = a3;
      aBlock[5] = a4;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_23F438648;
      aBlock[3] = &block_descriptor_17;
      uint64_t v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v9, sel_sendEventWithName_eventPayloadBuilder_, v10, v11);
      _Block_release(v11);
      swift_unknownObjectRelease();
    }
    while (v6 != v8);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SKAnalyticsHub()
{
  return self;
}

uint64_t method lookup function for SKCoreAnalyticsSink(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SKCoreAnalyticsSink);
}

uint64_t dispatch thunk of SKCoreAnalyticsSink.sendEvent(name:eventPayloadBuilder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t sub_23F438EEC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23F438F24()
{
  return sub_23F43881C(*(void *)(v0 + 16));
}

unint64_t sub_23F438F2C()
{
  unint64_t result = qword_268C3D2D8;
  if (!qword_268C3D2D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C3D2D8);
  }
  return result;
}

uint64_t sub_23F4390B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23F4390C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23F4390D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23F4390E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23F4390F0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23F439100()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23F439110()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23F439120()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23F439130()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23F439140()
{
  return MEMORY[0x270F9F080]();
}

uint64_t APFSContainerGetMinimalSize()
{
  return MEMORY[0x270F08AD0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x270EE45C0](allocator, directoryURL, bundleType);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  return MEMORY[0x270F26460](disk);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

uint64_t IOJobDispose()
{
  return MEMORY[0x270F49B10]();
}

uint64_t IOJobInitiate()
{
  return MEMORY[0x270F49B18]();
}

uint64_t IOJobSetup()
{
  return MEMORY[0x270F49B20]();
}

kern_return_t IOKitWaitQuiet(mach_port_t mainPort, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF47A0](*(void *)&mainPort, waitTime);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

uint64_t MKCFBuildPartition()
{
  return MEMORY[0x270F49B28]();
}

uint64_t MKCFCreateFSInfo()
{
  return MEMORY[0x270F49B30]();
}

uint64_t MKCFCreateMap()
{
  return MEMORY[0x270F49B38]();
}

uint64_t MKCFCreateMedia()
{
  return MEMORY[0x270F49B40]();
}

uint64_t MKCFDisposeMedia()
{
  return MEMORY[0x270F49B48]();
}

uint64_t MKCFReadMedia()
{
  return MEMORY[0x270F49B50]();
}

uint64_t MKCFUpdateScheme()
{
  return MEMORY[0x270F49B58]();
}

uint64_t MKCFWriteMedia()
{
  return MEMORY[0x270F49B60]();
}

uint64_t MKCFWriteScheme()
{
  return MEMORY[0x270F49B68]();
}

uint64_t MKHFSGetResizeLimits()
{
  return MEMORY[0x270F49B78]();
}

uint64_t MKMediaCreateWithPath()
{
  return MEMORY[0x270F49B98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x270EE55E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

void syslog(int a1, const char *a2, ...)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

uint64_t wipefs_alloc()
{
  return MEMORY[0x270F9BA28]();
}

uint64_t wipefs_free()
{
  return MEMORY[0x270F9BA30]();
}

uint64_t wipefs_wipe()
{
  return MEMORY[0x270F9BA38]();
}