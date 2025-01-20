@interface PDPassUpgradeController
- (PDPassUpgradeController)initWithWebService:(id)a3 cardFileManager:(id)a4;
- (void)dealloc;
- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6;
- (void)secureElementDidRunScriptsFromTSM;
@end

@implementation PDPassUpgradeController

- (PDPassUpgradeController)initWithWebService:(id)a3 cardFileManager:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021758C;
  v10[3] = &unk_100740BA0;
  id v6 = a4;
  id v11 = v6;
  v7 = [(PDPassUpgradeController *)self initWithWebService:a3 addPaymentPassToLibrary:v10];
  v8 = v7;
  if (v7) {
    PDNFSecureXPCRegisterSecureElementEventObserver(v7);
  }

  return v8;
}

- (void)dealloc
{
  PDNFSecureXPCUnregisterSecureElementEventObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PDPassUpgradeController;
  [(PDPassUpgradeController *)&v3 dealloc];
}

- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v14 = [v11 uniqueID];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2810000000;
    v40[3] = &unk_10060E2DA;
    int v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_100020A0C;
    v38[4] = sub_100020FF8;
    id v39 = (id)PDOSTransactionCreate("PDPassUpgradeController.upgrade");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100217AB8;
    v34[3] = &unk_100740BC8;
    v36 = v40;
    v37 = v38;
    id v15 = v14;
    id v35 = v15;
    id v16 = [v34 copy];
    v17 = dispatch_get_global_queue(21, 0);
    v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v17);

    dispatch_time_t v19 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100217BE0;
    handler[3] = &unk_10072E9D8;
    v20 = v18;
    v31 = v20;
    id v21 = v15;
    id v32 = v21;
    id v22 = v16;
    id v33 = v22;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100217CA4;
    v26[3] = &unk_100740BF0;
    id v28 = v13;
    v23 = v20;
    v27 = v23;
    id v24 = v22;
    id v29 = v24;
    v25.receiver = self;
    v25.super_class = (Class)PDPassUpgradeController;
    [(PDPassUpgradeController *)&v25 requestPassUpgrade:v10 pass:v11 diagnosticReason:v12 completion:v26];

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
  }
}

- (void)secureElementDidRunScriptsFromTSM
{
}

@end