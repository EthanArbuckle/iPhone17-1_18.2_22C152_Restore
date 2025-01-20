@interface MTTreatmentAction
+ (id)treatmentActionWithField:(id)a3 configData:(id)a4;
- (BOOL)denylisted;
- (MTTreatmentAction)initWithField:(id)a3 configDictionary:(id)a4;
- (NSArray)allowlistedFields;
- (NSArray)denylistedFields;
- (NSArray)dstKeyPath;
- (NSArray)srcKeyPath;
- (NSDictionary)fieldsMap;
- (NSString)field;
- (NSString)sourceField;
- (id)overrideFieldValue;
- (id)performAction:(id)a3 atKeyIndex:(int64_t)a4 context:(id)a5;
- (id)performAction:(id)a3 context:(id)a4;
- (void)computeKeyPaths;
- (void)performActionWithContext:(id)a3;
- (void)setAllowlistedFields:(id)a3;
- (void)setDenylisted:(BOOL)a3;
- (void)setDenylistedFields:(id)a3;
- (void)setDstKeyPath:(id)a3;
- (void)setField:(id)a3;
- (void)setFieldsMap:(id)a3;
- (void)setOverrideFieldValue:(id)a3;
- (void)setSourceField:(id)a3;
- (void)setSrcKeyPath:(id)a3;
@end

@implementation MTTreatmentAction

+ (id)treatmentActionWithField:(id)a3 configData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [v7 objectForKeyedSubscript:@"treatmentType"];
    v9 = (objc_class *)objc_opt_class();
    if (([v8 isEqualToString:@"numberDeres"] & 1) != 0
      || ([v8 isEqualToString:@"urlDeres"] & 1) != 0
      || ([v8 isEqualToString:@"hash"] & 1) != 0
      || [v8 isEqualToString:@"versionDeres"])
    {
      v9 = (objc_class *)objc_opt_class();
    }
    v10 = (void *)[[v9 alloc] initWithField:v5 configDictionary:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MTTreatmentAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MTTreatmentAction;
  v8 = [(MTTreatmentAction *)&v44 init];
  v9 = v8;
  if (v8)
  {
    [(MTTreatmentAction *)v8 setField:v6];
    v10 = [v7 objectForKeyedSubscript:@"sourceField"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MTTreatmentAction *)v9 setSourceField:v10];
    }
    v11 = [v7 objectForKeyedSubscript:@"overrideFieldValue"];
    [(MTTreatmentAction *)v9 setOverrideFieldValue:v11];

    v12 = [v7 objectForKeyedSubscript:@"denylisted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTTreatmentAction setDenylisted:](v9, "setDenylisted:", [v12 BOOLValue]);
    }
    v13 = [v7 objectForKeyedSubscript:@"allowlistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MTTreatmentAction *)v9 setAllowlistedFields:v13];
    }
    uint64_t v14 = [v7 objectForKeyedSubscript:@"denylistedFields"];
    objc_opt_class();
    v43 = (void *)v14;
    if (objc_opt_isKindOfClass()) {
      [(MTTreatmentAction *)v9 setDenylistedFields:v14];
    }
    v15 = [v7 objectForKeyedSubscript:@"blacklisted"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(MTTreatmentAction *)v9 denylisted]
      && [v15 BOOLValue])
    {
      -[MTTreatmentAction setDenylisted:](v9, "setDenylisted:", [v15 BOOLValue]);
    }
    v42 = v15;
    v16 = [v7 objectForKeyedSubscript:@"whitelistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [(MTTreatmentAction *)v9 allowlistedFields];
      if (v17)
      {
        v18 = (void *)MEMORY[0x263EFF9D8];
        [(MTTreatmentAction *)v9 allowlistedFields];
        v20 = v19 = v16;
        [v20 arrayByAddingObjectsFromArray:v19];
        v38 = v12;
        v21 = id v40 = v6;
        v22 = [v18 orderedSetWithArray:v21];
        [v22 array];
        v23 = v13;
        v25 = v24 = v10;
        [(MTTreatmentAction *)v9 setAllowlistedFields:v25];

        v10 = v24;
        v13 = v23;

        v12 = v38;
        id v6 = v40;

        v16 = v19;
      }
      else
      {
        [(MTTreatmentAction *)v9 setAllowlistedFields:v16];
      }
    }
    v26 = [v7 objectForKeyedSubscript:@"blacklistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [(MTTreatmentAction *)v9 denylistedFields];
      if (v27)
      {
        v37 = v16;
        v28 = (void *)MEMORY[0x263EFF9D8];
        [(MTTreatmentAction *)v9 denylistedFields];
        v29 = id v41 = v6;
        [v29 arrayByAddingObjectsFromArray:v26];
        v30 = v39 = v10;
        v31 = [v28 orderedSetWithArray:v30];
        [v31 array];
        v32 = v13;
        v34 = v33 = v12;
        [(MTTreatmentAction *)v9 setDenylistedFields:v34];

        v12 = v33;
        v13 = v32;

        v16 = v37;
        v10 = v39;

        id v6 = v41;
      }
      else
      {
        [(MTTreatmentAction *)v9 setDenylistedFields:v26];
      }
    }
    v35 = [v7 objectForKeyedSubscript:@"fieldsMap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MTTreatmentAction *)v9 setFieldsMap:v35];
    }
    [(MTTreatmentAction *)v9 computeKeyPaths];
  }
  return v9;
}

- (void)computeKeyPaths
{
  v3 = [(MTTreatmentAction *)self field];
  v4 = [v3 componentsSeparatedByString:@"."];
  dstKeyPath = self->_dstKeyPath;
  self->_dstKeyPath = v4;

  id v6 = [(MTTreatmentAction *)self sourceField];
  uint64_t v7 = [v6 length];

  v8 = self->_dstKeyPath;
  if (v7)
  {
    v12 = (void *)[(NSArray *)v8 mutableCopy];
    [v12 removeLastObject];
    v9 = [(MTTreatmentAction *)self sourceField];
    [v12 addObject:v9];

    v10 = (NSArray *)[v12 copy];
    srcKeyPath = self->_srcKeyPath;
    self->_srcKeyPath = v10;
  }
  else
  {
    self->_srcKeyPath = v8;
  }

  MEMORY[0x270F9A758]();
}

- (void)performActionWithContext:(id)a3
{
  id v4 = a3;
  id v6 = [v4 metrics];
  id v5 = [(MTTreatmentAction *)self performAction:v6 atKeyIndex:0 context:v4];
  [v4 setMetrics:v5];
}

- (id)performAction:(id)a3 context:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(MTTreatmentAction *)self denylisted])
  {
    id v6 = 0;
    goto LABEL_45;
  }
  uint64_t v7 = [(MTTreatmentAction *)self overrideFieldValue];

  if (v7)
  {
    uint64_t v8 = [(MTTreatmentAction *)self overrideFieldValue];

    id v5 = (id)v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(MTTreatmentAction *)self fieldsMap];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v47 = (void *)[v5 mutableCopy];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = [(MTTreatmentAction *)self fieldsMap];
      uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (!v11) {
        goto LABEL_30;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v57;
      unint64_t v14 = 0x263EFF000uLL;
      uint64_t v44 = *(void *)v57;
      while (1)
      {
        uint64_t v15 = 0;
        uint64_t v45 = v12;
        do
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v56 + 1) + 8 * v15);
          v17 = [(MTTreatmentAction *)self fieldsMap];
          v18 = [v17 objectForKeyedSubscript:v16];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v62 = v18;
            id v19 = [*(id *)(v14 + 2240) arrayWithObjects:&v62 count:1];
            if (!v19) {
              goto LABEL_28;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_28;
            }
            id v19 = v18;
            if (!v19) {
              goto LABEL_28;
            }
          }
          v20 = self;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = objc_msgSend(v5, "mt_nullableValueForKeyPathExt:", *(void *)(*((void *)&v52 + 1) + 8 * i));
                if (v26)
                {
                  v27 = (void *)v26;
                  [v47 setObject:v26 forKeyedSubscript:v16];

                  goto LABEL_27;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_27:

          self = v20;
          uint64_t v13 = v44;
          uint64_t v12 = v45;
          unint64_t v14 = 0x263EFF000;
LABEL_28:

          ++v15;
        }
        while (v15 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (!v12)
        {
LABEL_30:

          goto LABEL_32;
        }
      }
    }
    v47 = v5;
LABEL_32:
    v28 = [(MTTreatmentAction *)self allowlistedFields];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = (void *)MEMORY[0x263EFF9A0];
      v31 = [(MTTreatmentAction *)self allowlistedFields];
      objc_msgSend(v30, "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v32 = [(MTTreatmentAction *)self allowlistedFields];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v49 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v48 + 1) + 8 * j);
            v38 = [v47 objectForKeyedSubscript:v37];
            [v5 setObject:v38 forKeyedSubscript:v37];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v60 count:16];
        }
        while (v34);
      }
    }
    else
    {
      id v5 = v47;
    }
    v39 = [(MTTreatmentAction *)self denylistedFields];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      id v41 = (void *)[v5 mutableCopy];
      v42 = [(MTTreatmentAction *)self denylistedFields];
      [v41 removeObjectsForKeys:v42];

      id v5 = v41;
    }
  }
  id v5 = v5;
  id v6 = v5;
LABEL_45:

  return v6;
}

- (id)performAction:(id)a3 atKeyIndex:(int64_t)a4 context:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(MTTreatmentAction *)self srcKeyPath];
  uint64_t v11 = [v10 count];

  if (v11 == a4)
  {
    uint64_t v12 = [(MTTreatmentAction *)self performAction:v8 context:v9];
LABEL_23:
    self = v12;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  id v13 = v8;
  unint64_t v14 = [(MTTreatmentAction *)self srcKeyPath];
  uint64_t v15 = [v14 objectAtIndexedSubscript:a4];

  uint64_t v16 = [(MTTreatmentAction *)self dstKeyPath];
  v17 = [v16 objectAtIndexedSubscript:a4];

  if ([v15 hasSuffix:@"[]"])
  {
    uint64_t v18 = objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);

    id v19 = [v13 objectForKeyedSubscript:v18];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v34 = v18;
      uint64_t v35 = v17;
      v36 = v13;
      v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v33 = v19;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        int64_t v25 = a4 + 1;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = -[MTTreatmentAction performAction:atKeyIndex:context:](self, "performAction:atKeyIndex:context:", *(void *)(*((void *)&v37 + 1) + 8 * i), v25, v9, v33);
            if (v27) {
              [v20 addObject:v27];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v23);
      }

      v17 = v35;
      if ([v35 hasSuffix:@"[]"])
      {
        uint64_t v28 = objc_msgSend(v35, "substringToIndex:", objc_msgSend(v35, "length") - 2);

        v17 = (void *)v28;
      }
      id v13 = v36;
      id v19 = v33;
      uint64_t v18 = v34;
      objc_msgSend(v36, "mt_dictionarybyReplacingKey:value:", v17, v20, v33);
      self = (MTTreatmentAction *)objc_claimAutoreleasedReturnValue();

      int v29 = 1;
    }
    else
    {
      int v29 = 0;
    }

    uint64_t v15 = (void *)v18;
  }
  else
  {
    v30 = [v13 objectForKeyedSubscript:v15];
    v31 = [(MTTreatmentAction *)self performAction:v30 atKeyIndex:a4 + 1 context:v9];

    objc_msgSend(v13, "mt_dictionarybyReplacingKey:value:", v17, v31);
    self = (MTTreatmentAction *)objc_claimAutoreleasedReturnValue();

    int v29 = 1;
  }

  if (!v29)
  {
LABEL_22:
    uint64_t v12 = (MTTreatmentAction *)v8;
    goto LABEL_23;
  }
LABEL_24:

  return self;
}

- (NSString)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (NSString)sourceField
{
  return self->_sourceField;
}

- (void)setSourceField:(id)a3
{
}

- (id)overrideFieldValue
{
  return self->_overrideFieldValue;
}

- (void)setOverrideFieldValue:(id)a3
{
}

- (BOOL)denylisted
{
  return self->_denylisted;
}

- (void)setDenylisted:(BOOL)a3
{
  self->_denylisted = a3;
}

- (NSArray)denylistedFields
{
  return self->_denylistedFields;
}

- (void)setDenylistedFields:(id)a3
{
}

- (NSArray)allowlistedFields
{
  return self->_allowlistedFields;
}

- (void)setAllowlistedFields:(id)a3
{
}

- (NSDictionary)fieldsMap
{
  return self->_fieldsMap;
}

- (void)setFieldsMap:(id)a3
{
}

- (NSArray)dstKeyPath
{
  return self->_dstKeyPath;
}

- (void)setDstKeyPath:(id)a3
{
}

- (NSArray)srcKeyPath
{
  return self->_srcKeyPath;
}

- (void)setSrcKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcKeyPath, 0);
  objc_storeStrong((id *)&self->_dstKeyPath, 0);
  objc_storeStrong((id *)&self->_fieldsMap, 0);
  objc_storeStrong((id *)&self->_allowlistedFields, 0);
  objc_storeStrong((id *)&self->_denylistedFields, 0);
  objc_storeStrong(&self->_overrideFieldValue, 0);
  objc_storeStrong((id *)&self->_sourceField, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end