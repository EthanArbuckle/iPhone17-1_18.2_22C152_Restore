@interface PDAccountAdStatusChangesObserver
- (PDAccountAdStatusChangesObserver)initWithAccountManager:(id)a3;
- (id)_uuidByAccountFeature:(unint64_t)a3;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)dealloc;
@end

@implementation PDAccountAdStatusChangesObserver

- (PDAccountAdStatusChangesObserver)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountAdStatusChangesObserver;
  v6 = [(PDAccountAdStatusChangesObserver *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    [(PDAccountManager *)v7->_accountManager registerObserver:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(PDAccountManager *)self->_accountManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDAccountAdStatusChangesObserver;
  [(PDAccountAdStatusChangesObserver *)&v3 dealloc];
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  v6 = -[PDAccountAdStatusChangesObserver _uuidByAccountFeature:](self, "_uuidByAccountFeature:", [v5 feature]);
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002E0FB4;
    v7[3] = &unk_10072F6E8;
    id v8 = v5;
    +[ADStatusConditions setStatusCondition:v6 completionHandler:v7];
  }
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  v7 = -[PDAccountAdStatusChangesObserver _uuidByAccountFeature:](self, "_uuidByAccountFeature:", [v6 feature]);
  if (v7)
  {
    id v8 = [v6 creditDetails];
    objc_super v9 = [v8 accountSummary];

    v10 = [v9 adjustedBalance];
    if ([v6 state] == (id)4
      && v10
      && (+[NSDecimalNumber zero],
          v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v10 compare:v11],
          v11,
          v12 != (id)1))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1002E1258;
      v16[3] = &unk_10072F6E8;
      v13 = &v17;
      id v17 = v6;
      +[ADStatusConditions clearStatusCondition:v7 completionHandler:v16];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1002E1340;
      v14[3] = &unk_10072F6E8;
      v13 = &v15;
      id v15 = v6;
      +[ADStatusConditions setStatusCondition:v7 completionHandler:v14];
    }
  }
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  id v6 = -[PDAccountAdStatusChangesObserver _uuidByAccountFeature:](self, "_uuidByAccountFeature:", [v5 feature]);
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002E14F0;
    v7[3] = &unk_10072F6E8;
    id v8 = v5;
    +[ADStatusConditions clearStatusCondition:v6 completionHandler:v7];
  }
}

- (id)_uuidByAccountFeature:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", @"5DE1449E-0748-6CC5-CA7D-548E7E7AC24C", v3);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end