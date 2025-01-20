@interface CKInboxModel
- (CKInboxModel)initWithSections:(id)a3 footerAction:(id)a4;
- (CKInboxModelDelegate)delegate;
- (NSArray)sections;
- (NSDictionary)itemsMap;
- (id)buildItemsMap:(id)a3;
- (id)footerAction;
- (id)logInboxViewedMetric;
- (void)setDelegate:(id)a3;
- (void)setFooterAction:(id)a3;
- (void)setIsCollapsed:(BOOL)a3;
- (void)setItemsMap:(id)a3;
- (void)setLogInboxViewedMetric:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation CKInboxModel

- (CKInboxModel)initWithSections:(id)a3 footerAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKInboxModel;
  v9 = [(CKInboxModel *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sections, a3);
    v11 = _Block_copy(v8);
    id footerAction = v10->_footerAction;
    v10->_id footerAction = v11;

    uint64_t v13 = [(CKInboxModel *)v10 buildItemsMap:v7];
    itemsMap = v10->_itemsMap;
    v10->_itemsMap = (NSDictionary *)v13;
  }
  return v10;
}

- (id)buildItemsMap:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v10 = [v9 items];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              objc_super v16 = [v15 filterMode];

              if (v16)
              {
                v17 = [v15 filterMode];
                [v4 setObject:v15 forKeyedSubscript:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  v18 = (void *)[v4 copy];
  return v18;
}

- (void)setIsCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 inboxModelDidUpdateIsCollapsed:v3];
  }
}

- (CKInboxModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKInboxModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (id)footerAction
{
  return self->_footerAction;
}

- (void)setFooterAction:(id)a3
{
}

- (id)logInboxViewedMetric
{
  return self->_logInboxViewedMetric;
}

- (void)setLogInboxViewedMetric:(id)a3
{
}

- (NSDictionary)itemsMap
{
  return self->_itemsMap;
}

- (void)setItemsMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong(&self->_logInboxViewedMetric, 0);
  objc_storeStrong(&self->_footerAction, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end