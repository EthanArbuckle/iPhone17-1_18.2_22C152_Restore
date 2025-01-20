@interface NTKPersistentFaceCollection
- (BOOL)hasLoaded;
- (NTKPersistentFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (id)_serverProxy;
- (void)_didAddFace:(id)a3 withUUID:(id)a4 atIndex:(unint64_t)a5;
- (void)_didMoveFace:(id)a3 withUUID:(id)a4 toIndex:(unint64_t)a5;
- (void)_didRemoveFace:(id)a3 withUUID:(id)a4;
- (void)_didSelectFaceUUID:(id)a3 suppressingCallback:(BOOL)a4;
- (void)_fromDaemon_addFace:(id)a3 forUUID:(id)a4;
- (void)_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected;
- (void)_fromDaemon_removeFaceForUUID:(id)a3;
- (void)_fromDaemon_updateFaceForUUID:(id)a3 withConfiguration:(id)a4;
- (void)_fromDaemon_updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4;
- (void)_handleConnectionInterrupted;
- (void)_handleFlushCompleteForIdentifier:(id)a3;
- (void)_notifyLoaded;
- (void)_notifyReset;
- (void)_performOrEnqueueUpdateOfType:(int64_t)a3 forFaceUUID:(id)a4 block:(id)a5;
- (void)_performSuppressingFaceObserverCallbacks:(id)a3;
- (void)_pruneEnqueuedUpdatesMadeObsoleteByNewUpdate:(id)a3;
- (void)_register;
- (void)_registerIfNeeded;
- (void)_sendToDaemonAddedFace:(id)a3 forUUID:(id)a4;
- (void)_sendToDaemonFlushWithIdentifier:(id)a3;
- (void)_sendToDaemonOrderedUUIDs;
- (void)_sendToDaemonRemovedFaceForUUID:(id)a3;
- (void)_sendToDaemonReset;
- (void)_sendToDaemonSelectedUUIDSuppressingCallback:(BOOL)a3;
- (void)_sendToDaemonUpdatedConfigurationForFace:(id)a3 withUUID:(id)a4;
- (void)_sendToDaemonUpdatedResourceDirectoryForFace:(id)a3 withUUID:(id)a4;
- (void)_sendToDaemonUpgradeForFace:(id)a3 withUUID:(id)a4;
- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5;
- (void)dealloc;
- (void)faceConfigurationDidChange:(id)a3;
- (void)faceResourceDirectoryDidChange:(id)a3;
- (void)faceUpgradeOccurred:(id)a3;
- (void)flushCompleteForIdentifier:(id)a3;
- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7;
- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5;
- (void)resetClientCollectionWithCompletion:(id)a3;
- (void)resumeUpdatesFromDaemon;
- (void)suspendUpdatesFromDaemon;
- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5;
- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6;
- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4;
- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4;
- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5;
@end

@implementation NTKPersistentFaceCollection

- (NTKPersistentFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NTKPersistentFaceCollection;
  v8 = [(NTKFaceCollection *)&v27 initWithCollectionIdentifier:v6 deviceUUID:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(NTKFaceCollection *)v8 collectionIdentifier];
    v9->_isLibraryCollection = [v10 isEqualToString:@"LibraryFaces"];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanotimekit.collectionserver" options:4096];
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v11;

    v13 = v9->_connection;
    v14 = NTKCollectionServerInterface();
    [(NSXPCConnection *)v13 setRemoteObjectInterface:v14];

    v15 = v9->_connection;
    v16 = NTKCollectionClientInterface();
    [(NSXPCConnection *)v15 setExportedInterface:v16];

    v17 = [[_NTKCollectionClientProxy alloc] initWithWeakProxy:v9];
    [(NSXPCConnection *)v9->_connection setExportedObject:v17];
    if (initWithCollectionIdentifier_deviceUUID__onceToken != -1) {
      dispatch_once(&initWithCollectionIdentifier_deviceUUID__onceToken, &__block_literal_global_45);
    }
    [(NSXPCConnection *)v9->_connection _setQueue:initWithCollectionIdentifier_deviceUUID__xpcQueue];
    objc_initWeak(&location, v9);
    v18 = v9->_connection;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2;
    v24 = &unk_1E62C0068;
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v18 setInterruptionHandler:&v21];
    -[NSXPCConnection setInvalidationHandler:](v9->_connection, "setInvalidationHandler:", &__block_literal_global_84, v21, v22, v23, v24);
    [(NSXPCConnection *)v9->_connection resume];
    [(NTKPersistentFaceCollection *)v9 _register];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)_handleDaemonDidLaunchNotification, @"com.apple.nanotimekit.daemondidlaunch", 0, (CFNotificationSuspensionBehavior)0);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("PFC-Shared-XPC", v2);
  v1 = (void *)initWithCollectionIdentifier_deviceUUID__xpcQueue;
  initWithCollectionIdentifier_deviceUUID__xpcQueue = (uint64_t)v0;
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_3;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4()
{
  dispatch_queue_t v0 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanotimekit.daemondidlaunch", 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKPersistentFaceCollection;
  [(NTKPersistentFaceCollection *)&v4 dealloc];
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)_didAddFace:(id)a3 withUUID:(id)a4 atIndex:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  if (self->_isLibraryCollection)
  {
    [v13 setIsLibraryFace:1];
    [v13 didMoveToLibrary];
  }
  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  self->_referenceOrderedUUIDs = 0;

  unint64_t v10 = [(NTKFaceCollection *)self numberOfFaces] - 1;
  uint64_t v11 = [(NTKFaceCollection *)self orderedUUIDs];
  v12 = [v11 objectAtIndex:a5];
  [(NTKPersistentFaceCollection *)self _sendToDaemonAddedFace:v13 forUUID:v12];

  if (v10 != a5) {
    [(NTKPersistentFaceCollection *)self _sendToDaemonOrderedUUIDs];
  }
}

- (void)_didMoveFace:(id)a3 withUUID:(id)a4 toIndex:(unint64_t)a5
{
  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  self->_referenceOrderedUUIDs = 0;

  [(NTKPersistentFaceCollection *)self _sendToDaemonOrderedUUIDs];
}

- (void)_didSelectFaceUUID:(id)a3 suppressingCallback:(BOOL)a4
{
  BOOL v4 = a4;
  referenceSelectedUUID = self->_referenceSelectedUUID;
  self->_referenceSelectedUUID = 0;

  id v7 = [(NTKFaceCollection *)self selectedUUID];

  if (v7)
  {
    [(NTKPersistentFaceCollection *)self _sendToDaemonSelectedUUIDSuppressingCallback:v4];
  }
}

- (void)_didRemoveFace:(id)a3 withUUID:(id)a4
{
  id v6 = a3;
  [(NTKPersistentFaceCollection *)self _sendToDaemonRemovedFaceForUUID:a4];
  if (self->_isLibraryCollection) {
    [v6 setIsLibraryFace:0];
  }
}

- (void)suspendUpdatesFromDaemon
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(NTKFaceCollection *)self logIdentifier];
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ suspend updates from daemon", (uint8_t *)&v10, 0xCu);
  }
  if (!self->_updatesFromDaemonEnqueuedWhileSuspended)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    updatesFromDaemonEnqueuedWhileSuspended = self->_updatesFromDaemonEnqueuedWhileSuspended;
    self->_updatesFromDaemonEnqueuedWhileSuspended = v5;
  }
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  updateSuspensionIdentifier = self->_updateSuspensionIdentifier;
  self->_updateSuspensionIdentifier = v8;

  self->_updatesFromDaemonSuspended = 1;
}

- (void)resumeUpdatesFromDaemon
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(NTKFaceCollection *)self logIdentifier];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ resume updates from daemon", (uint8_t *)&v5, 0xCu);
  }
  if (self->_updatesFromDaemonSuspended) {
    [(NTKPersistentFaceCollection *)self _sendToDaemonFlushWithIdentifier:self->_updateSuspensionIdentifier];
  }
}

- (void)_handleFlushCompleteForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_updateSuspensionIdentifier isEqualToString:a3])
  {
    BOOL v4 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [(NTKFaceCollection *)self logIdentifier];
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%@ playing back updates enqueued while suspended", buf, 0xCu);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_updatesFromDaemonEnqueuedWhileSuspended;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "block", (void)v13);
          uint64_t v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v11[2]();

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_updatesFromDaemonEnqueuedWhileSuspended removeAllObjects];
    updateSuspensionIdentifier = self->_updateSuspensionIdentifier;
    self->_updateSuspensionIdentifier = 0;

    self->_updatesFromDaemonSuspended = 0;
  }
}

- (void)faceConfigurationDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    int v5 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NTKFaceCollection *)self logIdentifier];
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ face config did change (face = %@)", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = [(NTKFaceCollection *)self UUIDsByFace];
    uint64_t v8 = [v7 objectForKey:v4];

    if (v8) {
      [(NTKPersistentFaceCollection *)self _sendToDaemonUpdatedConfigurationForFace:v4 withUUID:v8];
    }
  }
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    int v5 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NTKFaceCollection *)self logIdentifier];
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ face directory did change (face = %@)", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = [(NTKFaceCollection *)self UUIDsByFace];
    uint64_t v8 = [v7 objectForKey:v4];

    if (v8) {
      [(NTKPersistentFaceCollection *)self _sendToDaemonUpdatedResourceDirectoryForFace:v4 withUUID:v8];
    }
  }
}

- (void)faceUpgradeOccurred:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_suppressingFaceObserverCallbacks)
  {
    int v5 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NTKFaceCollection *)self logIdentifier];
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ face upgrade in progress (face = %@)", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = [(NTKFaceCollection *)self UUIDsByFace];
    uint64_t v8 = [v7 objectForKey:v4];

    if (v8) {
      [(NTKPersistentFaceCollection *)self _sendToDaemonUpgradeForFace:v4 withUUID:v8];
    }
  }
}

- (void)_notifyLoaded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NTKFaceCollection *)self observers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 faceCollectionDidLoad:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_notifyReset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NTKFaceCollection *)self observers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 faceCollectionDidReset:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_sendToDaemonOrderedUUIDs
{
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v4 = [(NTKPersistentFaceCollection *)self _serverProxy];
  v3 = [(NTKFaceCollection *)self orderedUUIDs];
  [v4 setOrderedFaceUUIDs:v3];
}

- (void)_sendToDaemonSelectedUUIDSuppressingCallback:(BOOL)a3
{
  BOOL v3 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v6 = [(NTKPersistentFaceCollection *)self _serverProxy];
  uint64_t v5 = [(NTKFaceCollection *)self selectedUUID];
  [v6 setSelectedFaceUUID:v5 suppressingCallback:v3];
}

- (void)_sendToDaemonUpdatedConfigurationForFace:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v9 = [(NTKPersistentFaceCollection *)self _serverProxy];
  uint64_t v8 = [v7 configurationJSONRepresentation];

  [v9 updateFaceForUUID:v6 withConfigurationJSONRepresentation:v8];
}

- (void)_sendToDaemonUpdatedResourceDirectoryForFace:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v9 = [(NTKPersistentFaceCollection *)self _serverProxy];
  uint64_t v8 = [v7 resourceDirectory];

  [v9 updateFaceForUUID:v6 withResourceDirectory:v8];
}

- (void)_sendToDaemonUpgradeForFace:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v9 = [v7 instanceDescriptor];

  uint64_t v8 = [(NTKPersistentFaceCollection *)self _serverProxy];
  [v8 upgradeFaceInstanceDescriptor:v9 forUUID:v6];
}

- (void)_sendToDaemonAddedFace:(id)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v9 = [v7 instanceDescriptor];

  uint64_t v8 = [(NTKPersistentFaceCollection *)self _serverProxy];
  [v8 addFaceInstanceDescriptor:v9 forUUID:v6];
}

- (void)_sendToDaemonRemovedFaceForUUID:(id)a3
{
  id v4 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v5 = [(NTKPersistentFaceCollection *)self _serverProxy];
  [v5 removeFaceForUUID:v4];
}

- (void)_sendToDaemonReset
{
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v3 = [(NTKPersistentFaceCollection *)self _serverProxy];
  [v3 resetCollection];
}

- (void)_sendToDaemonFlushWithIdentifier:(id)a3
{
  id v4 = a3;
  [(NTKPersistentFaceCollection *)self _registerIfNeeded];
  id v5 = [(NTKPersistentFaceCollection *)self _serverProxy];
  [v5 flushUpdatesWithIdentifier:v4];
}

- (id)_serverProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_opt_class();
  NTKValidateArray(v12, v17);
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  NTKValidateDictionary(v14, v18, v19);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke;
  v20[3] = &unk_1E62C32D0;
  v20[4] = self;
  id v21 = v15;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v25 = v16;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:0 forFaceUUID:0 block:v20];
}

void __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logIdentifier];
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v80 = v3;
    __int16 v81 = 2112;
    v82 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon load full collection (seqId=%@)", buf, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 32) facesByUUID];
  id v6 = [v5 allKeys];
  id v7 = (void *)[v6 mutableCopy];

  if (v7) {
    BOOL v8 = [v7 count] == 0;
  }
  else {
    BOOL v8 = 1;
  }
  id v9 = [*(id *)(a1 + 48) allKeys];
  [v7 removeObjectsInArray:v9];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v73 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_removeFaceForUUID:", *(void *)(*((void *)&v72 + 1) + 8 * i));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v12);
  }
  id v55 = v10;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 56));
  [*(id *)(a1 + 32) _updateOrderedUUIDsFromReference:*(void *)(a1 + 56) andNotifyReordered:1];
  id v15 = [*(id *)(a1 + 48) allKeys];
  id v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = *(unsigned char **)(a1 + 32);
  if (v17[152]) {
    BOOL v18 = v8;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18)
  {
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_94;
    v70[3] = &unk_1E62C32A8;
    id v71 = *(id *)(a1 + 56);
    objc_msgSend(v16, "sortUsingComparator:", v70, v10);

    uint64_t v17 = *(unsigned char **)(a1 + 32);
  }
  uint64_t v19 = objc_msgSend(v17, "facesByUUID", v55);
  uint64_t v20 = [v19 allKeys];
  [v16 removeObjectsInArray:v20];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v21 = v16;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v77 count:16];
  v57 = v21;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v67 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        objc_super v27 = [*(id *)(a1 + 48) objectForKey:v26];
        v28 = +[NTKFace faceWithInstanceDescriptor:v27];
        if (v28)
        {
          objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_addFace:forUUID:", v28, v26);
        }
        else
        {
          v29 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [v27 debugDescription];
            v31 = [v26 UUIDString];
            *(_DWORD *)buf = 138412546;
            v80 = v30;
            __int16 v81 = 2112;
            v82 = v31;
            _os_log_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_DEFAULT, "Got a nil NTKFace when initalizing from descriptor %@, uuid %@", buf, 0x16u);

            id v21 = v57;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v66 objects:v77 count:16];
    }
    while (v23);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected");
  v32 = [*(id *)(a1 + 32) selectedFace];

  if (!v32)
  {
    v33 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      v80 = v34;
      _os_log_impl(&dword_1BC5A9000, v33, OS_LOG_TYPE_DEFAULT, "Failed to select the specified selectedUUID (%@) when loading, falling back", buf, 0xCu);
    }

    v35 = *(void **)(a1 + 32);
    v36 = [v35 orderedUUIDs];
    v37 = [v36 firstObject];
    [v35 _selectFaceUUID:v37 notify:0];
  }
  v38 = [*(id *)(a1 + 48) allKeys];
  v39 = (void *)[v38 mutableCopy];

  [v39 removeObjectsInArray:v21];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v63;
    obuint64_t j = v40;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v62 + 1) + 8 * k);
        v46 = (void *)MEMORY[0x1C1875BE0]();
        v47 = [*(id *)(a1 + 32) facesByUUID];
        v48 = [v47 objectForKey:v45];

        v49 = [*(id *)(a1 + 48) objectForKey:v45];
        v50 = +[NTKFace faceWithInstanceDescriptor:v49];
        v51 = *(void **)(a1 + 32);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_98;
        v59[3] = &unk_1E62C09C0;
        id v60 = v48;
        id v61 = v50;
        id v52 = v50;
        id v53 = v48;
        [v51 _performSuppressingFaceObserverCallbacks:v59];
      }
      id v40 = obj;
      uint64_t v42 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v42);
  }

  uint64_t v54 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v54 + 80))
  {
    *(unsigned char *)(v54 + 80) = 1;
    [*(id *)(a1 + 32) _notifyLoaded];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  BOOL v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  id v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

void __119__NTKPersistentFaceCollection_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke_98(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) configuration];
  [v2 applyConfiguration:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) resourceDirectory];
  [v4 setResourceDirectoryByTransferringOwnership:v5];
}

- (void)resetClientCollectionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__NTKPersistentFaceCollection_resetClientCollectionWithCompletion___block_invoke;
  v6[3] = &unk_1E62C2290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:0 forFaceUUID:0 block:v6];
}

uint64_t __67__NTKPersistentFaceCollection_resetClientCollectionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyReset];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NTKPersistentFaceCollection_updateSelectedFaceUUID_seqId___block_invoke;
  v10[3] = &unk_1E62C04F0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:5 forFaceUUID:0 block:v10];
}

uint64_t __60__NTKPersistentFaceCollection_updateSelectedFaceUUID_seqId___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] logIdentifier];
    id v4 = a1[5];
    id v5 = a1[6];
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update selected uuid to %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_storeStrong((id *)a1[4] + 13, a1[6]);
  objc_storeStrong((id *)a1[4] + 15, a1[5]);
  return objc_msgSend(a1[4], "_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected");
}

- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  NTKValidateArray(v6, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__NTKPersistentFaceCollection_updateOrderedFaceUUIDs_seqId___block_invoke;
  v11[3] = &unk_1E62C04F0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:6 forFaceUUID:0 block:v11];
}

uint64_t __60__NTKPersistentFaceCollection_updateOrderedFaceUUIDs_seqId___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] logIdentifier];
    id v4 = a1[5];
    id v5 = a1[6];
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update ordered uuids to %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_storeStrong((id *)a1[4] + 13, a1[6]);
  objc_storeStrong((id *)a1[4] + 14, a1[5]);
  return [a1[4] _updateOrderedUUIDsFromReference:a1[5] andNotifyReordered:1];
}

- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"UUID" format];
    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"Configuration" format];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__NTKPersistentFaceCollection_updateFaceForUUID_withConfigurationJSONRepresentation_seqId___block_invoke;
  v14[3] = &unk_1E62C32F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:2 forFaceUUID:v13 block:v14];
}

void __91__NTKPersistentFaceCollection_updateFaceForUUID_withConfigurationJSONRepresentation_seqId___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) facesByUUID];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v4 = [NTKFaceConfiguration alloc];
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [v3 device];
  int v7 = [(NTKFaceConfiguration *)v4 initWithJSONDictionary:v5 editModeMapping:v3 forDevice:v6];

  id v8 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138413058;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "%@ from daemon update face for uuid %@ with config %@ (seqId=%@)", (uint8_t *)&v12, 0x2Au);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_updateFaceForUUID:withConfiguration:", *(void *)(a1 + 40), v7);
}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"UUID" format];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__NTKPersistentFaceCollection_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke;
  v18[3] = &unk_1E62C3320;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:3 forFaceUUID:v17 block:v18];
}

uint64_t __88__NTKPersistentFaceCollection_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138413058;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon update face for uuid %@ with resource directory %@ (seqId=%@)", (uint8_t *)&v8, 0x2Au);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_updateFaceForUUID:withResourceDirectory:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"UUID" format];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"FaceInstanceDescriptor" format];
    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__NTKPersistentFaceCollection_upgradeFaceInstanceDescriptor_forUUID_seqID___block_invoke;
  v14[3] = &unk_1E62C32F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:7 forFaceUUID:v11 block:v14];
}

void __75__NTKPersistentFaceCollection_upgradeFaceInstanceDescriptor_forUUID_seqID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138412802;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon upgrade face %@ (seqId=%@)", (uint8_t *)&v8, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 48));
  uint64_t v6 = (void *)MEMORY[0x1C1875BE0]();
  int v7 = +[NTKFace faceWithInstanceDescriptor:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_upgradeFace:forUUID:", v7, *(void *)(a1 + 56));
}

- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"UUID" format];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"FaceInstanceDescriptor" format];
    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__NTKPersistentFaceCollection_addFaceInstanceDescriptor_forUUID_seqId___block_invoke;
  v14[3] = &unk_1E62C32F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:1 forFaceUUID:v12 block:v14];
}

void __71__NTKPersistentFaceCollection_addFaceInstanceDescriptor_forUUID_seqId___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v17 = 138413058;
    __int16 v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon add face %@ for uuid %@ (seqId=%@)", (uint8_t *)&v17, 0x2Au);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 56));
  int v7 = (void *)MEMORY[0x1C1875BE0]();
  id v8 = +[NTKFace faceWithInstanceDescriptor:*(void *)(a1 + 40)];
  id v9 = [*(id *)(a1 + 32) facesByUUID];
  id v10 = [v9 objectForKey:*(void *)(a1 + 48)];

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v10)
  {
    id v13 = [v8 resourceDirectory];
    objc_msgSend(v11, "_fromDaemon_updateFaceForUUID:withResourceDirectory:", v12, v13);

    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [v8 configuration];
    objc_msgSend(v14, "_fromDaemon_updateFaceForUUID:withConfiguration:", v15, v16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_addFace:forUUID:", v8, *(void *)(a1 + 48));
  }
}

- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ must be non-nil", @"UUID" format];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__NTKPersistentFaceCollection_removeFaceForUUID_seqId_completion___block_invoke;
  v14[3] = &unk_1E62C3348;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(NTKPersistentFaceCollection *)self _performOrEnqueueUpdateOfType:4 forFaceUUID:v13 block:v14];
}

uint64_t __66__NTKPersistentFaceCollection_removeFaceForUUID_seqId_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) logIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "%@ from daemon remove face for uuid %@ (seqId=%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_fromDaemon_removeFaceForUUID:", *(void *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)flushCompleteForIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NTKPersistentFaceCollection_flushCompleteForIdentifier___block_invoke;
  v6[3] = &unk_1E62C09C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __58__NTKPersistentFaceCollection_flushCompleteForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFlushCompleteForIdentifier:*(void *)(a1 + 40)];
}

- (void)_fromDaemon_addFace:(id)a3 forUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 resourceDirectory];
  [v7 setResourceDirectoryByTransferringOwnership:v8];

  __int16 v9 = [(NTKFaceCollection *)self orderedUUIDs];
  -[NTKFaceCollection _addFace:forUUID:atIndex:](self, "_addFace:forUUID:atIndex:", v7, v6, [v9 count]);

  referenceOrderedUUIDs = self->_referenceOrderedUUIDs;
  if (referenceOrderedUUIDs) {
    [(NTKFaceCollection *)self _updateOrderedUUIDsFromReference:referenceOrderedUUIDs andNotifyReordered:0];
  }
  [(NTKPersistentFaceCollection *)self _fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected];
}

- (void)_fromDaemon_removeFaceForUUID:(id)a3
{
  id v6 = a3;
  id v4 = [(NTKFaceCollection *)self facesByUUID];
  id v5 = [v4 objectForKey:v6];

  if (v5) {
    [(NTKFaceCollection *)self _removeFaceForUUID:v6];
  }
}

- (void)_fromDaemon_updateFaceForUUID:(id)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKFaceCollection *)self facesByUUID];
  __int16 v9 = [v8 objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [v9 configuration];
    char v11 = [v10 isEqual:v6];

    if ((v11 & 1) == 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withConfiguration___block_invoke;
      v12[3] = &unk_1E62C09C0;
      id v13 = v9;
      id v14 = v6;
      [(NTKPersistentFaceCollection *)self _performSuppressingFaceObserverCallbacks:v12];
    }
  }
}

uint64_t __79__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyConfiguration:*(void *)(a1 + 40)];
}

- (void)_fromDaemon_updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKFaceCollection *)self facesByUUID];
  __int16 v9 = [v8 objectForKey:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withResourceDirectory___block_invoke;
  v12[3] = &unk_1E62C09C0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [(NTKPersistentFaceCollection *)self _performSuppressingFaceObserverCallbacks:v12];
}

uint64_t __83__NTKPersistentFaceCollection__fromDaemon_updateFaceForUUID_withResourceDirectory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setResourceDirectoryByTransferringOwnership:*(void *)(a1 + 40)];
}

- (void)_fromDaemon_computeSelectedUUIDFromReferenceAndNotifySelected
{
  if (self->_referenceSelectedUUID)
  {
    id v3 = [(NTKFaceCollection *)self facesByUUID];
    id v8 = [v3 objectForKey:self->_referenceSelectedUUID];

    if (v8)
    {
      referenceSelectedUUID = self->_referenceSelectedUUID;
      id v5 = [(NTKFaceCollection *)self selectedUUID];
      uint64_t v6 = NTKEqualObjects(referenceSelectedUUID, v5) ^ 1;

      [(NTKFaceCollection *)self _selectFaceUUID:self->_referenceSelectedUUID notify:v6];
      id v7 = self->_referenceSelectedUUID;
      self->_referenceSelectedUUID = 0;
    }
  }
}

- (void)_register
{
  id v3 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  id v4 = [(NTKFaceCollection *)self collectionIdentifier];
  id v5 = [(NTKFaceCollection *)self deviceUUID];
  [v3 registerForCollectionIdentifier:v4 deviceUUID:v5 withSeqId:self->_seqId];

  self->_registrationNeeded = 0;
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded) {
    [(NTKPersistentFaceCollection *)self _register];
  }
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void)_performOrEnqueueUpdateOfType:(int64_t)a3 forFaceUUID:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__NTKPersistentFaceCollection__performOrEnqueueUpdateOfType_forFaceUUID_block___block_invoke;
  v12[3] = &unk_1E62C2240;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a3;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __79__NTKPersistentFaceCollection__performOrEnqueueUpdateOfType_forFaceUUID_block___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 129))
  {
    id v3 = +[NTKFaceCollectionUpdate updateWithType:*(void *)(a1 + 56) uuid:*(void *)(a1 + 40) block:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _pruneEnqueuedUpdatesMadeObsoleteByNewUpdate:v3];
    [*(id *)(*(void *)(a1 + 32) + 136) addObject:v3];
  }
  else
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

- (void)_pruneEnqueuedUpdatesMadeObsoleteByNewUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKPersistentFaceCollection__pruneEnqueuedUpdatesMadeObsoleteByNewUpdate___block_invoke;
  aBlock[3] = &unk_1E62C3370;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = (unsigned int (**)(void *, void))_Block_copy(aBlock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (void *)[(NSMutableArray *)self->_updatesFromDaemonEnqueuedWhileSuspended copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v6[2](v6, v12)) {
          [(NSMutableArray *)self->_updatesFromDaemonEnqueuedWhileSuspended removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v9);
  }
}

uint64_t __76__NTKPersistentFaceCollection__pruneEnqueuedUpdatesMadeObsoleteByNewUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [*(id *)(a1 + 32) type];
  uint64_t v6 = [v3 uuid];

  id v7 = [*(id *)(a1 + 32) uuid];
  unsigned int v8 = NTKEqualObjects(v6, v7);

  unint64_t v9 = [*(id *)(a1 + 32) type];
  uint64_t result = 1;
  if (v9 <= 7)
  {
    if (((1 << v9) & 0x8C) != 0)
    {
      if (v4 == v5) {
        return v8;
      }
      else {
        return 0;
      }
    }
    else
    {
      uint64_t v11 = 1 << v9;
      BOOL v12 = ((1 << v9) & 0x60) == 0 || v4 == v5;
      if ((v11 & 0x12) != 0) {
        return v8;
      }
      else {
        return v12;
      }
    }
  }
  return result;
}

- (void)_performSuppressingFaceObserverCallbacks:(id)a3
{
  self->_suppressingFaceObserverCallbacks = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_suppressingFaceObserverCallbacks = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSuspensionIdentifier, 0);
  objc_storeStrong((id *)&self->_updatesFromDaemonEnqueuedWhileSuspended, 0);
  objc_storeStrong((id *)&self->_referenceSelectedUUID, 0);
  objc_storeStrong((id *)&self->_referenceOrderedUUIDs, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "xpc connection invalidated. This is unrecoverable.", v2, v3, v4, v5, v6);
}

@end