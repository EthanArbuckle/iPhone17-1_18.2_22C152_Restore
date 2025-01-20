@interface WBSCRDTPositionGenerator
- (WBSCRDTPositionGenerator)init;
- (WBSCRDTPositionGenerator)initWithDelegate:(id)a3;
- (WBSCRDTPositionGeneratorDelegate)delegate;
- (id)_generatePositionBetweenPosition:(id)a3 andPosition:(id)a4;
- (id)_generatePositionsForStrides:(id)a3;
- (id)_positionForRecordName:(id)a3;
- (id)_stridesForSiblingRecords:(id)a3;
- (id)positionForBookmarkWithRecordName:(id)a3;
- (void)_enumerateRecordNamesAfterRecordWithName:(id)a3 usingBlock:(id)a4;
- (void)_enumerateRecordNamesBeforeRecordWithName:(id)a3 usingBlock:(id)a4;
- (void)generatePositionsForChildRecordNamesGroupedByParentFolders:(id)a3;
@end

@implementation WBSCRDTPositionGenerator

- (WBSCRDTPositionGenerator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSCRDTPositionGenerator;
  v5 = [(WBSCRDTPositionGenerator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (WBSCRDTPositionGenerator)init
{
  return 0;
}

- (void)generatePositionsForChildRecordNamesGroupedByParentFolders:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = [v4 dictionary];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke;
  v13 = &unk_1E5C9A248;
  v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  v8 = (NSDictionary *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  recordNamesToPositions = self->_recordNamesToPositions;
  self->_recordNamesToPositions = v8;
}

void __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1AD0C4CF0]();
  v8 = [*(id *)(a1 + 32) _stridesForSiblingRecords:v6];
  objc_super v9 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
  }
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) _generatePositionsForStrides:v8];
  [v10 addEntriesFromDictionary:v11];
}

- (id)positionForBookmarkWithRecordName:(id)a3
{
  return [(NSDictionary *)self->_recordNamesToPositions objectForKeyedSubscript:a3];
}

- (id)_stridesForSiblingRecords:(id)a3
{
  id v4 = a3;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  id v5 = (void *)[v4 mutableCopy];
  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [v5 anyObject];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      v8 = (void *)MEMORY[0x1AD0C4CF0]();
      [v5 removeObject:v7];
      if (!objc_msgSend(MEMORY[0x1E4F1A2D0], "safari_folderTypeForRecordName:", v7))
      {
        objc_super v9 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__7;
        v45 = __Block_byref_object_dispose__7;
        id v46 = 0;
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__7;
        v39 = __Block_byref_object_dispose__7;
        id v40 = 0;
        [v9 addObject:v7];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke;
        v28[3] = &unk_1E5C9A270;
        id v10 = v4;
        id v29 = v10;
        id v11 = v9;
        id v30 = v11;
        id v12 = v5;
        id v31 = v12;
        v34 = &v41;
        id v13 = v20;
        id v32 = v13;
        v33 = self;
        [(WBSCRDTPositionGenerator *)self _enumerateRecordNamesBeforeRecordWithName:v7 usingBlock:v28];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke_2;
        v21[3] = &unk_1E5C9A270;
        id v22 = v10;
        id v14 = v11;
        id v23 = v14;
        id v24 = v12;
        v27 = &v35;
        id v25 = v13;
        v26 = self;
        [(WBSCRDTPositionGenerator *)self _enumerateRecordNamesAfterRecordWithName:v7 usingBlock:v21];
        id v15 = [_WBSCRDTPositionGeneratorStride alloc];
        v16 = [(_WBSCRDTPositionGeneratorStride *)v15 initWithRecordNames:v14 beforePosition:v42[5] afterPosition:v36[5]];
        [v19 addObject:v16];

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v41, 8);
      }
      uint64_t v17 = [v5 anyObject];

      id v7 = (void *)v17;
    }
    while (v17);
  }

  return v19;
}

void __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) insertObject:v12 atIndex:0];
    [*(id *)(a1 + 48) removeObject:v12];
  }
  else
  {
    *a3 = 1;
    uint64_t v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:v12];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v8 = [*(id *)(a1 + 64) _positionForRecordName:v12];
      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v11) {
        [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v12];
      }
    }
  }
}

void __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 48) removeObject:v12];
  }
  else
  {
    *a3 = 1;
    uint64_t v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:v12];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v8 = [*(id *)(a1 + 64) _positionForRecordName:v12];
      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v11) {
        [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v12];
      }
    }
  }
}

- (void)_enumerateRecordNamesBeforeRecordWithName:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, unsigned char *))a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSCRDTPositionGenerator__enumerateRecordNamesBeforeRecordWithName_usingBlock___block_invoke;
  v13[3] = &unk_1E5C9A298;
  v13[4] = self;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v13);
  uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v6);
  if (v9)
  {
    id v10 = (void *)v9;
    do
    {
      if (!objc_msgSend(MEMORY[0x1E4F1A2D0], "safari_folderTypeForRecordName:", v10))
      {
        char v12 = 0;
        v7[2](v7, v10, &v12);
        if (v12) {
          break;
        }
      }
      uint64_t v11 = ((void (**)(void, void *))v8)[2](v8, v10);

      id v10 = (void *)v11;
    }
    while (v11);
  }
}

id __81__WBSCRDTPositionGenerator__enumerateRecordNamesBeforeRecordWithName_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained positionGenerator:*(void *)(a1 + 32) recordNameOfBookmarksBeforeRecordWithName:v4];

  return v6;
}

- (void)_enumerateRecordNamesAfterRecordWithName:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, unsigned char *))a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__WBSCRDTPositionGenerator__enumerateRecordNamesAfterRecordWithName_usingBlock___block_invoke;
  v13[3] = &unk_1E5C9A298;
  v13[4] = self;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v13);
  uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v6);
  if (v9)
  {
    id v10 = (void *)v9;
    do
    {
      if (!objc_msgSend(MEMORY[0x1E4F1A2D0], "safari_folderTypeForRecordName:", v10))
      {
        char v12 = 0;
        v7[2](v7, v10, &v12);
        if (v12) {
          break;
        }
      }
      uint64_t v11 = ((void (**)(void, void *))v8)[2](v8, v10);

      id v10 = (void *)v11;
    }
    while (v11);
  }
}

id __80__WBSCRDTPositionGenerator__enumerateRecordNamesAfterRecordWithName_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained positionGenerator:*(void *)(a1 + 32) recordNameOfBookmarksAfterRecordWithName:v4];

  return v6;
}

- (id)_generatePositionsForStrides:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  context = (void *)MEMORY[0x1AD0C4CF0]();
  id v25 = (void *)[v24 mutableCopy];
  v26 = [v25 firstObject];
  if (v26)
  {
    do
    {
      [v25 removeObjectAtIndex:0];
      uint64_t v5 = [v26 recordNames];
      id v6 = [v26 beforePosition];
      uint64_t v34 = 0;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x3032000000;
      uint64_t v37 = __Block_byref_object_copy__7;
      v38 = __Block_byref_object_dispose__7;
      id v39 = [v26 afterPosition];
      if (v35[5])
      {
        if (v6)
        {
          id v7 = -[WBSCRDTPositionGenerator _generatePositionBetweenPosition:andPosition:](self, "_generatePositionBetweenPosition:andPosition:", v6);
          unint64_t v8 = [v5 count];
          uint64_t v9 = [v5 objectAtIndexedSubscript:v8 >> 1];
          [v4 setObject:v7 forKeyedSubscript:v9];

          id v10 = objc_msgSend(v5, "subarrayWithRange:", 0, v8 >> 1);
          if ([v10 count])
          {
            uint64_t v11 = [[_WBSCRDTPositionGeneratorStride alloc] initWithRecordNames:v10 beforePosition:v6 afterPosition:v7];
            [v25 addObject:v11];
          }
          char v12 = objc_msgSend(v5, "subarrayWithRange:", (v8 >> 1) + 1, v8 + ~(v8 >> 1));
          if ([v12 count])
          {
            id v13 = [_WBSCRDTPositionGeneratorStride alloc];
            id v14 = [(_WBSCRDTPositionGeneratorStride *)v13 initWithRecordNames:v12 beforePosition:v7 afterPosition:v35[5]];
            [v25 addObject:v14];
          }
        }
        else
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __57__WBSCRDTPositionGenerator__generatePositionsForStrides___block_invoke;
          v27[3] = &unk_1E5C9A2C0;
          id v29 = &v34;
          v27[4] = self;
          id v28 = v4;
          [v5 enumerateObjectsWithOptions:2 usingBlock:v27];
        }
      }
      else
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v15 = v5;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v31;
          do
          {
            uint64_t v18 = 0;
            id v19 = v6;
            do
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * v18);
              id v6 = [(WBSCRDTPositionGenerator *)self _generatePositionBetweenPosition:v19 andPosition:0];

              [v4 setObject:v6 forKeyedSubscript:v20];
              ++v18;
              id v19 = v6;
            }
            while (v16 != v18);
            uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v40 count:16];
          }
          while (v16);
        }
      }
      _Block_object_dispose(&v34, 8);

      uint64_t v21 = [v25 firstObject];

      v26 = (void *)v21;
    }
    while (v21);
  }

  return v4;
}

void __57__WBSCRDTPositionGenerator__generatePositionsForStrides___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = a2;
  uint64_t v5 = [v3 _generatePositionBetweenPosition:0 andPosition:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:v8];
}

- (id)_generatePositionBetweenPosition:(id)a3 andPosition:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [WeakRetained deviceIdentifierForPositionGenerator:self];
  uint64_t v11 = +[WBSCRDTPosition positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:](WBSCRDTPosition, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v8, v7, v10, [WeakRetained nextChangeIDForPositionInPositionGenerator:self]);

  return v11;
}

- (id)_positionForRecordName:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained positionGenerator:self positionForRecordName:v4];

  if (!v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSCRDTPositionGenerator _positionForRecordName:]((uint64_t)v4, v7);
    }
  }

  return v6;
}

- (WBSCRDTPositionGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSCRDTPositionGeneratorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordNamesToPositions, 0);
}

void __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Generate positions for children of record %{public}@, strides: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_positionForRecordName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Delegate returned nil position for record with name: %{public}@, we should never ask for the position of a record known to not have one!", (uint8_t *)&v2, 0xCu);
}

@end