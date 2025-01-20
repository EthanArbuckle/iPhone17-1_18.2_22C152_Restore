@interface TPPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithModelToCategory:(id)a3 categoriesByView:(id)a4 introducersByCategory:(id)a5 keyViewMapping:(id)a6 unknownRedactions:(BOOL)a7 userControllableViewList:(id)a8 piggybackViews:(id)a9 priorityViews:(id)a10 inheritedExcludedViews:(id)a11 version:(id)a12;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolicy:(id)a3;
- (BOOL)peerInCategory:(id)a3 canAccessView:(id)a4;
- (BOOL)trustedPeerInCategory:(id)a3 canIntroduceCategory:(id)a4;
- (BOOL)unknownRedactions;
- (NSArray)keyViewMapping;
- (NSArray)modelToCategory;
- (NSDictionary)categoriesByView;
- (NSDictionary)introducersByCategory;
- (NSSet)inheritedExcludedViews;
- (NSSet)piggybackViews;
- (NSSet)priorityViews;
- (NSSet)userControllableViewList;
- (TPPolicy)initWithCoder:(id)a3;
- (TPPolicyVersion)version;
- (id)categoryForModel:(id)a3;
- (id)description;
- (id)syncingPolicyForModel:(id)a3 syncUserControllableViews:(int)a4 isInheritedAccount:(BOOL)a5 error:(id *)a6;
- (id)viewsForModel:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoriesByView:(id)a3;
- (void)setInheritedExcludedViews:(id)a3;
- (void)setIntroducersByCategory:(id)a3;
- (void)setKeyViewMapping:(id)a3;
- (void)setModelToCategory:(id)a3;
- (void)setPiggybackViews:(id)a3;
- (void)setPriorityViews:(id)a3;
- (void)setUnknownRedactions:(BOOL)a3;
- (void)setUserControllableViewList:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TPPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritedExcludedViews, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_piggybackViews, 0);
  objc_storeStrong((id *)&self->_userControllableViewList, 0);
  objc_storeStrong((id *)&self->_keyViewMapping, 0);
  objc_storeStrong((id *)&self->_introducersByCategory, 0);
  objc_storeStrong((id *)&self->_categoriesByView, 0);
  objc_storeStrong((id *)&self->_modelToCategory, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setUnknownRedactions:(BOOL)a3
{
  self->_unknownRedactions = a3;
}

- (BOOL)unknownRedactions
{
  return self->_unknownRedactions;
}

- (void)setInheritedExcludedViews:(id)a3
{
}

- (NSSet)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setPriorityViews:(id)a3
{
}

- (NSSet)priorityViews
{
  return self->_priorityViews;
}

- (void)setPiggybackViews:(id)a3
{
}

- (NSSet)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setUserControllableViewList:(id)a3
{
}

- (NSSet)userControllableViewList
{
  return self->_userControllableViewList;
}

- (void)setKeyViewMapping:(id)a3
{
}

- (NSArray)keyViewMapping
{
  return self->_keyViewMapping;
}

- (void)setIntroducersByCategory:(id)a3
{
}

- (NSDictionary)introducersByCategory
{
  return self->_introducersByCategory;
}

- (void)setCategoriesByView:(id)a3
{
}

- (NSDictionary)categoriesByView
{
  return self->_categoriesByView;
}

- (void)setModelToCategory:(id)a3
{
}

- (NSArray)modelToCategory
{
  return self->_modelToCategory;
}

- (void)setVersion:(id)a3
{
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (BOOL)isEqualToPolicy:(id)a3
{
  id v4 = a3;
  v5 = [(TPPolicy *)self version];
  uint64_t v6 = [v5 versionNumber];
  v7 = [v4 version];
  if (v6 == [v7 versionNumber])
  {
    v8 = [(TPPolicy *)self modelToCategory];
    v9 = [v4 modelToCategory];
    if ([v8 isEqual:v9])
    {
      v10 = [(TPPolicy *)self categoriesByView];
      v11 = [v4 categoriesByView];
      if ([v10 isEqualToDictionary:v11])
      {
        v12 = [(TPPolicy *)self introducersByCategory];
        v13 = [v4 introducersByCategory];
        if ([v12 isEqualToDictionary:v13])
        {
          v27 = v13;
          v28 = v12;
          uint64_t v14 = [(TPPolicy *)self keyViewMapping];
          v29 = [v4 keyViewMapping];
          v30 = (void *)v14;
          if (+[TPPolicyDocument isEqualKeyViewMapping:other:](TPPolicyDocument, "isEqualKeyViewMapping:other:", v14))
          {
            v15 = [(TPPolicy *)self userControllableViewList];
            v25 = [v4 userControllableViewList];
            v26 = v15;
            if ([v15 isEqualToSet:v25])
            {
              v24 = [(TPPolicy *)self piggybackViews];
              v23 = [v4 piggybackViews];
              if (objc_msgSend(v24, "isEqualToSet:"))
              {
                v16 = [(TPPolicy *)self priorityViews];
                v21 = [v4 priorityViews];
                v22 = v16;
                v13 = v27;
                if (objc_msgSend(v16, "isEqualToSet:"))
                {
                  v20 = [(TPPolicy *)self inheritedExcludedViews];
                  v17 = [v4 inheritedExcludedViews];
                  char v18 = [v20 isEqualToSet:v17];
                }
                else
                {
                  char v18 = 0;
                }
                v12 = v28;
              }
              else
              {
                char v18 = 0;
                v13 = v27;
                v12 = v28;
              }
            }
            else
            {
              char v18 = 0;
              v13 = v27;
              v12 = v28;
            }
          }
          else
          {
            char v18 = 0;
            v13 = v27;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPPolicy *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(TPPolicy *)self isEqualToPolicy:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (TPPolicy)initWithCoder:(id)a3
{
  v53[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)TPPolicy;
  v5 = [(TPPolicy *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v53[2] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:3];
    v10 = [v8 setWithArray:v9];

    v11 = (void *)MEMORY[0x263EFFA08];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"modelToCategory"];
    modelToCategory = v5->_modelToCategory;
    v5->_modelToCategory = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v10 forKey:@"categoriesByView"];
    categoriesByView = v5->_categoriesByView;
    v5->_categoriesByView = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v10 forKey:@"introducersByCategory"];
    introducersByCategory = v5->_introducersByCategory;
    v5->_introducersByCategory = (NSDictionary *)v18;

    v5->_unknownRedactions = [v4 decodeBoolForKey:@"unknownRedactions"];
    v20 = (void *)MEMORY[0x263EFFA08];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
    v22 = [v20 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"ucvList"];
    userControllableViewList = v5->_userControllableViewList;
    v5->_userControllableViewList = (NSSet *)v23;

    v25 = (void *)MEMORY[0x263EFFA08];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    v27 = [v25 setWithArray:v26];
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"piggybackingList"];
    piggybackViews = v5->_piggybackViews;
    v5->_piggybackViews = (NSSet *)v28;

    v30 = (void *)MEMORY[0x263EFFA08];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
    v32 = [v30 setWithArray:v31];
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"priorityViews"];
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v33;

    v35 = (void *)MEMORY[0x263EFFA08];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
    v37 = [v35 setWithArray:v36];
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"inheritedExcludedViews"];
    inheritedExcludedViews = v5->_inheritedExcludedViews;
    v5->_inheritedExcludedViews = (NSSet *)v38;

    v40 = (void *)MEMORY[0x263EFFA08];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    v42 = [v40 setWithArray:v41];
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"keyViewMapping"];
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v43;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TPPolicy *)self modelToCategory];
  [v4 encodeObject:v5 forKey:@"modelToCategory"];

  uint64_t v6 = [(TPPolicy *)self categoriesByView];
  [v4 encodeObject:v6 forKey:@"categoriesByView"];

  v7 = [(TPPolicy *)self introducersByCategory];
  [v4 encodeObject:v7 forKey:@"introducersByCategory"];

  v8 = [(TPPolicy *)self keyViewMapping];
  [v4 encodeObject:v8 forKey:@"keyViewMapping"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TPPolicy unknownRedactions](self, "unknownRedactions"), @"unknownRedactions");
  v9 = [(TPPolicy *)self userControllableViewList];
  [v4 encodeObject:v9 forKey:@"ucvList"];

  v10 = [(TPPolicy *)self piggybackViews];
  [v4 encodeObject:v10 forKey:@"piggybackingList"];

  v11 = [(TPPolicy *)self priorityViews];
  [v4 encodeObject:v11 forKey:@"priorityViews"];

  v12 = [(TPPolicy *)self inheritedExcludedViews];
  [v4 encodeObject:v12 forKey:@"inheritedExcludedViews"];

  id v13 = [(TPPolicy *)self version];
  [v4 encodeObject:v13 forKey:@"version"];
}

- (id)viewsForModel:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(TPPolicy *)self categoryForModel:v6];
  if (v7)
  {
    id v21 = [MEMORY[0x263EFF9C0] set];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [(TPPolicy *)self categoriesByView];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v20 = v6;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [(TPPolicy *)self categoriesByView];
          v15 = [v14 objectForKeyedSubscript:v13];
          int v16 = [v15 containsObject:v7];

          if (v16) {
            [v21 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
      id v6 = v20;
    }
    goto LABEL_14;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = TPErrorDomain;
    v27 = @"model";
    v28[0] = v6;
    v8 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    [v17 errorWithDomain:v18 code:9 userInfo:v8];
    id v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  id v21 = 0;
LABEL_15:

  return v21;
}

- (id)syncingPolicyForModel:(id)a3 syncUserControllableViews:(int)a4 isInheritedAccount:(BOOL)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v11 = [(TPPolicy *)self viewsForModel:v10 error:a6];
  if (v11)
  {
    v12 = [(TPPolicy *)self userControllableViewList];
    uint64_t v13 = [(TPPolicy *)self piggybackViews];
    uint64_t v14 = [(TPPolicy *)self version];
    if ((unint64_t)[v14 versionNumber] <= 7)
    {
      uint64_t v15 = [v12 count];

      if (v15) {
        goto LABEL_6;
      }
      [MEMORY[0x263EFFA08] setWithArray:&unk_26C1C1D30];
      v12 = uint64_t v14 = v12;
    }

LABEL_6:
    int v16 = [(TPPolicy *)self version];
    if ((unint64_t)[v16 versionNumber] <= 7)
    {
      uint64_t v17 = [v13 count];

      if (v17) {
        goto LABEL_10;
      }
      [MEMORY[0x263EFFA08] setWithArray:&unk_26C1C1D48];
      v13 = int v16 = v13;
    }

LABEL_10:
    uint64_t v18 = [(TPPolicy *)self priorityViews];
    v19 = [(TPPolicy *)self version];
    if ((unint64_t)[v19 versionNumber] <= 8)
    {
      uint64_t v20 = [v18 count];

      if (v20)
      {
LABEL_14:
        id v21 = [TPSyncingPolicy alloc];
        long long v22 = [(TPPolicy *)self version];
        long long v23 = [(TPPolicy *)self keyViewMapping];
        LOBYTE(v26) = a5;
        long long v24 = [(TPSyncingPolicy *)v21 initWithModel:v10 version:v22 viewList:v11 priorityViews:v18 userControllableViews:v12 syncUserControllableViews:v8 viewsToPiggybackTLKs:v13 keyViewMapping:v23 isInheritedAccount:v26];

        goto LABEL_16;
      }
      [MEMORY[0x263EFFA08] setWithArray:&unk_26C1C1D60];
      uint64_t v18 = v19 = v18;
    }

    goto LABEL_14;
  }
  long long v24 = 0;
LABEL_16:

  return v24;
}

- (BOOL)peerInCategory:(id)a3 canAccessView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TPPolicy *)self categoriesByView];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  LOBYTE(v6) = [v9 containsObject:v7];
  return (char)v6;
}

- (BOOL)trustedPeerInCategory:(id)a3 canIntroduceCategory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TPPolicy *)self introducersByCategory];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  LOBYTE(v6) = [v9 containsObject:v7];
  return (char)v6;
}

- (id)categoryForModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (AllowiProdOverrideSet == 1)
  {
    if (!AllowiProdOverrideValue) {
      goto LABEL_7;
    }
  }
  else if (!_os_feature_enabled_impl())
  {
    goto LABEL_7;
  }
  if ([v4 hasPrefix:@"iProd"])
  {
    v5 = @"full";
    goto LABEL_18;
  }
LABEL_7:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(TPPolicy *)self modelToCategory];
  v5 = (__CFString *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (__CFString *)((char *)i + 1))
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 prefix];
        char v11 = [v4 hasPrefix:v10];

        if (v11)
        {
          v5 = [v9 category];
          goto LABEL_17;
        }
      }
      v5 = (__CFString *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_17:

LABEL_18:
  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TPPolicy *)self version];
  id v4 = [v2 stringWithFormat:@"<TPPolicy: %@>", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithModelToCategory:(id)a3 categoriesByView:(id)a4 introducersByCategory:(id)a5 keyViewMapping:(id)a6 unknownRedactions:(BOOL)a7 userControllableViewList:(id)a8 piggybackViews:(id)a9 priorityViews:(id)a10 inheritedExcludedViews:(id)a11 version:(id)a12
{
  BOOL v27 = a7;
  id v28 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  long long v25 = objc_alloc_init(TPPolicy);
  [(TPPolicy *)v25 setModelToCategory:v24];

  [(TPPolicy *)v25 setCategoriesByView:v23];
  [(TPPolicy *)v25 setIntroducersByCategory:v22];

  [(TPPolicy *)v25 setKeyViewMapping:v21];
  [(TPPolicy *)v25 setUnknownRedactions:v27];
  [(TPPolicy *)v25 setUserControllableViewList:v20];

  [(TPPolicy *)v25 setPiggybackViews:v19];
  [(TPPolicy *)v25 setPriorityViews:v18];

  [(TPPolicy *)v25 setInheritedExcludedViews:v17];
  [(TPPolicy *)v25 setVersion:v28];

  return v25;
}

@end