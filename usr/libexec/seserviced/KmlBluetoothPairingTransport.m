@interface KmlBluetoothPairingTransport
- (KmlBluetoothPairingTransport)init;
- (KmlBluetoothPairingTransport)initWithDelegate:(id)a3;
- (KmlPairingTransportDelegate)delegate;
- (id)getSecureElementSession;
- (unsigned)stepForAnalytics;
- (void)btHceSessionHandleApdu:(id)a3;
- (void)btHceTxnSessionDidEndUnexpectedly:(id)a3 result:(id)a4;
- (void)btHceTxnSessionDidStartEmulation:(id)a3 result:(id)a4;
- (void)btHceTxnSessionDidStopEmulation:(id)a3 result:(id)a4;
- (void)btHceTxnSessionRadioIsDisabled:(id)a3;
- (void)btHceTxnSessionUwbUnavailable:(id)a3;
- (void)btTxnSessionDidEndTransaction:(id)a3 result:(id)a4;
- (void)btTxnSessionDidStartTransaction:(id)a3 result:(id)a4;
- (void)endSession;
- (void)endTransaction;
- (void)pairingEndedWithResult:(id)a3;
- (void)pauseSession;
- (void)readApdu;
- (void)reset;
- (void)resumeSessionWithTimeout;
- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3;
- (void)sendApdu:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSession;
- (void)startSessionWithTimeout;
- (void)startTransactionForKeyWithIdentifier:(id)a3;
@end

@implementation KmlBluetoothPairingTransport

- (KmlBluetoothPairingTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)KmlBluetoothPairingTransport;
  return [(KmlBluetoothPairingTransport *)&v3 init];
}

- (KmlBluetoothPairingTransport)initWithDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)KmlBluetoothPairingTransport;
  v9 = [(KmlBluetoothPairingTransport *)&v25 init];
  if (v9)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlBluetoothPairingTransport initWithDelegate:]", 88, @"let's init", v5, v6, v7, v8, (uint64_t)v25.receiver);
    [(KmlBluetoothPairingTransport *)v9 setDelegate:v4];
    btSession = v9->_btSession;
    v9->_btSession = 0;

    activeSession = v9->_activeSession;
    v9->_activeSession = 0;

    activeSeSession = v9->_activeSeSession;
    v9->_activeSeSession = 0;

    errorToReport = v9->_errorToReport;
    v9->_errorToReport = 0;

    v9->_currentState = 0;
    v9->_lastState = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.sesd.kml.btTransport", v14);
    btTransportQueue = v9->_btTransportQueue;
    v9->_btTransportQueue = (OS_dispatch_queue *)v15;

    endTransactionTimer = v9->_endTransactionTimer;
    v9->_endTransactionTimer = 0;

    hceSessionTimer = v9->_hceSessionTimer;
    v9->_hceSessionTimer = 0;

    v9->_hceTimeoutRequested = 0;
    transactionKeyId = v9->_transactionKeyId;
    v9->_transactionKeyId = 0;

    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlBluetoothPairingTransport initWithDelegate:]", 106, @"ready to roll", v20, v21, v22, v23, (uint64_t)v25.receiver);
  }

  return v9;
}

- (void)startSession
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100348FC0;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)startSessionWithTimeout
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003491D0;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)endSession
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100349258;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)pauseSession
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003494E8;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)resumeSessionWithTimeout
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034977C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)startTransactionForKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003499C0;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (void)endTransaction
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100349C70;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)readApdu
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100349D28;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)sendApdu:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100349DE8;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (void)reset
{
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100349EAC;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(btTransportQueue, block);
}

- (void)pairingEndedWithResult:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034A03C;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (id)getSecureElementSession
{
  return self->_activeSeSession;
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034B0B0;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (void)btHceSessionHandleApdu:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034B2FC;
  v7[3] = &unk_10040D1A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (void)btTxnSessionDidStartTransaction:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034B418;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(btTransportQueue, block);
}

- (void)btTxnSessionDidEndTransaction:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034B618;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(btTransportQueue, block);
}

- (void)btHceTxnSessionDidStartEmulation:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034B824;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(btTransportQueue, block);
}

- (void)btHceTxnSessionDidStopEmulation:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034BAA8;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(btTransportQueue, block);
}

- (void)btHceTxnSessionDidEndUnexpectedly:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btTransportQueue = self->_btTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10034BCE0;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(btTransportQueue, block);
}

- (void)btHceTxnSessionRadioIsDisabled:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034BEA8;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (void)btHceTxnSessionUwbUnavailable:(id)a3
{
  id v4 = a3;
  btTransportQueue = self->_btTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034C0F4;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(btTransportQueue, v7);
}

- (KmlPairingTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (KmlPairingTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)stepForAnalytics
{
  return self->_lastState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_transactionKeyId, 0);
  objc_storeStrong((id *)&self->_hceSessionTimer, 0);
  objc_storeStrong((id *)&self->_endTransactionTimer, 0);
  objc_storeStrong((id *)&self->_btTransportQueue, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_activeSeSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);

  objc_storeStrong((id *)&self->_btSession, 0);
}

@end