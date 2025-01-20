@interface PIInpaintAdjustmentController
- (BOOL)_maskArray:(id)a3 hasSourceWithIdentifier:(id)a4;
- (BOOL)appendRemovalOperationWithMasks:(id)a3 exclusionMasks:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)visualInputKeys;
- (unint64_t)operationCount;
- (void)appendOperation:(id)a3;
- (void)appendStroke:(id)a3 exclusionMasks:(id)a4 options:(unint64_t)a5;
- (void)initializeAdjustment;
- (void)takeNewOperationsFromComposition:(id)a3 redactNewOperations:(BOOL)a4;
@end

@implementation PIInpaintAdjustmentController

- (void)takeNewOperationsFromComposition:(id)a3 redactNewOperations:(BOOL)a4
{
  BOOL v32 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PIAdjustmentController *)self containingComposition];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v31 = v5;
  v7 = [v5 objectForKeyedSubscript:@"inpaintMasks"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v13 = [v6 objectForKeyedSubscript:@"inpaintMasks"];
        if (([v13 containsObject:v12] & 1) == 0)
        {
          if (v13)
          {
            v14 = (void *)[v13 mutableCopy];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA48] array];
          }
          v15 = v14;
          [v14 addObject:v12];
          [v6 setObject:v15 forKeyedSubscript:@"inpaintMasks"];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  v16 = [v31 objectForKeyedSubscript:@"inpaint"];
  v17 = [v16 objectForKeyedSubscript:@"operations"];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v23 = [(PIAdjustmentController *)self adjustment];
        v24 = [v23 objectForKeyedSubscript:@"operations"];
        char v25 = [v24 containsObject:v22];

        if ((v25 & 1) == 0)
        {
          v26 = (void *)[v22 mutableCopy];
          v27 = v26;
          if (v32)
          {
            v28 = [v26 objectForKeyedSubscript:@"options"];
            uint64_t v29 = [v28 unsignedIntegerValue];

            v30 = [NSNumber numberWithUnsignedInteger:v29 | 1];
            [v27 setObject:v30 forKeyedSubscript:@"options"];
          }
          [(PIInpaintAdjustmentController *)self appendOperation:v27];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v19);
  }
}

- (BOOL)appendRemovalOperationWithMasks:(id)a3 exclusionMasks:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!a6)
  {
    v63 = NUAssertLogger_8994();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v100 = v64;
      _os_log_error_impl(&dword_1A9680000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v65 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v67 = NUAssertLogger_8994();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v68)
      {
        v71 = dispatch_get_specific(*v65);
        v72 = (void *)MEMORY[0x1E4F29060];
        id v73 = v71;
        v74 = [v72 callStackSymbols];
        v75 = [v74 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v100 = v71;
        __int16 v101 = 2114;
        v102 = v75;
        _os_log_error_impl(&dword_1A9680000, v67, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v68)
    {
      v69 = [MEMORY[0x1E4F29060] callStackSymbols];
      v70 = [v69 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v100 = v70;
      _os_log_error_impl(&dword_1A9680000, v67, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v12 = v11;
  v84 = self;
  v13 = [(PIAdjustmentController *)self containingComposition];
  v14 = v13;
  if (v13)
  {
    unint64_t v77 = a5;
    v15 = [v13 objectForKeyedSubscript:@"inpaintMasks"];
    v16 = (void *)[v15 mutableCopy];
    v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v20 = v18;
    v79 = v14;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v80 = v10;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v91 objects:v98 count:16];
    v78 = @"ObjectRemoval";
    v81 = v12;
    v82 = v21;
    if (v23)
    {
      uint64_t v24 = v23;
      v76 = a6;
      char v25 = 0;
      uint64_t v83 = *(void *)v92;
      v26 = v84;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v92 != v83) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          uint64_t v29 = [v28 identifier];
          BOOL v30 = [(PIInpaintAdjustmentController *)v26 _maskArray:v20 hasSourceWithIdentifier:v29];

          if (v30)
          {
            long long v40 = (void *)MEMORY[0x1E4F7A438];
            long long v41 = [v28 identifier];
            [v40 invalidError:@"Composition already has a mask with identifier" object:v41];
            BOOL v19 = 0;
            id *v76 = (id)objc_claimAutoreleasedReturnValue();
            id v10 = v80;
            uint64_t v12 = v81;
            v14 = v79;
            goto LABEL_38;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F7A550]);
          BOOL v32 = [v28 buffer];
          v33 = [v28 identifier];
          if (v28) {
            [v28 extent];
          }
          else {
            memset(v90, 0, sizeof(v90));
          }
          uint64_t v34 = [v28 scale];
          long long v36 = objc_msgSend(v31, "initWithImageBuffer:identifier:extent:scale:", v32, v33, v90, v34, v35);

          [v20 addObject:v36];
          uint64_t v37 = [v28 identifier];
          [v21 addObject:v37];

          long long v38 = [v28 identifier];
          LOBYTE(v37) = +[PIObjectRemoval maskIdentifierIsDeclutter:v38];

          v25 |= v37;
          v26 = v84;
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v91 objects:v98 count:16];
        if (v24) {
          continue;
        }
        break;
      }
      long long v39 = @"Declutter";
      if ((v25 & 1) == 0) {
        long long v39 = @"ObjectRemoval";
      }
      v78 = v39;
      uint64_t v12 = v81;
    }
    else
    {
      v26 = v84;
    }

    id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v42 = v12;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v86 objects:v97 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v87 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v48 = [v47 identifier];
          BOOL v49 = [(PIInpaintAdjustmentController *)v26 _maskArray:v20 hasSourceWithIdentifier:v48];

          if (!v49)
          {
            id v50 = objc_alloc(MEMORY[0x1E4F7A550]);
            v51 = [v47 buffer];
            v52 = [v47 identifier];
            if (v47) {
              [v47 extent];
            }
            else {
              memset(v85, 0, sizeof(v85));
            }
            uint64_t v53 = [v47 scale];
            v55 = objc_msgSend(v50, "initWithImageBuffer:identifier:extent:scale:", v51, v52, v85, v53, v54);

            [v20 addObject:v55];
            v26 = v84;
          }
          v56 = [v47 identifier];
          [v22 addObject:v56];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v86 objects:v97 count:16];
      }
      while (v44);
    }

    v14 = v79;
    [v79 setObject:v20 forKeyedSubscript:@"inpaintMasks"];
    v95[0] = @"mode";
    v95[1] = @"version";
    v96[0] = v78;
    v96[1] = &unk_1F0009AE8;
    v96[2] = v82;
    v95[2] = @"maskIdentifiers";
    v95[3] = @"options";
    v57 = NSNumber;
    v58 = v78;
    v59 = [v57 numberWithUnsignedInteger:v77];
    v96[3] = v59;
    long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:4];

    if ([v22 count])
    {
      v60 = (void *)[v41 mutableCopy];
      [v60 setObject:v22 forKeyedSubscript:@"exclusionMaskIdentifiers"];
      uint64_t v61 = [v60 copy];

      long long v41 = (void *)v61;
    }
    id v10 = v80;
    uint64_t v12 = v81;
    [(PIInpaintAdjustmentController *)v84 appendOperation:v41];
    BOOL v19 = 1;
LABEL_38:
  }
  else
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Internal composition not set" object:0];
    BOOL v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)_maskArray:(id)a3 hasSourceWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "maskIdentifier", (void)v14);
        char v12 = [v11 isEqualToString:v6];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)appendStroke:(id)a3 exclusionMasks:(id)a4 options:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F7A398] dictionaryFromBrushStroke:a3];
  id v10 = (void *)[v9 mutableCopy];

  [v10 setObject:@"RepairML" forKeyedSubscript:@"mode"];
  [v10 setObject:0 forKeyedSubscript:@"clipRect"];
  id v11 = [NSNumber numberWithUnsignedInteger:a5];
  [v10 setObject:v11 forKeyedSubscript:@"options"];

  if ([v8 count])
  {
    uint64_t v34 = v10;
    v33 = [(PIAdjustmentController *)self containingComposition];
    char v12 = [v33 objectForKeyedSubscript:@"inpaintMasks"];
    v13 = (void *)[v12 mutableCopy];
    long long v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    long long v16 = v15;

    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v35 = v8;
    obuint64_t j = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v23 = [v22 identifier];
          BOOL v24 = [(PIInpaintAdjustmentController *)self _maskArray:v16 hasSourceWithIdentifier:v23];

          if (!v24)
          {
            char v25 = self;
            id v26 = objc_alloc(MEMORY[0x1E4F7A550]);
            v27 = [v22 buffer];
            v28 = [v22 identifier];
            if (v22) {
              [v22 extent];
            }
            else {
              memset(v37, 0, sizeof(v37));
            }
            uint64_t v29 = [v22 scale];
            id v31 = objc_msgSend(v26, "initWithImageBuffer:identifier:extent:scale:", v27, v28, v37, v29, v30);

            [v16 addObject:v31];
            self = v25;
          }
          BOOL v32 = [v22 identifier];
          [v17 addObject:v32];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v19);
    }

    [v33 setObject:v16 forKeyedSubscript:@"inpaintMasks"];
    id v10 = v34;
    [v34 setObject:v17 forKeyedSubscript:@"exclusionMaskIdentifiers"];

    id v8 = v35;
  }
  [(PIInpaintAdjustmentController *)self appendOperation:v10];
}

- (void)appendOperation:(id)a3
{
  id v8 = a3;
  v4 = [(PIAdjustmentController *)self adjustment];
  id v5 = [v4 objectForKeyedSubscript:@"operations"];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1C978] array];
    [(PIInpaintAdjustmentController *)self initializeAdjustment];
  }
  id v6 = [v5 arrayByAddingObject:v8];

  id v7 = [(PIAdjustmentController *)self adjustment];
  [v7 setObject:v6 forKeyedSubscript:@"operations"];
}

- (unint64_t)operationCount
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"operations"];

  unint64_t v4 = [v3 count];
  return v4;
}

- (void)initializeAdjustment
{
  v3 = [(PIAdjustmentController *)self adjustment];
  [v3 setObject:&unk_1F0009AE8 forKeyedSubscript:@"version"];

  id v12 = +[PIModelCatalog shared];
  unint64_t v4 = [v12 cleanupVersion];
  id v5 = [(PIAdjustmentController *)self adjustment];
  [v5 setObject:v4 forKeyedSubscript:@"cleanupVersion"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [v12 segmentationModelVersion];
  [v6 setObject:v7 forKeyedSubscript:@"segmentationVersion"];

  id v8 = [v12 inpaintModelVersion];
  [v6 setObject:v8 forKeyedSubscript:@"inpaintVersion"];

  uint64_t v9 = [v12 refinementModelVersion];
  [v6 setObject:v9 forKeyedSubscript:@"refinementVersion"];

  if ([v6 count])
  {
    id v10 = [(PIAdjustmentController *)self adjustment];
    [v10 setObject:v6 forKeyedSubscript:@"modelVersionInfo"];
  }
  id v11 = [(PIAdjustmentController *)self adjustment];
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
}

- (id)visualInputKeys
{
  return &unk_1F000AA78;
}

@end