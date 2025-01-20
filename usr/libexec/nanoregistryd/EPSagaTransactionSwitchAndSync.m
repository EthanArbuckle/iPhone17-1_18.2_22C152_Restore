@interface EPSagaTransactionSwitchAndSync
- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5;
@end

@implementation EPSagaTransactionSwitchAndSync

- (void)buildRoutingSlipEntries:(id)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 objectForKeyedSubscript:@"switchToNRDeviceUUID"];
  v11 = [v7 objectForKeyedSubscript:@"shouldWaitForAssertion"];
  v12 = [v8 serviceFromClass:objc_opt_class()];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007BACC;
  v18[3] = &unk_1001682B8;
  id v19 = v10;
  id v20 = v8;
  id v21 = v11;
  id v22 = v7;
  id v23 = v9;
  id v13 = v9;
  id v14 = v7;
  id v15 = v11;
  id v16 = v8;
  id v17 = v10;
  [v12 grabRegistryWithReadBlockAsync:v18];
}

@end