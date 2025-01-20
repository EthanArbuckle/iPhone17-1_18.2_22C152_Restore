@interface KmlOwnerPairingSession
- (void)consumeTrackingReceipt:(id)a3 otherJSONData:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6;
- (void)endSessionWithCompletion:(id)a3;
- (void)handleKmlOwnerPairingCancellationResult:(BOOL)a3;
- (void)handleKmlOwnerPairingCompletionWithResult:(id)a3 keyInformation:(id)a4 keyTrackingRequest:(id)a5;
- (void)handleKmlOwnerPairingDidStart;
- (void)handleKmlOwnerPairingFirstTransactionCompletionResult:(id)a3;
- (void)handleKmlOwnerPairingPreWarmCompletionResult:(id)a3;
- (void)handleKmlOwnerPairingProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4;
- (void)handleKmlOwnerPairingStartResult:(id)a3;
- (void)handleKmlOwnerPairingTrackingReceiptSaveResult:(id)a3;
- (void)preWarmForManufacturer:(id)a3 callback:(id)a4;
- (void)startKeyPairingWithPassword:(id)a3 keyName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6 callback:(id)a7;
- (void)startProbingWithCallback:(id)a3;
@end

@implementation KmlOwnerPairingSession

- (void)preWarmForManufacturer:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031FB50;
  block[3] = &unk_10040C560;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)startKeyPairingWithPassword:(id)a3 keyName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = sub_10031C120((id *)&self->super.super.isa);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10031FE48;
  v21[3] = &unk_100419EE8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (void)startProbingWithCallback:(id)a3
{
  id v4 = a3;
  v5 = sub_10031C120((id *)&self->super.super.isa);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032011C;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_10031C120((id *)&self->super.super.isa);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100320338;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)consumeTrackingReceipt:(id)a3 otherJSONData:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032063C;
  block[3] = &unk_10040DC00;
  id v20 = v11;
  v21 = self;
  id v23 = v10;
  id v24 = v13;
  id v22 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (void)handleKmlOwnerPairingCompletionWithResult:(id)a3 keyInformation:(id)a4 keyTrackingRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingCompletionWithResult:keyInformation:keyTrackingRequest:]", 185, @"result = %@", v11, v12, v13, v14, (uint64_t)v8);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingCompletionWithResult:keyInformation:keyTrackingRequest:]", 186, @"%@", v15, v16, v17, v18, (uint64_t)v9);
  id v19 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032098C;
  block[3] = &unk_100419A98;
  void block[4] = self;
  id v24 = v8;
  id v25 = v9;
  id v26 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = v8;
  dispatch_async(v19, block);
}

- (void)handleKmlOwnerPairingStartResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingStartResult:]", 201, @"result = %@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320AF4;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleKmlOwnerPairingCancellationResult:(BOOL)a3
{
  id v4 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320B98;
  block[3] = &unk_100419F08;
  BOOL v6 = a3;
  dispatch_async(v4, block);
}

- (void)handleKmlOwnerPairingFirstTransactionCompletionResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingFirstTransactionCompletionResult:]", 220, @"result = %@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320CAC;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleKmlOwnerPairingTrackingReceiptSaveResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingTrackingReceiptSaveResult:]", 233, @"result = %@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320E10;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleKmlOwnerPairingPreWarmCompletionResult:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingPreWarmCompletionResult:]", 242, @"result = %@", v5, v6, v7, v8, (uint64_t)v4);
  id v9 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320F18;
  block[3] = &unk_10040D1A0;
  void block[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)handleKmlOwnerPairingProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v12 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingProbingCompletionWithBrandCode:error:]", 250, @"Brand code : %ld, error : %@", v6, v7, v8, v9, a3);
  id v10 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321048;
  block[3] = &unk_10040D970;
  id v14 = v12;
  unint64_t v15 = a3;
  void block[4] = self;
  id v11 = v12;
  dispatch_async(v10, block);
}

- (void)handleKmlOwnerPairingDidStart
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingSession handleKmlOwnerPairingDidStart]", 258, &stru_100421848, v2, v3, v4, v5, v8);
  uint64_t v7 = sub_10031C120((id *)&self->super.super.isa);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100321144;
  block[3] = &unk_10040B880;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endSessionCallback, 0);
  objc_storeStrong(&self->_updateTrackingCallback, 0);
  objc_storeStrong(&self->_startPairingCallback, 0);

  objc_storeStrong((id *)&self->_opManager, 0);
}

@end