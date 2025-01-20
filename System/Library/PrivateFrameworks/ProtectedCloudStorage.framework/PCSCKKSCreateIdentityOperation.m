@interface PCSCKKSCreateIdentityOperation
- (PCSCKKSCreateIdentityOperation)initWithItemModifyContext:(id)a3;
- (PCSCKKSItemModifyContext)context;
- (int)addAndNotifyOnSync:(_PCSIdentityData *)a3 attributes:(__CFDictionary *)a4 returnAttributes:(const __CFDictionary *)a5 complete:(id)a6;
- (void)createPCSIdentity;
- (void)itemStored:(id)a3;
- (void)setContext:(id)a3;
- (void)setIdentityToCurrent;
- (void)start;
- (void)storePCSIdentity:(_PCSIdentityData *)a3;
@end

@implementation PCSCKKSCreateIdentityOperation

- (PCSCKKSCreateIdentityOperation)initWithItemModifyContext:(id)a3
{
  id v5 = a3;
  if ((PCSCurrentPersonaMatchesDSIDFromSet([v5 set]) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v5
    || ([v5 service], v6 = objc_claimAutoreleasedReturnValue(), v6, !v6)
    || (v13.receiver = self,
        v13.super_class = (Class)PCSCKKSCreateIdentityOperation,
        v7 = [(PCSCKKSCreateIdentityOperation *)&v13 init],
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = NSString;
  v9 = [(PCSCKKSItemModifyContext *)self->_context service];
  v10 = [v8 stringWithFormat:@"CreateIdentityOperation service: %@", v9];
  [(PCSCKKSCreateIdentityOperation *)self setName:v10];

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (void)start
{
  v26[1] = *MEMORY[0x1E4F143B8];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), @"Starting: %s", "-[PCSCKKSCreateIdentityOperation start]");
  if (![(PCSCKKSOperation *)self startOperation]) {
    return;
  }
  v3 = [(PCSCKKSCreateIdentityOperation *)self context];
  char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_14;
  }
  if (![(PCSCKKSItemModifyContext *)self->_context roll])
  {
    uint64_t v5 = [(PCSCKKSItemModifyContext *)self->_context existingItemReference];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(PCSCKKSItemModifyContext *)self->_context currentIdentity];

      if (v7)
      {
        PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Have an identity and no need to create a new");
        [(PCSCKKSItemModifyContext *)self->_context setReturnedExistingIdentity:1];
        v8 = [(PCSCKKSItemModifyContext *)self->_context mtt];
        [v8 setReturnedExistingIdentity:1];

        [(PCSCKKSOperation *)self completeOperation];
        return;
      }
    }
  }
  uint64_t v9 = [(PCSCKKSItemModifyContext *)self->_context server_NextRollDate];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(PCSCKKSItemModifyContext *)self->_context server_NextRollDate];
    v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [v11 compare:v12];

    if (v13 == 1)
    {
      v14 = [(PCSCKKSItemModifyContext *)self->_context log];
      v15 = [(PCSCKKSItemModifyContext *)self->_context server_NextRollDate];
      PCSMigrationLog((uint64_t)v14, @"Server denied keyrolling until %@", v15);

      v16 = (void *)MEMORY[0x1E4F28C58];
      v17 = kPCSErrorDomain;
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v18 = NSString;
      v19 = [(PCSCKKSItemModifyContext *)self->_context service];
      v20 = [(PCSCKKSItemModifyContext *)self->_context server_NextRollDate];
      v21 = [v18 stringWithFormat:@"Server wants service %@ to keyroll next time at %@", v19, v20];
      v26[0] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v23 = [v16 errorWithDomain:v17 code:100 userInfo:v22];
      [(PCSCKKSOperation *)self setError:v23];

      [(PCSCKKSItemModifyContext *)self->_context resetIdentities];
LABEL_14:
      [(PCSCKKSOperation *)self completeOperation];
      return;
    }
  }
  [(PCSCKKSCreateIdentityOperation *)self createPCSIdentity];
}

- (void)createPCSIdentity
{
  v16 = 0;
  v3 = [(PCSCKKSCreateIdentityOperation *)self context];
  char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v15, 2u);
    }
    goto LABEL_11;
  }
  uint64_t v5 = [(PCSCKKSItemModifyContext *)self->_context set];
  v6 = _PCSIdentitySetCopyCurrentIdentityInternal((uint64_t)v5, kPCSServiceMaster, (const void **)&v16);
  if (!v6)
  {
    uint64_t v13 = v16;
    [(PCSCKKSOperation *)self setError:v16];

LABEL_11:
    [(PCSCKKSOperation *)self completeOperation];
    return;
  }
  v7 = v6;
  v8 = [(PCSCKKSItemModifyContext *)self->_context service];
  int IsManatee = PCSServiceItemTypeIsManatee(v8);

  if (IsManatee) {
    char v10 = 5;
  }
  else {
    char v10 = 1;
  }
  v11 = [(PCSCKKSItemModifyContext *)self->_context service];
  Service = PCSIdentityCreateService((uint64_t)v7, v10, v11, (const void **)&v16);

  if (Service)
  {
    [(PCSCKKSCreateIdentityOperation *)self storePCSIdentity:Service];
    CFRelease(Service);
  }
  else
  {
    v14 = v16;
    [(PCSCKKSOperation *)self setError:v16];

    [(PCSCKKSOperation *)self completeOperation];
  }
  CFRelease(v7);
}

- (void)storePCSIdentity:(_PCSIdentityData *)a3
{
  v132[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  char v119 = 0;
  uint64_t v5 = [(PCSCKKSCreateIdentityOperation *)self context];
  char v6 = PCSCurrentPersonaMatchesDSIDFromSet([v5 set]);

  if (v6)
  {
    v7 = [(PCSCKKSCreateIdentityOperation *)self context];
    v8 = [v7 mtt];
    v104 = [v8 measurePoint:@"PCSStoreIdentity"];

    uint64_t v9 = [(PCSCKKSItemModifyContext *)self->_context dsid];
    theDict = (__CFDictionary *)_PCSIdentityCopyKeychainAttributes((uint64_t)a3);

    if (!theDict)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      v41 = kPCSErrorDomain;
      uint64_t v131 = *MEMORY[0x1E4F28568];
      v42 = [NSString stringWithFormat:@"Failed to get attributes from %@", a3];
      v132[0] = v42;
      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:&v131 count:1];
      v44 = [v40 errorWithDomain:v41 code:101 userInfo:v43];
      [(PCSCKKSOperation *)self setError:v44];

      [v104 complete:0];
      [(PCSCKKSOperation *)self completeOperation];
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v10 = *MEMORY[0x1E4F3BC78];
    v11 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F3BC78], (const void *)*MEMORY[0x1E4F1CFD0]);
    uint64_t v12 = *MEMORY[0x1E4F3BC68];
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F3BC68], v11);
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    dispatch_queue_t v15 = dispatch_queue_create("PCSAddIdentitySyncQueue", 0);
    CFRetain(a3);
    context = self->_context;
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke;
    v111[3] = &unk_1E5E6E060;
    v100 = v117;
    objc_copyWeak(v117, &location);
    v117[1] = a3;
    dispatch_semaphore_t dsema = v13;
    dispatch_semaphore_t v112 = dsema;
    id v113 = v104;
    dispatch_semaphore_t v103 = v14;
    dispatch_semaphore_t v114 = v103;
    dispatch_queue_t queue = v15;
    dispatch_queue_t v115 = queue;
    v116 = v118;
    v17 = theDict;
    uint64_t v18 = [(PCSCKKSCreateIdentityOperation *)self addAndNotifyOnSync:a3 attributes:theDict returnAttributes:&context->_rollAttributes complete:v111];
    uint64_t v19 = v18;
    if (v18)
    {
      if (v18 == -25299)
      {
        PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Item already in keychain, find it so we can set it to current");
        uint64_t PublicKey = PCSIdentityGetPublicKey((uint64_t)a3);
        CFTypeRef cf = 0;
        uint64_t ServiceViewHint = PCSIdentityGetServiceViewHint((uint64_t)a3);
        if (ServiceViewHint)
        {
          ServiceAccessGroup = PCSIdentityGetServiceAccessGroup((uint64_t)a3);
          v23 = kPCSServiceName[0];
          [(PCSCKKSItemModifyContext *)self->_context dsid];
          v99 = v11;
          v97 = v11;
          uint64_t v98 = v12;
          uint64_t v95 = ServiceViewHint;
          v93 = uint64_t v96 = v10;
          uint64_t v94 = *MEMORY[0x1E4F3B870];
          uint64_t v92 = *MEMORY[0x1E4F3B848];
          v90 = v23;
          uint64_t v91 = *MEMORY[0x1E4F3B5C0];
          uint64_t v89 = *MEMORY[0x1E4F3B838];
          v87 = v11;
          uint64_t v88 = *MEMORY[0x1E4F3B550];
          uint64_t v86 = *MEMORY[0x1E4F3BD08];
          MutableForCFTypesWith = CFDictionaryCreateMutableForCFTypesWith((int)v93, v24, v25, v26, v27, v28, v29, v30, (void *)*MEMORY[0x1E4F3B978], *MEMORY[0x1E4F3B998]);

          if (PCSUseSyncKeychain) {
            CFDictionarySetValue(MutableForCFTypesWith, (const void *)*MEMORY[0x1E4F3B878], v11);
          }
          uint64_t v32 = _PCSKeychainForwardTable(MutableForCFTypesWith, &cf);
          CFRelease(MutableForCFTypesWith);
          if (!v32)
          {
            if (cf)
            {
              CFTypeID v33 = CFGetTypeID(cf);
              if (v33 == CFDictionaryGetTypeID())
              {
                v34 = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F3B830]);
                v35 = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F3BD40]);
                if (!v35 || !v34)
                {
                  v78 = [(PCSCKKSCreateIdentityOperation *)self context];
                  [v78 resetIdentities];

                  v79 = (void *)MEMORY[0x1E4F28C58];
                  v80 = kPCSErrorDomain;
                  uint64_t v125 = *MEMORY[0x1E4F28568];
                  objc_msgSend(NSString, "stringWithFormat:", @"Failed to find manatee identity %@: %d", a3, 0, v86, v87, v88, ServiceAccessGroup, v89, v90, v91, PublicKey, v92, v93, v94, v95, v96, v97,
                    v98,
                    v99,
                    0,
                  v81 = v117);
                  v126 = v81;
                  v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
                  v83 = [v79 errorWithDomain:v80 code:114 userInfo:v82];
                  [(PCSCKKSOperation *)self setError:v83];

                  v84 = [(PCSCKKSItemModifyContext *)self->_context log];
                  v85 = [(PCSCKKSOperation *)self error];
                  PCSMigrationLog((uint64_t)v84, @"Failed to find %@ from local keychain: %@", a3, v85);

                  [(PCSCKKSOperation *)self completeOperation];
                  CFRelease(cf);
                  CFRelease(theDict);

                  goto LABEL_27;
                }
                PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Setting already stored identity %@ with pref %@ to current", a3, v35, v86, v87, v88, ServiceAccessGroup, v89, v90, v91, PublicKey, v92, v93, v94, ServiceViewHint, v96, v97, v98,
                  v99,
                  0,
                  v117);
                v36 = [(PCSCKKSCreateIdentityOperation *)self context];
                [v36 setRollItemReference:v35];

                v37 = [(PCSCKKSCreateIdentityOperation *)self context];
                [v37 setRollItemSHA1:v34];

                CFTypeRef v38 = CFRetain(a3);
                v39 = [(PCSCKKSCreateIdentityOperation *)self context];
                [v39 setRollIdentity:v38];

                [(PCSCKKSCreateIdentityOperation *)self setIdentityToCurrent];
                CFRelease(cf);

                v17 = theDict;
                goto LABEL_23;
              }
            }
          }
          v63 = [(PCSCKKSCreateIdentityOperation *)self context];
          [v63 resetIdentities];

          v64 = (void *)MEMORY[0x1E4F28C58];
          v65 = kPCSErrorDomain;
          uint64_t v127 = *MEMORY[0x1E4F28568];
          objc_msgSend(NSString, "stringWithFormat:", @"Failed to find manatee identity %@: %d", a3, v32, v86, v11, v88, ServiceAccessGroup, v89, v90, v91, PublicKey, v92, v93, v94, v95, v10, v11,
            v98,
            v11,
            0,
          v66 = v117);
          v128 = v66;
          v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
          v68 = [v64 errorWithDomain:v65 code:114 userInfo:v67];
          [(PCSCKKSOperation *)self setError:v68];

          v69 = [(PCSCKKSItemModifyContext *)self->_context log];
          v70 = [(PCSCKKSOperation *)self error];
          PCSMigrationLog((uint64_t)v69, @"Failed to find in local keychain: %@", v70);
        }
        else
        {
          v71 = [(PCSCKKSCreateIdentityOperation *)self context];
          [v71 resetIdentities];

          v72 = (void *)MEMORY[0x1E4F28C58];
          v73 = kPCSErrorDomain;
          uint64_t v129 = *MEMORY[0x1E4F28568];
          v74 = [NSString stringWithFormat:@"Failed  get view hint from identity %@", a3];
          v130 = v74;
          v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
          v76 = [v72 errorWithDomain:v73 code:113 userInfo:v75];
          [(PCSCKKSOperation *)self setError:v76];

          v77 = [(PCSCKKSItemModifyContext *)self->_context log];
          v70 = [(PCSCKKSOperation *)self error];
          PCSMigrationLog((uint64_t)v77, @"Set current: %@", v70);
        }

        [(PCSCKKSOperation *)self completeOperation];
        CFRelease(theDict);
        goto LABEL_27;
      }
      v54 = [(PCSCKKSCreateIdentityOperation *)self context];
      [v54 resetIdentities];

      v55 = (void *)MEMORY[0x1E4F28C58];
      v56 = kPCSErrorDomain;
      uint64_t v123 = *MEMORY[0x1E4F28568];
      v57 = [NSString stringWithFormat:@"Failed to store manatee identity %@ with error: %d", a3, v19];
      v124 = v57;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      v59 = [v55 errorWithDomain:v56 code:115 userInfo:v58];
      [(PCSCKKSOperation *)self setError:v59];

      v60 = [(PCSCKKSItemModifyContext *)self->_context log];
      v61 = [(PCSCKKSItemModifyContext *)self->_context service];
      v62 = [(PCSCKKSOperation *)self error];
      PCSMigrationLog((uint64_t)v60, @"Failed to store service %@ to local keychain: %@", v61, v62);

      [(PCSCKKSOperation *)self completeOperation];
      v17 = theDict;
      CFRelease(a3);
    }
    else
    {
      dispatch_semaphore_signal(dsema);
      dispatch_time_t v45 = dispatch_time(0, 1000000000 * [(PCSCKKSItemModifyContext *)self->_context timeoutValue]);
      if (dispatch_semaphore_wait(v103, v45))
      {
        CFTypeRef cf = 0;
        p_CFTypeRef cf = &cf;
        uint64_t v109 = 0x2020000000;
        char v110 = 0;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_2;
        block[3] = &unk_1E5E6E038;
        block[4] = &cf;
        block[5] = v118;
        dispatch_sync(queue, block);
        if (!*((unsigned char *)p_cf + 24))
        {
          v46 = (void *)MEMORY[0x1E4F28C58];
          v47 = kPCSErrorDomain;
          uint64_t v121 = *MEMORY[0x1E4F28568];
          v48 = [NSString stringWithFormat:@"Failed to store manatee identity %@, operation timed out", a3];
          v122 = v48;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          v50 = [v46 errorWithDomain:v47 code:116 userInfo:v49];
          [(PCSCKKSOperation *)self setError:v50];

          v51 = [(PCSCKKSItemModifyContext *)self->_context log];
          v52 = [(PCSCKKSItemModifyContext *)self->_context service];
          v53 = [(PCSCKKSOperation *)self error];
          PCSMigrationLog((uint64_t)v51, @"Failed to store service %@ to CKKS: %@", v52, v53);

          [(PCSCKKSOperation *)self completeOperation];
          v17 = theDict;
        }
        _Block_object_dispose(&cf, 8);
      }
    }
LABEL_23:
    CFRelease(v17);
LABEL_27:

    objc_destroyWeak(v100);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(cf) = 0;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", (uint8_t *)&cf, 2u);
  }
  [(PCSCKKSOperation *)self completeOperation];
LABEL_29:
  _Block_object_dispose(v118, 8);
  objc_destroyWeak(&location);
}

void __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(NSObject **)(a1 + 32);
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * [WeakRetained[34] timeoutValue]);
    if (dispatch_semaphore_wait(v8, v9))
    {
      uint64_t v10 = [v7[34] log];
      v11 = [v7[34] service];
      PCSMigrationLog(v10, @"Timed out waiting for add to complete: %@", v11);

      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      dispatch_semaphore_t v13 = kPCSErrorDomain;
      uint64_t v48 = *MEMORY[0x1E4F28568];
      dispatch_semaphore_t v14 = NSString;
      dispatch_queue_t v15 = [v7[34] service];
      v16 = [v14 stringWithFormat:@"timeout waiting SecItemAdd for service: %@", v15];
      v49[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      uint64_t v18 = [v12 errorWithDomain:v13 code:110 userInfo:v17];
      [v7 setError:v18];

      [v7 completeOperation];
      [*(id *)(a1 + 40) complete:0];
      CFRelease(*(CFTypeRef *)(a1 + 80));
    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      *(void *)buf = 0;
      v41 = buf;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_30;
      block[3] = &unk_1E5E6E038;
      v20 = *(NSObject **)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      block[4] = buf;
      block[5] = v21;
      dispatch_sync(v20, block);
      if (!v41[24])
      {
        Value = CFDictionaryGetValue(*((CFDictionaryRef *)v7[34] + 1), (const void *)*MEMORY[0x1E4F3BD40]);
        v23 = (CFDictionaryRef *)v7[34];
        if (a2 && v23[1])
        {
          int v24 = CFDictionaryGetValue(v23[1], (const void *)*MEMORY[0x1E4F3B830]);
          if (Value && (int v25 = v24) != 0)
          {
            PCSMigrationLog([v7[34] log], @"Stored identity with pref: %@", Value);
            [v7[34] setRollItemReference:Value];
            [v7[34] setRollItemSHA1:v25];
            [v7[34] setRollIdentity:CFRetain(*(CFTypeRef *)(a1 + 80))];
            _PCSIdentityCheckPCSAttributes(*(void *)(a1 + 80), *((void **)v7[34] + 1));
            [*(id *)(a1 + 40) complete:1];
            [v7 setIdentityToCurrent];
          }
          else
          {
            v34 = (void *)MEMORY[0x1E4F28C58];
            v35 = kPCSErrorDomain;
            uint64_t v46 = *MEMORY[0x1E4F28568];
            v36 = [NSString stringWithFormat:@"Store manatee and sync, but didn't get a pref/sha1"];
            v47 = v36;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            CFTypeRef v38 = [v34 errorWithDomain:v35 code:112 userInfo:v37];
            [v7 setError:v38];

            [v7 completeOperation];
            [*(id *)(a1 + 40) complete:0];
          }
        }
        else
        {
          uint64_t v26 = [(CFDictionaryRef *)v23 log];
          int v27 = [v7[34] service];
          PCSMigrationLog(v26, @"Failed to push service %@ to CKKS: %@", v27, a3);

          if (a3)
          {
            [v7 setError:a3];
          }
          else
          {
            int v28 = (void *)MEMORY[0x1E4F28C58];
            int v29 = kPCSErrorDomain;
            uint64_t v44 = *MEMORY[0x1E4F28568];
            int v30 = [NSString stringWithFormat:@"Failed but no error on addandnotifyonsync: %@", *((void *)v7[34] + 1)];
            dispatch_time_t v45 = v30;
            v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            uint64_t v32 = [v28 errorWithDomain:v29 code:111 userInfo:v31];
            [v7 setError:v32];
          }
          CFTypeID v33 = [v7 context];
          [v33 resetIdentities];

          [*(id *)(a1 + 40) complete:0];
          [v7 completeOperation];
        }
      }
      CFRelease(*(CFTypeRef *)(a1 + 80));
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v19 = pcsLogObjForScope("ckks");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, v19, OS_LOG_TYPE_DEFAULT, "Strong self no longer exists", buf, 2u);
    }

    CFRelease(*(CFTypeRef *)(a1 + 80));
  }
}

uint64_t __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_30(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8)
                                                                            + 24);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __51__PCSCKKSCreateIdentityOperation_storePCSIdentity___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8)
                                                                            + 24);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (int)addAndNotifyOnSync:(_PCSIdentityData *)a3 attributes:(__CFDictionary *)a4 returnAttributes:(const __CFDictionary *)a5 complete:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, void, void *))a6;
  PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)self->_context log], @"Saving identity %@ to keychain", a3);
  v11 = [(PCSCKKSCreateIdentityOperation *)self context];
  LOBYTE(self) = PCSCurrentPersonaMatchesDSIDFromSet([v11 set]);

  if (self)
  {
    int v12 = xmmword_1EB3B39D0(a4, a5, v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    dispatch_semaphore_t v13 = (void *)MEMORY[0x1E4F28C58];
    dispatch_semaphore_t v14 = kPCSErrorDomain;
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"dsid does not match current persona's account dsid";
    dispatch_queue_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v16 = [v13 errorWithDomain:v14 code:146 userInfo:v15];

    v10[2](v10, 0, v16);
    int v12 = -25291;
  }

  return v12;
}

- (void)setIdentityToCurrent
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PCSCKKSCreateIdentityOperation *)self context];
  char v4 = PCSCurrentPersonaMatchesDSIDFromSet([v3 set]);

  if (v4)
  {
    uint64_t v5 = [(PCSCKKSItemModifyContext *)self->_context service];
    CKKSViewByName = PCSServiceItemGetCKKSViewByName(v5);

    if (CKKSViewByName)
    {
      v7 = [(PCSCKKSCreateIdentityOperation *)self context];
      v8 = [v7 mtt];
      dispatch_time_t v9 = [v8 measurePoint:@"CKKSSetCurrentIdentity"];

      int v25 = (void (*)(__CFString *, void *, __CFString *, void *, void *, void *, void *, void *))off_1EB3B39E0;
      uint64_t v10 = [(PCSCKKSItemModifyContext *)self->_context service];
      AccessGroupByName = PCSServiceItemGetAccessGroupByName(v10);
      int v12 = [(PCSCKKSItemModifyContext *)self->_context service];
      dispatch_semaphore_t v13 = [(PCSCKKSItemModifyContext *)self->_context rollItemReference];
      dispatch_semaphore_t v14 = [(PCSCKKSItemModifyContext *)self->_context rollItemSHA1];
      dispatch_queue_t v15 = [(PCSCKKSItemModifyContext *)self->_context existingItemReference];
      v16 = [(PCSCKKSItemModifyContext *)self->_context existingItemSHA1];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __54__PCSCKKSCreateIdentityOperation_setIdentityToCurrent__block_invoke;
      v26[3] = &unk_1E5E6E088;
      v26[4] = self;
      id v27 = v9;
      id v17 = v9;
      v25(AccessGroupByName, v12, CKKSViewByName, v13, v14, v15, v16, v26);
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = kPCSErrorDomain;
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v20 = NSString;
      uint64_t v21 = [(PCSCKKSItemModifyContext *)self->_context service];
      v22 = [v20 stringWithFormat:@"No view hint for %@", v21];
      v30[0] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      int v24 = [v18 errorWithDomain:v19 code:102 userInfo:v23];
      [(PCSCKKSCreateIdentityOperation *)self itemStored:v24];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }
}

void __54__PCSCKKSCreateIdentityOperation_setIdentityToCurrent__block_invoke(uint64_t a1, const void *a2)
{
  CFTypeRef v2 = a2;
  CFTypeRef cf = 0;
  if (a2) {
    goto LABEL_7;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 272) rollIdentity]
    || _PCSIdentityIsManatee([*(id *)(*(void *)(a1 + 32) + 272) rollIdentity]))
  {
    goto LABEL_6;
  }
  int v4 = PCSIdentitySetSetCurrentIdentityWithError([*(id *)(*(void *)(a1 + 32) + 272) set], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "rollIdentity"), &cf);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 272) log];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 272) service];
  v7 = (void *)v6;
  if (v4)
  {
    PCSMigrationLog(v5, @"Successfully set current 'type' bit for service %@", v6);

LABEL_6:
    CFTypeRef v2 = 0;
    goto LABEL_7;
  }
  PCSMigrationLog(v5, @"Failed to set current 'type' bit for service %@: %@", v6, cf);

  CFTypeRef v2 = cf;
LABEL_7:
  [*(id *)(a1 + 40) complete:v2 == 0];
  [*(id *)(a1 + 32) itemStored:v2];
  CFTypeRef v8 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v8);
  }
}

- (void)itemStored:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PCSCKKSCreateIdentityOperation *)self context];
  char v6 = PCSCurrentPersonaMatchesDSIDFromSet([v5 set]);

  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v13 = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v13, 2u);
    }
    v7 = (void *)MEMORY[0x1E4F28C58];
    CFTypeRef v8 = kPCSErrorDomain;
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"dsid does not match current persona's account dsid";
    dispatch_time_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v7 errorWithDomain:v8 code:146 userInfo:v9];
    [(PCSCKKSOperation *)self setError:v10];

    goto LABEL_8;
  }
  if (!v4)
  {
    context = self->_context;
    uint64_t v12 = [(PCSCKKSItemModifyContext *)context rollIdentity];
    dispatch_time_t v9 = [(PCSCKKSItemModifyContext *)self->_context rollItemReference];
    [(PCSCKKSItemModifyContext *)context setCurrentIdentity:v12 persistentReference:v9];
LABEL_8:

    goto LABEL_9;
  }
  [(PCSCKKSOperation *)self setError:v4];
LABEL_9:
  [(PCSCKKSOperation *)self completeOperation];
}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end