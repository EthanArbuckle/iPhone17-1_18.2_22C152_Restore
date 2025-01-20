@interface PKTransactionSpotlightDebugDetailsViewController
- (PKTransactionSpotlightDebugDetailsViewController)initWithTransaction:(id)a3;
- (id)_cellWithTitleText:(id)a3 valueText:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadItemWithCompletion:(id)a3;
- (void)spotlightObjectDescriptionWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKTransactionSpotlightDebugDetailsViewController

- (PKTransactionSpotlightDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionSpotlightDebugDetailsViewController;
  v6 = [(PKTransactionSpotlightDebugDetailsViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v8 = (PKSearchService *)objc_alloc_init(MEMORY[0x1E4F84FA0]);
    searchService = v7->_searchService;
    v7->_searchService = v8;

    v7->_inBridge = PKBridgeUsesDarkAppearance();
    [(PKTransactionSpotlightDebugDetailsViewController *)v7 loadItemWithCompletion:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionSpotlightDebugDetailsViewController;
  [(PKTransactionSpotlightDebugDetailsViewController *)&v4 viewDidLoad];
  v3 = [(PKTransactionSpotlightDebugDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];
}

- (id)_cellWithTitleText:(id)a3 valueText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKTransactionSpotlightDebugDetailsViewController *)self tableView];
  v9 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];

  [v9 setSelectionStyle:0];
  v10 = [v9 keyLabel];
  [v10 setNumberOfLines:0];
  [v10 setText:v7];

  objc_super v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v10 setTextColor:v11];

  if (self->_inBridge)
  {
    v12 = PKBridgeTextColor();
    [v10 setTextColor:v12];
  }
  v13 = [v9 valueLabel];
  [v13 setText:v6];

  return v9;
}

- (void)loadItemWithCompletion:(id)a3
{
  id v4 = a3;
  searchService = self->_searchService;
  id v6 = [(PKPaymentTransaction *)self->_transaction identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke;
  v8[3] = &unk_1E59DA720;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(PKSearchService *)searchService indexedTransactionWithIdentifier:v6 completion:v8];
}

void __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke_2;
  v10[3] = &unk_1E59CB728;
  id v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1040) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1048), *(id *)(a1 + 48));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1056);
  *(void *)(v3 + 1056) = v2;

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1072);
  *(void *)(v6 + 1072) = v5;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 1064);
  *(void *)(v9 + 1064) = v8;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 1080);
  *(void *)(v12 + 1080) = v11;

  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    v15 = [v14 attributeSet];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v16 = PKCoreSpotlightTransactionKeys();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(NSString **)(*((void *)&v42 + 1) + 8 * i);
          SEL v22 = NSSelectorFromString(v21);
          uint64_t v23 = [v15 methodForSelector:v22];
          if (v22)
          {
            v24 = (void (*)(void *, SEL))v23;
            if (objc_opt_respondsToSelector())
            {
              v25 = v24(v15, v22);
              if (v25)
              {
                [*(id *)(*(void *)(a1 + 32) + 1056) addObject:v21];
                [*(id *)(*(void *)(a1 + 32) + 1064) setObject:v25 forKey:v21];
              }
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v18);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    PKCoreSpotlightTransactionCustomKeys();
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * j);
          v31 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:v30 searchable:1 searchableByDefault:1 unique:0 multiValued:0];
          uint64_t v32 = [v15 valueForCustomKey:v31];
          if (v32)
          {
            v33 = (void *)v32;
            v34 = v31;
          }
          else
          {
            v34 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:v30 searchable:1 searchableByDefault:1 unique:0 multiValued:1];

            v33 = [v15 valueForCustomKey:v34];
            if (!v33) {
              goto LABEL_23;
            }
          }
          [*(id *)(*(void *)(a1 + 32) + 1072) addObject:v30];
          [*(id *)(*(void *)(a1 + 32) + 1080) setObject:v33 forKey:v30];

LABEL_23:
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v27);
    }
  }
  v35 = [*(id *)(a1 + 32) tableView];
  [v35 reloadData];

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return @"Custom Attributes";
  }
  else {
    return @"Attributes";
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_loading) {
    goto LABEL_2;
  }
  if (a4)
  {
    p_customAttributes = &self->_customAttributes;
LABEL_6:
    int64_t v7 = [(NSMutableArray *)*p_customAttributes count];
    goto LABEL_7;
  }
  p_customAttributes = &self->_attributes;
  if ([(NSMutableArray *)*p_customAttributes count]) {
    goto LABEL_6;
  }
LABEL_2:
  int64_t v7 = 1;
LABEL_7:

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_loading)
  {
    id v8 = @"Loading";
LABEL_3:
    uint64_t v9 = [(PKTransactionSpotlightDebugDetailsViewController *)self _cellWithTitleText:v8 valueText:0];
    goto LABEL_12;
  }
  error = self->_error;
  if (!error)
  {
    if (self->_item)
    {
      if ([v7 section])
      {
        v14 = -[NSMutableArray objectAtIndex:](self->_customAttributes, "objectAtIndex:", [v7 row]);
        v15 = [v14 stringByReplacingOccurrencesOfString:@"Passbook_" withString:&stru_1EF1B5B50];
        v16 = [(NSMutableDictionary *)self->_customAttributesPerKey objectForKey:v14];
        uint64_t v17 = [v16 description];
        uint64_t v9 = [(PKTransactionSpotlightDebugDetailsViewController *)self _cellWithTitleText:v15 valueText:v17];
      }
      else
      {
        v14 = -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", [v7 row]);
        v15 = [(NSMutableDictionary *)self->_attributesPerKey objectForKey:v14];
        v16 = [v15 description];
        uint64_t v9 = [(PKTransactionSpotlightDebugDetailsViewController *)self _cellWithTitleText:v14 valueText:v16];
      }

      goto LABEL_12;
    }
    id v8 = @"No item in Spotlight";
    goto LABEL_3;
  }
  id v11 = NSString;
  uint64_t v12 = [(NSError *)error description];
  id v13 = [v11 stringWithFormat:@"Error: %@", v12];
  uint64_t v9 = [(PKTransactionSpotlightDebugDetailsViewController *)self _cellWithTitleText:v13 valueText:0];

LABEL_12:

  return v9;
}

- (void)spotlightObjectDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CAD18;
    aBlock[4] = self;
    id v11 = v4;
    id v6 = (void (**)(void))_Block_copy(aBlock);
    id v7 = v6;
    if (self->_loading || !self->_item)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke_2;
      v8[3] = &unk_1E59CAA98;
      uint64_t v9 = v6;
      [(PKTransactionSpotlightDebugDetailsViewController *)self loadItemWithCompletion:v8];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1064) description];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1080) description];
  id v4 = [v2 stringByAppendingFormat:@"\n%@", v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_customAttributesPerKey, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_attributesPerKey, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_searchService, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end