@interface RPNearFieldDaemonController
+ (id)_legacyApplicationLabels;
- (BOOL)_supportsApplicationLabel:(id)a3;
- (BOOL)enabled;
- (BOOL)hasCurrentTransaction;
- (BOOL)isActive;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (RPNFCTransaction)currentTransaction;
- (RPNFCTransactionController)transactionController;
- (RPNearFieldContext)currentContext;
- (RPNearFieldDaemonController)initWithConnection:(id)a3 dispatchQueue:(id)a4;
- (RPNearFieldDataSource)dataSource;
- (id)_convertToLegacyApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4;
- (id)_convertToUpdatedApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4;
- (id)_createAuthenticationPayload;
- (id)_createValidationPayload;
- (id)_payloadForType:(int64_t)a3;
- (id)_remoteObjectProxy;
- (id)transactionChangedHandler;
- (id)transactionController:(id)a3 requestMessageForType:(int64_t)a4;
- (id)transactionController:(id)a3 responseMessageForRequestMessage:(id)a4;
- (id)transactionController:(id)a3 tapEventForApplicationLabel:(id)a4 singleBandAWDLModeRequested:(BOOL)a5 pkData:(id)a6 bonjourListenerUUID:(id)a7 identity:(id)a8;
- (int64_t)currentPreferredPollingType;
- (unsigned)_flagsForVersion:(id)a3;
- (void)_clearCurrentTransaction;
- (void)_startTransactionControllerIfNeeded;
- (void)_stopTransactionControllerIfNeeded;
- (void)didChangeStateForTransaction:(id)a3;
- (void)invalidate;
- (void)invalidateTransactionWithIdentifier:(id)a3;
- (void)invalidateTransactionWithIdentifier:(id)a3 context:(id)a4;
- (void)setConnection:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentPreferredPollingType:(int64_t)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setTransactionChangedHandler:(id)a3;
- (void)startPolling:(int64_t)a3 context:(id)a4;
- (void)stop;
- (void)transactionController:(id)a3 didBeginTransaction:(id)a4;
- (void)transactionController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4;
- (void)transactionController:(id)a3 didFinishTransaction:(id)a4 error:(id)a5;
@end

@implementation RPNearFieldDaemonController

+ (id)_legacyApplicationLabels
{
  if (qword_100142C48 != -1) {
    dispatch_once(&qword_100142C48, &stru_100122888);
  }
  v2 = (void *)qword_100142C40;

  return v2;
}

- (RPNearFieldDaemonController)initWithConnection:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPNearFieldDaemonController;
  v9 = [(RPNearFieldDaemonController *)&v13 init];
  if (v9)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    v10 = [[RPNearFieldDataSource alloc] initWithDispatchQueue:v8];
    dataSource = v9->_dataSource;
    v9->_dataSource = v10;
  }
  return v9;
}

- (void)invalidate
{
  if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPNearFieldDaemonController *)self stop];
  v3 = [(RPNearFieldDaemonController *)self connection];
  [v3 invalidate];

  [(RPNearFieldDaemonController *)self setConnection:0];

  [(RPNearFieldDaemonController *)self setTransactionChangedHandler:0];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v3)
    {
      [(RPNearFieldDaemonController *)self _startTransactionControllerIfNeeded];
    }
    else
    {
      [(RPNearFieldDaemonController *)self _stopTransactionControllerIfNeeded];
    }
  }
}

- (BOOL)hasCurrentTransaction
{
  v2 = self;
  BOOL v3 = [(RPNearFieldDaemonController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(RPNearFieldDaemonController *)v2 currentTransaction];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  id v18 = a4;
  if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
  {
    v16 = [v18 applicationLabel];
    int64_t v17 = a3;
    LogPrintF();
  }
  if (![(RPNearFieldDaemonController *)self isActive]) {
    goto LABEL_15;
  }
  id v6 = [(RPNearFieldDaemonController *)self currentContext];
  id v7 = v18;
  id v8 = v7;
  if (v6 == v7) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = (v7 != 0) == (v6 == 0) ? 1 : [v6 isEqual:v7] ^ 1;
  }

  v10 = [(RPNearFieldDaemonController *)self transactionController];
  if (v10)
  {
    v11 = [(RPNearFieldDaemonController *)self transactionController];
    BOOL v12 = [v11 preferredPollingType] != (id)a3;
  }
  else
  {
    BOOL v12 = 0;
  }

  if (((v9 | v12) & 1) == 0)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
LABEL_15:
    [(RPNearFieldDaemonController *)self setCurrentContext:v18];
    [(RPNearFieldDaemonController *)self setCurrentPreferredPollingType:a3];
    [(RPNearFieldDaemonController *)self setIsActive:1];
    objc_super v13 = [(RPNearFieldDaemonController *)self currentTransaction];

    if (v13)
    {
      v14 = [(RPNearFieldDaemonController *)self currentTransaction];
      v15 = [v14 identifier];
      [(RPNearFieldDaemonController *)self invalidateTransactionWithIdentifier:v15];
    }
    else
    {
      [(RPNearFieldDaemonController *)self _startTransactionControllerIfNeeded];
    }
  }
}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  if (self->_currentPreferredPollingType != a3)
  {
    self->_currentPreferredPollingType = a3;
    id v4 = [(RPNearFieldDaemonController *)self transactionController];
    [v4 setPreferredPollingType:a3];
  }
}

- (void)stop
{
  if ([(RPNearFieldDaemonController *)self isActive])
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNearFieldDaemonController *)self setIsActive:0];
    [(RPNearFieldDaemonController *)self setCurrentContext:0];
    [(RPNearFieldDaemonController *)self setCurrentPreferredPollingType:0];
    [(RPNearFieldDaemonController *)self _stopTransactionControllerIfNeeded];
    BOOL v3 = [(RPNearFieldDaemonController *)self currentTransaction];

    if (v3)
    {
      id v5 = [(RPNearFieldDaemonController *)self currentTransaction];
      id v4 = [v5 identifier];
      [(RPNearFieldDaemonController *)self invalidateTransactionWithIdentifier:v4];
    }
  }
}

- (void)invalidateTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNearFieldDaemonController *)self currentContext];
  [(RPNearFieldDaemonController *)self invalidateTransactionWithIdentifier:v4 context:v5];
}

- (void)invalidateTransactionWithIdentifier:(id)a3 context:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
  {
    id v7 = [(RPNearFieldDaemonController *)self currentTransaction];
    v16 = [v7 identifier];
    id v17 = v6;
    id v15 = v18;
    LogPrintF();
  }
  -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", v6, v15, v16, v17);
  uint64_t v8 = [(RPNearFieldDaemonController *)self currentTransaction];
  if (!v8) {
    goto LABEL_17;
  }
  unsigned int v9 = (void *)v8;
  v10 = [(RPNearFieldDaemonController *)self currentTransaction];
  v11 = [v10 identifier];
  unsigned __int8 v12 = [v11 isEqual:v18];

  if (v12)
  {
    objc_super v13 = [(RPNearFieldDaemonController *)self transactionController];
    v14 = [(RPNearFieldDaemonController *)self currentTransaction];
    [v13 invalidateTransaction:v14];

    [(RPNearFieldDaemonController *)self _clearCurrentTransaction];
    [(RPNearFieldDaemonController *)self _startTransactionControllerIfNeeded];
  }
  else
  {
LABEL_17:
    if (dword_1001410E0 <= 90 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_startTransactionControllerIfNeeded
{
  BOOL v3 = [(RPNearFieldDaemonController *)self transactionController];
  unsigned __int8 v4 = [v3 isRunning];

  if ((v4 & 1) != 0 || ![(RPNearFieldDaemonController *)self isActive]) {
    return;
  }
  if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (![(RPNearFieldDaemonController *)self enabled])
  {
    if (dword_1001410E0 > 90 || dword_1001410E0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_14;
  }
  id v5 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (v5)
  {
    if (dword_1001410E0 > 90 || dword_1001410E0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_14:
    LogPrintF();
    return;
  }
  id v6 = [(RPNearFieldDaemonController *)self transactionController];

  if (!v6)
  {
    id v7 = [[RPNFCTransactionController alloc] initWithPreferredPollingType:[(RPNearFieldDaemonController *)self currentPreferredPollingType] dispatchQueue:self->_dispatchQueue];
    transactionController = self->_transactionController;
    self->_transactionController = v7;
  }
  unsigned int v9 = [(RPNearFieldDaemonController *)self transactionController];
  [v9 setDataSource:self];

  v10 = [(RPNearFieldDaemonController *)self transactionController];
  [v10 setDelegate:self];

  id v11 = [(RPNearFieldDaemonController *)self transactionController];
  [v11 start];
}

- (void)_stopTransactionControllerIfNeeded
{
  BOOL v3 = [(RPNearFieldDaemonController *)self transactionController];
  unsigned int v4 = [v3 isRunning];

  if (v4)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = [(RPNearFieldDaemonController *)self transactionController];
    [v5 setDataSource:0];

    id v6 = [(RPNearFieldDaemonController *)self transactionController];
    [v6 setDelegate:0];

    id v7 = [(RPNearFieldDaemonController *)self transactionController];
    [v7 stop];
  }
}

- (void)_clearCurrentTransaction
{
  if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(RPNearFieldDaemonController *)self currentTransaction];
    LogPrintF();
  }
  BOOL v3 = [(RPNearFieldDaemonController *)self currentTransaction];
  [v3 setDelegate:0];

  [(RPNearFieldDaemonController *)self setCurrentTransaction:0];
  unsigned int v4 = [(RPNearFieldDaemonController *)self transactionChangedHandler];

  if (v4)
  {
    id v6 = [(RPNearFieldDaemonController *)self transactionChangedHandler];
    v6[2]();
  }
}

- (id)_remoteObjectProxy
{
  v2 = [(RPNearFieldDaemonController *)self connection];
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_1001228A8];

  return v3;
}

- (void)didChangeStateForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (v5 == v4)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v4;
      LogPrintF();
    }
    if (objc_msgSend(v4, "state", v9) == (id)2)
    {
      id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
      id v7 = [v4 remoteIdentity];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100043E90;
      v10[3] = &unk_1001228D0;
      v10[4] = self;
      id v11 = v4;
      [v6 isContactValidForIdentity:v7 completionBlock:v10];
    }
    else
    {
      uint64_t v8 = [(RPNearFieldDaemonController *)self _remoteObjectProxy];
      [v8 didUpdateTransaction:v4];
    }
  }
}

- (void)transactionController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (!v6)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = [(RPNearFieldDaemonController *)self _remoteObjectProxy];
    [v7 didDetectDeviceNearbyWithInitiatorRole:v4];
  }
}

- (void)transactionController:(id)a3 didBeginTransaction:(id)a4
{
  id v10 = a4;
  id v5 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (!v5)
  {
    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = v10;
      LogPrintF();
    }
    -[RPNearFieldDaemonController setCurrentTransaction:](self, "setCurrentTransaction:", v10, v9);
    [v10 setDelegate:self];
    id v6 = [(RPNearFieldDaemonController *)self _remoteObjectProxy];
    [v6 didBeginTransaction:v10];

    id v7 = [(RPNearFieldDaemonController *)self transactionChangedHandler];

    if (v7)
    {
      uint64_t v8 = [(RPNearFieldDaemonController *)self transactionChangedHandler];
      v8[2]();
    }
  }
}

- (void)transactionController:(id)a3 didFinishTransaction:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v6 = [(RPNearFieldDaemonController *)self currentTransaction];

  id v7 = v9;
  if (v6 == v9)
  {
    if ([v9 state] == (id)2)
    {
      if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(RPNearFieldDaemonController *)self _stopTransactionControllerIfNeeded];
      }
      else
      {
        [(RPNearFieldDaemonController *)self _stopTransactionControllerIfNeeded];
      }
    }
    else
    {
      [(RPNearFieldDaemonController *)self _clearCurrentTransaction];
    }
    id v7 = v9;
  }
}

- (id)_createAuthenticationPayload
{
  BOOL v3 = [(RPNearFieldDaemonController *)self dataSource];
  BOOL v4 = [(RPNearFieldDaemonController *)self currentContext];
  id v5 = [v4 pkData];
  id v6 = [(RPNearFieldDaemonController *)self currentContext];
  id v7 = [v6 bonjourListenerUUID];
  uint64_t v8 = [v3 createAuthenticationPayloadWithPkData:v5 bonjourListenerUUID:v7];

  return v8;
}

- (BOOL)_supportsApplicationLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNearFieldDaemonController *)self currentContext];
  id v6 = [v5 supportedApplicationLabels];
  id v7 = [v6 count];

  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(RPNearFieldDaemonController *)self currentContext];
    id v9 = [v8 supportedApplicationLabels];

    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([v4 hasPrefix:*(void *)(*((void *)&v14 + 1) + 8 * i)])
          {
            if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            LOBYTE(v10) = 1;
            goto LABEL_17;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (id)_createValidationPayload
{
  BOOL v3 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (!v3 && dword_1001410E0 <= 115 && (dword_1001410E0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [(RPNearFieldDaemonController *)self currentTransaction];
  id v5 = [v4 remoteIdentity];
  BOOL v6 = v5 != 0;

  id v7 = [(RPNearFieldDaemonController *)self currentTransaction];
  uint64_t v8 = [v7 remoteAuthenticationMessage];
  id v9 = [v8 applicationLabel];

  BOOL v10 = [(RPNearFieldDaemonController *)self _supportsApplicationLabel:v9];
  uint64_t v11 = [(RPNearFieldDaemonController *)self dataSource];
  unsigned __int8 v12 = [v11 createValidationPayloadWithKnownIdentity:v6 supportsApplicationLabel:v10];

  return v12;
}

- (id)_payloadForType:(int64_t)a3
{
  if (sub_100055474(a3))
  {
    id v5 = [(RPNearFieldDaemonController *)self _createAuthenticationPayload];
  }
  else if (a3 == 2)
  {
    id v5 = [(RPNearFieldDaemonController *)self _createValidationPayload];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_convertToLegacyApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100142C58 != -1) {
    dispatch_once(&qword_100142C58, &stru_1001228F0);
  }
  id v7 = v5;
  id v8 = v7;
  if ([v6 isEqualToString:@"1.0"])
  {
    uint64_t v9 = [(id)qword_100142C50 objectForKeyedSubscript:v7];
    BOOL v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v7;
    }
    id v8 = v11;
  }

  return v8;
}

- (id)_convertToUpdatedApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100142C68 != -1) {
    dispatch_once(&qword_100142C68, &stru_100122910);
  }
  id v7 = v5;
  id v8 = v7;
  if ([v6 isEqualToString:@"1.0"])
  {
    uint64_t v9 = [(id)qword_100142C60 objectForKeyedSubscript:v7];
    BOOL v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v7;
    }
    id v8 = v11;
  }

  return v8;
}

- (id)transactionController:(id)a3 requestMessageForType:(int64_t)a4
{
  id v6 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (v6)
  {
    id v7 = [(RPNearFieldDaemonController *)self _payloadForType:a4];
    id v8 = @"1.1";
    if (a4 == 2)
    {
      uint64_t v9 = [(RPNearFieldDaemonController *)self currentTransaction];
      BOOL v10 = [v9 remoteAuthenticationMessage];
      uint64_t v11 = [v10 version];

      id v8 = (__CFString *)v11;
    }
    unsigned __int8 v12 = [(RPNearFieldDaemonController *)self currentContext];
    objc_super v13 = [v12 applicationLabel];
    long long v14 = [(RPNearFieldDaemonController *)self _convertToLegacyApplicationLabelIfNeeded:v13 forVersion:v8];

    if (dword_1001410E0 <= 30 && (dword_1001410E0 != -1 || _LogCategory_Initialize()))
    {
      v19 = v8;
      v20 = v14;
      int64_t v18 = a4;
      LogPrintF();
    }
    long long v16 = [(RPNearFieldDaemonController *)self dataSource];
    long long v15 = [v16 createRequestMessageWithApplicationLabel:v14 payload:v7];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)transactionController:(id)a3 responseMessageForRequestMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(RPNearFieldDaemonController *)self currentTransaction];

  if (v6)
  {
    id v7 = [v5 payload];
    id v8 = -[RPNearFieldDaemonController _payloadForType:](self, "_payloadForType:", [v7 type]);

    uint64_t v9 = [(RPNearFieldDaemonController *)self currentContext];
    BOOL v10 = [v9 applicationLabel];
    uint64_t v11 = [v5 version];
    unsigned __int8 v12 = [(RPNearFieldDaemonController *)self _convertToLegacyApplicationLabelIfNeeded:v10 forVersion:v11];

    objc_super v13 = [(RPNearFieldDaemonController *)self dataSource];
    long long v14 = [v13 createResponseWithApplicationLabel:v12 payload:v8 forRequestMessage:v5];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (id)transactionController:(id)a3 tapEventForApplicationLabel:(id)a4 singleBandAWDLModeRequested:(BOOL)a5 pkData:(id)a6 bonjourListenerUUID:(id)a7 identity:(id)a8
{
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  long long v17 = [(RPNearFieldDaemonController *)self currentTransaction];
  int64_t v18 = [v17 localValidationMessage];
  v19 = [v18 payload];

  v20 = [(RPNearFieldDaemonController *)self currentTransaction];
  v21 = [v20 remoteValidationMessage];
  v22 = [v21 payload];

  v23 = [v19 supportsApplicationLabel];
  LODWORD(v21) = [v23 BOOLValue];

  v45 = v13;
  BOOL v44 = v10;
  if (v21)
  {
    v24 = [v22 supportsApplicationLabel];

    if (v24)
    {
      v25 = [v22 supportsApplicationLabel];
      uint64_t v26 = [v25 BOOLValue] ^ 1;
    }
    else
    {
      v27 = [(RPNearFieldDaemonController *)self currentContext];
      v28 = [v27 applicationLabel];
      v25 = [(RPNearFieldDaemonController *)self _convertToLegacyApplicationLabelIfNeeded:v28 forVersion:@"1.0"];

      v29 = [(RPNearFieldDaemonController *)self currentTransaction];
      v30 = [v29 remoteValidationMessage];
      v43 = [v30 applicationLabel];

      v31 = [(id)objc_opt_class() _legacyApplicationLabels];
      if ([v31 containsObject:v25]) {
        unsigned int v32 = 0;
      }
      else {
        unsigned int v32 = [v25 hasPrefix:@"com.apple.airdrop"] ^ 1;
      }
      HIDWORD(v42) = v32;

      v33 = [(id)objc_opt_class() _legacyApplicationLabels];
      unsigned int v34 = [v33 containsObject:v43];

      uint64_t v26 = HIDWORD(v42) | v34 ^ 1;
    }
  }
  else
  {
    uint64_t v26 = 1;
  }
  v35 = [(RPNearFieldDaemonController *)self currentTransaction];
  v36 = [v35 remoteValidationMessage];
  v37 = [v36 version];

  v38 = [(RPNearFieldDaemonController *)self _convertToUpdatedApplicationLabelIfNeeded:v16 forVersion:v37];

  v39 = [(RPNearFieldDaemonController *)self dataSource];
  LODWORD(v42) = [(RPNearFieldDaemonController *)self _flagsForVersion:v37];
  v40 = [v39 createTapEventWithApplicationLabel:v38 singleBandAWDLModeRequested:v44 pkData:v15 bonjourListenerUUID:v14 identity:v45 isUnsupportedApplicationLabel:v26 flags:v42];

  return v40;
}

- (unsigned)_flagsForVersion:(id)a3
{
  return [a3 isEqualToString:@"1.1"];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (RPNearFieldDataSource)dataSource
{
  return self->_dataSource;
}

- (RPNFCTransactionController)transactionController
{
  return self->_transactionController;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_transactionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong(&self->_transactionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end