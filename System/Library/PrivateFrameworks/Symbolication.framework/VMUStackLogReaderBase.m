@interface VMUStackLogReaderBase
- (BOOL)coldestFrameIsNotThreadId;
- (BOOL)inspectingLiveProcess;
- (BOOL)is64bit;
- (BOOL)shouldIgnoreSymbolWithName:(id)a3 binaryPath:(id)a4;
- (BOOL)usesCoreFile;
- (BOOL)usesLiteMode;
- (NSSet)excludedFrames;
- (VMUTask)vmuTask;
- (VMUVMRegionTracker)regionTracker;
- (_CSTypeRef)symbolicator;
- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3;
- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3;
- (id)_allocationTypeNameForStackID:(unint64_t)a3 returnedBinaryPath:(id *)a4;
- (id)binaryImagePathForPCaddress:(unint64_t)a3;
- (id)functionNameForPCaddress:(unint64_t)a3;
- (id)identifierForBinaryImagePath:(id)a3;
- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4;
- (id)sourceFileNameForPCaddress:(unint64_t)a3;
- (id)sourcePathForPCaddress:(unint64_t)a3;
- (id)symbolicatedBacktraceForFrames:(unint64_t *)a3 frameCount:(int64_t)a4 options:(unint64_t)a5;
- (id)symbolicatedBacktraceForNode:(unsigned int)a3 nodeDetails:(id)a4 isLiteZone:(id)a5 options:;
- (id)symbolicatedBacktraceForStackID:(unint64_t)a3 options:(unint64_t)a4;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (int)enumerateMSLRecordsAndPayloads:(id)a3;
- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6;
- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5;
- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4;
- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3;
- (unsigned)task;
- (void)identifyNonObjectsUsingStackBacktraces:(id)a3 classInfoMap:(id)a4 classInfoSetterBlock:(id)a5;
- (void)setExcludedFrames:(id)a3;
@end

@implementation VMUStackLogReaderBase

- (id)symbolicatedBacktraceForNode:(unsigned int)a3 nodeDetails:(id)a4 isLiteZone:(id)a5 options:
{
  uint64_t v5 = MEMORY[0x1F4188790](self, a2, *(void *)&a3, a4.var0, a5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  v11 = v10;
  uint64_t v13 = v12;
  v14 = (id *)v5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (VMUGraphNodeType_IsVMRegion(v10[1] >> 60))
  {
    v15 = [v14[3] vmRegionRangeInfoForRange:*v11 v11[1] & 0xFFFFFFFFFFFFFFFLL];
    v16 = v15;
    if (!v15 || (uint64_t v17 = [v15 stackIdentifier], v17 == -1))
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = [v14 stackIDForNode:v13];
      }
      else {
        uint64_t v17 = -1;
      }
    }
    uint64_t v18 = [v14 getFramesForStackID:v17 stackFramesBuffer:v21];
  }
  else
  {
    uint64_t v18 = [v14 getFramesForNode:v13 inLiteZone:v9 stackFramesBuffer:v21];
  }
  v19 = [v14 symbolicatedBacktraceForFrames:v21 frameCount:v18 options:v7];

  return v19;
}

- (id)symbolicatedBacktraceForStackID:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = [(VMUStackLogReaderBase *)self symbolicatedBacktraceForFrames:v6 frameCount:[(VMUStackLogReaderBase *)self getFramesForStackID:a3 stackFramesBuffer:v6] options:a4];

  return v4;
}

- (id)identifierForBinaryImagePath:(id)a3
{
  v4 = (__CFString *)a3;
  if (!v4)
  {
    uint64_t v5 = @"???";
    goto LABEL_11;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_binaryImagePathToIdentifierMap objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_11;
  }
  CFURLRef v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, kCFURLPOSIXPathStyle, 1u);
  if (!v6) {
    goto LABEL_9;
  }
  CFURLRef v7 = v6;
  uint64_t v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
  if (!v8)
  {
    CFRelease(v7);
LABEL_9:
    uint64_t v5 = [(__CFString *)v4 lastPathComponent];
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  CFBundleGetIdentifier(v8);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFRelease(v9);
  CFRelease(v7);
  if (!v5) {
    goto LABEL_9;
  }
LABEL_10:
  [(NSMutableDictionary *)self->_binaryImagePathToIdentifierMap setObject:v5 forKeyedSubscript:v4];
LABEL_11:

  return v5;
}

- (id)symbolicatedBacktraceForFrames:(unint64_t *)a3 frameCount:(int64_t)a4 options:(unint64_t)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int64_t v5 = a4 - 1;
  if (a4 < 1)
  {
    v14 = 0;
    goto LABEL_78;
  }
  char v6 = a5;
  int v7 = a4;
  if (!self->_binaryImagePathToIdentifierMap)
  {
    v10 = (NSMutableDictionary *)objc_opt_new();
    binaryImagePathToIdentifierMap = self->_binaryImagePathToIdentifierMap;
    self->_binaryImagePathToIdentifierMap = v10;
  }
  context = (void *)MEMORY[0x1AD0D9F90]();
  char v56 = v6;
  if ((v6 & 0x20) != 0)
  {
    char v55 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = (__CFString *)objc_opt_new();
    uint64_t v13 = v12;
    if ((v6 & 4) != 0) {
      [(__CFString *)v12 appendString:@"\n"];
    }
    if ([(VMUStackLogReaderBase *)self coldestFrameIsNotThreadId])
    {
      char v55 = 0;
    }
    else
    {
      [(__CFString *)v13 appendFormat:@"[thread %#llx]:", a3[v5] - 1];
      if ((v6 & 8) != 0)
      {
        [(__CFString *)v13 appendString:@"\t"];
        char v55 = 0;
      }
      else
      {
        char v55 = 1;
      }
      int v7 = v5;
    }
    if (!self->_addressToSymbolicationMap)
    {
      v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
      addressToSymbolicationMap = self->_addressToSymbolicationMap;
      self->_addressToSymbolicationMap = v15;
    }
  }
  if ((v6 & 4) != 0)
  {
    if ([(VMUStackLogReaderBase *)self is64bit]) {
      uint64_t v17 = 18;
    }
    else {
      uint64_t v17 = 10;
    }
    unint64_t v50 = 30;
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v50 = 0;
  }
  int v18 = 0;
  char v49 = 0;
  uint64_t v19 = v56 & 0x44;
  int v20 = -1;
  v51 = a3;
  v52 = v13;
  while (v7 != v18)
  {
    if (v19 == 4) {
      int v21 = v18;
    }
    else {
      int v21 = v7 + v20;
    }
    uint64_t v22 = (char *)a3[v21];
    if ((unint64_t)v22 >= 0x1000)
    {
      v24 = NSMapGet(self->_addressToSymbolicationMap, (const void *)a3[v21]);
      if (!v24)
      {
        if ((v56 & 2) != 0)
        {
          unint64_t v53 = v50;
          id v54 = 0;
        }
        else
        {
          v25 = [(VMUStackLogReaderBase *)self binaryImagePathForPCaddress:v22];
          v26 = [(VMUStackLogReaderBase *)self identifierForBinaryImagePath:v25];
          id v54 = v26;
          if ((v56 & 4) != 0)
          {
            unint64_t v28 = [v26 length];
            uint64_t v27 = v50;
            if (v28 > v50) {
              uint64_t v27 = [v54 length];
            }
          }
          else
          {
            uint64_t v27 = 0;
          }
          unint64_t v53 = v27;
        }
        id v29 = [(VMUStackLogReaderBase *)self functionNameForPCaddress:v22];
        if (v29)
        {
          v30 = v29;
          if ([v29 hasPrefix:@"_malloc_type_"]
            && [v30 hasSuffix:@"_outlined"])
          {
            v31 = [v30 substringFromIndex:[@"_malloc_type" length]];

            if ([v31 hasPrefix:@"_zone"])
            {
              uint64_t v32 = [v31 stringByReplacingOccurrencesOfString:@"_zone" withString:@"_malloc_zone"];

              v31 = (void *)v32;
            }
            uint64_t v33 = [v31 substringToIndex:v31.length - @"_outlined".length];

            v30 = (void *)v33;
            a3 = v51;
            if (!v33) {
              goto LABEL_44;
            }
          }
          else
          {
          }
          if ([(NSSet *)self->_excludedFrames containsObject:v30])
          {

            char v49 = 1;
            int v23 = 3;
            v24 = v54;
            uint64_t v13 = v52;
LABEL_70:

            uint64_t v19 = v56 & 0x44;
            goto LABEL_71;
          }
          id v35 = v30;
          v36 = (const char *)[v35 UTF8String];
          v37 = v36;
          if ((v56 & 0x10) == 0 || (int v38 = *(unsigned __int8 *)v36, v38 == 43) || v38 == 45) {
            size_t v39 = strlen(v36);
          }
          else {
            size_t v39 = strcspn(v36, "(<");
          }
          v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithBytes:v37 length:v39 encoding:4];
          char v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
LABEL_56:
              [MEMORY[0x1E4F28E78] stringWithFormat:@"%#*llx (%-*s) %@", v17, v22, v53, [v54 UTF8String], v24, context];
              goto LABEL_60;
            }
            goto LABEL_61;
          }
          [v24 appendFormat:@" + %llu", &v22[--[VMUStackLogReaderBase functionRangeContainingPCaddress:](self, "functionRangeContainingPCaddress:", v22)]];
        }
        else
        {
LABEL_44:
          char v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
              v24 = [MEMORY[0x1E4F28E78] stringWithString:@"???"];
              id v35 = 0;
              goto LABEL_56;
            }
            v24 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%#llx", v22];
            id v35 = 0;
            goto LABEL_61;
          }
          uint64_t v40 = [(VMUStackLogReaderBase *)self binaryImageRangeForPCaddress:v22];
          v24 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%#llx + %llu", v40, &v22[-v40]];
          id v35 = 0;
        }
        [MEMORY[0x1E4F28E78] stringWithFormat:@"%-*s %#*llx %@", v53, [v54 UTF8String], v17, v22, v24, context];
        uint64_t v41 = LABEL_60:;

        v24 = (void *)v41;
        char v34 = v56;
LABEL_61:
        uint64_t v42 = [(VMUStackLogReaderBase *)self sourceFileNameAndLineNumberForPCaddress:v22 fullPath:v34 & 1];
        v43 = (void *)v42;
        if (v42) {
          [v24 appendFormat:@"  %@", v42];
        }
        NSMapInsertKnownAbsent(self->_addressToSymbolicationMap, v22, v24);

        a3 = v51;
        uint64_t v13 = v52;
      }
      *(void *)__str = 0;
      uint64_t v58 = 0;
      v44 = " | ";
      if ((v56 & 4) != 0)
      {
        snprintf(__str, 0x10uLL, "%-3d ", v21);
        v44 = "\n";
      }
      if (v55) {
        [(__CFString *)v13 appendFormat:@"%s%s%@", v44, __str, v24];
      }
      else {
        [(__CFString *)v13 appendFormat:@"%s%@", __str, v24, v47];
      }
      int v23 = 0;
      char v55 = 1;
      goto LABEL_70;
    }
    int v23 = 2;
LABEL_71:
    ++v18;
    --v20;
    if (v23 == 3) {
      break;
    }
  }
  [(__CFString *)v13 appendString:@" "];
  v45 = VMUBacktraceIsExcludedMarker;
  if ((v49 & 1) == 0) {
    v45 = v13;
  }
  v14 = v45;

LABEL_78:

  return v14;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)inspectingLiveProcess
{
  return 0;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  return 5;
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  return 0;
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  return 0;
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  return 0;
}

- (id)binaryImagePathForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  Path = (void *)CSSymbolOwnerGetPath();
  if (Path)
  {
    Path = [NSString stringWithUTF8String:Path];
  }

  return Path;
}

- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  CSSymbolOwnerGetSegmentWithAddress();
  unint64_t Range = CSRegionGetRange();
  if (!v4)
  {
    unint64_t Range = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v4 = 0;
  }
  result.length = v4;
  result.location = Range;
  return result;
}

- (id)functionNameForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSymbolWithAddressAtTime();
  Name = (void *)CSSymbolGetName();
  if (Name)
  {
    Name = [NSString stringWithUTF8String:Name];
  }

  return Name;
}

- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSymbolWithAddressAtTime();

  unint64_t Range = CSSymbolGetRange();
  result.length = v4;
  result.location = Range;
  return result;
}

- (id)sourcePathForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    Path = [NSString stringWithUTF8String:Path];
  }

  return Path;
}

- (id)sourceFileNameForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  Filename = (void *)CSSourceInfoGetFilename();
  if (Filename)
  {
    Filename = [NSString stringWithUTF8String:Filename];
  }

  return Filename;
}

- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSourceInfoWithAddressAtTime();

  return CSSourceInfoGetLineNumber();
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  return 0;
}

- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4
{
  BOOL v4 = a4;
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  if (v4) {
    uint64_t Path = CSSourceInfoGetPath();
  }
  else {
    uint64_t Path = CSSourceInfoGetFilename();
  }
  uint64_t v6 = Path;
  uint64_t LineNumber = CSSourceInfoGetLineNumber();
  if (v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%s:%u", v6, LineNumber];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)shouldIgnoreSymbolWithName:(id)a3 binaryPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5)
  {
    BOOL v9 = 0;
    goto LABEL_19;
  }
  if (!v6)
  {
    BOOL v9 = 1;
    goto LABEL_19;
  }
  uint64_t v8 = [v6 lastPathComponent];
  if (shouldIgnoreSymbolWithName_binaryPath__onceToken != -1) {
    dispatch_once(&shouldIgnoreSymbolWithName_binaryPath__onceToken, &__block_literal_global_1);
  }
  if (([(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore containsObject:v8] & 1) == 0
    && ([(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore containsObject:v5] & 1) == 0)
  {
    if (([v5 hasPrefix:@"operator new"] & 1) == 0
      && ([v5 hasPrefix:@"__typed_operator_new_impl"] & 1) == 0
      && ([v5 hasPrefix:@"$_0::operator()"] & 1) == 0
      && ([v5 hasPrefix:@"caulk::alloc::darwin_resource"] & 1) == 0
      && ([v5 hasPrefix:@"objc::DenseMap"] & 1) == 0
      && ([v5 hasPrefix:@"objc::detail::DenseMapPair"] & 1) == 0
      && ([v5 hasPrefix:@"llvm::BumpPtrAllocatorImpl"] & 1) == 0
      && (![v5 hasPrefix:@"bmalloc_"]
       || ([v5 containsString:@"_allocate"] & 1) == 0)
      && (![v5 hasPrefix:@"WTF::"]
       || ([v5 hasPrefix:@"WTF::fastZeroedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastStrDup"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastMemDup"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastZeroedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastCalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastCalloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::tryFastRealloc"] & 1) == 0
       && ([v5 hasPrefix:@"WTF::fastRealloc"] & 1) == 0)
      && (![v5 hasPrefix:@"Gigacage::"]
       || ([v5 hasPrefix:@"Gigacage::tryMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryRealloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryAllocateZeroedVirtualPages"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryAlignedMalloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::malloc"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::tryMallocArray"] & 1) == 0
       && ([v5 hasPrefix:@"Gigacage::mallocArray"] & 1) == 0)
      && (![v5 hasPrefix:@"JSC::"]
       || ([v5 hasPrefix:@"JSC::IsoAlignedMemoryAllocator"] & 1) == 0
       && ([v5 hasPrefix:@"JSC::tryAllocateAlignedMemory"] & 1) == 0
       && ![v5 hasPrefix:@"JSC::tryAllocateMemory"]))
    {
      BOOL v9 = 0;
      goto LABEL_16;
    }
    [(id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore addObject:v5];
  }
  BOOL v9 = 1;
LABEL_16:

LABEL_19:
  return v9;
}

void __63__VMUStackLogReaderBase_shouldIgnoreSymbolWithName_binaryPath___block_invoke()
{
  uint64_t v0 = [[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:@"libsystem_malloc.dylib", @"libCoreLib.dylib", nil] retain];
  v1 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:@"strndup", @"reallocf", @"_dispatch_calloc", @"_dispatch_strdup_if_mutable", @"_dispatch_continuation_alloc_from_heap", @"_xpc_alloc", @"swift_slowAlloc", @"swift_allocObject", @"swift_allocBox", @"__CFSafelyReallocateWithAllocator", @"CFStorageReplaceValues", @"__NSMS1", @"pdf_named_calloc", @"pdf_named_malloc", @"hash_table_modify", @"CMMMemMgr::New(unsigned long)", @"CMMBase::NewInternal(unsigned long, CMMMemMgr&, char const*)",
         @"XAtomicAllocator::reserve(int)",
         @"_table_addStorageBlock",
         @"sqlite3MemMalloc",
         @"sqlite3MemRealloc",
         @"dbMallocRawFinish",
         @"dbReallocFinish",
         @"llvm::safe_malloc(unsigned long)",
         @"llvm::safe_calloc(unsigned long, unsigned long)",
         @"llvm::safe_realloc(void*, unsigned long)",
         @"llvm::allocate_buffer(unsigned long, unsigned long)",
         @"geo::MallocZoneAllocator::allocate(unsigned long, unsigned long)",
         @"geo::MallocZoneAllocator::callocate(unsigned long, unsigned long)",
         @"geo::MallocZoneAllocator::reallocate(void*, unsigned long)",
         @"kalloc_ext",
         @"IOMalloc_internal",
         @"strdup",
         @"IOLockAlloc",
         0);
  v3 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore = v2;
}

- (id)_allocationTypeNameForStackID:(unint64_t)a3 returnedBinaryPath:(id *)a4
{
  BOOL v4 = a4;
  v43[512] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = @"<unknown>";
  }
  if (a3 == -1) {
    goto LABEL_10;
  }
  int v7 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  int64_t v8 = [(VMUStackLogReaderBase *)self getFramesForStackID:a3 stackFramesBuffer:v43];
  if (!v8)
  {
LABEL_10:
    v14 = @"non-object with no stack backtrace";
    goto LABEL_38;
  }
  uint64_t v9 = v8;
  v10 = [(VMUStackLogReaderBase *)self functionNameForPCaddress:v43[0]];
  if (v10)
  {
    v11 = v10;
    if ([(__CFString *)v10 hasPrefix:@"_malloc_zone_"])
    {
      uint64_t v12 = [(__CFString *)v11 substringFromIndex:13];

      uint64_t v13 = [(__CFString *)v12 rangeOfString:@"_instrumented_or_legacy"];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v12;
      }
      else
      {
        v11 = [(__CFString *)v12 substringToIndex:v13];
      }
    }
    else if (([(__CFString *)v11 isEqualToString:@"malloc_zone_realloc"] & 1) != 0 {
           || ([(__CFString *)v11 hasPrefix:@"WTF::fastRealloc"] & 1) != 0
    }
           || [(__CFString *)v11 hasPrefix:@"WTF::tryFastRealloc"])
    {

      v11 = @"realloc";
    }
    else if ([(__CFString *)v11 hasPrefix:@"caulk::alloc::darwin_resource"])
    {

      v11 = @"caulk::alloc::darwin_resource";
    }
    else if (([(__CFString *)v11 isEqualToString:@"realloc"] & 1) == 0 {
           && ([(__CFString *)v11 isEqualToString:@"sqlite3MemRealloc"] & 1) == 0)
    }
    {
      [(__CFString *)v11 isEqualToString:@"__CFSafelyReallocateWithAllocator"];
    }
  }
  else
  {
    v11 = @"malloc";
  }
  if (v9 >= 1)
  {
    v37 = v11;
    int v38 = v7;
    size_t v39 = v4;
    uint64_t v40 = 0;
    id v15 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    char v16 = 0;
    uint64_t v17 = 0;
    int v18 = 0;
    uint64_t v19 = v43;
    while (1)
    {
      int v20 = v18;
      int v21 = v15;
      uint64_t v22 = [(VMUStackLogReaderBase *)self functionNameForPCaddress:*v19];

      uint64_t v23 = *v19++;
      int v18 = [(VMUStackLogReaderBase *)self binaryImagePathForPCaddress:v23];

      id v15 = v22;
      uint64_t v17 = _removeReturnValueFromCPlusPlusSymbolName(v15);

      int v24 = [v17 hasPrefix:@"std::"];
      if (v24)
      {
        id v25 = v17;

        id v26 = v15;
        id v27 = v18;

        uint64_t v41 = v27;
        uint64_t v42 = v25;
        uint64_t v40 = v26;
      }
      else
      {
        if ((v16 & 1) != 0
          && ([v42 hasPrefix:@"std::__"] & 1) == 0
          && ([v42 hasPrefix:@"std::enable_if"] & 1) == 0)
        {
          id v32 = v42;

          id v33 = v40;
          id v34 = v41;

          uint64_t v41 = v34;
          uint64_t v42 = v32;
          int v18 = v34;
          uint64_t v17 = v32;
          uint64_t v40 = v33;
          id v15 = v33;
          if (!v32)
          {
LABEL_30:
            int v7 = v38;
            BOOL v4 = v39;
            v11 = v37;
            v31 = v40;
            v30 = v41;
            goto LABEL_31;
          }
LABEL_27:
          unint64_t v28 = _removeStdArgumentsFromCPlusPlusSymbolName(v17);

          _printCPlusPlusNameSimplification(v15, v28);
          v11 = v37;
          id v29 = [(__CFString *)v37 stringByAppendingFormat:@" in %@", v28];
          int v7 = v38;
          BOOL v4 = v39;
          v31 = v40;
          v30 = v41;
          goto LABEL_35;
        }
        if (![(VMUStackLogReaderBase *)self shouldIgnoreSymbolWithName:v17 binaryPath:v18])goto LABEL_26; {
      }
        }
      char v16 = v24;
      if (!--v9)
      {
LABEL_26:
        if (!v17) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
    }
  }
  id v15 = 0;
  int v18 = 0;
  v31 = 0;
  v30 = 0;
  uint64_t v42 = 0;
LABEL_31:
  id v35 = [v18 lastPathComponent];
  if (v35)
  {
    id v29 = [@"non-object from " stringByAppendingString:v35];
  }
  else
  {
    id v29 = 0;
  }

  unint64_t v28 = 0;
LABEL_35:

  if (v4) {
    id *v4 = v18;
  }
  v14 = v29;

LABEL_38:

  return v14;
}

- (void)identifyNonObjectsUsingStackBacktraces:(id)a3 classInfoMap:(id)a4 classInfoSetterBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [[VMUStackLogConsolidator alloc] initWithScannerOrGraph:v10 stackLogReader:self];

  if ([(VMUStackLogReaderBase *)self usesLiteMode]
    || [(VMUStackLogReaderBase *)self usesCoreFile])
  {
    uint64_t v12 = objc_opt_new();
  }
  else
  {
    uint64_t v12 = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke;
  v25[3] = &unk_1E5D236F8;
  v25[4] = self;
  id v26 = v12;
  id v13 = v8;
  id v27 = v13;
  id v14 = v9;
  id v28 = v14;
  id v15 = v12;
  char v16 = [(VMUStackLogConsolidator *)v11 stackIDsToNodesFilteredBy:v25];
  uint64_t v17 = objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2;
  v21[3] = &unk_1E5D23720;
  v21[4] = self;
  id v22 = v17;
  id v23 = v13;
  id v24 = v14;
  id v18 = v14;
  id v19 = v13;
  id v20 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:v21];
}

uint64_t __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1AD0D9F90]();
  if (*(void *)(a3 + 8) >> 60 != 1) {
    goto LABEL_17;
  }
  id v9 = *(void **)(a3 + 16);
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = [v9 displayName];
  if ([v10 hasPrefix:@"non-object"])
  {

    goto LABEL_6;
  }
  int v11 = [*(id *)(a3 + 16) isDerivedFromStackBacktrace];

  if (!v11)
  {
LABEL_17:
    uint64_t v14 = 0;
    goto LABEL_18;
  }
LABEL_6:
  if (v7)
  {
    if ([*(id *)(a1 + 32) usesLiteMode])
    {
      id v12 = v7;
      if ([v12 hasPrefix:@"MallocStackLoggingLiteZone"])
      {
        char v13 = [v12 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

        if ((v13 & 1) == 0) {
          goto LABEL_10;
        }
      }
      else
      {
      }
LABEL_14:
      id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      if (![v15 unsignedIntValue])
      {
        char v16 = [@"non-object in zone " stringByAppendingString:v7];
        uint64_t v17 = +[VMUClassInfo classInfoWithClassName:v16 binaryPath:@"<unknown>" type:0];
        [v17 setIsDerivedFromStackBacktrace:1];
        uint64_t v18 = [*(id *)(a1 + 48) indexForClassInfo:v17];
        id v19 = [NSNumber numberWithUnsignedInt:v18];
        [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v7];
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_17;
    }
LABEL_10:
    if (![*(id *)(a1 + 32) usesCoreFile]
      || [*(id *)(a1 + 32) stackIDForNode:a2] != -1)
    {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v14 = 1;
LABEL_18:

  return v14;
}

void __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v8 = [v5 unsignedLongValue];
  id v9 = *(void **)(a1 + 32);
  id v32 = 0;
  id v10 = [v9 _allocationTypeNameForStackID:v8 returnedBinaryPath:&v32];
  int v11 = (__CFString *)v32;
  id v12 = v11;
  if (v10)
  {
    if (!v11) {
      id v12 = @"<unknown>";
    }
    uint64_t v13 = [(__CFString *)v12 stringByAppendingString:v10];
    uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
    id v15 = v14;
    id v25 = (void *)v13;
    id v26 = v7;
    if (v14)
    {
      [v14 unsignedIntValue];
    }
    else
    {
      if ([v10 containsString:@"::"]) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 16;
      }
      uint64_t v17 = +[VMUClassInfo classInfoWithClassName:v10 binaryPath:v12 type:v16];
      [v17 setIsDerivedFromStackBacktrace:1];
      uint64_t v18 = [*(id *)(a1 + 48) indexForClassInfo:v17];
      id v19 = [NSNumber numberWithUnsignedInt:v18];
      [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v13];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v6;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }

    id v7 = v26;
    id v6 = v27;
  }
}

- (unsigned)task
{
  return self->_task;
}

- (BOOL)usesLiteMode
{
  return self->_usesLiteMode;
}

- (BOOL)usesCoreFile
{
  return self->_usesCoreFile;
}

- (BOOL)coldestFrameIsNotThreadId
{
  return self->_coldestFrameIsNotThreadId;
}

- (VMUVMRegionTracker)regionTracker
{
  return (VMUVMRegionTracker *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)excludedFrames
{
  return self->_excludedFrames;
}

- (void)setExcludedFrames:(id)a3
{
}

- (_CSTypeRef)symbolicator
{
  objc_copyStruct(v4, &self->_symbolicator, 16, 1, 0);
  unint64_t v2 = v4[0];
  unint64_t v3 = v4[1];
  result._opaque_2 = v3;
  result._opaque_1 = v2;
  return result;
}

- (VMUTask)vmuTask
{
  return (VMUTask *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryImagePathToIdentifierMap, 0);
  objc_storeStrong((id *)&self->_excludedFrames, 0);
  objc_storeStrong((id *)&self->_addressToSymbolicationMap, 0);
  objc_storeStrong((id *)&self->_regionTracker, 0);

  objc_storeStrong((id *)&self->_vmuTask, 0);
}

@end