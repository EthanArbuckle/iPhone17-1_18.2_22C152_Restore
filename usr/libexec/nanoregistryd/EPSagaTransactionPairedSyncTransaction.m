@interface EPSagaTransactionPairedSyncTransaction
+ (id)_operationTypeStringFromSyncType:(unint64_t)a3;
+ (id)_syncTypeString:(unint64_t)a3;
+ (void)whatKindOfSyncIsNeededForPairingID:(id)a3 block:(id)a4;
- (EPTransactionDelegate)delegate;
- (void)_addWaitForIsSetupTransactionIfNeeded;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionPairedSyncTransaction

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  v9 = [v8 serviceFromClass:objc_opt_class()];
  [v7 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000787C;
  v13[3] = &unk_1001656B8;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = self;
  id v16 = v7;
  id v17 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v14;
  [v9 grabRegistryWithReadBlockAsync:v13];
}

+ (void)whatKindOfSyncIsNeededForPairingID:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = sub_100007FA8;
    id v17 = sub_100007FB8;
    id v18 = (id)objc_opt_new();
    id v8 = (void *)v14[5];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007FC0;
    v9[3] = &unk_100165708;
    id v12 = &v13;
    id v11 = v7;
    id v10 = v5;
    [v8 requestInitialNonMigrationSyncStateForPairingIdentifier:v10 completion:v9];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

+ (id)_syncTypeString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"reunionSync";
  }
  else {
    return *(&off_100165750 + a3);
  }
}

+ (id)_operationTypeStringFromSyncType:(unint64_t)a3
{
  v3 = (id *)&off_100165770;
  v4 = &off_100165778;
  if (a3 != 2) {
    v4 = &off_100165790;
  }
  if (a3 != 1) {
    v3 = (id *)v4;
  }
  return *v3;
}

- (void)_addWaitForIsSetupTransactionIfNeeded
{
  if (self->_syncType == 1)
  {
    v3 = [(EPRoutingSlipEntry *)self->_routingSlipEntry objectForKeyedSubscript:@"nrDeviceIdentifier"];
    v4 = [(EPRoutingSlipEntry *)self->_routingSlipEntry objectForKeyedSubscript:@"shouldWaitForIsSetup"];
    id v5 = v4;
    if (v4)
    {
      if ([v4 BOOLValue])
      {
        id v6 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_1000084A0;
        v7[3] = &unk_100165730;
        id v8 = v3;
        v9 = self;
        [v6 grabRegistryWithReadBlockAsync:v7];
      }
    }
  }
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);

  objc_storeStrong((id *)&self->_serviceRegistry, 0);
}

@end