@interface STReconciler
+ (void)reconcileWithManagedObjectContext:(id)a3 completion:(id)a4;
@end

@implementation STReconciler

+ (void)reconcileWithManagedObjectContext:(id)a3 completion:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v37 = a4;
  v52[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  [v5 setTransactionAuthor:@"STUnique"];
  v7 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v45;
    while (2)
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        id v43 = v15;
        char v17 = [v16 reconcileWithManagedObjectContext:v5 andUpdateLosers:v7 error:&v43];
        id v12 = v43;

        if (v17)
        {
          char v11 = 1;
        }
        else if (v12)
        {
          [v12 domain];
          v19 = v18 = v12;
          char v20 = [v19 isEqualToString:@"STErrorDomain"];

          if (v20)
          {
            id v21 = v18;
          }
          else
          {
            STXPCSafeErrorFromCoreDataError(v18, 1);
            id v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v29 = (void (**)(void, void, void))v37;
          (*((void (**)(id, void, id))v37 + 2))(v37, v11 & 1, v21);

          goto LABEL_35;
        }
        ++v14;
        v15 = v12;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v11 = 0;
    id v12 = 0;
  }
  v34 = v12;
  id v35 = v8;
  char v36 = v11;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v28 = +[STLog persistence];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = v27;
          _os_log_impl(&dword_1DA519000, v28, OS_LOG_TYPE_DEFAULT, "Conflict loser being deleted: %@", buf, 0xCu);
        }

        [v5 deleteObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v24);
  }

  if ((v36 & 1) == 0)
  {
    v29 = (void (**)(void, void, void))v37;
    id v8 = v35;
    id v21 = v34;
LABEL_34:
    v29[2](v29, v36 & 1, 0);
    goto LABEL_35;
  }
  v29 = (void (**)(void, void, void))v37;
  id v21 = v34;
  id v8 = v35;
  if (![v5 hasChanges]) {
    goto LABEL_34;
  }
  id v38 = v34;
  char v30 = [v5 save:&v38];
  id v21 = v38;

  if (v30) {
    goto LABEL_34;
  }
  if (v21)
  {
    v31 = [v21 domain];
    char v32 = [v31 isEqualToString:@"STErrorDomain"];

    if ((v32 & 1) == 0)
    {
      uint64_t v33 = STXPCSafeErrorFromCoreDataError(v21, 1);

      id v21 = (id)v33;
    }
  }
  (*((void (**)(id, void, id))v37 + 2))(v37, 0, v21);
LABEL_35:
}

@end