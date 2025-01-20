@interface WBTabGroupSyncAgent
- (WBCollectionConfiguration)configuration;
- (WBTabCollection)tabCollection;
- (WBTabGroupSyncAgent)initWithConfiguration:(id)a3;
- (void)setTabCollection:(id)a3;
@end

@implementation WBTabGroupSyncAgent

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (WBTabGroupSyncAgent)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBTabGroupSyncAgent;
  v6 = [(WBTabGroupSyncAgent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void)setTabCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end