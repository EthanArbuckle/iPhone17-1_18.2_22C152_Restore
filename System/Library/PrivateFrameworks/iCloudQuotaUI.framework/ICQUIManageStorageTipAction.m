@interface ICQUIManageStorageTipAction
+ (id)actionsFromActionInfos:(id)a3;
- (NSString)actionButtonText;
- (NSString)actionName;
- (NSURL)actionURL;
- (id)description;
- (id)initFromActionInfo:(id)a3;
- (id)initFromRUITableViewRow:(id)a3;
@end

@implementation ICQUIManageStorageTipAction

- (id)description
{
  return (id)[NSString stringWithFormat:@"actionButtonText: %@, actionName: %@, actionURL: %@", self->_actionButtonText, self->_actionName, self->_actionURL];
}

- (id)initFromRUITableViewRow:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQUIManageStorageTipAction;
  v5 = [(ICQUIManageStorageTipAction *)&v16 init];
  if (v5)
  {
    v6 = [v4 attributes];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"actionButtonText"];
    actionButtonText = v5->_actionButtonText;
    v5->_actionButtonText = (NSString *)v7;

    uint64_t v9 = [v6 objectForKeyedSubscript:@"actionName"];
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v9;

    v11 = NSURL;
    v12 = [v6 objectForKeyedSubscript:@"actionURL"];
    uint64_t v13 = [v11 URLWithString:v12];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v13;
  }
  return v5;
}

- (id)initFromActionInfo:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQUIManageStorageTipAction;
  v5 = [(ICQUIManageStorageTipAction *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    actionButtonText = v5->_actionButtonText;
    v5->_actionButtonText = (NSString *)v6;

    v8 = [v4 icqLink];
    [v8 action];
    uint64_t v9 = _ICQStringForAction();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v9;

    v11 = [v4 actionURL];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = v11;
      actionURL = v5->_actionURL;
      v5->_actionURL = v13;
    }
    else
    {
      actionURL = [v4 icqLink];
      v15 = [actionURL serverUIURL];
      objc_super v16 = v15;
      if (v15)
      {
        v17 = v15;
        v18 = v5->_actionURL;
        v5->_actionURL = v17;
      }
      else
      {
        v18 = [v4 icqLink];
        uint64_t v19 = [v18 actionURL];
        v20 = v5->_actionURL;
        v5->_actionURL = (NSURL *)v19;
      }
    }
  }
  return v5;
}

+ (id)actionsFromActionInfos:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [ICQUIManageStorageTipAction alloc];
        id v12 = -[ICQUIManageStorageTipAction initFromActionInfo:](v11, "initFromActionInfo:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_actionButtonText, 0);
}

@end