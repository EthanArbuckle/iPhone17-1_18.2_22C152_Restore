@interface WBSTabGroupIconRequest
- (BOOL)isEqual:(id)a3;
- (CGSize)sizeForDrawing;
- (NSArray)tabs;
- (NSString)tabGroupUUID;
- (NSString)uniqueIdentifier;
- (WBSTabGroupIconRequest)initWithTabGroup:(id)a3 tabProvider:(id)a4;
- (WBTabProvider)tabProvider;
- (unint64_t)hash;
@end

@implementation WBSTabGroupIconRequest

- (WBSTabGroupIconRequest)initWithTabGroup:(id)a3 tabProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSTabGroupIconRequest;
  v8 = [(WBSSiteMetadataRequest *)&v13 initWithURL:0 extraInfo:0];
  if (v8)
  {
    uint64_t v9 = [v6 uuid];
    tabGroupUUID = v8->_tabGroupUUID;
    v8->_tabGroupUUID = (NSString *)v9;

    objc_storeWeak((id *)&v8->_tabProvider, v7);
    v11 = v8;
  }

  return v8;
}

- (NSArray)tabs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabProvider);
  v4 = [WeakRetained tabGroupWithUUID:self->_tabGroupUUID];

  if (v4)
  {
    v5 = [v4 tabs];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSString)uniqueIdentifier
{
  return self->_tabGroupUUID;
}

- (unint64_t)hash
{
  return [(NSString *)self->_tabGroupUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSTabGroupIconRequest *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      tabGroupUUID = self->_tabGroupUUID;
      id v6 = [(WBSTabGroupIconRequest *)v4 tabGroupUUID];
      char v7 = [(NSString *)tabGroupUUID isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (CGSize)sizeForDrawing
{
  double v2 = 64.0;
  double v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (WBTabProvider)tabProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabProvider);
  return (WBTabProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabProvider);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
}

@end