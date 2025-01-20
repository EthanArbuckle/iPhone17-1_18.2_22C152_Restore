@interface REMTemplateSectionsDataView
- (REMStore)store;
- (REMTemplateSectionsDataView)initWithStore:(id)a3;
- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionsInTemplate:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionsWithTemplateObjectID:(id)a3 error:(id *)a4;
- (id)templateSectionsFromTemplateStorages:(id)a3 templateSectionStorages:(id)a4 store:(id)a5;
@end

@implementation REMTemplateSectionsDataView

- (REMTemplateSectionsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateSectionsDataView;
  v6 = [(REMTemplateSectionsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchTemplateSectionsWithTemplateObjectID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    v8 = [[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate alloc] initWithParentTemplateObjectID:v7];
    objc_super v9 = [(REMTemplateSectionsDataView *)self store];
    v10 = [v9 resultFromPerformingInvocation:v8 error:a4];

    uint64_t v11 = objc_opt_class();
    v12 = REMDynamicCast(v11, (uint64_t)v10);
    v13 = [v12 templateStorages];
    v14 = [v12 templateSectionStorages];
    v15 = [(REMTemplateSectionsDataView *)self store];
    v16 = [(REMTemplateSectionsDataView *)self templateSectionsFromTemplateStorages:v13 templateSectionStorages:v14 store:v15];
  }
  else
  {
    v17 = +[REMLogStore read];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithTemplateObjectID:error:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "templateObjectID");
    v16 = 0;
  }

  return v16;
}

- (id)fetchTemplateSectionsInTemplate:(id)a3 error:(id *)a4
{
  v6 = [a3 objectID];
  id v7 = [(REMTemplateSectionsDataView *)self fetchTemplateSectionsWithTemplateObjectID:v6 error:a4];

  return v7;
}

- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    if ([v7 count])
    {
      objc_super v9 = [[REMTemplateSectionsDataViewInvocation_fetchByObjectIDs alloc] initWithObjectIDs:v8];
      v10 = [(REMTemplateSectionsDataView *)self store];
      uint64_t v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

      uint64_t v12 = objc_opt_class();
      v13 = REMDynamicCast(v12, (uint64_t)v11);
      v14 = [v13 templateStorages];
      v15 = [v13 templateSectionStorages];
      v16 = [(REMTemplateSectionsDataView *)self store];
      v17 = [(REMTemplateSectionsDataView *)self templateSectionsFromTemplateStorages:v14 templateSectionStorages:v15 store:v16];

      if (v17)
      {
        v28 = v11;
        v29 = v9;
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v17, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              v25 = [v24 objectID];
              [v18 setObject:v24 forKeyedSubscript:v25];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v21);
        }

        uint64_t v11 = v28;
        objc_super v9 = v29;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v26 = +[REMLogStore read];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectIDs");
    v18 = 0;
  }

  return v18;
}

- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v15[0] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10 = [(REMTemplateSectionsDataView *)self fetchTemplateSectionsWithObjectIDs:v9 error:a4];

    if (v10)
    {
      uint64_t v11 = [v10 objectForKeyedSubscript:v8];
      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v12 = +[REMLogStore read];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:]((uint64_t)v8, v12);
      }

      if (a4)
      {
        +[REMError noSuchObjectErrorWithObjectID:v8];
        uint64_t v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  v13 = +[REMLogStore read];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:]((uint64_t)self, a2);
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  uint64_t v11 = 0;
LABEL_13:

  return v11;
}

- (id)templateSectionsFromTemplateStorages:(id)a3 templateSectionStorages:(id)a4 store:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = [[REMTemplate alloc] initWithStore:v9 storage:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        v16 = [(REMTemplate *)v15 objectID];
        [v10 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v28 = v8;
  uint64_t v18 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v28);
        }
        uint64_t v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v23 = [v22 parentTemplateID];

        if (!v23) {
          NSLog(&cfstr_SIsUnexpectedl.isa, "templateSectionStorage.parentTemplateID");
        }
        v24 = [v22 parentTemplateID];
        v25 = [v10 objectForKeyedSubscript:v24];
        v26 = [[REMTemplateSection alloc] initWithStore:v9 parentTemplate:v25 storage:v22];
        [v17 addObject:v26];
      }
      uint64_t v19 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }

  return v17;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchTemplateSectionsWithTemplateObjectID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

- (void)fetchTemplateSectionsWithObjectIDs:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

- (void)fetchTemplateSectionWithObjectID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

- (void)fetchTemplateSectionWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "REMTemplateSectionsDataView: Requested to fetch non-existent templateSection {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end