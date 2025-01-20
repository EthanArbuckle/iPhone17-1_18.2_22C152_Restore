@interface PKApplicationMessageNode
+ (id)_createForType:(uint64_t)a1;
+ (id)createForMessages:(id)a3;
+ (id)messageKeysForNode:(id)a3 localKeys:(id *)a4;
- (NSArray)children;
- (NSObject)key;
- (PKApplicationMessageNode)init;
- (PKApplicationMessageNode)parent;
- (PKApplicationMessageNode)root;
- (id)_ancestorPassingTest:(id *)a1;
- (id)ancestorPassingTest:(id)a3;
- (id)context;
- (int64_t)type;
- (unint64_t)numberOfChildren;
- (void)_visitPostOrder:(uint64_t)a1;
- (void)_visitPreOrder:(uint64_t)a1;
- (void)setContext:(id)a3;
- (void)visitPostOrder:(id)a3;
- (void)visitPreOrder:(id)a3;
@end

@implementation PKApplicationMessageNode

+ (id)createForMessages:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3 || ![v3 count])
  {
    v36 = 0;
    goto LABEL_48;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v50 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v64 count:16];
  v8 = &off_1E56D4000;
  if (!v7) {
    goto LABEL_33;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v57;
  id v51 = v6;
  uint64_t v52 = *(void *)v57;
  do
  {
    uint64_t v11 = 0;
    uint64_t v53 = v9;
    do
    {
      if (*(void *)v57 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(id **)(*((void *)&v56 + 1) + 8 * v11);
      if (v12)
      {
        v13 = (id *)v12[2];
        v14 = v13;
        if (v13)
        {
          id v15 = v13[2];
          goto LABEL_11;
        }
      }
      else
      {
        v14 = 0;
      }
      id v15 = 0;
LABEL_11:

      v16 = v12;
      self;
      if (v12)
      {
        +[PKApplicationMessageNode _createForType:]((uint64_t)v8[315], 0);
        v17 = (id *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v17 + 5, v12);
      }
      else
      {
        v17 = 0;
      }

      uint64_t v18 = [v5 objectForKeyedSubscript:v15];
      if (!v18)
      {
        v21 = v17;
        self;
        if (v21)
        {
          id v22 = v5;
          v23 = v8;
          uint64_t v19 = +[PKApplicationMessageNode _createForType:]((uint64_t)v8[315], 1uLL);
          v24 = (id *)v21[5];
          if (v24)
          {
            v25 = v24[2];
            v26 = v24;
            if (v25)
            {
              v27 = (void *)v25[2];
              goto LABEL_22;
            }
            id v28 = 0;
          }
          else
          {
            v27 = 0;
            v25 = 0;
LABEL_22:
            id v28 = v27;
          }
          v29 = *(void **)(v19 + 48);
          *(void *)(v19 + 48) = v28;

          uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v21, 0);
          v31 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v30;

          objc_storeWeak(v21 + 3, (id)v19);
          v8 = v23;
          id v5 = v22;
          id v6 = v51;
          uint64_t v10 = v52;
          uint64_t v9 = v53;
        }
        else
        {
          uint64_t v19 = 0;
        }

        [v5 setObject:v19 forKeyedSubscript:v15];
        goto LABEL_26;
      }
      uint64_t v19 = v18;
      v20 = v17;
      [*(id *)(v19 + 40) addObject:v20];
      if (v20) {
        objc_storeWeak(v20 + 3, (id)v19);
      }

LABEL_26:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v32 = [v6 countByEnumeratingWithState:&v56 objects:v64 count:16];
    uint64_t v9 = v32;
  }
  while (v32);
LABEL_33:

  v33 = [v5 allValues];
  v34 = @"summary";
  id v35 = v33;
  self;
  if (v35 && [v35 count])
  {
    v36 = +[PKApplicationMessageNode _createForType:]((uint64_t)v8[315], 2uLL);
    uint64_t v37 = [@"summary" copy];
    v38 = (void *)v36[6];
    v36[6] = v37;

    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v35];
    v40 = (void *)v36[5];
    v36[5] = v39;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v41 = v35;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v65 count:16];
    v4 = v50;
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v61;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v61 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v60 + 1) + 8 * v45);
          if (v46) {
            objc_storeWeak((id *)(v46 + 24), v36);
          }
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v43);
    }
  }
  else
  {
    v36 = 0;
    v4 = v50;
  }

  v47 = [MEMORY[0x1E4F1C9C8] now];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __46__PKApplicationMessageNode_createForMessages___block_invoke;
  v54[3] = &unk_1E56E8DD8;
  id v55 = v47;
  id v48 = v47;
  -[PKApplicationMessageNode _visitPostOrder:]((uint64_t)v36, v54);

LABEL_48:
  return v36;
}

void __46__PKApplicationMessageNode_createForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3[2];
  if (v4 == 2)
  {
    uint64_t v10 = v3;
    id v5 = *(id *)(a1 + 32);
    id v6 = (void *)v10[5];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v7 = __61__PKApplicationMessageNodeMultipleGroupBranch__sortWithDate___block_invoke;
    v8 = &unk_1E56E8E98;
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v10 = v3;
    id v5 = *(id *)(a1 + 32);
    id v6 = (void *)v10[5];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v7 = __53__PKApplicationMessageNodeGroupBranch__sortWithDate___block_invoke;
    v8 = &unk_1E56E8E70;
  }
  v13 = v7;
  v14 = v8;
  id v9 = v5;
  id v15 = v9;
  [v6 sortUsingComparator:&v11];

  id v3 = v10;
LABEL_6:
}

- (void)_visitPostOrder:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v4 = (void *)MEMORY[0x192FDC630]();
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  if (![v5 count]) {
    goto LABEL_13;
  }
  while (1)
  {
    uint64_t v6 = [v5 lastObject];
    uint64_t v7 = (void *)v6;
    if (*(unsigned char *)(v6 + 8)) {
      break;
    }
    *(unsigned char *)(v6 + 8) = 1;
    uint64_t v8 = *(void *)(v6 + 16);
    if (v8 == 1)
    {
      id v9 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
LABEL_10:
      uint64_t v10 = [*(id *)(v6 + *v9) copy];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        [v5 addObjectsFromArray:v10];
      }
      goto LABEL_12;
    }
    if (v8 == 2)
    {
      id v9 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
      goto LABEL_10;
    }
LABEL_12:

    if (![v5 count]) {
      goto LABEL_13;
    }
  }
  [v5 removeLastObject];
  char v12 = 0;
  v3[2](v3, v7, &v12);
  if (!v12) {
    goto LABEL_12;
  }

LABEL_13:
  -[PKApplicationMessageNode _visitPreOrder:](a1, &__block_literal_global_115);

LABEL_14:
}

+ (id)messageKeysForNode:(id)a3 localKeys:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke;
    aBlock[3] = &unk_1E56E8E00;
    id v8 = v7;
    id v20 = v8;
    id v9 = v6;
    id v21 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    uint64_t v11 = v10;
    uint64_t v12 = v5[2];
    if ((unint64_t)(v12 - 1) >= 2)
    {
      if (!v12) {
        (*((void (**)(void *, void))v10 + 2))(v10, v5[5]);
      }
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke_2;
      v17[3] = &unk_1E56E8E28;
      id v18 = v10;
      -[PKApplicationMessageNode _visitPreOrder:]((uint64_t)v5, v17);
    }
    if (a4 && [v8 count])
    {
      v14 = (void *)[v8 copy];
      id v15 = *a4;
      *a4 = v14;
    }
    if ([v9 count]) {
      v13 = (void *)[v9 copy];
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return;
  }
  uint64_t v3 = *(void *)(a2 + 8);
  if (!v3)
  {
    id v5 = 0;
LABEL_8:
    id v6 = (id *)(a1 + 32);
    goto LABEL_9;
  }
  uint64_t v4 = *(id *)(v3 + 16);
  id v5 = v4;
  if (!v4 || !v4[1]) {
    goto LABEL_8;
  }
  id v6 = (id *)(a1 + 40);
LABEL_9:
  id v7 = v5;
  [*v6 addObject:v5];
}

uint64_t __57__PKApplicationMessageNode_messageKeysForNode_localKeys___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_visitPreOrder:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v4 = (void *)MEMORY[0x192FDC630]();
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  if (![v5 count]) {
    goto LABEL_17;
  }
  while (1)
  {
    id v6 = [v5 lastObject];
    [v5 removeLastObject];
    char v13 = 1;
    char v12 = 0;
    v3[2](v3, v6, &v13, &v12);
    if (v12) {
      break;
    }
    if (v13) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v6[2];
    if (v8 == 1)
    {
      id v9 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
LABEL_12:
      uint64_t v10 = [*(id *)((char *)v6 + *v9) copy];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        [v5 addObjectsFromArray:v10];
      }
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      id v9 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
      goto LABEL_12;
    }
LABEL_14:

    if (![v5 count]) {
      goto LABEL_17;
    }
  }

LABEL_17:
LABEL_18:
}

+ (id)_createForType:(uint64_t)a1
{
  self;
  if (a2 >= 3)
  {
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  id v3 = objc_alloc(*off_1E56E8EB8[a2]);
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  v8.receiver = v3;
  v8.super_class = (Class)PKApplicationMessageNode;
  id v5 = objc_msgSendSuper2(&v8, sel_init);
  id v6 = v5;
  if (v5) {
    *((void *)v5 + 2) = a2;
  }
LABEL_7:

  return v6;
}

- (PKApplicationMessageNode)init
{
  return 0;
}

- (NSObject)key
{
  if (!self)
  {
LABEL_10:
    id v7 = 0;
    goto LABEL_12;
  }
  int64_t type = self->_type;
  if (type != 2 && type != 1)
  {
    if (!type)
    {
      isa = (id *)self[1].super.isa;
      if (isa)
      {
        uint64_t v4 = isa[1];
        id v5 = isa;
        if (!v4)
        {
          id v7 = 0;
          goto LABEL_9;
        }
        id v6 = (void *)v4[2];
      }
      else
      {
        id v6 = 0;
        uint64_t v4 = 0;
      }
      id v7 = v6;
LABEL_9:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v7 = *(id *)&self[1]._visited;
LABEL_12:
  return v7;
}

- (NSArray)children
{
  if (self)
  {
    int64_t type = self->_type;
    if (type == 1)
    {
      uint64_t v4 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
    }
    else
    {
      if (type != 2)
      {
        self = 0;
        goto LABEL_8;
      }
      uint64_t v4 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
    }
    self = (PKApplicationMessageNode *)[*(id *)((char *)&self->super.isa + *v4) copy];
LABEL_8:
    uint64_t v2 = vars8;
  }
  return (NSArray *)self;
}

- (unint64_t)numberOfChildren
{
  if (!self) {
    goto LABEL_7;
  }
  int64_t type = self->_type;
  if (type == 1)
  {
    id v3 = &OBJC_IVAR___PKApplicationMessageNodeGroupBranch__children;
    goto LABEL_6;
  }
  if (type != 2)
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  id v3 = &OBJC_IVAR___PKApplicationMessageNodeMultipleGroupBranch__children;
LABEL_6:
  uint64_t v4 = (void *)[*(id *)((char *)&self->super.isa + *v3) copy];
LABEL_8:
  unint64_t v5 = [v4 count];

  return v5;
}

- (PKApplicationMessageNode)root
{
  if (self)
  {
    -[PKApplicationMessageNode _ancestorPassingTest:]((id *)&self->super.isa, 0);
    self = (PKApplicationMessageNode *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)_ancestorPassingTest:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    a1 = 0;
    while (1)
    {
      char v8 = 0;
      if (!v3 || v3[2](v3, v4, &v8))
      {
        unint64_t v5 = v4;

        a1 = v5;
      }
      if (v8) {
        break;
      }
      WeakRetained = (id *)objc_loadWeakRetained(v4 + 3);

      uint64_t v4 = WeakRetained;
      if (!WeakRetained) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:

  return a1;
}

- (id)ancestorPassingTest:(id)a3
{
  return -[PKApplicationMessageNode _ancestorPassingTest:]((id *)&self->super.isa, a3);
}

- (void)visitPreOrder:(id)a3
{
}

- (void)visitPostOrder:(id)a3
{
}

void __41__PKApplicationMessageNode__resetVisited__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 0;
}

- (int64_t)type
{
  return self->_type;
}

- (PKApplicationMessageNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (PKApplicationMessageNode *)WeakRetained;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end