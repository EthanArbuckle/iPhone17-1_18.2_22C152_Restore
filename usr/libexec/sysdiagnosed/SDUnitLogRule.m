@interface SDUnitLogRule
- (BOOL)canAddToCandidateList;
- (BOOL)considerURL:(id)a3 forRejection:(unint64_t *)a4;
- (BOOL)pipelineFlush;
- (BOOL)resolveHomeDirs;
- (NSArray)offsets;
- (NSArray)sizes;
- (NSDate)createdSince;
- (NSDate)createdUntil;
- (NSMutableArray)logArray;
- (NSMutableArray)logDates;
- (NSMutableArray)matchEnumerator;
- (NSPredicate)filter;
- (NSString)headDir;
- (NSString)mobileContainer;
- (NSString)relative;
- (SDUnitLogRule)initWithDate:(id)a3 withFilter:(id)a4 newestFileCount:(unint64_t)a5 atInternalDirectory:(id)a6 withRuntimeChecks:(unint64_t)a7;
- (id)_localUserHomeDirectories;
- (id)advanceMatchEnumerator;
- (id)applyFilters;
- (id)getNextMatch;
- (id)resolveCrashReporterPath:(id)a3;
- (id)resolvePathToMobileContainer:(id)a3;
- (unint64_t)maxDepth;
- (unint64_t)mobileContainerClass;
- (unint64_t)newestFileLimit;
- (void)_getNextVariedSet:(id)a3 withLogs:(id)a4;
- (void)addPathsToArray:(id)a3 withHighPriority:(id)a4 withMaxVariety:(BOOL)a5;
- (void)generateMaxVariety:(id)a3 withLogs:(id)a4 withHighPriority:(id)a5;
- (void)resolvePaths;
- (void)setCreatedSince:(id)a3;
- (void)setCreatedUntil:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHeadDir:(id)a3;
- (void)setLogArray:(id)a3;
- (void)setLogDates:(id)a3;
- (void)setMatchEnumerator:(id)a3;
- (void)setMaxDepth:(unint64_t)a3;
- (void)setMobileContainer:(id)a3;
- (void)setMobileContainerClass:(unint64_t)a3;
- (void)setNewestFileLimit:(unint64_t)a3;
- (void)setOffsets:(id)a3;
- (void)setPipelineFlush:(BOOL)a3;
- (void)setRelative:(id)a3;
- (void)setResolveHomeDirs:(BOOL)a3;
- (void)setSizes:(id)a3;
@end

@implementation SDUnitLogRule

- (SDUnitLogRule)initWithDate:(id)a3 withFilter:(id)a4 newestFileCount:(unint64_t)a5 atInternalDirectory:(id)a6 withRuntimeChecks:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (__CFString *)a6;
  v21.receiver = self;
  v21.super_class = (Class)SDUnitLogRule;
  v15 = [(SDUnitLogRule *)&v21 init];
  v16 = v15;
  if (v15)
  {
    [(SDUnitLogRule *)v15 setCreatedSince:v12];
    [(SDUnitLogRule *)v16 setFilter:v13];
    [(SDUnitLogRule *)v16 setNewestFileLimit:a5];
    v17 = +[NSMutableArray arrayWithCapacity:a5];
    [(SDUnitLogRule *)v16 setLogArray:v17];

    v18 = +[NSMutableArray arrayWithCapacity:a5];
    [(SDUnitLogRule *)v16 setLogDates:v18];

    if (v14) {
      CFStringRef v19 = v14;
    }
    else {
      CFStringRef v19 = @".";
    }
    [(SDUnitLogRule *)v16 setRelative:v19];
    [(SDUnitLogRule *)v16 setMaxDepth:1024];
    [(SDUnit *)v16 setRuntimeChecks:a7];
    [(SDUnitLogRule *)v16 setMobileContainerClass:0];
    [(SDUnitLogRule *)v16 setMobileContainer:0];
    [(SDUnitLogRule *)v16 setMatchEnumerator:0];
    [(SDUnitLogRule *)v16 setHeadDir:@"."];
    [(SDUnitLogRule *)v16 setResolveHomeDirs:1];
    [(SDUnitLogRule *)v16 setPipelineFlush:0];
    [(SDUnitLogRule *)v16 setOffsets:0];
    [(SDUnitLogRule *)v16 setSizes:0];
  }

  return v16;
}

- (id)getNextMatch
{
  return 0;
}

- (id)advanceMatchEnumerator
{
  v3 = [(SDUnitLogRule *)self matchEnumerator];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = v5;
      v8 = [(SDUnitLogRule *)self matchEnumerator];
      v5 = [v8 firstObject];

      v9 = [v5 getNextMatch];
      if (v9) {
        break;
      }
      v10 = [(SDUnitLogRule *)self matchEnumerator];
      [v10 removeObjectAtIndex:0];

      v11 = [(SDUnitLogRule *)self matchEnumerator];
      id v12 = [v11 count];

      if (!v12)
      {
        id v13 = 0;
        goto LABEL_8;
      }
    }
    id v13 = v9;

    v5 = v13;
LABEL_8:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)considerURL:(id)a3 forRejection:(unint64_t *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6 || ([v6 path], v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    BOOL v12 = 0;
    unint64_t v13 = 1;
    goto LABEL_6;
  }
  v9 = [(SDUnitLogRule *)self logArray];
  v10 = [v7 path];
  unsigned int v11 = [v9 containsObject:v10];

  if (!v11)
  {
    v15 = +[NSFileManager defaultManager];
    v16 = [v7 path];
    int v17 = [v15 fileExistsAtPath:v16];

    if ((v17 & 1) == 0)
    {
      v42 = sub_10002820C();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [v7 lastPathComponent];
        *(_DWORD *)buf = 138412290;
        v67 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@ failed due to file not found", buf, 0xCu);
      }
      v44 = +[SDResourceManager sharedResourceManager];
      v45 = [v7 lastPathComponent];
      [v44 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed due to file not found", v45 category msg];

      BOOL v12 = 0;
      unint64_t v13 = 10;
      goto LABEL_6;
    }
    id v65 = 0;
    id v64 = 0;
    unsigned int v18 = [v7 getResourceValue:&v65 forKey:NSURLCreationDateKey error:&v64];
    id v19 = v65;
    id v20 = v64;
    if (!v18 || !v19)
    {
      v46 = sub_10002820C();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [v7 lastPathComponent];
        v48 = [v20 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v67 = v47;
        __int16 v68 = 2112;
        *(void *)v69 = v48;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ failed to get date with error %@", buf, 0x16u);
      }
      v49 = +[SDResourceManager sharedResourceManager];
      v50 = [v7 lastPathComponent];
      v51 = [v20 localizedDescription];
      [v49 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed to get date with error %@", v50, v51 category msg];

      BOOL v12 = 0;
      *a4 = 5;
      goto LABEL_36;
    }
    objc_super v21 = [(SDUnitLogRule *)self createdSince];

    if (v21
      && ([(SDUnitLogRule *)self createdSince],
          v22 = objc_claimAutoreleasedReturnValue(),
          [v19 earlierDate:v22],
          id v23 = (id)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v23 == v19))
    {
      *a4 = 6;
      v52 = sub_10002820C();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      v53 = [v7 lastPathComponent];
      [v19 timeIntervalSince1970];
      int v55 = (int)v54;
      v56 = [(SDUnitLogRule *)self createdSince];
      [v56 timeIntervalSince1970];
      *(_DWORD *)buf = 138412802;
      v67 = v53;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = v55;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = (int)v57;
      v58 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }
    else
    {
      v24 = [(SDUnitLogRule *)self createdUntil];

      if (!v24
        || ([(SDUnitLogRule *)self createdUntil],
            v25 = objc_claimAutoreleasedReturnValue(),
            [v19 laterDate:v25],
            id v26 = (id)objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            v26 != v19))
      {
        v27 = [(SDUnitLogRule *)self filter];

        if (!v27
          || ([(SDUnitLogRule *)self filter],
              v28 = objc_claimAutoreleasedReturnValue(),
              [v7 path],
              v29 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v30 = [v28 evaluateWithObject:v29],
              v29,
              v28,
              (v30 & 1) != 0))
        {
          v31 = [(SDUnitLogRule *)self logArray];
          id v32 = [v31 count];

          unint64_t v33 = 0;
          if (v32)
          {
            do
            {
              v34 = [(SDUnitLogRule *)self logDates];
              v35 = [v34 objectAtIndexedSubscript:v33];
              id v36 = [v35 laterDate:v19];

              if (v36 == v19) {
                break;
              }
              ++v33;
              v37 = [(SDUnitLogRule *)self logArray];
              id v38 = [v37 count];
            }
            while ((unint64_t)v38 > v33);
          }
          v39 = [(SDUnitLogRule *)self logArray];
          v40 = [v7 path];
          [v39 insertObject:v40 atIndex:v33];

          v41 = [(SDUnitLogRule *)self logDates];
          [v41 insertObject:v19 atIndex:v33];

          BOOL v12 = 1;
          goto LABEL_36;
        }
        *a4 = 8;
        v52 = sub_10002820C();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v7 lastPathComponent];
          v56 = [(SDUnitLogRule *)self filter];
          *(_DWORD *)buf = 138412546;
          v67 = v53;
          __int16 v68 = 2112;
          *(void *)v69 = v56;
          v58 = "%@ failed to pass predicate %@ ";
          v59 = v52;
          uint32_t v60 = 22;
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, v58, buf, v60);
        }
LABEL_35:

        BOOL v12 = 0;
LABEL_36:

        goto LABEL_7;
      }
      *a4 = 6;
      v52 = sub_10002820C();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      v53 = [v7 lastPathComponent];
      [v19 timeIntervalSince1970];
      int v62 = (int)v61;
      v56 = [(SDUnitLogRule *)self createdUntil];
      [v56 timeIntervalSince1970];
      *(_DWORD *)buf = 138412802;
      v67 = v53;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = v62;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = (int)v63;
      v58 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }
    v59 = v52;
    uint32_t v60 = 24;
    goto LABEL_34;
  }
  BOOL v12 = 0;
  unint64_t v13 = 9;
LABEL_6:
  *a4 = v13;
LABEL_7:

  return v12;
}

- (id)applyFilters
{
  v3 = +[NSMutableArray array];
  if ([(SDUnitLogRule *)self newestFileLimit])
  {
    id v4 = [(SDUnitLogRule *)self logArray];
    id v5 = [v4 count];
    unint64_t v6 = [(SDUnitLogRule *)self newestFileLimit];

    if ((unint64_t)v5 > v6)
    {
      unint64_t v8 = [(SDUnitLogRule *)self logArray];
      unsigned int v7 = [(id)v8 count];

      LODWORD(v8) = v7 - 1;
      if ([(SDUnitLogRule *)self newestFileLimit] <= (int)(v7 - 1))
      {
        unint64_t v8 = (int)v8;
        do
        {
          v9 = [(SDUnitLogRule *)self logArray];
          v10 = [v9 objectAtIndexedSubscript:v8];

          unsigned int v11 = [(SDUnitLogRule *)self logArray];
          [v11 removeLastObject];

          BOOL v12 = [(SDUnitLogRule *)self logDates];
          [v12 removeLastObject];

          [v3 addObject:v10];
          --v8;
        }
        while ([(SDUnitLogRule *)self newestFileLimit] <= v8);
      }
    }
  }

  return v3;
}

- (void)_getNextVariedSet:(id)a3 withLogs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = [v5 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v5 objectForKey:v13];
        v15 = [v14 lastObject];
        [v7 addObject:v15];

        [v14 removeLastObject];
        if (![v14 count]) {
          [v5 removeObjectForKey:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v16 = [v7 sortedArrayUsingSelector:"compareLogDateDescending:"];
  [v6 addObjectsFromArray:v16];
}

- (void)generateMaxVariety:(id)a3 withLogs:(id)a4 withHighPriority:(id)a5
{
  id v7 = a3;
  id v42 = a4;
  id v41 = a5;
  id v54 = 0;
  uint64_t v8 = +[NSRegularExpression regularExpressionWithPattern:@"[.]synced$" options:1 error:&v54];
  id v9 = v54;
  v47 = (void *)v8;
  if (!v8)
  {
    id v10 = sub_10002820C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      double v57 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::syncedRegex with error: %@", buf, 0xCu);
    }
    BOOL v12 = +[SDResourceManager sharedResourceManager];
    uint64_t v13 = [v9 localizedDescription];
    [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::syncedRegex with error: %@", v13 category msg];

    id v9 = 0;
  }
  id v53 = v9;
  uint64_t v14 = +[NSRegularExpression regularExpressionWithPattern:@"[.][0-9]{3}[.]ips" options:1 error:&v53];
  id v15 = v53;

  v46 = (void *)v14;
  if (!v14)
  {
    v16 = sub_10002820C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412290;
      double v57 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::stackTripleRegex with error: %@", buf, 0xCu);
    }
    long long v18 = +[SDResourceManager sharedResourceManager];
    long long v19 = [v15 localizedDescription];
    [v18 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::stackTripleRegex with error: %@", v19 category msg];

    id v15 = 0;
  }
  id v52 = v15;
  uint64_t v20 = +[NSRegularExpression regularExpressionWithPattern:@"([0-9]{4}(-|_)[0-9]{2}(-|_)[0-9]{2}(-|_)([0-9]{6}|[0-9]{2}(-|_)[0-9]{2}(-|_)[0-9]{2}))" options:1 error:&v52];
  id v21 = v52;

  v45 = (void *)v20;
  if (!v20)
  {
    v22 = sub_10002820C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v21 localizedDescription];
      *(_DWORD *)buf = 138412290;
      double v57 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::regex with error: %@", buf, 0xCu);
    }
    v24 = +[SDResourceManager sharedResourceManager];
    v25 = [v21 localizedDescription];
    [v24 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to compile generateMaxVariety::regex with error: %@", v25 category msg];

    id v21 = 0;
  }
  v39 = v21;
  id v26 = +[NSMutableDictionary dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v43 = v7;
  id obj = [v7 reverseObjectEnumerator];
  id v27 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v49;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        unint64_t v33 = [v31 path];
        v34 = [v31 path];
        v35 = [v47 stringByReplacingMatchesInString:v33 options:0 range:[v34 length] withTemplate:&stru_1000A1EA8];

        id v36 = [v46 stringByReplacingMatchesInString:v35 options:0 range:[v35 length] withTemplate:@".ips"];

        v37 = [v45 stringByReplacingMatchesInString:v36 options:0 range:[v36 length] withTemplate:&stru_1000A1EA8];

        if (v37)
        {
          id v38 = [v26 objectForKey:v37];
          if (v38
            || (+[NSMutableArray array],
                id v38 = objc_claimAutoreleasedReturnValue(),
                [v26 setObject:v38 forKey:v37],
                v38))
          {
            [v38 addObject:v31];
          }
        }
      }
      id v28 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v28);
  }

  [(SDUnitLogRule *)self _getNextVariedSet:v26 withLogs:v41];
  while ([v26 count])
    [(SDUnitLogRule *)self _getNextVariedSet:v26 withLogs:v42];
}

- (void)addPathsToArray:(id)a3 withHighPriority:(id)a4 withMaxVariety:(BOOL)a5
{
  BOOL v5 = a5;
  id v41 = a3;
  id v8 = a4;
  id v9 = +[NSMutableArray array];
  id v10 = [(SDUnitLogRule *)self headDir];
  uint64_t v11 = +[NSURL fileURLWithPath:v10];
  BOOL v12 = [v11 standardizedURL];
  id v42 = [v12 path];

  uint64_t v13 = [(SDUnitLogRule *)self logArray];
  id v14 = [v13 count];

  if (v14)
  {
    BOOL v39 = v5;
    v43 = v9;
    id v40 = v8;
    unint64_t v15 = 0;
    v16 = 0;
    long long v17 = 0;
    long long v18 = 0;
    long long v19 = 0;
    do
    {
      uint64_t v20 = v16;
      v22 = [(SDUnitLogRule *)self logArray];
      id v23 = [v22 objectAtIndexedSubscript:v15];
      v16 = [v23 stringByDeletingLastPathComponent];

      v24 = [(SDUnitLogRule *)self headDir];
      LODWORD(v23) = [v24 isEqualToString:@"."];

      if (v23)
      {
        [(SDUnitLogRule *)self headDir];
        long long v19 = v25 = v19;
      }
      else
      {
        v25 = [v16 componentsSeparatedByString:v42];
        uint64_t v26 = [v25 lastObject];

        long long v19 = (void *)v26;
      }

      id v27 = [(SDUnitLogRule *)self relative];
      id v28 = [v27 stringByAppendingPathComponent:v19];

      uint64_t v29 = [SDLog alloc];
      unsigned __int8 v30 = [(SDUnitLogRule *)self logArray];
      v31 = [v30 objectAtIndexedSubscript:v15];
      id v32 = [(SDLog *)v29 initWithPath:v31 subdirectory:v28 error:0];

      if (v32)
      {
        unint64_t v33 = [(SDUnitLogRule *)self offsets];
        [(SDLog *)v32 setOffsets:v33];

        v34 = [(SDUnitLogRule *)self sizes];
        [(SDLog *)v32 setSizes:v34];

        [v43 addObject:v32];
      }
      ++v15;
      v35 = [(SDUnitLogRule *)self logArray];
      id v36 = [v35 count];

      long long v17 = v32;
      long long v18 = v28;
    }
    while ((unint64_t)v36 > v15);

    id v8 = v40;
    id v9 = v43;
    BOOL v5 = v39;
  }
  v37 = [(SDUnitLogRule *)self logArray];
  [v37 removeAllObjects];

  id v38 = [(SDUnitLogRule *)self logDates];
  [v38 removeAllObjects];

  if (v5) {
    [(SDUnitLogRule *)self generateMaxVariety:v9 withLogs:v41 withHighPriority:v8];
  }
  else {
    [v41 addObjectsFromArray:v9];
  }
}

- (id)_localUserHomeDirectories
{
  v2 = +[NSMutableArray array];
  if (sub_10002808C())
  {
    v3 = +[NSFileManager defaultManager];
    id v4 = +[NSURL fileURLWithPath:@"/private/var/Users" isDirectory:1];
    BOOL v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:7 errorHandler:&stru_10009D0D8];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          [v2 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = +[NSURL fileURLWithPath:@"/private/var/mobile/" isDirectory:1];
    [v2 addObject:v6];
  }

  return v2;
}

- (id)resolvePathToMobileContainer:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"~"]
    && ([v4 hasPrefix:@"~~"] & 1) == 0)
  {
    sub_100024DA8();
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      id v10 = [v4 stringByReplacingOccurrencesOfString:@"~" withString:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SDUnitLogRule *)self setHeadDir:v10];
      }
    }
    else
    {
      id v10 = [v4 stringByReplacingOccurrencesOfString:@"~" withString:@"/private/var/root"];
      long long v16 = sub_10002820C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v19 = (unint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ cannot be resolved to user home directory. Setting to root home directory.", buf, 0xCu);
      }

      long long v17 = +[SDResourceManager sharedResourceManager];
      [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ cannot be resolved to user home directory. Setting to root home directory.", v4 category msg];
    }
  }
  else
  {
    if ([(SDUnitLogRule *)self mobileContainerClass]
      && ([(SDUnitLogRule *)self mobileContainer],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      unint64_t v6 = [(SDUnitLogRule *)self mobileContainerClass];
      if (v6 == 2)
      {
        id v7 = [(SDUnitLogRule *)self mobileContainer];
        [v7 UTF8String];
        uint64_t v8 = container_create_or_lookup_path_for_current_user();
      }
      else if (v6 == 1)
      {
        id v7 = [(SDUnitLogRule *)self mobileContainer];
        [v7 UTF8String];
        uint64_t v8 = container_system_group_path_for_identifier();
      }
      else
      {
        id v7 = [(SDUnitLogRule *)self mobileContainer];
        [v7 UTF8String];
        uint64_t v8 = container_system_path_for_identifier();
      }
      uint64_t v11 = (void *)v8;

      if (v11)
      {
        BOOL v12 = +[NSURL fileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
        uint64_t v9 = [v12 path];

        free(v11);
      }
      else
      {
        if ((id)[(SDUnitLogRule *)self mobileContainerClass] == (id)2) {
          uint64_t v9 = @"/private/var/mobile/";
        }
        else {
          uint64_t v9 = @"/DUMMY/";
        }
        uint64_t v13 = sub_10002820C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v19 = [(SDUnitLogRule *)self mobileContainerClass];
          __int16 v20 = 2048;
          uint64_t v21 = 1;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error finding container of type %lu with error %llu, setting to bogus path.", buf, 0x16u);
        }

        long long v14 = +[SDResourceManager sharedResourceManager];
        [v14 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error finding container of type %lu with error %llu, setting to bogus path.", -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass"), 1 category msg];
      }
    }
    else
    {
      uint64_t v9 = @"/";
    }
    id v10 = [(__CFString *)v9 stringByAppendingPathComponent:v4];
  }

  return v10;
}

- (BOOL)canAddToCandidateList
{
  v3 = [(SDUnitLogRule *)self logArray];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 0x3E8)
  {
    BOOL v5 = sub_10002820C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Hit candidate limit -- flushing the log collection pipeline", v8, 2u);
    }

    unint64_t v6 = +[SDResourceManager sharedResourceManager];
    [v6 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Hit candidate limit -- flushing the log collection pipeline"];

    [(SDUnitLogRule *)self setPipelineFlush:1];
  }
  return (unint64_t)v4 < 0x3E8;
}

- (id)resolveCrashReporterPath:(id)a3
{
  id v3 = a3;
  if (sub_10002808C())
  {
    id v4 = [v3 length];
    BOOL v5 = +[OSASystemConfiguration sharedInstance];
    unint64_t v6 = [v5 pathSubmission];

    uint64_t v7 = [v3 stringByReplacingOccurrencesOfString:@"/private/var/mobile/Library/Logs/CrashReporter" withString:v6 options:9 range:v4];

    id v3 = (id)v7;
  }

  return v3;
}

- (void)resolvePaths
{
}

- (NSDate)createdSince
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCreatedSince:(id)a3
{
}

- (NSDate)createdUntil
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreatedUntil:(id)a3
{
}

- (NSPredicate)filter
{
  return (NSPredicate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilter:(id)a3
{
}

- (unint64_t)newestFileLimit
{
  return self->_newestFileLimit;
}

- (void)setNewestFileLimit:(unint64_t)a3
{
  self->_newestFileLimit = a3;
}

- (NSString)relative
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRelative:(id)a3
{
}

- (NSString)headDir
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeadDir:(id)a3
{
}

- (unint64_t)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(unint64_t)a3
{
  self->_maxDepth = a3;
}

- (unint64_t)mobileContainerClass
{
  return self->_mobileContainerClass;
}

- (void)setMobileContainerClass:(unint64_t)a3
{
  self->_mobileContainerClass = a3;
}

- (NSString)mobileContainer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMobileContainer:(id)a3
{
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (BOOL)pipelineFlush
{
  return self->_pipelineFlush;
}

- (void)setPipelineFlush:(BOOL)a3
{
  self->_pipelineFlush = a3;
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
}

- (NSArray)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
}

- (NSMutableArray)matchEnumerator
{
  return self->_matchEnumerator;
}

- (void)setMatchEnumerator:(id)a3
{
}

- (NSMutableArray)logArray
{
  return self->_logArray;
}

- (void)setLogArray:(id)a3
{
}

- (NSMutableArray)logDates
{
  return self->_logDates;
}

- (void)setLogDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDates, 0);
  objc_storeStrong((id *)&self->_logArray, 0);
  objc_storeStrong((id *)&self->_matchEnumerator, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_mobileContainer, 0);
  objc_storeStrong((id *)&self->_headDir, 0);
  objc_storeStrong((id *)&self->_relative, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_createdUntil, 0);

  objc_storeStrong((id *)&self->_createdSince, 0);
}

@end