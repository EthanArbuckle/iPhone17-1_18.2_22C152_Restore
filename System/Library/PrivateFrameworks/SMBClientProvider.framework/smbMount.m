@interface smbMount
+ (id)smbMountFromServerURL:(id)a3 shareName:(id)a4 password:(id)a5 result:(int *)a6;
- ($153B227C17007545984278727FAEAED4)serverGuid;
- (BOOL)isCaseSensitive;
- (BOOL)isGuestLogin;
- (BOOL)serverConnected;
- (NSLock)searchLock;
- (NSMutableDictionary)handleTable;
- (NSMutableDictionary)nameTable;
- (NSMutableDictionary)searchObjects;
- (NSMutableString)fsName;
- (NSMutableString)modelName;
- (NSString)serverName;
- (NSString)shareName;
- (NSString)userDomain;
- (NSString)userName;
- (NSURL)mountURL;
- (OS_dispatch_group)namespaceChangingGroup;
- (OS_dispatch_group)opsSyncGroup;
- (OS_dispatch_queue)connQueue;
- (OS_dispatch_queue)connectionSyncQueue;
- (OS_dispatch_queue)mgmtQueue;
- (OS_dispatch_queue)nodeTableSyncQueue;
- (OS_dispatch_queue)opsQueue;
- (OS_dispatch_queue)readwriteSyncQueue;
- (OS_dispatch_source)idleTimer;
- (OS_os_transaction)transaction;
- (SMBPiston)pd;
- (id)initForServerURL:(id)a3 shareName:(id)a4 password:(id)a5 result:(int *)a6;
- (id)lookupHandle:(id)a3 IsStale:(BOOL *)a4;
- (int)checkServerConnection;
- (int)connState;
- (int)connectToServer;
- (int)connectionState;
- (int)deliverSearchResults:(id)a3;
- (int)idleTimerRunning;
- (int)share_fstype;
- (int)shutdownReason;
- (smbNode)rootNode;
- (smb_query_share)shareInfo;
- (timespec)lastRequestTime;
- (unint64_t)getNextFileID;
- (unint64_t)newConnectionIDOrError:(id *)a3;
- (unint64_t)nextFileID;
- (unint64_t)openFileCounter;
- (unint64_t)pendingChangeNotifyCount;
- (unint64_t)pendingRequests;
- (unint64_t)sessionID;
- (unsigned)serverCaps;
- (unsigned)serverDialect;
- (unsigned)serverMaxRd;
- (unsigned)serverMaxTx;
- (unsigned)serverMaxWr;
- (unsigned)serverNegContextCnt;
- (unsigned)serverSecMode;
- (unsigned)sessionFlags;
- (unsigned)shareCaps;
- (unsigned)shareFlags;
- (unsigned)shareID;
- (unsigned)shareMaxAccess;
- (unsigned)shareType;
- (unsigned)sm_flags;
- (void)LIRead:(id)a3 atOffset:(unint64_t)a4 withPointer:(char *)a5 length:(unint64_t)a6 reply:(id)a7;
- (void)SetShutDownReason:(int)a3;
- (void)_LIAccessCheck:(id)a3 requestedAccess:(unsigned int)a4 reply:(id)a5;
- (void)_LIClose:(id)a3 keepingMode:(int)a4 reply:(id)a5;
- (void)_LICreate:(id)a3 named:(id)a4 withAttrs:(id)a5 andClient:(unint64_t)a6 reply:(id)a7;
- (void)_LIGetFsAttr:(id)a3 name:(id)a4 reply:(id)a5;
- (void)_LIGetXattr:(id)a3 name:(id)a4 reply:(id)a5;
- (void)_LIListXattrs:(id)a3 reply:(id)a4;
- (void)_LILookup:(id)a3 name:(id)a4 forClient:(unint64_t)a5 reply:(id)a6;
- (void)_LIMakeDir:(id)a3 named:(id)a4 withAttrs:(id)a5 andClient:(unint64_t)a6 reply:(id)a7;
- (void)_LIMakeSymLink:(id)a3 named:(id)a4 withContents:(id)a5 andAttrs:(id)a6 andClient:(unint64_t)a7 reply:(id)a8;
- (void)_LIOpen:(id)a3 withMode:(int)a4 reply:(id)a5;
- (void)_LIPathConf:(id)a3 reply:(id)a4;
- (void)_LIRead:(id)a3 atOffset:(unint64_t)a4 withPointer:(char *)a5 length:(unint64_t)a6 reply:(id)a7;
- (void)_LIReadDir:(id)a3 intoBuffer:(id)a4 forCookie:(unint64_t)a5 andVerifier:(unint64_t)a6 reply:(id)a7;
- (void)_LIReadDirAndAttrs:(id)a3 intoBuffer:(id)a4 forCookie:(unint64_t)a5 andVerifier:(unint64_t)a6 reply:(id)a7;
- (void)_LIReadLink:(id)a3 reply:(id)a4;
- (void)_LIReclaim:(id)a3 forClient:(unint64_t)a4 reply:(id)a5;
- (void)_LIRemove:(id)a3 name:(id)a4 reply:(id)a5;
- (void)_LIRemoveDir:(id)a3 name:(id)a4 reply:(id)a5;
- (void)_LIRename:(id)a3 name:(id)a4 toDir:(id)a5 andName:(id)a6 withFlags:(unsigned int)a7 reply:(id)a8;
- (void)_LISearch:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 withCallerID:(unint64_t)a7 reply:(id)a8;
- (void)_LISearchAbort:(id)a3 reply:(id)a4;
- (void)_LISearchAbortAllClientSearches:(unint64_t)a3;
- (void)_LISearchReplenishCredits:(id)a3 credits:(unsigned int)a4 reply:(id)a5;
- (void)_LISetAttr:(id)a3 setAttrs:(id)a4 reply:(id)a5;
- (void)_LISetUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 reply:(id)a6;
- (void)_LISetXattr:(id)a3 name:(id)a4 value:(id)a5 how:(int)a6 reply:(id)a7;
- (void)_LIStatFS:(id)a3 reply:(id)a4;
- (void)_LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6;
- (void)_getAttr:(id)a3 reply:(id)a4;
- (void)_invalidateFileNodesForConnection:(unint64_t)a3;
- (void)_setConnectionState:(int)a3;
- (void)_submitRequestBlock:(id)a3 continuationBlock:(id)a4 allowRetries:(BOOL)a5;
- (void)abortAllClientSearchesFor:(unint64_t)a3;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)cancelIdleTimer;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)dealloc;
- (void)decreaseChangeNotifyCount:(unint64_t)a3;
- (void)decreaseOpenFileCount:(unint64_t)a3;
- (void)disconnect;
- (void)disconnectFromServer;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)flushAndDisconnect;
- (void)flushAndReconnect;
- (void)flushEIOCancelWait;
- (void)handleNodeDisappeared:(id)a3;
- (void)idleTimerFired;
- (void)increaseChangeNotifyCount:(unint64_t)a3;
- (void)increaseOpenFileCount:(unint64_t)a3;
- (void)invalidateFileNodesForConnection:(unint64_t)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)notifyConnectionLost;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)readRequest:(id)a3 bptr:(char *)a4 smbNode:(id)a5 fileRef:(id)a6 rdparamPtr:(smb_read_write *)a7 result:(int)a8 thisOffset:(unint64_t)a9 bytesRemain:(unint64_t)a10 bytesRead:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13;
- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)reconnectCancelWait;
- (void)reconnectSession;
- (void)releaseConnectionAllocation:(unint64_t)a3;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)renameOverExistingDir:(id)a3 FromName:(id)a4 toDir:(id)a5 NewName:(id)a6 ToFile:(id)a7 CompletionHandler:(id)a8;
- (void)renameOverExistingFile:(id)a3 FromName:(id)a4 toDir:(id)a5 NewName:(id)a6 ToFile:(id)a7 CompletionHandler:(id)a8;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)requestDisconnect;
- (void)resetChangeNotifyCount;
- (void)resetOpenFileCount;
- (void)resumeIdleTimer;
- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)setAttrInternalLocked:(id)a3 setAttrs:(id)a4 CompletionHandler:(id)a5;
- (void)setConnQueue:(id)a3;
- (void)setConnState:(int)a3;
- (void)setConnectionSyncQueue:(id)a3;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setFsName:(id)a3;
- (void)setHandleTable:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIdleTimerRunning:(int)a3;
- (void)setLastRequestTime:(timespec)a3;
- (void)setMgmtQueue:(id)a3;
- (void)setModelName:(id)a3;
- (void)setNameTable:(id)a3;
- (void)setNamespaceChangingGroup:(id)a3;
- (void)setNextFileID:(unint64_t)a3;
- (void)setNodeTableSyncQueue:(id)a3;
- (void)setOpenFileCounter:(unint64_t)a3;
- (void)setOpsQueue:(id)a3;
- (void)setOpsSyncGroup:(id)a3;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setPd:(id)a3;
- (void)setPendingChangeNotifyCount:(unint64_t)a3;
- (void)setPendingRequests:(unint64_t)a3;
- (void)setReadwriteSyncQueue:(id)a3;
- (void)setRootNode:(id)a3;
- (void)setSearchLock:(id)a3;
- (void)setSearchObjects:(id)a3;
- (void)setServerCaps:(unsigned int)a3;
- (void)setServerConnected:(BOOL)a3;
- (void)setServerDialect:(unsigned int)a3;
- (void)setServerGuid:(id)a3;
- (void)setServerMaxRd:(unsigned int)a3;
- (void)setServerMaxTx:(unsigned int)a3;
- (void)setServerMaxWr:(unsigned int)a3;
- (void)setServerNegContextCnt:(unsigned int)a3;
- (void)setServerSecMode:(unsigned int)a3;
- (void)setSessionFlags:(unsigned int)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setShareCaps:(unsigned int)a3;
- (void)setShareFlags:(unsigned int)a3;
- (void)setShareID:(unsigned int)a3;
- (void)setShareInfo:(smb_query_share *)a3;
- (void)setShareMaxAccess:(unsigned int)a3;
- (void)setShareType:(unsigned int)a3;
- (void)setShutdownReason:(int)a3;
- (void)setSm_flags:(unsigned int)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)submitRequestBlock:(id)a3 continuationBlock:(id)a4;
- (void)submitRequestBlockOnce:(id)a3 continuationBlock:(id)a4;
- (void)tryCreateRootNode;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)writeRequest:(id)a3 withBuffer:(id)a4 smbNode:(id)a5 fileRef:(id)a6 wrparamPtr:(smb_read_write *)a7 result:(int)a8 thisOffset:(unint64_t)a9 bytesWritten:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation smbMount

- (id)initForServerURL:(id)a3 shareName:(id)a4 password:(id)a5 result:(int *)a6
{
  id v8 = a3;
  id v9 = a4;
  v50.receiver = self;
  v50.super_class = (Class)smbMount;
  v10 = [(smbMount *)&v50 init];
  v11 = v10;
  if (v10)
  {
    transaction = v10->_transaction;
    v10->_transaction = 0;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SMBProvider.Ops", 0);
    opsQueue = v11->_opsQueue;
    v11->_opsQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SMBProvider.ConnectionQueue", 0);
    connQueue = v11->_connQueue;
    v11->_connQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.SMBProvider.connectionSyncQueue", 0);
    connectionSyncQueue = v11->_connectionSyncQueue;
    v11->_connectionSyncQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.SMBProvider.nodeTableSyncQueue", 0);
    nodeTableSyncQueue = v11->_nodeTableSyncQueue;
    v11->_nodeTableSyncQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.SMBProvider.MgmtQ", 0);
    mgmtQueue = v11->_mgmtQueue;
    v11->_mgmtQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.SMBProvider.readwriteSyncQ", 0);
    readwriteSyncQueue = v11->_readwriteSyncQueue;
    v11->_readwriteSyncQueue = (OS_dispatch_queue *)v23;

    dispatch_group_t v25 = dispatch_group_create();
    opsSyncGroup = v11->_opsSyncGroup;
    v11->_opsSyncGroup = (OS_dispatch_group *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    namespaceChangingGroup = v11->_namespaceChangingGroup;
    v11->_namespaceChangingGroup = (OS_dispatch_group *)v27;

    v11->_connState = 0;
    v11->_shutdownReason = 0;
    v11->_serverConnected = 0;
    uint64_t v29 = [v8 host];
    serverName = v11->_serverName;
    v11->_serverName = (NSString *)v29;

    objc_storeStrong((id *)&v11->_shareName, a4);
    uint64_t v31 = [v8 user];
    userName = v11->_userName;
    v11->_userName = (NSString *)v31;

    v11->_isGuestLogin = 0;
    mountURL = v11->_mountURL;
    v11->_mountURL = 0;

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    handleTable = v11->_handleTable;
    v11->_handleTable = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nameTable = v11->_nameTable;
    v11->_nameTable = v36;

    v38 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    modelName = v11->_modelName;
    v11->_modelName = v38;

    v40 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    fsName = v11->_fsName;
    v11->_fsName = v40;

    v11->_shareInfo.fsType = 0;
    v11->_sm_flags = 1;
    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    searchObjects = v11->_searchObjects;
    v11->_searchObjects = v42;

    uint64_t v44 = objc_opt_new();
    searchLock = v11->_searchLock;
    v11->_searchLock = (NSLock *)v44;

    uint64_t v46 = [v8 URLByAppendingPathComponent:v9];
    v47 = v11->_mountURL;
    v11->_mountURL = (NSURL *)v46;

    atomic_store(2uLL, &v11->_nextFileID);
    atomic_store(0, &v11->_pendingRequests);
    clock_gettime(_CLOCK_REALTIME, &v11->_lastRequestTime);
    rootNode = v11->_rootNode;
    v11->_rootNode = 0;

    v11->_idleTimerRunning = 0;
    [(smbMount *)v11 resumeIdleTimer];
  }

  return v11;
}

- (int)connectToServer
{
  memset(v88, 0, sizeof(v88));
  uint64_t v83 = 0;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  [(smbMount *)self setOpenFileCounter:0];
  [(smbMount *)self setPendingChangeNotifyCount:0];
  id v3 = objc_alloc_init((Class)SMBPiston);
  if (!v3)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_100050220(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    int v5 = 12;
    goto LABEL_8;
  }
  [(smbMount *)self setPendingRequests:0];
  clock_gettime(_CLOCK_REALTIME, &self->_lastRequestTime);
  long long v84 = 0u;
  $C8790DA20DB7F8F9DF5BD97A4057CCF0 v85 = 0u;
  long long v86 = 0u;
  int v87 = 0;
  unsigned int v4 = +[smb_subr sendNegotiate:v3 Server:self->_serverName netBIOSName:0 VPNCookie:0 Result:&v84];
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050710();
    }
    goto LABEL_8;
  }
  self->_serverGuid = v85;
  self->_serverSecMode = WORD2(v84);
  self->_serverDialect = WORD3(v84);
  self->_serverNegContextCnt = WORD4(v84);
  unsigned int v15 = DWORD1(v86);
  self->_serverCaps = v86;
  self->_serverMaxTx = v15;
  unsigned int v16 = HIDWORD(v86);
  self->_serverMaxRd = DWORD2(v86);
  self->_serverMaxWr = v16;
  if ([(NSString *)self->_userName caseInsensitiveCompare:@"GUEST"])
  {
    if ([(NSString *)self->_userName length] >= 0x100)
    {
      BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v17) {
        sub_100050660(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      int v5 = 22;
      goto LABEL_8;
    }
    if ([(NSString *)self->_userName containsString:@";"])
    {
      dispatch_group_t v27 = (char *)[(NSString *)self->_userName rangeOfString:@";"];
      v28 = [(NSString *)self->_userName substringToIndex:v27];
      userDomain = self->_userDomain;
      self->_userDomain = v28;

      v30 = [(NSString *)self->_userName substringFromIndex:v27 + 1];
      userName = self->_userName;
      self->_userName = v30;
    }
    v32 = (void *)qword_1000914E8;
    v33 = [(smbMount *)self mountURL];
    id v77 = 0;
    v34 = [v32 getPasswordForIdentifier:v33 error:&v77];
    id v35 = v77;

    if (!v34)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005069C();
      }

      int v5 = 80;
      goto LABEL_8;
    }
    if ((v87 & 0x44) == 0
      || (LODWORD(v81) = 2,
          uint64_t v26 = +[smb_subr sendSessionSetup:v3 User:self->_userName Password:v34 Realm:@"WELLKNOWN:COM.APPLE.LKDC" Param:&v81], v26 == 80))
    {
      LODWORD(v81) = 4;
      uint64_t v26 = +[smb_subr sendSessionSetup:v3 User:self->_userName Password:v34 Realm:self->_userDomain Param:&v81];
    }

    if (!v26)
    {
LABEL_27:
      self->_sessionFlags = WORD2(v82);
      self->_sessionID = *((void *)&v82 + 1);
      unsigned int v36 = +[smb_subr sendTreeConnect:v3 ShareName:self->_shareName Param:&v78];
      if (v36)
      {
        int v5 = v36;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100050578();
        }
        if (v78 == -1073741790) {
          int v5 = 10100;
        }
        goto LABEL_54;
      }
      self->serverSockAddrLen = 128;
      unsigned int v37 = objc_msgSend(v3, "getPeerAddress:withLength:", &self->serverSockAddr);
      if (v37)
      {
        int v5 = v37;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100050508();
        }
      }
      else
      {
        unsigned int v38 = v80;
        self->_shareID = HIDWORD(v80);
        self->_shareType = BYTE4(v78);
        unsigned int v39 = HIDWORD(v79);
        self->_shareFlags = v79;
        self->_shareCaps = v39;
        self->_shareMaxAccess = v38;
        unsigned int v40 = +[smb_subr sendQueryShare:v3 ShareID:self->_shareID Model:self->_modelName FSName:self->_fsName Param:&self->_shareInfo];
        if (v40)
        {
          int v5 = v40;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100050494();
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_10005041C((uint64_t)&self->_shareInfo, v41, v42, v43, v44, v45, v46, v47);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100050394((uint64_t)&self->_shareInfo, v48, v49, v50, v51, v52, v53, v54);
          }
          self->_sm_flags = self->_sm_flags & 0xFFFFFFFE | (self->_shareInfo.fileSystemAttrs >> 7) & 1;
          if ((self->_shareInfo.fileSystemAttrs & 0x40000) == 0
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100050308(self);
          }
          unsigned int v55 = +[smb_subr queryShareRootSync:v3 ShareID:self->_shareID FAttrs:v88];
          if (!v55)
          {
            v56 = [(smbMount *)self rootNode];

            if (!v56)
            {
              v57 = [[smbNode alloc] initWithName:@"TheRooT" andParent:0 andAttr:v88];
              if (!v57)
              {
                BOOL v69 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v69) {
                  sub_10005025C(v69, v70, v71, v72, v73, v74, v75, v76);
                }
                int v5 = 12;
                goto LABEL_53;
              }
              v58 = v57;
              [(smbNode *)v57 setMp:self];
              [(smbNode *)v58 updateFileID];
              rootNode = self->_rootNode;
              self->_rootNode = v58;
              v60 = v58;

              handleTable = self->_handleTable;
              v62 = [(smbNode *)v60 fh];
              [(NSMutableDictionary *)handleTable setObject:v60 forKey:v62];

              nameTable = self->_nameTable;
              v64 = [(smbNode *)v60 fh];
              id v65 = +[LiveFSItemPair newWithParent:v64 fname:@"." caseSensitivity:[(smbMount *)self isCaseSensitive]];
              [(NSMutableDictionary *)nameTable setObject:v60 forKey:v65];

              v66 = self->_nameTable;
              v67 = [(smbNode *)v60 fh];
              id v68 = +[LiveFSItemPair newWithParent:v67 fname:@".." caseSensitivity:[(smbMount *)self isCaseSensitive]];
              [(NSMutableDictionary *)v66 setObject:v60 forKey:v68];
            }
            [(smbMount *)self setPd:v3];
            int v5 = 0;
            self->_serverConnected = 1;
            goto LABEL_9;
          }
          int v5 = v55;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100050298();
          }
        }
      }
LABEL_53:
      +[smb_subr sendTreeDisonnect:v3 ShareID:self->_shareID Param:&v78];
LABEL_54:
      +[smb_subr sendLogoff:v3 Param:&v81];
LABEL_8:

      id v3 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    self->_isGuestLogin = 1;
    LODWORD(v81) = 1;
    dispatch_group_t v25 = self->_userName;
    self->_userName = (NSString *)@"GUEST";

    uint64_t v26 = +[smb_subr sendSessionSetup:v3 User:self->_userName Password:0 Realm:0 Param:&v81];
    if (!v26) {
      goto LABEL_27;
    }
  }
  int v5 = sub_100033008(v26);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000505EC();
  }
  if (v5) {
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (void)disconnectFromServer
{
  if ([(smbMount *)self serverConnected])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050784(self);
    }
    memset(v8, 0, sizeof(v8));
    id v3 = [(smbMount *)self pd];
    +[smb_subr sendTreeDisonnect:v3 ShareID:[(smbMount *)self shareID] Param:v8];

    unsigned int v4 = [(smbMount *)self pd];
    +[smb_subr sendLogoff:v4 Param:&v7];

    int v5 = [(smbMount *)self pd];
    [v5 disconnect];

    [(smbMount *)self setServerConnected:0];
    pd = self->_pd;
    self->_pd = 0;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100050824(self);
  }
}

- (void)tryCreateRootNode
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  int v5 = 0;
  connectionSyncQueue = self->_connectionSyncQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B3A8;
  v3[3] = &unk_100088810;
  v3[4] = self;
  v3[5] = v4;
  dispatch_sync(connectionSyncQueue, v3);
  _Block_object_dispose(v4, 8);
}

- (int)checkServerConnection
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  connectionSyncQueue = self->_connectionSyncQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B6E4;
  v5[3] = &unk_100088810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionSyncQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)idleTimerFired
{
  v6.__darwin_time_t tv_sec = 0;
  v6.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v6);
  __darwin_time_t tv_sec = v6.tv_sec;
  if (tv_sec - (uint64_t)[(smbMount *)self lastRequestTime] >= 120)
  {
    unsigned int v4 = [(smbMount *)self connState];
    switch(v4)
    {
      case 7u:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000510B8(self);
        }
        [(smbMount *)self setConnState:0];
        [(smbMount *)self setShutdownReason:0];
        goto LABEL_25;
      case 1u:
        if ([(smbMount *)self openFileCounter])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100050F6C(self);
          }
        }
        else
        {
          if (![(smbMount *)self pendingChangeNotifyCount])
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100050E20(self);
            }
            [(smbMount *)self setConnState:0];
LABEL_24:
            [(smbMount *)self disconnectFromServer];
LABEL_25:
            [(smbMount *)self cancelIdleTimer];
            return;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_100050EC0(self);
          }
        }
        break;
      case 0u:
        int v5 = [(smbMount *)self rootNode];

        if (v5) {
          goto LABEL_25;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100051018(self);
        }
        if ([(smbMount *)self connectToServer]) {
          goto LABEL_25;
        }
        goto LABEL_24;
      default:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100050D58(self);
        }
        break;
    }
  }
}

- (void)resumeIdleTimer
{
  int v3 = [(smbMount *)self idleTimer];

  if (!v3)
  {
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    [(smbMount *)self setIdleTimer:v4];

    int v5 = [(smbMount *)self idleTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000BBD4;
    handler[3] = &unk_100088838;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
  }
  timespec v6 = [(smbMount *)self idleTimer];
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v6, v7, 0x6FC23AC00uLL, 0x2FAF080uLL);

  if (![(smbMount *)self idleTimerRunning])
  {
    [(smbMount *)self setIdleTimerRunning:1];
    uint64_t v8 = [(smbMount *)self idleTimer];
    dispatch_resume(v8);
  }
}

- (void)cancelIdleTimer
{
  int v3 = [(smbMount *)self idleTimer];

  if (v3 && [(smbMount *)self idleTimerRunning] == 1)
  {
    [(smbMount *)self setIdleTimerRunning:0];
    dispatch_source_t v4 = [(smbMount *)self idleTimer];
    dispatch_suspend(v4);
  }
}

- (void)increaseOpenFileCount:(unint64_t)a3
{
  int v5 = [(smbMount *)self connectionSyncQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BD90;
  v6[3] = &unk_100088860;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)decreaseOpenFileCount:(unint64_t)a3
{
  int v5 = [(smbMount *)self connectionSyncQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000BE6C;
  v6[3] = &unk_100088860;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)resetOpenFileCount
{
  int v3 = [(smbMount *)self connectionSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BF9C;
  block[3] = &unk_100088838;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)increaseChangeNotifyCount:(unint64_t)a3
{
  int v5 = [(smbMount *)self connectionSyncQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C03C;
  v6[3] = &unk_100088860;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)decreaseChangeNotifyCount:(unint64_t)a3
{
  int v5 = [(smbMount *)self connectionSyncQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C118;
  v6[3] = &unk_100088860;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)resetChangeNotifyCount
{
  int v3 = [(smbMount *)self connectionSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C248;
  block[3] = &unk_100088838;
  block[4] = self;
  dispatch_sync(v3, block);
}

+ (id)smbMountFromServerURL:(id)a3 shareName:(id)a4 password:(id)a5 result:(int *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initForServerURL:v12 shareName:v11 password:v10 result:a6];

  return v13;
}

- (void)disconnect
{
  connectionSyncQueue = self->_connectionSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C374;
  block[3] = &unk_100088838;
  block[4] = self;
  dispatch_sync(connectionSyncQueue, block);
  [(smbMount *)self requestDisconnect];
}

- (BOOL)isCaseSensitive
{
  return LOBYTE(self->_shareInfo.capabilities) >> 7;
}

- (unint64_t)getNextFileID
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->_nextFileID, 1uLL);
}

- (void)invalidateFileNodesForConnection:(unint64_t)a3
{
  if ([(smbMount *)self connState])
  {
    dispatch_time_t v5 = dispatch_time(0, 15000000000);
    timespec v6 = [(smbMount *)self opsSyncGroup];
    intptr_t v7 = dispatch_group_wait(v6, v5);

    if (v7)
    {
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v8) {
        sub_100051378(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      unsigned int v16 = [(smbMount *)self namespaceChangingGroup];
      dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

      BOOL v17 = [(smbMount *)self opsQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000C510;
      v18[3] = &unk_100088860;
      v18[4] = self;
      v18[5] = a3;
      dispatch_async(v17, v18);
    }
  }
}

- (void)_invalidateFileNodesForConnection:(unint64_t)a3
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10000C880;
  unsigned int v36 = sub_10000C890;
  id v37 = 0;
  if ([(smbMount *)self checkServerConnection])
  {
    id v5 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_1000513B4();
    }
  }
  dispatch_group_t v6 = dispatch_group_create();
  intptr_t v7 = (void *)v33[5];
  v33[5] = (uint64_t)v6;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v8 = [(smbMount *)self handleTable];
  uint64_t v9 = 0;
  id v10 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v10)
  {
    unint64_t v11 = ~a3;
    uint64_t v12 = *(void *)v29;
    uint64_t v22 = v25;
    id obj = v8;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v13);
        uint64_t v15 = [(smbMount *)self handleTable];
        unsigned int v16 = [v15 objectForKey:v14];

        uint64_t v9 = v16;
        objc_msgSend(v16, "setInterestedClients:", (unint64_t)objc_msgSend(v16, "interestedClients") & v11);
        unint64_t v17 = (unint64_t)[v16 inUseClientSet];
        [v16 setInUseClientSet:v17 & v11];
        if ((v17 & a3) != 0 && ![v16 inUseClientSet])
        {
          uint64_t v18 = [(smbMount *)self rootNode];
          uint64_t v19 = [v18 fh];
          unsigned __int8 v20 = [v14 isEqualToString:v19];

          if ((v20 & 1) == 0)
          {
            dispatch_group_enter((dispatch_group_t)v33[5]);
            uint64_t v21 = [v9 fileRefSyncQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v25[0] = sub_10000C898;
            v25[1] = &unk_100088810;
            id v26 = v9;
            dispatch_group_t v27 = &v32;
            dispatch_async(v21, block);

            dispatch_group_wait((dispatch_group_t)v33[5], 0xFFFFFFFFFFFFFFFFLL);
          }
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      BOOL v8 = obj;
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v32, 8);
}

- (unint64_t)newConnectionIDOrError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)smbMount;
  return [(smbMount *)&v4 newConnectionIDOrError:a3];
}

- (void)releaseConnectionAllocation:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)smbMount;
  [(smbMount *)&v3 releaseConnectionAllocation:a3];
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  pd = self->_pd;
  self->_pd = 0;

  shareName = self->_shareName;
  self->_shareName = 0;

  rootNode = self->_rootNode;
  self->_rootNode = 0;

  handleTable = self->_handleTable;
  self->_handleTable = 0;

  nameTable = self->_nameTable;
  self->_nameTable = 0;

  modelName = self->_modelName;
  self->_modelName = 0;

  fsName = self->_fsName;
  self->_fsName = 0;

  v11.receiver = self;
  v11.super_class = (Class)smbMount;
  [(smbMount *)&v11 dealloc];
}

- (id)lookupHandle:(id)a3 IsStale:(BOOL *)a4
{
  id v5 = [(NSMutableDictionary *)self->_handleTable objectForKey:a3];
  dispatch_group_t v6 = v5;
  if (v5) {
    *a4 = [v5 isViable] ^ 1;
  }
  return v6;
}

- (void)handleNodeDisappeared:(id)a3
{
  id v9 = a3;
  [v9 setZombieState:1];
  if (([v9 isRoot] & 1) == 0)
  {
    objc_super v4 = [(smbMount *)self nameTable];
    id v5 = [v9 parent];
    dispatch_group_t v6 = [v5 fh];
    intptr_t v7 = [v9 name];
    id v8 = +[LiveFSItemPair newWithParent:v6 fname:v7 caseSensitivity:[(smbMount *)self isCaseSensitive]];
    [v4 removeObjectForKey:v8];
  }
}

- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  rootNode = self->_rootNode;
  if (rootNode) {
    goto LABEL_2;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000514B0(self);
  }
  if (![(smbMount *)self checkServerConnection])
  {
    rootNode = self->_rootNode;
LABEL_2:
    intptr_t v7 = [(smbNode *)rootNode fh];
    v5[2](v5, v7, 0);
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051404();
  }
  intptr_t v7 = getNSErrorFromLiveFSErrno();
  ((void (**)(id, void *, void *))v5)[2](v5, 0, v7);
LABEL_9:
}

- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a8;
  uint64_t v15 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

  unsigned int v16 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v16);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000CDE0;
  block[3] = &unk_1000888D8;
  block[4] = self;
  id v22 = v12;
  id v24 = v14;
  unint64_t v25 = a5;
  id v23 = v13;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(opsQueue, block);
}

- (void)_LILookup:(id)a3 name:(id)a4 forClient:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v82 = 0;
  uint64_t v83 = &v82;
  uint64_t v84 = 0x3032000000;
  $C8790DA20DB7F8F9DF5BD97A4057CCF0 v85 = sub_10000C880;
  long long v86 = sub_10000C890;
  id v87 = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  uint64_t v79 = sub_10000C880;
  uint64_t v80 = sub_10000C890;
  id v81 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = sub_10000C880;
  v74[4] = sub_10000C890;
  id v75 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v13 = [(smbMount *)self checkServerConnection];
  if (v13)
  {
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100051648();
    }

    goto LABEL_21;
  }
  if (!v10 || ![v10 length])
  {
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051550((uint64_t)[v11 UTF8String], (uint64_t)v88);
    }

    goto LABEL_20;
  }
  if (!v11 || ![v11 length])
  {
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28) {
      sub_100051590(v28, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_20:
    uint64_t v13 = 22;
LABEL_21:
    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, v13, 0, 0);
    goto LABEL_22;
  }
  nodeTableSyncQueue = self->_nodeTableSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000D5A0;
  block[3] = &unk_100088900;
  id v68 = &v76;
  block[4] = self;
  id v16 = v10;
  id v67 = v16;
  BOOL v69 = &v70;
  dispatch_sync(nodeTableSyncQueue, block);
  if (v77[5] && !*((unsigned char *)v71 + 24))
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000D5FC;
    v60[3] = &unk_100088978;
    id v36 = v12;
    id v63 = v36;
    v64 = &v76;
    unint64_t v65 = a5;
    id v37 = v11;
    id v61 = v37;
    v62 = self;
    unsigned int v38 = objc_retainBlock(v60);
    unsigned int v39 = self->_nodeTableSyncQueue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000D8C0;
    v56[3] = &unk_1000889A0;
    v59 = &v82;
    v56[4] = self;
    id v40 = v16;
    id v57 = v40;
    id v41 = v37;
    id v58 = v41;
    dispatch_sync(v39, v56);
    if (v83[5])
    {
      ((void (*)(void *))v38[2])(v38);
    }
    else
    {
      uint64_t v42 = malloc_type_malloc(0xF0uLL, 0x1000040D9093685uLL);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10000D968;
      v52[3] = &unk_1000889F0;
      uint64_t v54 = &v76;
      id v53 = v41;
      unsigned int v55 = v42;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10000DA40;
      v43[3] = &unk_100088B58;
      uint64_t v51 = v42;
      uint64_t v49 = &v76;
      id v44 = v53;
      id v47 = v36;
      uint64_t v45 = self;
      uint64_t v50 = v74;
      id v46 = v40;
      uint64_t v48 = v38;
      [(smbMount *)self submitRequestBlock:v52 continuationBlock:v43];
    }
  }
  else
  {
    id v17 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051608((uint64_t)[v11 UTF8String], (uint64_t)v88);
    }

    if (*((unsigned char *)v71 + 24))
    {
      BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v18) {
        sub_1000515CC(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      uint64_t v26 = 70;
    }
    else
    {
      uint64_t v26 = 2;
    }
    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, v26, 0, 0);
  }

LABEL_22:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  id v10 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v10);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000E78C;
  block[3] = &unk_100088BA8;
  block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(opsQueue, block);
}

- (void)_getAttr:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10000C880;
  BOOL v28 = sub_10000C890;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v8 = [(smbMount *)self checkServerConnection];
  if (!v8)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10000EB80;
    block[3] = &unk_100088900;
    BOOL v18 = &v24;
    block[4] = self;
    id v17 = v6;
    uint64_t v19 = &v20;
    dispatch_sync(nodeTableSyncQueue, block);
    id v11 = (void *)v25[5];
    if (v11)
    {
      if (!*((unsigned char *)v21 + 24))
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000EBDC;
        v13[3] = &unk_100088BD0;
        id v15 = &v24;
        v13[4] = self;
        id v14 = v7;
        [v11 fetchAttrDataWithCompletionHandler:v13];

        goto LABEL_13;
      }
      uint64_t v12 = 70;
    }
    else if (*((unsigned char *)v21 + 24))
    {
      uint64_t v12 = 70;
    }
    else
    {
      uint64_t v12 = 2;
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v12, 0);
LABEL_13:

    goto LABEL_14;
  }
  id v9 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_1000519B0();
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v8, 0);
LABEL_14:
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v12 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v12);

  opsQueue = self->_opsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000EE14;
  v16[3] = &unk_100088C20;
  v16[4] = self;
  id v17 = v9;
  int v19 = a4;
  id v18 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(opsQueue, v16);
}

- (void)_LIOpen:(id)a3 withMode:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = sub_10000C880;
  v57[4] = sub_10000C890;
  id v58 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = sub_10000C880;
  unsigned int v55 = sub_10000C890;
  id v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3810000000;
  v49[4] = 0;
  v49[5] = 0;
  v49[3] = &unk_10007BB3D;
  int v50 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_10000C880;
  id v47 = sub_10000C890;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10000C880;
  v41[4] = sub_10000C890;
  id v42 = 0;
  uint64_t v37 = 0;
  unsigned int v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v10 = [(smbMount *)self checkServerConnection];
  if (!v10)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10000F508;
    block[3] = &unk_100088900;
    uint64_t v35 = &v51;
    block[4] = self;
    id v34 = v8;
    id v36 = &v37;
    dispatch_sync(nodeTableSyncQueue, block);
    id v13 = (void *)v52[5];
    if (v13)
    {
      if (!*((unsigned char *)v38 + 24))
      {
        unsigned int v14 = [v13 isDir];
        id v15 = (void *)v52[5];
        if (v14)
        {
          [v15 incDirRefCount];
        }
        else
        {
          id v17 = [v15 fileRefSyncQueue];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10000F564;
          v31[3] = &unk_100088C48;
          v31[4] = &v43;
          v31[5] = &v51;
          int v32 = v6;
          dispatch_sync(v17, v31);

          if (!v44[5])
          {
            uint64_t v18 = [(id)v52[5] getNewFileRefwithMode:v6];
            int v19 = (void *)v44[5];
            v44[5] = v18;

            if (v44[5])
            {
              uint64_t v20 = (char *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
              *(void *)(v20 + 12) = 0;
              *(void *)(v20 + 4) = 0;
              *(_DWORD *)uint64_t v20 = 1;
              *((_DWORD *)v20 + 1) = [(id)v44[5] desiredAccess];
              *((_DWORD *)v20 + 2) = [(id)v44[5] shareMode];
              *((_DWORD *)v20 + 3) = *((_DWORD *)[(id)v52[5] getSmbFattr] + 30);
              v30[0] = _NSConcreteStackBlock;
              v30[1] = 3221225472;
              v30[2] = sub_10000F5BC;
              v30[3] = &unk_100088C98;
              v30[4] = &v51;
              v30[5] = v57;
              v30[6] = v20;
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_10000F744;
              v21[3] = &unk_100088CE8;
              BOOL v28 = v20;
              char v23 = &v51;
              uint64_t v24 = v41;
              int v29 = v6;
              id v22 = v9;
              uint64_t v25 = v57;
              uint64_t v26 = &v43;
              id v27 = v49;
              [(smbMount *)self submitRequestBlockOnce:v30 continuationBlock:v21];

              goto LABEL_19;
            }
            uint64_t v16 = 12;
LABEL_18:
            (*((void (**)(id, uint64_t))v9 + 2))(v9, v16);
LABEL_19:

            goto LABEL_20;
          }
        }
        uint64_t v16 = 0;
        goto LABEL_18;
      }
    }
    else if (!*((unsigned char *)v38 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100051A94();
      }
      uint64_t v16 = 9;
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100051B08();
    }
    uint64_t v16 = 70;
    goto LABEL_18;
  }
  id v11 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100051B7C();
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, v10);
LABEL_20:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(v57, 8);
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v12 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v12);

  opsQueue = self->_opsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000FA90;
  v16[3] = &unk_100088C20;
  v16[4] = self;
  id v17 = v9;
  int v19 = a4;
  id v18 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(opsQueue, v16);
}

- (void)_LIClose:(id)a3 keepingMode:(int)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v49 = 0;
  int v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_10000C880;
  void v43[4] = sub_10000C890;
  id v44 = 0;
  uint64_t v37 = 0;
  unsigned int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  char v40 = sub_10000C880;
  id v41 = sub_10000C890;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10000C880;
  v35[4] = sub_10000C890;
  id v36 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  uint64_t v10 = [(smbMount *)self checkServerConnection];
  if (!v10)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100010144;
    block[3] = &unk_100088900;
    uint64_t v31 = &v37;
    block[4] = self;
    id v30 = v8;
    int v32 = &v49;
    dispatch_sync(nodeTableSyncQueue, block);
    id v13 = (void *)v38[5];
    if (v13)
    {
      if (!*((unsigned char *)v50 + 24))
      {
        unsigned int v14 = [v13 isDir];
        id v15 = (void *)v38[5];
        if (v14)
        {
          [v15 decDirRefCount];
          uint64_t v16 = 0;
        }
        else
        {
          if ((int)[v15 openFileRefs] > 0)
          {
            id v17 = [(id)v38[5] fileRefSyncQueue];
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1000101A0;
            v19[3] = &unk_100088D60;
            int v28 = a4;
            uint64_t v21 = &v37;
            id v22 = v33;
            char v23 = v45;
            uint64_t v24 = v47;
            uint64_t v25 = v43;
            uint64_t v26 = v34;
            id v27 = v35;
            id v20 = v9;
            dispatch_async(v17, v19);

            goto LABEL_14;
          }
          id v18 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v38[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_100051D48();
          }

          uint64_t v16 = 22;
        }
LABEL_13:
        (*((void (**)(id, uint64_t, void, void, void, void, void, void))v9 + 2))(v9, v16, 0, 0, 0, 0, 0, 0);
LABEL_14:

        goto LABEL_15;
      }
    }
    else if (!*((unsigned char *)v50 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100051C60();
      }
      uint64_t v16 = 9;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051CD4();
    }
    uint64_t v16 = 70;
    goto LABEL_13;
  }
  id v11 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100051D94();
  }

  (*((void (**)(id, uint64_t, void, void, void, void, void, void))v9 + 2))(v9, v10, 0, 0, 0, 0, 0, 0);
LABEL_15:
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v49, 8);
}

- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v12 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v12);

  opsQueue = self->_opsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010548;
  v16[3] = &unk_100088D88;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  unint64_t v19 = a4;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(opsQueue, v16);
}

- (void)_LIReclaim:(id)a3 forClient:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_10000C880;
  int v32 = sub_10000C890;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  if ([(smbMount *)self checkServerConnection])
  {
    id v10 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100051E24();
    }
  }
  nodeTableSyncQueue = self->_nodeTableSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100010A1C;
  block[3] = &unk_100088900;
  uint64_t v24 = &v28;
  block[4] = self;
  id v12 = v8;
  id v23 = v12;
  uint64_t v25 = v26;
  dispatch_sync(nodeTableSyncQueue, block);
  id v13 = (void *)v29[5];
  if (!v13)
  {
    id v17 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100051DE4((uint64_t)[v12 UTF8String], (uint64_t)v34);
    }

    goto LABEL_14;
  }
  [v13 lockMeta];
  unint64_t v14 = (unint64_t)[(id)v29[5] inUseClientSet];
  [(id)v29[5] setInUseClientSet:v14 & ~a4];
  [(id)v29[5] unlockMeta];
  if ((v14 & a4) == 0 || [(id)v29[5] inUseClientSet])
  {
LABEL_14:
    v9[2](v9, 0);
    goto LABEL_15;
  }
  [(id)v29[5] setZombieState:1];
  if (([(id)v29[5] isRoot] & 1) == 0)
  {
    id v15 = [(smbMount *)self nodeTableSyncQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100010A78;
    v21[3] = &unk_100088810;
    void v21[4] = self;
    v21[5] = &v28;
    dispatch_sync(v15, v21);
  }
  uint64_t v16 = [(id)v29[5] fileRefSyncQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010B90;
  v18[3] = &unk_100088DB0;
  id v20 = &v28;
  unint64_t v19 = v9;
  dispatch_async(v16, v18);

LABEL_15:
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  id v17 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v17);

  opsQueue = self->_opsQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100010D78;
  v22[3] = &unk_100088E00;
  v22[4] = self;
  id v23 = v13;
  unint64_t v26 = a5;
  unint64_t v27 = a6;
  id v24 = v14;
  id v25 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  dispatch_async(opsQueue, v22);
}

- (void)_LIReadDir:(id)a3 intoBuffer:(id)a4 forCookie:(unint64_t)a5 andVerifier:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = sub_10000C880;
  id v67 = sub_10000C890;
  id v68 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  unsigned int v52 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v15 = [(smbMount *)self checkServerConnection];
  unsigned int v52 = v15;
  if (!v15)
  {
    v54[3] = 0;
    v58[3] = 0;
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100011424;
    block[3] = &unk_100088900;
    char v46 = &v63;
    block[4] = self;
    id v19 = v12;
    id v45 = v19;
    id v47 = &v48;
    dispatch_sync(nodeTableSyncQueue, block);
    id v20 = (void *)v64[5];
    if (v20)
    {
      if (!*((unsigned char *)v49 + 24))
      {
        if ([v20 isDir])
        {
          id v21 = [(id)v64[5] getDirEnumerator:&v52];
          if (v21)
          {
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100011480;
            v35[3] = &unk_100088E50;
            uint64_t v39 = &v53;
            char v40 = &v57;
            id v17 = v21;
            id v36 = v17;
            unint64_t v42 = a5;
            unint64_t v43 = a6;
            id v37 = v13;
            unsigned int v38 = self;
            id v41 = v61;
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_100011660;
            v28[3] = &unk_100088E78;
            uint64_t v30 = &v53;
            id v29 = v14;
            uint64_t v31 = &v57;
            int v32 = &v63;
            unint64_t v33 = a5;
            unint64_t v34 = a6;
            [(smbMount *)self submitRequestBlock:v35 continuationBlock:v28];

LABEL_16:
            goto LABEL_17;
          }
          id v26 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            id v27 = [(id)v64[5] name];
            sub_100051EF4((uint64_t)[v27 UTF8String], (int *)&v52, (uint64_t)v69, v27);
          }

          uint64_t v23 = v52;
        }
        else
        {
          id v25 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v64[5] name];
            [ objc_claimAutoreleasedReturnValue() UTF8String];
            sub_100051F50();
          }

          uint64_t v23 = 20;
        }
LABEL_15:
        (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, v23, 0, 0);
        id v17 = 0;
        goto LABEL_16;
      }
    }
    else if (!*((unsigned char *)v49 + 24))
    {
      id v24 = &_os_log_default;
      uint64_t v23 = 2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100051E74((uint64_t)[v19 UTF8String], (uint64_t)v69);
      }
      goto LABEL_14;
    }
    id v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100051EB4((uint64_t)[v19 UTF8String], (uint64_t)v69);
    }
    uint64_t v23 = 70;
LABEL_14:

    unsigned int v52 = v23;
    goto LABEL_15;
  }
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100051F9C();
  }

  (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, v15, 0, 0);
  id v17 = 0;
LABEL_17:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v63, 8);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  id v16 = +[LiveFSSharedMutableBuffer dataWithLength:a4];
  id v17 = v16;
  if (v16)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100011858;
    v18[3] = &unk_100088EA0;
    id v19 = v16;
    unint64_t v21 = a4;
    id v20 = v15;
    [(smbMount *)self readDirectory:v14 intoBuffer:v19 cookie:a5 verifier:a6 requestID:a7 reply:v18];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v15 + 2))(v15, 12, 0, 0, 0);
  }
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  id v17 = +[LiveFSSharedMutableBuffer dataWithLength:a4];
  id v18 = v17;
  if (v17)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100011A70;
    v19[3] = &unk_100088EA0;
    id v20 = v17;
    unint64_t v22 = a4;
    id v21 = v16;
    [(smbMount *)self readDirectory:v15 intoBuffer:v20 requestedAttributes:a5 cookie:a6 verifier:a7 requestID:a8 reply:v19];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v16 + 2))(v16, 12, 0, 0, 0);
  }
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a9;
  id v16 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  id v17 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v17);

  opsQueue = self->_opsQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100011C78;
  v22[3] = &unk_100088E00;
  v22[4] = self;
  id v23 = v13;
  unint64_t v26 = a6;
  unint64_t v27 = a7;
  id v24 = v14;
  id v25 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  dispatch_async(opsQueue, v22);
}

- (void)_LIReadDirAndAttrs:(id)a3 intoBuffer:(id)a4 forCookie:(unint64_t)a5 andVerifier:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_10000C880;
  char v62 = sub_10000C890;
  id v63 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  unsigned int v47 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v15 = [(smbMount *)self checkServerConnection];
  unsigned int v47 = v15;
  if (!v15)
  {
    v49[3] = 0;
    v53[3] = 0;
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000122C8;
    block[3] = &unk_100088900;
    id v41 = &v58;
    block[4] = self;
    id v40 = v12;
    unint64_t v42 = &v43;
    dispatch_sync(nodeTableSyncQueue, block);
    id v19 = (void *)v59[5];
    if (v19)
    {
      if (!*((unsigned char *)v44 + 24))
      {
        if ([v19 isDir])
        {
          id v20 = [(id)v59[5] getDirEnumerator:&v47];
          if (v20)
          {
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100012324;
            v31[3] = &unk_100088EF0;
            unint64_t v34 = &v48;
            uint64_t v35 = &v52;
            id v17 = v20;
            id v32 = v17;
            unint64_t v37 = a5;
            unint64_t v38 = a6;
            id v33 = v13;
            id v36 = v56;
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_100012464;
            v24[3] = &unk_100088E78;
            unint64_t v26 = &v48;
            id v25 = v14;
            unint64_t v27 = &v52;
            uint64_t v28 = &v58;
            unint64_t v29 = a5;
            unint64_t v30 = a6;
            [(smbMount *)self submitRequestBlock:v31 continuationBlock:v24];

LABEL_16:
            goto LABEL_17;
          }
          id v23 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v59[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_1000521F0();
          }

          uint64_t v21 = v47;
LABEL_15:
          (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, v21, 0, 0);
          id v17 = 0;
          goto LABEL_16;
        }
        id v22 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(id)v59[5] name];
          objc_claimAutoreleasedReturnValue();
          sub_100052248();
        }

        uint64_t v21 = 20;
LABEL_14:
        unsigned int v47 = v21;
        goto LABEL_15;
      }
    }
    else if (!*((unsigned char *)v44 + 24))
    {
      uint64_t v21 = 2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100052108();
      }
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005217C();
    }
    uint64_t v21 = 70;
    goto LABEL_14;
  }
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100052294();
  }

  (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, v15, 0, 0);
  id v17 = 0;
LABEL_17:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  id v18 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v18);

  opsQueue = self->_opsQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100012674;
  v24[3] = &unk_100088F40;
  void v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  unint64_t v29 = a6;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(opsQueue, v24);
}

- (void)_LICreate:(id)a3 named:(id)a4 withAttrs:(id)a5 andClient:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x3032000000;
  uint64_t v72 = sub_10000C880;
  char v73 = sub_10000C890;
  id v74 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = sub_10000C880;
  v67[4] = sub_10000C890;
  id v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = sub_10000C880;
  v65[4] = sub_10000C890;
  id v66 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_10000C880;
  char v62 = sub_10000C890;
  id v63 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  uint64_t v16 = [(smbMount *)self checkServerConnection];
  if (!v16)
  {
    if ((unint64_t)[v14 length] <= 0xB7)
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100052400((uint64_t)v75, (uint64_t)[v14 length]);
      }
      uint64_t v16 = 22;
      goto LABEL_8;
    }
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100012EE0;
    block[3] = &unk_100088900;
    uint64_t v51 = &v69;
    block[4] = self;
    id v20 = v12;
    id v50 = v20;
    uint64_t v52 = &v54;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v70[5])
    {
      if (!*((unsigned char *)v55 + 24))
      {
        id v21 = self->_nodeTableSyncQueue;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100012F3C;
        void v45[3] = &unk_1000889A0;
        uint64_t v48 = &v58;
        v45[4] = self;
        id v46 = v20;
        id v22 = v13;
        id v47 = v22;
        dispatch_sync(v21, v45);
        if (v59[5])
        {
          id v23 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v70[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_1000524C0();
          }

          (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, 17, 0, 0, 0, 0);
        }
        else
        {
          id v27 = malloc_type_malloc(0xF0uLL, 0x1000040D9093685uLL);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100012FE4;
          v41[3] = &unk_1000889F0;
          uint64_t v43 = &v69;
          id v42 = v22;
          id v44 = v27;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000130C0;
          v28[3] = &unk_100089030;
          uint64_t v39 = v27;
          id v29 = v42;
          id v33 = &v69;
          id v32 = v15;
          unint64_t v30 = self;
          unint64_t v34 = v53;
          uint64_t v35 = &v58;
          unint64_t v40 = a6;
          id v36 = v64;
          id v31 = v14;
          unint64_t v37 = v65;
          unint64_t v38 = v67;
          [(smbMount *)self submitRequestBlockOnce:v41 continuationBlock:v28];
        }
        goto LABEL_26;
      }
    }
    else if (!*((unsigned char *)v55 + 24))
    {
      id v26 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100052440((uint64_t)[v13 UTF8String], (uint64_t)v75);
      }
      uint64_t v25 = 2;
      goto LABEL_20;
    }
    id v24 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052480((uint64_t)[v20 UTF8String], (uint64_t)v75);
    }
    uint64_t v25 = 70;
LABEL_20:

    (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, v25, 0, 0, 0, 0);
LABEL_26:

    goto LABEL_9;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_10005250C();
  }
LABEL_8:

  (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, v16, 0, 0, 0, 0);
LABEL_9:
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(&v69, 8);
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  id v18 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v18);

  opsQueue = self->_opsQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100013C44;
  v24[3] = &unk_100088F40;
  void v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  unint64_t v29 = a6;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(opsQueue, v24);
}

- (void)_LIMakeDir:(id)a3 named:(id)a4 withAttrs:(id)a5 andClient:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = sub_10000C880;
  v73[4] = sub_10000C890;
  id v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = sub_10000C880;
  v71[4] = sub_10000C890;
  id v72 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v70[3] = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  id v67 = sub_10000C880;
  id v68 = sub_10000C890;
  id v69 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_10000C880;
  char v62 = sub_10000C890;
  id v63 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  uint64_t v16 = [(smbMount *)self checkServerConnection];
  if (!v16)
  {
    if ((unint64_t)[v14 length] <= 0xB7)
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100052878((uint64_t)v75, (uint64_t)[v14 length]);
      }
      uint64_t v16 = 22;
      goto LABEL_8;
    }
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000144B0;
    block[3] = &unk_100088900;
    uint64_t v51 = &v64;
    block[4] = self;
    id v20 = v12;
    id v50 = v20;
    uint64_t v52 = &v54;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v65[5])
    {
      if (!*((unsigned char *)v55 + 24))
      {
        id v21 = self->_nodeTableSyncQueue;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10001450C;
        void v45[3] = &unk_1000889A0;
        uint64_t v48 = &v58;
        v45[4] = self;
        id v46 = v20;
        id v22 = v13;
        id v47 = v22;
        dispatch_sync(v21, v45);
        if (v59[5])
        {
          id v23 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v65[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_100052938();
          }

          (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, 17, 0, 0, 0, 0);
        }
        else
        {
          id v27 = malloc_type_malloc(0xF0uLL, 0x1000040D9093685uLL);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1000145B4;
          v41[3] = &unk_1000889F0;
          uint64_t v43 = &v64;
          id v42 = v22;
          id v44 = v27;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100014690;
          v28[3] = &unk_100089030;
          uint64_t v39 = v27;
          id v29 = v42;
          id v33 = &v64;
          id v32 = v15;
          unint64_t v30 = self;
          unint64_t v34 = v53;
          uint64_t v35 = &v58;
          unint64_t v40 = a6;
          id v36 = v70;
          id v31 = v14;
          unint64_t v37 = v71;
          unint64_t v38 = v73;
          [(smbMount *)self submitRequestBlockOnce:v41 continuationBlock:v28];
        }
        goto LABEL_26;
      }
    }
    else if (!*((unsigned char *)v55 + 24))
    {
      id v26 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000528B8((uint64_t)[v13 UTF8String], (uint64_t)v75);
      }
      uint64_t v25 = 2;
      goto LABEL_20;
    }
    id v24 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000528F8((uint64_t)[v20 UTF8String], (uint64_t)v75);
    }
    uint64_t v25 = 70;
LABEL_20:

    (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, v25, 0, 0, 0, 0);
LABEL_26:

    goto LABEL_9;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100052984();
  }
LABEL_8:

  (*((void (**)(id, uint64_t, void, void, void, void))v15 + 2))(v15, v16, 0, 0, 0, 0);
LABEL_9:
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v73, 8);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  id v13 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v13);

  opsQueue = self->_opsQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000151F0;
  v18[3] = &unk_100089080;
  void v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(opsQueue, v18);
}

- (void)_LIGetFsAttr:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x2810000000;
  uint64_t v78 = &unk_10007BB3D;
  uint64_t v79 = 0;
  uint64_t v11 = [(smbMount *)self checkServerConnection];
  if (v11)
  {
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100052CF0();
    }

    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"_N_PC_LINK_MAX"])
  {
    id v15 = v76;
    v76[4] = 1;
    id v14 = +[NSData dataWithBytes:v15 + 4 length:8];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
LABEL_80:
    uint64_t v11 = 12;
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"_N_PC_NAME_MAX"])
  {
    id v16 = v76;
    v76[4] = self->_shareInfo.maxComponentNameLen;
    id v14 = +[NSData dataWithBytes:v16 + 4 length:8];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  if ([v9 isEqualToString:@"_B_PC_NO_TRUNC"])
  {
    id v17 = v76;
    *((unsigned char *)v76 + 32) = 0;
    id v14 = +[NSData dataWithBytes:v17 + 4 length:8];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  if ([v9 isEqualToString:@"_N_PC_FILESIZEBITS"])
  {
    id v18 = v76;
    uint64_t v19 = 64;
    if (self->_share_fstype == 1) {
      uint64_t v19 = 33;
    }
    v76[4] = v19;
    id v14 = +[NSData dataWithBytes:v18 + 4 length:8];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  if ([v9 isEqualToString:@"_N_PC_XATTR_SIZE_BITS"])
  {
    if ((self->_shareInfo.fileSystemAttrs & 0x40000) != 0)
    {
      id v20 = v76;
      v76[4] = 33;
      id v14 = +[NSData dataWithBytes:v20 + 4 length:8];
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
LABEL_24:
    uint64_t v11 = 45;
LABEL_5:
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
LABEL_6:
    v13(v10, v11, 0);
    id v14 = 0;
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"_N_f_bsize"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10001607C;
    v74[3] = &unk_100088A90;
    v74[4] = self;
    void v74[5] = &v80;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000161B4;
    v69[3] = &unk_1000890D0;
    int v73 = 0;
    uint64_t v70 = v10;
    uint64_t v71 = &v75;
    id v72 = &v80;
    [(smbMount *)self submitRequestBlock:v74 continuationBlock:v69];

LABEL_39:
    _Block_object_dispose(&v80, 8);
    id v14 = 0;
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"_N_f_iosize"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100016284;
    v68[3] = &unk_100088A90;
    v68[4] = self;
    v68[5] = &v80;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000163BC;
    v63[3] = &unk_1000890D0;
    int v67 = 0;
    uint64_t v64 = v10;
    uint64_t v65 = &v75;
    uint64_t v66 = &v80;
    [(smbMount *)self submitRequestBlock:v68 continuationBlock:v63];

    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"_N_f_blocks"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10001648C;
    v62[3] = &unk_100088A90;
    v62[4] = self;
    v62[5] = &v80;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000165CC;
    v57[3] = &unk_1000890D0;
    int v61 = 0;
    uint64_t v58 = v10;
    uint64_t v59 = &v75;
    uint64_t v60 = &v80;
    [(smbMount *)self submitRequestBlock:v62 continuationBlock:v57];

    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"_N_f_bfree"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10001669C;
    void v56[3] = &unk_100088A90;
    v56[4] = self;
    void v56[5] = &v80;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000167DC;
    v51[3] = &unk_1000890D0;
    int v55 = 0;
    uint64_t v52 = v10;
    uint64_t v53 = &v75;
    uint64_t v54 = &v80;
    [(smbMount *)self submitRequestBlock:v56 continuationBlock:v51];

    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"_N_f_bavail"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000168AC;
    v50[3] = &unk_100088A90;
    v50[4] = self;
    v50[5] = &v80;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000169EC;
    void v45[3] = &unk_1000890D0;
    int v49 = 0;
    id v46 = v10;
    id v47 = &v75;
    uint64_t v48 = &v80;
    [(smbMount *)self submitRequestBlock:v50 continuationBlock:v45];

    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"_N_f_bused"])
  {
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x2020000000;
    uint64_t v83 = 0;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100016ABC;
    v44[3] = &unk_100088A90;
    v44[4] = self;
    v44[5] = &v80;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100016C00;
    v39[3] = &unk_1000890D0;
    int v43 = 0;
    unint64_t v40 = v10;
    id v41 = &v75;
    id v42 = &v80;
    [(smbMount *)self submitRequestBlock:v44 continuationBlock:v39];

    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"_S_f_type"])
  {
    id v14 = +[NSData dataWithBytes:"smb" length:4];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  if ([v9 isEqualToString:@"_S_f_subtype"])
  {
    id v14 = +[NSData dataWithBytes:"SMB2" length:5];
    id v13 = (void (*)(void *, uint64_t, void *))v10[2];
    if (v14) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  if (![v9 isEqualToString:@"_S_f_location"])
  {
    if ([v9 isEqualToString:@"_S_f_vol_name"])
    {
      id v27 = [(smbMount *)self shareName];
      id v28 = (const char *)[v27 UTF8String];

      id v14 = +[NSData dataWithBytes:v28 length:strlen(v28) + 1];
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (!v14)
      {
        v13(v10, 12, 0);
        goto LABEL_7;
      }
LABEL_79:
      v13(v10, 0, v14);
      goto LABEL_7;
    }
    if ([v9 isEqualToString:@"_B_has_perm_enforcement"])
    {
      id v29 = v76;
      *((unsigned char *)v76 + 32) = 1;
      id v14 = +[NSData dataWithBytes:v29 + 4 length:8];
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    if ([v9 isEqualToString:@"_B_has_access_check"])
    {
      unint64_t v30 = v76;
      *((unsigned char *)v76 + 32) = 1;
      id v14 = +[NSData dataWithBytes:v30 + 4 length:8];
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    if ([v9 isEqualToString:@"_N_caps_format"])
    {
      id v31 = v76;
      v76[4] = 139266;
      id v32 = v31 + 4;
      uint64_t v33 = 141314;
      if (self->_share_fstype == 1) {
        uint64_t v33 = 139298;
      }
      uint64_t *v32 = v33;
      if ((~LODWORD(self->_shareInfo.capabilities) & 0x81) == 0)
      {
        v33 |= 0x100uLL;
        uint64_t *v32 = v33;
      }
      unsigned int fileSystemAttrs = self->_shareInfo.fileSystemAttrs;
      if ((fileSystemAttrs & 2) != 0)
      {
        v33 |= 0x200uLL;
        uint64_t *v32 = v33;
        unsigned int fileSystemAttrs = self->_shareInfo.fileSystemAttrs;
      }
      if ((fileSystemAttrs & 0x40) != 0) {
        uint64_t *v32 = v33 | 0x40;
      }
      id v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    if ([v9 isEqualToString:@"_N_mntflags"])
    {
      uint64_t v35 = v76;
      v76[4] = 0;
      void v35[4] = (self->_shareInfo.fileSystemAttrs & 0x40000) == 0;
      id v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    if ([v9 isEqualToString:@"_N_caps_interfaces"])
    {
      id v36 = v76;
      uint64_t v37 = 0x100000;
      v76[4] = 0x100000;
      unint64_t v38 = v36 + 4;
      if ((self->_shareInfo.fileSystemAttrs & 0x40000) != 0) {
        uint64_t v37 = 1064960;
      }
      uint64_t *v38 = v37;
      id v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
      id v13 = (void (*)(void *, uint64_t, void *))v10[2];
      if (v14) {
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    goto LABEL_24;
  }
  id v21 = [(smbMount *)self userName];
  id v22 = [(smbMount *)self serverName];
  id v23 = +[NSString stringWithFormat:@"%@@%@", v21, v22];

  id v24 = v23;
  uint64_t v25 = (const char *)[v24 UTF8String];
  id v14 = +[NSData dataWithBytes:v25 length:strlen(v25) + 1];
  id v26 = (void (*)(void *, uint64_t, void *))v10[2];
  if (v14) {
    v26(v10, 0, v14);
  }
  else {
    v26(v10, 12, 0);
  }

LABEL_7:
  _Block_object_dispose(&v75, 8);
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  uint64_t v19 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

  id v20 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v20);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100016E6C;
  block[3] = &unk_1000890F8;
  block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v32 = v18;
  unint64_t v33 = a7;
  id v31 = v17;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(opsQueue, block);
}

- (void)_LIMakeSymLink:(id)a3 named:(id)a4 withContents:(id)a5 andAttrs:(id)a6 andClient:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x3032000000;
  v111[3] = sub_10000C880;
  v111[4] = sub_10000C890;
  id v112 = 0;
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x3032000000;
  v109[3] = sub_10000C880;
  v109[4] = sub_10000C890;
  id v110 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x2020000000;
  v108[3] = 0;
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x2020000000;
  uint64_t v107 = 0;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = sub_10000C880;
  v102 = sub_10000C890;
  id v103 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = sub_10000C880;
  v96 = sub_10000C890;
  id v97 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x2020000000;
  char v91 = 0;
  uint64_t v84 = 0;
  $C8790DA20DB7F8F9DF5BD97A4057CCF0 v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0;
  uint64_t v19 = [(smbMount *)self checkServerConnection];
  if (!v19)
  {
    if ((unint64_t)[v17 length] <= 0xB7)
    {
      id v21 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100052D40((uint64_t)v113, (uint64_t)[v17 length]);
      }
      uint64_t v19 = 22;
      goto LABEL_8;
    }
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000179C0;
    block[3] = &unk_100088900;
    id v81 = &v98;
    block[4] = self;
    id v23 = v14;
    id v80 = v23;
    uint64_t v82 = &v84;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v99[5])
    {
      if (!*((unsigned char *)v85 + 24))
      {
        id v24 = self->_nodeTableSyncQueue;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_100017A1C;
        v75[3] = &unk_1000889A0;
        uint64_t v78 = &v92;
        v75[4] = self;
        id v76 = v23;
        id v25 = v15;
        id v77 = v25;
        dispatch_sync(v24, v75);
        if (v93[5])
        {
          id v26 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v99[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_100052E00();
          }

          (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, 17, 0, 0, 0, 0);
        }
        else
        {
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_100017AC4;
          v69[3] = &unk_100088F68;
          unint64_t v74 = a7;
          void v69[4] = self;
          id v72 = &v98;
          id v30 = v25;
          id v70 = v30;
          int v73 = v83;
          id v31 = v18;
          id v71 = v31;
          id v32 = objc_retainBlock(v69);
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100017C6C;
          v55[3] = &unk_100089198;
          char v62 = &v98;
          id v33 = v16;
          id v56 = v33;
          id v60 = v31;
          id v63 = &v92;
          id v34 = v30;
          id v57 = v34;
          uint64_t v64 = &v104;
          uint64_t v65 = &v88;
          uint64_t v66 = v108;
          id v58 = v17;
          uint64_t v59 = self;
          int v67 = v109;
          id v68 = v111;
          uint64_t v35 = v32;
          id v61 = v35;
          uint64_t v39 = objc_retainBlock(v55);
          id v36 = malloc_type_malloc(0xF0uLL, 0x1000040D9093685uLL);
          v105[3] = (uint64_t)v36;
          *((unsigned char *)v89 + 24) = 0;
          if ([(smbMount *)self sm_flags])
          {
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_100018334;
            v52[3] = &unk_1000891C0;
            v54[1] = &v98;
            id v53 = v34;
            v54[0] = v33;
            v54[2] = &v104;
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_100018418;
            void v45[3] = &unk_100089210;
            void v45[4] = self;
            int v49 = &v98;
            id v46 = v53;
            id v47 = v54[0];
            id v50 = &v104;
            uint64_t v51 = &v88;
            uint64_t v48 = v39;
            [(smbMount *)self submitRequestBlockOnce:v52 continuationBlock:v45];

            uint64_t v37 = &v53;
            unint64_t v38 = v54;
          }
          else
          {
            *((unsigned char *)v89 + 24) = 1;
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_10001869C;
            v42[3] = &unk_1000891C0;
            v44[1] = &v98;
            id v43 = v34;
            v44[0] = v33;
            v44[2] = &v104;
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_100018780;
            v40[3] = &unk_1000889C8;
            id v41 = v39;
            [(smbMount *)self submitRequestBlockOnce:v42 continuationBlock:v40];

            uint64_t v37 = &v43;
            unint64_t v38 = (id *)v44;
          }
        }
        goto LABEL_29;
      }
    }
    else if (!*((unsigned char *)v85 + 24))
    {
      id v29 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100052D80((uint64_t)[v15 UTF8String], (uint64_t)v113);
      }
      uint64_t v28 = 2;
      goto LABEL_20;
    }
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052DC0((uint64_t)[v23 UTF8String], (uint64_t)v113);
    }
    uint64_t v28 = 70;
LABEL_20:

    (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, v28, 0, 0, 0, 0);
LABEL_29:

    goto LABEL_9;
  }
  id v20 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100052E4C();
  }
LABEL_8:

  (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, v19, 0, 0, 0, 0);
LABEL_9:
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(v108, 8);
  _Block_object_dispose(v109, 8);

  _Block_object_dispose(v111, 8);
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10
{
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  id v10 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v10);

  uint64_t v11 = [(smbMount *)self opsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000188E8;
  block[3] = &unk_100088BA8;
  block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v11, block);
}

- (void)_LIPathConf:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  int v15 = 0;
  uint64_t v6 = [(smbMount *)self checkServerConnection];
  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000531F0();
    }
    v5[2](v5, v7, 0);
  }
  else
  {
    unsigned int maxComponentNameLen = self->_shareInfo.maxComponentNameLen;
    v14[0] = 0;
    v14[1] = maxComponentNameLen;
    if ((~LODWORD(self->_shareInfo.capabilities) & 0x81) != 0) {
      char v9 = 6;
    }
    else {
      char v9 = 2;
    }
    LOBYTE(v15) = v9 & 0xF7 | (8 * ((self->_shareInfo.fileSystemAttrs & 2) != 0));
    if (self->_share_fstype == 1) {
      int v10 = 33;
    }
    else {
      int v10 = 64;
    }
    v14[2] = v10;
    uint64_t v11 = +[NSData dataWithBytes:v14 length:16];
    if (v11)
    {
      uint64_t v12 = 0;
      id v13 = v11;
    }
    else
    {
      uint64_t v12 = 12;
      id v13 = 0;
    }
    ((void (**)(id, uint64_t, void *))v5)[2](v5, v12, v13);
  }
}

- (void)LIRead:(id)a3 atOffset:(unint64_t)a4 withPointer:(char *)a5 length:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  int v15 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v15);

  opsQueue = self->_opsQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100018C60;
  v19[3] = &unk_100089260;
  void v19[4] = self;
  id v20 = v12;
  id v23 = a5;
  unint64_t v24 = a6;
  id v21 = v13;
  unint64_t v22 = a4;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(opsQueue, v19);
}

- (void)_LIRead:(id)a3 atOffset:(unint64_t)a4 withPointer:(char *)a5 length:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = (void (**)(id, uint64_t, void))a7;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_10000C880;
  id v46 = sub_10000C890;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_10000C880;
  unint64_t v40 = sub_10000C890;
  id v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v14 = [(smbMount *)self checkServerConnection];
  if (!v14)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000191E0;
    block[3] = &unk_100088900;
    id v30 = &v42;
    block[4] = self;
    id v17 = v12;
    id v29 = v17;
    id v31 = &v32;
    dispatch_sync(nodeTableSyncQueue, block);
    id v18 = (void *)v43[5];
    int v19 = *((unsigned __int8 *)v33 + 24);
    if (v18)
    {
      if (!*((unsigned char *)v33 + 24))
      {
        unint64_t v22 = [v18 fileRefSyncQueue];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10001923C;
        v27[3] = &unk_100088CC0;
        v27[4] = &v36;
        v27[5] = &v42;
        dispatch_sync(v22, v27);

        id v23 = (void *)v37[5];
        if (v23)
        {
          id v21 = [v23 fidCtx];
          if (v21)
          {
            unint64_t v24 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
            [(smbMount *)self readRequest:v17 bptr:a5 smbNode:v43[5] fileRef:v37[5] rdparamPtr:v24 result:0 thisOffset:a4 bytesRemain:a6 bytesRead:0 pass:0 reply:v13];
            goto LABEL_12;
          }
          id v26 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v43[5] name];
            [ objc_claimAutoreleasedReturnValue() UTF8String];
            sub_1000532E8();
          }
        }
        else
        {
          id v25 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v43[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_10005329C();
          }
        }

        uint64_t v20 = 9;
LABEL_11:
        v13[2](v13, v20, 0);
        id v21 = 0;
LABEL_12:

        goto LABEL_13;
      }
      int v19 = 1;
    }
    if (v19) {
      uint64_t v20 = 70;
    }
    else {
      uint64_t v20 = 2;
    }
    goto LABEL_11;
  }
  id v15 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100053334();
  }

  v13[2](v13, v14, 0);
LABEL_13:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

- (void)readRequest:(id)a3 bptr:(char *)a4 smbNode:(id)a5 fileRef:(id)a6 rdparamPtr:(smb_read_write *)a7 result:(int)a8 thisOffset:(unint64_t)a9 bytesRemain:(unint64_t)a10 bytesRead:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a13;
  id v21 = [(smbMount *)self readwriteSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000193F8;
  block[3] = &unk_1000892D8;
  int v40 = a8;
  id v33 = v20;
  unint64_t v34 = a10;
  char v35 = a7;
  unint64_t v36 = a11;
  id v29 = v19;
  id v30 = self;
  uint64_t v37 = a4;
  unint64_t v38 = a9;
  unint64_t v39 = a12;
  id v31 = v18;
  id v32 = v17;
  id v22 = v17;
  id v23 = v18;
  id v24 = v20;
  id v25 = v19;
  dispatch_async(v21, block);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10000C880;
  v23[4] = sub_10000C890;
  id v14 = v12;
  id v24 = v14;
  id v15 = [v14 mutableBytes];
  if (v15)
  {
    id v16 = [v14 length];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100019958;
    v20[3] = &unk_100089300;
    id v21 = v13;
    id v22 = v23;
    [(smbMount *)self LIRead:v11 atOffset:a4 withPointer:v15 length:v16 reply:v20];
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_100053438(v17, v18, v19);
    }
    (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 12, 0);
  }
  _Block_object_dispose(v23, 8);
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = +[NSMutableData dataWithLength:a4];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
    id v16 = [v15 mutableBytes];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100019B00;
    v17[3] = &unk_100089328;
    id v18 = v15;
    unint64_t v20 = a4;
    id v19 = v12;
    [(smbMount *)self LIRead:v11 atOffset:a5 withPointer:v16 length:a4 reply:v17];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000534B8();
    }
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 12, 0);
  }
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  char v9 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  int v10 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v10);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100019CB4;
  block[3] = &unk_100088BA8;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(opsQueue, block);
}

- (void)_LIReadLink:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_10000C880;
  uint64_t v48 = sub_10000C890;
  id v49 = 0;
  uint64_t v38 = 0;
  unint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_10000C880;
  uint64_t v42 = sub_10000C890;
  id v43 = 0;
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v8 = [(smbMount *)self checkServerConnection];
  if (!v8)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10001A320;
    block[3] = &unk_100088900;
    id v32 = &v38;
    void block[4] = self;
    id v11 = v6;
    id v31 = v11;
    id v33 = &v34;
    dispatch_sync(nodeTableSyncQueue, block);
    id v12 = (void *)v39[5];
    if (v12)
    {
      if (!*((unsigned char *)v35 + 24))
      {
        if ([v12 isSymlink])
        {
          uint64_t v13 = [(id)v39[5] symlinkTargetCache];
          id v14 = (void *)v45[5];
          void v45[5] = v13;

          if (v45[5])
          {
            id v15 = (void *)v39[5];
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_10001A37C;
            void v26[3] = &unk_100089350;
            v26[4] = self;
            uint64_t v28 = &v38;
            id v27 = v7;
            id v29 = &v44;
            [v15 fetchAttrDataWithCompletionHandler:v26];
          }
          else
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            void v25[2] = sub_10001A48C;
            v25[3] = &unk_100089378;
            v25[4] = &v38;
            v25[5] = &v44;
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_10001A5C0;
            v21[3] = &unk_1000893A0;
            id v23 = &v38;
            id v24 = &v44;
            void v21[4] = self;
            id v22 = v7;
            [(smbMount *)self submitRequestBlockOnce:v25 continuationBlock:v21];
          }
          goto LABEL_23;
        }
        id v20 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          [(id)v39[5] name];
          [ objc_claimAutoreleasedReturnValue() UTF8String];
          sub_1000535AC();
        }
        uint64_t v17 = 22;
LABEL_22:

        (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, v17, 0, 0);
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (!*((unsigned char *)v35 + 24))
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005352C((uint64_t)[v11 UTF8String], (uint64_t)v51);
      }
      uint64_t v17 = 2;
      goto LABEL_14;
    }
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005356C((uint64_t)[v11 UTF8String], (uint64_t)v51);
    }
    uint64_t v17 = 70;
LABEL_14:

    id v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005352C((uint64_t)[v11 UTF8String], (uint64_t)v50);
    }
    goto LABEL_22;
  }
  id v9 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_1000535F8();
  }

  (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, v8, 0, 0);
LABEL_24:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  dispatch_time_t v14 = dispatch_time(0, 15000000000);
  id v15 = [(smbMount *)self opsSyncGroup];
  intptr_t v16 = dispatch_group_wait(v15, v14);

  if (v16)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_1000536DC(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void, void))v13 + 2))(v13, 60, 0, 0, 0, &stru_10008A998, 0, 0);
  }
  else
  {
    id v25 = [(smbMount *)self namespaceChangingGroup];
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    id v26 = [(smbMount *)self namespaceChangingGroup];
    dispatch_group_enter(v26);

    opsQueue = self->_opsQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001A9E0;
    v28[3] = &unk_100089080;
    void v28[4] = self;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    dispatch_sync(opsQueue, v28);
  }
}

- (void)_LIRemove:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v54 = 0;
  int v55 = &v54;
  uint64_t v56 = 0x3032000000;
  id v57 = sub_10000C880;
  id v58 = sub_10000C890;
  id v59 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = sub_10000C880;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  uint64_t v52 = sub_10000C890;
  id v53 = 0;
  int v47 = 1;
  uint64_t v11 = [(smbMount *)self checkServerConnection];
  if (!v11)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10001B0B8;
    block[3] = &unk_100088900;
    uint64_t v38 = &v54;
    void block[4] = self;
    id v14 = v8;
    id v37 = v14;
    unint64_t v39 = &v42;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v55[5])
    {
      if (!*((unsigned char *)v43 + 24))
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10001B114;
        v30[3] = &unk_100089490;
        id v33 = v40;
        v30[4] = self;
        uint64_t v34 = &v54;
        id v15 = v9;
        id v31 = v15;
        char v35 = v46;
        id v16 = v10;
        id v32 = v16;
        BOOL v17 = objc_retainBlock(v30);
        uint64_t v18 = self->_nodeTableSyncQueue;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10001B714;
        void v26[3] = &unk_1000889A0;
        id v29 = &v48;
        v26[4] = self;
        id v27 = v14;
        id v28 = v15;
        dispatch_sync(v18, v26);
        uint64_t v19 = (void *)v49[5];
        if (v19)
        {
          if ([v19 isDir])
          {
            (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v16 + 2))(v16, 21, 0, 0, 0, &stru_10008A998, 0);
          }
          else
          {
            uint64_t v21 = (void *)v49[5];
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_10001B7BC;
            v22[3] = &unk_1000894B8;
            uint64_t v24 = &v48;
            id v25 = v46;
            uint64_t v23 = v17;
            [v21 prepareForReclaim:v22];
          }
        }
        else
        {
          ((void (*)(void *, void))v17[2])(v17, 0);
        }

        goto LABEL_21;
      }
    }
    else if (!*((unsigned char *)v43 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100053718();
      }
      uint64_t v20 = 2;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005378C();
    }
    uint64_t v20 = 70;
LABEL_14:
    (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v10 + 2))(v10, v20, 0, 0, 0, &stru_10008A998, 0);
LABEL_21:

    goto LABEL_22;
  }
  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100053800();
  }

  (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v10 + 2))(v10, v11, 0, 0, 0, &stru_10008A998, 0);
LABEL_22:
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  dispatch_time_t v14 = dispatch_time(0, 15000000000);
  id v15 = [(smbMount *)self opsSyncGroup];
  intptr_t v16 = dispatch_group_wait(v15, v14);

  if (v16)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_100053964(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void, void))v13 + 2))(v13, 60, 0, 0, 0, &stru_10008A998, 0, 0);
  }
  else
  {
    id v25 = [(smbMount *)self namespaceChangingGroup];
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    id v26 = [(smbMount *)self namespaceChangingGroup];
    dispatch_group_enter(v26);

    id v27 = [(smbMount *)self opsQueue];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001B9F4;
    v28[3] = &unk_100089080;
    void v28[4] = self;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    dispatch_sync(v27, v28);
  }
}

- (void)_LIRemoveDir:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  int v67 = sub_10000C880;
  id v68 = sub_10000C890;
  id v69 = 0;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_10000C880;
  uint64_t v54 = 0;
  int v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  char v53 = 0;
  char v62 = sub_10000C890;
  id v63 = 0;
  uint64_t v11 = [(smbMount *)self checkServerConnection];
  if (!v11)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10001C0B4;
    block[3] = &unk_100088900;
    uint64_t v50 = &v64;
    void block[4] = self;
    id v14 = v8;
    id v49 = v14;
    uint64_t v51 = &v54;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v65[5])
    {
      if (!*((unsigned char *)v55 + 24))
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_10001C110;
        v42[3] = &unk_100089558;
        uint64_t v46 = v52;
        void v42[4] = self;
        int v47 = &v64;
        id v15 = v9;
        id v43 = v15;
        id v16 = v10;
        id v45 = v16;
        id v17 = v14;
        id v44 = v17;
        uint64_t v18 = objc_retainBlock(v42);
        uint64_t v19 = self->_nodeTableSyncQueue;
        uint64_t v34 = _NSConcreteStackBlock;
        uint64_t v35 = 3221225472;
        uint64_t v36 = sub_10001C75C;
        id v37 = &unk_1000889A0;
        char v41 = &v58;
        uint64_t v38 = self;
        id v39 = v17;
        id v40 = v15;
        dispatch_sync(v19, &v34);
        uint64_t v20 = (void *)v59[5];
        if (v20)
        {
          if ((objc_msgSend(v20, "isDir", v34, v35, v36, v37, v38, v39) & 1) == 0)
          {
            uint64_t v29 = 20;
LABEL_23:
            (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v16 + 2))(v16, v29, 0, 0, 0, &stru_10008A998, 0);
LABEL_26:

            goto LABEL_27;
          }
          if ([(id)v59[5] isRoot])
          {
            BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v21) {
              sub_100053A20(v21, v22, v23, v24, v25, v26, v27, v28);
            }
            uint64_t v29 = 13;
            goto LABEL_23;
          }
          uint64_t v33 = v59[5];
        }
        else
        {
          uint64_t v33 = 0;
        }
        ((void (*)(void *, uint64_t))v18[2])(v18, v33);
        goto LABEL_26;
      }
    }
    else if (!*((unsigned char *)v55 + 24))
    {
      id v32 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000539A0((uint64_t)[v9 UTF8String], (uint64_t)v70);
      }
      uint64_t v31 = 2;
      goto LABEL_17;
    }
    id v30 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000539E0((uint64_t)[v14 UTF8String], (uint64_t)v70);
    }
    uint64_t v31 = 70;
LABEL_17:

    (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v10 + 2))(v10, v31, 0, 0, 0, &stru_10008A998, 0);
LABEL_27:

    goto LABEL_28;
  }
  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100053A5C();
  }

  (*((void (**)(id, uint64_t, void, void, void, const __CFString *, void))v10 + 2))(v10, v11, 0, 0, 0, &stru_10008A998, 0);
LABEL_28:
  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
}

- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053BF8(v9, v19, v20, v21, v22, v23, v24, v25);
    }
    (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE, void))v18
     + 2))(v18, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    dispatch_time_t v26 = dispatch_time(0, 15000000000);
    uint64_t v27 = [(smbMount *)self opsSyncGroup];
    intptr_t v28 = dispatch_group_wait(v27, v26);

    if (v28)
    {
      BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v29) {
        sub_100053BBC(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE, void))v18
       + 2))(v18, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    else
    {
      id v37 = [(smbMount *)self namespaceChangingGroup];
      dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);

      uint64_t v38 = [(smbMount *)self namespaceChangingGroup];
      dispatch_group_enter(v38);

      id v39 = [(smbMount *)self opsQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10001CA64;
      block[3] = &unk_1000895A8;
      void block[4] = self;
      id v41 = v14;
      id v42 = v15;
      id v43 = v16;
      id v44 = v17;
      int v46 = 0;
      id v45 = v18;
      dispatch_sync(v39, block);
    }
  }
}

- (void)_LIRename:(id)a3 name:(id)a4 toDir:(id)a5 andName:(id)a6 withFlags:(unsigned int)a7 reply:(id)a8
{
  id v100 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v175[0] = 0;
  v175[1] = v175;
  v175[2] = 0x3032000000;
  v175[3] = sub_10000C880;
  v175[4] = sub_10000C890;
  id v176 = 0;
  v173[0] = 0;
  v173[1] = v173;
  v173[2] = 0x3032000000;
  v173[3] = sub_10000C880;
  v173[4] = sub_10000C890;
  id v174 = 0;
  uint64_t v167 = 0;
  v168 = &v167;
  uint64_t v169 = 0x3032000000;
  v170 = sub_10000C880;
  v171 = sub_10000C890;
  id v172 = 0;
  uint64_t v161 = 0;
  v162 = &v161;
  uint64_t v163 = 0x3032000000;
  v164 = sub_10000C880;
  v165 = sub_10000C890;
  uint64_t v155 = 0;
  v156 = (id *)&v155;
  uint64_t v157 = 0x3032000000;
  v158 = sub_10000C880;
  v159 = sub_10000C890;
  id v160 = 0;
  uint64_t v149 = 0;
  v150 = &v149;
  uint64_t v151 = 0x3032000000;
  v152 = sub_10000C880;
  v153 = sub_10000C890;
  uint64_t v206 = 0;
  v207 = &v206;
  uint64_t v208 = 0x11010000000;
  v209 = &unk_10007BB3D;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  uint64_t v187 = 0;
  v188 = &v187;
  uint64_t v189 = 0x11010000000;
  v190 = &unk_10007BB3D;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x2020000000;
  char v148 = 0;
  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x2020000000;
  char v144 = 0;
  v142[0] = 0;
  v142[1] = v142;
  v142[2] = 0x2020000000;
  v142[3] = 0;
  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x3032000000;
  v140[3] = sub_10000C880;
  v140[4] = sub_10000C890;
  id v141 = 0;
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  char v139 = 0;
  id v154 = 0;
  id v166 = 0;

  uint64_t v17 = [(smbMount *)self checkServerConnection];
  if (!v17)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10001D8A0;
    block[3] = &unk_100088900;
    v136 = &v167;
    void block[4] = self;
    id v20 = v100;
    id v135 = v20;
    v137 = &v145;
    dispatch_sync(nodeTableSyncQueue, block);
    if (v168[5])
    {
      if (!*((unsigned char *)v146 + 24))
      {
        unsigned int v21 = [v20 isEqualToString:v14];
        char v22 = v21;
        if (v21)
        {
          objc_storeStrong(v156 + 5, (id)v168[5]);
          goto LABEL_9;
        }
        char v57 = self->_nodeTableSyncQueue;
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_10001D8FC;
        v130[3] = &unk_100088900;
        v132 = &v155;
        v130[4] = self;
        id v131 = v14;
        v133 = &v145;
        dispatch_sync(v57, v130);
        if (v156[5])
        {
          if (!*((unsigned char *)v146 + 24))
          {

LABEL_9:
            uint64_t v23 = self->_nodeTableSyncQueue;
            v129[0] = _NSConcreteStackBlock;
            v129[1] = 3221225472;
            v129[2] = sub_10001D958;
            v129[3] = &unk_1000895D0;
            v129[6] = &v161;
            v129[4] = self;
            v129[7] = &v167;
            id v24 = v13;
            v129[5] = v24;
            dispatch_sync(v23, v129);
            uint64_t v25 = (void *)v162[5];
            if (v25)
            {
              dispatch_time_t v26 = v207;
              uint64_t v27 = (long long *)[v25 getSmbFattr];
              long long v28 = *v27;
              long long v29 = v27[2];
              *((_OWORD *)v26 + 3) = v27[1];
              *((_OWORD *)v26 + 4) = v29;
              *((_OWORD *)v26 + 2) = v28;
              long long v30 = v27[3];
              long long v31 = v27[4];
              long long v32 = v27[6];
              *((_OWORD *)v26 + 7) = v27[5];
              *((_OWORD *)v26 + 8) = v32;
              *((_OWORD *)v26 + 5) = v30;
              *((_OWORD *)v26 + 6) = v31;
              long long v33 = v27[7];
              long long v34 = v27[8];
              long long v35 = v27[10];
              *((_OWORD *)v26 + 11) = v27[9];
              *((_OWORD *)v26 + 12) = v35;
              *((_OWORD *)v26 + 9) = v33;
              *((_OWORD *)v26 + 10) = v34;
              long long v36 = v27[11];
              long long v37 = v27[12];
              long long v38 = v27[14];
              *((_OWORD *)v26 + 15) = v27[13];
              *((_OWORD *)v26 + 16) = v38;
              *((_OWORD *)v26 + 13) = v36;
              *((_OWORD *)v26 + 14) = v37;
              int v99 = *((_DWORD *)v207 + 38);
              id v39 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                [(id)v162[5] name];
                objc_claimAutoreleasedReturnValue();
                sub_100053D6C();
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100053CF8();
              }
              int v99 = 0;
            }
            uint64_t v58 = self->_nodeTableSyncQueue;
            v125[0] = _NSConcreteStackBlock;
            v125[1] = 3221225472;
            v125[2] = sub_10001DA18;
            v125[3] = &unk_1000895D0;
            v127 = &v149;
            v125[4] = self;
            v128 = &v155;
            id v59 = v15;
            id v126 = v59;
            dispatch_sync(v58, v125);
            uint64_t v60 = (void *)v162[5];
            id v61 = v150;
            if (v60 && v60 == (void *)v150[5])
            {
              v150[5] = 0;

              id v61 = v150;
            }
            char v62 = (void *)v61[5];
            if (v62)
            {
              id v63 = v188;
              uint64_t v64 = (long long *)[v62 getSmbFattr];
              long long v65 = *v64;
              long long v66 = v64[2];
              *((_OWORD *)v63 + 3) = v64[1];
              *((_OWORD *)v63 + 4) = v66;
              *((_OWORD *)v63 + 2) = v65;
              long long v67 = v64[3];
              long long v68 = v64[4];
              long long v69 = v64[6];
              *((_OWORD *)v63 + 7) = v64[5];
              *((_OWORD *)v63 + 8) = v69;
              *((_OWORD *)v63 + 5) = v67;
              *((_OWORD *)v63 + 6) = v68;
              long long v70 = v64[7];
              long long v71 = v64[8];
              long long v72 = v64[10];
              *((_OWORD *)v63 + 11) = v64[9];
              *((_OWORD *)v63 + 12) = v72;
              *((_OWORD *)v63 + 9) = v70;
              *((_OWORD *)v63 + 10) = v71;
              long long v73 = v64[11];
              long long v74 = v64[12];
              long long v75 = v64[14];
              *((_OWORD *)v63 + 15) = v64[13];
              *((_OWORD *)v63 + 16) = v75;
              *((_OWORD *)v63 + 13) = v73;
              *((_OWORD *)v63 + 14) = v74;
            }
            if (!v162[5]) {
              goto LABEL_35;
            }
            if (!v150[5]) {
              goto LABEL_35;
            }
            int v76 = *((_DWORD *)v207 + 38);
            int v77 = *((_DWORD *)v188 + 38);
            if (v76 == v77) {
              goto LABEL_35;
            }
            if (v76 != 2 || v77 == 2)
            {
              if (v76 == 2 || v77 != 2)
              {
LABEL_35:
                v118[0] = _NSConcreteStackBlock;
                v118[1] = 3221225472;
                v118[2] = sub_10001DAD8;
                v118[3] = &unk_1000895F8;
                v121 = &v167;
                char v124 = v22;
                id v119 = v24;
                v122 = &v155;
                id v120 = v59;
                int v123 = v99;
                v101[0] = _NSConcreteStackBlock;
                v101[1] = 3221225472;
                v101[2] = sub_10001DBE4;
                v101[3] = &unk_1000896E8;
                v105 = &v161;
                uint64_t v106 = &v167;
                v101[4] = self;
                uint64_t v107 = &v149;
                v108 = v140;
                v109 = v142;
                id v110 = v138;
                v111 = &v187;
                id v112 = &v155;
                char v117 = v22;
                id v102 = v120;
                v113 = v143;
                v114 = &v206;
                id v103 = v119;
                id v104 = v16;
                v115 = v175;
                v116 = v173;
                [(smbMount *)self submitRequestBlockOnce:v118 continuationBlock:v101];

LABEL_36:
                uint64_t v78 = v129;
LABEL_42:

                goto LABEL_43;
              }
              uint64_t v88 = 21;
            }
            else
            {
              uint64_t v88 = 20;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              int v97 = *((_DWORD *)v207 + 38);
              int v98 = *((_DWORD *)v188 + 38);
              *(_DWORD *)buf = 138413314;
              id v178 = v24;
              __int16 v179 = 1024;
              int v180 = v97;
              __int16 v181 = 2112;
              id v182 = v59;
              __int16 v183 = 1024;
              int v184 = v98;
              __int16 v185 = 1024;
              int v186 = v88;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "LIRename: type mismatch, fromName: %@, fa_vtype: 0x%x, toName: %@, fa_vtype: 0x%x, error: %d\n", buf, 0x28u);
            }
            (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE))v16
             + 2))(v16, v88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            goto LABEL_36;
          }
        }
        else if (!*((unsigned char *)v146 + 24))
        {
          BOOL v89 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v89) {
            sub_100053DB8(v89, v90, v91, v92, v93, v94, v95, v96);
          }
          uint64_t v87 = 2;
          goto LABEL_41;
        }
        BOOL v79 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v79) {
          sub_100053DF4(v79, v80, v81, v82, v83, v84, v85, v86);
        }
        uint64_t v87 = 70;
LABEL_41:
        (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE))v16
         + 2))(v16, v87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        uint64_t v78 = v130;
        goto LABEL_42;
      }
    }
    else if (!*((unsigned char *)v146 + 24))
    {
      BOOL v49 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v49) {
        sub_100053C80(v49, v50, v51, v52, v53, v54, v55, v56);
      }
      uint64_t v48 = 2;
      goto LABEL_17;
    }
    BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v40) {
      sub_100053CBC(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    uint64_t v48 = 70;
LABEL_17:
    (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE))v16
     + 2))(v16, v48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
LABEL_43:

    goto LABEL_44;
  }
  id v18 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100053E30();
  }

  (*((void (**)(id, uint64_t, void, void, void, void, void, void, _BYTE, void, void, _BYTE))v16
   + 2))(v16, v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
LABEL_44:
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(v140, 8);

  _Block_object_dispose(v142, 8);
  _Block_object_dispose(v143, 8);
  _Block_object_dispose(&v145, 8);
  _Block_object_dispose(&v187, 8);
  _Block_object_dispose(&v206, 8);
  _Block_object_dispose(&v149, 8);

  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v161, 8);

  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(v173, 8);

  _Block_object_dispose(v175, 8);
}

- (void)setAttrInternalLocked:(id)a3 setAttrs:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  char v64 = 0;
  uint64_t v45 = 0;
  v46[0] = &v45;
  v46[1] = 0xD810000000;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v46[2] = &unk_10007BB3D;
  uint64_t v58 = 0;
  id v11 = v9;
  id v12 = [v11 bytes];
  long long v13 = *v12;
  long long v14 = v12[1];
  long long v15 = v12[3];
  long long v49 = v12[2];
  long long v50 = v15;
  long long v47 = v13;
  long long v48 = v14;
  long long v16 = v12[4];
  long long v17 = v12[5];
  long long v18 = v12[7];
  long long v53 = v12[6];
  long long v54 = v18;
  long long v51 = v16;
  long long v52 = v17;
  long long v19 = v12[8];
  long long v20 = v12[9];
  long long v21 = v12[10];
  uint64_t v58 = *((void *)v12 + 22);
  long long v56 = v20;
  long long v57 = v21;
  long long v55 = v19;
  if (!*(void *)(v46[0] + 40))
  {
    uint64_t v26 = 0;
LABEL_7:
    v10[2](v10, v26);
    goto LABEL_13;
  }
  id v22 = [v8 getSmbFattr];
  v60[3] = (uint64_t)v22;
  uint64_t v23 = *(void *)(v46[0] + 40);
  *(void *)(v46[0] + 40) = v23 & 0xFFFFFFFFFFFFFFFDLL;
  if ((v23 & 0x184) != 0)
  {
    id v24 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v25 = [v8 name];
      sub_100054180((uint64_t)[v25 UTF8String], (uint64_t)v46, (uint64_t)v65, v25);
    }

    uint64_t v26 = 22;
    goto LABEL_7;
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001F0EC;
  v38[3] = &unk_100089760;
  v38[4] = self;
  uint64_t v41 = &v45;
  uint64_t v42 = v63;
  id v27 = v8;
  id v39 = v27;
  uint64_t v43 = &v59;
  int v44 = 0;
  long long v28 = v10;
  BOOL v40 = v28;
  long long v29 = objc_retainBlock(v38);
  if ((*(unsigned char *)(v46[0] + 40) & 0x40) != 0 && [v27 isReg])
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001F4B0;
    v34[3] = &unk_100088B08;
    id v35 = v27;
    long long v36 = &v45;
    long long v37 = &v59;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001F594;
    v30[3] = &unk_100089788;
    id v31 = v35;
    long long v32 = v28;
    long long v33 = v29;
    [(smbMount *)self submitRequestBlock:v34 continuationBlock:v30];
  }
  else
  {
    ((void (*)(void *, void))v29[2])(v29, 0);
  }

LABEL_13:
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v63, 8);
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  long long v13 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v13);

  opsQueue = self->_opsQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001F764;
  v18[3] = &unk_100089080;
  void v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(opsQueue, v18);
}

- (void)_LISetAttr:(id)a3 setAttrs:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10000C880;
  void v39[4] = sub_10000C890;
  id v40 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10000C880;
  long long v36 = sub_10000C890;
  id v37 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v11 = [(smbMount *)self checkServerConnection];
  if (!v11)
  {
    if ((unint64_t)[v9 length] <= 0xB7)
    {
      id v13 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100054314((uint64_t)location, (uint64_t)[v9 length]);
      }
      uint64_t v11 = 22;
      goto LABEL_8;
    }
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10001FD20;
    block[3] = &unk_100088900;
    uint64_t v26 = &v32;
    void block[4] = self;
    id v25 = v8;
    id v27 = &v28;
    dispatch_sync(nodeTableSyncQueue, block);
    int v15 = *((unsigned __int8 *)v29 + 24);
    if (v33[5])
    {
      if (!*((unsigned char *)v29 + 24))
      {
        objc_initWeak(location, self);
        uint64_t v17 = v33[5];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10001FD7C;
        v18[3] = &unk_100089800;
        objc_copyWeak(&v23, location);
        id v20 = v38;
        id v21 = &v32;
        id v19 = v10;
        id v22 = v39;
        [(smbMount *)self setAttrInternalLocked:v17 setAttrs:v9 CompletionHandler:v18];

        objc_destroyWeak(&v23);
        objc_destroyWeak(location);
LABEL_18:

        goto LABEL_9;
      }
      int v15 = 1;
    }
    if (v15) {
      uint64_t v16 = 70;
    }
    else {
      uint64_t v16 = 2;
    }
    (*((void (**)(id, uint64_t, void, void, void, void, void, uint64_t))v10 + 2))(v10, v16, 0, 0, 0, 0, 0, 2);
    goto LABEL_18;
  }
  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100054354();
  }
LABEL_8:

  (*((void (**)(id, uint64_t, void, void, void, void, void, uint64_t))v10 + 2))(v10, v11, 0, 0, 0, 0, 0, 2);
LABEL_9:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  id v10 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v10);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000201F8;
  block[3] = &unk_100088BA8;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(opsQueue, block);
}

- (void)_LIStatFS:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10000C880;
  long long v29 = sub_10000C890;
  id v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v8 = [(smbMount *)self checkServerConnection];
  if (!v8)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10002064C;
    block[3] = &unk_100088900;
    id v19 = &v25;
    void block[4] = self;
    id v18 = v6;
    id v20 = &v21;
    dispatch_sync(nodeTableSyncQueue, block);
    int v11 = *((unsigned __int8 *)v22 + 24);
    if (v26[5])
    {
      if (!*((unsigned char *)v22 + 24))
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000206A8;
        v16[3] = &unk_100088A90;
        v16[4] = self;
        void v16[5] = v31;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000207A0;
        v13[3] = &unk_100089828;
        id v14 = v7;
        id v15 = v31;
        [(smbMount *)self submitRequestBlock:v16 continuationBlock:v13];

LABEL_13:
        goto LABEL_14;
      }
      int v11 = 1;
    }
    if (v11) {
      uint64_t v12 = 70;
    }
    else {
      uint64_t v12 = 2;
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v12, 0);
    goto LABEL_13;
  }
  id v9 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100054438();
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v8, 0);
LABEL_14:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  id v15 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v15);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000209B8;
  block[3] = &unk_1000888D8;
  void block[4] = self;
  id v21 = v11;
  id v23 = v13;
  unint64_t v24 = a4;
  id v22 = v12;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(opsQueue, block);
}

- (void)_LIWrite:(id)a3 atOffset:(unint64_t)a4 withBuffer:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, void))a6;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  int v44 = sub_10000C880;
  uint64_t v45 = sub_10000C890;
  id v46 = 0;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10000C880;
  id v39 = sub_10000C890;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v13 = [(smbMount *)self checkServerConnection];
  if (!v13)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100020F7C;
    block[3] = &unk_100088900;
    long long v29 = &v41;
    void block[4] = self;
    id v16 = v10;
    id v28 = v16;
    id v30 = &v31;
    dispatch_sync(nodeTableSyncQueue, block);
    id v17 = (void *)v42[5];
    if (v17)
    {
      if (!*((unsigned char *)v32 + 24))
      {
        id v18 = [v17 fileRefSyncQueue];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100020FD8;
        void v26[3] = &unk_100088CC0;
        v26[4] = &v35;
        void v26[5] = &v41;
        dispatch_sync(v18, v26);

        id v19 = (void *)v36[5];
        if (v19)
        {
          id v20 = [v19 fidCtx];
          BOOL v21 = v20 == 0;

          if (!v21)
          {
            id v22 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
            -[smbMount writeRequest:withBuffer:smbNode:fileRef:wrparamPtr:result:thisOffset:bytesWritten:bytesRemain:pass:reply:](self, "writeRequest:withBuffer:smbNode:fileRef:wrparamPtr:result:thisOffset:bytesWritten:bytesRemain:pass:reply:", v16, v11, v42[5], v36[5], v22, 0, a4, 0, [v11 length], 0, v12);
LABEL_15:

            goto LABEL_16;
          }
          id v25 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v42[5] name];
            [ objc_claimAutoreleasedReturnValue() UTF8String];
            sub_10005462C();
          }
        }
        else
        {
          id v24 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            [(id)v42[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_1000545E0();
          }
        }

        uint64_t v23 = 9;
LABEL_14:
        v12[2](v12, v23, 0);
        goto LABEL_15;
      }
    }
    else if (!*((unsigned char *)v32 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000544F8();
      }
      uint64_t v23 = 2;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005456C();
    }
    uint64_t v23 = 70;
    goto LABEL_14;
  }
  id v14 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100054678();
  }

  v12[2](v12, v13, 0);
LABEL_16:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

- (void)writeRequest:(id)a3 withBuffer:(id)a4 smbNode:(id)a5 fileRef:(id)a6 wrparamPtr:(smb_read_write *)a7 result:(int)a8 thisOffset:(unint64_t)a9 bytesWritten:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a13;
  uint64_t v23 = [(smbMount *)self readwriteSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000211BC;
  block[3] = &unk_1000898A0;
  int v42 = a8;
  unint64_t v37 = a11;
  long long v38 = a7;
  id v31 = v21;
  id v32 = v20;
  uint64_t v33 = self;
  id v34 = v19;
  unint64_t v39 = a10;
  unint64_t v40 = a9;
  unint64_t v41 = a12;
  id v35 = v18;
  id v36 = v22;
  id v24 = v18;
  id v25 = v19;
  id v26 = v22;
  id v27 = v20;
  id v28 = v21;
  dispatch_async(v23, block);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v13 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v13);

  opsQueue = self->_opsQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100021768;
  v18[3] = &unk_100089080;
  void v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(opsQueue, v18);
}

- (void)_LIGetXattr:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_10000C880;
  uint64_t v60 = sub_10000C890;
  id v61 = 0;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3032000000;
  long long v53 = sub_10000C880;
  long long v54 = sub_10000C890;
  id v55 = 0;
  uint64_t v46 = 0;
  long long v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v11 = [(smbMount *)self checkServerConnection];
  if (!v11)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100021DC4;
    block[3] = &unk_100088900;
    unint64_t v40 = &v56;
    void block[4] = self;
    id v14 = v8;
    id v39 = v14;
    unint64_t v41 = &v42;
    dispatch_sync(nodeTableSyncQueue, block);
    id v15 = (void *)v57[5];
    if (v15)
    {
      if (!*((unsigned char *)v43 + 24))
      {
        if ((self->_shareInfo.fileSystemAttrs & 0x40000) != 0)
        {
          id v19 = [v15 xattrCache];
          v62[0] = 0;
          id v20 = [v19 dataForName:v9 wasNegative:v62];
          if (v20)
          {
            v10[2](v10, 0, v20);
          }
          else if (v62[0])
          {
            v10[2](v10, 93, 0);
          }
          else
          {
            void v47[3] = 1024;
            id v21 = objc_alloc((Class)NSMutableData);
            id v22 = [v21 initWithLength:v47[3]];
            uint64_t v23 = (void *)v51[5];
            v51[5] = (uint64_t)v22;

            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100021E20;
            v32[3] = &unk_1000898F0;
            id v35 = &v56;
            id v33 = v9;
            id v34 = self;
            id v36 = &v50;
            unint64_t v37 = &v46;
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_100021F28;
            v24[3] = &unk_100089940;
            long long v29 = &v50;
            id v25 = v19;
            id v26 = v33;
            id v30 = &v56;
            id v31 = &v46;
            id v27 = self;
            id v28 = v10;
            [(smbMount *)self submitRequestBlock:v32 continuationBlock:v24];
          }
          goto LABEL_15;
        }
        uint64_t v16 = 93;
LABEL_14:
        v10[2](v10, v16, 0);
LABEL_15:

        goto LABEL_16;
      }
    }
    else if (!*((unsigned char *)v43 + 24))
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10005477C((uint64_t)[v14 UTF8String], (uint64_t)v62);
      }
      uint64_t v16 = 9;
      goto LABEL_13;
    }
    id v17 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000547BC((uint64_t)[v14 UTF8String], (uint64_t)v62);
    }
    uint64_t v16 = 70;
LABEL_13:

    goto LABEL_14;
  }
  id v12 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_1000547FC();
  }

  v10[2](v10, v11, 0);
LABEL_16:
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  id v18 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v18);

  opsQueue = self->_opsQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000224C0;
  v24[3] = &unk_100089990;
  void v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int v29 = a6;
  id v28 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(opsQueue, v24);
}

- (void)_LISetXattr:(id)a3 name:(id)a4 value:(id)a5 how:(int)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v64 = 0;
  long long v65 = &v64;
  uint64_t v66 = 0x3032000000;
  long long v67 = sub_10000C880;
  long long v68 = sub_10000C890;
  id v69 = 0;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10000C880;
  void v53[4] = sub_10000C890;
  id v54 = 0;
  uint64_t v16 = [(smbMount *)self checkServerConnection];
  if (!v16)
  {
    void v61[3] = 0;
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100022C70;
    block[3] = &unk_100088900;
    long long v51 = &v64;
    void block[4] = self;
    id v50 = v12;
    uint64_t v52 = &v55;
    dispatch_sync(nodeTableSyncQueue, block);
    id v19 = (void *)v65[5];
    if (v19)
    {
      if (!*((unsigned char *)v56 + 24))
      {
        id v20 = [v19 xattrCache];
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100022CCC;
        v43[3] = &unk_1000899B8;
        char v45 = &v60;
        uint64_t v46 = &v64;
        long long v47 = v53;
        uint64_t v48 = v59;
        id v44 = v15;
        id v21 = objc_retainBlock(v43);
        if (a6 >= 3)
        {
          if (a6 != 3)
          {
LABEL_20:

            goto LABEL_21;
          }
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100023004;
          v29[3] = &unk_1000894E0;
          v30[1] = &v64;
          v30[0] = v13;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000230CC;
          v24[3] = &unk_100089918;
          id v28 = &v64;
          id v25 = v30[0];
          id v26 = v20;
          id v27 = v21;
          [(smbMount *)self submitRequestBlockOnce:v29 continuationBlock:v24];

          id v22 = v30;
        }
        else
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100022E9C;
          v38[3] = &unk_1000899E0;
          unint64_t v41 = &v64;
          int v42 = a6;
          v39[0] = v13;
          v39[1] = self;
          id v40 = v14;
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100022F98;
          v31[3] = &unk_100089A08;
          id v36 = &v64;
          id v32 = v39[0];
          int v37 = a6;
          id v33 = v20;
          id v34 = v40;
          id v35 = v21;
          [(smbMount *)self submitRequestBlockOnce:v38 continuationBlock:v31];

          id v22 = v39;
        }

        goto LABEL_20;
      }
    }
    else if (!*((unsigned char *)v56 + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100054A20();
      }
      uint64_t v23 = 9;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100054A94();
    }
    uint64_t v23 = 70;
LABEL_13:
    (*((void (**)(id, uint64_t, void, void, void, void, uint64_t))v15 + 2))(v15, v23, 0, 0, 0, 0, 2);
LABEL_21:

    goto LABEL_22;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100054B08();
  }

  (*((void (**)(id, uint64_t, void, void, void, void, uint64_t))v15 + 2))(v15, v16, 0, 0, 0, 0, 2);
LABEL_22:
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  id v10 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v10);

  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100023244;
  block[3] = &unk_100088BA8;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(opsQueue, block);
}

- (void)_LIListXattrs:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10000C880;
  id v36 = sub_10000C890;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  id v30[2] = 0x3032000000;
  v30[3] = sub_10000C880;
  void v30[4] = sub_10000C890;
  id v31 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v8 = [(smbMount *)self checkServerConnection];
  if (!v8)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100023790;
    block[3] = &unk_100088900;
    id v24 = &v32;
    void block[4] = self;
    id v11 = v6;
    id v23 = v11;
    id v25 = &v26;
    dispatch_sync(nodeTableSyncQueue, block);
    id v12 = (void *)v33[5];
    if (v12)
    {
      if (!*((unsigned char *)v27 + 24))
      {
        id v13 = [v12 xattrCache];
        if ([v13 noXattrsPresent])
        {
          v7[2](v7, 0, &__NSArray0__struct);
        }
        else
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000237EC;
          v21[3] = &unk_100089378;
          void v21[4] = &v32;
          void v21[5] = v30;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100023920;
          v17[3] = &unk_100089A80;
          id v19 = v7;
          id v18 = v13;
          id v20 = v30;
          [(smbMount *)self submitRequestBlock:v21 continuationBlock:v17];
        }
        goto LABEL_19;
      }
    }
    else if (!*((unsigned char *)v27 + 24))
    {
      id v16 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100054CB8((uint64_t)[v11 UTF8String], (uint64_t)v38);
      }
      uint64_t v15 = 9;
      goto LABEL_13;
    }
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100054CF8((uint64_t)[v11 UTF8String], (uint64_t)v38);
    }
    uint64_t v15 = 70;
LABEL_13:

    v7[2](v7, v15, 0);
LABEL_19:

    goto LABEL_20;
  }
  id v9 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100054D38();
  }

  v7[2](v7, v8, 0);
LABEL_20:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

  id v20 = [(smbMount *)self searchObjects];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100023C48;
  v35[3] = &unk_100089AA0;
  void v35[4] = a7;
  [v20 enumerateKeysAndObjectsUsingBlock:v35];

  id v21 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v21);

  opsQueue = self->_opsQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100023CA4;
  v28[3] = &unk_1000890F8;
  void v28[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v33 = v18;
  unint64_t v34 = a7;
  id v32 = v17;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  dispatch_async(opsQueue, v28);
}

- (void)_LISearch:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 withCallerID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, uint64_t))a8;
  uint64_t v185 = 0;
  int v186 = &v185;
  uint64_t v187 = 0x3032000000;
  v188 = sub_10000C880;
  uint64_t v189 = sub_10000C890;
  id v190 = 0;
  uint64_t v180 = 0;
  __int16 v181 = &v180;
  uint64_t v182 = 0x2020000000;
  char v183 = 0;
  char v179 = 0;
  char v184 = 0;
  uint64_t v19 = [(smbMount *)self checkServerConnection];
  if (!v19)
  {
    id v22 = [(smbMount *)self searchLock];
    [v22 lock];

    id v23 = [(smbMount *)self searchObjects];
    id v21 = [v23 objectForKey:v15];

    id v24 = [(smbMount *)self searchLock];
    [v24 unlock];

    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055604();
      }
      v18[2](v18, 17);
      goto LABEL_9;
    }
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100024B18;
    block[3] = &unk_100088900;
    v177 = &v185;
    void block[4] = self;
    id v28 = v14;
    id v176 = v28;
    id v178 = &v180;
    dispatch_sync(nodeTableSyncQueue, block);
    id v29 = (void *)v186[5];
    if (v29)
    {
      if (!*((unsigned char *)v181 + 24))
      {
        if ([v29 isRoot])
        {
          id v30 = objc_alloc((Class)NSString);
          id v31 = [(smbMount *)self shareName];
          id v26 = [v30 initWithFormat:@"%@", v31];
          v165 = 0;
LABEL_26:

          id v37 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            [(id)v186[5] name];
            objc_claimAutoreleasedReturnValue();
            sub_10005556C();
          }

          id v21 = objc_alloc_init(smbSearchContext);
          if (!v21)
          {
            BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v39) {
              sub_100054EB4(v39, v40, v41, v42, v43, v44, v45, v46);
            }
            v18[2](v18, 12);
            v171 = 0;
            id v172 = 0;
            id v34 = 0;
            id v21 = 0;
            goto LABEL_57;
          }
          id v172 = objc_alloc_init((Class)wspContext);
          if (!v172)
          {
            BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v47) {
              sub_100054EF0(v47, v48, v49, v50, v51, v52, v53, v54);
            }
            v18[2](v18, 12);
            v171 = 0;
            id v172 = 0;
            goto LABEL_56;
          }
          if (gethostname(v195, 0x100uLL))
          {
            uint64_t v38 = *__error();
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000554FC();
            }
LABEL_50:
            v18[2](v18, v38);
            v171 = 0;
LABEL_56:
            id v34 = 0;
LABEL_57:
            id v25 = v165;
            goto LABEL_20;
          }
          v171 = +[NSString stringWithUTF8String:v195];
          if (!v171)
          {
            BOOL v68 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v68) {
              sub_100054F2C(v68, v69, v70, v71, v72, v73, v74, v75);
            }
            uint64_t v38 = 12;
            goto LABEL_50;
          }
          uint64_t v56 = [(smbMount *)self serverName];
          [v172 setServerName:v56];

          uint64_t v57 = [(smbMount *)self userName];
          [v172 setUserName:v57];

          [v172 setClientMachineName:v171];
          [v172 setSearchPath:v26];
          char v58 = [(smbMount *)self pd];
          [(smbSearchContext *)v21 setPd:v58];

          [(smbSearchContext *)v21 setSearchToken:v15];
          [(smbSearchContext *)v21 setCallerID:a7];
          [(smbSearchContext *)v21 setHandler:v17];
          [(smbSearchContext *)v21 setWctx:v172];
          if ([(smbSearchContext *)v21 parseSearchCriteria:v16])
          {
            BOOL v59 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v59) {
              sub_1000554C0(v59, v60, v61, v62, v63, v64, v65, v66);
            }
            uint64_t v67 = 12;
LABEL_55:
            v18[2](v18, v67);
            goto LABEL_56;
          }
          uint64_t v67 = [(smbSearchContext *)v21 doTreeConnect];
          if (v67)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100055450();
            }
            [(smbSearchContext *)v21 logoutDisconnect];
            goto LABEL_55;
          }
          id v25 = sub_10003305C((const sockaddr *)&self->serverSockAddr, self->serverSockAddrLen);

          if (v25)
          {
            [v172 setServerAddress:v25];
          }
          else
          {
            BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v76) {
              sub_100055414(v76, v77, v78, v79, v80, v81, v82, v83);
            }
          }
          [(smbSearchContext *)v21 logConfig];
          uint64_t v84 = [(smbSearchContext *)v21 procCheckIndexingEnabled:0 IndexEnable:&v179];
          if (v84)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000553A4();
            }
LABEL_76:
            v18[2](v18, v84);
            id v34 = 0;
            goto LABEL_20;
          }
          if (!v179)
          {
            BOOL v85 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v85) {
              sub_100054F68(v85, v86, v87, v88, v89, v90, v91, v92);
            }
            uint64_t v84 = 45;
            goto LABEL_76;
          }
          id v34 = objc_alloc_init((Class)QueryStatusExResults);
          if (!v34)
          {
            BOOL v93 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v93) {
              sub_100054FA4(v93, v94, v95, v96, v97, v98, v99, v100);
            }
            uint64_t v84 = 12;
            goto LABEL_76;
          }
          unsigned int v166 = [(smbSearchContext *)v21 procPrimaryQuery:0 QueryExResults:v34];
          if (v166)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100055334();
            }
          }
          else
          {
            unsigned int v166 = [(smbSearchContext *)v21 procSecondaryQuery:1 QueryExResults:v34];
            if (!v166)
            {
              id v101 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_10005526C(v193, (int)[v34 cRowsTotal], (int)objc_msgSend(v34, "cResultsFound"));
              }

              uint64_t v167 = [(smbMount *)self searchLock];
              [v167 lock];

              v168 = [(smbMount *)self searchObjects];
              id v160 = [(smbSearchContext *)v21 searchToken];
              [v168 setObject:v21 forKey:v160];

              uint64_t v169 = [(smbMount *)self searchLock];
              [v169 unlock];

              v18[2](v18, 0);
              if ([(smbSearchContext *)v21 checkSearchAborted])
              {
                BOOL v102 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                if (v102) {
                  sub_100055104(v102, v103, v104, v105, v106, v107, v108, v109);
                }
              }
              else
              {
                char v184 = 0;
                while (![(smbSearchContext *)v21 checkSearchAborted])
                {
                  [(smbSearchContext *)v21 setSearchRows:0];
                  unsigned int v170 = [(smbSearchContext *)v21 doGetRows:1 EndOfRowSet:&v184];
                  if (v170)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_1000551FC();
                    }
LABEL_112:
                    BOOL v150 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                    if (v150) {
                      sub_10005517C(v150, v151, v152, v153, v154, v155, v156, v157);
                    }
                    goto LABEL_100;
                  }
                  id v110 = [(smbSearchContext *)v21 searchRows];
                  BOOL v161 = v110 == 0;

                  if (v161)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                      sub_1000551B8(&v173, v174);
                    }
                  }
                  else
                  {
                    id v111 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                    {
                      v162 = [(smbSearchContext *)v21 searchRows];
                      v158 = [v162 rows];
                      id v112 = [v158 count];
                      *(_DWORD *)buf = 134217984;
                      id v192 = v112;
                      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "LISearch: received %lu rows", buf, 0xCu);
                    }
                    [(smbMount *)self deliverSearchResults:v21];
                  }
                  if (v184) {
                    goto LABEL_112;
                  }
                }
                BOOL v113 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                if (v113) {
                  sub_100055140(v113, v114, v115, v116, v117, v118, v119, v120);
                }
              }
              unsigned int v170 = 0;
LABEL_100:
              uint64_t v163 = [(smbMount *)self searchLock];
              [v163 lock];

              v164 = [(smbMount *)self searchObjects];
              v159 = [(smbSearchContext *)v21 searchToken];
              [v164 removeObjectForKey:v159];

              v121 = [(smbMount *)self searchLock];
              [v121 unlock];

              uint64_t v122 = [(smbSearchContext *)v21 searchLock];
              [(id)v122 lock];

              LOBYTE(v122) = [(smbSearchContext *)v21 isAborted];
              BOOL v123 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
              if (v122)
              {
                if (v123) {
                  sub_10005501C(v123, v124, v125, v126, v127, v128, v129, v130);
                }
                id v131 = [(smbSearchContext *)v21 handler];
                [v131 tokenDone:89];

                BOOL v132 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                if (v132) {
                  sub_100054FE0(v132, v133, v134, v135, v136, v137, v138, v139);
                }
              }
              else
              {
                if (v123) {
                  sub_100055094();
                }
                v140 = [(smbSearchContext *)v21 handler];
                [v140 tokenDone:v170];

                BOOL v141 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                if (v141) {
                  sub_100055058(v141, v142, v143, v144, v145, v146, v147, v148);
                }
              }
              [(smbSearchContext *)v21 setIsFinished:1];
              uint64_t v149 = [(smbSearchContext *)v21 searchLock];
              [v149 unlock];

              [(smbSearchContext *)v21 doFreeCursor:0];
              [(smbSearchContext *)v21 doFreeCursor:1];
              [(smbSearchContext *)v21 doDisconnect:0];
              [(smbSearchContext *)v21 doDisconnect:1];
              [(smbSearchContext *)v21 logoutDisconnect];
              goto LABEL_20;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000552C4();
            }
          }
          v18[2](v18, v166);
LABEL_20:

          goto LABEL_10;
        }
        v165 = +[smb_subr makeWindowsPath:v186[5] withName:0];
        if (v165)
        {
          id v36 = objc_alloc((Class)NSString);
          id v31 = [(smbMount *)self shareName];
          id v26 = [v36 initWithFormat:@"%@/%@", v31, v165];
          goto LABEL_26;
        }
        id v55 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(id)v186[5] name];
          objc_claimAutoreleasedReturnValue();
          sub_1000555B8();
        }
        uint64_t v33 = 22;
LABEL_19:

        v18[2](v18, v33);
        v171 = 0;
        id v172 = 0;
        id v34 = 0;
        id v21 = 0;
        id v25 = 0;
        id v26 = 0;
        goto LABEL_20;
      }
    }
    else if (!*((unsigned char *)v181 + 24))
    {
      id v35 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100054E34((uint64_t)[v28 UTF8String], (uint64_t)v194);
      }
      uint64_t v33 = 9;
      goto LABEL_19;
    }
    id v32 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100054E74((uint64_t)[v28 UTF8String], (uint64_t)v194);
    }
    uint64_t v33 = 70;
    goto LABEL_19;
  }
  id v20 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100055678();
  }

  v18[2](v18, v19);
  id v21 = 0;
LABEL_9:
  id v25 = 0;
  id v26 = 0;
LABEL_10:
  _Block_object_dispose(&v180, 8);

  _Block_object_dispose(&v185, 8);
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  opsQueue = self->_opsQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100024C48;
  _DWORD v14[3] = &unk_100088C20;
  v14[4] = self;
  id v15 = v9;
  unsigned int v17 = a4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(opsQueue, v14);
}

- (void)_LISearchReplenishCredits:(id)a3 credits:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v14 = (void (**)(id, uint64_t))a5;
  id v8 = a3;
  id v9 = [(smbMount *)self searchLock];
  [v9 lock];

  id v10 = [(smbMount *)self searchObjects];
  id v11 = [v10 objectForKey:v8];

  id v12 = [(smbMount *)self searchLock];
  [v12 unlock];

  if (v11)
  {
    id v13 = [v11 handler];
    [v13 replenishCredits:v5 reply:v14];
  }
  else
  {
    v14[2](v14, 2);
  }
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  opsQueue = self->_opsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100024EC0;
  block[3] = &unk_100088BA8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(opsQueue, block);
}

- (void)_LISearchAbort:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = a3;
  id v8 = [(smbMount *)self searchLock];
  [v8 lock];

  id v9 = [(smbMount *)self searchObjects];
  id v12 = [v9 objectForKey:v7];

  if (v12)
  {
    [v12 setSearchAborted];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 2;
  }
  id v11 = [(smbMount *)self searchLock];
  [v11 unlock];

  v6[2](v6, v10);
}

- (void)abortAllClientSearchesFor:(unint64_t)a3
{
  opsQueue = self->_opsQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000250BC;
  void v4[3] = &unk_100088860;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(opsQueue, v4);
}

- (void)_LISearchAbortAllClientSearches:(unint64_t)a3
{
  uint64_t v5 = [(smbMount *)self searchLock];
  [v5 lock];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "LISearchAbortAllClientSearches- stopping all live searches for client %llu", buf, 0xCu);
  }
  id v6 = [(smbMount *)self searchObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025204;
  void v8[3] = &unk_100089AC0;
  v8[4] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  id v7 = [(smbMount *)self searchLock];
  [v7 unlock];
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(smbMount *)self namespaceChangingGroup];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  id v12 = [(smbMount *)self opsSyncGroup];
  dispatch_group_enter(v12);

  opsQueue = self->_opsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100025374;
  v16[3] = &unk_100088C20;
  v16[4] = self;
  id v17 = v9;
  unsigned int v19 = a4;
  id v18 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(opsQueue, v16);
}

- (void)_LIAccessCheck:(id)a3 requestedAccess:(unsigned int)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_10000C880;
  uint64_t v41 = sub_10000C890;
  id v42 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v10 = [(smbMount *)self checkServerConnection];
  if (!v10)
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10002585C;
    block[3] = &unk_100088900;
    id v27 = &v37;
    void block[4] = self;
    id v26 = v8;
    id v28 = &v33;
    dispatch_sync(nodeTableSyncQueue, block);
    int v13 = *((unsigned __int8 *)v34 + 24);
    if (v38[5])
    {
      if (!*((unsigned char *)v34 + 24))
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000258B8;
        v21[3] = &unk_100089AE8;
        unsigned int v24 = a4;
        id v23 = &v37;
        void v21[4] = self;
        id v22 = v9;
        id v15 = objc_retainBlock(v21);
        if ([(id)v38[5] getMaxAccessAttr:v30 + 3])
        {
          ((void (*)(void *, void))v15[2])(v15, *((unsigned int *)v30 + 6));
        }
        else
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100025BC0;
          v20[3] = &unk_100089378;
          void v20[4] = &v37;
          v20[5] = &v29;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100025C94;
          v16[3] = &unk_1000894B8;
          id v18 = &v37;
          unsigned int v19 = &v29;
          id v17 = v15;
          [(smbMount *)self submitRequestBlock:v20 continuationBlock:v16];
        }
        goto LABEL_16;
      }
      int v13 = 1;
    }
    if (v13) {
      uint64_t v14 = 70;
    }
    else {
      uint64_t v14 = 2;
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v14);
LABEL_16:

    goto LABEL_17;
  }
  id v11 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_1000556C8();
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, v10);
LABEL_17:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v11 = a3;
  id v12 = (void (**)(id, void))a7;
  dispatch_time_t v13 = dispatch_time(0, 15000000000);
  uint64_t v14 = [(smbMount *)self opsSyncGroup];
  intptr_t v15 = dispatch_group_wait(v14, v13);

  if (v15)
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v16) {
      sub_100055F98(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    v12[2](v12, 0);
  }
  else
  {
    unsigned int v24 = [(smbMount *)self namespaceChangingGroup];
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    opsQueue = self->_opsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100025EFC;
    block[3] = &unk_100089B60;
    void block[4] = self;
    BOOL v30 = a4;
    id v27 = v11;
    unint64_t v29 = a5;
    id v28 = v12;
    dispatch_async(opsQueue, block);
  }
}

- (void)_LISetUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id))a6;
  id location = 0;
  id v12 = self;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  void v47[3] = sub_10000C880;
  v47[4] = sub_10000C890;
  id v31 = v10;
  id v48 = v31;
  if ([(smbMount *)v12 checkServerConnection])
  {
    id v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)v12 serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)v12 shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100055FD4();
    }

    getNSErrorFromLiveFSErrno();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14);
    goto LABEL_5;
  }
  unint64_t v16 = ~a5;
  if (![v31 isEqualToString:LIUpdateNSFileProviderRootContainerItemIdentifier])
  {
    uint64_t v17 = [(NSMutableDictionary *)v12->_handleTable objectForKey:v31];
    intptr_t v15 = v17;
    if (!v17) {
      goto LABEL_10;
    }
    if (v8)
    {
      objc_msgSend(v17, "setInterestedClients:", (unint64_t)objc_msgSend(v17, "interestedClients") | a5);
      if ([v15 isDir])
      {
        objc_storeWeak(&location, v15);
        id v18 = objc_alloc((Class)NSString);
        uint64_t v19 = [v15 name];
        id v20 = [v18 initWithString:v19];

        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100026550;
        void v40[3] = &unk_100088BF8;
        id v41 = v20;
        id v42 = v11;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100026600;
        v35[3] = &unk_100089BB0;
        id v14 = v41;
        id v36 = v14;
        uint64_t v37 = v12;
        uint64_t v38 = v47;
        objc_copyWeak(&v39, &location);
        [v15 addChangeNotify:v40 NotifyHandler:v35];
        objc_destroyWeak(&v39);

        uint64_t v21 = &v41;
        uint64_t v22 = (id *)&v42;
LABEL_26:

        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(v17, "setInterestedClients:", (unint64_t)objc_msgSend(v17, "interestedClients") & v16);
      if ([v15 isDir])
      {
        objc_storeWeak(&location, v15);
        id v28 = objc_alloc((Class)NSString);
        unint64_t v29 = [v15 name];
        id v30 = [v28 initWithString:v29];

        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100026794;
        v32[3] = &unk_100088BF8;
        id v14 = v30;
        id v33 = v14;
        id v34 = v11;
        [v15 clearChangeNotify:1 completionHandler:v32];
        uint64_t v21 = &v33;
        uint64_t v22 = (id *)&v34;
        goto LABEL_26;
      }
    }
LABEL_27:
    v11[2](v11, 0);
    goto LABEL_7;
  }
  if (!v8)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v23 = [(NSMutableDictionary *)v12->_handleTable allKeys];
    intptr_t v15 = 0;
    id v24 = [v23 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v44;
      do
      {
        id v26 = 0;
        id v27 = v15;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v23);
          }
          intptr_t v15 = [(NSMutableDictionary *)v12->_handleTable objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * (void)v26)];

          objc_msgSend(v15, "setInterestedClients:", (unint64_t)objc_msgSend(v15, "interestedClients") & v16);
          id v26 = (char *)v26 + 1;
          id v27 = v15;
        }
        while (v24 != v26);
        id v24 = [v23 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v24);
    }

    goto LABEL_27;
  }
LABEL_10:
  getNSErrorFromLiveFSErrno();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v14);
LABEL_5:
  intptr_t v15 = 0;
LABEL_6:

LABEL_7:
  _Block_object_dispose(v47, 8);

  objc_destroyWeak(&location);
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (int)connectionState
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_connectionSyncQueue);
  connectionSyncQueue = v2->_connectionSyncQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026938;
  v5[3] = &unk_100089BD8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(connectionSyncQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)_setConnectionState:(int)a3
{
  connectionSyncQueue = self->_connectionSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000269D4;
  void v4[3] = &unk_100089C00;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(connectionSyncQueue, v4);
}

- (void)SetShutDownReason:(int)a3
{
  connectionSyncQueue = self->_connectionSyncQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026A6C;
  void v4[3] = &unk_100089C00;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(connectionSyncQueue, v4);
}

- (void)submitRequestBlock:(id)a3 continuationBlock:(id)a4
{
}

- (void)submitRequestBlockOnce:(id)a3 continuationBlock:(id)a4
{
}

- (void)_submitRequestBlock:(id)a3 continuationBlock:(id)a4 allowRetries:(BOOL)a5
{
  id v8 = a3;
  atomic_fetch_add((atomic_ullong *volatile)&self->_pendingRequests, 1uLL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100026C8C;
  v16[3] = &unk_100088BF8;
  void v16[4] = self;
  id v9 = objc_retainBlock(a4);
  id v17 = v9;
  id v10 = objc_retainBlock(v16);
  if ([(smbMount *)self connectionState] - 3 > 0xFFFFFFFD)
  {
    connQueue = self->_connQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026D60;
    v12[3] = &unk_100089C50;
    v12[4] = self;
    id v13 = v10;
    id v14 = v8;
    BOOL v15 = a5;
    dispatch_async(connQueue, v12);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100056400();
    }
    ((void (*)(void *, uint64_t))v10[2])(v10, 5);
  }
}

- (void)requestDisconnect
{
  connectionSyncQueue = self->_connectionSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100027170;
  block[3] = &unk_100088838;
  void block[4] = self;
  dispatch_sync(connectionSyncQueue, block);
}

- (void)notifyConnectionLost
{
  objc_super v3 = [(smbMount *)self connectionSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1000274F0;
  block[3] = &unk_100088838;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)reconnectSession
{
  __tp.tv_nsec = 0;
  uint64_t v106 = 0;
  uint64_t v107 = &v106;
  uint64_t v108 = 0x2020000000;
  char v109 = 0;
  v104.tv_nsec = 0;
  __tp.__darwin_time_t tv_sec = 0;
  v104.__darwin_time_t tv_sec = 0;
  uint64_t v103 = 0;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  int v120 = 0;
  $C8790DA20DB7F8F9DF5BD97A4057CCF0 v118 = 0u;
  long long v119 = 0u;
  long long v117 = 0u;
  uint64_t v97 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v92 = 0u;
  memset(v116, 0, sizeof(v116));
  unsigned int v3 = [(smbMount *)self connectionState];
  id v4 = &_os_log_default;
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3 == 2)
  {
    if (v5)
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100056B5C();
    }

    id v6 = objc_alloc_init((Class)SMBPiston);
    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableString);
      id v8 = objc_alloc_init((Class)NSMutableString);
      id v9 = v8;
      if (v7 && v8)
      {
        if ([(smbMount *)self isGuestLogin])
        {
          BOOL v85 = 0;
          id v86 = 0;
LABEL_27:
          clock_gettime(_CLOCK_REALTIME, &__tp);
          int v18 = 0;
          char v19 = 0;
          int v20 = 0;
          char v84 = 1;
LABEL_28:
          if (v19)
          {

            if (v84) {
              goto LABEL_19;
            }
            goto LABEL_84;
          }
          while (1)
          {
            while (1)
            {
              if ([(smbMount *)self connectionState] != 2)
              {
                id v62 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  [(smbMount *)self serverName];
                  objc_claimAutoreleasedReturnValue();
                  [(smbMount *)self shareName];
                  objc_claimAutoreleasedReturnValue();
                  sub_1000569CC();
                }
LABEL_71:

                goto LABEL_72;
              }
              int v21 = v18;
              if (v18 >= 1)
              {
                while (1)
                {
                  sleep(1u);
                  if ([(smbMount *)self connectionState] != 2) {
                    break;
                  }
                  if (!--v21) {
                    goto LABEL_33;
                  }
                }
                id v60 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  [(smbMount *)self serverName];
                  objc_claimAutoreleasedReturnValue();
                  [(smbMount *)self shareName];
                  objc_claimAutoreleasedReturnValue();
                  sub_1000569CC();
                }
                goto LABEL_71;
              }
LABEL_33:
              if (v18 < 5) {
                ++v18;
              }
              clock_gettime(_CLOCK_REALTIME, &v104);
              ++v20;
              __darwin_time_t v22 = v104.tv_sec - __tp.tv_sec;
              id v23 = &_os_log_default;
              if (v22 >= 21)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v78 = [(smbMount *)self serverName];
                  uint64_t v79 = [(smbMount *)self shareName];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)&uint8_t buf[4] = v20;
                  *(_WORD *)&buf[8] = 2048;
                  *(void *)&buf[10] = v22;
                  *(_WORD *)&buf[18] = 2112;
                  *(void *)&buf[20] = v78;
                  *(_WORD *)&buf[28] = 2112;
                  *(void *)&buf[30] = v79;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: pass: %u, reconnect timed out after %ld seconds on server: %@, share: %@ \n", buf, 0x26u);
                }
                if (v84)
                {
LABEL_19:
                  unsigned int v12 = [(smbMount *)self connectionState];
                  id v13 = &_os_log_default;
                  BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v12 == 2)
                  {
                    if (v14)
                    {
                      [(smbMount *)self serverName];
                      objc_claimAutoreleasedReturnValue();
                      [(smbMount *)self shareName];
                      objc_claimAutoreleasedReturnValue();
                      sub_1000567EC();
                    }

                    connectionSyncQueue = self->_connectionSyncQueue;
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 3221225472;
                    void block[2] = sub_100029270;
                    block[3] = &unk_100088838;
                    void block[4] = self;
                    dispatch_sync(connectionSyncQueue, block);
                    [(smbMount *)self requestDisconnect];

                    goto LABEL_72;
                  }
                  if (v14)
                  {
                    [(smbMount *)self serverName];
                    objc_claimAutoreleasedReturnValue();
                    [(smbMount *)self shareName];
                    objc_claimAutoreleasedReturnValue();
                    sub_10005683C();
                  }
LABEL_25:

                  goto LABEL_72;
                }
LABEL_84:
                unsigned int v63 = [(smbMount *)self connectionState];
                id v64 = &_os_log_default;
                BOOL v65 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v63 != 2)
                {
                  if (v65)
                  {
                    [(smbMount *)self serverName];
                    objc_claimAutoreleasedReturnValue();
                    [(smbMount *)self shareName];
                    objc_claimAutoreleasedReturnValue();
                    sub_1000569CC();
                  }
                  goto LABEL_25;
                }
                if (v65)
                {
                  [(smbMount *)self serverName];
                  objc_claimAutoreleasedReturnValue();
                  [(smbMount *)self shareName];
                  objc_claimAutoreleasedReturnValue();
                  sub_100056ABC();
                }

                [(smbMount *)self setSm_flags:1];
                self->_serverGuid = v118;
                [(smbMount *)self setServerSecMode:WORD2(v117)];
                [(smbMount *)self setServerDialect:WORD3(v117)];
                [(smbMount *)self setServerNegContextCnt:WORD4(v117)];
                [(smbMount *)self setServerCaps:v119];
                [(smbMount *)self setServerMaxTx:DWORD1(v119)];
                [(smbMount *)self setServerMaxRd:DWORD2(v119)];
                [(smbMount *)self setServerMaxWr:HIDWORD(v119)];
                [(smbMount *)self setSessionID:*((void *)&v102 + 1)];
                [(smbMount *)self setSessionFlags:WORD2(v102)];
                [(smbMount *)self setShareID:HIDWORD(v100)];
                [(smbMount *)self setShareType:BYTE4(v98)];
                [(smbMount *)self setShareFlags:v99];
                [(smbMount *)self setShareCaps:HIDWORD(v99)];
                [(smbMount *)self setShareMaxAccess:v100];
                uint64_t v66 = [(smbMount *)self modelName];
                [v66 setString:v7];

                uint64_t v67 = [(smbMount *)self fsName];
                [v67 setString:v9];

                *(_OWORD *)&buf[32] = v94;
                long long v113 = v95;
                long long v114 = v96;
                uint64_t v115 = v97;
                *(_OWORD *)buf = v92;
                *(_OWORD *)&buf[16] = v93;
                [(smbMount *)self setShareInfo:buf];
                [(smbMount *)self shareInfo];
                self->_sm_flags = self->_sm_flags & 0xFFFFFFFE | (v90 >> 7) & 1;
                id v68 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  [(smbMount *)self serverName];
                  objc_claimAutoreleasedReturnValue();
                  [(smbMount *)self shareName];
                  objc_claimAutoreleasedReturnValue();
                  sub_100056A6C();
                }

                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000;
                *(void *)&buf[24] = sub_10000C880;
                *(void *)&buf[32] = sub_10000C890;
                *(void *)&buf[40] = 0;
                v110[0] = 0;
                v110[1] = v110;
                v110[2] = 0x3032000000;
                v110[3] = sub_10000C880;
                nodeTableSyncQueue = self->_nodeTableSyncQueue;
                v110[4] = sub_10000C890;
                id v111 = 0;
                v89[0] = _NSConcreteStackBlock;
                v89[1] = 3221225472;
                v89[2] = sub_100028A00;
                v89[3] = &unk_100089CC8;
                v89[4] = self;
                v89[5] = v110;
                v89[6] = buf;
                dispatch_sync(nodeTableSyncQueue, v89);
                id v70 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  [(smbMount *)self serverName];
                  objc_claimAutoreleasedReturnValue();
                  [(smbMount *)self shareName];
                  objc_claimAutoreleasedReturnValue();
                  sub_100056A1C();
                }

                *((unsigned char *)v107 + 24) = 0;
                uint64_t v71 = self->_nodeTableSyncQueue;
                v88[0] = _NSConcreteStackBlock;
                v88[1] = 3221225472;
                v88[2] = sub_100028BE8;
                v88[3] = &unk_100089CF0;
                v88[4] = self;
                v88[5] = v110;
                v88[6] = buf;
                v88[7] = &v106;
                dispatch_sync(v71, v88);
                if ([(smbMount *)self connectionState] == 2)
                {
                  uint64_t v72 = v9;
                  int v73 = *((unsigned __int8 *)v107 + 24);
                  id v74 = &_os_log_default;
                  BOOL v75 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v73)
                  {
                    id v9 = v72;
                    if (v75)
                    {
                      [(smbMount *)self serverName];
                      objc_claimAutoreleasedReturnValue();
                      [(smbMount *)self shareName];
                      objc_claimAutoreleasedReturnValue();
                      sub_10005697C();
                    }

                    [(smbMount *)self _setConnectionState:4];
                    [(smbMount *)self flushAndReconnect];
                    goto LABEL_105;
                  }
                  id v9 = v72;
                  if (v75)
                  {
                    [(smbMount *)self serverName];
                    objc_claimAutoreleasedReturnValue();
                    [(smbMount *)self shareName];
                    objc_claimAutoreleasedReturnValue();
                    sub_10005692C();
                  }

                  [(smbMount *)self _setConnectionState:1];
                  clock_gettime(_CLOCK_REALTIME, &self->_lastRequestTime);
                  [(smbMount *)self resumeIdleTimer];
                  BOOL v76 = [(smbMount *)self connQueue];
                  dispatch_resume(v76);
                }
                else
                {
                  BOOL v76 = &_os_log_default;
                  id v77 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    [(smbMount *)self serverName];
                    objc_claimAutoreleasedReturnValue();
                    [(smbMount *)self shareName];
                    objc_claimAutoreleasedReturnValue();
                    sub_1000569CC();
                    BOOL v76 = &_os_log_default;
                  }
                }

LABEL_105:
                _Block_object_dispose(v110, 8);

                _Block_object_dispose(buf, 8);
                goto LABEL_72;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                id v36 = [(smbMount *)self serverName];
                uint64_t v37 = [(smbMount *)self shareName];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&uint8_t buf[4] = v20;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v36;
                *(_WORD *)&buf[18] = 2112;
                *(void *)&buf[20] = v37;
                _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reconnectSession: starting pass: %u on server: %@, share: %@ \n", buf, 0x1Cu);
              }
              id v24 = [(smbMount *)self serverName];
              unsigned int v25 = +[smb_subr sendNegotiate:v6 Server:v24 netBIOSName:0 VPNCookie:0 Result:&v117];

              if (!v25) {
                break;
              }
              id v26 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                uint64_t v81 = v9;
                int v43 = v117;
                long long v44 = [(smbMount *)self serverName];
                long long v45 = [(smbMount *)self shareName];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v25;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v43;
                *(_WORD *)&buf[14] = 2112;
                *(void *)&buf[16] = v44;
                *(_WORD *)&buf[24] = 2112;
                *(void *)&buf[26] = v45;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: sendNegotiate error: %u, ntstatus: 0x%x on server: %@, share: %@ \n", buf, 0x22u);

                id v9 = v81;
              }
            }
            long long v101 = 0u;
            long long v102 = 0u;
            unint64_t sessionID = self->_sessionID;
            uint64_t v103 = 0;
            *((void *)&v101 + 1) = sessionID;
            if ([(smbMount *)self isGuestLogin]) {
              break;
            }
            if ((v120 & 0x44) == 0
              || (LODWORD(v101) = 2,
                  [(smbMount *)self userName],
                  id v30 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v29 = +[smb_subr sendSessionSetup:v6 User:v30 Password:v85 Realm:@"WELLKNOWN:COM.APPLE.LKDC" Param:&v101], v30, v29 == 80))
            {
              LODWORD(v101) = 4;
              id v28 = [(smbMount *)self userName];
              id v31 = [(smbMount *)self userDomain];
              unsigned int v29 = +[smb_subr sendSessionSetup:v6 User:v28 Password:v85 Realm:v31 Param:&v101];

              goto LABEL_47;
            }
LABEL_48:
            if (v29)
            {
              id v32 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                uint64_t v82 = v9;
                int v50 = v102;
                uint64_t v51 = [(smbMount *)self serverName];
                uint64_t v52 = [(smbMount *)self shareName];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v29;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v50;
                *(_WORD *)&buf[14] = 2112;
                *(void *)&buf[16] = v51;
                *(_WORD *)&buf[24] = 2112;
                *(void *)&buf[26] = v52;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: sendSessionSetup error: %u, ntstatus: 0x%x on server: %@, share: %@ \n", buf, 0x22u);

                id v9 = v82;
              }
            }
            else
            {
              id v33 = [(smbMount *)self shareName];
              unsigned int v34 = +[smb_subr sendTreeConnect:v6 ShareName:v33 Param:&v98];

              if (v34)
              {
                id v35 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v83 = v9;
                  int v55 = v98;
                  uint64_t v56 = [(smbMount *)self serverName];
                  uint64_t v57 = [(smbMount *)self shareName];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)&uint8_t buf[4] = v34;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v55;
                  *(_WORD *)&buf[14] = 2112;
                  *(void *)&buf[16] = v56;
                  *(_WORD *)&buf[24] = 2112;
                  *(void *)&buf[26] = v57;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: sendTreeConnect error: %u, ntstatus: 0x%x on server: %@, share: %@ \n", buf, 0x22u);

                  id v9 = v83;
                }
              }
              else
              {
                unsigned int v38 = +[smb_subr sendQueryShare:v6 ShareID:HIDWORD(v100) Model:v7 FSName:v9 Param:&v92];
                if (v38)
                {
                  id v39 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v80 = v9;
                    int v40 = v92;
                    id v41 = [(smbMount *)self serverName];
                    id v42 = [(smbMount *)self shareName];
                    *(_DWORD *)buf = 67109890;
                    *(_DWORD *)&uint8_t buf[4] = v38;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v40;
                    *(_WORD *)&buf[14] = 2112;
                    *(void *)&buf[16] = v41;
                    *(_WORD *)&buf[24] = 2112;
                    *(void *)&buf[26] = v42;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: sendQueryShare error: %u, ntstatus: 0x%x on server: %@, share: %@ \n", buf, 0x22u);

                    id v9 = v80;
                  }
                }
                else
                {
                  unsigned int v46 = +[smb_subr queryShareRootSync:v6 ShareID:self->_shareID FAttrs:v116];
                  if (v46)
                  {
                    id v47 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    {
                      id v48 = [(smbMount *)self serverName];
                      uint64_t v49 = [(smbMount *)self shareName];
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)&uint8_t buf[4] = v46;
                      *(_WORD *)&buf[8] = 2112;
                      *(void *)&buf[10] = v48;
                      *(_WORD *)&buf[18] = 2112;
                      *(void *)&buf[20] = v49;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: queryShareRoot error: %d on server: %@, share: %@ \n", buf, 0x1Cu);
                    }
                  }
                  else
                  {
                    self->serverSockAddrLen = 128;
                    unsigned int v53 = objc_msgSend(v6, "getPeerAddress:withLength:", &self->serverSockAddr);
                    if (!v53)
                    {
                      [(smbMount *)self setPd:v6];
                      char v19 = 1;
                      [(smbMount *)self setServerConnected:1];
                      char v84 = 0;
                      goto LABEL_28;
                    }
                    id v54 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    {
                      char v58 = [(smbMount *)self serverName];
                      BOOL v59 = [(smbMount *)self shareName];
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)&uint8_t buf[4] = v53;
                      *(_WORD *)&buf[8] = 2112;
                      *(void *)&buf[10] = v58;
                      *(_WORD *)&buf[18] = 2112;
                      *(void *)&buf[20] = v59;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "reconnectSession: getPeerAddress error: %d on server: %@, share: %@ \n", buf, 0x1Cu);
                    }
                  }
                }

                +[smb_subr sendTreeDisonnect:v6 ShareID:HIDWORD(v100) Param:&v98];
              }
              +[smb_subr sendLogoff:v6 Param:&v101];
            }
            [v6 disconnect];
          }
          LODWORD(v101) = 1;
          id v28 = [(smbMount *)self userName];
          unsigned int v29 = +[smb_subr sendSessionSetup:v6 User:v28 Password:0 Realm:0 Param:&v101];
LABEL_47:

          goto LABEL_48;
        }
        unint64_t v16 = (void *)qword_1000914E8;
        id v17 = [(smbMount *)self mountURL];
        id v91 = 0;
        BOOL v85 = [v16 getPasswordForIdentifier:v17 error:&v91];
        id v86 = v91;

        if (v85) {
          goto LABEL_27;
        }
        id v61 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(smbMount *)self serverName];
          objc_claimAutoreleasedReturnValue();
          [(smbMount *)self shareName];
          objc_claimAutoreleasedReturnValue();
          sub_100056B0C();
        }
      }
      else
      {
        id v11 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(smbMount *)self serverName];
          objc_claimAutoreleasedReturnValue();
          [(smbMount *)self shareName];
          objc_claimAutoreleasedReturnValue();
          sub_1000568DC();
        }
        id v86 = 0;
      }
    }
    else
    {
      id v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [(smbMount *)self serverName];
        objc_claimAutoreleasedReturnValue();
        [(smbMount *)self shareName];
        objc_claimAutoreleasedReturnValue();
        sub_10005688C();
      }
      id v86 = 0;
      id v9 = 0;
      id v7 = 0;
    }

    goto LABEL_19;
  }
  if (v5)
  {
    [(smbMount *)self connState];
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_1000569CC();
  }
  id v6 = &_os_log_default;
LABEL_72:

  _Block_object_dispose(&v106, 8);
}

- (void)flushAndReconnect
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_100056E4C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = [(smbMount *)self connQueue];
  dispatch_resume(v11);

  unsigned int v12 = [(smbMount *)self connQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100029370;
  block[3] = &unk_100088838;
  void block[4] = self;
  dispatch_barrier_async(v12, block);
}

- (void)flushAndDisconnect
{
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10000C880;
  void v34[4] = sub_10000C890;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10000C880;
  void v32[4] = sub_10000C890;
  id v33 = 0;
  __rqtp.__darwin_time_t tv_sec = 0;
  __rqtp.tv_nsec = 0;
  dispatch_group_t v3 = dispatch_group_create();
  id v4 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100056F9C();
  }

  if ([(smbMount *)self serverConnected])
  {
    int v5 = 10000;
    long long v24 = xmmword_10006C430;
    while (1)
    {
      unint64_t v6 = atomic_load(&self->_pendingRequests);
      if (!v6) {
        break;
      }
      timespec __rqtp = (timespec)xmmword_10006C430;
      nanosleep(&__rqtp, 0);
      if (!--v5)
      {
        id v7 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          int v21 = [(smbMount *)self serverName];
          __darwin_time_t v22 = [(smbMount *)self shareName];
          unsigned int v23 = [(smbMount *)self connState];
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v23;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v6;
          *(_WORD *)&buf[38] = 1024;
          int v38 = 10000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "flushAndDisconnect: server: %@ share:%@ state:%d pending: %llu time out: %d Timed out waiting for pending requests \n", buf, 0x2Cu);
        }
        break;
      }
    }
  }
  else
  {
    nodeTableSyncQueue = self->_nodeTableSyncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1000299D8;
    block[3] = &unk_100089CC8;
    void block[4] = self;
    void block[5] = v34;
    block[6] = v32;
    dispatch_sync(nodeTableSyncQueue, block);
  }
  uint64_t v9 = self->_nodeTableSyncQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100029BC0;
  void v26[3] = &unk_1000895D0;
  id v28 = v34;
  v26[4] = self;
  unsigned int v29 = v32;
  uint64_t v10 = v3;
  id v27 = v10;
  dispatch_sync(v9, v26);
  if ([(smbMount *)self serverConnected])
  {
    memset(v36, 0, 24);
    id v11 = [(smbMount *)self pd];
    +[smb_subr sendTreeDisonnect:v11 ShareID:[(smbMount *)self shareID] Param:v36];

    memset(buf, 0, sizeof(buf));
    unsigned int v12 = [(smbMount *)self pd];
    +[smb_subr sendLogoff:v12 Param:buf];

    id v13 = [(smbMount *)self pd];
    [v13 disconnect];

    [(smbMount *)self setServerConnected:0];
  }
  -[smbMount setConnState:](self, "setConnState:", 7, v24);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  connectionSyncQueue = self->_connectionSyncQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  void v25[2] = sub_100029E64;
  v25[3] = &unk_100089BD8;
  v25[4] = self;
  v25[5] = buf;
  dispatch_sync(connectionSyncQueue, v25);
  BOOL v15 = 0;
  if ((*(unsigned char *)(*(void *)&buf[8] + 24) & 2) != 0)
  {
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(smbMount *)self serverName];
      objc_claimAutoreleasedReturnValue();
      [(smbMount *)self shareName];
      objc_claimAutoreleasedReturnValue();
      sub_100056F4C();
    }

    id v17 = (void *)qword_1000914E8;
    int v18 = [(smbMount *)self mountURL];
    BOOL v15 = [v17 ejectVolumeForURL:v18 share:self->_shareName how:13];

    if (v15)
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [(smbMount *)self serverName];
        objc_claimAutoreleasedReturnValue();
        [(smbMount *)self shareName];
        objc_claimAutoreleasedReturnValue();
        sub_100056ED8();
      }
    }
  }
  id v20 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [(smbMount *)self serverName];
    objc_claimAutoreleasedReturnValue();
    [(smbMount *)self shareName];
    objc_claimAutoreleasedReturnValue();
    sub_100056E88();
  }

  [(smbMount *)self resumeIdleTimer];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

- (void)reconnectCancelWait
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_100056FEC(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [(smbMount *)self setConnState:6];
  id v11 = [(smbMount *)self connQueue];
  dispatch_resume(v11);

  unsigned int v12 = [(smbMount *)self connQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100029F64;
  block[3] = &unk_100088838;
  void block[4] = self;
  dispatch_barrier_async(v12, block);
}

- (void)flushEIOCancelWait
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_100057028(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [(smbMount *)self setConnState:6];
  id v11 = [(smbMount *)self connQueue];
  dispatch_resume(v11);

  unsigned int v12 = [(smbMount *)self connQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10002A038;
  block[3] = &unk_100088838;
  void block[4] = self;
  dispatch_barrier_async(v12, block);
}

- (void)renameOverExistingDir:(id)a3 FromName:(id)a4 toDir:(id)a5 NewName:(id)a6 ToFile:(id)a7 CompletionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002A218;
  v35[3] = &unk_100089D40;
  id v36 = v16;
  id v37 = v18;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002A2F0;
  void v26[3] = &unk_100089DB8;
  id v27 = v36;
  id v28 = v37;
  unsigned int v29 = self;
  id v30 = v14;
  BOOL v34 = v16 == v14;
  id v31 = v15;
  id v32 = v17;
  id v33 = v19;
  id v20 = v19;
  id v21 = v17;
  id v22 = v15;
  id v23 = v14;
  id v24 = v37;
  id v25 = v36;
  [(smbMount *)self submitRequestBlockOnce:v35 continuationBlock:v26];
}

- (void)renameOverExistingFile:(id)a3 FromName:(id)a4 toDir:(id)a5 NewName:(id)a6 ToFile:(id)a7 CompletionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  int v19 = *((_DWORD *)[v17 getSmbFattr] + 30);
  id v20 = [v17 makeSillyDeleteName];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10002A850;
  void v40[3] = &unk_100089DE0;
  id v41 = v15;
  id v42 = v17;
  id v43 = v20;
  int v44 = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002A940;
  v29[3] = &unk_100089E58;
  id v30 = v41;
  id v31 = v42;
  id v32 = self;
  id v33 = v13;
  BOOL v39 = v15 == v13;
  id v34 = v14;
  id v35 = v16;
  int v38 = v19;
  id v36 = v43;
  id v37 = v18;
  id v21 = v43;
  id v22 = v16;
  id v23 = v14;
  id v24 = v13;
  id v25 = v18;
  id v26 = v42;
  id v27 = v41;
  [(smbMount *)self submitRequestBlockOnce:v40 continuationBlock:v29];
}

- (int)deliverSearchResults:(id)a3
{
  id v3 = a3;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_1000577E0(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  unsigned int v12 = [v3 searchRows];
  id v13 = [v3 parseSearchResults:v12];
  id v14 = v13;
  if (v13)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v46 objects:v64 count:16];
    if (v15)
    {
      id v16 = v15;
      id v33 = v12;
      id v17 = 0;
      id v18 = 0;
      uint64_t v19 = *(void *)v47;
      do
      {
        id v20 = 0;
        id v21 = v17;
        id v22 = v18;
        do
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v14);
          }
          id v17 = *(id *)(*((void *)&v46 + 1) + 8 * (void)v20);

          if (v17)
          {
            [v17 liAttr];
          }
          else
          {
            uint64_t v45 = 0;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v34 = 0u;
          }
          long long v58 = v42;
          long long v59 = v43;
          long long v60 = v44;
          uint64_t v61 = v45;
          long long v54 = v38;
          long long v55 = v39;
          long long v56 = v40;
          long long v57 = v41;
          long long v50 = v34;
          long long v51 = v35;
          long long v52 = v36;
          long long v53 = v37;
          id v18 = objc_msgSend(v17, "path", v33);

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_10005779C(v62, (uint64_t)v18, &v63);
          }
          id v23 = [v3 handler];
          [v23 addSearchResult:v18 attributes:&v50 attributeSize:184 xAttrs:&__NSDictionary0__struct];

          id v20 = (char *)v20 + 1;
          id v21 = v17;
          id v22 = v18;
        }
        while (v16 != v20);
        id v16 = [v14 countByEnumeratingWithState:&v46 objects:v64 count:16];
      }
      while (v16);

      unsigned int v12 = v33;
    }
  }
  else
  {
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v24) {
      sub_100057760(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

  return 0;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 248, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)opsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOpsQueue:(id)a3
{
}

- (OS_dispatch_queue)connQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)setConnQueue:(id)a3
{
}

- (OS_dispatch_queue)mgmtQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMgmtQueue:(id)a3
{
}

- (OS_dispatch_queue)connectionSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280, 1);
}

- (void)setConnectionSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)nodeTableSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (void)setNodeTableSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)readwriteSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 296, 1);
}

- (void)setReadwriteSyncQueue:(id)a3
{
}

- (OS_dispatch_group)opsSyncGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 304, 1);
}

- (void)setOpsSyncGroup:(id)a3
{
}

- (OS_dispatch_group)namespaceChangingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 312, 1);
}

- (void)setNamespaceChangingGroup:(id)a3
{
}

- (OS_dispatch_source)idleTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 320, 1);
}

- (void)setIdleTimer:(id)a3
{
}

- (int)idleTimerRunning
{
  return self->_idleTimerRunning;
}

- (void)setIdleTimerRunning:(int)a3
{
  self->_idleTimerRunning = a3;
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)shareName
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (NSString)userDomain
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (BOOL)isGuestLogin
{
  return self->_isGuestLogin;
}

- (NSURL)mountURL
{
  return (NSURL *)objc_getProperty(self, a2, 360, 1);
}

- (int)connState
{
  return self->_connState;
}

- (void)setConnState:(int)a3
{
  self->_connState = a3;
}

- (int)shutdownReason
{
  return self->_shutdownReason;
}

- (void)setShutdownReason:(int)a3
{
  self->_shutdownReason = a3;
}

- (timespec)lastRequestTime
{
  objc_copyStruct(v4, &self->_lastRequestTime, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.__darwin_time_t tv_sec = v2;
  return result;
}

- (void)setLastRequestTime:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_lastRequestTime, &v3, 16, 1, 0);
}

- (unint64_t)openFileCounter
{
  return self->_openFileCounter;
}

- (void)setOpenFileCounter:(unint64_t)a3
{
  self->_openFileCounter = a3;
}

- (unint64_t)pendingChangeNotifyCount
{
  return self->_pendingChangeNotifyCount;
}

- (void)setPendingChangeNotifyCount:(unint64_t)a3
{
  self->_pendingChangeNotifyCount = a3;
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 384, 1);
}

- (void)setPd:(id)a3
{
}

- (BOOL)serverConnected
{
  return self->_serverConnected;
}

- (void)setServerConnected:(BOOL)a3
{
  self->_serverConnected = a3;
}

- ($153B227C17007545984278727FAEAED4)serverGuid
{
  objc_copyStruct(v4, &self->_serverGuid, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  *(void *)&result.var1[2] = v3;
  *(void *)result.var0 = v2;
  return result;
}

- (void)setServerGuid:(id)a3
{
  $153B227C17007545984278727FAEAED4 v3 = a3;
  objc_copyStruct(&self->_serverGuid, &v3, 16, 1, 0);
}

- (unsigned)serverSecMode
{
  return self->_serverSecMode;
}

- (void)setServerSecMode:(unsigned int)a3
{
  self->_serverSecMode = a3;
}

- (unsigned)serverDialect
{
  return self->_serverDialect;
}

- (void)setServerDialect:(unsigned int)a3
{
  self->_serverDialect = a3;
}

- (unsigned)serverNegContextCnt
{
  return self->_serverNegContextCnt;
}

- (void)setServerNegContextCnt:(unsigned int)a3
{
  self->_serverNegContextCnt = a3;
}

- (unsigned)serverCaps
{
  return self->_serverCaps;
}

- (void)setServerCaps:(unsigned int)a3
{
  self->_serverCaps = a3;
}

- (unsigned)serverMaxTx
{
  return self->_serverMaxTx;
}

- (void)setServerMaxTx:(unsigned int)a3
{
  self->_serverMaxTx = a3;
}

- (unsigned)serverMaxRd
{
  return self->_serverMaxRd;
}

- (void)setServerMaxRd:(unsigned int)a3
{
  self->_serverMaxRd = a3;
}

- (unsigned)serverMaxWr
{
  return self->_serverMaxWr;
}

- (void)setServerMaxWr:(unsigned int)a3
{
  self->_serverMaxWr = a3;
}

- (unsigned)shareID
{
  return self->_shareID;
}

- (void)setShareID:(unsigned int)a3
{
  self->_shareID = a3;
}

- (unsigned)shareType
{
  return self->_shareType;
}

- (void)setShareType:(unsigned int)a3
{
  self->_shareType = a3;
}

- (unsigned)shareFlags
{
  return self->_shareFlags;
}

- (void)setShareFlags:(unsigned int)a3
{
  self->_shareFlags = a3;
}

- (unsigned)shareCaps
{
  return self->_shareCaps;
}

- (void)setShareCaps:(unsigned int)a3
{
  self->_shareCaps = a3;
}

- (unsigned)shareMaxAccess
{
  return self->_shareMaxAccess;
}

- (void)setShareMaxAccess:(unsigned int)a3
{
  self->_shareMaxAccess = a3;
}

- (unsigned)sm_flags
{
  return self->_sm_flags;
}

- (void)setSm_flags:(unsigned int)a3
{
  self->_sm_flags = a3;
}

- (smb_query_share)shareInfo
{
  objc_copyStruct(retstr, &self->_shareInfo, 88, 1, 0);
  return result;
}

- (void)setShareInfo:(smb_query_share *)a3
{
}

- (NSMutableString)modelName
{
  return (NSMutableString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSMutableString)fsName
{
  return (NSMutableString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setFsName:(id)a3
{
}

- (int)share_fstype
{
  return self->_share_fstype;
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_sessionFlags = a3;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_unint64_t sessionID = a3;
}

- (smbNode)rootNode
{
  return (smbNode *)objc_getProperty(self, a2, 416, 1);
}

- (void)setRootNode:(id)a3
{
}

- (NSMutableDictionary)handleTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setHandleTable:(id)a3
{
}

- (NSMutableDictionary)nameTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setNameTable:(id)a3
{
}

- (unint64_t)nextFileID
{
  return self->_nextFileID;
}

- (void)setNextFileID:(unint64_t)a3
{
  self->_nextFileID = a3;
}

- (NSMutableDictionary)searchObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSearchObjects:(id)a3
{
}

- (NSLock)searchLock
{
  return (NSLock *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSearchLock:(id)a3
{
}

- (unint64_t)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(unint64_t)a3
{
  self->_pendingRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchLock, 0);
  objc_storeStrong((id *)&self->_searchObjects, 0);
  objc_storeStrong((id *)&self->_nameTable, 0);
  objc_storeStrong((id *)&self->_handleTable, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_fsName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_pd, 0);
  objc_storeStrong((id *)&self->_mountURL, 0);
  objc_storeStrong((id *)&self->_userDomain, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_shareName, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_namespaceChangingGroup, 0);
  objc_storeStrong((id *)&self->_opsSyncGroup, 0);
  objc_storeStrong((id *)&self->_readwriteSyncQueue, 0);
  objc_storeStrong((id *)&self->_nodeTableSyncQueue, 0);
  objc_storeStrong((id *)&self->_connectionSyncQueue, 0);
  objc_storeStrong((id *)&self->_mgmtQueue, 0);
  objc_storeStrong((id *)&self->_connQueue, 0);
  objc_storeStrong((id *)&self->_opsQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end