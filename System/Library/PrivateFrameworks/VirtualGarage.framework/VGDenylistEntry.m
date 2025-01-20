@interface VGDenylistEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupersetOfEntry:(id)a3;
- (VGDenylistEntry)initWithModelId:(id)a3 firmwareIds:(id)a4 years:(id)a5 models:(id)a6;
- (id)description;
@end

@implementation VGDenylistEntry

- (VGDenylistEntry)initWithModelId:(id)a3 firmwareIds:(id)a4 years:(id)a5 models:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VGDenylistEntry;
  v15 = [(VGDenylistEntry *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelId, a3);
    if (v12)
    {
      uint64_t v17 = [v12 copy];
      firmwareIds = v16->_firmwareIds;
      v16->_firmwareIds = (NSArray *)v17;
    }
    else
    {
      firmwareIds = v16->_firmwareIds;
      v16->_firmwareIds = (NSArray *)MEMORY[0x263EFFA68];
    }

    if (v13)
    {
      uint64_t v19 = [v13 copy];
      years = v16->_years;
      v16->_years = (NSArray *)v19;
    }
    else
    {
      years = v16->_years;
      v16->_years = (NSArray *)MEMORY[0x263EFFA68];
    }

    if (v14)
    {
      uint64_t v21 = [v14 copy];
      models = v16->_models;
      v16->_models = (NSArray *)v21;
    }
    else
    {
      models = v16->_models;
      v16->_models = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VGDenylistEntry *)a3;
  if (v4 == self)
  {
    char v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      modelId = v5->_modelId;
      unint64_t v7 = self->_modelId;
      unint64_t v8 = modelId;
      if (v7 | v8)
      {
        v9 = (void *)v8;
        int v10 = [(id)v7 isEqual:v8];

        if (!v10) {
          goto LABEL_13;
        }
      }
      firmwareIds = v5->_firmwareIds;
      unint64_t v12 = self->_firmwareIds;
      unint64_t v13 = firmwareIds;
      if (v12 | v13)
      {
        id v14 = (void *)v13;
        int v15 = [(id)v12 isEqual:v13];

        if (!v15) {
          goto LABEL_13;
        }
      }
      years = v5->_years;
      unint64_t v17 = self->_years;
      unint64_t v18 = years;
      if (v17 | v18
        && (uint64_t v19 = (void *)v18,
            int v20 = [(id)v17 isEqual:v18],
            v19,
            (id)v17,
            !v20))
      {
LABEL_13:
        char v25 = 0;
      }
      else
      {
        models = self->_models;
        v22 = v5->_models;
        id v23 = models;
        objc_super v24 = v23;
        if ((unint64_t)v23 | (unint64_t)v22) {
          char v25 = [v23 isEqual:v22];
        }
        else {
          char v25 = 1;
        }
      }
    }
    else
    {
      char v25 = 0;
    }
  }

  return v25;
}

- (BOOL)isSupersetOfEntry:(id)a3
{
  v4 = (void **)a3;
  modelId = self->_modelId;
  if ((!modelId || [(NSNumber *)modelId isEqualToNumber:v4[1]])
    && __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[2], self->_firmwareIds)
    && __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[3], self->_years))
  {
    char v6 = __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[4], self->_models);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count] || objc_msgSend(v4, "count"))
  {
    v5 = [MEMORY[0x263EFFA08] setWithArray:v3];
    char v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
    uint64_t v7 = [v5 isSubsetOfSet:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)description
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  v70 = NSString;
  uint64_t v3 = objc_opt_class();
  modelId = self->_modelId;
  uint64_t v69 = v3;
  id v4 = self->_firmwareIds;
  v5 = v4;
  v71 = self;
  if (v4)
  {
    if ([(NSArray *)v4 count])
    {
      char v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v5, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v65 = v5;
      uint64_t v7 = v5;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v73 != v10) {
              objc_enumerationMutation(v7);
            }
            unint64_t v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if (v12)
            {
              unint64_t v13 = NSString;
              id v14 = v12;
              int v15 = [v13 stringWithFormat:@"%@<%p>", objc_opt_class(), v14];
            }
            else
            {
              int v15 = @"<nil>";
            }
            [v6 addObject:v15];
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v9);
      }

      v16 = [(NSArray *)v7 componentsJoinedByString:@", "];
      unint64_t v17 = NSString;
      unint64_t v18 = v7;
      uint64_t v19 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];

      int v20 = [v17 stringWithFormat:@"%@ [%@]", v19, v16];

      self = v71;
      v5 = v65;
    }
    else
    {
      uint64_t v21 = NSString;
      v22 = v5;
      id v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

      int v20 = [v21 stringWithFormat:@"%@ (empty)", v23];
    }
  }
  else
  {
    int v20 = @"<nil>";
  }

  objc_super v24 = self->_years;
  char v25 = v24;
  if (v24)
  {
    if ([(NSArray *)v24 count])
    {
      v66 = v20;
      v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v25, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v64 = v25;
      v27 = v25;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v73 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            if (v32)
            {
              v33 = NSString;
              id v34 = v32;
              v35 = [v33 stringWithFormat:@"%@<%p>", objc_opt_class(), v34];
            }
            else
            {
              v35 = @"<nil>";
            }
            [v26 addObject:v35];
          }
          uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v29);
      }

      v36 = [(NSArray *)v27 componentsJoinedByString:@", "];
      v37 = NSString;
      v38 = v27;
      v39 = [v37 stringWithFormat:@"%@<%p>", objc_opt_class(), v38];

      v40 = [v37 stringWithFormat:@"%@ [%@]", v39, v36];

      self = v71;
      char v25 = v64;
      int v20 = v66;
    }
    else
    {
      v41 = NSString;
      v42 = v25;
      v26 = [v41 stringWithFormat:@"%@<%p>", objc_opt_class(), v42];

      v40 = [v41 stringWithFormat:@"%@ (empty)", v26];
    }
  }
  else
  {
    v40 = @"<nil>";
  }

  v43 = self->_models;
  v44 = v43;
  if (v43)
  {
    if ([(NSArray *)v43 count])
    {
      v67 = v20;
      v45 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v44, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v46 = v44;
      uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v73;
        do
        {
          for (uint64_t k = 0; k != v48; ++k)
          {
            if (*(void *)v73 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v72 + 1) + 8 * k);
            if (v51)
            {
              v52 = NSString;
              id v53 = v51;
              v54 = [v52 stringWithFormat:@"%@<%p>", objc_opt_class(), v53];
            }
            else
            {
              v54 = @"<nil>";
            }
            [v45 addObject:v54];
          }
          uint64_t v48 = [(NSArray *)v46 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v48);
      }

      v55 = [(NSArray *)v46 componentsJoinedByString:@", "];
      v56 = NSString;
      v57 = v46;
      v58 = [v56 stringWithFormat:@"%@<%p>", objc_opt_class(), v57];

      v59 = [v56 stringWithFormat:@"%@ [%@]", v58, v55];

      self = v71;
      int v20 = v67;
    }
    else
    {
      v60 = NSString;
      v61 = v44;
      v45 = [v60 stringWithFormat:@"%@<%p>", objc_opt_class(), v61];

      v59 = [v60 stringWithFormat:@"%@ (empty)", v45];
    }
  }
  else
  {
    v59 = @"<nil>";
  }

  v62 = [v70 stringWithFormat:@"<%@:%p, modelId: %@, firmwareIds: %@, years: %@, models: %@>", v69, self, modelId, v20, v40, v59];

  return v62;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_firmwareIds, 0);

  objc_storeStrong((id *)&self->_modelId, 0);
}

@end