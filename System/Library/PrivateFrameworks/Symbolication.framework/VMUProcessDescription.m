@interface VMUProcessDescription
+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3;
+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3 withArchitecture:(_CSArchitecture)a4;
+ (id)parseBinaryImagesDescription:(id)a3;
- (BOOL)initFromCorpseOrCore;
- (BOOL)is64Bit;
- (BOOL)isAppleApplication;
- (BOOL)isTranslated;
- (VMUProcessDescription)initWithPid:(int)a3 orTask:(unsigned int)a4;
- (VMUProcessDescription)initWithTask:(unsigned int)a3 getBinariesList:(BOOL)a4;
- (VMUProcessDescription)initWithVMUTaskMemoryCache:(id)a3 getBinariesList:(BOOL)a4;
- (id)_binaryImagesDescriptionForRanges:(id)a3;
- (id)_buildInfoDescription;
- (id)_buildVersionDictionary;
- (id)_bundleLock;
- (id)_cpuTypeDescription;
- (id)_osVersionDictionary;
- (id)_rangesOfBinaryImages:(id)a3 forBacktraces:(id)a4;
- (id)_sanitizeVersion:(id)a3;
- (id)_systemVersionDescription;
- (id)binaryImageDictionaryForAddress:(unint64_t)a3;
- (id)binaryImages;
- (id)binaryImagesDescription;
- (id)binaryImagesDescriptionForBacktraces:(id)a3;
- (id)bundleIdentifier;
- (id)date;
- (id)dateAndVersionDescription;
- (id)description;
- (id)executablePath;
- (id)parentProcessName;
- (id)parentProcessPath;
- (id)processDescriptionHeader;
- (id)processIdentifier;
- (id)processName;
- (id)processStatisticsDescription;
- (id)processVersion;
- (id)processVersionDictionary;
- (id)valueForEnvVar:(id)a3;
- (int)cpuType;
- (int)parentPid;
- (int)pid;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unsigned)idleExitStatus;
- (unsigned)task;
- (void)_libraryLoaded:(_CSTypeRef)a3;
- (void)dealloc;
- (void)initFromLiveProcess;
- (void)setCrashReporterInfo;
@end

@implementation VMUProcessDescription

- (void)setCrashReporterInfo
{
  v3 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  processName = (__CFString *)self->_processName;
  if (!processName) {
    processName = @"<unknown>";
  }
  v5 = processName;
  executablePath = (__CFString *)self->_executablePath;
  if (!executablePath) {
    executablePath = @"<unknown>";
  }
  v7 = executablePath;
  parentProcessName = (__CFString *)self->_parentProcessName;
  if (!parentProcessName) {
    parentProcessName = @"<unknown>";
  }
  v9 = parentProcessName;
  parentExecutablePath = (__CFString *)self->_parentExecutablePath;
  if (!parentExecutablePath) {
    parentExecutablePath = @"<unknown>";
  }
  v11 = parentExecutablePath;
  v12 = [NSString stringWithFormat:@"VMUProcessDescription is examining:\n   process: %@  pid: %d  path: %@  _binaryImages count: %zu\n   parent process: %@  pid: %d  path: %@\n", v5, self->_pid, v7, -[NSMutableArray count](self->_binaryImages, "count"), v9, self->_ppid, v11];
  VMUSetCrashReporterInfo(v12);
}

+ (id)parseBinaryImagesDescription:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  while (1)
  {
    [v5 scanUpToString:@"/" intoString:0];
    if ([v5 isAtEnd]) {
      break;
    }
    id v12 = 0;
    [v5 scanUpToCharactersFromSet:v6 intoString:&v12];
    id v7 = v12;
    v8 = v7;
    if (v7)
    {
      v9 = [v7 substringFromIndex:[v7 rangeOfString:@"/" options:4] + 1];
      if ([v9 length])
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v10 setObject:v8 forKey:@"ExecutablePath"];
        [v10 setObject:v9 forKey:@"DisplayName"];
        [v4 addObject:v10];
      }
    }
  }

  return v4;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 symbolicatorFromBinaryImagesDescription:v4 withArchitecture:MEMORY[0x1AD0D8AE0]()];
  unint64_t v7 = v6;

  unint64_t v8 = v5;
  unint64_t v9 = v7;
  result._opaque_2 = v9;
  result._opaque_1 = v8;
  return result;
}

+ (_CSTypeRef)symbolicatorFromBinaryImagesDescription:(id)a3 withArchitecture:(_CSArchitecture)a4
{
  id v5 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x4812000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = &unk_1A7D91765;
  v45 = 0;
  uint64_t v46 = 0;
  v44 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x4812000000;
  v32 = __Block_byref_object_copy__14;
  v33 = __Block_byref_object_dispose__15;
  v34 = &unk_1A7D91765;
  v36 = 0;
  uint64_t v37 = 0;
  __p = 0;
  int v6 = [v5 containsString:@"("];
  if (v6) {
    unint64_t v7 = @"(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*\\(([0-9\\- \\.\\?]*)\\)\\s*<(\\S{36})>\\s*(.*)";
  }
  else {
    unint64_t v7 = @"(0x[a-fA-F0-9]*)\\s*-\\s*(0x[a-fA-F0-9]*)\\s*(\\S*)\\s*(\\S*)\\s*<(\\S{32})>\\s*(.*)";
  }
  unint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v7 options:1 error:0];
  uint64_t v9 = [v5 length];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke;
  v23[3] = &unk_1E5D238D0;
  id v10 = v5;
  id v24 = v10;
  v25 = &v29;
  char v28 = v6;
  v26 = &v38;
  _CSArchitecture v27 = a4;
  [v8 enumerateMatchesInString:v10 options:0 range:0 usingBlock:v9];
  uint64_t v11 = v39[6];
  if (v39[7] == v11) {
    goto LABEL_11;
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  uint64_t v14 = 48;
  do
  {
    *(void *)(v11 + v14) = v30[6] + v12;
    ++v13;
    uint64_t v11 = v39[6];
    uint64_t v15 = v39[7];
    v12 += 40;
    v14 += 64;
  }
  while (v13 < (v15 - v11) >> 6);
  if (v15 == v11)
  {
LABEL_11:
    unint64_t v18 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification();
    unint64_t v18 = v17;
    uint64_t v19 = v39[6];
    uint64_t v20 = v39[7];
    while (v19 != v20)
    {
      free(*(void **)(v19 + 40));
      v19 += 64;
    }
  }

  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v38, 8);
  if (v44)
  {
    v45 = v44;
    operator delete(v44);
  }

  unint64_t v21 = v16;
  unint64_t v22 = v18;
  result._opaque_2 = v22;
  result._opaque_1 = v21;
  return result;
}

void __82__VMUProcessDescription_symbolicatorFromBinaryImagesDescription_withArchitecture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x1AD0D9F90]();
  *((void *)&v86 + 1) = 1;
  strcpy((char *)&v88, "__TEXT");
  uint64_t v4 = [v3 rangeAtIndex:1];
  uint64_t v6 = v5;
  uint64_t v7 = [v3 rangeAtIndex:2];
  uint64_t v9 = v8;
  uint64_t v10 = [v3 rangeAtIndex:4];
  uint64_t v78 = v11;
  uint64_t v12 = v10;
  uint64_t v13 = [v3 rangeAtIndex:5];
  uint64_t v77 = v12;
  uint64_t v79 = v14;
  uint64_t v80 = v13;
  uint64_t v15 = [v3 rangeAtIndex:6];
  uint64_t v17 = v16;
  id v18 = objc_alloc(MEMORY[0x1E4F28FE8]);
  uint64_t v19 = [*(id *)(a1 + 32) substringWithRange:v4, v6];
  uint64_t v20 = (void *)[v18 initWithString:v19];

  [v20 scanHexLongLong:&v87];
  id v21 = objc_alloc(MEMORY[0x1E4F28FE8]);
  unint64_t v22 = [*(id *)(a1 + 32) substringWithRange:v7, v9];
  v23 = (void *)[v21 initWithString:v22];

  [v23 scanHexLongLong:(char *)&v87 + 8];
  ++*((void *)&v87 + 1);
  id v24 = *(void **)(*(void *)(a1 + 40) + 8);
  unint64_t v25 = v24[7];
  unint64_t v26 = v24[8];
  if (v25 >= v26)
  {
    uint64_t v30 = v24[6];
    unint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v25 - v30) >> 3);
    unint64_t v32 = v31 + 1;
    if (v31 + 1 > 0x666666666666666) {
      std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v33 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v26 - v30) >> 3);
    if (2 * v33 > v32) {
      unint64_t v32 = 2 * v33;
    }
    if (v33 >= 0x333333333333333) {
      unint64_t v34 = 0x666666666666666;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v34) {
      v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v24 + 8), v34);
    }
    else {
      v35 = 0;
    }
    v36 = &v35[40 * v31];
    uint64_t v37 = &v35[40 * v34];
    long long v38 = v87;
    long long v39 = v88;
    *((void *)v36 + 4) = v89;
    *(_OWORD *)v36 = v38;
    *((_OWORD *)v36 + 1) = v39;
    uint64_t v29 = v36 + 40;
    v41 = (char *)v24[6];
    uint64_t v40 = (char *)v24[7];
    if (v40 != v41)
    {
      do
      {
        long long v42 = *(_OWORD *)(v40 - 40);
        long long v43 = *(_OWORD *)(v40 - 24);
        *((void *)v36 - 1) = *((void *)v40 - 1);
        *(_OWORD *)(v36 - 24) = v43;
        *(_OWORD *)(v36 - 40) = v42;
        v36 -= 40;
        v40 -= 40;
      }
      while (v40 != v41);
      uint64_t v40 = (char *)v24[6];
    }
    v24[6] = v36;
    v24[7] = v29;
    v24[8] = v37;
    if (v40) {
      operator delete(v40);
    }
  }
  else
  {
    long long v27 = v87;
    long long v28 = v88;
    *(void *)(v25 + 32) = v89;
    *(_OWORD *)unint64_t v25 = v27;
    *(_OWORD *)(v25 + 16) = v28;
    uint64_t v29 = (char *)(v25 + 40);
  }
  v24[7] = v29;
  if (*(unsigned char *)(a1 + 64))
  {
    unint64_t v44 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v82 = 0;
    [*(id *)(a1 + 32) substringWithRange:v77, v78];
    id v45 = objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v45 cStringUsingEncoding:4];

    if ((MEMORY[0x1AD0D9980](v46, (char *)&v82 + 4, &v82) & 1) == 0)
    {
      CFLog();
      goto LABEL_43;
    }
    unint64_t v44 = HIDWORD(v82) | ((unint64_t)v82 << 32);
  }
  *(void *)&long long v85 = v44;
  [*(id *)(a1 + 32) substringWithRange:v15, v17];
  id v47 = objc_claimAutoreleasedReturnValue();
  v48 = (const char *)[v47 cStringUsingEncoding:4];

  size_t v49 = strlen(v48);
  *((void *)&v85 + 1) = strndup(v48, v49);
  if (*((void *)&v85 + 1))
  {
    v50 = [*(id *)(a1 + 32) substringWithRange:v80, v79];
    char v51 = [v50 containsString:@"-"];
    id v52 = v50;
    v53 = v52;
    if (v51) {
      MEMORY[0x1AD0D8FE0]([v52 cStringUsingEncoding:1], &v84);
    }
    else {
      sscanf((const char *)[v52 cStringUsingEncoding:1], "%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx", &v84, (char *)&v84 + 1, (char *)&v84 + 2, (char *)&v84 + 3, (char *)&v84 + 4, (char *)&v84 + 5, (char *)&v84 + 6, (char *)&v84 + 7, (char *)&v84 + 8, (char *)&v84 + 9, (char *)&v84 + 10, (char *)&v84 + 11, (char *)&v84 + 12, (char *)&v84 + 13, (char *)&v84 + 14, (char *)&v84 + 15);
    }
    v54 = *(void **)(*(void *)(a1 + 48) + 8);
    v55 = (_OWORD *)v54[7];
    unint64_t v56 = v54[8];
    if ((unint64_t)v55 >= v56)
    {
      uint64_t v61 = v54[6];
      uint64_t v62 = ((uint64_t)v55 - v61) >> 6;
      unint64_t v63 = v62 + 1;
      if ((unint64_t)(v62 + 1) >> 58) {
        std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v64 = v56 - v61;
      if (v64 >> 5 > v63) {
        unint64_t v63 = v64 >> 5;
      }
      if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v65 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v65 = v63;
      }
      if (v65) {
        v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v54 + 8), v65);
      }
      else {
        v66 = 0;
      }
      v67 = &v66[64 * v62];
      v68 = &v66[64 * v65];
      long long v69 = v83;
      long long v70 = v84;
      long long v71 = v86;
      *((_OWORD *)v67 + 2) = v85;
      *((_OWORD *)v67 + 3) = v71;
      *(_OWORD *)v67 = v69;
      *((_OWORD *)v67 + 1) = v70;
      v60 = v67 + 64;
      v73 = (char *)v54[6];
      v72 = (char *)v54[7];
      if (v72 != v73)
      {
        do
        {
          long long v74 = *((_OWORD *)v72 - 4);
          long long v75 = *((_OWORD *)v72 - 3);
          long long v76 = *((_OWORD *)v72 - 1);
          *((_OWORD *)v67 - 2) = *((_OWORD *)v72 - 2);
          *((_OWORD *)v67 - 1) = v76;
          *((_OWORD *)v67 - 4) = v74;
          *((_OWORD *)v67 - 3) = v75;
          v67 -= 64;
          v72 -= 64;
        }
        while (v72 != v73);
        v72 = (char *)v54[6];
      }
      v54[6] = v67;
      v54[7] = v60;
      v54[8] = v68;
      if (v72) {
        operator delete(v72);
      }
    }
    else
    {
      long long v57 = v83;
      long long v58 = v84;
      long long v59 = v86;
      v55[2] = v85;
      v55[3] = v59;
      _OWORD *v55 = v57;
      v55[1] = v58;
      v60 = v55 + 4;
    }
    v54[7] = v60;
  }
LABEL_43:
}

- (VMUProcessDescription)initWithPid:(int)a3 orTask:(unsigned int)a4
{
  return [(VMUProcessDescription *)self initWithTask:*(void *)&a4 getBinariesList:0];
}

- (VMUProcessDescription)initWithTask:(unsigned int)a3 getBinariesList:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [[VMUTaskMemoryCache alloc] initWithTask:*(void *)&a3];
  uint64_t v7 = [(VMUProcessDescription *)self initWithVMUTaskMemoryCache:v6 getBinariesList:v4];

  return v7;
}

- (VMUProcessDescription)initWithVMUTaskMemoryCache:(id)a3 getBinariesList:(BOOL)a4
{
  int v4 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  v65.receiver = self;
  v65.super_class = (Class)VMUProcessDescription;
  uint64_t v7 = [(VMUProcessDescription *)&v65 init];
  if (!v7) {
    goto LABEL_60;
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  date = v7->_date;
  v7->_date = (NSDate *)v8;

  if (v50)
  {
    p_memoryCache = (BOOL *)&v7->_memoryCache;
    objc_storeStrong((id *)&v7->_memoryCache, a3);
    BOOL v10 = -[VMUTaskMemoryCache representsCore]((BOOL)v7->_memoryCache);
    memoryCache = v7->_memoryCache;
    if (v10)
    {
      if ([(VMUTaskMemoryCache *)memoryCache isKernel])
      {
        v7->_uint64_t pid = -1;
LABEL_11:
        if ([(VMUTaskMemoryCache *)v7->_memoryCache getPlatform:&v7->_platform])
        {

          uint64_t v7 = 0;
          goto LABEL_13;
        }
        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          v7->_BOOL taskIsCorpseOrCore = 1;
          [(VMUProcessDescription *)v7 initFromCorpseOrCore];
        }
        else if ([(VMUProcessDescription *)v7 initFromCorpseOrCore])
        {
          v7->_BOOL taskIsCorpseOrCore = 1;
        }
        else
        {
          v7->_BOOL taskIsCorpseOrCore = 0;
          [(VMUProcessDescription *)v7 initFromLiveProcess];
        }
        size_t v64 = 0;
        *(void *)v67 = 0x100000006;
        if (!sysctl(v67, 2u, 0, &v64, 0, 0))
        {
          uint64_t v14 = malloc_type_malloc(v64, 0xD8059D57uLL);
          if (!sysctl(v67, 2u, v14, &v64, 0, 0))
          {
            uint64_t v15 = [[NSString alloc] initWithUTF8String:v14];
            hardwareModel = v7->_hardwareModel;
            v7->_hardwareModel = (NSString *)v15;
          }
          free(v14);
        }
        if (!v7->_hardwareModel)
        {
          v7->_hardwareModel = (NSString *)&stru_1EFE27F38;
        }
        if (!-[VMUTaskMemoryCache representsCore](*p_memoryCache))
        {
          int ppid = v7->_ppid;
          if (ppid)
          {
            CFStringRef v18 = _CRCopyProcessNameForPID(ppid);
            parentProcessName = v7->_parentProcessName;
            v7->_parentProcessName = &v18->isa;

            CFStringRef v20 = _CRCopyExecutablePathForPID(v7->_ppid);
            parentExecutablePath = v7->_parentExecutablePath;
            v7->_parentExecutablePath = &v20->isa;
          }
        }
        if (!v7->_taskIsCorpseOrCore)
        {
          [(id)*p_memoryCache taskPort];
          v4 &= CSTaskHasStarted();
        }
        if (-[VMUTaskMemoryCache representsCore](*p_memoryCache)
          || [(id)*p_memoryCache taskPort]
          && [(id)*p_memoryCache taskPort] != -1)
        {
          unint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          binaryImages = v7->_binaryImages;
          v7->_binaryImages = v22;

          if (v4)
          {
            BOOL taskIsCorpseOrCore = v7->_taskIsCorpseOrCore;
            int FlagsForNoSymbolOrSourceInfoData = CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
            objc_initWeak(location, v7);
            BOOL v26 = -[VMUTaskMemoryCache representsCore]((BOOL)v7->_memoryCache);
            uint64_t v27 = FlagsForNoSymbolOrSourceInfoData | !taskIsCorpseOrCore;
            uint64_t v28 = *p_memoryCache;
            if (v26)
            {
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:](*p_memoryCache, v27, 0);
              v7->_symbolicator._opaque_2 = v29;
              v62[1] = (id)MEMORY[0x1E4F143A8];
              v62[2] = (id)3221225472;
              v62[3] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke;
              v62[4] = &unk_1E5D23678;
              unint64_t v63 = v7;
              CSSymbolicatorForeachSymbolOwnerAtTime();
            }
            else
            {
              v61[0] = MEMORY[0x1E4F143A8];
              v61[1] = 3221225472;
              v61[2] = __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2;
              v61[3] = &unk_1E5D23920;
              objc_copyWeak(v62, location);
              v7->_symbolicator._opaque_1 = -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:](v28, v27, v61);
              v7->_symbolicator._opaque_2 = v31;
              objc_destroyWeak(v62);
            }
            if (CSIsNull())
            {
              uint64_t pid = v7->_pid;
              [(VMUProcessDescription *)v7 processName];
              uint64_t v46 = v45 = pid;
              CFLog();
            }
            objc_destroyWeak(location);
          }
        }
        else
        {
          uint64_t v30 = v7->_pid;
          [(VMUProcessDescription *)v7 processName];
          uint64_t v46 = v45 = v30;
          CFLog();
        }
        if (v7->_executablePathNeedsCorrection || ![(NSString *)v7->_executablePath length])
        {
          id v47 = v7->_binaryImages;
          objc_sync_enter(v47);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          obj = v7->_binaryImages;
          uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v58;
            while (2)
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v58 != v34) {
                  objc_enumerationMutation(obj);
                }
                v36 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                uint64_t v37 = [(VMUProcessDescription *)v7 processIdentifier];
                long long v38 = [v36 objectForKey:@"Identifier"];
                int v39 = [v37 isEqualToString:v38];

                if (v39)
                {
                  uint64_t v40 = [v36 objectForKey:@"ExecutablePath"];
                  v41 = v40;
                  if (v40)
                  {
                    uint64_t v42 = [v40 copy];
                    executablePath = v7->_executablePath;
                    v7->_executablePath = (NSString *)v42;

                    v7->_executablePathNeedsCorrection = 0;
                    goto LABEL_53;
                  }
                }
              }
              uint64_t v33 = [(NSMutableArray *)obj countByEnumeratingWithState:&v57 objects:v66 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }
LABEL_53:

          objc_sync_exit(v47);
        }
        -[VMUProcessDescription cleansePathsIncludingBinaryImageList:](v7, "cleansePathsIncludingBinaryImageList:", 0, v45, v46);
        CSSymbolicatorGetAOutSymbolOwner();
        if (CSIsNull())
        {
          if (!-[VMUTaskMemoryCache isExclave]((BOOL)v50))
          {
            uint64_t v55 = 0;
            unint64_t v56 = 0;
            int v54 = 9999;
            long long v52 = 0u;
            long long v53 = 0u;
            *(_OWORD *)location = 0u;
            if (![(id)*p_memoryCache machVMRegionRecurseSubmapShortInfo64onAddress:&v56 size:&v55 nestingDepth:&v54 info:location])v7->_executableLoadAddress = v56; {
          }
            }
        }
        else
        {
          v7->_executableLoadAddress = CSSymbolOwnerGetBaseAddress();
        }
LABEL_60:
        uint64_t v7 = v7;
        uint64_t v13 = v7;
        goto LABEL_61;
      }
      if (!-[VMUTaskMemoryCache getCoreFilePid:]((uint64_t)v7->_memoryCache)) {
        goto LABEL_11;
      }
    }
    else
    {
      if (![(VMUTaskMemoryCache *)memoryCache taskPort]) {
        goto LABEL_11;
      }
      if ([(id)*p_memoryCache taskPort] == -1) {
        goto LABEL_11;
      }
      mach_error_t v12 = pid_for_task([(id)*p_memoryCache taskPort], &v7->_pid);
      if (!v12) {
        goto LABEL_11;
      }
      [(id)*p_memoryCache taskPort];
      mach_error_string(v12);
      CFLog();
    }
  }
LABEL_13:
  uint64_t v13 = 0;
LABEL_61:

  return v13;
}

uint64_t __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _libraryLoaded:a2 a3];
}

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 256)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _libraryLoaded:*(void *)(a3 + 16) :*(void *)(a3 + 24)];
  }
  else if (a2 == 16)
  {
    objc_copyWeak(&v5, (id *)(a1 + 32));
    CSSymbolicatorForeachSymbolOwnerAtTime();
    objc_destroyWeak(&v5);
  }
}

void __68__VMUProcessDescription_initWithVMUTaskMemoryCache_getBinariesList___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _libraryLoaded:a2, a3];
}

- (void)initFromLiveProcess
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  size_t size = 0;
  *(void *)CFStringRef v18 = 0xE00000001;
  int pid = self->_pid;
  int v19 = 1;
  int v20 = pid;
  if ((sysctl(v18, 4u, 0, &size, 0, 0) & 0x80000000) == 0)
  {
    int v4 = malloc_type_malloc(size, 0x35D5403BuLL);
    if (v4)
    {
      if ((sysctl(v18, 4u, v4, &size, 0, 0) & 0x80000000) == 0)
      {
        self->_is64Bit = (*((unsigned char *)v4 + 32) & 4) != 0;
        self->_proc_starttime = *(timeval *)v4;
        self->_int ppid = *((_DWORD *)v4 + 140);
      }
      free(v4);
    }
  }
  __int16 v16 = 0;
  size_t size = 0;
  *(void *)CFStringRef v18 = 0;
  _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies(self->_pid, (CFStringRef *)v18, &v16, (CFStringRef *)&size, (unsigned char *)&v16 + 1);
  executablePath = self->_executablePath;
  self->_executablePath = *(NSString **)v18;

  processName = self->_processName;
  self->_processName = (NSString *)size;

  memoryCache = self->_memoryCache;
  self->_executablePathNeedsCorrection = (_BYTE)v16 != 0;
  self->_processNameNeedsCorrection = HIBYTE(v16) != 0;
  [(VMUTaskMemoryCache *)memoryCache taskPort];
  self->_taskIsTranslated = CSTaskIsTranslated();
  uint32_t flags = 0;
  proc_get_dirty(self->_pid, &flags);
  if ((flags & 4) != 0) {
    int v8 = 3;
  }
  else {
    int v8 = 2;
  }
  if ((~flags & 3) != 0) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = v8;
  }
  self->_idleExitStatus = v9;
  BOOL v10 = [[VMUProcInfo alloc] initWithTask:[(VMUTaskMemoryCache *)self->_memoryCache taskPort]];
  uint64_t v11 = v10;
  if (!v10)
  {
    CFLog();
    goto LABEL_25;
  }
  int v12 = [(VMUProcInfo *)v10 cpuType];
  self->_cpuType = v12;
  if (self->_is64Bit)
  {
    int v13 = 16777223;
    if (v12 == 18)
    {
      int v13 = 16777234;
    }
    else if (v12 != 7)
    {
      goto LABEL_20;
    }
    self->_cpuType = v13;
  }
LABEL_20:
  if (self->_processNameNeedsCorrection || ![(NSString *)self->_processName length])
  {
    uint64_t v14 = [(VMUProcInfo *)v11 name];
    if (v14)
    {
      objc_storeStrong((id *)&self->_processName, v14);
      self->_processNameNeedsCorrection = 0;
    }
  }
LABEL_25:
}

- (BOOL)initFromCorpseOrCore
{
  kern_return_t v10;
  task_read_t v11;
  vm_map_t *v12;
  int *v13;
  mach_vm_size_t v14;
  mach_vm_size_t v15;
  mach_vm_address_t v16;
  vm_map_t *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *environment;
  const char *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int i;
  const char *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  char v55;
  char v56;
  char v57;
  int v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  id obj[2];
  id v71[2];
  long long v72;
  long long v73;
  long long v74;
  _OWORD v75[2];
  mach_vm_size_t kcd_size;
  mach_vm_address_t kcd_addr_begin;
  long long v78;
  char v79;
  uint64_t v80;

  uint64_t v80 = *MEMORY[0x1E4F143B8];
  long long v74 = 0u;
  memset(v75, 0, 24);
  v72 = 0u;
  v73 = 0u;
  *(_OWORD *)obj = 0u;
  *(_OWORD *)long long v71 = 0u;
  BOOL v3 = -[VMUTaskMemoryCache representsCore]((BOOL)self->_memoryCache);
  memoryCache = self->_memoryCache;
  if (v3)
  {
    id v5 = memoryCache;
    uint64_t v6 = -[VMUTaskMemoryCache coreFileProcName](v5);
    obj[0] = (id)[v6 copy];

    uint64_t v7 = -[VMUTaskMemoryCache coreFileProcPath](v5);
    obj[1] = (id)[v7 copy];

    int v8 = -[VMUTaskMemoryCache coreFileParentProcName](v5);
    v71[0] = (id)[v8 copy];

    unsigned int v9 = -[VMUTaskMemoryCache coreFileParentProcPath](v5);
    v71[1] = (id)[v9 copy];

    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcFlags:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileProcArgc:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePid:]((uint64_t)v5)
      || -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5)
      || [(VMUTaskMemoryCache *)v5 getCoreFileCPUType:(char *)&v72 + 4])
    {
      BOOL v10 = 5;
    }
    else if (-[VMUTaskMemoryCache getCoreFileDirtyFlags:]((uint64_t)v5))
    {
      BOOL v10 = 5;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = [(VMUTaskMemoryCache *)memoryCache taskPort];
    kcd_addr_begin = 0;
    kcd_size_t size = 0;
    int v12 = (vm_map_t *)MEMORY[0x1E4F14960];
    BOOL v10 = task_map_corpse_info_64(*MEMORY[0x1E4F14960], v11, &kcd_addr_begin, &kcd_size);
    if (!v10)
    {
      int v13 = (int *)kcd_addr_begin;
      uint64_t v14 = kcd_size;
      uint64_t v15 = kcd_size + kcd_addr_begin;
      __int16 v16 = kcd_addr_begin + 16;
      if (v13 + 4 <= (int *)((char *)v13 + kcd_size) && v16 + *(unsigned int *)(kcd_addr_begin + 4) <= v15)
      {
        CFStringRef v18 = 0;
        uint64_t v17 = v12;
        if (*(_DWORD *)kcd_addr_begin == -559025833)
        {
          uint64_t v55 = 0;
          v66 = 0;
          size_t v64 = 0;
          objc_super v65 = 0;
          unint64_t v56 = 0;
          long long v57 = 0;
          long long v69 = 0;
          do
          {
            if (v16 + v13[1] > v15) {
              break;
            }
            long long v58 = *v13;
            if (*v13 == -242132755) {
              break;
            }
            if ((v58 & 0xFFFFFFF0) == 0x20) {
              long long v58 = 17;
            }
            switch(v58)
            {
              case 2053:
                DWORD2(v72) = v13[4];
                uint64_t v55 = 1;
                break;
              case 2054:
                HIDWORD(v72) = v13[4];
                v66 = 1;
                break;
              case 2055:
              case 2056:
              case 2058:
              case 2062:
              case 2064:
              case 2065:
              case 2066:
              case 2067:
                break;
              case 2057:
                uint64_t v78 = *((_OWORD *)v13 + 1);
                uint64_t v79 = 0;
                long long v59 = [NSString stringWithUTF8String:&v78];
                long long v60 = obj[0];
                obj[0] = (id)v59;

                break;
              case 2059:
                *(void *)&v73 = *((void *)v13 + 2);
                *((void *)&v73 + 1) = v13[6];
                BYTE4(v65) = 1;
                break;
              case 2060:
                *(void *)&long long v74 = *((void *)v13 + 2);
                LOBYTE(v65) = 1;
                break;
              case 2061:
                HIDWORD(v74) = v13[4];
                LODWORD(v64) = 1;
                break;
              case 2063:
                uint64_t v61 = [NSString stringWithUTF8String:v13 + 4];
                uint64_t v62 = obj[1];
                obj[1] = (id)v61;

                break;
              case 2068:
                LODWORD(v75[0]) = v13[4];
                unint64_t v56 = 1;
                break;
              case 2069:
                DWORD2(v74) = v13[4];
                HIDWORD(v64) = 1;
                break;
              case 2070:
                DWORD1(v72) = v13[4];
                long long v57 = 1;
                break;
              default:
                if (v58 == 2086)
                {
                  *((void *)&v75[0] + 1) = *((void *)v13 + 2);
                  BYTE4(v69) = 1;
                }
                else if (v58 == 2087)
                {
                  *(void *)&v75[1] = *((void *)v13 + 2);
                  LOBYTE(v69) = 1;
                }
                break;
            }
            int v13 = (int *)(v16 + v13[1]);
            __int16 v16 = (mach_vm_address_t)(v13 + 4);
          }
          while ((unint64_t)(v13 + 4) <= v15);
          uint64_t v14 = kcd_size;
          unint64_t v63 = v55;
          CFStringRef v18 = v69 & 1;
          int v13 = (int *)kcd_addr_begin;
          LODWORD(v68) = v57 & 1;
          HIDWORD(v68) = BYTE4(v69) & 1;
          v67 = v56 & 1;
          int v19 = v64 & 1;
          int v20 = BYTE4(v64) & 1;
          uint64_t v21 = v65 & 1;
          unint64_t v22 = BYTE4(v65) & 1;
          v23 = v66 & 1;
          id v24 = v63 & 1;
        }
        else
        {
          uint64_t v68 = 0;
          v67 = 0;
          int v19 = 0;
          int v20 = 0;
          uint64_t v21 = 0;
          unint64_t v22 = 0;
          v23 = 0;
          id v24 = 0;
        }
      }
      else
      {
        uint64_t v17 = v12;
        CFStringRef v18 = 0;
        uint64_t v68 = 0;
        v67 = 0;
        int v19 = 0;
        int v20 = 0;
        uint64_t v21 = 0;
        unint64_t v22 = 0;
        v23 = 0;
        id v24 = 0;
      }
      mach_vm_deallocate(*v17, (mach_vm_address_t)v13, v14);
      BOOL v10 = 5;
      if (obj[0])
      {
        if (obj[1]) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = 0;
        }
        if (v25 & v23 & v22 & v21 & v20 & v19 & v67 & v68 & HIDWORD(v68) & v18) {
          BOOL v10 = 0;
        }
        else {
          BOOL v10 = 5;
        }
      }
    }
  }
  if ([(VMUTaskMemoryCache *)self->_memoryCache isKernel])
  {
    BOOL v26 = obj[0];
    obj[0] = @"kernel";

    LODWORD(v72) = 4;
    DWORD2(v74) = 4;
  }
  else if (v10)
  {
    uint64_t v27 = 0;
    goto LABEL_76;
  }
  objc_storeStrong((id *)&self->_processName, obj[0]);
  self->_proc_starttime.tv_sec = v73;
  uint64_t v28 = v74;
  self->_proc_starttime.tv_usec = DWORD2(v73);
  unint64_t v29 = HIDWORD(v74);
  objc_storeStrong((id *)&self->_executablePath, obj[1]);
  uint64_t v30 = [(NSString *)self->_executablePath lastPathComponent];
  if ([v30 length]) {
    objc_storeStrong((id *)&self->_processName, v30);
  }
  objc_storeStrong((id *)&self->_parentExecutablePath, v71[1]);
  objc_storeStrong((id *)&self->_parentProcessName, v71[0]);
  unint64_t v31 = [(NSString *)self->_parentExecutablePath lastPathComponent];
  if ([v31 length]) {
    objc_storeStrong((id *)&self->_parentProcessName, v31);
  }
  unint64_t v32 = DWORD1(v72);
  if ((v72 & 4) != 0) {
    uint64_t v33 = 3;
  }
  else {
    uint64_t v33 = 2;
  }
  if ((~v72 & 3) != 0) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = v33;
  }
  self->_idleExitStatus = v34;
  v35 = v75[0];
  v36 = DWORD2(v74);
  self->_is64Bit = (BYTE8(v74) & 4) != 0;
  self->_cpuType = v32;
  uint64_t v37 = HIDWORD(v72);
  self->_int pid = DWORD2(v72);
  *(_OWORD *)&self->_physicalFootprint = *(_OWORD *)((char *)v75 + 8);
  self->_int ppid = v37;
  self->_taskIsTranslated = (v36 & 0x20000) != 0;
  if (v28)
  {
    if ((int)v29 >= 1)
    {
      long long v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      environment = self->_environment;
      self->_environment = v38;

      *(void *)&uint64_t v78 = 0;
      if (![(VMUTaskMemoryCache *)self->_memoryCache mapAddress:v28 - v29 size:v29 returnedAddress:&v78 returnedSize:0]&& v29 >= 5)
      {
        uint64_t v40 = (const char *)(v78 + 4);
        v41 = 4;
        while (*v40)
        {
          ++v41;
          ++v40;
          if (v29 == v41) {
            goto LABEL_75;
          }
        }
        if (v41 < (int)v29)
        {
          uint64_t v42 = v41 + 1;
          while (v29 != v42)
          {
            long long v43 = *(unsigned __int8 *)++v40;
            ++v42;
            if (v43)
            {
              unint64_t v44 = v42 - 1;
              if (v35 >= 1)
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (v44 >= (int)v29) {
                    break;
                  }
                  uint64_t v46 = v40 + 1;
                  while (*v40)
                  {
                    ++v44;
                    ++v40;
                    ++v46;
                    if (v29 == v44) {
                      goto LABEL_75;
                    }
                  }
                  if (v44 < (int)v29)
                  {
                    while (1)
                    {
                      uint64_t v40 = v46;
                      if (++v44 >= (int)v29) {
                        break;
                      }
                      ++v46;
                      if (*v40) {
                        goto LABEL_64;
                      }
                    }
                    unint64_t v44 = v29;
                  }
LABEL_64:
                  ;
                }
              }
              for (; v44 < (int)v29; v44 += v53)
              {
                if (*v40)
                {
                  id v47 = [[NSString alloc] initWithBytes:v40 length:strnlen(v40, (int)v29 - v44) encoding:4];
                  v48 = [v47 rangeOfString:@"="];
                  if ([v47 length]) {
                    size_t v49 = v48 == 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    size_t v49 = 1;
                  }
                  if (!v49)
                  {
                    id v50 = [v47 substringToIndex:v48];
                    char v51 = [v47 substringFromIndex:v48 + 1];
                    [(NSMutableDictionary *)self->_environment setObject:v51 forKeyedSubscript:v50];
                  }
                  long long v52 = [v47 length];

                  long long v53 = v52 + 1;
                  v40 += v52 + 1;
                }
                else
                {
                  ++v40;
                  long long v53 = 1;
                }
              }
              break;
            }
          }
        }
      }
    }
  }
LABEL_75:

  uint64_t v27 = 1;
LABEL_76:

  return v27;
}

- (void)_libraryLoaded:(_CSTypeRef)a3
{
  int v4 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t Name = CSSymbolOwnerGetName();
  if (Name)
  {
    uint64_t v7 = [NSString stringWithUTF8String:Name];
    if (!v7)
    {
      uint64_t v8 = [NSString stringWithCString:Name encoding:30];
      if (v8) {
        uint64_t v7 = (__CFString *)v8;
      }
      else {
        uint64_t v7 = @"nonUTF8-binary-name";
      }
    }
    [v5 setObject:v7 forKey:@"Identifier"];
  }
  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    BOOL v10 = [NSString stringWithUTF8String:Path];
    if (!v10)
    {
      uint64_t v11 = [NSString stringWithCString:Path encoding:30];
      if (v11) {
        BOOL v10 = (__CFString *)v11;
      }
      else {
        BOOL v10 = @"nonUTF8-binary-path";
      }
    }
    int v12 = [(__CFString *)v10 stringByStandardizingPath];

    [v5 setObject:v12 forKey:@"ExecutablePath"];
  }
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:CFUUIDBytes length:16];
    [v5 setObject:v14 forKey:@"BinaryInfoDwarfUUIDKey"];
  }
  uint64_t Architecture = CSSymbolOwnerGetArchitecture();
  __int16 v16 = macho_arch_name_for_cpu_type(Architecture, SHIDWORD(Architecture));
  if (v16)
  {
    uint64_t v17 = [NSString stringWithUTF8String:v16];
    [v5 setObject:v17 forKey:@"BinaryInfoArchitectureKey"];
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  CSSymbolOwnerForeachSection();
  if (v27[3] || v23[3])
  {
    CFStringRef v18 = [NSNumber numberWithUnsignedLongLong:v21];
    [v5 setObject:v18 forKey:@"StartAddress"];

    int v19 = [NSNumber numberWithUnsignedLongLong:v23[3] - v27[3] + 1];
    [v5 setObject:v19 forKey:@"Size"];
  }
  int v20 = self->_binaryImages;
  objc_sync_enter(v20);
  [(NSMutableArray *)self->_binaryImages addObject:v5];
  self->_binaryImagePostProcessingComplete = 0;
  objc_sync_exit(v20);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

unint64_t __40__VMUProcessDescription__libraryLoaded___block_invoke(uint64_t a1)
{
  uint64_t Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (unint64_t result = strcmp(Name, "MACH_HEADER"), !result))
  {
    unint64_t result = CSRegionGetRange();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 24) - 1 >= result) {
      *(void *)(v5 + 24) = result;
    }
    unint64_t v6 = v4 + result - 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6 > *(void *)(v7 + 24)) {
      *(void *)(v7 + 24) = v6;
    }
  }
  return result;
}

- (id)date
{
  return self->_date;
}

- (unsigned)task
{
  return [(VMUTaskMemoryCache *)self->_memoryCache taskPort];
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)is64Bit
{
  return self->_is64Bit;
}

- (BOOL)isTranslated
{
  return self->_taskIsTranslated;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (id)processName
{
  return self->_processName;
}

- (id)processIdentifier
{
  BOOL v3 = [(VMUProcessDescription *)self bundleIdentifier];
  if (!v3)
  {
    BOOL v3 = [(VMUProcessDescription *)self processName];
  }

  return v3;
}

- (int)parentPid
{
  return self->_ppid;
}

- (id)parentProcessName
{
  return self->_parentProcessName;
}

- (id)parentProcessPath
{
  return self->_parentExecutablePath;
}

- (id)processVersionDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_lsApplicationInformation = &self->_lsApplicationInformation;
  int v19 = [(NSDictionary *)self->_lsApplicationInformation objectForKey:@"CFBundleShortVersionString"];
  uint64_t v4 = [(NSDictionary *)*p_lsApplicationInformation objectForKey:*MEMORY[0x1E4F1D020]];
  if (v4) {
    BOOL v5 = v19 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(VMUProcessDescription *)self binaryImages];
    uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      uint64_t v17 = @"ShortVersionString";
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          unsigned int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          BOOL v10 = [(VMUProcessDescription *)self processIdentifier];
          uint64_t v11 = [v9 objectForKey:@"Identifier"];
          int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            if (!v4)
            {
              uint64_t v4 = [v9 objectForKey:@"Version"];
            }
            if (!v19)
            {
              int v19 = [v9 objectForKey:v17];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
  }
  int v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (v19)
  {
    uint64_t v14 = [v19 description];
    [v13 setObject:v14 forKey:@"shortVersion"];
  }
  if (v4)
  {
    uint64_t v15 = [v4 description];
    [v13 setObject:v15 forKey:@"version"];
  }

  return v13;
}

- (id)_sanitizeVersion:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    uint64_t v4 = -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", @"("), CFSTR("[");

    BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"" withString:@"]"];

    BOOL v3 = v5;
    uint64_t v6 = v3;
  }
  else
  {
    uint64_t v6 = @"???";
  }

  return v6;
}

- (id)processVersion
{
  BOOL v3 = [(VMUProcessDescription *)self processVersionDictionary];
  uint64_t v4 = [v3 objectForKey:@"version"];
  BOOL v5 = [v3 objectForKey:@"shortVersion"];
  uint64_t v6 = NSString;
  if (v5)
  {
    uint64_t v7 = [(VMUProcessDescription *)self _sanitizeVersion:v5];
    uint64_t v8 = [(VMUProcessDescription *)self _sanitizeVersion:v4];
    unsigned int v9 = [v6 stringWithFormat:@"%@ (%@)", v7, v8];
  }
  else
  {
    uint64_t v7 = [(VMUProcessDescription *)self _sanitizeVersion:v4];
    unsigned int v9 = [v6 stringWithFormat:@"%@", v7];
  }

  return v9;
}

- (id)executablePath
{
  return self->_executablePath;
}

- (id)bundleIdentifier
{
  return [(NSDictionary *)self->_lsApplicationInformation objectForKey:*MEMORY[0x1E4F1CFF8]];
}

- (BOOL)isAppleApplication
{
  v2 = self;
  BOOL v3 = [(VMUProcessDescription *)self bundleIdentifier];
  char v4 = [v3 hasPrefix:@"com.apple."];

  BOOL v5 = [(VMUProcessDescription *)v2 executablePath];
  LOBYTE(v2) = [v5 hasPrefix:@"/System/"];

  return v2 | v4;
}

- (id)_bundleLock
{
  if (-[VMUProcessDescription _bundleLock]::onceToken != -1) {
    dispatch_once(&-[VMUProcessDescription _bundleLock]::onceToken, &__block_literal_global_4);
  }
  v2 = (void *)-[VMUProcessDescription _bundleLock]::_bundleLock;

  return v2;
}

void __36__VMUProcessDescription__bundleLock__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
  v1 = (void *)-[VMUProcessDescription _bundleLock]::_bundleLock;
  -[VMUProcessDescription _bundleLock]::_bundleLock = (uint64_t)v0;
}

- (id)binaryImages
{
  v2 = self;
  [(VMUProcessDescription *)self setCrashReporterInfo];
  if (!v2->_binaryImagePostProcessingComplete)
  {
    BOOL v3 = [(VMUProcessDescription *)v2 _bundleLock];
    [v3 lock];

    char v4 = v2->_binaryImages;
    objc_sync_enter(v4);
    BOOL v5 = (void *)[(NSMutableArray *)v2->_binaryImages mutableCopy];
    objc_sync_exit(v4);

    uint64_t v33 = [v5 objectEnumerator];
    uint64_t v6 = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    unint64_t v32 = v5;
    while (1)
    {
      uint64_t v7 = [v33 nextObject];

      if (!v7)
      {
        [v5 sortUsingFunction:_compareBinaryImageDicts context:0];
        v2->_binaryImagePostProcessingComplete = 1;
        objc_storeStrong((id *)&v2->_sortedBinaryImages, v5);
        uint64_t v28 = [(VMUProcessDescription *)v2 _bundleLock];
        [v28 unlock];

        goto LABEL_40;
      }
      uint64_t v8 = [v7 objectForKey:@"ExecutablePath"];
      unsigned int v9 = v2;
      BOOL v10 = [(NSDictionary *)v2->_binaryImageHints objectForKey:v8];
      uint64_t v11 = [v7 objectForKey:@"ShortVersionString"];
      if (v11) {
        goto LABEL_5;
      }
      CFURLRef v14 = CFURLCreateWithFileSystemPath(allocator, v8, kCFURLPOSIXPathStyle, 1u);
      if (!v14) {
        break;
      }
      uint64_t v15 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
      __int16 v16 = v15;
      if (v15)
      {
        uint64_t v17 = [[CFBundleGetValueForInfoDictionaryKey(v15, @"CFBundleShortVersionString") description] unsignedLongLongValue];
        uint64_t v11 = (void *)[v17 copy];

        CFStringRef v18 = [[CFBundleGetValueForInfoDictionaryKey(v16, @"CFBundleVersion") description] copy];
        id v12 = (id)[v18 copy];

        int v19 = [(__CFString *)(id)CFBundleGetIdentifier(v16) description];
        int v13 = (void *)[v19 copy];

        CFRelease(v16);
      }
      else
      {
        uint64_t v11 = 0;
        id v12 = 0;
        int v13 = 0;
      }
      CFRelease(v14);
LABEL_12:
      long long v20 = [v7 objectForKey:@"SourceVersion"];
      long long v21 = v20;
      if (!v12 && v20) {
        id v12 = v20;
      }
      if (v13
        || ([(__CFString *)v8 lastPathComponent],
            (int v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v7 setObject:v13 forKey:@"Identifier"];
      }
      if (v12) {
        [v7 setObject:v12 forKey:@"Version"];
      }
      if (v11) {
        [v7 setObject:v11 forKey:@"ShortVersionString"];
      }
      long long v22 = [v10 objectForKey:@"IsAppleCode"];

      if (v22)
      {
        long long v23 = [v10 objectForKey:@"IsAppleCode"];
        uint64_t v24 = [v23 BOOLValue];
      }
      else
      {
        uint64_t v24 = ([v13 hasPrefix:@"com.apple."] & 1) != 0
           || ([v13 hasPrefix:@"commpage"] & 1) != 0
           || ([v13 isEqualToString:@"Ozone"] & 1) != 0
           || [v13 isEqualToString:@"Motion"];
        if (([(__CFString *)v8 hasPrefix:@"/System"] & 1) != 0
          || [(__CFString *)v8 hasPrefix:@"/usr/lib"])
        {
          uint64_t v24 = 1;
        }
      }
      uint64_t v25 = [NSNumber numberWithBool:v24];
      [v7 setObject:v25 forKey:@"IsAppleCode"];

      uint64_t v26 = [v10 objectForKey:@"DisplayName"];

      if (v26) {
        [v10 objectForKey:@"DisplayName"];
      }
      else {
      uint64_t v27 = [(__CFString *)v8 lastPathComponent];
      }
      if (v27) {
        [v7 setObject:v27 forKey:@"DisplayName"];
      }

      uint64_t v6 = v7;
      BOOL v5 = v32;
      v2 = v9;
    }
    uint64_t v11 = 0;
LABEL_5:
    id v12 = 0;
    int v13 = 0;
    goto LABEL_12;
  }
LABEL_40:
  [(VMUProcessDescription *)v2 cleansePathsIncludingBinaryImageList:1];
  [(VMUProcessDescription *)v2 clearCrashReporterInfo];
  sortedBinaryImages = v2->_sortedBinaryImages;

  return sortedBinaryImages;
}

- (id)binaryImageDictionaryForAddress:(unint64_t)a3
{
  char v4 = [(VMUProcessDescription *)self binaryImages];
  BOOL v5 = [v4 objectEnumerator];

  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = [v5 nextObject];

    if (!v7) {
      break;
    }
    uint64_t v8 = [v7 objectForKey:@"StartAddress"];
    unint64_t v9 = [v8 unsignedLongLongValue];

    BOOL v10 = [v7 objectForKey:@"Size"];
    uint64_t v11 = [v10 unsignedLongLongValue];

    uint64_t v6 = v7;
    if (v9 <= a3)
    {
      uint64_t v6 = v7;
      if (v11 + v9 >= a3)
      {
        id v12 = v7;
        break;
      }
    }
  }

  return v7;
}

- (id)valueForEnvVar:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_taskIsCorpseOrCore && !self->_environment)
  {
    id v20 = v4;
    int v19 = (void *)MEMORY[0x1AD0D9F90]();
    long long v21 = [[VMUProcInfo alloc] initWithPid:self->_pid];
    long long v22 = [(VMUProcInfo *)v21 envVars];
    if ([v22 count])
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      environment = self->_environment;
      self->_environment = v6;

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = v22;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v13 = [v12 rangeOfString:@"="];
            if ([v12 length]) {
              BOOL v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              BOOL v14 = 1;
            }
            if (!v14)
            {
              uint64_t v15 = [v12 substringToIndex:v13];
              __int16 v16 = [v12 substringFromIndex:v13 + 1];
              [(NSMutableDictionary *)self->_environment setObject:v16 forKeyedSubscript:v15];
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v9);
      }
    }
    BOOL v5 = v20;
  }
  uint64_t v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_environment, "objectForKeyedSubscript:", v5, v19);

  return v17;
}

- (id)_cpuTypeDescription
{
  uint64_t cpuType = self->_cpuType;
  if ((int)cpuType <= 16777222)
  {
    switch(cpuType)
    {
      case 7:
        id v4 = @"X86";
        goto LABEL_25;
      case 0xC:
        id v4 = @"ARM";
        goto LABEL_25;
      case 0x12:
        id v4 = @"PPC";
        goto LABEL_25;
    }
    goto LABEL_18;
  }
  if ((int)cpuType > 16777233)
  {
    if (cpuType == 33554444)
    {
      id v4 = @"ARM64_32";
      goto LABEL_25;
    }
    if (cpuType == 16777234)
    {
      id v4 = @"PPC-64";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (cpuType == 16777223)
  {
    id v4 = @"X86-64";
    goto LABEL_25;
  }
  if (cpuType != 16777228)
  {
LABEL_18:
    uint64_t v5 = [NSString stringWithFormat:@"%08X", cpuType];
LABEL_24:
    id v4 = (__CFString *)v5;
    goto LABEL_25;
  }
  id v4 = @"ARM64";
  if ((CSIsNull() & 1) == 0)
  {
    if (CSSymbolicatorGetArchitecture() == 0x20100000CLL)
    {
      id v4 = @"ARM64E";
    }
    else if (CSArchitectureIsX86_64())
    {
      id v4 = @"X86-64";
    }
    if (self->_taskIsTranslated)
    {
      uint64_t v5 = [[NSString alloc] initWithFormat:@"%@ (translated)", v4];
      goto LABEL_24;
    }
  }
LABEL_25:

  return v4;
}

- (id)_binaryImagesDescriptionForRanges:(id)a3
{
  id v4 = a3;
  uint64_t v34 = self;
  self = (VMUProcessDescription *)((char *)self + 56);
  CSRelease();
  self->super.isa = 0;
  self->_memoryCache = 0;
  id v33 = [MEMORY[0x1E4F28E78] string];
  if ([(NSArray *)v34->_unreadableBinaryImagePaths count])
  {
    [v33 appendString:@"Unreadable Binary Images:\n"];
    uint64_t v5 = [(NSArray *)v34->_unreadableBinaryImagePaths componentsJoinedByString:@"\n"];
    [v33 appendString:v5];
  }
  uint64_t v6 = [(VMUProcessDescription *)v34 binaryImages];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v33 appendString:@"Binary Images:\n"];
    id v8 = [(VMUProcessDescription *)v34 binaryImages];
    uint64_t v9 = [v8 objectEnumerator];

    uint64_t v10 = 0;
    id v31 = v4;
    unint64_t v32 = v9;
    while (1)
    {
      uint64_t v11 = v10;
      uint64_t v10 = [v9 nextObject];

      if (!v10) {
        break;
      }
      id v12 = (void *)MEMORY[0x1AD0D9F90]();
      v36 = [v10 objectForKey:@"Identifier"];
      v35 = [v10 objectForKey:@"ExecutablePath"];
      uint64_t v37 = [v10 objectForKey:@"BinaryInfoDwarfUUIDKey"];
      uint64_t v13 = [v10 objectForKey:@"Size"];
      uint64_t v14 = [v13 unsignedLongLongValue];

      uint64_t v15 = [v10 objectForKey:@"IsAppleCode"];
      int v16 = [v15 BOOLValue];

      uint64_t v17 = [v10 objectForKey:@"StartAddress"];
      CFStringRef v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 unsignedLongLongValue];
        if (!v4 || [v4 indexForLocation:v19] != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v20 = [MEMORY[0x1E4F28E78] string];
          if ([v37 length])
          {
            [v20 appendString:@"<"];
            id v21 = v37;
            uint64_t v22 = [v21 bytes];
            for (unsigned int i = 0; [v21 length] > (unint64_t)i; ++i)
              [v20 appendFormat:@"%02x", *(unsigned __int8 *)(v22 + i)];
            id v4 = v31;
            [v20 appendString:@"> "];
          }
          long long v24 = [v10 objectForKey:@"BinaryInfoArchitectureKey"];
          uint64_t v25 = [NSString stringWithFormat:@"%@ ", v24];
          long long v26 = (void *)v25;
          uint64_t v27 = @"+";
          if (v16) {
            uint64_t v27 = @" ";
          }
          uint64_t v28 = v36;
          if (!v36) {
            uint64_t v28 = @"???";
          }
          if (v34->_is64Bit) {
            uint64_t v29 = @"%#18qx - %#18qx %@%@ %@%@ %@%@\n";
          }
          else {
            uint64_t v29 = @"%#10lx - %#10lx %@%@ %@%@ %@%@\n";
          }
          [v33 appendFormat:v29, v19, v14 + v19 - 1, v27, v28, v25, &stru_1EFE27F38, v20, v35];

          uint64_t v9 = v32;
        }
      }
    }
  }
  else
  {
    [v33 appendString:@"Binary images description not available\n\n"];
  }

  return v33;
}

- (id)_rangesOfBinaryImages:(id)a3 forBacktraces:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v5 = a4;
  if (!v5) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v32 = v5;
      goto LABEL_6;
    }
LABEL_30:
    uint64_t v37 = 0;
    goto LABEL_31;
  }
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];

  unint64_t v32 = (void *)v6;
LABEL_6:
  uint64_t v7 = objc_alloc_init(VMURangeArray);
  uint64_t v37 = objc_alloc_init(VMURangeArray);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v33;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v12 = [v11 objectForKey:@"StartAddress"];
        uint64_t v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 unsignedLongLongValue];
          uint64_t v15 = [v11 objectForKey:@"Size"];
          uint64_t v16 = [v15 unsignedLongLongValue];

          -[VMURangeArray addRange:](v7, "addRange:", v14, v16);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = v32;
  uint64_t v17 = [obja countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      uint64_t v34 = v17;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obja);
        }
        id v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          uint64_t v22 = (uint64_t *)[v21 backtrace];
          unsigned int v23 = [v21 backtraceLength];
          uint64_t v24 = v18;
          if (v23)
          {
            uint64_t v25 = v23;
            do
            {
              uint64_t v26 = *v22++;
              uint64_t v27 = [(VMURangeArray *)v7 indexForLocation:v26];
              if (v27 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v28 = [(VMURangeArray *)v7 rangeAtIndex:v27];
                uint64_t v30 = v29;
                [(VMURangeArray *)v7 removeRangeAtIndex:v27];
                -[VMURangeArray addRange:](v37, "addRange:", v28, v30);
              }
              --v25;
            }
            while (v25);
          }

          uint64_t v18 = v24;
          uint64_t v17 = v34;
        }
        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obja countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v17);
  }

  id v5 = obja;
LABEL_31:

  return v37;
}

- (id)binaryImagesDescriptionForBacktraces:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v6 = [(VMUProcessDescription *)self binaryImages];
  uint64_t v7 = [(VMUProcessDescription *)self _rangesOfBinaryImages:v6 forBacktraces:v4];

  uint64_t v8 = [(VMUProcessDescription *)self _binaryImagesDescriptionForRanges:v7];

  return v8;
}

- (id)binaryImagesDescription
{
  BOOL v3 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  id v4 = [(VMUProcessDescription *)self _binaryImagesDescriptionForRanges:0];

  return v4;
}

- (id)_buildVersionDictionary
{
  return self->_buildVersionDictionary;
}

- (id)_buildInfoDescription
{
  BOOL v3 = [(VMUProcessDescription *)self _buildVersionDictionary];

  if (v3)
  {
    id v4 = [(VMUProcessDescription *)self _buildVersionDictionary];
    id v5 = [v4 objectForKey:@"ProjectName"];

    uint64_t v6 = [(VMUProcessDescription *)self _buildVersionDictionary];
    uint64_t v7 = [v6 objectForKey:@"SourceVersion"];

    uint64_t v8 = [(VMUProcessDescription *)self _buildVersionDictionary];
    uint64_t v9 = [v8 objectForKey:@"BuildVersion"];

    uint64_t v10 = @"Unknown";
    if (v5) {
      uint64_t v11 = v5;
    }
    else {
      uint64_t v11 = @"Unknown";
    }
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = @"Unknown";
    }
    if (v9) {
      uint64_t v10 = v9;
    }
    uint64_t v13 = [NSString stringWithFormat:@"%@-%@~%@", v11, v12, v10];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_osVersionDictionary
{
  osVersionDictionary = self->_osVersionDictionary;
  if (!osVersionDictionary)
  {
    id v4 = [(VMUProcessDescription *)self _bundleLock];
    [v4 lock];

    _CRGetOSVersionDictionary();
    id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_osVersionDictionary;
    self->_osVersionDictionary = v5;

    uint64_t v7 = [(VMUProcessDescription *)self _bundleLock];
    [v7 unlock];

    osVersionDictionary = self->_osVersionDictionary;
  }

  return osVersionDictionary;
}

- (id)_systemVersionDescription
{
  v2 = [(VMUProcessDescription *)self _osVersionDictionary];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F1CD30]];
  id v4 = [v2 objectForKey:*MEMORY[0x1E4F1CD18]];
  id v5 = [v2 objectForKey:*MEMORY[0x1E4F1CD10]];
  uint64_t v6 = @"???";
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = @"???";
  }
  if (v3) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = @"???";
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@ %@ (%@)", v7, v8, v6];

  return v9;
}

- (id)processDescriptionHeader
{
  v35 = [MEMORY[0x1E4F28E78] string];
  [v35 appendFormat:@"Hardware Model:  %@\n", self->_hardwareModel];
  BOOL v3 = [(VMUProcessDescription *)self _buildInfoDescription];
  uint64_t v28 = v3;
  uint64_t v27 = [(VMUProcessDescription *)self processName];
  uint64_t v4 = [v27 length];
  if (v4)
  {
    id v33 = [(VMUProcessDescription *)self processName];
  }
  else
  {
    id v33 = @"???";
  }
  uint64_t pid = self->_pid;
  uint64_t v26 = v4;
  if (pid)
  {
    [NSString stringWithFormat:@"%d", pid];
    unint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v32 = @"Unknown";
  }
  int v25 = pid;
  uint64_t v24 = [(VMUProcessDescription *)self executablePath];
  uint64_t v6 = [v24 length];
  if (v6)
  {
    id v31 = [(VMUProcessDescription *)self executablePath];
  }
  else
  {
    id v31 = @"???";
  }
  unint64_t executableLoadAddress = self->_executableLoadAddress;
  uint64_t v23 = v6;
  uint64_t v22 = [(VMUProcessDescription *)self processIdentifier];
  uint64_t v7 = [v22 length];
  if (v7)
  {
    uint64_t v30 = [(VMUProcessDescription *)self processIdentifier];
  }
  else
  {
    uint64_t v30 = @"???";
  }
  uint64_t v21 = v7;
  uint64_t v34 = [(VMUProcessDescription *)self processVersion];
  uint64_t v8 = [v3 length];
  if (v8)
  {
    uint64_t v29 = [NSString stringWithFormat:@"Build Info:      %@\n", v3];
  }
  else
  {
    uint64_t v29 = &stru_1EFE27F38;
  }
  uint64_t v9 = [(VMUProcessDescription *)self _cpuTypeDescription];
  unsigned int platform = self->_platform;
  if (platform)
  {
    uint64_t v11 = NSString;
    uint64_t v19 = VMUPlatformNameForPlatform(self->_platform);
    id v12 = [v11 stringWithFormat:@"Platform:        %@\n", v19];
  }
  else
  {
    id v12 = &stru_1EFE27F38;
  }
  uint64_t v13 = [(VMUProcessDescription *)self parentProcessName];
  uint64_t v14 = [v13 length];
  if (v14)
  {
    uint64_t v15 = [(VMUProcessDescription *)self parentProcessName];
  }
  else
  {
    uint64_t v15 = @"???";
  }
  int ppid = self->_ppid;
  if (ppid)
  {
    [NSString stringWithFormat:@"%d", self->_ppid];
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = @"Unknown";
  }
  [v35 appendFormat:@"Process:         %@ [%@]\nPath:            %@\nLoad Address:    %#qx\nIdentifier:      %@\nVersion:         %@\n%@Code Type:       %@\n%@Parent Process:  %@ [%@]\n", v33, v32, v31, executableLoadAddress, v30, v34, v29, v9, v12, v15, v17];
  if (ppid) {

  }
  if (v14) {
  if (platform)
  }
  {
  }
  if (v8) {

  }
  if (v21) {
  if (v23)
  }

  if (v25) {
  if (v26)
  }

  return v35;
}

- (id)dateAndVersionDescription
{
  BOOL v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS ZZZ"];
  uint64_t v4 = [v3 stringFromDate:self->_date];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)self->_proc_starttime.tv_usec / 1000000.0 + (double)self->_proc_starttime.tv_sec];
  uint64_t v6 = [v3 stringFromDate:v5];

  uint64_t v7 = NSString;
  uint64_t v8 = [(VMUProcessDescription *)self _systemVersionDescription];
  uint64_t v9 = [v7 stringWithFormat:@"Date/Time:       %@\nLaunch Time:     %@\nOS Version:      %@\nReport Version:  %d\n", v4, v6, v8, 104];

  return v9;
}

- (id)processStatisticsDescription
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_taskIsCorpseOrCore)
  {
    physicalFootprint = (void *)self->_physicalFootprint;
    if (!physicalFootprint) {
      goto LABEL_14;
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)buffer = 0u;
    if (proc_pid_rusage(self->_pid, 6, buffer)) {
      goto LABEL_13;
    }
    physicalFootprint = (void *)*((void *)&v16 + 1);
    unint64_t v11 = v27;
    self->_physicalFootprint = *((void *)&v16 + 1);
    self->_physicalFootprintPeak = v11;
    if (!physicalFootprint) {
      goto LABEL_14;
    }
  }
  if (!self->_physicalFootprintPeak)
  {
LABEL_13:
    physicalFootprint = 0;
    goto LABEL_14;
  }
  unsigned int idleExitStatus = self->_idleExitStatus;
  id v5 = "untracked";
  uint64_t v6 = "clean";
  if (idleExitStatus == 3) {
    uint64_t v6 = "dirty";
  }
  if (idleExitStatus != 1) {
    id v5 = v6;
  }
  if (idleExitStatus) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = "unknown";
  }
  uint64_t v8 = NSString;
  uint64_t v9 = VMUMemorySizeString(physicalFootprint);
  physicalFootprint = [v8 stringWithFormat:@"Physical footprint:         %s\nPhysical footprint (peak):  %s\nIdle exit:                  %s\n", v9, VMUMemorySizeString(self->_physicalFootprintPeak), v7];
LABEL_14:

  return physicalFootprint;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
  id v5 = [(VMUProcessDescription *)self processDescriptionHeader];
  [v3 appendString:v5];

  [v3 appendString:@"\n"];
  uint64_t v6 = [(VMUProcessDescription *)self dateAndVersionDescription];
  [v3 appendString:v6];

  uint64_t v7 = [(VMUProcessDescription *)self processStatisticsDescription];
  if ([v7 length])
  {
    [v3 appendString:@"\n"];
    [v3 appendString:v7];
  }
  [v3 appendString:@"----\n"];
  [v3 appendString:@"\n"];

  return v3;
}

- (void)dealloc
{
  [(VMUProcessDescription *)self setCrashReporterInfo];
  CSRelease();
  self->_symbolicator._opaque_1 = 0;
  self->_symbolicator._opaque_2 = 0;
  BOOL v3 = self->_binaryImages;
  objc_sync_enter(v3);
  binaryImages = self->_binaryImages;
  self->_binaryImages = 0;

  objc_sync_exit(v3);
  [(VMUProcessDescription *)self clearCrashReporterInfo];
  v5.receiver = self;
  v5.super_class = (Class)VMUProcessDescription;
  [(VMUProcessDescription *)&v5 dealloc];
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_parentExecutablePath, 0);
  objc_storeStrong((id *)&self->_parentProcessName, 0);
  objc_storeStrong((id *)&self->_osVersionDictionary, 0);
  objc_storeStrong((id *)&self->_buildVersionDictionary, 0);
  objc_storeStrong((id *)&self->_unreadableBinaryImagePaths, 0);
  objc_storeStrong((id *)&self->_binaryImageHints, 0);
  objc_storeStrong((id *)&self->_sortedBinaryImages, 0);
  objc_storeStrong((id *)&self->_binaryImages, 0);
  objc_storeStrong((id *)&self->_lsApplicationInformation, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);

  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end