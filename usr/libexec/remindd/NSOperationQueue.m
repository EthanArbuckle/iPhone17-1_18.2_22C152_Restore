@interface NSOperationQueue
- (BOOL)containsOperationToDeleteRecordID:(id)a3;
- (BOOL)containsOperationToFetchRecordID:(id)a3;
- (BOOL)containsOperationToSaveRecordID:(id)a3;
- (id)existingOperationToDeleteRecordID:(id)a3;
- (id)existingOperationToFetchRecordID:(id)a3;
- (id)existingOperationToSaveRecordID:(id)a3;
- (id)iterativelyCancelDependentOperations:(id)a3;
@end

@implementation NSOperationQueue

- (id)existingOperationToDeleteRecordID:(id)a3
{
  id v4 = a3;
  v5 = [(NSOperationQueue *)self operations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006A444;
  v9[3] = &unk_1008B05A0;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 ic_objectPassingTest:v9];

  return v7;
}

- (BOOL)containsOperationToDeleteRecordID:(id)a3
{
  v3 = [(NSOperationQueue *)self existingOperationToDeleteRecordID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)existingOperationToFetchRecordID:(id)a3
{
  id v4 = a3;
  v5 = [(NSOperationQueue *)self operations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006A5C4;
  v9[3] = &unk_1008B05A0;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 ic_objectPassingTest:v9];

  return v7;
}

- (BOOL)containsOperationToFetchRecordID:(id)a3
{
  v3 = [(NSOperationQueue *)self existingOperationToFetchRecordID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)existingOperationToSaveRecordID:(id)a3
{
  id v4 = a3;
  v5 = [(NSOperationQueue *)self operations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006A744;
  v9[3] = &unk_1008B05A0;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 ic_objectPassingTest:v9];

  return v7;
}

- (BOOL)containsOperationToSaveRecordID:(id)a3
{
  v3 = [(NSOperationQueue *)self existingOperationToSaveRecordID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)iterativelyCancelDependentOperations:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithObject:v4];
  id v6 = [(NSOperationQueue *)self operations];
  id v7 = [v6 mutableCopy];

  v8 = +[NSMutableArray array];
  v26 = v5;
  uint64_t v9 = [v5 lastObject];
  if (v9)
  {
    id v10 = (void *)v9;
    id v24 = v7;
    do
    {
      if (!objc_msgSend(v7, "count", v24)) {
        break;
      }
      [v26 removeLastObject];
      uint64_t v25 = [v26 lastObject];

      v11 = +[NSMutableArray array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v18 = [v17 dependencies];
            if ([v18 containsObject:v4])
            {
              unsigned __int8 v19 = [v17 isCancelled];

              if ((v19 & 1) == 0)
              {
                v20 = +[REMLog cloudkit];
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  v21 = [v17 ic_loggingDescription];
                  *(_DWORD *)buf = 138412290;
                  v32 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Canceling operation: %@", buf, 0xCu);
                }
                [v17 cancel];
                [v26 addObject:v17];
                [v11 addObject:v17];
                [v8 addObject:v17];
              }
            }
            else
            {
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v14);
      }

      [v12 removeObjectsInArray:v11];
      id v7 = v24;
      id v10 = (void *)v25;
    }
    while (v25);
  }
  id v22 = [v8 copy];

  return v22;
}

@end