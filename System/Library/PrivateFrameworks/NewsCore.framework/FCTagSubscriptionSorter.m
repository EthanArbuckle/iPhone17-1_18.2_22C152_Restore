@interface FCTagSubscriptionSorter
- (id)initWithTagRanker:(id *)a1;
- (id)sortTagSubscriptions:(uint64_t)a1;
@end

@implementation FCTagSubscriptionSorter

- (id)initWithTagRanker:(id *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagRanker != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCTagSubscriptionSorter initWithTagRanker:]";
      __int16 v12 = 2080;
      v13 = "FCTagSubscriptionSorter.m";
      __int16 v14 = 1024;
      int v15 = 28;
      __int16 v16 = 2114;
      v17 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v9.receiver = a1;
    v9.super_class = (Class)FCTagSubscriptionSorter;
    v6 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v6;
    if (v6) {
      objc_storeStrong(v6 + 1, a2);
    }
  }

  return a1;
}

- (id)sortTagSubscriptions:(uint64_t)a1
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagSubscriptions != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCTagSubscriptionSorter sortTagSubscriptions:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCTagSubscriptionSorter.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v43[0]) = 40;
      WORD2(v43[0]) = 2114;
      *(void *)((char *)v43 + 6) = v28;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v31 = objc_msgSend(v4, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_190);
    uint64_t v5 = [v31 objectForKeyedSubscript:MEMORY[0x1E4F1CC38]];
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      v8 = (void *)v5;
    }
    else {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v30 = v8;

    uint64_t v9 = [v31 objectForKeyedSubscript:MEMORY[0x1E4F1CC28]];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v7;
    }
    id v29 = v11;

    __int16 v12 = [v30 sortedArrayUsingComparator:&__block_literal_global_8_3];
    v13 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_11_6);
    id v14 = *(id *)(a1 + 8);
    int v15 = [v14 rankTagIDsDescending:v13];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_4;
    aBlock[3] = &unk_1E5B5C530;
    id v16 = v15;
    id v41 = v16;
    v17 = _Block_copy(aBlock);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v43[0] = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_5;
    v32[3] = &unk_1E5B5C558;
    id v18 = v16;
    id v33 = v18;
    v34 = buf;
    v35 = &v36;
    [v12 enumerateObjectsUsingBlock:v32];
    unint64_t v19 = v37[3];
    if (v19 >= [v12 count])
    {
      v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v20 = objc_msgSend(v12, "fc_subarrayUpToIndex:inclusive:", v37[3], 1);
    }
    unint64_t v21 = v37[3];
    if (v21 >= [v12 count])
    {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v22 = objc_msgSend(v12, "fc_subarrayFromIndex:inclusive:", v37[3], 0);
    }
    v23 = [v29 sortedArrayUsingComparator:v17];
    v24 = (void *)[v20 mutableCopy];
    id v25 = (id)objc_msgSend(v24, "fc_mergeSortedOrderedCollection:usingComparator:", v23, v17);
    v26 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v22, v24);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = [a2 order];
  id v4 = [v2 numberWithInt:v3 != 0];

  return v4;
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 order];
  v6 = [v4 order];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

uint64_t __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = NSNumber;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  v8 = [a2 tagID];
  uint64_t v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));

  v10 = NSNumber;
  v11 = *(void **)(a1 + 32);
  __int16 v12 = [v7 tagID];

  v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));

  uint64_t v14 = [v9 compare:v13];
  return v14;
}

void __48__FCTagSubscriptionSorter_sortTagSubscriptions___block_invoke_5(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (void *)a1[4];
  v8 = [a2 tagID];
  unint64_t v9 = [v7 indexOfObject:v8];

  uint64_t v10 = *(void *)(a1[5] + 8);
  if (v9 >= *(void *)(v10 + 24))
  {
    *(void *)(v10 + 24) = v9;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
  else
  {
    *a4 = 1;
  }
}

- (void).cxx_destruct
{
}

@end