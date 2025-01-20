@interface PXComposeRecipientValidationManager
+ (PXComposeRecipientValidationManager)new;
- (PXComposeRecipientDataSource)dataSource;
- (PXComposeRecipientValidationManager)init;
- (PXComposeRecipientValidationManager)initWithDataSource:(id)a3;
- (PXComposeRecipientValidationManagerDelegate)delegate;
- (int64_t)validationTypeForComposeRecipient:(id)a3;
- (void)_handleAddressQueryResults:(id)a3 error:(id)a4;
- (void)_requestValidationForComposeRecipientsAtIndexes:(id)a3;
- (void)setDataSource:(id)a3 changeDetails:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PXComposeRecipientValidationManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_addressQueryController, 0);
  objc_storeStrong((id *)&self->_queryAddressesToComposeRecipientQuery, 0);
  objc_storeStrong((id *)&self->_composeRecipientsToQuery, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXComposeRecipientValidationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXComposeRecipientValidationManagerDelegate *)WeakRetained;
}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_handleAddressQueryResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = [(PXComposeRecipientValidationManager *)self dataSource];
  v8 = [v7 composeRecipients];
  v9 = (void *)[v8 copy];

  v10 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __72__PXComposeRecipientValidationManager__handleAddressQueryResults_error___block_invoke;
  v17 = &unk_1E5DBB230;
  SEL v21 = a2;
  v18 = self;
  id v19 = v9;
  id v11 = v10;
  id v20 = v11;
  id v12 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:&v14];

  if (objc_msgSend(v11, "count", v14, v15, v16, v17, v18))
  {
    v13 = [(PXComposeRecipientValidationManager *)self delegate];
    [v13 composeRecipientValidationManager:self didUpdateValidationWithChangedIndexes:v11];
  }
}

void __72__PXComposeRecipientValidationManager__handleAddressQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = [a3 BOOLValue];
  id v15 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];

  v7 = v15;
  if (!v15)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXComposeRecipientValidationManager.m", 201, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    v7 = 0;
  }
  uint64_t v8 = [v7 validationType];
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  if (v8 == v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXComposeRecipientValidationManager.m", 205, @"Invalid parameter not satisfying: %@", @"previousType != newType" object file lineNumber description];
  }
  [v15 setValidationType:v9];
  v10 = *(void **)(a1 + 40);
  id v11 = [v15 composeRecipient];
  uint64_t v12 = [v10 indexOfObject:v11];

  [*(id *)(a1 + 48) addIndex:v12];
}

- (int64_t)validationTypeForComposeRecipient:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXComposeRecipientValidationManager.m", 186, @"Invalid parameter not satisfying: %@", @"composeRecipient" object file lineNumber description];
  }
  int v6 = [(NSMutableDictionary *)self->_composeRecipientsToQuery objectForKeyedSubscript:v5];
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientValidationManager.m", 188, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  int64_t v7 = [v6 validationType];

  return v7;
}

- (void)_requestValidationForComposeRecipientsAtIndexes:(id)a3
{
  id v5 = a3;
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  int64_t v7 = [(PXComposeRecipientValidationManager *)self dataSource];
  uint64_t v8 = [v7 composeRecipients];
  uint64_t v9 = (void *)[v8 copy];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke;
  v16[3] = &unk_1E5DBB1E0;
  id v10 = v9;
  SEL v20 = a2;
  id v17 = v10;
  v18 = self;
  id v11 = v6;
  id v19 = v11;
  [v5 enumerateIndexesUsingBlock:v16];
  if ([v11 count])
  {
    objc_initWeak(&location, self);
    addressQueryController = self->_addressQueryController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke_2;
    v13[3] = &unk_1E5DBB208;
    objc_copyWeak(&v14, &location);
    [(PXIDSAddressQueryController *)addressQueryController performBatchQueryForAddresses:v11 resultHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v3 = [v15 recipient];
  v4 = [v3 suggestedTransport];
  id v5 = v4;
  if (v4)
  {
    int v6 = [v4 address];
    uint64_t v7 = [v5 addressKind];
    if (!v6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PXComposeRecipientValidationManager.m", 147, @"Invalid parameter not satisfying: %@", @"address" object file lineNumber description];
    }
    switch(v7)
    {
      case 1:
        uint64_t v10 = MEMORY[0x1AD109970](v6);
        break;
      case 2:
        uint64_t v10 = IDSCopyIDForPhoneNumber();
        break;
      case 0:
        id v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"PXComposeRecipientValidationManager.m" lineNumber:160 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
LABEL_7:
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PXComposeRecipientValidationManager.m", 164, @"Invalid parameter not satisfying: %@", @"addressToQuery" object file lineNumber description];

        uint64_t v9 = 0;
LABEL_11:
        id v11 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v9];
        if (v11)
        {
          [*(id *)(*(void *)(a1 + 40) + 8) setObject:v11 forKeyedSubscript:v15];
        }
        else
        {
          uint64_t v12 = [[PXComposeRecipientValidationQuery alloc] initWithComposeRecipient:v15 address:v6 addressKind:v7];
          [*(id *)(*(void *)(a1 + 40) + 8) setObject:v12 forKeyedSubscript:v15];
          [*(id *)(*(void *)(a1 + 40) + 16) setObject:v12 forKeyedSubscript:v9];
          [*(id *)(a1 + 48) addObject:v9];
        }
        goto LABEL_15;
    }
    uint64_t v9 = (void *)v10;
    if (v10) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_15:
}

void __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleAddressQueryResults:v6 error:v5];
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  uint64_t v7 = (PXComposeRecipientDataSource *)a3;
  if (self->_dataSource != v7)
  {
    uint64_t v12 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    id v8 = a4;
    uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v10 = [v8 insertedIndexes];
    id v11 = [v8 changedIndexes];

    if ([v10 count]) {
      [v9 addIndexes:v10];
    }
    if ([v11 count]) {
      [v9 addIndexes:v11];
    }
    [(PXComposeRecipientValidationManager *)self _requestValidationForComposeRecipientsAtIndexes:v9];

    uint64_t v7 = v12;
  }
}

- (PXComposeRecipientValidationManager)initWithDataSource:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXComposeRecipientValidationManager.m", 103, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXComposeRecipientValidationManager;
  uint64_t v7 = [(PXComposeRecipientValidationManager *)&v20 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    composeRecipientsToQuery = v8->_composeRecipientsToQuery;
    v8->_composeRecipientsToQuery = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    queryAddressesToComposeRecipientQuery = v8->_queryAddressesToComposeRecipientQuery;
    v8->_queryAddressesToComposeRecipientQuery = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(PXIDSAddressQueryController);
    addressQueryController = v8->_addressQueryController;
    v8->_addressQueryController = v13;

    id v15 = (void *)MEMORY[0x1E4F28D60];
    v16 = [(PXComposeRecipientDataSource *)v8->_dataSource composeRecipients];
    id v17 = objc_msgSend(v15, "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "count"));

    [(PXComposeRecipientValidationManager *)v8 _requestValidationForComposeRecipientsAtIndexes:v17];
  }

  return v8;
}

- (PXComposeRecipientValidationManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientValidationManager.m", 95, @"%s is not available as initializer", "-[PXComposeRecipientValidationManager init]");

  abort();
}

+ (PXComposeRecipientValidationManager)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXComposeRecipientValidationManager.m", 99, @"%s is not available as initializer", "+[PXComposeRecipientValidationManager new]");

  abort();
}

@end