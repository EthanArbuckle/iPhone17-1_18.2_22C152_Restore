@interface WFFinderImageResizer
- (BOOL)unsafeComputeResizedSizesForImageContentItems:(id)a3 inSizes:(id)a4 intoSizesTable:(id)a5 error:(id *)a6;
- (OS_dispatch_queue)queue;
- (WFFinderImageResizer)init;
- (id)resizeImages:(id)a3 toSize:(id)a4 completion:(id)a5;
- (void)computeResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5;
@end

@implementation WFFinderImageResizer

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)unsafeComputeResizedSizesForImageContentItems:(id)a3 inSizes:(id)a4 intoSizesTable:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_14:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 192, @"Invalid parameter not satisfying: %@", @"sizes" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 191, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_15:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 193, @"Invalid parameter not satisfying: %@", @"sizesTable" object file lineNumber description];

LABEL_4:
  uint64_t v14 = [v11 count];
  size_t v15 = [v12 count] * v14;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
  if ([v11 count])
  {
    unint64_t v18 = 0;
    do
    {
      if ([v12 count])
      {
        unint64_t v19 = 0;
        do
        {
          v20 = [v11 objectAtIndexedSubscript:v18];
          [v16 addObject:v20];

          v21 = [v12 objectAtIndexedSubscript:v19];
          [v17 addObject:v21];

          ++v19;
        }
        while (v19 < [v12 count]);
      }
      ++v18;
    }
    while (v18 < [v11 count]);
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2810000000;
  v41[3] = &unk_1C863D8AB;
  int v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__55762;
  v39 = __Block_byref_object_dispose__55763;
  id v40 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__WFFinderImageResizer_unsafeComputeResizedSizesForImageContentItems_inSizes_intoSizesTable_error___block_invoke;
  block[3] = &unk_1E6555840;
  v33 = v41;
  v34 = &v35;
  id v22 = v16;
  id v30 = v22;
  id v23 = v17;
  id v31 = v23;
  id v24 = v13;
  id v32 = v24;
  dispatch_apply(v15, 0, block);
  if (a6) {
    *a6 = (id) v36[5];
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  return a6 != 0;
}

void __99__WFFinderImageResizer_unsafeComputeResizedSizesForImageContentItems_inSizes_intoSizesTable_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  if (!v4)
  {
    v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Starting resizing image %@ (descriptor: %@) for size estimation...", buf, 0x20u);
    }

    id v16 = 0;
    v8 = WFConvertImage(v5, v6, &v16);
    id v9 = v16;
    id v10 = v16;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    id v11 = getWFActionsLogObject();
    id v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v8 fileSize];
        *(_DWORD *)buf = 136315906;
        unint64_t v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
        __int16 v19 = 2112;
        v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Computed size for %@ (descriptor: %@): %lld", buf, 0x2Au);
      }

      uint64_t v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
      if (!v14)
      {
        uint64_t v14 = objc_opt_new();
        [*(id *)(a1 + 48) setObject:v14 forKeyedSubscript:v6];
      }
      size_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "fileSize"));
      [v14 addObject:v15];

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v18 = "-[WFFinderImageResizer unsafeComputeResizedSizesForImageContentItems:inSizes:intoSizesTable:error:]_block_invoke";
        __int16 v19 = 2112;
        v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Error updating file sizes for image %@, descriptor: %@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    }
  }
}

- (id)resizeImages:(id)a3 toSize:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 163, @"Invalid parameter not satisfying: %@", @"size" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 164, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];

    goto LABEL_4;
  }
  __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 162, @"Invalid parameter not satisfying: %@", @"imageCollection" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v9, "numberOfItems"));
  uint64_t v13 = [(WFFinderImageResizer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke;
  block[3] = &unk_1E65586A0;
  id v28 = v11;
  id v25 = v9;
  id v26 = v10;
  id v14 = v12;
  id v27 = v14;
  id v15 = v10;
  id v16 = v11;
  id v17 = v9;
  dispatch_async(v13, block);

  unint64_t v18 = v27;
  id v19 = v14;

  return v19;
}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_2;
  v4[3] = &unk_1E6558FA8;
  id v7 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 generateCollectionByCoercingToItemClass:v3 completionHandler:v4];
}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_3;
    v5[3] = &unk_1E6555818;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [a2 transformItemsUsingBlock:v5 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void __55__WFFinderImageResizer_resizeImages_toSize_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v9 = 0;
  id v6 = a3;
  id v7 = WFConvertImage(a2, v5, &v9);
  id v8 = v9;
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
  v6[2](v6, v7, v8);
}

- (void)computeResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 132, @"Invalid parameter not satisfying: %@", @"sizes" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 133, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];

    goto LABEL_4;
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFFinderImageResizer.m", 131, @"Invalid parameter not satisfying: %@", @"imageCollection" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  BOOL v12 = (unint64_t)[v10 count] > 1;
  uint64_t v13 = [(WFFinderImageResizer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke;
  block[3] = &unk_1E65557F0;
  id v21 = v9;
  id v22 = self;
  id v23 = v10;
  id v24 = v11;
  BOOL v25 = v12;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke_2;
  v7[3] = &unk_1E65557C8;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v9 = v4;
  v7[4] = v5;
  id v8 = v6;
  char v10 = *(unsigned char *)(a1 + 64);
  [v2 generateCollectionByCoercingToItemClass:v3 completionHandler:v7];
}

void __72__WFFinderImageResizer_computeResizedSizesForImages_inSizes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 items];
    id v4 = objc_opt_new();
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) firstObject];
    v19[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v18 = 0;
    char v8 = [v5 unsafeComputeResizedSizesForImageContentItems:v3 inSizes:v7 intoSizesTable:v4 error:&v18];
    id v9 = v18;

    if (v8)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        char v10 = *(void **)(a1 + 32);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
        id v17 = v9;
        char v12 = [v10 unsafeComputeResizedSizesForImageContentItems:v3 inSizes:v11 intoSizesTable:v4 error:&v17];
        id v13 = v17;

        if ((v12 & 1) == 0)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v9 = v13;
          goto LABEL_12;
        }
        id v9 = v13;
      }
      uint64_t v14 = *(void *)(a1 + 48);
      id v15 = (void *)[v4 copy];
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
LABEL_12:

    return;
  }
  id v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v16();
}

- (WFFinderImageResizer)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFFinderImageResizer;
  v2 = [(WFFinderImageResizer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    uint64_t v5 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFFinderImageResizer", v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    char v8 = v2;
  }

  return v2;
}

@end