@interface RPNFCTransactionController
- (BOOL)_didReceiveAuthenticationResponseWithResult:(id)a3 error:(id)a4;
- (BOOL)_didReceiveValidationResponseWithResult:(id)a3 error:(id)a4;
- (BOOL)isRunning;
- (BOOL)pendingInitiator;
- (BOOL)pendingReceiver;
- (NFConnectionHandoverInitiator)initiator;
- (NFConnectionHandoverReceiver)receiver;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)becomeInitiatorTimer;
- (OS_dispatch_source)connectToReceiverTimer;
- (OS_dispatch_source)initiatorLimitTimer;
- (OS_dispatch_source)pollingCoolDownTimer;
- (RPNFCTransaction)currentTransaction;
- (RPNFCTransactionController)initWithPreferredPollingType:(int64_t)a3 dispatchQueue:(id)a4;
- (RPNFCTransactionControllerDataSource)dataSource;
- (RPNFCTransactionControllerDelegate)delegate;
- (id)_createOneShotTimerWithInterval:(double)a3 completionHandler:(id)a4;
- (id)_createTapEventForApplicationLabel:(id)a3;
- (int64_t)initiatorState;
- (int64_t)preferredPollingType;
- (int64_t)receiverState;
- (unsigned)powerAssertionID;
- (void)_beginTransactionForRole:(int64_t)a3;
- (void)_didReceiveAuthenticationMessage:(id)a3;
- (void)_didReceiveValidationMessage:(id)a3;
- (void)_fileTTRForError:(id)a3;
- (void)_finishCurrentTransactionWithError:(id)a3;
- (void)_releasePowerAssertion;
- (void)_requestPowerAssertion;
- (void)_startBecomeInitiatorTimer;
- (void)_startConnectToReceiverTimer;
- (void)_startInitiator;
- (void)_startInitiatorLimitTimer;
- (void)_startPollingCoolDownTimer;
- (void)_startReceiver;
- (void)_stopBecomeInitiatorTimer;
- (void)_stopConnectToReceiverTimer;
- (void)_stopInitiator;
- (void)_stopInitiatorLimitTimer;
- (void)_stopPollingCoolDownTimer;
- (void)_stopReceiver;
- (void)_stopTimers;
- (void)_updatePolling;
- (void)controller:(id)a3 didInvalidate:(id)a4;
- (void)controller:(id)a3 didReceiveField:(id)a4;
- (void)controller:(id)a3 didReceiveRequest:(id)a4;
- (void)controllerDidConnectToReceiver:(id)a3;
- (void)controllerDidDetectUnsupportedInitiatorVersion:(id)a3;
- (void)controllerDidDetectUnsupportedReceiverVersion:(id)a3;
- (void)didConnectedToInitiator:(id)a3;
- (void)didDisconnectedFromInitiator:(id)a3;
- (void)invalidateTransaction:(id)a3;
- (void)setBecomeInitiatorTimer:(id)a3;
- (void)setConnectToReceiverTimer:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setInitiatorLimitTimer:(id)a3;
- (void)setInitiatorState:(int64_t)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setPendingInitiator:(BOOL)a3;
- (void)setPendingReceiver:(BOOL)a3;
- (void)setPollingCoolDownTimer:(id)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setPreferredPollingType:(int64_t)a3;
- (void)setReceiver:(id)a3;
- (void)setReceiverState:(int64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation RPNFCTransactionController

- (RPNFCTransactionController)initWithPreferredPollingType:(int64_t)a3 dispatchQueue:(id)a4
{
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RPNFCTransactionController;
  v8 = [(RPNFCTransactionController *)&v10 init];
  if (v8)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v8->_preferredPollingType = a3;
    objc_storeStrong((id *)&v8->_dispatchQueue, a4);
    v8->_receiverState = 0;
    v8->_initiatorState = 0;
  }

  return v8;
}

- (void)setPreferredPollingType:(int64_t)a3
{
  if (self->_preferredPollingType != a3)
  {
    self->_preferredPollingType = a3;
    [(RPNFCTransactionController *)self _updatePolling];
  }
}

- (void)_updatePolling
{
  if ([(RPNFCTransactionController *)self isRunning])
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      int64_t v3 = [(RPNFCTransactionController *)self preferredPollingType];
      LogPrintF();
    }
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0, v3);
    [(RPNFCTransactionController *)self _startReceiver];
    if ((id)[(RPNFCTransactionController *)self preferredPollingType] == (id)2)
    {
      [(RPNFCTransactionController *)self _startInitiator];
    }
    else
    {
      [(RPNFCTransactionController *)self _stopInitiator];
    }
  }
}

- (void)setInitiatorState:(int64_t)a3
{
  if (self->_initiatorState != a3)
  {
    self->_initiatorState = a3;
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)setReceiverState:(int64_t)a3
{
  if (self->_receiverState != a3)
  {
    self->_receiverState = a3;
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)start
{
  if (![(RPNFCTransactionController *)self isRunning])
  {
    [(RPNFCTransactionController *)self setIsRunning:1];
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self _updatePolling];
  }
}

- (void)stop
{
  if ([(RPNFCTransactionController *)self isRunning])
  {
    [(RPNFCTransactionController *)self setIsRunning:0];
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self _stopInitiator];
    [(RPNFCTransactionController *)self _stopReceiver];
    [(RPNFCTransactionController *)self _stopTimers];
    [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:0];
  }
}

- (void)invalidateTransaction:(id)a3
{
  id v12 = a3;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    objc_super v10 = [v12 identifier];
    LogPrintF();
  }
  v4 = [(RPNFCTransactionController *)self currentTransaction];

  if (v4)
  {
    v5 = [(RPNFCTransactionController *)self currentTransaction];
    v6 = [v5 identifier];
    id v7 = [v12 identifier];
    unsigned __int8 v8 = [v6 isEqual:v7];

    if (v8)
    {
      [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:0];
    }
    else if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      v9 = [(RPNFCTransactionController *)self currentTransaction];
      v11 = [v9 identifier];
      LogPrintF();
    }
  }
}

- (void)_startInitiator
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((id)[(RPNFCTransactionController *)self initiatorState] == (id)1)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if ((id)[(RPNFCTransactionController *)self initiatorState] == (id)2)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self setPendingInitiator:1];
  }
  else
  {
    [(RPNFCTransactionController *)self setInitiatorState:1];
    [(RPNFCTransactionController *)self setPendingInitiator:0];
    initiator = self->_initiator;
    if (!initiator)
    {
      v4 = [(objc_class *)off_100141FB0() initiatorWithDelegate:self callbackQueue:self->_dispatchQueue];
      v5 = self->_initiator;
      self->_initiator = v4;

      initiator = self->_initiator;
    }
    [(NFConnectionHandoverInitiator *)initiator setDelegate:self];
    [(NFConnectionHandoverInitiator *)self->_initiator start];
    [(RPNFCTransactionController *)self _startInitiatorLimitTimer];
    if (![(RPNFCTransactionController *)self preferredPollingType])
    {
      [(RPNFCTransactionController *)self _startConnectToReceiverTimer];
    }
  }
}

- (void)_stopInitiator
{
  if ((id)[(RPNFCTransactionController *)self initiatorState] == (id)1)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NFConnectionHandoverInitiator *)self->_initiator stop];
    [(RPNFCTransactionController *)self setInitiatorState:2];
    [(RPNFCTransactionController *)self _stopInitiatorLimitTimer];
  }

  [(RPNFCTransactionController *)self setPendingInitiator:0];
}

- (void)_startReceiver
{
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((id)[(RPNFCTransactionController *)self receiverState] == (id)1)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if ((id)[(RPNFCTransactionController *)self receiverState] == (id)2)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self setPendingReceiver:1];
  }
  else
  {
    [(RPNFCTransactionController *)self setReceiverState:1];
    [(RPNFCTransactionController *)self setPendingReceiver:0];
    receiver = self->_receiver;
    if (!receiver)
    {
      v4 = [(objc_class *)off_100141FB8() receiverWithDelegate:self callbackQueue:self->_dispatchQueue];
      v5 = self->_receiver;
      self->_receiver = v4;

      receiver = self->_receiver;
    }
    [(NFConnectionHandoverReceiver *)receiver setDelegate:self];
    v6 = self->_receiver;
    [(NFConnectionHandoverReceiver *)v6 start];
  }
}

- (void)_stopReceiver
{
  if ((id)[(RPNFCTransactionController *)self receiverState] == (id)1)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NFConnectionHandoverReceiver *)self->_receiver stop];
    [(RPNFCTransactionController *)self setReceiverState:2];
  }

  [(RPNFCTransactionController *)self setPendingReceiver:0];
}

- (void)_stopTimers
{
  [(RPNFCTransactionController *)self _stopPollingCoolDownTimer];
  [(RPNFCTransactionController *)self _stopInitiatorLimitTimer];
  [(RPNFCTransactionController *)self _stopConnectToReceiverTimer];

  [(RPNFCTransactionController *)self _stopBecomeInitiatorTimer];
}

- (id)_createOneShotTimerWithInterval:(double)a3 completionHandler:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  dispatch_source_set_event_handler(v7, v6);

  CUDispatchTimerSet();

  return v7;
}

- (void)_startPollingCoolDownTimer
{
  [(RPNFCTransactionController *)self _stopPollingCoolDownTimer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007C638;
  v4[3] = &unk_100121158;
  v4[4] = self;
  int64_t v3 = [(RPNFCTransactionController *)self _createOneShotTimerWithInterval:v4 completionHandler:10.0];
  [(RPNFCTransactionController *)self setPollingCoolDownTimer:v3];
  dispatch_activate(v3);
}

- (void)_stopPollingCoolDownTimer
{
  int64_t v3 = [(RPNFCTransactionController *)self pollingCoolDownTimer];

  if (v3)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    pollingCoolDownTimer = self->_pollingCoolDownTimer;
    if (pollingCoolDownTimer)
    {
      v5 = pollingCoolDownTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_pollingCoolDownTimer;
      self->_pollingCoolDownTimer = 0;
    }
    [(RPNFCTransactionController *)self setPollingCoolDownTimer:0];
  }
}

- (void)_startConnectToReceiverTimer
{
  [(RPNFCTransactionController *)self _stopConnectToReceiverTimer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007C8B0;
  v4[3] = &unk_100121158;
  v4[4] = self;
  int64_t v3 = [(RPNFCTransactionController *)self _createOneShotTimerWithInterval:v4 completionHandler:(double)(arc4random_uniform(3u) + 3)];
  [(RPNFCTransactionController *)self setConnectToReceiverTimer:v3];
  dispatch_activate(v3);
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_stopConnectToReceiverTimer
{
  int64_t v3 = [(RPNFCTransactionController *)self connectToReceiverTimer];

  if (v3)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    connectToReceiverTimer = self->_connectToReceiverTimer;
    if (connectToReceiverTimer)
    {
      v5 = connectToReceiverTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_connectToReceiverTimer;
      self->_connectToReceiverTimer = 0;
    }
    [(RPNFCTransactionController *)self setConnectToReceiverTimer:0];
  }
}

- (void)_startInitiatorLimitTimer
{
  [(RPNFCTransactionController *)self _stopInitiatorLimitTimer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007CAEC;
  v4[3] = &unk_100121158;
  v4[4] = self;
  int64_t v3 = [(RPNFCTransactionController *)self _createOneShotTimerWithInterval:v4 completionHandler:60.0];
  [(RPNFCTransactionController *)self setInitiatorLimitTimer:v3];
  dispatch_activate(v3);
}

- (void)_stopInitiatorLimitTimer
{
  int64_t v3 = [(RPNFCTransactionController *)self initiatorLimitTimer];

  if (v3)
  {
    initiatorLimitTimer = self->_initiatorLimitTimer;
    if (initiatorLimitTimer)
    {
      v5 = initiatorLimitTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_initiatorLimitTimer;
      self->_initiatorLimitTimer = 0;
    }
    [(RPNFCTransactionController *)self setInitiatorLimitTimer:0];
  }
}

- (void)_startBecomeInitiatorTimer
{
  [(RPNFCTransactionController *)self _stopBecomeInitiatorTimer];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007CCAC;
  v4[3] = &unk_100121158;
  v4[4] = self;
  int64_t v3 = [(RPNFCTransactionController *)self _createOneShotTimerWithInterval:v4 completionHandler:0.7];
  [(RPNFCTransactionController *)self setBecomeInitiatorTimer:v3];
  dispatch_activate(v3);
}

- (void)_stopBecomeInitiatorTimer
{
  int64_t v3 = [(RPNFCTransactionController *)self becomeInitiatorTimer];

  if (v3)
  {
    becomeInitiatorTimer = self->_becomeInitiatorTimer;
    if (becomeInitiatorTimer)
    {
      v5 = becomeInitiatorTimer;
      dispatch_source_cancel(v5);
      id v6 = self->_becomeInitiatorTimer;
      self->_becomeInitiatorTimer = 0;
    }
    [(RPNFCTransactionController *)self setBecomeInitiatorTimer:0];
  }
}

- (void)_beginTransactionForRole:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    int64_t v8 = a3;
    LogPrintF();
  }
  v5 = [(RPNFCTransactionController *)self currentTransaction];

  if (v5)
  {
    if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0, a3);
    }
    else
    {
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", 0, v9);
    }
  }
  id v6 = [[RPNFCTransaction alloc] initWithRole:a3];
  [(RPNFCTransactionController *)self setCurrentTransaction:v6];

  id v10 = [(RPNFCTransactionController *)self delegate];
  id v7 = [(RPNFCTransactionController *)self currentTransaction];
  [v10 transactionController:self didBeginTransaction:v7];
}

- (void)_finishCurrentTransactionWithError:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = [(RPNFCTransactionController *)self currentTransaction];

  if (v4)
  {
    [(RPNFCTransactionController *)self _stopInitiator];
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      id v7 = [(RPNFCTransactionController *)self currentTransaction];
      id v8 = v9;
      LogPrintF();
    }
    v5 = [(RPNFCTransactionController *)self currentTransaction];
    [v5 setError:v9];
    [(RPNFCTransactionController *)self setCurrentTransaction:0];
    id v6 = [(RPNFCTransactionController *)self delegate];
    [v6 transactionController:self didFinishTransaction:v5 error:v9];

    [(RPNFCTransactionController *)self _updatePolling];
  }
}

- (BOOL)_didReceiveAuthenticationResponseWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v7)
  {
    [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v7];
    BOOL v8 = 0;
  }
  else
  {
    id v9 = +[RPTransportServiceHandoverMessage messageWithConnectionHandoverSelect:v6];
    BOOL v8 = v9 != 0;
    if (v9)
    {
      [(RPNFCTransactionController *)self _didReceiveAuthenticationMessage:v9];
    }
    else
    {
      if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v10 = RPErrorF();
      [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v10];
    }
  }

  return v8;
}

- (void)_didReceiveAuthenticationMessage:(id)a3
{
  id v11 = a3;
  v4 = +[RPIdentityDaemon sharedIdentityDaemon];
  v5 = [v11 payload];
  id v6 = [v4 resolveIdentityForNearFieldMessagePayload:v5];

  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v11;
    id v10 = v6;
    LogPrintF();
  }
  id v7 = [(RPNFCTransactionController *)self currentTransaction];
  [v7 setRemoteIdentity:v6];

  BOOL v8 = [(RPNFCTransactionController *)self currentTransaction];
  [v8 setRemoteAuthenticationMessage:v11];
}

- (BOOL)_didReceiveValidationResponseWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    id v13 = v6;
    id v14 = v7;
    LogPrintF();
  }
  BOOL v8 = v7 == 0;
  if (v7) {
    goto LABEL_8;
  }
  uint64_t v9 = +[RPTransportServiceHandoverMessage messageWithConnectionHandoverSelect:v6];
  if (v9)
  {
    id v10 = (void *)v9;
    [(RPNFCTransactionController *)self _didReceiveValidationMessage:v9];

LABEL_8:
    -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v7, v13, v14);
    goto LABEL_9;
  }
  if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v12 = RPErrorF();
  [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v12];

  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)_didReceiveValidationMessage:(id)a3
{
  id v9 = a3;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF();
  }
  v4 = [(RPNFCTransactionController *)self currentTransaction];
  [v4 setRemoteValidationMessage:v9];

  v5 = [v9 applicationLabel];
  id v6 = [(RPNFCTransactionController *)self _createTapEventForApplicationLabel:v5];

  id v7 = [(RPNFCTransactionController *)self currentTransaction];
  [v7 setTapEvent:v6];
}

- (id)_createTapEventForApplicationLabel:(id)a3
{
  id v4 = a3;
  v5 = [(RPNFCTransactionController *)self currentTransaction];
  id v6 = [v5 remoteAuthenticationMessage];

  id v7 = [v6 payload];
  id v8 = [(RPNFCTransactionController *)self currentTransaction];
  id v9 = [v8 remoteValidationMessage];
  id v10 = [v9 payload];

  id v11 = [v6 transportServicesMetadata];
  uint64_t v12 = sub_10005533C(v11);

  if (v10 && ![v10 isKnownIdentity])
  {
    id v14 = 0;
  }
  else
  {
    id v13 = [(RPNFCTransactionController *)self currentTransaction];
    id v14 = [v13 remoteIdentity];
  }
  v15 = [(RPNFCTransactionController *)self dataSource];
  v16 = [v7 pkData];
  v17 = [v7 bonjourListenerUUID];
  v18 = [v15 transactionController:self tapEventForApplicationLabel:v4 singleBandAWDLModeRequested:v12 pkData:v16 bonjourListenerUUID:v17 identity:v14];

  return v18;
}

- (void)controller:(id)a3 didReceiveField:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  if (objc_msgSend(v18, "initiator", v17))
  {
    if ([v6 chFieldType] == (id)4)
    {
      if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(RPNFCTransactionController *)self _stopInitiator];
    }
  }
  else
  {
    id v7 = [(RPNFCTransactionController *)self currentTransaction];

    if (!v7)
    {
      id v8 = [v6 chFieldType];
      id v9 = v8;
      BOOL v11 = v8 == (id)2 || v8 == (id)4;
      if ((id)[(RPNFCTransactionController *)self preferredPollingType] == (id)1)
      {
LABEL_18:
        uint64_t v12 = [(RPNFCTransactionController *)self delegate];
        [v12 transactionController:self didDetectDeviceNearbyWithInitiatorRole:v11];
      }
      else
      {
        switch((unint64_t)v9)
        {
          case 1uLL:
            if (dword_100141F40 <= 60 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
              goto LABEL_54;
            }
            break;
          case 2uLL:
            if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [(RPNFCTransactionController *)self _stopInitiator];
            id v13 = [(RPNFCTransactionController *)self receiver];
            unsigned int v14 = [v13 roleBroadcastInBackground];

            if (!v14) {
              break;
            }
            [(RPNFCTransactionController *)self _startBecomeInitiatorTimer];
            goto LABEL_18;
          case 3uLL:
            if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
              goto LABEL_39;
            }
            goto LABEL_50;
          case 4uLL:
            if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            [(RPNFCTransactionController *)self _stopInitiator];
            goto LABEL_18;
          case 5uLL:
            if (dword_100141F40 > 30 || dword_100141F40 == -1 && !_LogCategory_Initialize()) {
              goto LABEL_50;
            }
LABEL_39:
            LogPrintF();
LABEL_50:
            v15 = [(RPNFCTransactionController *)self receiver];
            unsigned int v16 = [v15 roleBroadcastInBackground];

            if (v16)
            {
              [(RPNFCTransactionController *)self _startInitiator];
              goto LABEL_18;
            }
            if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
LABEL_54:
            }
              LogPrintF();
            break;
          default:
            goto LABEL_18;
        }
      }
    }
  }
}

- (void)controller:(id)a3 didInvalidate:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  unsigned int v7 = [v15 initiator];
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = NSStringFromBOOL();
    id v14 = v6;
    id v10 = v15;
    LogPrintF();
  }
  if (v7)
  {
    [(RPNFCTransactionController *)self setInitiatorState:0];
    [(RPNFCTransactionController *)self _stopConnectToReceiverTimer];
    [(RPNFCTransactionController *)self _stopInitiatorLimitTimer];
    if (v6) {
      goto LABEL_7;
    }
LABEL_22:
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      [(RPNFCTransactionController *)self pendingReceiver];
      id v9 = NSStringFromBOOL();
      [(RPNFCTransactionController *)self pendingInitiator];
      NSStringFromBOOL();
      v12 = id v10 = v9;
      LogPrintF();
    }
    if ([(RPNFCTransactionController *)self pendingReceiver]
      || [(RPNFCTransactionController *)self pendingInitiator])
    {
      [(RPNFCTransactionController *)self _updatePolling];
    }
    goto LABEL_33;
  }
  id v8 = [(RPNFCTransactionController *)self receiver];

  if (v8 != v15)
  {
    if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_33;
  }
  [(RPNFCTransactionController *)self setReceiverState:0];
  [(RPNFCTransactionController *)self _stopBecomeInitiatorTimer];
  if (!v6) {
    goto LABEL_22;
  }
LABEL_7:
  if (objc_msgSend(v6, "code", v10, v12, v14) == (id)57) {
    goto LABEL_8;
  }
  if ([v6 code] != (id)67 && objc_msgSend(v6, "code") != (id)68)
  {
    [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v6];
    if ([v6 code] != (id)50 && objc_msgSend(v6, "code") != (id)47 && objc_msgSend(v6, "code") != (id)44)
    {
LABEL_8:
      if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        [(RPNFCTransactionController *)self stop];
      }
      else
      {
        [(RPNFCTransactionController *)self stop];
      }
      goto LABEL_33;
    }
    [(RPNFCTransactionController *)self _startPollingCoolDownTimer];
  }
LABEL_33:
}

- (void)controllerDidDetectUnsupportedReceiverVersion:(id)a3
{
  id v6 = a3;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [(RPNFCTransactionController *)self currentTransaction];
  id v5 = [v4 role];

  if (v5 == (id)1)
  {
    [(RPNFCTransactionController *)self _stopInitiator];
    [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:0];
  }
}

- (void)controllerDidConnectToReceiver:(id)a3
{
  id v4 = a3;
  if ((id)[(RPNFCTransactionController *)self initiatorState] == (id)1)
  {
    [(RPNFCTransactionController *)self _stopConnectToReceiverTimer];
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self _beginTransactionForRole:1];
    id v5 = [(RPNFCTransactionController *)self dataSource];
    id v6 = [v5 transactionController:self requestMessageForType:1];

    if (v6)
    {
      unsigned int v7 = [(RPNFCTransactionController *)self currentTransaction];
      [v7 setLocalAuthenticationMessage:v6];

      if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
      {
        id v10 = v6;
        LogPrintF();
      }
      id v8 = [v6 connectionHandoverRequest:v10];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10007E160;
      v11[3] = &unk_100123A40;
      v11[4] = self;
      id v12 = v4;
      [v12 sendHandoverRequest:v8 responseHandler:v11];
    }
    else
    {
      if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v9 = +[NSError errorWithDomain:@"RPNFCTransactionControllerErrorDomain" code:2 userInfo:0];
      [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v9];
    }
  }
}

- (void)controllerDidDetectUnsupportedInitiatorVersion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100141F40 <= 30)
  {
    id v6 = v3;
    if (dword_100141F40 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)didConnectedToInitiator:(id)a3
{
  if ((id)[(RPNFCTransactionController *)self receiverState] == (id)1)
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self _stopBecomeInitiatorTimer];
    [(RPNFCTransactionController *)self _stopInitiator];
    [(RPNFCTransactionController *)self _beginTransactionForRole:2];
  }
}

- (void)didDisconnectedFromInitiator:(id)a3
{
  id v9 = a3;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [(RPNFCTransactionController *)self currentTransaction];
  id v5 = [v4 role];

  if (v5 == (id)2)
  {
    id v6 = [(RPNFCTransactionController *)self currentTransaction];
    id v7 = [v6 state];

    if (v7 == (id)2)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = +[NSError errorWithDomain:@"RPNFCTransactionControllerErrorDomain" code:0 userInfo:0];
    }
    [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v8];
  }
}

- (void)controller:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    id v33 = v7;
    LogPrintF();
  }
  id v8 = +[RPTransportServiceHandoverMessage messageWithConnectionHandoverRequest:](RPTransportServiceHandoverMessage, "messageWithConnectionHandoverRequest:", v7, v33);
  if (v8)
  {
    id v9 = [(RPNFCTransactionController *)self dataSource];
    id v10 = [v9 transactionController:self responseMessageForRequestMessage:v8];

    if (!v10)
    {
      if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
      {
        v34 = v8;
        LogPrintF();
      }
      uint64_t v11 = +[NSError errorWithDomain:@"RPNFCTransactionControllerErrorDomain", 2, 0, v34 code userInfo];
      [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v11];
      goto LABEL_64;
    }
    uint64_t v11 = [v10 connectionHandoverSelect];
    id v12 = [v8 payload];
    id v13 = [v12 type];

    if (v13)
    {
      id v14 = [v8 payload];
      id v15 = [v14 type];

      unsigned int v16 = [(RPNFCTransactionController *)self currentTransaction];
      id v17 = v16;
      BOOL v18 = v15 == (id)1;
      if (v15 == (id)1)
      {
        [v16 setLocalAuthenticationMessage:v10];
        double v19 = 0.0;
        goto LABEL_59;
      }
      [v16 setLocalValidationMessage:v10];

      v20 = [(RPNFCTransactionController *)self currentTransaction];
      v21 = [v20 remoteAuthenticationMessage];

      if (v21)
      {
        BOOL v37 = v18;
        id v17 = [v8 payload];
        if ([v17 isKnownIdentity]
          && ([(RPNFCTransactionController *)self currentTransaction],
              v22 = objc_claimAutoreleasedReturnValue(),
              [v22 remoteIdentity],
              v23 = objc_claimAutoreleasedReturnValue(),
              v22,
              v23))
        {
          double v19 = 0.0;
        }
        else
        {
          id v36 = v6;
          v24 = +[NSDate now];
          v25 = [(RPNFCTransactionController *)self currentTransaction];
          v26 = [v25 connectionDate];
          [v24 timeIntervalSinceDate:v26];
          double v28 = v27;

          if (dword_100141F40 < 31)
          {
            if (dword_100141F40 != -1 || _LogCategory_Initialize()) {
              LogPrintF();
            }
            double v19 = fmax(0.8 - v28, 0.0);
            id v6 = v36;
            BOOL v18 = v37;
            if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v23 = 0;
            goto LABEL_58;
          }
          v23 = 0;
          double v19 = fmax(0.8 - v28, 0.0);
          id v6 = v36;
        }
        BOOL v18 = v37;
LABEL_58:

LABEL_59:
        if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10007EDEC;
        v38[3] = &unk_100123A68;
        v38[4] = self;
        BOOL v40 = v18;
        id v39 = v8;
        [v6 sendHandoverSelect:v11 delay:v38 completionHandler:v19];

        goto LABEL_64;
      }
      if (dword_100141F40 <= 115 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
      {
        v34 = [(RPNFCTransactionController *)self currentTransaction];
        LogPrintF();
      }
      id v29 = +[NSError errorWithDomain:@"RPNFCTransactionControllerErrorDomain", 1, 0, v34 code userInfo];
      goto LABEL_54;
    }
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPNFCTransactionController *)self _didReceiveAuthenticationMessage:v8];
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      v34 = v10;
      LogPrintF();
    }
    id v41 = 0;
    [v6 sendHandoverSelect:v11 error:&v41, v34];
    id v29 = v41;
    if (v29)
    {
      if (dword_100141F40 > 90 || dword_100141F40 == -1 && !_LogCategory_Initialize())
      {
LABEL_54:
        -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v29, v35);
        goto LABEL_55;
      }
      LogPrintF();
      -[RPNFCTransactionController _finishCurrentTransactionWithError:](self, "_finishCurrentTransactionWithError:", v29, v29);
    }
    else
    {
      v30 = [v7 applicationLabel];
      v31 = [(RPNFCTransactionController *)self _createTapEventForApplicationLabel:v30];

      v32 = [(RPNFCTransactionController *)self currentTransaction];
      [v32 setTapEvent:v31];
    }
LABEL_55:

LABEL_64:
    goto LABEL_65;
  }
  if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v10 = RPErrorF();
  [(RPNFCTransactionController *)self _finishCurrentTransactionWithError:v10];
LABEL_65:
}

- (void)_requestPowerAssertion
{
  IOPMAssertionID v4 = 0;
  unsigned int v3 = sub_100055480(&v4);
  [(RPNFCTransactionController *)self _releasePowerAssertion];
  [(RPNFCTransactionController *)self setPowerAssertionID:v4];
  if (v3 && dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    [(RPNFCTransactionController *)self powerAssertionID];
    LogPrintF();
  }
}

- (void)_releasePowerAssertion
{
  unsigned int v5 = [(RPNFCTransactionController *)self powerAssertionID];
  if (sub_1000555A0((uint64_t)&v5))
  {
    if (dword_100141F40 <= 30 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = [(RPNFCTransactionController *)self powerAssertionID];
      LogPrintF();
      -[RPNFCTransactionController setPowerAssertionID:](self, "setPowerAssertionID:", v5, v4);
    }
    else
    {
      -[RPNFCTransactionController setPowerAssertionID:](self, "setPowerAssertionID:", v5, v3);
    }
  }
}

- (void)_fileTTRForError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSURLComponents);
  [v4 setScheme:@"tap-to-radar"];
  [v4 setHost:@"new"];
  uint64_t v5 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:@"800892"];
  uint64_t v6 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:@"Rapport"];
  id v7 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:@"All"];
  id v8 = +[NSURLQueryItem queryItemWithName:@"DeviceClasses" value:@"iPhone,Watch"];
  id v9 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Serious Bug"];
  uint64_t v10 = +[NSDate date];
  id v11 = objc_alloc_init((Class)NSDateFormatter);
  [v11 setDateFormat:@"yyyy.MM.dd_HH-mm-ss"];
  v21 = v11;
  v23 = (void *)v10;
  v22 = [v11 stringFromDate:v10];
  id v12 = +[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", @"TimeOfIssue");
  id v13 = +[NSString stringWithFormat:@"Failing to start NFC controller with error:%@", v3];

  id v14 = +[NSURLQueryItem queryItemWithName:@"Title" value:@"Unexpected error when starting NFC controller"];
  id v15 = +[NSURLQueryItem queryItemWithName:@"Description" value:v13];
  v24 = (void *)v6;
  v25 = (void *)v5;
  v28[0] = v5;
  v28[1] = v6;
  v28[2] = v7;
  v28[3] = v8;
  v28[4] = v9;
  v28[5] = v12;
  v28[6] = v14;
  v28[7] = v15;
  unsigned int v16 = +[NSArray arrayWithObjects:v28 count:8];
  [v4 setQueryItems:v16];

  if (dword_100141F40 <= 90 && (dword_100141F40 != -1 || _LogCategory_Initialize()))
  {
    v20 = [v4 URL];
    LogPrintF();
  }
  id v17 = [(objc_class *)off_100141FC0() defaultWorkspace];
  BOOL v18 = [v4 URL];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10007F3B8;
  v26[3] = &unk_1001211A8;
  id v27 = v4;
  id v19 = v4;
  [v17 openURL:v18 configuration:0 completionHandler:v26];
}

- (int64_t)preferredPollingType
{
  return self->_preferredPollingType;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNFCTransactionControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (RPNFCTransactionControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (RPNFCTransactionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RPNFCTransactionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NFConnectionHandoverInitiator)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (NFConnectionHandoverReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (OS_dispatch_source)pollingCoolDownTimer
{
  return self->_pollingCoolDownTimer;
}

- (void)setPollingCoolDownTimer:(id)a3
{
}

- (OS_dispatch_source)initiatorLimitTimer
{
  return self->_initiatorLimitTimer;
}

- (void)setInitiatorLimitTimer:(id)a3
{
}

- (OS_dispatch_source)connectToReceiverTimer
{
  return self->_connectToReceiverTimer;
}

- (void)setConnectToReceiverTimer:(id)a3
{
}

- (OS_dispatch_source)becomeInitiatorTimer
{
  return self->_becomeInitiatorTimer;
}

- (void)setBecomeInitiatorTimer:(id)a3
{
}

- (int64_t)receiverState
{
  return self->_receiverState;
}

- (int64_t)initiatorState
{
  return self->_initiatorState;
}

- (BOOL)pendingReceiver
{
  return self->_pendingReceiver;
}

- (void)setPendingReceiver:(BOOL)a3
{
  self->_pendingReceiver = a3;
}

- (BOOL)pendingInitiator
{
  return self->_pendingInitiator;
}

- (void)setPendingInitiator:(BOOL)a3
{
  self->_pendingInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_becomeInitiatorTimer, 0);
  objc_storeStrong((id *)&self->_connectToReceiverTimer, 0);
  objc_storeStrong((id *)&self->_initiatorLimitTimer, 0);
  objc_storeStrong((id *)&self->_pollingCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end