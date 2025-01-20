@interface REMCDObjectEffectiveVersionValidationNode
- (BOOL)expanded;
- (NSManagedObjectID)managedObjectID;
- (REMCDObject)backingCDObject;
- (id)childrenNodes;
- (void)markAsExpanded;
- (void)setBackingCDObject:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setManagedObjectID:(id)a3;
@end

@implementation REMCDObjectEffectiveVersionValidationNode

- (id)childrenNodes
{
  v2 = [(REMCDObjectEffectiveVersionValidationNode *)self backingCDObject];
  if (!v2)
  {
    v18 = +[REMLogStore write];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10075307C(v18);
    }
  }
  v3 = +[NSMutableArray array];
  v4 = [v2 entity];
  v5 = +[REMCDObject relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:v4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        v7 = [*(id *)(*((void *)&v26 + 1) + 8 * i) name];
        v8 = v2;
        v9 = [v2 objectIDsForRelationshipNamed:v7];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              v16 = objc_alloc_init(REMCDObjectEffectiveVersionValidationNode);
              [(REMCDObjectEffectiveVersionValidationNode *)v16 setManagedObjectID:v15];
              [(REMCDObjectEffectiveVersionValidationNode *)v16 setBackingCDObject:0];
              [v3 addObject:v16];
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }

        v2 = v8;
      }
      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  return v3;
}

- (void)markAsExpanded
{
}

- (BOOL)expanded
{
  return self->expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->expanded = a3;
}

- (NSManagedObjectID)managedObjectID
{
  return self->_managedObjectID;
}

- (void)setManagedObjectID:(id)a3
{
}

- (REMCDObject)backingCDObject
{
  return self->_backingCDObject;
}

- (void)setBackingCDObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCDObject, 0);

  objc_storeStrong((id *)&self->_managedObjectID, 0);
}

@end