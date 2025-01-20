@interface userFSVolume
+ (id)newWithDevice:(id)a3 fsType:(id)a4 volumeName:(id)a5 rootNode:(void *)a6 errorState:(id)a7 returnError:(id *)a8;
- (BOOL)allowSearch;
- (BOOL)getNodeFromFileID:(unint64_t)a3 outNode:(id *)a4;
- (BOOL)isCaseSensitive;
- (BOOL)isDCIM;
- (BOOL)pauseIOQueue;
- (BOOL)readOnly;
- (BOOL)spotlightIsEnabled;
- (BOOL)supportsHardLinks;
- (BOOL)supportsPersistentObjectIdentifier;
- (BOOL)useKOIO;
- (CSLiveFSVolume)spotlightNotifer;
- (LIFSPreVolume)preVolInfo;
- (LiveFSAppleDoubleManager)appleDoubleManager;
- (LiveFSRawDevice)volumeRawDevice;
- (LiveFSServiceUserClient)kernelUserClient;
- (NSError)errorState;
- (NSString)concurrentQueueName;
- (NSString)fsType;
- (NSString)metaDataQueueNamePrefix;
- (NSString)serialQueueName;
- (NSString)volumeLabel;
- (NSString)volumeName;
- (OS_dispatch_group)IOGroup;
- (OS_dispatch_group)searchGroup;
- (OS_dispatch_queue)IORequests;
- (OS_dispatch_queue)SearchRequests;
- (OS_dispatch_queue)metaDataRequests;
- (OS_os_transaction)os_transaction;
- (UserFSSleepManager)powerAssertManager;
- (char)pathStringForNode:(id)a3 name:(id)a4 buffer:(char *)a5 bufferSize:(unint64_t)a6 outLength:(unint64_t *)a7;
- (id)getFileSystemRepresentation:(id)a3 error:(int *)a4;
- (id)getFreeSpaceInVolume;
- (id)getNodeForFH:(id)a3 withError:(int *)a4;
- (id)grantLIFSKextAccessToFD;
- (id)lookupWithParent:(id)a3 andName:(id)a4;
- (id)registerSpotlightNotifer;
- (id)revokeLIFSKextAccessToFD;
- (id)unregisterWithMounterService:(unsigned int)a3;
- (id)updateRootNode:(void *)a3 errorState:(id)a4;
- (int)searchVolume:(id)a3 withCriteria:(id)a4 withSearchToken:(id)a5 andWithResultsHandler:(id)a6;
- (int)volumeDeviceFD;
- (liveFSNode)rootNode;
- (unint64_t)getNextObjectIdentifier;
- (userFSVolume)init;
- (userFSVolume)initWithDevice:(id)a3 fsType:(id)a4 volumeName:(id)a5 UVFSRootNode:(void *)a6 errorState:(id)a7 returnError:(id *)a8;
- (void)LIDisableSearch;
- (void)LIRead:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6;
- (void)LIRead:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 reply:(id)a6;
- (void)LISearchAbortAll;
- (void)LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6;
- (void)abortAllClientSearchesFor:(unint64_t)a3;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createAppleDoubleManagerIfNeeded;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)dealloc;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)insertIntoFHCache:(id)a3;
- (void)insertIntoNameCache:(id)a3 withParent:(id)a4;
- (void)insertIntoNameCache:(id)a3 withParent:(id)a4 withName:(id)a5;
- (void)invalidateFileNodesForConnection:(unint64_t)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)purgeFHToNodeTable;
- (void)purgeMappingTables;
- (void)purgeNameToFHTable;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeFromFHCache:(id)a3;
- (void)removeFromNameCache:(id)a3 withParent:(id)a4;
- (void)removeFromNameCache:(id)a3 withParent:(id)a4 withName:(id)a5;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)resumeIOQueue;
- (void)revokeDeviceIfNeeded;
- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)setAllowSearch:(BOOL)a3;
- (void)setAppleDoubleManager:(id)a3;
- (void)setConcurrentQueueName:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setIOGroup:(id)a3;
- (void)setIORequests:(id)a3;
- (void)setKernelUserClient:(id)a3;
- (void)setMetaDataQueueNamePrefix:(id)a3;
- (void)setMetaDataRequests:(id)a3;
- (void)setOs_transaction:(id)a3;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setPowerAssertManager:(id)a3;
- (void)setPreVolInfo:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRootNode:(id)a3;
- (void)setSearchGroup:(id)a3;
- (void)setSearchRequests:(id)a3;
- (void)setSerialQueueName:(id)a3;
- (void)setSpotlightIsEnabled:(BOOL)a3;
- (void)setSpotlightNotifer:(id)a3;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setUseKOIO:(BOOL)a3;
- (void)setVolumeDeviceFD:(int)a3;
- (void)setVolumeLabel:(id)a3;
- (void)setVolumeName:(id)a3;
- (void)setVolumeRawDevice:(id)a3;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)startSyncerIfNeeded;
- (void)unmount:(unsigned int)a3;
- (void)unregisterWithLiveFSService:(unsigned int)a3;
- (void)verifyExistenceWithFileIDs:(id)a3 reply:(id)a4;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation userFSVolume

- (userFSVolume)init
{
  v27.receiver = self;
  v27.super_class = (Class)userFSVolume;
  v2 = [(userFSVolume *)&v27 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
    if (!v3) {
      goto LABEL_18;
    }
    v2->LiveFSVolume_opaque[OBJC_IVAR___LiveFSVolume__renameChangesFileID] = 0;
    v2->LiveFSVolume_opaque[OBJC_IVAR___LiveFSVolume__hasPersistentFileIDs] = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mountFHtoNodeTable = v2->mountFHtoNodeTable;
    v2->mountFHtoNodeTable = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mountNameToNodeCache = v2->mountNameToNodeCache;
    v2->mountNameToNodeCache = v6;

    int v8 = pthread_rwlock_init(&v2->mountNameToNodeCacheLock, 0);
    if (!v2->mountNameToNodeCache || v8 != 0) {
      goto LABEL_18;
    }
    atomic_store(0, &v2->ioQueuePausedCount);
    int v10 = pthread_rwlock_init(&v2->searchRequestsRWLock, 0);
    v11 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    searchRequests = v2->searchRequests;
    v2->searchRequests = v11;

    if (!v2->searchRequests) {
      goto LABEL_18;
    }
    if (v10) {
      goto LABEL_18;
    }
    atomic_store(3u, (unsigned int *)&v2->nextFileID);
    atomic_store(0, &v2->nextFreeSpaceSeqno);
    v2->_volumeDeviceFD = -1;
    v2->volumeDeviceGranted = 0;
    dispatch_queue_t v13 = dispatch_queue_create(0, 0);
    metaDataRequests = v2->_metaDataRequests;
    v2->_metaDataRequests = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create(0, v3);
    IORequests = v2->_IORequests;
    v2->_IORequests = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create(0, v3);
    v18 = v2->_SearchRequests;
    v2->_SearchRequests = (OS_dispatch_queue *)v17;

    if (!v2->_metaDataRequests) {
      goto LABEL_18;
    }
    if (!v2->_IORequests) {
      goto LABEL_18;
    }
    if (!v2->_SearchRequests) {
      goto LABEL_18;
    }
    dispatch_group_t v19 = dispatch_group_create();
    IOGroup = v2->_IOGroup;
    v2->_IOGroup = (OS_dispatch_group *)v19;

    dispatch_group_t v21 = dispatch_group_create();
    searchGroup = v2->_searchGroup;
    v2->_searchGroup = (OS_dispatch_group *)v21;

    metaDataQueueNamePrefix = v2->_metaDataQueueNamePrefix;
    v2->_metaDataQueueNamePrefix = (NSString *)@"com.apple.filesystem.uvfs.metaIO";

    if (!v2->_IOGroup) {
      goto LABEL_18;
    }
    if (v2->_searchGroup)
    {
      v2->_allowSearch = 1;
      v2->_spotlightIsEnabled = enableSpotlight;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100023DDC();
      }
      initAllUVFSdecmpfsRegistration();
      uint64_t v24 = +[LiveFSServiceUserClient defaultClient];
      kernelUserClient = v2->_kernelUserClient;
      v2->_kernelUserClient = (LiveFSServiceUserClient *)v24;
    }
    else
    {
LABEL_18:

      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100023DA8();
      }
      v3 = v2;
      v2 = 0;
    }
  }
  return v2;
}

- (id)updateRootNode:(void *)a3 errorState:(id)a4
{
  unint64_t v7 = (unint64_t)a4;
  if (!((unint64_t)a3 | v7))
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100024010();
    }
    goto LABEL_9;
  }
  if (a3)
  {
    rootNode = self->_rootNode;
    if (!rootNode || [(liveFSNode *)rootNode UVFSNode] != a3)
    {
      v9 = [[liveFSNode alloc] initWithVolume:self andRootUVFSNode:a3];
      int v10 = self->_rootNode;
      self->_rootNode = v9;

      if (self->_rootNode)
      {
        -[userFSVolume insertIntoFHCache:](self, "insertIntoFHCache:");
        int v11 = 1;
        goto LABEL_11;
      }
LABEL_9:
      v12 = getNSErrorFromLiveFSErrno();
      goto LABEL_62;
    }
  }
  int v11 = 0;
LABEL_11:
  if (![(NSString *)self->_volumeName length])
  {
    if (v7)
    {
      id v14 = 0;
      if (v11) {
        goto LABEL_15;
      }
      goto LABEL_60;
    }
LABEL_24:
    v29 = self->_rootNode;
    id v58 = 0;
    unsigned int v30 = [(liveFSNode *)v29 getFileSystemAttribute:@"_S_f_vol_name" andResult:&v58];
    id v31 = v58;
    id v14 = v31;
    if (v30) {
      BOOL v32 = 1;
    }
    else {
      BOOL v32 = v31 == 0;
    }
    if (v32)
    {
      if (v30 == 2)
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100023EA0();
        }
        volumeName = self->_volumeName;
        v34 = @"Untitled";
        goto LABEL_43;
      }
    }
    else if ([v31 length])
    {
      volumeName = (NSString *)v14;
      v35 = +[NSString stringWithUTF8String:[(NSString *)volumeName bytes]];
      v36 = self->_volumeName;
      self->_volumeName = v35;

      v37 = self->_volumeName;
      if (v37)
      {
        if (![(NSString *)v37 isEqual:&stru_100038E98])
        {
LABEL_58:
          id v14 = 0;
LABEL_59:

          metaDataQueueNamePrefix = self->_metaDataQueueNamePrefix;
          v47 = [(LiveFSRawDevice *)self->_volumeRawDevice deviceName];
          v48 = +[NSString stringWithFormat:@"%@.%@.%@", metaDataQueueNamePrefix, v47, self->_volumeName];
          serialQueueName = self->_serialQueueName;
          self->_serialQueueName = v48;

          [(NSString *)self->_serialQueueName UTF8String];
          dispatch_queue_set_label_nocopy();
          v50 = [(LiveFSRawDevice *)self->_volumeRawDevice deviceName];
          v51 = +[NSString stringWithFormat:@"com.apple.filesystem.uvfs.dataIO.%@.%@", v50, self->_volumeName];
          concurrentQueueName = self->_concurrentQueueName;
          self->_concurrentQueueName = v51;

          [(NSString *)self->_concurrentQueueName UTF8String];
          dispatch_queue_set_label_nocopy();
          if (v11) {
            goto LABEL_15;
          }
LABEL_60:
          id v22 = 0;
          goto LABEL_61;
        }
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100023FDC();
        }
        v38 = @"Untitled";
      }
      else
      {
        v44 = (void *)userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100023F3C(volumeName, v44);
        }
        v38 = @"ERRORNAME";
      }
      v45 = self->_volumeName;
      self->_volumeName = &v38->isa;

      goto LABEL_58;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100023ED4();
    }
    volumeName = self->_volumeName;
    v34 = @"ERRORNAME";
LABEL_43:
    self->_volumeName = &v34->isa;
    goto LABEL_59;
  }
  unsigned int v13 = [(NSString *)self->_volumeName isEqualToString:@"Untitled"];
  id v14 = 0;
  if (!v7 && v13) {
    goto LABEL_24;
  }
  if (!v11) {
    goto LABEL_60;
  }
LABEL_15:
  dispatch_queue_t v15 = self->_rootNode;
  id v57 = 0;
  unsigned int v16 = [(liveFSNode *)v15 getFileSystemAttribute:@"_N_caps_format" andResult:&v57];
  id v17 = v57;
  v18 = v17;
  if (!v16)
  {
    id v19 = v17;
    self->volCapFormat = *(void *)[v19 bytes];

    v18 = 0;
  }
  v20 = self->_rootNode;
  id v56 = v18;
  unsigned int v21 = [(liveFSNode *)v20 getFileSystemAttribute:@"_N_caps_interfaces" andResult:&v56];
  id v22 = v56;

  if (!v21)
  {
    id v23 = v22;
    self->volCapInterfaces = *(void *)[v23 bytes];

    id v22 = 0;
  }
  self->syncTimerNeeded = (self->volCapFormat & 8) != 0;
  [(userFSVolume *)self createAppleDoubleManagerIfNeeded];
  uint64_t v24 = self->_rootNode;
  id v55 = 0;
  signed int v25 = [(liveFSNode *)v24 getFileSystemAttribute:@"_N_mntflags" andResult:&v55];
  id v26 = v55;
  objc_super v27 = v26;
  if (v25)
  {
    id v28 = v14;
LABEL_53:
    v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v25 userInfo:0];

    goto LABEL_62;
  }
  id v39 = v26;
  v40 = (uint64_t *)[v39 bytes];
  uint64_t v41 = *v40;
  self->_useKOIO = (*v40 & 0x40000000) != 0;
  if ((v41 & 0x40000000) != 0)
  {
    v42 = [(userFSVolume *)self grantLIFSKextAccessToFD];
    if (v42) {
      self->_useKOIO = 0;
    }
  }
  v43 = self->_rootNode;
  id v54 = v14;
  signed int v25 = [(liveFSNode *)v43 getFileSystemAttribute:@"_N_f_bsize" andResult:&v54];
  id v28 = v54;

  if (v25 || !v28)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100023E6C();
    }
    goto LABEL_53;
  }
  id v14 = v28;
  self->blockSize = *(void *)[v14 bytes];

LABEL_61:
  objc_storeStrong((id *)&self->_errorState, a4);

  v12 = 0;
LABEL_62:

  return v12;
}

- (userFSVolume)initWithDevice:(id)a3 fsType:(id)a4 volumeName:(id)a5 UVFSRootNode:(void *)a6 errorState:(id)a7 returnError:(id *)a8
{
  id v14 = a3;
  id obj = a4;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (*a8) {
    *a8 = 0;
  }
  v18 = [(userFSVolume *)self init];
  if (!v18) {
    goto LABEL_7;
  }
  id v34 = v15;
  id v19 = [v14 deviceName];
  v20 = +[NSString stringWithFormat:@"com.apple.%@.ostransaction", v19];
  uint64_t v21 = +[UserFSSleepManager getUserFSSleepManager];
  powerAssertManager = v18->_powerAssertManager;
  v18->_powerAssertManager = (UserFSSleepManager *)v21;

  id v33 = v20;
  [v33 UTF8String];
  uint64_t v23 = os_transaction_create();
  os_transaction = v18->_os_transaction;
  v18->_os_transaction = (OS_os_transaction *)v23;

  uint64_t v25 = +[NSString stringWithFormat:@"%@.%@.%@", v18->_metaDataQueueNamePrefix, v19, v16];
  serialQueueName = v18->_serialQueueName;
  v18->_serialQueueName = (NSString *)v25;

  [(NSString *)v18->_serialQueueName UTF8String];
  dispatch_queue_set_label_nocopy();
  uint64_t v27 = +[NSString stringWithFormat:@"com.apple.filesystem.uvfs.dataIO.%@.%@", v19, v16];
  concurrentQueueName = v18->_concurrentQueueName;
  v18->_concurrentQueueName = (NSString *)v27;

  [(NSString *)v18->_concurrentQueueName UTF8String];
  dispatch_queue_set_label_nocopy();
  objc_storeStrong((id *)&v18->_volumeRawDevice, a3);
  v18->_volumeDeviceFD = [v14 deviceFD];
  v18->_readOnly = [v14 deviceIsReadOnly];
  objc_storeStrong((id *)&v18->_volumeName, a5);
  objc_storeStrong((id *)&v18->_fsType, obj);
  v29 = [(userFSVolume *)v18 updateRootNode:a6 errorState:v17];
  if (!v29)
  {

    id v15 = v34;
LABEL_7:
    id v31 = v18;
    goto LABEL_8;
  }
  id v30 = v29;
  *a8 = v30;

  id v31 = 0;
  id v15 = v34;
LABEL_8:

  return v31;
}

+ (id)newWithDevice:(id)a3 fsType:(id)a4 volumeName:(id)a5 rootNode:(void *)a6 errorState:(id)a7 returnError:(id *)a8
{
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [objc_alloc((Class)a1) initWithDevice:v17 fsType:v16 volumeName:v15 UVFSRootNode:a6 errorState:v14 returnError:a8];

  return v18;
}

- (id)registerSpotlightNotifer
{
  v2 = self;
  id v3 = [objc_alloc((Class)CSLiveFSVolume) initWithVolumeName:self->_volumeName];
  v2 = (userFSVolume *)((char *)v2 + 648);
  v4 = *(void **)v2->LiveFSVolume_opaque;
  *(void *)v2->LiveFSVolume_opaque = v3;

  if (*(void *)v2->LiveFSVolume_opaque)
  {
    v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000240BC();
    }
    v5 = getNSErrorFromLiveFSErrno();
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024044();
  }

  return v5;
}

- (id)unregisterWithMounterService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%@", "com.apple.filesystems.userfsd", self->_volumeName];
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024158();
  }
  id v5 = +[LiveFSMountClient newClientForProvider:@"com.apple.filesystems.UserFS.FileProvider"];
  v6 = v5;
  if (v5) {
    [v5 unmountVolume:v4 how:v3];
  }
  else {
  unint64_t v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:61 userInfo:0];
  }
  if (v7 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000240F0();
  }

  return v7;
}

- (void)unregisterWithLiveFSService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10000B7D4;
  unsigned int v13 = sub_10000B7E4;
  id v14 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000242A0();
  }
  uint64_t v5 = [(id)masterService forgetVolume:self->_volumeName withFlags:v3];
  v6 = (void *)v10[5];
  v10[5] = v5;

  if (v10[5] && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100024230();
  }
  volumeName = self->_volumeName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B7EC;
  v8[3] = &unk_100038768;
  v8[4] = &v9;
  [(id)externalVolumeLiveFSService ejectVolume:volumeName usingFlags:v3 reply:v8];
  if (v10[5] && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000241C0();
  }
  _Block_object_dispose(&v9, 8);
}

- (void)purgeNameToFHTable
{
  uint64_t v3 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024318((uint64_t)self, v3);
  }
  pthread_rwlock_wrlock(&self->mountNameToNodeCacheLock);
  [(NSMutableDictionary *)self->mountNameToNodeCache removeAllObjects];
  pthread_rwlock_unlock(&self->mountNameToNodeCacheLock);
}

- (void)purgeFHToNodeTable
{
  uint64_t v3 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000243F4((uint64_t)self, v3);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->mountFHtoNodeTable;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->mountFHtoNodeTable objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v8)];
        int v10 = v9;
        if (v9 == self->_rootNode)
        {
          id v14 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000243B4(&v15, v16, v14);
          }
        }
        else
        {
          unsigned int v11 = [(liveFSNode *)v9 reclaim];
          if (v11)
          {
            unsigned int v12 = v11;
            unsigned int v13 = userfs_log_default;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v22 = v10;
              __int16 v23 = 1024;
              unsigned int v24 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "LFM: purgeFHToNodeTable: error reclaiming state for node %@: %d", buf, 0x12u);
            }
          }
        }

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->mountFHtoNodeTable removeAllObjects];
}

- (BOOL)getNodeFromFileID:(unint64_t)a3 outNode:(id *)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->mountFHtoNodeTable;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = -[NSMutableDictionary objectForKey:](self->mountFHtoNodeTable, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v11), (void)v16);
        if (objc_msgSend(v12, "lfn_fileid") == (id)a3)
        {
          id v14 = v12;
          *a4 = v14;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000244F8((uint64_t)v14, a3);
          }

          LOBYTE(v13) = 1;
          return v13;
        }

        unsigned int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    sub_100024490();
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)purgeMappingTables
{
  [(userFSVolume *)self purgeNameToFHTable];

  [(userFSVolume *)self purgeFHToNodeTable];
}

- (void)unmount:(unsigned int)a3
{
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024630();
  }
  id v5 = [(userFSVolume *)self metaDataRequests];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BE88;
  block[3] = &unk_100038668;
  block[4] = self;
  dispatch_sync(v5, block);

  dispatch_group_wait((dispatch_group_t)self->_searchGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000245FC();
  }
  id v6 = [(userFSVolume *)self metaDataRequests];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BEE0;
  v9[3] = &unk_1000387F8;
  v9[4] = self;
  unsigned int v10 = a3;
  dispatch_sync(v6, v9);

  if (self->_useKOIO) {
    id v7 = [(userFSVolume *)self revokeLIFSKextAccessToFD];
  }
  [(LiveFSRawDevice *)self->_volumeRawDevice unloadVolume:self];
  volumeRawDevice = self->_volumeRawDevice;
  self->_volumeRawDevice = 0;

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024568();
  }
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->mountNameToNodeCacheLock);
  v3.receiver = self;
  v3.super_class = (Class)userFSVolume;
  [(userFSVolume *)&v3 dealloc];
}

- (void)createAppleDoubleManagerIfNeeded
{
  if ((self->volCapInterfaces & 0x4000) != 0)
  {
    id v6 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10002482C(v6);
    }
  }
  else
  {
    objc_super v3 = +[LiveFSAppleDoubleManager AppleDoubleManagerForMount:self];
    appleDoubleManager = self->_appleDoubleManager;
    self->_appleDoubleManager = v3;

    id v5 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100024794(v5);
    }
    self->volCapInterfaces &= ~0x40000uLL;
  }
}

- (BOOL)isDCIM
{
  id v3 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/Frameworks/ImageCaptureCore.framework/DeviceMatchingInfo.plist"];
  v37 = v3;
  if (v3)
  {
    v36 = [v3 objectForKey:@"cameraClasses"];
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x3032000000;
    id v56 = sub_10000B7D4;
    id v57 = sub_10000B7E4;
    id v58 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    int v52 = 0;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100024A40();
    }
    id v4 = [(userFSVolume *)self rootNode];
    id v5 = [v4 getFH];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000C724;
    v48[3] = &unk_100038820;
    v48[4] = &v49;
    v48[5] = &v53;
    [(userFSVolume *)self otherAttributeOf:v5 named:@"_S_f_type" requestID:-1 reply:v48];

    if (*((_DWORD *)v50 + 6) || !v54[5])
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100024970();
      }
      char v6 = 0;
      id v7 = 0;
      id v8 = 0;
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v45 = 0u;
      long long v44 = 0u;
      id v19 = v36;
      id v7 = [v19 countByEnumeratingWithState:&v44 objects:v62 count:16];
      if (v7)
      {
        uint64_t v20 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v45 != v20) {
              objc_enumerationMutation(v19);
            }
            id v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            __int16 v23 = [v22 objectForKey:@"class"];
            unsigned int v24 = [v23 isEqualToString:@"ExFATCameraDeviceManager"];

            if (v24)
            {
              id v7 = [v22 objectForKey:@"volumeInfo"];
              goto LABEL_28;
            }
          }
          id v7 = [v19 countByEnumeratingWithState:&v44 objects:v62 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_28:

      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000249D8();
      }
      if (!v7)
      {
        id v7 = +[NSArray arrayWithObject:@"DCIM"];
      }
      id v43 = 0;
      id v25 = [(userFSVolume *)self newConnectionIDOrError:&v43];
      id v26 = v43;
      if (!v26)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v7 = v7;
        id v27 = [v7 countByEnumeratingWithState:&v39 objects:v61 count:16];
        if (v27)
        {
          uint64_t v29 = *(void *)v40;
          *(void *)&long long v28 = 138412290;
          long long v35 = v28;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v40 != v29) {
                objc_enumerationMutation(v7);
              }
              uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
              BOOL v32 = userfs_log_default;
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v35;
                uint64_t v60 = v31;
                _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "isDCIM: LILookup(%@)", buf, 0xCu);
              }
              id v33 = [(userFSVolume *)self rootNode];
              id v34 = [v33 getFH];
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472;
              v38[2] = sub_10000C8B0;
              v38[3] = &unk_100038848;
              v38[4] = &v49;
              [(userFSVolume *)self lookupin:v34 name:v31 forClient:v25 usingFlags:0 requestID:-1 reply:v38];

              if (!*((_DWORD *)v50 + 6))
              {
                [(userFSVolume *)self invalidateFileNodesForConnection:v25];
                [(userFSVolume *)self releaseConnectionAllocation:v25];
                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
                  sub_1000249A4();
                }

                char v6 = 0;
                id v8 = 0;
                goto LABEL_48;
              }
            }
            id v27 = [v7 countByEnumeratingWithState:&v39 objects:v61 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        [(userFSVolume *)self invalidateFileNodesForConnection:v25];
        [(userFSVolume *)self releaseConnectionAllocation:v25];
        id v8 = 0;
        char v6 = 1;
LABEL_48:
        BOOL v9 = 1;
LABEL_9:
        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(&v53, 8);

        if ((v6 & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      id v8 = v26;
      char v6 = 0;
    }
    BOOL v9 = 0;
    goto LABEL_9;
  }
  unsigned int v10 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000248F8(v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_13:
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000248C4();
  }
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (BOOL)pauseIOQueue
{
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)&self->ioQueuePausedCount, 1u);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100024DCC();
    if (add) {
      goto LABEL_6;
    }
  }
  else if (add)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024D98();
  }
  dispatch_group_wait((dispatch_group_t)self->_IOGroup, 0xFFFFFFFFFFFFFFFFLL);
LABEL_6:
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024D64();
  }
  return 1;
}

- (void)resumeIOQueue
{
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024E38();
  }
}

- (void)insertIntoFHCache:(id)a3
{
  id v4 = a3;
  mountFHtoNodeTable = self->mountFHtoNodeTable;
  char v6 = objc_msgSend(v4, "lfn_fh");
  [(NSMutableDictionary *)mountFHtoNodeTable setObject:v4 forKeyedSubscript:v6];

  id v7 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v8 = self->mountFHtoNodeTable;
    BOOL v9 = v7;
    unsigned int v10 = objc_msgSend(v4, "lfn_fh");
    uint64_t v11 = objc_msgSend(v4, "lfn_name");
    int v12 = 134219010;
    uint64_t v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2048;
    id v21 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "LFV[%p]: FHCache[%p]: + fh[%@] => %@[%p]", (uint8_t *)&v12, 0x34u);
  }
}

- (void)removeFromFHCache:(id)a3
{
  id v4 = a3;
  if ([v4 getLinkCount] <= 1)
  {
    mountFHtoNodeTable = self->mountFHtoNodeTable;
    char v6 = objc_msgSend(v4, "lfn_fh");
    [(NSMutableDictionary *)mountFHtoNodeTable removeObjectForKey:v6];

    id v7 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v8 = self->mountFHtoNodeTable;
      BOOL v9 = v7;
      unsigned int v10 = objc_msgSend(v4, "lfn_fh");
      uint64_t v11 = objc_msgSend(v4, "lfn_name");
      int v12 = 134219010;
      uint64_t v13 = self;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "LFV[%p]: FHCache[%p]: - fh[%@] => name[%p]:[%@]", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (id)getNodeForFH:(id)a3 withError:(int *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v5 = [(NSMutableDictionary *)self->mountFHtoNodeTable objectForKeyedSubscript:a3];
  char v6 = v5;
  if (a4 && !v5) {
    goto LABEL_5;
  }
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "lfn_parent");
    if (v7)
    {
      id v8 = (void *)v7;
      BOOL v9 = objc_msgSend(v6, "lfn_name");
      unsigned int v10 = [v9 isEqualToString:&stru_100038E98];

      if (a4)
      {
        if (v10) {
LABEL_5:
        }
          *a4 = 70;
      }
    }
  }

  return v6;
}

- (id)getFileSystemRepresentation:(id)a3 error:(int *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[NSMutableData dataWithLength:1025];
    id v8 = [(userFSVolume *)self volumeRawDevice];
    BOOL v9 = [v8 fsPlugin];
    if ([v9 FSOps])
    {
      unsigned int v10 = [(userFSVolume *)self volumeRawDevice];
      uint64_t v11 = [v10 fsPlugin];
      uint64_t v12 = *((void *)[v11 FSOps] + 39);

      if (v12)
      {
        uint64_t v13 = [(userFSVolume *)self volumeRawDevice];
        __int16 v14 = [v13 fsPlugin];
        uint64_t v15 = (uint64_t (*)(id, id, uint64_t, BOOL))*((void *)[v14 FSOps] + 39);
        id v32 = v6;
        id v16 = [v32 UTF8String];
        id v17 = v7;
        int v18 = v15(v16, [v17 bytes], 1025, -[userFSVolume isCaseSensitive](self, "isCaseSensitive"));

        if (v18)
        {
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100024F1C();
            if (!a4) {
              goto LABEL_8;
            }
          }
          else if (!a4)
          {
LABEL_8:
            id v19 = v32;
LABEL_19:
            long long v28 = v19;

            goto LABEL_20;
          }
          *a4 = v18;
          goto LABEL_8;
        }
        id v30 = [v17 bytes];
LABEL_18:
        id v19 = +[NSString stringWithUTF8String:v30];
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v29 = v7;
    if ((objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", objc_msgSend(v29, "bytes"), 1025) & 1) == 0)
    {
      id v19 = v6;
      goto LABEL_19;
    }
    id v30 = [v29 bytes];
    goto LABEL_18;
  }
  __int16 v20 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100024EA4(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  long long v28 = 0;
  if (a4) {
    *a4 = 22;
  }
LABEL_20:

  return v28;
}

- (void)insertIntoNameCache:(id)a3 withParent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v7, "lfn_name");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(userFSVolume *)self insertIntoNameCache:v7 withParent:v6 withName:v8];
}

- (void)insertIntoNameCache:(id)a3 withParent:(id)a4 withName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v17 = 0;
  p_mountNameToNodeCacheLock = &self->mountNameToNodeCacheLock;
  pthread_rwlock_wrlock(&self->mountNameToNodeCacheLock);
  uint64_t v12 = [(userFSVolume *)self getFileSystemRepresentation:v10 error:&v17];
  if (v12)
  {
    mountNameToNodeCache = self->mountNameToNodeCache;
    __int16 v14 = objc_msgSend(v9, "lfn_fh");
    id v15 = +[LiveFSItemPair newWithParent:v14 fname:v12 caseSensitivity:[(userFSVolume *)self isCaseSensitive]];
    [(NSMutableDictionary *)mountNameToNodeCache setObject:v8 forKeyedSubscript:v15];
  }
  else
  {
    id v16 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v19 = "-[userFSVolume insertIntoNameCache:withParent:withName:]";
      __int16 v20 = 1024;
      int v21 = v17;
      __int16 v22 = 2048;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: getFileSystemRepresentation error:%d:node:%p:name:%@.", buf, 0x26u);
    }
  }
  pthread_rwlock_unlock(p_mountNameToNodeCacheLock);
}

- (void)removeFromNameCache:(id)a3 withParent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v7, "lfn_name");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(userFSVolume *)self removeFromNameCache:v7 withParent:v6 withName:v8];
}

- (void)removeFromNameCache:(id)a3 withParent:(id)a4 withName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v38 = 0;
  p_mountNameToNodeCacheLock = &self->mountNameToNodeCacheLock;
  pthread_rwlock_wrlock(&self->mountNameToNodeCacheLock);
  uint64_t v12 = [(userFSVolume *)self getFileSystemRepresentation:v10 error:&v38];
  if (v12)
  {
    mountNameToNodeCache = self->mountNameToNodeCache;
    __int16 v14 = objc_msgSend(v9, "lfn_fh");
    id v15 = +[LiveFSItemPair newWithParent:v14 fname:v12 caseSensitivity:[(userFSVolume *)self isCaseSensitive]];
    [(NSMutableDictionary *)mountNameToNodeCache removeObjectForKey:v15];

    if ([v8 getLinkCount] >= 2)
    {
      id v30 = v12;
      uint64_t v31 = &self->mountNameToNodeCacheLock;
      id v32 = v10;
      id v33 = v9;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v16 = self->mountNameToNodeCache;
      id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            int v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->mountNameToNodeCache, "objectForKey:", v21, v30, v31, v32, v33, (void)v34);
            id v22 = (id)objc_claimAutoreleasedReturnValue();

            if (v22 == v8)
            {
              id v23 = [v21 itemId];
              __int16 v24 = [(userFSVolume *)self getNodeForFH:v23 withError:&v38];

              if (!v38 && v24)
              {
                uint64_t v26 = [v21 filename];
                [v8 updateName:v26 andParent:v24];

                uint64_t v27 = (void *)userfs_log_default;
                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
                {
                  long long v28 = v27;
                  id v29 = [v21 filename];
                  *(_DWORD *)buf = 134218498;
                  long long v41 = (const char *)v8;
                  __int16 v42 = 2112;
                  *(void *)id v43 = v29;
                  *(_WORD *)&v43[8] = 2048;
                  *(void *)&v43[10] = v24;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "removeFromNameCache: liveFSNode [%p] name [%@] and parent [%p] were updated", buf, 0x20u);
                }
                id v10 = v32;
                id v9 = v33;
                uint64_t v12 = v30;
                p_mountNameToNodeCacheLock = v31;
                goto LABEL_21;
              }
            }
          }
          id v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v10 = v32;
      id v9 = v33;
      uint64_t v12 = v30;
      p_mountNameToNodeCacheLock = v31;
    }
    objc_msgSend(v8, "updateName:andParent:", &stru_100038E98, 0, v30, v31, v32, v33);
  }
  else
  {
    id v25 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v41 = "-[userFSVolume removeFromNameCache:withParent:withName:]";
      __int16 v42 = 1024;
      *(_DWORD *)id v43 = v38;
      *(_WORD *)&v43[4] = 2048;
      *(void *)&v43[6] = v8;
      *(_WORD *)&v43[14] = 2112;
      *(void *)&v43[16] = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: getFileSystemRepresentation error:%d:node:%p:name:%@.", buf, 0x26u);
    }
  }
LABEL_21:
  pthread_rwlock_unlock(p_mountNameToNodeCacheLock);
}

- (id)lookupWithParent:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v16 = 0;
  p_mountNameToNodeCacheLock = &self->mountNameToNodeCacheLock;
  pthread_rwlock_rdlock(&self->mountNameToNodeCacheLock);
  id v9 = [(userFSVolume *)self getFileSystemRepresentation:v7 error:&v16];
  if (v9)
  {
    mountNameToNodeCache = self->mountNameToNodeCache;
    uint64_t v11 = objc_msgSend(v6, "lfn_fh");
    id v12 = +[LiveFSItemPair newWithParent:v11 fname:v9 caseSensitivity:[(userFSVolume *)self isCaseSensitive]];
    uint64_t v13 = [(NSMutableDictionary *)mountNameToNodeCache objectForKeyedSubscript:v12];
  }
  else
  {
    __int16 v14 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v18 = "-[userFSVolume lookupWithParent:andName:]";
      __int16 v19 = 1024;
      int v20 = v16;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: getFileSystemRepresentation error:%d:parent:%p:name:%@.", buf, 0x26u);
    }
    uint64_t v13 = 0;
  }
  pthread_rwlock_unlock(p_mountNameToNodeCacheLock);

  return v13;
}

- (BOOL)supportsPersistentObjectIdentifier
{
  return self->volCapFormat & 1;
}

- (BOOL)supportsHardLinks
{
  return (LOBYTE(self->volCapFormat) >> 2) & 1;
}

- (BOOL)isCaseSensitive
{
  return BYTE1(self->volCapFormat) & 1;
}

- (unint64_t)getNextObjectIdentifier
{
  return (int)atomic_fetch_add(&self->nextFileID, 1u);
}

- (char)pathStringForNode:(id)a3 name:(id)a4 buffer:(char *)a5 bufferSize:(unint64_t)a6 outLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [(userFSVolume *)self rootNode];
  id v15 = v12;
  id v16 = v15;
  if (v13 || v14 != v15)
  {
    id v32 = v15;
    if (v13)
    {
      id v18 = v13;
    }
    else
    {
      objc_msgSend(v15, "lfn_name");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if ([v19 isEqualToString:&stru_100038E98])
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100024F90();
        }
        id v13 = 0;
        id v17 = v16;
        goto LABEL_29;
      }
      id v18 = v19;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100025070();
    }
    BOOL v20 = v13 != 0;
    uint64_t v31 = &a5[a6];
    if (!v13 && v14 == v16)
    {
      id v17 = v16;
      __int16 v21 = &a5[a6];
      id v19 = v18;
LABEL_24:
      long long v28 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        id v34 = v32;
        __int16 v35 = 2080;
        long long v36 = v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "pathToStringForNode:%p path:\"%s\"", buf, 0x16u);
      }
      id v13 = 0;
      *a7 = (unint64_t)&v31[~(unint64_t)v21];
      goto LABEL_30;
    }
    id v30 = a7;
    char v22 = 0;
    id v17 = v16;
    __int16 v23 = &a5[a6];
    while (1)
    {
      id v19 = v18;
      id v24 = (const char *)[v19 UTF8String];
      if (!v24) {
        break;
      }
      id v25 = v24;
      size_t v26 = strlen(v24);
      BOOL v27 = a6 >= v26 + 1;
      a6 -= v26 + 1;
      if (!v27) {
        goto LABEL_29;
      }
      __int16 v21 = &v23[~v26];
      strlcpy(v21, v25, v26 + 1);
      *(v23 - 1) = v22;
      if (!v20)
      {
        objc_msgSend(v17, "lfn_parent");
        id v13 = v17;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v17, "lfn_name");
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v20 = 0;
      id v13 = 0;
      char v22 = 47;
      __int16 v23 = v21;
      if (v17 == v14)
      {
        id v19 = v18;
        id v17 = v14;
        a7 = v30;
        goto LABEL_24;
      }
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100024FF8();
    }
LABEL_29:
    __int16 v21 = 0;
LABEL_30:

    a5 = v21;
    id v16 = v32;
    goto LABEL_31;
  }
  *a5 = 0;
  *a7 = 0;
  id v17 = v15;
LABEL_31:

  return a5;
}

- (void)startSyncerIfNeeded
{
  if (self->syncTimerNeeded && !self->syncTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_metaDataRequests);
    syncTimer = self->syncTimer;
    self->syncTimer = v3;

    dispatch_source_set_timer((dispatch_source_t)self->syncTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = self->syncTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000DE9C;
    handler[3] = &unk_100038668;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume((dispatch_object_t)self->syncTimer);
    id v6 = self->syncTimer;
    dispatch_time_t v7 = dispatch_time(0, 200000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100025154();
    }
  }
  else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_1000250D8();
  }
}

- (id)grantLIFSKextAccessToFD
{
  if (self->volumeDeviceGranted)
  {
    v2 = 0;
  }
  else
  {
    unsigned int v4 = [(LiveFSServiceUserClient *)self->_kernelUserClient openFileDescriptorForKernel:self->_volumeDeviceFD flags:2 * !self->_readOnly];
    if (v4)
    {
      signed int v5 = v4;
      id v6 = [(userFSVolume *)self volumeRawDevice];
      unsigned int v7 = [v6 deviceIsFile];

      if (v7)
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000251BC();
        }
      }
      else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100025230();
      }
      v2 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v5 userInfo:0];
    }
    else
    {
      v2 = 0;
      self->volumeDeviceGranted = 1;
    }
  }

  return v2;
}

- (id)revokeLIFSKextAccessToFD
{
  if (self->volumeDeviceGranted)
  {
    unsigned int v3 = [(LiveFSServiceUserClient *)self->_kernelUserClient closeFileDescriptorForKernel:self->_volumeDeviceFD];
    if (v3)
    {
      signed int v4 = v3;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000252B0();
      }
      signed int v5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v4 userInfo:0];
    }
    else
    {
      signed int v5 = 0;
      self->volumeDeviceGranted = 0;
    }
  }
  else
  {
    signed int v5 = 0;
  }

  return v5;
}

- (void)revokeDeviceIfNeeded
{
  if (self->volumeDeviceGranted) {
    id v2 = [(userFSVolume *)self revokeLIFSKextAccessToFD];
  }
}

- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4
{
  signed int v5 = (void (**)(id, void, id))a4;
  id v6 = [(userFSVolume *)self errorState];

  if (v6)
  {
    id v7 = [(userFSVolume *)self errorState];
    v5[2](v5, 0, v7);
  }
  else
  {
    id v7 = [(liveFSNode *)self->_rootNode getFH];
    ((void (**)(id, id, id))v5)[2](v5, v7, 0);
  }
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  unsigned int v14 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10002538C();
  }
  id v9 = [(userFSVolume *)self getNodeForFH:v7 withError:&v14];
  id v10 = v9;
  uint64_t v11 = 0;
  if (!v14 && v9)
  {
    unsigned int v12 = [v9 getDeviceFD];
    if (v12 != -1) {
      [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    }
    uint64_t v11 = [v10 getAttrData];
    if (!v11)
    {
      unsigned int v14 = 5;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100025324();
      }
    }
    if (v12 != -1) {
      [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    }
  }
  id v13 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v7;
    __int16 v17 = 1024;
    unsigned int v18 = v14;
    __int16 v19 = 2048;
    BOOL v20 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LIGetAttr(%@): reply(%d, %p)", buf, 0x1Cu);
  }
  v8[2](v8, v14, v11);
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v28 = a4;
  id v10 = (void (**)(id, void, id, id, id, void *, id, uint64_t, void *))a6;
  unsigned int v31 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000254BC();
  }
  BOOL v27 = v9;
  uint64_t v11 = [(userFSVolume *)self getNodeForFH:v9 withError:&v31];
  unsigned int v12 = (void *)v11;
  id v13 = 0;
  uint64_t v14 = 2;
  id v15 = 0;
  id v16 = 0;
  __int16 v17 = 0;
  id v18 = 0;
  id v19 = 0;
  if (!v31 && v11)
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v30 = 0;
    unsigned int v20 = [v12 setAttributeTo:v28 withResultingAttribute:&v30];
    id v19 = v30;
    unsigned int v31 = v20;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (v31 || !v19)
    {

      id v13 = 0;
      id v15 = 0;
      id v16 = 0;
      __int16 v17 = 0;
      id v18 = 0;
      id v19 = 0;
      goto LABEL_22;
    }
    [(userFSVolume *)self startSyncerIfNeeded];
    if (self->_spotlightIsEnabled)
    {
      uint64_t v29 = 0;
      __int16 v21 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000253F4((uint64_t)v27, v12, v21);
      }
      char v22 = [(userFSVolume *)self pathStringForNode:v12 name:0 buffer:buf bufferSize:1024 outLength:&v29];
      if (v22) {
        [(CSLiveFSVolume *)self->_spotlightNotifer sendEventOfType:2 pid:0 path:v22 pathLength:v29 attributes:v19];
      }
    }
    id v15 = objc_msgSend(v12, "lfn_interestedClients");
    uint64_t v14 = (uint64_t)[v12 hiddenStatus];
    if (v15)
    {
      objc_msgSend(v12, "lfn_parent");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        __int16 v23 = objc_msgSend(v12, "lfn_parent");
        id v18 = objc_msgSend(v23, "lfn_interestedClients");

        if (v18)
        {
          id v24 = objc_msgSend(v12, "lfn_parent");
          objc_msgSend(v24, "lfn_fh");
          id v18 = (id)objc_claimAutoreleasedReturnValue();

          id v25 = objc_msgSend(v12, "lfn_parent");
          id v16 = objc_msgSend(v25, "lfn_interestedClients");

          __int16 v17 = objc_msgSend(v12, "lfn_name");
        }
        else
        {
          id v16 = 0;
          __int16 v17 = 0;
        }
        goto LABEL_19;
      }
    }
    else
    {
      id v16 = 0;
    }
    __int16 v17 = 0;
    id v18 = 0;
LABEL_19:
    if ((*((unsigned char *)[v28 bytes] + 8) & 0x40) != 0)
    {
      id v13 = [(userFSVolume *)self getFreeSpaceInVolume];
    }
    else
    {
      id v13 = 0;
    }
  }
LABEL_22:
  size_t v26 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    unsigned int v33 = v31;
    __int16 v34 = 2048;
    id v35 = v19;
    __int16 v36 = 2048;
    id v37 = v15;
    __int16 v38 = 1024;
    int v39 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "LISetAttr: reply(%d, %p, %#llx, %d)", buf, 0x22u);
  }
  v10[2](v10, v31, v19, v18, v16, v17, v15, v14, v13);
}

- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  unsigned int v54 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025524();
  }
  uint64_t v16 = [(userFSVolume *)self getNodeForFH:v13 withError:&v54];
  long long v40 = (void *)v16;
  long long v41 = v13;
  if (v54)
  {
    id v17 = 0;
    id v18 = 0;
    id v19 = 0;
    id v20 = 0;
    id v21 = 0;
    id v22 = 0;
LABEL_16:
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  __int16 v23 = (void *)v16;
  if ([v14 length] == (id)1 && !objc_msgSend(v14, "compare:", @"."))
  {
    unsigned int v54 = 0;
    id v25 = v23;
  }
  else
  {
    if ([v14 length] != (id)2 || objc_msgSend(v14, "compare:", @".."))
    {
      [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
      id v53 = 0;
      unsigned int v24 = [v23 lookup:v14 withResultingNode:&v53];
      id v22 = v53;
      unsigned int v54 = v24;
      [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
      goto LABEL_14;
    }
    size_t v26 = objc_msgSend(v23, "lfn_parent");

    if (!v26)
    {
      id v17 = 0;
      id v18 = 0;
      id v19 = 0;
      id v20 = 0;
      id v21 = 0;
      id v22 = 0;
      unsigned int v54 = 22;
      goto LABEL_16;
    }
    unsigned int v54 = 0;
    objc_msgSend(v23, "lfn_parent");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v22 = v25;
LABEL_14:
  if (v54)
  {
    id v17 = 0;
    id v18 = 0;
    id v19 = 0;
    id v20 = 0;
    id v21 = 0;
    goto LABEL_16;
  }
  [v22 getFH];
  unint64_t v29 = a5;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [v22 getAttrData];
  unint64_t v35 = v29;
  objc_msgSend(v22, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v22, "lfn_inUseClientSet") | v29);
  unsigned int v37 = a6;
  if ((a6 & 0x20000000) != 0)
  {
    uint64_t v30 = +[NSString stringWithFormat:@"._%@", v14];
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v52 = 0;
    __int16 v34 = (void *)v30;
    uint64_t v27 = (uint64_t)[v23 lookup:v30 withResultingNode:&v52];
    id v21 = v52;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    id v18 = 0;
    id v20 = 0;
    if (!v27)
    {
      id v20 = [v21 getFH];
      id v18 = [v21 getAttrData];
      objc_msgSend(v21, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v21, "lfn_inUseClientSet") | v35);
    }
  }
  else
  {
    id v18 = 0;
    id v20 = 0;
    id v21 = 0;
    uint64_t v27 = 0xFFFFFFFFLL;
  }
  if ((v37 & 0x10000000) != 0)
  {
    id v31 = v17;
    uint64_t v38 = *((void *)[v31 bytes] + 6);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10000ED30;
    v42[3] = &unk_100038870;
    id v43 = v41;
    id v44 = v14;
    id v19 = v19;
    id v45 = v19;
    id v17 = v31;
    id v46 = v17;
    id v49 = v15;
    unsigned int v50 = v54;
    int v51 = v27;
    id v20 = v20;
    id v47 = v20;
    id v18 = v18;
    id v48 = v18;
    -[userFSVolume blockmapFile:range:startIO:flags:operationID:reply:](self, "blockmapFile:range:startIO:flags:operationID:reply:", v19, 0, v38, 0, 8449, 0, v42);

    goto LABEL_20;
  }
LABEL_17:
  id v28 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v39 = v54;
    id v36 = v19;
    id v32 = v28;
    id v33 = [v36 UTF8String];
    *(_DWORD *)buf = 138413570;
    id v56 = v41;
    __int16 v57 = 2112;
    id v58 = v14;
    __int16 v59 = 1024;
    unsigned int v60 = v39;
    __int16 v61 = 1024;
    int v62 = v27;
    __int16 v63 = 2080;
    id v64 = v33;
    __int16 v65 = 2048;
    id v66 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "LILookup(%@/%@): reply(%d, %d, %s, %p)", buf, 0x36u);
  }
  (*((void (**)(id, void, uint64_t, id, id, id, id, void, void, void))v15 + 2))(v15, v54, v27, v19, v17, v20, v18, 0, 0, 0);
LABEL_20:
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id, id))a5;
  unsigned int v21 = 0;
  uint64_t v20 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025610();
  }
  uint64_t v9 = [(userFSVolume *)self getNodeForFH:v7 withError:&v21];
  id v10 = (void *)v9;
  id v11 = 0;
  if (v21)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
    if (v9)
    {
      id v13 = malloc_type_calloc(1uLL, 0x1001uLL, 0xC697B8B7uLL);
      if (v13)
      {
        id v14 = v13;
        [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
        id v19 = 0;
        unsigned int v15 = [v10 readSymLinkDataInto:v14 ofSize:4096 withSymLinkDataSize:&v20 andWithSymLinkAttrData:&v19];
        id v12 = v19;
        unsigned int v21 = v15;
        [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
        id v11 = 0;
        if (!v21)
        {
          id v16 = objc_alloc((Class)NSString);
          id v11 = [v16 initWithBytes:v14 length:v20 encoding:4];
          if (!v11)
          {
            id v17 = userfs_log_default;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
              sub_10002558C(v17);
            }
            id v11 = 0;
            unsigned int v21 = 5;
          }
        }
        free(v14);
      }
      else
      {
        id v11 = 0;
        id v12 = 0;
      }
    }
  }
  id v18 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v7;
    __int16 v24 = 1024;
    unsigned int v25 = v21;
    __int16 v26 = 2048;
    id v27 = v11;
    __int16 v28 = 2048;
    id v29 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "LIReadLink(%@): reply(%d, %p, %p)", buf, 0x26u);
  }
  v8[2](v8, v21, v11, v12);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)LIRead:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  +[NSMutableData dataWithLength:a4];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000F21C;
  v14[3] = &unk_100038898;
  id v16 = v10;
  unint64_t v17 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v10;
  id v13 = v15;
  [(userFSVolume *)self LIRead:v11 atOffset:a5 withBuffer:v13 reply:v14];
}

- (void)LIRead:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  int v25 = 0;
  id v12 = [(userFSVolume *)self getNodeForFH:a3 withError:&v25];
  id v13 = v12;
  if (v25)
  {
    v11[2](v11);
  }
  else
  {
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10000F4AC;
    id v19 = &unk_1000388C0;
    id v20 = v12;
    unint64_t v24 = a4;
    id v21 = v10;
    id v22 = self;
    id v23 = v11;
    id v14 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v16);
    if (dispatchAsyncConcurentLiveItemIO)
    {
      unsigned int v15 = atomic_load(&self->ioQueuePausedCount);
      if (v15 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100025678();
      }
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v16, v17, v18, v19, v20, v21, v22);
      dispatch_group_async((dispatch_group_t)self->_IOGroup, (dispatch_queue_t)self->_IORequests, v14);
    }
    else
    {
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v16, v17, v18, v19, v20, v21, v22);
      v14[2](v14);
    }
  }
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  int v25 = 0;
  id v12 = [(userFSVolume *)self getNodeForFH:a3 withError:&v25];
  id v13 = v12;
  if (v25)
  {
    v11[2](v11);
  }
  else
  {
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10000F708;
    id v19 = &unk_1000388C0;
    id v20 = v12;
    unint64_t v24 = a4;
    id v21 = v10;
    id v22 = self;
    id v23 = v11;
    id v14 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v16);
    if (dispatchAsyncConcurentLiveItemIO)
    {
      unsigned int v15 = atomic_load(&self->ioQueuePausedCount);
      if (v15 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100025678();
      }
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v16, v17, v18, v19, v20, v21, v22);
      dispatch_group_async((dispatch_group_t)self->_IOGroup, (dispatch_queue_t)self->_IORequests, v14);
    }
    else
    {
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v16, v17, v18, v19, v20, v21, v22);
      v14[2](v14);
    }
  }
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  unsigned int v15 = (void (**)(void))a8;
  int v33 = 0;
  id v16 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    unint64_t v35 = "-[userFSVolume blockmapFile:range:startIO:flags:operationID:reply:]";
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 1024;
    int v39 = a5;
    __int16 v40 = 1024;
    unsigned int v41 = a6;
    __int16 v42 = 2048;
    unint64_t v43 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s(%@): startIO = %u, flags = 0x%x, opID = %llu.", buf, 0x2Cu);
  }
  uint64_t v17 = [(userFSVolume *)self getNodeForFH:v14 withError:&v33];
  id v18 = v17;
  if (v33)
  {
    v15[2](v15);
  }
  else
  {
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_10000FA60;
    unint64_t v24 = &unk_1000388E8;
    unsigned int v31 = a6;
    NSUInteger v28 = location;
    NSUInteger v29 = length;
    int v32 = a5;
    unint64_t v30 = a7;
    id v25 = v17;
    __int16 v26 = self;
    id v27 = v15;
    id v19 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v21);
    if (dispatchAsyncConcurentLiveItemIO)
    {
      unsigned int v20 = atomic_load(&self->ioQueuePausedCount);
      if (v20 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100025678();
      }
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v21, v22, v23, v24, v25, v26);
      dispatch_group_async((dispatch_group_t)self->_IOGroup, (dispatch_queue_t)self->_IORequests, v19);
    }
    else
    {
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v21, v22, v23, v24, v25, v26);
      v19[2](v19);
    }
  }
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  unsigned int v15 = (void (**)(void))a8;
  int v33 = 0;
  id v16 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v35 = "-[userFSVolume endIO:range:status:flags:operationID:reply:]";
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 1024;
    int v39 = a5;
    __int16 v40 = 2048;
    unint64_t v41 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s(%@): ioStatus = %u, opID = %llu.", buf, 0x26u);
  }
  uint64_t v17 = [(userFSVolume *)self getNodeForFH:v14 withError:&v33];
  id v18 = v17;
  if (v33)
  {
    v15[2](v15);
  }
  else
  {
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_10000FDF0;
    unint64_t v24 = &unk_1000388E8;
    NSUInteger v28 = location;
    NSUInteger v29 = length;
    int v31 = a5;
    unsigned int v32 = a6;
    unint64_t v30 = a7;
    id v25 = v17;
    __int16 v26 = self;
    id v27 = v15;
    id v19 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v21);
    if (dispatchAsyncConcurentLiveItemIO)
    {
      unsigned int v20 = atomic_load(&self->ioQueuePausedCount);
      if (v20 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100025678();
      }
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v21, v22, v23, v24, v25, v26);
      dispatch_group_async((dispatch_group_t)self->_IOGroup, (dispatch_queue_t)self->_IORequests, v19);
    }
    else
    {
      -[UserFSSleepManager disableSystemSleepDelayed:](self->_powerAssertManager, "disableSystemSleepDelayed:", self->_metaDataRequests, v21, v22, v23, v24, v25, v26);
      v19[2](v19);
    }
  }
}

- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a6;
  if (self->_useKOIO)
  {
    id v10 = [(LiveFSServiceUserClient *)self->_kernelUserClient getVolumePort];
    if ((v10 - 1) >= 0xFFFFFFFE)
    {
      id v23 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100025724(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    else
    {
      int v11 = (int)v10;
      id v12 = +[LiveFSMachPort newByCopyingPort:v10];
      if (v12)
      {
        id v13 = v12;
        id v14 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
        {
          int v31 = 136315650;
          unsigned int v32 = "-[userFSVolume fetchVolumeMachPortLabeled:forClient:requestID:reply:]";
          __int16 v33 = 1024;
          int v34 = v11;
          __int16 v35 = 2048;
          __int16 v36 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s: volumePort = %d, LiveFSMachPort = %p.", (uint8_t *)&v31, 0x1Cu);
        }
        v9[2](v9, 0, v13);

        goto LABEL_13;
      }
    }
    v9[2](v9, 22, 0);
    goto LABEL_13;
  }
  unsigned int v15 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000256AC(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  v9[2](v9, 45, 0);
LABEL_13:
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  unsigned int v38 = 0;
  uint64_t v17 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v31 = v17;
    id v32 = objc_retainBlock(v16);
    *(_DWORD *)buf = 138413314;
    *(void *)__int16 v40 = v13;
    *(_WORD *)&v40[8] = 2112;
    *(void *)&v40[10] = v14;
    *(_WORD *)&v40[18] = 2048;
    *(void *)&v40[20] = v15;
    *(_WORD *)&v40[28] = 2048;
    *(void *)&v40[30] = a6;
    *(_WORD *)&v40[38] = 2048;
    *(void *)&v40[40] = v32;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "LICreate(%@/%@, %p, 0x%llx, %p): start", buf, 0x34u);
  }
  __int16 v35 = v13;
  uint64_t v18 = [(userFSVolume *)self getNodeForFH:v13 withError:&v38];
  int v34 = v15;
  if (v38)
  {
    uint64_t v19 = v14;
    id v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    id v23 = 0;
    id v24 = 0;
  }
  else
  {
    id v25 = +[NSMutableData dataWithData:v15];
    *((_DWORD *)[v25 mutableBytes] + 6) = 1;
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v37 = 0;
    uint64_t v19 = v14;
    unsigned int v26 = [v18 createDirEntry:v14 withAttrs:v25 withData:0 withResultingNode:&v37];
    id v24 = v37;
    unsigned int v38 = v26;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (v38)
    {
      id v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      id v23 = 0;
    }
    else
    {
      [(userFSVolume *)self startSyncerIfNeeded];
      [v24 getFH];
      uint64_t v21 = v33 = a6;
      id v23 = [v18 getAttrData];
      id v20 = objc_msgSend(v18, "lfn_interestedClients");
      uint64_t v22 = [v24 getAttrData];
      objc_msgSend(v24, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v24, "lfn_inUseClientSet") | v33);
      if (self->_spotlightIsEnabled)
      {
        if (v22)
        {
          uint64_t v36 = 0;
          uint64_t v30 = [(userFSVolume *)self pathStringForNode:v18 name:v19 buffer:buf bufferSize:1024 outLength:&v36];
          if (v30) {
            [(CSLiveFSVolume *)self->_spotlightNotifer sendEventOfType:0 pid:0 path:v30 pathLength:v36 attributes:v22];
          }
        }
      }
    }
  }
  uint64_t v27 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)__int16 v40 = v38;
    *(_WORD *)&v40[4] = 2048;
    *(void *)&v40[6] = v23;
    *(_WORD *)&v40[14] = 2048;
    *(void *)&v40[16] = v20;
    *(_WORD *)&v40[24] = 2048;
    *(void *)&v40[26] = v21;
    *(_WORD *)&v40[34] = 2048;
    *(void *)&v40[36] = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "LICreate(): reply(%d, %p, %#llx, %p, %p)", buf, 0x30u);
  }
  uint64_t v28 = v38;
  uint64_t v29 = [(userFSVolume *)self getFreeSpaceInVolume];
  (*((void (**)(id, uint64_t, void *, id, void *, void *, void *))v16 + 2))(v16, v28, v23, v20, v21, v22, v29);
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  unsigned int v41 = 0;
  uint64_t v17 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v31 = v13;
    id v32 = v17;
    id v33 = [v31 UTF8String];
    id v34 = [v14 UTF8String];
    id v35 = objc_retainBlock(v16);
    *(_DWORD *)buf = 136315906;
    *(void *)unint64_t v43 = v33;
    *(_WORD *)&v43[8] = 2080;
    *(void *)&v43[10] = v34;
    *(_WORD *)&v43[18] = 2048;
    *(void *)&v43[20] = v15;
    *(_WORD *)&v43[28] = 2048;
    *(void *)&v43[30] = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "LIMakeDir(%s, %s, %p, %p): start", buf, 0x2Au);
  }
  unsigned int v38 = v13;
  uint64_t v18 = [(userFSVolume *)self getNodeForFH:v13 withError:&v41];
  id v37 = v15;
  if (v41)
  {
    uint64_t v19 = v14;
    id v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    id v24 = 0;
  }
  else
  {
    id v25 = +[NSMutableData dataWithData:v15];
    *((_DWORD *)[v25 mutableBytes] + 6) = 2;
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v40 = 0;
    uint64_t v19 = v14;
    unsigned int v26 = [v18 createDirEntry:v14 withAttrs:v25 withData:0 withResultingNode:&v40];
    id v24 = v40;
    unsigned int v41 = v26;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (v41)
    {
      id v20 = 0;
      uint64_t v21 = 0;
      id v22 = 0;
      id v23 = 0;
    }
    else
    {
      [(userFSVolume *)self startSyncerIfNeeded];
      uint64_t v21 = [v24 getFH];
      [v18 getAttrData];
      id v23 = v36 = a6;
      id v22 = objc_msgSend(v18, "lfn_interestedClients");
      id v20 = [v24 getAttrData];
      objc_msgSend(v24, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v24, "lfn_inUseClientSet") | v36);
      if (self->_spotlightIsEnabled)
      {
        if (v20)
        {
          uint64_t v39 = 0;
          uint64_t v30 = [(userFSVolume *)self pathStringForNode:v18 name:v19 buffer:buf bufferSize:1024 outLength:&v39];
          if (v30) {
            [(CSLiveFSVolume *)self->_spotlightNotifer sendEventOfType:7 pid:0 path:v30 pathLength:v39 attributes:v20];
          }
        }
      }
    }
  }
  uint64_t v27 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)unint64_t v43 = v41;
    *(_WORD *)&v43[4] = 2048;
    *(void *)&v43[6] = v23;
    *(_WORD *)&v43[14] = 2048;
    *(void *)&v43[16] = v21;
    *(_WORD *)&unsigned char v43[24] = 2048;
    *(void *)&v43[26] = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "LIMakeDir(): reply(%d, %p, %p, %p).\n", buf, 0x26u);
  }
  uint64_t v28 = v41;
  uint64_t v29 = [(userFSVolume *)self getFreeSpaceInVolume];
  (*((void (**)(id, uint64_t, void *, id, void *, void *, void *))v16 + 2))(v16, v28, v23, v22, v21, v20, v29);
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unsigned int v33 = 0;
  uint64_t v17 = (void (**)(id, void, void *, id, void *, void *, void *))a9;
  uint64_t v18 = [(userFSVolume *)self getNodeForFH:a3 withError:&v33];
  uint64_t v19 = v33;
  uint64_t v30 = v16;
  id v31 = v14;
  if (v33)
  {
    id v20 = v15;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    id v24 = 0;
    id v25 = 0;
  }
  else
  {
    id v26 = +[NSMutableData dataWithData:v16];
    *((_DWORD *)[v26 mutableBytes] + 6) = 3;
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v32 = 0;
    id v20 = v15;
    unsigned int v27 = [v18 createDirEntry:v14 withAttrs:v26 withData:v15 withResultingNode:&v32];
    id v25 = v32;
    unsigned int v33 = v27;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (v33)
    {
      uint64_t v21 = 0;
      id v22 = 0;
      id v23 = 0;
      id v24 = 0;
    }
    else
    {
      [(userFSVolume *)self startSyncerIfNeeded];
      id v24 = [v25 getFH];
      [v18 getAttrData];
      uint64_t v21 = v29 = a7;
      id v22 = objc_msgSend(v18, "lfn_interestedClients");
      id v23 = [v25 getAttrData];
      objc_msgSend(v25, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v25, "lfn_inUseClientSet") | v29);
    }

    uint64_t v19 = v33;
  }
  uint64_t v28 = [(userFSVolume *)self getFreeSpaceInVolume];
  v17[2](v17, v19, v21, v22, v24, v23, v28);
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  unsigned int v42 = 0;
  id v14 = (void (**)(id, void, id, id, id, id, void *))a8;
  id v15 = [(userFSVolume *)self getNodeForFH:a3 withError:&v42];
  uint64_t v39 = v12;
  if (v42)
  {
    id v16 = 0;
LABEL_4:
    id v17 = 0;
    id v18 = 0;
    id v19 = 0;
    id v20 = 0;
    goto LABEL_5;
  }
  id v16 = [(userFSVolume *)self getNodeForFH:v13 withError:&v42];
  if (v42) {
    goto LABEL_4;
  }
  [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
  id v40 = 0;
  id v41 = 0;
  unsigned int v23 = [v15 link:v16 withName:v12 fileAttrOut:&v41 dirAttrOut:&v40];
  id v17 = v41;
  id v18 = v40;
  unsigned int v42 = v23;
  [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  id v20 = objc_msgSend(v16, "lfn_interestedClients");
  id v19 = objc_msgSend(v15, "lfn_interestedClients");
  if (!v42)
  {
    [(userFSVolume *)self startSyncerIfNeeded];
    if (!v42)
    {
      if (objc_msgSend(v15, "lfn_check_appledouble"))
      {
        uint64_t v24 = objc_msgSend(v15, "lfn_appledouble");
        if (v24)
        {
          id v25 = (void *)v24;
          id v35 = objc_msgSend(v15, "lfn_appledouble");
          unsigned int v37 = [v35 purpose];

          if (v37 != 2)
          {
            id v26 = objc_msgSend(v15, "lfn_appledouble");
            [v26 reclaimFile];

            objc_msgSend(v15, "setLfn_appledouble:", 0);
          }
        }
        unsigned int v27 = objc_msgSend(v15, "lfn_appledouble");

        if (!v27)
        {
          unsigned int v38 = [(userFSVolume *)self appleDoubleManager];
          unint64_t v36 = objc_msgSend(v15, "lfn_fh");
          unsigned int v33 = objc_msgSend(v15, "lfn_name");
          id v34 = objc_msgSend(v15, "lfn_parent");
          id v32 = objc_msgSend(v34, "lfn_fh");
          uint64_t v28 = [v38 AppleDoubleForNamespaceWithBaseFile:v36 named:v33 inDirectory:v32];
          objc_msgSend(v15, "setLfn_appledouble:", v28);
        }
        unint64_t v29 = objc_msgSend(v15, "lfn_appledouble");
        objc_msgSend(v15, "setLfn_check_appledouble:", objc_msgSend(v29, "containerFileExists"));

        uint64_t v30 = objc_msgSend(v15, "lfn_appledouble");
        [v30 linkFileToDirectory:v13 andName:v39];

        if ((objc_msgSend(v15, "lfn_check_appledouble") & 1) == 0)
        {
          id v31 = objc_msgSend(v15, "lfn_appledouble");
          [v31 reclaimFile];

          objc_msgSend(v15, "setLfn_appledouble:", 0);
        }
      }
    }
  }
LABEL_5:
  uint64_t v21 = v42;
  id v22 = [(userFSVolume *)self getFreeSpaceInVolume];
  v14[2](v14, v21, v18, v20, v17, v19, v22);
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10
{
  uint64_t v11 = *(void *)&a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v43 = a6;
  id v19 = a10;
  id v20 = (void (**)(void, void, void, void, void, void, void))v19;
  unsigned int v45 = 0;
  if ((self->volCapInterfaces & 0x10000) == 0) {
    (*((void (**)(id, uint64_t, void, void, void, void, void))v19 + 2))(v19, 45, 0, 0, 0, 0, 0);
  }
  uint64_t v21 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v33 = v21;
    id v34 = objc_retainBlock(v20);
    *(_DWORD *)buf = 138413314;
    *(void *)id v47 = v18;
    *(_WORD *)&v47[8] = 2112;
    *(void *)&v47[10] = v17;
    *(_WORD *)&v47[18] = 2048;
    *(void *)&v47[20] = v43;
    *(_WORD *)&v47[28] = 2048;
    *(void *)&v47[30] = a8;
    *(_WORD *)&v47[38] = 2048;
    *(void *)&v47[40] = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "LIMakeClone(%@/%@, %p, 0x%llx, %p): start", buf, 0x34u);
  }
  unsigned int v42 = v16;
  uint64_t v22 = [(userFSVolume *)self getNodeForFH:v16 withError:&v45];
  unsigned int v23 = (void *)v22;
  id v40 = v17;
  id v41 = v18;
  if (v45)
  {
    uint64_t v24 = (void *)v22;
    id v25 = 0;
    id v26 = 0;
    unsigned int v27 = 0;
    uint64_t v28 = 0;
    id v29 = 0;
    uint64_t v30 = 0;
  }
  else
  {
    unint64_t v39 = a8;
    uint64_t v30 = [(userFSVolume *)self getNodeForFH:v18 withError:&v45];
    if (v45)
    {
      uint64_t v24 = v23;
      id v25 = 0;
      id v26 = 0;
      unsigned int v27 = 0;
      uint64_t v28 = 0;
      id v29 = 0;
    }
    else
    {
      id v31 = +[NSMutableData dataWithData:v43];
      *((_DWORD *)[v31 mutableBytes] + 6) = 1;
      [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
      id v44 = 0;
      uint64_t v24 = v23;
      unsigned int v38 = v31;
      unsigned int v32 = [v23 cloneFileToDirectory:v30 withName:v17 attrs:v31 flags:v11 andResultingNode:&v44];
      id v29 = v44;
      unsigned int v45 = v32;
      [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
      if (v45)
      {
        id v25 = 0;
        id v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
      }
      else
      {
        [(userFSVolume *)self startSyncerIfNeeded];
        unsigned int v27 = [v29 getFH];
        uint64_t v28 = [v30 getAttrData];
        id v26 = objc_msgSend(v30, "lfn_interestedClients");
        id v25 = [v29 getAttrData];
        objc_msgSend(v29, "setLfn_inUseClientSet:", (unint64_t)objc_msgSend(v29, "lfn_inUseClientSet") | v39);
      }
    }
  }
  id v35 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)id v47 = v45;
    *(_WORD *)&v47[4] = 2048;
    *(void *)&v47[6] = v28;
    *(_WORD *)&v47[14] = 2048;
    *(void *)&v47[16] = v26;
    *(_WORD *)&v47[24] = 2048;
    *(void *)&v47[26] = v27;
    *(_WORD *)&v47[34] = 2048;
    *(void *)&v47[36] = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "LIMakeClone(): reply(%d, %p, %#llx, %p, %p)", buf, 0x30u);
  }
  uint64_t v36 = v45;
  unsigned int v37 = [(userFSVolume *)self getFreeSpaceInVolume];
  ((void (**)(void, uint64_t, void *, id, void *, void *, void *))v20)[2](v20, v36, v28, v26, v27, v25, v37);
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v62 = a5;
  id v15 = a8;
  unsigned int v66 = 0;
  id v16 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v31 = v14;
    unsigned int v32 = v16;
    id v33 = [v31 UTF8String];
    id v34 = [v62 UTF8String];
    id v35 = objc_retainBlock(v15);
    *(_DWORD *)buf = 136315906;
    id v68 = v33;
    __int16 v69 = 2080;
    id v70 = v34;
    __int16 v71 = 2048;
    id v72 = v35;
    __int16 v73 = 2080;
    label = dispatch_queue_get_label(0);
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "removeItem(%s, %s, %p): start on %s", buf, 0x2Au);
  }
  unsigned int v17 = [(userFSVolume *)self pauseIOQueue];
  id v18 = [(userFSVolume *)self getNodeForFH:v14 withError:&v66];
  if (v66)
  {
    id v19 = (void (**)(void, void, void, void, void, void, void, void))v15;
    id v20 = v14;
    uint64_t v21 = 0;
    id v60 = 0;
    id v22 = 0;
    unsigned int v23 = 0;
    goto LABEL_37;
  }
  __int16 v59 = v13;
  uint64_t v24 = [(userFSVolume *)self getNodeForFH:v13 withError:&v66];
  id v25 = (void *)v24;
  if (v66 || !v24)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100025888();
    }
    id v19 = (void (**)(void, void, void, void, void, void, void, void))v15;
    uint64_t v21 = 0;
    id v60 = 0;
    id v22 = 0;
    unsigned int v23 = 0;
    unsigned int v66 = 2;
    goto LABEL_36;
  }
  if ([v59 length])
  {
    id v26 = [v25 getFH];
    if (([v26 isEqualToString:v59] & 1) == 0)
    {

      goto LABEL_17;
    }
    unsigned int v27 = [(userFSVolume *)self isCaseSensitive];
    uint64_t v28 = objc_msgSend(v25, "lfn_name");
    id v29 = v28;
    if (v27)
    {
      unsigned __int8 v30 = [v28 isEqualToString:v62];

      if (v30) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    __int16 v61 = [v28 lowercaseString];
    uint64_t v36 = [v62 lowercaseString];
    unsigned __int8 v58 = [v61 isEqualToString:v36];

    if ((v58 & 1) == 0) {
LABEL_17:
    }
      unsigned int v66 = 2;
  }
LABEL_18:
  [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
  unsigned int v37 = v66;
  if (!v66) {
    unsigned int v37 = [v18 remove:1 named:v62 node:v25 usingFlags:v9];
  }
  unsigned int v66 = v37;
  [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  if (v66)
  {
    id v19 = (void (**)(void, void, void, void, void, void, void, void))v15;
    uint64_t v21 = 0;
    id v60 = 0;
    id v22 = 0;
    unsigned int v23 = 0;
  }
  else
  {
    [(userFSVolume *)self startSyncerIfNeeded];
    if (objc_msgSend(v25, "lfn_check_appledouble")
      && (+[LiveFSAppleDoubleManager isDotUnderBarFileName:v62] & 1) == 0)
    {
      uint64_t v38 = objc_msgSend(v25, "lfn_appledouble");
      if (v38)
      {
        unint64_t v39 = (void *)v38;
        id v40 = objc_msgSend(v25, "lfn_appledouble");
        unsigned int v41 = [v40 purpose];

        if (v41 != 2)
        {
          unsigned int v42 = objc_msgSend(v25, "lfn_appledouble");
          [v42 reclaimFile];

          objc_msgSend(v25, "setLfn_appledouble:", 0);
        }
      }
      id v43 = objc_msgSend(v25, "lfn_appledouble");

      if (!v43)
      {
        id v44 = [(userFSVolume *)self appleDoubleManager];
        unsigned int v45 = objc_msgSend(v25, "lfn_fh");
        id v46 = [v44 AppleDoubleForNamespaceWithBaseFile:v45 named:v62 inDirectory:v14];
        objc_msgSend(v25, "setLfn_appledouble:", v46);
      }
      id v47 = objc_msgSend(v25, "lfn_appledouble");
      objc_msgSend(v25, "setLfn_check_appledouble:", objc_msgSend(v47, "containerFileExists"));

      id v48 = objc_msgSend(v25, "lfn_appledouble");
      [v48 removeFile];

      id v49 = objc_msgSend(v25, "lfn_appledouble");
      [v49 reclaimFile];

      objc_msgSend(v25, "setLfn_appledouble:", 0);
    }
    id v50 = objc_msgSend(v25, "lfn_interestedClients");
    uint64_t v21 = objc_msgSend(v25, "lfn_fh");
    [(userFSVolume *)self removeFromNameCache:v25 withParent:v18 withName:v62];
    if ([v25 getLinkCount] >= 2) {
      [v25 forceUpdateAttrs];
    }
    unsigned int v23 = [v18 getAttrData];
    id v60 = v50;
    id v22 = objc_msgSend(v18, "lfn_interestedClients");
    if (self->_spotlightIsEnabled)
    {
      uint64_t v65 = 0;
      int v51 = [(userFSVolume *)self pathStringForNode:v18 name:v62 buffer:buf bufferSize:1024 outLength:&v65];
      if (v51)
      {
        id v52 = v51;
        uint64_t v64 = 0;
        memset(v63, 0, sizeof(v63));
        uint64_t v53 = +[NSData dataWithBytes:v63 length:184];
        unsigned int v54 = v52;
        uint64_t v55 = (void *)v53;
        -[CSLiveFSVolume sendEventOfType:pid:path:pathLength:attributes:](self->_spotlightNotifer, "sendEventOfType:pid:path:pathLength:attributes:", 1, 0, v54, v65);
      }
    }
    id v19 = (void (**)(void, void, void, void, void, void, void, void))v15;
  }
LABEL_36:
  id v20 = v14;

  id v13 = v59;
LABEL_37:
  if (v17) {
    [(userFSVolume *)self resumeIOQueue];
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025818();
  }
  uint64_t v56 = v66;
  __int16 v57 = [(userFSVolume *)self getFreeSpaceInVolume];
  ((void (**)(void, uint64_t, void *, id, id, void *, void, void *))v19)[2](v19, v56, v23, v22, v60, v21, 0, v57);

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10002579C();
  }
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  unsigned int v95 = 0;
  unsigned int v17 = (void *)userfs_log_default;
  v90 = v15;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v48 = v14;
    id v49 = v17;
    id v50 = [v48 UTF8String];
    id v51 = [v15 UTF8String];
    id v52 = objc_retainBlock(v16);
    *(_DWORD *)buf = 136315906;
    id v97 = v50;
    __int16 v98 = 2080;
    id v99 = v51;
    __int16 v100 = 2048;
    id v101 = v52;
    __int16 v102 = 2080;
    label = dispatch_queue_get_label(0);
    _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "removeDirectory(%s, %s, %p): start on %s", buf, 0x2Au);

    id v15 = v90;
  }
  unsigned int v88 = [(userFSVolume *)self pauseIOQueue];
  id v18 = [(userFSVolume *)self getNodeForFH:v14 withError:&v95];
  v89 = v13;
  if (v95)
  {
    v91 = 0;
LABEL_5:
    id v19 = 0;
    id v20 = 0;
    uint64_t v21 = 0;
    id v87 = 0;
LABEL_19:
    id v29 = 0;
    goto LABEL_20;
  }
  if (!v13 || ([v13 isEqual:&stru_100038E98] & 1) != 0) {
    goto LABEL_8;
  }
  uint64_t v32 = [(userFSVolume *)self getNodeForFH:v13 withError:&v95];
  id v33 = (void *)v32;
  if (v95)
  {
    v91 = (void *)v32;
    goto LABEL_5;
  }
  if (v32)
  {
    unsigned __int8 v53 = [(userFSVolume *)self isCaseSensitive];
    v91 = v33;
    unsigned int v54 = objc_msgSend(v33, "lfn_name");
    uint64_t v55 = v54;
    if (v53)
    {
      unsigned __int8 v56 = [v54 isEqualToString:v15];

      if ((v56 & 1) == 0) {
        goto LABEL_53;
      }
    }
    else
    {
      id v60 = [v54 lowercaseString];
      __int16 v61 = [v15 lowercaseString];
      unsigned __int8 v62 = [v60 isEqualToString:v61];

      if ((v62 & 1) == 0)
      {
LABEL_53:
        id v19 = 0;
        id v20 = 0;
        uint64_t v21 = 0;
        id v87 = 0;
        id v29 = 0;
        unsigned int v95 = 2;
        goto LABEL_20;
      }
    }
    id v22 = v91;
  }
  else
  {
LABEL_8:
    id v22 = 0;
  }
  v91 = v22;
  uint64_t v21 = [v18 getAttrData];
  id v87 = objc_msgSend(v18, "lfn_interestedClients");
  [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
  unsigned int v95 = [v18 remove:2 named:v15 node:v22 usingFlags:v9];
  [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  unsigned int v23 = v95;
  if (v95 == 66)
  {
    uint64_t v24 = [(userFSVolume *)self appleDoubleManager];

    if (!v24) {
      goto LABEL_29;
    }
    id v25 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v63 = v14;
      log = v25;
      id v64 = [v63 UTF8String];
      id v65 = [v15 UTF8String];
      id v66 = objc_retainBlock(v16);
      v67 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136315906;
      id v97 = v64;
      __int16 v98 = 2080;
      id v99 = v65;
      __int16 v100 = 2048;
      id v101 = v66;
      __int16 v102 = 2080;
      label = v67;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "removeDirectory(%s, %s, %p): got ENOTEMPTY will try to scrub on %s", buf, 0x2Au);
    }
    id v26 = [(userFSVolume *)self appleDoubleManager];
    unsigned int v27 = [v26 scrubDirectoryNamed:v15 inDirectory:v14];

    if (!v27)
    {
LABEL_29:
      if (v95) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
    uint64_t v28 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v78 = v14;
      loga = v28;
      id v79 = [v78 UTF8String];
      id v80 = [v15 UTF8String];
      id v81 = objc_retainBlock(v16);
      v82 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136315906;
      id v97 = v79;
      __int16 v98 = 2080;
      id v99 = v80;
      __int16 v100 = 2048;
      id v101 = v81;
      __int16 v102 = 2080;
      label = v82;
      _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "removeDirectory(%s, %s, %p): scrubbed trying again on %s", buf, 0x2Au);
    }
    unsigned int v23 = [v18 remove:2 named:v15 node:v91 usingFlags:v9];
    unsigned int v95 = v23;
  }
  if (v23)
  {
LABEL_18:
    id v19 = 0;
    id v20 = 0;
    goto LABEL_19;
  }
LABEL_30:
  [(userFSVolume *)self startSyncerIfNeeded];
  id v20 = [(userFSVolume *)self lookupWithParent:v18 andName:v15];
  if (objc_msgSend(v20, "lfn_check_appledouble"))
  {
    uint64_t v34 = objc_msgSend(v20, "lfn_appledouble");
    if (v34)
    {
      id v35 = (void *)v34;
      uint64_t v36 = objc_msgSend(v20, "lfn_appledouble");
      unsigned int v37 = [v36 purpose];

      if (v37 != 2)
      {
        uint64_t v38 = objc_msgSend(v20, "lfn_appledouble");
        [v38 reclaimFile];

        objc_msgSend(v20, "setLfn_appledouble:", 0);
      }
    }
    unint64_t v39 = objc_msgSend(v20, "lfn_appledouble");

    if (!v39)
    {
      id v40 = [(userFSVolume *)self appleDoubleManager];
      unsigned int v41 = objc_msgSend(v20, "lfn_fh");
      unsigned int v42 = [v40 AppleDoubleForNamespaceWithBaseFile:v41 named:v15 inDirectory:v14];
      objc_msgSend(v20, "setLfn_appledouble:", v42);
    }
    id v43 = objc_msgSend(v20, "lfn_appledouble");
    objc_msgSend(v20, "setLfn_check_appledouble:", objc_msgSend(v43, "containerFileExists"));

    id v44 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v73 = v14;
      logb = v44;
      id v74 = [v73 UTF8String];
      id v75 = [v15 UTF8String];
      id v76 = objc_retainBlock(v16);
      v77 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136315906;
      id v97 = v74;
      __int16 v98 = 2080;
      id v99 = v75;
      __int16 v100 = 2048;
      id v101 = v76;
      __int16 v102 = 2080;
      label = v77;
      _os_log_debug_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_DEBUG, "removeDirectory(%s, %s, %p): removing ._ on %s", buf, 0x2Au);
    }
    unsigned int v45 = objc_msgSend(v20, "lfn_appledouble");
    [v45 removeFile];

    id v46 = objc_msgSend(v20, "lfn_appledouble");
    [v46 reclaimFile];

    objc_msgSend(v20, "setLfn_appledouble:", 0);
  }
  if (v20)
  {
    id v47 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v68 = v14;
      logc = v47;
      id v69 = [v68 UTF8String];
      id v70 = [v15 UTF8String];
      id v71 = objc_retainBlock(v16);
      id v72 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136315906;
      id v97 = v69;
      __int16 v98 = 2080;
      id v99 = v70;
      __int16 v100 = 2048;
      id v101 = v71;
      __int16 v102 = 2080;
      label = v72;
      _os_log_debug_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_DEBUG, "removeDirectory(%s, %s, %p): removing directory from name table on %s", buf, 0x2Au);
    }
    id v29 = objc_msgSend(v20, "lfn_interestedClients");
    id v19 = objc_msgSend(v20, "lfn_fh");
    [(userFSVolume *)self removeFromNameCache:v20 withParent:v18];
  }
  else
  {
    id v19 = 0;
    id v29 = 0;
  }
  if (self->_spotlightIsEnabled)
  {
    uint64_t v94 = 0;
    __int16 v57 = [(userFSVolume *)self pathStringForNode:v18 name:v15 buffer:buf bufferSize:1024 outLength:&v94];
    if (v57)
    {
      unsigned __int8 v58 = v57;
      uint64_t v93 = 0;
      memset(v92, 0, sizeof(v92));
      __int16 v59 = +[NSData dataWithBytes:v92 length:184];
      [(CSLiveFSVolume *)self->_spotlightNotifer sendEventOfType:1 pid:0 path:v58 pathLength:v94 attributes:v59];
    }
  }
LABEL_20:
  if (v88) {
    [(userFSVolume *)self resumeIOQueue];
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025970();
  }
  uint64_t v30 = v95;
  id v31 = [(userFSVolume *)self getFreeSpaceInVolume];
  (*((void (**)(id, uint64_t, void *, id, id, void *, void, void *))v16 + 2))(v16, v30, v21, v87, v29, v19, 0, v31);

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000258F4();
  }
}

- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v95 = a5;
  id v16 = a6;
  id v17 = a9;
  unsigned int v99 = 0;
  id v18 = (void *)userfs_log_default;
  id v96 = v16;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v34 = v14;
    loga = v18;
    id v35 = [v34 UTF8String];
    id v36 = [v15 UTF8String];
    id v37 = [v95 UTF8String];
    id v38 = [v16 UTF8String];
    unsigned int v39 = a7;
    id v40 = objc_retainBlock(v17);
    *(_DWORD *)buf = 136316162;
    id v101 = v35;
    __int16 v102 = 2080;
    id v103 = v36;
    __int16 v104 = 2080;
    id v105 = v37;
    __int16 v106 = 2080;
    id v107 = v38;
    __int16 v108 = 2048;
    id v109 = v40;
    _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "LIRename(%s, %s, %s, %s, %p): start", buf, 0x34u);

    a7 = v39;
    id v16 = v96;
  }
  unsigned int v19 = [(userFSVolume *)self pauseIOQueue];
  id v94 = v15;
  if (!v15 || !v16 || (~a7 & 6) == 0)
  {
    id v20 = v14;
    v86 = 0;
    id v87 = 0;
    id v89 = 0;
    id v90 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    uint64_t v24 = 0;
    id v25 = 0;
    id v26 = 0;
    v91 = 0;
    os_log_t log = 0;
    unsigned int v88 = 0;
    unsigned int v27 = 0;
    int v28 = 22;
    goto LABEL_7;
  }
  if ((a7 & 2) != 0 && (self->volCapInterfaces & 0x40000) == 0
    || (a7 & 4) != 0 && (self->volCapInterfaces & 0x80000) == 0)
  {
    id v20 = v14;
    v86 = 0;
    id v87 = 0;
    id v89 = 0;
    id v90 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    uint64_t v24 = 0;
    id v25 = 0;
    id v26 = 0;
    v91 = 0;
    os_log_t log = 0;
    unsigned int v88 = 0;
    unsigned int v27 = 0;
    int v28 = 45;
LABEL_7:
    unsigned int v99 = v28;
    if (!v19) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unsigned int v84 = v19;
  uint64_t v32 = [(userFSVolume *)self getNodeForFH:v14 withError:&v99];
  id v33 = v32;
  if (v99)
  {
    unsigned int v27 = v32;
    id v20 = v14;
    v86 = 0;
    id v87 = 0;
    id v89 = 0;
    id v90 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    uint64_t v24 = 0;
    id v25 = 0;
    id v26 = 0;
    v91 = 0;
    os_log_t log = 0;
    unsigned int v88 = 0;
    goto LABEL_33;
  }
  os_log_t log = (os_log_t)objc_msgSend(v32, "lfn_interestedClients");
  unsigned int v45 = [(userFSVolume *)self lookupWithParent:v33 andName:v15];
  uint64_t v24 = v45;
  if (!v45)
  {
    unsigned int v27 = v33;
    id v20 = v14;
    v86 = 0;
    id v87 = 0;
    id v89 = 0;
    id v90 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    id v25 = 0;
    id v26 = 0;
    v91 = 0;
    unsigned int v88 = 0;
    unsigned int v99 = 2;
    goto LABEL_33;
  }
  id v90 = objc_msgSend(v45, "lfn_interestedClients");
  v91 = objc_msgSend(v24, "lfn_fh");
  uint64_t v98 = 0;
  if (self->_spotlightIsEnabled) {
    id v25 = strdup([(userFSVolume *)self pathStringForNode:v33 name:v15 buffer:buf bufferSize:1024 outLength:&v98]);
  }
  else {
    id v25 = 0;
  }
  id v46 = [(userFSVolume *)self getNodeForFH:v95 withError:&v99];
  unsigned int v88 = v24;
  v86 = v46;
  if (v99)
  {
    unsigned int v27 = v33;
    id v20 = v14;
    id v89 = 0;
    id v87 = 0;
LABEL_32:
    uint64_t v21 = 0;
    id v22 = 0;
    id v23 = 0;
    uint64_t v24 = 0;
    id v26 = 0;
    goto LABEL_33;
  }
  id v47 = v46;
  id v89 = objc_msgSend(v46, "lfn_interestedClients");
  [(userFSVolume *)self lookupWithParent:v47 andName:v96];
  uint64_t v48 = v82 = a7;
  [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
  id v87 = (void *)v48;
  uint64_t v49 = v48;
  char v50 = v82;
  unsigned int v99 = [v33 rename:v24 named:v15 withToDirNode:v47 withToNode:v49 withToName:v96 andFlags:v82];
  [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  if (v99)
  {
    unsigned int v27 = v33;
    id v20 = v14;
    goto LABEL_32;
  }
  [(userFSVolume *)self startSyncerIfNeeded];
  uint64_t v97 = 0;
  if (self->_spotlightIsEnabled) {
    id v26 = strdup([(userFSVolume *)self pathStringForNode:v47 name:v96 buffer:buf bufferSize:1024 outLength:&v97]);
  }
  else {
    id v26 = 0;
  }
  uint64_t v24 = v87;
  if (objc_msgSend(v88, "lfn_check_appledouble")
    && (+[LiveFSAppleDoubleManager isDotUnderBarFileName:v15] & 1) == 0)
  {
    if ((v82 & 2) != 0 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100025A54();
    }
    id v51 = v88;
    uint64_t v52 = objc_msgSend(v88, "lfn_appledouble");
    if (v52)
    {
      unsigned __int8 v53 = (void *)v52;
      unsigned int v54 = objc_msgSend(v88, "lfn_appledouble");
      uint64_t v55 = v33;
      unsigned int v56 = [v54 purpose];

      BOOL v57 = v56 == 2;
      id v33 = v55;
      char v50 = v82;
      id v51 = v88;
      if (!v57)
      {
        unsigned __int8 v58 = objc_msgSend(v88, "lfn_appledouble");
        [v58 reclaimFile];

        objc_msgSend(v88, "setLfn_appledouble:", 0);
      }
    }
    __int16 v59 = objc_msgSend(v51, "lfn_appledouble");

    if (!v59)
    {
      v77 = [(userFSVolume *)self appleDoubleManager];
      id v60 = objc_msgSend(v51, "lfn_fh");
      [v77 AppleDoubleForNamespaceWithBaseFile:v60 named:v15 inDirectory:v14];
      v62 = __int16 v61 = v33;
      objc_msgSend(v88, "setLfn_appledouble:", v62);

      id v33 = v61;
      char v50 = v82;
      id v51 = v88;
    }
    id v63 = objc_msgSend(v51, "lfn_appledouble");
    objc_msgSend(v51, "setLfn_check_appledouble:", objc_msgSend(v63, "containerFileExists"));

    id v64 = objc_msgSend(v51, "lfn_appledouble");
    [v64 renameFileToDirectory:v95 andName:v96];

    id v65 = objc_msgSend(v51, "lfn_appledouble");
    [v65 reclaimFile];

    objc_msgSend(v51, "setLfn_appledouble:", 0);
    uint64_t v24 = v87;
  }
  if ((v50 & 2) != 0)
  {
    id v20 = v14;
    if (v24)
    {
      id v66 = v86;
      [(userFSVolume *)self removeFromNameCache:v24 withParent:v86];
      v67 = v24;
      id v68 = v88;
      [(userFSVolume *)self removeFromNameCache:v88 withParent:v33];
      [v67 updateName:v94 andParent:v33];
      [v88 updateName:v96 andParent:v86];
      [(userFSVolume *)self insertIntoNameCache:v67 withParent:v33];
    }
    else
    {
      id v68 = v88;
      [(userFSVolume *)self removeFromNameCache:v88 withParent:v33];
      id v66 = v86;
      [v88 updateName:v96 andParent:v86];
    }
    [(userFSVolume *)self insertIntoNameCache:v68 withParent:v66];
    id v23 = 0;
    uint64_t v24 = 0;
  }
  else
  {
    if (v24)
    {
      id v20 = v14;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100025A20();
      }
      objc_msgSend(v24, "lfn_fh");
      uint64_t v24 = v69 = v24;
      id v23 = objc_msgSend(v69, "lfn_interestedClients");
      [(userFSVolume *)self removeFromNameCache:v69 withParent:v86 withName:v96];
      if ([v69 getLinkCount] <= 1)
      {
        [v69 updateName:@"/unlinked" andParent:v86];
        [(userFSVolume *)self insertIntoNameCache:v69 withParent:v86];
      }
    }
    else
    {
      id v20 = v14;
      id v23 = 0;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000259EC();
    }
    [(userFSVolume *)self removeFromNameCache:v88 withParent:v33 withName:v94];
    id v66 = v86;
    [v88 updateName:v96 andParent:v86];
    [(userFSVolume *)self insertIntoNameCache:v88 withParent:v86 withName:v96];
    id v87 = 0;
  }
  unsigned int v27 = v33;
  uint64_t v21 = [v33 getAttrData];
  uint64_t v70 = [v66 getAttrData];
  id v22 = (void *)v70;
  if (self->_spotlightIsEnabled && v70 && v26 && v25)
  {
    uint64_t v71 = 0;
    if ((v82 & 2) != 0 && v87)
    {
      uint64_t v71 = [v87 getAttrData];
    }
    uint64_t v80 = v98;
    v83 = (void *)v71;
    uint64_t v73 = v97;
    spotlightNotifer = self->_spotlightNotifer;
    id v78 = [v88 getAttrData];
    [(CSLiveFSVolume *)spotlightNotifer sendPairedEventOfType:3 pid:0 fromPath:v25 fromPathLength:v80 fromAttributes:v83 toPath:v26 toPathLength:v73 toAttributes:v78];
  }
LABEL_33:
  if (v84) {
LABEL_8:
  }
    [(userFSVolume *)self resumeIOQueue];
LABEL_9:
  if (v25) {
    free(v25);
  }
  if (v26) {
    free(v26);
  }
  id v29 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v41 = v20;
    v85 = v29;
    id v81 = [v41 UTF8String];
    id v79 = [v94 UTF8String];
    id v76 = [v95 UTF8String];
    id v42 = [v96 UTF8String];
    id v43 = objc_retainBlock(v17);
    unsigned int v74 = v99;
    id v44 = [v24 UTF8String];
    *(_DWORD *)buf = 136318978;
    id v101 = v81;
    __int16 v102 = 2080;
    id v103 = v79;
    __int16 v104 = 2080;
    id v105 = v76;
    __int16 v106 = 2080;
    id v107 = v42;
    __int16 v108 = 2048;
    id v109 = v43;
    __int16 v110 = 1024;
    unsigned int v111 = v74;
    __int16 v112 = 2048;
    v113 = v21;
    __int16 v114 = 2048;
    os_log_t v115 = log;
    __int16 v116 = 2048;
    v117 = v22;
    __int16 v118 = 2048;
    id v119 = v89;
    __int16 v120 = 2048;
    id v121 = v90;
    __int16 v122 = 2048;
    v123 = v91;
    __int16 v124 = 1024;
    int v125 = 0;
    __int16 v126 = 2048;
    id v127 = v23;
    __int16 v128 = 2080;
    id v129 = v44;
    __int16 v130 = 1024;
    int v131 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "LIRename(%s, %s, %s, %s, %p): reply(%d, %p, %#llx, %p, %#llx, %#llx, %p, %d, %#llx, %s, %d)", buf, 0x96u);
  }
  uint64_t v30 = v99;
  id v31 = [(userFSVolume *)self getFreeSpaceInVolume];
  LOBYTE(v72) = 0;
  (*((void (**)(id, uint64_t, void *, os_log_t, void *, id, id, void *, int, id, void *, _BYTE, void *))v17 + 2))(v17, v30, v21, log, v22, v89, v90, v91, v72, v23, v24, 0, v31);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  +[LiveFSSharedMutableBuffer dataWithLength:a4];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100012E48;
  v18[3] = &unk_100038910;
  id v20 = v14;
  unint64_t v21 = a4;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v14;
  id v17 = v19;
  [(userFSVolume *)self readDirectory:v15 intoBuffer:v17 cookie:a5 verifier:a6 requestID:a7 reply:v18];
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v16 = a9;
  id v17 = a3;
  +[LiveFSSharedMutableBuffer dataWithLength:a4];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001303C;
  v20[3] = &unk_100038910;
  id v22 = v16;
  unint64_t v23 = a4;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v16;
  id v19 = v21;
  [(userFSVolume *)self readDirectory:v17 intoBuffer:v19 requestedAttributes:a5 cookie:a6 verifier:a7 requestID:a8 reply:v20];
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  unsigned int v29 = 0;
  unint64_t v27 = a6;
  uint64_t v28 = 0;
  id v16 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v13;
    id v20 = v16;
    id v21 = [v19 UTF8String];
    id v22 = objc_retainBlock(v15);
    *(_DWORD *)buf = 136316162;
    id v31 = v21;
    __int16 v32 = 2048;
    id v33 = v14;
    __int16 v34 = 2048;
    unint64_t v35 = a5;
    __int16 v36 = 2048;
    unint64_t v37 = a6;
    __int16 v38 = 2048;
    id v39 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "LIReadDir(%s, %p, 0x%llx, 0x%llx, %p): start", buf, 0x34u);
  }
  id v17 = [(userFSVolume *)self getNodeForFH:v13 withError:&v29];
  if (!v29)
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    unsigned int v29 = [v17 readDirectoryEntries:v14 withCookie:a5 withLengthOut:&v28 andWithVerifier:&v27];
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (v29 == -1001)
    {
      if (v28) {
        unsigned int v29 = 0;
      }
    }
  }
  id v18 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v23 = v13;
    uint64_t v24 = v18;
    id v25 = [v23 UTF8String];
    id v26 = objc_retainBlock(v15);
    *(_DWORD *)buf = 136316930;
    id v31 = v25;
    __int16 v32 = 2048;
    id v33 = v14;
    __int16 v34 = 2048;
    unint64_t v35 = a5;
    __int16 v36 = 2048;
    unint64_t v37 = a6;
    __int16 v38 = 2048;
    id v39 = v26;
    __int16 v40 = 1024;
    unsigned int v41 = v29;
    __int16 v42 = 2048;
    uint64_t v43 = v28;
    __int16 v44 = 2048;
    unint64_t v45 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "LIReadDir(%s, %p, 0x%llx, 0x%llx, %p): reply(%d, %ld, 0x%llx)", buf, 0x4Eu);
  }
  (*((void (**)(id, void, uint64_t, unint64_t))v15 + 2))(v15, v29, v28, v27);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a9;
  unsigned int v29 = 0;
  unint64_t v27 = a7;
  uint64_t v28 = 0;
  id v16 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v13;
    id v20 = v16;
    id v21 = [v19 UTF8String];
    id v22 = objc_retainBlock(v15);
    *(_DWORD *)buf = 136316162;
    id v31 = v21;
    __int16 v32 = 2048;
    id v33 = v14;
    __int16 v34 = 2048;
    unint64_t v35 = a6;
    __int16 v36 = 2048;
    unint64_t v37 = a7;
    __int16 v38 = 2048;
    id v39 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "LIReadDirAndAttrs(%s, %p, 0x%llx, 0x%llx, %p): start", buf, 0x34u);
  }
  id v17 = [(userFSVolume *)self getNodeForFH:v13 withError:&v29];
  if (!v29)
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    unsigned int v29 = [v17 readDirectoryEntriesWithAttrs:v14 withCookie:a6 withLengthOut:&v28 andWithVerifier:&v27];
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  }
  id v18 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v23 = v13;
    uint64_t v24 = v18;
    id v25 = [v23 UTF8String];
    id v26 = objc_retainBlock(v15);
    *(_DWORD *)buf = 136316930;
    id v31 = v25;
    __int16 v32 = 2048;
    id v33 = v14;
    __int16 v34 = 2048;
    unint64_t v35 = a6;
    __int16 v36 = 2048;
    unint64_t v37 = a7;
    __int16 v38 = 2048;
    id v39 = v26;
    __int16 v40 = 1024;
    unsigned int v41 = v29;
    __int16 v42 = 2048;
    uint64_t v43 = v28;
    __int16 v44 = 2048;
    unint64_t v45 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "LIReadDirWithAttrs(%s, %p, 0x%llx, 0x%llx, %p): reply(%d, %ld, 0x%llx)", buf, 0x4Eu);
  }
  (*((void (**)(id, void, uint64_t, unint64_t))v15 + 2))(v15, v29, v28, v27);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = (void (**)(void))a5;
  unsigned int v12 = 0;
  id v8 = [(userFSVolume *)self getNodeForFH:a3 withError:&v12];
  if (v12)
  {
    id v9 = 0;
  }
  else
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v11 = 0;
    unsigned int v10 = [v8 statFS:&v11];
    id v9 = v11;
    unsigned int v12 = v10;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  }
  v7[2](v7);
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = (void (**)(void))a5;
  unsigned int v12 = 0;
  id v8 = [(userFSVolume *)self getNodeForFH:a3 withError:&v12];
  if (v12)
  {
    id v9 = 0;
  }
  else
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v11 = 0;
    unsigned int v10 = [v8 pathConf:&v11];
    id v9 = v11;
    unsigned int v12 = v10;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  }
  v7[2](v7);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  unsigned int v32 = 0;
  unsigned int v12 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v9;
    id v20 = v12;
    id v21 = [v19 UTF8String];
    id v22 = [v10 UTF8String];
    id v23 = objc_retainBlock(v11);
    *(_DWORD *)buf = 136315650;
    id v34 = v21;
    __int16 v35 = 2080;
    id v36 = v22;
    __int16 v37 = 2048;
    id v38 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "LIGetFSAttr(%s, [%s], %p)", buf, 0x20u);
  }
  id v13 = [(userFSVolume *)self getNodeForFH:v9 withError:&v32];
  if (v32)
  {
    id v14 = 0;
  }
  else
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    id v31 = 0;
    unsigned int v15 = [v13 getFileSystemAttribute:v10 andResult:&v31];
    id v14 = v31;
    unsigned int v32 = v15;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (!v32 && [v10 isEqualToString:@"_N_caps_interfaces"])
    {
      id v16 = +[NSMutableData dataWithData:v14];
      id v17 = [v16 mutableBytes];
      *v17 |= 0x100000uLL;

      id v14 = v16;
    }
  }
  id v18 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v24 = v9;
    id v25 = v18;
    id v26 = [v24 UTF8String];
    id v27 = [v10 UTF8String];
    id v28 = objc_retainBlock(v11);
    unsigned int v29 = v32;
    id v30 = [v14 length];
    *(_DWORD *)buf = 136316418;
    id v34 = v26;
    __int16 v35 = 2080;
    id v36 = v27;
    __int16 v37 = 2048;
    id v38 = v28;
    __int16 v39 = 1024;
    unsigned int v40 = v29;
    __int16 v41 = 2048;
    id v42 = v14;
    __int16 v43 = 2048;
    id v44 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "LIGetFSAttr(%s, [%s], %p: reply(%d, %p[%lu])", buf, 0x3Au);
  }
  (*((void (**)(id, void, id))v11 + 2))(v11, v32, v14);
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  unsigned int v34 = 0;
  unsigned int v15 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v21 = v11;
    os_log_t log = v15;
    id v22 = [v21 UTF8String];
    id v23 = [v12 UTF8String];
    id v24 = [v13 length];
    id v25 = objc_retainBlock(v14);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v22;
    __int16 v36 = 2080;
    id v37 = v23;
    __int16 v38 = 2048;
    id v39 = v13;
    __int16 v40 = 2048;
    id v41 = v24;
    __int16 v42 = 2048;
    id v43 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "LISetFSAttr(%s, [%s], %p[%lu], %p)", buf, 0x34u);
  }
  id v16 = [(userFSVolume *)self getNodeForFH:v11 withError:&v34];
  if (v34)
  {
    id v17 = 0;
  }
  else
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    if ([v12 isEqual:@"_N_SYNC"])
    {
      *(void *)buf = 0;
      [v13 getBytes:buf length:8];
      unsigned int v18 = [v16 syncTheFileSystem:*(void *)buf];
      id v17 = 0;
    }
    else
    {
      id v33 = 0;
      unsigned int v18 = [v16 setFileSystemAttributes:v12 toValue:v13 andResult:&v33];
      id v17 = v33;
    }
    unsigned int v34 = v18;
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
    if (!v34 && [v12 isEqualToString:@"_O_f_preallocate"])
    {
      id v19 = [(userFSVolume *)self getFreeSpaceInVolume];
      goto LABEL_12;
    }
  }
  id v19 = 0;
LABEL_12:
  id v20 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v26 = v11;
    loga = v20;
    id v30 = [v26 UTF8String];
    id v27 = [v12 UTF8String];
    id v28 = [v13 length];
    id v29 = objc_retainBlock(v14);
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = v30;
    __int16 v36 = 2080;
    id v37 = v27;
    __int16 v38 = 2048;
    id v39 = v13;
    __int16 v40 = 2048;
    id v41 = v28;
    __int16 v42 = 2048;
    id v43 = v29;
    __int16 v44 = 1024;
    unsigned int v45 = v34;
    __int16 v46 = 2048;
    id v47 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "LISetFSAttr(%s, [%s], %p[%lu], %p): reply(%d, %p)", buf, 0x44u);
  }
  (*((void (**)(id, void, id, void *))v14 + 2))(v14, v34, v17, v19);
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, __CFString *))a6;
  unsigned int v75 = 0;
  id v12 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v24 = v9;
    id v25 = v12;
    id v26 = [v24 UTF8String];
    id v27 = [v10 UTF8String];
    id v28 = objc_retainBlock(v11);
    *(_DWORD *)buf = 136315650;
    id v77 = v26;
    __int16 v78 = 2080;
    id v79 = v27;
    __int16 v80 = 2048;
    id v81 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "LIGetXattr(%s, [%s], %p): start", buf, 0x20u);
  }
  if (!sub_100014710(v10))
  {
    id v14 = [(userFSVolume *)self getNodeForFH:v9 withError:&v75];
    unsigned int v15 = objc_msgSend(v14, "lfn_xattrCache");
    id v16 = v15;
    if (v75)
    {
      id v17 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v34 = v9;
        __int16 v35 = v17;
        id v36 = [v34 UTF8String];
        id v37 = [v10 UTF8String];
        __int16 v38 = objc_retainBlock(v11);
        *(_DWORD *)buf = 136315906;
        id v77 = v36;
        __int16 v78 = 2080;
        id v79 = v37;
        __int16 v80 = 2048;
        id v81 = v38;
        __int16 v82 = 1024;
        *(_DWORD *)v83 = v75;
        _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "LIGetXattr(%s, %s, %p): reply(%d, nil) 1", buf, 0x26u);
      }
      v11[2](v11, v75, 0);
      goto LABEL_20;
    }
    unsigned __int8 v74 = 0;
    unsigned int v18 = [v15 dataForName:v10 wasNegative:&v74];
    id v19 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v39 = v19;
      __int16 v40 = objc_retainBlock(v11);
      *(_DWORD *)buf = 138413314;
      id v77 = v9;
      __int16 v78 = 2112;
      id v79 = v10;
      __int16 v80 = 2048;
      id v81 = v40;
      __int16 v82 = 2112;
      *(void *)v83 = v18;
      *(_WORD *)&v83[8] = 1024;
      *(_DWORD *)&v83[10] = v74;
      _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "LIGetXattr(%@, %@, %p): xattrData: %@ wasNegative: %d", buf, 0x30u);

      if (v18) {
        goto LABEL_13;
      }
    }
    else if (v18)
    {
LABEL_13:
      id v20 = v11[2];
      id v21 = v11;
      uint64_t v22 = 0;
      goto LABEL_14;
    }
    if (v74)
    {
      id v20 = v11[2];
      id v21 = v11;
      uint64_t v22 = 93;
      id v23 = 0;
      goto LABEL_18;
    }
    id v41 = [(userFSVolume *)self appleDoubleManager];

    if (v41)
    {
      unsigned int v75 = 93;
      if (objc_msgSend(v14, "lfn_check_appledouble"))
      {
        __int16 v42 = [(userFSVolume *)self rootNode];

        if (v14 == v42)
        {
          id v71 = v14;
          unsigned int v18 = @".";
        }
        else
        {
          objc_msgSend(v14, "lfn_name");
          unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lfn_parent");
          id v71 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v47 = objc_msgSend(v14, "lfn_appledouble");
        if (v47)
        {
          uint64_t v48 = (void *)v47;
          objc_msgSend(v14, "lfn_appledouble");
          uint64_t v49 = v69 = v18;
          unsigned int v50 = [v49 purpose];

          unsigned int v18 = v69;
          if (v50)
          {
            id v51 = objc_msgSend(v14, "lfn_appledouble");
            [v51 reclaimFile];

            objc_msgSend(v14, "setLfn_appledouble:", 0);
          }
        }
        uint64_t v52 = objc_msgSend(v14, "lfn_appledouble");

        if (!v52)
        {
          unsigned __int8 v53 = [(userFSVolume *)self appleDoubleManager];
          unsigned int v54 = [v71 getFH];
          uint64_t v55 = [v53 AppleDoubleForReadingWithBaseFile:v9 named:v18 inDirectory:v54];
          objc_msgSend(v14, "setLfn_appledouble:", v55);
        }
        objc_msgSend(v14, "lfn_appledouble");
        __int16 v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          unsigned int v56 = objc_msgSend(v14, "lfn_appledouble");
          objc_msgSend(v14, "setLfn_check_appledouble:", objc_msgSend(v56, "containerFileExists"));

          BOOL v57 = objc_msgSend(v14, "lfn_appledouble");
          __int16 v46 = [v57 valueForXattrNamed:v10 posixError:&v75];

          if ((objc_msgSend(v14, "lfn_check_appledouble") & 1) == 0)
          {
            unsigned __int8 v58 = objc_msgSend(v14, "lfn_appledouble");
            [v58 reclaimFile];

            objc_msgSend(v14, "setLfn_appledouble:", 0);
          }
        }
        else
        {
          objc_msgSend(v14, "setLfn_check_appledouble:", 0);
        }
        unsigned int v45 = v71;
      }
      else
      {
        unsigned int v18 = 0;
        unsigned int v45 = 0;
        __int16 v46 = 0;
      }
      __int16 v59 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v72 = v45;
        id v60 = v9;
        uint64_t v70 = v59;
        id v61 = [v60 UTF8String];
        id v62 = [v10 UTF8String];
        id v63 = objc_retainBlock(v11);
        *(_DWORD *)buf = 136316162;
        id v77 = v61;
        __int16 v78 = 2080;
        id v79 = v62;
        __int16 v80 = 2048;
        id v81 = v63;
        __int16 v82 = 1024;
        *(_DWORD *)v83 = v75;
        *(_WORD *)&v83[4] = 2048;
        *(void *)&v83[6] = v46;
        unsigned int v45 = v72;
        _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "LIGetXattr(%s, %s, %p): reply(%d, %p) 3", buf, 0x30u);
      }
      if (v75 == 93)
      {
        [v16 setNegativeForName:v10];
      }
      else if (v46)
      {
        [v16 setData:v46 forName:v10];
      }
      v11[2](v11, v75, v46);

      goto LABEL_19;
    }
    id v73 = 0;
    unsigned int v43 = [v14 getXAttr:v10 withBuffer:&v73];
    unsigned int v18 = (__CFString *)v73;
    unsigned int v75 = v43;
    __int16 v44 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v64 = v9;
      id v65 = v44;
      id v66 = [v64 UTF8String];
      id v67 = [v10 UTF8String];
      id v68 = objc_retainBlock(v11);
      *(_DWORD *)buf = 136316162;
      id v77 = v66;
      __int16 v78 = 2080;
      id v79 = v67;
      __int16 v80 = 2048;
      id v81 = v68;
      __int16 v82 = 1024;
      *(_DWORD *)v83 = v75;
      *(_WORD *)&v83[4] = 2048;
      *(void *)&v83[6] = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "LIGetXattr(%s, %s, %p): reply(%d, %p) 2", buf, 0x30u);
    }
    if (v75 == 93)
    {
      [v16 setNegativeForName:v10];
    }
    else if (v18)
    {
      [v16 setData:v18 forName:v10];
    }
    uint64_t v22 = v75;
    id v20 = v11[2];
    id v21 = v11;
LABEL_14:
    id v23 = v18;
LABEL_18:
    v20(v21, v22, v23);
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  id v13 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v29 = v9;
    id v30 = v13;
    id v31 = [v29 UTF8String];
    id v32 = [v10 UTF8String];
    id v33 = objc_retainBlock(v11);
    *(_DWORD *)buf = 136315906;
    id v77 = v31;
    __int16 v78 = 2080;
    id v79 = v32;
    __int16 v80 = 2048;
    id v81 = v33;
    __int16 v82 = 1024;
    *(_DWORD *)v83 = 93;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "LIGetXattr(%s, %s, %p): reply(%d, nil) filtered xattr", buf, 0x26u);
  }
  v11[2](v11, 93, 0);
LABEL_21:
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  unsigned int v135 = 0;
  id v17 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v36 = v15;
    id v37 = v13;
    __int16 v38 = v17;
    id v39 = [v37 UTF8String];
    id v40 = v13;
    uint64_t v41 = v9;
    id v42 = [v14 UTF8String];
    id v43 = objc_retainBlock(v16);
    *(_DWORD *)buf = 136316162;
    id v145 = v39;
    id v15 = v36;
    __int16 v146 = 2080;
    id v147 = v42;
    uint64_t v9 = v41;
    id v13 = v40;
    __int16 v148 = 2048;
    id v149 = v36;
    __int16 v150 = 1024;
    int v151 = v9;
    __int16 v152 = 2048;
    id v153 = v43;
    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): start", buf, 0x30u);
  }
  if (!sub_100014710(v14))
  {
    id v19 = [(userFSVolume *)self getNodeForFH:v13 withError:&v135];
    id v20 = objc_msgSend(v19, "lfn_xattrCache");
    if (v135)
    {
      int v21 = v9;
      uint64_t v22 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v131 = v15;
        id v97 = v13;
        loga = v22;
        id v98 = [v97 UTF8String];
        unsigned int v99 = v20;
        id v100 = [v14 UTF8String];
        id v101 = objc_retainBlock(v16);
        *(_DWORD *)buf = 136316418;
        id v145 = v98;
        id v15 = v131;
        __int16 v146 = 2080;
        id v147 = v100;
        id v20 = v99;
        __int16 v148 = 2048;
        id v149 = v131;
        __int16 v150 = 1024;
        int v151 = v21;
        __int16 v152 = 2048;
        id v153 = v101;
        __int16 v154 = 1024;
        int v155 = v135;
        _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): reply(%d) 1", buf, 0x36u);
      }
      (*((void (**)(id, void, void, void, void, void, uint64_t))v16 + 2))(v16, v135, 0, 0, 0, 0, 2);
      goto LABEL_82;
    }
    uint64_t v134 = 0;
    uint64_t v23 = v9;
    if (self->_spotlightIsEnabled) {
      int v125 = [(userFSVolume *)self pathStringForNode:v19 name:0 buffer:buf bufferSize:1024 outLength:&v134];
    }
    else {
      int v125 = 0;
    }
    id v24 = [(userFSVolume *)self appleDoubleManager];

    v133 = v20;
    if (v24)
    {
      id v25 = [(userFSVolume *)self rootNode];

      id v130 = v15;
      if (v19 == v25)
      {
        os_log_t log = v19;
        id v26 = @".";
      }
      else
      {
        objc_msgSend(v19, "lfn_name");
        id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lfn_parent");
        os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v44 = objc_msgSend(v19, "lfn_appledouble");
      if (v44)
      {
        unsigned int v45 = (void *)v44;
        __int16 v46 = objc_msgSend(v19, "lfn_appledouble");
        unsigned int v47 = [v46 purpose];

        if (v47 != 1)
        {
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100025BE0();
          }
          uint64_t v48 = objc_msgSend(v19, "lfn_appledouble");
          [v48 reclaimFile];

          objc_msgSend(v19, "setLfn_appledouble:", 0);
        }
      }
      uint64_t v49 = objc_msgSend(v19, "lfn_appledouble");

      if (!v49)
      {
        if (v23 == 3)
        {
          unsigned int v56 = [(userFSVolume *)self appleDoubleManager];
          BOOL v57 = [log getFH];
          unsigned __int8 v58 = [v56 AppleDoubleForReadingWithBaseFile:v13 named:v26 inDirectory:v57];
          objc_msgSend(v19, "setLfn_appledouble:", v58);

          __int16 v59 = objc_msgSend(v19, "lfn_appledouble");

          if (!v59) {
            goto LABEL_76;
          }
          id v60 = objc_msgSend(v19, "lfn_appledouble");
          unsigned __int8 v61 = [v60 containerFileExists];

          id v62 = objc_msgSend(v19, "lfn_appledouble");
          [v62 reclaimFile];

          objc_msgSend(v19, "setLfn_appledouble:", 0);
          if ((v61 & 1) == 0)
          {
LABEL_76:
            v91 = v26;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_100025A88();
            }
            (*((void (**)(id, void, void, void, void, void, uint64_t))v16 + 2))(v16, 0, 0, 0, 0, 0, 2);
            id v30 = 0;
            goto LABEL_79;
          }
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100025BAC();
          }
        }
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100025B78();
        }
        id v63 = [(userFSVolume *)self appleDoubleManager];
        id v64 = [log getFH];
        id v65 = [v63 AppleDoubleForWritingWithBaseFile:v13 named:v26 inDirectory:v64];
        objc_msgSend(v19, "setLfn_appledouble:", v65);

        uint64_t v66 = objc_msgSend(v19, "lfn_appledouble");
        if (v66)
        {
          id v67 = (void *)v66;
          id v68 = objc_msgSend(v19, "lfn_appledouble");
          unsigned int v69 = [v68 ADFileErr];

          if (v69)
          {
            uint64_t v70 = objc_msgSend(v19, "lfn_appledouble");
            unsigned int v135 = [v70 ADFileErr];

            id v71 = objc_msgSend(v19, "lfn_appledouble");
            [v71 reclaimFile];

            objc_msgSend(v19, "setLfn_appledouble:", 0);
            if (v135 == 28)
            {
              int v72 = [(userFSVolume *)self appleDoubleManager];
              [log getFH];
              v74 = id v73 = v26;
              unsigned int v75 = [v72 AppleDoubleForNamespaceWithBaseFile:v13 named:v73 inDirectory:v74];
              objc_msgSend(v19, "setLfn_appledouble:", v75);

              id v26 = v73;
              id v76 = objc_msgSend(v19, "lfn_appledouble");

              if (v76)
              {
                id v77 = objc_msgSend(v19, "lfn_appledouble");
                [v77 removeFile];

                __int16 v78 = objc_msgSend(v19, "lfn_appledouble");
                [v78 reclaimFile];

                objc_msgSend(v19, "setLfn_appledouble:", 0);
              }
            }
            (*((void (**)(id, void, void, void, void, void, uint64_t))v16 + 2))(v16, v135, 0, 0, 0, 0, 2);
            goto LABEL_56;
          }
        }
      }
      unsigned int v50 = objc_msgSend(v19, "lfn_appledouble");

      id v51 = (void *)userfs_log_default;
      BOOL v52 = os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG);
      if (!v50)
      {
        if (v52)
        {
          id v117 = v13;
          __int16 v118 = v51;
          id v119 = (CSLiveFSVolume *)[v117 UTF8String];
          id v120 = [v14 UTF8String];
          id v121 = objc_retainBlock(v16);
          *(_DWORD *)v136 = 136316418;
          v137 = v119;
          __int16 v138 = 2080;
          *(void *)v139 = v120;
          *(_WORD *)&v139[8] = 2048;
          *(void *)&v139[10] = v130;
          *(_WORD *)&v139[18] = 1024;
          *(_DWORD *)&v139[20] = v23;
          __int16 v140 = 2048;
          id v141 = v121;
          __int16 v142 = 1024;
          int v143 = 5;
          _os_log_debug_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): reply(%d) 3", v136, 0x36u);
        }
        (*((void (**)(id, uint64_t, void, void, void, void, uint64_t))v16 + 2))(v16, 5, 0, 0, 0, 0, 2);
LABEL_56:
        id v30 = 0;
        id v15 = v130;
LABEL_80:

        goto LABEL_81;
      }
      if (v52) {
        sub_100025ABC(v51, v19, v23);
      }
      objc_msgSend(v19, "setLfn_check_appledouble:", 1);
      unsigned __int8 v53 = objc_msgSend(v19, "lfn_appledouble");
      unsigned int v54 = v53;
      int v124 = v23;
      if (v23 == 3)
      {
        unsigned int v135 = [v53 removeXattrNamed:v14];

        if (v135) {
          goto LABEL_66;
        }
        [v133 setNegativeForName:v14];
        if (!self->_spotlightIsEnabled || !v125)
        {
LABEL_65:
          if (!v135)
          {
            __int16 v106 = objc_msgSend(v19, "lfn_parent");

            if (v106)
            {
              id v107 = objc_msgSend(v19, "lfn_parent");
              id v90 = objc_msgSend(v107, "lfn_interestedClients");

              if (v90)
              {
                __int16 v108 = objc_msgSend(v19, "lfn_parent");
                id v30 = objc_msgSend(v108, "lfn_fh");

                goto LABEL_68;
              }
LABEL_67:
              id v30 = 0;
LABEL_68:
              v91 = v26;
              v92 = objc_msgSend(v19, "lfn_appledouble");
              [v92 reclaimFile];

              objc_msgSend(v19, "setLfn_appledouble:", 0);
              uint64_t v93 = (void *)userfs_log_default;
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
              {
                id v113 = v13;
                __int16 v114 = v93;
                __int16 v126 = (CSLiveFSVolume *)[v113 UTF8String];
                id v115 = [v14 UTF8String];
                id v116 = objc_retainBlock(v16);
                *(_DWORD *)v136 = 136316418;
                v137 = v126;
                __int16 v138 = 2080;
                *(void *)v139 = v115;
                *(_WORD *)&v139[8] = 2048;
                *(void *)&v139[10] = v130;
                *(_WORD *)&v139[18] = 1024;
                *(_DWORD *)&v139[20] = v124;
                __int16 v140 = 2048;
                id v141 = v116;
                __int16 v142 = 1024;
                int v143 = v135;
                _os_log_debug_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): reply(%d) 4", v136, 0x36u);
              }
              uint64_t v94 = v135;
              id v95 = objc_msgSend(v19, "lfn_name");
              (*((void (**)(id, uint64_t, void *, id, void *, id, id))v16 + 2))(v16, v94, v30, v90, v95, objc_msgSend(v19, "lfn_interestedClients"), objc_msgSend(v19, "hiddenStatus"));

LABEL_79:
              id v15 = v130;
              id v26 = v91;
              goto LABEL_80;
            }
          }
LABEL_66:
          id v90 = 0;
          goto LABEL_67;
        }
        uint64_t v55 = [v19 getAttrData];
        if (v55) {
          [(CSLiveFSVolume *)self->_spotlightNotifer sendXattrRemovedEventForPID:0 path:v125 pathLength:v134 xAttrName:v14 attributes:v55];
        }
      }
      else
      {
        unsigned int v135 = [v53 setValue:v130 forXattrNamed:v14 how:v23];

        if (v135) {
          goto LABEL_66;
        }
        [v133 setData:v130 forName:v14];
        if (!self->_spotlightIsEnabled || !v125) {
          goto LABEL_65;
        }
        uint64_t v55 = [v19 getAttrData];
        if (v55)
        {
          id v87 = userfs_log_default;
          BOOL v88 = os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG);
          id v89 = &selRef_newClientForProvider_;
          if (v88)
          {
            spotlightNotifer = self->_spotlightNotifer;
            *(_DWORD *)v136 = 138413058;
            v137 = spotlightNotifer;
            __int16 v138 = 1024;
            *(_DWORD *)v139 = 0;
            *(_WORD *)&v139[4] = 2080;
            *(void *)&v139[6] = v125;
            *(_WORD *)&v139[14] = 2112;
            *(void *)&v139[16] = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "LISetXattr[ad]:spotlightnotifier:%@:sendXattrModifiedEventForPID:%d:%s:%@", v136, 0x26u);
            id v89 = &selRef_newClientForProvider_;
          }
          [*(id *)&self->LiveFSVolume_opaque[*((int *)v89 + 647)] sendXattrModifiedEventForPID:0 path:v125 pathLength:v134 xAttrName:v14 xAttrValue:v130 attributes:v55];
        }
      }

      goto LABEL_65;
    }
    unsigned int v135 = [v19 setXAttr:v14 withXAttr:v15 how:v23];
    id v27 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v132 = v15;
      id v109 = v13;
      logb = v27;
      __int16 v110 = (CSLiveFSVolume *)[v109 UTF8String];
      id v111 = [v14 UTF8String];
      id v112 = objc_retainBlock(v16);
      *(_DWORD *)v136 = 136316418;
      v137 = v110;
      id v15 = v132;
      __int16 v138 = 2080;
      *(void *)v139 = v111;
      *(_WORD *)&v139[8] = 2048;
      *(void *)&v139[10] = v132;
      *(_WORD *)&v139[18] = 1024;
      *(_DWORD *)&v139[20] = v23;
      __int16 v140 = 2048;
      id v141 = v112;
      __int16 v142 = 1024;
      int v143 = v135;
      _os_log_debug_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): reply(%d) 2", v136, 0x36u);
    }
    if (v135)
    {
      id v28 = v15;
      goto LABEL_21;
    }
    [(userFSVolume *)self startSyncerIfNeeded];
    if (v23 == 3)
    {
      id v28 = v15;
      [v133 setNegativeForName:v14];
      if (self->_spotlightIsEnabled && v125)
      {
        id v96 = [v19 getAttrData];
        if (v96) {
          [(CSLiveFSVolume *)self->_spotlightNotifer sendXattrRemovedEventForPID:0 path:v125 pathLength:v134 xAttrName:v14 attributes:v96];
        }
LABEL_90:
      }
    }
    else
    {
      id v28 = v15;
      [v133 setData:v15 forName:v14];
      if (self->_spotlightIsEnabled && v125)
      {
        id v96 = [v19 getAttrData];
        if (v96)
        {
          __int16 v102 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
          {
            __int16 v122 = self->_spotlightNotifer;
            *(_DWORD *)v136 = 138413058;
            v137 = v122;
            __int16 v138 = 1024;
            *(_DWORD *)v139 = 0;
            *(_WORD *)&v139[4] = 2080;
            *(void *)&v139[6] = v125;
            *(_WORD *)&v139[14] = 2112;
            *(void *)&v139[16] = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "LISetXattr[nxa]:spotlightnotifier:%@:sendXattrModifiedEventForPID:%d:%s:%@", v136, 0x26u);
          }
          [(CSLiveFSVolume *)self->_spotlightNotifer sendXattrModifiedEventForPID:0 path:v125 pathLength:v134 xAttrName:v14 xAttrValue:v28 attributes:v96];
        }
        goto LABEL_90;
      }
    }
    id v103 = objc_msgSend(v19, "lfn_parent");

    if (v103)
    {
      __int16 v104 = objc_msgSend(v19, "lfn_parent");
      id v29 = objc_msgSend(v104, "lfn_interestedClients");

      if (v29)
      {
        id v105 = objc_msgSend(v19, "lfn_parent");
        id v30 = objc_msgSend(v105, "lfn_fh");

        goto LABEL_23;
      }
LABEL_22:
      id v30 = 0;
LABEL_23:
      uint64_t v31 = v135;
      uint64_t v32 = objc_msgSend(v19, "lfn_name");
      id v33 = objc_msgSend(v19, "lfn_interestedClients");
      id v34 = [v19 hiddenStatus];
      id v35 = v29;
      id v26 = (__CFString *)v32;
      (*((void (**)(id, uint64_t, void *, id, uint64_t, id, id))v16 + 2))(v16, v31, v30, v35, v32, v33, v34);
      id v15 = v28;
LABEL_81:

      id v20 = v133;
LABEL_82:

      goto LABEL_83;
    }
LABEL_21:
    id v29 = 0;
    goto LABEL_22;
  }
  unsigned int v18 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v79 = v15;
    id v80 = v13;
    id v81 = v18;
    id v82 = [v80 UTF8String];
    id v83 = v13;
    int v84 = v9;
    id v85 = [v14 UTF8String];
    id v86 = objc_retainBlock(v16);
    *(_DWORD *)buf = 136316418;
    id v145 = v82;
    id v15 = v79;
    __int16 v146 = 2080;
    id v147 = v85;
    __int16 v148 = 2048;
    id v149 = v79;
    __int16 v150 = 1024;
    int v151 = v84;
    id v13 = v83;
    __int16 v152 = 2048;
    id v153 = v86;
    __int16 v154 = 1024;
    int v155 = 45;
    _os_log_debug_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "LISetXattr(%s, %s, %p, %d, %p): reply(%d) filtered xattr", buf, 0x36u);
  }
  (*((void (**)(id, uint64_t, void, void, void, void, uint64_t))v16 + 2))(v16, 45, 0, 0, 0, 0, 2);
LABEL_83:
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v50 = 0;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025CC8();
  }
  uint64_t v9 = [(userFSVolume *)self getNodeForFH:v7 withError:&v50];
  id v10 = objc_msgSend(v9, "lfn_xattrCache");
  id v11 = v10;
  if (v50)
  {
    id v12 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v21 = v7;
      uint64_t v22 = v12;
      id v23 = [v21 UTF8String];
      id v24 = objc_retainBlock(v8);
      *(_DWORD *)buf = 136315906;
      id v52 = v23;
      __int16 v53 = 2048;
      id v54 = v24;
      __int16 v55 = 1024;
      unsigned int v56 = v50;
      __int16 v57 = 2112;
      unsigned __int8 v58 = &__NSArray0__struct;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "LIListXattrs(%s, %p): reply(%d, %@) 1", buf, 0x26u);
    }
    (*((void (**)(id, void, void *))v8 + 2))(v8, v50, &__NSArray0__struct);
  }
  else if ([v10 noXattrsPresent])
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100025C14();
    }
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, &__NSArray0__struct);
  }
  else
  {
    id v13 = [(userFSVolume *)self appleDoubleManager];

    if (v13)
    {
      if (objc_msgSend(v9, "lfn_check_appledouble"))
      {
        id v14 = [(userFSVolume *)self rootNode];

        if (v9 == v14)
        {
          id v15 = v9;
          CFStringRef v48 = @".";
        }
        else
        {
          objc_msgSend(v9, "lfn_name");
          CFStringRef v48 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lfn_parent");
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v26 = objc_msgSend(v9, "lfn_appledouble");
        if (v26)
        {
          id v27 = (void *)v26;
          id v28 = objc_msgSend(v9, "lfn_appledouble");
          unsigned int v29 = [v28 purpose];

          if (v29)
          {
            id v30 = objc_msgSend(v9, "lfn_appledouble");
            [v30 reclaimFile];

            objc_msgSend(v9, "setLfn_appledouble:", 0);
          }
        }
        uint64_t v31 = objc_msgSend(v9, "lfn_appledouble");

        id v19 = (void *)v48;
        if (!v31)
        {
          uint64_t v32 = [(userFSVolume *)self appleDoubleManager];
          id v33 = [v15 getFH];
          id v34 = [v32 AppleDoubleForReadingWithBaseFile:v7 named:v48 inDirectory:v33];
          objc_msgSend(v9, "setLfn_appledouble:", v34);
        }
        id v20 = objc_msgSend(v9, "lfn_appledouble");

        if (v20)
        {
          id v35 = objc_msgSend(v9, "lfn_appledouble");
          objc_msgSend(v9, "setLfn_check_appledouble:", objc_msgSend(v35, "containerFileExists"));

          id v36 = objc_msgSend(v9, "lfn_appledouble");
          id v37 = [v36 allXattrNamesAndPosixError:&v50];
          id v20 = sub_100015DC8(v37);

          if ((objc_msgSend(v9, "lfn_check_appledouble") & 1) == 0)
          {
            __int16 v38 = objc_msgSend(v9, "lfn_appledouble");
            [v38 reclaimFile];

            objc_msgSend(v9, "setLfn_appledouble:", 0);
          }
        }
        else
        {
          objc_msgSend(v9, "setLfn_check_appledouble:", 0);
        }
      }
      else
      {
        id v19 = 0;
        id v15 = 0;
        id v20 = &__NSArray0__struct;
      }
      id v39 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v40 = v7;
        uint64_t v41 = v39;
        id v42 = [v40 UTF8String];
        id v43 = objc_retainBlock(v8);
        *(_DWORD *)buf = 136315906;
        id v52 = v42;
        __int16 v53 = 2048;
        id v54 = v43;
        __int16 v55 = 1024;
        unsigned int v56 = v50;
        __int16 v57 = 2112;
        unsigned __int8 v58 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "LIListXattrs(%s, %p): reply(%d, %@) 4", buf, 0x26u);
      }
      if (!v50) {
        objc_msgSend(v11, "setNoXattrsPresent:", objc_msgSend(v20, "count") == 0);
      }
      (*((void (**)(id))v8 + 2))(v8);
    }
    else
    {
      id v49 = 0;
      unsigned int v16 = [v9 listXattr:&v49];
      id v17 = v49;
      unsigned int v18 = v17;
      unsigned int v50 = v16;
      if (v16 == 45)
      {

        unsigned int v50 = 0;
        id v19 = &__NSArray0__struct;
      }
      else
      {
        id v19 = sub_100015DC8(v17);
      }
      id v25 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v44 = v7;
        unsigned int v45 = v25;
        id v46 = [v44 UTF8String];
        id v47 = objc_retainBlock(v8);
        *(_DWORD *)buf = 136315906;
        id v52 = v46;
        __int16 v53 = 2048;
        id v54 = v47;
        __int16 v55 = 1024;
        unsigned int v56 = v50;
        __int16 v57 = 2112;
        unsigned __int8 v58 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "LIListXattrs(%s, %p): reply(%d, %@) 2", buf, 0x26u);
      }
      if (!v50) {
        objc_msgSend(v11, "setNoXattrsPresent:", objc_msgSend(v19, "count") == 0);
      }
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, uint64_t))a9;
  if (self->_allowSearch)
  {
    unsigned int v18 = [v15 objectForKeyedSubscript:LISearchFileContentsInclude];

    if (v18)
    {
      uint64_t v19 = 45;
    }
    else
    {
      pthread_rwlock_wrlock(&self->searchRequestsRWLock);
      id v20 = [(NSMutableDictionary *)self->searchRequests objectForKeyedSubscript:v14];

      if (v20)
      {
        pthread_rwlock_unlock(&self->searchRequestsRWLock);
        uint64_t v19 = 17;
      }
      else
      {
        id v21 = [[liveFilesSearchRequest alloc] initWithVolume:self withStartLocation:v23 withSearchToken:v14 withSearchCriteria:v15 withProxy:v16 andWithCallerID:a7];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v19 = [(liveFilesSearchRequest *)v21 startSearch];
          if (!v19) {
            [(NSMutableDictionary *)self->searchRequests setObject:v22 forKeyedSubscript:v14];
          }
          pthread_rwlock_unlock(&self->searchRequestsRWLock);
        }
        else
        {
          pthread_rwlock_unlock(&self->searchRequestsRWLock);
          uint64_t v19 = 12;
        }
      }
    }
  }
  else
  {
    uint64_t v19 = 53;
  }
  v17[2](v17, v19);
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  p_searchRequestsRWLock = &self->searchRequestsRWLock;
  id v10 = (void (**)(id, uint64_t))a6;
  id v11 = a3;
  pthread_rwlock_rdlock(p_searchRequestsRWLock);
  id v13 = [(NSMutableDictionary *)self->searchRequests objectForKeyedSubscript:v11];

  if (v13) {
    uint64_t v12 = (uint64_t)[v13 replentishCredits:v6];
  }
  else {
    uint64_t v12 = 2;
  }
  pthread_rwlock_unlock(p_searchRequestsRWLock);
  v10[2](v10, v12);
}

- (void)LIDisableSearch
{
  self->_allowSearch = 0;
}

- (void)LISearchAbortAll
{
  p_searchRequestsRWLock = &self->searchRequestsRWLock;
  pthread_rwlock_rdlock(&self->searchRequestsRWLock);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025D7C();
  }
  [(NSMutableDictionary *)self->searchRequests enumerateKeysAndObjectsUsingBlock:&stru_100038950];
  pthread_rwlock_unlock(p_searchRequestsRWLock);
}

- (void)abortAllClientSearchesFor:(unint64_t)a3
{
  p_searchRequestsRWLock = &self->searchRequestsRWLock;
  pthread_rwlock_rdlock(&self->searchRequestsRWLock);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025DB0();
  }
  searchRequests = self->searchRequests;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016314;
  v7[3] = &unk_100038970;
  v7[4] = a3;
  [(NSMutableDictionary *)searchRequests enumerateKeysAndObjectsUsingBlock:v7];
  pthread_rwlock_unlock(p_searchRequestsRWLock);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a5;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025E18();
  }
  p_searchRequestsRWLock = &self->searchRequestsRWLock;
  pthread_rwlock_rdlock(&self->searchRequestsRWLock);
  id v10 = [(NSMutableDictionary *)self->searchRequests objectForKeyedSubscript:v7];
  id v11 = v10;
  if (v10) {
    uint64_t v12 = (uint64_t)[v10 abortSearch];
  }
  else {
    uint64_t v12 = 2;
  }
  pthread_rwlock_unlock(p_searchRequestsRWLock);
  v8[2](v8, v12);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  unsigned int v23 = 0;
  id v11 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v9;
    id v16 = v11;
    id v17 = [v15 UTF8String];
    id v18 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315650;
    id v25 = v17;
    __int16 v26 = 1024;
    int v27 = a4;
    __int16 v28 = 2048;
    id v29 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "LIOpen(%s, %o, %p): start", buf, 0x1Cu);
  }
  uint64_t v12 = [(userFSVolume *)self getNodeForFH:v9 withError:&v23];
  id v13 = v12;
  if (!v23 || v23 == 70 && v12) {
    objc_msgSend(v12, "setLfn_openCount:", objc_msgSend(v12, "lfn_openCount") + 1);
  }
  id v14 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v9;
    id v20 = v14;
    id v21 = [v19 UTF8String];
    id v22 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315906;
    id v25 = v21;
    __int16 v26 = 1024;
    int v27 = a4;
    __int16 v28 = 2048;
    id v29 = v22;
    __int16 v30 = 1024;
    unsigned int v31 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "LIOpen(%s, %o, %p):  reply(%d)", buf, 0x22u);
  }
  (*((void (**)(id, void))v10 + 2))(v10, v23);
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  unsigned int v41 = 0;
  id v11 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v30 = v9;
    unsigned int v31 = v11;
    id v32 = [v30 UTF8String];
    id v33 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315650;
    id v43 = v32;
    __int16 v44 = 1024;
    int v45 = a4;
    __int16 v46 = 2048;
    id v47 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "LIClose(%s, %o, %p): start", buf, 0x1Cu);
  }
  uint64_t v12 = [(userFSVolume *)self getNodeForFH:v9 withError:&v41];
  id v13 = v12;
  int v39 = a4;
  if (v41) {
    goto LABEL_4;
  }
  if (objc_msgSend(v12, "lfn_wasWritten"))
  {
    [(UserFSSleepManager *)self->_powerAssertManager disableSystemSleepDelayed:self->_metaDataRequests];
    unsigned int v41 = [v13 syncTheFileSystem:1];
    [(UserFSSleepManager *)self->_powerAssertManager reenableSystemSleep];
  }
  if (v41 != 30 && v41)
  {
LABEL_4:
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    BOOL v17 = 0;
    id v18 = 0;
    id v19 = 0;
    goto LABEL_24;
  }
  unsigned int v41 = 0;
  id v18 = objc_msgSend(v13, "lfn_interestedClients");
  uint64_t v20 = objc_msgSend(v13, "lfn_openCount") - 1;
  objc_msgSend(v13, "setLfn_openCount:", v20);
  if (v20)
  {
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    BOOL v17 = 0;
LABEL_11:
    id v19 = 0;
    goto LABEL_24;
  }
  unsigned int v21 = objc_msgSend(v13, "lfn_wasWritten");
  objc_msgSend(v13, "setLfn_wasWritten:", 0);
  BOOL v17 = [v13 hiddenStatus] != 2;
  if (!v21)
  {
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  if (self->_spotlightIsEnabled)
  {
    uint64_t v40 = 0;
    id v22 = [(userFSVolume *)self pathStringForNode:v13 name:0 buffer:buf bufferSize:1024 outLength:&v40];
    if (v22)
    {
      unsigned int v23 = v22;
      spotlightNotifer = self->_spotlightNotifer;
      uint64_t v25 = v40;
      __int16 v26 = [v13 getAttrData];
      [(CSLiveFSVolume *)spotlightNotifer sendEventOfType:4 pid:0 path:v23 pathLength:v25 attributes:v26];
    }
  }
  id v14 = objc_msgSend(v13, "lfn_parent");
  if (!v14)
  {
    id v15 = 0;
LABEL_22:
    id v19 = 0;
    goto LABEL_23;
  }
  int v27 = objc_msgSend(v13, "lfn_parent");
  id v15 = objc_msgSend(v27, "lfn_interestedClients");

  if (!v15)
  {
    id v14 = 0;
    goto LABEL_22;
  }
  __int16 v28 = objc_msgSend(v13, "lfn_parent");
  id v14 = objc_msgSend(v28, "lfn_fh");

  id v29 = objc_msgSend(v13, "lfn_parent");
  id v19 = objc_msgSend(v29, "lfn_interestedClients");

  objc_msgSend(v13, "lfn_name");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
  uint64_t v16 = 1;
LABEL_24:
  id v34 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v36 = v9;
    os_log_t log = v34;
    id v35 = [v36 UTF8String];
    id v37 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136316674;
    id v43 = v35;
    __int16 v44 = 1024;
    int v45 = v39;
    __int16 v46 = 2048;
    id v47 = v37;
    __int16 v48 = 1024;
    unsigned int v49 = v41;
    __int16 v50 = 2048;
    id v51 = v18;
    __int16 v52 = 1024;
    int v53 = v16;
    __int16 v54 = 1024;
    BOOL v55 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "LIClose(%s, %o, %p):  reply(%d, %#llx, %d, %d)", buf, 0x38u);
  }
  (*((void (**)(id, void, void *, id, id, id, uint64_t, BOOL))v10 + 2))(v10, v41, v14, v19, v15, v18, v16, v17);
}

- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  unsigned int v41 = 0;
  id v11 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v31 = v9;
    id v32 = v11;
    id v33 = [v31 UTF8String];
    id v34 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315906;
    id v43 = v33;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 2048;
    id v47 = v34;
    __int16 v48 = 2080;
    v49[0] = dispatch_queue_get_label(0);
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "LIReclaim(%s, %llu, %p): start on %s", buf, 0x2Au);
  }
  uint64_t v12 = [(userFSVolume *)self appleDoubleManager];

  if (v12
    && ([(userFSVolume *)self appleDoubleManager],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 clientID],
        v13,
        v14 == (id)a4))
  {
    unsigned int v15 = 0;
  }
  else
  {
    unsigned int v15 = [(userFSVolume *)self pauseIOQueue];
  }
  uint64_t v16 = [(userFSVolume *)self getNodeForFH:v9 withError:&v41];
  BOOL v17 = v16;
  if (!v41 || (unsigned int v41 = v16 != 0, v16))
  {
    id v18 = objc_msgSend(v16, "lfn_appledouble");

    if (v18)
    {
      id v19 = objc_msgSend(v17, "lfn_appledouble");
      [v19 reclaimFile];

      objc_msgSend(v17, "setLfn_appledouble:", 0);
    }
    unint64_t v20 = (unint64_t)objc_msgSend(v17, "lfn_inUseClientSet");
    objc_msgSend(v17, "setLfn_inUseClientSet:", v20 & ~a4);
    if ((v20 & a4) == 0
      || objc_msgSend(v17, "lfn_inUseClientSet")
      || [v17 getLinkCount] > 1)
    {
      unsigned int v41 = 0;
      goto LABEL_22;
    }
    unsigned int v21 = objc_msgSend(v17, "lfn_name");
    if (([v21 isEqualToString:&stru_100038E98] & 1) == 0)
    {
      id v22 = objc_msgSend(v17, "lfn_parent");

      if (!v22)
      {
LABEL_18:
        [(userFSVolume *)self removeFromFHCache:v17];
        unsigned int v41 = [v17 reclaim];
        if (v41)
        {
          unsigned int v23 = (void *)userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
          {
            id v24 = v9;
            uint64_t v25 = v23;
            id v26 = [v24 UTF8String];
            id v27 = objc_retainBlock(v10);
            *(_DWORD *)buf = 136315906;
            id v43 = v26;
            __int16 v44 = 2048;
            unint64_t v45 = a4;
            __int16 v46 = 2048;
            id v47 = v27;
            __int16 v48 = 1024;
            LODWORD(v49[0]) = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "LIReclaim(%s, %llu, %p): fs reclaim error: %d", buf, 0x26u);
          }
        }
        goto LABEL_22;
      }
      unsigned int v21 = objc_msgSend(v17, "lfn_parent");
      [(userFSVolume *)self removeFromNameCache:v17 withParent:v21];
    }

    goto LABEL_18;
  }
LABEL_22:
  if (v15) {
    [(userFSVolume *)self resumeIOQueue];
  }
  __int16 v28 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v35 = v9;
    id v36 = v28;
    id v37 = [v35 UTF8String];
    id v38 = objc_retainBlock(v10);
    unsigned int v39 = v41;
    label = dispatch_queue_get_label(0);
    *(_DWORD *)buf = 136316162;
    id v43 = v37;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 2048;
    id v47 = v38;
    __int16 v48 = 1024;
    LODWORD(v49[0]) = v39;
    WORD2(v49[0]) = 2080;
    *(void *)((char *)v49 + 6) = label;
    _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "LIReclaim(%s, %llu, %p): reply(%d) on %s", buf, 0x30u);
  }
  uint64_t v29 = v41;
  id v30 = [(userFSVolume *)self getFreeSpaceInVolume];
  (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, v29, v30);
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a7;
  unint64_t v13 = ~a5;
  if (![v11 isEqualToString:LIUpdateNSFileProviderRootContainerItemIdentifier])
  {
    uint64_t v16 = [(NSMutableDictionary *)self->mountFHtoNodeTable objectForKey:v11];
    if (!v16)
    {
      NSErrorDomain v14 = NSPOSIXErrorDomain;
      uint64_t v15 = 2;
      goto LABEL_17;
    }
    BOOL v17 = v16;
    unint64_t v18 = (unint64_t)objc_msgSend(v16, "lfn_interestedClients");
    if (v9) {
      unint64_t v19 = v18 | a5;
    }
    else {
      unint64_t v19 = v18 & v13;
    }
    objc_msgSend(v17, "setLfn_interestedClients:", v19);

LABEL_20:
    id v27 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v20 = [(NSMutableDictionary *)self->mountFHtoNodeTable allKeys];
    id v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v21)
    {
      id v22 = v21;
      id v31 = v12;
      unsigned int v23 = 0;
      uint64_t v24 = *(void *)v36;
      do
      {
        uint64_t v25 = 0;
        id v26 = v23;
        do
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v20);
          }
          unsigned int v23 = [(NSMutableDictionary *)self->mountFHtoNodeTable objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)v25)];

          objc_msgSend(v23, "setLfn_interestedClients:", (unint64_t)objc_msgSend(v23, "lfn_interestedClients") & v13);
          uint64_t v25 = (char *)v25 + 1;
          id v26 = v23;
        }
        while (v22 != v25);
        id v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v22);

      id v12 = v31;
    }

    goto LABEL_20;
  }
  NSErrorDomain v14 = NSPOSIXErrorDomain;
  uint64_t v15 = 22;
LABEL_17:
  id v27 = +[NSError errorWithDomain:v14 code:v15 userInfo:0];
LABEL_21:
  __int16 v28 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017208;
  block[3] = &unk_100038998;
  id v33 = v27;
  id v34 = v12;
  id v29 = v27;
  id v30 = v12;
  dispatch_async(v28, block);
}

- (void)invalidateFileNodesForConnection:(unint64_t)a3
{
  signed int v5 = [(userFSVolume *)self metaDataRequests];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000172B0;
  v6[3] = &unk_1000389C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (int)searchVolume:(id)a3 withCriteria:(id)a4 withSearchToken:(id)a5 andWithResultsHandler:(id)a6
{
  id v122 = a3;
  id v121 = a4;
  id v124 = a5;
  id v119 = a6;
  uint64_t v199 = 0;
  v200[0] = &v199;
  v200[1] = 0x2020000000;
  int v201 = 0;
  v123 = objc_alloc_init(pathStack);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000261C0();
  }
  pthread_rwlock_rdlock(&self->searchRequestsRWLock);
  id v10 = [(NSMutableDictionary *)self->searchRequests objectForKey:v124];
  pthread_rwlock_unlock(&self->searchRequestsRWLock);
  __int16 v128 = v10;
  p_searchRequestsRWLock = &self->searchRequestsRWLock;
  if (v10)
  {
    if (([v10 aborted] & 1) != 0 || !-[userFSVolume allowSearch](self, "allowSearch"))
    {
      *(_DWORD *)(v200[0] + 24) = 53;
      __int16 v108 = userfs_log_default;
      if (!os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO)) {
        goto LABEL_151;
      }
      *(_WORD *)v216 = 0;
      id v109 = "searchVolume:searchRequest:aborted";
      goto LABEL_141;
    }
    id v11 = [(userFSVolume *)self volumeRawDevice];
    id v12 = [v11 fsPlugin];
    uint64_t v13 = *((void *)[v12 FSOps] + 30);

    if (v13)
    {
      NSErrorDomain v14 = (id)userfs_log_default;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = [v128 startLocation];
        sub_100026170(v15, (uint64_t)v227, v14);
      }

      *(_DWORD *)(v200[0] + 24) = 0;
      uint64_t v16 = [v128 startLocation];
      BOOL v17 = +[pathElement pathElementFromName:0 withParentFH:v16 withCookie:0 andWithCookieVerifier:0];
      [(pathStack *)v123 push:v17];

      unint64_t v18 = 0;
      while (1)
      {
        id v127 = [(pathStack *)v123 pop];

        if (!v127 || ([v128 aborted] & 1) != 0) {
          break;
        }
        uint64_t v193 = 0;
        v194 = &v193;
        uint64_t v195 = 0x3032000000;
        v196 = sub_10000B7D4;
        v197 = sub_10000B7E4;
        id v198 = 0;
        uint64_t v187 = 0;
        v188 = &v187;
        uint64_t v189 = 0x3032000000;
        v190 = sub_10000B7D4;
        v191 = sub_10000B7E4;
        id v192 = 0;
        id v186 = 0;
        id v186 = [v127 cookie];
        v185 = 0;
        v185 = (uint64_t (*)(uint64_t, uint64_t))[v127 cookieVerifier];
        unint64_t v19 = (id)userfs_log_default;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v100 = [v127 parentFH];
          id v101 = [v127 elementName];
          *(_DWORD *)v216 = 138412546;
          *(void *)&v216[4] = v100;
          *(_WORD *)&v216[12] = 2112;
          *(void *)&v216[14] = v101;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "searchVolume:pop:%@/%@", v216, 0x16u);
        }
        unint64_t v20 = [v127 elementName];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          uint64_t v27 = [v127 parentFH];
          __int16 v28 = (void *)v194[5];
          v194[5] = v27;

LABEL_22:
          id v29 = [(userFSVolume *)self metaDataRequests];
          v179[0] = _NSConcreteStackBlock;
          v179[1] = 3221225472;
          v179[2] = sub_100019384;
          v179[3] = &unk_100038A38;
          v179[5] = &v187;
          v179[4] = self;
          v179[6] = &v193;
          v179[7] = &v199;
          dispatch_sync(v29, v179);

          id v30 = v127;
          id v31 = v128;
          if (*(_DWORD *)(v200[0] + 24))
          {
            id v32 = (id)userfs_log_default;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              uint64_t v104 = v194[5];
              id v105 = [v127 parentFH];
              *(_DWORD *)v216 = 138412546;
              *(void *)&v216[4] = v104;
              *(_WORD *)&v216[12] = 2112;
              *(void *)&v216[14] = v105;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to get the node(reclaimed?) for %@, skipping in: %@", v216, 0x16u);
            }
            int v26 = 3;
            goto LABEL_136;
          }
          while (2)
          {
            if ([v30 cookie] == (id)-1 || (objc_msgSend(v31, "aborted") & 1) != 0)
            {
LABEL_133:
              id v98 = (id)userfs_log_default;
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              {
                id v106 = [(id)v188[5] getFH];
                id v107 = objc_msgSend((id)v188[5], "lfn_name");
                *(_DWORD *)v216 = 138412546;
                *(void *)&v216[4] = v106;
                *(_WORD *)&v216[12] = 2112;
                *(void *)&v216[14] = v107;
                _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "searchVolume:scanDir:done:reclaiming %@[%@]", v216, 0x16u);
              }
              unsigned int v99 = [(userFSVolume *)self metaDataRequests];
              v133[0] = _NSConcreteStackBlock;
              v133[1] = 3221225472;
              v133[2] = sub_100019ACC;
              v133[3] = &unk_100038B68;
              v133[4] = self;
              unsigned int v135 = &v187;
              id v134 = v128;
              dispatch_sync(v99, v133);

              int v26 = 0;
              goto LABEL_136;
            }
            int v178 = 0;
            uint64_t v226 = 0;
            long long v224 = 0u;
            long long v225 = 0u;
            long long v222 = 0u;
            long long v223 = 0u;
            long long v220 = 0u;
            long long v221 = 0u;
            long long v218 = 0u;
            long long v219 = 0u;
            long long v217 = 0u;
            memset(v216, 0, sizeof(v216));
            id v89 = (void *)v188[5];
            id v90 = [v128 searchCriteria];
            id v177 = 0;
            LODWORD(v89) = [v89 scanDirectoryForMatches:v90 withScanDirCookie:&v186 withScanDirCookieVerifier:&v185 withSearchResultType:&v178 withSearchResult:&v177 withSearchResultAttr:v216];
            id v126 = v177;
            *(_DWORD *)(v200[0] + 24) = v89;

            uint64_t v91 = v200[0];
            int v92 = *(_DWORD *)(v200[0] + 24);
            if (v92 <= -1001)
            {
              if (v92 != -1002)
              {
                if (v92 == -1001)
                {
                  id v39 = 0;
                  id v45 = 0;
                  goto LABEL_124;
                }
LABEL_118:
                uint64_t v94 = userfs_log_default;
                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100026030(v214, (uint64_t)v200, v215, v94);
                }
                id v39 = 0;
                id v45 = 0;
LABEL_129:
                int v26 = 2;
LABEL_130:

                id v30 = v127;
                id v31 = v128;
                if (v26 && v26 != 5)
                {
                  if (v26 != 6) {
                    goto LABEL_136;
                  }
                  goto LABEL_133;
                }
                continue;
              }
              id v95 = (id)userfs_log_default;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)v188[5], "lfn_name");
                objc_claimAutoreleasedReturnValue();
                sub_100026084();
              }

              id v39 = 0;
              id v45 = 0;
              uint64_t v91 = v200[0];
LABEL_124:
              *(_DWORD *)(v91 + 24) = 0;
LABEL_125:
              int v26 = 6;
              goto LABEL_130;
            }
            break;
          }
          if (v92 == -1000)
          {
            id v96 = (id)userfs_log_default;
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              id v97 = objc_msgSend((id)v188[5], "lfn_name");
              *(_DWORD *)v210 = 138412290;
              *(void *)&v210[4] = v97;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "searchVolume:scanDir:dir:changed:%@", v210, 0xCu);
            }
            id v39 = 0;
            id v45 = 0;
            *(_DWORD *)(v200[0] + 24) = 35;
            goto LABEL_129;
          }
          if (v92) {
            goto LABEL_118;
          }
          [v127 setCookie:v186];
          [v127 setCookieVerifier:v185];
          uint64_t v93 = (id)userfs_log_default;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v75 = objc_msgSend((id)v188[5], "lfn_name");
            *(_DWORD *)v210 = 138413058;
            *(void *)&v210[4] = v75;
            *(_WORD *)&v210[12] = 2048;
            *(void *)&v210[14] = v186;
            *(_WORD *)&v210[22] = 2048;
            v211 = v185;
            LOWORD(v212) = 1024;
            *(_DWORD *)((char *)&v212 + 2) = v178;
            _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "searchVolume:scanDir:%@:cookie:%#llx:cookieVerf:%#llx:action:%u", v210, 0x26u);
          }
          int v70 = v178;
          if ((v178 & 1) == 0)
          {
            id v39 = 0;
            if ((v178 & 2) == 0)
            {
LABEL_116:
              if (v70 || [v127 cookie] == (id)-1)
              {
                id v45 = 0;
                int v26 = 0;
                goto LABEL_130;
              }
              __int16 v44 = (id)userfs_log_default;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
              {
                id v84 = [v127 cookie];
                *(_DWORD *)v210 = 134217984;
                *(void *)&v210[4] = v84;
                _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "search: Recieved No Action but cookie is not EOF [%llu]", v210, 0xCu);
              }

              id v45 = 0;
              goto LABEL_125;
            }
LABEL_84:
            *(void *)v210 = 0;
            *(void *)&v210[8] = v210;
            *(void *)&v210[16] = 0x3032000000;
            v211 = sub_10000B7D4;
            v212 = sub_10000B7E4;
            id v213 = 0;
            if (([v126 isEqualToString:@"."] & 1) != 0
              || [v126 isEqualToString:@".."])
            {
              id v71 = userfs_log_default;
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v126;
                _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "searchVolume:skipping:%@", buf, 0xCu);
              }
              id v45 = 0;
              int v26 = 5;
            }
            else
            {
              int v72 = [(userFSVolume *)self metaDataRequests];
              v137[0] = _NSConcreteStackBlock;
              v137[1] = 3221225472;
              v137[2] = sub_100019988;
              v137[3] = &unk_100038A60;
              v137[4] = self;
              __int16 v140 = &v187;
              id v73 = v126;
              id v138 = v73;
              id v139 = v128;
              id v141 = &v199;
              __int16 v142 = v210;
              dispatch_sync(v72, v137);

              unsigned __int8 v74 = userfs_log_default;
              if (*(_DWORD *)(v200[0] + 24))
              {
                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
                {
                  int v85 = *(_DWORD *)(v200[0] + 24);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&uint8_t buf[4] = v85;
                  *(_WORD *)&buf[8] = 2112;
                  *(void *)&buf[10] = v73;
                  _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "searchVolume:push:lookup:failed:%d:skipping:%@", buf, 0x12u);
                }
                id v45 = 0;
                int v26 = 5;
              }
              else
              {
                id v76 = (id)userfs_log_default;
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                {
                  id v86 = [v127 elementName];
                  id v87 = [v127 cookie];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v86;
                  *(_WORD *)&unsigned char buf[12] = 2048;
                  *(void *)&buf[14] = v87;
                  _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "searchVolume:push:[%@]@%#llx", buf, 0x16u);
                }
                [(pathStack *)v123 push:v127];
                id v45 = (id)v188[5];
                id v77 = [(userFSVolume *)self metaDataRequests];
                v136[0] = _NSConcreteStackBlock;
                v136[1] = 3221225472;
                v136[2] = sub_100019A6C;
                v136[3] = &unk_100038A38;
                v136[5] = &v187;
                uint8_t v136[4] = self;
                v136[6] = v210;
                v136[7] = &v199;
                dispatch_sync(v77, v136);

                __int16 v78 = userfs_log_default;
                if (*(_DWORD *)(v200[0] + 24))
                {
                  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
                  {
                    int v88 = *(_DWORD *)(v200[0] + 24);
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v88;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v73;
                    _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "searchVolume:push:getfh:failed:%d:skipping:%@", buf, 0x12u);
                  }
                  int v26 = 2;
                }
                else
                {
                  id v80 = (id)userfs_log_default;
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend((id)v188[5], "lfn_name");
                    objc_claimAutoreleasedReturnValue();
                    sub_1000260D8();
                  }

                  id v81 = objc_msgSend((id)v188[5], "lfn_name");
                  id v82 = [v45 getFH];
                  id v83 = +[pathElement pathElementFromName:v81 withParentFH:v82 withCookie:0 andWithCookieVerifier:0];
                  [(pathStack *)v123 push:v83];

                  int v26 = 6;
                }
              }
            }
            _Block_object_dispose(v210, 8);

            goto LABEL_130;
          }
          id v33 = [(pathStack *)v123 fullPath];
          uint64_t v34 = [v127 elementName];
          id v35 = objc_alloc_init((Class)NSMutableString);
          if (v33 && ([v33 isEqualToString:&stru_100038E98] & 1) == 0) {
            [v35 appendFormat:@"%@/", v33];
          }
          if (v34) {
            [v35 appendFormat:@"%@/", v34];
          }
          [v35 appendString:v126];
          long long v36 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v210 = 138412290;
            *(void *)&v210[4] = v35;
            _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "searchVolume:match:%@", v210, 0xCu);
          }
          long long v37 = [v121 objectForKeyedSubscript:LISearchObjXattrsToReturn];
          id v117 = v35;
          id v115 = v33;
          id v116 = (void *)v34;

          if (v37)
          {
            uint64_t v173 = 0;
            v174 = &v173;
            uint64_t v175 = 0x2020000000;
            int v176 = 0;
            *(void *)v210 = 0;
            *(void *)&v210[8] = v210;
            *(void *)&v210[16] = 0x3032000000;
            v211 = sub_10000B7D4;
            v212 = sub_10000B7E4;
            id v213 = 0;
            long long v38 = (id)userfs_log_default;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              [v121 objectForKeyedSubscript:LISearchObjXattrsToReturn];
              objc_claimAutoreleasedReturnValue();
              sub_100026124();
            }

            id v39 = objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v40 = [(userFSVolume *)self metaDataRequests];
            v167[0] = _NSConcreteStackBlock;
            v167[1] = 3221225472;
            v167[2] = sub_1000193E4;
            v167[3] = &unk_100038A60;
            v167[4] = self;
            v170 = &v187;
            id v41 = v126;
            id v168 = v41;
            id v114 = v128;
            id v169 = v114;
            v171 = &v173;
            v172 = v210;
            dispatch_sync(v40, v167);

            int v42 = *((_DWORD *)v174 + 6);
            if (v42)
            {
              id v43 = userfs_log_default;
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v41;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "search: lookup failed, skipping posting result for %@", buf, 0xCu);
              }
            }
            else
            {
              long long v165 = 0u;
              long long v166 = 0u;
              long long v163 = 0u;
              long long v164 = 0u;
              __int16 v46 = [v121 objectForKeyedSubscript:LISearchObjXattrsToReturn];
              id v47 = [v46 countByEnumeratingWithState:&v163 objects:v209 count:16];
              if (v47)
              {
                id v129 = v46;
                uint64_t v130 = *(void *)v164;
                do
                {
                  uint64_t v48 = 0;
                  id v131 = v47;
                  do
                  {
                    if (*(void *)v164 != v130) {
                      objc_enumerationMutation(v46);
                    }
                    unsigned int v49 = *(void **)(*((void *)&v163 + 1) + 8 * v48);
                    *(void *)buf = 0;
                    *(void *)&buf[8] = buf;
                    *(void *)&buf[16] = 0x3032000000;
                    v206 = sub_10000B7D4;
                    v207 = sub_10000B7E4;
                    id v208 = 0;
                    uint64_t v157 = 0;
                    v158 = &v157;
                    uint64_t v159 = 0x3032000000;
                    v160 = sub_10000B7D4;
                    v161 = sub_10000B7E4;
                    id v162 = 0;
                    uint64_t v132 = v48;
                    if ([v49 hasSuffix:@"*"])
                    {
                      __int16 v50 = objc_msgSend(v49, "substringToIndex:", (char *)objc_msgSend(v49, "length") - 1);
                      id v51 = userfs_log_default;
                      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)v202 = 138412290;
                        *(void *)v203 = v50;
                        _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "search: xattrNamePrefix = '%@'", v202, 0xCu);
                      }
                      __int16 v52 = [(userFSVolume *)self metaDataRequests];
                      v156[0] = _NSConcreteStackBlock;
                      v156[1] = 3221225472;
                      v156[2] = sub_10001952C;
                      v156[3] = &unk_100038AB0;
                      v156[4] = self;
                      v156[5] = v210;
                      v156[6] = &v173;
                      v156[7] = &v157;
                      dispatch_sync(v52, v156);

                      if (!*((_DWORD *)v174 + 6) && v158[5])
                      {
                        long long v154 = 0u;
                        long long v155 = 0u;
                        long long v152 = 0u;
                        long long v153 = 0u;
                        id v53 = (id)v158[5];
                        id v54 = [v53 countByEnumeratingWithState:&v152 objects:v204 count:16];
                        if (v54)
                        {
                          uint64_t v55 = *(void *)v153;
                          do
                          {
                            for (i = 0; i != v54; i = (char *)i + 1)
                            {
                              if (*(void *)v153 != v55) {
                                objc_enumerationMutation(v53);
                              }
                              __int16 v57 = *(void **)(*((void *)&v152 + 1) + 8 * i);
                              if ([v57 hasPrefix:v50])
                              {
                                unsigned __int8 v58 = userfs_log_default;
                                if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)v202 = 138412546;
                                  *(void *)v203 = v57;
                                  *(_WORD *)&v203[8] = 2112;
                                  *(void *)&v203[10] = v50;
                                  _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "search: xattr name '%@' matches prefix '%@'", v202, 0x16u);
                                }
                                __int16 v59 = [(userFSVolume *)self metaDataRequests];
                                v147[0] = _NSConcreteStackBlock;
                                v147[1] = 3221225472;
                                v147[2] = sub_100019634;
                                v147[3] = &unk_100038AD8;
                                v147[4] = self;
                                v147[5] = v57;
                                id v149 = v210;
                                __int16 v150 = &v173;
                                int v151 = buf;
                                id v148 = v39;
                                dispatch_sync(v59, v147);
                              }
                            }
                            id v54 = [v53 countByEnumeratingWithState:&v152 objects:v204 count:16];
                          }
                          while (v54);
                        }
                      }
                    }
                    else
                    {
                      id v60 = [(userFSVolume *)self metaDataRequests];
                      v146[0] = _NSConcreteStackBlock;
                      v146[1] = 3221225472;
                      v146[2] = sub_1000197C0;
                      v146[3] = &unk_100038B00;
                      v146[4] = self;
                      v146[5] = v49;
                      v146[6] = v210;
                      v146[7] = &v173;
                      v146[8] = buf;
                      dispatch_sync(v60, v146);

                      int v61 = *((_DWORD *)v174 + 6);
                      if (v61 != 93)
                      {
                        if (v61)
                        {
                          id v63 = userfs_log_default;
                          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
                          {
                            int v64 = *((_DWORD *)v174 + 6);
                            *(_DWORD *)v202 = 67109378;
                            *(_DWORD *)v203 = v64;
                            *(_WORD *)&v203[4] = 2112;
                            *(void *)&v203[6] = v49;
                            _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "search: got error %d from getXAttr for '%@'", v202, 0x12u);
                          }
                        }
                        else
                        {
                          uint64_t v62 = *(void *)(*(void *)&buf[8] + 40);
                          if (v62) {
                            [v39 setObject:v62 forKeyedSubscript:v49];
                          }
                        }
                      }
                    }
                    _Block_object_dispose(&v157, 8);

                    _Block_object_dispose(buf, 8);
                    uint64_t v48 = v132 + 1;
                    __int16 v46 = v129;
                  }
                  while ((id)(v132 + 1) != v131);
                  id v47 = [v129 countByEnumeratingWithState:&v163 objects:v209 count:16];
                }
                while (v47);
              }

              id v65 = [(userFSVolume *)self metaDataRequests];
              v143[0] = _NSConcreteStackBlock;
              v143[1] = 3221225472;
              v143[2] = sub_1000198CC;
              v143[3] = &unk_100038B68;
              v143[4] = self;
              id v145 = v210;
              id v144 = v114;
              dispatch_async(v65, v143);

              int v42 = 0;
            }

            _Block_object_dispose(v210, 8);
            _Block_object_dispose(&v173, 8);
            if (!v42)
            {
LABEL_77:
              uint64_t v66 = (id)userfs_log_default;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                id v79 = objc_msgSend((id)v188[5], "lfn_name");
                *(_DWORD *)v210 = 138412546;
                *(void *)&v210[4] = v79;
                *(_WORD *)&v210[12] = 2112;
                *(void *)&v210[14] = v117;
                _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "searchVolume:scanDir:%@:match:%@:posting", v210, 0x16u);
              }
              id v67 = [v128 resultsHandler];
              id v68 = v67;
              if (v39) {
                unsigned int v69 = v39;
              }
              else {
                unsigned int v69 = &__NSDictionary0__struct;
              }
              [v67 addSearchResult:v117 attributes:v216 attributeSize:184 xAttrs:v69];
            }
            int v70 = v178;
            if ((v178 & 2) == 0) {
              goto LABEL_116;
            }
            goto LABEL_84;
          }
          id v39 = 0;
          goto LABEL_77;
        }
        id v22 = [(userFSVolume *)self metaDataRequests];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100019298;
        block[3] = &unk_100038A10;
        void block[4] = self;
        id v23 = v127;
        id v181 = v23;
        id v182 = v128;
        v183 = &v199;
        v184 = &v193;
        dispatch_sync(v22, block);

        int v24 = *(_DWORD *)(v200[0] + 24);
        if (v24)
        {
          uint64_t v25 = (id)userfs_log_default;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v102 = [v23 elementName];
            id v103 = [v23 parentFH];
            *(_DWORD *)v216 = 138412546;
            *(void *)&v216[4] = v102;
            *(_WORD *)&v216[12] = 2112;
            *(void *)&v216[14] = v103;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to lookup: %@, skipping in: %@", v216, 0x16u);
          }
          int v26 = 3;
        }
        else
        {
          int v26 = 0;
        }

        if (!v24) {
          goto LABEL_22;
        }
LABEL_136:
        _Block_object_dispose(&v187, 8);

        _Block_object_dispose(&v193, 8);
        unint64_t v18 = v127;
        if (v26)
        {
          unint64_t v18 = v127;
          if (v26 != 3)
          {

            id v10 = v128;
            goto LABEL_151;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100025FFC();
      }
      *(_DWORD *)(v200[0] + 24) = 45;
    }
    id v10 = v128;
    if ([v128 aborted])
    {
      *(_DWORD *)(v200[0] + 24) = 53;
      __int16 v108 = userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v216 = 0;
        id v109 = "searchVolume:searchRequest:aborted during search";
LABEL_141:
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, v109, v216, 2u);
      }
    }
  }
  else
  {
    *(_DWORD *)(v200[0] + 24) = 2;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100025F8C();
      id v10 = 0;
    }
  }
LABEL_151:
  __int16 v110 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    int v111 = *(_DWORD *)(v200[0] + 24);
    *(_DWORD *)v216 = 138412546;
    *(void *)&v216[4] = v122;
    *(_WORD *)&v216[12] = 1024;
    *(_DWORD *)&v216[14] = v111;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "searchVolume:posting:done:%@:%d", v216, 0x12u);
  }
  id v112 = [v10 resultsHandler];
  [v112 tokenDone:*(unsigned int *)(v200[0] + 24)];

  pthread_rwlock_wrlock(p_searchRequestsRWLock);
  [(NSMutableDictionary *)self->searchRequests removeObjectForKey:v124];
  pthread_rwlock_unlock(p_searchRequestsRWLock);
  [v128 invalidateConnections];
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025F24();
  }
  dispatch_group_leave((dispatch_group_t)self->_searchGroup);

  _Block_object_dispose(&v199, 8);
  return 0;
}

- (void)verifyExistenceWithFileIDs:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)[v6 length] >> 3;
  if (v8)
  {
    +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", (unint64_t)[v6 length] >> 3);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100019D20;
    v21[3] = &unk_100038BB0;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v9;
    int v23 = v8;
    id v10 = objc_retainBlock(v21);
    IOGroup = self->_IOGroup;
    IORequests = self->_IORequests;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100019D64;
    v15[3] = &unk_100038BD8;
    v15[4] = self;
    int v20 = v8;
    id v16 = v6;
    id v18 = v10;
    id v19 = v7;
    id v17 = v9;
    id v13 = v9;
    NSErrorDomain v14 = v10;
    dispatch_group_async(IOGroup, IORequests, v15);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 22, 0);
  }
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = (unint64_t)[v7 length] >> 3;
  if (v9)
  {
    id v10 = [(liveFSNode *)self->_rootNode getAttrData];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = *((void *)[v10 bytes] + 8);
      IOGroup = self->_IOGroup;
      IORequests = self->_IORequests;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019F4C;
      block[3] = &unk_100038C28;
      int v20 = v9;
      id v16 = v7;
      id v17 = self;
      id v18 = v8;
      uint64_t v19 = v12;
      dispatch_group_async(IOGroup, IORequests, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 22, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 22, 0);
  }
}

- (id)getFreeSpaceInVolume
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10000B7D4;
  uint64_t v12 = sub_10000B7E4;
  id v13 = 0;
  unsigned int v3 = [(userFSVolume *)self rootNode];
  signed int v4 = [v3 getFH];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A660;
  v7[3] = &unk_100038C50;
  v7[4] = self;
  void v7[5] = &v8;
  [(userFSVolume *)self otherAttributeOf:v4 named:@"_N_f_bavail" requestID:-1 reply:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (LiveFSRawDevice)volumeRawDevice
{
  return (LiveFSRawDevice *)objc_getProperty(self, a2, 536, 1);
}

- (void)setVolumeRawDevice:(id)a3
{
}

- (int)volumeDeviceFD
{
  return self->_volumeDeviceFD;
}

- (void)setVolumeDeviceFD:(int)a3
{
  self->_volumeDeviceFD = a3;
}

- (liveFSNode)rootNode
{
  return (liveFSNode *)objc_getProperty(self, a2, 544, 1);
}

- (void)setRootNode:(id)a3
{
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 552, 1);
}

- (void)setVolumeName:(id)a3
{
}

- (NSString)volumeLabel
{
  return (NSString *)objc_getProperty(self, a2, 560, 1);
}

- (void)setVolumeLabel:(id)a3
{
}

- (NSString)serialQueueName
{
  return (NSString *)objc_getProperty(self, a2, 568, 1);
}

- (void)setSerialQueueName:(id)a3
{
}

- (NSString)concurrentQueueName
{
  return (NSString *)objc_getProperty(self, a2, 576, 1);
}

- (void)setConcurrentQueueName:(id)a3
{
}

- (NSString)metaDataQueueNamePrefix
{
  return (NSString *)objc_getProperty(self, a2, 584, 1);
}

- (void)setMetaDataQueueNamePrefix:(id)a3
{
}

- (OS_dispatch_queue)metaDataRequests
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592, 1);
}

- (void)setMetaDataRequests:(id)a3
{
}

- (OS_dispatch_queue)IORequests
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 600, 1);
}

- (void)setIORequests:(id)a3
{
}

- (OS_dispatch_queue)SearchRequests
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 608, 1);
}

- (void)setSearchRequests:(id)a3
{
}

- (OS_dispatch_group)IOGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 616, 1);
}

- (void)setIOGroup:(id)a3
{
}

- (OS_dispatch_group)searchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSearchGroup:(id)a3
{
}

- (BOOL)allowSearch
{
  return self->_allowSearch;
}

- (void)setAllowSearch:(BOOL)a3
{
  self->_allowSearch = a3;
}

- (LiveFSAppleDoubleManager)appleDoubleManager
{
  return (LiveFSAppleDoubleManager *)objc_getProperty(self, a2, 632, 1);
}

- (void)setAppleDoubleManager:(id)a3
{
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)useKOIO
{
  return self->_useKOIO;
}

- (void)setUseKOIO:(BOOL)a3
{
  self->_useKOIO = a3;
}

- (BOOL)spotlightIsEnabled
{
  return self->_spotlightIsEnabled;
}

- (void)setSpotlightIsEnabled:(BOOL)a3
{
  self->_spotlightIsEnabled = a3;
}

- (OS_os_transaction)os_transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 640, 1);
}

- (void)setOs_transaction:(id)a3
{
}

- (CSLiveFSVolume)spotlightNotifer
{
  return (CSLiveFSVolume *)objc_getProperty(self, a2, 648, 1);
}

- (void)setSpotlightNotifer:(id)a3
{
}

- (UserFSSleepManager)powerAssertManager
{
  return (UserFSSleepManager *)objc_getProperty(self, a2, 656, 1);
}

- (void)setPowerAssertManager:(id)a3
{
}

- (NSError)errorState
{
  return (NSError *)objc_getProperty(self, a2, 664, 1);
}

- (void)setErrorState:(id)a3
{
}

- (LIFSPreVolume)preVolInfo
{
  return (LIFSPreVolume *)objc_getProperty(self, a2, 672, 1);
}

- (void)setPreVolInfo:(id)a3
{
}

- (LiveFSServiceUserClient)kernelUserClient
{
  return (LiveFSServiceUserClient *)objc_getProperty(self, a2, 680, 1);
}

- (void)setKernelUserClient:(id)a3
{
}

- (NSString)fsType
{
  return (NSString *)objc_getProperty(self, a2, 688, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsType, 0);
  objc_storeStrong((id *)&self->_kernelUserClient, 0);
  objc_storeStrong((id *)&self->_preVolInfo, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_powerAssertManager, 0);
  objc_storeStrong((id *)&self->_spotlightNotifer, 0);
  objc_storeStrong((id *)&self->_os_transaction, 0);
  objc_storeStrong((id *)&self->_appleDoubleManager, 0);
  objc_storeStrong((id *)&self->_searchGroup, 0);
  objc_storeStrong((id *)&self->_IOGroup, 0);
  objc_storeStrong((id *)&self->_SearchRequests, 0);
  objc_storeStrong((id *)&self->_IORequests, 0);
  objc_storeStrong((id *)&self->_metaDataRequests, 0);
  objc_storeStrong((id *)&self->_metaDataQueueNamePrefix, 0);
  objc_storeStrong((id *)&self->_concurrentQueueName, 0);
  objc_storeStrong((id *)&self->_serialQueueName, 0);
  objc_storeStrong((id *)&self->_volumeLabel, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_volumeRawDevice, 0);
  objc_storeStrong((id *)&self->syncTimer, 0);
  objc_storeStrong((id *)&self->searchRequests, 0);
  objc_storeStrong((id *)&self->mountNameToNodeCache, 0);

  objc_storeStrong((id *)&self->mountFHtoNodeTable, 0);
}

@end