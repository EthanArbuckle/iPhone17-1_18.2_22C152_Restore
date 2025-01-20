@interface TPSyncingPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isInheritedAccount;
- (BOOL)isSyncingEnabledForView:(id)a3;
- (BOOL)syncUserControllableViewsAsBoolean;
- (NSArray)keyViewMapping;
- (NSSet)priorityViews;
- (NSSet)userControllableViews;
- (NSSet)viewList;
- (NSSet)viewsToPiggybackTLKs;
- (NSString)model;
- (TPPolicyVersion)version;
- (TPSyncingPolicy)initWithCoder:(id)a3;
- (TPSyncingPolicy)initWithModel:(id)a3 version:(id)a4 viewList:(id)a5 priorityViews:(id)a6 userControllableViews:(id)a7 syncUserControllableViews:(int)a8 viewsToPiggybackTLKs:(id)a9 keyViewMapping:(id)a10 isInheritedAccount:(BOOL)a11;
- (id)description;
- (id)mapDictionaryToView:(id)a3;
- (int)syncUserControllableViews;
- (void)encodeWithCoder:(id)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
@end

@implementation TPSyncingPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userControllableViews, 0);
  objc_storeStrong((id *)&self->_viewsToPiggybackTLKs, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_keyViewMapping, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (int)syncUserControllableViews
{
  return self->_syncUserControllableViews;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  self->_isInheritedAccount = a3;
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (NSSet)userControllableViews
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (NSSet)viewsToPiggybackTLKs
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)priorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)keyViewMapping
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (TPPolicyVersion)version
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (TPSyncingPolicy)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSyncingPolicy;
  v5 = [(TPSyncingPolicy *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"keyViewMapping"];
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v17 = [v15 setWithArray:v16];

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"viewList"];
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v17 forKey:@"priorityViews"];
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v17 forKey:@"userControllableViews"];
    userControllableViews = v5->_userControllableViews;
    v5->_userControllableViews = (NSSet *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ucvShouldSync"];
    if ([v24 isEqualToString:@"UNKNOWN"])
    {
      int v25 = 0;
    }
    else if ([v24 isEqualToString:@"DISABLED"])
    {
      int v25 = 1;
    }
    else if ([v24 isEqualToString:@"ENABLED"])
    {
      int v25 = 2;
    }
    else if ([v24 isEqualToString:@"FOLLOWING"])
    {
      int v25 = 3;
    }
    else
    {
      int v25 = 0;
    }

    v5->_syncUserControllableViews = v25;
    uint64_t v26 = [v4 decodeObjectOfClasses:v17 forKey:@"viewsToPiggybackTLKs"];
    viewsToPiggybackTLKs = v5->_viewsToPiggybackTLKs;
    v5->_viewsToPiggybackTLKs = (NSSet *)v26;

    v5->_isInheritedAccount = [v4 decodeBoolForKey:@"isInheritedAccount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(TPSyncingPolicy *)self version];
  [v13 encodeObject:v4 forKey:@"version"];

  v5 = [(TPSyncingPolicy *)self model];
  [v13 encodeObject:v5 forKey:@"model"];

  uint64_t v6 = [(TPSyncingPolicy *)self keyViewMapping];
  [v13 encodeObject:v6 forKey:@"keyViewMapping"];

  v7 = [(TPSyncingPolicy *)self viewList];
  [v13 encodeObject:v7 forKey:@"viewList"];

  uint64_t v8 = [(TPSyncingPolicy *)self priorityViews];
  [v13 encodeObject:v8 forKey:@"priorityViews"];

  v9 = [(TPSyncingPolicy *)self userControllableViews];
  [v13 encodeObject:v9 forKey:@"userControllableViews"];

  uint64_t v10 = [(TPSyncingPolicy *)self syncUserControllableViews];
  if (v10 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_2640ECA20[v10];
  }
  [v13 encodeObject:v11 forKey:@"ucvShouldSync"];

  v12 = [(TPSyncingPolicy *)self viewsToPiggybackTLKs];
  [v13 encodeObject:v12 forKey:@"viewsToPiggybackTLKs"];

  objc_msgSend(v13, "encodeBool:forKey:", -[TPSyncingPolicy isInheritedAccount](self, "isInheritedAccount"), @"isInheritedAccount");
}

- (BOOL)isSyncingEnabledForView:(id)a3
{
  id v4 = a3;
  v5 = [(TPSyncingPolicy *)self viewList];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    if ([(TPSyncingPolicy *)self syncUserControllableViewsAsBoolean])
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      uint64_t v8 = [(TPSyncingPolicy *)self userControllableViews];
      int v7 = [v8 containsObject:v4] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)syncUserControllableViewsAsBoolean
{
  return ([(TPSyncingPolicy *)self syncUserControllableViews] & 0xFFFFFFFE) == 2;
}

- (id)mapDictionaryToView:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TPSyncingPolicy *)self keyViewMapping];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)[v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v7 = 138543618;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "view", v17);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = [v10 matchingRule];

          if (v12)
          {
            id v13 = [v10 matchingRule];
            id v18 = 0;
            char v14 = [v13 matches:v4 error:&v18];
            id v11 = v18;

            if (v11)
            {
              v15 = TPClassificationLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                id v24 = v10;
                __int16 v25 = 2114;
                id v26 = v11;
                _os_log_impl(&dword_20CB20000, v15, OS_LOG_TYPE_DEFAULT, "Error matching with rule %{public}@: %{public}@", buf, 0x16u);
              }
            }
            if (v14)
            {
              int v6 = [v10 view];

              goto LABEL_17;
            }
          }
          else
          {
            id v11 = 0;
          }
        }
      }
      int v6 = (void *)[v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }
LABEL_17:

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(TPSyncingPolicy *)self version];
  id v5 = [(TPSyncingPolicy *)self model];
  uint64_t v6 = [(TPSyncingPolicy *)self syncUserControllableViews];
  if (v6 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    long long v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v7 = off_2640ECA20[v6];
  }
  uint64_t v8 = [v3 stringWithFormat:@"<TPSyncingPolicy: %@, %@, userViews: %@>", v4, v5, v7];

  return v8;
}

- (TPSyncingPolicy)initWithModel:(id)a3 version:(id)a4 viewList:(id)a5 priorityViews:(id)a6 userControllableViews:(id)a7 syncUserControllableViews:(int)a8 viewsToPiggybackTLKs:(id)a9 keyViewMapping:(id)a10 isInheritedAccount:(BOOL)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TPSyncingPolicy;
  long long v19 = [(TPSyncingPolicy *)&v28 init];
  long long v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_model, a3);
    objc_storeStrong((id *)&v20->_version, a4);
    objc_storeStrong((id *)&v20->_viewList, a5);
    objc_storeStrong((id *)&v20->_priorityViews, a6);
    objc_storeStrong((id *)&v20->_userControllableViews, a7);
    v20->_syncUserControllableViews = a8;
    objc_storeStrong((id *)&v20->_viewsToPiggybackTLKs, a9);
    objc_storeStrong((id *)&v20->_keyViewMapping, a10);
    v20->_isInheritedAccount = a11;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end