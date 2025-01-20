@interface MFMailboxUidTransformer
+ (BOOL)isMailbox:(id)a3 equalTo:(id)a4 uidToMailboxMap:(id)a5;
- (MFMailboxUidTransformer)init;
- (id)_transformMailboxUid:(void *)a3 parent:(void *)a4 uidToMailboxMap:(void *)a5 objectIDToUidMap:;
- (id)transformMailboxUid:(id)a3 uidToMailboxMap:(id)a4 objectIDToUidMap:(id)a5;
@end

@implementation MFMailboxUidTransformer

- (id)_transformMailboxUid:(void *)a3 parent:(void *)a4 uidToMailboxMap:(void *)a5 objectIDToUidMap:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v31 = a3;
  id v36 = a4;
  id v10 = a5;
  v35 = v9;
  if (a1)
  {
    v32 = [v9 displayNameUsingSpecialNames];
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v12 = [v9 children];
    v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count") + 1);

    id v14 = objc_alloc(MEMORY[0x1E4F60400]);
    v15 = [v9 representedAccount];
    v16 = [v15 identifier];
    v33 = (void *)[v14 initWithRepresentedObjectID:v16];

    v34 = [v9 objectID];
    if (v34)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F60308]);
      uint64_t v18 = [v9 type];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __88__MFMailboxUidTransformer__transformMailboxUid_parent_uidToMailboxMap_objectIDToUidMap___block_invoke;
      v41[3] = &unk_1E5D3F200;
      id v19 = v9;
      id v42 = v19;
      id v43 = v31;
      v20 = (void *)[v17 initWithObjectID:v34 repository:0 name:v32 accountIdentifier:v33 type:v18 builder:v41];
      if (v36) {
        [v36 setObject:v20 forKey:v19];
      }
      if (v10)
      {
        v21 = [v20 objectID];
        [v10 setObject:v19 forKey:v21];
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v22 = objc_msgSend(v19, "children", v31);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            v27 = (void *)MEMORY[0x1AD0E3E00]();
            v28 = -[MFMailboxUidTransformer _transformMailboxUid:parent:uidToMailboxMap:objectIDToUidMap:](a1, v26, v20, v36, v10);
            [v13 addObjectsFromArray:v28];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v23);
      }

      [v13 addObject:v20];
      v29 = (void *)[v13 copy];
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

void __88__MFMailboxUidTransformer__transformMailboxUid_parent_uidToMailboxMap_objectIDToUidMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setCanContainMessages:", objc_msgSend(*(id *)(a1 + 32), "isStore"));
  [v3 setParent:*(void *)(a1 + 40)];
}

- (id)transformMailboxUid:(id)a3 uidToMailboxMap:(id)a4 objectIDToUidMap:(id)a5
{
  v5 = -[MFMailboxUidTransformer _transformMailboxUid:parent:uidToMailboxMap:objectIDToUidMap:]((uint64_t)self, a3, 0, a4, a5);
  return v5;
}

- (MFMailboxUidTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailboxUidTransformer;
  return [(MFMailboxUidTransformer *)&v3 init];
}

+ (BOOL)isMailbox:(id)a3 equalTo:(id)a4 uidToMailboxMap:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 name];
  id v14 = [v11 displayNameUsingSpecialNames];
  if (![v13 isEqual:v14])
  {
    BOOL v16 = 0;
    goto LABEL_17;
  }
  uint64_t v26 = [v10 objectID];
  v15 = [v26 url];
  if (v15 || ([v11 URL], (uint64_t v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [v10 objectID];
    v7 = [v6 url];
    v5 = [v11 URL];
    if (([v7 isEqual:v5] & 1) == 0)
    {

      BOOL v16 = 0;
      goto LABEL_14;
    }
    int v25 = 1;
  }
  else
  {
    uint64_t v24 = 0;
    int v25 = 0;
  }
  uint64_t v17 = [v10 type];
  if (v17 == [v11 type]
    && (int v18 = [v10 canContainMessages], v18 == objc_msgSend(v11, "isStore")))
  {
    if (v12)
    {
      uint64_t v20 = [v10 parent];
      uint64_t v23 = [v11 parent];
      v21 = [v12 objectForKey:v23];
      v22 = (void *)v20;
      BOOL v16 = v20 == (void)v21;

      if (!v25) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }
  if (v25)
  {
LABEL_13:
  }
LABEL_14:
  if (!v15) {

  }
LABEL_17:
  return v16;
}

@end