@interface IPAGeometryOperatorSequence
+ (id)sequence;
+ (id)sequenceWithIdentifier:(id)a3;
- (BOOL)appendOperator:(id)a3;
- (BOOL)removeOperatorWithIdentifier:(id)a3;
- (BOOL)replaceOperatorWithIdentifier:(id)a3 withOperator:(id)a4;
- (IPAGeometryOperatorSequence)initWithIdentifier:(id)a3;
- (id)description;
- (id)subsequenceFrom:(id)a3 to:(id)a4;
- (id)transformForGeometry:(id)a3;
- (unint64_t)count;
@end

@implementation IPAGeometryOperatorSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operators, 0);
  objc_storeStrong((id *)&self->map_identifierToIndex, 0);
  objc_storeStrong((id *)&self->map_identifierToOperator, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p elements:%@>", v5, self, self->_operators];

  return v6;
}

- (id)subsequenceFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    id result = (id)_PFAssertFailHandler();
LABEL_24:
    __break(1u);
    return result;
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1740;
  v45 = __Block_byref_object_dispose__1741;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1740;
  v39 = __Block_byref_object_dispose__1741;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1740;
  isolationQueue = self->_isolationQueue;
  v33 = __Block_byref_object_dispose__1741;
  id v34 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__IPAGeometryOperatorSequence_subsequenceFrom_to___block_invoke;
  block[3] = &unk_1E6CC1FD8;
  v26 = &v41;
  v27 = &v35;
  block[4] = self;
  id v10 = v6;
  id v24 = v10;
  v28 = &v29;
  id v11 = v8;
  id v25 = v11;
  dispatch_sync(isolationQueue, block);
  if (![(id)v42[5] count])
  {
LABEL_23:
    id result = (id)_PFAssertFailHandler();
    goto LABEL_24;
  }
  uint64_t v12 = kIPAImageGeometryInputSpace;
  if ((id)kIPAImageGeometryInputSpace == v10)
  {
    v14 = (void *)v36[5];
    v36[5] = (uint64_t)&unk_1F38A1788;
  }
  else
  {
    if ((id)kIPAImageGeometryOutputSpace != v10) {
      goto LABEL_9;
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)v42[5], "count") - 1);
    v14 = (void *)v36[5];
    v36[5] = v13;
  }

  uint64_t v12 = kIPAImageGeometryInputSpace;
LABEL_9:
  if ((id)v12 == v11)
  {
    v16 = (void *)v30[5];
    v30[5] = (uint64_t)&unk_1F38A1788;
    goto LABEL_13;
  }
  if ((id)kIPAImageGeometryOutputSpace == v11)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend((id)v42[5], "count") - 1);
    v16 = (void *)v30[5];
    v30[5] = v15;
LABEL_13:
  }
  v17 = (void *)v36[5];
  if (!v17) {
    goto LABEL_23;
  }
  if (!v30[5]) {
    goto LABEL_23;
  }
  unint64_t v18 = [v17 unsignedIntegerValue];
  unint64_t v19 = [(id)v30[5] unsignedIntegerValue];
  if (v18 > v19) {
    goto LABEL_23;
  }
  v20 = +[IPAGeometryOperatorSequence sequence];
  do
  {
    v21 = [(id)v42[5] objectAtIndexedSubscript:v18];
    [v20 appendOperator:v21];

    ++v18;
  }
  while (v18 <= v19);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v20;
}

uint64_t __50__IPAGeometryOperatorSequence_subsequenceFrom_to___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) copy];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(a1[9] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[6]];
  return MEMORY[0x1F41817F8]();
}

- (id)transformForGeometry:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
LABEL_15:
  }
    _PFAssertFailHandler();
  uint64_t v5 = v4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1740;
  v28 = __Block_byref_object_dispose__1741;
  id v29 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__IPAGeometryOperatorSequence_transformForGeometry___block_invoke;
  block[3] = &unk_1E6CC1F88;
  block[4] = self;
  void block[5] = &v24;
  dispatch_sync(isolationQueue, block);
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)v25[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)v20;
  do
  {
    uint64_t v11 = 0;
    uint64_t v12 = v5;
    do
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) transformForGeometry:v12];
      v14 = v13;
      if (!v13
        || ([v13 intrinsicGeometry],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            BOOL v16 = v15 == 0,
            v15,
            v16))
      {
        _PFAssertFailHandler();
        __break(1u);
        goto LABEL_15;
      }
      [v7 addObject:v14];
      uint64_t v5 = [v14 intrinsicGeometry];

      ++v11;
      uint64_t v12 = v5;
    }
    while (v9 != v11);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v30 count:16];
  }
  while (v9);
LABEL_11:

  v17 = +[IPAImageTransform compositeTransforms:v7];

  _Block_object_dispose(&v24, 8);
  return v17;
}

uint64_t __52__IPAGeometryOperatorSequence_transformForGeometry___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)removeOperatorWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    isolationQueue = self->_isolationQueue;
    char v15 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__IPAGeometryOperatorSequence_removeOperatorWithIdentifier___block_invoke;
    block[3] = &unk_1E6CC2168;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    id v6 = v4;
    dispatch_sync(isolationQueue, block);
    LOBYTE(isolationQueue) = *((unsigned char *)v13 + 24);

    _Block_object_dispose(&v12, 8);
    return (char)isolationQueue;
  }
  else
  {
    id v8 = (void *)_PFAssertFailHandler();
    __60__IPAGeometryOperatorSequence_removeOperatorWithIdentifier___block_invoke(v8);
  }
  return result;
}

void __60__IPAGeometryOperatorSequence_removeOperatorWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v8 = v2;
    unint64_t v3 = [v2 unsignedIntegerValue];
    [*(id *)(a1[4] + 40) removeObjectAtIndex:v3];
    [*(id *)(a1[4] + 32) removeObjectForKey:a1[5]];
    [*(id *)(a1[4] + 24) removeObjectForKey:a1[5]];
    while (v3 < [*(id *)(a1[4] + 40) count])
    {
      id v4 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:v3];
      uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3];
      id v6 = *(void **)(a1[4] + 32);
      id v7 = [v4 identifier];
      [v6 setObject:v5 forKeyedSubscript:v7];

      ++v3;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v2 = v8;
  }
}

- (BOOL)replaceOperatorWithIdentifier:(id)a3 withOperator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && v7)
  {
    uint64_t v17 = 0;
    unint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__IPAGeometryOperatorSequence_replaceOperatorWithIdentifier_withOperator___block_invoke;
    block[3] = &unk_1E6CC1FB0;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    BOOL v16 = &v17;
    id v9 = v7;
    id v10 = v6;
    dispatch_sync(isolationQueue, block);
    char v11 = *((unsigned char *)v18 + 24);

    _Block_object_dispose(&v17, 8);
    return v11;
  }
  else
  {
    BOOL result = _PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

void __74__IPAGeometryOperatorSequence_replaceOperatorWithIdentifier_withOperator___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(*(id *)(a1[4] + 40), "replaceObjectAtIndex:withObject:", objc_msgSend(v2, "unsignedIntegerValue"), a1[6]);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v2 = v3;
  }
}

- (BOOL)appendOperator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    isolationQueue = self->_isolationQueue;
    char v15 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__IPAGeometryOperatorSequence_appendOperator___block_invoke;
    block[3] = &unk_1E6CC2168;
    block[4] = self;
    id v10 = v4;
    char v11 = &v12;
    id v6 = v4;
    dispatch_sync(isolationQueue, block);
    LOBYTE(isolationQueue) = *((unsigned char *)v13 + 24);

    _Block_object_dispose(&v12, 8);
    return (char)isolationQueue;
  }
  else
  {
    uint64_t v8 = _PFAssertFailHandler();
    __46__IPAGeometryOperatorSequence_appendOperator___block_invoke(v8);
  }
  return result;
}

void __46__IPAGeometryOperatorSequence_appendOperator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v12 = [v2 objectForKeyedSubscript:v3];

  id v4 = v12;
  if (!v12)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) count];
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v8 = [v6 identifier];
    [v7 setObject:v6 forKeyedSubscript:v8];

    id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v5];
    id v10 = *(void **)(*(void *)(a1 + 32) + 32);
    char v11 = [*(id *)(a1 + 40) identifier];
    [v10 setObject:v9 forKeyedSubscript:v11];

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v4 = 0;
  }
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__IPAGeometryOperatorSequence_count__block_invoke;
  v5[3] = &unk_1E6CC1F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__IPAGeometryOperatorSequence_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (IPAGeometryOperatorSequence)initWithIdentifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)IPAGeometryOperatorSequence;
  unint64_t v3 = [(IPAGeometryOperator *)&v18 initWithIdentifier:a3];
  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = [v4 stringWithFormat:@"%@.%p._isolationQueue", v6, v3];

    id v8 = v7;
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    map_identifierToOperator = v3->map_identifierToOperator;
    v3->map_identifierToOperator = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    map_identifierToIndex = v3->map_identifierToIndex;
    v3->map_identifierToIndex = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    operators = v3->_operators;
    v3->_operators = (NSMutableArray *)v15;
  }
  return v3;
}

+ (id)sequenceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[IPAGeometryOperatorSequence alloc] initWithIdentifier:v3];

  return v4;
}

+ (id)sequence
{
  return (id)[a1 sequenceWithIdentifier:@"sequence"];
}

@end