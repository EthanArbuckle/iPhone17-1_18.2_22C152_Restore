@interface SRUIFTreeNodePropertyListSerialization
- (id)_propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4;
- (id)_treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5;
- (id)propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4;
- (id)treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5;
@end

@implementation SRUIFTreeNodePropertyListSerialization

- (id)_propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [v6 item];
  v10 = (void *)v9;
  if (v7 && v9)
  {
    v11 = v7[2](v7, v9);
    if (v11)
    {
      [v8 setObject:v11 forKey:@"Item"];
    }
    else
    {
      v12 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[SRUIFTreeNodePropertyListSerialization _propertyListWithTreeNode:itemPropertyListCreation:]";
        __int16 v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_DEFAULT, "%s item property list creation block returned nil for item %@", buf, 0x16u);
      }
    }
  }
  v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "numberOfChildNodes"));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__SRUIFTreeNodePropertyListSerialization__propertyListWithTreeNode_itemPropertyListCreation___block_invoke;
  v17[3] = &unk_264786668;
  id v18 = v13;
  v19 = v7;
  v17[4] = self;
  id v14 = v13;
  v15 = v7;
  [v6 enumerateChildNodesUsingBlock:v17];
  [v8 setObject:v14 forKey:@"ChildNodes"];

  return v8;
}

void __93__SRUIFTreeNodePropertyListSerialization__propertyListWithTreeNode_itemPropertyListCreation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _propertyListWithTreeNode:a2 itemPropertyListCreation:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4
{
  v4 = [(SRUIFTreeNodePropertyListSerialization *)self _propertyListWithTreeNode:a3 itemPropertyListCreation:a4];
  [v4 setObject:&unk_26D9B6040 forKey:@"Version"];
  return v4;
}

- (id)_treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = objc_alloc_init(SRUIFDictionarySchema);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke;
  v34[3] = &unk_2647866B8;
  v34[4] = self;
  id v11 = v9;
  id v35 = v11;
  v12 = +[SRUIFCoercion coercionWithBlock:v34];
  [(SRUIFDictionarySchema *)v10 setObjectCoercion:v12 forKey:@"ChildNodes"];

  v13 = objc_alloc_init(SRUIFTreeNode);
  id v14 = [(SRUIFDictionarySchema *)v10 coerceObject:v8 error:a4];
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 objectForKey:@"Item"];
    v17 = 0;
    v28 = (void *)v16;
    id v29 = v8;
    if (v11)
    {
      uint64_t v18 = v16;
      if (v16)
      {
        v19 = (*((void (**)(id, uint64_t))v11 + 2))(v11, v16);
        if (v19)
        {
          [(SRUIFTreeNode *)v13 setItem:v19];
          v17 = 0;
        }
        else
        {
          v21 = [NSString stringWithFormat:@"Item creation block returned nil for %@", v18];
          v17 = +[SRUIFConversationError errorWithCode:400 localizedFailureReason:v21];

          v13 = 0;
        }
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    __int16 v22 = [v15 objectForKey:@"ChildNodes"];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          [(SRUIFTreeNode *)v13 addChildNode:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v24);
    }

    if (a4) {
      *a4 = v17;
    }
    v13 = v13;

    v20 = v13;
    id v8 = v29;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v25 = 0;
  v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  id v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  id v6 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  v7 = v26;
  id obj = v26[5];
  id v8 = [v6 coerceObject:v5 error:&obj];
  objc_storeStrong(v7 + 5, obj);

  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)v20[5];
    v20[5] = v9;

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke_13;
    v14[3] = &unk_264786690;
    id v11 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    uint64_t v16 = &v25;
    id v15 = v11;
    v17 = &v19;
    [v8 enumerateObjectsUsingBlock:v14];
  }
  if (a3) {
    *a3 = v26[5];
  }
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  v7 = [*(id *)(a1 + 32) _treeNodeWithPropertyList:a2 error:&obj itemCreation:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  if (v7)
  {
    [v9 addObject:v7];
  }
  else
  {
    *(void *)(v8 + 40) = 0;

    *a4 = 1;
  }
}

- (id)treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(SRUIFDictionarySchema);
  id v11 = +[SRUIFCoercion typeAssertionWithClass:objc_opt_class()];
  [(SRUIFDictionarySchema *)v10 setObjectCoercion:v11 forKey:@"Version"];

  id v12 = [(SRUIFDictionarySchema *)v10 coerceObject:v9 error:a4];

  if (!v12) {
    goto LABEL_6;
  }
  v13 = [v12 objectForKey:@"Version"];
  uint64_t v14 = [v13 integerValue];

  if (v14 == 1)
  {
    a4 = [(SRUIFTreeNodePropertyListSerialization *)self _treeNodeWithPropertyList:v12 error:a4 itemCreation:v8];
    goto LABEL_7;
  }
  if (a4)
  {
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to create tree node from property list with version %ld", v14);
    *a4 = +[SRUIFConversationError errorWithCode:400 localizedFailureReason:v15];

LABEL_6:
    a4 = 0;
  }
LABEL_7:

  return a4;
}

@end