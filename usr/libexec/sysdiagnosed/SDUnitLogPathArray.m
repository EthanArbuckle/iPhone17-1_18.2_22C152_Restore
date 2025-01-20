@interface SDUnitLogPathArray
+ (id)logRuleWithMutablePaths:(id)a3;
+ (id)logRuleWithPaths:(id)a3;
+ (id)logRuleWithPaths:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8;
- (NSMutableArray)paths;
- (id)description;
- (id)getNextMatch;
- (void)expandHomeDirectoriesAtPath:(id)a3 andAddToURLArray:(id)a4;
- (void)resolvePaths;
- (void)setPaths:(id)a3;
@end

@implementation SDUnitLogPathArray

+ (id)logRuleWithPaths:(id)a3
{
  id v3 = a3;
  v4 = [(SDUnitLogRule *)[SDUnitLogPathArray alloc] initWithDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
  if (v4)
  {
    id v5 = [v3 mutableCopy];
    [(SDUnitLogPathArray *)v4 setPaths:v5];
  }

  return v4;
}

+ (id)logRuleWithMutablePaths:(id)a3
{
  id v3 = a3;
  v4 = [(SDUnitLogRule *)[SDUnitLogPathArray alloc] initWithDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
  id v5 = v4;
  if (v4) {
    [(SDUnitLogPathArray *)v4 setPaths:v3];
  }

  return v5;
}

+ (id)logRuleWithPaths:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v17 = [(SDUnitLogRule *)[SDUnitLogPathArray alloc] initWithDate:v16 withFilter:v15 newestFileCount:a6 atInternalDirectory:v14 withRuntimeChecks:a8];

  if (v17)
  {
    id v18 = [v13 mutableCopy];
    [(SDUnitLogPathArray *)v17 setPaths:v18];
  }

  return v17;
}

- (void)expandHomeDirectoriesAtPath:(id)a3 andAddToURLArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SDUnitLogRule *)self resolveHomeDirs]) {
    goto LABEL_13;
  }
  v8 = [&off_1000B03F8 objectAtIndexedSubscript:0];
  if (![v6 hasPrefix:v8])
  {
    v9 = [&off_1000B03F8 objectAtIndexedSubscript:1];
    unsigned int v10 = [v6 hasPrefix:v9];

    if (v10) {
      goto LABEL_5;
    }
LABEL_13:
    v22 = [(SDUnitLogRule *)self resolvePathToMobileContainer:v6];
    v23 = +[NSURL fileURLWithPath:v22];
    [v7 addObject:v23];

    goto LABEL_14;
  }

LABEL_5:
  v11 = [&off_1000B03F8 objectAtIndexedSubscript:0];
  v12 = [&off_1000B03F8 objectAtIndexedSubscript:objc_msgSend(v6, "hasPrefix:", v11) ^ 1];

  [(SDUnitLogRule *)self setHeadDir:@"."];
  id v24 = v6;
  id v13 = [v6 stringByReplacingOccurrencesOfString:v12 withString:&stru_1000A1EA8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = [(SDUnitLogRule *)self _localUserHomeDirectories];
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) path];
        v20 = [v19 stringByAppendingPathComponent:v13];
        v21 = +[NSURL fileURLWithPath:v20];
        [v7 addObject:v21];
      }
      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  id v6 = v24;
LABEL_14:
}

- (id)getNextMatch
{
  id v3 = [(SDUnitLogRule *)self matchEnumerator];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    [(SDUnitLogRule *)self setMatchEnumerator:v4];

    id v5 = +[NSMutableArray array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = [(SDUnitLogPathArray *)self paths];
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          [(SDUnitLogPathArray *)self expandHomeDirectoriesAtPath:*(void *)(*((void *)&v25 + 1) + 8 * i) andAddToURLArray:v5];
        }
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        id v16 = 0;
        uint64_t v17 = v14;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          id v14 = +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v16), 1, (void)v21);

          id v18 = [(SDUnitLogRule *)self matchEnumerator];
          [v18 addObject:v14];

          id v16 = (char *)v16 + 1;
          uint64_t v17 = v14;
        }
        while (v13 != v16);
        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v13);
    }
  }
  v19 = [(SDUnitLogRule *)self advanceMatchEnumerator];

  return v19;
}

- (id)description
{
  v2 = [(SDUnitLogPathArray *)self paths];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SDUnitLogPathArray with %lu paths", [v2 count]);

  return v3;
}

- (void)resolvePaths
{
  id v3 = [(SDUnitLogPathArray *)self paths];
  id v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(SDUnitLogPathArray *)self paths];
      id v7 = [v6 objectAtIndexedSubscript:v5];
      id v8 = [(SDUnitLogRule *)self resolveCrashReporterPath:v7];
      uint64_t v9 = [(SDUnitLogPathArray *)self paths];
      [v9 setObject:v8 atIndexedSubscript:v5];

      ++v5;
      unsigned int v10 = [(SDUnitLogPathArray *)self paths];
      id v11 = [v10 count];
    }
    while ((unint64_t)v11 > v5);
  }
}

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end