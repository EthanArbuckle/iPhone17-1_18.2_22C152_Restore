@interface PKTransactionCloudKitDebugDetailsViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKTransactionCloudKitDebugDetailsViewController)initWithTransaction:(id)a3;
- (id)_cellWithTitleText:(id)a3 valueText:(id)a4;
- (id)_recordForSection:(int64_t)a3;
- (id)_recordNameForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_callCloudRecordObjectDescriptionBlocks;
- (void)_loadCloudData;
- (void)_processCloudRecords;
- (void)cloudRecordObjectDescriptionWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKTransactionCloudKitDebugDetailsViewController

- (PKTransactionCloudKitDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionCloudKitDebugDetailsViewController;
  v6 = [(PKTransactionCloudKitDebugDetailsViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    uint64_t v8 = [MEMORY[0x1E4F845A8] sharedInstance];
    cloudStoreService = v7->_cloudStoreService;
    v7->_cloudStoreService = (PKCloudStoreService *)v8;

    v7->_inBridge = PKBridgeUsesDarkAppearance();
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cloudStoreObjectHandlers = v7->_cloudStoreObjectHandlers;
    v7->_cloudStoreObjectHandlers = v10;

    [(PKTransactionCloudKitDebugDetailsViewController *)v7 _loadCloudData];
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionCloudKitDebugDetailsViewController;
  [(PKTransactionCloudKitDebugDetailsViewController *)&v4 viewDidLoad];
  v3 = [(PKTransactionCloudKitDebugDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];
}

- (void)cloudRecordObjectDescriptionWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v7 = v4;
    if (self->_loadingCloudRecordObject)
    {
      cloudStoreObjectHandlers = self->_cloudStoreObjectHandlers;
      v6 = _Block_copy(v4);
      [(NSMutableSet *)cloudStoreObjectHandlers addObject:v6];
    }
    else
    {
      v6 = [(PKCloudRecordObject *)self->_cloudRecordObject description];
      v7[2](v7, v6);
    }

    objc_super v4 = v7;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_loadingCloudRecordObject || !self->_cloudRecordObject)
  {
    int64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [(PKTransactionCloudKitDebugDetailsViewController *)self _recordNameForSection:a4];
    v9 = [(NSMutableDictionary *)self->_keysForRecordName objectForKey:v8];
    int64_t v7 = [v9 count];
  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  if (self->_loadingCloudRecordObject || !self->_cloudRecordObject) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = [(NSMutableDictionary *)self->_keysForRecordName count];
  }

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (self->_cloudRecordObject)
  {
    id v4 = [(PKTransactionCloudKitDebugDetailsViewController *)self _recordForSection:a4];
    int64_t v5 = NSString;
    id v6 = [v4 recordType];
    int64_t v7 = [v5 stringWithFormat:@"recordType: %@", v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_loadingCloudRecordObject)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    v10 = [(PKTransactionCloudKitDebugDetailsViewController *)self _cellWithTitleText:@"Loading" valueText:0];
    [v10 setAccessoryView:v9];
    [v9 startAnimating];
LABEL_5:

    goto LABEL_6;
  }
  if (self->_cloudRecordObject)
  {
    v9 = -[PKTransactionCloudKitDebugDetailsViewController _recordNameForSection:](self, "_recordNameForSection:", [v7 section]);
    v11 = [(NSMutableDictionary *)self->_keysForRecordName objectForKey:v9];
    v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "row"));

    objc_super v13 = [(NSMutableDictionary *)self->_valuesForRecordName objectForKey:v9];
    v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v8, "row"));

    v15 = [v14 description];
    v10 = [(PKTransactionCloudKitDebugDetailsViewController *)self _cellWithTitleText:v12 valueText:v15];

    goto LABEL_5;
  }
  v10 = [(PKTransactionCloudKitDebugDetailsViewController *)self _cellWithTitleText:@"No CloudKit Data" valueText:0];
LABEL_6:

  return v10;
}

- (void)_callCloudRecordObjectDescriptionBlocks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableSet *)self->_cloudStoreObjectHandlers allObjects];
  id v4 = (void *)[v3 copy];

  [(NSMutableSet *)self->_cloudStoreObjectHandlers removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(PKCloudRecordObject *)self->_cloudRecordObject description];
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_cellWithTitleText:(id)a3 valueText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKTransactionCloudKitDebugDetailsViewController *)self tableView];
  uint64_t v9 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];

  [v9 setSelectionStyle:0];
  uint64_t v10 = [v9 keyLabel];
  [v10 setText:v7];

  v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v10 setTextColor:v11];

  if (self->_inBridge)
  {
    long long v12 = PKBridgeTextColor();
    [v10 setTextColor:v12];
  }
  long long v13 = [v9 valueLabel];
  [v13 setText:v6];

  return v9;
}

- (id)_recordNameForSection:(int64_t)a3
{
  v3 = [(PKTransactionCloudKitDebugDetailsViewController *)self _recordForSection:a3];
  id v4 = [v3 recordID];
  id v5 = [v4 recordName];

  return v5;
}

- (id)_recordForSection:(int64_t)a3
{
  return [(NSArray *)self->_records objectAtIndex:a3];
}

- (void)_loadCloudData
{
  if (!self->_cloudRecordObject && !self->_loadingCloudRecordObject)
  {
    v3 = [(PKPaymentTransaction *)self->_transaction recordTypesAndNamesForCodingType:2];
    id v4 = [v3 firstObject];
    id v5 = [v4 allValues];
    id v6 = [v5 firstObject];

    id v7 = [MEMORY[0x1E4F84CF8] recordNamePrefix];
    uint64_t v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_1EF1B5B50];

    if (v8)
    {
      self->_loadingCloudRecordObject = 1;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F845B0]) initWithItemType:1 recordName:v8];
      uint64_t v10 = [(PKPaymentTransaction *)self->_transaction accountIdentifier];
      [v9 setAccountIdentifier:v10];

      v11 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
      [v9 setTransactionSourceIdentifier:v11];

      long long v12 = [(PKPaymentTransaction *)self->_transaction altDSID];
      [v9 setAltDSID:v12];

      objc_msgSend(v9, "setAccountType:", -[PKPaymentTransaction accountType](self->_transaction, "accountType"));
      cloudStoreService = self->_cloudStoreService;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke;
      v14[3] = &unk_1E59DDB08;
      v14[4] = self;
      [(PKCloudStoreService *)cloudStoreService cloudStoreRecordArrayWithConfiguration:v9 completion:v14];
    }
  }
}

void __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1056) = 0;
  v2 = [*(id *)(a1 + 40) allObjects];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1024);
  *(void *)(v4 + 1024) = v3;

  id v6 = [*(id *)(*(void *)(a1 + 32) + 1024) records];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1032);
  *(void *)(v8 + 1032) = v7;

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10[128])
  {
    [v10 _processCloudRecords];
    uint64_t v10 = *(void **)(a1 + 32);
  }
  [v10 _callCloudRecordObjectDescriptionBlocks];
  v11 = [*(id *)(a1 + 32) view];
  [v11 setNeedsLayout];

  id v12 = [*(id *)(a1 + 32) tableView];
  [v12 reloadData];
}

- (void)_processCloudRecords
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v35 = self;
  obuint64_t j = self->_records;
  uint64_t v40 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v40)
  {
    uint64_t v37 = *(void *)v54;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v3;
        uint64_t v4 = *(void **)(*((void *)&v53 + 1) + 8 * v3);
        id v5 = objc_msgSend(v4, "recordID", v35);
        uint64_t v6 = [v5 recordName];

        uint64_t v7 = [v4 valuesByKey];
        uint64_t v8 = [v4 encryptedValues];
        uint64_t v9 = [v7 allKeys];
        v41 = [v8 allKeys];
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v10 addObject:@"recordName"];
        v43 = (void *)v6;
        [v11 addObject:v6];
        [v10 addObject:@"creationDate"];
        id v12 = [v4 creationDate];
        [v11 addObject:v12];

        [v10 addObject:@"modificationDate"];
        long long v13 = [v4 modificationDate];
        [v11 addObject:v13];

        [v10 addObject:@"modifiedByDevice"];
        long long v14 = [v4 modifiedByDevice];
        [v11 addObject:v14];

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v15 = v9;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v50 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              v21 = [v7 objectForKey:v20];
              [v10 addObject:v20];
              [v11 addObject:v21];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v17);
        }
        v42 = v15;

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v22 = v41;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v46 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * j);
              v28 = [v8 objectForKey:v27];
              [v10 addObject:v27];
              [v11 addObject:v28];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v24);
        }

        v29 = (void *)[v10 copy];
        [v39 setObject:v29 forKey:v43];

        v30 = (void *)[v11 copy];
        [v38 setObject:v30 forKey:v43];

        uint64_t v3 = v44 + 1;
      }
      while (v44 + 1 != v40);
      uint64_t v40 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v40);
  }

  uint64_t v31 = [v39 copy];
  keysForRecordName = v35->_keysForRecordName;
  v35->_keysForRecordName = (NSMutableDictionary *)v31;

  uint64_t v33 = [v38 copy];
  valuesForRecordName = v35->_valuesForRecordName;
  v35->_valuesForRecordName = (NSMutableDictionary *)v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreObjectHandlers, 0);
  objc_storeStrong((id *)&self->_valuesForRecordName, 0);
  objc_storeStrong((id *)&self->_keysForRecordName, 0);
  objc_storeStrong((id *)&self->_cloudStoreService, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_cloudRecordObject, 0);
}

@end