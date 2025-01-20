@interface PIBrushStrokeHistory
- (NSMutableArray)entries;
- (PIBrushStrokeHistory)init;
- (PIBrushStrokeHistory)initWithData:(id)a3 error:(id *)a4;
- (PIBrushStrokeHistory)initWithEntries:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)exportDataWithError:(id *)a3;
- (unint64_t)entryCount;
- (void)_playbackHistoryIndex:(unint64_t)a3 toReceiver:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)addEntry:(id)a3;
- (void)playbackHistoryToReceiver:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setEntries:(id)a3;
@end

@implementation PIBrushStrokeHistory

- (void).cxx_destruct
{
}

- (void)setEntries:(id)a3
{
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (id)exportDataWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v20 = NUAssertLogger_16718();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_16718();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v28;
        __int16 v43 = 2114;
        v44 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v6 = [(PIBrushStrokeHistory *)self entries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  v38 = @"entries";
  v39 = v5;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v33 = 0;
  v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:&v33];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F7A438];
    id v17 = v33;
    id v18 = [v16 errorWithCode:1 reason:@"Failed to serialize cleanup interaction history" object:self underlyingError:v17];

    *a3 = v18;
  }

  return v14;
}

- (void)playbackHistoryToReceiver:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = [(PIBrushStrokeHistory *)self entries];
  uint64_t v10 = [v9 count];

  if (v10) {
    [(PIBrushStrokeHistory *)self _playbackHistoryIndex:0 toReceiver:v11 options:a4 completion:v8];
  }
}

- (void)_playbackHistoryIndex:(unint64_t)a3 toReceiver:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = [(PIBrushStrokeHistory *)self entries];
  v13 = [v12 objectAtIndexedSubscript:a3];

  if (v13)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke;
    v40[3] = &unk_1E5D805E0;
    v40[4] = self;
    unint64_t v43 = a3;
    id v42 = v11;
    id v14 = v10;
    id v41 = v14;
    unint64_t v44 = a5;
    id v15 = (void *)MEMORY[0x1AD0F8FE0](v40);
    if ([v13 entryType])
    {
      if ([v13 entryType] != 1)
      {
LABEL_17:

        goto LABEL_18;
      }
      [v13 objectRemovalPoint];
      double v17 = v16;
      double v19 = v18;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_6;
      v34[3] = &unk_1E5D80E28;
      id v35 = v15;
      objc_msgSend(v14, "addObjectRemovalAtImageSpacePoint:completion:", v34, v17, v19);
      v20 = v35;
    }
    else
    {
      v21 = [v13 brushStroke];
      [v21 pointAtIndex:0];
      float v23 = v22;
      float v25 = v24;

      [v13 subjectHitTestRadius];
      if (v26 == 0.0) {
        double v27 = 6.0;
      }
      else {
        double v27 = v26;
      }
      v20 = objc_msgSend(v14, "brushStrokeExclusionMaskForStrokeStartingAtImageSpacePoint:withRadius:", v23, v25, v27);
      char v28 = [v13 skipSegmentationIntersections];
      v29 = [v13 brushStroke];
      if (v28 & 1) != 0 || (a5)
      {
        unsigned int v31 = [v13 closedShape];
        if (a5) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = v31;
        }
        uint64_t v33 = [v13 needsPixellation];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_2;
        v38[3] = &unk_1E5D80E28;
        id v30 = &v39;
        id v39 = v15;
        [v14 addImageSpaceInpaintingStroke:v29 exclusionMask:v20 closeAndFillStroke:v32 needsPixellation:v33 recordStroke:1 completion:v38];
      }
      else
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_4;
        v36[3] = &unk_1E5D80E28;
        id v30 = &v37;
        id v37 = v15;
        [v14 addObjectRemovalUsingImageSpaceStroke:v29 exclusionMask:v20 completion:v36];
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) entries];
  uint64_t v3 = [v2 count];
  uint64_t v4 = *(void *)(a1 + 56) + 1;

  if (v3 == v4)
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56) + 1;
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    return [v9 _playbackHistoryIndex:v8 toReceiver:v10 options:v11 completion:v7];
  }
  return result;
}

void __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_3;
  block[3] = &unk_1E5D80E28;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_5;
  block[3] = &unk_1E5D80E28;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_7;
  block[3] = &unk_1E5D80E28;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PIBrushStrokeHistory__playbackHistoryIndex_toReceiver_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(PIBrushStrokeHistory *)self entries];
  [v5 addObject:v4];
}

- (unint64_t)entryCount
{
  id v2 = [(PIBrushStrokeHistory *)self entries];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; entryCount = %lu>",
               objc_opt_class(),
               self,
               [(PIBrushStrokeHistory *)self entryCount]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  entries = self->_entries;
  return (id)[v4 initWithEntries:entries];
}

- (PIBrushStrokeHistory)init
{
  return [(PIBrushStrokeHistory *)self initWithEntries:MEMORY[0x1E4F1CBF0]];
}

- (PIBrushStrokeHistory)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = NUAssertLogger_16718();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v24 = NUAssertLogger_16718();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v33 = dispatch_get_specific(*v22);
        long long v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        float v22 = [v34 callStackSymbols];
        long long v36 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v33;
        __int16 v51 = 2114;
        v52 = v36;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      double v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v22 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v30 = _NUAssertFailHandler();
    goto LABEL_32;
  }
  if (!a4)
  {
    double v27 = NUAssertLogger_16718();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      char v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    float v22 = (const void **)MEMORY[0x1E4F7A308];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v24 = NUAssertLogger_16718();
    int v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        unsigned int v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_32:
    if (v30)
    {
      id v37 = dispatch_get_specific(*v22);
      v38 = (void *)MEMORY[0x1E4F29060];
      id v39 = v37;
      v40 = [v38 callStackSymbols];
      id v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v37;
      __int16 v51 = 2114;
      v52 = v41;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_34:

    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 length])
  {
    id v47 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v47];
    id v10 = v47;
    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"entries"];
      if (v11)
      {
        v12 = v11;
        id v42 = v10;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v44 != v15) {
                objc_enumerationMutation(v12);
              }
              double v17 = [[PIBrushStrokeHistoryEntry alloc] initWithDictionary:*(void *)(*((void *)&v43 + 1) + 8 * i)];
              [v8 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v14);
        }

        goto LABEL_14;
      }
      *a4 = [MEMORY[0x1E4F7A438] missingError:@"Missing brush stroke entries" object:v9];
    }
    else
    {
      *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize brush stroke history data" object:v7 underlyingError:v10];
    }
    double v18 = 0;
    goto LABEL_18;
  }
LABEL_14:
  double v18 = [(PIBrushStrokeHistory *)self initWithEntries:v8];
LABEL_18:

  return v18;
}

- (PIBrushStrokeHistory)initWithEntries:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PIBrushStrokeHistory;
  id v3 = a3;
  id v4 = [(PIBrushStrokeHistory *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "mutableCopy", v8.receiver, v8.super_class);

  entries = v4->_entries;
  v4->_entries = (NSMutableArray *)v5;

  return v4;
}

@end