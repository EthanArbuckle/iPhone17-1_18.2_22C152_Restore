@interface KmlDataExchangeManager
- (KmlDataExchangeManager)init;
- (void)handleIncomingApdu:(id)a3 error:(id)a4;
- (void)handleSessionEndResult:(id)a3;
- (void)handleSessionPauseResult:(id)a3;
- (void)handleSessionResumeResult:(id)a3;
- (void)handleSessionStartResult:(id)a3;
- (void)handleTransactionEndResult:(id)a3;
- (void)handleTransactionStartResult:(id)a3;
@end

@implementation KmlDataExchangeManager

- (KmlDataExchangeManager)init
{
  return (KmlDataExchangeManager *)sub_1002FBB44((void **)&self->super.isa, 0, 0, (void *)1, 0);
}

- (void)handleSessionStartResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionStartResult:]", 624, @"Received session start result", v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_1002FDE20;
  v11[3] = (uint64_t)&unk_10040D1A0;
  v11[4] = (uint64_t)self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(dxManagerQueue, v11);
}

- (void)handleSessionResumeResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionResumeResult:]", 646, @"Received session resume result.", v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_1002FE0DC;
  v11[3] = (uint64_t)&unk_10040D1A0;
  v11[4] = (uint64_t)self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(dxManagerQueue, v11);
}

- (void)handleSessionPauseResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionPauseResult:]", 671, @"Received session pause result.", v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_1002FE3C4;
  v11[3] = (uint64_t)&unk_10040D1A0;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(dxManagerQueue, v11);
}

- (void)handleSessionEndResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleSessionEndResult:]", 694, @"Received session end result.", v5, v6, v7, v8, v11[0]);
  dxManagerQueue = self->_dxManagerQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_1002FE678;
  v11[3] = (uint64_t)&unk_10040D1A0;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(dxManagerQueue, v11);
}

- (void)handleTransactionStartResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleTransactionStartResult:]", 717, @"Received transaction session start result: %@", v5, v6, v7, v8, (uint64_t)v4);
  dxManagerQueue = self->_dxManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FE904;
  block[3] = &unk_10040D1A0;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(dxManagerQueue, block);
}

- (void)handleTransactionEndResult:(id)a3
{
  id v4 = a3;
  dxManagerQueue = self->_dxManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002FEA08;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dxManagerQueue, v7);
}

- (void)handleIncomingApdu:(id)a3 error:(id)a4
{
  id v10 = a3;
  if (a4) {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlDataExchangeManager handleIncomingApdu:error:]", 758, @"Currently we don't do anything on error while reading APDU's.", v6, v7, v8, v9, v13[0]);
  }
  dxManagerQueue = self->_dxManagerQueue;
  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = (uint64_t)sub_1002FED7C;
  v13[3] = (uint64_t)&unk_10040D1A0;
  v13[4] = (uint64_t)self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(dxManagerQueue, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermSharedSecret, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pairingTransport, 0);
  objc_storeStrong((id *)&self->_dxVersionInformation, 0);
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_dxManagerQueue, 0);
  objc_storeStrong((id *)&self->_opaqueAttestation, 0);
  objc_storeStrong((id *)&self->_dxmError, 0);
  objc_storeStrong((id *)&self->_pairingPassword, 0);

  objc_storeStrong((id *)&self->_secureChannel, 0);
}

@end