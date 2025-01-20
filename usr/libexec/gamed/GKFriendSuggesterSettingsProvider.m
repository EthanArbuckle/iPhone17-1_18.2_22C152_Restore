@interface GKFriendSuggesterSettingsProvider
- (GKFriendSuggesterSettingsProvider)initWithStoreBag:(id)a3;
- (GKStoreBag)storeBag;
- (OS_dispatch_queue)serialQueue;
- (void)fetchSettingsWithQueue:(id)a3 handler:(id)a4;
- (void)fetchSettingsWithQueue:(id)a3 valuesForKeys:(id)a4 handler:(id)a5;
- (void)setSerialQueue:(id)a3;
- (void)setStoreBag:(id)a3;
@end

@implementation GKFriendSuggesterSettingsProvider

- (GKFriendSuggesterSettingsProvider)initWithStoreBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKFriendSuggesterSettingsProvider;
  v6 = [(GKFriendSuggesterSettingsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeBag, a3);
  }

  return v7;
}

- (void)fetchSettingsWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[GKFriendSuggesterSettings allBagKeys];
  [(GKFriendSuggesterSettingsProvider *)self fetchSettingsWithQueue:v7 valuesForKeys:v8 handler:v6];
}

- (void)fetchSettingsWithQueue:(id)a3 valuesForKeys:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(GKFriendSuggesterSettingsProvider *)self storeBag];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100157CE8;
  v13[3] = &unk_1002D5140;
  id v14 = v8;
  id v12 = v8;
  [v11 getValuesForKeys:v9 queue:v10 completion:v13];
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (GKStoreBag)storeBag
{
  return self->_storeBag;
}

- (void)setStoreBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeBag, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end