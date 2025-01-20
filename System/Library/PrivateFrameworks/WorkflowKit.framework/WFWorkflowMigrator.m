@interface WFWorkflowMigrator
+ (id)migrationClasses;
+ (id)migrationClassesWithDependencies;
+ (id)orderedMigrationClassesWithoutDependencies;
+ (void)initialize;
+ (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4;
+ (void)registerAllWorkflowKitMigrationClasses;
+ (void)registerMigrationClass:(Class)a3;
@end

@implementation WFWorkflowMigrator

+ (id)migrationClassesWithDependencies
{
  v2 = [a1 migrationClasses];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_244_67225);

  return v3;
}

id __54__WFWorkflowMigrator_migrationClassesWithDependencies__block_invoke(uint64_t a1, void *a2)
{
  v3 = self;
  v4 = [v3 migrationClassDependencies];
  if ([v4 count]) {
    v5 = a2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)orderedMigrationClassesWithoutDependencies
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v4 = [a1 migrationClasses];
  v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_242);
  id v6 = (void *)[v3 initWithSet:v5];

  return v6;
}

id __64__WFWorkflowMigrator_orderedMigrationClassesWithoutDependencies__block_invoke(uint64_t a1, void *a2)
{
  id v3 = self;
  v4 = [v3 migrationClassDependencies];

  if (v4 && [v4 count]) {
    id v5 = 0;
  }
  else {
    id v5 = a2;
  }

  return v5;
}

+ (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v33 = a4;
  v37 = [a1 orderedMigrationClassesWithoutDependencies];
  id v34 = a1;
  [a1 migrationClassesWithDependencies];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v39)
  {
    uint64_t v36 = *(void *)v61;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v61 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        v7 = *(void **)(*((void *)&v60 + 1) + 8 * v6);
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObject:v7];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v9 = obj;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v66 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v57 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              v15 = [v7 migrationClassDependencies];
              if ([v15 containsObject:v14])
              {
              }
              else
              {
                v16 = [v14 migrationClassDependencies];
                int v17 = [v16 containsObject:v7];

                if (!v17) {
                  continue;
                }
              }
              [v8 addObject:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v66 count:16];
          }
          while (v11);
        }

        [v8 sortUsingComparator:&__block_literal_global_229_67229];
        [v37 unionOrderedSet:v8];

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v39);
      uint64_t v39 = [v9 countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v39);
  }

  v18 = v38;
  v43 = [v38 objectForKey:@"WFWorkflowClientVersion"];
  v40 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v37;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v25 = [v24 migrationClassDependencies];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v49;
          do
          {
            uint64_t v29 = 0;
            do
            {
              if (*(void *)v49 != v28) {
                objc_enumerationMutation(v25);
              }
              unint64_t v30 = [v19 indexOfObject:*(void *)(*((void *)&v48 + 1) + 8 * v29)];
              if (v30 >= [v19 indexOfObject:v24])
              {
                v31 = [MEMORY[0x1E4F28B00] currentHandler];
                [v31 handleFailureInMethod:a2 object:v34 file:@"WFWorkflowMigrator.m" lineNumber:173 description:@"Dependent migration class is either missing or part of a circular dependency."];
              }
              ++v29;
            }
            while (v27 != v29);
            uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
          }
          while (v27);
        }

        v18 = v38;
        if ([v24 workflowNeedsMigration:v38 fromClientVersion:v43]) {
          [v40 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v21);
  }

  if ([v40 count])
  {
    v32 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_2;
    block[3] = &unk_1E6557D28;
    id v45 = v18;
    id v46 = v40;
    id v47 = v33;
    dispatch_async(v32, block);
  }
  else
  {
    (*((void (**)(id, void, void *, void))v33 + 2))(v33, 0, v18, 0);
  }
}

void __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFPropertyListRef *)(a1 + 32), 1uLL);
  id v3 = objc_opt_new();
  v4 = [*(id *)(a1 + 40) array];
  id v5 = (void *)[v4 copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_3;
  v13[3] = &unk_1E6557CD8;
  id v14 = DeepCopy;
  id v15 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_5;
  v9[3] = &unk_1E6557D00;
  id v6 = *(id *)(a1 + 48);
  id v11 = v15;
  id v12 = v6;
  id v10 = v14;
  id v7 = v15;
  id v8 = v14;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v13, v9);
}

void __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_3(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = objc_alloc_init(a2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_4;
  v10[3] = &unk_1E6557CB0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v6;
  id v9 = v6;
  [v7 migrateWorkflowIfNeeded:v8 completion:v10];
}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) unionSet:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 migrationClassDependencies];
  if ([v5 containsObject:a3])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [a3 migrationClassDependencies];
    uint64_t v6 = [v7 containsObject:a2] << 63 >> 63;
  }
  return v6;
}

+ (void)registerMigrationClass:(Class)a3
{
  id v4 = [a1 migrationClasses];
  [v4 addObject:a3];
}

+ (id)migrationClasses
{
  if (migrationClasses_onceToken != -1) {
    dispatch_once(&migrationClasses_onceToken, &__block_literal_global_67242);
  }
  v2 = (void *)migrationClasses_migrationClasses;
  return v2;
}

void __38__WFWorkflowMigrator_migrationClasses__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)migrationClasses_migrationClasses;
  migrationClasses_migrationClasses = (uint64_t)v0;
}

+ (void)registerAllWorkflowKitMigrationClasses
{
  v13[57] = *MEMORY[0x1E4F143B8];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  void v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v13[7] = objc_opt_class();
  v13[8] = objc_opt_class();
  v13[9] = objc_opt_class();
  v13[10] = objc_opt_class();
  v13[11] = objc_opt_class();
  v13[12] = objc_opt_class();
  v13[13] = objc_opt_class();
  v13[14] = objc_opt_class();
  v13[15] = objc_opt_class();
  v13[16] = objc_opt_class();
  v13[17] = objc_opt_class();
  v13[18] = objc_opt_class();
  v13[19] = objc_opt_class();
  v13[20] = objc_opt_class();
  v13[21] = objc_opt_class();
  v13[22] = objc_opt_class();
  v13[23] = objc_opt_class();
  v13[24] = objc_opt_class();
  v13[25] = objc_opt_class();
  v13[26] = objc_opt_class();
  v13[27] = objc_opt_class();
  v13[28] = objc_opt_class();
  v13[29] = objc_opt_class();
  v13[30] = objc_opt_class();
  v13[31] = objc_opt_class();
  v13[32] = objc_opt_class();
  v13[33] = objc_opt_class();
  v13[34] = objc_opt_class();
  v13[35] = objc_opt_class();
  v13[36] = objc_opt_class();
  v13[37] = objc_opt_class();
  v13[38] = objc_opt_class();
  v13[39] = objc_opt_class();
  v13[40] = objc_opt_class();
  v13[41] = objc_opt_class();
  v13[42] = objc_opt_class();
  v13[43] = objc_opt_class();
  v13[44] = objc_opt_class();
  v13[45] = objc_opt_class();
  v13[46] = objc_opt_class();
  v13[47] = objc_opt_class();
  v13[48] = objc_opt_class();
  v13[49] = objc_opt_class();
  v13[50] = objc_opt_class();
  v13[51] = objc_opt_class();
  v13[52] = objc_opt_class();
  v13[53] = objc_opt_class();
  v13[54] = objc_opt_class();
  v13[55] = objc_opt_class();
  v13[56] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:57];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(a1, "registerMigrationClass:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 registerAllWorkflowKitMigrationClasses];
  }
}

@end