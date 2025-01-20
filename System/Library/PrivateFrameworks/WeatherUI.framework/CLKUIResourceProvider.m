@interface CLKUIResourceProvider
- (CLKUIResourceProvider)initWithDelegate:(id)a3 key:(id)a4;
- (CLKUIResourceProviderDelegate)delegate;
- (NSNumber)key;
- (NSSet)uuidHistory;
- (void)addUuidToHistory:(id)a3;
@end

@implementation CLKUIResourceProvider

- (CLKUIResourceProvider)initWithDelegate:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIResourceProvider;
  v8 = [(CLKUIResourceProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = objc_opt_new();
    uuidHistory = v9->_uuidHistory;
    v9->_uuidHistory = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_key, a4);
  }

  return v9;
}

- (void)addUuidToHistory:(id)a3
{
}

- (CLKUIResourceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLKUIResourceProviderDelegate *)WeakRetained;
}

- (NSSet)uuidHistory
{
  return &self->_uuidHistory->super;
}

- (NSNumber)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuidHistory, 0);
}

@end