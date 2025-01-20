@interface PXComposeRecipientDataSourceManager
- (NSDictionary)diagnosticDictionary;
- (PXComposeRecipientDataSource)dataSource;
- (PXComposeRecipientDataSourceManager)init;
- (PXComposeRecipientDataSourceManager)initWithPeopleSuggestionsDataSourceManager:(id)a3 sourceType:(int64_t)a4;
- (PXComposeRecipientDataSourceManagerDelegate)delegate;
- (PXPeopleSuggestionsDataSource)peopleSuggestionsDataSource;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager;
- (id)_composeRecipientsFromCurrentPeopleSuggestionsDataSource;
- (id)_createComposeRecipientDataSourceFromCurrentState;
- (int64_t)_lastValidComposeRecipientIndex;
- (int64_t)sourceType;
- (unint64_t)numberOfPeopleSuggested;
- (void)_addComposeRecipients:(id)a3;
- (void)_replaceComposeRecipientAtIndex:(int64_t)a3 withComposeRecipient:(id)a4;
- (void)addRecipients:(id)a3;
- (void)deleteComposeRecipientAtIndex:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)replaceComposeRecipientAtIndex:(unint64_t)a3 withNewComposeRecipient:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumberOfPeopleSuggested:(unint64_t)a3;
- (void)setPeopleSuggestionsDataSource:(id)a3;
- (void)setPeopleSuggestionsDataSourceManager:(id)a3;
@end

@implementation PXComposeRecipientDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
}

- (void)setNumberOfPeopleSuggested:(unint64_t)a3
{
  self->_numberOfPeopleSuggested = a3;
}

- (unint64_t)numberOfPeopleSuggested
{
  return self->_numberOfPeopleSuggested;
}

- (void)setPeopleSuggestionsDataSource:(id)a3
{
}

- (PXPeopleSuggestionsDataSource)peopleSuggestionsDataSource
{
  return self->_peopleSuggestionsDataSource;
}

- (void)setDataSource:(id)a3
{
}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (PXComposeRecipientDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXComposeRecipientDataSourceManagerDelegate *)WeakRetained;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((a4 & 1) != 0 && (void *)PXPeopleSuggestionManagerObservationContext == a5)
  {
    v7 = [(PXComposeRecipientDataSourceManager *)self peopleSuggestionsDataSource];
    v8 = [(PXComposeRecipientDataSourceManager *)self peopleSuggestionsDataSourceManager];
    v9 = [v8 dataSource];

    v10 = [(PXComposeRecipientDataSourceManager *)self peopleSuggestionsDataSourceManager];
    v11 = [v10 changeHistory];
    v12 = objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v9, "identifier"));

    if ([v12 count] == 1)
    {
      v13 = [v12 firstObject];
    }
    else
    {
      v13 = 0;
    }
    v14 = [v13 itemChangesInSection:0];
    [(PXComposeRecipientDataSourceManager *)self setPeopleSuggestionsDataSource:v9];
    uint64_t v15 = [v7 numberOfItemsInSection:0];
    uint64_t v16 = [v9 numberOfItemsInSection:0];
    v17 = [v14 insertedIndexes];
    [v14 changedIndexes];
    v41 = SEL v40 = a2;
    BOOL v18 = !v15
       && ([v17 count] || v16 >= 1)
       && [(PXComposeRecipientDataSourceManager *)self sourceType] == 0;
    v19 = v41;
    uint64_t v20 = [v41 count];
    if (!v18 && !v20) {
      goto LABEL_35;
    }
    v38 = v17;
    v39 = v13;
    if (v18)
    {
      v36 = v12;
      v37 = v7;
      v21 = [MEMORY[0x1E4F1CA48] array];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v22 = self->_composeRecipients;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v28 = [v27 personSuggestion];

            if (v28)
            {
              v29 = [MEMORY[0x1E4F28B00] currentHandler];
              [v29 handleFailureInMethod:v40, self, @"PXComposeRecipientDataSourceManager.m", 343, @"Invalid parameter not satisfying: %@", @"composeRecipient.personSuggestion == nil" object file lineNumber description];
            }
            [v21 addObject:v27];
          }
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v24);
      }

      [(NSMutableSet *)self->_recipients removeAllObjects];
      [(NSMutableArray *)self->_composeRecipients removeAllObjects];
      v30 = [(PXComposeRecipientDataSourceManager *)self _composeRecipientsFromCurrentPeopleSuggestionsDataSource];
      v31 = [v30 arrayByAddingObjectsFromArray:v21];
      if ([v31 count]) {
        [(PXComposeRecipientDataSourceManager *)self _addComposeRecipients:v31];
      }
      -[PXComposeRecipientDataSourceManager setNumberOfPeopleSuggested:](self, "setNumberOfPeopleSuggested:", [v30 count]);
      v12 = v36;
      v7 = v37;
    }
    else
    {
      v21 = [MEMORY[0x1E4F28E60] indexSet];
      v30 = [MEMORY[0x1E4F28E60] indexSet];
      if (!v14 || ([v14 hasIncrementalChanges] & 1) == 0)
      {
        v32 = [(PXComposeRecipientDataSourceManager *)self _composeRecipientsFromCurrentPeopleSuggestionsDataSource];
        v19 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v32, "count"));
      }
      if ([v19 count])
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __68__PXComposeRecipientDataSourceManager_observable_didChange_context___block_invoke;
        v42[3] = &unk_1E5DD3088;
        id v43 = v9;
        v44 = self;
        id v45 = v21;
        [v19 enumerateIndexesUsingBlock:v42];
      }
      if (![v21 count] && !objc_msgSend(v30, "count")) {
        goto LABEL_34;
      }
      v41 = v19;
      v31 = [(PXComposeRecipientDataSourceManager *)self _createComposeRecipientDataSourceFromCurrentState];
      [(PXComposeRecipientDataSourceManager *)self setDataSource:v31];
      v33 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v30 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v21];
      [(PXComposeRecipientDataSourceManager *)self delegate];
      v35 = v34 = v12;
      [v35 composeRecipientDataSourceManager:self didUpdateDataSourceWithChangeDetails:v33];

      v12 = v34;
    }

    v19 = v41;
LABEL_34:

    v17 = v38;
    v13 = v39;
LABEL_35:
  }
}

void __68__PXComposeRecipientDataSourceManager_observable_didChange_context___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4 = [a1[4] identifier];
  id v5 = a1[4];
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = a2;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v6 = [v5 personSuggestionAtItemIndexPath:v10];
  v7 = [[PXComposeRecipient alloc] initWithPersonSuggestion:v6];
  uint64_t v8 = [*((id *)a1[5] + 1) indexOfObject:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8;
    [a1[5] _replaceComposeRecipientAtIndex:v8 withComposeRecipient:v7];
    [a1[6] addIndex:v9];
  }
}

- (NSDictionary)diagnosticDictionary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v4 = [(PXComposeRecipientDataSourceManager *)self sourceType];
  id v5 = @"PXPeopleSuggestionsSourceTypeNone";
  if (v4 == 1) {
    id v5 = @"PXPeopleSuggestionsSourceTypePhotosGraph";
  }
  if (v4 == 2) {
    v6 = @"PXPeopleSuggestionsSourceTypePreviewSuggestion";
  }
  else {
    v6 = v5;
  }
  [v3 setObject:v6 forKeyedSubscript:@"People Suggestions Source Type"];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXComposeRecipientDataSourceManager numberOfPeopleSuggested](self, "numberOfPeopleSuggested"));
  [v3 setObject:v7 forKeyedSubscript:@"Number Of People Suggested"];

  uint64_t v8 = [(PXComposeRecipientDataSourceManager *)self dataSource];
  uint64_t v9 = [v8 composeRecipients];
  uint64_t v10 = [v9 count];

  v11 = [NSNumber numberWithUnsignedInteger:v10];
  [v3 setObject:v11 forKeyedSubscript:@"Total Recipients Count"];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = [(PXComposeRecipientDataSourceManager *)self dataSource];
  v14 = [v13 composeRecipients];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) diagnosticDictionary];
        if (v19) {
          [v12 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  [v3 setObject:v12 forKeyedSubscript:@"Recipients Debug Infos"];
  return (NSDictionary *)v3;
}

- (void)_replaceComposeRecipientAtIndex:(int64_t)a3 withComposeRecipient:(id)a4
{
  id v11 = a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientDataSourceManager.m", 271, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  v7 = [(NSMutableArray *)self->_composeRecipients objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 recipient];
  uint64_t v9 = [v11 recipient];
  if (v8) {
    [(NSMutableSet *)self->_recipients removeObject:v8];
  }
  [(NSMutableArray *)self->_composeRecipients replaceObjectAtIndex:a3 withObject:v11];
  if (v9) {
    [(NSMutableSet *)self->_recipients addObject:v9];
  }
}

- (void)_addComposeRecipients:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXComposeRecipientDataSourceManager.m", 238, @"Invalid parameter not satisfying: %@", @"composeRecipients.count > 0" object file lineNumber description];
  }
  int64_t v6 = [(PXComposeRecipientDataSourceManager *)self _lastValidComposeRecipientIndex];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = [(NSMutableArray *)self->_composeRecipients count];
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  uint64_t v15 = v7;
  uint64_t v8 = (void *)[(NSMutableArray *)self->_composeRecipients copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PXComposeRecipientDataSourceManager__addComposeRecipients___block_invoke;
  v13[3] = &unk_1E5DB7C80;
  v13[4] = self;
  v13[5] = v14;
  v13[6] = a2;
  [v5 enumerateObjectsUsingBlock:v13];
  uint64_t v9 = [(PXComposeRecipientDataSourceManager *)self _createComposeRecipientDataSourceFromCurrentState];
  [(PXComposeRecipientDataSourceManager *)self setDataSource:v9];
  uint64_t v10 = [off_1E5DA5568 changeDetailsFromArray:v8 toArray:self->_composeRecipients changedObjects:MEMORY[0x1E4F1CBF0]];
  id v11 = [(PXComposeRecipientDataSourceManager *)self delegate];
  [v11 composeRecipientDataSourceManager:self didUpdateDataSourceWithChangeDetails:v10];

  _Block_object_dispose(v14, 8);
}

void __61__PXComposeRecipientDataSourceManager__addComposeRecipients___block_invoke(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 recipient];
  uint64_t v4 = a1[4];
  if (v3)
  {
    if ([*(id *)(v4 + 16) containsObject:v3])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a1[6], a1[4], @"PXComposeRecipientDataSourceManager.m", 248, @"Invalid parameter not satisfying: %@", @"![_recipients containsObject:recipient]" object file lineNumber description];
    }
    [*(id *)(a1[4] + 16) addObject:v3];
    unint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 24);
    unint64_t v6 = [*(id *)(a1[4] + 8) count];
    uint64_t v7 = *(void **)(a1[4] + 8);
    if (v5 >= v6)
    {
      [v7 addObject:v9];
      *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 8) count];
    }
    else
    {
      [v7 insertObject:v9 atIndex:(*(void *)(*(void *)(a1[5] + 8) + 24))++];
    }
  }
  else
  {
    [*(id *)(v4 + 8) addObject:v9];
  }
}

- (int64_t)_lastValidComposeRecipientIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  composeRecipients = self->_composeRecipients;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PXComposeRecipientDataSourceManager__lastValidComposeRecipientIndex__block_invoke;
  v5[3] = &unk_1E5DB7C58;
  v5[4] = &v6;
  [(NSMutableArray *)composeRecipients enumerateObjectsWithOptions:2 usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __70__PXComposeRecipientDataSourceManager__lastValidComposeRecipientIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 recipient];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_composeRecipientsFromCurrentPeopleSuggestionsDataSource
{
  int64_t v3 = [(PXComposeRecipientDataSourceManager *)self peopleSuggestionsDataSource];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = (void *)[(NSMutableSet *)self->_recipients mutableCopy];
  uint64_t v6 = [v3 identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__PXComposeRecipientDataSourceManager__composeRecipientsFromCurrentPeopleSuggestionsDataSource__block_invoke;
  void v14[3] = &unk_1E5DC8CF0;
  id v15 = v3;
  id v16 = v5;
  id v7 = v4;
  id v17 = v7;
  v13[0] = v6;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v8 = v5;
  id v9 = v3;
  [v9 enumerateItemIndexPathsStartingAtIndexPath:v13 reverseDirection:0 usingBlock:v14];
  uint64_t v10 = v17;
  id v11 = v7;

  return v11;
}

void __95__PXComposeRecipientDataSourceManager__composeRecipientsFromCurrentPeopleSuggestionsDataSource__block_invoke(uint64_t a1, _OWORD *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  unint64_t v5 = [v3 personSuggestionAtItemIndexPath:v8];
  uint64_t v6 = [[PXComposeRecipient alloc] initWithPersonSuggestion:v5];
  id v7 = [(PXComposeRecipient *)v6 recipient];
  if (!v7) {
    goto LABEL_4;
  }
  if (([*(id *)(a1 + 40) containsObject:v7] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v7];
LABEL_4:
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (id)_createComposeRecipientDataSourceFromCurrentState
{
  v2 = [[PXComposeRecipientDataSource alloc] initWithComposeRecipients:self->_composeRecipients recipients:self->_recipients];
  return v2;
}

- (void)replaceComposeRecipientAtIndex:(unint64_t)a3 withNewComposeRecipient:(id)a4
{
  id v14 = a4;
  uint64_t v6 = [(NSMutableArray *)self->_composeRecipients objectAtIndexedSubscript:a3];
  id v7 = [v6 recipient];
  if (v7)
  {
    [(NSMutableSet *)self->_recipients removeObject:v7];
    recipients = self->_recipients;
    id v9 = [v14 recipient];
    [(NSMutableSet *)recipients addObject:v9];
  }
  uint64_t v10 = (void *)[(NSMutableArray *)self->_composeRecipients copy];
  [(NSMutableArray *)self->_composeRecipients replaceObjectAtIndex:a3 withObject:v14];
  id v11 = [(PXComposeRecipientDataSourceManager *)self _createComposeRecipientDataSourceFromCurrentState];
  [(PXComposeRecipientDataSourceManager *)self setDataSource:v11];
  v12 = [off_1E5DA5568 changeDetailsFromArray:v10 toArray:self->_composeRecipients changedObjects:MEMORY[0x1E4F1CBF0]];
  v13 = [(PXComposeRecipientDataSourceManager *)self delegate];
  [v13 composeRecipientDataSourceManager:self didUpdateDataSourceWithChangeDetails:v12];
}

- (void)deleteComposeRecipientAtIndex:(unint64_t)a3
{
  -[NSMutableArray objectAtIndexedSubscript:](self->_composeRecipients, "objectAtIndexedSubscript:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v10 recipient];
  if (v5) {
    [(NSMutableSet *)self->_recipients removeObject:v5];
  }
  uint64_t v6 = (void *)[(NSMutableArray *)self->_composeRecipients copy];
  [(NSMutableArray *)self->_composeRecipients removeObjectAtIndex:a3];
  id v7 = [(PXComposeRecipientDataSourceManager *)self _createComposeRecipientDataSourceFromCurrentState];
  [(PXComposeRecipientDataSourceManager *)self setDataSource:v7];
  id v8 = [off_1E5DA5568 changeDetailsFromArray:v6 toArray:self->_composeRecipients changedObjects:MEMORY[0x1E4F1CBF0]];
  id v9 = [(PXComposeRecipientDataSourceManager *)self delegate];
  [v9 composeRecipientDataSourceManager:self didUpdateDataSourceWithChangeDetails:v8];
}

- (void)addRecipients:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v6 = (void *)[(NSMutableSet *)self->_recipients mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int v12 = [v6 containsObject:v11];
        v13 = [[PXComposeRecipient alloc] initWithRecipient:v11];
        if (v12)
        {
          id v14 = [(PXComposeRecipientDataSourceManager *)self dataSource];
          uint64_t v15 = [v14 indexOfComposeRecipientForRecipient:v11];

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v19 addIndex:v15];
            [(PXComposeRecipientDataSourceManager *)self _replaceComposeRecipientAtIndex:v15 withComposeRecipient:v13];
          }
        }
        else
        {
          [v5 addObject:v13];
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(PXComposeRecipientDataSourceManager *)self _addComposeRecipients:v5];
  }
  if ([v19 count])
  {
    id v16 = [(PXComposeRecipientDataSourceManager *)self _createComposeRecipientDataSourceFromCurrentState];
    [(PXComposeRecipientDataSourceManager *)self setDataSource:v16];
    id v17 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v19];
    BOOL v18 = [(PXComposeRecipientDataSourceManager *)self delegate];
    [v18 composeRecipientDataSourceManager:self didUpdateDataSourceWithChangeDetails:v17];
  }
}

- (PXComposeRecipientDataSourceManager)initWithPeopleSuggestionsDataSourceManager:(id)a3 sourceType:(int64_t)a4
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXComposeRecipientDataSourceManager;
  uint64_t v9 = [(PXComposeRecipientDataSourceManager *)&v21 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    composeRecipients = v9->_composeRecipients;
    v9->_composeRecipients = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    recipients = v9->_recipients;
    v9->_recipients = (NSMutableSet *)v12;

    objc_storeStrong((id *)&v9->_peopleSuggestionsDataSourceManager, a3);
    [(PXSectionedDataSourceManager *)v9->_peopleSuggestionsDataSourceManager registerChangeObserver:v9 context:PXPeopleSuggestionManagerObservationContext];
    if ((v8 == 0) != (a4 == 0))
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v9, @"PXComposeRecipientDataSourceManager.m", 105, @"Invalid parameter not satisfying: %@", @"(peopleSuggestionsDataSourceManager == nil && sourceType == PXPeopleSuggestionsSourceTypeNone) || (peopleSuggestionsDataSourceManager != nil && sourceType != PXPeopleSuggestionsSourceTypeNone)" object file lineNumber description];
    }
    v9->_sourceType = a4;
    uint64_t v14 = [(PXSectionedDataSourceManager *)v9->_peopleSuggestionsDataSourceManager dataSource];
    peopleSuggestionsDataSource = v9->_peopleSuggestionsDataSource;
    v9->_peopleSuggestionsDataSource = (PXPeopleSuggestionsDataSource *)v14;

    uint64_t v16 = [(PXComposeRecipientDataSourceManager *)v9 _createComposeRecipientDataSourceFromCurrentState];
    dataSource = v9->_dataSource;
    v9->_dataSource = (PXComposeRecipientDataSource *)v16;

    BOOL v18 = [(PXComposeRecipientDataSourceManager *)v9 _composeRecipientsFromCurrentPeopleSuggestionsDataSource];
    v9->_numberOfPeopleSuggested = [v18 count];
    if ([v18 count]) {
      [(PXComposeRecipientDataSourceManager *)v9 _addComposeRecipients:v18];
    }
  }
  return v9;
}

- (PXComposeRecipientDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientDataSourceManager.m", 92, @"%s is not available as initializer", "-[PXComposeRecipientDataSourceManager init]");

  abort();
}

@end