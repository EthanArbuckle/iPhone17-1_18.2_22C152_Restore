@interface UPDialogActConverter
- (UPDialogActConverter)initWithUsoSerializer:(id)a3;
- (UPUsoSerializer)usoSerializer;
- (id)_convertFromGaveOptionsDialogAct:(id)a3 error:(id *)a4;
- (id)_convertFromOfferedDialogAct:(id)a3 error:(id *)a4;
- (id)_convertFromPromptedDialogAct:(id)a3 error:(id *)a4;
- (id)_parseUserDialogAct:(id)a3 error:(id *)a4;
- (id)_parseUserDialogActGraph:(id)a3 error:(id *)a4;
- (id)convertFromDialogAct:(id)a3 error:(id *)a4;
@end

@implementation UPDialogActConverter

- (void).cxx_destruct
{
}

- (UPUsoSerializer)usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 8, 1);
}

- (id)_parseUserDialogActGraph:(id)a3 error:(id *)a4
{
  v5 = [(UPUsoSerializer *)self->_usoSerializer deserializeFromSerializedGraph:a3];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 label];

    if (v7)
    {
      v8 = [v6 directLeafNodes];
      uint64_t v9 = [v8 count];

      v10 = [v6 intermediateNodes];
      uint64_t v11 = [v10 count];

      if (!v9 && v11 == 1)
      {
        v12 = [v6 intermediateNodes];
        v13 = [v12 objectAtIndex:0];

        uint64_t v14 = [v13 label];
        if (!v14
          || (v15 = (void *)v14,
              [v13 leafNodes],
              v16 = objc_claimAutoreleasedReturnValue(),
              uint64_t v17 = [v16 count],
              v16,
              v15,
              v17 != 1))
        {
          if (a4)
          {
            *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:5 userInfo:0];
          }

          v22 = 0;
          v23 = 0;
          goto LABEL_20;
        }
        v18 = [v13 leafNodes];
        v19 = [v18 objectAtIndex:0];

        v20 = [v13 label];
        v21 = [v19 label];
        v22 = +[UPUtilities higherLevelEntityLabelFromParentLabel:v20 childLabel:v21];

        v23 = [v19 text];

LABEL_11:
        if (v22 && v23)
        {
          v25 = [v6 label];
          v26 = [[UPEntityWithValue alloc] initWithType:@"string" entityName:v22 entityValue:v23];
          v27 = [[UPIntentWithSingleEntity alloc] initWithIntent:v25 singleEntity:v26];

LABEL_23:
          goto LABEL_24;
        }
        if (a4)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:5 userInfo:0];
          v27 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_20:
        v27 = 0;
        goto LABEL_23;
      }
      if (v9 == 1 && !v11)
      {
        v24 = [v6 directLeafNodes];
        v13 = [v24 objectAtIndex:0];

        v22 = [v13 label];
        v23 = [v13 text];
        goto LABEL_11;
      }
    }
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:5 userInfo:0];
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_24:

  return v27;
}

- (id)_parseUserDialogAct:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 task];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v7 = [v6 reference];
  }
  v8 = (void *)v7;
  if (!v7)
  {
LABEL_8:
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:4 userInfo:0];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
    goto LABEL_14;
  }
  id v14 = 0;
  uint64_t v9 = [(UPDialogActConverter *)self _parseUserDialogActGraph:v7 error:&v14];
  id v10 = v14;
  uint64_t v11 = v10;
  if (v9)
  {
    id v12 = v9;
  }
  else if (a4)
  {
    *a4 = v10;
  }

LABEL_14:
  return v9;
}

- (id)_convertFromPromptedDialogAct:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 reference];
  id v21 = 0;
  v8 = [(UPDialogActConverter *)self _parseUserDialogActGraph:v7 error:&v21];
  id v9 = v21;

  if (v8)
  {
    id v10 = [v8 entity];
    uint64_t v11 = [v10 entityValue];

    if ([v11 isEqualToString:&stru_1F23628D0])
    {
      v20 = [UPDialogActPrompt alloc];
      v19 = [v8 intent];
      id v12 = [v8 entity];
      v13 = [v12 entityType];
      id v14 = [v8 entity];
      v15 = [v14 entityName];
      v16 = [v6 reference];
      uint64_t v17 = [(UPDialogActPrompt *)v20 initWithIntent:v19 entityType:v13 entityName:v15 reference:v16];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:6 userInfo:0];
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v17;
}

- (id)_convertFromGaveOptionsDialogAct:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v8 = [v6 choices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v42 = 0;
        id v14 = [(UPDialogActConverter *)self _parseUserDialogAct:v13 error:&v42];
        id v15 = v42;
        v16 = v15;
        if (!v14)
        {
          if (a4) {
            *a4 = v15;
          }

          goto LABEL_22;
        }
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if ([v7 count])
  {
    v34 = a4;
    uint64_t v17 = [v7 objectAtIndex:0];
    uint64_t v37 = [v17 intent];
    v18 = [v17 entity];
    uint64_t v36 = [v18 entityType];

    v19 = [v17 entity];
    uint64_t v35 = [v19 entityName];

    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v21 = v7;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v39;
      while (2)
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          if (([v26 isEqualToIntentWithSingleEntity:v17] & 1) == 0)
          {
            if (v34)
            {
              id *v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:8 userInfo:0];
            }

            v32 = 0;
            v30 = (void *)v36;
            v29 = (void *)v37;
            v31 = (void *)v35;
            goto LABEL_26;
          }
          v27 = [v26 entity];
          v28 = [v27 entityValue];
          [v20 addObject:v28];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    v30 = (void *)v36;
    v29 = (void *)v37;
    v31 = (void *)v35;
    v32 = [[UPDialogActOptions alloc] initWithIntent:v37 entityType:v36 entityName:v35 entityValues:v20];
LABEL_26:
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:7 userInfo:0];
    v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v32 = 0;
  }

  return v32;
}

- (id)_convertFromOfferedDialogAct:(id)a3 error:(id *)a4
{
  id v6 = [a3 offeredAct];
  id v14 = 0;
  uint64_t v7 = [(UPDialogActConverter *)self _parseUserDialogAct:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    uint64_t v9 = [UPDialogActOffer alloc];
    uint64_t v10 = [v7 intent];
    uint64_t v11 = [v7 entity];
    id v12 = [(UPDialogActOffer *)v9 initWithIntent:v10 entityWithValue:v11];
  }
  else
  {
    id v12 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v12;
}

- (id)convertFromDialogAct:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    uint64_t v7 = (id *)&v14;
    uint64_t v8 = [(UPDialogActConverter *)self _convertFromOfferedDialogAct:v6 error:&v14];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = 0;
    uint64_t v7 = (id *)&v13;
    uint64_t v8 = [(UPDialogActConverter *)self _convertFromGaveOptionsDialogAct:v6 error:&v13];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = 0;
    uint64_t v7 = (id *)&v12;
    uint64_t v8 = [(UPDialogActConverter *)self _convertFromPromptedDialogAct:v6 error:&v12];
LABEL_7:
    uint64_t v9 = (void *)v8;
    id v10 = *v7;
    if (v9) {
      goto LABEL_12;
    }
    if (a4) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
  id v10 = 0;
  if (a4)
  {
LABEL_9:
    id v10 = v10;
    uint64_t v9 = 0;
    *a4 = v10;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (UPDialogActConverter)initWithUsoSerializer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UPDialogActConverter;
  id v6 = [(UPDialogActConverter *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_usoSerializer, a3);
  }

  return v7;
}

@end