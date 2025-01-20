@interface XBApplicationSnapshotGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateWithContainerIdentity:(id)a3;
- (BOOL)removeSnapshot:(id)a3;
- (NSSet)snapshots;
- (NSString)containerPath;
- (NSString)description;
- (NSString)identifier;
- (XBApplicationSnapshotGroup)initWithCoder:(id)a3;
- (XBSnapshotContainerIdentity)containerIdentity;
- (id)_initWithIdentifier:(id)a3 containerIdentity:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_commonInit;
- (void)_invalidate;
- (void)_manifestQueueDecode_setStore:(id)a3;
- (void)addSnapshot:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerIdentity:(id)a3;
@end

@implementation XBApplicationSnapshotGroup

- (NSSet)snapshots
{
  return &self->_snapshots->super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)removeSnapshot:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableSet *)self->_snapshots containsObject:v4];
  if (v5)
  {
    [(NSMutableSet *)self->_snapshots removeObject:v4];
    v6 = [v4 variantID];

    if (v6)
    {
      snapshots = self->_snapshots;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __45__XBApplicationSnapshotGroup_removeSnapshot___block_invoke;
      v9[3] = &unk_2646A63D8;
      id v10 = v4;
      [(NSMutableSet *)snapshots enumerateObjectsUsingBlock:v9];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  int v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_snapshots;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "path", (void)v13);

        if (v12) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [v4 encodeObject:v5 forKey:@"snapshots"];
  }
}

- (void)_commonInit
{
  self->_snapshots = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  MEMORY[0x270F9A758]();
}

- (id)_initWithIdentifier:(id)a3 containerIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XBApplicationSnapshotGroup;
  uint64_t v8 = [(XBApplicationSnapshotGroup *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(XBApplicationSnapshotGroup *)v8 _commonInit];
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_containerIdentity, a4);
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotGroup *)self descriptionWithMultilinePrefix:0];
}

- (NSString)containerPath
{
  v3 = [(XBApplicationSnapshotGroup *)self containerIdentity];
  id v4 = [v3 snapshotContainerPathForGroupID:self->_identifier];

  return (NSString *)v4;
}

- (void)addSnapshot:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_snapshots, "addObject:");
  }
}

uint64_t __45__XBApplicationSnapshotGroup_removeSnapshot___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willDeleteVariant:*(void *)(a1 + 32)];
}

- (void)_manifestQueueDecode_setStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_snapshots;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_manifestQueueDecode_setStore:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v56 = [MEMORY[0x263F08690] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"XBApplicationSnapshotGroup.m", 90, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];
  }
  v64 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [(XBApplicationSnapshotGroup *)self containerIdentity];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0) {
    [(XBApplicationSnapshotGroup *)self setContainerIdentity:v5];
  }
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v9 = [v5 snapshotContainerPathForGroupID:self->_identifier];
  v62 = v9;
  v63 = self;
  if (v9)
  {
    id v60 = v5;
    long long v10 = [v64 enumeratorAtPath:v9];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:v88 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v76;
      uint64_t v14 = *MEMORY[0x263F080E8];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v76 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          v17 = [v10 fileAttributes];
          uint64_t v18 = [v17 fileType];
          int v19 = [v18 isEqualToString:v14];

          if (v19) {
            [v8 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v75 objects:v88 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v62;
    self = v63;
    id v5 = v60;
  }
  v20 = (void *)[(NSMutableSet *)self->_snapshots copy];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __61__XBApplicationSnapshotGroup__validateWithContainerIdentity___block_invoke;
  v71[3] = &unk_2646A6400;
  id v21 = v5;
  id v72 = v21;
  v73 = self;
  id v22 = v8;
  id v74 = v22;
  [v20 enumerateObjectsUsingBlock:v71];

  if ([(NSMutableSet *)self->_snapshots count])
  {
    if (v9) {
      BOOL v23 = self->_identifier == 0;
    }
    else {
      BOOL v23 = 1;
    }
    BOOL v24 = !v23;
    if (!v9) {
      goto LABEL_33;
    }
  }
  else
  {
    BOOL v24 = 0;
    if (!v9) {
      goto LABEL_33;
    }
  }
  if (!v24)
  {
    v25 = XBLogFileManifest();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(XBApplicationSnapshotGroup *)self containerIdentity];
      v27 = [v26 bundleIdentifier];
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543874;
      v81 = v27;
      __int16 v82 = 2114;
      v83 = identifier;
      __int16 v84 = 2114;
      v85 = v9;
      _os_log_impl(&dword_2232AB000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Group %{public}@ deleting container with no valid snapshots: %{public}@", buf, 0x20u);
    }
    id v70 = 0;
    char v29 = [v64 removeItemAtPath:v9 error:&v70];
    id v30 = v70;
    id v31 = v30;
    if ((v29 & 1) == 0)
    {
      v32 = [v30 domain];
      if ([v32 isEqualToString:*MEMORY[0x263F07F70]])
      {
        uint64_t v33 = [v31 code];

        if (v33 == 4) {
          goto LABEL_55;
        }
      }
      else
      {
      }
      v51 = XBLogFileManifest();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v53 = [(XBApplicationSnapshotGroup *)self containerIdentity];
        v54 = [v53 bundleIdentifier];
        v55 = self->_identifier;
        *(_DWORD *)buf = 138544130;
        v81 = v54;
        __int16 v82 = 2114;
        v83 = v55;
        __int16 v84 = 2114;
        v85 = v9;
        __int16 v86 = 2114;
        id v87 = v31;
        _os_log_error_impl(&dword_2232AB000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Error with Group %{public}@ deleting container with no valid snapshots at %{public}@: %{public}@", buf, 0x2Au);
      }
    }
    goto LABEL_55;
  }
LABEL_33:
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v31 = v22;
  uint64_t v34 = [v31 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    BOOL v57 = v24;
    id v58 = v21;
    uint64_t v36 = *(void *)v67;
    uint64_t v61 = *MEMORY[0x263F07F70];
    while (1)
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v67 != v36) {
          objc_enumerationMutation(v31);
        }
        v38 = [v9 stringByAppendingPathComponent:*(void *)(*((void *)&v66 + 1) + 8 * j)];
        v39 = XBLogFileManifest();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [(XBApplicationSnapshotGroup *)v63 containerIdentity];
          v41 = [v40 bundleIdentifier];
          v42 = v63->_identifier;
          uint64_t v9 = v62;
          *(_DWORD *)buf = 138543874;
          v81 = v41;
          __int16 v82 = 2114;
          v83 = v42;
          __int16 v84 = 2114;
          v85 = v38;
          _os_log_impl(&dword_2232AB000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Group %{public}@ deleting unreferenced file: %{public}@", buf, 0x20u);
        }
        id v65 = 0;
        char v43 = [v64 removeItemAtPath:v38 error:&v65];
        id v44 = v65;
        v45 = v44;
        if ((v43 & 1) == 0)
        {
          v46 = [v44 domain];
          if ([v46 isEqualToString:v61])
          {
            uint64_t v47 = [v45 code];

            if (v47 == 4) {
              goto LABEL_48;
            }
          }
          else
          {
          }
          v48 = XBLogFileManifest();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v59 = [(XBApplicationSnapshotGroup *)v63 containerIdentity];
            v49 = [v59 bundleIdentifier];
            v50 = v63->_identifier;
            uint64_t v9 = v62;
            *(_DWORD *)buf = 138544130;
            v81 = v49;
            __int16 v82 = 2114;
            v83 = v50;
            __int16 v84 = 2114;
            v85 = v38;
            __int16 v86 = 2114;
            id v87 = v45;
            _os_log_error_impl(&dword_2232AB000, v48, OS_LOG_TYPE_ERROR, "[%{public}@] Error with Group %{public}@ deleting unreferenced file at %{public}@: %{public}@", buf, 0x2Au);
          }
        }
LABEL_48:
      }
      uint64_t v35 = [v31 countByEnumeratingWithState:&v66 objects:v79 count:16];
      if (!v35)
      {
        id v21 = v58;
        LOBYTE(v24) = v57;
        break;
      }
    }
  }
LABEL_55:

  return v24;
}

void __61__XBApplicationSnapshotGroup__validateWithContainerIdentity___block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 _validateWithContainerIdentity:a1[4]])
  {
    id v4 = (void *)a1[6];
    id v5 = [v3 filename];
    [v4 removeObject:v5];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_msgSend(v3, "variants", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = (void *)a1[6];
          uint64_t v13 = [v11 variantID];
          uint64_t v14 = [v11 filename];
          uint64_t v15 = [v13 stringByAppendingPathComponent:v14];
          [v12 removeObject:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [*(id *)(a1[5] + 24) removeObject:v3];
  }
}

- (void)_invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_snapshots;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_invalidate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (XBApplicationSnapshotGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)XBApplicationSnapshotGroup;
  uint64_t v5 = [(XBApplicationSnapshotGroup *)&v17 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(XBApplicationSnapshotGroup *)v5 _commonInit];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    long long v9 = (void *)MEMORY[0x223CB2D30]();
    long long v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"snapshots"];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263EFF9C0] setWithArray:v13];
      snapshots = v6->_snapshots;
      v6->_snapshots = (NSMutableSet *)v14;
    }
  }

  return v6;
}

- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(XBApplicationSnapshotGroup *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__XBApplicationSnapshotGroup_descriptionForStateCaptureWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BE8;
  void v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  if (*((unsigned char *)v13 + 24))
  {
    uint64_t v7 = [v6 build];
  }
  else
  {
    uint64_t v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __76__XBApplicationSnapshotGroup_descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        long long v8 = objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix", (void)v11);
        long long v9 = [v7 descriptionForStateCaptureWithMultilinePrefix:v8];

        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          id v10 = (id)[*(id *)(a1 + 40) appendObject:v9 withName:0];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)succinctDescription
{
  id v2 = [(XBApplicationSnapshotGroup *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(XBApplicationSnapshotGroup *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XBApplicationSnapshotGroup *)self succinctDescriptionBuilder];
  uint64_t v6 = [(NSMutableSet *)self->_snapshots allObjects];
  [v5 appendArraySection:v6 withName:0 multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return (XBSnapshotContainerIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end