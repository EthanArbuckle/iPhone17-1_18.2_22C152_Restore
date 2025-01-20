@interface PBFPosterSnapshotter
+ (PBFPosterSnapshotter)new;
+ (id)createSnapshotUsingIOSurface:(id)a3 snapshotScale:(double)a4 imageEncoder:(id)a5 error:(id *)a6;
- (BOOL)_hasStarted;
- (BOOL)_isProcessingReceivedSnapshots;
- (BOOL)_isSceneReady;
- (BOOL)_lock_didAccumulateAllSnapshots;
- (BOOL)_lock_isSnapshotPopulatedForDefinition:(id)a3;
- (BOOL)_lock_populateSnapshotsFromAssetCatalogIfPossible;
- (BOOL)_lock_populateSnapshotsFromDiskIfPossible;
- (BOOL)_lock_storeImage:(id)a3 definition:(id)a4 error:(id *)a5;
- (BOOL)_wasCleanedUp;
- (BOOL)checkIfSnapshotterIsPreparedToExecute:(id *)a3;
- (BOOL)isFinished;
- (BOOL)necessitatesExtensionInstance;
- (BOOL)readFromPosterPathCacheIfAvailable;
- (BOOL)start;
- (NSArray)definitions;
- (NSDictionary)snapshotImagesByDefinition;
- (NSDictionary)snapshotsByDefinition;
- (NSError)error;
- (NSString)debugDescription;
- (PBFExtensionProviding)extensionProvider;
- (PBFPosterSnapshotRequest)request;
- (PBFPosterSnapshotter)init;
- (PBFPosterSnapshotter)initWithExtensionProvider:(id)a3 contents:(id)a4 definitions:(id)a5 configuredProperties:(id)a6 context:(id)a7 intention:(unint64_t)a8 previewIdentifier:(id)a9 significantEventsCounter:(unint64_t)a10 runtimeAssertionProvider:(id)a11;
- (PBFPosterSnapshotter)initWithRequest:(id)a3 extensionProvider:(id)a4 runtimeAssertionProvider:(id)a5;
- (PBFRuntimeAssertionProviding)runtimeAssertionProvider;
- (PFPosterExtension)extension;
- (PFPosterExtensionInstance)extensionInstance;
- (PFServerPosterPath)serverPosterPath;
- (PRPosterConfiguredProperties)configuredProperties;
- (double)elapsedTime;
- (id)_encoderForDefinition:(id)a3;
- (id)_fetchExtensionInstanceWithError:(id *)a3;
- (id)extensionInstanceWithError:(id *)a3;
- (int64_t)_snapshotSettingsDeviceOrientation;
- (int64_t)_snapshotSettingsInterfaceOrientation;
- (void)_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:(id)a3;
- (void)_cancelWithErrorCode:(int64_t)a3 reason:(id)a4;
- (void)_captureSnapshotWithScene:(id)a3;
- (void)_cleanupWithCompletion:(id)a3;
- (void)_enumerateObservers:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_lock_enumerateObservers:(id)a3;
- (void)_main_requestTimedOut;
- (void)_main_start;
- (void)_processOutstandingSnapshotDefinitionsWithScene:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancelWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setReadFromPosterPathCacheIfAvailable:(BOOL)a3;
@end

@implementation PBFPosterSnapshotter

- (PBFPosterSnapshotter)initWithRequest:(id)a3 extensionProvider:(id)a4 runtimeAssertionProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Pbfpostersnaps_1.isa);
  if (!v12)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithRequest:extensionProvider:runtimeAssertionProvider:]();
    }
LABEL_11:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290080);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithRequest:extensionProvider:runtimeAssertionProvider:]();
    }
    goto LABEL_11;
  }
  id obj = a3;

  v13 = [v12 path];
  v14 = [v12 definitions];
  v15 = [v12 configuredProperties];
  v16 = [v12 displayContext];
  uint64_t v17 = [v12 intention];
  v18 = [v12 previewIdentifier];
  v19 = -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:](self, "initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:", v10, v13, v14, v15, v16, v17, v18, [v12 significantEventsCounter], v11);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_request, obj);
    -[PBFPosterSnapshotter setReadFromPosterPathCacheIfAvailable:](v19, "setReadFromPosterPathCacheIfAvailable:", [v12 loadFromCacheIfAvailable]);
  }

  return v19;
}

- (PBFPosterSnapshotter)initWithExtensionProvider:(id)a3 contents:(id)a4 definitions:(id)a5 configuredProperties:(id)a6 context:(id)a7 intention:(unint64_t)a8 previewIdentifier:(id)a9 significantEventsCounter:(unint64_t)a10 runtimeAssertionProvider:(id)a11
{
  id v16 = a3;
  id v92 = a4;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v93 = a7;
  id v20 = a7;
  id v21 = a9;
  id v22 = a11;
  id v23 = v17;
  NSClassFromString(&cfstr_Pfserverposter_0.isa);
  if (!v23)
  {
    v75 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
LABEL_50:
    [v75 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290600);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v76 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
    [v76 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290664);
  }

  id v24 = v19;
  if (v24)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v75 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]0();
      }
      goto LABEL_50;
    }
  }

  id v25 = v18;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v25)
  {
    v77 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
    [v77 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32906C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v78 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
    [v78 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D329072CLL);
  }

  id v26 = v22;
  if (!v26)
  {
    v79 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
    [v79 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290790);
  }
  v27 = v26;
  if (([v26 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v80 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:]();
    }
    [v80 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32907F4);
  }

  id v28 = v16;
  if (!v28)
  {
    v81 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.4();
    }
    [v81 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290858);
  }
  v29 = v28;
  if (([v28 conformsToProtocol:&unk_1F2AC6AB8] & 1) == 0)
  {
    v82 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFExtensionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.4();
    }
    [v82 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32908BCLL);
  }

  id v30 = v20;
  if (!v30)
  {
    v83 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.5();
    }
    [v83 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290920);
  }
  v31 = v30;
  if (([v30 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v84 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:].cold.5();
    }
    [v84 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3290984);
  }

  v95.receiver = self;
  v95.super_class = (Class)PBFPosterSnapshotter;
  v32 = [(PBFPosterSnapshotter *)&v95 init];
  v33 = v32;
  if (v32)
  {
    v85 = v31;
    v87 = v27;
    v89 = v24;
    v90 = v21;
    v32->_lock._os_unfair_lock_opaque = 0;
    v34 = [v23 identity];
    uint64_t v35 = [v34 provider];
    providerIdentifier = v33->_providerIdentifier;
    v33->_providerIdentifier = (NSString *)v35;

    v86 = v29;
    uint64_t v37 = [v29 providerForExtensionIdentifier:v33->_providerIdentifier];
    extension = v33->_extension;
    v33->_extension = (PFPosterExtension *)v37;

    v39 = NSString;
    v40 = [MEMORY[0x1E4F29128] UUID];
    v41 = [v40 UUIDString];
    v42 = [v41 substringToIndex:7];
    v88 = v25;
    [v25 valueForKey:@"uniqueIdentifier"];
    v44 = v43 = v23;
    v45 = [v44 componentsJoinedByString:@","];
    v46 = [v45 stringByReplacingOccurrencesOfString:@"SNAPSHOT_" withString:&stru_1F2A71F00];
    v47 = [(NSString *)v33->_providerIdentifier pathExtension];
    uint64_t v48 = [v39 stringWithFormat:@"%@-%@-(%@)", v42, v46, v47];
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v48;

    id v23 = v43;
    v50 = [v43 descriptorIdentifier];

    if (v50)
    {
      v51 = v33->_identifier;
      v52 = [v43 descriptorIdentifier];
      uint64_t v53 = [(NSString *)v51 stringByAppendingFormat:@"-(%@)", v52];
      v54 = v33->_identifier;
      v33->_identifier = (NSString *)v53;
    }
    objc_storeStrong((id *)&v33->_extensionProvider, a3);
    objc_storeStrong((id *)&v33->_serverPosterPath, v92);
    id v25 = v88;
    uint64_t v55 = [v88 copy];
    definitions = v33->_definitions;
    v33->_definitions = (NSArray *)v55;

    id v21 = v90;
    uint64_t v57 = [v90 copy];
    previewIdentifier = v33->_previewIdentifier;
    v33->_previewIdentifier = (NSString *)v57;

    objc_storeStrong((id *)&v33->_runtimeAssertionProvider, a11);
    objc_storeStrong((id *)&v33->_context, v93);
    v33->_significantEventsCounter = a10;
    v33->_readFromPosterPathCacheIfAvailable = 1;
    uint64_t v59 = PBFDispatchQualityOfServiceFromPBFPosterSnapshotRequestIntention(a8);
    v60 = (void *)MEMORY[0x1E4F924D8];
    v61 = [MEMORY[0x1E4F924D8] snapshotWorkloop];
    uint64_t v62 = [v60 concurrentQueueTargetingWorkloop:v61 label:v33->_identifier withQoS:v59];
    backgroundQueue = v33->_backgroundQueue;
    v33->_backgroundQueue = (OS_dispatch_queue *)v62;

    uint64_t v64 = [MEMORY[0x1E4F1CA60] dictionary];
    lock_snapshotsByDefinition = v33->_lock_snapshotsByDefinition;
    v33->_lock_snapshotsByDefinition = (NSMutableDictionary *)v64;

    uint64_t v66 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_snapshotImagesByDefinition = v33->_lock_snapshotImagesByDefinition;
    v33->_lock_snapshotImagesByDefinition = (NSMapTable *)v66;

    uint64_t v68 = [MEMORY[0x1E4F1CA48] array];
    outstandingDefinitionsNeedingSnapshots = v33->_outstandingDefinitionsNeedingSnapshots;
    v33->_outstandingDefinitionsNeedingSnapshots = (NSMutableArray *)v68;

    id v24 = v89;
    uint64_t v70 = [v89 copy];
    configuredProperties = v33->_configuredProperties;
    v33->_configuredProperties = (PRPosterConfiguredProperties *)v70;

    uint64_t v72 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v33->_lock_observers;
    v33->_lock_observers = (NSHashTable *)v72;

    v29 = v86;
    v27 = v87;
    v31 = v85;
  }

  return v33;
}

- (PBFPosterSnapshotter)init
{
  v4 = [NSString stringWithFormat:@"Please use a designated initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = @"PBFPosterSnapshotter.m";
    __int16 v17 = 1024;
    int v18 = 195;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFPosterSnapshotter *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (PBFPosterSnapshotter)new
{
  v4 = [NSString stringWithFormat:@"Please use a designated initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    id v16 = @"PBFPosterSnapshotter.m";
    __int16 v17 = 1024;
    int v18 = 200;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFPosterSnapshotter *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  v4 = [(PBFPosterSnapshotRequest *)self->_request path];
  v5 = [v4 identity];
  v6 = [v5 provider];
  [v3 appendString:v6 withName:@"extension"];

  id v7 = (id)[v3 appendObject:self->_request withName:@"request"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (void)dealloc
{
  [(PBFPosterSnapshotter *)self _cleanupWithCompletion:0];
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  [(RBSAssertion *)self->_extensionPrewarmRuntimeAssertion invalidate];
  extensionPrewarmRuntimeAssertion = self->_extensionPrewarmRuntimeAssertion;
  self->_extensionPrewarmRuntimeAssertion = 0;

  [(RBSAssertion *)self->_keepPosterBoardAliveUntilSnapshottingIsComplete invalidate];
  keepPosterBoardAliveUntilSnapshottingIsComplete = self->_keepPosterBoardAliveUntilSnapshottingIsComplete;
  self->_keepPosterBoardAliveUntilSnapshottingIsComplete = 0;

  v5.receiver = self;
  v5.super_class = (Class)PBFPosterSnapshotter;
  [(PBFPosterSnapshotter *)&v5 dealloc];
}

- (BOOL)start
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (!self->_extension)
  {
    providerIdentifier = @"(NULL)";
    if (self->_providerIdentifier) {
      providerIdentifier = (__CFString *)self->_providerIdentifier;
    }
    v51 = @"providerIdentifier";
    v52[0] = providerIdentifier;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2220, v4);
    [(PBFPosterSnapshotter *)self _finishWithError:v5];

    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (*(_WORD *)&self->_lock_started)
  {
    os_unfair_lock_unlock(&self->_lock);
    return 0;
  }
  self->_lock_started = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&_activeSnapshottersLock);
  ++_numberOfActiveSnapshotters;
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeSnapshottersLock);
  self->_lock_startTime = CFAbsoluteTimeGetCurrent();
  id v7 = [(PFServerPosterPath *)self->_serverPosterPath supplementURL];
  id v42 = 0;
  char v8 = [v7 checkResourceIsReachableAndReturnError:&v42];
  int v9 = (PFServerPosterPath *)v42;

  if ((v8 & 1) == 0)
  {
    id v22 = PBFLogSnapshotter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      serverPosterPath = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = identifier;
      __int16 v45 = 2114;
      v46 = serverPosterPath;
      __int16 v47 = 2114;
      uint64_t v48 = v9;
      _os_log_error_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_ERROR, "(%{public}@) Path does not exist; snapshotting cannot proceed; path %{public}@, error: %{public}@",
        buf,
        0x20u);
    }

    goto LABEL_36;
  }
  dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class((dispatch_queue_t)self->_backgroundQueue, 0);
  __int16 v11 = PBFLogSnapshotter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_identifier;
    __int16 v13 = self->_providerIdentifier;
    id v14 = self->_serverPosterPath;
    *(_DWORD *)buf = 138544130;
    v44 = v12;
    __int16 v45 = 2112;
    v46 = v13;
    __int16 v47 = 2112;
    uint64_t v48 = v14;
    __int16 v49 = 1024;
    dispatch_qos_class_t v50 = qos_class;
    _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting snapshots for provider '%@' of path '%@' with QOS '%u'", buf, 0x26u);
  }

  BOOL v15 = [(PBFPosterSnapshotter *)self _lock_populateSnapshotsFromAssetCatalogIfPossible];
  id v16 = PBFLogSnapshotter();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      int v18 = self->_identifier;
      __int16 v19 = self->_providerIdentifier;
      id v20 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v18;
      __int16 v45 = 2112;
      v46 = v19;
      __int16 v47 = 2112;
      uint64_t v48 = v20;
      id v21 = "(%{public}@) Loaded snapshots for provider '%@' of path '%@' from asset catalog";
LABEL_19:
      _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 0x20u);
    }
  }
  else if (v17)
  {
    id v23 = self->_identifier;
    id v24 = self->_providerIdentifier;
    id v25 = self->_serverPosterPath;
    *(_DWORD *)buf = 138543874;
    v44 = v23;
    __int16 v45 = 2112;
    v46 = v24;
    __int16 v47 = 2112;
    uint64_t v48 = v25;
    id v21 = "(%{public}@) No snapshots for provider '%@' of path '%@' were loaded from asset catalog";
    goto LABEL_19;
  }

  BOOL v26 = [(PBFPosterSnapshotter *)self _lock_populateSnapshotsFromDiskIfPossible];
  v27 = PBFLogSnapshotter();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      v29 = self->_identifier;
      id v30 = self->_providerIdentifier;
      v31 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v29;
      __int16 v45 = 2112;
      v46 = v30;
      __int16 v47 = 2112;
      uint64_t v48 = v31;
      _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@) Loaded snapshots for provider '%@' of path '%@' from disk", buf, 0x20u);
    }

    self->_lock_didLoadAllFromDisk = [(PBFPosterSnapshotter *)self _lock_didAccumulateAllSnapshots];
  }
  else
  {
    if (v28)
    {
      v32 = self->_identifier;
      v33 = self->_providerIdentifier;
      v34 = self->_serverPosterPath;
      *(_DWORD *)buf = 138543874;
      v44 = v32;
      __int16 v45 = 2112;
      v46 = v33;
      __int16 v47 = 2112;
      uint64_t v48 = v34;
      _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@) No snapshots for provider '%@' of path '%@' were loaded from disk", buf, 0x20u);
    }
  }
  if ([(PBFPosterSnapshotter *)self _lock_didAccumulateAllSnapshots])
  {
    if (self->_lock_snapshotsRequestedTime == 0.0) {
      self->_lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    }
    uint64_t v35 = PBFLogSnapshotter();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v44 = v36;
      _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "(%{public}@) All requested snapshot definitions were loaded.  Good to go.", buf, 0xCu);
    }

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_37;
  }
  uint64_t v37 = PBFLogSnapshotter();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v44 = v38;
    _os_log_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshotter started.", buf, 0xCu);
  }

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __29__PBFPosterSnapshotter_start__block_invoke;
  v41[3] = &unk_1E69808C0;
  v41[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v41);
LABEL_36:
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
LABEL_37:
    [(PBFPosterSnapshotter *)self _finishWithError:v9];
  }
  return 1;
}

uint64_t __29__PBFPosterSnapshotter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_start");
}

- (NSDictionary)snapshotImagesByDefinition
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMapTable *)self->_lock_snapshotImagesByDefinition copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSDictionary)snapshotsByDefinition
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableDictionary *)self->_lock_snapshotsByDefinition copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (BOOL)checkIfSnapshotterIsPreparedToExecute:(id *)a3
{
  if ([(PBFPosterSnapshotter *)self necessitatesExtensionInstance])
  {
    id v13 = 0;
    objc_super v5 = [(PBFPosterSnapshotter *)self extensionInstanceWithError:&v13];
    id v6 = v13;
    id v7 = v6;
    if (v5)
    {
      id v12 = 0;
      char v8 = [(PBFPosterSnapshotter *)self _fetchExtensionInstanceWithError:&v12];
      id v9 = v12;

      if (v8 && ([v8 isEqual:v5] & 1) != 0)
      {
        BOOL v10 = 1;
LABEL_15:

        id v7 = v9;
        goto LABEL_16;
      }
      if (v9)
      {
        if (a3)
        {
LABEL_9:
          id v9 = v9;
          BOOL v10 = 0;
          *a3 = v9;
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, 0);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (a3) {
          goto LABEL_9;
        }
      }
      BOOL v10 = 0;
      goto LABEL_15;
    }
    if (v6)
    {
      if (a3)
      {
LABEL_12:
        id v7 = v7;
        BOOL v10 = 0;
        *a3 = v7;
LABEL_16:

        return v10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (a3) {
        goto LABEL_12;
      }
    }
    BOOL v10 = 0;
    goto LABEL_16;
  }
  return 1;
}

- (void)cancelWithReason:(id)a3
{
}

- (void)_cancelWithErrorCode:(int64_t)a3 reason:(id)a4
{
  v36[6] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  if (![(PBFPosterSnapshotter *)self isFinished]
    && ![(PBFPosterSnapshotter *)self _wasCleanedUp])
  {
    v34 = self->_extensionInstance;
    id v7 = [(PFPosterExtensionInstance *)v34 extension];
    char v8 = [(PFPosterExtensionInstance *)v34 processIdentity];
    uint64_t v9 = [v8 description];
    BOOL v10 = (void *)v9;
    if (v9) {
      __int16 v11 = (__CFString *)v9;
    }
    else {
      __int16 v11 = &stru_1F2A71F00;
    }
    id v12 = v11;
    v33 = v12;

    uint64_t v13 = [(PFServerPosterPath *)self->_serverPosterPath description];
    id v14 = (void *)v13;
    if (v13) {
      BOOL v15 = (__CFString *)v13;
    }
    else {
      BOOL v15 = &stru_1F2A71F00;
    }
    id v16 = v15;

    uint64_t v17 = [(NSString *)self->_identifier copy];
    int v18 = (void *)v17;
    if (v17) {
      __int16 v19 = (__CFString *)v17;
    }
    else {
      __int16 v19 = &stru_1F2A71F00;
    }
    id v20 = v19;

    uint64_t v21 = [(NSArray *)self->_definitions description];
    id v22 = (void *)v21;
    if (v21) {
      id v23 = (__CFString *)v21;
    }
    else {
      id v23 = &stru_1F2A71F00;
    }
    id v24 = v23;

    id v25 = (void *)MEMORY[0x1E4F28C58];
    v35[0] = @"cancelReason";
    v35[1] = @"processIdentityDescription";
    BOOL v26 = @"(No reason)";
    if (v6) {
      BOOL v26 = v6;
    }
    v36[0] = v26;
    v36[1] = v12;
    v35[2] = @"pathDescription";
    v35[3] = @"identifier";
    v36[2] = v16;
    v36[3] = v20;
    v36[4] = v24;
    v35[4] = @"definitionsDescription";
    v35[5] = @"extension";
    v27 = v7;
    uint64_t v28 = [v7 description];
    v29 = (void *)v28;
    id v30 = @"unknown extension";
    if (v28) {
      id v30 = (__CFString *)v28;
    }
    v36[5] = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];
    v32 = objc_msgSend(v25, "pbf_generalErrorWithCode:userInfo:", a3, v31);

    [(PBFPosterSnapshotter *)self _finishWithError:v32];
  }
}

- (void)invalidate
{
}

- (int64_t)_snapshotSettingsInterfaceOrientation
{
  if (MEMORY[0x1D94336E0](self, a2)) {
    return 1;
  }
  context = self->_context;
  return [(PBFDisplayContext *)context pbf_interfaceOrientation];
}

- (int64_t)_snapshotSettingsDeviceOrientation
{
  return [(PBFDisplayContext *)self->_context pbf_interfaceOrientation];
}

- (void)_main_start
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) PrewarmRuntimeAssertion could not be acquired because there is no extension instance.", (uint8_t *)&v3, 0xCu);
}

void __35__PBFPosterSnapshotter__main_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBFLogSnapshotter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ reason: %{public}@;",
      (uint8_t *)&v8,
      0x16u);
  }

  if (v3)
  {
    id v7 = PBFLogSnapshotter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __35__PBFPosterSnapshotter__main_start__block_invoke_cold_1(a1, (uint64_t)v3, v7);
    }
  }
}

uint64_t __35__PBFPosterSnapshotter__main_start__block_invoke_206(uint64_t a1, void *a2)
{
  return [a2 includesComplications];
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBFLogSnapshotter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_215(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PBFPosterSnapshotter__main_start__block_invoke_2;
  v5[3] = &unk_1E6983FB0;
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  int v13 = *(_DWORD *)(a1 + 136);
  __int16 v14 = *(_WORD *)(a1 + 140);
  long long v9 = *(_OWORD *)(a1 + 72);
  id v6 = v4;
  long long v10 = *(_OWORD *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 104);
  long long v12 = *(_OWORD *)(a1 + 120);
  [a2 updateSettingsWithBlock:v5];
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = 1;
  objc_msgSend(v6, "pui_setSnapshot:", 1);
  objc_msgSend(v6, "pui_setMode:", *(void *)(a1 + 48));
  objc_msgSend(v6, "pui_setContent:", *(void *)(a1 + 56));
  objc_msgSend(v6, "pr_setUnlockProgress:", *(double *)(a1 + 64));
  objc_msgSend(v6, "pui_setPreviewIdentifier:", *(void *)(*(void *)(a1 + 32) + 120));
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 200) titleStyleConfiguration];
  objc_msgSend(v6, "pr_setPosterTitleStyleConfiguration:", v4);

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 200) ambientConfiguration];
  objc_msgSend(v6, "pr_setPosterAmbientConfiguration:", v5);

  objc_msgSend(v6, "pui_setInlineComplicationConfigured:", *(unsigned __int8 *)(a1 + 136));
  objc_msgSend(v6, "pui_setComplicationRowConfigured:", *(unsigned __int8 *)(a1 + 137));
  objc_msgSend(v6, "pui_setComplicationSidebarConfigured:", *(unsigned __int8 *)(a1 + 138));
  objc_msgSend(v6, "pui_setShowsComplications:", *(unsigned __int8 *)(a1 + 139));
  objc_msgSend(v6, "pui_setShowsHeaderElements:", *(unsigned __int8 *)(a1 + 140));
  objc_msgSend(v6, "pui_setSignificantEventsCounter:", *(void *)(a1 + 72));
  objc_msgSend(v6, "pui_setUserInterfaceStyle:", *(void *)(a1 + 80));
  objc_msgSend(v6, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 141));
  [v6 setForeground:1];
  [v6 setDisplayConfiguration:*(void *)(a1 + 40)];
  if (MEMORY[0x1D94336E0]([v6 setInterfaceOrientation:*(void *)(a1 + 88)])) {
    uint64_t v3 = *(void *)(a1 + 96);
  }
  objc_msgSend(v6, "pui_setDeviceOrientation:", v3);
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PBFPosterSnapshotter__main_start__block_invoke_4;
  block[3] = &unk_1E6981D18;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_requestTimedOut");
}

- (void)_main_requestTimedOut
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (![(PBFPosterSnapshotter *)self isFinished]
    && ![(PBFPosterSnapshotter *)self _wasCleanedUp]
    && ![(PBFPosterSnapshotter *)self _isProcessingReceivedSnapshots]
    && ![(PBFPosterSnapshotter *)self _isSceneReady])
  {
    uint64_t v3 = [(PBFPosterSnapshotter *)self extensionInstanceWithError:0];
    uint64_t v4 = [v3 processIdentity];
    uint64_t v5 = [v4 description];
    id v6 = (void *)v5;
    if (v5) {
      long long v7 = (__CFString *)v5;
    }
    else {
      long long v7 = &stru_1F2A71F00;
    }
    uint64_t v8 = v7;

    uint64_t v9 = [(PFServerPosterPath *)self->_serverPosterPath description];
    long long v10 = (void *)v9;
    if (v9) {
      long long v11 = (__CFString *)v9;
    }
    else {
      long long v11 = &stru_1F2A71F00;
    }
    long long v12 = v11;

    uint64_t v13 = [(NSString *)self->_identifier copy];
    __int16 v14 = (void *)v13;
    if (v13) {
      BOOL v15 = (__CFString *)v13;
    }
    else {
      BOOL v15 = &stru_1F2A71F00;
    }
    id v16 = v15;

    uint64_t v17 = [(NSArray *)self->_definitions description];
    int v18 = (void *)v17;
    if (v17) {
      __int16 v19 = (__CFString *)v17;
    }
    else {
      __int16 v19 = &stru_1F2A71F00;
    }
    id v20 = v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    v24[0] = @"processIdentityDescription";
    v24[1] = @"pathDescription";
    v25[0] = v8;
    v25[1] = v12;
    v24[2] = @"identifier";
    v24[3] = @"definitionsDescription";
    v25[2] = v16;
    v25[3] = v20;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    id v23 = objc_msgSend(v21, "pbf_generalErrorWithCode:userInfo:", 2, v22);

    [(PBFPosterSnapshotter *)self _finishWithError:v23];
  }
}

- (void)_finishWithError:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_finished)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_activeSnapshottersLock);
  uint64_t v6 = _numberOfActiveSnapshotters - self->_lock_started;
  _numberOfActiveSnapshotters = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeSnapshottersLock);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  self->_lock_endTime = Current;
  double lock_snapshotsRequestedTime = self->_lock_snapshotsRequestedTime;
  uint64_t v9 = PBFLogTelemetrySignposts();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER", " enableTelemetry=YES ", buf, 2u);
  }
  double v10 = Current - lock_snapshotsRequestedTime;

  kdebug_trace();
  double v11 = self->_lock_endTime - self->_lock_startTime;
  long long v12 = PBFLogSnapshotter();
  uint64_t v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      id v24 = [(PFServerPosterPath *)self->_serverPosterPath identity];
      id v25 = [v24 provider];
      *(_DWORD *)buf = 138544386;
      v29 = identifier;
      __int16 v30 = 2112;
      id v31 = v5;
      __int16 v32 = 2114;
      double v33 = *(double *)&v25;
      __int16 v34 = 2048;
      double v35 = *(double *)&v6;
      __int16 v36 = 2048;
      double v37 = v11;
      _os_log_error_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_ERROR, "(%{public}@) Finished with error: %@ -- extension %{public}@ -- activeSnapshotters: %lu - elapsed time: %f", buf, 0x34u);
    }
    if (!self->_lock_didLoadAllFromDisk)
    {
      __int16 v14 = PBFLogSnapshotterBench();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        BOOL v15 = [(PFServerPosterPath *)self->_serverPosterPath identity];
        id v16 = [v15 provider];
        uint64_t v17 = [(PFServerPosterPath *)self->_serverPosterPath identity];
        int v18 = [v17 descriptorIdentifier];
        *(_DWORD *)buf = 138544386;
        v29 = v16;
        __int16 v30 = 2114;
        id v31 = v18;
        __int16 v32 = 2048;
        double v33 = v10;
        __int16 v34 = 2048;
        double v35 = v11;
        __int16 v36 = 2114;
        double v37 = *(double *)&v5;
        _os_log_error_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_ERROR, "%{public}@:%{public}@\tsnapshot time:%f\telapsed time:%f\terror:%{public}@", buf, 0x34u);
LABEL_16:

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = self->_identifier;
      id v20 = [(PFServerPosterPath *)self->_serverPosterPath identity];
      uint64_t v21 = [v20 provider];
      *(_DWORD *)buf = 138544386;
      v29 = v19;
      __int16 v30 = 2114;
      id v31 = v21;
      __int16 v32 = 2048;
      double v33 = *(double *)&v6;
      __int16 v34 = 2048;
      double v35 = v11;
      __int16 v36 = 2048;
      double v37 = v10;
      _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully finished snapshotting extension %{public}@!  ActiveSnapshotters: %lu - elapsed time: %f  - snapshot time: %f", buf, 0x34u);
    }
    if (!self->_lock_didLoadAllFromDisk)
    {
      __int16 v14 = PBFLogSnapshotterBench();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = [(PFServerPosterPath *)self->_serverPosterPath identity];
        id v16 = [v15 provider];
        uint64_t v17 = [(PFServerPosterPath *)self->_serverPosterPath identity];
        int v18 = [v17 descriptorIdentifier];
        *(_DWORD *)buf = 138544130;
        v29 = v16;
        __int16 v30 = 2114;
        id v31 = v18;
        __int16 v32 = 2048;
        double v33 = v10;
        __int16 v34 = 2048;
        double v35 = v11;
        _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@\tsnapshot time:%f\telapsed time:%f", buf, 0x2Au);
        goto LABEL_16;
      }
LABEL_17:
    }
  }
  if (v10 >= 5.0)
  {
    id v22 = PBFLogSnapshotter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter _finishWithError:]((uint64_t)self);
    }
    goto LABEL_24;
  }
  if (v10 >= 10.0)
  {
    id v22 = PBFLogSnapshotter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotter _finishWithError:]((uint64_t)self);
    }
LABEL_24:
  }
  if (!self->_lock_finished)
  {
    self->_lock_finished = 1;
    objc_storeStrong((id *)&self->_error, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke;
  v26[3] = &unk_1E69808E8;
  v26[4] = self;
  id v27 = v5;
  [(PBFPosterSnapshotter *)self _cleanupWithCompletion:v26];

LABEL_28:
}

void __41__PBFPosterSnapshotter__finishWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke_2;
  v2[3] = &unk_1E6984000;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateObservers:v2];
}

void __41__PBFPosterSnapshotter__finishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F924D8] snapshotWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PBFPosterSnapshotter__finishWithError___block_invoke_3;
  block[3] = &unk_1E6981338;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __41__PBFPosterSnapshotter__finishWithError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotter:*(void *)(a1 + 40) didFinishWithError:*(void *)(a1 + 48)];
}

- (double)elapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_started)
  {
    if (self->_lock_finished) {
      double lock_endTime = self->_lock_endTime;
    }
    else {
      double lock_endTime = CFAbsoluteTimeGetCurrent();
    }
    double v5 = lock_endTime - self->_lock_startTime;
  }
  else
  {
    double v5 = -1.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_enumerateObservers:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PBFPosterSnapshotter *)self _lock_enumerateObservers:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_enumerateObservers:(id)a3
{
  id v4 = a3;
  id v5 = [(NSHashTable *)self->_lock_observers allObjects];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PBFPosterSnapshotter__lock_enumerateObservers___block_invoke;
  v7[3] = &unk_1E6984028;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __49__PBFPosterSnapshotter__lock_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_lock_populateSnapshotsFromAssetCatalogIfPossible
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(PFServerPosterPath *)self->_serverPosterPath identity];
  uint64_t v4 = [v3 type];

  if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    if ([(PBFPosterSnapshotter *)self necessitatesExtensionInstance])
    {
      uint64_t v52 = 0;
      id v5 = [(PBFPosterSnapshotter *)self extensionInstanceWithError:&v52];
      if (!v5)
      {
        [(PBFPosterSnapshotter *)self _finishWithError:v52];
        return 0;
      }
    }
    id v6 = PBFLogTelemetrySignposts();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_ASSET_CATALOG", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    id v7 = [(PBFPosterSnapshotter *)self extension];
    uint64_t v38 = [v7 posterExtensionInfoPlist];
    double v37 = [(PFServerPosterPath *)self->_serverPosterPath descriptorIdentifier];
    id v8 = [v7 posterExtensionBundle];
    id v9 = [(PBFPosterSnapshotRequest *)self->_request displayContext];
    id v42 = objc_msgSend(MEMORY[0x1E4FB1E20], "pbf_traitCollectionForDisplayContext:", v9);
    double v35 = [v8 URLsForResourcesWithExtension:@"car" subdirectory:0];
    if ([v35 count])
    {
      __int16 v30 = v9;
      id v31 = v8;
      __int16 v32 = v7;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = self->_definitions;
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        long long v12 = 0;
        uint64_t v13 = *(void *)v48;
        uint64_t v33 = *(void *)v48;
        uint64_t v34 = v4;
        do
        {
          uint64_t v14 = 0;
          uint64_t v36 = v11;
          do
          {
            if (*(void *)v48 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * v14);
            if (![(PBFPosterSnapshotter *)self _lock_isSnapshotPopulatedForDefinition:v15]&& v4 == 2)
            {
              id v16 = objc_msgSend(v38, "pbf_staticSnapshotKeyForIdentifier:definition:", v37, v15);
              if (v16)
              {
                uint64_t v40 = v14;
                if (_lock_populateSnapshotsFromAssetCatalogIfPossible_onceToken != -1) {
                  dispatch_once(&_lock_populateSnapshotsFromAssetCatalogIfPossible_onceToken, &__block_literal_global_229);
                }
                long long v45 = 0u;
                long long v46 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                id v41 = v35;
                uint64_t v17 = [v41 countByEnumeratingWithState:&v43 objects:v53 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v44;
                  do
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v44 != v19) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                      uint64_t v22 = [v12 objectForKey:v21];
                      if (v22)
                      {
                        id v23 = (void *)v22;
                      }
                      else
                      {
                        id v24 = objc_alloc(MEMORY[0x1E4FB1FD8]);
                        id v23 = (void *)[v24 initWithURL:v21 idiom:_lock_populateSnapshotsFromAssetCatalogIfPossible_idiom error:0];
                        if (!v12) {
                          long long v12 = objc_opt_new();
                        }
                        [v12 setObject:v23 forKey:v21];
                      }
                      id v25 = [v23 imageNamed:v16 withTrait:v42];
                      if (v25)
                      {
                        BOOL v26 = PBFLogTelemetrySignposts();
                        if (os_signpost_enabled(v26))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
                        }

                        kdebug_trace();
                        [(PBFPosterSnapshotter *)self _lock_storeImage:v25 definition:v15 error:0];
                        id v27 = PBFLogTelemetrySignposts();
                        if (os_signpost_enabled(v27))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
                        }

                        kdebug_trace();
                      }
                    }
                    uint64_t v18 = [v41 countByEnumeratingWithState:&v43 objects:v53 count:16];
                  }
                  while (v18);
                }

                uint64_t v13 = v33;
                uint64_t v4 = v34;
                uint64_t v11 = v36;
                uint64_t v14 = v40;
              }
            }
            ++v14;
          }
          while (v14 != v11);
          uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v54 count:16];
        }
        while (v11);
      }
      else
      {
        long long v12 = 0;
      }

      id v8 = v31;
      id v7 = v32;
      id v9 = v30;
    }
    uint64_t v28 = PBFLogTelemetrySignposts();
    if (os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_ASSET_CATALOG", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  return 0;
}

void __73__PBFPosterSnapshotter__lock_populateSnapshotsFromAssetCatalogIfPossible__block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  _lock_populateSnapshotsFromAssetCatalogIfPossible_idiom = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)_lock_populateSnapshotsFromDiskIfPossible
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = PBFLogSnapshotter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    id v41 = identifier;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) _populateSnapshotsFromDiskIfPossible", buf, 0xCu);
  }

  BOOL v5 = [(PBFPosterSnapshotter *)self readFromPosterPathCacheIfAvailable];
  id v6 = PBFLogSnapshotter();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      id v41 = v8;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attempting _populateSnapshotsFromDiskIfPossible; requested to read from disk",
        buf,
        0xCu);
    }

    id v9 = PBFLogTelemetrySignposts();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_DISK", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = self->_definitions;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      BOOL v33 = 0;
      uint64_t v13 = *(void *)v37;
      *(void *)&long long v11 = 138544130;
      long long v31 = v11;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * v14);
          if (!-[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v15, v31))
          {
            id v16 = [(PBFPosterSnapshotter *)self _encoderForDefinition:v15];
            id v35 = 0;
            uint64_t v17 = [v16 createUIImageWithError:&v35];
            id v18 = v35;

            uint64_t v19 = [v16 url];
            id v20 = PBFLogSnapshotter();
            uint64_t v21 = v20;
            if (v17)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v22 = self->_identifier;
                *(_DWORD *)buf = 138543874;
                id v41 = v22;
                __int16 v42 = 2112;
                uint64_t v43 = v15;
                __int16 v44 = 2112;
                long long v45 = v19;
                _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) _populateSnapshotsFromDiskIfPossible; loading image for defintion '%@'/%@",
                  buf,
                  0x20u);
              }

              [(NSMutableDictionary *)self->_lock_snapshotsByDefinition setObject:v19 forKey:v15];
              BOOL v33 = 1;
            }
            else
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                __int16 v32 = self->_identifier;
                uint64_t v23 = [v18 debugDescription];
                id v24 = (void *)v23;
                *(_DWORD *)buf = v31;
                id v25 = @"no error";
                if (v23) {
                  id v25 = (__CFString *)v23;
                }
                id v41 = v32;
                __int16 v42 = 2112;
                uint64_t v43 = v15;
                __int16 v44 = 2112;
                long long v45 = v19;
                __int16 v46 = 2112;
                long long v47 = v25;
                _os_log_error_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_ERROR, "(%{public}@) _populateSnapshotsFromDiskIfPossible; file doesn't exist for definition '%@'/ %@. error=%@",
                  buf,
                  0x2Au);
              }
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v48 count:16];
        uint64_t v12 = v26;
      }
      while (v26);
    }
    else
    {
      BOOL v33 = 0;
    }

    if ([(PBFPosterSnapshotter *)self _lock_didAccumulateAllSnapshots]) {
      self->_double lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    }
    v29 = PBFLogTelemetrySignposts();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_POPULATE_FROM_DISK", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    return v33;
  }
  else
  {
    if (v7)
    {
      id v27 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      id v41 = v27;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Aborting _populateSnapshotsFromDiskIfPossible; requested to not read from disk",
        buf,
        0xCu);
    }

    return 0;
  }
}

- (BOOL)_lock_didAccumulateAllSnapshots
{
  uint64_t v3 = [(NSMutableDictionary *)self->_lock_snapshotsByDefinition count];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v5 = [(NSMutableDictionary *)self->_lock_snapshotsByDefinition allKeys];
    id v6 = [v4 setWithArray:v5];

    BOOL v7 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_definitions];
    LOBYTE(v5) = [v6 isEqualToSet:v7];

    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (BOOL)_lock_isSnapshotPopulatedForDefinition:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_lock_snapshotsByDefinition objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)necessitatesExtensionInstance
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PBFPosterSnapshotter *)self extension];
  if (v3)
  {
    uint64_t v28 = v3;
    BOOL v4 = [v3 posterExtensionInfoPlist];
    int v5 = objc_msgSend(v4, "pbf_hasStaticSnapshotMapping");
    id v6 = objc_opt_new();
    BOOL v7 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_definitions];
    uint64_t v26 = v7;
    if (v5)
    {
      id v8 = [(PFServerPosterPath *)self->_serverPosterPath descriptorIdentifier];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v9 = self->_definitions;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v15 = objc_msgSend(v4, "pbf_staticSnapshotKeyForIdentifier:definition:", v8, v14, v26);

            if (v15) {
              [v6 addObject:v14];
            }
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v11);
      }

      BOOL v7 = v26;
    }
    if ([(PBFPosterSnapshotter *)self readFromPosterPathCacheIfAvailable])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v7;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            if (([v6 containsObject:v21] & 1) == 0)
            {
              uint64_t v22 = [(PBFPosterSnapshotter *)self _encoderForDefinition:v21];
              uint64_t v23 = [v22 createUIImageWithError:0];

              if (v23) {
                [v6 addObject:v21];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v18);
      }

      BOOL v7 = v27;
    }
    int v24 = [v6 isEqualToSet:v7] ^ 1;

    uint64_t v3 = v28;
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (id)extensionInstanceWithError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = self;
  objc_sync_enter(v4);
  extensionInstance = v4->_extensionInstance;
  if (extensionInstance)
  {
    a3 = extensionInstance;
  }
  else if ([(PBFPosterSnapshotter *)v4 necessitatesExtensionInstance])
  {
    id v17 = 0;
    uint64_t v6 = [(PBFPosterSnapshotter *)v4 _fetchExtensionInstanceWithError:&v17];
    id v7 = v17;
    id v8 = v4->_extensionInstance;
    v4->_extensionInstance = (PFPosterExtensionInstance *)v6;

    id v9 = v4->_extensionInstance;
    if (a3 && !v9)
    {
      uint64_t v10 = [(PFServerPosterPath *)v4->_serverPosterPath identity];
      uint64_t v11 = [v10 provider];

      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = @"(NULL)";
      }
      uint64_t v18 = @"providerIdentifier";
      uint64_t v19 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2220, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = v4->_extensionInstance;
    }
    a3 = v9;
  }
  else if (a3)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"extension instance isn't needed for this; we can return;";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v14, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }
  objc_sync_exit(v4);

  return a3;
}

- (id)_fetchExtensionInstanceWithError:(id *)a3
{
  int v5 = [(PBFPosterSnapshotter *)self extensionProvider];
  uint64_t v6 = [v5 acquireExtensionInstance:self->_providerIdentifier reason:@"Snapshotting" error:a3];

  return v6;
}

- (void)_cleanupWithCompletion:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  int v5 = PBFLogSnapshotter();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Cleaning up Snapshotter", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__13;
  uint64_t v64 = __Block_byref_object_dispose__13;
  id v65 = 0;
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13;
  uint64_t v59 = __Block_byref_object_dispose__13;
  id v60 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_started || self->_lock_cleanedUp)
  {
    self->_lock_cleanedUp = 1;
    os_unfair_lock_unlock(&self->_lock);
    id v8 = (void (**)(void))&__block_literal_global_243;
LABEL_6:
    v8[2](v8);
    if (v4) {
      v4[2](v4);
    }
    [v56[5] invalidate];
    [*(id *)(*((void *)&buf + 1) + 40) invalidate];
    goto LABEL_9;
  }
  uint64_t v49 = 0;
  long long v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__13;
  uint64_t v53 = __Block_byref_object_dispose__13;
  id v54 = 0;
  uint64_t v43 = 0;
  __int16 v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  __int16 v46 = __Block_byref_object_copy__13;
  long long v47 = __Block_byref_object_dispose__13;
  id v48 = 0;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__13;
  id v41 = __Block_byref_object_dispose__13;
  id v42 = 0;
  uint64_t v31 = 0;
  long long v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = __Block_byref_object_copy__13;
  long long v35 = __Block_byref_object_dispose__13;
  id v36 = 0;
  id v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong(v32 + 5, v9->_scene);
  objc_storeStrong(v50 + 5, v9->_extensionProvider);
  objc_storeStrong(v44 + 5, v9->_extensionInstance);
  uint64_t v10 = [v44[5] extension];
  uint64_t v11 = (void *)v38[5];
  v38[5] = v10;

  objc_storeStrong(v56 + 5, v9->_extensionPrewarmRuntimeAssertion);
  objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v9->_keepPosterBoardAliveUntilSnapshottingIsComplete);
  keepPosterBoardAliveUntilSnapshottingIsComplete = v9->_keepPosterBoardAliveUntilSnapshottingIsComplete;
  v9->_keepPosterBoardAliveUntilSnapshottingIsComplete = 0;

  extensionProvider = v9->_extensionProvider;
  v9->_extensionProvider = 0;

  extensionInstance = v9->_extensionInstance;
  v9->_extensionInstance = 0;

  extensionPrewarmRuntimeAssertion = v9->_extensionPrewarmRuntimeAssertion;
  v9->_extensionPrewarmRuntimeAssertion = 0;

  scene = v9->_scene;
  v9->_scene = 0;

  objc_sync_exit(v9);
  if (v44[5])
  {
    id v17 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E6984050;
    id v27 = v17;
    uint64_t v28 = &v49;
    long long v29 = &v37;
    long long v30 = &v43;
    id v18 = v17;
    id v8 = (void (**)(void))_Block_copy(aBlock);
  }
  else
  {
    id v8 = (void (**)(void))&__block_literal_global_243;
  }
  self->_lock_cleanedUp = 1;
  id v19 = v32[5];
  if (v19)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_3;
    block[3] = &unk_1E69840A0;
    uint64_t v23 = &v31;
    uint64_t v21 = v8;
    int v24 = &v55;
    p_long long buf = &buf;
    uint64_t v22 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  os_unfair_lock_unlock(p_lock);
  if (!v19) {
    goto LABEL_6;
  }
LABEL_9:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&buf, 8);
}

void __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) signal])
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) posterExtensionBundleIdentifier];
    [v2 relinquishExtensionInstance:v3 reason:@"Snapshotting"];

    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDelegate:0];
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_4;
  v3[3] = &unk_1E6984078;
  id v4 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "pui_invalidateWithCompletion:", v3);
}

uint64_t __47__PBFPosterSnapshotter__cleanupWithCompletion___block_invoke_4(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(a1[7] + 8) + 40) invalidate];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t result = a1[5];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)isFinished
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_hasStarted
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasCleanedUp
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cleanedUp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isProcessingReceivedSnapshots
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isProcessingReceivedSnapshots;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_isSceneReady
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_sceneReady;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)createSnapshotUsingIOSurface:(id)a3 snapshotScale:(double)a4 imageEncoder:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = PBFLogSnapshotter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v9;
    _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Creating snapshot from IOSurface with encoder '%@'", buf, 0xCu);
  }

  uint64_t v12 = [v10 attachmentForKey:*MEMORY[0x1E4F92860]];
  [v12 unsignedIntegerValue];

  uint64_t v13 = [v10 attachmentForKey:*MEMORY[0x1E4F92858]];
  [v13 unsignedIntegerValue];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1818], "pui_imageWithIOSurface:scale:orientation:", v10, PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), a4);

  id v25 = 0;
  uint64_t v15 = [v9 writeThenReadBackImage:v14 error:&v25];
  id v16 = v25;
  if (v15)
  {
    id v17 = [v9 url];
    uint64_t v18 = *MEMORY[0x1E4F1C630];
    id v24 = v16;
    char v19 = [v17 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v18 error:&v24];
    id v20 = v24;

    if ((v19 & 1) == 0)
    {
      uint64_t v21 = PBFLogSnapshotter();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[PBFPosterSnapshotter createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:]();
      }
    }
  }
  else
  {
    uint64_t v22 = PBFLogSnapshotter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[PBFPosterSnapshotter createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:]();
    }

    if (a6)
    {
      id v20 = v16;
      id v17 = 0;
      *a6 = v20;
    }
    else
    {
      id v17 = 0;
      id v20 = v16;
    }
  }

  return v17;
}

- (void)_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isProcessingReceivedSnapshots = 1;
  os_unfair_lock_unlock(&self->_lock);
  long long v6 = PBFLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
  }

  kdebug_trace();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = [(PBFPosterSnapshotter *)self definitions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v51;
    uint64_t v41 = *MEMORY[0x1E4F28588];
    *(void *)&long long v9 = 138543874;
    long long v40 = v9;
    uint64_t v43 = *(void *)v51;
    __int16 v44 = v7;
    os_unfair_lock_t lock = &self->_lock;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (v4)
        {
          uint64_t v14 = PBFLogSnapshotter();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            identifier = self->_identifier;
            *(_DWORD *)long long buf = v40;
            uint64_t v57 = identifier;
            __int16 v58 = 2114;
            uint64_t v59 = v13;
            __int16 v60 = 2114;
            id v61 = v4;
            _os_log_error_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_ERROR, "(%{public}@) Skipping creation of snapshot for definition '%{public}@'; error occured - aborting creating "
              "snapshots: %{public}@",
              buf,
              0x20u);
          }
        }
        else
        {
          os_unfair_lock_lock(p_lock);
          BOOL v16 = [(PBFPosterSnapshotter *)self _lock_isSnapshotPopulatedForDefinition:v13];
          os_unfair_lock_unlock(p_lock);
          uint64_t v14 = PBFLogSnapshotter();
          BOOL v17 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v16)
          {
            if (v17)
            {
              uint64_t v18 = self->_identifier;
              *(_DWORD *)long long buf = 138543618;
              uint64_t v57 = v18;
              __int16 v58 = 2112;
              uint64_t v59 = v13;
              _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping creation of snapshot for definition '%@'; already loaded",
                buf,
                0x16u);
            }
            id v4 = 0;
          }
          else
          {
            if (v17)
            {
              char v19 = self->_identifier;
              *(_DWORD *)long long buf = 138543618;
              uint64_t v57 = v19;
              __int16 v58 = 2112;
              uint64_t v59 = v13;
              _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Creating snapshot for definition '%@'", buf, 0x16u);
            }

            os_unfair_lock_lock(p_lock);
            uint64_t v14 = [(NSMapTable *)self->_lock_snapshotImagesByDefinition objectForKey:v13];
            os_unfair_lock_unlock(p_lock);
            if (v14)
            {
              context = (void *)MEMORY[0x1D9433EF0]();
              id v20 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
              uint64_t v21 = self;
              uint64_t v22 = [(PBFPosterSnapshotter *)self _encoderForDefinition:v13];
              uint64_t v23 = [v22 url];
              uint64_t v24 = [v23 URLByDeletingLastPathComponent];

              id v25 = PFFileProtectionNoneAttributes();
              id v49 = 0;
              uint64_t v45 = (void *)v24;
              __int16 v46 = v20;
              LODWORD(v24) = [v20 createDirectoryAtURL:v24 withIntermediateDirectories:1 attributes:v25 error:&v49];
              id v26 = v49;

              if (v24)
              {
                id v48 = v26;
                id v27 = [v22 saveUIImage:v14 error:&v48];
                id v28 = v48;

                BOOL v29 = v27 != 0;
                id v26 = v28;
              }
              else
              {
                BOOL v29 = 0;
              }
              self = v21;
              if (v29 || v26)
              {
                uint64_t v37 = objc_msgSend(v22, "url", v40);
                os_unfair_lock_lock(lock);
                [(NSMutableDictionary *)v21->_lock_snapshotsByDefinition setObject:v37 forKey:v13];
                [(NSMapTable *)v21->_lock_snapshotImagesByDefinition removeObjectForKey:v13];
                os_unfair_lock_unlock(lock);
              }
              else
              {
                uint64_t v37 = PBFLogSnapshotter();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  long long v38 = v21->_identifier;
                  *(_DWORD *)long long buf = v40;
                  uint64_t v57 = v38;
                  __int16 v58 = 2112;
                  uint64_t v59 = v13;
                  __int16 v60 = 2112;
                  id v61 = 0;
                  _os_log_error_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to write snapshot for definition '%@' due to error: '%@'.", buf, 0x20u);
                }
              }
              uint64_t v11 = v43;
              id v7 = v44;

              id v4 = 0;
              p_os_unfair_lock_t lock = lock;
            }
            else
            {
              long long v30 = PBFLogSnapshotter();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = self->_identifier;
                *(_DWORD *)long long buf = 138543618;
                uint64_t v57 = v31;
                __int16 v58 = 2112;
                uint64_t v59 = v13;
                _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping creation of snapshot for definition '%@'; no image available",
                  buf,
                  0x16u);
              }

              long long v32 = (void *)MEMORY[0x1E4F28C58];
              v54[0] = @"definition";
              uint64_t v33 = [v13 uniqueIdentifier];
              long long v34 = (void *)v33;
              long long v35 = @"(NULL)";
              if (v33) {
                long long v35 = (__CFString *)v33;
              }
              v54[1] = v41;
              v55[0] = v35;
              v55[1] = @"No image available for definition.";
              id v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v55, v54, 2, v40);
              objc_msgSend(v32, "pbf_generalErrorWithCode:userInfo:", 7, v36);
              id v4 = (id)objc_claimAutoreleasedReturnValue();

              uint64_t v11 = v43;
              id v7 = v44;
            }
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v10);
  }

  uint64_t v39 = PBFLogTelemetrySignposts();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_TAILOR_IMAGES", " enableTelemetry=YES ", buf, 2u);
  }

  kdebug_trace();
  os_unfair_lock_lock(p_lock);
  self->_lock_isProcessingReceivedSnapshots = 0;
  os_unfair_lock_unlock(p_lock);
  [(PBFPosterSnapshotter *)self _finishWithError:v4];
}

- (id)_encoderForDefinition:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F927D8], "pbf_imageEncoderForPath:definition:configuredProperties:context:", self->_serverPosterPath, a3, self->_configuredProperties, self->_context);
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(PBFPosterSnapshotter *)self isFinished])
  {
    uint64_t v8 = PBFLogSnapshotter();
    long long v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        int v12 = 138543874;
        uint64_t v13 = identifier;
        __int16 v14 = 2112;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_error_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_ERROR, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v12, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_identifier;
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneWillDeactivate:'%@'", (uint8_t *)&v12, 0x16u);
    }

    [(PBFPosterSnapshotter *)self _finishWithError:v7];
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PBFPosterSnapshotter *)self isFinished])
  {
    id v5 = PBFLogSnapshotter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v7 = 138543618;
      uint64_t v8 = identifier;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneContentStateDidChange:'%@'", (uint8_t *)&v7, 0x16u);
    }

    [(PBFPosterSnapshotter *)self _captureSnapshotWithScene:v4];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9 = a3;
  id v8 = a4;
  if (![(PBFPosterSnapshotter *)self isFinished]
    && objc_msgSend(v8, "pui_extendedRenderSessionDidChange"))
  {
    [(PBFPosterSnapshotter *)self _captureSnapshotWithScene:v9];
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PBFLogSnapshotter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)long long buf = 138543618;
    id v27 = identifier;
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received actions: %{public}@", buf, 0x16u);
  }

  if (![(PBFPosterSnapshotter *)self isFinished])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          __int16 v16 = self;
          if (objc_opt_isKindOfClass())
          {
            int v17 = [v15 isValid];

            if (v17)
            {
              uint64_t v18 = PBFLogSnapshotter();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                char v19 = self->_identifier;
                *(_DWORD *)long long buf = 138543362;
                id v27 = v19;
                _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) Complication rendering complete", buf, 0xCu);
              }

              self->_complicationRenderingCompleted = 1;
              [(PBFPosterSnapshotter *)self _captureSnapshotWithScene:v6];
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    id v7 = v20;
  }
}

- (void)_captureSnapshotWithScene:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PBFPosterSnapshotter *)self isFinished])
  {
    id v5 = PBFLogSnapshotter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = identifier;
      id v7 = "(%{public}@) Aborting capture, snapshotter is reporting that it is done.";
LABEL_10:
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([v4 contentState] != 2)
  {
    id v5 = PBFLogSnapshotter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_identifier;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = v11;
      id v7 = "(%{public}@) Aborting capture, Scene content state not ready";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = [v4 clientSettings];
  int v9 = objc_msgSend(v8, "pui_inExtendedRenderSession");

  if (v9)
  {
    id v5 = PBFLogSnapshotter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_identifier;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = v10;
      id v7 = "(%{public}@) Aborting capture, scene is in extended render session";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!self->_complicationRenderingCompleted && self->_shouldWaitForComplicationRendering)
  {
    id v5 = PBFLogSnapshotter();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v13 = self->_identifier;
    *(_DWORD *)long long buf = 138543362;
    uint64_t v30 = v13;
    id v7 = "(%{public}@) Aborting capture, complication rendering not completed";
    goto LABEL_10;
  }
  if (self->_isCapturingSnapshots)
  {
    id v5 = PBFLogSnapshotter();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v12 = self->_identifier;
    *(_DWORD *)long long buf = 138543362;
    uint64_t v30 = v12;
    id v7 = "(%{public}@) Aborting capture, ~already~ capturing snapshots";
    goto LABEL_10;
  }
  if ([v4 contentState] == 2)
  {
    self->_isCapturingSnapshots = 1;
    __int16 v14 = PBFLogSnapshotter();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_identifier;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = v15;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot is capturing", buf, 0xCu);
    }

    __int16 v16 = PBFLogTelemetrySignposts();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_SNAPSHOTTER_SPINUP_SCENE", " enableTelemetry=YES ", buf, 2u);
    }

    kdebug_trace();
    os_unfair_lock_lock(&self->_lock);
    self->_double lock_snapshotsRequestedTime = CFAbsoluteTimeGetCurrent();
    self->_lock_sceneReady = 1;
    os_unfair_lock_unlock(&self->_lock);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v17 = self->_definitions;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          BOOL v23 = -[PBFPosterSnapshotter _lock_isSnapshotPopulatedForDefinition:](self, "_lock_isSnapshotPopulatedForDefinition:", v22, (void)v24);
          os_unfair_lock_unlock(&self->_lock);
          if (!v23) {
            [(NSMutableArray *)self->_outstandingDefinitionsNeedingSnapshots addObject:v22];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }

    [(PBFPosterSnapshotter *)self _processOutstandingSnapshotDefinitionsWithScene:v4];
  }
LABEL_12:
}

- (void)_processOutstandingSnapshotDefinitionsWithScene:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PBFPosterSnapshotter *)self isFinished]
    && ![(PBFPosterSnapshotter *)self _wasCleanedUp])
  {
    id v5 = [(NSMutableArray *)self->_outstandingDefinitionsNeedingSnapshots firstObject];
    if (v5)
    {
      id v6 = objc_msgSend(MEMORY[0x1E4FB1E20], "pbf_traitCollectionForDisplayContext:", self->_context);
      uint64_t v7 = +[PBFPosterSnapshotDefinition snapshotOptionsForDefinition:v5];
      uint64_t v8 = [v6 userInterfaceStyle];
      int v9 = self->_identifier;
      id v10 = PBFLogSnapshotter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v4 identityToken];
        uint64_t v12 = NSStringFromPRSPosterSnapshotOptions();
        *(_DWORD *)long long buf = 138544130;
        long long v25 = v9;
        __int16 v26 = 2112;
        long long v27 = v11;
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2048;
        uint64_t v31 = v8;
        _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) Taking snapshot for scene '%@' with options '%@' with interface style '%ld'", buf, 0x2Au);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_256;
      v21[3] = &unk_1E69840C8;
      id v22 = v5;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2;
      v15[3] = &unk_1E6984138;
      __int16 v16 = v9;
      uint64_t v20 = v7;
      id v17 = v4;
      uint64_t v18 = self;
      id v19 = v22;
      uint64_t v13 = v9;
      objc_msgSend(v17, "prui_setupSceneForSnapshottingWithOptions:traitCollection:updater:completion:", v7, v6, v21, v15);
    }
    else
    {
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke;
      block[3] = &unk_1E69808C0;
      void block[4] = self;
      dispatch_async(backgroundQueue, block);
    }
  }
}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:", 0);
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_256(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "pui_setPreviewContent:", objc_msgSend(v3, "previewContent"));
  objc_msgSend(v4, "pui_setMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v28 = 0;
    id v29 = (id *)&v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__13;
    uint64_t v32 = __Block_byref_object_dispose__13;
    uint64_t v33 = 0;
    id v6 = objc_msgSend(*(id *)(a1 + 40), "prui_snapshotContextConfiguredWithOptions:", *(void *)(a1 + 64));
    if (PRSPosterSnapshotOptionsIsFloatingLayerOnly())
    {
      uint64_t v7 = [*(id *)(a1 + 40) layerManager];
      uint64_t v8 = [v7 layers];
      uint64_t v9 = [v8 count];
      id v10 = [v6 layersToExclude];
      uint64_t v11 = [v10 count];

      if (v9 == v11)
      {
        if (PBFPosterSnapshotterTimeoutInterval_block_invoke_onceToken != -1) {
          dispatch_once(&PBFPosterSnapshotterTimeoutInterval_block_invoke_onceToken, &__block_literal_global_261);
        }
        objc_storeStrong(v29 + 5, (id)PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage);
      }
    }
    if (v29[5])
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "prui_createSnapshotWithContext:", v6);
    }
    [v12 capture];
    id v17 = *(NSObject **)(*(void *)(a1 + 48) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_4;
    v21[3] = &unk_1E6984110;
    long long v27 = &v28;
    id v22 = v12;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 48);
    id v23 = v18;
    uint64_t v24 = v19;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    id v20 = v12;
    dispatch_async(v17, v21);

    _Block_object_dispose(&v28, 8);
    __int16 v16 = v33;
  }
  else
  {
    uint64_t v13 = PBFLogSnapshotter();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_cold_1(a1, (uint64_t)v5, v13);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = *(NSObject **)(v14 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_258;
    block[3] = &unk_1E69808E8;
    void block[4] = v14;
    id v35 = v5;
    dispatch_async(v15, block);
    __int16 v16 = v35;
  }
}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_258(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_createSnapshotsUsingFetchedImagesWithError:", *(void *)(a1 + 40));
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_259()
{
  v0 = [MEMORY[0x1E4FB17E0] defaultFormat];
  [v0 setPreferredRange:0x7FFFLL];
  [v0 setOpaque:0];
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 1.0, 1.0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_3;
  v9[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #1.0 }
  long long v10 = _Q0;
  uint64_t v7 = [v1 imageWithActions:v9];
  uint64_t v8 = (void *)PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage;
  PBFPosterSnapshotterTimeoutInterval_block_invoke_fallbackSnapshotImage = v7;
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  uint64_t v3 = [v2 clearColor];
  [v3 setFill];

  BSRectWithSize();
  objc_msgSend(v4, "fillRect:");
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_4(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    || (objc_msgSend(MEMORY[0x1E4FB1818], "pui_imageFromSceneSnapshot:", *(void *)(a1 + 32)),
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8),
        id v4 = *(void **)(v3 + 40),
        *(void *)(v3 + 40) = v2,
        v4,
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)))
  {
    [*(id *)(a1 + 40) persistenceScale];
    if ((BSFloatIsOne() & 1) == 0)
    {
      id v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      [*(id *)(a1 + 40) persistenceScale];
      uint64_t v6 = objc_msgSend(v5, "pui_scaleImage:");
      uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));
  [*(id *)(*(void *)(a1 + 48) + 88) setObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));
  [*(id *)(*(void *)(a1 + 48) + 104) removeObject:*(void *)(a1 + 40)];
  uint64_t v9 = PBFLogSnapshotter();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Created snapshot for scene '%@' with definition '%@'", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_267;
  v13[3] = &unk_1E69808E8;
  v13[4] = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_267(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processOutstandingSnapshotDefinitionsWithScene:*(void *)(a1 + 40)];
}

- (BOOL)_lock_storeImage:(id)a3 definition:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(PBFPosterSnapshotter *)self necessitatesExtensionInstance])
  {
    uint64_t v10 = [(PBFPosterSnapshotter *)self extensionInstanceWithError:a5];
    if (!v10)
    {
      uint64_t v20 = PBFLogSnapshotter();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)long long buf = 138543362;
        uint64_t v28 = identifier;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping store of snapshot; no extension could be found.",
          buf,
          0xCu);
      }

      goto LABEL_17;
    }
  }
  if (!v8)
  {
LABEL_17:
    id v17 = 0;
    BOOL v19 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = PBFLogSnapshotter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_identifier;
    providerIdentifier = self->_providerIdentifier;
    serverPosterPath = self->_serverPosterPath;
    *(_DWORD *)long long buf = 138544130;
    uint64_t v28 = v12;
    __int16 v29 = 2114;
    uint64_t v30 = providerIdentifier;
    __int16 v31 = 2114;
    uint64_t v32 = serverPosterPath;
    __int16 v33 = 2114;
    id v34 = v9;
    _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Loaded snapshots for providerIdentifier '%{public}@' of path '%{public}@' for definition '%{public}@'", buf, 0x2Au);
  }

  id v15 = [(PBFPosterSnapshotter *)self _encoderForDefinition:v9];
  id v26 = 0;
  uint64_t v16 = [v15 saveUIImage:v8 error:&v26];
  id v17 = v26;
  if (!v16)
  {
    uint64_t v18 = PBFLogSnapshotter();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v23 = self->_identifier;
      uint64_t v24 = self->_providerIdentifier;
      id v25 = self->_serverPosterPath;
      *(_DWORD *)long long buf = 138544386;
      uint64_t v28 = v23;
      __int16 v29 = 2114;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      uint64_t v32 = v25;
      __int16 v33 = 2114;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_error_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to write snapshot to disk for providerIdentifier '%{public}@' of path '%{public}@' for definition '%{public}@': %@", buf, 0x34u);
    }
  }
  BOOL v19 = 1;
  if (a5 && v17)
  {
    id v17 = v17;
    *a5 = v17;
  }
LABEL_18:

  return v19;
}

- (PFPosterExtension)extension
{
  return self->_extension;
}

- (BOOL)readFromPosterPathCacheIfAvailable
{
  return self->_readFromPosterPathCacheIfAvailable;
}

- (void)setReadFromPosterPathCacheIfAvailable:(BOOL)a3
{
  self->_readFromPosterPathCacheIfAvailable = a3;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (NSError)error
{
  return self->_error;
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFExtensionProviding)extensionProvider
{
  return self->_extensionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_serverPosterPath, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_keepPosterBoardAliveUntilSnapshottingIsComplete, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_extensionPrewarmRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingDefinitionsNeedingSnapshots, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_snapshotImagesByDefinition, 0);
  objc_storeStrong((id *)&self->_lock_snapshotsByDefinition, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)initWithRequest:extensionProvider:runtimeAssertionProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionProvider:contents:definitions:configuredProperties:context:intention:previewIdentifier:significantEventsCounter:runtimeAssertionProvider:.cold.10()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __35__PBFPosterSnapshotter__main_start__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, a2, a3, "(%{public}@) PrewarmRuntimeAssertion was invalidated w/ error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_finishWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 192) identity];
  uint64_t v3 = [v2 provider];
  uint64_t v4 = [*(id *)(a1 + 192) descriptorIdentifier];
  uint64_t v5 = [*(id *)(a1 + 192) identity];
  uint64_t v6 = [v5 posterUUID];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9_3(&dword_1D31CE000, v7, v8, "(%{public}@) Execution time exceeded %d seconds (elapsed time: %f) -- extension: %{public}@ / descriptor: %{public}@ / posterUUID:%{public}@ -- Please File a radar because this is really long", v9, v10, v11, v12, v13);
}

- (void)_finishWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 192) identity];
  uint64_t v3 = [v2 provider];
  uint64_t v4 = [*(id *)(a1 + 192) descriptorIdentifier];
  uint64_t v5 = [*(id *)(a1 + 192) identity];
  uint64_t v6 = [v5 posterUUID];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9_3(&dword_1D31CE000, v7, v8, "(%{public}@) Execution time exceeded %d seconds (elapsed time: %f) -- extension: %{public}@ / descriptor: %{public}@ / posterUUID:%{public}@ -- Please File a radar because this is really long", v9, v10, v11, v12, v13);
}

+ (void)createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:.cold.1()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to write snapshot with encoder '%@' due to error: '%@'.");
}

+ (void)createSnapshotUsingIOSurface:snapshotScale:imageEncoder:error:.cold.2()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to exclude snapshot at url: '%@' from backup due to error: '%@'");
}

void __72__PBFPosterSnapshotter__processOutstandingSnapshotDefinitionsWithScene___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = NSStringFromPRSPosterSnapshotOptions();
  int v8 = 138413058;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint8_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1D31CE000, a3, OS_LOG_TYPE_ERROR, "(%@) Failed to create snapshot for scene '%@' with options '%@' due to scene update error: '%@'", (uint8_t *)&v8, 0x2Au);
}

@end