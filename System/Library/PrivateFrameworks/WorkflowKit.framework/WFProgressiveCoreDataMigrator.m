@interface WFProgressiveCoreDataMigrator
+ (BOOL)migrateDatabaseAtPersistentStoreDescription:(id)a3 useLockFile:(BOOL)a4 error:(id *)a5;
+ (id)customModificationsStepForSchemaWithIdentifier:(id)a3;
@end

@implementation WFProgressiveCoreDataMigrator

+ (BOOL)migrateDatabaseAtPersistentStoreDescription:(id)a3 useLockFile:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v117 = a3;
  v131 = [v117 URL];
  v128 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v120 = [v128 URLForResource:@"Shortcuts" withExtension:@"momd"];
  if (v5)
  {
    v6 = [v131 URLByDeletingLastPathComponent];
    v7 = [v6 URLByAppendingPathComponent:@"Shortcuts.core_data_migration" isDirectory:0];

    id v8 = v7;
    int v9 = open((const char *)[v8 fileSystemRepresentation], 512, 420);
    if (v9 != -1)
    {
      int v10 = v9;
      if (flock(v9, 2) != -1)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke;
        aBlock[3] = &unk_1E654EB60;
        int v147 = v10;
        id v146 = v8;
        id v11 = v8;
        v12 = (void (**)(void))_Block_copy(aBlock);
        v12[2]();

        goto LABEL_5;
      }
      close(v10);
    }
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    }

    BOOL v22 = 0;
    goto LABEL_128;
  }
LABEL_5:
  uint64_t v13 = *MEMORY[0x1E4F1BF70];
  uint64_t v144 = 0;
  uint64_t v118 = v13;
  v116 = objc_msgSend(MEMORY[0x1E4F1C188], "metadataForPersistentStoreOfType:URL:options:error:");
  id v112 = 0;
  if (!v116)
  {
    v21 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v112;
      _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_DEFAULT, "%s Not migrating, since persistent store metadata creation failed (likely no store has been created yet): %{public}@", buf, 0x16u);
    }
    BOOL v22 = 1;
    goto LABEL_127;
  }
  id v133 = v120;
  id v129 = v116;
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v148 = 0;
  v15 = [v14 contentsOfDirectoryAtURL:v133 includingPropertiesForKeys:0 options:0 error:&v148];
  id context = v148;
  v135 = (void *)[v15 mutableCopy];

  if (v135)
  {
    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"lastPathComponent.pathExtension", @"mom"];
    [v135 filterUsingPredicate:v16];

    v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastPathComponent" ascending:0 comparator:&__block_literal_global_9435];
    v160 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v160 count:1];
    [v135 sortUsingDescriptors:v18];

    v137 = objc_opt_new();
    v19 = [v129 objectForKeyedSubscript:*MEMORY[0x1E4F1BF80]];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    id v24 = v20;

    v25 = [v24 firstObject];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
    id v27 = v26;

    long long v158 = 0u;
    long long v159 = 0u;
    memset(v157, 0, sizeof(v157));
    v28 = v135;
    uint64_t v29 = [v28 countByEnumeratingWithState:v157 objects:buf count:16];
    if (v29)
    {
      uint64_t v30 = **(void **)&v157[16];
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (**(void **)&v157[16] != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*(void *)&v157[8] + 8 * i);
          v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v32];
          if (!v33)
          {
            v38 = getWFDatabaseLogObject();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v161 = 136315394;
              *(void *)&v161[4] = "WFManagedObjectModelsFromCurrentToLatest";
              *(_WORD *)&v161[12] = 2114;
              *(void *)&v161[14] = v32;
              _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_FAULT, "%s Failed to create managed object model from URL %{public}@", v161, 0x16u);
            }

            goto LABEL_45;
          }
          [v137 addObject:v33];
          v34 = [v33 versionIdentifiers];
          v35 = [v34 anyObject];
          char v36 = [v35 isEqualToString:v27];

          if (v36) {
            goto LABEL_38;
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:v157 objects:buf count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
LABEL_38:

    uint64_t v37 = [v137 count];
    if (v37 == [v28 count])
    {
      v28 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v161 = 136315138;
        *(void *)&v161[4] = "WFManagedObjectModelsFromCurrentToLatest";
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s None of the models are compatible with with the store metadata, the database was likely truncated before.", v161, 0xCu);
      }
LABEL_45:
      v132 = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v28 = [v137 reverseObjectEnumerator];
      v132 = [v28 allObjects];
    }
  }
  else
  {
    v23 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "WFManagedObjectModelsFromCurrentToLatest";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v133;
      *(_WORD *)&buf[22] = 2114;
      v153 = context;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to get model URLs in directory %{public}@: %{public}@", buf, 0x20u);
    }

    if (a5) {
      *a5 = context;
    }
    v132 = MEMORY[0x1E4F1CBF0];
  }

  if ((unint64_t)[v132 count] <= 1)
  {
    oslog = getWFDatabaseLogObject();
    BOOL v22 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = [v132 count];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_1C7F0A000, oslog, OS_LOG_TYPE_INFO, "%s Found %{public}lu models, Core Data migration not necessary, bailing out.", buf, 0x16u);
    }
    goto LABEL_126;
  }
  oslog = [MEMORY[0x1E4F5AA28] createTemporaryDirectoryWithFilename:@"ProgressiveMigration"];
  if (!oslog)
  {
    v44 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C7F0A000, v44, OS_LOG_TYPE_ERROR, "%s Failed to perform Core Data migration because a temporary directory could not be created.", buf, 0xCu);
    }
    goto LABEL_116;
  }
  v40 = [v132 firstObject];
  char v41 = [v40 isConfiguration:0 compatibleWithStoreMetadata:v129];

  if ((v41 & 1) == 0)
  {
    id v42 = objc_alloc(MEMORY[0x1E4F1C188]);
    v43 = [v132 firstObject];
    v44 = [v42 initWithManagedObjectModel:v43];

    uint64_t v45 = *MEMORY[0x1E4F1BDE8];
    v150[0] = *MEMORY[0x1E4F1BE50];
    v150[1] = v45;
    v151[0] = MEMORY[0x1E4F1CC38];
    v151[1] = MEMORY[0x1E4F1CC38];
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:2];
    v47 = [v117 type];
    v48 = [v117 configuration];
    v49 = [v117 URL];
    v50 = [v44 addPersistentStoreWithType:v47 configuration:v48 URL:v49 options:v46 error:a5];
    BOOL v51 = v50 == 0;

    if (!v51)
    {

      goto LABEL_54;
    }
    v101 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C7F0A000, v101, OS_LOG_TYPE_ERROR, "%s Failed to perform Core Data migration because current model can not be mapped to the same version's model", buf, 0xCu);
    }

LABEL_116:
    BOOL v22 = 0;
    goto LABEL_125;
  }
LABEL_54:
  id v52 = objc_alloc(MEMORY[0x1E4F1C188]);
  v53 = [v132 lastObject];
  v54 = (void *)[v52 initWithManagedObjectModel:v53];

  v55 = objc_opt_new();
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke_17;
  v141[3] = &unk_1E6558938;
  id v122 = v55;
  id v142 = v122;
  v107 = v54;
  v143 = v107;
  v108 = (void (**)(void))_Block_copy(v141);
  v56 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
    _os_log_impl(&dword_1C7F0A000, v56, OS_LOG_TYPE_INFO, "%s Starting Core Data migration", buf, 0xCu);
  }

  v57 = [MEMORY[0x1E4F29128] UUID];
  v114 = [v57 UUIDString];

  unint64_t v58 = 0;
  id v134 = 0;
  v59 = v132;
  while (v58 < [v59 count] - 1)
  {
    id contexta = (id)MEMORY[0x1C87CA430]();
    v138 = [v132 objectAtIndexedSubscript:v58];
    unint64_t v60 = v58 + 1;
    v61 = [v132 objectAtIndexedSubscript:v60];
    uint64_t v62 = [v122 lastObject];
    v63 = (void *)v62;
    v64 = v131;
    if (v62) {
      v64 = (void *)v62;
    }
    id v130 = v64;

    unint64_t v125 = v60 - 1;
    v65 = [NSString stringWithFormat:@"Shortcuts-%@-%lu.sqlite", v114, v60 - 1];
    v136 = [oslog URLByAppendingPathComponent:v65];

    v66 = (void *)MEMORY[0x1E4F1C128];
    v149 = v128;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
    v68 = [v66 mappingModelFromBundles:v67 forSourceModel:v138 destinationModel:v61];

    if (v68)
    {
      id v69 = v134;
    }
    else
    {
      v70 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        _os_log_impl(&dword_1C7F0A000, v70, OS_LOG_TYPE_DEFAULT, "%s Could not find explicit mapping model, trying to construct inferred one", buf, 0xCu);
      }

      id v140 = v134;
      v68 = [MEMORY[0x1E4F1C128] inferredMappingModelForSourceModel:v138 destinationModel:v61 error:&v140];
      id v69 = v140;

      if (!v68)
      {
        v68 = getWFDatabaseLogObject();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
          _os_log_impl(&dword_1C7F0A000, v68, OS_LOG_TYPE_ERROR, "%s Failed to create mapping model, bailing out", buf, 0xCu);
        }
        int v94 = 2;
        id v134 = v69;
        goto LABEL_103;
      }
    }
    v71 = [v138 versionIdentifiers];
    v72 = [v71 anyObject];

    if (v72)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v73 = v72;
      }
      else {
        v73 = 0;
      }
    }
    else
    {
      v73 = 0;
    }
    id v124 = v73;

    v74 = [v61 versionIdentifiers];
    v75 = [v74 anyObject];

    if (v75)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v76 = v75;
      }
      else {
        v76 = 0;
      }
    }
    else
    {
      v76 = 0;
    }
    id v77 = v76;

    v78 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v77;
      _os_log_impl(&dword_1C7F0A000, v78, OS_LOG_TYPE_INFO, "%s Migrating to schema with identifier %{public}@", buf, 0x16u);
    }

    if (([v77 isEqualToString:@"v2"] & 1) != 0
      || [v77 isEqualToString:@"v3"])
    {
      v79 = (void *)MEMORY[0x1E4F29248];
      v80 = objc_opt_new();
      [v79 setValueTransformer:v80 forName:@"WFOrderedSetValue"];
    }
    v81 = (void *)[objc_alloc(MEMORY[0x1E4F1C138]) initWithSourceModel:v138 destinationModel:v61];
    id v139 = v69;
    char v82 = [v81 migrateStoreFromURL:v130 type:v118 options:0 withMappingModel:v68 toDestinationURL:v136 destinationType:v118 destinationOptions:0 error:&v139];
    id v134 = v139;

    if (v82)
    {
      [v122 addObject:v136];
      v83 = [a1 customModificationsStepForSchemaWithIdentifier:v77];
      if (v83)
      {
        v84 = getWFDatabaseLogObject();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v77;
          _os_log_impl(&dword_1C7F0A000, v84, OS_LOG_TYPE_INFO, "%s Running custom modifications step after migrating to schema with identifier %{public}@", buf, 0x16u);
        }

        v85 = v83;
        id v111 = v61;
        id v109 = v136;
        v119 = objc_msgSend(MEMORY[0x1E4F1C190], "persistentStoreDescriptionWithURL:");
        v113 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v111];
        v86 = [v119 type];
        v87 = [v119 configuration];
        v88 = [v119 URL];
        id v148 = 0;
        v89 = [v113 addPersistentStoreWithType:v86 configuration:v87 URL:v88 options:0 error:&v148];
        id v110 = v148;

        if (v89)
        {
          v90 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
          [v90 setPersistentStoreCoordinator:v113];
          [v90 setMergePolicy:*MEMORY[0x1E4F1BE58]];
          [v90 setUndoManager:0];
          *(void *)v161 = 0;
          *(void *)&v161[8] = v161;
          *(void *)&v161[16] = 0x2020000000;
          char v162 = 1;
          *(void *)v157 = 0;
          *(void *)&v157[8] = v157;
          *(void *)&v157[16] = 0x3032000000;
          *(void *)&v157[24] = __Block_byref_object_copy__9457;
          *(void *)&long long v158 = __Block_byref_object_dispose__9458;
          *((void *)&v158 + 1) = 0;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __WFPerformCustomModificationsStep_block_invoke;
          v153 = &unk_1E654FAE0;
          v155 = v161;
          *(void *)&long long v154 = v85;
          id v91 = v90;
          *((void *)&v154 + 1) = v91;
          v156 = v157;
          [v91 performBlockAndWait:buf];
          id v92 = *(id *)(*(void *)&v157[8] + 40);
          BOOL v93 = *(unsigned char *)(*(void *)&v161[8] + 24) != 0;

          _Block_object_dispose(v157, 8);
          _Block_object_dispose(v161, 8);
        }
        else
        {
          v95 = getWFDatabaseLogObject();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v157 = 136315394;
            *(void *)&v157[4] = "WFPerformCustomModificationsStep";
            *(_WORD *)&v157[12] = 2114;
            *(void *)&v157[14] = v110;
            _os_log_impl(&dword_1C7F0A000, v95, OS_LOG_TYPE_ERROR, "%s Failed to add persistent store during Core Data migration: %{public}@", v157, 0x16u);
          }

          id v92 = v110;
          BOOL v93 = 0;
        }

        id v96 = v92;
        if (v93)
        {
          int v94 = 0;
        }
        else
        {
          v97 = getWFDatabaseLogObject();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v77;
            *(_WORD *)&buf[22] = 2114;
            v153 = v96;
            _os_log_impl(&dword_1C7F0A000, v97, OS_LOG_TYPE_ERROR, "%s Failed to perform custom database modifications for Core Data schema with identifier %{public}@: %{public}@", buf, 0x20u);
          }

          int v94 = 2;
        }
        id v134 = v96;
      }
      else
      {
        v85 = 0;
        int v94 = 0;
      }
    }
    else
    {
      v85 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v124;
        *(_WORD *)&buf[22] = 2114;
        v153 = v77;
        LOWORD(v154) = 2114;
        *(void *)((char *)&v154 + 2) = v134;
        _os_log_impl(&dword_1C7F0A000, v85, OS_LOG_TYPE_ERROR, "%s Failed to migrate from schema with identifier %{public}@ to %{public}@. Error: %{public}@", buf, 0x2Au);
      }
      int v94 = 2;
    }

LABEL_103:
    v59 = v132;
    unint64_t v58 = v125 + 1;
    if (v94) {
      break;
    }
  }
  if (v134)
  {
    if (a5)
    {
      BOOL v22 = 0;
      *a5 = v134;
      goto LABEL_124;
    }
LABEL_123:
    BOOL v22 = 0;
  }
  else
  {
    v98 = [v122 lastObject];
    char v99 = [v107 replacePersistentStoreAtURL:v131 destinationOptions:0 withPersistentStoreFromURL:v98 sourceOptions:0 storeType:v118 error:a5];

    if ((v99 & 1) == 0)
    {
      v102 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        uint64_t v103 = [v122 lastObject];
        v104 = (void *)v103;
        if (a5) {
          id v105 = *a5;
        }
        else {
          id v105 = 0;
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2114;
        v153 = (void *)v103;
        LOWORD(v154) = 2114;
        *(void *)((char *)&v154 + 2) = v105;
        _os_log_impl(&dword_1C7F0A000, v102, OS_LOG_TYPE_ERROR, "%s Failed to replace persistent store at %{public}@ with %{public}@. Error: %{public}@", buf, 0x2Au);
      }
      goto LABEL_123;
    }
    v100 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C7F0A000, v100, OS_LOG_TYPE_INFO, "%s Core Data migration completed successfully", buf, 0xCu);
    }

    BOOL v22 = 1;
  }
LABEL_124:

  v108[2]();
  v44 = v107;
LABEL_125:

LABEL_126:
  v21 = v132;
LABEL_127:

LABEL_128:
  return v22;
}

void __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (flock(*(_DWORD *)(a1 + 40), 8) == -1)
  {
    v2 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = *__error();
      int v5 = 136315394;
      v6 = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]_block_invoke";
      __int16 v7 = 1026;
      int v8 = v3;
      _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_ERROR, "%s Error: Failed to unlock migration file, errno=%{public}d", (uint8_t *)&v5, 0x12u);
    }
  }
  close(*(_DWORD *)(a1 + 40));
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

void __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke_17(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F1BF70];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1C87CA430]();
        int v10 = *(void **)(a1 + 40);
        id v14 = 0;
        char v11 = [v10 destroyPersistentStoreAtURL:v8 withType:v6 options:0 error:&v14];
        id v12 = v14;
        if ((v11 & 1) == 0)
        {
          uint64_t v13 = getWFDatabaseLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]_block_invoke";
            __int16 v21 = 2114;
            id v22 = v12;
            _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to destroy temporary persistent store after migration: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }
}

+ (id)customModificationsStepForSchemaWithIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"v3"] & 1) != 0
    || ([v3 isEqualToString:@"v5"] & 1) != 0
    || ([v3 isEqualToString:@"v7"] & 1) != 0
    || [v3 isEqualToString:@"v10"])
  {
    uint64_t v4 = objc_opt_new();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end