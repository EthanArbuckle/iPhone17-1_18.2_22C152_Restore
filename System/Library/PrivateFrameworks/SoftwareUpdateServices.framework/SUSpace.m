@interface SUSpace
+ (BOOL)makeRoomForUpdate:(id)a3 error:(id *)a4;
+ (id)hasSufficientSpaceWithOptions:(id)a3 error:(id *)a4;
+ (unint64_t)currentFreeSpaceForVolume:(id)a3;
+ (void)hasSufficientSpaceWithOptions:(id)a3 withCompletion:(id)a4;
+ (void)makeRoomForUpdate:(id)a3 completion:(id)a4;
@end

@implementation SUSpace

+ (id)hasSufficientSpaceWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__SUSpace_hasSufficientSpaceWithOptions_error___block_invoke;
  v11[3] = &unk_26447CFF0;
  v13 = &v21;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  +[SUSpace hasSufficientSpaceWithOptions:v5 withCompletion:v11];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v7, v8);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__SUSpace_hasSufficientSpaceWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)hasSufficientSpaceWithOptions:(id)a3 withCompletion:(id)a4
{
  id v5 = (SUSpacePurgeOptions *)a3;
  id v6 = a4;
  if (!v5) {
    id v5 = objc_alloc_init(SUSpacePurgeOptions);
  }
  uint64_t v7 = [(SUSpacePurgeOptions *)v5 completionQueue];
  if (!v7)
  {
    dispatch_time_t v8 = [MEMORY[0x263F77D80] sharedCore];
    uint64_t v7 = [v8 selectCompletionQueue:0];
  }
  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_3;
  v98[3] = &unk_26447D088;
  id v99 = &__block_literal_global_2;
  v85 = (void (**)(void, void, void, void, void, void, void, void))MEMORY[0x223C18480](v98);
  unint64_t v9 = +[SUSpace currentFreeSpaceForVolume:@"/"];
  unint64_t v10 = [(SUSpacePurgeOptions *)v5 neededBytes];
  SULogInfo(@"%s: Current free space without purging: %llu", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  [(SUSpacePurgeOptions *)v5 neededBytes];
  SULogInfo(@"%s: Needed bytes: %llu", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  SULogInfo(@"%s: haveEnoughSpace: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  v32 = objc_alloc_init(SUSpaceCheckResults);
  [(SUSpaceCheckResults *)v32 setHasSufficientFreeSpace:v9 >= v10];
  [(SUSpaceCheckResults *)v32 setAdditionalBytesRequired:0];
  v33 = +[SUPreferences sharedInstance];
  char v34 = [v33 haveEnoughSpace];

  if (v34)
  {
    if (v9 >= v10)
    {
      SULogInfo(@"Device has sufficient free space", v35, v36, v37, v38, v39, v40, v41, v84);
      __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v42, v32, 0, v7, v6);
      goto LABEL_19;
    }
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2020000000;
    unint64_t v97 = 0;
    unint64_t v97 = [(SUSpacePurgeOptions *)v5 neededBytes] - v9;
    [(SUSpaceCheckResults *)v32 setAdditionalBytesRequired:v95[3]];
    if ([(SUSpacePurgeOptions *)v5 enableCacheDelete])
    {
      SULogInfo(@"%s: Attempting cache delete", v53, v54, v55, v56, v57, v58, v59, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
      v60 = (void *)MEMORY[0x263F77BC0];
      uint64_t v61 = v95[3];
      uint64_t v62 = [(SUSpacePurgeOptions *)v5 cacheDeleteUrgency];
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_5;
      v86[3] = &unk_26447D0B0;
      v87 = v32;
      v93 = &v94;
      v88 = v5;
      v90 = v85;
      id v89 = v7;
      id v91 = v6;
      id v92 = &__block_literal_global_2;
      [v60 checkPurgeableSpaceCacheDelete:v61 cacheDeleteUrgency:v62 withCompletionQueue:v89 completion:v86];

      v63 = v87;
    }
    else
    {
      if ([(SUSpacePurgeOptions *)v5 enableAppOffload])
      {
        SULogInfo(@"%s: Only attempting app offload", v67, v68, v69, v70, v71, v72, v73, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
        ((void (**)(void, void, uint64_t, int64_t, SUSpaceCheckResults *, void, void *, id))v85)[2](v85, 0, v95[3], [(SUSpacePurgeOptions *)v5 appOffloadUrgency], v32, 0, v7, v6);
LABEL_18:
        _Block_object_dispose(&v94, 8);
        goto LABEL_19;
      }
      SULogInfo(@"%s: Cache Delete was not enabled", v67, v68, v69, v70, v71, v72, v73, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
      v63 = (SUSpaceCheckResults *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v74 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUSpaceCheckResults additionalBytesRequired](v32, "additionalBytesRequired"));
      [(SUSpaceCheckResults *)v63 setObject:v74 forKeyedSubscript:@"SUAdditionalSpaceRequired"];

      v75 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v63];
      SULogInfo(@"Insufficient free space: %@", v76, v77, v78, v79, v80, v81, v82, (uint64_t)v75);
      __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v83, v32, v75, v7, v6);
    }
    goto LABEL_18;
  }
  v43 = +[SUPreferences sharedInstance];
  int v44 = [v43 spacePurgeSuccessful];

  if (v44)
  {
    [(SUSpaceCheckResults *)v32 setHasSufficientFreeSpace:1];
    [(SUSpaceCheckResults *)v32 setAdditionalBytesRequired:0];
    [(SUSpaceCheckResults *)v32 setNeedsCacheDelete:[(SUSpacePurgeOptions *)v5 enableCacheDelete]];
    [(SUSpaceCheckResults *)v32 setNeedsAppOffload:[(SUSpacePurgeOptions *)v5 enableAppOffload]];
    v52 = 0;
  }
  else
  {
    [(SUSpaceCheckResults *)v32 setHasSufficientFreeSpace:0];
    [(SUSpaceCheckResults *)v32 setAdditionalBytesRequired:10485760];
    [(SUSpaceCheckResults *)v32 setNeedsAppOffload:0];
    [(SUSpaceCheckResults *)v32 setNeedsCacheDelete:0];
    id v64 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v65 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUSpaceCheckResults additionalBytesRequired](v32, "additionalBytesRequired"));
    [v64 setObject:v65 forKeyedSubscript:@"SUAdditionalSpaceRequired"];

    v52 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v64];
  }
  SULogInfo(@"Spoofing %s with result: %@", v45, v46, v47, v48, v49, v50, v51, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v66, v32, v52, v7, v6);

LABEL_19:
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  unint64_t v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v11)
  {
    if (v10)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_2;
      block[3] = &unk_26447D038;
      id v16 = v11;
      id v14 = v8;
      id v15 = v9;
      dispatch_async(v10, block);
    }
    else
    {
      (*((void (**)(id, id, id))v11 + 2))(v11, v8, v9);
    }
  }
}

uint64_t __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_3(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (void *)MEMORY[0x263F77BC0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_4;
  v25[3] = &unk_26447D060;
  uint64_t v31 = a3;
  char v32 = a2;
  id v26 = v15;
  id v27 = v16;
  id v20 = *(id *)(a1 + 32);
  id v28 = v17;
  id v29 = v20;
  id v30 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  [v19 checkPurgeableSpaceOffloadApps:a3 cacheDeleteUrgency:a4 withCompletionQueue:v22 completion:v25];
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v30 = a4;
  unint64_t v7 = *(void *)(a1 + 72);
  if (v7 <= a3) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = a3;
  }
  [*(id *)(a1 + 32) setAdditionalBytesRequired:v7 - v8];
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 setHasSufficientFreeSpace:a2];
    [*(id *)(a1 + 32) setNeedsAppOffload:a2];
    if (a2)
    {
      [*(id *)(a1 + 32) setNeedsCacheDelete:*(unsigned __int8 *)(a1 + 80)];
      uint64_t v10 = 0;
    }
    else
    {
      [*(id *)(a1 + 32) setNeedsCacheDelete:0];
      uint64_t v10 = *(void *)(a1 + 72) - a3;
    }
    [*(id *)(a1 + 32) setAdditionalBytesRequired:v10];
  }
  if (a2)
  {
    id v11 = 0;
  }
  else
  {
    if (v30)
    {
      id v12 = v30;
      if (*(void *)(a1 + 40))
      {
        id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
        id v14 = [v12 userInfo];
        id v15 = (void *)[v13 initWithDictionary:v14];

        [v15 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"SUAdditionalError"];
        id v16 = (void *)MEMORY[0x263F087E8];
        id v17 = [v12 domain];
        uint64_t v18 = objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v12, "code"), v15);

        id v12 = (id)v18;
      }
    }
    else
    {
      uint64_t v19 = *(void **)(a1 + 40);
      if (v19) {
        id v12 = v19;
      }
      else {
        id v12 = 0;
      }
    }
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "additionalBytesRequired"));
    [v20 setObject:v21 forKeyedSubscript:@"SUAdditionalSpaceRequired"];

    [v20 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08608]];
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v20];
    if (*(unsigned char *)(a1 + 80)) {
      id v29 = @"CacheDelete Purge and ";
    }
    else {
      id v29 = &stru_26CE93248;
    }
    SULogInfo(@"Insufficient space with %@app offload purge: %@", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v29);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v33 = a4;
  [*(id *)(a1 + 32) setHasSufficientFreeSpace:a2];
  [*(id *)(a1 + 32) setNeedsCacheDelete:a2];
  if (a2)
  {
    [*(id *)(a1 + 32) setAdditionalBytesRequired:0];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    unint64_t v8 = *(void *)(v7 + 24);
    if (v8 > a3)
    {
      *(void *)(v7 + 24) = v8 - a3;
      unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    [*(id *)(a1 + 32) setAdditionalBytesRequired:v8];
    SULogInfo(@"%s: Post CacheDelete neededBytes: %llu; amountPurgeable: %llu",
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]_block_invoke_5");
    if ([*(id *)(a1 + 40) enableAppOffload])
    {
      SULogInfo(@"%s: Attempting app offload", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]_block_invoke_5");
      (*(void (**)(void, uint64_t, void, uint64_t, void, id, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), [*(id *)(a1 + 40) appOffloadUrgency], *(void *)(a1 + 32), v33, *(void *)(a1 + 48), *(void *)(a1 + 64));
    }
    else
    {
      id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "additionalBytesRequired"));
      [v23 setObject:v24 forKeyedSubscript:@"SUAdditionalSpaceRequired"];

      [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x263F08608]];
      uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v23];
      SULogInfo(@"Insufficient space with CacheDelete purge: %@", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

+ (BOOL)makeRoomForUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__SUSpace_makeRoomForUpdate_error___block_invoke;
  v11[3] = &unk_26447D0D8;
  uint64_t v13 = &v21;
  uint64_t v14 = &v15;
  uint64_t v7 = v6;
  uint64_t v12 = v7;
  +[SUSpace makeRoomForUpdate:v5 completion:v11];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v7, v8);
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __35__SUSpace_makeRoomForUpdate_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)makeRoomForUpdate:(id)a3 completion:(id)a4
{
  id v5 = (SUSpacePurgeOptions *)a3;
  id v6 = a4;
  if (!v5) {
    id v5 = objc_alloc_init(SUSpacePurgeOptions);
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_3;
  v41[3] = &unk_26447D148;
  id v42 = &__block_literal_global_99;
  uint64_t v7 = (void *)MEMORY[0x223C18480](v41);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_5;
  v36[3] = &unk_26447D198;
  dispatch_time_t v8 = v5;
  uint64_t v37 = v8;
  id v38 = &__block_literal_global_99;
  id v9 = v7;
  id v39 = v9;
  id v10 = v6;
  id v40 = v10;
  uint64_t v11 = (void *)MEMORY[0x223C18480](v36);
  uint64_t v12 = +[SUPreferences sharedInstance];
  uint64_t v13 = [v12 spacePurgeTime];

  if (v13 && (int)[v13 intValue] >= 1)
  {
    [v13 intValue];
    SULogDebug(@"%s: [DEFAULTS] spacePurgeTime set, sleeping %d secs", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
    objc_msgSend(MEMORY[0x263F08B88], "sleepForTimeInterval:", (double)(int)objc_msgSend(v13, "intValue"));
    if ([v13 intValue])
    {
      SULogDebug(@"%s: [DEFAULTS] space purge failed", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
      uint64_t v28 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:0];
      uint64_t v29 = [(SUSpacePurgeOptions *)v8 completionQueue];
      __40__SUSpace_makeRoomForUpdate_completion___block_invoke((uint64_t)v29, 0, v28, v29, v10);
    }
    else
    {
      SULogDebug(@"%s: [DEFAULTS] space purge succeeded", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
      uint64_t v28 = [(SUSpacePurgeOptions *)v8 completionQueue];
      __40__SUSpace_makeRoomForUpdate_completion___block_invoke((uint64_t)v28, 1, 0, v28, v10);
    }
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_7;
    v30[3] = &unk_26447D1E8;
    uint64_t v32 = &__block_literal_global_99;
    uint64_t v31 = v8;
    id v33 = v10;
    id v34 = v11;
    id v35 = v9;
    +[SUSpace hasSufficientSpaceWithOptions:v31 withCompletion:v30];

    uint64_t v28 = v32;
  }
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  dispatch_time_t v8 = a4;
  id v9 = a5;
  id v10 = (void *)[a3 copy];
  if (v9)
  {
    if (v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_2;
      block[3] = &unk_26447CE88;
      id v13 = v9;
      char v14 = a2;
      id v12 = v10;
      dispatch_async(v8, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void *))v9 + 2))(v9, a2, v10);
    }
  }
}

uint64_t __40__SUSpace_makeRoomForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  SULogInfo(@"Requesting AppStoreDaemon offload %llu bytes worth of apps", v11, v12, v13, v14, v15, v16, v17, a2);
  uint64_t v18 = (void *)MEMORY[0x263F77BC0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_4;
  v22[3] = &unk_26447D120;
  id v19 = *(id *)(a1 + 32);
  id v23 = v9;
  id v24 = v19;
  id v25 = v10;
  id v20 = v10;
  id v21 = v9;
  [v18 offloadAppsPurge:a2 cacheDeleteUrgency:a3 withCompletionQueue:0 completion:v22];
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v17 = v7;
  if (a2)
  {
    SULogInfo(@"Device has sufficient free space after AppStoreDaemon offloaded %llu bytes worth of apps", v8, v9, v10, v11, v12, v13, v14, a3);
    uint64_t v15 = 0;
  }
  else
  {
    SULogInfo(@"AppStoreDaemon was unable to offload requested space: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08608]];
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v16];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6)
{
  id v10 = a5;
  id v11 = a6;
  SULogInfo(@"Requesting CacheDelete purge %llu bytes", v12, v13, v14, v15, v16, v17, v18, a2);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = a2;
  id v19 = (void *)MEMORY[0x263F77BC0];
  uint64_t v20 = [a1[4] cacheDeleteUrgency];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_6;
  v23[3] = &unk_26447D170;
  id v26 = a1[5];
  id v21 = v10;
  id v24 = v21;
  id v22 = v11;
  char v31 = a4;
  id v27 = v22;
  uint64_t v30 = v32;
  id v28 = a1[6];
  id v25 = a1[4];
  id v29 = a1[7];
  [v19 cacheDeletePurge:a2 cacheDeleteUrgency:v20 withCompletionQueue:0 completion:v23];

  _Block_object_dispose(v32, 8);
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_6(uint64_t a1, int a2, unint64_t a3, void *a4)
{
  id v20 = a4;
  if (a2)
  {
    SULogInfo(@"Device has sufficient free space after CacheDelete purged %llu bytes", v7, v8, v9, v10, v11, v12, v13, a3);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (*(unsigned char *)(a1 + 88))
  {
    SULogInfo(@"CacheDelete purged %llu bytes. Originally requested %llu bytes", v7, v8, v9, v10, v11, v12, v13, a3);
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    unint64_t v15 = *(void *)(v14 + 24);
    BOOL v16 = v15 > a3;
    unint64_t v17 = v15 - a3;
    if (v16)
    {
      *(void *)(v14 + 24) = v17;
      (*(void (**)(void, void, uint64_t, void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), [*(id *)(a1 + 40) appOffloadUrgency], *(void *)(a1 + 32), *(void *)(a1 + 72));
    }
  }
  else
  {
    SULogInfo(@"Device has insufficient free space after CacheDelete purged %llu bytes", v7, v8, v9, v10, v11, v12, v13, a3);
    if (*(void *)(a1 + 56))
    {
      id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x263F08608]];
      id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:v18];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[SUPreferences sharedInstance];
  char v8 = [v7 haveEnoughSpace];

  if (v8)
  {
    BOOL v16 = +[SUPreferences sharedInstance];
    int v17 = [v16 fakeAppOffload];

    if (v17)
    {
      [v5 setHasSufficientFreeSpace:1];
      [v5 setNeedsAppOffload:1];
      [v5 setNeedsCacheDelete:1];
      [v5 setAdditionalBytesRequired:1000000];
      SULogInfo(@"Faking an app offload with %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
    }
    if ([v5 hasSufficientFreeSpace])
    {
      if ([v5 needsCacheDelete] & 1) != 0 || (objc_msgSend(v5, "needsAppOffload"))
      {
        unint64_t v39 = +[SUSpace currentFreeSpaceForVolume:@"/"];
        uint64_t v80 = 0;
        uint64_t v81 = &v80;
        uint64_t v82 = 0x2020000000;
        unint64_t v83 = 0;
        unint64_t v40 = [a1[4] neededBytes];
        unint64_t v48 = 0;
        if (v40 > v39) {
          unint64_t v48 = [a1[4] neededBytes] - v39;
        }
        unint64_t v83 = v48;
        SULogInfo(@"neededSpace = %llu", v41, v42, v43, v44, v45, v46, v47, v81[3]);
        if ([v5 needsAppOffload])
        {
          SULogInfo(@"Device needs to offload apps to make suffience space for download", v49, v50, v51, v52, v53, v54, v55, v71);
          uint64_t v56 = +[SUAlertPresentationManager sharedInstance];
          [v56 dismissAlertsOfClass:objc_opt_class() animated:1];
          uint64_t v57 = [SUAppPurgingAlertItem alloc];
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_8;
          v72[3] = &unk_26447D1C0;
          id v73 = v5;
          id v75 = a1[7];
          uint64_t v79 = &v80;
          id v74 = a1[4];
          id v76 = a1[6];
          id v77 = a1[8];
          id v78 = a1[5];
          uint64_t v58 = [(SUAppPurgingAlertItem *)v57 initWithHandler:v72 bytesNeeded:v81[3]];
          [v56 presentAlert:v58 animated:1];
        }
        else
        {
          if (![v5 needsCacheDelete])
          {
LABEL_20:
            _Block_object_dispose(&v80, 8);
            goto LABEL_21;
          }
          uint64_t v66 = (void (**)(id, uint64_t, uint64_t, void, void *, id))a1[7];
          uint64_t v67 = v81[3];
          uint64_t v68 = [a1[4] cacheDeleteUrgency];
          uint64_t v56 = [a1[4] completionQueue];
          v66[2](v66, v67, v68, 0, v56, a1[6]);
        }

        goto LABEL_20;
      }
      SULogInfo(@"Device has sufficient free space. No cleanup needed", v32, v33, v34, v35, v36, v37, v38, v70);
      uint64_t v69 = (void (**)(id, uint64_t, void, void *, id))a1[5];
      uint64_t v61 = [a1[4] completionQueue];
      v69[2](v69, 1, 0, v61, a1[6]);
    }
    else
    {
      SULogInfo(@"Unable to make sufficient room for download", v25, v26, v27, v28, v29, v30, v31, v70);
      v60 = (void (**)(id, void, void *, void *, id))a1[5];
      uint64_t v61 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:0];
      uint64_t v62 = [a1[4] completionQueue];
      v60[2](v60, 0, v61, v62, a1[6]);
    }
  }
  else
  {
    SULogInfo(@"Spoofing %s with %@, the space purge will directly end and no further actions", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]_block_invoke_7");
    if ([v5 hasSufficientFreeSpace])
    {
      uint64_t v59 = 0;
    }
    else
    {
      uint64_t v59 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:6 userInfo:0];
    }
    v63 = (void (**)(id, uint64_t, void *, void *, id))a1[5];
    uint64_t v64 = [v5 hasSufficientFreeSpace];
    v65 = [a1[4] completionQueue];
    v63[2](v63, v64, v59, v65, a1[6]);
  }
LABEL_21:
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 == 1)
  {
    SULogInfo(@"App offload accepted by user", a2, a3, a4, a5, a6, a7, a8, v18);
    int v9 = [*(id *)(a1 + 32) needsCacheDelete];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v11 = *(void **)(a1 + 40);
    if (v9)
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = [v11 cacheDeleteUrgency];
      id v19 = [*(id *)(a1 + 40) completionQueue];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v10, v13, 1);
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 64);
      uint64_t v17 = [v11 appOffloadUrgency];
      id v19 = [*(id *)(a1 + 40) completionQueue];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v10, v17);
    }
  }
  else
  {
    SULogInfo(@"App offload declined by user", a2, a3, a4, a5, a6, a7, a8, v18);
    uint64_t v14 = *(void *)(a1 + 72);
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:44 userInfo:0];
    uint64_t v15 = [*(id *)(a1 + 40) completionQueue];
    (*(void (**)(uint64_t, void, id, void *, void))(v14 + 16))(v14, 0, v19, v15, *(void *)(a1 + 56));
  }
}

+ (unint64_t)currentFreeSpaceForVolume:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  memset(&v7.f_mntonname[392], 0, 32);
  if (!v3) {
    v3 = @"/";
  }
  memset(&v7, 0, 480);
  v4 = v3;
  if (statfs((const char *)[(__CFString *)v4 fileSystemRepresentation], &v7)) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = v7.f_bavail * v7.f_bsize;
  }

  return v5;
}

@end