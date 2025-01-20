@interface SDUnitLogDirectory
+ (id)logRuleWithDirectory:(id)a3;
+ (id)logRuleWithDirectory:(id)a3 atInternalDirectory:(id)a4;
+ (id)logRuleWithDirectory:(id)a3 withDepth:(unint64_t)a4 withDate:(id)a5 withFilter:(id)a6 newestFileCount:(unint64_t)a7 atInternalDirectory:(id)a8 withRuntimeChecks:(unint64_t)a9;
- (NSString)directory;
- (id)description;
- (id)getNextMatch;
- (void)resolvePaths;
- (void)setDirectory:(id)a3;
@end

@implementation SDUnitLogDirectory

+ (id)logRuleWithDirectory:(id)a3
{
  id v3 = a3;
  v4 = [(SDUnitLogRule *)[SDUnitLogDirectory alloc] initWithDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
  v5 = v4;
  if (v4)
  {
    [(SDUnitLogDirectory *)v4 setDirectory:v3];
    [(SDUnitLogRule *)v5 setHeadDir:v3];
  }

  return v5;
}

+ (id)logRuleWithDirectory:(id)a3 withDepth:(unint64_t)a4 withDate:(id)a5 withFilter:(id)a6 newestFileCount:(unint64_t)a7 atInternalDirectory:(id)a8 withRuntimeChecks:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  v18 = [(SDUnitLogRule *)[SDUnitLogDirectory alloc] initWithDate:v17 withFilter:v16 newestFileCount:a7 atInternalDirectory:v15 withRuntimeChecks:a9];

  if (v18)
  {
    [(SDUnitLogDirectory *)v18 setDirectory:v14];
    [(SDUnitLogRule *)v18 setHeadDir:v14];
    [(SDUnitLogRule *)v18 setMaxDepth:a4];
  }

  return v18;
}

+ (id)logRuleWithDirectory:(id)a3 atInternalDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(SDUnitLogRule *)[SDUnitLogDirectory alloc] initWithDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:v6 withRuntimeChecks:0];

  if (v7)
  {
    [(SDUnitLogDirectory *)v7 setDirectory:v5];
    [(SDUnitLogRule *)v7 setHeadDir:v5];
  }

  return v7;
}

- (id)getNextMatch
{
  v2 = self;
  id v3 = [(SDUnitLogRule *)self matchEnumerator];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    [(SDUnitLogRule *)v2 setMatchEnumerator:v4];

    if ([(SDUnitLogRule *)v2 resolveHomeDirs])
    {
      id v5 = [(SDUnitLogDirectory *)v2 directory];
      id v6 = [&off_1000B0428 objectAtIndexedSubscript:0];
      if ([v5 hasPrefix:v6])
      {

LABEL_6:
        v10 = [(SDUnitLogDirectory *)v2 directory];
        v11 = [&off_1000B0428 objectAtIndexedSubscript:0];
        v12 = [&off_1000B0428 objectAtIndexedSubscript:objc_msgSend(v10, "hasPrefix:", v11) ^ 1];

        [(SDUnitLogRule *)v2 setHeadDir:@"."];
        v13 = [(SDUnitLogDirectory *)v2 directory];
        v37 = [v13 stringByReplacingOccurrencesOfString:v12 withString:&stru_1000A1EA8];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id obj = [(SDUnitLogRule *)v2 _localUserHomeDirectories];
        id v14 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          v35 = v12;
          id v16 = v2;
          id v17 = 0;
          v18 = 0;
          uint64_t v19 = *(void *)v39;
          do
          {
            v20 = 0;
            v21 = v17;
            v22 = v18;
            do
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v20);
              v25 = [v23 path];
              v42[0] = v25;
              v42[1] = v37;
              v26 = +[NSArray arrayWithObjects:v42 count:2];
              id v17 = +[NSURL fileURLWithPathComponents:v26];

              v18 = +[BFSDirectoryEnumerator BFSEnumeratorWithPath:v17 withDepth:[(SDUnitLogRule *)v16 maxDepth]];

              v27 = [(SDUnitLogRule *)v16 matchEnumerator];
              [v27 addObject:v18];

              v20 = (char *)v20 + 1;
              v21 = v17;
              v22 = v18;
            }
            while (v15 != v20);
            id v15 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v15);

          v2 = v16;
          v12 = v35;
        }
        else
        {
          v18 = 0;
        }

        goto LABEL_17;
      }
      v7 = [(SDUnitLogDirectory *)v2 directory];
      v8 = [&off_1000B0428 objectAtIndexedSubscript:1];
      unsigned int v9 = [v7 hasPrefix:v8];

      if (v9) {
        goto LABEL_6;
      }
    }
    v28 = [(SDUnitLogDirectory *)v2 directory];
    v29 = [(SDUnitLogRule *)v2 resolvePathToMobileContainer:v28];

    id v30 = v29;
    v31 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", [v30 fileSystemRepresentation], 1, 0);
    v18 = +[BFSDirectoryEnumerator BFSEnumeratorWithPath:v31 withDepth:[(SDUnitLogRule *)v2 maxDepth]];
    v32 = [(SDUnitLogRule *)v2 matchEnumerator];
    [v32 addObject:v18];

LABEL_17:
  }
  v33 = [(SDUnitLogRule *)v2 advanceMatchEnumerator];

  return v33;
}

- (id)description
{
  v2 = [(SDUnitLogDirectory *)self directory];
  id v3 = +[NSString stringWithFormat:@"SDUnitLogDirectory with directory '%@'", v2];

  return v3;
}

- (void)resolvePaths
{
  id v3 = [(SDUnitLogRule *)self headDir];
  v4 = [(SDUnitLogRule *)self resolveCrashReporterPath:v3];
  [(SDUnitLogRule *)self setHeadDir:v4];

  id v6 = [(SDUnitLogDirectory *)self directory];
  id v5 = [(SDUnitLogRule *)self resolveCrashReporterPath:v6];
  [(SDUnitLogDirectory *)self setDirectory:v5];
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end