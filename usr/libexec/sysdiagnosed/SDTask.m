@interface SDTask
+ (id)createLaunchConstraintData;
+ (id)shellTaskWithCommand:(id)a3 outputFile:(id)a4;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 asUID:(unsigned int)a5 outputFile:(id)a6;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 inBootstrapDomainOfUID:(unsigned int)a5 outputFile:(id)a6;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5;
+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5 withRuntimeChecks:(unint64_t)a6;
- (BOOL)canLaunch;
- (BOOL)createChild;
- (BOOL)createChildProcess;
- (BOOL)isRunning;
- (BOOL)resume;
- (BOOL)slowTimeout;
- (BOOL)started;
- (BOOL)stopped;
- (NSArray)arguments;
- (NSDate)startDate;
- (NSMutableArray)taskFileHandleArray;
- (NSString)destination;
- (NSString)executionLine;
- (NSString)launchPath;
- (NSString)stderrPath;
- (NSString)stdoutPath;
- (OS_dispatch_source)exitSource;
- (SDTask)init;
- (double)executionTime;
- (id)description;
- (id)fileHandleForError;
- (id)fileHandleForOutput;
- (int)endStatus;
- (int)processIdentifier;
- (int)signalRunningTask:(int)a3;
- (int)terminationStatus;
- (rusage)rusage_details;
- (unint64_t)cpuTimeUsedNS;
- (unsigned)activeLimit;
- (unsigned)inactiveLimit;
- (unsigned)targetUid;
- (void)SDTaskPOSIXSpawnAttributes;
- (void)childExitHandler;
- (void)closeFileHandles;
- (void)createFileHandles;
- (void)finishChild;
- (void)logChildExitReason:(int)a3;
- (void)setActiveLimit:(unsigned int)a3;
- (void)setArguments:(id)a3;
- (void)setCpuTimeUsedNS:(unint64_t)a3;
- (void)setDestination:(id)a3;
- (void)setExecutionLine:(id)a3;
- (void)setExitSource:(id)a3;
- (void)setInactiveLimit:(unsigned int)a3;
- (void)setLaunchPath:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setRusage_details:(rusage *)a3;
- (void)setSlowTimeout:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStderrPath:(id)a3;
- (void)setStdoutPath:(id)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTargetUid:(unsigned int)a3;
- (void)setTaskFileHandleArray:(id)a3;
- (void)stop;
- (void)stop:(int)a3;
- (void)stop:(int)a3 withStateString:(id)a4 withSignal:(int)a5 withWaitMS:(int64_t)a6;
@end

@implementation SDTask

+ (id)createLaunchConstraintData
{
  if (qword_1000BD898 != -1) {
    dispatch_once(&qword_1000BD898, &stru_10009DC78);
  }
  v2 = (void *)qword_1000BD890;

  return [v2 externalRepresentation];
}

- (void)SDTaskPOSIXSpawnAttributes
{
  posix_spawnattr_t v19 = 0;
  if (posix_spawnattr_init(&v19))
  {
    v3 = sub_10002820C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to initialize spawn attr", buf, 2u);
    }

    v4 = +[SDResourceManager sharedResourceManager];
    [v4 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to initialize spawn attr"];

    return 0;
  }
  else
  {
    sigset_t v17 = -1;
    *(_DWORD *)buf = 0;
    if (posix_spawnattr_setsigmask(&v19, (const sigset_t *)buf))
    {
      v6 = sub_10002820C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to setsigmask on spawn attr when launching SDTask", v16, 2u);
      }

      v7 = +[SDResourceManager sharedResourceManager];
      [v7 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setsigmask on spawn attr when launching SDTask"];
    }
    if (posix_spawnattr_setsigdefault(&v19, &v17))
    {
      v8 = sub_10002820C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to setsigdefault on spawn attr when launching SDTask", v16, 2u);
      }

      v9 = +[SDResourceManager sharedResourceManager];
      [v9 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setsigdefault on spawn attr when launching SDTask"];
    }
    int v10 = posix_spawnattr_setflags(&v19, 142);
    if (self->_targetUid == -1)
    {
      int v13 = v10;
    }
    else if (posix_spawnattr_set_uid_np())
    {
      v11 = sub_10002820C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to set target uid when launching SDTask.", v16, 2u);
      }

      v12 = +[SDResourceManager sharedResourceManager];
      [v12 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to set target uid when launching SDTask."];

      int v13 = 1;
    }
    else
    {
      int v13 = 0;
    }
    [(SDTask *)self activeLimit];
    [(SDTask *)self inactiveLimit];
    posix_spawnattr_setjetsam_ext();
    if (v13)
    {
      v14 = sub_10002820C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to setflags on spawn attr when launching SDTask", v16, 2u);
      }

      v15 = +[SDResourceManager sharedResourceManager];
      [v15 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Failed to setflags on spawn attr when launching SDTask"];
    }
    [(NSData *)self->_launchConstraintData bytes];
    [(NSData *)self->_launchConstraintData length];
    amfi_launch_constraint_set_spawnattr();
    posix_spawnattr_set_launch_type_np();
    return v19;
  }
}

- (SDTask)init
{
  if (qword_1000BD8A0 != -1) {
    dispatch_once(&qword_1000BD8A0, &stru_10009DC98);
  }
  v17.receiver = self;
  v17.super_class = (Class)SDTask;
  v3 = [(SDTask *)&v17 init];
  v4 = v3;
  if (v3)
  {
    launchPath = v3->_launchPath;
    v3->_launchPath = 0;

    arguments = v4->_arguments;
    v4->_arguments = 0;

    stdoutPath = v4->_stdoutPath;
    v4->_stdoutPath = 0;

    stderrPath = v4->_stderrPath;
    v4->_stderrPath = 0;

    destination = v4->_destination;
    v4->_destination = 0;

    v4->_started = 0;
    v4->_stopped = 0;
    v4->_running = 0;
    v4->_slowTimeout = 0;
    v4->_terminationStatus = -1;
    v4->_processIdentifier = -1;
    id v10 = objc_alloc((Class)NSMutableArray);
    v11 = (NSMutableArray *)[v10 initWithObjects:qword_1000BD8A8, qword_1000BD8A8, nil];
    taskFileHandleArray = v4->_taskFileHandleArray;
    v4->_taskFileHandleArray = v11;

    v4->_executionTime = 0.0;
    v4->_targetUid = -1;
    v4->_activeLimit = 0;
    v4->_inactiveLimit = 0;
    startDate = v4->_startDate;
    v4->_startDate = 0;

    v4->_cpuTimeUsedNS = 0;
    uint64_t v14 = +[SDTask createLaunchConstraintData];
    launchConstraintData = v4->_launchConstraintData;
    v4->_launchConstraintData = (NSData *)v14;
  }
  return v4;
}

- (id)description
{
  v3 = [(SDTask *)self launchPath];
  v4 = [(SDTask *)self arguments];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(SDTask);
  v11 = v10;
  if (v10)
  {
    [(SDTask *)v10 setArguments:v8];
    [(SDTask *)v11 setLaunchPath:v7];
    [(SDTask *)v11 setStdoutPath:v9];
  }

  return v11;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 outputFile:(id)a5 withRuntimeChecks:(unint64_t)a6
{
  id v7 = +[SDTask taskWithCommand:a3 arguments:a4 outputFile:a5];
  [v7 setRuntimeChecks:a6];

  return v7;
}

+ (id)shellTaskWithCommand:(id)a3 outputFile:(id)a4
{
  v10[0] = @"-c";
  v10[1] = a3;
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  id v8 = +[SDTask taskWithCommand:@"/bin/bash" arguments:v7 outputFile:v5];

  return v8;
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 inBootstrapDomainOfUID:(unsigned int)a5 outputFile:(id)a6
{
  return +[SDTask taskWithCommand:a3 arguments:a4 outputFile:a6];
}

+ (id)taskWithCommand:(id)a3 arguments:(id)a4 asUID:(unsigned int)a5 outputFile:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v7 = +[SDTask taskWithCommand:a3 arguments:a4 outputFile:a6];
  [v7 setTargetUid:v6];

  return v7;
}

- (id)fileHandleForOutput
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(SDTask *)self stdoutPath];
  id v5 = +[SDTaskDepot sharedTaskDepot];
  uint64_t v6 = [v5 outputDirectory];

  id v7 = [(SDTask *)self destination];
  id v8 = [v6 stringByAppendingPathComponent:v7];

  id v9 = [(SDTask *)self stdoutPath];

  if (v9)
  {
    id v10 = [(SDTask *)self stdoutPath];
    unsigned __int8 v11 = [v10 isAbsolutePath];

    if ((v11 & 1) == 0)
    {
      v12 = [(SDTask *)self stdoutPath];
      uint64_t v13 = [v8 stringByAppendingPathComponent:v12];

      v4 = (void *)v13;
    }
    uint64_t v14 = [v4 stringByDeletingLastPathComponent];
    if (([v14 isEqualToString:v6] & 1) == 0)
    {
      NSFileAttributeKey v27 = NSFilePosixPermissions;
      v28 = &off_1000B1208;
      v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v24 = 0;
      unsigned __int8 v16 = [v3 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v15 error:&v24];
      id v17 = v24;

      if ((v16 & 1) == 0)
      {
        v20 = sub_10002820C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100063F48();
        }

        v21 = +[SDResourceManager sharedResourceManager];
        [v21 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create dir at %@, err: %@", v14, v17 category msg];

        goto LABEL_16;
      }
    }
    if (([v3 fileExistsAtPath:v4] & 1) != 0
      || (NSFileAttributeKey v25 = NSFilePosixPermissions,
          v26 = &off_1000B1220,
          +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1), v18 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v19 = [v3 createFileAtPath:v4 contents:0 attributes:v18], v18, (v19 & 1) != 0))
    {
      id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:v4];
      [v9 seekToEndOfFile];
LABEL_17:

      goto LABEL_18;
    }
    v22 = sub_10002820C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100063EDC();
    }

    id v17 = +[SDResourceManager sharedResourceManager];
    [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create file for writing at path: %@", v4 category msg];
LABEL_16:

    id v9 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

- (id)fileHandleForError
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(SDTask *)self stderrPath];
  if ([v3 fileExistsAtPath:v4])
  {

LABEL_4:
    id v8 = [(SDTask *)self stderrPath];
    id v9 = +[NSFileHandle fileHandleForUpdatingAtPath:v8];

    [v9 seekToEndOfFile];
    goto LABEL_8;
  }
  id v5 = [(SDTask *)self stderrPath];
  NSFileAttributeKey v14 = NSFilePosixPermissions;
  v15 = &off_1000B1220;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  unsigned __int8 v7 = [v3 createFileAtPath:v5 contents:0 attributes:v6];

  if (v7) {
    goto LABEL_4;
  }
  id v10 = sub_10002820C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100063FB0(self);
  }

  unsigned __int8 v11 = +[SDResourceManager sharedResourceManager];
  v12 = [(SDTask *)self stderrPath];
  [v11 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create error file for writing at path: %@", v12 category msg];

  id v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)canLaunch
{
  v3 = [(SDTask *)self launchPath];
  v4 = [(SDTask *)self arguments];
  id v5 = v3;
  if (!v5) {
    sub_100064034(&v27, v28);
  }
  uint64_t v6 = v5;

  if ([v4 count])
  {
    unsigned __int8 v7 = [v4 componentsJoinedByString:@" "];
    id v8 = +[NSString stringWithFormat:@"%@ %@", v6, v7];
    [(SDTask *)self setExecutionLine:v8];
  }
  else
  {
    [(SDTask *)self setExecutionLine:v6];
  }
  id v9 = +[NSFileManager defaultManager];
  if (([v9 isExecutableFileAtPath:v6] & 1) == 0)
  {
    id v17 = sub_10002820C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000642D8();
    }

    uint64_t v13 = +[SDResourceManager sharedResourceManager];
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Launch path '%@' not accessible", v6 category msg];
    goto LABEL_31;
  }
  if ((sub_100048604() & 1) == 0)
  {
    if ([v6 rangeOfString:@"/usr/local/"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v19 = sub_10002820C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10006426C();
      }

      uint64_t v13 = +[SDResourceManager sharedResourceManager];
      [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error: Blocked launching %@ on this build.", v6 category msg];
      goto LABEL_31;
    }
    if ([v6 isEqualToString:@"/bin/launchctl"]
      && (unint64_t)[v4 count] >= 3)
    {
      id v10 = [v4 objectAtIndexedSubscript:0];
      unsigned __int8 v11 = [v4 objectAtIndexedSubscript:2];
      if ((([v10 isEqualToString:@"asuser"] & 1) != 0
         || [v10 isEqualToString:@"bsexec"])
        && [v11 rangeOfString:@"/usr/local/"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        NSFileAttributeKey v25 = sub_10002820C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100064204();
        }

        v26 = +[SDResourceManager sharedResourceManager];
        [v26 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error: Blocked launchctl %@ %@ on this build.", v10, v11 category msg];

        goto LABEL_32;
      }
    }
  }
  if (![@"/bin/bash" isEqualToString:v6])
  {
    if ([v9 fileExistsAtPath:v6]) {
      goto LABEL_24;
    }
    v20 = sub_10002820C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100064198();
    }

    uint64_t v13 = +[SDResourceManager sharedResourceManager];
    [v13 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"File '%@' does not exist; will not execute."];
      v6);
    goto LABEL_31;
  }
  v12 = [(SDTask *)self executionLine];
  uint64_t v13 = [v12 componentsSeparatedByString:@"-c "];

  if (!v13 || (unint64_t)[v13 count] < 2) {
    goto LABEL_19;
  }
  NSFileAttributeKey v14 = [v13 objectAtIndex:1];
  v15 = [v14 componentsSeparatedByString:@" "];
  unsigned __int8 v16 = [v15 objectAtIndex:0];

  if (([v9 fileExistsAtPath:v16] & 1) == 0)
  {
    v22 = sub_10002820C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000640E0((uint64_t)v16, v13, v22);
    }

    v23 = +[SDResourceManager sharedResourceManager];
    id v24 = [v13 objectAtIndex:1];
    [v23 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"File '%@' does not exist; will not execute %@."];
      v16,
      v24);

LABEL_31:
LABEL_32:
    BOOL v18 = 0;
    goto LABEL_33;
  }

LABEL_19:
LABEL_24:
  BOOL v18 = 1;
LABEL_33:

  return v18;
}

- (void)createFileHandles
{
  v3 = [(SDTask *)self stdoutPath];

  if (!v3) {
    [(SDTask *)self setStdoutPath:@"error_log.txt"];
  }
  v4 = [(SDTask *)self fileHandleForOutput];
  if (!v4)
  {
    id v5 = sub_10002820C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(SDTask *)self stdoutPath];
      unsigned __int8 v7 = __error();
      id v8 = strerror(*v7);
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      __int16 v29 = 2080;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Can't create file '%@' to store output: %s.  Continuing...", buf, 0x16u);
    }
    id v9 = +[SDResourceManager sharedResourceManager];
    id v10 = [(SDTask *)self stdoutPath];
    unsigned __int8 v11 = __error();
    [v9 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Can't create file '%@' to store output: %s.  Continuing...", v10, strerror(*v11) category msg];
  }
  v12 = [(SDTask *)self stderrPath];

  if (v12)
  {
    uint64_t v13 = [(SDTask *)self stderrPath];
    NSFileAttributeKey v14 = [(SDTask *)self stdoutPath];
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15) {
      id v16 = v4;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v17 = +[SDTaskDepot sharedTaskDepot];
    BOOL v18 = [v17 outputDirectory];
    NSFileAttributeKey v14 = [v18 stringByAppendingPathComponent:@"errors"];

    unsigned __int8 v19 = [(SDTask *)self launchPath];
    v20 = [v19 lastPathComponent];
    v21 = [v20 stringByAppendingString:@"_stderr.txt"];

    v22 = [v14 stringByAppendingPathComponent:v21];
    [(SDTask *)self setStderrPath:v22];

    id v16 = [(SDTask *)self fileHandleForError];
  }
  v23 = v4;
  if (!v4)
  {
    NSFileAttributeKey v14 = [(SDTask *)self taskFileHandleArray];
    v23 = [v14 objectAtIndexedSubscript:1];
  }
  id v24 = [(SDTask *)self taskFileHandleArray];
  [v24 setObject:v23 atIndexedSubscript:1];

  if (!v4)
  {
  }
  NSFileAttributeKey v25 = v16;
  if (!v16)
  {
    NSFileAttributeKey v14 = [(SDTask *)self taskFileHandleArray];
    NSFileAttributeKey v25 = [v14 objectAtIndexedSubscript:2];
  }
  v26 = [(SDTask *)self taskFileHandleArray];
  [v26 setObject:v25 atIndexedSubscript:2];

  if (!v16)
  {
  }
}

- (void)closeFileHandles
{
  v3 = [(SDTask *)self taskFileHandleArray];
  id v13 = [v3 objectAtIndexedSubscript:1];

  v4 = [(SDTask *)self taskFileHandleArray];
  id v5 = [v4 objectAtIndexedSubscript:2];

  uint64_t v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [(SDTask *)self stderrPath];
  id v8 = [v6 attributesOfItemAtPath:v7 error:0];

  id v9 = [v8 fileSize];
  if (v8 && !v9)
  {
    id v10 = [(SDTask *)self stderrPath];
    [v6 removeItemAtPath:v10 error:0];
  }
  uint64_t v11 = qword_1000BD8A8;
  id v12 = v13;
  if (v13 && v13 != (id)qword_1000BD8A8)
  {
    [v13 closeFile];
    id v12 = v13;
    uint64_t v11 = qword_1000BD8A8;
  }
  if (v12 != v5 && v5 && v5 != (id)v11) {
    [v5 closeFile];
  }
}

- (BOOL)createChildProcess
{
  pid_t v52 = 0;
  v3 = [(SDTask *)self arguments];
  posix_spawnattr_t v50 = 0;
  posix_spawn_file_actions_t v51 = 0;
  [(SDTask *)self setStarted:1];
  v4 = +[NSDate date];
  [(SDTask *)self setStartDate:v4];

  id v5 = [(SDTask *)self launchPath];
  uint64_t v6 = (char *)[v5 fileSystemRepresentation];

  unsigned __int8 v7 = sub_10002820C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SDTask *)self executionLine];
    *(_DWORD *)buf = 138412290;
    v54[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Executing '%@'", buf, 0xCu);
  }
  id v9 = +[SDResourceManager sharedResourceManager];
  id v10 = [(SDTask *)self executionLine];
  [v9 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing '%@'", v10 category msg];

  uint64_t v11 = malloc_type_malloc(8 * (void)[v3 count] + 16, 0x10040436913F5uLL);
  if (v11)
  {
    id v12 = v11;
    v44 = v6;
    v45 = v3;
    void *v11 = v6;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = v3;
    id v14 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v47;
      uint64_t v17 = 1;
      do
      {
        BOOL v18 = 0;
        uint64_t v19 = v17 << 32;
        uint64_t v20 = (int)v17;
        v21 = (char *)&v12[(int)v17];
        do
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          *(void *)&v21[8 * (void)v18] = [*(id *)(*((void *)&v46 + 1) + 8 * (void)v18) fileSystemRepresentation];
          BOOL v18 = (char *)v18 + 1;
          v19 += (uint64_t)&_mh_execute_header;
        }
        while (v15 != v18);
        id v15 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
        uint64_t v17 = (uint64_t)v18 + v20;
      }
      while (v15);
      uint64_t v22 = v19 >> 32;
    }
    else
    {
      uint64_t v22 = 1;
    }

    v12[v22] = 0;
    [(SDTask *)self createFileHandles];
    int v26 = posix_spawn_file_actions_init(&v51);
    if (v26)
    {
      int v27 = v26;
      v28 = sub_10002820C();
      v3 = v45;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100064480(v27);
      }

      __int16 v29 = +[SDResourceManager sharedResourceManager];
      [v29 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Failed to posix_spawn_file_actions_init with error: %s. Skipping this task", strerror(v27)];

      free(v12);
      goto LABEL_21;
    }
    uint64_t v32 = 0;
    v3 = v45;
    do
    {
      v33 = [(SDTask *)self taskFileHandleArray];
      v34 = [v33 objectAtIndexedSubscript:v32];
      int v35 = posix_spawn_file_actions_adddup2(&v51, (int)[v34 fileDescriptor], v32);

      if (v35)
      {
        v36 = sub_10002820C();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v38 = strerror(v35);
          *(_DWORD *)buf = 67109378;
          LODWORD(v54[0]) = v32;
          WORD2(v54[0]) = 2080;
          *(void *)((char *)v54 + 6) = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s", buf, 0x12u);
        }

        v37 = +[SDResourceManager sharedResourceManager];
        [v37 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:[NSString stringWithFormat:@"Failed to posix_spawn_file_actions_adddup2() for fd %d when launching SDTask: %s", v32, strerror(v35)]];
      }
      ++v32;
    }
    while (v32 != 3);
    posix_spawnattr_t v50 = [(SDTask *)self SDTaskPOSIXSpawnAttributes];
    if (!v50)
    {
      v42 = sub_10002820C();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1000643C4(v42);
      }

      v43 = +[SDResourceManager sharedResourceManager];
      [v43 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Could not get spawn attributes. Skipping this task"];

      free(v12);
      posix_spawn_file_actions_destroy(&v51);
      goto LABEL_21;
    }
    signal(20, 0);
    v39 = _NSGetEnviron();
    int v40 = posix_spawn(&v52, v44, &v51, &v50, (char *const *)v12, *v39);
    free(v12);
    posix_spawn_file_actions_destroy(&v51);
    posix_spawnattr_destroy(&v50);
    if (!v40)
    {
      self->_processIdentifier = v52;
      BOOL v30 = 1;
      [(SDTask *)self setRunning:1];
      goto LABEL_22;
    }
    v41 = sub_10002820C();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100064408(v40);
    }

    id v24 = +[SDResourceManager sharedResourceManager];
    [v24 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"posix_spawn failed: %s", strerror(v40)];
  }
  else
  {
    v23 = sub_10002820C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100064344();
    }

    id v24 = +[SDResourceManager sharedResourceManager];
    NSFileAttributeKey v25 = __error();
    [v24 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Failed to malloc arg array with errno: %s", strerror(*v25)];
  }

LABEL_21:
  BOOL v30 = 0;
LABEL_22:

  return v30;
}

- (BOOL)createChild
{
  if ([(SDTask *)self started] || [(SDTask *)self stopped])
  {
    v3 = sub_10002820C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000644F8(self);
    }

    v4 = +[SDResourceManager sharedResourceManager];
    id v5 = [(SDTask *)self executionLine];
    [v4 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Task '%@' has already been started; will not execute"];
      v5);

LABEL_6:
    LOBYTE(v6) = 0;
    return v6;
  }
  BOOL v6 = [(SDTask *)self canLaunch];
  if (!v6) {
    return v6;
  }
  if (![(SDTask *)self createChildProcess]) {
    goto LABEL_6;
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (void)finishChild
{
  if (![(SDTask *)self stopped] && [(SDTask *)self isRunning])
  {
    [(SDTask *)self closeFileHandles];
    v3 = +[NSDate date];
    v4 = [(SDTask *)self startDate];
    [v3 timeIntervalSinceDate:v4];
    self->_executionTime = v5;

    BOOL v6 = sub_10002820C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = [(SDTask *)self launchPath];
      id v8 = [v7 lastPathComponent];
      id v9 = [(SDTask *)self stdoutPath];
      id v10 = [v9 lastPathComponent];
      [(SDTask *)self executionTime];
      double cpuTimeUsedNS = (double)self->_cpuTimeUsedNS;
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      double v26 = cpuTimeUsedNS / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time", buf, 0x2Au);
    }
    id v13 = +[SDResourceManager sharedResourceManager];
    id v14 = [(SDTask *)self launchPath];
    id v15 = [v14 lastPathComponent];
    uint64_t v16 = [(SDTask *)self stdoutPath];
    uint64_t v17 = [v16 lastPathComponent];
    [(SDTask *)self executionTime];
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Task '%@|%@' finished in %f seconds and used %f seconds of actual CPU time", v15, v17, v18, (double)self->_cpuTimeUsedNS / 1000000000.0 category msg];
  }
  [(SDTask *)self setStopped:1];
  [(SDTask *)self setRunning:0];
}

- (void)logChildExitReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = a3 & 0x7F;
  if (v5 == 127)
  {
    int v13 = a3 >> 8;
    id v14 = +[SDTaskDepot sharedTaskDepot];
    [v14 setTotalFailedTasks:[v14 totalFailedTasks] + 1];

    id v15 = sub_10002820C();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v13 == 19)
    {
      if (v16) {
        sub_1000646B0(self);
      }

      uint64_t v12 = +[SDResourceManager sharedResourceManager];
      uint64_t v17 = [(SDTask *)self launchPath];
      [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Unknown state of child process '%@' with wstatus %04x", v17, v3 category msg];
    }
    else
    {
      if (v16) {
        sub_100064740(self);
      }

      uint64_t v12 = +[SDResourceManager sharedResourceManager];
      uint64_t v17 = [(SDTask *)self launchPath];
      [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' stopped (but did not terminate) due to signal %d", v17, ((int)v3 >> 8) category msg];
    }
    goto LABEL_20;
  }
  if ((a3 & 0x7F) != 0)
  {
    uint64_t v18 = +[SDTaskDepot sharedTaskDepot];
    [v18 setTotalFailedTasks:[v18 totalFailedTasks] + 1];

    uint64_t v19 = sub_10002820C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100064580(self);
    }

    uint64_t v12 = +[SDResourceManager sharedResourceManager];
    uint64_t v17 = [(SDTask *)self launchPath];
    [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' terminated due to signal %d", v17, v5 category msg];
    goto LABEL_20;
  }
  int v6 = BYTE1(a3);
  p_terminationStatus = (unsigned int *)&self->_terminationStatus;
  self->_terminationStatus = BYTE1(a3);
  id v8 = sub_10002820C();
  id v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(SDTask *)self launchPath];
      unsigned int v21 = *p_terminationStatus;
      *(_DWORD *)buf = 138412546;
      __int16 v23 = v20;
      __int16 v24 = 1024;
      unsigned int v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Child process '%@' exited with status %d", buf, 0x12u);
    }
    uint64_t v12 = +[SDResourceManager sharedResourceManager];
    uint64_t v17 = [(SDTask *)self launchPath];
    [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' exited with status %d", v17, *p_terminationStatus category msg];
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100064610(self);
  }

  id v10 = +[SDResourceManager sharedResourceManager];
  uint64_t v11 = [(SDTask *)self launchPath];
  [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Child process '%@' exited with nonzero status %d", v11, *p_terminationStatus category msg];

  uint64_t v12 = +[SDTaskDepot sharedTaskDepot];
  [v12 setTotalFailedTasks:[v12 totalFailedTasks] + 1];
LABEL_21:
}

- (void)childExitHandler
{
  int v5 = 0;
  memset(&v4, 0, sizeof(v4));
  while (wait4([(SDTask *)self processIdentifier], &v5, 4, &v4) == -1 && *__error() == 4)
    ;
  rusage v3 = v4;
  [(SDTask *)self setRusage_details:&v3];
  self->_endStatus = v5;
  [(SDTask *)self setCpuTimeUsedNS:sub_1000288A8((uint64_t)&v4, (uint64_t)&v4.ru_stime)];
  [(SDTask *)self logChildExitReason:v5];
  [(SDTask *)self finishChild];
}

- (void)stop
{
}

- (void)stop:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(SDTask *)self isRunning])
  {
    if (self->_processIdentifier < 0) {
      sub_1000647D0();
    }
    switch((int)v3)
    {
      case 1:
        if ([(SDTask *)self slowTimeout]) {
          uint64_t v5 = 5500;
        }
        else {
          uint64_t v5 = 500;
        }
        CFStringRef v6 = @"Interrupting";
        unsigned __int8 v7 = self;
        uint64_t v8 = 1;
        uint64_t v9 = 2;
        goto LABEL_19;
      case 2:
        if ([(SDTask *)self slowTimeout]) {
          uint64_t v5 = 2750;
        }
        else {
          uint64_t v5 = 250;
        }
        CFStringRef v6 = @"Terminating";
        unsigned __int8 v7 = self;
        uint64_t v8 = 2;
        uint64_t v9 = 15;
        goto LABEL_19;
      case 3:
        uint64_t v12 = sub_10002820C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [(SDTask *)self launchPath];
          id v14 = [v13 lastPathComponent];
          id v15 = [(SDTask *)self stdoutPath];
          BOOL v16 = [v15 lastPathComponent];
          *(_DWORD *)buf = 138412546;
          v33 = v14;
          __int16 v34 = 2112;
          int v35 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-->\tTask is taking a while to terminate: '%@|%@'", buf, 0x16u);
        }
        uint64_t v17 = +[SDResourceManager sharedResourceManager];
        uint64_t v18 = [(SDTask *)self launchPath];
        uint64_t v19 = [v18 lastPathComponent];
        uint64_t v20 = [(SDTask *)self stdoutPath];
        unsigned int v21 = [v20 lastPathComponent];
        [v17 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"-->\tTask is taking a while to terminate: '%@|%@'", v19, v21 category msg];

        [(SDTask *)self stop:3 withStateString:@"Terminating" withSignal:0 withWaitMS:3000];
        return;
      case 4:
        CFStringRef v6 = @"Killing";
        unsigned __int8 v7 = self;
        uint64_t v8 = 4;
        uint64_t v9 = 9;
        uint64_t v5 = 1000;
LABEL_19:
        [(SDTask *)v7 stop:v8 withStateString:v6 withSignal:v9 withWaitMS:v5];
        return;
      case 5:
        uint64_t v22 = sub_10002820C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = [(SDTask *)self launchPath];
          __int16 v24 = [v23 lastPathComponent];
          unsigned int v25 = [(SDTask *)self stdoutPath];
          double v26 = [v25 lastPathComponent];
          *(_DWORD *)buf = 138412546;
          v33 = v24;
          __int16 v34 = 2112;
          int v35 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Giving up on waiting for %@|%@", buf, 0x16u);
        }
        int v27 = +[SDResourceManager sharedResourceManager];
        v28 = [(SDTask *)self launchPath];
        __int16 v29 = [v28 lastPathComponent];
        BOOL v30 = [(SDTask *)self stdoutPath];
        v31 = [v30 lastPathComponent];
        [v27 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Giving up on waiting for %@|%@", v29, v31 category msg];

        uint64_t v11 = [(SDTask *)self exitSource];
        dispatch_source_cancel(v11);
        goto LABEL_25;
      default:
        id v10 = sub_10002820C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000647FC(v3, v10);
        }

        uint64_t v11 = +[SDResourceManager sharedResourceManager];
        [v11 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Unknown task stop state: %u", v3 category msg];
LABEL_25:

        break;
    }
  }
}

- (void)stop:(int)a3 withStateString:(id)a4 withSignal:(int)a5 withWaitMS:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  if ([(SDTask *)self isRunning])
  {
    if (v7)
    {
      id v10 = sub_10002820C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = [(SDTask *)self processIdentifier];
        uint64_t v12 = [(SDTask *)self launchPath];
        int v13 = [v12 lastPathComponent];
        id v14 = [(SDTask *)self stdoutPath];
        id v15 = [v14 lastPathComponent];
        *(_DWORD *)buf = 138413058;
        id v29 = v9;
        __int16 v30 = 1024;
        unsigned int v31 = v11;
        __int16 v32 = 2112;
        v33 = v13;
        __int16 v34 = 2112;
        int v35 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-->\t%@ (pid %d): '%@|%@'", buf, 0x26u);
      }
      BOOL v16 = +[SDResourceManager sharedResourceManager];
      uint64_t v17 = [(SDTask *)self processIdentifier];
      uint64_t v18 = [(SDTask *)self launchPath];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [(SDTask *)self stdoutPath];
      unsigned int v21 = [v20 lastPathComponent];
      [v16 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"-->\t%@ (pid %d): '%@|%@'", v9, v17, v19, v21 category msg];

      if ([(SDTask *)self processIdentifier] >= 1) {
        [(SDTask *)self signalRunningTask:v7];
      }
    }
    dispatch_time_t v22 = dispatch_time(0, 1000000 * a6);
    __int16 v23 = +[SDTaskDepot sharedTaskDepot];
    __int16 v24 = [v23 taskQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000414DC;
    block[3] = &unk_10009DC58;
    block[4] = self;
    int v27 = a3;
    dispatch_after(v22, v24, block);
  }
}

- (BOOL)resume
{
  [(SDTask *)self processIdentifier];
  csops();
  uint64_t v3 = sub_10002820C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rusage v4 = [(SDTask *)self launchPath];
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ failed to launch due to validation error", buf, 0xCu);
  }
  uint64_t v5 = +[SDResourceManager sharedResourceManager];
  CFStringRef v6 = [(SDTask *)self launchPath];
  [v5 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ failed to launch due to validation error", v6 category msg];

  kill([(SDTask *)self processIdentifier], 9);
  return 0;
}

- (int)signalRunningTask:(int)a3
{
  return killpg(self->_processIdentifier, a3);
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_double cpuTimeUsedNS = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  if (![(SDTask *)self isRunning]) {
    return self->_cpuTimeUsedNS;
  }
  uint64_t v3 = sub_100028808([(SDTask *)self processIdentifier]);
  unint64_t result = sub_100028778(v3);
  self->_double cpuTimeUsedNS = result;
  return result;
}

- (NSString)launchPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLaunchPath:(id)a3
{
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setArguments:(id)a3
{
}

- (NSString)stdoutPath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStdoutPath:(id)a3
{
}

- (NSString)stderrPath
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStderrPath:(id)a3
{
}

- (NSString)executionLine
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExecutionLine:(id)a3
{
}

- (NSString)destination
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDestination:(id)a3
{
}

- (rusage)rusage_details
{
  long long v3 = *(_OWORD *)&self[1].ru_msgrcv;
  *(_OWORD *)&retstr->ru_oublock = *(_OWORD *)&self[1].ru_oublock;
  *(_OWORD *)&retstr->ru_msgrcv = v3;
  *(_OWORD *)&retstr->ru_nvcsw = *(_OWORD *)&self[1].ru_nvcsw;
  long long v4 = *(_OWORD *)&self[1].ru_idrss;
  *(_OWORD *)&retstr->ru_maxrss = *(_OWORD *)&self[1].ru_maxrss;
  *(_OWORD *)&retstr->ru_idrss = v4;
  long long v5 = *(_OWORD *)&self[1].ru_nswap;
  *(_OWORD *)&retstr->ru_minflt = *(_OWORD *)&self[1].ru_minflt;
  *(_OWORD *)&retstr->ru_nswap = v5;
  timeval ru_stime = self[1].ru_stime;
  retstr->ru_utime = self[1].ru_utime;
  retstr->timeval ru_stime = ru_stime;
  return self;
}

- (void)setRusage_details:(rusage *)a3
{
  self->_rusage_details.ru_utime = a3->ru_utime;
  long long v3 = *(_OWORD *)&a3->ru_minflt;
  timeval ru_stime = a3->ru_stime;
  long long v4 = *(_OWORD *)&a3->ru_maxrss;
  *(_OWORD *)&self->_rusage_details.ru_idrss = *(_OWORD *)&a3->ru_idrss;
  *(_OWORD *)&self->_rusage_details.ru_minflt = v3;
  self->_rusage_details.timeval ru_stime = ru_stime;
  *(_OWORD *)&self->_rusage_details.ru_maxrss = v4;
  long long v6 = *(_OWORD *)&a3->ru_nvcsw;
  long long v8 = *(_OWORD *)&a3->ru_nswap;
  long long v7 = *(_OWORD *)&a3->ru_oublock;
  *(_OWORD *)&self->_rusage_details.ru_msgrcv = *(_OWORD *)&a3->ru_msgrcv;
  *(_OWORD *)&self->_rusage_details.ru_nvcsw = v6;
  *(_OWORD *)&self->_rusage_details.ru_nswap = v8;
  *(_OWORD *)&self->_rusage_details.ru_oublock = v7;
}

- (unsigned)activeLimit
{
  return self->_activeLimit;
}

- (void)setActiveLimit:(unsigned int)a3
{
  self->_activeLimit = a3;
}

- (unsigned)inactiveLimit
{
  return self->_inactiveLimit;
}

- (void)setInactiveLimit:(unsigned int)a3
{
  self->_inactiveLimit = a3;
}

- (unsigned)targetUid
{
  return self->_targetUid;
}

- (void)setTargetUid:(unsigned int)a3
{
  self->_targetUid = a3;
}

- (OS_dispatch_source)exitSource
{
  return self->_exitSource;
}

- (void)setExitSource:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)slowTimeout
{
  return self->_slowTimeout;
}

- (void)setSlowTimeout:(BOOL)a3
{
  self->_slowTimeout = a3;
}

- (int)terminationStatus
{
  return self->_terminationStatus;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (NSMutableArray)taskFileHandleArray
{
  return self->_taskFileHandleArray;
}

- (void)setTaskFileHandleArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskFileHandleArray, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_exitSource, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_executionLine, 0);
  objc_storeStrong((id *)&self->_stderrPath, 0);
  objc_storeStrong((id *)&self->_stdoutPath, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_launchPath, 0);

  objc_storeStrong((id *)&self->_launchConstraintData, 0);
}

@end