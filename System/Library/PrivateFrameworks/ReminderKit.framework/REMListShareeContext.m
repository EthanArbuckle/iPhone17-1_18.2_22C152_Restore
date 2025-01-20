@interface REMListShareeContext
- (NSArray)sharees;
- (REMList)list;
- (REMListShareeContext)initWithList:(id)a3;
- (REMSharee)sharedOwner;
- (id)shareesExcludingOwner;
- (void)setList:(id)a3;
@end

@implementation REMListShareeContext

- (REMListShareeContext)initWithList:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMListShareeContext;
  v6 = [(REMListShareeContext *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_list, a3);
    sharedOwner = v7->_sharedOwner;
    v7->_sharedOwner = 0;

    v9 = [v5 sharedOwnerID];

    if (v9)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v10 = [v5 sharees];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v16 = [v15 objectID];
            v17 = [v5 sharedOwnerID];
            int v18 = [v16 isEqual:v17];

            if (v18)
            {
              objc_storeStrong((id *)&v7->_sharedOwner, v15);
              goto LABEL_13;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);

  objc_storeStrong((id *)&self->_sharedOwner, 0);
}

- (NSArray)sharees
{
  v2 = [(REMListShareeContext *)self list];
  v3 = [v2 sharees];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)shareesExcludingOwner
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(REMListShareeContext *)self sharedOwner];
  v4 = [v3 objectID];

  id v5 = [(REMListShareeContext *)self sharees];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__REMListShareeContext_shareesExcludingOwner__block_invoke;
  v14[3] = &unk_1E61DC190;
  id v15 = v4;
  id v7 = v4;
  v8 = [v6 predicateWithBlock:v14];
  v9 = [v5 filteredArrayUsingPredicate:v8];

  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"hash" ascending:1];
  v16[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v12 = [v9 sortedArrayUsingDescriptors:v11];

  return v12;
}

uint64_t __45__REMListShareeContext_shareesExcludingOwner__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = REMDynamicCast(v4, (uint64_t)v3);

  v6 = [v5 objectID];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v7;
}

- (REMSharee)sharedOwner
{
  return self->_sharedOwner;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

@end