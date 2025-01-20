@interface RBSEndowmentTree
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)endowmentTreeForLinks:(id)a3;
+ (id)endowmentTreeForNamespace:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)endowmentNamespace;
- (RBSEndowmentTree)initWithRBSXPCCoder:(id)a3;
- (id)childrenLinks:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rootLinks;
- (unint64_t)hash;
- (void)_addLink:(uint64_t)a1;
- (void)_initWithLinks:(void *)a1;
- (void)_initWithNamespace:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEndowmentTree

+ (id)endowmentTreeForNamespace:(id)a3
{
  id v3 = a3;
  v4 = -[RBSEndowmentTree _initWithNamespace:]([RBSEndowmentTree alloc], v3);

  return v4;
}

- (void)_initWithNamespace:(void *)a1
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v52 = a2;
  if (a1)
  {
    v65.receiver = a1;
    v65.super_class = (Class)RBSEndowmentTree;
    v4 = (id *)objc_msgSendSuper2(&v65, sel_init);
    v5 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 2, a2);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v7 = (void *)v5[1];
      v5[1] = v6;

      v8 = +[RBSConnection sharedInstance];
      v9 = [v8 assertionDescriptorsByPidWithFlattenedAttributes:0 error:0];

      if (v9)
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v10 = v9;
        uint64_t v41 = [v10 countByEnumeratingWithState:&v61 objects:v68 count:16];
        if (!v41) {
          goto LABEL_35;
        }
        uint64_t v39 = *(void *)v62;
        v40 = v10;
        uint64_t v47 = (uint64_t)v5;
        while (1)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v62 != v39) {
              objc_enumerationMutation(v10);
            }
            uint64_t v42 = v11;
            v12 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v61 + 1) + 8 * v11), v39);
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id obj = v12;
            uint64_t v45 = [v12 countByEnumeratingWithState:&v57 objects:v67 count:16];
            if (v45)
            {
              uint64_t v44 = *(void *)v58;
              do
              {
                uint64_t v13 = 0;
                do
                {
                  if (*(void *)v58 != v44) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v46 = v13;
                  v14 = *(void **)(*((void *)&v57 + 1) + 8 * v13);
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  v49 = v14;
                  id v50 = [v14 attributes];
                  uint64_t v51 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
                  if (v51)
                  {
                    uint64_t v15 = *(void *)v54;
                    uint64_t v48 = *(void *)v54;
                    do
                    {
                      uint64_t v16 = 0;
                      do
                      {
                        if (*(void *)v54 != v15) {
                          objc_enumerationMutation(v50);
                        }
                        v17 = *(void **)(*((void *)&v53 + 1) + 8 * v16);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v18 = v17;
                          v19 = [v18 endowmentNamespace];
                          int v20 = [v19 isEqual:v52];

                          if (v20)
                          {
                            v21 = [v18 sourceEnvironment];
                            if (!v21) {
                              v21 = (void *)[(id)RBSEndowmentRootEnvironment copy];
                            }
                            v22 = [v49 identifier];
                            uint64_t v23 = [v22 clientPid];
                            v24 = [v49 target];
                            v25 = [v24 environment];
                            v26 = [v49 target];
                            v27 = [v26 processIdentifier];
                            v28 = +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:](RBSEndowmentLink, "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:", v52, v21, v23, v25, [v27 pid]);

                            v5 = (void *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v28);

                            goto LABEL_27;
                          }
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_29;
                          }
                          v29 = [v17 endowmentNamespace];
                          int v30 = [v29 isEqual:v52];

                          if (v30)
                          {
                            v31 = (void *)[(id)RBSEndowmentRootEnvironment copy];
                            v32 = [v49 identifier];
                            uint64_t v33 = [v32 clientPid];
                            v34 = [v49 target];
                            v35 = [v34 environment];
                            v36 = [v49 target];
                            v37 = [v36 processIdentifier];
                            v21 = +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:](RBSEndowmentLink, "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:", v52, v31, v33, v35, [v37 pid]);

                            v5 = (void *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v21);
LABEL_27:

                            uint64_t v15 = v48;
                          }
                        }

LABEL_29:
                        ++v16;
                      }
                      while (v51 != v16);
                      uint64_t v51 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
                    }
                    while (v51);
                  }

                  uint64_t v13 = v46 + 1;
                }
                while (v46 + 1 != v45);
                uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
              }
              while (v45);
            }

            uint64_t v11 = v42 + 1;
            id v10 = v40;
          }
          while (v42 + 1 != v41);
          uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v68 count:16];
          if (!v41)
          {
LABEL_35:

            goto LABEL_37;
          }
        }
      }
      id v10 = v5;
      v5 = 0;
LABEL_37:
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)endowmentTreeForLinks:(id)a3
{
  id v3 = a3;
  v4 = -[RBSEndowmentTree _initWithLinks:]([RBSEndowmentTree alloc], v3);

  return v4;
}

- (void)_initWithLinks:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RBSEndowmentTree;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v4 = [v3 anyObject];
      uint64_t v5 = [v4 endowmentNamespace];
      id v6 = (void *)a1[2];
      a1[2] = v5;

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __35__RBSEndowmentTree__initWithLinks___block_invoke;
      v10[3] = &unk_1E5741318;
      a1 = a1;
      id v11 = a1;
      [v3 enumerateObjectsUsingBlock:v10];
    }
  }

  return a1;
}

- (void)_addLink:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 8);
    v4 = [v8 sourceEnvironment];
    id v5 = [v3 objectForKey:v4];

    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v6 = *(void **)(a1 + 8);
      id v7 = [v8 sourceEnvironment];
      [v6 setObject:v5 forKey:v7];
    }
    [v5 addObject:v8];
  }
}

void __35__RBSEndowmentTree__initWithLinks___block_invoke(uint64_t a1, void *a2)
{
}

- (id)rootLinks
{
  return (id)[(NSMutableDictionary *)self->_tree objectForKey:RBSEndowmentRootEnvironment];
}

- (id)childrenLinks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  tree = self->_tree;
  id v7 = [v4 targetEnvironment];
  id v8 = [(NSMutableDictionary *)tree objectForKey:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__RBSEndowmentTree_childrenLinks___block_invoke;
  v14[3] = &unk_1E5741340;
  id v15 = v4;
  id v9 = v5;
  id v16 = v9;
  id v10 = v4;
  [v8 enumerateObjectsUsingBlock:v14];
  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __34__RBSEndowmentTree_childrenLinks___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    int v3 = [*(id *)(a1 + 32) targetPid];
    if (v3 == [v4 sourcePid]) {
      [*(id *)(a1 + 40) addObject:v4];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSEndowmentTree *)a3;
  if (self == v4) {
    goto LABEL_12;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    char v6 = 0;
    goto LABEL_13;
  }
  endowmentNamespace = self->_endowmentNamespace;
  id v8 = v4->_endowmentNamespace;
  if (endowmentNamespace != v8)
  {
    char v6 = 0;
    if (!endowmentNamespace || !v8) {
      goto LABEL_13;
    }
    if (!-[NSString isEqual:](endowmentNamespace, "isEqual:")) {
      goto LABEL_3;
    }
  }
  tree = self->_tree;
  id v10 = v4->_tree;
  if (tree == v10)
  {
LABEL_12:
    char v6 = 1;
    goto LABEL_13;
  }
  char v6 = 0;
  if (tree && v10) {
    char v6 = -[NSMutableDictionary isEqual:](tree, "isEqual:");
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_endowmentNamespace hash];
  return [(NSMutableDictionary *)self->_tree hash] ^ v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| namespace:%@>", v4, self->_endowmentNamespace];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RBSEndowmentTree);
  objc_storeStrong((id *)&v4->_tree, self->_tree);
  objc_storeStrong((id *)&v4->_endowmentNamespace, self->_endowmentNamespace);
  return v4;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  tree = self->_tree;
  id v5 = a3;
  [v5 encodeObject:tree forKey:@"_tree"];
  [v5 encodeObject:self->_endowmentNamespace forKey:@"_endowmentNamespace"];
}

- (RBSEndowmentTree)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSEndowmentTree;
  id v5 = [(RBSEndowmentTree *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tree"];
    tree = v5->_tree;
    v5->_tree = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endowmentNamespace"];
    endowmentNamespace = v5->_endowmentNamespace;
    v5->_endowmentNamespace = (NSString *)v8;
  }
  return v5;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
  objc_storeStrong((id *)&self->_tree, 0);
}

@end