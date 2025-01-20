@interface REMCDObjectEffectiveVersionValidationDelegateImpl
- (BOOL)preprocessTreeNode:(id)a3;
- (RDStoreControllerManagedObjectContext)managedObjectContext;
- (REMCDObjectEffectiveVersionValidationDelegateImpl)initWithManagedObjectContext:(id)a3;
- (void)processBatchOfTreeNodes:(id)a3;
- (void)setManagedObjectContext:(id)a3;
@end

@implementation REMCDObjectEffectiveVersionValidationDelegateImpl

- (REMCDObjectEffectiveVersionValidationDelegateImpl)initWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMCDObjectEffectiveVersionValidationDelegateImpl;
  v5 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_managedObjectContext, v4);
  }

  return v6;
}

- (BOOL)preprocessTreeNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = REMDynamicCast();
  v6 = v5;
  if (v5)
  {
    v7 = [v5 managedObjectID];
    objc_super v8 = [v6 backingCDObject];
    if (v8)
    {
LABEL_3:
      unsigned __int8 v9 = [v8 validateEffectiveMinimumSupportedVersionApplyingChange:1];
LABEL_20:

      goto LABEL_21;
    }
    v10 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
    id v17 = 0;
    v11 = [v10 existingObjectWithID:v7 error:&v17];
    id v12 = v17;

    if (v11) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      objc_opt_class();
      uint64_t v15 = REMDynamicCast();
      if (v15)
      {
        objc_super v8 = v15;
        [v6 setBackingCDObject:v15];

        goto LABEL_3;
      }
      v14 = +[REMLogStore write];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100753280((uint64_t)v7, (uint64_t)v11, v14);
      }
    }
    else
    {
      v14 = +[REMLogStore write];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1007531FC();
      }
    }

    objc_super v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100753188();
    }
    unsigned __int8 v9 = 0;
    goto LABEL_20;
  }
  v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_100753100();
  }
  unsigned __int8 v9 = 0;
LABEL_21:

  return v9;
}

- (void)processBatchOfTreeNodes:(id)a3
{
  id v4 = a3;
  v5 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
  unsigned int v6 = [v5 hasChanges];

  if (v6)
  {
    v7 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
    objc_super v8 = [v7 updatedObjects];
    id v9 = [v8 count];

    v10 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
    id v21 = 0;
    unsigned int v11 = [v10 coreDataSave:&v21];
    id v12 = v21;

    BOOL v13 = +[REMLogStore write];
    v14 = v13;
    if (!v11 || v12)
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v15 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
      v16 = [v15 transactionAuthor];
      id v19 = [v4 count];
      *(_DWORD *)buf = 138544130;
      v23 = v16;
      __int16 v24 = 2048;
      id v25 = v19;
      __int16 v26 = 2048;
      id v27 = v9;
      __int16 v28 = 2114;
      v29 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: SAVE COREDATA ERROR {author: %{public}@, nodesToFlush.count: %ld, update.count: %ld, error: %{public}@}", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v15 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
      v16 = [v15 transactionAuthor];
      id v17 = [v4 count];
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      __int16 v24 = 2048;
      id v25 = v17;
      __int16 v26 = 2048;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: SAVE COREDATA {author: %{public}@, nodesToFlush.count: %ld, update.count: %ld}", buf, 0x20u);
    }

    goto LABEL_10;
  }
  id v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = [(REMCDObjectEffectiveVersionValidationDelegateImpl *)self managedObjectContext];
    v18 = [v14 transactionAuthor];
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    __int16 v24 = 2048;
    id v25 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: No changes in MoC, no need to save {author: %{public}@, nodesToFlush.count: %ld}", buf, 0x16u);

    goto LABEL_10;
  }
LABEL_11:

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005CB68;
  v20[3] = &unk_1008AFF28;
  v20[4] = self;
  [v4 enumerateObjectsUsingBlock:v20];
}

- (RDStoreControllerManagedObjectContext)managedObjectContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedObjectContext);

  return (RDStoreControllerManagedObjectContext *)WeakRetained;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end