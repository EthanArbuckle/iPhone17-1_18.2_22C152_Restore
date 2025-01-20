@interface KmlNfcPairingTransport
- (KmlNfcPairingTransport)init;
- (KmlPairingTransportDelegate)delegate;
- (id)getSecureElementSession;
- (unsigned)stepForAnalytics;
- (void)endSession;
- (void)endTransaction;
- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4;
- (void)hceSessionDidConnect:(id)a3;
- (void)hceSessionDidDisconnect:(id)a3;
- (void)hceSessionDidEndUnexpectedly:(id)a3;
- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4;
- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3;
- (void)pairingEndedWithResult:(id)a3;
- (void)pauseSession;
- (void)readApdu;
- (void)reset;
- (void)resumeSessionWithTimeout;
- (void)sendApdu:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSession;
- (void)startSessionWithTimeout;
- (void)startTransactionForKeyWithIdentifier:(id)a3;
@end

@implementation KmlNfcPairingTransport

- (KmlNfcPairingTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)KmlNfcPairingTransport;
  return [(KmlNfcPairingTransport *)&v3 init];
}

- (void)startSession
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003027D4;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)startSessionWithTimeout
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003029E4;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)endSession
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302A6C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)pauseSession
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302CFC;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)resumeSessionWithTimeout
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302F90;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)startTransactionForKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003031D4;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
}

- (void)endTransaction
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100303464;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)readApdu
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100303518;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)sendApdu:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003037C4;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
}

- (void)reset
{
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100303888;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(nfcTransportQueue, block);
}

- (void)pairingEndedWithResult:(id)a3
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlNfcPairingTransport pairingEndedWithResult:]", 200, @"No op for NFC transport", v3, v4, v5, v6, v7);
}

- (id)getSecureElementSession
{
  return self->_activeSeHceSession;
}

- (void)hceSessionDidConnect:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100305148;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
}

- (void)hceSessionDidDisconnect:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100305428;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
}

- (void)hceSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100305570;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
}

- (void)hceSession:(id)a3 didReceiveAPDU:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003057E8;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(nfcTransportQueue, block);
}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  id v5 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10030591C;
  v8[3] = &unk_10040D1A0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(nfcTransportQueue, v8);
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  nfcTransportQueue = self->_nfcTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100305A4C;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(nfcTransportQueue, block);
}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  nfcTransportQueue = self->_nfcTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100305C90;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(nfcTransportQueue, v7);
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
  objc_storeStrong((id *)&self->_nfcTransportQueue, 0);
  objc_storeStrong((id *)&self->_readApduQueue, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_activeLoyaltyPaymentSession, 0);
  objc_storeStrong((id *)&self->_activeSeHceSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);

  objc_storeStrong((id *)&self->_opNFManager, 0);
}

@end