@interface REMTemplatesDataView
- (REMStore)store;
- (REMTemplatesDataView)initWithStore:(id)a3;
- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchTemplatesInAccount:(id)a3 error:(id *)a4;
- (id)fetchTemplatesWithObjectIDs:(id)a3 error:(id *)a4;
- (id)templatesFromTemplateStorages:(id)a3 store:(id)a4;
@end

@implementation REMTemplatesDataView

- (REMTemplatesDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplatesDataView;
  v6 = [(REMTemplatesDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchTemplatesInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [REMTemplatesDataViewInvocation_fetchTemplatesInAccount alloc];
  v8 = [v6 objectID];

  objc_super v9 = [(REMTemplatesDataViewInvocation_fetchTemplatesInAccount *)v7 initWithParentAccountObjectID:v8];
  v10 = [(REMTemplatesDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 templateStorages];
  v15 = [(REMTemplatesDataView *)self store];
  v16 = [(REMTemplatesDataView *)self templatesFromTemplateStorages:v14 store:v15];

  return v16;
}

- (id)fetchTemplatesWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    v7 = [[REMTemplatesDataViewInvocation_fetchByObjectIDs alloc] initWithObjectIDs:v6];
    v8 = [(REMTemplatesDataView *)self store];
    objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

    uint64_t v10 = objc_opt_class();
    v11 = REMDynamicCast(v10, (uint64_t)v9);
    uint64_t v12 = [v11 templateStorages];
    v13 = [(REMTemplatesDataView *)self store];
    v14 = [(REMTemplatesDataView *)self templatesFromTemplateStorages:v12 store:v13];

    if (v14)
    {
      v24 = v9;
      v25 = v7;
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v22 = objc_msgSend(v21, "objectID", v24, v25, (void)v26);
            [v15 setObject:v21 forKeyedSubscript:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v18);
      }

      objc_super v9 = v24;
      v7 = v25;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v15;
}

- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v14[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  objc_super v9 = (void *)[v7 initWithArray:v8];
  uint64_t v10 = [(REMTemplatesDataView *)self fetchTemplatesWithObjectIDs:v9 error:a4];

  if (!v10) {
    goto LABEL_7;
  }
  v11 = [v10 objectForKeyedSubscript:v6];
  if (v11) {
    goto LABEL_8;
  }
  uint64_t v12 = +[REMLogStore read];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[REMTemplatesDataView fetchTemplateWithObjectID:error:]((uint64_t)v6, v12);
  }

  if (a4)
  {
    +[REMError noSuchObjectErrorWithObjectID:v6];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (id)templatesFromTemplateStorages:(id)a3 store:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [REMTemplate alloc];
        v15 = -[REMTemplate initWithStore:storage:](v14, "initWithStore:storage:", v6, v13, (void)v17);
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchTemplateWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "REMTemplatesDataView: Requested to fetch non-existent template {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end