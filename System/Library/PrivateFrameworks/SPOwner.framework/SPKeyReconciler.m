@interface SPKeyReconciler
- (SPKeyReconciler)initWithDictionary:(id)a3;
- (id)description;
- (id)reconcileKey:(id)a3 matchedIndex:(unsigned int *)a4 sequence:(unsigned __int8 *)a5 error:(unsigned __int8 *)a6;
@end

@implementation SPKeyReconciler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIndices, 0);

  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (id)reconcileKey:(id)a3 matchedIndex:(unsigned int *)a4 sequence:(unsigned __int8 *)a5 error:(unsigned __int8 *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((unint64_t)[v10 length] >= 6 && (unint64_t)objc_msgSend(v10, "length") < 0x1D)
  {
    v22 = a4;
    v23 = a5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = self->_keyIndices;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          unsigned int v24 = 0;
          v19 = (uint64_t *)[v18 mapHandle];
          id v20 = v10;
          if (sp_key_index_map_contains_key_prefix(v19, (unsigned __int16 *)[v20 bytes], objc_msgSend(v20, "length"), &v24))
          {
            if (v22) {
              unsigned int *v22 = v24;
            }
            if (v23) {
              unsigned __int8 *v23 = [v18 sequence];
            }
            if (a6) {
              *a6 = 0;
            }
            v11 = [v18 beaconIdentifier];

            goto LABEL_24;
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (a6)
    {
      v11 = 0;
      unsigned __int8 v12 = 2;
      goto LABEL_5;
    }
  }
  else if (a6)
  {
    v11 = 0;
    unsigned __int8 v12 = 1;
LABEL_5:
    *a6 = v12;
    goto LABEL_24;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

- (SPKeyReconciler)initWithDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPKeyReconciler;
  v6 = [(SPKeyReconciler *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingDictionary, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    keyIndices = v7->_keyIndices;
    v7->_keyIndices = v8;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__SPKeyReconciler_initWithDictionary___block_invoke;
    v11[3] = &unk_1E601CB30;
    unsigned __int8 v12 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
  }
  return v7;
}

void __38__SPKeyReconciler_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SPKeyReconciler_initWithDictionary___block_invoke_2;
  v7[3] = &unk_1E601CB08;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __38__SPKeyReconciler_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  handle_from_file_descriptor = sp_key_index_map_create_handle_from_file_descriptor([v5 fileDescriptor]);
  v7 = [SPKeyIndexMap alloc];
  if (a3) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = [(SPKeyIndexMap *)v7 initWithBeaconIdentifier:*(void *)(a1 + 32) keySequence:v8 mapHandle:handle_from_file_descriptor];
  [v5 closeFile];

  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v9];
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"Backed by %lu keymaps\n", -[NSMutableArray count](self->_keyIndices, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_keyIndices;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 beaconIdentifier];
        if ([v8 sequence] == 1) {
          id v10 = "primary";
        }
        else {
          id v10 = "secondary";
        }
        [v3 appendFormat:@"\tIndex for beacon %@ sequence %s\n", v9, v10];

        v11 = [v8 headerString];
        [v3 appendFormat:@"\t%@\n", v11];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

@end