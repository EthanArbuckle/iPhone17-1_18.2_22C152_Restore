@interface PBUIURLBackedSnapshotSource
- (BOOL)effectsAreBakedIn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)removeOnDiskSnapshotWithError:(id *)a3;
- (BOOL)saveColorStatistics;
- (BOOL)updateMetadataWith:(id)a3 error:(id *)a4;
- (BOOL)updatePosterPreferredProminentColor:(id)a3 error:(id *)a4;
- (NSDictionary)snapshotMetadata;
- (NSString)cacheIdentifier;
- (NSString)description;
- (NSURL)snapshotColorStatisticsURL;
- (NSURL)snapshotMetadataURL;
- (NSURL)snapshotURL;
- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4;
- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4 delegate:(id)a5;
- (PBUIURLBackedSnapshotSource)initWithSnapshotURL:(id)a3 colorStatisticsURL:(id)a4 metadataURL:(id)a5 format:(id)a6 delegate:(id)a7;
- (PBUIURLSourceDelegate)delegate;
- (PUIColorStatistics)contentColorStatistics;
- (PUIImageOnDiskFormat)format;
- (UIColor)derivedProminentPosterColor;
- (UIColor)posterPreferredProminentColor;
- (UIImage)snapshot;
- (_UILegibilitySettings)legibilitySettings;
- (id)buildCacheIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)encoderForSnapshot;
- (id)readFromDiskWithError:(id *)a3;
- (id)registerSnapshotSourceObserver:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)clearDerivedProminentColor;
- (void)colorStatisticsDidChange:(id)a3;
- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4;
- (void)invalidateCurrentSnapshot;
- (void)notifyObservers;
- (void)notifyObserversIfNeeded;
- (void)performBatchUpdates:(id)a3;
- (void)readColorStatisticsFromDisk;
- (void)readMetadataFromDisk;
- (void)setCacheIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSnapshotColorStatisticsURL:(id)a3;
- (void)setSnapshotMetadataURL:(id)a3;
- (void)setSnapshotURL:(id)a3;
- (void)setupSnapshotSourceForSnapshotURL:(id)a3 snapshotColorStatisticsURL:(id)a4 snapshotMetadataURL:(id)a5;
- (void)updateColorStatisticsWith:(id)a3;
- (void)updateFromDisk;
- (void)updateFromPathProvider:(id)a3;
- (void)updateWithImage:(id)a3 contentColorStatistics:(id)a4 metadata:(id)a5 completion:(id)a6;
@end

@implementation PBUIURLBackedSnapshotSource

- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4
{
  obj = self;
  objc_sync_enter(obj);
  v6 = [(PBUIURLBackedSnapshotSource *)obj encoderForSnapshot];
  [v6 currentSnapshotInterfaceOrientation:a3 outDeviceOrientation:a4];

  objc_sync_exit(obj);
}

- (id)encoderForSnapshot
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(PBUIURLBackedSnapshotSource *)v2 snapshotURL];

  if (v3)
  {
    id v4 = objc_alloc((Class)getPUIImageEncoderClass());
    v5 = [(PBUIURLBackedSnapshotSource *)v2 snapshotURL];
    v6 = [(PBUIURLBackedSnapshotSource *)v2 format];
    v7 = (void *)[v4 initWithURL:v5 format:v6];
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)snapshotURL
{
  return self->_snapshotURL;
}

- (PUIImageOnDiskFormat)format
{
  return self->_format;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return [(PBUIReplicaSourceObserverBox *)self->_observers registerSourceObserver:a3];
}

- (PBUIURLBackedSnapshotSource)initWithSnapshotURL:(id)a3 colorStatisticsURL:(id)a4 metadataURL:(id)a5 format:(id)a6 delegate:(id)a7
{
  id v33 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PBUIURLBackedSnapshotSource;
  v17 = [(PBUIURLBackedSnapshotSource *)&v34 init];
  if (v17)
  {
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    isFrozen = v17->_isFrozen;
    v17->_isFrozen = (BSAtomicFlag *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    isDirty = v17->_isDirty;
    v17->_isDirty = (BSAtomicFlag *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    needsColorSettingsUpdate = v17->_needsColorSettingsUpdate;
    v17->_needsColorSettingsUpdate = (BSAtomicFlag *)v22;

    objc_storeStrong((id *)&v17->_snapshotURL, a3);
    objc_storeStrong((id *)&v17->_snapshotColorStatisticsURL, a4);
    objc_storeStrong((id *)&v17->_snapshotMetadataURL, a5);
    objc_storeStrong((id *)&v17->_format, a6);
    objc_storeWeak((id *)&v17->_delegate, v16);
    uint64_t v24 = [objc_alloc((Class)getPUIColorStatisticsClass()) initWithDelegate:v17];
    contentColorStatistics = v17->_contentColorStatistics;
    v17->_contentColorStatistics = (PUIColorStatistics *)v24;

    v26 = [[PBUIReplicaSourceObserverBox alloc] initWithIdentifier:@"SnapshotSource"];
    observers = v17->_observers;
    v17->_observers = v26;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    snapshotImageWriteQueue = v17->_snapshotImageWriteQueue;
    v17->_snapshotImageWriteQueue = (OS_dispatch_queue *)Serial;

    uint64_t v30 = [(PBUIURLBackedSnapshotSource *)v17 buildCacheIdentifier];
    cacheIdentifier = v17->_cacheIdentifier;
    v17->_cacheIdentifier = (NSString *)v30;

    [(PBUIURLBackedSnapshotSource *)v17 updateFromDisk];
  }

  return v17;
}

- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4
{
  return [(PBUIURLBackedSnapshotSource *)self initWithPathProvider:a3 format:a4 delegate:0];
}

- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 snapshotURL];
  v12 = [v10 snapshotColorStatisticsURL];
  id v13 = [v10 snapshotMetadataURL];

  id v14 = [(PBUIURLBackedSnapshotSource *)self initWithSnapshotURL:v11 colorStatisticsURL:v12 metadataURL:v13 format:v9 delegate:v8];
  return v14;
}

- (void)updateFromPathProvider:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v11 snapshotURL];
  snapshotURL = v4->_snapshotURL;
  v4->_snapshotURL = (NSURL *)v5;

  uint64_t v7 = [v11 snapshotColorStatisticsURL];
  snapshotColorStatisticsURL = v4->_snapshotColorStatisticsURL;
  v4->_snapshotColorStatisticsURL = (NSURL *)v7;

  uint64_t v9 = [v11 snapshotMetadataURL];
  snapshotMetadataURL = v4->_snapshotMetadataURL;
  v4->_snapshotMetadataURL = (NSURL *)v9;

  [(PBUIURLBackedSnapshotSource *)v4 updateFromDisk];
  objc_sync_exit(v4);
}

- (void)invalidateCurrentSnapshot
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "Could not delete on-disk snapshot for reasons: %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)effectsAreBakedIn
{
  return 0;
}

- (BOOL)isValid
{
  int v2 = [(PBUIURLBackedSnapshotSource *)self snapshot];

  return v2 != 0;
}

- (NSDictionary)snapshotMetadata
{
  int v2 = self;
  objc_sync_enter(v2);
  snapshotMetadata = v2->_snapshotMetadata;
  if (!snapshotMetadata)
  {
    [(PBUIURLBackedSnapshotSource *)v2 readMetadataFromDisk];
    snapshotMetadata = v2->_snapshotMetadata;
  }
  uint64_t v4 = snapshotMetadata;
  objc_sync_exit(v2);

  return v4;
}

- (void)clearDerivedProminentColor
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "clearDerivedProminentColor failed for error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (UIColor)derivedProminentPosterColor
{
  int v2 = [(PBUIURLBackedSnapshotSource *)self snapshotMetadata];
  uint64_t v3 = [v2 objectForKey:@"kDerivedProminentPosterColorMetadataKey"];

  if ([v3 length])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = self;
    v6 = [v4 unarchivedObjectOfClass:v5 fromData:v3 error:0];

    uint64_t v7 = [v6 UIColor];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (UIColor *)v7;
}

- (UIColor)posterPreferredProminentColor
{
  int v2 = [(PBUIURLBackedSnapshotSource *)self snapshotMetadata];
  uint64_t v3 = [v2 objectForKey:@"kPosterPreferredProminentPosterColorMetadataKey"];

  if ([v3 length])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = self;
    v6 = [v4 unarchivedObjectOfClass:v5 fromData:v3 error:0];

    uint64_t v7 = [v6 UIColor];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (UIColor *)v7;
}

- (BOOL)updatePosterPreferredProminentColor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(PBUIURLBackedSnapshotSource *)v7 snapshotMetadata];
  uint64_t v9 = (void *)[v8 mutableCopy];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;

  if (v6)
  {
    id v13 = [v6 BSColor];
    [v12 setObject:v13 forKeyedSubscript:@"kPosterPreferredProminentPosterColorMetadataKey"];
  }
  else
  {
    [v12 removeObjectForKey:@"kPosterPreferredProminentPosterColorMetadataKey"];
  }
  BOOL v14 = [(PBUIURLBackedSnapshotSource *)v7 updateMetadataWith:v12 error:a4];

  objc_sync_exit(v7);
  return v14;
}

- (void)setSnapshotURL:(id)a3
{
  id v9 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = [v9 copy];
    snapshotURL = v4->_snapshotURL;
    v4->_snapshotURL = (NSURL *)v5;

    uint64_t v7 = [(PBUIURLBackedSnapshotSource *)v4 buildCacheIdentifier];
    cacheIdentifier = v4->_cacheIdentifier;
    v4->_cacheIdentifier = (NSString *)v7;

    [(PBUIURLBackedSnapshotSource *)v4 updateFromDisk];
  }
  objc_sync_exit(v4);
}

- (void)setSnapshotMetadataURL:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = [v7 copy];
    snapshotMetadataURL = v4->_snapshotMetadataURL;
    v4->_snapshotMetadataURL = (NSURL *)v5;

    [(PBUIURLBackedSnapshotSource *)v4 readMetadataFromDisk];
    [(PBUIURLBackedSnapshotSource *)v4 notifyObservers];
  }
  objc_sync_exit(v4);
}

- (void)setLegibilitySettings:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_legibilitySettings, a3);
    [(PBUIURLBackedSnapshotSource *)v5 notifyObservers];
  }
  objc_sync_exit(v5);
}

- (void)setSnapshot:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_snapshot, a3);
    [(PBUIURLBackedSnapshotSource *)v5 notifyObservers];
  }
  objc_sync_exit(v5);
}

- (void)setupSnapshotSourceForSnapshotURL:(id)a3 snapshotColorStatisticsURL:(id)a4 snapshotMetadataURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__PBUIURLBackedSnapshotSource_setupSnapshotSourceForSnapshotURL_snapshotColorStatisticsURL_snapshotMetadataURL___block_invoke;
  v14[3] = &unk_1E62B2EC8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PBUIURLBackedSnapshotSource *)self performBatchUpdates:v14];
}

uint64_t __112__PBUIURLBackedSnapshotSource_setupSnapshotSourceForSnapshotURL_snapshotColorStatisticsURL_snapshotMetadataURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSnapshotURL:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSnapshotColorStatisticsURL:*(void *)(a1 + 48)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 setSnapshotMetadataURL:v3];
}

- (BOOL)updateMetadataWith:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:a4];
    LODWORD(a4) = [v8 writeToURL:v7->_snapshotMetadataURL options:268435457 error:a4];
    if (a4)
    {
      [(NSURL *)v7->_snapshotMetadataURL setResourceValue:*MEMORY[0x1E4F1C598] forKey:*MEMORY[0x1E4F1C590] error:0];
      [(NSURL *)v7->_snapshotMetadataURL setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1C630] error:0];
      uint64_t v9 = [v6 copy];
      snapshotMetadata = v7->_snapshotMetadata;
      v7->_snapshotMetadata = (NSDictionary *)v9;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(a4) = [v8 removeItemAtURL:v7->_snapshotMetadataURL error:a4];
  }

  objc_sync_exit(v7);
  return (char)a4;
}

- (void)setSnapshotColorStatisticsURL:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_snapshotColorStatisticsURL, a3);
    [(PBUIURLBackedSnapshotSource *)v5 readColorStatisticsFromDisk];
  }
  objc_sync_exit(v5);
}

- (void)performBatchUpdates:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(BSAtomicFlag *)v4->_isFrozen setFlag:1];
  v5[2]();
  [(BSAtomicFlag *)v4->_isFrozen setFlag:0];
  [(PBUIURLBackedSnapshotSource *)v4 notifyObserversIfNeeded];
  objc_sync_exit(v4);
}

- (void)updateWithImage:(id)a3 contentColorStatistics:(id)a4 metadata:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = self;
  objc_sync_enter(v14);
  id v15 = [(PBUIURLBackedSnapshotSource *)v14 encoderForSnapshot];
  id v16 = v15;
  if (v15)
  {
    snapshotImageWriteQueue = v14->_snapshotImageWriteQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_2;
    block[3] = &unk_1E62B2F40;
    uint64_t v18 = &v20;
    id v20 = v15;
    id v21 = v10;
    id v25 = v13;
    uint64_t v22 = v14;
    id v23 = v11;
    id v24 = v12;
    dispatch_async(snapshotImageWriteQueue, block);

LABEL_5:
    goto LABEL_6;
  }
  if (v13)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke;
    v26[3] = &unk_1E62B2EF0;
    uint64_t v18 = &v27;
    id v27 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v26);
    goto LABEL_5;
  }
LABEL_6:

  objc_sync_exit(v14);
}

void __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"Could not create PUIImageEncoder for image";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.PaperBoardUI" code:-1 userInfo:v3];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v4);
}

void __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v17 = 0;
  uint64_t v4 = [v2 writeThenReadBackImage:v3 error:&v17];
  id v5 = v17;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_4;
    v9[3] = &unk_1E62B2F18;
    v9[4] = *(void *)(a1 + 48);
    id v10 = v4;
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E4F14428], v9);

    id v8 = v10;
    goto LABEL_8;
  }
  if (*(void *)(a1 + 72))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_3;
    block[3] = &unk_1E62B29D8;
    id v16 = *(id *)(a1 + 72);
    id v15 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v8 = v16;
LABEL_8:
  }
}

uint64_t __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_5;
  v4[3] = &unk_1E62B2EC8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 performBatchUpdates:v4];
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 1, 0);
  }
}

uint64_t __90__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setSnapshot:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateColorStatisticsWith:*(void *)(a1 + 48)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 updateMetadataWith:v3 error:0];
}

- (void)updateColorStatisticsWith:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  contentColorStatistics = v4->_contentColorStatistics;
  id v6 = [v7 averageColor];
  [v7 averageContrast];
  -[PUIColorStatistics updateWithAverageColor:contrast:](contentColorStatistics, "updateWithAverageColor:contrast:", v6);

  objc_sync_exit(v4);
}

- (void)colorStatisticsDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(BSAtomicFlag *)v4->_needsColorSettingsUpdate setFlag:1];
  [(PBUIURLBackedSnapshotSource *)v4 notifyObserversIfNeeded];
  [(PBUIURLBackedSnapshotSource *)v4 saveColorStatistics];
  objc_sync_exit(v4);
}

- (void)updateFromDisk
{
  int v2 = self;
  objc_sync_enter(v2);
  id v6 = 0;
  uint64_t v3 = [(PBUIURLBackedSnapshotSource *)v2 readFromDiskWithError:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = [(PBUIURLBackedSnapshotSource *)v2 delegate];
    [v5 snapshotSource:v2 failedToReadSnapshotAtURL:v2->_snapshotURL error:v4];
  }
  [(PBUIURLBackedSnapshotSource *)v2 setSnapshot:v3];

  objc_sync_exit(v2);
}

- (id)readFromDiskWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(PBUIURLBackedSnapshotSource *)v4 encoderForSnapshot];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 createUIImageWithError:a3];
  }
  else
  {
    id v7 = 0;
  }

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)saveColorStatistics
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PBUIURLBackedSnapshotSource *)v2 snapshotColorStatisticsURL];
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2->_contentColorStatistics requiringSecureCoding:1 error:0];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v3 path];
  id v7 = soft_PFFileProtectionNoneAttributes();
  char v8 = [v5 createFileAtPath:v6 contents:v4 attributes:v7];

  objc_sync_exit(v2);
  return v8;
}

- (void)readColorStatisticsFromDisk
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = [(PBUIURLBackedSnapshotSource *)obj snapshotColorStatisticsURL];
  uint64_t v3 = v2;
  if (v2 && ([v2 checkResourceIsReachableAndReturnError:0] & 1) != 0)
  {
    [v3 setResourceValue:*MEMORY[0x1E4F1C598] forKey:*MEMORY[0x1E4F1C590] error:0];
    [v3 setResourceValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1C630] error:0];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v3 options:1 error:0];
    if ([v4 length])
    {
      id v5 = (void *)MEMORY[0x1E4F28DC0];
      getPUIColorStatisticsClass();
      id v6 = self;
      id v7 = [v5 unarchivedObjectOfClass:v6 fromData:v4 error:0];

      if (v7)
      {
        contentColorStatistics = obj->_contentColorStatistics;
        uint64_t v9 = [v7 averageColor];
        [v7 averageContrast];
        -[PUIColorStatistics updateWithAverageColor:contrast:](contentColorStatistics, "updateWithAverageColor:contrast:", v9);
      }
    }
  }
  objc_sync_exit(obj);
}

- (void)readMetadataFromDisk
{
  obj = self;
  objc_sync_enter(obj);
  snapshotMetadataURL = obj->_snapshotMetadataURL;
  if (snapshotMetadataURL
    && [(NSURL *)snapshotMetadataURL checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:obj->_snapshotMetadataURL];
    if ([v3 length])
    {
      uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
      snapshotMetadata = obj->_snapshotMetadata;
      obj->_snapshotMetadata = (NSDictionary *)v4;
    }
  }
  objc_sync_exit(obj);
}

- (void)notifyObservers
{
  obj = self;
  objc_sync_enter(obj);
  [(BSAtomicFlag *)obj->_isDirty setFlag:1];
  [(PBUIURLBackedSnapshotSource *)obj notifyObserversIfNeeded];
  objc_sync_exit(obj);
}

- (void)notifyObserversIfNeeded
{
  int v2 = self;
  objc_sync_enter(v2);
  if (([(BSAtomicFlag *)v2->_isFrozen getFlag] & 1) == 0)
  {
    int v3 = [(BSAtomicFlag *)v2->_needsColorSettingsUpdate setFlag:0];
    if ((v3 | [(BSAtomicFlag *)v2->_isDirty setFlag:0]) == 1) {
      BSDispatchMain();
    }
  }
  objc_sync_exit(v2);
}

void __54__PBUIURLBackedSnapshotSource_notifyObserversIfNeeded__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 8) setNeedsSourceUpdate];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    int v2 = [*(id *)(a1 + 32) contentColorStatistics];
    [v3 colorStatisticsDidChange:v2];
  }
}

- (id)buildCacheIdentifier
{
  int v2 = self;
  objc_sync_enter(v2);
  id v3 = [(PBUIURLBackedSnapshotSource *)v2 snapshotURL];
  uint64_t v4 = v3;
  if (v3 && ([v3 checkResourceIsReachableAndReturnError:0] & 1) != 0)
  {
    id v10 = 0;
    [v4 getResourceValue:&v10 forKey:*MEMORY[0x1E4F1C560] error:0];
    id v5 = v10;
    id v6 = NSString;
    id v7 = [v4 path];
    char v8 = [v6 stringWithFormat:@"%@ (%@)", v7, v5];
  }
  else
  {
    char v8 = 0;
  }

  objc_sync_exit(v2);
  return v8;
}

- (BOOL)removeOnDiskSnapshotWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(PBUIURLBackedSnapshotSource *)v4 snapshotURL];
  LOBYTE(a3) = [v5 removeItemAtURL:v6 error:a3];

  objc_sync_exit(v4);
  return (char)a3;
}

- (NSString)description
{
  return (NSString *)[(PBUIURLBackedSnapshotSource *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PBUIURLBackedSnapshotSource *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(PBUIURLBackedSnapshotSource *)self cacheIdentifier];
  [v4 appendString:v5 withName:@"cacheIdentifier"];

  id v6 = [v4 activeMultilinePrefix];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v25[3] = &unk_1E62B2C38;
  id v7 = v4;
  id v26 = v7;
  id v27 = self;
  [v7 appendBodySectionWithName:@"snapshot" multilinePrefix:v6 block:v25];

  char v8 = [v7 activeMultilinePrefix];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v22[3] = &unk_1E62B2C38;
  id v9 = v7;
  id v23 = v9;
  id v24 = self;
  [v9 appendBodySectionWithName:@"colorStatistics" multilinePrefix:v8 block:v22];

  id v10 = [v9 activeMultilinePrefix];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v19 = &unk_1E62B2C38;
  id v11 = v9;
  id v20 = v11;
  id v21 = self;
  [v11 appendBodySectionWithName:@"metadata" multilinePrefix:v10 block:&v16];

  id v12 = (id)objc_msgSend(v11, "appendBool:withName:", -[PBUIURLBackedSnapshotSource effectsAreBakedIn](self, "effectsAreBakedIn", v16, v17, v18, v19), @"effectsAreBakedIn");
  id v13 = (id)[v11 appendObject:self->_observers withName:@"observers"];
  id v14 = v11;

  return v14;
}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) snapshot];
  id v4 = (id)[v2 appendObject:v3 withName:@"image"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) snapshotURL];
  id v6 = (id)[v5 appendObject:v7 withName:@"snapshotURL"];
}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) contentColorStatistics];
  id v4 = (id)[v2 appendObject:v3 withName:@"colorStatistics"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) snapshotColorStatisticsURL];
  id v6 = (id)[v5 appendObject:v7 withName:@"snapshotColorStatisticsURL"];
}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) snapshotMetadata];
  id v4 = (id)[v2 appendObject:v3 withName:@"metadata"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) snapshotMetadataURL];
  id v6 = (id)[v5 appendObject:v7 withName:@"snapshotMetadataURL"];
}

- (id)succinctDescription
{
  int v2 = [(PBUIURLBackedSnapshotSource *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBUIURLBackedSnapshotSource *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v20 = 1;
  }
  else if (v4)
  {
    id v6 = self;
    objc_sync_enter(v6);
    id v7 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
    char v8 = [(PBUIURLBackedSnapshotSource *)v6 snapshotURL];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke;
    v29[3] = &unk_1E62B2F90;
    id v9 = v5;
    uint64_t v30 = v9;
    id v10 = (id)[v7 appendObject:v8 counterpart:v29];

    id v11 = [(PBUIURLBackedSnapshotSource *)v6 snapshotColorStatisticsURL];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_2;
    v27[3] = &unk_1E62B2F90;
    id v12 = v9;
    v28 = v12;
    id v13 = (id)[v7 appendObject:v11 counterpart:v27];

    id v14 = [(PBUIURLBackedSnapshotSource *)v6 snapshotMetadataURL];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_3;
    v25[3] = &unk_1E62B2F90;
    id v15 = v12;
    id v26 = v15;
    id v16 = (id)[v7 appendObject:v14 counterpart:v25];

    uint64_t v17 = [(PBUIURLBackedSnapshotSource *)v6 snapshot];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_4;
    v23[3] = &unk_1E62B2F90;
    uint64_t v18 = v15;
    id v24 = v18;
    id v19 = (id)[v7 appendObject:v17 counterpart:v23];

    if ([v7 isEqual])
    {
      v22.receiver = v6;
      v22.super_class = (Class)PBUIURLBackedSnapshotSource;
      BOOL v20 = [(PBUIURLBackedSnapshotSource *)&v22 isEqual:v18];
    }
    else
    {
      BOOL v20 = 0;
    }

    objc_sync_exit(v6);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotURL];
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotColorStatisticsURL];
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotMetadataURL];
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshot];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (PBUIURLSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIURLSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUIColorStatistics)contentColorStatistics
{
  return self->_contentColorStatistics;
}

- (NSURL)snapshotColorStatisticsURL
{
  return self->_snapshotColorStatisticsURL;
}

- (NSURL)snapshotMetadataURL
{
  return self->_snapshotMetadataURL;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_snapshotMetadataURL, 0);
  objc_storeStrong((id *)&self->_snapshotColorStatisticsURL, 0);
  objc_storeStrong((id *)&self->_snapshotURL, 0);
  objc_storeStrong((id *)&self->_contentColorStatistics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotMetadata, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_snapshotImageWriteQueue, 0);
  objc_storeStrong((id *)&self->_needsColorSettingsUpdate, 0);
  objc_storeStrong((id *)&self->_isDirty, 0);
  objc_storeStrong((id *)&self->_isFrozen, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end