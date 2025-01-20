@interface NSMutableArray
- (void)ic_addNonNilObject:(id)a3;
- (void)ic_addObjectsFromNonNilArray:(id)a3;
- (void)ic_insertNonNilObject:(id)a3 atIndex:(int64_t)a4;
- (void)ic_removeRecordsWithSameCKRecordIDInRecords:(id)a3;
@end

@implementation NSMutableArray

- (void)ic_addNonNilObject:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self, "addObject:");
  }
}

- (void)ic_addObjectsFromNonNilArray:(id)a3
{
  if (a3) {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
}

- (void)ic_insertNonNilObject:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0)
  {
    v8 = +[REMLog utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10075345C(a4, v8);
    }
  }
  else if ((uint64_t)[(NSMutableArray *)self count] >= a4)
  {
    if (v6) {
      [(NSMutableArray *)self insertObject:v6 atIndex:a4];
    }
  }
  else
  {
    v7 = +[REMLog utility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1007534D4(self, a4, v7);
    }
  }
}

- (void)ic_removeRecordsWithSameCKRecordIDInRecords:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  id v6 = (char *)[v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        v10 = REMDynamicCast();
        v11 = v10;
        if (v10)
        {
          v12 = [v10 recordID];
          v13 = [v12 recordName];
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = (char *)[v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = [(NSMutableArray *)self objectEnumerator];
  uint64_t v16 = [v15 nextObject];
  if (v16)
  {
    v17 = (void *)v16;
    do
    {
      objc_opt_class();
      v18 = REMDynamicCast();
      v19 = v18;
      if (v18)
      {
        v20 = [v18 recordID];
        v21 = [v20 recordName];
        v22 = [v4 objectForKeyedSubscript:v21];

        if ([v20 isEqual:v22]) {
          [v14 addObject:v19];
        }
      }
      uint64_t v23 = [v15 nextObject];

      v17 = (void *)v23;
    }
    while (v23);
  }
  [(NSMutableArray *)self removeObjectsInArray:v14];
}

@end