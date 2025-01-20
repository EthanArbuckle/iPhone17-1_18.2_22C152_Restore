@interface SDUnitLogGlob
+ (id)logRuleWithGlob:(id)a3;
+ (id)logRuleWithGlob:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8;
- (NSString)glob;
- (id)description;
- (id)getNextMatch;
- (void)addGlobContents:(id)a3 toURLArray:(id)a4;
- (void)expandHomeDirectoriesForGlob:(id)a3 andAddToURLArray:(id)a4;
- (void)resolvePaths;
- (void)setGlob:(id)a3;
@end

@implementation SDUnitLogGlob

+ (id)logRuleWithGlob:(id)a3
{
  id v3 = a3;
  v4 = [(SDUnitLogRule *)[SDUnitLogGlob alloc] initWithDate:0 withFilter:0 newestFileCount:0 atInternalDirectory:0 withRuntimeChecks:0];
  v5 = v4;
  if (v4) {
    [(SDUnitLogGlob *)v4 setGlob:v3];
  }

  return v5;
}

+ (id)logRuleWithGlob:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v17 = [(SDUnitLogRule *)[SDUnitLogGlob alloc] initWithDate:v16 withFilter:v15 newestFileCount:a6 atInternalDirectory:v14 withRuntimeChecks:a8];

  if (v17) {
    [(SDUnitLogGlob *)v17 setGlob:v13];
  }

  return v17;
}

- (void)addGlobContents:(id)a3 toURLArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(&v15, 0, sizeof(v15));
  v15.gl_matchc = 1000;
  v7 = sub_10002820C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = [v5 fileSystemRepresentation];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Querying glob %s", buf, 0xCu);
  }

  v8 = +[SDResourceManager sharedResourceManager];
  id v9 = v5;
  [v8 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Querying glob %s" :objc_msgSend(v9, "fileSystemRepresentation")];

  id v10 = v9;
  glob_b((const char *)[v10 fileSystemRepresentation], 4264, &stru_10009D118, &v15);
  if (v15.gl_pathc)
  {
    size_t v11 = 0;
    do
    {
      id v13 = v15.gl_pathv[v11];
      if (v13)
      {
        id v14 = +[NSURL fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
        if (v14) {
          [v6 addObject:v14];
        }
      }
      ++v11;
    }
    while (v15.gl_pathc > v11);
  }
  globfree(&v15);
}

- (void)expandHomeDirectoriesForGlob:(id)a3 andAddToURLArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SDUnitLogRule *)self resolveHomeDirs]) {
    goto LABEL_13;
  }
  v8 = [&off_1000B0410 objectAtIndexedSubscript:0];
  if (![v6 hasPrefix:v8])
  {
    id v9 = [&off_1000B0410 objectAtIndexedSubscript:1];
    unsigned int v10 = [v6 hasPrefix:v9];

    if (v10) {
      goto LABEL_5;
    }
LABEL_13:
    v21 = [(SDUnitLogGlob *)self glob];
    v22 = [(SDUnitLogRule *)self resolvePathToMobileContainer:v21];

    [(SDUnitLogGlob *)self addGlobContents:v22 toURLArray:v7];
    goto LABEL_14;
  }

LABEL_5:
  size_t v11 = [&off_1000B0410 objectAtIndexedSubscript:0];
  uint64_t v12 = [&off_1000B0410 objectAtIndexedSubscript:objc_msgSend(v6, "hasPrefix:", v11) ^ 1];

  [(SDUnitLogRule *)self setHeadDir:@"."];
  v23 = (void *)v12;
  id v13 = [v6 stringByReplacingOccurrencesOfString:v12 withString:&stru_1000A1EA8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [(SDUnitLogRule *)self _localUserHomeDirectories];
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) path];
        v20 = [v19 stringByAppendingString:v13];
        [(SDUnitLogGlob *)self addGlobContents:v20 toURLArray:v7];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

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
    id v6 = [(SDUnitLogGlob *)self glob];
    [(SDUnitLogGlob *)self expandHomeDirectoriesForGlob:v6 andAddToURLArray:v5];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      unsigned int v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        id v13 = v10;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          unsigned int v10 = +[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v12), 1, (void)v17);

          id v14 = [(SDUnitLogRule *)self matchEnumerator];
          [v14 addObject:v10];

          uint64_t v12 = (char *)v12 + 1;
          id v13 = v10;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  id v15 = [(SDUnitLogRule *)self advanceMatchEnumerator];

  return v15;
}

- (id)description
{
  v2 = [(SDUnitLogGlob *)self glob];
  id v3 = +[NSString stringWithFormat:@"SDUnitLogGlob with glob '%@'", v2];

  return v3;
}

- (void)resolvePaths
{
  id v4 = [(SDUnitLogGlob *)self glob];
  id v3 = [(SDUnitLogRule *)self resolveCrashReporterPath:v4];
  [(SDUnitLogGlob *)self setGlob:v3];
}

- (NSString)glob
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end