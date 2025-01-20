@interface MemoryResourceException
+ (id)resourceExceptionFromLogFileHandle:(id)a3 error:(id *)a4;
+ (id)resourceExceptionFromTask:(unsigned int)a3 error:(id *)a4;
+ (void)extractExecNameAndBundleIDMinimal:(unsigned int)a3 execNameOut:(id *)a4 bundleIDOut:(id *)a5;
- (BOOL)gcoreCapture;
- (BOOL)generateMemoryGraphWithContentLevel:(unsigned int)a3 memgraphFailedReasonOut:(unint64_t *)a4;
- (BOOL)is64Bit;
- (BOOL)isFirstParty;
- (BOOL)isMSLEnabled;
- (BOOL)saveLogFileWithHandle:(id)a3 error:(id *)a4;
- (NSArray)ioAccelMemoryInfo;
- (NSArray)ioAccelMemoryInfoErrors;
- (NSArray)ioSurfaceInfo;
- (NSArray)osLogs;
- (NSDate)currentTime;
- (NSDate)startTime;
- (NSDictionary)cachedMetaDataDict;
- (NSDictionary)executionStack;
- (NSDictionary)footprintOutput;
- (NSDictionary)osVersion;
- (NSString)bundleID;
- (NSString)coalitionBundleID;
- (NSString)execName;
- (NSString)execPath;
- (NSString)gcoreFilePath;
- (NSString)hwModel;
- (NSString)liteDiagFilePath;
- (NSString)memgraphError;
- (VMUProcessObjectGraph)memoryGraph;
- (id)_symbolOwners;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createLiteMetaDataDict;
- (id)createMetaDataDict;
- (id)prettyPrintBacktrace:(BOOL)a3;
- (id)prettyPrintBinaryImages;
- (id)prettyPrintIOAccelMemoryInfo;
- (id)prettyPrintIOSurfaceInfo;
- (int)pid;
- (int)ppid;
- (int64_t)_saveLogFileWithHandle:(id)a3 error:(id *)a4;
- (int64_t)exceptionCode0;
- (int64_t)exceptionType;
- (int64_t)upTime;
- (int64_t)version;
- (unint64_t)cid;
- (unint64_t)crashedThreadId;
- (unint64_t)ledgerAlternateAccounting;
- (unint64_t)ledgerAlternateAccountingCompressed;
- (unint64_t)ledgerIOKitMapped;
- (unint64_t)ledgerInternal;
- (unint64_t)ledgerInternalCompressed;
- (unint64_t)ledgerNetworkNonvolatile;
- (unint64_t)ledgerNetworkNonvolatileCompressed;
- (unint64_t)ledgerPageTable;
- (unint64_t)ledgerPhysFootprint;
- (unint64_t)ledgerPhysFootprintPeak;
- (unint64_t)ledgerPurgeableNonvolatile;
- (unint64_t)ledgerPurgeableNonvolatileCompressed;
- (unint64_t)ledgerWiredMem;
- (unint64_t)limitValue;
- (unsigned)dirtyFlags;
- (unsigned)procFlags;
- (unsigned)suspensionToken;
- (unsigned)task;
- (void)_generateMemgraphWithContentLevel:(unsigned int)a3 timeoutSecs:(unint64_t)a4 memgraphFailedReasonOut:(unint64_t *)a5;
- (void)_populateAddtionalMetadataWithOptions:(unint64_t)a3 timeoutSecs:(unint64_t)a4;
- (void)dealloc;
- (void)populateAdditionalMetadataWithDiagnostics:(BOOL)a3;
- (void)releaseAnalyzedTask;
- (void)setGcoreCapture:(BOOL)a3;
- (void)setGcoreFilePath:(id)a3;
- (void)setIsMSLEnabled:(BOOL)a3;
- (void)setLiteDiagFilePath:(id)a3;
- (void)setMemgraphError:(id)a3;
@end

@implementation MemoryResourceException

- (BOOL)generateMemoryGraphWithContentLevel:(unsigned int)a3 memgraphFailedReasonOut:(unint64_t *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!self->_task && !self->_gcoreCapture) {
    return 0;
  }
  uint64_t v7 = VMUGetFlagsForAllVMRegionStatistics() | 0x5C000;
  if (!self->_gcoreCapture)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263F7C050]) initWithTask:self->_task options:v7];
    if (!v14)
    {
LABEL_9:
      if (a4)
      {
        unint64_t v15 = 5;
        if (!self->_gcoreCapture) {
          unint64_t v15 = 2;
        }
        *a4 = v15;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error generating VMUTaskMemoryScanner. Aborting memgraph generation.", buf, 2u);
      }
      return 0;
    }
LABEL_19:
    [v14 setScanningMask:VMUScanningMaskForAllReferences()];
    [v14 setExactScanningEnabled:1];
    [v14 setAbandonedMarkingEnabled:0];
    [v14 setMaxInteriorOffset:*MEMORY[0x263EF8AF8]];
    [v14 setObjectContentLevel:v5];
    if ((v5 & 0xFFFFFFFE) != 2)
    {
      uint64_t v20 = 5;
LABEL_33:
      id v28 = 0;
      char v21 = [v14 addAllNodesFromTaskWithError:&v28];
      id v22 = v28;
      if (v21)
      {
        v23 = [v14 processSnapshotGraphWithOptions:v20];
        BOOL v16 = v23 != 0;
        if (v23)
        {
          if (!self->_gcoreCapture) {
            [v14 detachFromTask];
          }
          objc_storeStrong((id *)&self->_memoryGraph, v23);
        }
        else
        {
          [v14 detachFromTask];
          if (a4)
          {
            unint64_t v25 = 6;
            if (!self->_gcoreCapture) {
              unint64_t v25 = 3;
            }
            *a4 = v25;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error generating VMUProcessObjectGraph. Aborting memgraph generation.", buf, 2u);
          }
        }
      }
      else
      {
        if (a4)
        {
          unint64_t v24 = 6;
          if (!self->_gcoreCapture) {
            unint64_t v24 = 3;
          }
          *a4 = v24;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = v22;
          _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error adding nodes to VMUTaskMemoryScanner. Aborting memgraph generation. Error: %@", buf, 0xCu);
        }
        BOOL v16 = 0;
      }

      return v16;
    }
    if (v5 == 2)
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        uint64_t v20 = 7;
        goto LABEL_33;
      }
      v17 = sub_21E856820((uint64_t)self);
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v17;
      v18 = MEMORY[0x263EF8438];
      v19 = "Generating readOnlyContent memgraph for %@";
    }
    else
    {
      if (v5 != 3 || !os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      v17 = sub_21E856820((uint64_t)self);
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v17;
      v18 = MEMORY[0x263EF8438];
      v19 = "Generating fullContent memgraph for %@";
    }
    _os_log_impl(&dword_21E853000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

    goto LABEL_32;
  }
  if (self->_gcoreFilePath)
  {
    v8 = [MEMORY[0x263F08850] defaultManager];
    char v9 = [v8 fileExistsAtPath:self->_gcoreFilePath];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263F7C048]);
      gcoreFilePath = self->_gcoreFilePath;
      id v29 = 0;
      v12 = (void *)[v10 initWithCorePath:gcoreFilePath originalBinaryPaths:0 error:&v29];
      id v13 = v29;
      if (v13 || !v12)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v31 = 5;
          *(_WORD *)&v31[4] = 2112;
          *(void *)&v31[6] = v13;
          _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error generating VMUTask from gcore. Aborting memgraph generation. (RME Error #%i: MREMemgraphFailedReasonFailedGCoreTaskMemoryScanner) Error: %@", buf, 0x12u);
        }
        *a4 = 5;

        return 0;
      }
      v14 = (void *)[objc_alloc(MEMORY[0x263F7C050]) initWithVMUTask:v12 options:v7];

      if (!v14) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    v27 = self->_gcoreFilePath;
    *(_DWORD *)buf = 138412546;
    *(void *)v31 = v27;
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 4;
    _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Invalid gcore file path (%@). Aborting memgraph generation. (RME Error #%i: MREMemgraphFailedReasonFailedGCoreGeneration)", buf, 0x12u);
  }
  BOOL v16 = 0;
  *a4 = 4;
  return v16;
}

- (id)_symbolOwners
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A38];
  v3 = v2;
  if (v2)
  {
    [MEMORY[0x263EFF9A0] dictionaryWithCapacity:[v2 count]];
    char v21 = v3;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v24 = *MEMORY[0x263F38738];
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v10 = *(const __CFString **)(*((void *)&v25 + 1) + 8 * i);
          CFUUIDRef v11 = CFUUIDCreateFromString(v8, v10);
          if (v11)
          {
            CFUUIDRef v12 = v11;
            id v13 = [v4 objectForKeyedSubscript:v10];
            v14 = [v13 objectForKeyedSubscript:v24];

            if (v14 && (CFURLRef v15 = CFURLCreateWithFileSystemPath(v8, v14, kCFURLPOSIXPathStyle, 0)) != 0)
            {
              CFURLRef v16 = v15;
              CFTypeRef v17 = CFRetain(v15);
              v18 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
              void *v18 = 0;
              v18[1] = 0;
              CSSymbolicatorForeachSymbolicatorWithURL();
              CFRelease(v16);
              if (v17) {
                CFRelease(v17);
              }
              CFRelease(v12);
              if (CSIsNull())
              {
                free(v18);
              }
              else
              {
                v19 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v18 length:16 deallocator:&unk_26CFD24C0];
                [v22 setObject:v19 forKeyedSubscript:v10];
              }
              uint64_t v7 = v23;
            }
            else
            {
              CFRelease(v12);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }

    v3 = v21;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)prettyPrintBacktrace:(BOOL)a3
{
  BOOL v3 = a3;
  v50 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A20];
  v39 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A28];
  v47 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A38];
  uint64_t v6 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A30];
  if (v3)
  {
    v44 = [(MemoryResourceException *)self _symbolOwners];
  }
  else
  {
    v44 = 0;
  }
  if ([v5 count])
  {
    uint64_t v7 = 0;
    uint64_t v46 = *MEMORY[0x263F38740];
    v48 = self;
    v37 = v6;
    v38 = v5;
    while (1)
    {
      uint64_t v8 = MEMORY[0x223C32890]();
      char v9 = [v39 objectAtIndex:v7];
      if ([v9 length])
      {
        CFStringRef v10 = [NSString stringWithFormat:@"Thread %d name:  %@", v7, v9];
        [v50 addObject:v10];
      }
      CFUUIDRef v11 = NSString;
      v40 = v9;
      context = (void *)v8;
      if (v6)
      {
        BOOL v12 = [v6 integerValue] != v7;
        id v13 = &stru_26CFD27F0;
        if (!v12) {
          id v13 = @" Attributed";
        }
      }
      else
      {
        id v13 = &stru_26CFD27F0;
      }
      v14 = [v11 stringWithFormat:@"Thread %d%@:", v7, v13];
      [v50 addObject:v14];

      uint64_t v42 = v7;
      CFURLRef v15 = [v5 objectAtIndex:v7];
      if ([v15 count]) {
        break;
      }
LABEL_41:
      [v50 addObject:&stru_26CFD27F0];

      uint64_t v7 = v42 + 1;
      uint64_t v5 = v38;
      uint64_t v6 = v37;
      if ([v38 count] <= (unint64_t)(v42 + 1)) {
        goto LABEL_44;
      }
    }
    uint64_t v16 = 0;
    v49 = v15;
    while (1)
    {
      CFTypeRef v17 = [v15 objectAtIndex:v16];
      v18 = [v17 objectForKey:qword_267D459F8];
      uint64_t v51 = [v18 unsignedLongLongValue];

      v19 = [v17 objectForKeyedSubscript:qword_267D45A18];
      if (v19)
      {
        uint64_t v20 = [v47 objectForKeyedSubscript:v19];
        char v21 = v20;
        if (v20)
        {
          id v22 = [v20 objectForKey:v46];
          if (v22) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        char v21 = 0;
      }
      id v22 = @"???";
LABEL_21:
      if ((unint64_t)[(__CFString *)v22 length] < 0x1F)
      {
        long long v25 = [(__CFString *)v22 stringByPaddingToLength:30 withString:@" " startingAtIndex:0];
      }
      else
      {
        uint64_t v23 = NSString;
        uint64_t v24 = [(__CFString *)v22 substringFromIndex:[(__CFString *)v22 length] - 27];
        long long v25 = [v23 stringWithFormat:@"...%@", v24];

        id v22 = (__CFString *)v24;
      }

      long long v26 = [v21 objectForKey:@"StartAddress"];
      uint64_t v27 = [v26 unsignedLongLongValue];

      long long v28 = [v17 objectForKey:qword_267D45A08];
      id v29 = [v17 objectForKey:qword_267D45A00];
      uint64_t v30 = [v29 unsignedLongLongValue];

      if (v28) {
        goto LABEL_33;
      }
      if (v19)
      {
        id v31 = [v44 objectForKeyedSubscript:v19];
        [v31 bytes];
      }
      if (CSIsNull()) {
        goto LABEL_32;
      }
      uint64_t v45 = v27;
      uint64_t v32 = v27 - CSSymbolOwnerGetBaseAddress();
      CSSymbolOwnerGetSymbolWithAddress();
      if (CSIsNull())
      {
        uint64_t v27 = v45;
LABEL_32:
        long long v28 = @"???";
        goto LABEL_33;
      }
      uint64_t v43 = v32;
      uint64_t Name = CSSymbolGetName();
      uint64_t v27 = v45;
      if (!Name) {
        goto LABEL_32;
      }
      long long v28 = [NSString stringWithUTF8String:Name];
      uint64_t v30 = CSSymbolGetRange() + v43;
      if (!v28) {
        goto LABEL_32;
      }
LABEL_33:
      if (v30)
      {
        if (v48->_is64Bit) {
          [NSString stringWithFormat:@"%-3d %@\t%#018qx %@ + %qd%@", v16, v25, v51, v28, v51 - v30, &stru_26CFD27F0];
        }
        else {
          [NSString stringWithFormat:@"%-3d %@\t%#010lx %@ + %ld%@", v16, v25, v51, v28, v51 - v30, &stru_26CFD27F0];
        }
      }
      else if (v48->_is64Bit)
      {
        [NSString stringWithFormat:@"%-3d %@\t%#018qx %#qx + %qd%@", v16, v25, v51, v27, v51 - v27, &stru_26CFD27F0];
      }
      else
      {
        [NSString stringWithFormat:@"%-3d %@\t%#010lx %#lx + %ld%@", v16, v25, v51, v27, v51 - v27, &stru_26CFD27F0];
      v34 = };
      CFURLRef v15 = v49;
      [v50 addObject:v34];

      if ([v49 count] <= (unint64_t)++v16) {
        goto LABEL_41;
      }
    }
  }
  [v50 addObject:@"Backtrace not available"];
LABEL_44:
  v35 = [v50 componentsJoinedByString:@"\n"];

  return v35;
}

- (id)prettyPrintBinaryImages
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [(NSDictionary *)self->_executionStack objectForKeyedSubscript:qword_267D45A38];
  BOOL v3 = v2;
  if (v2 && [v2 count])
  {
    uint64_t v30 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:[v3 count] + 1];
    [v30 addObject:@"Binary Images:"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v27 = v3;
    id obj = [v3 allValues];
    uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v37;
      uint64_t v33 = *MEMORY[0x263F38730];
      uint64_t v28 = *MEMORY[0x263F38738];
      uint64_t v29 = *MEMORY[0x263F38740];
      do
      {
        uint64_t v7 = 0;
        uint64_t v31 = v5;
        do
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
          char v9 = (void *)MEMORY[0x223C32890]();
          CFStringRef v10 = [v8 objectForKey:@"StartAddress"];
          if (v10)
          {
            CFUUIDRef v11 = [v8 objectForKey:v33];
            BOOL v12 = [v11 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26CFD27F0];

            id v13 = [v12 lowercaseString];

            if (v13)
            {
              uint64_t v14 = [v10 unsignedLongLongValue];
              CFURLRef v15 = [v8 objectForKey:v29];
              uint64_t v16 = [v8 objectForKey:@"Size"];
              v35 = v9;
              uint64_t v17 = [v16 unsignedLongLongValue];

              v34 = NSString;
              uint64_t v18 = v14 + v17 - 1;
              uint64_t v19 = v6;
              if (v15) {
                uint64_t v20 = v15;
              }
              else {
                uint64_t v20 = @"???";
              }
              char v21 = [v8 objectForKey:qword_267D45A10];
              id v22 = [v8 objectForKey:v28];
              long long v26 = v20;
              uint64_t v6 = v19;
              uint64_t v23 = [v34 stringWithFormat:@"%p - %p %@ %@  <%@> %@", v14, v18, v26, v21, v13, v22];
              [v30 addObject:v23];

              uint64_t v5 = v31;
              char v9 = v35;
            }
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v5);
    }

    uint64_t v24 = [v30 componentsJoinedByString:@"\n"];

    BOOL v3 = v27;
  }
  else
  {
    uint64_t v24 = @"Binary Images not found";
  }

  return v24;
}

- (id)prettyPrintIOSurfaceInfo
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (self->_ioSurfaceInfo)
  {
    BOOL v3 = [MEMORY[0x263F089D8] string];
    uint64_t v4 = [NSString stringWithFormat:@"IOSurface info for %@ [%d] (Count: %lu):\n", self->_execName, self->_pid, -[NSArray count](self->_ioSurfaceInfo, "count")];
    id v28 = v3;
    [v3 appendString:v4];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = self->_ioSurfaceInfo;
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v29)
    {
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v7 = [v6 objectForKeyedSubscript:qword_267D45A40];
          uint64_t v8 = [v6 objectForKeyedSubscript:qword_267D45A50];
          char v9 = [v6 objectForKeyedSubscript:qword_267D45A58];
          CFStringRef v10 = [v6 objectForKeyedSubscript:qword_267D45A68];
          CFUUIDRef v11 = [v6 objectForKeyedSubscript:qword_267D45A60];
          BOOL v12 = [v6 objectForKeyedSubscript:qword_267D45A48];
          unsigned int v13 = [v10 unsignedIntValue];
          int v14 = v13;
          unsigned int v15 = HIBYTE(v13);
          if ((v13 & 0x80000000) != 0) {
            int v16 = __maskrune(HIBYTE(v13), 0x800uLL);
          }
          else {
            int v16 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15 + 60) & 0x800;
          }
          uint64_t v32 = v10;
          if (v16)
          {
            __str[0] = v15;
            __str[1] = BYTE2(v14);
            __str[2] = BYTE1(v14);
            __str[3] = v14;
            __str[4] = 0;
          }
          else
          {
            snprintf(__str, 5uLL, "%4d", v14);
          }
          uint64_t v17 = NSString;
          uint64_t v18 = [v7 intValue];
          uint64_t v31 = v7;
          uint64_t v19 = [v8 intValue];
          uint64_t v30 = v8;
          uint64_t v20 = [v9 intValue];
          [v11 unsignedLongLongValue];
          NSLocalizedFileSizeDescription();
          id v21 = objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [v21 UTF8String];
          id v23 = v12;
          uint64_t v24 = [v17 stringWithFormat:@"  Surface ID: %08x, dims: %4d x %4d, fmt: %s, size: %7s, name: %-40.40s\n", v18, v19, v20, __str, [v23 UTF8String]];

          [v28 appendString:v24];
        }
        uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v29);
    }
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (id)prettyPrintIOAccelMemoryInfo
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  ioAccelMemoryInfo = self->_ioAccelMemoryInfo;
  if (ioAccelMemoryInfo && [(NSArray *)ioAccelMemoryInfo count])
  {
    uint64_t v4 = [MEMORY[0x263F089D8] string];
    uint64_t v5 = [NSString stringWithFormat:@"IOAccel Memory info for %@ [%d] (Count: %lu):\n", self->_execName, self->_pid, -[NSArray count](self->_ioAccelMemoryInfo, "count")];
    [v4 appendString:v5];

    uint64_t v6 = [NSString stringWithFormat:@"%s %s %s %s %s %s\n", @"Size      ", @"Resident  ", @"Dirty     ", @"IOSurfaceID", @"     State", @"Description"];
    id v39 = v4;
    [v4 appendString:v6];

    uint64_t v7 = [@"\n" stringByPaddingToLength:57 withString:@" " startingAtIndex:0];
    [(NSArray *)self->_ioAccelMemoryInfo sortedArrayUsingComparator:&unk_26CFD24E0];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v40)
    {
      uint64_t v38 = *(void *)v57;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v8;
          char v9 = *(void **)(*((void *)&v56 + 1) + 8 * v8);
          CFStringRef v10 = [v9 objectForKeyedSubscript:qword_267D45A88];
          uint64_t v51 = [v9 objectForKeyedSubscript:qword_267D45A98];
          v50 = [v9 objectForKeyedSubscript:qword_267D45A90];
          CFUUIDRef v11 = [v9 objectForKeyedSubscript:qword_267D45A70];
          BOOL v12 = [v9 objectForKeyedSubscript:qword_267D45AA0];
          unsigned int v13 = [v9 objectForKeyedSubscript:qword_267D45AA8];
          int v14 = [v9 objectForKeyedSubscript:qword_267D45A78];
          if ([v11 unsignedLongLongValue])
          {
            [NSString stringWithFormat:@"%llu", [v11 unsignedLongLongValue]];
            unsigned int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            unsigned int v15 = @"-";
          }
          v48 = v11;
          char v16 = [v12 BOOLValue];
          uint64_t v17 = @"Wired";
          if ((v16 & 1) == 0)
          {
            int v18 = [v13 BOOLValue];
            uint64_t v17 = @"Normal";
            if (v18) {
              uint64_t v17 = @"Purgeable";
            }
          }
          uint64_t v45 = v17;
          uint64_t v46 = v13;
          v47 = v12;
          uint64_t v19 = [MEMORY[0x263F089D8] string];
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v20 = v14;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v53;
            char v24 = 1;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v53 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v26 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                if ((v24 & 1) == 0) {
                  [v19 appendString:v7];
                }
                [v19 appendString:v26];
                char v24 = 0;
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v60 count:16];
              char v24 = 0;
            }
            while (v22);
          }

          uint64_t v43 = NSString;
          [v10 unsignedLongLongValue];
          NSLocalizedFileSizeDescription();
          id v42 = objc_claimAutoreleasedReturnValue();
          uint64_t v41 = [v42 UTF8String];
          [v51 unsignedLongLongValue];
          NSLocalizedFileSizeDescription();
          id v27 = objc_claimAutoreleasedReturnValue();
          v44 = v10;
          uint64_t v28 = [v27 UTF8String];
          [v50 unsignedLongLongValue];
          NSLocalizedFileSizeDescription();
          id v29 = objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v29 UTF8String];
          uint64_t v31 = v15;
          uint64_t v32 = [(__CFString *)v31 UTF8String];
          uint64_t v33 = [(__CFString *)v45 UTF8String];
          id v34 = v19;
          long long v35 = [[v43 stringWithFormat:@"%-*s %-*s %-*s %*s %*s %s\n", 10, v41, 10, v28, 10, v30, 11, v32, 10, v33, [v34 UTF8String]];

          [v39 appendString:v35];
          uint64_t v8 = v49 + 1;
        }
        while (v49 + 1 != v40);
        uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v40);
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (id)createMetaDataDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [NSNumber numberWithInteger:self->_version];
  [v3 setObject:v4 forKeyedSubscript:qword_267D458E0];

  uint64_t v5 = [NSNumber numberWithInt:self->_pid];
  [v3 setObject:v5 forKeyedSubscript:qword_267D458E8];

  uint64_t v6 = [NSNumber numberWithInt:self->_ppid];
  [v3 setObject:v6 forKeyedSubscript:qword_267D458F0];

  uint64_t v7 = qword_267D45900;
  uint64_t v8 = self->_execPath;
  [v3 setObject:v8 forKeyedSubscript:v7];
  [v3 setObject:self->_execName forKeyedSubscript:qword_267D458F8];
  [v3 setObject:self->_bundleID forKeyedSubscript:qword_267D45908];
  [v3 setObject:self->_coalitionBundleID forKeyedSubscript:qword_267D45910];
  char v9 = [NSNumber numberWithLongLong:self->_upTime];
  [v3 setObject:v9 forKeyedSubscript:qword_267D45940];

  CFStringRef v10 = [NSNumber numberWithUnsignedInt:self->_dirtyFlags];
  [v3 setObject:v10 forKeyedSubscript:qword_267D45950];

  CFUUIDRef v11 = [NSNumber numberWithBool:self->_is64Bit];
  [v3 setObject:v11 forKeyedSubscript:qword_267D45948];

  BOOL v12 = [NSNumber numberWithUnsignedLongLong:self->_limitValue];
  [v3 setObject:v12 forKeyedSubscript:qword_267D45928];

  unsigned int v13 = [NSNumber numberWithInteger:self->_exceptionType];
  [v3 setObject:v13 forKeyedSubscript:qword_267D45918];

  [v3 setObject:self->_memgraphError forKeyedSubscript:qword_267D45920];
  [v3 setObject:self->_hwModel forKeyedSubscript:qword_267D45930];
  [v3 setObject:self->_osVersion forKeyedSubscript:qword_267D45938];
  int v14 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPhysFootprint];
  [v3 setObject:v14 forKeyedSubscript:qword_267D45978];

  unsigned int v15 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPhysFootprintPeak];
  [v3 setObject:v15 forKeyedSubscript:qword_267D45980];

  char v16 = [NSNumber numberWithUnsignedLongLong:self->_ledgerInternal];
  [v3 setObject:v16 forKeyedSubscript:qword_267D45988];

  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:self->_ledgerInternalCompressed];
  [v3 setObject:v17 forKeyedSubscript:qword_267D45990];

  int v18 = [NSNumber numberWithUnsignedLongLong:self->_ledgerAlternateAccounting];
  [v3 setObject:v18 forKeyedSubscript:qword_267D45998];

  uint64_t v19 = [NSNumber numberWithUnsignedLongLong:self->_ledgerAlternateAccountingCompressed];
  [v3 setObject:v19 forKeyedSubscript:qword_267D459A0];

  id v20 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPurgeableNonvolatile];
  [v3 setObject:v20 forKeyedSubscript:qword_267D459A8];

  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPurgeableNonvolatileCompressed];
  [v3 setObject:v21 forKeyedSubscript:qword_267D459B0];

  uint64_t v22 = [NSNumber numberWithUnsignedLongLong:self->_ledgerIOKitMapped];
  [v3 setObject:v22 forKeyedSubscript:qword_267D459C0];

  uint64_t v23 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPageTable];
  [v3 setObject:v23 forKeyedSubscript:qword_267D459B8];

  char v24 = [NSNumber numberWithUnsignedLongLong:self->_ledgerWiredMem];
  [v3 setObject:v24 forKeyedSubscript:qword_267D459C8];

  long long v25 = [NSNumber numberWithUnsignedLongLong:self->_ledgerNetworkNonvolatile];
  [v3 setObject:v25 forKeyedSubscript:qword_267D459D0];

  uint64_t v26 = [NSNumber numberWithUnsignedLongLong:self->_ledgerNetworkNonvolatileCompressed];
  [v3 setObject:v26 forKeyedSubscript:qword_267D459D8];

  [v3 setObject:self->_footprintOutput forKeyedSubscript:qword_267D45970];
  [v3 setObject:self->_executionStack forKeyedSubscript:qword_267D45958];
  [v3 setObject:self->_osLogs forKeyedSubscript:qword_267D45960];
  [v3 setObject:self->_ioSurfaceInfo forKeyedSubscript:qword_267D459E0];
  [v3 setObject:self->_ioAccelMemoryInfo forKeyedSubscript:qword_267D459E8];
  [v3 setObject:self->_ioAccelMemoryInfoErrors forKeyedSubscript:qword_267D459F0];
  objc_storeStrong((id *)&self->_cachedMetaDataDict, v3);

  return v3;
}

- (id)createLiteMetaDataDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_execName forKeyedSubscript:qword_267D458F8];
  [v3 setObject:self->_bundleID forKeyedSubscript:qword_267D45908];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPhysFootprint];
  [v3 setObject:v4 forKeyedSubscript:qword_267D45978];

  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_ledgerPhysFootprintPeak];
  [v3 setObject:v5 forKeyedSubscript:qword_267D45980];

  uint64_t v6 = [NSNumber numberWithInteger:self->_exceptionType];
  [v3 setObject:v6 forKeyedSubscript:qword_267D45918];

  uint64_t v7 = [NSNumber numberWithBool:self->_isMSLEnabled];
  [v3 setObject:v7 forKeyedSubscript:qword_267D45968];

  return v3;
}

- (BOOL)saveLogFileWithHandle:(id)a3 error:(id *)a4
{
  return [(MemoryResourceException *)self _saveLogFileWithHandle:a3 error:a4] == 0;
}

- (int64_t)_saveLogFileWithHandle:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    memoryGraph = self->_memoryGraph;
    if (memoryGraph)
    {
      uint64_t v8 = [(VMUProcessObjectGraph *)memoryGraph plistRepresentationWithOptions:1];
      if (v8)
      {
        id v9 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:1 format:0 error:a4];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v9)
          {
            int64_t v10 = 0;
LABEL_17:
            unsigned int v13 = [(MemoryResourceException *)self createMetaDataDict];
            [v9 setObject:v13 forKeyedSubscript:qword_267D458D8];

            int v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v9 format:200 options:0 error:a4];
            if (v14) {
              [v6 writeData:v14];
            }
            else {
              int64_t v10 = 2;
            }

            goto LABEL_21;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error converting serialized plist data to an NSDictionary object!", buf, 2u);
          }
        }
LABEL_16:
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        int64_t v10 = 1;
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error serializing memgraph to plist representation!", buf, 2u);
      }
    }
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    CFUUIDRef v11 = (void *)MEMORY[0x263F087E8];
    BOOL v12 = MREErrorDomain;
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"File handle is nil";
    id v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a4 = [v11 errorWithDomain:v12 code:2 userInfo:v9];
    int64_t v10 = 2;
LABEL_21:

    goto LABEL_22;
  }
  int64_t v10 = 2;
LABEL_22:

  return v10;
}

- (void)dealloc
{
  [(MemoryResourceException *)self releaseAnalyzedTask];
  v3.receiver = self;
  v3.super_class = (Class)MemoryResourceException;
  [(MemoryResourceException *)&v3 dealloc];
}

+ (id)resourceExceptionFromTask:(unsigned int)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    if (a4)
    {
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 9;
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  id v6 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (mach_port_mod_refs(*MEMORY[0x263EF8960], a3, 0, 1))
  {
    if (a4)
    {
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 3;
LABEL_7:
      [v7 errorWithDomain:v8 code:v9 userInfo:0];
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  task_suspension_token_t suspend_token = 0;
  if (task_suspend2(a3, &suspend_token))
  {
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:3 userInfo:0];
    }
    mach_port_mod_refs(*v6, a3, 0, -1);
    goto LABEL_12;
  }
  BOOL v12 = [MemoryResourceException alloc];
  if (!v12)
  {
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  task_suspension_token_t v13 = suspend_token;
  uint64_t v14 = [(MemoryResourceException *)v12 init];
  uint64_t v10 = v14;
  if (v14)
  {
    *(void *)(v14 + 136) = 1;
    *(_DWORD *)(v14 + 20) = a3;
    *(_DWORD *)(v14 + 24) = v13;
    if (qword_26AB1E268 != -1) {
      dispatch_once(&qword_26AB1E268, &unk_26CFD2500);
    }
    objc_storeStrong((id *)(v10 + 120), (id)qword_26AB1E258);
    objc_storeStrong((id *)(v10 + 128), (id)qword_26AB1E260);
    buffer[0].__darwin_time_t tv_sec = 0;
    *(void *)&buffer[0].tv_usec = 0;
    if (!gettimeofday(buffer, 0))
    {
      uint64_t v15 = sub_21E856ED4(buffer[0].tv_sec, buffer[0].tv_usec);
      char v16 = *(void **)(v10 + 192);
      *(void *)(v10 + 192) = v15;
    }
    uint64_t v17 = *(unsigned int *)(v10 + 20);
    buffer[0].__darwin_time_t tv_sec = MEMORY[0x263EF8330];
    *(void *)&buffer[0].tv_usec = 3221225472;
    buffer[1].__darwin_time_t tv_sec = (__darwin_time_t)sub_21E8572F4;
    *(void *)&buffer[1].tv_usec = &unk_2644CA3D8;
    uint64_t v57 = v10;
    if (sub_21E8566F0(v17, buffer))
    {
      [*(id *)(v10 + 192) timeIntervalSinceDate:*(void *)(v10 + 184)];
      uint64_t v19 = (uint64_t)v18;
      if (v18 <= 0.0) {
        uint64_t v19 = -1;
      }
      *(void *)(v10 + 112) = v19;
      unint64_t v20 = *(void *)(v10 + 200);
      if (!v20) {
        goto LABEL_49;
      }
      if (v20 >> 61 != 3) {
        goto LABEL_43;
      }
      uint64_t v21 = (v20 >> 58) & 7;
      if (v21 == 1)
      {
        if ((v20 & 0xFF000000) != 0) {
          unint64_t v20 = 2;
        }
        else {
          unint64_t v20 = 4;
        }
        if ((*(_DWORD *)(v10 + 36) & 0xD) == 1) {
          ++v20;
        }
        goto LABEL_49;
      }
      if (v21 == 2) {
        unint64_t v20 = 6;
      }
      else {
LABEL_43:
      }
        unint64_t v20 = 7;
LABEL_49:
      *(void *)(v10 + 96) = v20;
      uint64_t v41 = sub_21E856F44(*(void *)(v10 + 176));
      uint64_t v42 = sub_21E856FBC(*(_DWORD *)(v10 + 32), *(void **)(v10 + 72), v41);
      uint64_t v43 = *(void **)(v10 + 80);
      *(void *)(v10 + 80) = v42;

      uint64_t v44 = sub_21E8570EC(v41);
      uint64_t v45 = *(void **)(v10 + 88);
      *(void *)(v10 + 88) = v44;

      BOOL v46 = sub_21E857184(*(unsigned int *)(v10 + 20), *(_DWORD *)(v10 + 28), *(void **)(v10 + 64));
      *(unsigned char *)(v10 + 17) = v46;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        int v47 = *(_DWORD *)(v10 + 28);
        *(_DWORD *)buf = 136315650;
        uint64_t v51 = "-[MemoryResourceException extractCorpseInfo]";
        __int16 v52 = 1024;
        int v53 = v47;
        __int16 v54 = 1024;
        BOOL v55 = v46;
        _os_log_debug_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s - for pid (%i), isMSLEnabled = %{BOOL}d", buf, 0x18u);
      }

      goto LABEL_13;
    }
    mach_port_name_t v22 = *(_DWORD *)(v10 + 20);
    if (v22 && !pid_for_task(v22, (int *)(v10 + 28)) && !proc_get_dirty(*(_DWORD *)(v10 + 28), (uint32_t *)(v10 + 36)))
    {
      uint64_t v23 = sub_21E856D74(*(_DWORD *)(v10 + 28));
      char v24 = *(void **)(v10 + 72);
      *(void *)(v10 + 72) = v23;

      uint64_t v25 = [*(id *)(v10 + 72) lastPathComponent];
      uint64_t v26 = *(void **)(v10 + 64);
      *(void *)(v10 + 64) = v25;

      id v27 = (int *)sub_21E856E04(*(_DWORD *)(v10 + 28));
      if (v27)
      {
        uint64_t v28 = v27;
        *(_DWORD *)(v10 + 32) = v27[140];
        uint64_t v29 = sub_21E856ED4(*(void *)v27, v27[2]);
        uint64_t v30 = *(void **)(v10 + 184);
        *(void *)(v10 + 184) = v29;

        [*(id *)(v10 + 192) timeIntervalSinceDate:*(void *)(v10 + 184)];
        uint64_t v32 = (uint64_t)v31;
        if (v31 <= 0.0) {
          uint64_t v32 = -1;
        }
        *(void *)(v10 + 112) = v32;
        *(unsigned char *)(v10 + 16) = (v28[32] & 4) != 0;
        free(v28);
      }
      *(void *)(v10 + 96) = 0;
      int v33 = *(_DWORD *)(v10 + 28);
      uint64_t v57 = 0;
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo(v33, 20, 1uLL, buffer, 40) == 40) {
        __darwin_time_t tv_sec = buffer[0].tv_sec;
      }
      else {
        __darwin_time_t tv_sec = 1;
      }
      *(void *)(v10 + 176) = tv_sec;
      long long v35 = sub_21E856F44(tv_sec);
      uint64_t v36 = sub_21E856FBC(*(_DWORD *)(v10 + 32), *(void **)(v10 + 72), v35);
      long long v37 = *(void **)(v10 + 80);
      *(void *)(v10 + 80) = v36;

      uint64_t v38 = sub_21E8570EC(v35);
      id v39 = *(void **)(v10 + 88);
      *(void *)(v10 + 88) = v38;

      BOOL v40 = sub_21E857184(*(unsigned int *)(v10 + 20), *(_DWORD *)(v10 + 28), *(void **)(v10 + 64));
      *(unsigned char *)(v10 + 17) = v40;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        __darwin_suseconds_t v48 = *(_DWORD *)(v10 + 28);
        LODWORD(buffer[0].tv_sec) = 136315650;
        *(__darwin_time_t *)((char *)&buffer[0].tv_sec + 4) = (__darwin_time_t)"-[MemoryResourceException extractTaskInfo]";
        *((_WORD *)&buffer[0].tv_usec + 2) = 1024;
        *(__darwin_suseconds_t *)((char *)&buffer[0].tv_usec + 6) = v48;
        WORD1(buffer[1].tv_sec) = 1024;
        HIDWORD(buffer[1].tv_sec) = v40;
        _os_log_debug_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s - for pid (%i), isMSLEnabled = %{BOOL}d", (uint8_t *)buffer, 0x18u);
      }
      *(unsigned char *)(v10 + 18) = 0;
    }
  }
LABEL_13:

  return (id)v10;
}

- (void)populateAdditionalMetadataWithDiagnostics:(BOOL)a3
{
  BOOL v3 = a3;
  [(MemoryResourceException *)self _populateAddtionalMetadataWithOptions:0 timeoutSecs:60];
  if (v3)
  {
    MEMORY[0x270F9A6D0](self, sel__generateMemgraphWithContentLevel_timeoutSecs_memgraphFailedReasonOut_);
  }
}

- (void)_populateAddtionalMetadataWithOptions:(unint64_t)a3 timeoutSecs:(unint64_t)a4
{
  kern_return_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unsigned int v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  CFUUIDBytes *CFUUIDBytes;
  CFUUIDRef v32;
  __CFString *v33;
  void *v34;
  BOOL v35;
  uint64_t Name;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  uint64_t Path;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t Architecture;
  const NXArchInfo *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  NSDictionary *v50;
  void *v51;
  NSDictionary *executionStack;
  void *v53;
  NSArray *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSArray *ioSurfaceInfo;
  dispatch_time_t v70;
  NSObject *v71;
  id v72;
  NSArray *ioAccelMemoryInfo;
  uint64_t v74;
  void *v75;
  NSObject *dsema;
  char v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  unsigned int v87;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  void v103[5];
  NSObject *v104;
  unsigned char v105[128];
  uint8_t buf[32];
  long long v107;
  void *v108;
  void **v109;
  uint64_t v110;
  uint64_t v111;
  mach_msg_type_number_t thread_info_outCnt[2];
  long long v113;
  uint64_t v114;
  uint64_t v115;

  v78 = a3;
  v115 = *MEMORY[0x263EF8340];
  v79 = sub_21E856820((uint64_t)self);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v79;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Generating footprint for %@", buf, 0xCu);
  }
  if (self && self->_task)
  {
    +[FPFootprint setBreakDownPhysFootprint:1];
    +[FPFootprint setSharingAnalysisDisabled:1];
    +[FPFootprint setVmRegionInfoFlags:1];
    uint64_t v4 = sub_21E85D3E4([FPCorpseProcess alloc], self->_task, self->_pid, self->_execName, self->_dirtyFlags, self->_procFlags);
    uint64_t v5 = v4;
    if (v4)
    {
      unint64_t ledgerPageTable = self->_ledgerPageTable;
      v113 = *(_OWORD *)&self->_ledgerPhysFootprint;
      *(void *)thread_info_outCnt = ledgerPageTable;
      v114 = 0;
      [v4 addLedgerData:thread_info_outCnt count:4];
      uint64_t v7 = [FPFootprint alloc];
      v108 = v5;
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
      uint64_t v9 = [(FPFootprint *)v7 initWithProcesses:v8];

      [(FPFootprint *)v9 gatherData:1];
      [(FPFootprint *)v9 analyzeData];
      sub_21E8660E8();
      uint64_t v10 = sub_21E86900C(v9, 1);
      if (v10)
      {
        v107 = 0u;
        memset(buf, 0, sizeof(buf));
        sub_21E867224((uint64_t)FPFootprint, v10, (uint64_t)buf);
        CFUUIDRef v11 = objc_alloc_init(MREOutputFormatterInMemory);
        p_isa = (id *)&v11->super.isa;
        if (v11)
        {
          [(MREOutputFormatterInMemory *)v11 printSummaryCategories:v10 total:buf hadErrors:0];
          objc_storeStrong((id *)&self->_footprintOutput, p_isa[2]);
        }
      }
    }
  }
  dsema = dispatch_semaphore_create(0);
  if ((v78 & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v79;
      _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Starting IOAccel memory info collection (asynchronous) for %@", buf, 0xCu);
    }
    task_suspension_token_t v13 = (void *)MEMORY[0x263F4B108];
    uint64_t v14 = dispatch_get_global_queue(0, 0);
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = sub_21E85AC08;
    v103[3] = &unk_2644CA460;
    v103[4] = self;
    v104 = dsema;
    [v13 collectDataWithCompletionQueue:v14 completionBlock:v103];
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v79;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Generating backtrace info for %@", buf, 0xCu);
  }
  if (!self) {
    goto LABEL_73;
  }
  v89 = (void *)[objc_alloc(MEMORY[0x263F7C040]) initWithPID:self->_pid task:self->_task processName:self->_execName is64Bit:self->_is64Bit options:64];
  v86 = [v89 sampleAllThreadsOnce];
  v85 = [v86 count];
  if (!v85) {
    goto LABEL_72;
  }
  [v89 symbolicator];
  if (!CSIsNull())
  {
    CSRetain();
    goto LABEL_25;
  }
  CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  if (!CSIsNull())
  {
LABEL_25:
    v83 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v85];
    v84 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v85];
    v96 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v15 = 0;
    v87 = -1;
    v82 = *MEMORY[0x263F38730];
    v80 = *MEMORY[0x263F38738];
    v81 = *MEMORY[0x263F38740];
    while (1)
    {
      v90 = v15;
      v94 = [v86 objectAtIndexedSubscript:];
      uint64_t v16 = [v94 thread];
      uint64_t v17 = v16;
      if (self->_crashedThreadId && (v87 & 0x80000000) != 0)
      {
        memset(buf, 0, 24);
        thread_info_outCnt[0] = 6;
        double v18 = thread_info(v16, 4u, (thread_info_t)buf, thread_info_outCnt);
        uint64_t v19 = *(void *)buf;
        if (v18) {
          uint64_t v19 = -1;
        }
        if (v19 == self->_crashedThreadId) {
          unint64_t v20 = v90;
        }
        else {
          unint64_t v20 = v87;
        }
        v87 = v20;
      }
      v92 = [v89 threadNameForThread:v17];
      uint64_t v21 = [v92 length];
      v91 = [v89 dispatchQueueNameForSerialNumber:[v94 dispatchQueueSerialNumber]];
      mach_port_name_t v22 = [v91 length];
      v93 = objc_alloc_init(MEMORY[0x263F089D8]);
      if (v21)
      {
        [v93 appendString:v92];
        if (v22)
        {
          [v93 appendString:@"  "];
LABEL_38:
          [v93 appendFormat:@"Dispatch queue: %@", v91];
        }
      }
      else if (v22)
      {
        goto LABEL_38;
      }
      [v84 addObject:v93];
      uint64_t v23 = (uint64_t *)[v94 backtrace];
      char v24 = [v94 backtraceLength];
      for (uint64_t i = [MEMORY[0x263EFF980] arrayWithCapacity:v24];
      {
        uint64_t v26 = *v23;
        id v27 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v28 = [NSNumber numberWithUnsignedLong:v26];
        [v27 setObject:v28 forKeyedSubscript:qword_267D459F8];

        CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
        uint64_t v29 = v96;
        uint64_t v30 = v27;
        if ((CSIsNull() & 1) == 0)
        {
          CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
          if (CFUUIDBytes && (uint64_t v32 = CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes)) != 0)
          {
            int v33 = (__CFString *)CFUUIDCreateString(0, v32);
            CFRelease(v32);
            if (v33)
            {
              [v30 setObject:v33 forKeyedSubscript:qword_267D45A18];
              id v34 = [v29 objectForKeyedSubscript:v33];
              long long v35 = v34 == 0;

              if (v35)
              {
                v95 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                [v95 setObject:v33 forKeyedSubscript:v82];
                [v29 setObject:v95 forKeyedSubscript:v33];
                uint64_t Name = CSSymbolOwnerGetName();
                if (Name)
                {
                  long long v37 = [NSString stringWithUTF8String:Name];
                  uint64_t v38 = (void *)v37;
                  if (v37) {
                    id v39 = (__CFString *)v37;
                  }
                  else {
                    id v39 = @"nonprintable-binary";
                  }
                  [v95 setObject:v39 forKeyedSubscript:v81];
                }
                Path = CSSymbolOwnerGetPath();
                if (Path)
                {
                  uint64_t v41 = [NSString stringWithUTF8String:Path];
                  uint64_t v42 = [v41 stringByStandardizingPath];

                  if (v42) {
                    uint64_t v43 = v42;
                  }
                  else {
                    uint64_t v43 = @"nonprintable-path";
                  }
                  [v95 setObject:v43 forKeyedSubscript:v80];
                }
                Architecture = CSSymbolOwnerGetArchitecture();
                uint64_t v45 = NXGetArchInfoFromCpuType(Architecture, SHIDWORD(Architecture));
                if (v45 && v45->name)
                {
                  [NSString stringWithUTF8String:];
                  BOOL v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  BOOL v46 = @"unknown-arch";
                }
                if (v46) {
                  int v47 = v46;
                }
                else {
                  int v47 = @"nonprintable-arch";
                }
                [v95 setObject:v47 forKeyedSubscript:qword_267D45A10];
                *(void *)thread_info_outCnt = 0;
                *(void *)&v113 = thread_info_outCnt;
                *((void *)&v113 + 1) = 0x2020000000;
                v114 = 0;
                v108 = 0;
                v109 = &v108;
                v110 = 0x2020000000;
                v111 = 0;
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&buf[16] = sub_21E85C758;
                *(void *)&buf[24] = &unk_2644CA488;
                *(void *)&v107 = thread_info_outCnt;
                *((void *)&v107 + 1) = &v108;
                CSSymbolOwnerForeachSegment();
                if (*(void *)(v113 + 24) || v109[3])
                {
                  __darwin_suseconds_t v48 = [NSNumber numberWithUnsignedLongLong:];
                  [v95 setObject:v48 forKeyedSubscript:@"StartAddress"];

                  uint64_t v49 = [NSNumber numberWithUnsignedLongLong:(char *)v109[3] - *(void *)(v113 + 24) + 1];
                  [v95 setObject:v49 forKeyedSubscript:@"Size"];
                }
                _Block_object_dispose(&v108, 8);
                _Block_object_dispose(thread_info_outCnt, 8);
              }
            }
          }
          else
          {
            int v33 = 0;
          }
        }
        [i addObject:v30];

        ++v23;
      }
      [v83 addObject:i];

      uint64_t v15 = v90 + 1;
      if (v90 + 1 == v85)
      {
        CSRelease();
        v50 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        [(NSDictionary *)v50 setObject:v83 forKeyedSubscript:qword_267D45A20];
        [(NSDictionary *)v50 setObject:v84 forKeyedSubscript:qword_267D45A28];
        uint64_t v51 = [NSNumber numberWithInt:v87];
        [(NSDictionary *)v50 setObject:v51 forKeyedSubscript:qword_267D45A30];

        [(NSDictionary *)v50 setObject:v96 forKeyedSubscript:qword_267D45A38];
        executionStack = self->_executionStack;
        self->_executionStack = v50;

        goto LABEL_72;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create symbolicator", buf, 2u);
  }
LABEL_72:

LABEL_73:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v79;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Collecting IOSurface info for %@", buf, 0xCu);
  }
  v97 = [MEMORY[0x263F0ED08] surfaceDescriptions];
  int v53 = [NSNumber numberWithInt:self->_pid];
  v98 = [v97 objectForKeyedSubscript:v53];

  if (v98)
  {
    [MEMORY[0x263EFF980] arrayWithCapacity:[v98 count]];
    __int16 v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    BOOL v55 = v98;
    long long v56 = [v55 countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v100;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(void *)v100 != v57) {
            objc_enumerationMutation(v55);
          }
          long long v59 = *(id *)(*((void *)&v99 + 1) + 8 * j);
          self;
          v60 = [MEMORY[0x263EFF9A0] dictionary];
          v61 = [NSNumber numberWithUnsignedInt:[v59 surfaceID]];
          [v60 setObject:v61 forKeyedSubscript:qword_267D45A40];

          uint64_t v62 = [NSNumber numberWithUnsignedInt:[v59 pixelFormat]];
          [v60 setObject:v62 forKeyedSubscript:qword_267D45A68];

          v63 = [v59 name];
          [v60 setObject:v63 forKeyedSubscript:qword_267D45A48];

          v64 = [NSNumber numberWithUnsignedLongLong:[v59 width]];
          [v60 setObject:v64 forKeyedSubscript:qword_267D45A50];

          v65 = [NSNumber numberWithUnsignedLongLong:[v59 height]];
          [v60 setObject:v65 forKeyedSubscript:qword_267D45A58];

          v66 = NSNumber;
          v67 = [v59 allocationSize];

          v68 = [v66 numberWithUnsignedLongLong:v67];
          [v60 setObject:v68 forKeyedSubscript:qword_267D45A60];

          [(NSArray *)v54 addObject:v60];
        }
        long long v56 = [v55 countByEnumeratingWithState:&v99 objects:v105 count:16];
      }
      while (v56);
    }

    ioSurfaceInfo = self->_ioSurfaceInfo;
    self->_ioSurfaceInfo = v54;
  }
  if ((v78 & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Waiting for IOAccel memory info collection to finish...", buf, 2u);
    }
    v70 = dispatch_time(0, 1000000000 * a4);
    dispatch_semaphore_wait(dsema, v70);
    v71 = MEMORY[0x263EF8438];
    v72 = MEMORY[0x263EF8438];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      ioAccelMemoryInfo = self->_ioAccelMemoryInfo;
      if (ioAccelMemoryInfo) {
        v74 = [(NSArray *)ioAccelMemoryInfo count];
      }
      else {
        v74 = 0;
      }
      v75 = sub_21E856820((uint64_t)self);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v74;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v75;
      _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "IOAccel memory info collection complete. Found a total of %lu entries for %@", buf, 0x16u);
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MemoryResourceException _populateAddtionalMetadataWithOptions:timeoutSecs:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v79;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Finished %s for %@", buf, 0x16u);
  }
}

- (void)_generateMemgraphWithContentLevel:(unsigned int)a3 timeoutSecs:(unint64_t)a4 memgraphFailedReasonOut:(unint64_t *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  sub_21E856820((uint64_t)self);
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Generating memgraph for %@", (uint8_t *)&v9, 0xCu);
  }
  [(MemoryResourceException *)self generateMemoryGraphWithContentLevel:v6 memgraphFailedReasonOut:a5];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[MemoryResourceException _generateMemgraphWithContentLevel:timeoutSecs:memgraphFailedReasonOut:]";
    __int16 v11 = 2112;
    BOOL v12 = v8;
    _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Finished %s for %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)releaseAnalyzedTask
{
  task_suspension_token_t suspensionToken = self->_suspensionToken;
  if (suspensionToken)
  {
    task_resume2(suspensionToken);
    self->_task_suspension_token_t suspensionToken = 0;
  }
  mach_port_name_t task = self->_task;
  if (task)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], task, 0, -1);
    self->_mach_port_name_t task = 0;
  }
}

- (BOOL)isFirstParty
{
  execuint64_t Name = self->_execName;
  if (!execName || [(NSString *)execName hasPrefix:@"com.apple.WebKit."]) {
    return 0;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    uint64_t v6 = @"com.apple.";
  }
  else
  {
    bundleID = self->_execPath;
    if (!bundleID) {
      return 0;
    }
    uint64_t v6 = @"/System/";
  }

  return [(NSString *)bundleID hasPrefix:v6];
}

+ (id)resourceExceptionFromLogFileHandle:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 readDataToEndOfFileAndReturnError:a4];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:a4];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          __int16 v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v14 = NSString;
        uint64_t v15 = [*a4 localizedDescription];
        int v9 = [v14 stringWithFormat:@"File is malformed - %@", v15];

        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = MREErrorDomain;
        uint64_t v35 = *MEMORY[0x263F08320];
        uint64_t v36 = v9;
        uint64_t v10 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v16 errorWithDomain:v17 code:1 userInfo:v10];
        __int16 v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

        goto LABEL_27;
      }
      int v9 = (void *)[objc_alloc(MEMORY[0x263F7C038]) initWithPlistRepresentation:v7];
      uint64_t v10 = [v8 objectForKeyedSubscript:qword_267D458D8];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
LABEL_25:
            __int16 v11 = 0;
            goto LABEL_26;
          }
          uint64_t v23 = (void *)MEMORY[0x263F087E8];
          char v24 = MREErrorDomain;
          uint64_t v33 = *MEMORY[0x263F08320];
          id v34 = @"Metadata is malformed";
          uint64_t v25 = NSDictionary;
          uint64_t v26 = &v34;
          id v27 = &v33;
LABEL_24:
          uint64_t v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
          *a4 = [v23 errorWithDomain:v24 code:1 userInfo:v28];

          goto LABEL_25;
        }
        __int16 v11 = (MemoryResourceException *)sub_21E85B344((id *)[MemoryResourceException alloc], v10, v9, a4);
      }
      else
      {
        __int16 v11 = [MemoryResourceException alloc];
        id v18 = v9;
        if (v11)
        {
          v30.receiver = v11;
          v30.super_class = (Class)MemoryResourceException;
          __int16 v11 = [super init];
          if (v11)
          {
            uint64_t v19 = [v18 processName];
            execuint64_t Name = v11->_execName;
            v11->_execuint64_t Name = (NSString *)v19;

            v11->_pid = [v18 pid];
            uint64_t v21 = [v18 executablePath];
            execPath = v11->_execPath;
            v11->_execPath = (NSString *)v21;

            v11->_upTime = -1;
            *(_OWORD *)&v11->_exceptionType = xmmword_21E86F1D0;
            v11->_ledgerPhysFootprint = [v18 physicalFootprint];
            v11->_ledgerPhysFootprintPeak = [v18 physicalFootprintPeak];
            objc_storeStrong((id *)&v11->_memoryGraph, v9);
            v11->_mach_port_name_t task = 0;
          }
        }
      }
      if (!a4 || v11) {
        goto LABEL_26;
      }
      if (*a4) {
        goto LABEL_25;
      }
      uint64_t v23 = (void *)MEMORY[0x263F087E8];
      char v24 = MREErrorDomain;
      uint64_t v31 = *MEMORY[0x263F08320];
      uint64_t v32 = @"Unable to analyze diagnostic";
      uint64_t v25 = NSDictionary;
      uint64_t v26 = &v32;
      id v27 = &v31;
      goto LABEL_24;
    }
    __int16 v11 = 0;
  }
  else
  {
    if (!a4)
    {
      __int16 v11 = 0;
      goto LABEL_29;
    }
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = MREErrorDomain;
    uint64_t v37 = *MEMORY[0x263F08320];
    v38[0] = @"File does not exist";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v12 errorWithDomain:v13 code:11 userInfo:v7];
    __int16 v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_28:

LABEL_29:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(MemoryResourceException *)self createMetaDataDict];
  id v5 = self->_memoryGraph;
  uint64_t v6 = sub_21E85B344((id *)[MemoryResourceException alloc], v4, v5, 0);

  return v6;
}

+ (void)extractExecNameAndBundleIDMinimal:(unsigned int)a3 execNameOut:(id *)a4 bundleIDOut:(id *)a5
{
  *a4 = 0;
  *a5 = 0;
  int x = 0;
  if (!pid_for_task(a3, &x))
  {
    uint64_t v7 = sub_21E856D74(x);
    *a4 = [v7 lastPathComponent];
    uint64_t v8 = sub_21E856E04(x);
    if (v8)
    {
      int v9 = v8[140];
      uint64_t v14 = 0;
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo(x, 20, 1uLL, buffer, 40) == 40) {
        unint64_t v10 = *(void *)&buffer[0];
      }
      else {
        unint64_t v10 = 1;
      }
      __int16 v11 = sub_21E856F44(v10);
      sub_21E856FBC(v9, v7, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

- (VMUProcessObjectGraph)memoryGraph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)executionStack
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)execName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)execPath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)coalitionBundleID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (int64_t)exceptionType
{
  return self->_exceptionType;
}

- (unint64_t)limitValue
{
  return self->_limitValue;
}

- (int64_t)upTime
{
  return self->_upTime;
}

- (BOOL)is64Bit
{
  return self->_is64Bit;
}

- (NSString)hwModel
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSDictionary)osVersion
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isMSLEnabled
{
  return self->_isMSLEnabled;
}

- (void)setIsMSLEnabled:(BOOL)a3
{
  self->_isMSLEnabled = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (unsigned)task
{
  return self->_task;
}

- (unsigned)suspensionToken
{
  return self->_suspensionToken;
}

- (NSDictionary)footprintOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)ioSurfaceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSArray)ioAccelMemoryInfo
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)ioAccelMemoryInfoErrors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  return self->_ppid;
}

- (unint64_t)cid
{
  return self->_cid;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)currentTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (unsigned)dirtyFlags
{
  return self->_dirtyFlags;
}

- (unsigned)procFlags
{
  return self->_procFlags;
}

- (int64_t)exceptionCode0
{
  return self->_exceptionCode0;
}

- (unint64_t)crashedThreadId
{
  return self->_crashedThreadId;
}

- (unint64_t)ledgerPhysFootprint
{
  return self->_ledgerPhysFootprint;
}

- (unint64_t)ledgerPhysFootprintPeak
{
  return self->_ledgerPhysFootprintPeak;
}

- (unint64_t)ledgerInternal
{
  return self->_ledgerInternal;
}

- (unint64_t)ledgerInternalCompressed
{
  return self->_ledgerInternalCompressed;
}

- (unint64_t)ledgerAlternateAccounting
{
  return self->_ledgerAlternateAccounting;
}

- (unint64_t)ledgerAlternateAccountingCompressed
{
  return self->_ledgerAlternateAccountingCompressed;
}

- (unint64_t)ledgerPurgeableNonvolatile
{
  return self->_ledgerPurgeableNonvolatile;
}

- (unint64_t)ledgerPurgeableNonvolatileCompressed
{
  return self->_ledgerPurgeableNonvolatileCompressed;
}

- (unint64_t)ledgerPageTable
{
  return self->_ledgerPageTable;
}

- (unint64_t)ledgerIOKitMapped
{
  return self->_ledgerIOKitMapped;
}

- (unint64_t)ledgerWiredMem
{
  return self->_ledgerWiredMem;
}

- (unint64_t)ledgerNetworkNonvolatile
{
  return self->_ledgerNetworkNonvolatile;
}

- (unint64_t)ledgerNetworkNonvolatileCompressed
{
  return self->_ledgerNetworkNonvolatileCompressed;
}

- (NSArray)osLogs
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (NSDictionary)cachedMetaDataDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)memgraphError
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMemgraphError:(id)a3
{
}

- (NSString)liteDiagFilePath
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLiteDiagFilePath:(id)a3
{
}

- (BOOL)gcoreCapture
{
  return self->_gcoreCapture;
}

- (void)setGcoreCapture:(BOOL)a3
{
  self->_gcoreCapture = a3;
}

- (NSString)gcoreFilePath
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setGcoreFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcoreFilePath, 0);
  objc_storeStrong((id *)&self->_liteDiagFilePath, 0);
  objc_storeStrong((id *)&self->_memgraphError, 0);
  objc_storeStrong((id *)&self->_cachedMetaDataDict, 0);
  objc_storeStrong((id *)&self->_osLogs, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_ioAccelMemoryInfoErrors, 0);
  objc_storeStrong((id *)&self->_ioAccelMemoryInfo, 0);
  objc_storeStrong((id *)&self->_ioSurfaceInfo, 0);
  objc_storeStrong((id *)&self->_footprintOutput, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hwModel, 0);
  objc_storeStrong((id *)&self->_coalitionBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_execPath, 0);
  objc_storeStrong((id *)&self->_execName, 0);
  objc_storeStrong((id *)&self->_executionStack, 0);

  objc_storeStrong((id *)&self->_memoryGraph, 0);
}

@end