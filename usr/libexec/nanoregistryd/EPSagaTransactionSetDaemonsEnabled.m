@interface EPSagaTransactionSetDaemonsEnabled
+ (void)enableDaemons:(unint64_t)a3 serviceRegistry:(id)a4 completion:(id)a5;
+ (void)getNormalDaemonValueWith:(id)a3 serviceRegistry:(id)a4 forceEnableWhenPairedOrActive:(BOOL)a5 completion:(id)a6;
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionSetDaemonsEnabled

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"setDaemonsEnabled"];
  v9 = [v7 objectForKeyedSubscript:@"forceEnableIfPairedOrActive"];
  v10 = [v7 operands];

  v11 = [v10 objectForKeyedSubscript:@"setDaemonsEnabledNormalizeDeviceID"];

  if (v11)
  {
    v12 = [v11 value];
    v13 = objc_opt_class();
    id v14 = [v9 BOOLValue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001D73C;
    v16[3] = &unk_100166008;
    v16[4] = self;
    id v17 = v6;
    [v13 getNormalDaemonValueWith:v12 serviceRegistry:v17 forceEnableWhenPairedOrActive:v14 completion:v16];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D81C;
    v15[3] = &unk_1001655F8;
    v15[4] = self;
    [objc_opt_class() enableDaemons:[v8 integerValue] serviceRegistry:v6 completion:v15];
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"setDaemonsEnabledRollback"];
  v9 = [v7 objectForKeyedSubscript:@"forceEnableIfPairedOrActive"];
  v10 = [v7 operands];

  v11 = [v10 objectForKeyedSubscript:@"setDaemonsEnabledRollbackNormalizeDeviceID"];

  if (v11)
  {
    v12 = [v11 value];
    v13 = objc_opt_class();
    id v14 = [v9 BOOLValue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001DA54;
    v16[3] = &unk_100166008;
    v16[4] = self;
    id v17 = v6;
    [v13 getNormalDaemonValueWith:v12 serviceRegistry:v17 forceEnableWhenPairedOrActive:v14 completion:v16];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001DB34;
    v15[3] = &unk_1001655F8;
    v15[4] = self;
    [objc_opt_class() enableDaemons:[v8 integerValue] serviceRegistry:v6 completion:v15];
  }
}

+ (void)getNormalDaemonValueWith:(id)a3 serviceRegistry:(id)a4 forceEnableWhenPairedOrActive:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 serviceFromClass:objc_opt_class()];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001DC9C;
  v16[3] = &unk_100166058;
  id v17 = v9;
  id v18 = v10;
  BOOL v20 = a5;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [v12 grabRegistryWithReadBlockAsync:v16];
}

+ (void)enableDaemons:(unint64_t)a3 serviceRegistry:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 serviceFromProtocol:&OBJC_PROTOCOL___NRRootCommander];
  id v10 = [v9 enableNanoDaemons:a3 didEnable:0];
  if (v8)
  {
    id v11 = [v7 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E230;
    block[3] = &unk_100165D10;
    id v13 = v8;
    dispatch_async(v11, block);
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
}

@end