@interface SDLogCollectionContainer
+ (SDLogCollectionContainer)containerWithName:(id)a3 destination:(id)a4 withDelegate:(id)a5;
+ (id)rejectionReasonToString:(unint64_t)a3;
- (BOOL)addRules:(id)a3;
- (BOOL)applyRule:(id)a3;
- (BOOL)copyFilesForDirectory:(id)a3 withStreaming:(BOOL)a4;
- (BOOL)enforceContainerSizeLimit;
- (BOOL)execute;
- (BOOL)generateSummary;
- (BOOL)maxVariety;
- (BOOL)prepareSummary;
- (BOOL)resolveHomeDirs;
- (NSMutableArray)highPriorityLogs;
- (NSMutableArray)logs;
- (SDLogCollectionDelegate)delegate;
- (id)enforceSizeOnLogs:(unint64_t)a3;
- (unint64_t)maximumSizeMB;
- (void)applyContainerOverride:(id)a3;
- (void)clearLogs;
- (void)closeSummary;
- (void)logFileToSummary:(id)a3 description:(id)a4;
- (void)rejectFile:(id)a3 forReason:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setGenerateSummary:(BOOL)a3;
- (void)setHighPriorityLogs:(id)a3;
- (void)setLogs:(id)a3;
- (void)setMaxVariety:(BOOL)a3;
- (void)setMaximumSizeMB:(unint64_t)a3;
- (void)setResolveHomeDirs:(BOOL)a3;
- (void)writeToSummary:(id)a3;
@end

@implementation SDLogCollectionContainer

+ (id)rejectionReasonToString:(unint64_t)a3
{
  if (a3 > 0xB) {
    return @"Invalid rejection reason";
  }
  else {
    return *(&off_10009DF78 + a3);
  }
}

+ (SDLogCollectionContainer)containerWithName:(id)a3 destination:(id)a4 withDelegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithName:v10 andDestination:v9 withDelegate:v8];

  if (v11)
  {
    [v11 setMaximumSizeMB:5];
    [v11 setDelegate:v8];
    v12 = +[NSMutableArray array];
    [v11 setHighPriorityLogs:v12];

    v13 = +[NSMutableArray array];
    [v11 setLogs:v13];

    [v11 setGenerateSummary:1];
    [v11 setMaxVariety:0];
    [v11 setRuntimeChecks:0];
    [v11 setResolveHomeDirs:1];
  }

  return (SDLogCollectionContainer *)v11;
}

- (BOOL)addRules:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v10 resolvePaths];
          [v10 setResolveHomeDirs:-[SDLogCollectionContainer resolveHomeDirs](self, "resolveHomeDirs")];
          id v11 = [(SDContainer *)self units];
          [v11 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  return 1;
}

- (void)clearLogs
{
  v3 = [(SDLogCollectionContainer *)self highPriorityLogs];
  [v3 removeAllObjects];

  id v4 = [(SDLogCollectionContainer *)self logs];
  [v4 removeAllObjects];
}

- (BOOL)execute
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(SDContainer *)self executionActivity];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100054800;
  v5[3] = &unk_10009D008;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)logFileToSummary:(id)a3 description:(id)a4
{
  id v5 = +[NSString stringWithFormat:@"%@, %@\n", a3, a4];
  [(SDLogCollectionContainer *)self writeToSummary:v5];
}

- (void)rejectFile:(id)a3 forReason:(unint64_t)a4
{
  id v12 = a3;
  uint64_t v6 = [(SDLogCollectionContainer *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(SDLogCollectionContainer *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(SDLogCollectionContainer *)self delegate];
      [v10 logCollectionContainer:self didRejectFile:v12 forReason:a4];
    }
  }
  id v11 = +[SDLogCollectionContainer rejectionReasonToString:a4];
  [(SDLogCollectionContainer *)self logFileToSummary:v12 description:v11];
}

- (BOOL)applyRule:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SDContainer evaluateCollectionFlagsWithOverlay:withName:](self, "evaluateCollectionFlagsWithOverlay:withName:", [v4 runtimeChecks], 0);
  if (!v5) {
    goto LABEL_31;
  }
  v42 = +[NSFileManager defaultManager];
  uint64_t v6 = [v4 filter];

  if (v6)
  {
    id v7 = [v4 filter];
    CFStringRef v8 = +[NSString stringWithFormat:@"\nAPPLYING PREDICATE %@:\n", v7];
  }
  else
  {
    CFStringRef v8 = @"\nAPPLYING DEFAULT FILTERS:\n";
  }
  BOOL v41 = v5;
  v40 = (__CFString *)v8;
  [(SDLogCollectionContainer *)self writeToSummary:v8];
  char v9 = [v4 getNextMatch];
  v43 = v4;
  if (v9)
  {
    int v10 = 0;
    id v11 = 0;
    while (1)
    {
      if (![v4 canAddToCandidateList]) {
        break;
      }
      id v13 = v9;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = v13;
      if (WeakRetained)
      {
        long long v15 = WeakRetained;
        long long v16 = [v13 path];
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = [v17 rootPath];
        unsigned __int8 v19 = [v16 hasPrefix:v18];

        id v11 = v13;
        if ((v19 & 1) == 0)
        {
          id v20 = objc_loadWeakRetained((id *)&self->_delegate);
          v21 = [v20 rootPath];
          v22 = [v13 path];
          v23 = [v21 stringByAppendingPathComponent:v22];
          id v11 = +[NSURL fileURLWithPath:v23];
        }
      }
      unsigned __int8 v49 = 0;
      v24 = [v11 path];
      unsigned int v25 = [v42 fileExistsAtPath:v24 isDirectory:&v49];
      int v26 = v49;

      if (!v25 || !v26)
      {
        uint64_t v48 = 0;
        unsigned __int8 v27 = [v43 considerURL:v11 forRejection:&v48];
        uint64_t v28 = v48;
        v29 = [v11 path];
        if ((v27 & 1) != 0 || !v28) {
          [(SDLogCollectionContainer *)self logFileToSummary:v29 description:@"Added to Candidate logs"];
        }
        else {
          [(SDLogCollectionContainer *)self rejectFile:v29 forReason:v48];
        }
      }
      id v4 = v43;
      char v9 = [v43 getNextMatch];

      --v10;
      if (!v9) {
        goto LABEL_23;
      }
    }
    [(SDLogCollectionContainer *)self writeToSummary:@"Hit maximum number of candidates for rule\n"];
    if (v10) {
      goto LABEL_23;
    }
  }
  else
  {
    id v11 = 0;
  }
  v30 = [v4 description];
  v31 = +[NSString stringWithFormat:@"%@: found no matches\n", v30];
  [(SDLogCollectionContainer *)self writeToSummary:v31];

LABEL_23:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v32 = [v4 applyFilters];
  id v33 = [v32 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v45;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v32);
        }
        [(SDLogCollectionContainer *)self rejectFile:*(void *)(*((void *)&v44 + 1) + 8 * i) forReason:3];
      }
      id v34 = [v32 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v34);
  }

  v37 = [(SDLogCollectionContainer *)self logs];
  v38 = [(SDLogCollectionContainer *)self highPriorityLogs];
  id v4 = v43;
  [v43 addPathsToArray:v37 withHighPriority:v38 withMaxVariety:-[SDLogCollectionContainer maxVariety](self, "maxVariety")];

  LOBYTE(v5) = v41;
LABEL_31:

  return v5;
}

- (BOOL)enforceContainerSizeLimit
{
  uint64_t v3 = [(SDLogCollectionContainer *)self maximumSizeMB] << 20;
  id v4 = +[NSString stringWithFormat:@"\n\nENFORCING SIZE LIMIT OF %lu MB ON FILTERED CANDIDATES:\n\n", [(SDLogCollectionContainer *)self maximumSizeMB]];
  [(SDLogCollectionContainer *)self writeToSummary:v4];

  BOOL v5 = [(SDLogCollectionContainer *)self enforceSizeOnLogs:v3];
  [(SDLogCollectionContainer *)self setLogs:v5];

  [(SDLogCollectionContainer *)self writeToSummary:@"\n** DONE Enforcing size limit **\n"];
  return 1;
}

- (id)enforceSizeOnLogs:(unint64_t)a3
{
  BOOL v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSFileManager defaultManager];
  id v7 = [(SDLogCollectionContainer *)self highPriorityLogs];
  CFStringRef v8 = [(SDLogCollectionContainer *)self logs];
  char v9 = [v7 arrayByAddingObjectsFromArray:v8];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v9;
  id v11 = (void *)v6;
  id obj = v10;
  id v12 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    unint64_t v33 = 0;
    uint64_t v14 = *(void *)v35;
    unint64_t v30 = a3;
    v31 = (void *)v6;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v15);
        id v17 = [v16 path:v30];
        uint64_t v18 = (uint64_t)[v16 sizeBytes];
        if ([v5 containsObject:v16])
        {
          unsigned __int8 v19 = self;
          id v20 = v17;
          uint64_t v21 = 9;
LABEL_8:
          [(SDLogCollectionContainer *)v19 rejectFile:v20 forReason:v21];
          goto LABEL_20;
        }
        if ([v11 fileExistsAtPath:v17])
        {
          if (a3)
          {
            CFStringRef v22 = @"Added";
            if (v18 + v33 > a3)
            {
              if (![v16 supportsPartialCollection] || (uint64_t v18 = a3 - v33, a3 <= v33))
              {
                unsigned __int8 v19 = self;
                id v20 = v17;
                uint64_t v21 = 2;
                goto LABEL_8;
              }
              CFStringRef v22 = @"Partially Added";
            }
          }
          else
          {
            CFStringRef v22 = @"Added";
          }
          [(SDLogCollectionContainer *)self logFileToSummary:v17 description:v22];
          v23 = [v16 offsets];

          if (!v23)
          {
            v24 = +[NSNumber numberWithLongLong:0];
            v39 = v24;
            unsigned int v25 = +[NSArray arrayWithObjects:&v39 count:1];
            [v16 setOffsets:v25];

            int v26 = +[NSNumber numberWithLongLong:v18];
            v38 = v26;
            unsigned __int8 v27 = +[NSArray arrayWithObjects:&v38 count:1];
            [v16 setSizes:v27];

            a3 = v30;
          }
          v33 += v18;
          [v5 addObject:v16];
          id v11 = v31;
        }
        else
        {
          [(SDLogCollectionContainer *)self logFileToSummary:v17 description:@"NotFound"];
        }
LABEL_20:

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      id v13 = v28;
    }
    while (v28);
  }

  return v5;
}

- (BOOL)prepareSummary
{
  if ([(SDLogCollectionContainer *)self generateSummary])
  {
    uint64_t v3 = +[NSFileManager defaultManager];
    uint64_t v4 = [(SDLogCollectionContainer *)self delegate];
    if (!v4) {
      goto LABEL_11;
    }
    BOOL v5 = (void *)v4;
    uint64_t v6 = [(SDLogCollectionContainer *)self delegate];
    id v7 = [v6 outputDirectory];

    if (!v7)
    {
LABEL_11:
      BOOL v23 = 1;
LABEL_20:

      return v23;
    }
    CFStringRef v8 = [(SDLogCollectionContainer *)self delegate];
    char v9 = [v8 outputDirectory];
    id v10 = [v9 stringByAppendingPathComponent:@"summaries"];

    id v11 = [(SDContainer *)self name];
    id v12 = [v11 lastPathComponent];
    id v13 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

    if ([v13 hasSuffix:@"_collection"])
    {
      uint64_t v14 = [v13 substringToIndex:([v13 length] - [_collection length])];

      id v13 = (void *)v14;
    }
    long long v15 = [v13 stringByAppendingPathExtension:@"log"];
    long long v16 = [v10 stringByAppendingPathComponent:v15];
    summaryLocation = self->_summaryLocation;
    self->_summaryLocation = v16;

    if (([v3 fileExistsAtPath:self->_summaryLocation] & 1) != 0
      || (uint64_t v18 = self->_summaryLocation,
          NSFileAttributeKey v31 = NSFilePosixPermissions,
          v32 = &off_1000B1340,
          +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1), unsigned __int8 v19 = objc_claimAutoreleasedReturnValue(), LOBYTE(v18) = [v3 createFileAtPath:v18 contents:0 attributes:v19], v19, (v18 & 1) != 0))
    {
      id v20 = +[NSFileHandle fileHandleForWritingAtPath:self->_summaryLocation];
      summaryHandle = self->_summaryHandle;
      self->_summaryHandle = v20;

      CFStringRef v22 = self->_summaryHandle;
      if (v22)
      {
        [(NSFileHandle *)v22 seekToEndOfFile];
        BOOL v23 = 1;
LABEL_19:

        goto LABEL_20;
      }
      v24 = sub_10002820C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Couldn't create file handle for summary file", v30, 2u);
      }

      unsigned int v25 = +[SDResourceManager sharedResourceManager];
      int v26 = v25;
      CFStringRef v27 = @"Couldn't create file handle for summary file";
    }
    else
    {
      id v28 = sub_10002820C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Couldn't create summary file.", v30, 2u);
      }

      unsigned int v25 = +[SDResourceManager sharedResourceManager];
      int v26 = v25;
      CFStringRef v27 = @"Couldn't create summary file.";
    }
    [v25 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:v27];

    BOOL v23 = 0;
    goto LABEL_19;
  }
  return 0;
}

- (void)writeToSummary:(id)a3
{
  id v5 = a3;
  if ([(SDLogCollectionContainer *)self generateSummary] && self->_summaryHandle)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"writing summary file for %@. Closing summary file handle.", self->_summaryLocation];
    if ((sub_100027E00(self->_summaryHandle, 0, v5, v4) & 1) == 0) {
      [(SDLogCollectionContainer *)self closeSummary];
    }
  }
}

- (void)closeSummary
{
  if ([(SDLogCollectionContainer *)self generateSummary])
  {
    summaryHandle = self->_summaryHandle;
    if (summaryHandle)
    {
      [(NSFileHandle *)summaryHandle closeFile];
      uint64_t v4 = self->_summaryHandle;
      self->_summaryHandle = 0;
    }
  }
}

- (BOOL)copyFilesForDirectory:(id)a3 withStreaming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SDLogCollectionContainer *)self delegate];
  if (v7) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v65 = v8;

  if (!v6)
  {
    v58 = sub_10002820C();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "ERROR: No delegate outputDirectory, no target location to copy files.", buf, 2u);
    }

    char v9 = +[SDResourceManager sharedResourceManager];
    [v9 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"ERROR: No delegate outputDirectory, no target location to copy files." category msg];
    goto LABEL_28;
  }
  char v9 = +[NSFileManager defaultManager];
  id v10 = [v6 lastPathComponent];
  id v11 = [(SDContainer *)self destination];
  id v12 = [v10 stringByAppendingPathComponent:v11];

  id v13 = +[NSURL URLWithString:v12];
  v66 = [v13 standardizedURL];

  uint64_t v14 = [(SDLogCollectionContainer *)self logs];
  id v15 = [v14 count];

  if (!v15) {
    goto LABEL_24;
  }
  v60 = v12;
  v62 = v9;
  v63 = v6;
  unint64_t v16 = 0;
  id v17 = 0;
  uint64_t v18 = 0;
  unsigned __int8 v19 = 0;
  v61 = 0;
  v64 = self;
  do
  {
    id v20 = v19;
    uint64_t v21 = [(SDLogCollectionContainer *)self logs];
    unsigned __int8 v19 = [v21 objectAtIndexedSubscript:v16];

    if (v65
      && ([(SDLogCollectionContainer *)self delegate],
          CFStringRef v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = objc_opt_respondsToSelector(),
          v22,
          (v23 & 1) != 0))
    {
      v24 = [v19 subdirectory];
      unsigned int v25 = [v66 URLByAppendingPathComponent:v24];
      int v26 = [v25 standardizedURL];

      CFStringRef v27 = [v26 path];

      id v28 = [v19 filename];
      uint64_t v29 = [v27 stringByAppendingPathComponent:v28];

      unint64_t v30 = [SDArchiveFile alloc];
      NSFileAttributeKey v31 = [v19 path];
      v32 = [v19 fileType];
      unint64_t v33 = [(SDArchiveFile *)v30 initWithPath:v31 target:v29 ofType:v32];

      long long v34 = [v19 offsets];
      [(SDArchiveFile *)v33 setOffsets:v34];

      long long v35 = [v19 sizes];
      [(SDArchiveFile *)v33 setSizes:v35];

      self = v64;
      id v36 = [(SDLogCollectionContainer *)v64 delegate];
      [v36 streamArchiveFile:v33];
      v61 = (void *)v29;
    }
    else
    {
      long long v37 = [v63 stringByDeletingLastPathComponent];
      v76[0] = v37;
      v38 = [v66 path];
      v76[1] = v38;
      v39 = [v19 subdirectory];
      v76[2] = v39;
      v40 = +[NSArray arrayWithObjects:v76 count:3];
      BOOL v41 = +[NSURL fileURLWithPathComponents:v40];
      int v26 = [v41 standardizedURL];

      CFStringRef v27 = [v26 path];

      NSFileAttributeKey v74 = NSFilePosixPermissions;
      v75 = &off_1000B1358;
      unint64_t v33 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      if (![v62 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:v33 error:0])
      {
        self = v64;
        goto LABEL_18;
      }
      v42 = [v19 filename];
      v43 = [v27 stringByAppendingPathComponent:v42];

      id v44 = [v19 path];
      long long v45 = (const char *)[v44 fileSystemRepresentation];
      id v36 = v43;
      LODWORD(v43) = sub_100056870(v45, (const char *)[v36 fileSystemRepresentation], 0xFu);

      if (v43)
      {
        int v46 = *__error();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v56 = [v19 path];
          v57 = strerror(v46);
          *(_DWORD *)buf = 138412802;
          v69 = v56;
          __int16 v70 = 2112;
          id v71 = v36;
          __int16 v72 = 2080;
          v73 = v57;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy file %@ -> %@: %s", buf, 0x20u);
        }
        long long v47 = +[SDResourceManager sharedResourceManager];
        uint64_t v48 = [v19 path];
        [v47 stderrWrite:@"Unable to copy file %@ -> %@: %s", v48, v36, strerror(v46)];

        unsigned __int8 v49 = +[SDResourceManager sharedResourceManager];
        v50 = [v19 path];
        [v49 log:@"Unable to copy file %@ -> %@: %s", v50, v36, strerror(v46)];

        self = v64;
        goto LABEL_20;
      }
      self = v64;
    }

LABEL_18:
    v51 = [(SDLogCollectionContainer *)self delegate];
    char v52 = objc_opt_respondsToSelector();

    if (v52)
    {
      unint64_t v33 = [(SDLogCollectionContainer *)self delegate];
      [(SDArchiveFile *)v33 logCollectionContainerDidCopyFile:v19];
LABEL_20:
      v53 = v67;

      uint64_t v18 = v26;
      id v17 = v27;
      goto LABEL_22;
    }
    uint64_t v18 = v26;
    id v17 = v27;
    v53 = v67;
LABEL_22:
    ++v16;
    v54 = [(SDLogCollectionContainer *)self logs];
    id v55 = [v54 count];
  }
  while ((unint64_t)v55 > v16);

  char v9 = v62;
  id v6 = v63;
  id v12 = v60;
LABEL_24:

LABEL_28:
  return v6 != 0;
}

- (void)applyContainerOverride:(id)a3
{
  BOOL v4 = [a3 objectForKeyedSubscript:@"maxSizeMB"];
  if (v4)
  {
    id v5 = v4;
    -[SDLogCollectionContainer setMaximumSizeMB:](self, "setMaximumSizeMB:", [v4 unsignedIntegerValue]);
    BOOL v4 = v5;
  }
}

- (unint64_t)maximumSizeMB
{
  return self->_maximumSizeMB;
}

- (void)setMaximumSizeMB:(unint64_t)a3
{
  self->_maximumSizeMB = a3;
}

- (SDLogCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDLogCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)maxVariety
{
  return self->_maxVariety;
}

- (void)setMaxVariety:(BOOL)a3
{
  self->_maxVariety = a3;
}

- (BOOL)generateSummary
{
  return self->_generateSummary;
}

- (void)setGenerateSummary:(BOOL)a3
{
  self->_generateSummary = a3;
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (NSMutableArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (NSMutableArray)highPriorityLogs
{
  return self->_highPriorityLogs;
}

- (void)setHighPriorityLogs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityLogs, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryHandle, 0);

  objc_storeStrong((id *)&self->_summaryLocation, 0);
}

@end