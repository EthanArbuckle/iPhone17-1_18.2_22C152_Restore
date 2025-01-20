@interface STCloudActivation
+ (BOOL)reconcileWithManagedObjectContext:(id)a3 andUpdateLosers:(id)a4 error:(id *)a5;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)computeUniqueIdentifier;
- (void)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STCloudActivation

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"activationPlist"]) {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  v5.receiver = self;
  v5.super_class = (Class)STCloudActivation;
  [(STCloudActivation *)&v5 didChangeValueForKey:v4];
}

- (id)computeUniqueIdentifier
{
  v3 = [(STCloudActivation *)self activationPlist];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    objc_super v5 = [(STCloudActivation *)self activationPlist];
    id v13 = 0;
    v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v13];
    id v7 = v13;

    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"uniqueIdentifier"];
    }
    else
    {
      v11 = +[STLog cloudkit];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        [(STCloudActivation *)(uint64_t)v7 computeUniqueIdentifier];
      }

      uint64_t v8 = [(STCloudActivation *)self identifier];
    }
    v10 = (void *)v8;
  }
  else
  {
    v9 = +[STLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[STCloudActivation computeUniqueIdentifier](v9);
    }

    v10 = [(STCloudActivation *)self identifier];
  }
  return v10;
}

+ (BOOL)reconcileWithManagedObjectContext:(id)a3 andUpdateLosers:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[STCloudActivation fetchRequest];
  id v59 = 0;
  uint64_t v8 = [v7 execute:&v59];
  id v9 = v59;
  v10 = v9;
  if (v9)
  {
    if (a5)
    {
      BOOL v11 = 0;
      *a5 = v9;
      goto LABEL_38;
    }
LABEL_35:
    BOOL v11 = 0;
    goto LABEL_38;
  }
  if (![v8 count]) {
    goto LABEL_35;
  }
  v39 = v7;
  v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v38 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v18, "activationType", v38))
        {
          v19 = [v18 uniqueIdentifier];
          v20 = [v12 valueForKey:v19];
          if (!v20)
          {
            v20 = objc_opt_new();
            [v12 setObject:v20 forKeyedSubscript:v19];
          }
          [v20 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v15);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    char v24 = 0;
    uint64_t v25 = *(void *)v52;
    uint64_t v40 = *(void *)v52;
    id v41 = v21;
    do
    {
      uint64_t v26 = 0;
      uint64_t v42 = v23;
      do
      {
        if (*(void *)v52 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = objc_msgSend(v21, "valueForKey:", *(void *)(*((void *)&v51 + 1) + 8 * v26), v38);
        if ((unint64_t)[v27 count] >= 2)
        {
          v44 = v27;
          v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_3];
          v29 = (void *)[v28 mutableCopy];

          v43 = [v29 firstObject];
          objc_msgSend(v29, "removeObject:");
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v30 = v29;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v60 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v48 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                v36 = +[STLog cloudkit];
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                  +[STCloudActivation reconcileWithManagedObjectContext:andUpdateLosers:error:](&buf, v46, v36);
                }

                [v6 addObject:v35];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v60 count:16];
            }
            while (v32);
          }

          char v24 = 1;
          uint64_t v25 = v40;
          id v21 = v41;
          uint64_t v23 = v42;
          v27 = v44;
        }

        ++v26;
      }
      while (v26 != v23);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v23);
  }
  else
  {
    char v24 = 0;
  }

  BOOL v11 = v24 & 1;
  v10 = 0;
  id v7 = v39;
  uint64_t v8 = v38;
LABEL_38:

  return v11;
}

uint64_t __77__STCloudActivation_reconcileWithManagedObjectContext_andUpdateLosers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 sortKey];
  id v6 = [v5 UUIDString];
  id v7 = [v4 sortKey];

  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  objc_super v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v9];
  id v6 = v9;
  if (v5)
  {
    [(STCloudActivation *)self setActivationPlist:v5];
  }
  else
  {
    id v7 = +[STLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(STCloudActivation *)(uint64_t)v4 updateWithDictionaryRepresentation:v7];
    }
  }
  return v5 != 0;
}

- (id)dictionaryRepresentation
{
  v3 = [(STCloudActivation *)self activationPlist];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    objc_super v5 = [(STCloudActivation *)self activationPlist];
    id v11 = 0;
    id v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v11];
    id v7 = v11;

    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = +[STLog cloudkit];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(STCloudActivation *)(uint64_t)v7 dictionaryRepresentation];
      }

      id v8 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v7 = +[STLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[STCloudActivation dictionaryRepresentation](v7);
    }
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (void)computeUniqueIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Cannot computeUniqueIdentifier, unable to deserialize activation plist: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)reconcileWithManagedObjectContext:(uint8_t *)buf andUpdateLosers:(unsigned char *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Reconciling away an activation", buf, 2u);
}

- (void)updateWithDictionaryRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1DA519000, log, OS_LOG_TYPE_FAULT, "Unable to update cloud activation with dictionary: %{public}@\n%{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)dictionaryRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "Cannot deserialize activation plist: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end