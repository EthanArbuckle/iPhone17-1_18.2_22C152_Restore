@interface SidecarTransferGroup
- (BOOL)handleMessage:(id)a3 error:(id *)a4;
- (BOOL)isComplete;
- (NSArray)items;
- (SidecarTransferGroup)initWithMessage:(id)a3;
- (int64_t)type;
@end

@implementation SidecarTransferGroup

- (void).cxx_destruct
{
}

- (BOOL)handleMessage:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
  v8 = [v6 objectForKey:&unk_26E18EA78];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v9 = [v8 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    v20 = a4;
    v11 = self;
    if (v10)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v7, "addIndex:", objc_msgSend(v14, "integerValue"));
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    self = v11;
    a4 = v20;
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44__SidecarTransferGroup_handleMessage_error___block_invoke;
  v21[3] = &unk_2649C5E00;
  v21[4] = self;
  id v15 = v6;
  id v22 = v15;
  v23 = &v24;
  [v7 enumerateIndexesUsingBlock:v21];
  v16 = v25;
  if (a4)
  {
    v17 = (void *)v25[5];
    if (v17)
    {
      *a4 = v17;
      v16 = v25;
    }
  }
  BOOL v18 = v16[5] == 0;

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __44__SidecarTransferGroup_handleMessage_error___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 16) count] <= a2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a2];
  }
  id v7 = SidecarMessageGetItemData(*(void **)(a1 + 40), a2);
  if (v7 && ([v6 appendData:v7] & 1) != 0)
  {
    *(void *)(*(void *)(a1 + 32) + 8) += [v6 isComplete];
  }
  else
  {
    *a3 = 1;
    id v8 = *(id *)(a1 + 40);
    id v9 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SidecarErrorDomain" code:-1010 userInfo:0];
    if (v9)
    {
      uint64_t v12 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      if (v12)
      {
        log = v12;
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        uint64_t v12 = log;
        if (v13)
        {
          v14 = [v9 domain];
          uint64_t v15 = [v9 code];
          v16 = [v9 localizedDescription];
          *(_DWORD *)buf = 138543875;
          v19 = v14;
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          __int16 v22 = 2113;
          v23 = v16;
          _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          uint64_t v12 = log;
        }
      }
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  if ([(SidecarTransferGroup *)self isComplete]) {
    v3 = (void *)[(NSArray *)self->_mutableItems copy];
  }
  else {
    v3 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v3;
}

- (BOOL)isComplete
{
  return [(NSArray *)self->_mutableItems count] == self->_completedItems;
}

- (SidecarTransferGroup)initWithMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SidecarTransferGroup;
  v5 = [(SidecarTransferGroup *)&v23 init];
  if (!v5)
  {
LABEL_21:
    id v7 = v5;
    goto LABEL_22;
  }
  unint64_t Type = SidecarMessageGetType(v4);
  id v7 = 0;
  if (Type <= 4 && ((1 << Type) & 0x1A) != 0)
  {
    v5->_type = Type;
    id v8 = [v4 objectForKey:&unk_26E18EAC0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      objc_opt_class();
      objc_opt_class();
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = v8;
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        uint64_t v21 = v8;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_18;
            }
            uint64_t v15 = [v14 objectForKey:&unk_26E18EA90];
            v16 = [v14 objectForKey:&unk_26E18EAA8];
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_18:
              BOOL v18 = (NSArray *)MEMORY[0x263EFFA68];
              id v8 = v21;
              goto LABEL_19;
            }
            v17 = -[SidecarMutableItem initWithType:capacity:]([SidecarMutableItem alloc], "initWithType:capacity:", v16, [v15 unsignedIntegerValue]);
            [v9 addObject:v17];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          id v8 = v21;
          if (v11) {
            continue;
          }
          break;
        }
      }

      BOOL v18 = v9;
LABEL_19:
    }
    else
    {
      BOOL v18 = (NSArray *)MEMORY[0x263EFFA68];
    }

    mutableItems = v5->_mutableItems;
    v5->_mutableItems = v18;

    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

@end