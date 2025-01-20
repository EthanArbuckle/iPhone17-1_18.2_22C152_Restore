@interface QLCacheThread
@end

@implementation QLCacheThread

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke(uint64_t a1)
{
  v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_5();
  }

  v3 = [*(id *)(a1 + 32) modeLock];
  [v3 lock];

  uint64_t v4 = [*(id *)(a1 + 32) currentMode];
  v5 = *(void **)(a1 + 32);
  if (v4 != 2)
  {
    if (![v5 waitingForCleanup]) {
      goto LABEL_13;
    }
    v8 = _log_3();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (![v5 thumbnailInMemoryToSaveCount] && !objc_msgSend(*(id *)(a1 + 32), "hitToSaveCount"))
  {
    if (![*(id *)(a1 + 32) waitingForCleanup]) {
      goto LABEL_13;
    }
    v8 = _log_3();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
      goto LABEL_13;
    }
LABEL_11:
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_2();
    goto LABEL_12;
  }
  v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_3();
  }

  v7 = [*(id *)(a1 + 32) cleanUpDatabaseThread];
  [v7 startCleanUp];

LABEL_13:
  v10 = _log_3();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_1();
  }

  v11 = [*(id *)(a1 + 32) modeLock];
  [v11 unlock];
}

void __71___QLCacheThread_Private___addThumbnailRequestIntoDiskCacheQueryQueue___block_invoke(id *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] modeLock];
  [v2 lock];

  if ((unint64_t)[a1[4] currentMode] >= 4)
  {
    uint64_t v4 = _log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = [a1[5] fileIdentifier];
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      v7 = "Refuse to query the disk cache: the cache is closed (%@)";
      goto LABEL_7;
    }
LABEL_8:

LABEL_9:
    [a1[4] _dispatchThumbnailRequestInServerThread:a1[6]];
    goto LABEL_10;
  }
  int v3 = [a1[4] lowDiskSpace];
  uint64_t v4 = _log_3();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = [a1[5] fileIdentifier];
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      v7 = "Refuse to query the disk cache: we are in low disk space mode (%@)";
LABEL_7:
      _os_log_impl(&dword_1DDC5E000, v4, OS_LOG_TYPE_INFO, v7, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v5)
  {
    id v9 = a1[5];
    v10 = [v9 fileIdentifier];
    [a1[5] size];
    uint64_t v12 = v11;
    [a1[5] size];
    uint64_t v14 = v13;
    v15 = &stru_1F39B7010;
    if ([a1[5] iconMode]) {
      v16 = @"Icon mode";
    }
    else {
      v16 = &stru_1F39B7010;
    }
    if ([a1[6] needsLowQualityThumbnailGeneration]) {
      v17 = @"(low quality)";
    }
    else {
      v17 = &stru_1F39B7010;
    }
    uint64_t v18 = [a1[6] badgeType];
    if (v18)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a1[6], "badgeType"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138413826;
    id v31 = v9;
    __int16 v32 = 2112;
    v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    __int16 v36 = 2048;
    uint64_t v37 = v14;
    __int16 v38 = 2112;
    v39 = v16;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_1DDC5E000, v4, OS_LOG_TYPE_INFO, "Trying disk cache for %@ fi: %@ @ %.1fx%.1f %@ %@ %@", buf, 0x48u);
    if (v18) {
  }
    }
  uint64_t v19 = [a1[4] currentDiskCacheQueryOperation];
  if (!v19
    || (v20 = (void *)v19,
        [a1[4] currentDiskCacheQueryOperation],
        v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = [v21 appendThumbnailRequest:a1[6]],
        v21,
        v20,
        (v22 & 1) == 0))
  {
    v23 = [[QLDiskCacheQueryOperation alloc] initWithCacheThread:a1[4]];
    [a1[4] setCurrentDiskCacheQueryOperation:v23];

    v24 = [a1[4] currentDiskCacheQueryOperation];
    int v25 = [v24 appendThumbnailRequest:a1[6]];

    if (!v25)
    {
      v28 = _log_3();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = [a1[5] fileIdentifier];
        *(_DWORD *)buf = 138412290;
        id v31 = v29;
        _os_log_impl(&dword_1DDC5E000, v28, OS_LOG_TYPE_INFO, "Could not append thumbnail request to QLCacheThread. (%@)", buf, 0xCu);
      }
      [a1[4] setCurrentDiskCacheQueryOperation:0];
      goto LABEL_9;
    }
    v26 = [a1[4] diskCacheQueryOperationQueue];
    v27 = [a1[4] currentDiskCacheQueryOperation];
    [v26 addOperation:v27];
  }
LABEL_10:
  if ((unint64_t)[a1[4] currentMode] <= 3) {
    [a1[4] _updateMode];
  }
  v8 = [a1[4] modeLock];
  [v8 unlock];
}

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke(uint64_t a1)
{
  v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_2();
  }

  int v3 = [*(id *)(a1 + 32) modeLock];
  [v3 lock];

  objc_msgSend(*(id *)(a1 + 32), "setHitCount:", objc_msgSend(*(id *)(a1 + 32), "hitCount") + 1);
  if ((unint64_t)[*(id *)(a1 + 32) currentMode] <= 3) {
    [*(id *)(a1 + 32) _updateMode];
  }
  uint64_t v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_1();
  }

  BOOL v5 = [*(id *)(a1 + 32) modeLock];
  [v5 unlock];
}

void __33___QLCacheThread_serverIsWorking__block_invoke(uint64_t a1)
{
  v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33___QLCacheThread_serverIsWorking__block_invoke_cold_2();
  }

  int v3 = [*(id *)(a1 + 32) modeLock];
  [v3 lock];

  [*(id *)(a1 + 32) setServerThreadIsIdle:0];
  if ((unint64_t)[*(id *)(a1 + 32) currentMode] <= 3) {
    [*(id *)(a1 + 32) _updateMode];
  }
  uint64_t v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __33___QLCacheThread_serverIsWorking__block_invoke_cold_1();
  }

  BOOL v5 = [*(id *)(a1 + 32) modeLock];
  [v5 unlock];
}

void __30___QLCacheThread_serverIsIdle__block_invoke(uint64_t a1)
{
  v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_3();
  }

  [*(id *)(a1 + 32) _drainPendingBlocksNow];
  int v3 = _log_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_2();
  }

  uint64_t v4 = [*(id *)(a1 + 32) modeLock];
  [v4 lock];

  [*(id *)(a1 + 32) setServerThreadIsIdle:1];
  if ((unint64_t)[*(id *)(a1 + 32) currentMode] <= 3) {
    [*(id *)(a1 + 32) _updateMode];
  }
  BOOL v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __30___QLCacheThread_serverIsIdle__block_invoke_cold_1();
  }

  v6 = [*(id *)(a1 + 32) modeLock];
  [v6 unlock];
}

uint64_t __48___QLCacheThread__shouldQuitWorkingModeForMode___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __81___QLCacheThread_CacheDelete__purgeableSpaceOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diskCache];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 sizeSumOfThumbnailsOlderThanDate:*(void *)(a1 + 40)];
}

BOOL __72___QLCacheThread_CacheDelete__purgeOnMountPoint_withUrgency_beforeDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diskCache];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 removeThumbnailsOlderThanDate:*(void *)(a1 + 40)];

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 0;
}

uint64_t __44___QLCacheThread_databaseCorruptionDetected__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __37___QLCacheThread__drainPendingBlocks__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 8 * v2 + 136));
    if (!v4) {
      break;
    }
    BOOL v5 = v4;
    v3 |= (*((uint64_t (**)(void))v4 + 2))();

    ++v2;
  }
  while (v2 != 10);
  v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __37___QLCacheThread__drainPendingBlocks__block_invoke_cold_1();
  }

  return v3 & 1;
}

uint64_t __37___QLCacheThread__scheduleBlockDrain__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduledDrainPendingBlocks];
}

uint64_t __33___QLCacheThread_enqueueWriting___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  while (*(void *)(*(void *)(a1 + 32) + 136 + 8 * v2))
  {
    if (++v2 == 10) {
      goto LABEL_9;
    }
  }
  if (v2 != 9)
  {
LABEL_9:
    v8 = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32) + 8 * v2;
    v10 = *(void **)(v9 + 136);
    *(void *)(v9 + 136) = v8;

    uint64_t v11 = *(void **)(a1 + 32);
    return [v11 _scheduleBlockDrain];
  }
  int v3 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 208);
  *(void *)(v4 + 208) = v3;

  v6 = _log_3();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __33___QLCacheThread_enqueueWriting___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _drainPendingBlocksNow];
}

void __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("low disk space source queue", v2);
  [*(id *)(a1 + 32) setLowDiskSpaceSourceQueue:v3];

  uint64_t v4 = [*(id *)(a1 + 32) lowDiskSpaceSourceQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14498], 0, 0x304uLL, v4);
  [*(id *)(a1 + 32) setLowDiskSpaceSource:v5];

  v6 = [*(id *)(a1 + 32) lowDiskSpaceSource];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke_2;
  handler[3] = &unk_1E6D0C648;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler(v6, handler);

  v7 = [*(id *)(a1 + 32) lowDiskSpaceSource];
  dispatch_resume(v7);

  [*(id *)(a1 + 32) _updateLowDisk];
}

uint64_t __62___QLCacheThread__registerMachPortForLowDiskSpaceNotification__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLowDisk];
}

uint64_t __64___QLCacheThread__unregisterMachPortForLowDiskSpaceNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lowDiskSpaceSource];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setLowDiskSpaceSource:0];
  dispatch_queue_t v3 = *(void **)(a1 + 32);
  return [v3 setLowDiskSpaceSourceQueue:0];
}

uint64_t __23___QLCacheThread_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMode];
}

uint64_t __27___QLCacheThread_openCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMode];
}

uint64_t __37___QLCacheThread_forceCommitAndClose__block_invoke(uint64_t a1)
{
  uint64_t v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37___QLCacheThread_forceCommitAndClose__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _drainPendingBlocksNow];
}

uint64_t __47___QLCacheThread__willStartClosedModeFromMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyDrainTimer];
}

void __27___QLCacheThread_cacheInfo__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_source_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v6 = NSNumber;
  v7 = [*(id *)(a1 + 32) diskCache];
  v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "size"));
  [v5 setObject:v8 forKey:@"size"];

  uint64_t v9 = *(void **)(a1 + 32);
  v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v11 = NSNumber;
  id v13 = [v9 diskCache];
  [v13 fragmentation];
  uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
  [v10 setObject:v12 forKey:@"fragmentation"];
}

void __35___QLCacheThread_allThumbnailsInfo__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_source_t v5 = [*(id *)(a1 + 32) diskCache];
  id v13 = [v5 enumeratorForAllFilesUbiquitousFiles:0 withExtraInfo:1];

  v6 = [*(id *)(a1 + 32) diskCache];
  v7 = [v6 enumeratorForAllFilesUbiquitousFiles:1 withExtraInfo:1];

  v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = [*(id *)(a1 + 32) _allThumbnailsEnumerateWithEnumerator:v13];
  [v8 addObjectsFromArray:v9];

  v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v12 = [v10 _allThumbnailsEnumerateWithEnumerator:v7];
  [v11 addObjectsFromArray:v12];
}

void __49___QLCacheThread_allThumbnailsForFileIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_source_t v5 = [*(id *)(a1 + 32) diskCache];
  uint64_t v24 = a1;
  int v25 = [v5 enumeratorForAllThumbnailsWithFileIdentifier:*(void *)(a1 + 40)];

  uint64_t v6 = [v25 nextThumbnailData];
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      id v32 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v8 = NSNumber;
      [v7 size];
      id v31 = objc_msgSend(v8, "numberWithFloat:");
      v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "iconMode"));
      v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "iconVariant"));
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "interpolationQuality"));
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "badgeType"));
      int v10 = [v7 iconMode];
      uint64_t v11 = @"Thumbnail";
      if (v10) {
        uint64_t v11 = @"Icon";
      }
      v28 = v11;
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "hitCount"));
      uint64_t v12 = [v7 lastHitDate];
      id v13 = [v7 bitmapFormat];
      uint64_t v14 = NSNumber;
      v27 = [v7 bitmapData];
      v15 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v27, "length"));
      v16 = NSNumber;
      v17 = [v7 metadata];
      uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
      uint64_t v19 = objc_msgSend(v32, "initWithObjectsAndKeys:", v31, @"size", v30, @"iconmode", v33, @"iconvariant", v9, @"interpolationquality", v29, @"badgeType", v28, @"humaniconmode", v26, @"hitcount", v12, @"lasthitdate", v13,
                      @"bitmapFormat",
                      v15,
                      @"bitmaplength",
                      v18,
                      @"plistbufferlength",
                      0);

      v20 = [v7 bitmapData];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        char v22 = [v7 bitmapData];
        [v19 setObject:v22 forKey:@"image"];
      }
      [*(id *)(*(void *)(*(void *)(v24 + 48) + 8) + 40) addObject:v19];

      uint64_t v23 = [v25 nextThumbnailData];

      v7 = (void *)v23;
    }
    while (v23);
  }
}

uint64_t __60___QLCacheThread_setLastHitDateOfAllCachedThumbnailsToDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diskCache];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 setLastHitDateOfAllCachedThumbnailsToDate:*(void *)(a1 + 40)];

  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __53___QLCacheThread_noteRemoteThumbnailMissingForItems___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __53___QLCacheThread_noteRemoteThumbnailPresentForItems___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __67___QLCacheThread_itemsAfterFilteringOutItemsWithMissingThumbnails___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) itemsAfterFilteringOutItemsWithMissingThumbnails:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __47___QLCacheThread_itemIsMissingRemoteThumbnail___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 40) itemIsMissingRemoteThumbnail:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) request];
    uint64_t v4 = [v3 fileIdentifier];
    dispatch_source_t v5 = [*(id *)(a1 + 32) request];
    [v5 size];
    uint64_t v7 = v6;
    v8 = [*(id *)(a1 + 32) request];
    [v8 size];
    int v18 = 138412802;
    uint64_t v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1DDC5E000, v2, OS_LOG_TYPE_INFO, "No thumbnail found in cache for %@ @ %.1f %.1f", (uint8_t *)&v18, 0x20u);
  }
  if (([*(id *)(a1 + 32) shouldGenerateLowQualityThumbnailOnCacheMiss] & 1) == 0
    && [*(id *)(a1 + 32) needsLowQualityThumbnailGeneration])
  {
    int v10 = (void *)MEMORY[0x1E4F3A6C8];
    uint64_t v11 = [*(id *)(a1 + 32) request];
    uint64_t v12 = [v10 errorWithCode:2 request:v11 additionalUserInfo:0];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 312));
    [WeakRetained didNotFindLowQualityEntryInCachedForThumbnailRequest:*(void *)(a1 + 32) error:v12];
  }
  uint64_t v14 = _log_3();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke_cold_1();
  }

  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 312));
  [v15 queueThumbnailRequest:*(void *)(a1 + 32) tryCache:0 tryAdditionsFirst:1];

  v16 = [*(id *)(a1 + 40) modeLock];
  [v16 lock];

  objc_msgSend(*(id *)(a1 + 40), "setMissedCount:", objc_msgSend(*(id *)(a1 + 40), "missedCount") + 1);
  if ((unint64_t)[*(id *)(a1 + 40) currentMode] <= 3) {
    [*(id *)(a1 + 40) _updateMode];
  }
  v17 = [*(id *)(a1 + 40) modeLock];
  [v17 unlock];
}

void __54___QLCacheThread_Private___thumbnailHasBeenCancelled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modeLock];
  [v2 lock];

  if ((unint64_t)[*(id *)(a1 + 32) currentMode] <= 3) {
    [*(id *)(a1 + 32) _updateMode];
  }
  id v3 = [*(id *)(a1 + 32) modeLock];
  [v3 unlock];
}

void __37___QLCacheThread__drainPendingBlocks__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Coalesced %ld cache writing jobs", v2, v3, v4, v5, v6);
}

void __33___QLCacheThread_enqueueWriting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Pending write blocks list is full. Draining", v2, v3, v4, v5, v6);
}

void __37___QLCacheThread_forceCommitAndClose__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining pending blocks before commiting and closing", v2, v3, v4, v5, v6);
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-serverIsIdle relinquishing _modeLock", v2, v3, v4, v5, v6);
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-serverIsIdle taking _modeLock", v2, v3, v4, v5, v6);
}

void __30___QLCacheThread_serverIsIdle__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining pending blocks before commiting during server idling", v2, v3, v4, v5, v6);
}

void __33___QLCacheThread_serverIsWorking__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-serverIsWorking relinquishing _modeLock", v2, v3, v4, v5, v6);
}

void __33___QLCacheThread_serverIsWorking__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-serverIsWorking taking _modeLock", v2, v3, v4, v5, v6);
}

void __67___QLCacheThread_Private___dispatchThumbnailRequestInServerThread___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Cache miss for %@, reenqueuing request", v2, v3, v4, v5, v6);
}

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_sendThumbnailData relinquishing _modeLock", v2, v3, v4, v5, v6);
}

void __66___QLCacheThread_Private___sendThumbnailData_forThumbnailRequest___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_sendThumbnailData taking _modeLock", v2, v3, v4, v5, v6);
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_cleanUpDatabaseDone relinquishing _modeLock", v2, v3, v4, v5, v6);
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Signaling database clean-up done", v2, v3, v4, v5, v6);
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Relaunching dabase clean-up as we have pending saves", v2, v3, v4, v5, v6);
}

void __47___QLCacheThread_Private___cleanUpDatabaseDone__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_cleanUpDatabaseDone taking _modeLock", v2, v3, v4, v5, v6);
}

@end