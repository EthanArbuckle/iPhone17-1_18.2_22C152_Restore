@interface RDStoreControllerMigrator_PopulateDefaultValues
- (void)migrateStore:(id)a3;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_PopulateDefaultValues

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"RDStoreControllerMigrator_PopulateDefaultValues"];
  id v8 = [v7 integerValue];

  if ((uint64_t)v8 <= 0)
  {
    [(RDStoreControllerMigrator_PopulateDefaultValues *)self migrateStore:v9];
    [v6 setObject:&off_1008D7498 forKeyedSubscript:@"RDStoreControllerMigrator_PopulateDefaultValues"];
  }
}

- (void)migrateStore:(id)a3
{
  id v3 = a3;
  v4 = +[REMLogStore container];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PopulateDefaultValuesMigration BEGIN {store: %@}", buf, 0xCu);
  }

  v39 = v3;
  v5 = [v3 persistentStoreCoordinator];
  id v6 = [v5 managedObjectModel];

  v32 = v6;
  v7 = [v6 entitiesByName];
  id v40 = objc_alloc_init((Class)NSMutableArray);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v35 = v7;
  id obj = [v7 allKeys];
  id v36 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v56;
    uint64_t v38 = RDStoreControllerDefaultValuesMigrationAuthor;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        v41 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
        v42 = [v35 objectForKeyedSubscript:];
        id v9 = [v42 attributesByName];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v43 = [v9 allKeys];
        id v10 = [v43 countByEnumeratingWithState:&v51 objects:v66 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v52;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v52 != v12) {
                objc_enumerationMutation(v43);
              }
              v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v15 = [v9 objectForKeyedSubscript:v14];
              if (([v15 isOptional] & 1) == 0)
              {
                v16 = [v15 defaultValue];
                if (v16)
                {
                  v17 = [v42 superentity];
                  v18 = [v17 attributesByName];
                  v19 = [v18 objectForKey:v14];

                  v20 = +[REMLogStore container];
                  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
                  if (v19)
                  {
                    if (v21)
                    {
                      *(_DWORD *)buf = 138412546;
                      id v63 = v41;
                      __int16 v64 = 2112;
                      id v65 = v14;
                      v22 = v20;
                      os_log_type_t v23 = OS_LOG_TYPE_INFO;
                      v24 = "Attribute belongs to super entity. Skipping {entityName: %@, attributeName: %@}";
                      goto LABEL_20;
                    }
                  }
                  else
                  {
                    if (v21)
                    {
                      *(_DWORD *)buf = 138412546;
                      id v63 = v41;
                      __int16 v64 = 2112;
                      id v65 = v14;
                      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PopulateDefaultValues BEGIN {entity: %@, attributeName: %@}", buf, 0x16u);
                    }

                    id v25 = [objc_alloc((Class)NSBatchUpdateRequest) initWithEntity:v42];
                    v26 = +[NSPredicate predicateWithFormat:@"%K == NULL", v14];
                    [v25 setPredicate:v26];

                    [v25 setIncludesSubentities:1];
                    [v25 setResultType:2];
                    v60 = v15;
                    v61 = v16;
                    v27 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                    [v25 setPropertiesToUpdate:v27];

                    v59 = v39;
                    v28 = +[NSArray arrayWithObjects:&v59 count:1];
                    [v25 setAffectedStores:v28];

                    id v29 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
                    [v29 setTransactionAuthor:v38];
                    v44[0] = _NSConcreteStackBlock;
                    v44[1] = 3221225472;
                    v44[2] = sub_100081558;
                    v44[3] = &unk_1008AF028;
                    id v45 = v39;
                    id v46 = v25;
                    id v47 = v29;
                    id v48 = v40;
                    v49 = v41;
                    v50 = v14;
                    id v30 = v29;
                    v20 = v25;
                    [v30 performBlockAndWait:v44];
                  }
                }
                else
                {
                  v20 = +[REMLogStore container];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v63 = v41;
                    __int16 v64 = 2112;
                    id v65 = v14;
                    v22 = v20;
                    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
                    v24 = "Non-optional attribute has no default value. Skipping {entityName: %@, attributeName: %@}";
LABEL_20:
                    _os_log_impl((void *)&_mh_execute_header, v22, v23, v24, buf, 0x16u);
                  }
                }
              }
            }
            id v11 = [v43 countByEnumeratingWithState:&v51 objects:v66 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v36);
  }

  v31 = +[REMLogStore container];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v63 = v39;
    __int16 v64 = 2112;
    id v65 = v40;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PopulateDefaultValuesMigration END {store: %@, populateAttributeNames: %@}", buf, 0x16u);
  }
}

@end