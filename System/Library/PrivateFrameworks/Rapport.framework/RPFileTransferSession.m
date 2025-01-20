@interface RPFileTransferSession
+ (BOOL)supportsSecureCoding;
- (BOOL)_activateAndReturnError:(id *)a3;
- (BOOL)_activateSourceAndReturnError:(id *)a3;
- (BOOL)_activateTargetAndReturnError:(id *)a3;
- (BOOL)_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:(id)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)_prepareItem:(id)a3 error:(id *)a4;
- (BOOL)_readFD:(int)a3 buffer:(char *)a4 size:(unint64_t)a5 error:(id *)a6;
- (BOOL)_smallFilesReceiveTaskFileItem:(id)a3 error:(id *)a4;
- (BOOL)_truncateFD:(int)a3 size:(int64_t)a4 error:(id *)a5;
- (BOOL)_writeFD:(int)a3 buffer:(const char *)a4 size:(unint64_t)a5 error:(id *)a6;
- (BOOL)isResumable;
- (BOOL)prepareTemplateAndReturnError:(id *)a3;
- (NSData)peerPublicKey;
- (NSData)selfPublicKey;
- (NSData)selfSecretKey;
- (NSString)label;
- (NSString)serviceType;
- (NSString)targetID;
- (NSURL)temporaryDirectoryURL;
- (OS_dispatch_queue)dispatchQueue;
- (RPFileTransferProgress)progressCurrent;
- (RPFileTransferSession)init;
- (RPFileTransferSession)initWithCoder:(id)a3;
- (double)progressHandlerTimeInterval;
- (id)_compressData:(id)a3 error:(id *)a4;
- (id)_decompressAndDecodeData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5;
- (id)_decompressData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5;
- (id)_encodeAndCompressObject:(id)a3 originalSize:(unint64_t *)a4 error:(id *)a5;
- (id)_ioQueueDequeue;
- (id)_largeFileSendTaskCreate;
- (id)_modTimeForFileWithPath:(const char *)a3 error:(id *)a4;
- (id)_readFD:(int)a3 size:(unint64_t)a4 error:(id *)a5;
- (id)_readPath:(const char *)a3 size:(unint64_t)a4 error:(id *)a5;
- (id)_smallFilesSendTaskCreate;
- (id)_smallFilesSendTaskReadItem:(id)a3 error:(id *)a4;
- (id)completionHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)flowControlChangedHandler;
- (id)progressHandler;
- (id)receivedItemHandler;
- (id)receivedItemsHandler;
- (id)resumeState;
- (id)resumeStateDict;
- (int)_openReadFileItem:(id)a3 error:(id *)a4;
- (int)_openReadPath:(const char *)a3 error:(id *)a4;
- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 error:(id *)a5;
- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6;
- (int)_openWritePath:(id)a3 size:(int64_t)a4 error:(id *)a5;
- (int)_openWritePath:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6;
- (int)flowControlState;
- (unint64_t)debugFlags;
- (unint64_t)largeFileBufferBytes;
- (unint64_t)maxLargeFileTasks;
- (unint64_t)maxSmallFileTasks;
- (unsigned)flags;
- (void)_completeItem:(id)a3 error:(id)a4;
- (void)_completeItemDirect:(id)a3 error:(id)a4;
- (void)_controlCnxRetryIfNeeded;
- (void)_controlCnxStartIfNeeded;
- (void)_debugSetup;
- (void)_debugUpdate;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_handleDevicesCoalesced;
- (void)_handleIncomingConnectionEnded:(id)a3;
- (void)_handleIncomingConnectionStarted:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_ioQueueEnqueue:(id)a3;
- (void)_largeFileReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_largeFileReceiveTaskInvalidate:(id)a3;
- (void)_largeFileReceiveTaskRespond:(id)a3 error:(id)a4 complete:(BOOL)a5 responseHandler:(id)a6;
- (void)_largeFileReceiveTaskRun:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 responseHandler:(id)a6;
- (void)_largeFileSendTaskEnd:(id)a3 error:(id)a4;
- (void)_largeFileSendTaskFailed:(id)a3 error:(id)a4;
- (void)_largeFileSendTaskNext:(id)a3 xid:(unsigned int)a4;
- (void)_largeFileSendTaskResponse:(id)a3 error:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6;
- (void)_largeFileSendTaskSend:(id)a3 data:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6;
- (void)_largeFileSendTaskStart:(id)a3;
- (void)_metricAddFileSize:(int64_t)a3;
- (void)_prefsChanged;
- (void)_processFinish;
- (void)_processReceivedItem:(id)a3 responseHandler:(id)a4;
- (void)_processReceivedItems:(id)a3 responseHandler:(id)a4;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)_receivedPeerUpdate:(id)a3;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_reportCompletion:(id)a3;
- (void)_reportDataTransferred;
- (void)_reportProgressControlState;
- (void)_reportProgressType:(int)a3;
- (void)_requestResumeStateFromReceiver;
- (void)_resumeStateReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_scheduleItems;
- (void)_smallFilesReceiveRequest:(id)a3 responseHandler:(id)a4;
- (void)_smallFilesReceiveTaskComplete:(id)a3 error:(id)a4 responseHandler:(id)a5;
- (void)_smallFilesReceiveTaskRun:(id)a3 responseHandler:(id)a4;
- (void)_smallFilesSendTaskEnd:(id)a3 error:(id)a4;
- (void)_smallFilesSendTaskRun:(id)a3;
- (void)_startProgressReportTimer;
- (void)_stopProgressReportTimer;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_updateLargeFilesTaskResumeState:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 error:(id)a6 complete:(BOOL)a7;
- (void)_updateSmallFilesTaskResumeState:(id)a3 error:(id)a4;
- (void)_updateWiFi;
- (void)activate;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)dealloc;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finish;
- (void)invalidate;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setCompletionHandler:(id)a3;
- (void)setDebugFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowControlChangedHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLargeFileBufferBytes:(unint64_t)a3;
- (void)setMaxLargeFileTasks:(unint64_t)a3;
- (void)setMaxSmallFileTasks:(unint64_t)a3;
- (void)setPeerPublicKey:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressHandlerTimeInterval:(double)a3;
- (void)setReceivedItemHandler:(id)a3;
- (void)setReceivedItemsHandler:(id)a3;
- (void)setSelfPublicKey:(id)a3;
- (void)setSelfSecretKey:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
@end

@implementation RPFileTransferSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPFileTransferSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPFileTransferSession;
  v2 = [(RPFileTransferSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_debugNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v3->_resumable = 0;
    resumeState = v3->_resumeState;
    v3->_resumeState = 0;

    v3->_resumeStateFlushInterval = 1.0;
    v3->_flags = 0;
    v3->_maxSmallFileTasks = 3;
    [(RPFileTransferSession *)v3 setProgressHandlerTimeInterval:0.0];
    v5 = v3;
  }

  return v3;
}

- (RPFileTransferSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RPFileTransferSession;
  v5 = [(RPFileTransferSession *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v6->_resumable = 0;
    resumeState = v6->_resumeState;
    v6->_resumeState = 0;

    v6->_resumeStateFlushInterval = 1.0;
    uint64_t v19 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_flags = v19;
    }
    id v8 = v4;
    if ([v8 containsValueForKey:@"lFlBufB"]) {
      v6->_largeFileBufferBytes = [v8 decodeInt64ForKey:@"lFlBufB"];
    }

    id v9 = v8;
    if ([v9 containsValueForKey:@"lFlMxTs"]) {
      v6->_maxLargeFileTasks = [v9 decodeInt64ForKey:@"lFlMxTs"];
    }

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    if ([v13 containsValueForKey:@"sFlMxTs"]) {
      v6->_maxSmallFileTasks = [v13 decodeInt64ForKey:@"sFlMxTs"];
    }

    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t flags = self->_flags;
  id v14 = v4;
  if (flags)
  {
    [v4 encodeInt64:flags forKey:@"flags"];
    id v4 = v14;
  }
  unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
  if (largeFileBufferBytes)
  {
    [v14 encodeInt64:largeFileBufferBytes forKey:@"lFlBufB"];
    id v4 = v14;
  }
  unint64_t maxLargeFileTasks = self->_maxLargeFileTasks;
  if (maxLargeFileTasks)
  {
    [v14 encodeInt64:maxLargeFileTasks forKey:@"lFlMxTs"];
    id v4 = v14;
  }
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    [v14 encodeObject:peerPublicKey forKey:@"peerPK"];
    id v4 = v14;
  }
  selfPublicKey = self->_selfPublicKey;
  if (selfPublicKey)
  {
    [v14 encodeObject:selfPublicKey forKey:@"selfPK"];
    id v4 = v14;
  }
  selfSecretKey = self->_selfSecretKey;
  if (selfSecretKey)
  {
    [v14 encodeObject:selfSecretKey forKey:@"selfSK"];
    id v4 = v14;
  }
  unint64_t maxSmallFileTasks = self->_maxSmallFileTasks;
  if (maxSmallFileTasks)
  {
    [v14 encodeInt64:maxSmallFileTasks forKey:@"sFlMxTs"];
    id v4 = v14;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v14 encodeObject:serviceType forKey:@"srvTy"];
    id v4 = v14;
  }
  targetID = self->_targetID;
  if (targetID)
  {
    [v14 encodeObject:targetID forKey:@"targetID"];
    id v4 = v14;
  }
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v5 = self->_progressTimer;
    self->_progressTimer = 0;
  }
  resumeState = self->_resumeState;
  self->_resumeState = 0;

  v7.receiver = self;
  v7.super_class = (Class)RPFileTransferSession;
  [(RPFileTransferSession *)&v7 dealloc];
}

- (id)description
{
  return [(RPFileTransferSession *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  targetID = self->_targetID;
  if (targetID)
  {
    v20 = v4;
    v17 = targetID;
    NSAppendPrintF();
    id v7 = v20;

    v5 = v7;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    id v8 = v5;

    v5 = v8;
  }
  label = self->_label;
  if (label)
  {
    objc_super v18 = label;
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }
  if (self->_largeFileBufferBytes)
  {
    NSAppendPrintF();
    id v11 = v5;

    v5 = v11;
  }
  if (self->_maxLargeFileTasks)
  {
    NSAppendPrintF();
    id v12 = v5;

    v5 = v12;
  }
  if (self->_maxSmallFileTasks)
  {
    NSAppendPrintF();
    id v13 = v5;

    v5 = v13;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    uint64_t v19 = serviceType;
    NSAppendPrintF();
    id v15 = v5;

    v5 = v15;
  }
  return v5;
}

- (void)setDebugFlags:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__RPFileTransferSession_setDebugFlags___block_invoke;
  v4[3] = &unk_1E605BCA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __39__RPFileTransferSession_setDebugFlags___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 576) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _debugUpdate];
}

- (void)setFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__RPFileTransferSession_setFlags___block_invoke;
  v3[3] = &unk_1E605CA20;
  unsigned int v4 = a3;
  v3[4] = self;
  [(RPFileTransferSession *)self _updateIfNeededWithBlock:v3];
}

BOOL __34__RPFileTransferSession_setFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 556);
  if (v1 != v3)
  {
    if (*(unsigned char *)(v2 + 8) && (int v5 = **(_DWORD **)(v2 + 152), v5 <= 30))
    {
      if (v5 != -1 || (int v8 = _LogCategory_Initialize(), v6 = *(_DWORD *)(a1 + 40), v2 = *(void *)(a1 + 32), v8))
      {
        LogPrintF();
        int v6 = *(_DWORD *)(a1 + 40);
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 40);
    }
    *(_DWORD *)(v2 + 556) = v6;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setLargeFileBufferBytes:(unint64_t)a3
{
  if (self->_largeFileBufferBytes != a3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  self->_unint64_t largeFileBufferBytes = a3;
}

- (void)setMaxLargeFileTasks:(unint64_t)a3
{
  if (self->_maxLargeFileTasks != a3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  self->_unint64_t maxLargeFileTasks = a3;
}

- (void)setMaxSmallFileTasks:(unint64_t)a3
{
  if (self->_maxSmallFileTasks != a3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  self->_unint64_t maxSmallFileTasks = a3;
}

- (BOOL)isResumable
{
  return ([(RPFileTransferSession *)self flags] >> 9) & 1;
}

- (id)resumeState
{
  return self->_resumeState;
}

- (id)resumeStateDict
{
  resumeState = self->_resumeState;
  if (resumeState)
  {
    resumeState = [resumeState dictionaryRepresentation];
  }
  return resumeState;
}

- (BOOL)prepareTemplateAndReturnError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(NSData *)self->_selfPublicKey length] || ![(NSData *)self->_selfSecretKey length])
  {
    cced25519_make_key_pair_compat();
    id v4 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v15 length:32];
    selfPublicKey = self->_selfPublicKey;
    self->_selfPublicKey = v4;

    int v6 = (NSData *)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:__s length:32];
    selfSecretKey = self->_selfSecretKey;
    self->_selfSecretKey = v6;

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
  }
  if (self->_flags)
  {
    if (!self->_targetID)
    {
      NSRandomData();
      id v9 = objc_claimAutoreleasedReturnValue();
      [v9 bytes];
      [v9 length];
      [v9 length];
      NSPrintF();
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      targetID = self->_targetID;
      self->_targetID = v10;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_12;
    }
  }
  else
  {
    int v8 = self->_ucat->var0;
    if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize())) {
LABEL_12:
    }
      LogPrintF();
  }
  return 1;
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__RPFileTransferSession_activate__block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);
}

void __33__RPFileTransferSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      uint64_t v13 = *(void *)(v2 + 680);
      uint64_t v14 = *(void *)(v2 + 632);
      uint64_t v12 = *(void *)(v2 + 688);
      uint64_t v9 = *(unsigned int *)(v2 + 556);
      id v11 = &unk_1B3971438;
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  id v15 = 0;
  objc_msgSend((id)v2, "_activateAndReturnError:", &v15, v9, v11, v12, v13, v14);
  id v5 = v15;
  int v6 = *(_DWORD ***)(a1 + 32);
  if (v5)
  {
    int v7 = *v6[19];
    if (v7 <= 90 && (v7 != -1 || (int v8 = _LogCategory_Initialize(), v6 = *(_DWORD ***)(a1 + 32), v8)))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportCompletion:", v5, v5);
    }
    else
    {
      objc_msgSend(v6, "_reportCompletion:", v5, v10);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _startProgressReportTimer];
  }
}

- (BOOL)_activateAndReturnError:(id *)a3
{
  id v5 = self->_targetID;
  if (v5)
  {
    [(RPFileTransferSession *)self _prefsChanged];
    [(RPFileTransferSession *)self _debugSetup];
    int v6 = self->_selfPublicKey;
    if (!self->_selfPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v31 = 0;
      }
      goto LABEL_22;
    }
    int v7 = self->_selfSecretKey;
    if (!self->_selfSecretKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v31 = 0;
      }
      goto LABEL_21;
    }
    int v8 = objc_alloc_init(RPIdentity);
    [(RPIdentity *)v8 setEdPKData:v6];
    [(RPIdentity *)v8 setEdSKData:v7];
    objc_storeStrong((id *)&self->_selfIdentity, v8);
    uint64_t v9 = self->_peerPublicKey;
    if (!self->_peerPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        BOOL v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v31 = 0;
      }
      goto LABEL_20;
    }
    v33 = v6;
    v34 = v5;
    uint64_t v10 = objc_alloc_init(RPIdentity);
    [(RPIdentity *)v10 setEdPKData:v9];
    objc_storeStrong((id *)&self->_peerIdentity, v10);
    id v11 = self->_receiveFileParentPath;
    if (!v11)
    {
      uint64_t v12 = self->_temporaryDirectoryURL;
      if (!v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v35 = 0;
        uint64_t v14 = [v13 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v35];
        id v15 = v35;

        if (!v14)
        {
          if (a3)
          {
            RPNestedErrorF();
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v11 = 0;
          goto LABEL_40;
        }
        uint64_t v12 = [v14 URLByAppendingPathComponent:@"com.apple.rapport/FileTransfer" isDirectory:1];
      }
      uint64_t v16 = [(NSString *)self->_targetID stringByAppendingString:@".rpftd"];
      v17 = [(NSURL *)v12 URLByAppendingPathComponent:v16 isDirectory:1];

      id v11 = [v17 path];
      objc_storeStrong((id *)&self->_receiveFileParentPath, v11);
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    ioQueues = self->_ioQueues;
    self->_ioQueues = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
    self->_smallFilesReceiveTasks = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    smallFilesSendTasks = self->_smallFilesSendTasks;
    self->_smallFilesSendTasks = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    largeFileSendTasks = self->_largeFileSendTasks;
    self->_largeFileSendTasks = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    largeFileReceiveTasks = self->_largeFileReceiveTasks;
    self->_largeFileReceiveTasks = v27;

    if (self->_flags)
    {
      if (![(RPFileTransferSession *)self _activateTargetAndReturnError:a3])
      {
LABEL_40:
        BOOL v31 = 0;
        goto LABEL_19;
      }
    }
    else if (![(RPFileTransferSession *)self _activateSourceAndReturnError:a3])
    {
      goto LABEL_40;
    }
    self->_metricTicksActivate = mach_absolute_time();
    v29 = objc_alloc_init(RPFileTransferProgress);
    progressCurrent = self->_progressCurrent;
    self->_progressCurrent = v29;

    BOOL v31 = 1;
    [(RPFileTransferSession *)self _reportProgressType:1];
LABEL_19:

    int v6 = v33;
    id v5 = v34;
LABEL_20:

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
  if (a3)
  {
    RPErrorF();
    BOOL v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v31 = 0;
  }
LABEL_23:

  return v31;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RPFileTransferSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPFileTransferSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 89))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 89) = 1;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[19];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), int v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        int v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return [v3 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(RPFileTransferSession *)self _stopProgressReportTimer];
  int v3 = self->_addedItems;
  addedItems = self->_addedItems;
  self->_addedItems = 0;

  if ([(NSMutableSet *)v3 count])
  {
    int v5 = RPErrorF();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int v6 = v3;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          [(RPFileTransferSession *)self _completeItemDirect:*(void *)(*((void *)&v31 + 1) + 8 * v10++) error:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }

    [(NSMutableSet *)v6 removeAllObjects];
  }
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0;

  [(CUCoalescer *)self->_bonjourCoalescer invalidate];
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = 0;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = self->_connections;
  uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18++), "invalidate", (void)v27);
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  [(NSMutableSet *)self->_connections removeAllObjects];
  [(RPConnection *)self->_controlCnx invalidate];
  controlCnx = self->_controlCnx;
  self->_controlCnx = 0;

  controlRetryTimer = self->_controlRetryTimer;
  if (controlRetryTimer)
  {
    v21 = controlRetryTimer;
    dispatch_source_cancel(v21);
    v22 = self->_controlRetryTimer;
    self->_controlRetryTimer = 0;
  }
  [(NSMutableDictionary *)self->_registeredEvents removeAllObjects];
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0;

  [(NSMutableDictionary *)self->_registeredRequests removeAllObjects];
  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0;

  [(CUTCPServer *)self->_tcpServer invalidate];
  tcpServer = self->_tcpServer;
  self->_tcpServer = 0;

  [(CUWiFiManager *)self->_wifiManager invalidate];
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;

  [(RPFileTransferSession *)self _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableDictionary *)self->_smallFilesReceiveTasks count]
    && ![(NSMutableSet *)self->_smallFilesSendTasks count]
    && ![(NSMutableDictionary *)self->_largeFileReceiveTasks count]
    && ![(NSMutableSet *)self->_largeFileSendTasks count])
  {
    int v3 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_completionHandler);
    if (v3)
    {
      int v4 = RPErrorF();
      ((void (**)(void, void *))v3)[2](v3, v4);
    }
    int debugNotifyToken = self->_debugNotifyToken;
    if (debugNotifyToken != -1)
    {
      notify_cancel(debugNotifyToken);
      self->_int debugNotifyToken = -1;
    }
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    id flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_id flowControlChangedHandler = 0;

    id progressHandler = self->_progressHandler;
    self->_id progressHandler = 0;

    id receivedItemHandler = self->_receivedItemHandler;
    self->_id receivedItemHandler = 0;

    id receivedItemsHandler = self->_receivedItemsHandler;
    self->_id receivedItemsHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_prefsChanged
{
  BOOL v3 = 0;
  if ((self->_flags & 0x100) != 0) {
    BOOL v3 = CFPrefs_GetInt64() != 0;
  }
  if (self->_prefCompress != v3)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v5 = "yes";
      if (v3) {
        int v6 = "no";
      }
      else {
        int v6 = "yes";
      }
      if (!v3) {
        int v5 = "no";
      }
      v39 = v6;
      v41 = v5;
      LogPrintF();
    }
    self->_prefCompress = v3;
  }
  unint64_t Int64 = CFPrefs_GetInt64();
  if (![(RPFileTransferSession *)self largeFileBufferBytes])
  {
    if (Int64 <= 0x989680 && Int64 != 0) {
      uint64_t v10 = Int64;
    }
    else {
      uint64_t v10 = 0x100000;
    }
    -[RPFileTransferSession setLargeFileBufferBytes:](self, "setLargeFileBufferBytes:", v10, v39, v41);
  }
  unint64_t v11 = CFPrefs_GetInt64();
  if (![(RPFileTransferSession *)self maxLargeFileTasks])
  {
    if (v11 <= 0x3E8 && v11 != 0) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 3;
    }
    -[RPFileTransferSession setMaxLargeFileTasks:](self, "setMaxLargeFileTasks:", v14, v39, v41);
  }
  uint64_t v15 = CFPrefs_GetInt64();
  if (v15 <= 1000 && v15 >= 1) {
    int64_t v18 = v15;
  }
  else {
    int64_t v18 = 3;
  }
  if ((int64_t)[(RPFileTransferSession *)self maxLargeFileTasks] > v18) {
    int64_t v18 = [(RPFileTransferSession *)self maxLargeFileTasks];
  }
  uint64_t prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
  if (v18 != prefLargeFileMaxOutstanding)
  {
    int v20 = self->_ucat->var0;
    if (v20 <= 30)
    {
      if (v20 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_52;
        }
        uint64_t prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
      }
      uint64_t v40 = prefLargeFileMaxOutstanding;
      int64_t v42 = v18;
      LogPrintF();
    }
LABEL_52:
    self->_uint64_t prefLargeFileMaxOutstanding = v18;
  }
  unint64_t v21 = CFPrefs_GetInt64();
  if (v21 <= 0x989680 && v21 != 0) {
    uint64_t v24 = v21;
  }
  else {
    uint64_t v24 = 0x100000;
  }
  uint64_t prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  if (v24 != prefSmallFilesMaxBytes)
  {
    int v26 = self->_ucat->var0;
    if (v26 <= 30)
    {
      if (v26 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_67;
        }
        uint64_t prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
      }
      uint64_t v40 = prefSmallFilesMaxBytes;
      int64_t v42 = v24;
      LogPrintF();
    }
LABEL_67:
    self->_uint64_t prefSmallFilesMaxBytes = v24;
  }
  unint64_t v27 = CFPrefs_GetInt64();
  if (![(RPFileTransferSession *)self maxSmallFileTasks])
  {
    if (v27 <= 0x3E8 && v27 != 0) {
      uint64_t v30 = v27;
    }
    else {
      uint64_t v30 = 3;
    }
    -[RPFileTransferSession setMaxSmallFileTasks:](self, "setMaxSmallFileTasks:", v30, v40, v42);
  }
  BOOL v31 = CFPrefs_GetInt64() != 0;
  if (self->_resumable != v31)
  {
    int v32 = self->_ucat->var0;
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_resumable = v31;
    if (v31) {
      int v33 = 512;
    }
    else {
      int v33 = 0;
    }
    self->_uint64_t flags = self->_flags & 0xFFFFFDFF | v33;
  }
  CFPrefs_GetDouble();
  if (v34 <= 60.0 && v34 > 0.001) {
    double v37 = v34;
  }
  else {
    double v37 = 1.0;
  }
  if (v37 != self->_resumeStateFlushInterval)
  {
    int v38 = self->_ucat->var0;
    if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_resumeStateFlushInterval = v37;
  }
}

- (void)_reportCompletion:(id)a3
{
  v55[26] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t metricLastFileCompletionTicks = self->_metricLastFileCompletionTicks;
  if (!metricLastFileCompletionTicks) {
    unint64_t metricLastFileCompletionTicks = mach_absolute_time();
  }
  unint64_t metricTicksConnectStart = self->_metricTicksConnectStart;
  if (metricTicksConnectStart) {
    BOOL v7 = metricLastFileCompletionTicks > metricTicksConnectStart;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    self->_metricTicksConnected += metricLastFileCompletionTicks - metricTicksConnectStart;
  }
  UpTicksToSecondsF();
  double v9 = v8;
  if (v8 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = (double)self->_metricTotalBytes / v8;
  }
  unint64_t v11 = UpTicksToSeconds();
  unint64_t metricUncompressedBytes = self->_metricUncompressedBytes;
  if (metricUncompressedBytes)
  {
    [(RPFileTransferProgress *)self->_progressCurrent setCompressionRate:(double)self->_metricCompressedBytes / (double)metricUncompressedBytes];
    [(RPFileTransferProgress *)self->_progressCurrent compressionRate];
    uint64_t v14 = (int)(v13 * 100.0);
  }
  else
  {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
  [(RPFileTransferProgress *)self->_progressCurrent setBytesPerSecond:v10];
  [(RPFileTransferProgress *)self->_progressCurrent setRemainingSeconds:0.0];
  [(RPFileTransferProgress *)self->_progressCurrent setCurrentFilename:0];
  [(RPFileTransferProgress *)self->_progressCurrent setError:v4];
  [(RPFileTransferProgress *)self->_progressCurrent setTransferredByteCount:self->_metricTotalBytes];
  [(RPFileTransferProgress *)self->_progressCurrent setTotalByteCount:self->_metricTotalBytes];
  [(RPFileTransferProgress *)self->_progressCurrent setTransferredFileCount:self->_metricTotalFiles];
  [(RPFileTransferProgress *)self->_progressCurrent setTotalFileCount:self->_metricTotalFiles];
  [(RPFileTransferSession *)self _reportProgressType:20];
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v34 = v14;
      id v35 = v4;
      double v32 = (double)self->_metricTotalBytes / 1000000.0;
      double v33 = v10 / 1000000.0;
      unint64_t metricTotalFiles = self->_metricTotalFiles;
LABEL_22:
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v34 = v14;
    double v32 = (double)self->_metricTotalBytes / 1000000.0;
    double v33 = v10 / 1000000.0;
    unint64_t metricTotalFiles = self->_metricTotalFiles;
    goto LABEL_22;
  }
  uint64_t v16 = (void (**)(void, void))MEMORY[0x1B3EBCC80](self->_completionHandler);
  if (v16)
  {
    id v53 = v16;
    ((void (**)(void, id))v16)[2](v16, v4);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    if ((self->_flags & 2) != 0) {
      int64_t v18 = @"d2d";
    }
    else {
      int64_t v18 = @"?";
    }
    v55[0] = v18;
    v54[0] = @"type";
    v54[1] = @"errD";
    uint64_t v19 = objc_msgSend(v4, "domain", metricTotalFiles, *(void *)&v32, *(void *)&v33, v34, v35);
    v51 = (void *)v19;
    int v20 = &stru_1F0C22DA8;
    if (v19) {
      int v20 = (__CFString *)v19;
    }
    v55[1] = v20;
    v54[2] = @"errC";
    v50 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
    v55[2] = v50;
    v54[3] = @"totB";
    v49 = [NSNumber numberWithUnsignedLongLong:10000000 * (self->_metricTotalBytes / 0x989680)];
    v55[3] = v49;
    v54[4] = @"totF";
    id v52 = v4;
    v48 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricTotalFiles / 0x64)];
    v55[4] = v48;
    v54[5] = @"totS";
    v47 = [NSNumber numberWithUnsignedLongLong:60 * (v11 / 0x3C)];
    v55[5] = v47;
    v54[6] = @"Bps";
    v46 = [NSNumber numberWithDouble:v10 / 1000.0 * 1000.0];
    v55[6] = v46;
    v54[7] = @"cnxS";
    v45 = [NSNumber numberWithDouble:v9 / 60.0 * 60.0];
    v55[7] = v45;
    v54[8] = @"dCnx";
    v44 = [NSNumber numberWithUnsignedInt:self->_metricDisconnects];
    v55[8] = v44;
    v54[9] = @"ltAWDL";
    v43 = [NSNumber numberWithUnsignedInt:self->_metricLinkTypeCountAWDL];
    v55[9] = v43;
    v54[10] = @"ltUSB";
    int64_t v42 = [NSNumber numberWithUnsignedInt:self->_metricLinkTypeCountUSB];
    v55[10] = v42;
    v54[11] = @"ltOther";
    v41 = [NSNumber numberWithUnsignedInt:self->_metricLinkTypeCountOther];
    v55[11] = v41;
    v54[12] = @"tcpD";
    uint64_t v40 = [NSNumber numberWithUnsignedLongLong:self->_metricTCPRanDryCount];
    v55[12] = v40;
    v54[13] = @"fRtr";
    v39 = [NSNumber numberWithUnsignedLongLong:self->_metricRetries];
    v55[13] = v39;
    v54[14] = @"fs10K";
    int v38 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[0] / 0x64)];
    v55[14] = v38;
    v54[15] = @"fs100K";
    double v37 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[1] / 0x64)];
    v55[15] = v37;
    v54[16] = @"fs1M";
    v36 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[2] / 0x64)];
    v55[16] = v36;
    v54[17] = @"fs10M";
    unint64_t v21 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[3] / 0x64)];
    v55[17] = v21;
    v54[18] = @"fs100M";
    v22 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[4] / 0x64)];
    v55[18] = v22;
    v54[19] = @"fs1G";
    v23 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[5] / 0x64)];
    v55[19] = v23;
    v54[20] = @"fs10G";
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[6] / 0x64)];
    v55[20] = v24;
    v54[21] = @"fs10GUp";
    v25 = [NSNumber numberWithUnsignedLongLong:100 * (self->_metricFileSizeBuckets[7] / 0x64)];
    v55[21] = v25;
    v54[22] = @"ssPr";
    int v26 = [NSNumber numberWithUnsignedLongLong:self->_metricPrematureSmallSets];
    v55[22] = v26;
    v54[23] = @"CmpP";
    unint64_t v27 = [NSNumber numberWithInt:v14];
    v55[23] = v27;
    v54[24] = @"CmpE";
    long long v28 = [NSNumber numberWithUnsignedLongLong:self->_metricCompressionErrors];
    v55[24] = v28;
    v54[25] = @"CmpU";
    long long v29 = [NSNumber numberWithUnsignedLongLong:self->_metricUncompressibleChunks];
    v55[25] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:26];
    CUMetricsLogEx();

    id v4 = v52;
    uint64_t v16 = (void (**)(void, void))v53;
  }
}

- (void)_reportProgressControlState
{
  int controlState = self->_controlState;
  int v4 = [(RPConnection *)self->_controlCnx state];
  if (v4 != controlState)
  {
    int v5 = v4;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      BOOL v7 = "?";
      if (controlState == 1) {
        double v8 = "Ready";
      }
      else {
        double v8 = "?";
      }
      if (!controlState) {
        double v8 = "Unknown";
      }
      if (v5 == 1) {
        BOOL v7 = "Ready";
      }
      if (!v5) {
        BOOL v7 = "Unknown";
      }
      v25 = v8;
      unint64_t v27 = v7;
      LogPrintF();
    }
    self->_int controlState = v5;
    int v9 = [(RPConnection *)self->_controlCnx linkType];
    uint64_t v10 = mach_absolute_time();
    unint64_t metricTicksConnectStart = self->_metricTicksConnectStart;
    if (metricTicksConnectStart) {
      self->_metricTicksConnected += v10 - metricTicksConnectStart;
    }
    if (v5 == 1)
    {
      self->_unint64_t metricTicksConnectStart = v10;
      uint64_t v12 = 476;
      if (v9 == 8) {
        uint64_t v12 = 480;
      }
      if (v9 == 4) {
        uint64_t v12 = 472;
      }
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      if (self->_prefCompress)
      {
        double v13 = [(RPConnection *)self->_controlCnx appInfoPeer];
        unint64_t Int64 = CFDictionaryGetInt64();

        BOOL v15 = (Int64 >> 8) & 1;
      }
      else
      {
        LODWORD(v15) = 0;
      }
      if (self->_compressionEnabled != v15)
      {
        int v17 = self->_ucat->var0;
        if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
        {
          int64_t v18 = "yes";
          if (v15) {
            uint64_t v19 = "no";
          }
          else {
            uint64_t v19 = "yes";
          }
          if (!v15) {
            int64_t v18 = "no";
          }
          int v26 = v19;
          long long v28 = v18;
          LogPrintF();
        }
        self->_compressionEnabled = v15;
      }
      uint64_t v16 = 10;
    }
    else
    {
      ++self->_metricDisconnects;
      self->_unint64_t metricTicksConnectStart = 0;
      uint64_t v16 = 11;
    }
    -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", v16, v26, v28);
    [(RPFileTransferSession *)self _updateWiFi];
    if ((self->_flags & 0x80) != 0 && !self->_lockedInterface)
    {
      if (v9 == 8)
      {
        int v21 = self->_ucat->var0;
        if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_flags |= 0x30u;
        [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setAdvertiseFlags:[(CUBonjourAdvertiser *)self->_bonjourAdvertiser advertiseFlags] & 0xFBFFFFFFFFFFFFFFLL];
        unint64_t v23 = [(CUBonjourBrowser *)self->_bonjourBrowser browseFlags] & 0xFBCFFFFFFFFFFFFFLL | 0x30000000000000;
        bonjourBrowser = self->_bonjourBrowser;
      }
      else
      {
        if (v9 != 4)
        {
LABEL_53:
          self->_lockedInterface = 1;
          return;
        }
        int v20 = self->_ucat->var0;
        if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        self->_flags |= 0x60u;
        v22 = self->_bonjourBrowser;
        unint64_t v23 = [(CUBonjourBrowser *)v22 browseFlags] | 0x60000000000000;
        bonjourBrowser = v22;
      }
      [(CUBonjourBrowser *)bonjourBrowser setBrowseFlags:v23];
      goto LABEL_53;
    }
  }
}

- (void)_reportProgressType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = self->_progressCurrent;
  if (v5)
  {
    double v13 = v5;
    uint64_t v6 = [(RPConnection *)self->_controlCnx linkType];
    if (v6) {
      [(RPFileTransferProgress *)v13 setLinkType:v6];
    }
    [(RPFileTransferProgress *)v13 setType:v3];
    int var0 = self->_ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = v13;
      LogPrintF();
    }
    if (v3 == 20 || v3 == 11) {
      [(RPFileTransferSession *)self _stopProgressReportTimer];
    }
    uint64_t v9 = MEMORY[0x1B3EBCC80](self->_progressHandler);
    uint64_t v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v9 + 16))(v9, v13);
    }

    goto LABEL_17;
  }
  int v8 = self->_ucat->var0;
  if (v8 <= 90)
  {
    double v13 = 0;
    if (v8 != -1 || (int v11 = _LogCategory_Initialize(), v5 = 0, v11))
    {
      LogPrintF();
LABEL_17:
      int v5 = v13;
    }
  }
}

- (void)_reportDataTransferred
{
  uint64_t v3 = self->_progressCurrent;
  int v4 = v3;
  if (v3)
  {
    BOOL v15 = v3;
    [(RPFileTransferProgress *)v3 setType:30];
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = v15;
      LogPrintF();
    }
    if (!self->_metricLastFileCompletionTicks) {
      mach_absolute_time();
    }
    UpTicksToSecondsF();
    if (v7 == 0.0) {
      double v8 = 0.0;
    }
    else {
      double v8 = (double)self->_progressCurrentBytes / v7;
    }
    uint64_t v9 = v15;
    unint64_t metricUncompressedBytes = self->_metricUncompressedBytes;
    if (metricUncompressedBytes)
    {
      [(RPFileTransferProgress *)v15 setCompressionRate:(double)self->_metricCompressedBytes / (double)metricUncompressedBytes];
      uint64_t v9 = v15;
    }
    -[RPFileTransferProgress setBytesPerSecond:](v9, "setBytesPerSecond:", v8, v14);
    [(RPFileTransferProgress *)v15 setRemainingSeconds:0.0];
    [(RPFileTransferProgress *)v15 setCurrentFilename:0];
    [(RPFileTransferProgress *)v15 setError:0];
    [(RPFileTransferProgress *)v15 setTransferredByteCount:self->_progressCurrentBytes];
    [(RPFileTransferProgress *)v15 setTotalByteCount:self->_progressTotalBytes];
    [(RPFileTransferProgress *)v15 setTransferredFileCount:self->_progressCurrentFiles];
    [(RPFileTransferProgress *)v15 setTotalFileCount:self->_progressTotalFiles];
    uint64_t v11 = MEMORY[0x1B3EBCC80](self->_progressHandler);
    uint64_t v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v11 + 16))(v11, v15);
    }

    goto LABEL_19;
  }
  int v6 = self->_ucat->var0;
  if (v6 <= 90)
  {
    BOOL v15 = 0;
    if (v6 != -1 || (v13 = _LogCategory_Initialize(), int v4 = 0, v13))
    {
      LogPrintF();
LABEL_19:
      int v4 = v15;
    }
  }
}

- (void)_startProgressReportTimer
{
  [(RPFileTransferSession *)self progressHandlerTimeInterval];
  if (v3 > 0.0 && !self->_progressTimer)
  {
    int v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v4;

    int v6 = self->_progressTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __50__RPFileTransferSession__startProgressReportTimer__block_invoke;
    handler[3] = &unk_1E605B540;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_progressTimer);
  }
}

unsigned char *__50__RPFileTransferSession__startProgressReportTimer__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[336])
  {
    result = (unsigned char *)[result _reportDataTransferred];
    *(unsigned char *)(*(void *)(a1 + 32) + 336) = 0;
  }
  return result;
}

- (void)_stopProgressReportTimer
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    int v4 = self->_progressTimer;
    self->_progressTimer = 0;
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWiFi];
}

- (void)_updateWiFi
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unsigned int flags = v2->_flags;
  if ((flags & 8) != 0)
  {
    objc_sync_exit(v2);
  }
  else
  {
    if ((flags & 4) == 0)
    {
      objc_sync_exit(v2);

LABEL_10:
      if (![(CUWiFiManager *)v2->_wifiManager infraDisabled]) {
        goto LABEL_35;
      }
      int var0 = v2->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(CUWiFiManager *)v2->_wifiManager setInfraDisabled:0];
      int v8 = 0;
      goto LABEL_22;
    }
    int v5 = [(RPConnection *)v2->_controlCnx linkType];
    objc_sync_exit(v2);

    if (v5 != 4) {
      goto LABEL_10;
    }
  }
  if (([(CUWiFiManager *)v2->_wifiManager infraDisabled] & 1) == 0)
  {
    int v4 = v2->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  wifiManager = v2->_wifiManager;
  if (wifiManager)
  {
    if ([(CUWiFiManager *)wifiManager infraDisabled])
    {
      int v8 = 1;
      goto LABEL_28;
    }
    int v8 = 1;
    [(CUWiFiManager *)v2->_wifiManager setInfraDisabled:1];
  }
  else
  {
    uint64_t v9 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x1E4F5E218]);
    uint64_t v10 = v2->_wifiManager;
    v2->_wifiManager = v9;

    [(CUWiFiManager *)v2->_wifiManager setDispatchQueue:v2->_dispatchQueue];
    [(CUWiFiManager *)v2->_wifiManager setLabel:@"RPFile"];
    int v8 = 1;
    [(CUWiFiManager *)v2->_wifiManager setInfraDisabled:1];
    [(CUWiFiManager *)v2->_wifiManager activateWithCompletion:0];
  }
LABEL_22:
  if (v2->_controlCnx && (v2->_flags & 1) != 0)
  {
    if (v8) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v19 = @"_ftFl";
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v11];
    v20[0] = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

    [(RPConnection *)v2->_controlCnx sendEncryptedEventID:@"_ftPU" event:v13 options:0 completion:0];
  }
LABEL_28:
  if (v8)
  {
    unsigned int v14 = v2->_flags;
    if ((v14 & 1) == 0 && v2->_peerInfraWiFiDisabled)
    {
      if ((v14 & 2) == 0) {
        return;
      }
      int v15 = v2->_ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      p_controlCnx = (id *)&v2->_controlCnx;
      uint64_t v18 = 1024;
      goto LABEL_43;
    }
  }
LABEL_35:
  p_controlCnx = (id *)&v2->_controlCnx;
  if (![(RPConnection *)v2->_controlCnx trafficFlags]) {
    return;
  }
  int v17 = v2->_ucat->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v18 = 0;
LABEL_43:
  [*p_controlCnx setTrafficFlags:v18];
}

- (void)_debugSetup
{
  if (IsAppleInternalBuild())
  {
    if (self->_debugNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __36__RPFileTransferSession__debugSetup__block_invoke;
      handler[3] = &unk_1E605CA48;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.ftdebug", &self->_debugNotifyToken, dispatchQueue, handler);
      int debugNotifyToken = self->_debugNotifyToken;
      uint64_t state64 = 0;
      notify_get_state(debugNotifyToken, &state64);
      uint64_t debugFlags = state64;
      self->_uint64_t debugFlags = state64;
      if (debugFlags)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30)
        {
          if (var0 != -1)
          {
LABEL_6:
            uint64_t v8 = debugFlags;
            LogPrintF();
            [(RPFileTransferSession *)self _debugUpdate];
            return;
          }
          if (_LogCategory_Initialize())
          {
            uint64_t debugFlags = self->_debugFlags;
            goto LABEL_6;
          }
        }
        [(RPFileTransferSession *)self _debugUpdate];
      }
    }
  }
}

uint64_t __36__RPFileTransferSession__debugSetup__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(unsigned int *)(v2 + 84);
  if (result != -1)
  {
    uint64_t v4 = *(void *)(v2 + 576);
    uint64_t state64 = 0;
    notify_get_state(result, &state64);
    *(void *)(*(void *)(a1 + 32) + 576) = state64;
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = **(_DWORD **)(v5 + 152);
    if (v6 <= 30 && (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7)))
    {
      uint64_t v11 = *(void *)(v5 + 576);
      LogPrintF();
      return objc_msgSend(*(id *)(a1 + 32), "_debugUpdate", v4, &unk_1B39714AC, v11, &unk_1B39714AC);
    }
    else
    {
      return objc_msgSend((id)v5, "_debugUpdate", v8, v9, v10, v12);
    }
  }
  return result;
}

- (void)_debugUpdate
{
  if ((self->_debugFlags & 1) != 0 && self->_controlCnx)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    controlCnx = self->_controlCnx;
    uint64_t v5 = RPErrorF();
    [(RPConnection *)controlCnx invalidateWithError:v5];

    int v6 = self->_controlCnx;
    self->_controlCnx = 0;

    self->_debugFlags &= ~1uLL;
  }
}

- (void)_metricAddFileSize:(int64_t)a3
{
  if (a3 >= 10000)
  {
    uint64_t v3 = 1;
    uint64_t v4 = 2;
    uint64_t v5 = 3;
    uint64_t v6 = 4;
    uint64_t v7 = 5;
    uint64_t v8 = 6;
    if ((unint64_t)a3 >= 0x2540BE400) {
      uint64_t v8 = 7;
    }
    if ((unint64_t)a3 >= 0x3B9ACA00) {
      uint64_t v7 = v8;
    }
    if ((unint64_t)a3 >= 0x5F5E100) {
      uint64_t v6 = v7;
    }
    if ((unint64_t)a3 >= 0x989680) {
      uint64_t v5 = v6;
    }
    if ((unint64_t)a3 >= 0xF4240) {
      uint64_t v4 = v5;
    }
    if ((unint64_t)a3 >> 5 >= 0xC35) {
      uint64_t v3 = v4;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  ++self->_metricFileSizeBuckets[v3];
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_registeredEvents objectForKeyedSubscript:v17];

  int var0 = self->_ucat->var0;
  if (v10)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }
    uint64_t v12 = objc_alloc_init(RPEventRegistration);
    [(RPEventRegistration *)v12 setEventID:v17];
    [(RPEventRegistration *)v12 setOptions:v8];
    [(RPEventRegistration *)v12 setHandler:v9];
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      unsigned int v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v15 = self->_registeredEvents;
      self->_registeredEvents = v14;

      registeredEvents = self->_registeredEvents;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v12, v17, v16);
  }
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0, v4, v7);
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E605CA70;
  block[4] = self;
  id v21 = v11;
  id v23 = v13;
  id v24 = v14;
  id v22 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(dispatchQueue, block);
}

void __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 64);
  id v6 = v2;
  if (v2)
  {
    [v2 sendEncryptedEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
  }
  else
  {
    uint64_t v3 = RPErrorF();
    int v4 = **(_DWORD **)(a1[4] + 152);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v5 = a1[8];
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    }
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v14 isEqual:@"_ftPU"])
  {
    [(RPFileTransferSession *)self _receivedPeerUpdate:v8];
  }
  else
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_registeredEvents objectForKeyedSubscript:v14];
    uint64_t v11 = [v10 handler];
    id v12 = (void *)v11;
    if (v11)
    {
      (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v8, v9);
    }
    else
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_receivedPeerUpdate:(id)a3
{
  uint64_t v4 = CFDictionaryGetInt64Ranged() & 0xC;
  BOOL v5 = v4 != 0;
  if (self->_peerInfraWiFiDisabled != v5)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "yes";
      if (v4) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (!v4) {
        id v7 = "no";
      }
      id v9 = v8;
      uint64_t v10 = v7;
      LogPrintF();
    }
    self->_peerInfraWiFiDisabled = v5;
    [(RPFileTransferSession *)self _updateWiFi];
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v17];

  int var0 = self->_ucat->var0;
  if (v10)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v16 = v17;
      LogPrintF();
    }
    id v12 = objc_alloc_init(RPRequestRegistration);
    [(RPRequestRegistration *)v12 setRequestID:v17];
    [(RPRequestRegistration *)v12 setOptions:v8];
    [(RPRequestRegistration *)v12 setHandler:v9];
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v15 = self->_registeredRequests;
      self->_registeredRequests = v14;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v12, v17, v16);
  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v7 = v4;
      LogPrintF();
      id v4 = v8;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", 0, v4, v7);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  block[3] = &unk_1E605CA70;
  block[4] = self;
  id v21 = v11;
  id v23 = v13;
  id v24 = v14;
  id v22 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(dispatchQueue, block);
}

void __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 64);
  id v5 = v2;
  if (v2)
  {
    [v2 sendEncryptedRequestID:a1[5] request:a1[6] xpcID:0 options:a1[7] responseHandler:a1[8]];
  }
  else
  {
    uint64_t v3 = RPErrorF();
    int v4 = **(_DWORD **)(a1[4] + 152);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void, void))(a1[8] + 16))(a1[8], 0);
  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v18 isEqual:@"_ftSm"])
  {
    [(RPFileTransferSession *)self _smallFilesReceiveRequest:v10 responseHandler:v12];
  }
  else if ([v18 isEqual:@"_ftLg"])
  {
    [(RPFileTransferSession *)self _largeFileReceiveRequest:v10 responseHandler:v12];
  }
  else if ([v18 isEqual:@"_ftRs"])
  {
    [(RPFileTransferSession *)self _resumeStateReceiveRequest:v10 responseHandler:v12];
  }
  else
  {
    id v13 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v18];
    uint64_t v14 = [v13 handler];
    int v15 = (void *)v14;
    if (v14)
    {
      (*(void (**)(uint64_t, id, id, id))(v14 + 16))(v14, v10, v11, v12);
    }
    else
    {
      id v16 = RPErrorF();
      int var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v16);
    }
  }
}

- (BOOL)_activateSourceAndReturnError:(id *)a3
{
  [(RPFileTransferSession *)self _updateWiFi];
  int v4 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E4F5E0F8]);
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = v4;
  int v6 = v4;

  [(CUCoalescer *)v6 setDispatchQueue:self->_dispatchQueue];
  [(CUCoalescer *)v6 setMinDelay:1.0];
  [(CUCoalescer *)v6 setMaxDelay:2.0];
  [(CUCoalescer *)v6 setLeeway:1.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke;
  v17[3] = &unk_1E605B5D8;
  v17[4] = v6;
  v17[5] = self;
  [(CUCoalescer *)v6 setActionHandler:v17];
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0) {
    uint64_t v8 = 0x10000000000000;
  }
  else {
    uint64_t v8 = 0x400000000000000;
  }
  unint64_t v9 = v8 & 0xFF9FFFFFFFFFFFFFLL | ((((unint64_t)(flags & 0x60) >> 5) & 3) << 53);
  id v10 = (CUBonjourBrowser *)objc_alloc_init(MEMORY[0x1E4F5E0F0]);
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = v10;
  id v12 = v10;

  [(CUBonjourBrowser *)v12 setBrowseFlags:v9];
  [(CUBonjourBrowser *)v12 setChangeFlags:1];
  [(CUBonjourBrowser *)v12 setDispatchQueue:self->_dispatchQueue];
  [(CUBonjourBrowser *)v12 setDomain:@"local."];
  [(CUBonjourBrowser *)v12 setLabel:@"RPFile"];
  [(CUBonjourBrowser *)v12 setServiceType:@"_rpft._tcp"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2;
  v16[3] = &unk_1E605CA98;
  v16[4] = v12;
  v16[5] = self;
  [(CUBonjourBrowser *)v12 setDeviceFoundHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3;
  v15[3] = &unk_1E605CA98;
  v15[4] = v12;
  v15[5] = self;
  [(CUBonjourBrowser *)v12 setDeviceLostHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4;
  v14[3] = &unk_1E605CAC0;
  v14[4] = v12;
  v14[5] = self;
  [(CUBonjourBrowser *)v12 setDeviceChangedHandler:v14];
  [(CUBonjourBrowser *)v12 activate];

  return 1;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[4]) {
    return (void *)[result _handleDevicesCoalesced];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceFound:a2];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceLost:a2];
  }
  return result;
}

void *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[3]) {
    return (void *)[result _handleDeviceFound:a2];
  }
  return result;
}

- (void)_handleDeviceFound:(id)a3
{
  id v5 = a3;
  int var0 = self->_ucat->var0;
  id v14 = v5;
  if (var0 <= 20)
  {
    if (var0 != -1 || (int v7 = _LogCategory_Initialize(), v5 = v14, v7))
    {
      id v12 = CUDescriptionWithLevel();
      LogPrintF();

      id v5 = v14;
    }
  }
  objc_msgSend(v5, "identifierStr", v12);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 UTF8String];

  if (v9)
  {
    if ([(NSString *)self->_targetID UTF8String])
    {
      uint64_t v10 = TextToHardwareAddressScalar();
      if (v10 == TextToHardwareAddressScalar())
      {
        int v11 = self->_ucat->var0;
        if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
        {
          id v13 = CUDescriptionWithLevel();
          LogPrintF();
        }
        objc_storeStrong((id *)&self->_bonjourDevice, a3);
        [(CUCoalescer *)self->_bonjourCoalescer trigger];
      }
    }
  }
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v14 = v4;
  if (var0 <= 20)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v14, v6))
    {
      id v12 = CUDescriptionWithLevel();
      LogPrintF();

      id v4 = v14;
    }
  }
  objc_msgSend(v4, "identifierStr", v12);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 UTF8String];

  if (v8)
  {
    if ([(NSString *)self->_targetID UTF8String])
    {
      uint64_t v9 = TextToHardwareAddressScalar();
      if (v9 == TextToHardwareAddressScalar())
      {
        int v10 = self->_ucat->var0;
        if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        {
          id v13 = CUDescriptionWithLevel();
          LogPrintF();
        }
        bonjourDevice = self->_bonjourDevice;
        self->_bonjourDevice = 0;

        [(RPConnection *)self->_controlCnx setPresent:0];
      }
    }
  }
}

- (void)_handleDevicesCoalesced
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v4 = CUDescriptionWithLevel();
    LogPrintF();
  }
  [(RPFileTransferSession *)self _controlCnxStartIfNeeded];
}

- (void)_controlCnxRetryIfNeeded
{
  if (!self->_invalidateCalled && !self->_controlCnx && self->_bonjourDevice && !self->_controlRetryTimer)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    controlRetryTimer = self->_controlRetryTimer;
    self->_controlRetryTimer = v4;
    int v6 = v4;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke;
    v7[3] = &unk_1E605B5D8;
    v7[4] = v6;
    v7[5] = self;
    dispatch_source_set_event_handler(v6, v7);
    CUDispatchTimerSet();
    dispatch_resume(v6);
  }
}

void __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1 != *(void **)(*(void *)(a1 + 40) + 72)) {
    return;
  }
  if (v1)
  {
    uint64_t v3 = v1;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = 0;
  }
  id v6 = *(id *)(*(void *)(a1 + 40) + 40);
  id v7 = v6;
  int v8 = **(_DWORD **)(*(void *)(a1 + 40) + 152);
  id v12 = v6;
  if (v8 <= 30)
  {
    if (v8 != -1)
    {
      if (v6)
      {
LABEL_7:
        int v11 = CUDescriptionWithLevel();
        LogPrintF();

        objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v11);
LABEL_11:
        id v7 = v12;
        goto LABEL_12;
      }
LABEL_16:
      LogPrintF();
      goto LABEL_11;
    }
    int v9 = _LogCategory_Initialize();
    id v7 = v12;
    if (v9)
    {
      if (v12) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v10);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_controlCnxStartIfNeeded
{
  p_controlCnx = &self->_controlCnx;
  if (!self->_controlCnx)
  {
    uint64_t v4 = self->_bonjourDevice;
    if (v4)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v14 = v4;
        LogPrintF();
      }
      controlRetryTimer = self->_controlRetryTimer;
      if (controlRetryTimer)
      {
        id v7 = controlRetryTimer;
        dispatch_source_cancel(v7);
        int v8 = self->_controlRetryTimer;
        self->_controlRetryTimer = 0;
      }
      int v9 = objc_alloc_init(RPConnection);
      objc_storeStrong((id *)p_controlCnx, v9);
      if (self->_prefCompress) {
        [(RPConnection *)v9 setAppInfoSelf:&unk_1F0C37768];
      }
      -[RPConnection setBonjourPeerDevice:](v9, "setBonjourPeerDevice:", v4, v14);
      [(RPConnection *)v9 setControlFlags:[(RPConnection *)v9 controlFlags] | 0x60000200];
      [(RPConnection *)v9 setDispatchQueue:self->_dispatchQueue];
      [(RPConnection *)v9 setForcedPeerIdentity:self->_peerIdentity];
      [(RPConnection *)v9 setForcedSelfIdentity:self->_selfIdentity];
      [(RPConnection *)v9 setKeepAliveSeconds:30];
      id v10 = [NSString alloc];
      targetID = self->_targetID;
      uint64_t v12 = self->_cnxIDLast + 1;
      self->_cnxIDLast = v12;
      id v13 = (void *)[v10 initWithFormat:@"RPFileCnx-%@-Out-%u", targetID, v12];
      [(RPConnection *)v9 setLabel:v13];

      [(RPConnection *)v9 setPeerIdentifier:self->_targetID];
      [(RPConnection *)v9 setPresent:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke;
      v18[3] = &unk_1E605B5D8;
      v18[4] = v9;
      v18[5] = self;
      [(RPConnection *)v9 setInvalidationHandler:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2;
      v17[3] = &unk_1E605CAE8;
      v17[4] = v9;
      v17[5] = self;
      [(RPConnection *)v9 setReceivedEventHandler:v17];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3;
      v16[3] = &unk_1E605CB10;
      v16[4] = v9;
      v16[5] = self;
      [(RPConnection *)v9 setReceivedRequestHandler:v16];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4;
      v15[3] = &unk_1E605CB38;
      v15[4] = v9;
      v15[5] = self;
      [(RPConnection *)v9 setStateChangedHandler:v15];
      [(RPConnection *)v9 activate];
    }
  }
}

uint64_t __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 64))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 64) = 0;

    [*(id *)(v3 + 40) _reportProgressControlState];
    uint64_t v4 = *(void **)(v3 + 40);
    return [v4 _controlCnxRetryIfNeeded];
  }
  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v5 == result[8]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[8]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v4 == result[8])
  {
    uint64_t result = (void *)[result _reportProgressControlState];
    if (a2 == 1)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      return (void *)[v6 _scheduleItems];
    }
  }
  return result;
}

- (BOOL)_activateTargetAndReturnError:(id *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  [(RPFileTransferSession *)self _updateWiFi];
  if (([(RPFileTransferSession *)self flags] & 0x200) != 0)
  {
    uint64_t v5 = [[RPFileTransferResumeState alloc] initWithDispatchQueue:self->_dispatchQueue];
    if (v5)
    {
      if (self->_receiveFileParentPath)
      {
        uint64_t v6 = [(RPFileTransferSession *)self targetID];

        if (v6)
        {
          id v7 = NSString;
          int v8 = [(RPFileTransferSession *)self targetID];
          int v9 = [v7 stringWithFormat:@"%@-state.rptfd", v8];

          id v10 = [(NSString *)self->_receiveFileParentPath stringByStandardizingPath];
          [(RPFileTransferResumeState *)v5 setOutputPath:v10];

          int v11 = [(NSString *)self->_receiveFileParentPath stringByAppendingPathComponent:v9];
          uint64_t v12 = [v11 stringByStandardizingPath];
          [(RPFileTransferResumeState *)v5 setStateFilePath:v12];

          [(RPFileTransferResumeState *)v5 setUcat:self->_ucat];
          [(RPFileTransferResumeState *)v5 setFlushInterval:self->_resumeStateFlushInterval];
          [(RPFileTransferResumeState *)v5 loadStateFile];
          if (![(RPFileTransferResumeState *)v5 isEmpty])
          {
            id v21 = [(RPFileTransferSession *)self targetID];
            FPrintF();
          }
          resumeState = self->_resumeState;
          self->_resumeState = v5;

          goto LABEL_8;
        }
        if (a3) {
          goto LABEL_21;
        }
LABEL_22:

        return 0;
      }
      if (!a3) {
        goto LABEL_22;
      }
    }
    else if (!a3)
    {
      goto LABEL_22;
    }
LABEL_21:
    RPErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_8:
  id v14 = objc_alloc_init(MEMORY[0x1E4F5E208]);
  objc_storeStrong((id *)&self->_tcpServer, v14);
  [v14 setDispatchQueue:self->_dispatchQueue];
  [v14 setFlags:9];
  [v14 setLabel:@"RPFile"];
  [(CUTCPServer *)self->_tcpServer setConnectionPrepareHandler:&__block_literal_global_7];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2;
  v23[3] = &unk_1E605CB80;
  v23[4] = v14;
  v23[5] = self;
  [(CUTCPServer *)self->_tcpServer setConnectionStartedHandler:v23];
  tcpServer = self->_tcpServer;
  id v22 = 0;
  [(CUTCPServer *)tcpServer activateDirectAndReturnError:&v22];
  id v16 = v22;
  BOOL v17 = v16 == 0;
  if (v16)
  {
    if (a3)
    {
      RPNestedErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F5E0E8]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v18);
    if ((self->_flags & 0x10) == 0) {
      [v18 setAdvertiseFlags:0x100000];
    }
    objc_msgSend(v18, "setDispatchQueue:", self->_dispatchQueue, v21);
    [v18 setDomain:@"local."];
    [v18 setLabel:@"RPFile"];
    [v18 setName:self->_targetID];
    objc_msgSend(v18, "setPort:", -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
    [v18 setServiceType:@"_rpft._tcp"];
    id v24 = @"rpBA";
    v25[0] = self->_targetID;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v18 setTxtDictionary:v19];

    [v18 activate];
  }

  return v17;
}

uint64_t __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setKeepAliveSeconds:30];
}

void *__55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[18]) {
    return (void *)[result _handleIncomingConnectionStarted:a2];
  }
  return result;
}

- (void)_handleIncomingConnectionStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(RPConnection);
  uint64_t v6 = v5;
  if (self->_prefCompress) {
    [(RPConnection *)v5 setAppInfoSelf:&unk_1F0C37790];
  }
  [(RPConnection *)v6 setControlFlags:[(RPConnection *)v6 controlFlags] | 0x60000000];
  [(RPConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  [(RPConnection *)v6 setForcedPeerIdentity:self->_peerIdentity];
  [(RPConnection *)v6 setForcedSelfIdentity:self->_selfIdentity];
  id v7 = [NSString alloc];
  targetID = self->_targetID;
  uint64_t v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  id v10 = (void *)[v7 initWithFormat:@"RPFileCnx-%@-In-%u", targetID, v9];
  [(RPConnection *)v6 setLabel:v10];

  [(RPConnection *)v6 setTcpConnection:v4];
  int v11 = [(RPConnection *)v6 label];
  [v4 setLabel:v11];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke;
  v20[3] = &unk_1E605B5D8;
  v20[4] = self;
  v20[5] = v6;
  [(RPConnection *)v6 setInvalidationHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2;
  v19[3] = &unk_1E605CBA8;
  v19[4] = self;
  [(RPConnection *)v6 setReceivedEventHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3;
  v18[3] = &unk_1E605CBD0;
  v18[4] = self;
  [(RPConnection *)v6 setReceivedRequestHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4;
  v17[3] = &unk_1E605CA48;
  v17[4] = self;
  [(RPConnection *)v6 setStateChangedHandler:v17];
  if (!self->_controlCnx)
  {
    objc_storeStrong((id *)&self->_controlCnx, v6);
    [(RPFileTransferSession *)self _reportProgressControlState];
  }
  connections = self->_connections;
  if (!connections)
  {
    id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v14 = self->_connections;
    self->_connections = v13;

    connections = self->_connections;
  }
  [(NSMutableSet *)connections addObject:v6];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = v6;
    LogPrintF();
  }
  [(RPConnection *)v6 activate];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleIncomingConnectionEnded:*(void *)(a1 + 40)];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedEventID:a2 event:a3 options:a4];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) _reportProgressControlState];
  if (a2 == 1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _scheduleItems];
  }
  return result;
}

- (void)_handleIncomingConnectionEnded:(id)a3
{
  id v4 = (RPConnection *)a3;
  int var0 = self->_ucat->var0;
  id v10 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v10, v6))
    {
      uint64_t v9 = v4;
      LogPrintF();
      id v4 = v10;
    }
  }
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4, v9);
  if (self->_controlCnx == v10)
  {
    self->_controlCnx = 0;
  }
  [(RPFileTransferSession *)self _reportProgressControlState];
  if (!self->_controlCnx && !self->_invalidateCalled)
  {
    id v7 = [(NSMutableSet *)self->_connections anyObject];
    if (v7)
    {
      int v8 = self->_ucat->var0;
      if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_controlCnx, v7);
      [(RPFileTransferSession *)self _reportProgressControlState];
    }
  }
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__2;
  v13[4] = __Block_byref_object_dispose__2;
  id v14 = 0;
  id obj = 0;
  BOOL v5 = [(RPFileTransferSession *)self _prepareItem:v4 error:&obj];
  objc_storeStrong(&v14, obj);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__RPFileTransferSession_addItem___block_invoke;
  block[3] = &unk_1E605CBF8;
  BOOL v11 = v5;
  id v9 = v4;
  id v10 = v13;
  block[4] = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(v13, 8);
}

void __33__RPFileTransferSession_addItem___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && (uint64_t v2 = *(void *)(a1 + 32), !*(unsigned char *)(v2 + 89)))
  {
    int v7 = **(_DWORD **)(v2 + 152);
    if (v7 <= 9)
    {
      if (v7 != -1 || (int v12 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v12))
      {
        uint64_t v8 = [*(id *)(a1 + 40) fileID];
        uint64_t v9 = [*(id *)(a1 + 40) fileSize];
        uint64_t v10 = [*(id *)(a1 + 40) metadataSize];
        [*(id *)(a1 + 40) itemURL];
        v21 = uint64_t v20 = v10;
        id v18 = (void *)v8;
        uint64_t v19 = v9;
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    id v13 = *(void **)(v2 + 168);
    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 168);
      *(void *)(v15 + 168) = v14;

      id v13 = *(void **)(*(void *)(a1 + 32) + 168);
    }
    objc_msgSend(v13, "addObject:", *(void *)(a1 + 40), v18, v19, v20, v21);
    objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(*(id *)(a1 + 40), "fileSize"));
    BOOL v17 = *(void **)(a1 + 32);
    [v17 _scheduleItems];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v3 = RPErrorF();
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      id v18 = [*(id *)(a1 + 40) itemURL];
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "completionHandler", v18, v19);
    BOOL v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v22 = v11;
      v11[2](v11, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [*(id *)(a1 + 40) setCompletionHandler:0];
      BOOL v11 = (void (**)(void, void))v22;
    }
  }
}

- (void)addItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)[a3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v16 = 0;
        BOOL v10 = [(RPFileTransferSession *)self _prepareItem:v9 error:&v16];
        id v11 = v16;
        if (!v10) {
          [v9 setError:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__RPFileTransferSession_addItems___block_invoke;
  block[3] = &unk_1E605B5D8;
  block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(dispatchQueue, block);
}

void __34__RPFileTransferSession_addItems___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 89))
  {
    if (!*(void *)(v2 + 168))
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 168);
      *(void *)(v14 + 168) = v13;
    }
    uint64_t v40 = [*(id *)(a1 + 40) count];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (!v17)
    {
LABEL_44:

      [*(id *)(a1 + 32) _scheduleItems];
      return;
    }
    uint64_t v18 = v17;
    long long v19 = 0;
    uint64_t v20 = *(void *)v44;
    id v39 = v16;
    uint64_t v42 = *(void *)v44;
LABEL_22:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
      id v23 = [v22 error];
      if (v23)
      {
        int v24 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
        if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize()))
        {
          double v33 = [v22 itemURL];
          uint64_t v34 = v23;
          LogPrintF();

          uint64_t v20 = v42;
        }
        objc_msgSend(v22, "completionHandler", v33, v34);
        uint64_t v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          [v22 setCompletionHandler:0];
          ((void (**)(void, char *))v30)[2](v30, v23);
        }

        goto LABEL_39;
      }
      ++v19;
      uint64_t v25 = *(void *)(a1 + 32);
      int v26 = **(_DWORD **)(v25 + 152);
      if (v26 <= 9)
      {
        if (v26 == -1)
        {
          int v31 = _LogCategory_Initialize();
          uint64_t v25 = *(void *)(a1 + 32);
          if (!v31) {
            goto LABEL_38;
          }
          v41 = v19;
        }
        else
        {
          v41 = v19;
        }
        uint64_t v27 = [v22 fileID];
        uint64_t v28 = [v22 fileSize];
        uint64_t v29 = [v22 metadataSize];
        [v22 itemURL];
        v38 = uint64_t v37 = v29;
        uint64_t v35 = v40;
        uint64_t v36 = v28;
        long long v19 = v41;
        double v33 = (void *)v27;
        uint64_t v34 = v41;
        LogPrintF();

        uint64_t v25 = *(void *)(a1 + 32);
        id v16 = v39;
        uint64_t v20 = v42;
      }
LABEL_38:
      objc_msgSend(*(id *)(v25 + 168), "addObject:", v22, v33, v34, v35, v36, v37, v38);
      objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(v22, "fileSize"));
LABEL_39:

      if (v18 == ++v21)
      {
        uint64_t v32 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
        uint64_t v18 = v32;
        if (!v32) {
          goto LABEL_44;
        }
        goto LABEL_22;
      }
    }
  }
  RPErrorF();
  uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
        int v10 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
        if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
        {
          double v33 = [v9 itemURL];
          uint64_t v34 = v3;
          LogPrintF();
        }
        objc_msgSend(v9, "completionHandler", v33, v34);
        id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          [v9 setCompletionHandler:0];
          ((void (**)(void, char *))v11)[2](v11, v3);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }
}

- (BOOL)_prepareItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 setCompleted:0];
  [v6 setError:0];
  objc_msgSend(v6, "setFileID:", atomic_fetch_add((atomic_ullong *volatile)&self->_fileIDLastSend, 1uLL) + 1);
  id v7 = [v6 itemURL];
  uint64_t v8 = (const char *)[v7 fileSystemRepresentation];
  if (!v8)
  {
    if (a4) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  memset(&v18, 0, sizeof(v18));
  if (stat(v8, &v18) && (!*__error() || *__error()))
  {
    if (a4)
    {
LABEL_16:
      RPErrorF();
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_21:
    BOOL v13 = 0;
    goto LABEL_19;
  }
  off_t st_size = v18.st_size;
  [v6 setFileSize:v18.st_size];
  int v10 = [v6 metadata];
  if (v10) {
    uint64_t v11 = OPACKEstimateEncodedSize();
  }
  else {
    uint64_t v11 = 0;
  }
  [v6 setMetadataSize:v11];
  unint64_t v12 = st_size + v11;
  if (__CFADD__(st_size, v11)
    || (unint64_t v14 = v12 + 200, v15 = v12 >= 0xFFFFFFFFFFFFFF38, (v16 = v15 << 63 >> 63, v16 ^ v15) || v16 < 0))
  {
    if (a4)
    {
      RPErrorF();
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    [v6 setEstimatedSize:v14];
    BOOL v13 = 1;
  }

LABEL_19:
  return v13;
}

- (void)_scheduleItems
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_invalidateCalled || [(RPConnection *)self->_controlCnx state] != 1) {
    return;
  }
  if (![(RPFileTransferSession *)self isResumable]
    || ([(RPFileTransferSession *)self flags] & 1) != 0)
  {
    goto LABEL_7;
  }
  uint64_t v3 = [(RPFileTransferSession *)self resumeState];
  if (v3)
  {
    id v4 = v3;
    char v5 = [v3 isPlaceholder];

    if (v5) {
      return;
    }
LABEL_7:
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = self->_smallFilesSendTasks;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v40;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
          if ([v11 needsRetry])
          {
            [v11 setNeedsRetry:0];
            ++self->_metricRetries;
            int var0 = self->_ucat->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v30 = [v11 taskID];
              LogPrintF();
            }
            BOOL v13 = objc_msgSend(v11, "queue", v30);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __39__RPFileTransferSession__scheduleItems__block_invoke;
            block[3] = &unk_1E605B5D8;
            block[4] = self;
            void block[5] = v11;
            dispatch_async(v13, block);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = self->_largeFileSendTasks;
    uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
          if ([v20 needsRetry])
          {
            [v20 setNeedsRetry:0];
            ++self->_metricRetries;
            int v21 = self->_ucat->var0;
            if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v30 = [v20 taskID];
              LogPrintF();
            }
            uint64_t v22 = objc_msgSend(v20, "queue", v30);
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_2;
            v33[3] = &unk_1E605B5D8;
            v33[4] = self;
            v33[5] = v20;
            dispatch_async(v22, v33);
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v23 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
        uint64_t v17 = v23;
      }
      while (v23);
    }

    while ([(NSMutableSet *)self->_smallFilesSendTasks count] < self->_maxSmallFileTasks)
    {
      uint64_t v24 = [(RPFileTransferSession *)self _smallFilesSendTaskCreate];
      if (!v24) {
        break;
      }
      uint64_t v25 = (void *)v24;
      [(NSMutableSet *)self->_smallFilesSendTasks addObject:v24];
      int v26 = [v25 queue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_3;
      v32[3] = &unk_1E605B5D8;
      v32[4] = self;
      v32[5] = v25;
      dispatch_async(v26, v32);
    }
    while ([(NSMutableSet *)self->_largeFileSendTasks count] < self->_maxLargeFileTasks)
    {
      uint64_t v27 = [(RPFileTransferSession *)self _largeFileSendTaskCreate];
      if (!v27) {
        break;
      }
      uint64_t v28 = (void *)v27;
      [(NSMutableSet *)self->_largeFileSendTasks addObject:v27];
      uint64_t v29 = [v28 queue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_4;
      v31[3] = &unk_1E605B5D8;
      v31[4] = self;
      v31[5] = v28;
      dispatch_async(v29, v31);
    }
    return;
  }
  [(RPFileTransferSession *)self _requestResumeStateFromReceiver];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskRun:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskStart:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskRun:*(void *)(a1 + 40)];
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskStart:*(void *)(a1 + 40)];
}

- (void)_requestResumeStateFromReceiver
{
  uint64_t v3 = objc_alloc_init(RPFileTransferResumeState);
  [(RPFileTransferResumeState *)v3 setIsPlaceholder:1];
  [(RPFileTransferResumeState *)v3 setUcat:self->_ucat];
  resumeState = self->_resumeState;
  self->_resumeState = v3;
  char v5 = v3;

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [(RPFileTransferSession *)self targetID];
  [v6 setValue:v7 forKey:@"_i"];

  controlCnx = self->_controlCnx;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke;
  v9[3] = &unk_1E605C360;
  v9[4] = self;
  [(RPConnection *)controlCnx sendEncryptedRequestID:@"_ftRs" request:v6 xpcID:0 options:0 responseHandler:v9];
}

void __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 code];
    int v12 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
    if (v11 == -6714)
    {
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
        goto LABEL_15;
      }
    }
    else if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = v10;
LABEL_15:
      LogPrintF();
    }
  }
  else if (v7)
  {
    BOOL v13 = [v7 objectForKeyedSubscript:@"resumeState"];
    if (v13)
    {
      id v18 = 0;
      uint64_t v14 = [[RPFileTransferResumeState alloc] initWithDictionaryRepresentation:v13 error:&v18];
      id v15 = v18;
      if (v14)
      {
        if (![(RPFileTransferResumeState *)v14 isEmpty])
        {
          uint64_t v17 = [*(id *)(a1 + 32) targetID];
          FPrintF();
        }
        [(RPFileTransferResumeState *)v14 removeUnusableSourceFileItems];
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), v14);
      }
      else
      {
        int v16 = **(_DWORD **)(*(void *)(a1 + 32) + 152);
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v17 = v15;
          LogPrintF();
        }
      }
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setIsPlaceholder:", 0, v17);
  [*(id *)(a1 + 32) _scheduleItems];
}

- (void)_completeItem:(id)a3 error:(id)a4
{
  [(RPFileTransferSession *)self _completeItemDirect:a3 error:a4];
  [(RPFileTransferSession *)self _processFinish];
}

- (void)_completeItemDirect:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v15 completionHandler];
  if (v7)
  {
    [v15 setCompletionHandler:0];
    int var0 = self->_ucat->var0;
    if (v6)
    {
      if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      id v9 = [v15 itemURL];
      BOOL v13 = v9;
      id v14 = v6;
    }
    else
    {
      if (var0 > 9 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      id v9 = [v15 itemURL];
      BOOL v13 = v9;
    }
    LogPrintF();

LABEL_13:
    ((void (**)(void, id))v7)[2](v7, v6);
  }
  if ((objc_msgSend(v15, "completed", v13, v14) & 1) == 0)
  {
    [v15 setCompleted:1];
    self->_unint64_t metricLastFileCompletionTicks = mach_absolute_time();
    if (!v6)
    {
      uint64_t v10 = [v15 fileSize];
      uint64_t v11 = [v15 metadataSize];
      int64x2_t v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = v11 + v10;
      *(int64x2_t *)&self->_metricTotalBytes = vaddq_s64(v12, *(int64x2_t *)&self->_metricTotalBytes);
    }
  }
}

- (void)_processReceivedItem:(id)a3 responseHandler:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))MEMORY[0x1B3EBCC80](self->_receivedItemHandler);
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke;
    v14[3] = &unk_1E605BC60;
    v14[4] = self;
    id v15 = v7;
    ((void (**)(void, id, void *))v8)[2](v8, v6, v14);
  }
  else
  {
    id v9 = (void (**)(void, void, void))MEMORY[0x1B3EBCC80](self->_receivedItemsHandler);
    if (v9)
    {
      v16[0] = v6;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3;
      v12[3] = &unk_1E605BC60;
      v12[4] = self;
      id v13 = v7;
      ((void (**)(void, void *, void *))v9)[2](v9, v10, v12);
    }
    else
    {
      uint64_t v11 = RPErrorF();
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
    }
  }
}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2;
  v7[3] = &unk_1E605BD40;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F1CC08];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v1, 0);
}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4;
  v7[3] = &unk_1E605BD40;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F1CC08];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v1, 0);
}

- (void)_processReceivedItems:(id)a3 responseHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))MEMORY[0x1B3EBCC80](self->_receivedItemsHandler);
  if (v8)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke;
    v29[3] = &unk_1E605BC60;
    v29[4] = self;
    id v30 = v7;
    ((void (**)(void, id, void *))v8)[2](v8, v6, v29);
  }
  else
  {
    id v9 = (void (**)(void, void, void))MEMORY[0x1B3EBCC80](self->_receivedItemHandler);
    if (v9)
    {
      uint64_t v17 = v7;
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__2;
      v27[4] = __Block_byref_object_dispose__2;
      id v28 = 0;
      uint64_t v10 = dispatch_group_create();
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v6;
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            dispatch_group_enter(v10);
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3;
            v22[3] = &unk_1E605CC20;
            v22[4] = v10;
            v22[5] = v27;
            ((void (**)(void, uint64_t, void *))v9)[2](v9, v14, v22);
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v11);
      }

      id v7 = v17;
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4;
      block[3] = &unk_1E605CC48;
      id v20 = v17;
      int v21 = v27;
      dispatch_group_notify(v10, dispatchQueue, block);

      _Block_object_dispose(v27, 8);
    }
    else
    {
      int v16 = RPErrorF();
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v16);
    }
  }
}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2;
  v7[3] = &unk_1E605BD40;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F1CC08];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v1, 0);
}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    id v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = MEMORY[0x1E4F1CC08];
  }
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v1, 0);
}

- (void)finish
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__RPFileTransferSession_finish__block_invoke;
  block[3] = &unk_1E605B540;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPFileTransferSession_finish__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 88) = 1;
  [*(id *)(a1 + 32) _processFinish];
  if [*(id *)(a1 + 32) isResumable] && (objc_msgSend(*(id *)(a1 + 32), "flags"))
  {
    id v5 = [*(id *)(a1 + 32) resumeState];
    [v5 flushStateFile];
  }
}

- (void)_processFinish
{
  if (self->_finishPending
    && ![(NSMutableSet *)self->_addedItems count]
    && ![(NSMutableDictionary *)self->_smallFilesReceiveTasks count]
    && ![(NSMutableSet *)self->_smallFilesSendTasks count]
    && ![(NSMutableDictionary *)self->_largeFileReceiveTasks count]
    && ![(NSMutableSet *)self->_largeFileSendTasks count])
  {
    [(RPFileTransferSession *)self _reportCompletion:0];
  }
}

- (id)_smallFilesSendTaskCreate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v4 = (void *)[(NSMutableSet *)self->_addedItems copy];
  id v5 = (RPFileTransferSmallFilesTask *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5)
  {
    id v6 = v4;
LABEL_19:

    goto LABEL_21;
  }
  id v6 = 0;
  uint64_t v7 = *(void *)v17;
  unint64_t v15 = prefSmallFilesMaxBytes;
  do
  {
    for (uint64_t i = 0; i != v5; uint64_t i = (RPFileTransferSmallFilesTask *)((char *)i + 1))
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      unint64_t v10 = [v9 estimatedSize];
      unint64_t v11 = prefSmallFilesMaxBytes - v10;
      if (prefSmallFilesMaxBytes >= v10)
      {
        if (!v6) {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v6 addObject:v9];
        [(NSMutableSet *)self->_addedItems removeObject:v9];
        unint64_t prefSmallFilesMaxBytes = v11;
      }
    }
    id v5 = (RPFileTransferSmallFilesTask *)[v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v5);

  if (v6)
  {
    if (prefSmallFilesMaxBytes > v15 >> 1) {
      ++self->_metricPrematureSmallSets;
    }
    id v5 = objc_alloc_init(RPFileTransferSmallFilesTask);
    [(RPFileTransferSmallFilesTask *)v5 setFileItems:v6];
    uint64_t v12 = [(RPFileTransferSession *)self _ioQueueDequeue];
    [(RPFileTransferSmallFilesTask *)v5 setQueue:v12];

    ++self->_taskIDLast;
    -[RPFileTransferSmallFilesTask setTaskID:](v5, "setTaskID:");
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [(RPFileTransferSmallFilesTask *)v5 taskID];
      [v6 count];
      LogPrintF();
    }
    goto LABEL_19;
  }
  id v5 = 0;
LABEL_21:
  return v5;
}

- (void)_smallFilesSendTaskRun:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int v4 = [v33 fileItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([(RPFileTransferSession *)self isResumable])
        {
          unint64_t v10 = [(RPFileTransferSession *)self resumeState];
          unint64_t v11 = [v9 filename];
          uint64_t v12 = [v10 finishedFileWithFileName:v11];

          if (v12)
          {
            int v31 = [v12 fileName];
            FPrintF();

            goto LABEL_13;
          }
        }
        id v46 = 0;
        uint64_t v12 = [(RPFileTransferSession *)self _smallFilesSendTaskReadItem:v9 error:&v46];
        id v13 = v46;
        unint64_t v10 = v13;
        if (v12)
        {
          [v34 addObject:v12];
        }
        else
        {
          dispatchQueue = self->_dispatchQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke;
          block[3] = &unk_1E605C3D8;
          void block[4] = self;
          void block[5] = v9;
          id v45 = v13;
          dispatch_async(dispatchQueue, block);
        }
LABEL_13:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v6);
  }

  unint64_t v15 = v34;
  uint64_t v16 = [v34 count];
  long long v17 = self->_dispatchQueue;
  if (v16)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3;
    v41[3] = &unk_1E605B5D8;
    v41[4] = v34;
    v41[5] = self;
    dispatch_async(v17, v41);
    long long v18 = v33;
    if (self->_compressionEnabled)
    {
      id v39 = 0;
      unint64_t v40 = 0;
      long long v19 = [(RPFileTransferSession *)self _encodeAndCompressObject:v34 originalSize:&v40 error:&v39];
      id v20 = v39;
      uint64_t v21 = v20;
      if (v19)
      {
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressedBytes, [v19 length]);
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressedBytes, v40);
        v54[0] = v19;
        v53[0] = &unk_1F0C37588;
        v53[1] = @"_i";
        uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v33, "taskID"));
        v54[1] = v22;
        v53[2] = &unk_1F0C375A0;
        long long v23 = [NSNumber numberWithUnsignedLong:v40];
        v54[2] = v23;
        long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];

        unint64_t v15 = v34;
        long long v18 = v33;

        if (v24)
        {
LABEL_28:
          id v28 = self->_dispatchQueue;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_428;
          v35[3] = &unk_1E605CC98;
          v35[4] = self;
          id v36 = v18;
          id v37 = v24;
          int v38 = v15;
          id v29 = v24;
          id v30 = v18;
          dispatch_async(v28, v35);

          goto LABEL_29;
        }
      }
      else
      {
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressedBytes, v40);
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressedBytes, v40);
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressibleChunks, 1uLL);
        if (v20)
        {
          atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressionErrors, 1uLL);
          int var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            int v31 = objc_msgSend(v33, "taskID", v31);
            uint64_t v32 = v21;
            LogPrintF();
          }
        }
      }
    }
    v51[0] = @"_i";
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "taskID", v31, v32));
    v51[1] = &unk_1F0C375B8;
    v52[0] = v27;
    v52[1] = v15;
    long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];

    goto LABEL_28;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2;
  v42[3] = &unk_1E605B5D8;
  long long v18 = v33;
  v42[4] = self;
  id v43 = v33;
  id v25 = v33;
  dispatch_async(v17, v42);

LABEL_29:
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeItem:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesSendTaskEnd:*(void *)(a1 + 40) error:0];
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "fileSize", (void)v10) < 1) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = [v7 fileSize];
        }
        *(void *)(*(void *)(a1 + 40) + 312) += v8;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t result = [*(id *)(a1 + 32) count];
  *(void *)(*(void *)(a1 + 40) + 328) += result;
  return result;
}

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_428(void *a1)
{
  id v2 = *(id *)(a1[4] + 64);
  if ([v2 state] == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_431;
    v9[3] = &unk_1E605CC70;
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[4];
    uint64_t v5 = (void *)a1[5];
    v9[4] = a1[7];
    void v9[5] = v4;
    id v10 = v5;
    [v2 sendEncryptedRequestID:@"_ftSm" request:v3 xpcID:0 options:0 responseHandler:v9];
  }
  else
  {
    uint64_t v7 = (void *)a1[4];
    uint64_t v6 = a1[5];
    RPErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 _smallFilesSendTaskEnd:v6 error:v8];
  }
}

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_431(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "fileSize", (void)v13) < 1) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = [v11 fileSize];
        }
        *(void *)(*(void *)(a1 + 40) + 304) += v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  *(void *)(*(void *)(a1 + 40) + 320) += [*(id *)(a1 + 32) count];
  *(unsigned char *)(*(void *)(a1 + 40) + 336) = 1;
  [*(id *)(a1 + 40) _smallFilesSendTaskEnd:*(void *)(a1 + 48) error:v5];
}

- (id)_smallFilesSendTaskReadItem:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 itemURL];
  uint64_t v8 = [v7 fileSystemRepresentation];

  if (v8)
  {
    uint64_t v9 = -[RPFileTransferSession _readPath:size:error:](self, "_readPath:size:error:", v8, [v6 fileSize], a4);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
      CC_SHA256((const void *)[v11 bytes], objc_msgSend(v11, "length"), md);
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
      [v6 setSha256HashData:v12];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v13 setObject:v11 forKeyedSubscript:&unk_1F0C375D0];
      [v13 setObject:v12 forKeyedSubscript:@"_s2"];
      long long v14 = [v6 filename];
      if (v14) {
        [v13 setObject:v14 forKeyedSubscript:&unk_1F0C375E8];
      }

      uint64_t v15 = [v6 fileSize];
      if (v15)
      {
        long long v16 = [NSNumber numberWithLongLong:v15];
        [v13 setObject:v16 forKeyedSubscript:&unk_1F0C37600];
      }
      long long v17 = [v6 metadata];
      if (v17) {
        [v13 setObject:v17 forKeyedSubscript:&unk_1F0C37618];
      }

      id v23 = 0;
      uint64_t v18 = [(RPFileTransferSession *)self _modTimeForFileWithPath:v8 error:&v23];
      id v19 = v23;
      id v20 = v19;
      if (v18)
      {
        [v13 addEntriesFromDictionary:v18];
        id v21 = v13;
      }
      else
      {
        id v21 = 0;
        if (a4) {
          *a4 = v19;
        }
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else if (a4)
  {
    RPErrorF();
    id v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)_smallFilesSendTaskEnd:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_smallFilesSendTasks containsObject:v6])
  {
    if (!self->_invalidateCalled && [v7 code] == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = [v6 taskID];
        id v18 = v7;
        LogPrintF();
      }
      objc_msgSend(v6, "setNeedsRetry:", 1, v17, v18);
      goto LABEL_31;
    }
    int v10 = self->_ucat->var0;
    if (v7)
    {
      if (v10 > 90 || v10 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      uint64_t v17 = [v6 taskID];
      id v18 = v7;
    }
    else
    {
      if (v10 > 10 || v10 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      uint64_t v17 = [v6 taskID];
    }
    LogPrintF();
LABEL_23:
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = objc_msgSend(v6, "fileItems", v17, v18, 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [(RPFileTransferSession *)self _completeItemDirect:*(void *)(*((void *)&v19 + 1) + 8 * i) error:v7];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [(NSMutableSet *)self->_smallFilesSendTasks removeObject:v6];
    [(RPFileTransferSession *)self _processFinish];
    long long v16 = [v6 queue];
    [(RPFileTransferSession *)self _ioQueueEnqueue:v16];

    [(RPFileTransferSession *)self _scheduleItems];
    goto LABEL_31;
  }
  int v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    [v6 taskID];
    LogPrintF();
  }
LABEL_31:
}

- (void)_smallFilesReceiveRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v41 = v5;
  unint64_t v40 = NSDictionaryGetNSNumber();
  uint64_t v7 = [v40 unsignedLongLongValue];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  id v62 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke;
  void v53[3] = &unk_1E605CCC0;
  v55 = &v57;
  uint64_t v56 = v7;
  v53[4] = self;
  uint64_t v36 = v7;
  id v37 = v6;
  id v54 = v37;
  long long v35 = (void (**)(void))MEMORY[0x1B3EBCC80](v53);
  if (self->_fileWritesOutstanding >= 0x32)
  {
    uint64_t v31 = RPErrorF();
    id v39 = (void *)v58[5];
    v58[5] = v31;

    goto LABEL_36;
  }
  CFDataGetTypeID();
  int v38 = CFDictionaryGetTypedValue();
  if (!v38)
  {
    CFArrayGetTypeID();
    int v10 = CFDictionaryGetTypedValue();
    if (!v10)
    {
      uint64_t v33 = RPErrorF();
      id v34 = (void *)v58[5];
      v58[5] = v33;

      goto LABEL_35;
    }
    goto LABEL_8;
  }
  int v52 = 0;
  uint64_t Int64 = CFDictionaryGetInt64();
  if (!Int64)
  {
    uint64_t v32 = RPErrorF();
    int v10 = (void *)v58[5];
    v58[5] = v32;
    goto LABEL_39;
  }
  int v9 = (id *)(v58 + 5);
  id obj = (id)v58[5];
  int v10 = [(RPFileTransferSession *)self _decompressAndDecodeData:v38 originalSize:Int64 error:&obj];
  objc_storeStrong(v9, obj);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = RPErrorF();
      uint64_t v12 = (void *)v58[5];
      v58[5] = v11;

LABEL_39:
      goto LABEL_35;
    }
LABEL_8:
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v42 = v10;
    uint64_t v13 = [(RPFileTransferSmallFilesTask *)v42 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v42);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v26 = RPErrorF();
            uint64_t v27 = (void *)v58[5];
            v58[5] = v26;

            id v28 = v42;
            goto LABEL_34;
          }
          uint64_t v17 = objc_alloc_init(RPFileTransferItem);
          CFDataGetTypeID();
          id v18 = CFDictionaryGetTypedValue();
          if (v18) {
            [(RPFileTransferItem *)v17 setFileData:v18];
          }
          CFStringGetTypeID();
          long long v19 = CFDictionaryGetTypedValue();
          if (v19) {
            [(RPFileTransferItem *)v17 setFilename:v19];
          }
          int v52 = 0;
          uint64_t v20 = CFDictionaryGetInt64();
          if (!v52) {
            [(RPFileTransferItem *)v17 setFileSize:v20];
          }
          CFDictionaryGetTypeID();
          long long v21 = CFDictionaryGetTypedValue();
          if (v21) {
            [(RPFileTransferItem *)v17 setMetadata:v21];
          }
          long long v22 = CFDictionaryGetCFDataOfLength();
          if (v22) {
            [(RPFileTransferItem *)v17 setSha256HashData:v22];
          }
          [v43 addObject:v17];
          if ([(RPFileTransferSession *)self isResumable])
          {
            id v23 = [(RPFileTransferSession *)self resumeState];
            uint64_t v24 = [[RPFileTransferResumeStateItem alloc] initWithFileTransferRequestDict:v16];
            [v23 addActiveFile:v24];
            [v23 scheduleStateFileFlush];
          }
        }
        uint64_t v13 = [(RPFileTransferSmallFilesTask *)v42 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    int var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v43 count];
      LogPrintF();
    }
    id v28 = objc_alloc_init(RPFileTransferSmallFilesTask);
    [(RPFileTransferSmallFilesTask *)v28 setFileItems:v43];
    id v29 = [(RPFileTransferSession *)self _ioQueueDequeue];
    [(RPFileTransferSmallFilesTask *)v28 setQueue:v29];

    [(RPFileTransferSmallFilesTask *)v28 setTaskID:v36];
    [(NSMutableDictionary *)self->_smallFilesReceiveTasks setObject:v28 forKeyedSubscript:v40];
    ++self->_fileWritesOutstanding;
    id v30 = [(RPFileTransferSmallFilesTask *)v28 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2;
    block[3] = &unk_1E605BD68;
    void block[4] = self;
    void block[5] = v28;
    id v46 = v37;
    dispatch_async(v30, block);

LABEL_34:
  }
LABEL_35:

LABEL_36:
  v35[2](v35);

  _Block_object_dispose(&v57, 8);
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesReceiveTaskRun:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (void)_smallFilesReceiveTaskRun:(id)a3 responseHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v6 fileItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0;
    uint64_t v14 = v11;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
      id v25 = v14;
      BOOL v16 = [(RPFileTransferSession *)self _smallFilesReceiveTaskFileItem:v15 error:&v25];
      id v11 = v25;

      if (!v16) {
        break;
      }
      ++v13;
      uint64_t v14 = v11;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke;
  block[3] = &unk_1E605BEA8;
  void block[4] = self;
  id v22 = v6;
  id v23 = v11;
  id v24 = v7;
  id v18 = v7;
  id v19 = v11;
  id v20 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _smallFilesReceiveTaskComplete:*(void *)(a1 + 40) error:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
}

- (BOOL)_smallFilesReceiveTaskFileItem:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 sha256HashData];
  if ([v7 length] == 32)
  {
    uint64_t v8 = [v6 fileData];
    [v6 setFileData:0];
    id v9 = v8;
    CC_SHA256((const void *)[v9 bytes], objc_msgSend(v9, "length"), md);
    uint64_t v10 = (void *)[v7 bytes];
    if (*(void *)md == *v10 && v23 == v10[1] && v24 == v10[2] && v25 == v10[3])
    {
      uint64_t v14 = -[RPFileTransferSession _openWriteFileItem:size:error:](self, "_openWriteFileItem:size:error:", v6, [v9 length], a4);
      uint64_t v15 = v14;
      if ((v14 & 0x80000000) == 0)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke;
        v20[3] = &__block_descriptor_36_e5_v8__0l;
        int v21 = v14;
        BOOL v16 = (void (**)(void))MEMORY[0x1B3EBCC80](v20);
        BOOL v18 = 1;
        if ([v9 length])
        {
          id v17 = v9;
          if (!-[RPFileTransferSession _writeFD:buffer:size:error:](self, "_writeFD:buffer:size:error:", v15, [v17 bytes], objc_msgSend(v17, "length"), a4))BOOL v18 = 0; {
        }
          }
        v16[2](v16);

        goto LABEL_18;
      }
    }
    else if (a4)
    {
      RPErrorF();
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    RPErrorF();
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

uint64_t __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_smallFilesReceiveTaskComplete:(id)a3 error:(id)a4 responseHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 taskID];
  smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
  uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v11];
  [(NSMutableDictionary *)smallFilesReceiveTasks setObject:0 forKeyedSubscript:v13];

  uint64_t v14 = [v8 queue];
  [(RPFileTransferSession *)self _ioQueueEnqueue:v14];

  --self->_fileWritesOutstanding;
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    RPErrorF();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v25);
    [(RPFileTransferSession *)self _updateSmallFilesTaskResumeState:v8 error:v25];
LABEL_24:

    goto LABEL_27;
  }
  if (!v9)
  {
    id v17 = [v8 fileItems];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v22 fileSize] < 1) {
            unint64_t v23 = 0;
          }
          else {
            unint64_t v23 = [v22 fileSize];
          }
          *(int64x2_t *)&self->_progressCurrentBytes = vaddq_s64(*(int64x2_t *)&self->_progressCurrentBytes, vdupq_n_s64(v23));
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v19);
    }
    *(int64x2_t *)&self->_progressCurrentFiles = vaddq_s64(*(int64x2_t *)&self->_progressCurrentFiles, vdupq_n_s64([v17 count]));
    self->_progressDirty = 1;
    int v24 = self->_ucat->var0;
    if (v24 <= 9 && (v24 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v33 = v11;
      LogPrintF();
    }
    uint64_t v26 = objc_msgSend(v8, "fileItems", v33);
    [(RPFileTransferSession *)self _processReceivedItems:v26 responseHandler:v10];

    [(RPFileTransferSession *)self _updateSmallFilesTaskResumeState:v8 error:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v17;
    uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          uint64_t v32 = [v31 fileSize];
          self->_metricTotalBytes += [v31 metadataSize] + v32;
        }
        uint64_t v28 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);
    }

    self->_metricTotalFiles += [v25 count];
    self->_unint64_t metricLastFileCompletionTicks = mach_absolute_time();
    goto LABEL_24;
  }
  int v16 = self->_ucat->var0;
  if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v9);
  [(RPFileTransferSession *)self _updateSmallFilesTaskResumeState:v8 error:v9];
LABEL_27:
}

- (void)_updateSmallFilesTaskResumeState:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(RPFileTransferSession *)self isResumable])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v6;
    id v8 = [v6 fileItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          uint64_t v14 = [(RPFileTransferSession *)self resumeState];
          uint64_t v15 = [v13 filename];
          int v16 = [v14 activeFileWithFileName:v15];

          if (v16)
          {
            if (v7) {
              uint64_t v17 = 0;
            }
            else {
              uint64_t v17 = [v13 fileSize];
            }
            [v16 setBytesWritten:v17];
            [v16 setError:v7];
            [v14 removeActiveFile:v16];
            [v14 addFinishedFile:v16];
            [v14 scheduleStateFileFlush];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v6 = v18;
  }
}

- (id)_largeFileSendTaskCreate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_addedItems;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      if ([v8 estimatedSize] > (unint64_t)self->_prefSmallFilesMaxBytes) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v10 = v8;

    if (!v10)
    {
      uint64_t v9 = 0;
      goto LABEL_17;
    }
    [(NSMutableSet *)self->_addedItems removeObject:v10];
    uint64_t v9 = objc_alloc_init(RPFileTransferLargeFileSendTask);
    [(RPFileTransferLargeFileSendTask *)v9 setFileFD:0xFFFFFFFFLL];
    [(RPFileTransferLargeFileSendTask *)v9 setFileOffset:0];
    [(RPFileTransferLargeFileSendTask *)v9 setFileItem:v10];
    uint64_t v11 = [(RPFileTransferSession *)self _ioQueueDequeue];
    [(RPFileTransferLargeFileSendTask *)v9 setQueue:v11];

    ++self->_taskIDLast;
    -[RPFileTransferLargeFileSendTask setTaskID:](v9, "setTaskID:");
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [(RPFileTransferLargeFileSendTask *)v9 taskID];
      [(NSMutableSet *)v10 fileID];
      [(NSMutableSet *)v10 fileSize];
      [(NSMutableSet *)v10 metadataSize];
      LogPrintF();
    }
  }
  else
  {
LABEL_9:
    uint64_t v9 = 0;
    uint64_t v10 = v3;
  }

LABEL_17:
  return v9;
}

- (void)_largeFileSendTaskStart:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  long long v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__2;
  id v45 = __Block_byref_object_dispose__2;
  id v46 = 0;
  uint64_t v5 = [v4 fileItem];
  uint64_t v6 = [v5 itemURL];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke;
  v38[3] = &unk_1E605CD08;
  long long v40 = &v41;
  v38[4] = self;
  v38[5] = v6;
  uint64_t v7 = (char *)v4;
  long long v39 = v7;
  id v8 = (void (**)(void))MEMORY[0x1B3EBCC80](v38);
  v7[8] = 0;
  uint64_t v9 = [v7 fileItem];
  *((void *)v7 + 3) = [v9 fileSize];

  *((_DWORD *)v7 + 4) = 0;
  *((_DWORD *)v7 + 8) = 0;
  ++*((_DWORD *)v7 + 35);
  id v10 = v6;
  uint64_t v11 = [v10 fileSystemRepresentation];
  if (!v11)
  {
    uint64_t v29 = RPErrorF();
    id v30 = v42[5];
    void v42[5] = (id)v29;

    goto LABEL_17;
  }
  uint64_t v12 = [v7 fileItem];
  if ([v12 fileSize] < 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = [v7 fileItem];
    uint64_t v14 = [v13 fileSize];
  }
  if ([(RPFileTransferSession *)self isResumable])
  {
    long long v15 = [(RPFileTransferSession *)self resumeState];
    long long v16 = [v7 fileItem];
    long long v17 = [v16 filename];
    id v18 = [v15 finishedFileWithFileName:v17];

    if (v18)
    {
      uint64_t v31 = [v18 fileName];
      FPrintF();

      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2;
      block[3] = &unk_1E605B5D8;
      void block[4] = self;
      long long v37 = v7;
      dispatch_async(dispatchQueue, block);

      goto LABEL_17;
    }
    long long v21 = [v7 fileItem];
    long long v22 = [v21 filename];
    unint64_t v23 = [v15 activeFileWithFileName:v22];

    if (v23)
    {
      uint64_t v24 = [v23 fileOffset];
      uint64_t v20 = [v23 bytesWritten] + v24;
      if (v20)
      {
        id v25 = [v10 path];
        int v33 = [v23 sourceFileItemUsable:v25];

        if (v33)
        {
          uint64_t v32 = [v23 fileName];
          FPrintF();

          objc_msgSend(v7, "setFileOffset:", v20, v32, v20);
        }
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v26 = self->_dispatchQueue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3;
  v35[3] = &unk_1E605CD30;
  v35[4] = self;
  void v35[5] = v20;
  v35[6] = v14;
  dispatch_async(v26, v35);
  uint64_t v27 = v42;
  id obj = v42[5];
  uint64_t v28 = [(RPFileTransferSession *)self _openReadPath:v11 error:&obj];
  objc_storeStrong(v27 + 5, obj);
  if ((v28 & 0x80000000) == 0)
  {
    [v7 setFileFD:v28];
    CC_SHA256_Init((CC_SHA256_CTX *)(v7 + 36));
    [(RPFileTransferSession *)self _largeFileSendTaskNext:v7 xid:*((unsigned int *)v7 + 35)];
  }
LABEL_17:
  v8[2](v8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 56);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    int v2 = (void *)result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[19];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = (_DWORD **)v2[4], uint64_t v1 = v2[7], v5))
      {
        LogPrintF();
        uint64_t v3 = (_DWORD **)v2[4];
        uint64_t v1 = v2[7];
      }
    }
    uint64_t v6 = v2[6];
    uint64_t v7 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _largeFileSendTaskFailed:v6 error:v7];
  }
  return result;
}

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskEnd:*(void *)(a1 + 40) error:0];
}

void *__49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3(void *result)
{
  *(void *)(result[4] + 304) += result[5];
  *(void *)(result[4] + 312) += result[6];
  ++*(void *)(result[4] + 328);
  return result;
}

- (void)_largeFileSendTaskNext:(id)a3 xid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = (char *)a3;
  uint64_t v7 = (void *)MEMORY[0x1B3EBCA50]();
  if (*((_DWORD *)v6 + 35) == v4)
  {
    c = (CC_SHA256_CTX *)(v6 + 36);
    while (1)
    {
      if (v6[8] || *((_DWORD *)v6 + 4) >= self->_prefLargeFileMaxOutstanding) {
        goto LABEL_21;
      }
      unint64_t v8 = *((void *)v6 + 3);
      if (!v8)
      {
        int v21 = *((_DWORD *)v6 + 8);
        if ((v21 & 2) == 0)
        {
          *((_DWORD *)v6 + 8) = v21 | 2;
          [(RPFileTransferSession *)self _largeFileSendTaskSend:v6 data:0 end:1 xid:v4];
        }
        goto LABEL_22;
      }
      if (v8 >= self->_largeFileBufferBytes) {
        unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
      }
      else {
        unint64_t largeFileBufferBytes = *((void *)v6 + 3);
      }
      uint64_t v10 = objc_msgSend(v6, "fileFD", c);
      id v23 = 0;
      uint64_t v11 = [(RPFileTransferSession *)self _readFD:v10 size:largeFileBufferBytes error:&v23];
      id v12 = v23;
      if (!v11)
      {
        [(RPFileTransferSession *)self _largeFileSendTaskFailed:v6 error:v12];

        goto LABEL_21;
      }
      *((void *)v6 + 3) -= largeFileBufferBytes;
      id v13 = v11;
      CC_SHA256_Update(c, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
      uint64_t v14 = [v6 fileOffset];
      if (!v14) {
        break;
      }
      unint64_t v15 = v14;
      long long v16 = [v6 fileItem];
      uint64_t v17 = [v16 fileSize];

      uint64_t v18 = *((void *)v6 + 3);
      if (v17 - v18 > v15)
      {
        unint64_t v19 = v17 - v18 - largeFileBufferBytes;
        if (v15 <= v19) {
          goto LABEL_15;
        }
        uint64_t v20 = objc_msgSend(v13, "subdataWithRange:", v15 - v19, objc_msgSend(v13, "length") - (v15 - v19));
        [(RPFileTransferSession *)self _largeFileSendTaskSend:v6 data:v20 end:*((void *)v6 + 3) == 0 xid:v4];
      }
LABEL_16:

      uint64_t v7 = (void *)MEMORY[0x1B3EBCA50]();
      if (*((_DWORD *)v6 + 35) != v4) {
        goto LABEL_21;
      }
    }
    uint64_t v18 = *((void *)v6 + 3);
LABEL_15:
    [(RPFileTransferSession *)self _largeFileSendTaskSend:v6 data:v13 end:v18 == 0 xid:v4];
    goto LABEL_16;
  }
LABEL_21:
LABEL_22:
}

- (void)_largeFileSendTaskSend:(id)a3 data:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  BOOL v7 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "taskID"));
  [v12 setObject:v13 forKeyedSubscript:@"_i"];

  if (v11)
  {
    if (self->_compressionEnabled)
    {
      unint64_t v14 = [v11 length];
      id v47 = 0;
      unint64_t v15 = [(RPFileTransferSession *)self _compressData:v11 error:&v47];
      id v16 = v47;
      uint64_t v17 = v16;
      if (v15)
      {
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressedBytes, [v15 length]);
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressedBytes, v14);
        [v12 setObject:v15 forKeyedSubscript:&unk_1F0C37588];
        uint64_t v18 = [NSNumber numberWithUnsignedLong:v14];
        [v12 setObject:v18 forKeyedSubscript:&unk_1F0C375A0];

        goto LABEL_12;
      }
      atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressedBytes, v14);
      atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressedBytes, v14);
      atomic_fetch_add((atomic_ullong *volatile)&self->_metricUncompressibleChunks, 1uLL);
      if (v16)
      {
        atomic_fetch_add((atomic_ullong *volatile)&self->_metricCompressionErrors, 1uLL);
        int var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v38 = [v10 taskID];
          long long v39 = v17;
          LogPrintF();
        }
      }
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, &unk_1F0C375D0, v38, v39);
  }
LABEL_12:
  uint64_t v20 = [v10 fileItem];
  int v21 = v20;
  if ((v10[32] & 1) == 0)
  {
    long long v22 = [v20 filename];
    if (v22) {
      [v12 setObject:v22 forKeyedSubscript:&unk_1F0C375E8];
    }

    uint64_t v23 = [v21 fileSize];
    if (v23)
    {
      uint64_t v24 = [NSNumber numberWithLongLong:v23];
      [v12 setObject:v24 forKeyedSubscript:&unk_1F0C37600];
    }
    id v25 = [v21 metadata];
    if (v25) {
      [v12 setObject:v25 forKeyedSubscript:&unk_1F0C37618];
    }

    uint64_t v26 = [v10 fileOffset];
    if (v26)
    {
      uint64_t v27 = [NSNumber numberWithUnsignedLongLong:v26];
      [v12 setObject:v27 forKeyedSubscript:@"_fOff"];
    }
    id v28 = [v21 itemURL];
    uint64_t v29 = [v28 fileSystemRepresentation];

    id v46 = 0;
    id v30 = [(RPFileTransferSession *)self _modTimeForFileWithPath:v29 error:&v46];
    id v31 = v46;
    if (v30) {
      [v12 addEntriesFromDictionary:v30];
    }
    *((_DWORD *)v10 + 8) |= 1u;

    if (!v7)
    {
      uint64_t v32 = 1;
      goto LABEL_29;
    }
    uint64_t v32 = 3;
LABEL_27:
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 36));
    int v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
    [v21 setSha256HashData:v33];
    [v12 setObject:v33 forKeyedSubscript:@"_s2"];
    *((_DWORD *)v10 + 8) |= 2u;

LABEL_29:
    long long v34 = [NSNumber numberWithUnsignedInt:v32];
    [v12 setObject:v34 forKeyedSubscript:&unk_1F0C37630];

    goto LABEL_30;
  }
  if (v7)
  {
    uint64_t v32 = 2;
    goto LABEL_27;
  }
LABEL_30:
  atomic_fetch_add((atomic_uint *volatile)v10 + 4, 1u);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke;
  block[3] = &unk_1E605CDA8;
  void block[4] = self;
  id v41 = v10;
  id v42 = v12;
  id v43 = v11;
  BOOL v45 = v7;
  unsigned int v44 = a6;
  id v36 = v11;
  long long v37 = v10;
  dispatch_async(dispatchQueue, block);
}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  if ([v2 state] == 1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3;
    v7[3] = &unk_1E605CD80;
    void v7[4] = *(void *)(a1 + 32);
    uint64_t v3 = &v8;
    uint64_t v4 = *(void *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    char v11 = *(unsigned char *)(a1 + 68);
    uint64_t v9 = *(id *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    [v2 sendEncryptedRequestID:@"_ftLg" request:v4 xpcID:0 options:0 responseHandler:v7];
    int v5 = v9;
  }
  else
  {
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 40) + 16), 0xFFFFFFFF);
    int v5 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2;
    block[3] = &unk_1E605CD58;
    uint64_t v6 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    uint64_t v3 = &v13;
    id v13 = v6;
    BOOL v14 = v2 != 0;
    dispatch_async(v5, block);
  }
}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  RPErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _largeFileSendTaskFailed:v2 error:v3];
}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5 = *(void **)(a1 + 40);
  id v6 = a4;
  *(void *)(*(void *)(a1 + 32) + 304) += [v5 length];
  if (*(unsigned char *)(a1 + 60)) {
    ++*(void *)(*(void *)(a1 + 32) + 320);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 336) = 1;
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 48) + 16), 0xFFFFFFFF);
  [*(id *)(a1 + 32) _largeFileSendTaskResponse:*(void *)(a1 + 48) error:v6 end:*(unsigned __int8 *)(a1 + 60) xid:*(unsigned int *)(a1 + 56)];
}

- (void)_largeFileSendTaskFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6[8])
  {
    v6[8] = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke;
    block[3] = &unk_1E605C3D8;
    void block[4] = self;
    int v10 = v6;
    id v11 = v7;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskEnd:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_largeFileSendTaskResponse:(id)a3 error:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (self->_invalidateCalled)
  {
    if (v11)
    {
      if (!v7) {
        goto LABEL_10;
      }
    }
    else
    {
      id v12 = RPErrorF();
      if (!v7)
      {
LABEL_10:
        id v16 = [v10 queue];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke;
        v23[3] = &unk_1E605C3D8;
        v23[4] = self;
        id v24 = v10;
        id v25 = v12;
        id v14 = v12;
        dispatch_async(v16, v23);

        unint64_t v15 = v24;
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  else if (!v7)
  {
    id v13 = [v10 queue];
    if (!v12)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3;
      v17[3] = &unk_1E605CDD0;
      v17[4] = self;
      id v18 = v10;
      unsigned int v19 = a6;
      dispatch_async(v13, v17);

      goto LABEL_12;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2;
    block[3] = &unk_1E605C3D8;
    void block[4] = self;
    id v21 = v10;
    id v22 = v12;
    id v14 = v12;
    dispatch_async(v13, block);

    unint64_t v15 = v21;
    goto LABEL_11;
  }
  [(RPFileTransferSession *)self _largeFileSendTaskEnd:v10 error:v12];

LABEL_12:
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskFailed:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskFailed:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileSendTaskNext:*(void *)(a1 + 40) xid:*(unsigned int *)(a1 + 48)];
}

- (void)_largeFileSendTaskEnd:(id)a3 error:(id)a4
{
  unint64_t v15 = a3;
  id v6 = a4;
  int v7 = v15[3];
  if ((v7 & 0x80000000) == 0)
  {
    if (close(v7) && *__error()) {
      __error();
    }
    v15[3] = -1;
  }
  if (-[NSMutableSet containsObject:](self->_largeFileSendTasks, "containsObject:"))
  {
    if (!self->_invalidateCalled && [v6 code] == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v13 = [v15 taskID];
        id v14 = v6;
        LogPrintF();
      }
      objc_msgSend(v15, "setNeedsRetry:", 1, v13, v14);
      goto LABEL_29;
    }
    int v10 = self->_ucat->var0;
    if (v6)
    {
      if (v10 > 90 || v10 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
      uint64_t v13 = [v15 taskID];
      id v14 = v6;
    }
    else
    {
      if (v10 > 10 || v10 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_28;
      }
      uint64_t v13 = [v15 taskID];
    }
    LogPrintF();
LABEL_28:
    id v11 = objc_msgSend(v15, "fileItem", v13, v14);
    [(RPFileTransferSession *)self _completeItemDirect:v11 error:v6];

    [(NSMutableSet *)self->_largeFileSendTasks removeObject:v15];
    [(RPFileTransferSession *)self _processFinish];
    id v12 = [v15 queue];
    [(RPFileTransferSession *)self _ioQueueEnqueue:v12];

    [(RPFileTransferSession *)self _scheduleItems];
    goto LABEL_29;
  }
  int v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    [v15 taskID];
    LogPrintF();
  }
LABEL_29:
}

- (void)_largeFileReceiveRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSDictionaryGetNSNumber();
  uint64_t v61 = 0;
  id v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000;
  uint64_t v64 = __Block_byref_object_copy__2;
  v65 = __Block_byref_object_dispose__2;
  id v66 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke;
  v58[3] = &unk_1E605CDF8;
  v60 = &v61;
  v58[4] = self;
  v58[5] = v8;
  id v9 = v7;
  id v59 = v9;
  int v10 = (void (**)(void))MEMORY[0x1B3EBCC80](v58);
  if (!v8 || self->_fileWritesOutstanding >= 0x32)
  {
    uint64_t v34 = RPErrorF();
    id v14 = v62[5];
    v62[5] = (id)v34;
    goto LABEL_41;
  }
  CFDataGetTypeID();
  id v11 = CFDictionaryGetTypedValue();
  if (v11)
  {
    int v57 = 0;
    uint64_t Int64 = CFDictionaryGetInt64();
    if (!Int64)
    {
      uint64_t v35 = RPErrorF();
      id v36 = v62[5];
      v62[5] = (id)v35;

      id v14 = 0;
      goto LABEL_40;
    }
    uint64_t v13 = v62;
    id obj = v62[5];
    id v14 = [(RPFileTransferSession *)self _decompressData:v11 originalSize:Int64 error:&obj];
    objc_storeStrong(v13 + 5, obj);
    id v47 = v14;
    if (!v14) {
      goto LABEL_40;
    }
  }
  else
  {
    CFDataGetTypeID();
    id v47 = CFDictionaryGetTypedValue();
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  largeFileReceiveTasks = self->_largeFileReceiveTasks;
  if (Int64Ranged)
  {
    id v46 = v10;
    uint64_t v21 = [(NSMutableDictionary *)largeFileReceiveTasks objectForKeyedSubscript:v8];
    if (v21)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      {
        long long v39 = v8;
        LogPrintF();
      }
      -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v21, v39);
      [(NSMutableDictionary *)self->_largeFileReceiveTasks setObject:0 forKeyedSubscript:v8];
    }
    unsigned int v44 = v11;
    BOOL v45 = v9;
    uint64_t v23 = objc_alloc_init(RPFileTransferItem);
    CFStringGetTypeID();
    uint64_t v24 = CFDictionaryGetTypedValue();
    if (v24) {
      [(RPFileTransferItem *)v23 setFilename:v24];
    }
    id v43 = (void *)v24;
    int v57 = 0;
    uint64_t v25 = CFDictionaryGetInt64();
    if (!v57) {
      [(RPFileTransferItem *)v23 setFileSize:v25];
    }
    CFDictionaryGetTypeID();
    uint64_t v26 = CFDictionaryGetTypedValue();
    if (v26) {
      [(RPFileTransferItem *)v23 setMetadata:v26];
    }
    if ((Int64Ranged & 2) != 0)
    {
      uint64_t v27 = CFDictionaryGetCFDataOfLength();
      if (v27) {
        [(RPFileTransferItem *)v23 setSha256HashData:v27];
      }
    }
    if ([(RPFileTransferSession *)self isResumable])
    {
      id v28 = [(RPFileTransferSession *)self resumeState];
      uint64_t v29 = [[RPFileTransferResumeStateItem alloc] initWithFileTransferRequestDict:v6];
      [v28 addActiveFile:v29];
      [v28 scheduleStateFileFlush];
    }
    int v30 = self->_ucat->var0;
    if (v30 <= 10 && (v30 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v40 = v25;
      uint64_t v41 = [v26 count];
      long long v39 = v8;
      LogPrintF();
    }
    id v42 = (void *)v21;
    id v31 = objc_alloc_init(RPFileTransferLargeFileReceiveTask);
    [(RPFileTransferLargeFileReceiveTask *)v31 setFileFD:0xFFFFFFFFLL];
    [(RPFileTransferLargeFileReceiveTask *)v31 setFileItem:v23];
    uint64_t v32 = [(RPFileTransferSession *)self _ioQueueDequeue];
    [(RPFileTransferLargeFileReceiveTask *)v31 setQueue:v32];

    -[RPFileTransferLargeFileReceiveTask setTaskID:](v31, "setTaskID:", [v8 unsignedLongLongValue]);
    [(NSMutableDictionary *)self->_largeFileReceiveTasks setObject:v31 forKeyedSubscript:v8];
    ++self->_fileWritesOutstanding;
    int v33 = [(RPFileTransferLargeFileReceiveTask *)v31 queue];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    void v52[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2;
    v52[3] = &unk_1E605CE20;
    v52[4] = self;
    v52[5] = v31;
    id v14 = v47;
    id v53 = v14;
    int v55 = Int64Ranged;
    id v9 = v45;
    id v54 = v45;
    dispatch_async(v33, v52);

    int v10 = v46;
    id v11 = v44;
    if ((Int64Ranged & 2) == 0) {
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v17 = [(NSMutableDictionary *)largeFileReceiveTasks objectForKeyedSubscript:v8];
    if (!v17)
    {
      uint64_t v37 = RPErrorF();
      id v38 = v62[5];
      v62[5] = (id)v37;

      id v14 = v47;
      goto LABEL_40;
    }
    if ((Int64Ranged & 2) != 0)
    {
      id v18 = CFDictionaryGetCFDataOfLength();
      if (v18)
      {
        unsigned int v19 = [v17 fileItem];
        [v19 setSha256HashData:v18];
      }
    }
    ++self->_fileWritesOutstanding;
    uint64_t v20 = [v17 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3;
    block[3] = &unk_1E605CE20;
    void block[4] = self;
    void block[5] = v17;
    id v14 = v47;
    id v49 = v14;
    int v51 = Int64Ranged;
    id v50 = v9;
    dispatch_async(v20, block);

    if ((Int64Ranged & 2) == 0) {
      goto LABEL_40;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_largeFileReceiveTasks, "setObject:forKeyedSubscript:", 0, v8, v39, v40, v41);
  id v14 = v47;
LABEL_40:

LABEL_41:
  v10[2](v10);

  _Block_object_dispose(&v61, 8);
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v3();
  }
  return result;
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileReceiveTaskRun:*(void *)(a1 + 40) data:*(void *)(a1 + 48) sendFlags:*(unsigned int *)(a1 + 64) responseHandler:*(void *)(a1 + 56)];
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _largeFileReceiveTaskRun:*(void *)(a1 + 40) data:*(void *)(a1 + 48) sendFlags:*(unsigned int *)(a1 + 64) responseHandler:*(void *)(a1 + 56)];
}

- (void)_resumeStateReceiveRequest:(id)a3 responseHandler:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(RPFileTransferSession *)self isResumable])
  {
    id v6 = [(RPFileTransferSession *)self resumeState];
    if ([v6 isEmpty])
    {
      id v7 = 0;
    }
    else
    {
      id v8 = [v6 dictionaryRepresentation];
      id v9 = @"resumeState";
      v10[0] = v8;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
  }
  else
  {
    id v7 = 0;
  }
  (*((void (**)(id, void *, void, void))v5 + 2))(v5, v7, 0, 0);
}

- (void)_largeFileReceiveTaskRun:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 responseHandler:(id)a6
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  int v10 = (char *)a3;
  id v11 = a4;
  id v12 = a6;
  if ((a5 & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v13 = [v10 fileItem];
  if ([v13 fileSize] < 1)
  {
    dispatch_queue_t queue = 0;
  }
  else
  {
    id v14 = [v10 fileItem];
    dispatch_queue_t queue = (dispatch_queue_t)[v14 fileSize];
  }
  CC_SHA256_Init((CC_SHA256_CTX *)(v10 + 12));
  if (![(RPFileTransferSession *)self isResumable]) {
    goto LABEL_11;
  }
  unint64_t v15 = [(RPFileTransferSession *)self resumeState];
  id v16 = [v10 fileItem];
  uint64_t v17 = [v16 filename];
  id v18 = [v15 activeFileWithFileName:v17];

  if (!v18)
  {

LABEL_11:
    off_t v19 = 0;
    goto LABEL_12;
  }
  off_t v19 = [v18 fileOffset];

  if (v19)
  {
    id v111 = 0;
    BOOL v20 = [(RPFileTransferSession *)self _largeFileReceiveTaskUpdateSHA256CtxFromFileItem:v10 length:v19 error:&v111];
    id v21 = v111;
    id v22 = v21;
    if (!v20)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke;
      block[3] = &unk_1E605B768;
      void block[4] = self;
      v106 = v10;
      id v107 = v22;
      id v109 = v12;
      id v108 = v11;
      unsigned int v110 = a5;
      id v39 = v22;
      dispatch_async(dispatchQueue, block);

      uint64_t v40 = v106;
LABEL_52:

      goto LABEL_53;
    }

    uint64_t v23 = 0;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v23 = 1;
LABEL_13:
  int v24 = *((_DWORD *)v10 + 2);
  if ((v24 & 0x80000000) == 0)
  {
    if (close(v24) && *__error()) {
      __error();
    }
    *((_DWORD *)v10 + 2) = -1;
  }
  uint64_t v25 = [v10 fileItem];
  id v104 = 0;
  uint64_t v26 = -[RPFileTransferSession _openWriteFileItem:size:truncate:error:](self, "_openWriteFileItem:size:truncate:error:", v25, [v11 length], v23, &v104);
  id v27 = v104;

  if ((v26 & 0x80000000) != 0)
  {
    int v30 = self->_dispatchQueue;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2;
    v98[3] = &unk_1E605B768;
    v98[4] = self;
    id v31 = (id *)&v99;
    v99 = v10;
    uint64_t v32 = &v100;
    id v33 = v27;
    id v100 = v33;
    uint64_t v34 = &v102;
    id v102 = v12;
    uint64_t v35 = &v101;
    id v101 = v11;
    unsigned int v103 = a5;
    id v36 = v98;
    uint64_t v37 = v30;
LABEL_29:
    dispatch_async(v37, v36);

    goto LABEL_53;
  }
  [v10 setFileFD:v26];
  if ((v23 & 1) == 0)
  {
    id v97 = v27;
    BOOL v28 = [(RPFileTransferSession *)self _truncateFD:v26 size:v19 error:&v97];
    id v29 = v97;

    if (v28 && lseek(v26, v19, 0) == -1)
    {
      if (*__error()) {
        __error();
      }
      uint64_t v41 = RPErrorF();

      id v29 = (id)v41;
    }
    if (v29)
    {
      queuea = self->_dispatchQueue;
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3;
      v91[3] = &unk_1E605B768;
      v91[4] = self;
      id v31 = (id *)&v92;
      v92 = v10;
      uint64_t v32 = &v93;
      id v33 = v29;
      id v93 = v33;
      uint64_t v34 = &v95;
      id v95 = v12;
      uint64_t v35 = &v94;
      id v94 = v11;
      unsigned int v96 = a5;
      id v36 = v91;
      uint64_t v37 = queuea;
      goto LABEL_29;
    }
    id v27 = 0;
  }
  id v42 = self->_dispatchQueue;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4;
  v90[3] = &unk_1E605CD30;
  v90[4] = self;
  v90[5] = v19;
  v90[6] = queue;
  dispatch_async(v42, v90);

LABEL_32:
  if ((*((_DWORD *)v10 + 2) & 0x80000000) != 0)
  {
    id v50 = RPErrorF();
    int v51 = self->_dispatchQueue;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5;
    v84[3] = &unk_1E605B768;
    v84[4] = self;
    v85 = v10;
    v86 = v50;
    id v88 = v12;
    id v87 = v11;
    unsigned int v89 = a5;
    dispatch_async(v51, v84);

    goto LABEL_53;
  }
  uint64_t v43 = [v11 length];
  if (!v43) {
    goto LABEL_36;
  }
  uint64_t v44 = [v10 fileFD];
  id v45 = v11;
  id v83 = 0;
  BOOL v46 = -[RPFileTransferSession _writeFD:buffer:size:error:](self, "_writeFD:buffer:size:error:", v44, [v45 bytes], v43, &v83);
  id v47 = v83;
  if (!v46)
  {
    uint64_t v61 = self->_dispatchQueue;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6;
    v77[3] = &unk_1E605B768;
    v77[4] = self;
    v78 = v10;
    id v79 = v47;
    id v81 = v12;
    id v80 = v45;
    unsigned int v82 = a5;
    id v39 = v47;
    dispatch_async(v61, v77);

    uint64_t v40 = v78;
    goto LABEL_52;
  }
  id v48 = v45;
  CC_SHA256_Update((CC_SHA256_CTX *)(v10 + 12), (const void *)[v48 bytes], objc_msgSend(v48, "length"));

LABEL_36:
  if ((a5 & 2) != 0)
  {
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 12));
    int v52 = [v10 fileItem];
    id v53 = [v52 sha256HashData];

    if ([v53 length] != 32
      || ((id v54 = v53, v55 = (void *)[v54 bytes], *(void *)md == *v55)
        ? (BOOL v56 = v113 == v55[1])
        : (BOOL v56 = 0),
          v56 ? (BOOL v57 = v114 == v55[2]) : (BOOL v57 = 0),
          v57 ? (BOOL v58 = v115 == v55[3]) : (BOOL v58 = 0),
          !v58))
    {
      id v59 = RPErrorF();
      v60 = self->_dispatchQueue;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7;
      v71[3] = &unk_1E605B768;
      v71[4] = self;
      v72 = v10;
      v73 = v59;
      id v75 = v12;
      id v74 = v11;
      unsigned int v76 = a5;
      dispatch_async(v60, v71);

      goto LABEL_53;
    }
  }
  id v49 = self->_dispatchQueue;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8;
  v64[3] = &unk_1E605CE48;
  v64[4] = self;
  uint64_t v68 = v43;
  unsigned int v69 = a5;
  char v70 = (a5 & 2) >> 1;
  v65 = v10;
  id v67 = v12;
  id v66 = v11;
  dispatch_async(v49, v64);

LABEL_53:
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

void *__81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4(void *result)
{
  *(void *)(result[4] + 304) += result[5];
  *(void *)(result[4] + 312) += result[6];
  ++*(void *)(result[4] + 328);
  return result;
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:*(void *)(a1 + 48) complete:0 responseHandler:*(void *)(a1 + 64)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _updateLargeFilesTaskResumeState:v3 data:v5 sendFlags:v4 error:v6 complete:0];
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 304) += *(void *)(a1 + 64);
  if ((*(unsigned char *)(a1 + 72) & 2) != 0) {
    ++*(void *)(*(void *)(a1 + 32) + 320);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 336) = 1;
  if (*(unsigned char *)(a1 + 76))
  {
    int v2 = [*(id *)(a1 + 40) fileItem];
    if ([*(id *)(a1 + 32) isResumable])
    {
      uint64_t v3 = [*(id *)(a1 + 32) resumeState];
      uint64_t v4 = [*(id *)(a1 + 40) fileItem];
      uint64_t v5 = [v4 filename];
      uint64_t v6 = [v3 activeFileWithFileName:v5];

      if (v6) {
        uint64_t v7 = [v6 fileOffset];
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v9 = [v2 fileSize];
    *(void *)(*(void *)(a1 + 32) + 536) += v9 - v7 + [v2 metadataSize];
    ++*(void *)(*(void *)(a1 + 32) + 544);
    *(void *)(*(void *)(a1 + 32) + 400) = mach_absolute_time();

    BOOL v8 = *(unsigned char *)(a1 + 76) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  [*(id *)(a1 + 32) _largeFileReceiveTaskRespond:*(void *)(a1 + 40) error:0 complete:v8 responseHandler:*(void *)(a1 + 56)];
  int v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(unsigned int *)(a1 + 72);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 76);
  return [v10 _updateLargeFilesTaskResumeState:v11 data:v12 sendFlags:v13 error:0 complete:v14];
}

- (BOOL)_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v22 = a5;
  uint64_t v7 = (char *)a3;
  BOOL v8 = [v7 fileItem];
  id v30 = 0;
  int v9 = [(RPFileTransferSession *)self _openReadFileItem:v8 error:&v30];
  id v10 = v30;

  if (v9 < 0)
  {
    if (v22)
    {
      id v10 = v10;
      BOOL v16 = 0;
      id *v22 = v10;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke;
    v28[3] = &__block_descriptor_36_e5_v8__0l;
    unsigned int v25 = v9;
    int v29 = v9;
    uint64_t v23 = v7;
    int v24 = (void (**)(void))MEMORY[0x1B3EBCC80](v28);
    unint64_t v11 = 0;
    uint64_t v26 = self;
    unint64_t largeFileBufferBytes = self->_largeFileBufferBytes;
    unint64_t v13 = a4;
    if (largeFileBufferBytes >= a4) {
      unint64_t v14 = a4;
    }
    else {
      unint64_t v14 = largeFileBufferBytes;
    }
    unint64_t v15 = (CC_SHA256_CTX *)(v7 + 12);
    while (1)
    {
      BOOL v16 = v13 <= v11;
      if (v13 <= v11) {
        break;
      }
      uint64_t v17 = (void *)MEMORY[0x1B3EBCA50]();
      if (v14 >= v13 - v11) {
        unint64_t v14 = v13 - v11;
      }
      id v27 = v10;
      id v18 = -[RPFileTransferSession _readFD:size:error:](v26, "_readFD:size:error:", v25, v14, &v27, v22);
      id v20 = v27;

      if (v18)
      {
        id v19 = v18;
        CC_SHA256_Update(v15, (const void *)[v19 bytes], objc_msgSend(v19, "length"));
        v11 += v14;
      }
      else if (v22)
      {
        id *v22 = v20;
      }

      id v10 = v20;
      if (!v18) {
        goto LABEL_16;
      }
    }
    id v20 = v10;
LABEL_16:
    v24[2](v24);

    id v10 = v20;
    uint64_t v7 = v23;
  }

  return v16;
}

uint64_t __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_largeFileReceiveTaskRespond:(id)a3 error:(id)a4 complete:(BOOL)a5 responseHandler:(id)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void (**)(void, void, void, void))v11;
  if (v7)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10)
    {
      unint64_t v14 = v19;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_11;
        }
        unint64_t v14 = v19;
      }
      uint64_t v17 = [v14 taskID];
      LogPrintF();
    }
LABEL_11:
    BOOL v16 = objc_msgSend(v19, "fileItem", v17);
    [(RPFileTransferSession *)self _processReceivedItem:v16 responseHandler:v12];

    goto LABEL_14;
  }
  if (!v10)
  {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x1E4F1CC08], 0, 0);
    goto LABEL_15;
  }
  int v15 = self->_ucat->var0;
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = [v19 taskID];
    id v18 = v10;
    LogPrintF();
  }
  ((void (**)(void, void, void, id))v12)[2](v12, 0, 0, v10);
LABEL_14:
  -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v19, v17, v18);
LABEL_15:
  --self->_fileWritesOutstanding;
}

- (void)_largeFileReceiveTaskInvalidate:(id)a3
{
  id v11 = a3;
  int v4 = [v11 fileFD];
  if ((v4 & 0x80000000) == 0)
  {
    if (close(v4))
    {
      if (*__error())
      {
        uint64_t v5 = *__error();
        if (!v5) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v5 = 4294960596;
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = [v11 taskID];
        LogPrintF();
        objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v9, v5);
        goto LABEL_12;
      }
    }
LABEL_11:
    objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v8, v10);
  }
LABEL_12:
  BOOL v7 = [v11 queue];
  [(RPFileTransferSession *)self _ioQueueEnqueue:v7];
}

- (void)_updateLargeFilesTaskResumeState:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 error:(id)a6 complete:(BOOL)a7
{
  char v8 = a5;
  id v17 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(RPFileTransferSession *)self isResumable])
  {
    unint64_t v13 = [(RPFileTransferSession *)self resumeState];
    unint64_t v14 = [v17 fileItem];
    int v15 = [v14 filename];
    BOOL v16 = [v13 activeFileWithFileName:v15];

    if (!v16)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (v12)
    {
      if ([v12 code] == -71143
        || [v12 code] == -6753
        || [v12 code] == -6722)
      {
        objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
LABEL_12:
        [v13 scheduleStateFileFlush];
        goto LABEL_13;
      }
      [v16 setError:v12];
    }
    else
    {
      objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
      if ((v8 & 2) == 0) {
        goto LABEL_12;
      }
    }
    [v13 removeActiveFile:v16];
    [v13 addFinishedFile:v16];
    goto LABEL_12;
  }
LABEL_14:
}

- (id)_compressData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  size_t v6 = [v5 length];
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v18 = 0;
  id v18 = malloc_type_malloc(v6, 0xD5B2B35DuLL);
  if (v16[3])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__RPFileTransferSession__compressData_error___block_invoke;
    v14[3] = &unk_1E605CE70;
    v14[4] = &v15;
    BOOL v7 = (void (**)(void))MEMORY[0x1B3EBCC80](v14);
    size_t v8 = compression_encode_buffer((uint8_t *)v16[3], v6, (const uint8_t *)[v5 bytes], v6, 0, COMPRESSION_LZ4);
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v10 = (void *)[v9 initWithBytesNoCopy:v16[3] length:v8 freeWhenDone:1];
      id v11 = v10;
      if (v10)
      {
        v16[3] = 0;
        id v12 = v10;
      }
      else if (a4)
      {
        RPErrorF();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v11 = 0;
      if (a4) {
        *a4 = 0;
      }
    }
    v7[2](v7);
  }
  else if (a4)
  {
    RPErrorF();
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __45__RPFileTransferSession__compressData_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1) {
    free(v1);
  }
}

- (id)_decompressData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v20 = 0;
  id v20 = malloc_type_malloc(a4, 0xD5C9BB85uLL);
  if (v18[3])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke;
    v16[3] = &unk_1E605CE70;
    v16[4] = &v17;
    size_t v8 = (void (**)(void))MEMORY[0x1B3EBCC80](v16);
    id v9 = (uint8_t *)v18[3];
    id v10 = v7;
    if (compression_decode_buffer(v9, a4, (const uint8_t *)[v10 bytes], objc_msgSend(v10, "length"), 0, COMPRESSION_LZ4) == a4)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v12 = (void *)[v11 initWithBytesNoCopy:v18[3] length:a4 freeWhenDone:1];
      unint64_t v13 = v12;
      if (v12)
      {
        v18[3] = 0;
        id v14 = v12;
      }
      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5)
    {
      RPErrorF();
      unint64_t v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v13 = 0;
    }
    v8[2](v8);
  }
  else if (a5)
  {
    RPErrorF();
    unint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v13 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1) {
    free(v1);
  }
}

- (id)_encodeAndCompressObject:(id)a3 originalSize:(unint64_t *)a4 error:(id *)a5
{
  int v15 = 0;
  size_t v8 = (void *)MEMORY[0x1B3EBC190](a3, 0, &v15);
  id v9 = v8;
  if (!v8)
  {
    if (a5) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  unint64_t v10 = [v8 length];
  if (!v10)
  {
    if (a5)
    {
LABEL_12:
      RPErrorF();
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_13:
    id v12 = 0;
    goto LABEL_6;
  }
  *a4 = v10;
  id v11 = [(RPFileTransferSession *)self _compressData:v9 error:a5];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }

LABEL_6:
  return v12;
}

- (id)_decompressAndDecodeData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  size_t v6 = -[RPFileTransferSession _decompressData:originalSize:error:](self, "_decompressData:originalSize:error:", a3, a4);
  if (v6)
  {
    id v7 = (void *)OPACKDecodeData();
    size_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else if (a5)
    {
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return v8;
}

- (id)_ioQueueDequeue
{
  uint64_t v3 = [(NSMutableArray *)self->_ioQueues popFirstObject];
  if (!v3)
  {
    uint64_t v4 = self->_metricTotalIOQueues + 1;
    self->_metricTotalIOQueues = v4;
    targetID = self->_targetID;
    uint64_t v11 = v4;
    NSPrintF();
    id v5 = objc_claimAutoreleasedReturnValue();
    size_t v6 = (const char *)objc_msgSend(v5, "UTF8String", targetID, v11);

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v3 = dispatch_queue_create(v6, v7);

    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  return v3;
}

- (void)_ioQueueEnqueue:(id)a3
{
}

- (int)_openReadFileItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NSString *)self->_receiveFileParentPath stringByStandardizingPath];
  if (v7)
  {
    size_t v8 = [v6 filename];
    if (v8)
    {
      id v9 = [v7 stringByAppendingPathComponent:v8];
      id v10 = [v9 stringByStandardizingPath];

      if (([v10 hasPrefix:v7] & 1) == 0)
      {
        if (a4)
        {
          RPErrorF();
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        int v11 = -1;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v12 = atomic_fetch_add((atomic_ullong *volatile)&self->_fileIDLastReceive, 1uLL) + 1;
      id v10 = (id)[[NSString alloc] initWithFormat:@"%@/%llu.rpftf", v7, v12];
    }
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v10 isDirectory:0];
    [v6 setItemURL:v13];

    id v10 = v10;
    int v11 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", [v10 fileSystemRepresentation], a4);
LABEL_9:

    goto LABEL_10;
  }
  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v11 = -1;
LABEL_10:

  return v11;
}

- (int)_openReadPath:(const char *)a3 error:(id *)a4
{
  int v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0 || *__error() && !*__error())
  {
    if (fcntl(v6, 48, 1))
    {
      if (*__error())
      {
        uint64_t v7 = *__error();
        if (!v7) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v7 = 4294960596;
      }
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = v7;
        LogPrintF();
      }
    }
LABEL_16:
    if (fcntl(v6, 45, 1, v11) && (!*__error() || *__error()))
    {
      int v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    return v6;
  }
  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return [(RPFileTransferSession *)self _openWriteFileItem:a3 size:a4 truncate:0 error:a5];
}

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [(NSString *)self->_receiveFileParentPath stringByStandardizingPath];
  if (v11)
  {
    unint64_t v12 = [v10 filename];
    if (v12)
    {
      id v13 = [v11 stringByAppendingPathComponent:v12];
      id v14 = [v13 stringByStandardizingPath];

      if (([v14 hasPrefix:v11] & 1) == 0)
      {
        if (a6)
        {
          RPErrorF();
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        int v15 = -1;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v16 = atomic_fetch_add((atomic_ullong *volatile)&self->_fileIDLastReceive, 1uLL) + 1;
      id v14 = (void *)[[NSString alloc] initWithFormat:@"%@/%llu.rpftf", v11, v16];
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v14 isDirectory:0];
    [v10 setItemURL:v17];

    int v15 = [(RPFileTransferSession *)self _openWritePath:v14 size:a4 truncate:v7 error:a6];
LABEL_9:

    goto LABEL_10;
  }
  if (a6)
  {
    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v15 = -1;
LABEL_10:

  return v15;
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return [(RPFileTransferSession *)self _openWritePath:a3 size:a4 truncate:0 error:a5];
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = (const char *)[v10 UTF8String];
  if (!v11)
  {
    if (!a6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v12 = v11;
  if (v7) {
    int v13 = open(v11, 1537, 384);
  }
  else {
    int v13 = open(v11, 513, 384);
  }
  int v14 = v13;
  if (v13 < 0)
  {
    if (*__error())
    {
      int v15 = *__error();
      if (v15 == 2)
      {
        unint64_t v16 = [v10 stringByDeletingLastPathComponent];
        uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v29 = 0;
        char v18 = [v17 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v29];
        id v19 = v29;

        if ((v18 & 1) == 0)
        {
          if (a6)
          {
            RPNestedErrorF();
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_13;
        }
        int v14 = open(v12, 1537, 384);
        if (v14 < 0)
        {
          if (*__error()) {
            int v15 = *__error();
          }
          else {
            int v15 = -6700;
          }
        }
        else
        {
          int v15 = 0;
        }
      }
      if (!v15) {
        goto LABEL_19;
      }
    }
    if (!a6)
    {
LABEL_13:
      int v14 = -1;
      goto LABEL_45;
    }
LABEL_12:
    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_19:
  if (a4 < 1) {
    goto LABEL_45;
  }
  if (fcntl(v14, 48, 1))
  {
    if (*__error())
    {
      uint64_t v20 = *__error();
      if (!v20) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v20 = 4294960596;
    }
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v26 = v20;
      LogPrintF();
    }
  }
LABEL_29:
  if (fcntl(v14, 76, 1, v26))
  {
    if (*__error())
    {
      uint64_t v22 = *__error();
      if (!v22) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v22 = 4294960596;
    }
    int v23 = self->_ucat->var0;
    if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = v22;
      LogPrintF();
    }
  }
LABEL_38:
  v28[2] = a4;
  v28[3] = 0;
  v28[0] = 0x300000002;
  v28[1] = 0;
  if (fcntl(v14, 42, v28, v27) && (!*__error() || *__error()))
  {
    int v24 = self->_ucat->var0;
    if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_45:

  return v14;
}

- (id)_readPath:(const char *)a3 size:(unint64_t)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v8 = [(RPFileTransferSession *)self _openReadPath:a3 error:a5];
    if ((v8 & 0x80000000) != 0)
    {
      id v10 = 0;
    }
    else
    {
      int v9 = v8;
      id v10 = [(RPFileTransferSession *)self _readFD:v8 size:a4 error:a5];
      close(v9);
    }
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3, 0, a5);
  }
  return v10;
}

- (id)_readFD:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v19 = 0;
  id v19 = malloc_type_malloc(a4, 0x825A35FFuLL);
  if (v17[3])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__RPFileTransferSession__readFD_size_error___block_invoke;
    v15[3] = &unk_1E605CE70;
    v15[4] = &v16;
    int v9 = (void (**)(void))MEMORY[0x1B3EBCC80](v15);
    if ([(RPFileTransferSession *)self _readFD:v7 buffer:v17[3] size:a4 error:a5])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v11 = (void *)[v10 initWithBytesNoCopy:v17[3] length:a4 freeWhenDone:1];
      unint64_t v12 = v11;
      if (v11)
      {
        v17[3] = 0;
        id v13 = v11;
      }
      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      unint64_t v12 = 0;
    }
    v9[2](v9);
  }
  else if (a5)
  {
    RPErrorF();
    unint64_t v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v12 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __44__RPFileTransferSession__readFD_size_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1) {
    free(v1);
  }
}

- (BOOL)_readFD:(int)a3 buffer:(char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  if (!a5) {
    return 1;
  }
  size_t v7 = a5;
  while (1)
  {
    ssize_t v10 = read(a3, a4, v7);
    if (v10 >= 1)
    {
      a4 += v10;
      v7 -= v10;
      goto LABEL_8;
    }
    if (!v10)
    {
      if (a6) {
        goto LABEL_14;
      }
      return 0;
    }
    if (!*__error() || *__error() != 4) {
      break;
    }
LABEL_8:
    if (!v7) {
      return 1;
    }
  }
  if (a6)
  {
LABEL_14:
    RPErrorF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a6 = v12;
    return result;
  }
  return 0;
}

- (BOOL)_writeFD:(int)a3 buffer:(const char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  if (!a5) {
    return 1;
  }
  size_t v7 = a5;
  while (1)
  {
    ssize_t v10 = write(a3, a4, v7);
    if (v10 < 1) {
      break;
    }
    a4 += v10;
    v7 -= v10;
LABEL_7:
    if (!v7) {
      return 1;
    }
  }
  if (*__error() && *__error() == 4) {
    goto LABEL_7;
  }
  if (!a6) {
    return 0;
  }
  RPErrorF();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)_truncateFD:(int)a3 size:(int64_t)a4 error:(id *)a5
{
  int v6 = ftruncate(a3, a4);
  if (v6)
  {
    if (!*__error())
    {
      if (!a5) {
        return v6 == 0;
      }
      goto LABEL_4;
    }
    __error();
    if (a5)
    {
LABEL_4:
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (id)_modTimeForFileWithPath:(const char *)a3 error:(id *)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(&v10, 0, sizeof(v10));
    if (!stat(a3, &v10) || *__error() && !*__error())
    {
      uint64_t tv_nsec = v10.st_mtimespec.tv_nsec;
      v11[0] = @"_fMt";
      int v6 = [NSNumber numberWithLong:v10.st_mtimespec.tv_sec];
      v11[1] = @"_fMtNs";
      v12[0] = v6;
      size_t v7 = [NSNumber numberWithLong:tv_nsec];
      v12[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

      goto LABEL_6;
    }
    if (a4) {
      goto LABEL_10;
    }
  }
  else if (a4)
  {
LABEL_10:
    RPErrorF();
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_6:
  return v8;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (unint64_t)debugFlags
{
  return self->_debugFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlowControlChangedHandler:(id)a3
{
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)largeFileBufferBytes
{
  return self->_largeFileBufferBytes;
}

- (unint64_t)maxLargeFileTasks
{
  return self->_maxLargeFileTasks;
}

- (unint64_t)maxSmallFileTasks
{
  return self->_maxSmallFileTasks;
}

- (NSData)peerPublicKey
{
  return self->_peerPublicKey;
}

- (void)setPeerPublicKey:(id)a3
{
}

- (RPFileTransferProgress)progressCurrent
{
  return self->_progressCurrent;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (double)progressHandlerTimeInterval
{
  return self->_progressHandlerTimeInterval;
}

- (void)setProgressHandlerTimeInterval:(double)a3
{
  self->_progressHandlerTimeInterval = a3;
}

- (id)receivedItemHandler
{
  return self->_receivedItemHandler;
}

- (void)setReceivedItemHandler:(id)a3
{
}

- (id)receivedItemsHandler
{
  return self->_receivedItemsHandler;
}

- (void)setReceivedItemsHandler:(id)a3
{
}

- (NSData)selfPublicKey
{
  return self->_selfPublicKey;
}

- (void)setSelfPublicKey:(id)a3
{
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (NSData)selfSecretKey
{
  return self->_selfSecretKey;
}

- (void)setSelfSecretKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfSecretKey, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong((id *)&self->_selfPublicKey, 0);
  objc_storeStrong(&self->_receivedItemsHandler, 0);
  objc_storeStrong(&self->_receivedItemHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_progressCurrent, 0);
  objc_storeStrong((id *)&self->_peerPublicKey, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_flowControlChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_resumeState, 0);
  objc_storeStrong((id *)&self->_largeFileSendTasks, 0);
  objc_storeStrong((id *)&self->_largeFileReceiveTasks, 0);
  objc_storeStrong((id *)&self->_smallFilesSendTasks, 0);
  objc_storeStrong((id *)&self->_smallFilesReceiveTasks, 0);
  objc_storeStrong((id *)&self->_receiveFileParentPath, 0);
  objc_storeStrong((id *)&self->_ioQueues, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_selfIdentity, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_peerIdentity, 0);
  objc_storeStrong((id *)&self->_controlRetryTimer, 0);
  objc_storeStrong((id *)&self->_controlCnx, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_bonjourCoalescer, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end