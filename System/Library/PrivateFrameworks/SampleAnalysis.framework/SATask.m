@interface SATask
+ (double)taskWithoutReferencesFromPAStyleSerializedTask:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)taskWithPid:(uint64_t)a3 uniquePid:(uint64_t)a4 name:(void *)a5 mainBinaryPath:(uint64_t)a6 pidStartTime:(uint64_t)a7 loadInfos:(int)a8 numLoadInfos:(uint64_t)a9 textExecLoadInfos:(int)a10 numTextExecLoadInfos:(uint64_t)a11 architecture:(void *)a12 sharedCache:;
+ (id)taskWithPid:(uint64_t)a3 uniquePid:(void *)a4 name:(void *)a5 sharedCache:;
- (BOOL)addImageInfos:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)allowsIdleExit;
- (BOOL)isBeta;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTranslocated;
- (BOOL)isUnresponsive;
- (BOOL)usesSuddenTermination;
- (NSArray)binaryLoadInfos;
- (NSArray)taskStates;
- (NSDictionary)dispatchQueues;
- (NSDictionary)swiftTasks;
- (NSDictionary)threads;
- (NSString)appType;
- (NSString)bundleBuildVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleName;
- (NSString)bundleProductBuildVersion;
- (NSString)bundleProjectName;
- (NSString)bundleShortVersion;
- (NSString)bundleSourceVersion;
- (NSString)bundleVersion;
- (NSString)codesigningID;
- (NSString)cohortID;
- (NSString)commerceAppID;
- (NSString)commerceExternalID;
- (NSString)debugDescription;
- (NSString)distributorID;
- (NSString)installerVersionID;
- (NSString)mainBinaryPath;
- (NSString)name;
- (NSString)resourceCoalitionName;
- (NSString)teamID;
- (NSString)vendorID;
- (SABinary)mainBinary;
- (SABinaryLoadInfo)mainBinaryLoadInfo;
- (SAFrame)truncatedUserStackFrameSwiftAsync:(SAFrame *)a1;
- (SASharedCache)sharedCache;
- (SATask)initWithPid:(int)a3 uniquePid:(unint64_t)a4 name:(const char *)a5 mainBinaryPath:(id)a6 pidStartTime:(unint64_t)a7 loadInfos:(const dyld_uuid_info_64 *)a8 numLoadInfos:(unsigned int)a9 textExecLoadInfos:(const dyld_uuid_info_64 *)a10 numTextExecLoadInfos:(unsigned int)a11 architecture:(_CSArchitecture)a12 sharedCache:(id)a13;
- (SATask)initWithPid:(int)pid andUniquePid:(unint64_t)a4 andName:(id)a5 sharedCache:(id)a6;
- (SAThread)mainThread;
- (SATimestamp)execTimestamp;
- (SATimestamp)exitTimestamp;
- (char)developerType;
- (double)timeOfLastResponse;
- (id)architectureString;
- (id)endTimestamp;
- (id)firstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)firstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)lastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)lastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)leafFrameAfterAddingStack:(void *)a3 leafOfCRootFramesReplacedBySwiftAsync:;
- (id)removeStacksOutsideThisProcess;
- (id)startTimestamp;
- (int)pid;
- (int)ppid;
- (int)rpid;
- (uint64_t)_matchesNameStr:(uint64_t)a1;
- (uint64_t)correspondsToName:(void *)a3 loadInfos:(int)a4 numLoadInfos:(uint64_t)a5 architecture:(void *)a6 sharedCache:;
- (uint64_t)correspondsToName:(void *)a3 mainBinaryLoadInfo:(uint64_t)a4 architecture:(void *)a5 sharedCache:;
- (uint64_t)correspondsToPid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:;
- (uint64_t)correspondsToUniquePid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:;
- (uint64_t)enumerateFrames:(uint64_t)a1;
- (uint64_t)gatherLoadInfoFromLiveProcessWithDataGatheringOptions:(int)a3 additionalCSSymbolicatorFlags:;
- (uint64_t)isFromCurrentBootCycle;
- (unint64_t)adamID;
- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)resourceCoalitionID;
- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)uniquePid;
- (unsigned)uid;
- (void)_gatherDataFromLiveProcessIsLate:(void *)a3 mainBinaryPath:;
- (void)_incorporateNewKernelLoadInfos:(unsigned int)a3 numLoadInfos:(NSObject *)a4 textExecLoadInfos:(unsigned int)a5 numTextExecLoadInfos:;
- (void)addDispatchQueue:(uint64_t)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)addSwiftTask:(uint64_t)a1;
- (void)addThread:(uint64_t)a1;
- (void)cpuTimeNs:(unint64_t *)a3 cpuInstructions:(unint64_t *)a4 cpuCycles:(unint64_t *)a5 betweenStartTime:(id)a6 endTime:(id)a7;
- (void)cpuTimeNs:(void *)a3 cpuInstructions:(void *)a4 cpuCycles:(void *)a5 nonThreadCpuTimeNs:(void *)a6 nonThreadCpuInstructions:(void *)a7 nonThreadCpuCycles:(void *)a8 betweenStartTime:(void *)a9 endTime:;
- (void)dealloc;
- (void)enumerateTaskStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7;
- (void)enumerateTaskStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8;
- (void)enumerateThreadStatesForThread:(void *)a3 dispatchQueue:(void *)a4 betweenStartTime:(unint64_t)a5 startSampleIndex:(void *)a6 endTime:(unint64_t)a7 endSampleIndex:(uint64_t)a8 reverseOrder:(void *)a9 block:;
- (void)fixupFrameInstructionsWithDataGatheringOptions:(int)a3 mightBeAlive:(unsigned char *)a4 foundNewBinaryInfo:(void *)a5 uuidsWithNewInstructions:(int)a6 additionalCSSymbolicatorFlags:;
- (void)fixupThreadSuspension;
- (void)guessArchitectureGivenMachineArchitecture:(uint64_t)a3 dataSource:;
- (void)isAliveAtTimestamp:(void *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedTask:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)postprocessWithDataGatheringOptions:(int)a3 mightBeAlive:(void *)a4 machineArchitecture:(uint64_t)a5 dataSource:(uint64_t)a6 spindumpArchitecture:(void *)a7 spindumpSharedCache:(int)a8 additionalCSSymbolicatorFlags:;
- (void)setMainBinaryPath:(id)a3;
- (void)setName:(uint64_t)a1;
@end

@implementation SATask

- (SABinary)mainBinary
{
  mainBinary = self->_mainBinary;
  if (mainBinary)
  {
    v3 = mainBinary;
  }
  else
  {
    v4 = [(SATask *)self mainBinaryLoadInfo];
    v3 = [v4 binary];
  }
  return v3;
}

- (NSString)mainBinaryPath
{
  mainBinaryPath = self->_mainBinaryPath;
  if (mainBinaryPath)
  {
    v3 = mainBinaryPath;
  }
  else
  {
    v4 = [(SATask *)self mainBinary];
    v3 = [v4 path];
  }
  return v3;
}

- (SABinaryLoadInfo)mainBinaryLoadInfo
{
  binaryLoadInfos = self->_binaryLoadInfos;
  if (!binaryLoadInfos || ![(NSArray *)binaryLoadInfos count]) {
    goto LABEL_10;
  }
  if ((CSArchitectureIs32Bit() & 1) != 0 || self->_pid)
  {
    v4 = [(NSArray *)self->_binaryLoadInfos firstObject];
  }
  else
  {
    v4 = [(NSArray *)self->_binaryLoadInfos lastObject];
  }
  v5 = v4;
  if (self->_mainBinary)
  {
    v6 = [v4 binary];
    mainBinary = self->_mainBinary;

    if (v6 != mainBinary)
    {

LABEL_10:
      v5 = 0;
    }
  }
  return (SABinaryLoadInfo *)v5;
}

- (SATask)initWithPid:(int)pid andUniquePid:(unint64_t)a4 andName:(id)a5 sharedCache:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SATask;
  v12 = [(SATask *)&v32 init];
  v13 = (SATask *)v12;
  if (v12)
  {
    double v14 = NAN;
    if (pid <= 1) {
      int v15 = 0;
    }
    else {
      int v15 = -1;
    }
    *(void *)(v12 + 84) = 0xFFFFFEC6FFFFFFFFLL;
    *((_DWORD *)v12 + 19) = pid;
    *((_DWORD *)v12 + 20) = v15;
    *((void *)v12 + 12) = a4;
    if (v10)
    {
      if (!objc_msgSend(v10, "length", NAN))
      {
        int v27 = *__error();
        v28 = _sa_logt();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          [(SATask *)v13 debugDescription];
          int v31 = v27;
          id v29 = objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v29 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v34 = v30;
          _os_log_fault_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_FAULT, "%s: applying empty string for task name", buf, 0xCu);

          int v27 = v31;
        }

        *__error() = v27;
        id v10 = 0;
      }
      pid = v13->_pid;
    }
    if (!pid || (objc_msgSend(v10, "isEqualToString:", @"kernel_task", v14) & 1) == 0)
    {
      uint64_t v16 = objc_msgSend(v10, "copy", v14);
      name = v13->_name;
      v13->_name = (NSString *)v16;
    }
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dispatchQueues = v13->_dispatchQueues;
    v13->_dispatchQueues = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    swiftTasks = v13->_swiftTasks;
    v13->_swiftTasks = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    threads = v13->_threads;
    v13->_threads = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    taskStates = v13->_taskStates;
    v13->_taskStates = v24;

    objc_storeStrong((id *)&v13->_sharedCache, a6);
  }

  return v13;
}

- (NSString)name
{
  name = self->_name;
  if (name)
  {
    Path = name;
  }
  else
  {
    v4 = [(SATask *)self mainBinaryPath];
    Path = (NSString *)-[NSString copyLastPathComponent](v4);
  }
  return Path;
}

- (void)addDispatchQueue:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    v3 = NSNumber;
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMutableArray *)self->_taskStates lastObject];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL, v9 = [v7 endSampleIndex], v9 != 0x7FFFFFFFFFFFFFFFLL)) {
      unint64_t v10 = [(SATask *)self indexOfLastTaskStateOnOrBeforeTime:v6 sampleIndex:v9];
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (uint64_t)correspondsToName:(void *)a3 loadInfos:(int)a4 numLoadInfos:(uint64_t)a5 architecture:(void *)a6 sharedCache:
{
  id v11 = a6;
  if (!a1)
  {
LABEL_13:
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  if (!*(_DWORD *)(a1 + 76))
  {
    int v18 = *__error();
    id v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "correspondsToName called for kernel", v25, 2u);
    }

    *__error() = v18;
    _SASetCrashLogMessage(1321, "correspondsToName called for kernel", v19, v20, v21, v22, v23, v24, v25[0]);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (a2)
  {
    a2 = SANSStringForCString(a2);
  }
  v12 = 0;
  if (a3 && a4)
  {
    v13 = [SABinaryLoadInfo alloc];
    double v14 = uuidForBytes((uint64_t)(a3 + 1));
    int v15 = +[SABinary binaryWithUUID:v14 absolutePath:0];
    v12 = [(SABinaryLoadInfo *)v13 initWithBinary:v15 segment:0 loadAddress:*a3];
  }
  uint64_t v16 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:](a1, a2, v12, a5, v11);

LABEL_9:
  return v16;
}

- (int)pid
{
  return self->_pid;
}

- (NSArray)taskStates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)uniquePid
{
  return self->_uniquePid;
}

- (NSString)bundleProjectName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)codesigningID
{
  v2 = [(SATask *)self mainBinary];
  v3 = [v2 codesigningID];

  return (NSString *)v3;
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SATask *)self indexOfFirstTaskStateOnOrAfterTime:a3 sampleIndex:v4];
}

- (id)architectureString
{
  architecture = (void *)self->_architecture;
  if (architecture)
  {
    architecture = (void *)CSArchitectureGetFamilyName();
    if (architecture)
    {
      architecture = SANSStringForCString(architecture);
    }
  }
  return architecture;
}

- (id)startTimestamp
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__6;
  int v15 = __Block_byref_object_dispose__6;
  v3 = self->_execTimestamp;
  uint64_t v16 = v3;
  if (!v3)
  {
    uint64_t v4 = [(NSMutableArray *)self->_taskStates firstObject];
    uint64_t v5 = [v4 startTimestamp];
    id v6 = (void *)v12[5];
    v12[5] = v5;

    v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __24__SATask_startTimestamp__block_invoke;
      v10[3] = &unk_1E63F7D80;
      v10[4] = &v11;
      [(NSMutableDictionary *)threads enumerateKeysAndObjectsUsingBlock:v10];
      v3 = (SATimestamp *)v12[5];
    }
  }
  v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7 && ([v6 le:v7] & 1) == 0)
  {
    int v16 = *__error();
    v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v6 debugDescription];
      uint64_t v19 = [v18 UTF8String];
      id v20 = [v8 debugDescription];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v20 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "startTime %s > endTime %s", buf, 0x16u);
    }
    *__error() = v16;
    id v21 = [v6 debugDescription];
    char v22 = [v21 UTF8String];
    id v23 = [v8 debugDescription];
    [v23 UTF8String];
    _SASetCrashLogMessage(1940, "startTime %s > endTime %s", v24, v25, v26, v27, v28, v29, v22);

    _os_crash();
    __break(1u);
  }
  if ([(NSMutableArray *)self->_taskStates count])
  {
    unint64_t v9 = [(SATask *)self indexOfFirstTaskStateOnOrAfterTime:v6 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v12 = v9;
      unint64_t v13 = [(SATask *)self indexOfLastTaskStateOnOrBeforeTime:v8 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
      if (v13 >= v12) {
        uint64_t v14 = v13 - v12 + 1;
      }
      else {
        uint64_t v14 = 0;
      }
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v10 = 0;
      }
      else {
        unint64_t v10 = v14;
      }
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v35 = 0;
    threads = self->_threads;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke;
    v30[3] = &unk_1E63F9F38;
    v33 = buf;
    id v31 = v6;
    id v32 = v8;
    [(NSMutableDictionary *)threads enumerateKeysAndObjectsUsingBlock:v30];
    unint64_t v10 = *(void *)(*(void *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (NSDictionary)threads
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (uint64_t)enumerateFrames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 280);
    if (v4) {
      +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v4, v3);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_rootFrames;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        +[SAFrame releaseFrameTree:]((uint64_t)SAFrame, *(void **)(*((void *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SATask;
  [(SATask *)&v8 dealloc];
}

- (int)rpid
{
  return self->_rpid;
}

- (NSString)bundleVersion
{
  v2 = [(SATask *)self mainBinary];
  id v3 = [v2 bundleVersion];

  return (NSString *)v3;
}

- (NSString)bundleShortVersion
{
  v2 = [(SATask *)self mainBinary];
  id v3 = [v2 bundleShortVersion];

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(SATask *)self mainBinary];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)teamID
{
  v2 = [(SATask *)self mainBinary];
  id v3 = [v2 teamID];

  return (NSString *)v3;
}

- (void)addThread:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    id v3 = NSNumber;
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadId"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)addSwiftTask:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = NSNumber;
    id v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)guessArchitectureGivenMachineArchitecture:(uint64_t)a3 dataSource:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (*(void *)(a1 + 288))
  {
    int v37 = *__error();
    v38 = _sa_logt();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(id)a1 debugDescription];
      *(_DWORD *)buf = 136315906;
      uint64_t v75 = [v39 UTF8String];
      __int16 v76 = 2080;
      uint64_t FamilyName = CSArchitectureGetFamilyName();
      __int16 v78 = 2080;
      uint64_t v79 = CSArchitectureGetFamilyName();
      __int16 v80 = 2048;
      uint64_t v81 = a3;
      _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)", buf, 0x2Au);
    }
    *__error() = v37;
    id v40 = [(id)a1 debugDescription];
    id v32 = (void *)[v40 UTF8String];
    CSArchitectureGetFamilyName();
    CSArchitectureGetFamilyName();
    _SASetCrashLogMessage(92, "%s: already know architecture %s, but guessing from machine architecture %s (data source 0x%llx)", v41, v42, v43, v44, v45, v46, (char)v32);

    _os_crash();
    __break(1u);
    goto LABEL_70;
  }
  unint64_t Family = CSArchitectureGetFamily();
  unsigned int v7 = Family;
  unint64_t v8 = HIDWORD(Family);
  if (CSArchitectureIs32Bit()) {
    goto LABEL_4;
  }
  if ((a3 & 5) != 0)
  {
    long long v9 = [*(id *)(a1 + 8) lastObject];
    if (v9)
    {
      long long v10 = v9;
      v58 = v9;
      if ((a3 & 1) == 0 && !*(_DWORD *)(a1 + 76) || (v11 = [v9 ssFlags], long long v10 = v58, (v11 & 1) == 0))
      {
        if ((a3 & 4) == 0 || *(_DWORD *)(a1 + 76) || (v12 = [v10 ssFlags], long long v10 = v58, (v12 & 2) == 0)) {
          v7 &= ~0x1000000u;
        }
      }
      *(_DWORD *)(a1 + 288) = v7;
      *(_DWORD *)(a1 + 292) = v8;

      return;
    }
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v13 = *(id *)(a1 + 248);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v68 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if ((unint64_t)[v18 loadAddress] >> 32) {
          goto LABEL_33;
        }
        if ([v18 loadAddress])
        {
          v7 &= ~0x1000000u;
LABEL_33:
          *(_DWORD *)(a1 + 288) = v7;
LABEL_34:
          *(_DWORD *)(a1 + 292) = v8;
LABEL_35:

          return;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v15);
  }

  uint64_t v19 = *(void **)(a1 + 256);
  if (v19 && [v19 startAddress] != -1)
  {
    if ((unint64_t)[*(id *)(a1 + 256) startAddress] >> 32) {
      goto LABEL_4;
    }
    if ([*(id *)(a1 + 256) startAddress])
    {
      *(_DWORD *)(a1 + 288) = v7 & 0xFEFFFFFF;
      goto LABEL_5;
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = *(id *)(a1 + 280);
  uint64_t v20 = [v13 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (!v20) {
    goto LABEL_50;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v64;
  do
  {
    uint64_t v23 = 0;
    do
    {
      if (*(void *)v64 != v22) {
        objc_enumerationMutation(v13);
      }
      uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * v23);
      if (v24)
      {
        a2 = *(id *)(v24 + 40);
        if (!a2) {
          goto LABEL_46;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v25 = a2;
LABEL_60:
          id v32 = v25;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v33 = [v32 address];
            unsigned int v34 = v7 & 0xFEFFFFFF;
            if (HIDWORD(v33)) {
              unsigned int v34 = v7;
            }
            *(_DWORD *)(a1 + 288) = v34;
            *(_DWORD *)(a1 + 292) = v8;

            goto LABEL_35;
          }
LABEL_70:
          int v47 = *__error();
          v48 = _sa_logt();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            ClassName = object_getClassName(a2);
            v50 = object_getClassName(v32);
            *(_DWORD *)buf = 136315394;
            uint64_t v75 = (uint64_t)ClassName;
            __int16 v76 = 2080;
            uint64_t FamilyName = (uint64_t)v50;
            _os_log_error_impl(&dword_1BF22B000, v48, OS_LOG_TYPE_ERROR, "children is %s, child is %s", buf, 0x16u);
          }

          *__error() = v47;
          char v51 = object_getClassName(a2);
          object_getClassName(v32);
          _SASetCrashLogMessage(146, "children is %s, child is %s", v52, v53, v54, v55, v56, v57, v51);
          _os_crash();
          __break(1u);
        }
        id v25 = [a2 anyObject];
        if (v25) {
          goto LABEL_60;
        }
      }
      else
      {
        a2 = 0;
      }
LABEL_46:

      ++v23;
    }
    while (v21 != v23);
    uint64_t v26 = [v13 countByEnumeratingWithState:&v63 objects:v72 count:16];
    uint64_t v21 = v26;
  }
  while (v26);
LABEL_50:

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v13 = *(id *)(a1 + 280);
  uint64_t v27 = [v13 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    while (2)
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v13);
        }
        id v31 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        if (![v31 isFakeFrame])
        {
          unint64_t v35 = [v31 address];
          unsigned int v36 = v7 & 0xFEFFFFFF;
          if (HIDWORD(v35)) {
            unsigned int v36 = v7;
          }
          *(_DWORD *)(a1 + 288) = v36;
          goto LABEL_34;
        }
      }
      uint64_t v28 = [v13 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

LABEL_4:
  *(_DWORD *)(a1 + 288) = v7;
LABEL_5:
  *(_DWORD *)(a1 + 292) = v8;
}

- (void)setMainBinaryPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    mainBinaryPath = self->_mainBinaryPath;
    self->_mainBinaryPath = 0;

    goto LABEL_17;
  }
  id v5 = [(SATask *)self mainBinary];
  uint64_t v6 = v5;
  if (v5)
  {
    char v19 = 0;
    unsigned int v7 = [v5 path];
    int v8 = SAFilepathMatches(v7, v4, &v19);

    if (v8)
    {
      if (v19) {
        objc_setProperty_atomic_copy(v6, v9, v4, 80);
      }
      long long v10 = self->_mainBinaryPath;
      self->_mainBinaryPath = 0;
      goto LABEL_12;
    }
    int v12 = *__error();
    id v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(SATask *)self debugDescription];
      id v18 = [v6 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v18;
      _os_log_debug_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_DEBUG, "%@: Setting mainBinaryPath to %@ when its already %@", buf, 0x20u);
    }
    *__error() = v12;
  }
  SACachedNSString(v4);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  long long v10 = self->_mainBinaryPath;
  self->_mainBinaryPath = v14;
LABEL_12:

  if (self->_name)
  {
    Path = -[NSString copyLastPathComponent](v4);
    if ([Path hasPrefix:self->_name])
    {
      name = self->_name;
      self->_name = 0;
    }
  }

LABEL_17:
}

- (void)setName:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3 && ![v3 length])
    {
      int v7 = *__error();
      int v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        [(id)a1 debugDescription];
        int v10 = v7;
        id v9 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = [v9 UTF8String];
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "%s: applying emptry string for task name", buf, 0xCu);

        int v7 = v10;
      }

      *__error() = v7;
      id v4 = 0;
    }
    if (!*(_DWORD *)(a1 + 76) || ([v4 isEqualToString:@"kernel_task"] & 1) == 0)
    {
      uint64_t v5 = [v4 copy];
      uint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;
    }
  }
}

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(void *)a4 name:(void *)a5 sharedCache:
{
  id v8 = a5;
  id v9 = a4;
  int v10 = (void *)[objc_alloc((Class)self) initWithPid:a2 andUniquePid:a3 andName:v9 sharedCache:v8];

  return v10;
}

- (SATask)initWithPid:(int)a3 uniquePid:(unint64_t)a4 name:(const char *)a5 mainBinaryPath:(id)a6 pidStartTime:(unint64_t)a7 loadInfos:(const dyld_uuid_info_64 *)a8 numLoadInfos:(unsigned int)a9 textExecLoadInfos:(const dyld_uuid_info_64 *)a10 numTextExecLoadInfos:(unsigned int)a11 architecture:(_CSArchitecture)a12 sharedCache:(id)a13
{
  uint64_t v17 = *(void *)&a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v19 = a6;
  id v20 = a13;
  if (a5)
  {
    if (*a5)
    {
      SANSStringForCString((void *)a5);
      a5 = (const char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a5 = 0;
    }
  }
  uint64_t v21 = [(SATask *)self initWithPid:v17 andUniquePid:a4 andName:a5 sharedCache:v20];
  if (v21)
  {
    if (a7)
    {
      uint64_t v22 = +[SATimestamp timestampWithMachAbsTime:0 machAbsTimeSec:0 machContTime:0.0 machContTimeSec:0.0 wallTime:(double)a7 - *MEMORY[0x1E4F1CF78]];
      pidStartTimestamp = v21->_pidStartTimestamp;
      v21->_pidStartTimestamp = (SATimestamp *)v22;
    }
    v21->_architecture = a12;
    if (!v17)
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:]((uint64_t)v21, a8, a9, a10, a11);
      goto LABEL_14;
    }
    if (a10 || a11)
    {
      int v27 = *__error();
      uint64_t v28 = _sa_logt();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        id v38 = [(SATask *)v21 debugDescription];
        uint64_t v36 = [v38 UTF8String];
        if (a10)
        {
          uint64_t imageLoadAddress = a10->imageLoadAddress;
          unsigned int v30 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v31 = v30 & 3;
          int v33 = -v30;
          BOOL v32 = v33 < 0;
          int v34 = v33 & 3;
          if (v32) {
            int v35 = v31;
          }
          else {
            int v35 = -v34;
          }
          uint64_t v29 = &uuid_string_string[37 * v35];
          uuid_unparse(a10->imageUUID, v29);
        }
        else
        {
          uint64_t imageLoadAddress = 0;
          uint64_t v29 = "null";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v40 = v36;
        __int16 v41 = 1024;
        unsigned int v42 = a11;
        __int16 v43 = 2048;
        uint64_t v44 = imageLoadAddress;
        __int16 v45 = 2080;
        uint64_t v46 = v29;
        _os_log_fault_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_FAULT, "%s has text-exec %u load infos (first is 0x%llx %s)", buf, 0x26u);
      }
      *__error() = v27;
      if (a9) {
        goto LABEL_12;
      }
    }
    else if (a9)
    {
LABEL_12:
      uint64_t v24 = _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)a8, a9, v19, 0, 0, 0);
      binaryLoadInfos = v21->_binaryLoadInfos;
      v21->_binaryLoadInfos = (NSArray *)v24;

      v21->_assumeBinaryLoadInfosContainsMainBinary = 1;
    }
  }
LABEL_14:

  return v21;
}

- (void)_incorporateNewKernelLoadInfos:(unsigned int)a3 numLoadInfos:(NSObject *)a4 textExecLoadInfos:(unsigned int)a5 numTextExecLoadInfos:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v8 = a2;
  if (!a2 && a3)
  {
    int v21 = *__error();
    uint64_t v22 = _sa_logt();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v43 = a3;
      _os_log_error_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_ERROR, "%u load infos, but null", buf, 8u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1332, "%u load infos, but null", v23, v24, v25, v26, v27, v28, a3);
    _os_crash();
    __break(1u);
LABEL_28:
    int v29 = *__error();
    unsigned int v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v43 = a5;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "%u text exec load infos, but null", buf, 8u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(1333, "%u text exec load infos, but null", v31, v32, v33, v34, v35, v36, a5);
    _os_crash();
    __break(1u);
  }
  if (!a4 && a5) {
    goto LABEL_28;
  }
  if ([*(id *)(a1 + 248) count] < (unint64_t)(a5 + a3))
  {
    int v10 = _SABinaryCreateLoadInfoArrayFromDyldImageInfos((uint64_t)v8, a3, 0, a4, a5, 1);
    char v11 = v10;
    if (!*(void *)(a1 + 48))
    {
      if (a3 || (id v8 = a4, a5)) {
        Class isa = v8->isa;
      }
      else {
        Class isa = 0;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ((Class)[v18 loadAddress] == isa)
            {
              uint64_t v19 = [v18 binary];
              id v20 = *(void **)(a1 + 48);
              *(void *)(a1 + 48) = v19;

              goto LABEL_21;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_21:
    }
    -[SATask addImageInfos:](a1, v11);
    *(unsigned char *)(a1 + 73) = 1;
  }
}

+ (id)taskWithPid:(uint64_t)a3 uniquePid:(uint64_t)a4 name:(void *)a5 mainBinaryPath:(uint64_t)a6 pidStartTime:(uint64_t)a7 loadInfos:(int)a8 numLoadInfos:(uint64_t)a9 textExecLoadInfos:(int)a10 numTextExecLoadInfos:(uint64_t)a11 architecture:(void *)a12 sharedCache:
{
  id v17 = a12;
  id v18 = a5;
  LODWORD(v22) = a10;
  LODWORD(v21) = a8;
  uint64_t v19 = (void *)[objc_alloc((Class)self) initWithPid:a2 uniquePid:a3 name:a4 mainBinaryPath:v18 pidStartTime:a6 loadInfos:a7 numLoadInfos:v21 textExecLoadInfos:a9 numTextExecLoadInfos:v22 architecture:a11 sharedCache:v17];

  return v19;
}

- (unint64_t)indexOfFirstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_taskStates count])
  {
    if (v6)
    {
      taskStates = self->_taskStates;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_1E63F9E78;
      id v15 = v6;
      unint64_t v8 = SABinarySearchArray(taskStates, 1280, (uint64_t)v14);
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < [(NSMutableArray *)self->_taskStates count])
    {
      do
      {
        int v10 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v8];
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {
          char v11 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v8];
          unint64_t v12 = [v11 endSampleIndex];

          if (v12 >= a4) {
            break;
          }
        }
        ++v8;
      }
      while (v8 < [(NSMutableArray *)self->_taskStates count]);
    }
    if (v8 >= [(NSMutableArray *)self->_taskStates count]) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __57__SATask_indexOfFirstTaskStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 startTimestamp];
  LOBYTE(v4) = [v4 lt:v5];

  if (v4)
  {
    uint64_t v6 = -1;
  }
  else
  {
    int v7 = *(void **)(a1 + 32);
    unint64_t v8 = [v3 endTimestamp];
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = [(SATask *)self indexOfFirstTaskStateOnOrAfterTime:a3 sampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (unint64_t)indexOfLastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if (![(NSMutableArray *)self->_taskStates count]) {
    goto LABEL_4;
  }
  taskStates = self->_taskStates;
  if (v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_1E63F9E78;
    id v15 = v6;
    uint64_t v8 = SABinarySearchArray(taskStates, 1536, (uint64_t)v14);

    if (!v8) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)self->_taskStates count];
  }
  unint64_t v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  while (1)
  {
    char v11 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v9];
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      unint64_t v12 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v9];
      unint64_t v13 = [v12 startSampleIndex];

      if (v13 <= a4) {
        goto LABEL_7;
      }
    }
    if (!v9) {
      break;
    }
    --v9;
  }
LABEL_4:
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return v9;
}

uint64_t __57__SATask_indexOfLastTaskStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v3 startTimestamp];
  LOBYTE(v4) = [v4 lt:v5];

  if (v4)
  {
    uint64_t v6 = -1;
  }
  else
  {
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 endTimestamp];
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = [(SATask *)self indexOfLastTaskStateOnOrBeforeTime:a3 sampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (id)firstTaskStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SATask *)self firstTaskStateOnOrAfterTime:a3 sampleIndex:v4];
}

- (id)lastTaskStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5 = [(SATask *)self indexOfLastTaskStateOnOrBeforeTime:a3 withSampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_taskStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  unint64_t v16 = [(SATask *)self indexOfFirstTaskStateOnOrAfterTime:a3 sampleIndex:a4];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = v16;
    unint64_t v18 = [(SATask *)self indexOfLastTaskStateOnOrBeforeTime:v14 sampleIndex:a6];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_1E63F8D70;
        v22[4] = self;
        id v23 = v15;
        id v20 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17) {
              break;
            }
            char v21 = v20[2](v20, v19--);
          }
          while ((v21 & 1) == 0);
        }
        else
        {
          do
          {
            if (v20[2](v20, v17)) {
              break;
            }
            ++v17;
          }
          while (v17 <= v19);
        }
      }
    }
  }
}

uint64_t __105__SATask_enumerateTaskStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

- (void)enumerateTaskStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_1E63F9EA0;
  BOOL v16 = a6;
  id v15 = v12;
  id v13 = v12;
  [(SATask *)self enumerateTaskStatesBetweenStartTime:a3 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:a4 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:v8 block:v14];
}

void __89__SATask_enumerateTaskStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 40) || (uint64_t v4 = [v3 startSampleIndex], v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    unint64_t v5 = v6;
  }
}

- (void)enumerateThreadStatesForThread:(void *)a3 dispatchQueue:(void *)a4 betweenStartTime:(unint64_t)a5 startSampleIndex:(void *)a6 endTime:(unint64_t)a7 endSampleIndex:(uint64_t)a8 reverseOrder:(void *)a9 block:
{
  unint64_t v16 = a2;
  uint64_t v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a9;
  char v21 = v20;
  if (!a1)
  {
LABEL_7:

    return;
  }
  if (v16 | v17)
  {
    if (v16)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
      v33[3] = &unk_1E63F9EC8;
      uint64_t v22 = &v34;
      id v34 = (id)v17;
      id v36 = v21;
      id v35 = (id)v16;
      [v35 enumerateThreadStatesBetweenStartTime:v18 startSampleIndex:a5 endTime:v19 endSampleIndex:a7 reverseOrder:a8 block:v33];
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2;
      v31[3] = &unk_1E63F9CD8;
      uint64_t v22 = &v32;
      id v32 = v20;
      -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:](v17, v18, a5, v19, a7, a8, v31);
    }

    goto LABEL_7;
  }
  int v23 = *__error();
  uint64_t v24 = _sa_logt();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_ERROR, "No thread nor dispatch queue", buf, 2u);
  }

  *__error() = v23;
  _SASetCrashLogMessage(518, "No thread nor dispatch queue", v25, v26, v27, v28, v29, v30, v31[0]);
  _os_crash();
  __break(1u);
}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!*(void *)(a1 + 32)
    || ([v3 dispatchQueue],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = *(void **)(a1 + 32),
        v4,
        id v6 = v7,
        v4 == v5))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = v7;
  }
}

void __131__SATask_enumerateThreadStatesForThread_dispatchQueue_betweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v8 = [v5 thread];
  id v6 = [v5 threadState];
  uint64_t v7 = [v5 threadStateIndex];

  (*(void (**)(uint64_t, id, void *, uint64_t, uint64_t))(v4 + 16))(v4, v8, v6, v7, a3);
}

- (uint64_t)gatherLoadInfoFromLiveProcessWithDataGatheringOptions:(int)a3 additionalCSSymbolicatorFlags:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  if ((a2 & 2) != 0 && !*(unsigned char *)(a1 + 64))
  {
    if ((a2 & 0x400) == 0 && *(_DWORD *)(a1 + 76)) {
      return 0;
    }
    uint64_t v7 = (id *)(id)a1;
    objc_sync_enter(v7);
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = 0;
LABEL_39:
      objc_sync_exit(v7);

      return v4;
    }
    *(unsigned char *)(a1 + 64) = 1;
    id v54 = 0;
    uint64_t v55 = 0;
    uint64_t v8 = *((unsigned int *)v7 + 19);
    id v52 = 0;
    id v53 = 0;
    id v51 = 0;
    CopyLoadInfosForLiveProcess(v8, a2, &v54, &v53, &v52, &v51, (uint64_t *)&v55, a3);
    id v9 = v54;
    id v10 = v54;
    id v50 = v53;
    id v11 = v52;
    id v12 = v52;
    id v13 = v51;
    id v14 = v51;
    id v15 = v14;
    if (!v10)
    {
      int v20 = *__error();
      char v21 = _sa_logt();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v36 = [v7 debugDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v36;
        _os_log_debug_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_DEBUG, "%@: Unable to inspect live processes for images infos", buf, 0xCu);
      }
      uint64_t v4 = 0;
      *__error() = v20;
      goto LABEL_38;
    }
    if (*((_DWORD *)v7 + 19))
    {
      unint64_t v16 = [v10 firstObject];
      uint64_t v17 = [v16 binary];
      id v18 = [v17 name];
      char v19 = -[SATask correspondsToName:mainBinaryLoadInfo:architecture:sharedCache:]((uint64_t)v7, v18, v16, (uint64_t)v55, v12);

      if ((v19 & 1) == 0)
      {
        int v22 = *__error();
        int v23 = _sa_logt();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v39 = [v7 debugDescription];
          long long v40 = [v7 mainBinaryLoadInfo];
          __int16 v41 = [v40 debugDescription];
          *(_DWORD *)buf = 138412802;
          uint64_t v57 = v39;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v41;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v16;
          _os_log_debug_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_DEBUG, "%@: live process has changed %@ -> %@", buf, 0x20u);
        }
        *__error() = v22;

        uint64_t v4 = 0;
        goto LABEL_38;
      }
    }
    else if (v14)
    {
      objc_storeStrong(v7 + 6, v13);
    }
    else
    {
      int v24 = *__error();
      uint64_t v25 = _sa_logt();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v43 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v43;
        _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "[%d] Unable to determine main binary", buf, 8u);
      }

      *__error() = v24;
    }
    if (v55)
    {
      v7[36] = v55;
    }
    else
    {
      int v26 = *__error();
      uint64_t v27 = _sa_logt();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v42 = *((_DWORD *)v7 + 19);
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v42;
        _os_log_error_impl(&dword_1BF22B000, v27, OS_LOG_TYPE_ERROR, "[%d] Unable to determine architecture", buf, 8u);
      }

      *__error() = v26;
    }
    uint64_t v28 = v7 + 31;
    uint64_t v29 = [v7[31] count];
    objc_storeStrong(v7 + 31, v9);
    id v30 = v7[32];
    if (v30 && v12 != v30)
    {
      int v44 = *__error();
      __int16 v45 = _sa_logt();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        v49 = [v7 debugDescription];
        v48 = [v12 debugDescription];
        uint64_t v46 = [v7[32] debugDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v57 = v49;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v48;
        __int16 v60 = 2112;
        uint64_t v47 = (void *)v46;
        uint64_t v61 = v46;
        _os_log_fault_impl(&dword_1BF22B000, v45, OS_LOG_TYPE_FAULT, "%@: Got dyld shared cache %@ though have existing %@", buf, 0x20u);
      }
      *__error() = v44;
    }
    objc_storeStrong(v7 + 32, v11);
    if (v29 == [v10 count])
    {
      int v31 = *__error();
      id v32 = _sa_logt();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [v7 debugDescription];
        uint64_t v34 = [*v28 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = v33;
        __int16 v58 = 2048;
        uint64_t v59 = v34;
        _os_log_impl(&dword_1BF22B000, v32, OS_LOG_TYPE_INFO, "%@: Inspected live processes for %lu images infos, nothing new", buf, 0x16u);
      }
    }
    else
    {
      int v31 = *__error();
      id v32 = _sa_logt();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        long long v37 = [v7 debugDescription];
        uint64_t v38 = [*v28 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v57 = v37;
        __int16 v58 = 2048;
        uint64_t v59 = v38;
        __int16 v60 = 2048;
        uint64_t v61 = v29;
        _os_log_debug_impl(&dword_1BF22B000, v32, OS_LOG_TYPE_DEBUG, "%@: Inspected live processes for %lu images infos (%lu previously)", buf, 0x20u);
      }
    }

    *__error() = v31;
    uint64_t v4 = 1;
    *((unsigned char *)v7 + 73) = 1;
LABEL_38:

    goto LABEL_39;
  }
  return v4;
}

- (uint64_t)correspondsToName:(void *)a3 mainBinaryLoadInfo:(uint64_t)a4 architecture:(void *)a5 sharedCache:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v9 && ![v9 length])
  {

    id v9 = 0;
    if (!v11) {
      goto LABEL_8;
    }
  }
  else if (!v11)
  {
    goto LABEL_8;
  }
  id v12 = *(id *)(a1 + 256);
  if (v12 && v12 != v11) {
    goto LABEL_25;
  }
LABEL_8:
  if (*(void *)(a1 + 288) && a4 && !CSArchitectureMatchesArchitecture()) {
    goto LABEL_25;
  }
  if (v10)
  {
    if ([v10 loadAddress])
    {
      if (*(unsigned char *)(a1 + 73))
      {
        id v13 = [(id)a1 mainBinaryLoadInfo];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = [v13 loadAddress];
          unint64_t v16 = [v14 segment];
          uint64_t v17 = v16;
          if (v16)
          {
            if ([v16 hasOffsetIntoBinary])
            {
              id v18 = [v14 segment];
              v15 -= [v18 offsetIntoBinary];
            }
            else
            {
              uint64_t v15 = [v10 loadAddress];
            }
          }
          if (v15 == [v10 loadAddress])
          {
            int v20 = [v14 binary];
            char v21 = [v20 uuid];
            int v22 = [v10 binary];
            int v23 = [v22 uuid];
            int v24 = [v21 isEqual:v23];

            if (v24)
            {

              goto LABEL_19;
            }
          }

LABEL_25:
          uint64_t v19 = 0;
          goto LABEL_26;
        }
      }
    }
  }
  if ((-[SATask _matchesNameStr:](a1, v9) & 1) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v19 = 1;
LABEL_26:

  return v19;
}

- (void)postprocessWithDataGatheringOptions:(int)a3 mightBeAlive:(void *)a4 machineArchitecture:(uint64_t)a5 dataSource:(uint64_t)a6 spindumpArchitecture:(void *)a7 spindumpSharedCache:(int)a8 additionalCSSymbolicatorFlags:
{
  uint64_t v254 = *MEMORY[0x1E4F143B8];
  id v160 = a7;
  id v165 = a7;
  if (a1)
  {
    uint64_t v199 = 0;
    v200 = &v199;
    uint64_t v201 = 0x2020000000;
    char v202 = 0;
    v198[0] = MEMORY[0x1E4F143A8];
    v198[1] = 3221225472;
    v198[2] = __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke;
    v198[3] = &unk_1E63F7D58;
    v198[4] = &v199;
    uint64_t v184 = a1;
    -[SATask enumerateFrames:](a1, v198);
    if ((a2 & 2) != 0)
    {
      if (a3)
      {
        -[SATask _gatherDataFromLiveProcessIsLate:mainBinaryPath:](a1, 0, 0);
        if (*((unsigned char *)v200 + 24) || !objc_msgSend(*(id *)(a1 + 248), "count", v160) || !*(_DWORD *)(a1 + 76)) {
          -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:](a1, a2, a8);
        }
      }
    }
    id v12 = objc_msgSend((id)a1, "mainBinary", v160);
    if ((a2 & 1) != 0 && !v12)
    {
      if ([*(id *)(a1 + 40) isAbsolutePath]
        && (id v13 = *(void **)(a1 + 40),
            objc_copyStruct(dest, (const void *)(v184 + 288), 8, 1, 0),
            +[SABinary binaryWithPath:architecture:additionalCSSymbolicatorFlags:]((uint64_t)SABinary, v13, *(uint64_t *)dest), id v14 = objc_claimAutoreleasedReturnValue(), (v15 = v14) != 0))
      {
        objc_storeStrong((id *)(v184 + 48), v14);
        id v12 = v15;
      }
      else
      {
        id v12 = 0;
      }
    }
    v166 = v12;
    v167 = [v12 uuid];
    v168 = [(id)v184 mainBinaryPath];
    if (v167)
    {
      if (([v168 isAbsolutePath] & 1) == 0)
      {
        [v166 gatherInfoWithDataGatheringOptions:a2 pid:*(unsigned int *)(v184 + 76)];
        int v22 = [v166 path];
        uint64_t v17 = v22;
        if (v22)
        {
          if ([v22 isAbsolutePath])
          {
            uint64_t v17 = v17;

            [(id)v184 setMainBinaryPath:v17];
            v168 = v17;
          }
          else if (!v168)
          {
            uint64_t v17 = v17;
            Path = -[NSString copyLastPathComponent](v17);
            uint64_t v19 = Path;
            if (*(void *)(v184 + 56) && objc_msgSend(Path, "hasPrefix:"))
            {
              int v24 = *(void **)(v184 + 56);
              *(void *)(v184 + 56) = 0;
            }
            v168 = v17;
            goto LABEL_37;
          }
        }
        goto LABEL_38;
      }
      if ((~a2 & 5) == 0)
      {
        unint64_t v16 = +[SABinaryLocator sharedBinaryLocator];
        uint64_t v17 = v16;
        if (v16)
        {
          id v18 = -[SABinaryLocator urlForUUID:](v16, v167);
          uint64_t v19 = v18;
          if (v18)
          {
            int v20 = [v18 path];
            if (v20)
            {
              char v21 = [v19 path];
              if ([v21 isEqualToString:v168])
              {

LABEL_36:
                [v17 done];
LABEL_37:

                goto LABEL_38;
              }
              uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
              int v26 = [v19 path];
              char v27 = [v25 fileExistsAtPath:v26];

              if (v27) {
                goto LABEL_36;
              }
            }
            int v28 = *__error();
            uint64_t v29 = _sa_logt();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              id v30 = [v19 path];
              *(_DWORD *)dest = 138543874;
              *(void *)&dest[4] = v167;
              __int16 v213 = 2112;
              id v214 = v30;
              __int16 v215 = 2112;
              uint64_t v216 = (uint64_t)v168;
              _os_log_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", dest, 0x20u);
            }
            *__error() = v28;
            -[SABinaryLocator removeURLForUUID:](v17, v167);
          }
          int v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v168 isDirectory:0];

          -[SABinaryLocator addURL:ForUUID:](v17, v31, v167);
          uint64_t v19 = v31;
          goto LABEL_36;
        }
LABEL_38:
      }
    }
    int v32 = [v168 isAbsolutePath];
    if ((a2 & 1) != 0
      && ((v32 ^ 1) & 1) == 0
      && !*(void *)(v184 + 104)
      && !*(void *)(v184 + 112)
      && !*(void *)(v184 + 120)
      && !*(void *)(v184 + 128)
      && !*(void *)(v184 + 136)
      && !*(void *)(v184 + 168)
      && !*(unsigned char *)(v184 + 65)
      && !*(void *)(v184 + 176)
      && !*(void *)(v184 + 184)
      && !*(void *)(v184 + 160)
      && !*(void *)(v184 + 200)
      && !*(unsigned char *)(v184 + 66)
      && !*(void *)(v184 + 192))
    {
      uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v168 isDirectory:0];
      if (v33)
      {
        uint64_t v34 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
        id v35 = v34;
        if (v34)
        {
          obuint64_t j = (id)SACFBundleCopyStringForKey(v34, (const __CFString *)*MEMORY[0x1E4F1D008]);
          CFURLRef v36 = CFBundleCopyBundleURL(v35);
          if (v166)
          {
            -[SABinary saveInfoFromBundle:](v166, v35);
            -[SABinary getCodeSignInfoWithBundleUrl:](v166, v36);
          }
          if (obj)
          {
            long long v37 = [(id)v184 name];
            BOOL v38 = [v37 compare:obj] == 0;

            if (!v38) {
              objc_storeStrong((id *)(v184 + 104), obj);
            }
          }
          if (v36)
          {
            CFURLRef v39 = v36;
            long long v40 = [(__CFURL *)v39 pathExtension];
            int v41 = [v40 isEqualToString:@"appex"];

            if (v41)
            {
              id v197 = 0;
              int v42 = (void *)[objc_alloc(MEMORY[0x1E4F223A8]) initWithURL:v39 error:&v197];
              id v43 = v197;
              if (v42)
              {
                int v44 = [v42 containingBundleRecord];
                __int16 v45 = v44;
                if (v44)
                {
                  uint64_t v46 = [v44 URL];
                  uint64_t v47 = v46;
                  if (v46)
                  {
                    CFURLRef v48 = v46;
                  }
                  else
                  {
                    int v188 = *__error();
                    id v53 = _sa_logt();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)dest = 138412290;
                      *(void *)&dest[4] = v39;
                      _os_log_error_impl(&dword_1BF22B000, v53, OS_LOG_TYPE_ERROR, "No parent url for %@", dest, 0xCu);
                    }

                    *__error() = v188;
                    CFURLRef v48 = v39;
                  }
                }
                else
                {
                  int v51 = *__error();
                  id v52 = _sa_logt();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)dest = 138412290;
                    *(void *)&dest[4] = v39;
                    _os_log_debug_impl(&dword_1BF22B000, v52, OS_LOG_TYPE_DEBUG, "No parent record for %@", dest, 0xCu);
                  }

                  *__error() = v51;
                  CFURLRef v48 = v39;
                }
              }
              else
              {
                int v49 = *__error();
                id v50 = _sa_logt();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)dest = 138412546;
                  *(void *)&dest[4] = v39;
                  __int16 v213 = 2112;
                  id v214 = v43;
                  _os_log_error_impl(&dword_1BF22B000, v50, OS_LOG_TYPE_ERROR, "No extension record for %@: %@", dest, 0x16u);
                }

                *__error() = v49;
                CFURLRef v48 = v39;
              }
            }
            else
            {
              id v43 = 0;
              CFURLRef v48 = v39;
            }
            id v196 = v43;
            id v54 = (void *)[objc_alloc(MEMORY[0x1E4F223D0]) initWithURL:v48 allowPlaceholder:1 error:&v196];
            id v55 = v196;

            if (v54)
            {
              uint64_t v56 = [v54 deviceIdentifierForVendor];
              uint64_t v57 = [v56 UUIDString];
              __int16 v58 = *(void **)(v184 + 176);
              *(void *)(v184 + 176) = v57;

              uint64_t v59 = [v54 iTunesMetadata];
              *(void *)(v184 + 160) = [v59 storeItemIdentifier];

              __int16 v60 = [v54 iTunesMetadata];
              uint64_t v61 = [v60 distributorInfo];
              uint64_t v62 = [v61 distributorID];
              long long v63 = *(void **)(v184 + 184);
              *(void *)(v184 + 184) = v62;

              long long v64 = [v54 iTunesMetadata];
              uint64_t v65 = [v64 storeCohortWithError:0];
              long long v66 = *(void **)(v184 + 192);
              *(void *)(v184 + 192) = v65;

              *(unsigned char *)(v184 + 65) = [v54 developerType];
              long long v67 = [v54 entitlements];
              long long v68 = [v67 objectForKey:@"beta-reports-active" ofClass:objc_opt_class()];

              if (v68) {
                *(unsigned char *)(v184 + 66) = 1;
              }
            }

            long long v69 = [(__CFURL *)v39 URLByAppendingPathComponent:@"Contents/version.plist" isDirectory:0];
            if (v69)
            {
              long long v70 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v69];
              v71 = v70;
              if (v70)
              {
                v72 = SANSDictionaryCopyStringForKey(v70, @"BuildVersion");
                v73 = *(void **)(v184 + 112);
                *(void *)(v184 + 112) = v72;

                v74 = SANSDictionaryCopyStringForKey(v71, @"ProjectName");
                uint64_t v75 = *(void **)(v184 + 120);
                *(void *)(v184 + 120) = v74;

                __int16 v76 = SANSDictionaryCopyStringForKey(v71, @"SourceVersion");
                v77 = *(void **)(v184 + 128);
                *(void *)(v184 + 128) = v76;

                __int16 v78 = SANSDictionaryCopyStringForKey(v71, @"ProductBuildVersion");
                uint64_t v79 = *(void **)(v184 + 136);
                *(void *)(v184 + 136) = v78;
              }
            }
          }
          CFRelease(v35);
        }
      }
    }
    uint64_t v80 = v184;
    if (*(void *)(v184 + 40))
    {
      uint64_t v81 = [(id)v184 mainBinary];
      uint64_t v82 = [v81 path];

      if (v82 && [v82 isEqualToString:*(void *)(v184 + 40)])
      {
        v83 = *(void **)(v184 + 40);
        *(void *)(v184 + 40) = 0;
      }
      uint64_t v80 = v184;
    }
    if (*(void *)(v80 + 56))
    {
      v84 = [(id)v80 mainBinaryPath];
      v85 = -[NSString copyLastPathComponent](v84);

      if (v85 && [v85 hasPrefix:*(void *)(v184 + 56)])
      {
        v86 = *(void **)(v184 + 56);
        *(void *)(v184 + 56) = 0;
      }
      uint64_t v80 = v184;
    }
    [*(id *)(v80 + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_94];
    long long v209 = 0u;
    long long v210 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    v87 = [(id)v184 taskStates];
    uint64_t v88 = [v87 countByEnumeratingWithState:&v207 objects:v253 count:16];
    if (v88)
    {
      id v189 = v87;
      uint64_t v185 = 0;
      id v89 = 0;
      id obja = *(id *)v208;
      do
      {
        uint64_t v90 = 0;
        v91 = v89;
        uint64_t v169 = v88;
        do
        {
          if (*(id *)v208 != obja) {
            objc_enumerationMutation(v189);
          }
          uint64_t v92 = *(void *)(*((void *)&v207 + 1) + 8 * v90);
          if (v91)
          {
            if ([*(id *)(*((void *)&v207 + 1) + 8 * v90) terminatedThreadsUserTimeInNs]
              && (unint64_t v93 = [(id)v92 terminatedThreadsUserTimeInNs],
                  v93 < [v91 terminatedThreadsUserTimeInNs])
              || [(id)v92 terminatedThreadsSystemTimeInNs]
              && (unint64_t v94 = [(id)v92 terminatedThreadsSystemTimeInNs],
                  v94 < [v91 terminatedThreadsSystemTimeInNs])
              || [(id)v92 terminatedThreadsInstructions]
              && (unint64_t v95 = [(id)v92 terminatedThreadsInstructions],
                  v95 < [v91 terminatedThreadsInstructions])
              || [(id)v92 terminatedThreadsCycles]
              && (unint64_t v96 = [(id)v92 terminatedThreadsCycles],
                  v96 < [v91 terminatedThreadsCycles])
              || [(id)v92 faults]
              && (unsigned int v97 = [(id)v92 faults], v97 < objc_msgSend(v91, "faults"))
              || [(id)v92 pageins]
              && (unsigned int v98 = [(id)v92 pageins], v98 < objc_msgSend(v91, "pageins"))
              || [(id)v92 cowFaults]
              && (unsigned int v99 = [(id)v92 cowFaults], v99 < objc_msgSend(v91, "cowFaults")))
            {
              int v100 = *__error();
              v101 = _sa_logt();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              {
                v186 = [(id)v184 debugDescription];
                v187 = [(id)v184 taskStates];
                uint64_t v116 = [v187 count];
                v183 = [v91 debugDescription];
                v182 = [(id)v92 debugDescription];
                uint64_t v181 = [v91 terminatedThreadsCpuTimeNs];
                uint64_t v180 = [v91 terminatedThreadsUserTimeInNs];
                uint64_t v179 = [v91 terminatedThreadsSystemTimeInNs];
                uint64_t v178 = [(id)v92 terminatedThreadsCpuTimeNs];
                uint64_t v177 = [(id)v92 terminatedThreadsUserTimeInNs];
                uint64_t v176 = [(id)v92 terminatedThreadsSystemTimeInNs];
                uint64_t v175 = [v91 terminatedThreadsInstructions];
                uint64_t v174 = [(id)v92 terminatedThreadsInstructions];
                uint64_t v173 = [v91 terminatedThreadsCycles];
                uint64_t v172 = [(id)v92 terminatedThreadsCycles];
                int v171 = [v91 faults];
                int v170 = [(id)v92 faults];
                int v117 = [v91 pageins];
                int v118 = [(id)v92 pageins];
                int v119 = [v91 cowFaults];
                int v120 = [(id)v92 cowFaults];
                *(_DWORD *)dest = 138417410;
                *(void *)&dest[4] = v186;
                __int16 v213 = 2048;
                id v214 = (id)(v185 + v90);
                __int16 v215 = 2048;
                uint64_t v216 = v116;
                __int16 v217 = 2112;
                v218 = v183;
                __int16 v219 = 2112;
                v220 = v182;
                __int16 v221 = 2048;
                uint64_t v222 = v181;
                __int16 v223 = 2048;
                uint64_t v224 = v180;
                __int16 v225 = 2048;
                uint64_t v226 = v179;
                __int16 v227 = 2048;
                uint64_t v228 = v178;
                __int16 v229 = 2048;
                uint64_t v230 = v177;
                __int16 v231 = 2048;
                uint64_t v232 = v176;
                __int16 v233 = 2048;
                uint64_t v234 = v175;
                __int16 v235 = 2048;
                uint64_t v236 = v174;
                __int16 v237 = 2048;
                uint64_t v238 = v173;
                __int16 v239 = 2048;
                uint64_t v240 = v172;
                __int16 v241 = 1024;
                int v242 = v171;
                __int16 v243 = 1024;
                int v244 = v170;
                __int16 v245 = 1024;
                int v246 = v117;
                __int16 v247 = 1024;
                int v248 = v118;
                __int16 v249 = 1024;
                int v250 = v119;
                __int16 v251 = 1024;
                int v252 = v120;
                _os_log_debug_impl(&dword_1BF22B000, v101, OS_LOG_TYPE_DEBUG, "Task %@ monotonically increasing data decreased at index %lu of %lu between %@ and %@:\nterminated threads cpu time %llu (%llu + %llu) -> %llu (%llu + %llu)\nterminated threads instructions %llu -> %llu\nterminated threads cycles %llu -> %llufaults %u -> %upageins %u -> %ucow faults %u -> %u", dest, 0xBCu);

                uint64_t v88 = v169;
              }

              *__error() = v100;
            }
            unint64_t v102 = [(id)v92 terminatedThreadsUserTimeInNs];
            if (v102 < [v91 terminatedThreadsUserTimeInNs])
            {
              uint64_t v103 = [v91 terminatedThreadsUserTimeInNs];
              if (v92) {
                *(void *)(v92 + 72) = v103;
              }
            }
            unint64_t v104 = [(id)v92 terminatedThreadsSystemTimeInNs];
            if (v104 < [v91 terminatedThreadsSystemTimeInNs])
            {
              uint64_t v105 = [v91 terminatedThreadsSystemTimeInNs];
              if (v92) {
                *(void *)(v92 + 80) = v105;
              }
            }
            unint64_t v106 = [(id)v92 terminatedThreadsInstructions];
            if (v106 < [v91 terminatedThreadsInstructions])
            {
              uint64_t v107 = [v91 terminatedThreadsInstructions];
              if (v92) {
                *(void *)(v92 + 88) = v107;
              }
            }
            unint64_t v108 = [(id)v92 terminatedThreadsCycles];
            if (v108 < [v91 terminatedThreadsCycles])
            {
              uint64_t v109 = [v91 terminatedThreadsCycles];
              if (v92) {
                *(void *)(v92 + 96) = v109;
              }
            }
            unsigned int v110 = [(id)v92 faults];
            if (v110 < [v91 faults])
            {
              int v111 = [v91 faults];
              if (v92) {
                *(_DWORD *)(v92 + 12) = v111;
              }
            }
            unsigned int v112 = [(id)v92 pageins];
            if (v112 < [v91 pageins])
            {
              int v113 = [v91 pageins];
              if (v92) {
                *(_DWORD *)(v92 + 16) = v113;
              }
            }
            unsigned int v114 = [(id)v92 cowFaults];
            if (v114 < [v91 cowFaults])
            {
              int v115 = [v91 cowFaults];
              if (v92) {
                *(_DWORD *)(v92 + 20) = v115;
              }
            }
          }
          id v89 = (id)v92;

          ++v90;
          v91 = v89;
        }
        while (v88 != v90);
        uint64_t v88 = [v189 countByEnumeratingWithState:&v207 objects:v253 count:16];
        v185 += v90;
      }
      while (v88);

      v87 = v189;
    }

    if (!*(void *)(v184 + 288)) {
      -[SATask guessArchitectureGivenMachineArchitecture:dataSource:](v184, a4, a5);
    }
    uint64_t v121 = v184;
    if (*(void *)(v184 + 264))
    {
LABEL_174:
      v135 = (id *)(v121 + 256);
      v136 = *(unsigned char **)(v121 + 256);
      if (!v136)
      {
LABEL_181:
        if (v165 && !v136)
        {
          if (!*(unsigned char *)(v184 + 72)
            && *(void *)(v184 + 288)
            && a6
            && CSArchitectureMatchesArchitecture()
            && *(_DWORD *)(v184 + 76)
            && *(void *)(v184 + 96))
          {
            int v156 = *__error();
            v157 = _sa_logt();
            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
            {
              v159 = [(id)v184 debugDescription];
              *(_DWORD *)dest = 138412290;
              *(void *)&dest[4] = v159;
              _os_log_debug_impl(&dword_1BF22B000, v157, OS_LOG_TYPE_DEBUG, "No info about the shared cache for (native architecture) process %@, assuming native shared cache", dest, 0xCu);
            }
            *__error() = v156;
            objc_storeStrong(v135, v161);
          }
          v136 = *v135;
        }
        if (!v136) {
          goto LABEL_204;
        }
        goto LABEL_186;
      }
      if ((v136[24] & 1) == 0)
      {
LABEL_186:
        unint64_t v143 = [v136 startAddress];
        if ([*v135 startAddress] != -1)
        {
          unint64_t v144 = [*v135 endAddress];
          long long v194 = 0u;
          long long v195 = 0u;
          long long v192 = 0u;
          long long v193 = 0u;
          id v145 = *(id *)(v184 + 248);
          v146 = 0;
          uint64_t v147 = [v145 countByEnumeratingWithState:&v192 objects:v211 count:16];
          if (v147)
          {
            uint64_t v148 = *(void *)v193;
            do
            {
              for (uint64_t i = 0; i != v147; ++i)
              {
                if (*(void *)v193 != v148) {
                  objc_enumerationMutation(v145);
                }
                v150 = *(void **)(*((void *)&v192 + 1) + 8 * i);
                unint64_t v151 = [v150 loadAddress];
                if (v151 >= v143 && v151 < v144)
                {
                  if (!v146) {
                    v146 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
                  }
                  [v146 addObject:v150];
                }
              }
              uint64_t v147 = [v145 countByEnumeratingWithState:&v192 objects:v211 count:16];
            }
            while (v147);
          }

          if ([v146 count])
          {
            v153 = (void *)[*(id *)(v184 + 248) mutableCopy];
            [v153 removeObjectsInArray:v146];
            uint64_t v154 = [v153 copy];
            v155 = *(void **)(v184 + 248);
            *(void *)(v184 + 248) = v154;
          }
        }
LABEL_204:

        _Block_object_dispose(&v199, 8);
        goto LABEL_205;
      }
      v137 = v136;
      v138 = [*v135 uuid];
      v139 = +[SASharedCache sharedCacheWithUUID:slide:slidBaseAddress:](SASharedCache, "sharedCacheWithUUID:slide:slidBaseAddress:", v138, [*v135 slide], objc_msgSend(*v135, "slidBaseAddress"));

      v140 = [v139 binaryLoadInfos];
      if ([v140 count])
      {
      }
      else
      {
        v141 = [v137 binaryLoadInfos];
        BOOL v142 = [v141 count] == 0;

        if (!v142) {
          goto LABEL_180;
        }
      }
      objc_storeStrong(v135, v139);
LABEL_180:

      v136 = *v135;
      goto LABEL_181;
    }
    v122 = [*(id *)(v184 + 24) objectForKeyedSubscript:&unk_1F1A9B010];
    v123 = v122;
    if (v122)
    {
      long long v209 = 0u;
      long long v210 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      v124 = [v122 states];
      uint64_t v125 = [v124 countByEnumeratingWithState:&v207 objects:dest count:16];
      if (v125)
      {
        v126 = 0;
        uint64_t v127 = *(void *)v208;
        do
        {
          for (uint64_t j = 0; j != v125; ++j)
          {
            if (*(void *)v208 != v127) {
              objc_enumerationMutation(v124);
            }
            v129 = [*(id *)(*((void *)&v207 + 1) + 8 * j) thread];
            if (v126)
            {
              BOOL v130 = v126 == v129;

              if (!v130)
              {

                goto LABEL_172;
              }
            }
            else
            {
              v126 = v129;
            }
          }
          uint64_t v125 = [v124 countByEnumeratingWithState:&v207 objects:dest count:16];
        }
        while (v125);

        if (!v126) {
          goto LABEL_173;
        }
        long long v205 = 0u;
        long long v206 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        v131 = [v126 threadStates];
        uint64_t v132 = [v131 countByEnumeratingWithState:&v203 objects:v253 count:16];
        if (v132)
        {
          uint64_t v133 = *(void *)v204;
          while (2)
          {
            for (uint64_t k = 0; k != v132; ++k)
            {
              if (*(void *)v204 != v133) {
                objc_enumerationMutation(v131);
              }
              if ([*(id *)(*((void *)&v203 + 1) + 8 * k) isIdleWorkQueue])
              {

                v126 = 0;
                goto LABEL_215;
              }
            }
            uint64_t v132 = [v131 countByEnumeratingWithState:&v203 objects:v253 count:16];
            if (v132) {
              continue;
            }
            break;
          }
        }
LABEL_215:

        v158 = *(void **)(v184 + 264);
        *(void *)(v184 + 264) = v126;
        v124 = v126;

        if (v124) {
          v124[17] = 1;
        }
      }
LABEL_172:
    }
LABEL_173:

    uint64_t v121 = v184;
    goto LABEL_174;
  }
LABEL_205:
}

void __161__SATask_postprocessWithDataGatheringOptions_mightBeAlive_machineArchitecture_dataSource_spindumpArchitecture_spindumpSharedCache_additionalCSSymbolicatorFlags___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = v6;
  id v11 = v6;
  if (v6 && (WeakRetained = objc_loadWeakRetained(v6 + 3), uint64_t v7 = v11, WeakRetained))
  {

    id v9 = v11;
  }
  else
  {
    char v10 = [v7 isFakeFrame];
    id v9 = v11;
    if ((v10 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (void)_gatherDataFromLiveProcessIsLate:(void *)a3 mainBinaryPath:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1 && !*(unsigned char *)(a1 + 71))
  {
    pid_t v5 = *(_DWORD *)(a1 + 76);
    if (v5)
    {
      if ((v5 & 0x80000000) == 0)
      {
        *(unsigned char *)(a1 + 71) = 1;
        if (!kill(v5, 0))
        {
          long long v49 = 0u;
          long long v50 = 0u;
          memset(buffer, 0, sizeof(buffer));
          int v6 = proc_pidinfo(*(_DWORD *)(a1 + 76), 13, 1uLL, buffer, 64);
          int v7 = DWORD1(v49);
          if (v6) {
            int v8 = DWORD1(buffer[0]);
          }
          else {
            int v8 = -1;
          }
          if (!v6) {
            int v7 = -314;
          }
          *(_DWORD *)(a1 + 80) = v8;
          *(_DWORD *)(a1 + 88) = v7;
          if (!v4)
          {
            uint64_t v19 = SAExecutablePath(*(_DWORD *)(a1 + 76), (const char *)[*(id *)(a1 + 56) UTF8String]);
            id v4 = v19;
            if (!v19) {
              goto LABEL_3;
            }
            if ([v19 isAbsolutePath]) {
              [(id)a1 setMainBinaryPath:v4];
            }
          }
          id v9 = [(id)a1 name];
          int v10 = [v9 isEqualToString:@"java"];

          if (v10)
          {
            if (_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken != -1) {
              dispatch_once(&_gatherDataFromLiveProcessIsLate_mainBinaryPath__onceToken, &__block_literal_global_13);
            }
            id v11 = (char *)malloc_type_calloc(1uLL, _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size, 0x39EB6D0EuLL);
            size_t v42 = _gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size;
            *(void *)flags = 0x3100000001;
            int v47 = *(_DWORD *)(a1 + 76);
            if (sysctl((int *)flags, 3u, v11, &v42, 0, 0))
            {
              int v12 = *__error();
              id v13 = _sa_logt();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                int v29 = *(_DWORD *)(a1 + 76);
                int v30 = *__error();
                int v31 = __error();
                int v32 = strerror(*v31);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&uint8_t buf[4] = v29;
                __int16 v44 = 1024;
                *(_DWORD *)__int16 v45 = v30;
                *(_WORD *)&v45[4] = 2080;
                *(void *)&v45[6] = v32;
                _os_log_debug_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_DEBUG, "unable to get arguments for %d: %d %s", buf, 0x18u);
              }
            }
            else
            {
              if ((uint64_t)v42 >= 5)
              {
                char v21 = &v11[v42];
                int v22 = v11 + 4;
                do
                {
                  size_t v23 = strlen(v22);
                  if (&v22[v23] >= v21) {
                    break;
                  }
                  size_t v24 = v23;
                  if (!strncmp("-jar", v22, 5uLL))
                  {
                    v22 += v24 + 1;
                    uint64_t v33 = rindex(v22, 47);
                    if (v33) {
                      int v22 = v33 + 1;
                    }
                    int64_t v34 = strlen(v22);
                    if (v34 >= 5 && (id v35 = &v22[v34 - 4], !strncmp(".jar", v35, 4uLL)))
                    {
                      *id v35 = 0;
                    }
                    else
                    {
LABEL_55:
                      if (!v22) {
                        break;
                      }
                    }
LABEL_56:
                    int v36 = *__error();
                    long long v37 = _sa_logt();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                    {
                      int v41 = *(_DWORD *)(a1 + 76);
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)&uint8_t buf[4] = v41;
                      __int16 v44 = 2080;
                      *(void *)__int16 v45 = v22;
                      _os_log_debug_impl(&dword_1BF22B000, v37, OS_LOG_TYPE_DEBUG, "Renaming java process [%d] to %s", buf, 0x12u);
                    }

                    *__error() = v36;
                    if (!*(_DWORD *)(a1 + 76) || strcmp(v22, "kernel_task"))
                    {
                      uint64_t v38 = SANSStringForCString(v22);
                      CFURLRef v39 = *(void **)(a1 + 56);
                      *(void *)(a1 + 56) = v38;
                    }
                    goto LABEL_20;
                  }
                  if (v24)
                  {
                    int v25 = *v22;
                    if (!*v22) {
                      goto LABEL_56;
                    }
                    uint64_t v26 = 1;
                    while ((v25 & 0xDFu) - 65 < 0x1A || v25 == 46 || (v25 - 48) <= 9)
                    {
                      int v25 = v22[v26++];
                      if (!v25) {
                        goto LABEL_55;
                      }
                    }
                  }
                  v22 += v24 + 1;
                }
                while (v22 < v21);
              }
              int v12 = *__error();
              id v13 = _sa_logt();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                int v40 = *(_DWORD *)(a1 + 76);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v40;
                _os_log_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to find name for java processes [%d]", buf, 8u);
              }
            }

            *__error() = v12;
LABEL_20:
            free(v11);
          }
          if (!*(void *)(a1 + 288))
          {
            int v14 = *(_DWORD *)(a1 + 76);
            *(void *)buf = 0;
            if (proc_pidinfo(v14, 19, 1uLL, buf, 8)) {
              *(void *)(a1 + 288) = *(unsigned int *)buf | ((unint64_t)(*(_DWORD *)&buf[4] & 0xFFFFFF) << 32);
            }
          }
          flags[0] = 0;
          int dirty = proc_get_dirty(*(_DWORD *)(a1 + 76), flags);
          if (dirty)
          {
            int v16 = dirty;
            int v17 = *__error();
            id v18 = _sa_logt();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              int v27 = *(_DWORD *)(a1 + 76);
              int v28 = strerror(v16);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&uint8_t buf[4] = v27;
              __int16 v44 = 2080;
              *(void *)__int16 v45 = v28;
              *(_WORD *)&v45[8] = 1024;
              *(_DWORD *)&v45[10] = v16;
              _os_log_debug_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_DEBUG, "Unable to check dirty state for %d: %s %d", buf, 0x18u);
            }

            *__error() = v17;
          }
          else
          {
            char v20 = flags[0];
            if (flags[0])
            {
              *(unsigned char *)(a1 + 68) = 1;
              *(unsigned char *)(a1 + 69) = (v20 & 2) != 0;
            }
          }
          *(void *)(a1 + 240) = 0;
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 71) = 1;
      *(_DWORD *)(a1 + 88) = 0;
      *(void *)(a1 + 80) = 0;
    }
  }
LABEL_3:
}

uint64_t __58__SATask__gatherDataFromLiveProcessIsLate_mainBinaryPath___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v3 = 0;
  *(void *)v2 = 0x800000001;
  size_t v1 = 4;
  return sysctl(v2, 2u, &_gatherDataFromLiveProcessIsLate_mainBinaryPath__max_arguments_size, &v1, 0, 0);
}

- (id)leafFrameAfterAddingStack:(void *)a3 leafOfCRootFramesReplacedBySwiftAsync:
{
  id v5 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 280))
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      int v7 = *(void **)(a1 + 280);
      *(void *)(a1 + 280) = v6;
    }
    if (a3) {
      *a3 = 0;
    }
    int v8 = *(void **)(a1 + 280);
    if (*(_DWORD *)(a1 + 76))
    {
      id v9 = +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 1, v8);
      if (a3 && [v5 hasSwiftAsyncStack])
      {
        +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 16, *(void **)(a1 + 280));
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v9 = +[SAFrame addStack:backtraceStyle:toSetOfRootFrames:]((uint64_t)SAFrame, v5, 2, v8);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (SAFrame)truncatedUserStackFrameSwiftAsync:(SAFrame *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a1[5]._childFrameOrFrames)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id childFrameOrFrames = v2[5]._childFrameOrFrames;
      v2[5]._id childFrameOrFrames = v4;
    }
    uint64_t v6 = objc_alloc_init(SAFrame);
    int v7 = v6;
    if (v6)
    {
      if (a2) {
        char v8 = 10;
      }
      else {
        char v8 = 8;
      }
      unsigned __int8 v9 = v8 | v6->_BOOLs.bits & 0xF5;
      v6->_BOOLs.bits = v9;
      v6->_BOOLs.bits = v9 & 0xFB | (4 * (HIDWORD(v2[1]._binaryLoadInfo) == 0));
    }
    int v10 = [v2[5]._childFrameOrFrames member:v6];
    id v11 = v10;
    if (!v10)
    {
      [v2[5]._childFrameOrFrames addObject:v7];
      id v11 = v7;
    }
    v2 = v11;
  }
  return v2;
}

- (uint64_t)_matchesNameStr:(uint64_t)a1
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 73))
  {
    id v4 = [(id)a1 name];
LABEL_5:
    id v6 = v4;
    goto LABEL_6;
  }
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v4 = v5;
    goto LABEL_5;
  }
  Path = -[NSString copyLastPathComponent](*(void **)(a1 + 40));
  int v16 = Path;
  if (Path)
  {
    id v6 = Path;
  }
  else
  {
    int v17 = [*(id *)(a1 + 48) path];
    id v6 = -[NSString copyLastPathComponent](v17);
  }
LABEL_6:
  int v7 = 0;
  if (v3 && v6)
  {
    if ([v3 length])
    {
      if ([v6 hasPrefix:v3])
      {
        [v3 length];
        int v7 = 0;
        goto LABEL_16;
      }
      int v7 = [v3 hasPrefix:v6];
    }
    else
    {
      int v7 = 0;
    }
    uint64_t v8 = [v3 length];
    if ((v7 & 1) == 0 && v8)
    {
      uint64_t v9 = 0;
      goto LABEL_24;
    }
  }
LABEL_16:
  uint64_t v10 = [v3 length];
  if (v6) {
    int v11 = v7;
  }
  else {
    int v11 = 1;
  }
  uint64_t v9 = 1;
  if (v10 && v11 && (!*(_DWORD *)(a1 + 76) || ([v3 isEqualToString:@"kernel_task"] & 1) == 0))
  {
    uint64_t v12 = [v3 copy];
    id v13 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v12;
  }
LABEL_24:

  return v9;
}

- (BOOL)addImageInfos:(uint64_t)a1
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_91;
  }
  if (!v3)
  {
    BOOL v52 = 0;
    id v5 = 0;
    goto LABEL_98;
  }
  if (![v3 count])
  {
LABEL_91:
    BOOL v52 = 0;
    id v5 = v4;
    goto LABEL_98;
  }
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_70];

  uint64_t v8 = *(void **)(a1 + 248);
  int v7 = (id *)(a1 + 248);
  id v6 = v8;
  if (!v8 || ![v6 count])
  {
    objc_storeStrong(v7, v5);
    BOOL v52 = 1;
    goto LABEL_98;
  }
  uint64_t v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v5;
  uint64_t v92 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
  if (!v92)
  {
    uint64_t v10 = 0;
    goto LABEL_93;
  }
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v91 = *(void *)v108;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v108 != v91) {
        objc_enumerationMutation(obj);
      }
      uint64_t v93 = v11;
      uint64_t v12 = *(void **)(*((void *)&v107 + 1) + 8 * v11);
      unsigned int v98 = [v12 binary];
      uint64_t v13 = [v12 segment];
      uint64_t v96 = [v12 length];
      unsigned int v97 = (void *)v13;
      if (v96) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v13 == 0;
      }
      unint64_t v95 = v12;
      if (v14)
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        uint64_t v15 = [v98 segments];
        int v16 = [v15 reverseObjectEnumerator];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v104;
          while (1)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v104 != v19) {
                objc_enumerationMutation(v16);
              }
              char v21 = *(void **)(*((void *)&v103 + 1) + 8 * i);
              if ([v21 hasOffsetIntoBinary])
              {
                if (![v21 length]) {
                  goto LABEL_28;
                }
                uint64_t v22 = [v21 offsetIntoBinary];
                uint64_t v96 = [v21 length] + v22;
LABEL_29:
                uint64_t v12 = v95;
LABEL_30:

                goto LABEL_31;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v103 objects:v116 count:16];
            if (!v18)
            {
LABEL_28:
              uint64_t v96 = 0;
              goto LABEL_29;
            }
          }
        }
        uint64_t v96 = 0;
        goto LABEL_30;
      }
      while (1)
      {
LABEL_31:
        if (v9 >= [*v7 count]) {
          goto LABEL_74;
        }
        size_t v23 = [*v7 objectAtIndexedSubscript:v9];
        size_t v24 = [v23 binary];
        int v25 = [v23 segment];
        uint64_t v26 = [v23 length];
        if (v26) {
          BOOL v27 = 0;
        }
        else {
          BOOL v27 = v25 == 0;
        }
        if (v27)
        {
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          int v28 = [v24 segments];
          int v29 = [v28 reverseObjectEnumerator];

          uint64_t v26 = [v29 countByEnumeratingWithState:&v99 objects:v115 count:16];
          if (v26)
          {
            unint64_t v94 = v10;
            int v30 = v7;
            uint64_t v31 = *(void *)v100;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v100 != v31) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v33 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                if ([v33 hasOffsetIntoBinary])
                {
                  if ([v33 length])
                  {
                    uint64_t v34 = [v33 offsetIntoBinary];
                    uint64_t v26 = [v33 length] + v34;
                  }
                  else
                  {
                    uint64_t v26 = 0;
                  }
                  goto LABEL_49;
                }
              }
              uint64_t v26 = [v29 countByEnumeratingWithState:&v99 objects:v115 count:16];
              if (v26) {
                continue;
              }
              break;
            }
LABEL_49:
            int v7 = v30;
            uint64_t v10 = v94;
            uint64_t v12 = v95;
          }
        }
        unint64_t v35 = [v23 loadAddress];
        if (!v26) {
          break;
        }
        if (v35 + v26 > [v12 loadAddress]) {
          goto LABEL_55;
        }
LABEL_70:

        ++v9;
      }
      if (v35 < [v12 loadAddress]) {
        goto LABEL_70;
      }
LABEL_55:
      unint64_t v36 = [v23 loadAddress];
      unint64_t v37 = [v12 loadAddress];
      if (v96)
      {
        if (v36 >= v37 + v96) {
          goto LABEL_73;
        }
LABEL_59:
        if (v24 != v98) {
          goto LABEL_82;
        }
        if (v25 == v97)
        {
          int v25 = v97;
          [v23 loadAddress];
          [v12 loadAddress];
LABEL_81:
          size_t v24 = v98;
LABEL_82:

          goto LABEL_83;
        }
        if (v25 && v97) {
          goto LABEL_81;
        }
        if (!v25)
        {
          unint64_t v44 = [v23 loadAddress];
          if (v44 > [v12 loadAddress]) {
            goto LABEL_80;
          }
          uint64_t v45 = [v23 loadAddress];
          id v46 = v12;
          unint64_t v47 = [v23 length] + v45;
          uint64_t v48 = [v46 loadAddress];
          if (v47 < [v46 length] + v48) {
            goto LABEL_80;
          }
          uint64_t v49 = [v46 loadAddress];
          uint64_t v50 = v49 - [v23 loadAddress];
          if ([v97 hasOffsetIntoBinary])
          {
            if ([v97 offsetIntoBinary] == v50) {
              goto LABEL_80;
            }
LABEL_102:
            int v73 = *__error();
            v74 = _sa_logt();
            uint64_t v75 = v46;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              id v76 = [v23 debugDescription];
              uint64_t v77 = [v76 UTF8String];
              id v78 = [v75 debugDescription];
              uint64_t v79 = [v78 UTF8String];
              *(_DWORD *)buf = 136315394;
              uint64_t v112 = v77;
              __int16 v113 = 2080;
              uint64_t v114 = v79;
              _os_log_error_impl(&dword_1BF22B000, v74, OS_LOG_TYPE_ERROR, "load info for entire binary %s doesn't match segment load info %s", buf, 0x16u);
            }
            *__error() = v73;
            id v80 = [v23 debugDescription];
            char v81 = [v80 UTF8String];
            id v82 = [v75 debugDescription];
            [v82 UTF8String];
            _SASetCrashLogMessage(1544, "load info for entire binary %s doesn't match segment load info %s", v83, v84, v85, v86, v87, v88, v81);

            _os_crash();
            __break(1u);
          }
          if (v97)
          {
            int v25 = 0;
            v97[5] = v50;
          }
          else
          {
LABEL_80:
            int v25 = 0;
          }
          goto LABEL_81;
        }
        unint64_t v38 = [v12 loadAddress];
        if (v38 > [v23 loadAddress]) {
          goto LABEL_81;
        }
        uint64_t v39 = [v12 loadAddress];
        unint64_t v40 = [v12 length] + v39;
        uint64_t v41 = [v23 loadAddress];
        if (v40 < [v23 length] + v41) {
          goto LABEL_81;
        }
        uint64_t v42 = [v23 loadAddress];
        uint64_t v43 = v42 - [v12 loadAddress];
        if ([v25 hasOffsetIntoBinary])
        {
          if ([v25 offsetIntoBinary] != v43)
          {
            int v59 = *__error();
            __int16 v60 = _sa_logt();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              id v61 = [v12 debugDescription];
              uint64_t v62 = [v61 UTF8String];
              id v63 = [v23 debugDescription];
              uint64_t v64 = [v63 UTF8String];
              *(_DWORD *)buf = 136315394;
              uint64_t v112 = v62;
              __int16 v113 = 2080;
              uint64_t v114 = v64;
              _os_log_error_impl(&dword_1BF22B000, v60, OS_LOG_TYPE_ERROR, "load info for entire binary %s doesn't match segment load info %s", buf, 0x16u);

              uint64_t v12 = v95;
            }

            *__error() = v59;
            id v65 = [v12 debugDescription];
            char v66 = [v65 UTF8String];
            id v46 = [v23 debugDescription];
            [v46 UTF8String];
            _SASetCrashLogMessage(1520, "load info for entire binary %s doesn't match segment load info %s", v67, v68, v69, v70, v71, v72, v66);

            _os_crash();
            __break(1u);
            goto LABEL_102;
          }
          if (v10) {
            goto LABEL_69;
          }
LABEL_72:
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        }
        else
        {
          v25[5] = v43;
          if (!v10) {
            goto LABEL_72;
          }
        }
LABEL_69:
        [v10 addObject:v23];
        goto LABEL_70;
      }
      if (v36 <= v37) {
        goto LABEL_59;
      }
LABEL_73:

LABEL_74:
      [v90 addObject:v12];
LABEL_83:

      uint64_t v11 = v93 + 1;
    }
    while (v93 + 1 != v92);
    uint64_t v51 = [obj countByEnumeratingWithState:&v107 objects:v117 count:16];
    uint64_t v92 = v51;
  }
  while (v51);
LABEL_93:
  id v5 = obj;

  uint64_t v53 = [v90 count];
  BOOL v52 = v53 != 0;
  if (v53)
  {
    id v54 = (void *)[*v7 mutableCopy];
    id v55 = v54;
    if (v10) {
      [v54 removeObjectsInArray:v10];
    }
    [v55 addObjectsFromArray:v90];
    [v55 sortUsingComparator:&__block_literal_global_70];
    uint64_t v56 = [v55 copy];
    id v57 = *v7;
    id *v7 = (id)v56;
  }
LABEL_98:

  return v52;
}

- (uint64_t)correspondsToUniquePid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17 = a9;
  if (a1 && *(void *)(a1 + 96) == a2)
  {
    if (a2)
    {
      uint64_t v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }
    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(void *)(a1 + 288)) {
        *(void *)(a1 + 288) = a8;
      }
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (uint64_t)correspondsToPid:(void *)a3 name:(NSObject *)a4 loadInfos:(unsigned int)a5 numLoadInfos:(NSObject *)a6 textExecLoadInfos:(unsigned int)a7 numTextExecLoadInfos:(uint64_t)a8 architecture:(void *)a9 sharedCache:
{
  id v17 = a9;
  if (a1 && *(_DWORD *)(a1 + 76) == a2)
  {
    if (a2)
    {
      uint64_t v18 = -[SATask correspondsToName:loadInfos:numLoadInfos:architecture:sharedCache:](a1, a3, a4, a5, a8, v17);
    }
    else
    {
      -[SATask _incorporateNewKernelLoadInfos:numLoadInfos:textExecLoadInfos:numTextExecLoadInfos:](a1, a4, a5, a6, a7);
      if (!*(void *)(a1 + 288)) {
        *(void *)(a1 + 288) = a8;
      }
      uint64_t v18 = 1;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t __24__SATask_addImageInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 loadAddress];
  if (v6 >= [v5 loadAddress])
  {
    unint64_t v8 = [v4 loadAddress];
    uint64_t v7 = v8 > [v5 loadAddress];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(SATask *)self name];
  id v5 = (void *)[v3 initWithFormat:@"%@ [%d]", v4, self->_pid];

  return (NSString *)v5;
}

- (void)fixupThreadSuspension
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v15 = [*(id *)(a1 + 16) allValues];
    v2 = malloc_type_calloc([v15 count], 8uLL, 0x100004000313F17uLL);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = *(id *)(a1 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v8 isSuspended])
          {
            unint64_t v9 = [v8 startTimestamp];
            uint64_t v10 = [v8 endTimestamp];
            uint64_t v11 = [v8 startSampleIndex];
            uint64_t v12 = [v8 endSampleIndex];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __31__SATask_fixupThreadSuspension__block_invoke;
            v16[3] = &unk_1E63F9EF0;
            id v17 = v9;
            id v18 = v10;
            uint64_t v19 = v2;
            uint64_t v20 = v11;
            uint64_t v21 = v12;
            id v13 = v10;
            id v14 = v9;
            [v15 enumerateObjectsUsingBlock:v16];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }

    free(v2);
  }
}

void __31__SATask_fixupThreadSuspension__block_invoke(NSObject *a1, void *a2, uint64_t a3)
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v212 = a2;
  unint64_t v5 = *((void *)a1[6].isa + a3);
  uint64_t v6 = [v212 threadStates];
  unint64_t v7 = [v6 count];

  if (v5 >= v7) {
    goto LABEL_74;
  }
  unint64_t v8 = v212;
  while (1)
  {
    unint64_t v9 = [v8 threadStates];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v5];

    uint64_t v11 = [v10 startTimestamp];
    uint64_t v12 = [v10 endTimestamp];
    if ([v12 le:a1[4].isa]) {
      goto LABEL_71;
    }
    if ([(objc_class *)a1[5].isa le:v11]) {
      break;
    }
    if ([v10 isSuspended]) {
      goto LABEL_71;
    }
    int v13 = [(objc_class *)a1[4].isa gt:v11];
    int v14 = [(objc_class *)a1[5].isa lt:v12];
    if (v13 && (a1[7].isa || a1[8].isa == (Class)0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v210 = [v10 startSampleIndex];
      Class v15 = (Class)[v10 endSampleIndex];
      uint64_t v16 = [v10 copy];
      id v3 = v10;
      if (v16) {
        objc_setProperty_atomic((id)v16, v17, a1[4].isa, 56);
      }
      if (v3) {
        objc_setProperty_atomic(v3, v17, a1[4].isa, 48);
      }
      Class isa = a1[8].isa;
      uint64_t v19 = (id *)v212;
      if (v15 == (Class)0x7FFFFFFFFFFFFFFFLL)
      {
        if (isa != (Class)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_90;
        }
LABEL_38:
        -[SAThread insertState:atIndex:](v19, (void *)v16, v5++);

        goto LABEL_39;
      }
      if (isa == (Class)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_93;
      }
      unint64_t v209 = (unint64_t)v15;
      unint64_t v20 = v210;
      if (v210 != 0x7FFFFFFFFFFFFFFFLL)
      {
        Class v21 = a1[7].isa;
        if (v21 == (Class)0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v22 = (unint64_t)a1[8].isa;
        }
        else {
          unint64_t v22 = (unint64_t)v21 - 1;
        }
        -[SAThreadState setEndSampleIndex:](v16, v22);
        if (v22 < v210)
        {
          uint64_t v23 = v16;
          goto LABEL_26;
        }
        if (v209 <= v22)
        {
          uint64_t v23 = (uint64_t)v3;
LABEL_26:
          unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v24 = v22 + 1;
          uint64_t v23 = (uint64_t)v3;
        }
        -[SAThreadState setStartSampleIndex:](v23, v24);
        unint64_t v20 = v210;
      }
      if (([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
         || [v3 startSampleIndex] != v20)
        && ([(id)v16 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL
         || [(id)v16 startSampleIndex] != v20))
      {
        goto LABEL_102;
      }
      if ([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v25 = [(id)v16 endSampleIndex];
        if (v25 < [(id)v16 startSampleIndex]) {
          goto LABEL_111;
        }
      }
      if ([v3 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v26 = [v3 endSampleIndex];
        if (v26 < [v3 startSampleIndex]) {
          goto LABEL_114;
        }
      }
      unint64_t v27 = [v3 endSampleIndex];
      BOOL v28 = v27 >= [(id)v16 endSampleIndex];
      uint64_t v19 = (id *)v212;
      if (!v28) {
        goto LABEL_96;
      }
      goto LABEL_38;
    }
LABEL_39:
    if (!v14) {
      goto LABEL_66;
    }
    Class v15 = (Class)[v10 startSampleIndex];
    unint64_t v29 = [v10 endSampleIndex];
    id v3 = (unsigned char *)[v10 copy];
    int v30 = v10;
    uint64_t v16 = (uint64_t)v30;
    if (v30) {
      objc_setProperty_atomic(v30, v31, a1[5].isa, 56);
    }
    if (v3) {
      objc_setProperty_atomic(v3, v31, a1[5].isa, 48);
    }
    unint64_t v32 = (unint64_t)a1[8].isa;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v32 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_84;
      }
      if (v15 != (Class)0x7FFFFFFFFFFFFFFFLL)
      {
        -[SAThreadState setEndSampleIndex:](v16, v32);
        Class v33 = a1[8].isa;
        if (v33 < v15)
        {
          uint64_t v34 = v16;
          goto LABEL_54;
        }
        if (v29 <= (unint64_t)v33)
        {
          uint64_t v34 = (uint64_t)v3;
LABEL_54:
          unint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v35 = (unint64_t)v33 + 1;
          uint64_t v34 = (uint64_t)v3;
        }
        -[SAThreadState setStartSampleIndex:](v34, v35);
      }
      unint64_t v210 = v29;
      if (([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
         || (Class)[v3 startSampleIndex] != v15)
        && ([(id)v16 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL
         || (Class)[(id)v16 startSampleIndex] != v15))
      {
        goto LABEL_99;
      }
      if ([(id)v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v36 = [(id)v16 endSampleIndex];
        if (v36 < [(id)v16 startSampleIndex]) {
          goto LABEL_105;
        }
      }
      if ([v3 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v37 = [v3 endSampleIndex];
        if (v37 < [v3 startSampleIndex]) {
          goto LABEL_108;
        }
      }
      unint64_t v38 = [v3 endSampleIndex];
      if (v38 < [(id)v16 endSampleIndex]) {
        goto LABEL_87;
      }
      goto LABEL_65;
    }
    if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_81;
    }
LABEL_65:
    -[SAThread insertState:atIndex:]((id *)v212, v3, v5 + 1);

LABEL_66:
    if (a1[7].isa)
    {
      Class v39 = a1[4].isa;
      unint64_t v40 = [v10 startTimestamp];
      LOBYTE(v39) = [(objc_class *)v39 le:v40];

      if ((v39 & 1) == 0) {
        goto LABEL_117;
      }
    }
    Class v41 = a1[5].isa;
    Class v15 = [v10 endTimestamp];
    LOBYTE(v41) = [(objc_class *)v41 ge:v15];

    if ((v41 & 1) == 0)
    {
      uint64_t v16 = *__error();
      unint64_t v44 = _sa_logt();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v45 = [(objc_class *)a1[5].isa debugDescription];
        Class v15 = (Class)[v45 UTF8String];
        id v46 = [v10 endTimestamp];
        id v3 = [v46 debugDescription];
        *(_DWORD *)buf = 136315394;
        unint64_t v222 = (unint64_t)v15;
        __int16 v223 = 2080;
        uint64_t v224 = [v3 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v44, OS_LOG_TYPE_ERROR, "taskSuspendEndTime %s < threadState.endTimestamp %s", buf, 0x16u);
      }
      *__error() = v16;
      a1 = [(objc_class *)a1[5].isa debugDescription];
      char v47 = [a1 UTF8String];
      uint64_t v48 = [v10 endTimestamp];
      id v49 = [v48 debugDescription];
      [v49 UTF8String];
      _SASetCrashLogMessage(1794, "taskSuspendEndTime %s < threadState.endTimestamp %s", v50, v51, v52, v53, v54, v55, v47);

      _os_crash();
      __break(1u);
LABEL_81:
      unint64_t v29 = *__error();
      uint64_t v56 = _sa_logt();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        Class v57 = a1[8].isa;
        *(_DWORD *)buf = 134217984;
        unint64_t v222 = (unint64_t)v57;
        _os_log_error_impl(&dword_1BF22B000, v56, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", buf, 0xCu);
      }

      *__error() = v29;
      _SASetCrashLogMessage(1749, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", v58, v59, v60, v61, v62, v63, (char)a1[8].isa);
      _os_crash();
      __break(1u);
LABEL_84:
      int v64 = *__error();
      a1 = _sa_logt();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v222 = v29;
        _os_log_error_impl(&dword_1BF22B000, a1, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", buf, 0xCu);
      }

      *__error() = v64;
      _SASetCrashLogMessage(1752, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", v65, v66, v67, v68, v69, v70, v29);
      _os_crash();
      __break(1u);
LABEL_87:
      int v213 = *__error();
      uint64_t v71 = _sa_logt();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        Class v73 = a1[7].isa;
        Class v72 = a1[8].isa;
        uint64_t v74 = [(id)v16 startSampleIndex];
        uint64_t v75 = [(id)v16 endSampleIndex];
        uint64_t v76 = [v3 startSampleIndex];
        uint64_t v77 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = (unint64_t)v15;
        __int16 v223 = 2048;
        uint64_t v224 = v210;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v73;
        __int16 v227 = 2048;
        Class v228 = v72;
        __int16 v229 = 2048;
        uint64_t v230 = v74;
        __int16 v231 = 2048;
        uint64_t v232 = v75;
        __int16 v233 = 2048;
        uint64_t v234 = v76;
        __int16 v235 = 2048;
        uint64_t v236 = v77;
        _os_log_error_impl(&dword_1BF22B000, v71, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v213;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1781, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v78, v79, v80, v81, v82, v83, (char)v15);
      _os_crash();
      __break(1u);
LABEL_90:
      int v84 = *__error();
      uint64_t v85 = _sa_logt();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        Class v86 = a1[8].isa;
        *(_DWORD *)buf = 134217984;
        unint64_t v222 = (unint64_t)v86;
        _os_log_error_impl(&dword_1BF22B000, v85, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", buf, 0xCu);
      }

      *__error() = v84;
      _SASetCrashLogMessage(1676, "threadEndSampleIndex is NSNotFound, but taskSuspendEndSampleIndex is %lu", v87, v88, v89, v90, v91, v92, (char)a1[8].isa);
      _os_crash();
      __break(1u);
LABEL_93:
      int v93 = *__error();
      a1 = _sa_logt();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v222 = (unint64_t)v15;
        _os_log_error_impl(&dword_1BF22B000, a1, OS_LOG_TYPE_ERROR, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", buf, 0xCu);
      }

      *__error() = v93;
      _SASetCrashLogMessage(1679, "threadEndSampleIndex is %lu, but taskSuspendEndSampleIndex is NSNotFound", v94, v95, v96, v97, v98, v99, (char)v15);
      _os_crash();
      __break(1u);
LABEL_96:
      int v214 = *__error();
      long long v100 = _sa_logt();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        Class v101 = a1[7].isa;
        Class v102 = a1[8].isa;
        uint64_t v103 = [(id)v16 startSampleIndex];
        uint64_t v104 = [(id)v16 endSampleIndex];
        uint64_t v105 = [v3 startSampleIndex];
        uint64_t v106 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = v210;
        __int16 v223 = 2048;
        uint64_t v224 = v209;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v101;
        __int16 v227 = 2048;
        Class v228 = v102;
        __int16 v229 = 2048;
        uint64_t v230 = v103;
        __int16 v231 = 2048;
        uint64_t v232 = v104;
        __int16 v233 = 2048;
        uint64_t v234 = v105;
        __int16 v235 = 2048;
        uint64_t v236 = v106;
        _os_log_error_impl(&dword_1BF22B000, v100, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v214;
      Class v15 = a1[8].isa;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1722, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v107, v108, v109, v110, v111, v112, v210);
      _os_crash();
      __break(1u);
LABEL_99:
      int v215 = *__error();
      __int16 v113 = _sa_logt();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        Class v115 = a1[7].isa;
        Class v114 = a1[8].isa;
        uint64_t v116 = [(id)v16 startSampleIndex];
        uint64_t v117 = [(id)v16 endSampleIndex];
        uint64_t v118 = [v3 startSampleIndex];
        uint64_t v119 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = (unint64_t)v15;
        __int16 v223 = 2048;
        uint64_t v224 = v210;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v115;
        __int16 v227 = 2048;
        Class v228 = v114;
        __int16 v229 = 2048;
        uint64_t v230 = v116;
        __int16 v231 = 2048;
        uint64_t v232 = v117;
        __int16 v233 = 2048;
        uint64_t v234 = v118;
        __int16 v235 = 2048;
        uint64_t v236 = v119;
        _os_log_error_impl(&dword_1BF22B000, v113, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v215;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1778, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v120, v121, v122, v123, v124, v125, (char)v15);
      _os_crash();
      __break(1u);
LABEL_102:
      int v216 = *__error();
      v126 = _sa_logt();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        Class v127 = a1[7].isa;
        Class v128 = a1[8].isa;
        uint64_t v129 = [(id)v16 startSampleIndex];
        uint64_t v130 = [(id)v16 endSampleIndex];
        uint64_t v131 = [v3 startSampleIndex];
        uint64_t v132 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = v210;
        __int16 v223 = 2048;
        uint64_t v224 = v209;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v127;
        __int16 v227 = 2048;
        Class v228 = v128;
        __int16 v229 = 2048;
        uint64_t v230 = v129;
        __int16 v231 = 2048;
        uint64_t v232 = v130;
        __int16 v233 = 2048;
        uint64_t v234 = v131;
        __int16 v235 = 2048;
        uint64_t v236 = v132;
        _os_log_error_impl(&dword_1BF22B000, v126, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v216;
      Class v15 = a1[8].isa;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1719, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v133, v134, v135, v136, v137, v138, v210);
      _os_crash();
      __break(1u);
LABEL_105:
      int v217 = *__error();
      v139 = _sa_logt();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        Class v141 = a1[7].isa;
        Class v140 = a1[8].isa;
        uint64_t v142 = [(id)v16 startSampleIndex];
        uint64_t v143 = [(id)v16 endSampleIndex];
        uint64_t v144 = [v3 startSampleIndex];
        uint64_t v145 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = (unint64_t)v15;
        __int16 v223 = 2048;
        uint64_t v224 = v210;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v141;
        __int16 v227 = 2048;
        Class v228 = v140;
        __int16 v229 = 2048;
        uint64_t v230 = v142;
        __int16 v231 = 2048;
        uint64_t v232 = v143;
        __int16 v233 = 2048;
        uint64_t v234 = v144;
        __int16 v235 = 2048;
        uint64_t v236 = v145;
        _os_log_error_impl(&dword_1BF22B000, v139, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v217;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1779, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v146, v147, v148, v149, v150, v151, (char)v15);
      _os_crash();
      __break(1u);
LABEL_108:
      int v218 = *__error();
      v152 = _sa_logt();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        Class v154 = a1[7].isa;
        Class v153 = a1[8].isa;
        uint64_t v155 = [(id)v16 startSampleIndex];
        uint64_t v156 = [(id)v16 endSampleIndex];
        uint64_t v157 = [v3 startSampleIndex];
        uint64_t v158 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = (unint64_t)v15;
        __int16 v223 = 2048;
        uint64_t v224 = v210;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v154;
        __int16 v227 = 2048;
        Class v228 = v153;
        __int16 v229 = 2048;
        uint64_t v230 = v155;
        __int16 v231 = 2048;
        uint64_t v232 = v156;
        __int16 v233 = 2048;
        uint64_t v234 = v157;
        __int16 v235 = 2048;
        uint64_t v236 = v158;
        _os_log_error_impl(&dword_1BF22B000, v152, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v218;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1780, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v159, v160, v161, v162, v163, v164, (char)v15);
      _os_crash();
      __break(1u);
LABEL_111:
      int v219 = *__error();
      id v165 = _sa_logt();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
      {
        Class v166 = a1[7].isa;
        Class v167 = a1[8].isa;
        uint64_t v168 = [(id)v16 startSampleIndex];
        uint64_t v169 = [(id)v16 endSampleIndex];
        uint64_t v170 = [v3 startSampleIndex];
        uint64_t v171 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = v210;
        __int16 v223 = 2048;
        uint64_t v224 = v209;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v166;
        __int16 v227 = 2048;
        Class v228 = v167;
        __int16 v229 = 2048;
        uint64_t v230 = v168;
        __int16 v231 = 2048;
        uint64_t v232 = v169;
        __int16 v233 = 2048;
        uint64_t v234 = v170;
        __int16 v235 = 2048;
        uint64_t v236 = v171;
        _os_log_error_impl(&dword_1BF22B000, v165, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v219;
      a1 = [(id)v16 startSampleIndex];
      [(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1720, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v172, v173, v174, v175, v176, v177, v210);
      _os_crash();
      __break(1u);
LABEL_114:
      int v220 = *__error();
      uint64_t v178 = _sa_logt();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
      {
        Class v179 = a1[7].isa;
        Class v180 = a1[8].isa;
        uint64_t v181 = [(id)v16 startSampleIndex];
        uint64_t v182 = [(id)v16 endSampleIndex];
        uint64_t v183 = [v3 startSampleIndex];
        uint64_t v184 = [v3 endSampleIndex];
        *(_DWORD *)buf = 134219776;
        unint64_t v222 = v210;
        __int16 v223 = 2048;
        uint64_t v224 = v209;
        __int16 v225 = 2048;
        uint64_t v226 = (uint64_t)v179;
        __int16 v227 = 2048;
        Class v228 = v180;
        __int16 v229 = 2048;
        uint64_t v230 = v181;
        __int16 v231 = 2048;
        uint64_t v232 = v182;
        __int16 v233 = 2048;
        uint64_t v234 = v183;
        __int16 v235 = 2048;
        uint64_t v236 = v184;
        _os_log_error_impl(&dword_1BF22B000, v178, OS_LOG_TYPE_ERROR, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", buf, 0x52u);
      }

      *__error() = v220;
      a1 = [(id)v16 startSampleIndex];
      uint64_t v10 = (unsigned char *)[(id)v16 endSampleIndex];
      [v3 startSampleIndex];
      [v3 endSampleIndex];
      _SASetCrashLogMessage(1721, "thread state %lu-%lu, task state %lu-%lu -> first half %lu-%lu, second half %lu-%lu", v185, v186, v187, v188, v189, v190, v210);
      _os_crash();
      __break(1u);
LABEL_117:
      int v191 = *__error();
      long long v192 = _sa_logt();
      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
      {
        Class v193 = a1[7].isa;
        id v194 = [(objc_class *)a1[4].isa debugDescription];
        uint64_t v195 = [v194 UTF8String];
        id v196 = [v10 startTimestamp];
        id v197 = [v196 debugDescription];
        uint64_t v198 = [v197 UTF8String];
        *(_DWORD *)buf = 134218498;
        unint64_t v222 = (unint64_t)v193;
        __int16 v223 = 2080;
        uint64_t v224 = v195;
        __int16 v225 = 2080;
        uint64_t v226 = v198;
        _os_log_error_impl(&dword_1BF22B000, v192, OS_LOG_TYPE_ERROR, "taskSuspendStartSampleIndex %lu and taskSuspendStartTime %s >= threadState.startTimestamp %s", buf, 0x20u);
      }
      *__error() = v191;
      Class v199 = a1[7].isa;
      id v200 = [(objc_class *)a1[4].isa debugDescription];
      [v200 UTF8String];
      uint64_t v201 = [v10 startTimestamp];
      id v202 = [v201 debugDescription];
      [v202 UTF8String];
      _SASetCrashLogMessage(1793, "taskSuspendStartSampleIndex %lu and taskSuspendStartTime %s >= threadState.startTimestamp %s", v203, v204, v205, v206, v207, v208, (char)v199);

      _os_crash();
      __break(1u);
    }
    if (v10) {
      v10[11] |= 0x40u;
    }
LABEL_71:

    ++v5;
    uint64_t v42 = [v212 threadStates];
    unint64_t v43 = [v42 count];

    unint64_t v8 = v212;
    if (v5 >= v43) {
      goto LABEL_75;
    }
  }

LABEL_74:
  unint64_t v8 = v212;
LABEL_75:
  *((void *)a1[6].isa + a3) = v5;
}

void __48__SATask_forwardFillMonotonicallyIncreasingData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)isAliveAtTimestamp:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 startTimestamp];
    unint64_t v5 = v4;
    if (v4 && ([v4 gt:v3] & 1) == 0)
    {
      uint64_t v6 = [a1 endTimestamp];
      int v7 = [v6 lt:v3];

      a1 = (void *)(v7 ^ 1u);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

void __24__SATask_startTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [v9 creationTimestamp];
  if (v4) {
    goto LABEL_3;
  }
  unint64_t v5 = [v9 threadStates];
  uint64_t v6 = [v5 firstObject];
  uint64_t v4 = [v6 startTimestamp];

  if (v4)
  {
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    if (v8)
    {
      if (![v8 gt:v4]) {
        goto LABEL_7;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v7 + 40), v4);
  }
LABEL_7:
}

- (id)endTimestamp
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__6;
  Class v15 = __Block_byref_object_dispose__6;
  id v3 = self->_exitTimestamp;
  uint64_t v16 = v3;
  if (!v3)
  {
    uint64_t v4 = [(NSMutableArray *)self->_taskStates lastObject];
    uint64_t v5 = [v4 endTimestamp];
    uint64_t v6 = (void *)v12[5];
    v12[5] = v5;

    id v3 = (SATimestamp *)v12[5];
    if (!v3)
    {
      threads = self->_threads;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __22__SATask_endTimestamp__block_invoke;
      v10[3] = &unk_1E63F7D80;
      v10[4] = &v11;
      [(NSMutableDictionary *)threads enumerateKeysAndObjectsUsingBlock:v10];
      id v3 = (SATimestamp *)v12[5];
    }
  }
  unint64_t v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __22__SATask_endTimestamp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [v9 exitTimestamp];
  if (v4) {
    goto LABEL_3;
  }
  uint64_t v5 = [v9 threadStates];
  uint64_t v6 = [v5 lastObject];
  uint64_t v4 = [v6 endTimestamp];

  if (v4)
  {
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    if (v8)
    {
      if (![v8 lt:v4]) {
        goto LABEL_7;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v7 + 40), v4);
  }
LABEL_7:
}

uint64_t __47__SATask_sampleCountInTimestampRangeStart_end___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 sampleCountInTimestampRangeStart:a1[4] end:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) += result;
  return result;
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    int v21 = *__error();
    p_super = _sa_logt();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v41 = a3;
      __int16 v42 = 2048;
      unint64_t v43 = a4;
      _os_log_error_impl(&dword_1BF22B000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(1976, "startSampleIndexCap %lu > endSampleIndexCap %lu", v22, v23, v24, v25, v26, v27, a3);
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }
  p_super = &self->super;
  id v9 = [(NSMutableArray *)self->_taskStates firstObject];
  uint64_t v10 = v9;
  if (!v9)
  {
    unint64_t v16 = 0;
    goto LABEL_29;
  }
  if ([v9 endSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    int v28 = *__error();
    unint64_t v29 = _sa_logt();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = [p_super debugDescription];
      uint64_t v31 = [v30 UTF8String];
      *(_DWORD *)buf = 136315138;
      unint64_t v41 = v31;
      _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "Asking for sample count based on sample indexes when there are no sample indexes: %s", buf, 0xCu);
    }
    *__error() = v28;
    id v32 = [p_super debugDescription];
    char v33 = [v32 UTF8String];
    _SASetCrashLogMessage(1983, "Asking for sample count based on sample indexes when there are no sample indexes: %s", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
  }
  uint64_t v11 = [(objc_class *)p_super[1].isa lastObject];
  unint64_t v12 = [v11 endSampleIndex];
  if (v12 >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = v13;
  }
  if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = [v10 endSampleIndex];
  }
  else {
    unint64_t v15 = [v10 startSampleIndex];
  }
  if (v15 <= a3) {
    unint64_t v17 = a3;
  }
  else {
    unint64_t v17 = v15;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = v15;
  }
  BOOL v18 = v14 >= v17;
  unint64_t v19 = v14 - v17;
  if (v18) {
    unint64_t v16 = v19 + 1;
  }
  else {
    unint64_t v16 = 0;
  }

LABEL_29:
  return v16;
}

- (void)cpuTimeNs:(void *)a3 cpuInstructions:(void *)a4 cpuCycles:(void *)a5 nonThreadCpuTimeNs:(void *)a6 nonThreadCpuInstructions:(void *)a7 nonThreadCpuCycles:(void *)a8 betweenStartTime:(void *)a9 endTime:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v16 = a8;
  id v17 = a9;
  if (!a1) {
    goto LABEL_47;
  }
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  uint64_t v103 = 0;
  uint64_t v104 = &v103;
  uint64_t v105 = 0x2020000000;
  uint64_t v106 = 0;
  uint64_t v99 = 0;
  long long v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0;
  uint64_t v95 = 0;
  uint64_t v96 = &v95;
  uint64_t v97 = 0x2020000000;
  uint64_t v98 = 0;
  Class v72 = a1;
  BOOL v18 = [a1 lastTaskStateOnOrBeforeTime:v17 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v70 = [v18 terminatedThreadsCpuTimeNs];
  uint64_t v68 = a5;
  uint64_t v69 = a6;
  uint64_t v67 = a4;
  uint64_t v66 = a2;
  if (!v18
    || v16
    && ([v18 endTimestamp],
        unint64_t v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 gt:v16],
        v19,
        !v20))
  {
    uint64_t v24 = 0;
LABEL_25:
    uint64_t v65 = 0;
    goto LABEL_26;
  }
  uint64_t v21 = [v18 terminatedThreadsCpuTimeNs];
  v104[3] += v21;
  uint64_t v22 = [v18 terminatedThreadsInstructions];
  v100[3] += v22;
  uint64_t v23 = [v18 terminatedThreadsCycles];
  v96[3] += v23;
  uint64_t v24 = [v18 endTimestamp];
  if (v16)
  {
    uint64_t v25 = (void *)v72[28];
    if (v25)
    {
      if (![v25 lt:v16]) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v26 = [v72 firstTaskStateOnOrAfterTime:v16 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v27 = v26;
  if (!v26
    || v17
    && ([v26 startTimestamp],
        int v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 le:v17],
        v28,
        (v29 & 1) == 0))
  {
    char v47 = v27;
    int v48 = *__error();
    id v49 = _sa_logt();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = [v27 startTimestamp];
      id v51 = [v50 debugDescription];
      uint64_t v52 = [v51 UTF8String];
      id v53 = [v17 debugDescription];
      uint64_t v54 = [v53 UTF8String];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v54;
      _os_log_error_impl(&dword_1BF22B000, v49, OS_LOG_TYPE_ERROR, "firstTaskState.startTimestamp %s > endTimestamp %s", buf, 0x16u);
    }
    *__error() = v48;
    uint64_t v55 = [v47 startTimestamp];
    id v56 = [v55 debugDescription];
    char v57 = [v56 UTF8String];
    id v58 = [v17 debugDescription];
    [v58 UTF8String];
    _SASetCrashLogMessage(2060, "firstTaskState.startTimestamp %s > endTimestamp %s", v59, v60, v61, v62, v63, v64, v57);

    _os_crash();
    __break(1u);
  }
  uint64_t v30 = [v27 terminatedThreadsCpuTimeNs];
  v104[3] -= v30;
  uint64_t v31 = [v27 terminatedThreadsInstructions];
  v100[3] -= v31;
  uint64_t v32 = [v27 terminatedThreadsCycles];
  uint64_t v65 = v27;
  v96[3] -= v32;
LABEL_26:
  BOOL v33 = v70 != 0;
  if (v17) {
    uint64_t v34 = v17;
  }
  else {
    uint64_t v34 = v24;
  }
  id v35 = v34;

  uint64_t v71 = a7;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v108 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v87 = 0;
  uint64_t v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  uint64_t v36 = (void *)v72[2];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke;
  v73[3] = &unk_1E63F9F60;
  id v17 = v35;
  id v74 = v17;
  BOOL v86 = v33;
  id v37 = v24;
  id v75 = v37;
  id v38 = v18;
  id v76 = v38;
  uint64_t v80 = &v103;
  uint64_t v81 = &v99;
  uint64_t v82 = &v95;
  uint64_t v83 = buf;
  int v84 = &v91;
  uint64_t v85 = &v87;
  id v77 = v16;
  uint64_t v78 = v72;
  id v39 = v65;
  id v79 = v39;
  [v36 enumerateKeysAndObjectsUsingBlock:v73];
  uint64_t v40 = *(void *)&buf[8];
  unint64_t v41 = *(void *)(*(void *)&buf[8] + 24);
  __int16 v42 = v104;
  unint64_t v43 = v92;
  uint64_t v44 = v100;
  if (v41 <= v104[3])
  {
    id v45 = v88;
    id v46 = v96;
    if (v92[3] <= (unint64_t)v100[3] && v88[3] <= (unint64_t)v96[3]) {
      goto LABEL_34;
    }
  }
  else
  {
    id v45 = v88;
    id v46 = v96;
  }
  v104[3] = v41;
  v44[3] = v43[3];
  v46[3] = v45[3];
LABEL_34:
  if (v66) {
    *uint64_t v66 = v42[3];
  }
  if (a3) {
    *a3 = v44[3];
  }
  if (v67) {
    *uint64_t v67 = v46[3];
  }
  if (v68) {
    *uint64_t v68 = v42[3] - *(void *)(v40 + 24);
  }
  if (v69) {
    *uint64_t v69 = v44[3] - v43[3];
  }
  if (v71) {
    void *v71 = v46[3] - v45[3];
  }

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
LABEL_47:
}

void __134__SATask_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_betweenStartTime_endTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isGlobalForcedIdle] & 1) == 0 && (objc_msgSend(v5, "isProcessorIdleThread") & 1) == 0)
  {
    uint64_t v6 = [v5 lastThreadStateOnOrBeforeTime:*(void *)(a1 + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v7 = v6;
    if (!v6)
    {
      int v12 = 1;
      goto LABEL_29;
    }
    if (!*(unsigned char *)(a1 + 128)) {
      goto LABEL_20;
    }
    uint64_t v8 = [v6 endTimestamp];
    if (!v8) {
      goto LABEL_20;
    }
    id v9 = (void *)v8;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v3 = [v7 endTimestamp];
      if (([v3 lt:*(void *)(a1 + 32)] & 1) == 0
        || (uint64_t v11 = (void *)(a1 + 40), !*(void *)(a1 + 40)))
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v11 = (void *)(a1 + 40);
      if (!*(void *)(a1 + 40)) {
        goto LABEL_19;
      }
    }
    unint64_t v13 = [v7 endTimestamp];
    if ([v13 lt:*v11])
    {
      uint64_t v14 = [v5 exitTimestamp];
      if (v14)
      {
        unint64_t v15 = (void *)v14;
        id v16 = [v5 exitTimestamp];
        int v17 = [v16 le:*v11];

        if (v10)
        {

          if ((v17 & 1) == 0)
          {
LABEL_20:
            int v17 = 0;
LABEL_21:
            BOOL v18 = 1;
            goto LABEL_22;
          }
        }
        else
        {

          if (!v17) {
            goto LABEL_21;
          }
        }
        BOOL v18 = [*(id *)(a1 + 48) terminatedThreadsCycles] == 0;
        int v17 = 1;
LABEL_22:
        if (*(void *)(a1 + 56))
        {
          unint64_t v19 = [v7 endTimestamp];
          int v20 = [v19 ge:*(void *)(a1 + 56)];

          if (!v20) {
            goto LABEL_44;
          }
        }
        int v12 = v17 ^ 1;
        if ((v17 & 1) == 0) {
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v7 cpuTimeNs];
        }
        if (v18)
        {
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += [v7 instructions];
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += [v7 cycles];
        }
        *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) += [v7 cpuTimeNs];
        *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) += [v7 instructions];
        *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += [v7 cycles];
LABEL_29:
        uint64_t v21 = [v5 creationTimestamp];
        uint64_t v22 = v21;
        if (v21 && *(void *)(a1 + 56))
        {
          uint64_t v23 = [v5 creationTimestamp];
          int v24 = [v23 lt:*(void *)(a1 + 56)];

          if (!v24)
          {
LABEL_44:

            goto LABEL_45;
          }
        }
        else
        {
        }
        uint64_t v25 = [v5 firstThreadStateOnOrAfterTime:*(void *)(a1 + 56) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
        uint64_t v26 = v25;
        if (v25)
        {
          if (!*(void *)(a1 + 32)
            || ([v25 startTimestamp],
                uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                int v28 = [v27 le:*(void *)(a1 + 32)],
                v27,
                v28))
          {
            unint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
            if (v29 >= [v26 cpuTimeNs])
            {
              *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) -= [v26 cpuTimeNs];
              *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) -= [v26 instructions];
              *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) -= [v26 cycles];
            }
            else
            {
              int v30 = *__error();
              uint64_t v31 = _sa_logt();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                char v47 = [*(id *)(a1 + 64) debugDescription];
                uint64_t v44 = [v5 threadId];
                uint64_t v32 = [v26 cpuTimeNs];
                uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
                uint64_t v43 = v32;
                uint64_t v41 = [v7 cpuTimeNs];
                uint64_t v40 = [*(id *)(a1 + 72) terminatedThreadsCpuTimeNs];
                uint64_t v39 = [*(id *)(a1 + 48) terminatedThreadsCpuTimeNs];
                id v46 = [v26 debugDescription];
                id v38 = [v7 debugDescription];
                id v45 = [v5 exitTimestamp];
                BOOL v33 = [v45 debugDescription];
                uint64_t v34 = [*(id *)(a1 + 48) debugDescription];
                int v37 = *(unsigned __int8 *)(a1 + 128);
                uint64_t v36 = [*(id *)(a1 + 56) debugDescription];
                [*(id *)(a1 + 32) debugDescription];
                *(_DWORD *)buf = 138415874;
                id v49 = v47;
                __int16 v50 = 2048;
                uint64_t v51 = v44;
                __int16 v52 = 2048;
                uint64_t v53 = v43;
                __int16 v54 = 2048;
                uint64_t v55 = v42;
                __int16 v56 = 2048;
                uint64_t v57 = v41;
                __int16 v58 = 2048;
                uint64_t v59 = v40;
                __int16 v60 = 2048;
                uint64_t v61 = v39;
                __int16 v62 = 2112;
                uint64_t v63 = v46;
                __int16 v64 = 2112;
                uint64_t v65 = v38;
                __int16 v66 = 2112;
                uint64_t v67 = v33;
                __int16 v68 = 2112;
                uint64_t v69 = v34;
                __int16 v70 = 1024;
                int v71 = v37;
                __int16 v72 = 1024;
                int v73 = v12;
                __int16 v74 = 2112;
                id v75 = v36;
                v77 = __int16 v76 = 2112;
                id v35 = (void *)v77;
                _os_log_error_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_ERROR, "%@ thread 0x%llx starting cpu time %llu < taskCpuTimeNs %llu\nlastThreadState.cpuTimeNs: %llu\nfirstTaskState.terminatedThreadsCpuTimeNs: %llu\nlastTaskState.terminatedThreadsCpuTimeNs: %llu\nfirstThreadState: %@\nlastThreadState: %@\nthread.exitTimestamp: %@\nlastTaskState: %@\ntaskHasTimeInTerminatedThreads: %d\naddEndCPU: %d\nstartTimestamp: %@\nendTimestamp: %@", buf, 0x90u);
              }
              *__error() = v30;
            }
            *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) -= [v26 cpuTimeNs];
            *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) -= [v26 instructions];
            *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) -= [v26 cycles];
          }
        }

        goto LABEL_44;
      }
    }

    if (v10) {
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_45:
}

- (void)cpuTimeNs:(unint64_t *)a3 cpuInstructions:(unint64_t *)a4 cpuCycles:(unint64_t *)a5 betweenStartTime:(id)a6 endTime:(id)a7
{
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)fixupFrameInstructionsWithDataGatheringOptions:(int)a3 mightBeAlive:(unsigned char *)a4 foundNewBinaryInfo:(void *)a5 uuidsWithNewInstructions:(int)a6 additionalCSSymbolicatorFlags:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (!a1) {
    goto LABEL_52;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a1[35]) {
    goto LABEL_52;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = a1[31];
  uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v12)
  {
    unint64_t v13 = 0;
    id v37 = obj;
LABEL_40:

    goto LABEL_42;
  }
  int v43 = a3;
  uint64_t v44 = a2;
  int v45 = a6;
  id v46 = a4;
  id v47 = v11;
  int v48 = a1;
  unint64_t v13 = 0;
  uint64_t v14 = *(void *)v58;
  unint64_t v15 = obj;
  uint64_t v49 = *(void *)v58;
  uint64_t v16 = v12;
  do
  {
    uint64_t v17 = 0;
    uint64_t v52 = v16;
    do
    {
      if (*(void *)v58 != v14) {
        objc_enumerationMutation(v15);
      }
      BOOL v18 = *(void **)(*((void *)&v57 + 1) + 8 * v17);
      unint64_t v19 = [v18 segment];

      if (!v19)
      {
        int v20 = [v18 binary];
        uint64_t v21 = [v20 segments];
        if (![v21 count]) {
          goto LABEL_34;
        }
        uint64_t v22 = [v21 firstObject];
        if ([v22 hasOffsetIntoBinary] && objc_msgSend(v22, "offsetIntoBinary") < 0)
        {
LABEL_27:
          if (!v13) {
            unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v48[31]];
          }
          [v13 removeObject:v18];
          uint64_t v33 = [v18 loadAddress];
          int v34 = [v18 isInKernelAddressSpace];
          uint64_t v23 = [v18 exclave];
          id v35 = +[SABinaryLoadInfo loadInfosForSegmentsInBinary:binaryBaseAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v20, v33, v34, v23);
          [v13 addObjectsFromArray:v35];

LABEL_31:
          uint64_t v14 = v49;
          unint64_t v15 = obj;
        }
        else
        {
          if (![v20 length]) {
            goto LABEL_33;
          }
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v23 = [v21 reverseObjectEnumerator];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v51 = v13;
            uint64_t v26 = *(void *)v54;
LABEL_17:
            uint64_t v27 = 0;
            while (1)
            {
              if (*(void *)v54 != v26) {
                objc_enumerationMutation(v23);
              }
              int v28 = *(void **)(*((void *)&v53 + 1) + 8 * v27);
              if ([v28 hasOffsetIntoBinary]) {
                break;
              }
              if (v25 == ++v27)
              {
                uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
                if (v25) {
                  goto LABEL_17;
                }
                goto LABEL_30;
              }
            }
            if ([v28 offsetIntoBinary] <= 0)
            {
LABEL_30:
              unint64_t v13 = v51;
              goto LABEL_31;
            }
            uint64_t v29 = [v28 offsetIntoBinary];
            unint64_t v30 = [v28 length] + v29;
            unint64_t v31 = [v20 length];

            BOOL v32 = v30 > v31;
            unint64_t v15 = obj;
            unint64_t v13 = v51;
            uint64_t v14 = v49;
            uint64_t v16 = v52;
            if (v32) {
              goto LABEL_27;
            }
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
        }

        uint64_t v16 = v52;
        goto LABEL_33;
      }
LABEL_35:
      ++v17;
    }
    while (v17 != v16);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v66 count:16];
  }
  while (v16);

  if (v13)
  {
    +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v13);
    uint64_t v36 = [v13 copy];
    id v11 = v47;
    a1 = v48;
    id v37 = v48[31];
    v48[31] = (id)v36;
    a4 = v46;
    a6 = v45;
    a2 = v44;
    a3 = v43;
    goto LABEL_40;
  }
  id v11 = v47;
  a1 = v48;
  a4 = v46;
  a6 = v45;
  a2 = v44;
  a3 = v43;
LABEL_42:
  if (+[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, a1[35], a1[31], a1[32], v11)&& a3&& -[SATask gatherLoadInfoFromLiveProcessWithDataGatheringOptions:additionalCSSymbolicatorFlags:]((uint64_t)a1, a2, a6))
  {
    if (a4) {
      *a4 = 1;
    }
    uint64_t v38 = +[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, a1[35], a1[31], a1[32], v11);
    if (v38)
    {
      uint64_t v39 = v38;
      int v40 = *__error();
      uint64_t v41 = _sa_logt();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v42 = [a1 debugDescription];
        *(_DWORD *)buf = 138412546;
        __int16 v62 = v42;
        __int16 v63 = 2048;
        uint64_t v64 = v39;
        _os_log_debug_impl(&dword_1BF22B000, v41, OS_LOG_TYPE_DEBUG, "%@: still have %lu frames with missing load info after getting load info from the live process", buf, 0x16u);
      }
      *__error() = v40;
    }
  }

LABEL_52:
}

- (uint64_t)isFromCurrentBootCycle
{
  unint64_t v2 = (unint64_t)self;
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 272, 1);
    uint64_t v4 = v3;
    if (!v3 || ([v3 wallTime], v5 == 0.0))
    {
      uint64_t v8 = [(id)v2 startTimestamp];
      id v9 = v8;
      double v7 = 0.0;
      if (v8)
      {
        [v8 wallTime];
        if (v10 != 0.0)
        {
          [v9 wallTime];
          double v7 = v11;
        }
      }
    }
    else
    {
      [v4 wallTime];
      double v7 = v6;
    }

    if (v7 == 0.0)
    {
      uint64_t v12 = [(id)v2 sharedCache];

      if (v12)
      {
        unint64_t v13 = [(id)v2 sharedCache];
        uint64_t v14 = +[SASharedCache currentSharedCache];
        unint64_t v2 = v13 == v14;

        return v2;
      }
    }
    else if (v7 > SATimeOfBootForLiveMachine())
    {
      return 1;
    }
    return 0;
  }
  return v2;
}

- (NSDictionary)dispatchQueues
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)swiftTasks
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (int)ppid
{
  return self->_ppid;
}

- (NSString)bundleName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)bundleBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)bundleSourceVersion
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)bundleProductBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (unint64_t)resourceCoalitionID
{
  return self->_resourceCoalitionID;
}

- (NSString)resourceCoalitionName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (NSString)installerVersionID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)vendorID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)distributorID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (char)developerType
{
  return self->_developerType;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (NSString)cohortID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)appType
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)commerceAppID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)commerceExternalID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (SATimestamp)execTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 224, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)isUnresponsive
{
  return self->_isUnresponsive;
}

- (double)timeOfLastResponse
{
  return self->_timeOfLastResponse;
}

- (BOOL)usesSuddenTermination
{
  return self->_usesSuddenTermination;
}

- (BOOL)allowsIdleExit
{
  return self->_allowsIdleExit;
}

- (BOOL)isTranslocated
{
  return self->_isTranslocated;
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 256, 1);
}

- (SAThread)mainThread
{
  return (SAThread *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFrames, 0);
  objc_storeStrong((id *)&self->_pidStartTimestamp, 0);
  objc_storeStrong((id *)&self->_mainThread, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_binaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_exitTimestamp, 0);
  objc_storeStrong((id *)&self->_execTimestamp, 0);
  objc_storeStrong((id *)&self->_commerceExternalID, 0);
  objc_storeStrong((id *)&self->_commerceAppID, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_cohortID, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_installerVersionID, 0);
  objc_storeStrong((id *)&self->_resourceCoalitionName, 0);
  objc_storeStrong((id *)&self->_bundleProductBuildVersion, 0);
  objc_storeStrong((id *)&self->_bundleSourceVersion, 0);
  objc_storeStrong((id *)&self->_bundleProjectName, 0);
  objc_storeStrong((id *)&self->_bundleBuildVersion, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mainBinary, 0);
  objc_storeStrong((id *)&self->_mainBinaryPath, 0);
  objc_storeStrong((id *)&self->_swiftTasks, 0);
  objc_storeStrong((id *)&self->_dispatchQueues, 0);
  objc_storeStrong((id *)&self->_threads, 0);
  objc_storeStrong((id *)&self->_taskStates, 0);
}

+ (id)classDictionaryKey
{
  return @"SATask";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3 = [(NSMutableSet *)self->_rootFrames count];
  NSUInteger v4 = [(NSArray *)self->_binaryLoadInfos count] + v3;
  uint64_t v5 = [(NSMutableArray *)self->_taskStates count];
  NSUInteger v6 = v4 + v5 + [(NSMutableDictionary *)self->_threads count];
  uint64_t v7 = [(NSMutableDictionary *)self->_dispatchQueues count];
  return 8 * (v6 + v7 + [(NSMutableDictionary *)self->_swiftTasks count]) + 245;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SATask *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v32 = *__error();
    uint64_t v33 = _sa_logt();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = [(SATask *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v139 = [v34 UTF8String];
      __int16 v140 = 2048;
      *(void *)Class v141 = [(SATask *)self sizeInBytesForSerializedVersion];
      *(_WORD *)&v141[8] = 2048;
      unint64_t v142 = a4;
      _os_log_error_impl(&dword_1BF22B000, v33, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v32;
    id v35 = [(SATask *)self debugDescription];
    char v36 = [v35 UTF8String];
    [(SATask *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(2864, "%s: size %lu != buffer length %lu", v37, v38, v39, v40, v41, v42, v36);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  *(_WORD *)&a3->var0 = 2305;
  *(_DWORD *)(&a3->var1 + 1) = self->_pid;
  *(int *)((char *)&a3->var2 + 2) = self->_ppid;
  *(int *)((char *)&a3->var3 + 2) = self->_rpid;
  *(int *)((char *)&a3->var4 + 2) = self->_uid;
  *(void *)((char *)&a3->var5 + 2) = self->_uniquePid;
  *(unint64_t *)((char *)&a3->var10 + 2) = *(void *)&self->_timeOfLastResponse;
  *(unint64_t *)((char *)&a3->var18 + 6) = (unint64_t)self->_architecture;
  char v10 = BYTE6(a3->var19) & 0xFE | self->_isUnresponsive;
  BYTE6(a3->var19) = v10;
  char v11 = v10 & 0xFD | (2 * self->_usesSuddenTermination);
  BYTE6(a3->var19) = v11;
  char v12 = v11 & 0xF3 | (4 * self->_allowsIdleExit);
  BYTE6(a3->var19) = v12;
  BYTE6(a3->var19) = v12 & 0xE7 | (16 * self->_isTranslocated);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleName, v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_execTimestamp, v9);
  *(unint64_t *)((char *)&a3->var9 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_exitTimestamp, v9);
  *(void *)((char *)&a3->var15 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainThread, v9);
  *(void *)((char *)&a3->var16 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainBinaryPath, v9);
  *(unint64_t *)((char *)&a3->var17 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_sharedCache, v9);
  if ((unint64_t)[(NSMutableSet *)self->_rootFrames count] >= 0xFFFFFFFF)
  {
LABEL_13:
    int v43 = *__error();
    uint64_t v44 = _sa_logt();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = [(SATask *)self debugDescription];
      uint64_t v46 = [v45 UTF8String];
      uint64_t v47 = [(NSMutableSet *)self->_rootFrames count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v46;
      __int16 v140 = 2048;
      *(void *)Class v141 = v47;
      _os_log_error_impl(&dword_1BF22B000, v44, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);
    }
    *__error() = v43;
    id v48 = [(SATask *)self debugDescription];
    char v49 = [v48 UTF8String];
    [(NSMutableSet *)self->_rootFrames count];
    _SASetCrashLogMessage(2891, "%s: %lu rootFrames", v50, v51, v52, v53, v54, v55, v49);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  unsigned int v13 = [(NSMutableSet *)self->_rootFrames count];
  *(_DWORD *)((char *)&a3->var11 + 2) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var20, v13, self->_rootFrames, v9);
  if ([(NSArray *)self->_binaryLoadInfos count] >= 0xFFFFFFFF)
  {
LABEL_16:
    int v56 = *__error();
    long long v57 = _sa_logt();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      id v58 = [(SATask *)self debugDescription];
      uint64_t v59 = [v58 UTF8String];
      NSUInteger v60 = [(NSArray *)self->_binaryLoadInfos count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v59;
      __int16 v140 = 2048;
      *(void *)Class v141 = v60;
      _os_log_error_impl(&dword_1BF22B000, v57, OS_LOG_TYPE_ERROR, "%s: %lu binaryLoadInfos", buf, 0x16u);
    }
    *__error() = v56;
    id v61 = [(SATask *)self debugDescription];
    char v62 = [v61 UTF8String];
    [(NSArray *)self->_binaryLoadInfos count];
    _SASetCrashLogMessage(2896, "%s: %lu binaryLoadInfos", v63, v64, v65, v66, v67, v68, v62);

    _os_crash();
    __break(1u);
    goto LABEL_19;
  }
  unsigned int v14 = [(NSArray *)self->_binaryLoadInfos count];
  *(_DWORD *)((char *)&a3->var11 + 6) = v14;
  unint64_t v15 = &a3->var20 + *(unsigned int *)((char *)&a3->var11 + 2);
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v15, v14, self->_binaryLoadInfos, v9);
  if ((unint64_t)[(NSMutableArray *)self->_taskStates count] >= 0xFFFFFFFF)
  {
LABEL_19:
    int v69 = *__error();
    __int16 v70 = _sa_logt();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      id v71 = [(SATask *)self debugDescription];
      uint64_t v72 = [v71 UTF8String];
      uint64_t v73 = [(NSMutableArray *)self->_taskStates count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v72;
      __int16 v140 = 2048;
      *(void *)Class v141 = v73;
      _os_log_error_impl(&dword_1BF22B000, v70, OS_LOG_TYPE_ERROR, "%s: %lu taskStates", buf, 0x16u);
    }
    *__error() = v69;
    id v74 = [(SATask *)self debugDescription];
    char v75 = [v74 UTF8String];
    [(NSMutableArray *)self->_taskStates count];
    _SASetCrashLogMessage(2901, "%s: %lu taskStates", v76, v77, v78, v79, v80, v81, v75);

    _os_crash();
    __break(1u);
    goto LABEL_22;
  }
  unsigned int v16 = [(NSMutableArray *)self->_taskStates count];
  *(unsigned int *)((char *)&a3->var12 + 2) = v16;
  uint64_t v17 = &v15[*(unsigned int *)((char *)&a3->var11 + 6)];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v17, v16, self->_taskStates, v9);
  if ((unint64_t)[(NSMutableDictionary *)self->_threads count] >= 0xFFFFFFFF)
  {
LABEL_22:
    int v82 = *__error();
    uint64_t v83 = _sa_logt();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      id v84 = [(SATask *)self debugDescription];
      uint64_t v85 = [v84 UTF8String];
      uint64_t v86 = [(NSMutableDictionary *)self->_threads count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v85;
      __int16 v140 = 2048;
      *(void *)Class v141 = v86;
      _os_log_error_impl(&dword_1BF22B000, v83, OS_LOG_TYPE_ERROR, "%s: %lu threads", buf, 0x16u);
    }
    *__error() = v82;
    id v87 = [(SATask *)self debugDescription];
    char v88 = [v87 UTF8String];
    [(NSMutableDictionary *)self->_threads count];
    _SASetCrashLogMessage(2906, "%s: %lu threads", v89, v90, v91, v92, v93, v94, v88);

    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  unsigned int v18 = [(NSMutableDictionary *)self->_threads count];
  *(unsigned int *)((char *)&a3->var13 + 2) = v18;
  unint64_t v19 = &v17[*(unsigned int *)((char *)&a3->var12 + 2)];
  unint64_t v20 = v18;
  uint64_t v21 = [(NSMutableDictionary *)self->_threads allValues];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v19, v20, v21, v9);

  if ((unint64_t)[(NSMutableDictionary *)self->_dispatchQueues count] >= 0xFFFFFFFF)
  {
LABEL_25:
    int v95 = *__error();
    uint64_t v96 = _sa_logt();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      id v97 = [(SATask *)self debugDescription];
      uint64_t v98 = [v97 UTF8String];
      uint64_t v99 = [(NSMutableDictionary *)self->_dispatchQueues count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v98;
      __int16 v140 = 2048;
      *(void *)Class v141 = v99;
      _os_log_error_impl(&dword_1BF22B000, v96, OS_LOG_TYPE_ERROR, "%s: %lu dispatchQueues", buf, 0x16u);
    }
    *__error() = v95;
    a3 = [(SATask *)self debugDescription];
    char v100 = [($9C2647CC3345766B7A73D9718A82D31E *)a3 UTF8String];
    [(NSMutableDictionary *)self->_dispatchQueues count];
    _SASetCrashLogMessage(2911, "%s: %lu dispatchQueues", v101, v102, v103, v104, v105, v106, v100);

    _os_crash();
    __break(1u);
    goto LABEL_28;
  }
  unsigned int v22 = [(NSMutableDictionary *)self->_dispatchQueues count];
  *(unsigned int *)((char *)&a3->var14 + 2) = v22;
  uint64_t v23 = (char *)&v19[*(unsigned int *)((char *)&a3->var13 + 2)];
  unint64_t v24 = v22;
  uint64_t v25 = [(NSMutableDictionary *)self->_dispatchQueues allValues];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v23, v24, v25, v9);

  uint64_t v26 = &v23[8 * *(unsigned int *)((char *)&a3->var14 + 2)];
  uint64_t v5 = v26 + 109 - (char *)a3;
  if (v5 > (int64_t)[(SATask *)self sizeInBytesForSerializedVersion])
  {
LABEL_28:
    int v137 = *__error();
    uint64_t v107 = _sa_logt();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      id v136 = [(SATask *)self debugDescription];
      uint64_t v108 = [v136 UTF8String];
      int v109 = *(_DWORD *)((char *)&a3->var11 + 2);
      int v110 = *(_DWORD *)((char *)&a3->var11 + 6);
      int v111 = *(unsigned int *)((char *)&a3->var12 + 2);
      int v112 = *(unsigned int *)((char *)&a3->var13 + 2);
      int v113 = *(unsigned int *)((char *)&a3->var14 + 2);
      unint64_t v114 = [(SATask *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)buf = 136316930;
      uint64_t v139 = v108;
      __int16 v140 = 1024;
      *(_DWORD *)Class v141 = v109;
      *(_WORD *)&v141[4] = 1024;
      *(_DWORD *)&v141[6] = v110;
      LOWORD(v142) = 1024;
      *(_DWORD *)((char *)&v142 + 2) = v111;
      HIWORD(v142) = 1024;
      int v143 = v112;
      __int16 v144 = 1024;
      int v145 = v113;
      __int16 v146 = 2048;
      uint64_t v147 = v5;
      __int16 v148 = 2048;
      unint64_t v149 = v114;
      _os_log_error_impl(&dword_1BF22B000, v107, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended with length %ld, should be %lu", buf, 0x3Eu);
    }
    *__error() = v137;
    id v115 = [(SATask *)self debugDescription];
    char v116 = [v115 UTF8String];
    [(SATask *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(2918, "%s: after serializing (with %u rootFrames, %u loadInfos, %u task states, %u threads, %u dispatch queues), ended with length %ld, should be %lu", v117, v118, v119, v120, v121, v122, v116);

    _os_crash();
    __break(1u);
LABEL_31:
    int v123 = *__error();
    uint64_t v124 = _sa_logt();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      id v125 = [(SATask *)self debugDescription];
      uint64_t v126 = [v125 UTF8String];
      uint64_t v127 = [(NSMutableDictionary *)self->_swiftTasks count];
      *(_DWORD *)buf = 136315394;
      uint64_t v139 = v126;
      __int16 v140 = 2048;
      *(void *)Class v141 = v127;
      _os_log_error_impl(&dword_1BF22B000, v124, OS_LOG_TYPE_ERROR, "%s: %lu swiftTasks", buf, 0x16u);
    }
    *__error() = v123;
    id v128 = [(SATask *)self debugDescription];
    char v129 = [v128 UTF8String];
    [(NSMutableDictionary *)self->_swiftTasks count];
    _SASetCrashLogMessage(2941, "%s: %lu swiftTasks", v130, v131, v132, v133, v134, v135, v129);

    _os_crash();
    __break(1u);
  }
  *(void *)uint64_t v26 = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleBuildVersion, v9);
  *((void *)v26 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProjectName, v9);
  *((void *)v26 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleSourceVersion, v9);
  *((void *)v26 + 3) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleProductBuildVersion, v9);
  *((void *)v26 + 7) = SASerializableIndexForPointerFromSerializationDictionary(self->_mainBinary, v9);
  *((void *)v26 + 4) = -1;
  *((void *)v26 + 5) = SASerializableIndexForPointerFromSerializationDictionary(self->_installerVersionID, v9);
  *((void *)v26 + 8) = self->_adamID;
  *((void *)v26 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_vendorID, v9);
  *((void *)v26 + 9) = SASerializableIndexForPointerFromSerializationDictionary(self->_appType, v9);
  *((void *)v26 + 10) = SASerializableIndexForPointerFromSerializationDictionary(self->_cohortID, v9);
  BYTE6(a3->var19) = BYTE6(a3->var19) & 0xDF | (32 * self->_isBeta);
  *((void *)v26 + 11) = SASerializableIndexForPointerFromSerializationDictionary(self->_pidStartTimestamp, v9);
  v26[96] = self->_developerType;
  *(void *)(v26 + 97) = self->_resourceCoalitionID;
  if ((unint64_t)[(NSMutableDictionary *)self->_swiftTasks count] >= 0xFFFFFFFF) {
    goto LABEL_31;
  }
  unsigned int v27 = [(NSMutableDictionary *)self->_swiftTasks count];
  *(_DWORD *)(v26 + 105) = v27;
  unint64_t v28 = v27;
  uint64_t v29 = [(NSMutableDictionary *)self->_swiftTasks allValues];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v26 + 109, v28, v29, v9);

  unint64_t v30 = (uint64_t *)&v26[8 * *(unsigned int *)(v26 + 105) + 109];
  *unint64_t v30 = SASerializableIndexForPointerFromSerializationDictionary(self->_distributorID, v9);
  v30[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_resourceCoalitionName, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    [(NSString *)self->_name addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleName addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleBuildVersion addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleProjectName addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleSourceVersion addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleProductBuildVersion addSelfToSerializationDictionary:v4];
    [(SATimestamp *)self->_execTimestamp addSelfToSerializationDictionary:v4];
    [(SATimestamp *)self->_exitTimestamp addSelfToSerializationDictionary:v4];
    [(SAThread *)self->_mainThread addSelfToSerializationDictionary:v4];
    [(NSString *)self->_mainBinaryPath addSelfToSerializationDictionary:v4];
    [(SABinary *)self->_mainBinary addSelfToSerializationDictionary:v4];
    [(SASharedCache *)self->_sharedCache addSelfToSerializationDictionary:v4];
    [(NSString *)self->_installerVersionID addSelfToSerializationDictionary:v4];
    [(NSString *)self->_vendorID addSelfToSerializationDictionary:v4];
    [(NSString *)self->_distributorID addSelfToSerializationDictionary:v4];
    [(NSString *)self->_appType addSelfToSerializationDictionary:v4];
    [(NSString *)self->_cohortID addSelfToSerializationDictionary:v4];
    [(SATimestamp *)self->_pidStartTimestamp addSelfToSerializationDictionary:v4];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v7 = self->_rootFrames;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v43;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * v11++) addSelfToSerializationDictionary:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v9);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    char v12 = self->_binaryLoadInfos;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * v16++) addSelfToSerializationDictionary:v4];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    uint64_t v17 = self->_taskStates;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * v21++) addSelfToSerializationDictionary:v4];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v19);
    }

    threads = self->_threads;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke;
    v32[3] = &unk_1E63F7DA8;
    id v23 = v4;
    id v33 = v23;
    [(NSMutableDictionary *)threads enumerateKeysAndObjectsUsingBlock:v32];
    dispatchQueues = self->_dispatchQueues;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2;
    v30[3] = &unk_1E63F9F88;
    id v25 = v23;
    id v31 = v25;
    [(NSMutableDictionary *)dispatchQueues enumerateKeysAndObjectsUsingBlock:v30];
    swiftTasks = self->_swiftTasks;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3;
    v28[3] = &unk_1E63F9FB0;
    id v27 = v25;
    id v29 = v27;
    [(NSMutableDictionary *)swiftTasks enumerateKeysAndObjectsUsingBlock:v28];
    [(NSString *)self->_resourceCoalitionName addSelfToSerializationDictionary:v27];
  }
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

uint64_t __58__SATask_Serialization__addSelfToSerializationDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addSelfToSerializationDictionary:*(void *)(a1 + 32)];
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 0xAu) {
    goto LABEL_11;
  }
  if (a4 <= 0x77)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v29 = a4;
      __int16 v30 = 2048;
      *(void *)id v31 = 120;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(3013, "bufferLength %lu < serialized SATask struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)(vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82))
     + 120 > a4)
  {
LABEL_8:
    int v14 = *__error();
    uint64_t v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 66);
      int v17 = *(_DWORD *)(v5 + 70);
      int v18 = *(_DWORD *)(v5 + 74);
      int v19 = *(_DWORD *)(v5 + 78);
      int v20 = *(_DWORD *)(v5 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v29 = a4;
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = v16;
      *(_WORD *)&void v31[4] = 1024;
      *(_DWORD *)&v31[6] = v17;
      __int16 v32 = 1024;
      int v33 = v18;
      __int16 v34 = 1024;
      int v35 = v19;
      __int16 v36 = 1024;
      int v37 = v20;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v14;
    _SASetCrashLogMessage(3014, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v21, v22, v23, v24, v25, v26, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v27 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATask version" userInfo:0];
    objc_exception_throw(v27);
  }
  +[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)SATask, *(unsigned int *)((char *)a3 + 2), *(void *)((char *)a3 + 18), 0, 0);
  id result = (id)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)result + 19) = *(_DWORD *)(v5 + 2);
  *((_DWORD *)result + 20) = *(_DWORD *)(v5 + 6);
  *((_DWORD *)result + 21) = *(_DWORD *)(v5 + 10);
  *((_DWORD *)result + 22) = *(_DWORD *)(v5 + 14);
  *((void *)result + 12) = *(void *)(v5 + 18);
  *((void *)result + 30) = *(void *)(v5 + 58);
  *((void *)result + 36) = *(void *)(v5 + 110);
  *((unsigned char *)result + 67) = *(unsigned char *)(v5 + 118) & 1;
  *((unsigned char *)result + 68) = (*(unsigned char *)(v5 + 118) & 2) != 0;
  *((unsigned char *)result + 69) = (*(unsigned char *)(v5 + 118) & 4) != 0;
  *((unsigned char *)result + 70) = (*(unsigned char *)(v5 + 118) & 0x10) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v313 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if (*(unsigned __int8 *)a3 >= 0xAu) {
    goto LABEL_82;
  }
  if (a4 <= 0x77)
  {
    int v149 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v302 = a4;
      __int16 v303 = 2048;
      *(void *)v304 = 120;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct %lu", buf, 0x16u);
    }

    *__error() = v149;
    _SASetCrashLogMessage(3037, "bufferLength %lu < serialized SATask struct %lu", v150, v151, v152, v153, v154, v155, a4);
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v296 = 8 * (vaddvq_s32(*(int32x4_t *)((char *)a3 + 66)) + *(_DWORD *)((char *)a3 + 82));
  if (v296 + 120 > a4)
  {
LABEL_52:
    int v156 = *__error();
    uint64_t v157 = _sa_logt();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      int v158 = *(_DWORD *)((char *)a3 + 66);
      int v159 = *(_DWORD *)((char *)a3 + 70);
      int v160 = *(_DWORD *)((char *)a3 + 74);
      int v161 = *(_DWORD *)((char *)a3 + 78);
      int v162 = *(_DWORD *)((char *)a3 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = a4;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v158;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v159;
      __int16 v305 = 1024;
      int v306 = v160;
      __int16 v307 = 1024;
      int v308 = v161;
      __int16 v309 = 1024;
      int v310 = v162;
      _os_log_error_impl(&dword_1BF22B000, v157, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v156;
    _SASetCrashLogMessage(3039, "bufferLength %lu < serialized SATask struct with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v163, v164, v165, v166, v167, v168, a4);
    _os_crash();
    __break(1u);
LABEL_55:
    int v169 = *__error();
    uint64_t v170 = _sa_logt();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
    {
      int v171 = *(_DWORD *)(v6 + 66);
      int v172 = *(_DWORD *)(v6 + 70);
      int v173 = *(_DWORD *)(v6 + 74);
      int v174 = *(_DWORD *)(v6 + 78);
      int v175 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v171;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v172;
      __int16 v305 = 1024;
      int v306 = v173;
      __int16 v307 = 1024;
      int v308 = v174;
      __int16 v309 = 1024;
      int v310 = v175;
      _os_log_error_impl(&dword_1BF22B000, v170, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v169;
    _SASetCrashLogMessage(3086, "bufferLength %lu < serialized SATask struct v2 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v176, v177, v178, v179, v180, v181, (char)a3);
    _os_crash();
    __break(1u);
LABEL_58:
    int v182 = *__error();
    uint64_t v183 = _sa_logt();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      int v184 = *(_DWORD *)(v6 + 66);
      int v185 = *(_DWORD *)(v6 + 70);
      int v186 = *(_DWORD *)(v6 + 74);
      int v187 = *(_DWORD *)(v6 + 78);
      int v188 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v184;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v185;
      __int16 v305 = 1024;
      int v306 = v186;
      __int16 v307 = 1024;
      int v308 = v187;
      __int16 v309 = 1024;
      int v310 = v188;
      _os_log_error_impl(&dword_1BF22B000, v183, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v182;
    _SASetCrashLogMessage(3113, "bufferLength %lu < serialized SATask struct v3 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v189, v190, v191, v192, v193, v194, (char)a3);
    _os_crash();
    __break(1u);
LABEL_61:
    int v195 = *__error();
    id v196 = _sa_logt();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      int v197 = *(_DWORD *)(v6 + 66);
      int v198 = *(_DWORD *)(v6 + 70);
      int v199 = *(_DWORD *)(v6 + 74);
      int v200 = *(_DWORD *)(v6 + 78);
      int v201 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v197;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v198;
      __int16 v305 = 1024;
      int v306 = v199;
      __int16 v307 = 1024;
      int v308 = v200;
      __int16 v309 = 1024;
      int v310 = v201;
      _os_log_error_impl(&dword_1BF22B000, v196, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v195;
    _SASetCrashLogMessage(3125, "bufferLength %lu < serialized SATask struct v4 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v202, v203, v204, v205, v206, v207, (char)a3);
    _os_crash();
    __break(1u);
LABEL_64:
    int v208 = *__error();
    unint64_t v209 = _sa_logt();
    if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
    {
      int v210 = *(_DWORD *)(v6 + 66);
      int v211 = *(_DWORD *)(v6 + 70);
      int v212 = *(_DWORD *)(v6 + 74);
      int v213 = *(_DWORD *)(v6 + 78);
      int v214 = *(_DWORD *)(v6 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)a3;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v210;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v211;
      __int16 v305 = 1024;
      int v306 = v212;
      __int16 v307 = 1024;
      int v308 = v213;
      __int16 v309 = 1024;
      int v310 = v214;
      _os_log_error_impl(&dword_1BF22B000, v209, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v208;
    _SASetCrashLogMessage(3141, "bufferLength %lu < serialized SATask struct v5 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v215, v216, v217, v218, v219, v220, (char)a3);
    _os_crash();
    __break(1u);
LABEL_67:
    int v221 = *__error();
    unint64_t v222 = _sa_logt();
    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      int v223 = *(_DWORD *)(v300 + 66);
      int v224 = *(_DWORD *)(v300 + 70);
      int v225 = *(_DWORD *)(v300 + 74);
      int v226 = *(_DWORD *)(v300 + 78);
      int v227 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v223;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v224;
      __int16 v305 = 1024;
      int v306 = v225;
      __int16 v307 = 1024;
      int v308 = v226;
      __int16 v309 = 1024;
      int v310 = v227;
      _os_log_error_impl(&dword_1BF22B000, v222, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v221;
    _SASetCrashLogMessage(3153, "bufferLength %lu < serialized SATask struct v6 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v228, v229, v230, v231, v232, v233, (char)v298);
    _os_crash();
    __break(1u);
LABEL_70:
    int v234 = *__error();
    __int16 v235 = _sa_logt();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
    {
      int v236 = *(_DWORD *)(v300 + 66);
      int v237 = *(_DWORD *)(v300 + 70);
      int v238 = *(_DWORD *)(v300 + 74);
      int v239 = *(_DWORD *)(v300 + 78);
      int v240 = *(_DWORD *)(v300 + 82);
      *(_DWORD *)buf = 134219264;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v236;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v237;
      __int16 v305 = 1024;
      int v306 = v238;
      __int16 v307 = 1024;
      int v308 = v239;
      __int16 v309 = 1024;
      int v310 = v240;
      _os_log_error_impl(&dword_1BF22B000, v235, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", buf, 0x2Au);
    }

    *__error() = v234;
    _SASetCrashLogMessage(3164, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues", v241, v242, v243, v244, v245, v246, (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_73;
  }
  int v14 = v13;
  v298 = (const void *)a4;
  unint64_t v15 = *(void *)((char *)a3 + 26);
  int v16 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  int v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v17;

  unint64_t v19 = *(void *)((char *)a3 + 34);
  int v20 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v12, v14, v20, 0);
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleName = self->_bundleName;
  self->_bundleName = v21;

  unint64_t v23 = *(void *)((char *)a3 + 42);
  uint64_t v24 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v23, v12, v14, v24, 0);
  uint64_t v25 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  execTimestamp = self->_execTimestamp;
  self->_execTimestamp = v25;

  unint64_t v27 = *(void *)((char *)a3 + 50);
  unint64_t v28 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v12, v14, v28, 0);
  unint64_t v29 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v29;

  unint64_t v31 = *(void *)((char *)a3 + 86);
  __int16 v32 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v12, v14, v32, 0);
  int v33 = (SAThread *)objc_claimAutoreleasedReturnValue();
  mainThread = self->_mainThread;
  self->_mainThread = v33;

  unint64_t v35 = *(void *)((char *)a3 + 94);
  __int16 v36 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v35, v12, v14, v36, 0);
  int v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  mainBinaryPath = self->_mainBinaryPath;
  self->_mainBinaryPath = v37;

  unint64_t v39 = *(void *)((char *)a3 + 102);
  long long v40 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v39, v12, v14, v40, 0);
  long long v41 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
  sharedCache = self->_sharedCache;
  self->_sharedCache = v41;

  if (!self->_sharedCache) {
    self->_hasNoSharedCache = 1;
  }
  uint64_t v43 = *(unsigned int *)((char *)a3 + 66);
  long long v44 = (char *)a3 + 8 * v43 + 120;
  v300 = (char *)a3;
  uint64_t v45 = *(unsigned int *)((char *)a3 + 70);
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = SASerializableNewMutableArrayFromIndexList((uint64_t)v44, v45, v12, v14, v46);
  id v48 = (NSArray *)[v47 copy];
  binaryLoadInfos = self->_binaryLoadInfos;
  self->_binaryLoadInfos = v48;

  uint64_t v50 = *(unsigned int *)((char *)a3 + 66);
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = v50;
  BOOL v6 = (char *)a3;
  SASerializableNewMutableSetFromIndexList((uint64_t)a3 + 120, v52, v12, v14, v51);
  uint64_t v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v53;

  uint64_t v55 = *(unsigned int *)((char *)a3 + 70);
  uint64_t v56 = *(unsigned int *)(v6 + 74);
  long long v57 = objc_opt_class();
  uint64_t v292 = (uint64_t)&v44[8 * v55];
  SASerializableNewMutableArrayFromIndexList(v292, v56, v12, v14, v57);
  id v58 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  taskStates = self->_taskStates;
  self->_taskStates = v58;

  uint64_t v60 = *(unsigned int *)(v6 + 74);
  id v61 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*(unsigned int *)(v6 + 78)];
  threads = self->_threads;
  self->_threads = v61;

  uint64_t v63 = 8 * v43;
  uint64_t v294 = 8 * v43;
  uint64_t v295 = v55;
  uint64_t v299 = v60;
  if (*(_DWORD *)(v6 + 78))
  {
    unint64_t v64 = 0;
    uint64_t v65 = (uint64_t)&v6[8 * v60 + 120 + 8 * v55 + v63];
    do
    {
      unint64_t v66 = *(void *)(v65 + 8 * v64);
      uint64_t v67 = objc_opt_class();
      uint64_t v68 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v66, v12, v14, v67, 0);
      int v69 = self->_threads;
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v68, "threadId"));
      int v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      __int16 v70 = v69;
      BOOL v6 = v300;
      [(NSMutableDictionary *)v70 setObject:v68 forKeyedSubscript:v7];

      ++v64;
      unint64_t v71 = *(unsigned int *)(v300 + 78);
    }
    while (v64 < v71);
    uint64_t v55 = v295;
    uint64_t v60 = v299;
  }
  else
  {
    LODWORD(v71) = 0;
  }
  uint64_t v72 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*(unsigned int *)(v6 + 82)];
  dispatchQueues = self->_dispatchQueues;
  self->_dispatchQueues = v72;

  uint64_t v291 = v71;
  if (*(_DWORD *)(v6 + 82))
  {
    unint64_t v74 = 0;
    uint64_t v75 = (uint64_t)&v6[8 * v71 + 120 + 8 * v60 + 8 * v55 + v294];
    do
    {
      unint64_t v76 = *(void *)(v75 + 8 * v74);
      uint64_t v77 = objc_opt_class();
      uint64_t v78 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v76, v12, v14, v77, 0);
      uint64_t v79 = self->_dispatchQueues;
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v78, "identifier"));
      int v7 = (unint64_t *)objc_claimAutoreleasedReturnValue();
      uint64_t v80 = v79;
      BOOL v6 = v300;
      [(NSMutableDictionary *)v80 setObject:v78 forKeyedSubscript:v7];

      ++v74;
      unint64_t v81 = *(unsigned int *)(v300 + 82);
    }
    while (v74 < v81);
  }
  else
  {
    LODWORD(v81) = 0;
  }
  a3 = v298;
  if (v6[1] < 2u) {
    goto LABEL_48;
  }
  if (v296 + 176 > (unint64_t)v298) {
    goto LABEL_55;
  }
  int v7 = (unint64_t *)(v292 + 8 * v299 + 8 * v71 + 8 * v81);
  unint64_t v82 = *v7;
  uint64_t v83 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v82, v12, v14, v83, 0);
  id v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleBuildVersion = self->_bundleBuildVersion;
  self->_bundleBuildVersion = v84;

  unint64_t v86 = v7[1];
  id v87 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v86, v12, v14, v87, 0);
  char v88 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProjectName = self->_bundleProjectName;
  self->_bundleProjectName = v88;

  unint64_t v90 = v7[2];
  uint64_t v91 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v90, v12, v14, v91, 0);
  uint64_t v92 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleSourceVersion = self->_bundleSourceVersion;
  self->_bundleSourceVersion = v92;

  unint64_t v94 = v7[3];
  int v95 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v94, v12, v14, v95, 0);
  uint64_t v96 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleProductBuildVersion = self->_bundleProductBuildVersion;
  self->_bundleProductBuildVersion = v96;

  if (!self->_adamID)
  {
    unint64_t v98 = v7[4];
    uint64_t v99 = objc_opt_class();
    char v100 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v98, v12, v14, v99, 0);
    if (v100)
    {
      id v101 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      uint64_t v102 = [v101 numberFromString:v100];
      uint64_t v103 = v102;
      if (v102)
      {
        self->_adamID = [v102 unsignedLongLongValue];
      }
      else
      {
        id v293 = v101;
        int v290 = *__error();
        uint64_t v104 = _sa_logt();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v302 = (unint64_t)v100;
          _os_log_fault_impl(&dword_1BF22B000, v104, OS_LOG_TYPE_FAULT, "Unable to parse commerceAppID %@", buf, 0xCu);
        }

        *__error() = v290;
        id v101 = v293;
      }

      BOOL v6 = v300;
    }
  }
  unint64_t v105 = v7[5];
  uint64_t v106 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v105, v12, v14, v106, 0);
  uint64_t v107 = (NSString *)objc_claimAutoreleasedReturnValue();
  installerVersionID = self->_installerVersionID;
  self->_installerVersionID = v107;

  unint64_t v109 = v7[6];
  int v110 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v109, v12, v14, v110, 0);
  int v111 = (NSString *)objc_claimAutoreleasedReturnValue();
  vendorID = self->_vendorID;
  self->_vendorID = v111;

  if (v6[1] < 3u) {
    goto LABEL_48;
  }
  if (v296 + 184 > (unint64_t)v298) {
    goto LABEL_58;
  }
  unint64_t v113 = v7[7];
  unint64_t v114 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v113, v12, v14, v114, 0);
  id v115 = (SABinary *)objc_claimAutoreleasedReturnValue();
  mainBinary = self->_mainBinary;
  self->_mainBinary = v115;

  if (v6[1] < 4u) {
    goto LABEL_48;
  }
  if (v296 + 216 > (unint64_t)v298) {
    goto LABEL_61;
  }
  self->_adamID = v7[8];
  unint64_t v117 = v7[9];
  uint64_t v118 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v117, v12, v14, v118, 0);
  uint64_t v119 = (NSString *)objc_claimAutoreleasedReturnValue();
  appType = self->_appType;
  self->_appType = v119;

  unint64_t v121 = v7[10];
  uint64_t v122 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v121, v12, v14, v122, 0);
  int v123 = (NSString *)objc_claimAutoreleasedReturnValue();
  cohortID = self->_cohortID;
  self->_cohortID = v123;

  self->_isBeta = (v6[118] & 0x20) != 0;
  unint64_t v125 = v7[11];
  uint64_t v126 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v125, v12, v14, v126, 0);
  uint64_t v127 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  pidStartTimestamp = self->_pidStartTimestamp;
  self->_pidStartTimestamp = v127;

  if (v6[1] < 5u) {
    goto LABEL_48;
  }
  if (v296 + 217 > (unint64_t)v298) {
    goto LABEL_64;
  }
  self->_developerType = *((unsigned char *)v7 + 96);
  unsigned int v129 = v6[1];
  if (v129 < 6) {
    goto LABEL_48;
  }
  if (v296 + 225 > (unint64_t)v298) {
    goto LABEL_67;
  }
  self->_resourceCoalitionID = *(unint64_t *)((char *)v7 + 97);
  if (v129 < 7) {
    goto LABEL_48;
  }
  if (v296 + 229 > (unint64_t)v298) {
    goto LABEL_70;
  }
  unint64_t v297 = v296 + 229 + 8 * *(unsigned int *)((char *)v7 + 105);
  if (v297 > (unint64_t)v298)
  {
LABEL_73:
    int v247 = *__error();
    int v248 = _sa_logt();
    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
    {
      int v249 = *(_DWORD *)(v300 + 66);
      int v250 = *(_DWORD *)(v300 + 70);
      int v251 = *(_DWORD *)(v300 + 74);
      int v252 = *(_DWORD *)(v300 + 78);
      int v253 = *(_DWORD *)(v300 + 82);
      int v254 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v249;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v250;
      __int16 v305 = 1024;
      int v306 = v251;
      __int16 v307 = 1024;
      int v308 = v252;
      __int16 v309 = 1024;
      int v310 = v253;
      __int16 v311 = 1024;
      int v312 = v254;
      _os_log_error_impl(&dword_1BF22B000, v248, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v247;
    _SASetCrashLogMessage(3167, "bufferLength %lu < serialized SATask struct v7 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v255, v256, v257, v258, v259, v260, (char)v298);
    _os_crash();
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v130 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*(unsigned int *)((char *)v7 + 105)];
  swiftTasks = self->_swiftTasks;
  self->_swiftTasks = v130;

  if (*(_DWORD *)((char *)v7 + 105))
  {
    unint64_t v132 = 0;
    uint64_t v133 = (uint64_t)&v6[8 * v81 + 229 + 8 * v291 + 8 * v299 + 8 * v295 + v294];
    do
    {
      unint64_t v134 = *(void *)(v133 + 8 * v132);
      uint64_t v135 = objc_opt_class();
      id v136 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v134, v12, v14, v135, 0);
      int v137 = self->_swiftTasks;
      uint64_t v138 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v136, "identifier"));
      [(NSMutableDictionary *)v137 setObject:v136 forKeyedSubscript:v138];

      ++v132;
      unint64_t v139 = *(unsigned int *)((char *)v7 + 105);
    }
    while (v132 < v139);
  }
  else
  {
    unint64_t v139 = 0;
  }
  if (v300[1] < 8u) {
    goto LABEL_48;
  }
  if (v297 + 8 > (unint64_t)v298)
  {
LABEL_76:
    int v261 = *__error();
    v262 = _sa_logt();
    if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
    {
      int v263 = *(_DWORD *)(v300 + 66);
      int v264 = *(_DWORD *)(v300 + 70);
      int v265 = *(_DWORD *)(v300 + 74);
      int v266 = *(_DWORD *)(v300 + 78);
      int v267 = *(_DWORD *)(v300 + 82);
      int v268 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v263;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v264;
      __int16 v305 = 1024;
      int v306 = v265;
      __int16 v307 = 1024;
      int v308 = v266;
      __int16 v309 = 1024;
      int v310 = v267;
      __int16 v311 = 1024;
      int v312 = v268;
      _os_log_error_impl(&dword_1BF22B000, v262, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v261;
    _SASetCrashLogMessage(3182, "bufferLength %lu < serialized SATask struct v8 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v269, v270, v271, v272, v273, v274, (char)v298);
    _os_crash();
    __break(1u);
LABEL_79:
    int v275 = *__error();
    v276 = _sa_logt();
    if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
    {
      int v277 = *(_DWORD *)(v300 + 66);
      int v278 = *(_DWORD *)(v300 + 70);
      int v279 = *(_DWORD *)(v300 + 74);
      int v280 = *(_DWORD *)(v300 + 78);
      int v281 = *(_DWORD *)(v300 + 82);
      int v282 = *(_DWORD *)((char *)v7 + 105);
      *(_DWORD *)buf = 134219520;
      unint64_t v302 = (unint64_t)v298;
      __int16 v303 = 1024;
      *(_DWORD *)v304 = v277;
      *(_WORD *)&v304[4] = 1024;
      *(_DWORD *)&v304[6] = v278;
      __int16 v305 = 1024;
      int v306 = v279;
      __int16 v307 = 1024;
      int v308 = v280;
      __int16 v309 = 1024;
      int v310 = v281;
      __int16 v311 = 1024;
      int v312 = v282;
      _os_log_error_impl(&dword_1BF22B000, v276, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", buf, 0x30u);
    }

    *__error() = v275;
    _SASetCrashLogMessage(3193, "bufferLength %lu < serialized SATask struct v9 with %u root frames, %u image infos, %u task states, %u threads, %u dispatch queues, %u swift tasks", v283, v284, v285, v286, v287, v288, (char)v298);
    _os_crash();
    __break(1u);
LABEL_82:
    id v289 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATask version" userInfo:0];
    objc_exception_throw(v289);
  }
  __int16 v140 = (unint64_t *)((char *)&v7[v139 + 13] + 5);
  unint64_t v141 = *v140;
  unint64_t v142 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v141, v12, v14, v142, 0);
  int v143 = (NSString *)objc_claimAutoreleasedReturnValue();
  distributorID = self->_distributorID;
  self->_distributorID = v143;

  if (v300[1] >= 9u)
  {
    if (v297 + 16 <= (unint64_t)v298)
    {
      unint64_t v145 = v140[1];
      __int16 v146 = objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v145, v12, v14, v146, 0);
      uint64_t v147 = (NSString *)objc_claimAutoreleasedReturnValue();
      resourceCoalitionName = self->_resourceCoalitionName;
      self->_resourceCoalitionName = v147;

      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_48:
}

+ (double)taskWithoutReferencesFromPAStyleSerializedTask:(uint64_t)a1
{
  self;
  uint64_t v3 = (int *)+[SATask taskWithPid:uniquePid:name:sharedCache:]((uint64_t)SATask, *(unsigned int *)(a2 + 8), *(void *)(a2 + 40), 0, 0);
  if (*((void *)v3 + 12) == -1) {
    *((void *)v3 + 12) = v3[19];
  }
  v3[20] = *(_DWORD *)(a2 + 12);
  v3[21] = *(_DWORD *)(a2 + 16);
  v3[22] = *(_DWORD *)(a2 + 20);
  if (*(void *)a2 <= 0xF33DFAC5uLL)
  {
    *((unsigned char *)v3 + 67) = *(unsigned char *)(a2 + 56);
    *((unsigned char *)v3 + 68) = *(unsigned char *)(a2 + 57);
    *((unsigned char *)v3 + 69) = *(unsigned char *)(a2 + 58);
    double result = *(double *)(a2 + 62);
    *((double *)v3 + 30) = result;
    *((void *)v3 + 36) = *(void *)(a2 + 87);
  }
  else
  {
    *((unsigned char *)v3 + 67) = *(unsigned char *)(a2 + 56);
    *((unsigned char *)v3 + 68) = *(unsigned char *)(a2 + 57);
    *((unsigned char *)v3 + 69) = *(unsigned char *)(a2 + 58);
    double result = *(double *)(a2 + 60);
    *((double *)v3 + 30) = result;
    *((void *)v3 + 36) = *(void *)(a2 + 84);
    if (*(void *)a2 > 0xF33DFAC6uLL) {
      *((unsigned char *)v3 + 70) = *(unsigned char *)(a2 + 100);
    }
  }
  return result;
}

- (void)populateReferencesUsingPAStyleSerializedTask:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v52 = a3;
  id v7 = a4;
  if (a1)
  {
    unint64_t v8 = a2[3];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v8, v52, v7, v9, 0);
    uint64_t v11 = (void *)a1[7];
    a1[7] = v10;

    unint64_t v12 = a2[4];
    id v13 = objc_opt_class();
    uint64_t v14 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v52, v7, v13, 0);
    unint64_t v15 = (void *)a1[13];
    a1[13] = v14;

    uint64_t v16 = *a2;
    if (*a2 == 4080925383)
    {
      int v17 = (void *)((char *)a2 + 68);
      int v18 = (void *)((char *)a2 + 76);
      uint64_t v19 = 101;
    }
    else if (v16 == 4080925382)
    {
      int v17 = (void *)((char *)a2 + 68);
      int v18 = (void *)((char *)a2 + 76);
      uint64_t v19 = 100;
    }
    else
    {
      if (v16 != 4080925381)
      {
        id v48 = @"Bad SAPAStyleTimeInsensitiveTaskData magic";
        goto LABEL_23;
      }
      int v17 = (void *)((char *)a2 + 70);
      int v18 = (void *)((char *)a2 + 78);
      uint64_t v19 = 103;
    }
    uint64_t v20 = *v17;
    uint64_t v21 = *v18;
    uint64_t v22 = (void *)((char *)a2 + v19);
    if (!*v17) {
      goto LABEL_13;
    }
    uint64_t v51 = a2;
    unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
    uint64_t v50 = v22;
    uint64_t v24 = v22;
    uint64_t v25 = v20;
    do
    {
      unint64_t v26 = *v24++;
      unint64_t v27 = objc_opt_class();
      unint64_t v28 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v52, v7, v27, 0);
      if (!v28)
      {
        id v48 = @"Failed to deserialize paImageInfo";
        goto LABEL_23;
      }
      __int16 v30 = v28;
      id v31 = objc_getProperty(v28, v29, 8, 1);
      [v23 addObject:v31];

      --v25;
    }
    while (v25);
    uint64_t v32 = [v23 copy];
    int v33 = (void *)a1[31];
    a1[31] = v32;

    uint64_t v22 = v50;
    a2 = v51;
LABEL_13:
    if (v21)
    {
      __int16 v34 = &v22[v20];
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v21];
      __int16 v36 = (void *)a1[35];
      a1[35] = v35;

      while (1)
      {
        unint64_t v37 = *v34++;
        uint64_t v38 = objc_opt_class();
        unint64_t v39 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v37, v52, v7, v38, 0);
        if (!v39) {
          break;
        }
        long long v41 = v39;
        long long v42 = (void *)a1[35];
        id v43 = objc_getProperty(v39, v40, 8, 1);
        [v42 addObject:v43];

        if (!--v21) {
          goto LABEL_17;
        }
      }
      id v48 = @"Failed to deserialize root frame";
LABEL_23:
      id v49 = +[SAException exceptionWithName:@"Decoding failure" reason:v48 userInfo:0];
      objc_exception_throw(v49);
    }
LABEL_17:
    unint64_t v44 = a2[6];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v44, v52, v7, v45, 0);
    uint64_t v47 = (void *)a1[5];
    a1[5] = v46;
  }
}

- (id)removeStacksOutsideThisProcess
{
  if (a1)
  {
    unint64_t v2 = [*(id *)(a1 + 280) objectsPassingTest:&__block_literal_global_527];
    uint64_t v3 = [v2 anyObject];

    if (v3)
    {
      id v4 = objc_alloc_init(SAStackIterator);
      [*(id *)(a1 + 280) removeObject:v3];
      uint64_t v5 = objc_alloc_init(SAFrame);
      BOOL v6 = v5;
      if (v5) {
        v5->_BOOLs.bits |= 8u;
      }
      [*(id *)(a1 + 280) addObject:v5];
      id v7 = *(void **)(a1 + 16);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2;
      v12[3] = &unk_1E63F9D28;
      id v8 = v3;
      id v13 = v8;
      uint64_t v14 = v4;
      uint64_t v15 = a1;
      uint64_t v9 = v4;
      [v7 enumerateKeysAndObjectsUsingBlock:v12];
      id v10 = v8;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isTruncatedBacktraceFrame];
  if (result) {
    *a3 = 1;
  }
  return result;
}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3;
  v7[3] = &unk_1E63F9D00;
  id v8 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  [a3 enumerateThreadStatesBetweenStartTime:0 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:0 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:0 block:v7];
}

void __55__SATask_Serialization__removeStacksOutsideThisProcess__block_invoke_3(void *a1, void *a2)
{
  self = a2;
  uint64_t v3 = [self stack];
  id v4 = [v3 firstObject];
  id v5 = (void *)a1[4];

  if (v4 == v5)
  {
    id v7 = (void *)a1[5];
    if (v7)
    {
      objc_setProperty_atomic(v7, v6, v3, 8);
      id v8 = (void *)a1[5];
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v10 = -[SATask leafFrameAfterAddingStack:leafOfCRootFramesReplacedBySwiftAsync:](a1[6], v8, 0);
    if (self) {
      objc_setProperty_atomic(self, v9, v10, 64);
    }
  }
}

@end