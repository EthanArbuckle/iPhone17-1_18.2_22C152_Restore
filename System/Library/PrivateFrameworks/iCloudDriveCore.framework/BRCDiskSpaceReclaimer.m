@interface BRCDiskSpaceReclaimer
+ (double)accessTimeDeltaForUrgency:(int)a3;
+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3;
- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5;
- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4;
- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3;
- (OS_dispatch_queue)queue;
- (int)urgencyForCacheDeleteUrgency:(int)a3;
- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3;
- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3;
- (int64_t)_dbSizeInBytes:(id)a3;
- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4;
- (int64_t)_fullVacuumIfPossible:(id)a3;
- (int64_t)_garbageCollectGroupContainerStage;
- (int64_t)_garbageCollectGroupContainersStageOfType:(signed __int16)a3 maxAgeDelta:(int64_t)a4;
- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4;
- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5;
- (int64_t)cachedNonPurgeableSpace;
- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3;
- (int64_t)periodicReclaimSpace;
- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4;
- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3;
- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3;
- (unint64_t)totalSize;
- (void)_asyncAutovacuumIfNeeds:(id)a3;
- (void)_cleanFPCreationItemIdentifier:(id)a3;
- (void)close;
- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3;
@end

@implementation BRCDiskSpaceReclaimer

- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCDiskSpaceReclaimer;
  v6 = [(BRCDiskSpaceReclaimer *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bird.cache-delete", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v5);
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke;
    v20 = &unk_26507ED20;
    objc_copyWeak(&v21, &location);
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v17);
    v13 = +[BRCSystemResourcesManager manager];
    int v14 = [v13 connectedToPowerSource];

    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0, 5000000000);
      dispatch_after(v15, (dispatch_queue_t)v7->_queue, v12);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke(uint64_t a1)
{
  v2 = +[BRCSystemResourcesManager manager];
  int v3 = [v2 connectedToPowerSource];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained clientDB];

    if (v5)
    {
      v6 = [WeakRetained clientDB];
      v7 = [v6 serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2;
      block[3] = &unk_26507ED70;
      id v14 = WeakRetained;
      dispatch_sync(v7, block);
    }
    v8 = [WeakRetained serverDB];

    if (v8)
    {
      v9 = [WeakRetained serverDB];
      dispatch_queue_t v10 = [v9 serialQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3;
      v11[3] = &unk_26507ED70;
      id v12 = WeakRetained;
      dispatch_sync(v10, v11);
    }
  }
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clientDB];
  [v1 autovacuumIfNeeded];
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) serverDB];
  [v1 autovacuumIfNeeded];
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BRCDiskSpaceReclaimer_close__block_invoke;
  block[3] = &unk_26507ED70;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __30__BRCDiskSpaceReclaimer_close__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 1;
  return result;
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  v7[3] = &unk_26507F850;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 16) && !*(unsigned char *)(v2 + 17))
  {
    id v4 = [*(id *)(v2 + 8) clientState];
    id v5 = [v4 dictionary];

    id v6 = [v5 objectForKeyedSubscript:@"purgeableSpaceDate"];
    v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    dispatch_queue_t v10 = +[BRCUserDefaults defaultsForMangledID:0];
    [v10 cacheDeleteRecomputeInterval];
    double v12 = v11;

    if (v6 && v9 < v12)
    {
      v13 = [v5 objectForKeyedSubscript:@"purgeableSpace"];
      uint64_t v14 = [v5 objectForKeyedSubscript:@"nonPurgeableSpace"];
      dispatch_time_t v15 = (void *)v14;
      if (v13 && v14)
      {
        v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2112;
          v57 = v16;
          _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] returning purgeable info from cache\npurgeableSpaceByUrgency:%@\nnonPurgeableSpace:%@%@", buf, 0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_25:

        return;
      }
      uint64_t v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] could not retrieve cached purgeable space%@", buf, 0xCu);
      }
    }
    memset(v53, 0, sizeof(v53));
    __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer computePurgeableSpaceForAllUrgenciesWithReply:]_block_invoke", 145, v53);
    v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(v53);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v57 = 0;
    v22 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    objc_super v23 = [v22 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15;
    block[3] = &unk_265081558;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = buf;
    dispatch_sync(v23, block);

    v24 = [*(id *)(*(void *)(a1 + 32) + 8) serverDB];
    v25 = [v24 serialQueue];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2;
    v51[3] = &unk_265081558;
    v51[4] = *(void *)(a1 + 32);
    v51[5] = buf;
    dispatch_sync(v25, v51);

    v26 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v27 = [v26 dbReclaimableSpaceThreshold];

    *(void *)(*(void *)&buf[8] + 24) = (*(void *)(*(void *)&buf[8] + 24) - v27) & ~((*(void *)(*(void *)&buf[8] + 24)
                                                                                               - v27) >> 63);
    v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)&buf[8] + 24) context:0];
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3(v30, (uint64_t)v28, (uint64_t)v55);
    }

    v31 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
    uint64_t v32 = [v31 purgableSpace];

    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = +[BRCDumpContext stringFromByteCount:v32 context:0];
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2(v35, (uint64_t)v33, (uint64_t)v54);
    }

    uint64_t v36 = [*(id *)(a1 + 32) _computeCiconiaSizeInBytes:0];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_18;
    v50[3] = &unk_265086CF8;
    v50[4] = *(void *)(a1 + 32);
    v37 = (void (**)(void, void, void))MEMORY[0x2455D9A50](v50);
    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1((uint64_t)v38, v39);
    }

    v40 = objc_opt_new();
    uint64_t v41 = v36 + v32;
    v42 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
    [v40 setObject:v42 forKeyedSubscript:&unk_26F3DDA60];

    v43 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
    [v40 setObject:v43 forKeyedSubscript:&unk_26F3DDA78];

    v44 = [NSNumber numberWithLongLong:v41 + *(void *)(*(void *)&buf[8] + 24)];
    [v40 setObject:v44 forKeyedSubscript:&unk_26F3DDA90];

    uint64_t v45 = [*(id *)(a1 + 32) nonPurgeableSizeWithPurgeableSize:v41 + *(void *)(*(void *)&buf[8] + 24)];
    v46 = [NSNumber numberWithUnsignedLongLong:v45];
    ((void (**)(void, void *, void *))v37)[2](v37, v40, v46);

    uint64_t v47 = *(void *)(a1 + 40);
    v48 = [NSNumber numberWithUnsignedLongLong:v45];
    (*(void (**)(uint64_t, void *, void *, void))(v47 + 16))(v47, v40, v48, 0);

    _Block_object_dispose(buf, 8);
    __brc_leave_section(v53);
    goto LABEL_25;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 autovacuumableSpaceInBytes];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) serverDB];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 autovacuumableSpaceInBytes];
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  double v8 = [v7 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_19;
  block[3] = &unk_26507EDC0;
  void block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v8, block);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_19(void *a1)
{
  id v4 = [*(id *)(a1[4] + 8) clientState];
  id v2 = [MEMORY[0x263EFF910] date];
  [v4 setObject:v2 forKeyedSubscript:@"purgeableSpaceDate"];

  [v4 setObject:a1[5] forKeyedSubscript:@"purgeableSpace"];
  [v4 setObject:a1[6] forKeyedSubscript:@"nonPurgeableSpace"];
  uint64_t v3 = [*(id *)(a1[4] + 8) clientDB];
  [v3 forceBatchStart];
}

- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = objc_msgSend(NSURL, "brc_ciconiaDumpDirForCurrentPersona");
  unsigned __int8 v41 = 0;
  id v6 = [v5 path];
  int v7 = [v4 fileExistsAtPath:v6 isDirectory:&v41];
  int v8 = v41;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int64_t v10 = 0;
  }
  else
  {
    double v11 = [v5 path];
    id v12 = [v4 attributesOfItemAtPath:v11 error:0];
    id v13 = [v12 fileCreationDate];

    [v13 timeIntervalSinceNow];
    int64_t v10 = 0;
    if (fabs(v14) > 86400.0)
    {
      BOOL v32 = v3;
      v33 = v13;
      uint64_t v15 = *MEMORY[0x263EFF688];
      v16 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263EFF688]];
      v34 = v4;
      uint64_t v17 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v16 options:0 errorHandler:0];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id v21 = 0;
        int64_t v10 = 0;
        uint64_t v22 = *(void *)v38;
        do
        {
          uint64_t v23 = 0;
          v24 = v21;
          do
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v18);
            }
            v25 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
            id v36 = 0;
            int v26 = [v25 getResourceValue:&v36 forKey:v15 error:0];
            id v21 = v36;

            if (v26) {
              v10 += [v21 unsignedLongLongValue];
            }
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v20);
      }
      else
      {
        id v21 = 0;
        int64_t v10 = 0;
      }

      if (v32)
      {
        id v35 = 0;
        id v4 = v34;
        char v27 = [v34 removeItemAtURL:v5 error:&v35];
        id v28 = v35;
        if ((v27 & 1) == 0)
        {
          v29 = brc_bread_crumbs();
          v30 = brc_default_log();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u)) {
            -[BRCDiskSpaceReclaimer _computeCiconiaSizeInBytes:]((uint64_t)v28);
          }

          int64_t v10 = 0;
        }
      }
      else
      {
        id v4 = v34;
      }

      id v13 = v33;
    }
  }
  return v10;
}

- (int64_t)_dbSizeInBytes:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    id v5 = [v3 serialQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke;
    v8[3] = &unk_265081558;
    int64_t v10 = &v11;
    id v9 = v4;
    dispatch_sync(v5, v8);

    int64_t v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

uint64_t __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) sizeInBytes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 serialQueue];

  if (v4)
  {
    id v5 = [v3 serialQueue];
    dispatch_assert_queue_not_V2(v5);
  }
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    int64_t v6 = [v3 serialQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke;
    v9[3] = &unk_265081558;
    uint64_t v11 = &v12;
    id v10 = v3;
    dispatch_sync(v6, v9);

    int64_t v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

uint64_t __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) autovacuumableSpaceInBytes];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_fullVacuumIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serialQueue];

  if (v5)
  {
    int64_t v6 = [v4 serialQueue];
    dispatch_assert_queue_not_V2(v6);
  }
  if (v4) {
    int64_t v7 = [(BRCDiskSpaceReclaimer *)self _doIncrementalVacuum:v4 amount:[(BRCDiskSpaceReclaimer *)self _dbAutovacuumableSpaceInBytes:v4]];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t v7 = [v6 serialQueue];

  if (v7)
  {
    int v8 = [v6 serialQueue];
    dispatch_assert_queue_not_V2(v8);
  }
  uint64_t v22 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v9 = [v22 dbAutovacuumBatchSize];
  if (v9) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = a4;
  }
  mach_absolute_time();
  uint64_t v11 = [(BRCDiskSpaceReclaimer *)self _dbSizeInBytes:v6];
  if (a4 >= 1)
  {
    int64_t v12 = 0;
    do
    {
      uint64_t v13 = [v6 serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke;
      block[3] = &unk_265082940;
      id v24 = v6;
      int64_t v25 = a4;
      int64_t v26 = v12;
      int64_t v27 = v10;
      dispatch_sync(v13, block);

      v12 += v10;
    }
    while (v12 < a4);
  }
  int64_t v14 = v11 - [(BRCDiskSpaceReclaimer *)self _dbSizeInBytes:v6];
  mach_absolute_time();
  uint64_t v15 = brc_bread_crumbs();
  v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v6 label];
    brc_monotonic_time_diff_to_interval();
    uint64_t v19 = v18;
    uint64_t v20 = +[BRCDumpContext stringFromByteCount:v14 context:0];
    *(_DWORD *)buf = 138413314;
    v29 = v17;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    __int16 v32 = 2112;
    v33 = v20;
    __int16 v34 = 2048;
    double v35 = (double)v14 * 100.0 / (double)v11;
    __int16 v36 = 2112;
    long long v37 = v15;
    _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] Incremental vacuuming %@ took %f seconds reclaimed %@ (size reduction %.2f percent)%@", buf, 0x34u);
  }
  return v14;
}

uint64_t __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 40) - v1 >= *(void *)(a1 + 56)) {
    uint64_t v2 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v2 = *(void *)(a1 + 40) - v1;
  }
  return [*(id *)(a1 + 32) incrementalVacuum:v2];
}

- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5
{
  id v8 = a3;
  int64_t v9 = [(BRCDiskSpaceReclaimer *)self _dbAutovacuumableSpaceInBytes:v8];
  if (v8)
  {
    if (a5 < 3 || 2 * v9 >= a4) {
      int64_t v10 = [(BRCDiskSpaceReclaimer *)self _doIncrementalVacuum:v8 amount:a4];
    }
    else {
      int64_t v10 = [(BRCDiskSpaceReclaimer *)self _fullVacuumIfPossible:v8];
    }
    int64_t v11 = v10;
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)_asyncAutovacuumIfNeeds:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serialQueue];
  if (v5)
  {
    session = self->_session;
    if (session)
    {
      if (![(BRCAccountSessionFPFS *)session isCancelled])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke;
        block[3] = &unk_26507ED70;
        id v8 = v4;
        dispatch_async(v5, block);
      }
    }
  }
}

uint64_t __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autovacuumIfNeeded];
}

- (int64_t)_garbageCollectGroupContainerStage
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  [v3 downloadStageAgeDelta];
  int64_t v5 = [(BRCDiskSpaceReclaimer *)self _garbageCollectGroupContainersStageOfType:0 maxAgeDelta:(uint64_t)v4];

  return v5;
}

- (int64_t)_garbageCollectGroupContainersStageOfType:(signed __int16)a3 maxAgeDelta:(int64_t)a4
{
  int64_t v5 = [(BRCAccountSessionFPFS *)self->_session groupContainerStagePathForCurrentPersonaFromStageType:a3];
  time_t v6 = time(0);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__BRCDiskSpaceReclaimer__garbageCollectGroupContainersStageOfType_maxAgeDelta___block_invoke;
  v10[3] = &unk_265086D20;
  int64_t v12 = v16;
  id v7 = v5;
  time_t v14 = v6;
  int64_t v15 = a4;
  id v11 = v7;
  uint64_t v13 = &v18;
  BRCRemoveFolderInAutoreleasepool(v7, v10, 1, 0);
  int64_t v8 = v19[3];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __79__BRCDiskSpaceReclaimer__garbageCollectGroupContainersStageOfType_maxAgeDelta___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)
    || ([NSString stringWithUTF8String:a2],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:a1[4]],
        v5,
        !v6))
  {
    if (a3 && a1[7] - *(void *)(a3 + 48) >= a1[8])
    {
      uint64_t result = 0;
      *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)(a3 + 96);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_cleanFPCreationItemIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCDiskSpaceReclaimer _cleanFPCreationItemIdentifier:]((uint64_t)v5, v6);
  }

  id v7 = [(BRCAccountSessionFPFS *)self->_session clientState];
  int64_t v8 = [v7 objectForKeyedSubscript:@"most-recent-item-creation-date"];

  int64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
  [v9 itemsCreationAgeDelta];
  double v11 = v10;

  if (v8)
  {
    int64_t v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSinceDate:v8];
    double v14 = v13;

    if (v14 > (double)(uint64_t)v11)
    {
      [v4 execute:@"UPDATE client_items SET fp_creation_item_identifier = NULL WHERE fp_creation_item_identifier IS NOT NULL"];
      int64_t v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRCDiskSpaceReclaimer _cleanFPCreationItemIdentifier:](v4);
      }
    }
  }
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  if (a3 <= 0)
  {
    char v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:](a3);
    }

    uint64_t v19 = +[BRCSystemResourcesManager manager];
    int v20 = [v19 connectedToPowerSource];

    if (v20)
    {
      uint64_t v21 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      [(BRCDiskSpaceReclaimer *)self _asyncAutovacuumIfNeeds:v21];

      uint64_t v22 = [(BRCAccountSessionFPFS *)self->_session serverDB];
      [(BRCDiskSpaceReclaimer *)self _asyncAutovacuumIfNeeds:v22];
    }
    return 0;
  }
  else
  {
    uint64_t v6 = *(void *)&a4;
    id v7 = [(BRCAccountSessionFPFS *)self->_session stageRegistry];
    uint64_t v8 = [v7 purgeSpace:a3 withUrgency:v6];

    uint64_t v9 = [(BRCDiskSpaceReclaimer *)self _garbageCollectGroupContainerStage] + v8;
    if (a3 <= v9)
    {
      v16 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:](v9);
      }
    }
    else
    {
      double v10 = [(BRCAccountSessionFPFS *)self->_session clientDB];
      v9 += [(BRCDiskSpaceReclaimer *)self _vacuumDB:v10 amount:a3 - v9 withUrgency:v6];

      BOOL v11 = a3 <= v9;
      int64_t v12 = a3 - v9;
      if (!v11)
      {
        double v13 = [(BRCAccountSessionFPFS *)self->_session serverDB];
        v9 += [(BRCDiskSpaceReclaimer *)self _vacuumDB:v13 amount:v12 withUrgency:v6];
      }
      double v14 = [(BRCAccountSessionFPFS *)self->_session clientState];
      [v14 setObject:0 forKeyedSubscript:@"purgeableSpaceDate"];

      int64_t v15 = [(BRCAccountSessionFPFS *)self->_session clientState];
      [v15 setObject:0 forKeyedSubscript:@"purgeableSpace"];

      v16 = [(BRCAccountSessionFPFS *)self->_session clientState];
      [v16 setObject:0 forKeyedSubscript:@"nonPurgeableSpace"];
    }
  }
  return v9;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_265086D48;
  v7[4] = self;
  void v7[5] = &v9;
  v7[6] = a3;
  int v8 = a4;
  dispatch_sync(queue, v7);
  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[16])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v2 _purgeSpaceUnderQueue:*(void *)(a1 + 48) withUrgency:*(unsigned int *)(a1 + 56)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) _computeCiconiaSizeInBytes:1];
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int64_t v5 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) context:0];
      uint64_t v6 = +[BRCDumpContext stringFromByteCount:*(void *)(a1 + 48) context:0];
      int v7 = *(_DWORD *)(a1 + 56);
      int v8 = 138413058;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 2112;
      int64_t v15 = v3;
      _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Purged %@ when asked to purge %@ for urgency %d%@", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (int64_t)periodicReclaimSpace
{
  id v3 = self->_session;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke;
  block[3] = &unk_265086D70;
  uint64_t v9 = v3;
  __int16 v10 = &v11;
  void block[4] = self;
  int64_t v5 = v3;
  dispatch_sync(queue, block);
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    id v3 = [*(id *)(v1 + 8) stageRegistry];
    uint64_t v4 = [v3 purgeSpace:0x7FFFFFFFFFFFFFFFLL withUrgency:4294967294];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = a1 + 48;
    *(void *)(*(void *)(v6 + 8) + 24) += v4;

    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [*(id *)(v5 - 16) _computeCiconiaSizeInBytes:1];
    int v7 = [*(id *)(v5 - 8) clientDB];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    char v17 = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2;
    uint64_t v18 = &unk_265080760;
    int v8 = *(void **)(v5 - 8);
    uint64_t v19 = *(void *)(v5 - 16);
    id v20 = v8;
    [v7 performWithFlags:1 action:&v15];

    uint64_t v9 = *(void **)(v5 - 16);
    __int16 v10 = objc_msgSend(*(id *)(v5 - 8), "clientDB", v15, v16, v17, v18, v19);
    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [v9 _fullVacuumIfPossible:v10];

    uint64_t v11 = *(void **)(v5 - 16);
    __int16 v12 = [*(id *)(v5 - 8) serverDB];
    *(void *)(*(void *)(*(void *)v5 + 8) + 24) += [v11 _fullVacuumIfPossible:v12];

    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(v5);
    }
  }
}

uint64_t __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _cleanFPCreationItemIdentifier:v4];
  uint64_t v5 = [*(id *)(a1 + 40) namedThrottleManager];
  [v5 cleanNamedThrottleTable:v4];

  uint64_t v6 = [*(id *)(a1 + 40) fsUploader];
  [v6 deleteExpiredJobs];

  int v7 = [*(id *)(a1 + 40) fsDownloader];
  [v7 deleteExpiredJobs];

  int v8 = [*(id *)(a1 + 40) applyScheduler];
  [v8 deleteExpiredJobs];

  uint64_t v9 = [*(id *)(a1 + 40) syncUpScheduler];
  [v9 deleteExpiredJobs];

  __int16 v10 = [*(id *)(a1 + 40) analyticsReporter];
  [v10 deleteMissingErrorThrottles];

  return 1;
}

+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) >= 4) {
    return 3;
  }
  else {
    return a3;
  }
}

- (int)urgencyForCacheDeleteUrgency:(int)a3
{
  id v4 = [(BRCAccountSessionFPFS *)self->_session clientDB];
  [v4 assertOnQueue];

  if ((a3 - 1) >= 4) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (double)accessTimeDeltaForUrgency:(int)a3
{
  double v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInLowUrgency];
      goto LABEL_6;
    case 2:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInMedUrgency];
      goto LABEL_6;
    case 3:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInHighUrgency];
      goto LABEL_6;
    case 4:
      id v4 = +[BRCUserDefaults defaultsForMangledID:0];
      [v4 accessTimeDeltaInVeryHighUrgency];
LABEL_6:
      double v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  session = self->_session;
  id v6 = a4;
  int v7 = [(BRCAccountSessionFPFS *)session fileUnlinker];
  LOBYTE(v4) = [v7 renameAndUnlinkInBackgroundItemAt:v4 path:v6];

  return v4;
}

- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(BRCAccountSessionFPFS *)self->_session clientState];
  double v5 = [v4 objectForKeyedSubscript:@"purgeableSpace"];
  id v6 = [NSNumber numberWithInt:v3];
  int v7 = [v5 objectForKeyedSubscript:v6];
  int64_t v8 = [v7 longLongValue];

  return v8;
}

- (int64_t)cachedNonPurgeableSpace
{
  uint64_t v2 = [(BRCAccountSessionFPFS *)self->_session clientState];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"nonPurgeableSpace"];
  int64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = brc_task_tracker_create("com.apple.bird.eviction");
  brc_bread_crumbs();
  int v7 = (char *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting for storage optimization%@", (uint8_t *)&v18, 0xCu);
  }

  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  intptr_t v10 = brc_task_tracker_wait_timeout((uint64_t)v6, v9);
  if (v10)
  {
    uint64_t v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      -[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:]((uint64_t)v11, v12);
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 60, @"timed out waiting for eviction");
    if (v13)
    {
      uint64_t v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        char v17 = "(passed to caller)";
        int v18 = 136315906;
        uint64_t v19 = "-[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:]";
        __int16 v20 = 2080;
        if (!a5) {
          char v17 = "(ignored by caller)";
        }
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        int64_t v25 = v14;
        _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v18, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v13;
    }
  }
  return v10 == 0;
}

- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 length])
  {
    __int16 v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]((uint64_t)v12, v13);
    }

LABEL_14:
    unint64_t v6 = 0;
    goto LABEL_24;
  }
  id v4 = v3;
  double v5 = (const char *)[v4 fileSystemRepresentation];
  unint64_t v6 = (unint64_t)v5;
  if (v5)
  {
    int v7 = open(v5, 1048832);
    if ((v7 & 0x80000000) == 0)
    {
      int v8 = v7;
      long long v18 = 0u;
      *(_OWORD *)&buf[8] = 0u;
      *(void *)buf = 1;
      if (ffsctl(v7, 0xC0284A20uLL, buf, 0) < 0
        && (*__error() != 45
         || (v16[0] = 0, ffsctl(v8, 0x80084A02uLL, v16, 0) < 0)
         || ffsctl(v8, 0xC0284A20uLL, buf, 0) < 0))
      {
        v16[0] = 0;
        v16[1] = 0;
        if (dirstat_np())
        {
          dispatch_time_t v9 = brc_bread_crumbs();
          intptr_t v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            [(BRCDiskSpaceReclaimer *)(uint64_t)v4 _recursivelySizeDirectoryAtPath:v10];
          }
          unint64_t v6 = 0;
          goto LABEL_23;
        }
        unint64_t v6 = v16[0];
        dispatch_time_t v9 = brc_bread_crumbs();
        intptr_t v10 = brc_default_log();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_23:

          close(v8);
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&long long v18 = v9;
        uint64_t v11 = "[DEBUG] space for %@ is %llu bytes (hfs compat. dirstat)%@";
      }
      else
      {
        unint64_t v6 = v18;
        dispatch_time_t v9 = brc_bread_crumbs();
        intptr_t v10 = brc_default_log();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&long long v18 = v9;
        uint64_t v11 = "[DEBUG] space for %@ is %llu bytes (apfs dirstat)%@";
      }
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0x20u);
      goto LABEL_23;
    }
    __int16 v12 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]((uint64_t)v4);
    }

    goto LABEL_14;
  }
LABEL_24:

  return v6;
}

- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3
{
  unint64_t v4 = [(BRCDiskSpaceReclaimer *)self totalSize];
  if (v4 >= a3) {
    return v4 - a3;
  }
  else {
    return 0;
  }
}

- (unint64_t)totalSize
{
  id v3 = [(BRCAccountSessionFPFS *)self->_session sessionDirPath];
  unint64_t v4 = [(BRCDiskSpaceReclaimer *)self _recursivelySizeDirectoryAtPath:v3];

  double v5 = [(BRCAccountSessionFPFS *)self->_session cacheDirPath];
  unint64_t v6 = [(BRCDiskSpaceReclaimer *)self _recursivelySizeDirectoryAtPath:v5] + v4;

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] not account for local document because we are on FPFS%@", (uint8_t *)&v2, 0xCu);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] reclaimable size from stage is %@%@", v4, 0x16u);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] reclaimable size from db is %@%@", v4, 0x16u);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(uint64_t *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v3 = 134218242;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_23FA42000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx recomputing purgeable space for all urgencies%@", (uint8_t *)&v3, 0x16u);
}

- (void)_computeCiconiaSizeInBytes:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23FA42000, v1, (os_log_type_t)0x90u, "[ERROR] Failed removing ciconia_diagnose: %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)_cleanFPCreationItemIdentifier:(void *)a1 .cold.1(void *a1)
{
  [a1 changes];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v1, v2, "[DEBUG] Changed %lld items%@", v3, v4, v5, v6, v7);
}

- (void)_cleanFPCreationItemIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning FP Creation Item Identifier%@", (uint8_t *)&v2, 0xCu);
}

- (void)_purgeSpaceUnderQueue:(uint64_t)a1 withUrgency:.cold.1(uint64_t a1)
{
  uint64_t v1 = +[BRCDumpContext stringFromByteCount:a1 context:0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] no need to evict, amount requested is %@%@", v4, v5, v6, v7, v8);
}

- (void)_purgeSpaceUnderQueue:(uint64_t)a1 withUrgency:.cold.2(uint64_t a1)
{
  uint64_t v1 = +[BRCDumpContext stringFromByteCount:a1 context:0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] evicted %@ from stage%@", v4, v5, v6, v7, v8);
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(*(void *)a1 + 8) + 24) context:0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Periodicly reclaimed %@%@", v4, v5, v6, v7, v8);
}

- (void)performOptimizeStorageWithTimeDelta:(uint64_t)a1 onDiskAccessTimeDelta:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23FA42000, a2, (os_log_type_t)0x90u, "[ERROR] Timed out waiting for eviction!%@", (uint8_t *)&v2, 0xCu);
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: calling %s with empty path%@", (uint8_t *)&v2, 0x16u);
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_23FA42000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't open %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)_recursivelySizeDirectoryAtPath:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = __error();
  uint64_t v7 = strerror(*v6);
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't get size for %@ : %s%@", (uint8_t *)&v8, 0x20u);
}

@end