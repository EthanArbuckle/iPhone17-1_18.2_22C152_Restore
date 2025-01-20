@interface SAPathList
- (NSMutableArray)appList;
- (NSMutableDictionary)dirstatIDToBundlesSet;
- (NSMutableDictionary)pathToBundlesSet;
- (SAPathList)init;
- (SATrie)pathsTrie;
- (id)findAncestorOfPath:(id)a3;
- (id)generateDictionary;
- (id)getBundlesSetForDirStatID:(id)a3;
- (id)getBundlesSetForPath:(id)a3;
- (void)addPaths:(id)a3 ToBundleSets:(id)a4;
- (void)filterOverlappingPaths;
- (void)getAppsSetForURL:(id)a3 completionHandler:(id)a4;
- (void)insertDirStatID:(unint64_t)a3 forBundlesSet:(id)a4;
- (void)print;
- (void)updateWithAppPathList:(id)a3;
@end

@implementation SAPathList

- (SAPathList)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAPathList;
  v2 = [(SAPathList *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:100];
    dirstatIDToBundlesSet = v2->_dirstatIDToBundlesSet;
    v2->_dirstatIDToBundlesSet = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:100];
    pathToBundlesSet = v2->_pathToBundlesSet;
    v2->_pathToBundlesSet = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSMutableArray)appList
{
  return (NSMutableArray *)[(NSMutableDictionary *)self->_pathToBundlesSet allValues];
}

- (void)getAppsSetForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_super v8 = [(NSMutableDictionary *)self->_pathToBundlesSet objectForKey:v6];
  if (!v8)
  {
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002F8F8();
    }
  }
  v7[2](v7, v8);
}

- (id)getBundlesSetForDirStatID:(id)a3
{
  return [(NSMutableDictionary *)self->_dirstatIDToBundlesSet objectForKey:a3];
}

- (void)insertDirStatID:(unint64_t)a3 forBundlesSet:(id)a4
{
  id v9 = a4;
  id v6 = self->_dirstatIDToBundlesSet;
  objc_sync_enter(v6);
  dirstatIDToBundlesSet = self->_dirstatIDToBundlesSet;
  objc_super v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)dirstatIDToBundlesSet setObject:v9 forKey:v8];

  objc_sync_exit(v6);
}

- (id)getBundlesSetForPath:(id)a3
{
  v4 = [(SAPathList *)self findAncestorOfPath:a3];
  if (v4)
  {
    pathToBundlesSet = self->_pathToBundlesSet;
    id v6 = +[NSURL fileURLWithPath:v4 isDirectory:1];
    v7 = [(NSMutableDictionary *)pathToBundlesSet objectForKey:v6];

    if (v7) {
      goto LABEL_7;
    }
    objc_super v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002F960();
    }
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (SATrie)pathsTrie
{
  pathsTrie = self->_pathsTrie;
  if (!pathsTrie)
  {
    v4 = (SATrie *)objc_opt_new();
    uint64_t v5 = self->_pathsTrie;
    self->_pathsTrie = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_pathToBundlesSet;
    id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = self->_pathsTrie;
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v10), "path", (void)v15);
          [(SATrie *)v11 insertPath:v12];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    pathsTrie = self->_pathsTrie;
  }
  v13 = pathsTrie;
  return v13;
}

- (id)findAncestorOfPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAPathList *)self pathsTrie];
  id v6 = [v5 getAncestorOfPath:v4];

  return v6;
}

- (void)filterOverlappingPaths
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc_init(SATrie);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v14 = self;
  uint64_t v5 = self->_pathToBundlesSet;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        v12 = [v10 path];
        if ([(SATrie *)v4 isOverlapping:v12])
        {
          v13 = SALog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Found overlapping URL (%@)", buf, 0xCu);
          }

          [v3 addObject:v10];
        }
        else
        {
          [(SATrie *)v4 insertPath:v12];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)v14->_pathToBundlesSet removeObjectsForKeys:v3];
}

- (void)updateWithAppPathList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v6 = [v4 appPathList];
  id v7 = [v6 allKeys];

  id obj = v7;
  id v45 = [v7 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v45)
  {
    uint64_t v8 = *(void *)v61;
    uint64_t v42 = *(void *)v61;
    id v43 = v4;
    do
    {
      for (id i = 0; i != v45; id i = v16 + 1)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(obj);
        }
        v47 = (char *)i;
        uint64_t v10 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        v11 = [v4 appPathList];
        v12 = [v11 objectForKey:v10];

        v13 = [v12 identifier];
        v50 = +[NSSet setWithObject:v13];
        v51 = v13;
        v48 = v12;
        if ([v12 isGroup])
        {
          v14 = [v12 bundleRecords];
          id v15 = [v14 count];

          long long v17 = v46;
          long long v16 = v47;
          if (v15) {
            goto LABEL_40;
          }
          long long v18 = SALog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = [v48 dataContainerURL];
            v20 = [v48 identifier];
            *(_DWORD *)buf = 138412546;
            v69 = v19;
            __int16 v70 = 2112;
            v71 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Group path %@ for %@ has no associated apps.", buf, 0x16u);

            v13 = v51;
          }
        }
        else
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v21 = [v12 uniqueURLs];
          id v22 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v57;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v57 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
                v28 = [v26 path];
                v29 = [v5 objectForKeyedSubscript:v28];

                if (v29)
                {
                  v30 = SALog();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                    sub_10002FA24((uint64_t)v66, (uint64_t)v26);
                  }
                }
                else
                {
                  [(NSMutableDictionary *)self->_pathToBundlesSet setObject:v50 forKey:v26];
                  v30 = [v26 path];
                  [v5 setValue:&off_10004FDA8 forKey:v30];
                }
                v13 = v51;
              }
              id v23 = [v21 countByEnumeratingWithState:&v56 objects:v67 count:16];
            }
            while (v23);
          }

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v18 = [v48 sharedURLs];
          id v31 = [v18 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v53;
            uint64_t v49 = *(void *)v53;
            do
            {
              for (k = 0; k != v32; k = (char *)k + 1)
              {
                if (*(void *)v53 != v33) {
                  objc_enumerationMutation(v18);
                }
                v35 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
                v37 = [v35 path];
                v38 = [v5 objectForKeyedSubscript:v37];

                if (v38)
                {
                  v39 = SALog();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    sub_10002F9C8((uint64_t)v64, (uint64_t)v35);
                  }
                }
                else
                {
                  v40 = [(NSMutableDictionary *)self->_pathToBundlesSet objectForKey:v35];
                  v39 = v40;
                  if (v40)
                  {
                    if (([v40 containsObject:v51] & 1) == 0)
                    {
                      id v41 = [v39 mutableCopy];
                      [v41 addObject:v51];
                      [(NSMutableDictionary *)self->_pathToBundlesSet setObject:v41 forKey:v35];
                    }
                    uint64_t v33 = v49;
                  }
                  else
                  {
                    [(NSMutableDictionary *)self->_pathToBundlesSet setObject:v50 forKey:v35];
                  }
                }
              }
              id v32 = [v18 countByEnumeratingWithState:&v52 objects:v65 count:16];
            }
            while (v32);
            uint64_t v8 = v42;
            id v4 = v43;
            long long v17 = v46;
            long long v16 = v47;
            v13 = v51;
          }
          else
          {
            uint64_t v8 = v42;
            id v4 = v43;
            long long v17 = v46;
            long long v16 = v47;
          }
        }

LABEL_40:
      }
      id v45 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v45);
  }

  [(SAPathList *)self filterOverlappingPaths];
}

- (id)generateDictionary
{
  id v16 = (id)objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_pathToBundlesSet;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v5;
      v11 = v6;
      v12 = v7;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        id v7 = [(NSMutableDictionary *)self->_pathToBundlesSet objectForKeyedSubscript:v13];

        id v6 = [v13 path];

        uint64_t v5 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"bundles", v6, @"path", 0];

        [v16 addObject:v5];
        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v5;
        v11 = v6;
        v12 = v7;
      }
      while (v4 != v9);
      id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  return v16;
}

- (void)print
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_pathToBundlesSet;
  id v3 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        NSLog(@"url is %@", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addPaths:(id)a3 ToBundleSets:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EDC8;
  v6[3] = &unk_10004CA78;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [a3 enumerateObjectsUsingBlock:v6];
}

- (NSMutableDictionary)pathToBundlesSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)dirstatIDToBundlesSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirstatIDToBundlesSet, 0);
  objc_storeStrong((id *)&self->_pathToBundlesSet, 0);
  objc_storeStrong((id *)&self->_pathsTrie, 0);
}

@end