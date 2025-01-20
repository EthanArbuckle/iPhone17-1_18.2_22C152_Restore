@interface CSDChannelProviderManager
- (CSDChannelProviderManager)init;
- (CSDChannelProviderManager)initWithDataSource:(id)a3;
- (CSDChannelProviderManagerDataSource)dataSource;
- (CSDChannelProviderManagerDelegate)delegateController;
- (id)providerForIdentifier:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)channelProviderManagerDataSource:(id)a3 didChangeProviderByIdentifier:(id)a4;
- (void)registerProvider:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)unregisterProvider:(id)a3;
- (void)updateProviderByIdentifier;
@end

@implementation CSDChannelProviderManager

- (CSDChannelProviderManager)init
{
  v3 = objc_alloc_init(CSDChannelProviderManagerDataSource);
  v4 = [(CSDChannelProviderManager *)self initWithDataSource:v3];

  return v4;
}

- (CSDChannelProviderManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDChannelProviderManager;
  v6 = [(CSDChannelProviderManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(CSDChannelProviderManagerDataSource *)v7->_dataSource setDelegate:v7];
    v8 = (CSDChannelProviderManagerDelegate *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;
  }
  return v7;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDChannelProviderManager *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDChannelProviderManager *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)registerProvider:(id)a3
{
  id v4 = a3;
  id v6 = [(CSDChannelProviderManager *)self dataSource];
  id v5 = [v4 identifier];
  [v6 setProvider:v4 forIdentifier:v5];
}

- (void)unregisterProvider:(id)a3
{
  id v4 = a3;
  id v6 = [(CSDChannelProviderManager *)self dataSource];
  id v5 = [v4 identifier];

  [v6 setProvider:0 forIdentifier:v5];
}

- (id)providerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDChannelProviderManager *)self dataSource];
  id v6 = [v5 providerForIdentifier:v4];

  return v6;
}

- (void)updateProviderByIdentifier
{
  id v2 = [(CSDChannelProviderManager *)self dataSource];
  [v2 updateProviderByIdentifier];
}

- (void)channelProviderManagerDataSource:(id)a3 didChangeProviderByIdentifier:(id)a4
{
  id v5 = [(CSDChannelProviderManager *)self delegateController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B1150;
  v6[3] = &unk_100509A70;
  v6[4] = self;
  [v5 enumerateDelegatesUsingBlock:v6];
}

- (CSDChannelProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (CSDChannelProviderManagerDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end