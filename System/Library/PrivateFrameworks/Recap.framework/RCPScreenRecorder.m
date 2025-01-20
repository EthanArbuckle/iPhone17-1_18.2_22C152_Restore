@interface RCPScreenRecorder
+ (id)takeScreenshot;
+ (id)takeScreenshot:(double)a3;
- (BOOL)isRecording;
- (NSArray)snapshots;
- (double)maxDuration;
- (void)setMaxDuration:(double)a3;
- (void)snapshot;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation RCPScreenRecorder

+ (id)takeScreenshot
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  v3 = +[RCPScreenRecorder takeScreenshot:](RCPScreenRecorder, "takeScreenshot:");

  return v3;
}

+ (id)takeScreenshot:(double)a3
{
  v26[6] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F442C8];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v5 = *MEMORY[0x1E4F442A0];
  v26[0] = v4;
  v26[1] = &unk_1EFF9A830;
  uint64_t v6 = *MEMORY[0x1E4F442A8];
  v25[1] = v5;
  v25[2] = v6;
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  v26[2] = MEMORY[0x1E4F1CC38];
  v25[3] = *MEMORY[0x1E4F442B0];
  v8 = [NSNumber numberWithDouble:a3];
  v26[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F442B8];
  v25[4] = *MEMORY[0x1E4F442C0];
  v25[5] = v9;
  v26[4] = &unk_1EFF9A848;
  v26[5] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];

  v11 = (void *)_UIRenderDisplay();
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v12 = (void *)getFBSOrientationObserverClass_softClass_0;
  uint64_t v24 = getFBSOrientationObserverClass_softClass_0;
  if (!getFBSOrientationObserverClass_softClass_0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getFBSOrientationObserverClass_block_invoke_0;
    v20[3] = &unk_1E5D76FF8;
    v20[4] = &v21;
    __getFBSOrientationObserverClass_block_invoke_0((uint64_t)v20);
    v12 = (void *)v22[3];
  }
  v13 = v12;
  _Block_object_dispose(&v21, 8);
  id v14 = objc_alloc_init(v13);
  uint64_t v15 = [v14 activeInterfaceOrientation];
  if ((unint64_t)(v15 - 2) >= 3) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15 - 1;
  }
  [v14 invalidate];
  v17 = objc_alloc_init(RCPScreenSnapshot);
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithIOSurface:v11 scale:v16 orientation:1.0];
  [(RCPScreenSnapshot *)v17 setSnapshotImage:v18];

  [v14 invalidate];
  return v17;
}

uint64_t __36__RCPScreenRecorder_takeScreenshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4102F38](a2);
}

- (void)startRecording
{
  self->_recording = 1;
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  snapshots = self->_snapshots;
  self->_snapshots = v3;

  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

  uint64_t v7 = (OS_dispatch_queue *)dispatch_queue_create("RCPScreenRecorder", v6);
  snapshotQueue = self->_snapshotQueue;
  self->_snapshotQueue = v7;

  dispatch_time_t v9 = dispatch_time(0, 100000000);
  v10 = self->_snapshotQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RCPScreenRecorder_startRecording__block_invoke;
  block[3] = &unk_1E5D76FB0;
  block[4] = self;
  dispatch_after(v9, v10, block);
}

uint64_t __35__RCPScreenRecorder_startRecording__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshot];
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  snapshotQueue = self->_snapshotQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__RCPScreenRecorder_isRecording__block_invoke;
  v5[3] = &unk_1E5D771B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(snapshotQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__RCPScreenRecorder_isRecording__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)stopRecording
{
  snapshotQueue = self->_snapshotQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__RCPScreenRecorder_stopRecording__block_invoke;
  block[3] = &unk_1E5D76FB0;
  block[4] = self;
  dispatch_sync(snapshotQueue, block);
}

uint64_t __34__RCPScreenRecorder_stopRecording__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

- (NSArray)snapshots
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  snapshotQueue = self->_snapshotQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__RCPScreenRecorder_snapshots__block_invoke;
  v5[3] = &unk_1E5D771B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(snapshotQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __30__RCPScreenRecorder_snapshots__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (void)snapshot
{
  id v3 = +[RCPScreenRecorder takeScreenshot:0.25];
  if (v3)
  {
    [(NSMutableArray *)self->_snapshots addObject:v3];
    [(RCPScreenRecorder *)self maxDuration];
    if (v4 <= 0.0)
    {
      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v5 = [v3 timestamp];
      [(RCPScreenRecorder *)self maxDuration];
      unint64_t v7 = v5 - RCPMachTimestampFromTimeInterval(v6);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    char v9 = [(NSMutableArray *)self->_snapshots lastObject];
    uint64_t v10 = [v9 index];

    if ([(NSMutableArray *)self->_snapshots count])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [(NSMutableArray *)self->_snapshots objectAtIndexedSubscript:v11];
        uint64_t v13 = [v12 index];

        if (!v7
          || ([(NSMutableArray *)self->_snapshots objectAtIndexedSubscript:v11],
              id v14 = objc_claimAutoreleasedReturnValue(),
              unint64_t v15 = [v14 timestamp],
              v14,
              v15 >= v7))
        {
          uint64_t v16 = 0;
          char v17 = 1;
          while (1)
          {
            char v18 = v17;
            if (v10 - v13 > RCPScreenRecorderSnapshotDiscardRates[v16])
            {
              if (v13 % *(void *)((char *)RCPScreenRecorderSnapshotDiscardRates + ((8 * v16) | 8))) {
                break;
              }
            }
            char v17 = 0;
            uint64_t v16 = 2;
            if ((v18 & 1) == 0) {
              goto LABEL_14;
            }
          }
        }
        [v8 addIndex:v11];
LABEL_14:
        ++v11;
      }
      while (v11 < [(NSMutableArray *)self->_snapshots count]);
    }
    [(NSMutableArray *)self->_snapshots removeObjectsAtIndexes:v8];
    if (self->_recording)
    {
      dispatch_time_t v19 = dispatch_time(0, 100000000);
      snapshotQueue = self->_snapshotQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__RCPScreenRecorder_snapshot__block_invoke;
      block[3] = &unk_1E5D76FB0;
      block[4] = self;
      dispatch_after(v19, snapshotQueue, block);
    }
  }
}

uint64_t __29__RCPScreenRecorder_snapshot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshot];
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(double)a3
{
  self->_maxDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
}

@end