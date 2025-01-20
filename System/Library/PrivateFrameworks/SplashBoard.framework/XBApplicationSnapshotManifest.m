@interface XBApplicationSnapshotManifest
+ (id)_manifestsByIdentity;
+ (id)debugDescription;
+ (void)deleteAllSystemSnapshots;
+ (void)handleTrackingStateChange;
+ (void)initialize;
- (BOOL)_invalidate;
- (BOOL)snapshotsConsideredUnpurgableByAPFS;
- (NSString)bundleIdentifier;
- (NSString)containerPath;
- (NSString)defaultGroupIdentifier;
- (NSString)description;
- (XBApplicationSnapshotManifest)initWithApplicationInfo:(id)a3;
- (XBApplicationSnapshotManifest)initWithContainerIdentity:(id)a3 store:(id)a4;
- (XBApplicationSnapshotManifestDelegate)delegate;
- (XBApplicationSnapshotManifestImpl)manifestImpl;
- (id)_allSnapshotGroups;
- (id)createSnapshotWithGroupID:(id)a3;
- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)snapshotsForGroupID:(id)a3;
- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4;
- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4;
- (id)snapshotsForGroupIDs:(id)a3;
- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4;
- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)archive;
- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4;
- (void)beginTrackingImageDeletions;
- (void)dealloc;
- (void)deleteAllSnapshots;
- (void)deleteSnapshot:(id)a3;
- (void)deleteSnapshots:(id)a3;
- (void)deleteSnapshotsForGroupID:(id)a3;
- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4;
- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4;
- (void)deleteSnapshotsMatchingPredicate:(id)a3;
- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3;
- (void)endTrackingImageDeletions;
- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7;
- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 completion:(id)a6;
- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 didGenerateImage:(id)a6 didSaveImage:(id)a7;
- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7;
- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4;
- (void)purgeSnapshotsWithProtectedContent;
- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateSnapshotsAPFSPurgability:(BOOL)a3;
@end

@implementation XBApplicationSnapshotManifest

- (NSString)defaultGroupIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  v3 = [WeakRetained defaultGroupIdentifier];

  return (NSString *)v3;
}

- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  v9 = [WeakRetained snapshotsForGroupIDs:v7 fetchRequest:v6];

  return v9;
}

- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  v9 = [WeakRetained snapshotsForGroupID:v7 matchingPredicate:v6];

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_workloop_t v3 = dispatch_workloop_create("XBApplicationManifestWorkloop");
    v4 = (void *)__ManifestWorkloop;
    __ManifestWorkloop = (uint64_t)v3;

    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("XBApplicationManifestSerialWorkQueue", 0, (dispatch_queue_t)__ManifestWorkloop);
    id v6 = (void *)__ManifestSerialWorkQueue;
    __ManifestSerialWorkQueue = (uint64_t)v5;

    uint64_t v7 = BSDispatchQueueCreateWithQualityOfService();
    v8 = (void *)__ManifestImageAccessQueue;
    __ManifestImageAccessQueue = v7;

    uint64_t v9 = BSDispatchQueueCreateWithQualityOfService();
    v10 = (void *)__ManifestArchiveSchedulingQueue;
    __ManifestArchiveSchedulingQueue = v9;

    uint64_t v11 = BSDispatchQueueCreateWithQualityOfService();
    v12 = (void *)__ManifestCallOutQueue;
    __ManifestCallOutQueue = v11;

    uint64_t v13 = BSDispatchQueueCreateWithQualityOfService();
    v14 = (void *)__ManifestFSEventsQueue;
    __ManifestFSEventsQueue = v13;

    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = (void *)__ManifestsByIdentity;
    __ManifestsByIdentity = (uint64_t)v15;

    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18 = (void *)__trackersByIdentity;
    __trackersByIdentity = (uint64_t)v17;

    v19 = (void *)MEMORY[0x263F08928];
    uint64_t v20 = objc_opt_class();
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v19 setClass:v20 forClassName:v22];

    +[XBApplicationSnapshotManifest handleTrackingStateChange];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_XBTrackDeletionPreferencesChangedHandler, @"com.apple.springboard.trackSplashBoardDeletionsPrefsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

+ (void)handleTrackingStateChange
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  __isTrackingDeletions = [v2 BOOLForKey:@"SBTrackSplashBoardDeletions"];

  dispatch_workloop_t v3 = __ManifestSerialWorkQueue;
  dispatch_async(v3, &__block_literal_global_6);
}

void __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke()
{
  if (__isTrackingDeletions)
  {
    dispatch_workloop_t v3 = objc_alloc_init(XBDefaultApplicationProvider);
    v0 = [(XBDefaultApplicationProvider *)v3 splashBoardSystemApplications];
    uint64_t v1 = objc_msgSend(v0, "bs_compactMap:", &__block_literal_global_24);
    v2 = (void *)__trackDenyList;
    __trackDenyList = v1;

    [(id)__ManifestsByIdentity enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27];
  }
  else
  {
    dispatch_workloop_t v3 = (XBDefaultApplicationProvider *)[(id)__trackersByIdentity copy];
    [(XBDefaultApplicationProvider *)v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_30];
  }
}

uint64_t __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

uint64_t __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 beginTrackingImageDeletions];
}

void __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2 = [(id)__ManifestsByIdentity objectForKey:a2];
  [v2 endTrackingImageDeletions];
}

+ (id)debugDescription
{
  id v2 = [MEMORY[0x263F3F658] builderWithObject:a1];
  [v2 setUseDebugDescription:1];
  dispatch_workloop_t v3 = __ManifestSerialWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__XBApplicationSnapshotManifest_debugDescription__block_invoke;
  block[3] = &unk_2646A5938;
  id v8 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
  dispatch_queue_t v5 = [v4 build];

  return v5;
}

uint64_t __49__XBApplicationSnapshotManifest_debugDescription__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDictionarySection:__ManifestsByIdentity withName:0 skipIfEmpty:1];
}

+ (void)deleteAllSystemSnapshots
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_2232AB000, v0, v1, "Error deleting all system snapshots at path %{public}@: %{public}@");
}

- (XBApplicationSnapshotManifest)initWithContainerIdentity:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 182, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 183, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_8;
  }
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)XBApplicationSnapshotManifest;
  v10 = [(XBApplicationSnapshotManifest *)&v17 init];
  if (v10)
  {
    uint64_t v11 = +[XBApplicationSnapshotManifestImpl acquireManifestForContainerIdentity:v7 store:v9 creatingIfNecessary:1];
    objc_storeWeak((id *)&v10->_manifestImpl, v11);

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_manifestImpl);
    [WeakRetained setDelegate:v10];

    if (__isTrackingDeletions)
    {
      id v13 = objc_loadWeakRetained((id *)&v10->_manifestImpl);
      [v13 beginTrackingImageDeletions];
    }
  }

  return v10;
}

- (XBApplicationSnapshotManifest)initWithApplicationInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"XBApplicationSnapshotManifest.m", 197, @"Invalid parameter not satisfying: %@", @"info" object file lineNumber description];
  }
  id v6 = +[XBSnapshotContainerIdentity identityForApplicationInfo:v5];
  id v7 = +[XBApplicationDataStore sharedInstance];
  id v8 = [(XBApplicationSnapshotManifest *)self initWithContainerIdentity:v6 store:v7];

  return v8;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  +[XBApplicationSnapshotManifestImpl relinquishManifest:WeakRetained];

  v4.receiver = self;
  v4.super_class = (Class)XBApplicationSnapshotManifest;
  [(XBApplicationSnapshotManifest *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotManifest *)self descriptionWithMultilinePrefix:0];
}

- (NSString)bundleIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  dispatch_workloop_t v3 = [WeakRetained bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)containerPath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  dispatch_workloop_t v3 = [WeakRetained containerPath];

  return (NSString *)v3;
}

- (id)snapshotsForGroupID:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  id v6 = [WeakRetained snapshotsForGroupID:v4];

  return v6;
}

- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  uint64_t v9 = [WeakRetained snapshotsForGroupID:v7 fetchRequest:v6];

  return v9;
}

- (id)snapshotsForGroupIDs:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  id v6 = [WeakRetained snapshotsForGroupIDs:v4];

  return v6;
}

- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  uint64_t v9 = [WeakRetained snapshotsForGroupIDs:v7 matchingPredicate:v6];

  return v9;
}

- (void)beginTrackingImageDeletions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained beginTrackingImageDeletions];
}

- (void)endTrackingImageDeletions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained endTrackingImageDeletions];
}

- (id)createSnapshotWithGroupID:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  id v6 = [WeakRetained createSnapshotWithGroupID:v4];

  return v6;
}

- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  uint64_t v9 = [WeakRetained createVariantForSnapshot:v7 withIdentifier:v6];

  return v9;
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 completion:(id)a6
{
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 didGenerateImage:(id)a6 didSaveImage:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (!v14)
  {
    objc_super v17 = 0;
    if (v15) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = 0;
    goto LABEL_6;
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke;
  v24[3] = &unk_2646A5ED8;
  id v25 = v14;
  objc_super v17 = (void *)MEMORY[0x223CB2F50](v24);

  if (!v16) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke_2;
  v22 = &unk_2646A5ED8;
  id v23 = v16;
  v18 = (void *)MEMORY[0x223CB2F50](&v19);

LABEL_6:
  -[XBApplicationSnapshotManifest generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:](self, "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v12, v13, v9, v17, v18, v19, v20, v21, v22);
}

uint64_t __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
  p_manifestImpl = &self->_manifestImpl;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained generateImageForSnapshot:v15 dataProvider:v14 options:a5 imageGeneratedHandler:v13 imageDataSavedHandler:v12];
}

- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5
{
  p_manifestImpl = &self->_manifestImpl;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained saveSnapshot:v10 atPath:v9 withContext:v8];
}

- (id)_allSnapshotGroups
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  dispatch_workloop_t v3 = [WeakRetained _allSnapshotGroups];

  return v3;
}

- (void)deleteAllSnapshots
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained deleteAllSnapshots];
}

- (void)deleteSnapshot:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshot:v4];
}

- (void)deleteSnapshots:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshots:v4];
}

- (void)deleteSnapshotsMatchingPredicate:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshotsMatchingPredicate:v4];
}

- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshotsUsingPredicateBuilder:v4];
}

- (void)deleteSnapshotsForGroupID:(id)a3
{
  p_manifestImpl = &self->_manifestImpl;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshotsForGroupID:v4];
}

- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshotsForGroupID:v7 matchingPredicate:v6];
}

- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained deleteSnapshotsForGroupID:v7 predicateBuilder:v6];
}

- (void)purgeSnapshotsWithProtectedContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained purgeSnapshotsWithProtectedContent];
}

- (void)updateSnapshotsAPFSPurgability:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained updateSnapshotsAPFSPurgability:v3];
}

- (BOOL)snapshotsConsideredUnpurgableByAPFS
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  char v3 = [WeakRetained snapshotsConsideredUnpurgableByAPFS];

  return v3;
}

- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4
{
  p_manifestImpl = &self->_manifestImpl;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  [WeakRetained beginSnapshotAccessTransaction:v7 completion:v6];
}

- (void)archive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  [WeakRetained archive];
}

+ (id)_manifestsByIdentity
{
  return (id)__ManifestsByIdentity;
}

- (BOOL)_invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  char v3 = [WeakRetained _invalidate];

  return v3;
}

- (id)succinctDescription
{
  id v2 = [(XBApplicationSnapshotManifest *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  char v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  id v5 = [WeakRetained bundleIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"bundleID"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(XBApplicationSnapshotManifest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(XBApplicationSnapshotManifest *)self succinctDescriptionBuilder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  v9[0] = WeakRetained;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v5 appendArraySection:v7 withName:0 multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained manifest:v7 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:v6];
}

- (XBApplicationSnapshotManifestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (XBApplicationSnapshotManifestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (XBApplicationSnapshotManifestImpl)manifestImpl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  return (XBApplicationSnapshotManifestImpl *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manifestImpl);
}

@end