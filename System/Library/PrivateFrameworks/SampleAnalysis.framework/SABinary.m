@interface SABinary
+ (SABinary)binaryWithUUID:(id)a3;
+ (SABinary)binaryWithUUID:(id)a3 absolutePath:(id)a4;
+ (id)binaryWithPath:(uint64_t)a1 architecture:(void *)a2 additionalCSSymbolicatorFlags:(uint64_t)a3;
+ (id)binaryWithSymbolOwner:(uint64_t)a3 fromDisk:(char)a4;
+ (id)classDictionaryKey;
+ (id)dataFillingQueue;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
+ (uint64_t)haveMultipleBinariesWithUUID:(uint64_t)a1;
+ (void)_addDsymPath:(uint64_t)a1;
+ (void)_doCachedBinariesWork:(uint64_t)a1;
+ (void)_doDsymPathsWork:(uint64_t)a1;
+ (void)addDsymPaths:(id)a3;
+ (void)addPath:(id)a3 forBinaryWithUUID:(id)a4;
+ (void)addSymbolsFromTailspin:(id)a3;
+ (void)binaryForDyldImage:(int)a3 options:;
+ (void)clearCaches;
+ (void)clearCoreSymbolicationCaches;
+ (void)clearSymbolCaches;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4;
- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
- (BOOL)hasTextExecSegment;
- (NSArray)segments;
- (NSString)binaryVersion;
- (NSString)bundleIdentifier;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)codesigningID;
- (NSString)debugDescription;
- (NSString)name;
- (NSString)path;
- (NSString)teamID;
- (NSUUID)uuid;
- (SABinary)initWithUUID:(id)a3 path:(id)a4;
- (id)addSymbolWithOffsetIntoBinary:(unint64_t)a3 length:(void *)a4 name:;
- (id)createFakeEntireBinarySegment;
- (id)instructionAtOffsetIntoBinary:(int64_t)a3;
- (id)instructionAtOffsetIntoTextSegment:(unint64_t)a3;
- (id)segmentAtOffsetIntoBinary:(int)a3 createFakeSegmentIfNeeded:;
- (id)segmentWithCleanName:(void *)a1;
- (id)segmentWithName:(id)a3;
- (id)symbolOwnerWrapperWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 additionalCSSymbolicatorFlags:;
- (unint64_t)length;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)textSegmentLength;
- (void)addInfoFromSymbolOwner:(uint64_t)a3 fromDisk:(char)a4 includeExpensiveInfo:(int)a5;
- (void)addPath:(id)a3;
- (void)addSegment:(void *)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)clearCoreSymbolicationCache;
- (void)clearSymbolCache;
- (void)findPathViaBinaryLocator;
- (void)gatherBundleInfo;
- (void)gatherInfoWithDataGatheringOptions:(unint64_t)a3 pid:(int)a4;
- (void)getCodeSignInfoWithBundleUrl:(void *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)saveInfoFromBundle:(void *)a1;
- (void)segmentAtOffsetIntoBinary:(void *)a1;
- (void)segmentWithCSSegment:(uint64_t)a3 symbolOwnerLayoutMatchesDisk:(int)a4 symbolOwnerBaseAddress:(uint64_t)a5;
- (void)setLength:(void *)a1;
- (void)setName:(void *)a1;
- (void)symbolicateAllInstructionsWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 onlyDsym:(int)a6 additionalCSSymbolicatorFlags:;
- (void)symbolicateAllInstructionsWithOptions:(unint64_t)a3 pid:(int)a4;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SABinary

- (id)createFakeEntireBinarySegment
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)v1[6];
    if (!v2)
    {
      uint64_t v3 = +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, v1, @"ENTIRE_BINARY", v1[5], 0);
      v4 = (void *)v1[6];
      v1[6] = v3;

      v2 = (void *)v1[6];
    }
    id v5 = v2;
    objc_sync_exit(v1);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)getCodeSignInfoWithBundleUrl:(void *)a1
{
  id v3 = a2;
  if (a1 && !a1[15] && !a1[16] && (v3 || a1[10]))
  {
    id v5 = v3;
    v4 = a1;
    objc_sync_enter(v4);
    if ((v4[64] & 2) == 0) {
      v4[64] |= 2u;
    }
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

- (void)gatherBundleInfo
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (!obj[11]
      && !obj[12]
      && !obj[13]
      && ((_BYTE)obj[8] & 1) == 0
      && ([obj[10] isAbsolutePath] & 1) != 0)
    {
      *((unsigned char *)obj + 64) |= 1u;
      v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:obj[10] isDirectory:0];
      if (v1)
      {
        v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();

        if (v2)
        {
          -[SABinary saveInfoFromBundle:](obj, v2);
          CFRelease(v2);
        }
        else
        {
          -[SABinary getCodeSignInfoWithBundleUrl:](obj, 0);
        }
      }
    }
    objc_sync_exit(obj);
  }
}

+ (void)_doCachedBinariesWork:(uint64_t)a1
{
  v4 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB699138);
  if (!qword_1EB699148)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = (void *)qword_1EB699148;
    qword_1EB699148 = (uint64_t)v2;
  }
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB699138);
}

void __27__SABinary_binaryWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      int v9 = *__error();
      v10 = _sa_logt();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) path];
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Multiple binaries with UUID %@ exist, using %@", buf, 0x16u);
      }
      *__error() = v9;
    }
  }
  else
  {
    uint64_t v13 = [objc_alloc(*(Class *)(a1 + 48)) initWithUUID:*(void *)(a1 + 32) path:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
    [v3 setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)findPathViaBinaryLocator
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (([v1[10] isAbsolutePath] & 1) == 0)
    {
      unint64_t v2 = (unint64_t)v1[2];
      if ((v2 & 4) == 0)
      {
        v1[2] = (void *)(v2 | 4);
        id v3 = +[SABinaryLocator sharedBinaryLocator];
        v4 = -[SABinaryLocator urlForUUID:](v3, v1[9]);
        id v5 = v4;
        if (v4)
        {
          uint64_t v6 = [v4 path];
          if (v6)
          {
            char v13 = 0;
            if (SAFilepathMatches(v1[10], v6, &v13))
            {
              if (v13)
              {
                uint64_t v7 = SACachedNSString(v6);
                v8 = v1[10];
                v1[10] = (void *)v7;

                *((unsigned char *)v1 + 66) = 1;
              }
            }
            else
            {
              int v9 = *__error();
              v10 = _sa_logt();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v11 = [v1[9] UUIDString];
                v12 = v1[10];
                *(_DWORD *)buf = 138543874;
                v15 = v11;
                __int16 v16 = 2112;
                v17 = v6;
                __int16 v18 = 2112;
                __int16 v19 = v12;
                _os_log_debug_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: found path %@ via binary locator, but doesn't match existing partial path %@", buf, 0x20u);
              }
              *__error() = v9;
            }
          }
        }
        [v3 done];
      }
    }
    objc_sync_exit(v1);
  }
}

- (void)saveInfoFromBundle:(void *)a1
{
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    if (!v3[11] && !v3[12] && !v3[13])
    {
      *((unsigned char *)v3 + 64) |= 1u;
      uint64_t v4 = CFBundleGetIdentifier(a2);
      id v5 = v3[11];
      v3[11] = (void *)v4;

      CFTypeRef v6 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x1E4F1CC70]);
      uint64_t v7 = v3[13];
      v3[13] = (void *)v6;

      CFTypeRef v8 = SACFBundleCopyStringForKey(a2, (const __CFString *)*MEMORY[0x1E4F1D020]);
      int v9 = v3[12];
      v3[12] = (void *)v8;

      if (!v3[10])
      {
        CFURLRef v10 = CFBundleCopyExecutableURL(a2);
        CFURLRef v11 = v10;
        if (v10)
        {
          v12 = [(__CFURL *)v10 path];

          if (v12)
          {
            char v18 = 0;
            int v13 = SAFilepathMatches(v3[10], v12, &v18);
            if (v18) {
              int v14 = v13;
            }
            else {
              int v14 = 0;
            }
            if (v14 == 1)
            {
              uint64_t v15 = SACachedNSString(v12);
              __int16 v16 = v3[10];
              v3[10] = (void *)v15;
            }
          }
        }
      }
      CFURLRef v17 = CFBundleCopyBundleURL(a2);
      -[SABinary getCodeSignInfoWithBundleUrl:](v3, v17);
    }
    objc_sync_exit(v3);
  }
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __40__SABinary_clearCoreSymbolicationCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearCoreSymbolicationCache];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSString)name
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  name = v2->_name;
  if (name) {
    Path = name;
  }
  else {
    Path = (NSString *)-[NSString copyLastPathComponent](v2->_path);
  }
  uint64_t v5 = Path;
  objc_sync_exit(v2);

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)segmentAtOffsetIntoBinary:(int)a3 createFakeSegmentIfNeeded:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1 && (a2 < 0 || a1[5] - 1 >= (unint64_t)a2))
  {
    uint64_t v6 = a1;
    objc_sync_enter(v6);
    uint64_t v7 = (void *)v6[7];
    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        id v10 = 0;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v13, "hasOffsetIntoBinary", (void)v17)
              && [v13 offsetIntoBinary] <= a2)
            {
              if ([v13 length])
              {
                uint64_t v14 = [v13 offsetIntoBinary];
                if ([v13 length] + v14 > a2)
                {
                  id v5 = v13;

                  goto LABEL_23;
                }
                id v15 = 0;
              }
              else
              {
                id v15 = v13;
              }

              id v10 = v15;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }

        if (v10)
        {
          id v10 = v10;
          id v5 = v10;
LABEL_23:

          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    id v5 = 0;
    if ((a2 & 0x8000000000000000) == 0 && a3)
    {
      -[SABinary createFakeEntireBinarySegment](v6);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_28:
    objc_sync_exit(v6);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (NSArray)segments
{
  unint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSMutableArray *)v2->_segments copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

+ (void)clearCaches
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__2;
  uint64_t v7 = __Block_byref_object_dispose__2;
  id v8 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __23__SABinary_clearCaches__block_invoke;
  v2[3] = &unk_1E63F8548;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3];
  _Block_object_dispose(&v3, 8);
}

void __23__SABinary_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ((id)qword_1EB699148 == v15)
  {
    qword_1EB699148 = 0;
  }
  else
  {
    int v6 = *__error();
    uint64_t v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "global doesn't match local", buf, 2u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(1087, "global doesn't match local", v8, v9, v10, v11, v12, v13, v14);
    _os_crash();
    __break(1u);
  }
}

void __23__SABinary_clearCaches__block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearSymbolCache];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)clearSymbolCaches
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__2;
  uint64_t v7 = __Block_byref_object_dispose__2;
  id v8 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__SABinary_clearSymbolCaches__block_invoke;
  v2[3] = &unk_1E63F8548;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_105];
  _Block_object_dispose(&v3, 8);
}

void __29__SABinary_clearSymbolCaches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __29__SABinary_clearSymbolCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearSymbolCache];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)clearCoreSymbolicationCaches
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__2;
  uint64_t v7 = __Block_byref_object_dispose__2;
  id v8 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__SABinary_clearCoreSymbolicationCaches__block_invoke;
  v2[3] = &unk_1E63F8548;
  v2[4] = &v3;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v2);
  [(id)v4[5] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_107];
  _Block_object_dispose(&v3, 8);
}

+ (uint64_t)haveMultipleBinariesWithUUID:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SABinary_haveMultipleBinariesWithUUID___block_invoke;
  v7[3] = &unk_1E63F8590;
  long long v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  +[SABinary _doCachedBinariesWork:](v3, v7);
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __41__SABinary_haveMultipleBinariesWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v3 count] > 1;
}

+ (SABinary)binaryWithUUID:(id)a3 absolutePath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (([v7 isAbsolutePath] & 1) == 0)
    {
      int v11 = *__error();
      uint64_t v12 = _sa_logt();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = [v8 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "path %s is not absolute", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v11;
      char v13 = [v8 UTF8String];
      _SASetCrashLogMessage(1141, "path %s is not absolute", v14, v15, v16, v17, v18, v19, v13);
      _os_crash();
      __break(1u);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    id v29 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__SABinary_binaryWithUUID_absolutePath___block_invoke;
    v20[3] = &unk_1E63F85B8;
    id v21 = v6;
    id v22 = v8;
    p_long long buf = &buf;
    id v24 = a1;
    +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v20);
    id v9 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v9 = [a1 binaryWithUUID:v6];
  }

  return (SABinary *)v9;
}

void __40__SABinary_binaryWithUUID_absolutePath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        char v34 = 0;
        uint64_t v10 = [v9 path];
        int v11 = SAFilepathMatches(v10, *(void **)(a1 + 40), &v34);

        if (v11)
        {
          uint64_t v12 = [v9 path];
          if (v12)
          {
          }
          else if ([v4 count] != 1)
          {
            int v22 = *__error();
            v23 = _sa_logt();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v24 = [*(id *)(a1 + 32) UUIDString];
              uint64_t v25 = [v24 UTF8String];
              *(_DWORD *)long long buf = 136315138;
              uint64_t v40 = v25;
              _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "Multiple binaries for %s, but no path", buf, 0xCu);
            }
            *__error() = v22;
            id v26 = [*(id *)(a1 + 32) UUIDString];
            char v27 = [v26 UTF8String];
            _SASetCrashLogMessage(1150, "Multiple binaries for %s, but no path", v28, v29, v30, v31, v32, v33, v27);

            _os_crash();
            __break(1u);
          }
          if (v34)
          {
            uint64_t v14 = SACachedNSString(*(void **)(a1 + 40));
            if (v9) {
              objc_setProperty_atomic_copy(v9, v13, v14, 80);
            }
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
          goto LABEL_18;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v15 = objc_alloc(*(Class *)(a1 + 56));
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = SACachedNSString(*(void **)(a1 + 40));
    uint64_t v18 = [v15 initWithUUID:v16 path:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (v4)
    {
      [v4 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    else
    {
      id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
      [v3 setObject:v21 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
}

+ (SABinary)binaryWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__SABinary_binaryWithUUID___block_invoke;
  v8[3] = &unk_1E63F85E0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v12;
  id v11 = a1;
  +[SABinary _doCachedBinariesWork:]((uint64_t)a1, v8);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (SABinary *)v6;
}

+ (id)binaryWithPath:(uint64_t)a1 architecture:(void *)a2 additionalCSSymbolicatorFlags:(uint64_t)a3
{
  id v4 = a2;
  uint64_t v5 = self;
  uint64_t SymbolOwnerForArchitectureAtPath = CreateSymbolOwnerForArchitectureAtPath(a3, v4);
  uint64_t v8 = v7;

  if (CSIsNull())
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[SABinary binaryWithSymbolOwner:v8 fromDisk:1];
    CSRelease();
  }
  return v9;
}

+ (id)binaryWithSymbolOwner:(uint64_t)a3 fromDisk:(char)a4
{
  uint64_t v7 = self;
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CSSymbolOwnerIsDsym())
  {
    uint64_t v9 = 0;
  }
  else
  {
    Path = (unsigned char *)CSSymbolOwnerGetPath();
    uint64_t v9 = SAFilepathForCString(Path);
  }
  if (!(CFUUIDBytes | v9))
  {
    uint64_t v14 = 0;
    goto LABEL_19;
  }
  if (CFUUIDBytes) {
    id v11 = (void *)CFUUIDBytes;
  }
  else {
    id v11 = &UUID_NULL;
  }
  uint64_t v12 = uuidForBytes((uint64_t)v11);
  if ([(id)v9 isAbsolutePath]) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [v7 binaryWithUUID:v12 absolutePath:v13];
  id v15 = [v14 path];

  if (v15 || !v9)
  {
    if (v14) {
      goto LABEL_17;
    }
  }
  else if (v14)
  {
    objc_setProperty_atomic_copy(v14, v16, (id)v9, 80);
LABEL_17:
    [(SABinary *)(uint64_t)v14 addInfoFromSymbolOwner:a3 fromDisk:a4 includeExpensiveInfo:0];
  }

LABEL_19:
  return v14;
}

+ (void)_doDsymPathsWork:(uint64_t)a1
{
  id v3 = a2;
  self;
  if (qword_1EB699158 != -1) {
    dispatch_once(&qword_1EB699158, &__block_literal_global_114);
  }
  id v2 = (id)qword_1EB699150;
  objc_sync_enter(v2);
  v3[2](v3, qword_1EB699150);
  objc_sync_exit(v2);
}

void __29__SABinary__doDsymPathsWork___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  v1 = (void *)qword_1EB699150;
  qword_1EB699150 = v0;
}

+ (void)_addDsymPath:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__SABinary__addDsymPath___block_invoke;
  v5[3] = &unk_1E63F8608;
  id v6 = v2;
  id v4 = v2;
  +[SABinary _doDsymPathsWork:](v3, v5);
}

void __25__SABinary__addDsymPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0) {
    [v3 addObject:*(void *)(a1 + 32)];
  }
}

void __22__SABinary__dsymPaths__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)addDsymPaths:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138412546;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "rangeOfString:", @".dSYM", v16);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[SABinary _addDsymPath:]((uint64_t)a1, v9);
        }
        else
        {
          uint64_t v12 = objc_msgSend(v9, "substringWithRange:", 0, v10 + v11);
          uint64_t v13 = [v12 stringByDeletingLastPathComponent];

          if (![(__CFString *)v13 length])
          {

            uint64_t v13 = @"./";
          }
          int v14 = *__error();
          id v15 = _sa_logt();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v16;
            v23 = v9;
            __int16 v24 = 2112;
            uint64_t v25 = v13;
            _os_log_debug_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_DEBUG, "Replaced %@ with %@", buf, 0x16u);
          }

          *__error() = v14;
          +[SABinary _addDsymPath:]((uint64_t)a1, v13);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }
}

+ (void)addPath:(id)a3 forBinaryWithUUID:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 isAbsolutePath])
  {
    id v6 = +[SABinary binaryWithUUID:v5 absolutePath:v8];
  }
  else
  {
    uint64_t v7 = +[SABinary binaryWithUUID:v5];
    [v7 addPath:v8];
  }
}

+ (void)addSymbolsFromTailspin:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v48 = DictGetString(v3, @"Name");
  DictGetString(v3, @"Path");
  id newValue = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = DictGetNumber(v3, @"Size");
  uint64_t v5 = [v4 unsignedLongLongValue];

  id v6 = DictGetString(v3, @"UUID_String");
  DictGetString(v3, @"BundleID");
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BundleVersion");
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BundleShortVersion");
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  DictGetString(v3, @"BinaryVersion");
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = DictGetNumber(v3, @"TEXT_EXEC");
  int v8 = [v7 BOOLValue];

  if (v6)
  {
    v43 = uuidForString(v6);
    if (v43)
    {
      if ([newValue isAbsolutePath]) {
        id v9 = newValue;
      }
      else {
        id v9 = 0;
      }
      uint64_t v10 = +[SABinary binaryWithUUID:v43 absolutePath:v9];
      uint64_t v11 = @"__TEXT";
      if (v8) {
        uint64_t v11 = @"__TEXT_EXEC";
      }
      v41 = v11;
      uint64_t v12 = -[SABinary segmentWithCleanName:](v10, v41);
      if (!v12)
      {
        uint64_t v12 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v10, v41, v5);
        -[SABinary addSegment:](v10, v12);
      }
      uint64_t v13 = objc_msgSend(v10, "path", v41, v43);
      if (v13)
      {
      }
      else if ([newValue length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v18, newValue, 80);
      }
      long long v19 = [v10 name];
      if (v19)
      {
      }
      else if ([v48 length])
      {
        long long v20 = [v10 path];
        if (!v20
          || ([v10 path],
              long long v21 = objc_claimAutoreleasedReturnValue(),
              Path = -[NSString copyLastPathComponent](v21),
              char v23 = [Path hasPrefix:v48],
              Path,
              v21,
              v20,
              (v23 & 1) == 0))
        {
          -[SABinary setName:](v10, v48);
        }
      }
      __int16 v24 = [v10 bundleIdentifier];
      if (v24)
      {
      }
      else if ([v47 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v25, v47, 88);
      }
      id v26 = [v10 bundleVersion];
      if (v26)
      {
      }
      else if ([v46 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v27, v46, 96);
      }
      uint64_t v28 = [v10 bundleShortVersion];
      if (v28)
      {
      }
      else if ([v45 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v29, v45, 104);
      }
      uint64_t v30 = [v10 binaryVersion];
      if (v30)
      {
      }
      else if ([v44 length] && v10)
      {
        objc_setProperty_atomic_copy(v10, v31, v44, 112);
      }
      uint64_t v32 = DictGetDict(v3, @"Symbols");
      uint64_t v33 = v32;
      if (v32)
      {
        id v34 = v32;
        if (v12)
        {
          long long v35 = v12;
          objc_sync_enter(v35);
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __32__SASegment_addTailspinSymbols___block_invoke;
          v54[3] = &unk_1E63F83C8;
          v54[4] = v35;
          [v34 enumerateKeysAndObjectsUsingBlock:v54];
          long long v36 = [v35[7] allValues];
          objc_sync_exit(v35);

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v37 = v36;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:buf count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v51;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v51 != v39) {
                  objc_enumerationMutation(v37);
                }
                -[SAInstruction checkForNewSymbol](*(void *)(*((void *)&v50 + 1) + 8 * i));
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:buf count:16];
            }
            while (v38);
          }
        }
      }
    }
    else
    {
      int v16 = *__error();
      id v17 = _sa_logt();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v56 = v6;
        _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "Unable to convert %@ into uuid", buf, 0xCu);
      }

      *__error() = v16;
    }
  }
  else
  {
    int v14 = *__error();
    id v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v56 = v48;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "No uuid in tailspin symbol chunk for %@", buf, 0xCu);
    }

    *__error() = v14;
  }
}

- (id)segmentWithCleanName:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = (void *)v4[7];
    if (v5)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = v5;
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v11 = objc_msgSend(v10, "name", (void)v15);
            int v12 = [v11 isEqualToString:v3];

            if (v12)
            {
              id v7 = v10;
              int v13 = 1;
              goto LABEL_13;
            }
          }
          id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      int v13 = 0;
LABEL_13:
    }
    else
    {
      id v7 = 0;
      int v13 = 1;
    }
    objc_sync_exit(v4);

    if (v13) {
      a1 = v7;
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

- (void)addSegment:(void *)a1
{
  id v9 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = v3[7];
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v6 = v3[7];
      v3[7] = (void *)v5;

      uint64_t v4 = v3[7];
    }
    [v4 addObject:v9];
    [v3[7] sortUsingComparator:&__block_literal_global_130];
    id v7 = v3[6];
    if (v7)
    {
      -[SASegment grabInstructionsFromOtherSegment:](v9, v7);
      if (-[SASegment isEmpty](v3[6]))
      {
        uint64_t v8 = v3[6];
        v3[6] = 0;
      }
    }
    objc_sync_exit(v3);
  }
}

- (void)setName:(void *)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = [v6 copy];
    uint64_t v5 = (void *)v3[3];
    v3[3] = v4;

    objc_sync_exit(v3);
  }
}

- (SABinary)initWithUUID:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SABinary;
  id v9 = [(SABinary *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_path, a4);
  }

  return v10;
}

- (void)addPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v12 = 0;
  if (!SAFilepathMatches(v5->_path, v4, &v12))
  {
    int v8 = *__error();
    id v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(SABinary *)v5 debugDescription];
      *(_DWORD *)long long buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      long long v16 = v10;
      _os_log_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Tried to set mismatched path %@ on binary %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (v12)
  {
    uint64_t v6 = SACachedNSString(v4);
    path = v5->_path;
    v5->_path = (NSString *)v6;

    if (([v4 isAbsolutePath] & 1) == 0)
    {
      int v8 = *__error();
      id v9 = _sa_logt();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [(SABinary *)v5 debugDescription];
        *(_DWORD *)long long buf = 138412290;
        id v14 = v11;
        _os_log_debug_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_DEBUG, "%@ set relative path", buf, 0xCu);
      }
LABEL_9:

      *__error() = v8;
    }
  }
  objc_sync_exit(v5);
}

- (void)segmentAtOffsetIntoBinary:(void *)a1
{
  if (a1)
  {
    a1 = -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](a1, a2, 0);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)segmentWithName:(id)a3
{
  id v4 = CopyCleanSegmentName(a3);
  uint64_t v5 = -[SABinary segmentWithCleanName:](self, v4);

  return v5;
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4
{
  return [(SABinary *)self cacheSymbolOwnerWithOptions:a3 pid:*(void *)&a4 additionalCSSymbolicatorFlags:0];
}

- (BOOL)cacheSymbolOwnerWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  uint64_t v5 = -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](self, a3, a4, 1, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)symbolOwnerWrapperWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 additionalCSSymbolicatorFlags:
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v8 = a1;
    objc_sync_enter(v8);
    uint64_t v9 = (a2 >> 10) & 1;
    if (!a3) {
      LODWORD(v9) = 1;
    }
    if (a3 < 0) {
      LODWORD(v9) = 0;
    }
    if ((~(_BYTE)a2 & 0x22) != 0) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
    unsigned int v122 = a3;
    int v123 = v10;
    uint64_t v11 = v8 + 10;
    char v12 = [v8[10] isAbsolutePath];
    if ((a2 & 4) != 0) {
      char v13 = v12;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0 && ((_BYTE)v8[2] & 4) == 0) {
      -[SABinary findPathViaBinaryLocator](v8);
    }
    if (CSIsNull())
    {
      id v14 = (char *)v8[1];
      if (!v14 || (objc_copyStruct(dest, v14 + 16, 16, 1, 0), (CSSymbolOwnerIsDsym() & 1) == 0))
      {
        if ((a2 & 0x40) != 0)
        {
          unint64_t v15 = (unint64_t)v8[2];
          if ((v15 & 0x40) == 0)
          {
            uint64_t v16 = a2 & 8;
            uint64_t v17 = (unint64_t)v8[2] & 8;
LABEL_24:
            uint64_t v18 = 64;
            if ((((v15 & 0x200) == 0) & (a2 >> 9)) != 0) {
              uint64_t v18 = 576;
            }
            uint64_t v19 = v18 | v15;
            if (v17) {
              BOOL v20 = 1;
            }
            else {
              BOOL v20 = v16 == 0;
            }
            if (!v20) {
              v19 |= 8uLL;
            }
            v8[2] = (id)v19;
            uint64_t v21 = self;
            *(void *)dest = 0;
            *(void *)&dest[8] = dest;
            *(void *)&dest[16] = 0x3032000000;
            v141 = __Block_byref_object_copy__2;
            v142 = __Block_byref_object_dispose__2;
            id v143 = 0;
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&long long v137 = 3221225472;
            *((void *)&v137 + 1) = __22__SABinary__dsymPaths__block_invoke;
            v138 = &unk_1E63F8630;
            v139 = dest;
            +[SABinary _doDsymPathsWork:](v21, buf);
            id v22 = *(id *)(*(void *)&dest[8] + 40);
            _Block_object_dispose(dest, 8);

            int v120 = CSIsNull() ^ 1;
            goto LABEL_33;
          }
        }
        if ((a2 & 8) != 0)
        {
          unint64_t v15 = (unint64_t)v8[2];
          if ((v15 & 8) == 0)
          {
            uint64_t v17 = 0;
            uint64_t v16 = 1;
            goto LABEL_24;
          }
        }
      }
    }
    int v120 = 0;
LABEL_33:
    if (CSIsNull() && v8[1])
    {
      int v23 = [*v11 isAbsolutePath];
      if ((a2 & 1) != 0 && ((v23 ^ 1) & 1) == 0)
      {
        unint64_t v24 = (unint64_t)v8[2];
        if ((v24 & 1) == 0)
        {
          v8[2] = (id)(v24 | 1);
          -[SABinary gatherBundleInfo](v8);
        }
      }
LABEL_126:
      id v85 = v8[1];
      objc_sync_exit(v8);

      goto LABEL_127;
    }
    int v25 = a2 & a4;
    if (!CSIsNull()) {
      goto LABEL_52;
    }
    char v26 = v25 ^ 1;
    if (*v11) {
      char v26 = 1;
    }
    if (v26)
    {
LABEL_52:
      int v37 = 0;
      uint64_t v29 = 0;
      uint64_t SymbolOwnerForExclaveUUID = 0;
    }
    else
    {
      uint64_t SymbolOwnerForExclaveUUID = CreateSymbolOwnerForExclaveUUID(v8[9]);
      uint64_t v29 = v28;
      char v30 = CSIsNull();
      if ((~(_BYTE)a2 & 5) != 0) {
        char v31 = 1;
      }
      else {
        char v31 = v30;
      }
      if ((v31 & 1) == 0)
      {
        Path = (unsigned char *)CSSymbolOwnerGetPath();
        uint64_t v33 = SAFilepathForCString(Path);
        id v34 = v33;
        if (v33 && [v33 isAbsolutePath])
        {
          long long v35 = +[SABinaryLocator sharedBinaryLocator];
          long long v36 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v34 isDirectory:0];
          -[SABinaryLocator addURL:ForUUID:](v35, v36, v8[9]);

          [v35 done];
        }
      }
      int v37 = 1;
    }
    if (!CSIsNull()) {
      goto LABEL_58;
    }
    char v38 = v123 ^ 1;
    if (*v11) {
      char v38 = 1;
    }
    if ((v38 & 1) != 0 || kill(v122, 0) || (uint64_t v60 = CopyDyldSnapshotForPid(v122)) == 0)
    {
LABEL_58:
      int v39 = 0;
    }
    else
    {
      *(void *)dest = 0;
      *(void *)&dest[8] = dest;
      *(void *)&dest[16] = 0x2020000000;
      LOBYTE(v141) = 0;
      uint64_t v129 = MEMORY[0x1E4F143A8];
      uint64_t v130 = 3221225472;
      v131 = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke;
      v132 = &unk_1E63F86F0;
      v133 = v8;
      v134 = dest;
      unsigned int v135 = v122;
      dyld_process_snapshot_for_each_image();
      if (*v11)
      {
        int v61 = *__error();
        v62 = _sa_logt();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v93 = [v8 debugDescription];
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v122;
          LOWORD(v137) = 2112;
          *(void *)((char *)&v137 + 2) = v93;
          v118 = (void *)v93;
          _os_log_debug_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_DEBUG, "Found path via dyld inspection of [%d] for %@", buf, 0x12u);
        }
        int v63 = v61;
        int v39 = 0;
        *__error() = v63;
      }
      else if (*(unsigned char *)(*(void *)&dest[8] + 24))
      {
        int v39 = 0;
      }
      else
      {
        int v87 = *__error();
        v88 = _sa_logt();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          int v119 = v87;
          uint64_t v89 = [v8 debugDescription];
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v122;
          LOWORD(v137) = 2112;
          *(void *)((char *)&v137 + 2) = v89;
          v90 = (void *)v89;
          _os_log_impl(&dword_1BF22B000, v88, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to find binary via dyld inspection of [%d] for %@", buf, 0x12u);

          int v87 = v119;
        }

        *__error() = v87;
        int v39 = 1;
      }
      v91 = +[SABinary dataFillingQueue]();
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_143;
      v127[3] = &__block_descriptor_52_e5_v8__0l;
      unsigned int v128 = v122;
      v127[4] = v60;
      v127[5] = a2 & 0x26D;
      dispatch_async(v91, v127);

      _Block_object_dispose(dest, 8);
    }
    if (!CSIsNull()) {
      goto LABEL_64;
    }
    LODWORD(v118) = 1;
    if ((a2 & 0x20) == 0) {
      goto LABEL_65;
    }
    id v40 = *v11;
    if (!*v11) {
      goto LABEL_65;
    }
    unint64_t v41 = (unint64_t)v8[2];
    if ((v41 & 0x20) != 0)
    {
LABEL_64:
      LODWORD(v118) = 1;
    }
    else
    {
      v8[2] = (id)(v41 | 0x20);
      uint64_t SymbolOwnerForExclaveUUID = CreateSymbolOwnerForUUIDAtPath(v8[9], v40, a5);
      uint64_t v29 = v42;
      LODWORD(v118) = 0;
      v120 |= CSIsNull() ^ 1;
    }
LABEL_65:
    if (((v37 | v25 & CSIsNull() ^ 1) & 1) == 0)
    {
      uint64_t SymbolOwnerForExclaveUUID = CreateSymbolOwnerForExclaveUUID(v8[9]);
      uint64_t v29 = v43;
      char v44 = CSIsNull();
      char v45 = (~(_BYTE)a2 & 5) != 0 ? 1 : v44;
      if ((v45 & 1) == 0)
      {
        id v46 = (unsigned char *)CSSymbolOwnerGetPath();
        id v47 = SAFilepathForCString(v46);
        v48 = v47;
        if (v47 && [v47 isAbsolutePath])
        {
          v49 = +[SABinaryLocator sharedBinaryLocator];
          long long v50 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v48 isDirectory:0];
          -[SABinaryLocator addURL:ForUUID:](v49, v50, v8[9]);

          [v49 done];
        }
      }
    }
    if (((v39 | v123 & CSIsNull() ^ 1) & 1) == 0 && !kill(v122, 0))
    {
      if (v122)
      {
        int v51 = *__error();
        long long v52 = _sa_logt();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          long long v53 = [v8 debugDescription];
          *(_DWORD *)dest = 67109378;
          *(_DWORD *)&dest[4] = v122;
          *(_WORD *)&dest[8] = 2112;
          *(void *)&dest[10] = v53;
          _os_log_impl(&dword_1BF22B000, v52, OS_LOG_TYPE_DEFAULT, "WARNING: Inspecting live process [%d] to get symbol owner for %@", dest, 0x12u);
        }
        *__error() = v51;
      }
      uint64_t SymbolicatorForLiveProcess = CreateSymbolicatorForLiveProcess(v122, a5);
      uint64_t v56 = v55;
      if ((CSIsNull() & 1) == 0)
      {
        *(void *)long long buf = 0;
        *(void *)&long long v137 = 0;
        [v8[9] getUUIDBytes:buf];
        uint64_t SymbolOwnerForExclaveUUID = CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
        uint64_t v29 = v57;
        if (CSIsNull())
        {
          int v58 = *__error();
          v59 = _sa_logt();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v92 = [v8 debugDescription];
            *(_DWORD *)dest = 67109378;
            *(_DWORD *)&dest[4] = v122;
            *(_WORD *)&dest[8] = 2112;
            *(void *)&dest[10] = v92;
            _os_log_debug_impl(&dword_1BF22B000, v59, OS_LOG_TYPE_DEBUG, "Process [%d] didn't have symbol owner for %@", dest, 0x12u);
          }
          *__error() = v58;
        }
        else
        {
          v64 = (unsigned char *)CSSymbolOwnerGetPath();
          v65 = SAFilepathForCString(v64);
          if (v65)
          {
            char v126 = 0;
            if (((*((unsigned char *)v8 + 66) != 0) & ~v118) != 0
              || ((int v66 = SAFilepathMatches(*v11, v65, &v126), v126) ? (v67 = v66) : (v67 = 0), v67 == 1))
            {
              objc_storeStrong(v8 + 10, v65);
              *((unsigned char *)v8 + 66) = 0;
            }
            int v68 = objc_msgSend(v65, "isAbsolutePath", v118) ^ 1;
            if ((~a2 & 5) != 0) {
              LOBYTE(v68) = 1;
            }
            if ((v68 & 1) == 0)
            {
              v69 = +[SABinaryLocator sharedBinaryLocator];
              char v70 = (char)v118;
              if (!*((unsigned char *)v8 + 66)) {
                char v70 = 1;
              }
              if ((v70 & 1) == 0)
              {
                int v124 = *__error();
                v71 = _sa_logt();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  id v72 = v8[9];
                  id v73 = v8[10];
                  *(_DWORD *)dest = 138543874;
                  *(void *)&dest[4] = v72;
                  *(_WORD *)&dest[12] = 2112;
                  *(void *)&dest[14] = v73;
                  *(_WORD *)&dest[22] = 2112;
                  v141 = (uint64_t (*)(uint64_t, uint64_t))v65;
                  _os_log_impl(&dword_1BF22B000, v71, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", dest, 0x20u);
                }

                *__error() = v124;
                -[SABinaryLocator removeURLForUUID:](v69, v8[9]);
              }
              v74 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v65 isDirectory:0];
              -[SABinaryLocator addURL:ForUUID:](v69, v74, v8[9]);

              [v69 done];
            }
          }
          CSRetain();
        }
        v75 = +[SABinary dataFillingQueue]();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_145;
        block[3] = &__block_descriptor_48_e5_v8__0l;
        block[4] = SymbolicatorForLiveProcess;
        block[5] = v56;
        dispatch_async(v75, block);
      }
    }
    if (CSIsNull()) {
      goto LABEL_122;
    }
    if (CSIsNull())
    {
      int v94 = *__error();
      v95 = _sa_logt();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dest = 0;
        _os_log_error_impl(&dword_1BF22B000, v95, OS_LOG_TYPE_ERROR, "CSSymbolOwner is NULL", dest, 2u);
      }

      *__error() = v94;
      _SASetCrashLogMessage(1943, "CSSymbolOwner is NULL", v96, v97, v98, v99, v100, v101, (char)v118);
      _os_crash();
      __break(1u);
LABEL_139:
      int v102 = *__error();
      v103 = _sa_logt();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dest = 0;
        _os_log_error_impl(&dword_1BF22B000, v103, OS_LOG_TYPE_ERROR, "_symbolOwnerWrapper is nil after setting CSSymbolOwner", dest, 2u);
      }

      *__error() = v102;
      _SASetCrashLogMessage(2252, "_symbolOwnerWrapper is nil after setting CSSymbolOwner", v104, v105, v106, v107, v108, v109, (char)v118);
      _os_crash();
      __break(1u);
      goto LABEL_142;
    }
    v76 = v8;
    objc_sync_enter(v76);
    if (!v76[1]) {
      goto LABEL_114;
    }
    if (CSSymbolOwnerIsDsym())
    {
      -[SACSSymbolOwnerWrapper symbolOwner](v76[1]);
      if ((CSSymbolOwnerIsDsym() & 1) == 0)
      {
LABEL_114:
        v77 = [SACSSymbolOwnerWrapper alloc];
        if (v77)
        {
          if (CSIsNull())
          {
LABEL_142:
            int v110 = *__error();
            v111 = _sa_logt();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)dest = 0;
              _os_log_error_impl(&dword_1BF22B000, v111, OS_LOG_TYPE_ERROR, "CSSymbolOwner is NULL", dest, 2u);
            }

            *__error() = v110;
            _SASetCrashLogMessage(47, "CSSymbolOwner is NULL", v112, v113, v114, v115, v116, v117, (char)v118);
            _os_crash();
            __break(1u);
            goto LABEL_145;
          }
          *(void *)dest = v77;
          *(void *)&dest[8] = SACSSymbolOwnerWrapper;
          v77 = (SACSSymbolOwnerWrapper *)objc_msgSendSuper2((objc_super *)dest, sel_init);
          if (v77)
          {
            v77->_symbolOwner._opaque_1 = CSRetain();
            v77->_symbolOwner._opaque_2 = v78;
            v77->_isDiskLayout = v120;
          }
        }
        v79 = (void *)v76[1];
        v76[1] = (uint64_t)v77;

        [(SABinary *)(uint64_t)v76 addInfoFromSymbolOwner:v29 fromDisk:v120 includeExpensiveInfo:0];
      }
    }
    else if (!*v11)
    {
      v80 = (unsigned char *)CSSymbolOwnerGetPath();
      uint64_t v81 = SAFilepathForCString(v80);
      id v82 = *v11;
      *uint64_t v11 = (id)v81;
    }
    objc_sync_exit(v76);

    CSRelease();
    if (v76[1])
    {
LABEL_122:
      int v83 = objc_msgSend(*v11, "isAbsolutePath", v118);
      if ((a2 & 1) != 0 && ((v83 ^ 1) & 1) == 0)
      {
        unint64_t v84 = (unint64_t)v8[2];
        if ((v84 & 1) == 0)
        {
          v8[2] = (id)(v84 | 1);
          -[SABinary gatherBundleInfo](v8);
        }
      }
      goto LABEL_126;
    }
    goto LABEL_139;
  }
LABEL_145:
  id v85 = 0;
LABEL_127:
  return v85;
}

uint64_t __23__SABinary_addSegment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 offsetIntoBinary];
  uint64_t v6 = [v4 offsetIntoBinary];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)instructionAtOffsetIntoBinary:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v4, a3, 1);
  uint64_t v5 = (SASegment *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  if (![(SASegment *)v5 hasOffsetIntoBinary])
  {
    int v11 = *__error();
    char v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SASegment *)v6 debugDescription];
      *(_DWORD *)long long buf = 136315138;
      uint64_t v23 = [v13 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: no offset into binary", buf, 0xCu);
    }
    *__error() = v11;
    id v14 = [(SASegment *)v6 debugDescription];
    char v15 = [v14 UTF8String];
    _SASetCrashLogMessage(1708, "%s: no offset into binary", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  uint64_t v7 = [(SASegment *)v6 offsetIntoBinary];
  if ([(SASegment *)v6 length] - 1 >= a3 - v7)
  {
    uint64_t v10 = -[SASegment instructionAtOffsetIntoSegment:](v6, "instructionAtOffsetIntoSegment:");
    int v8 = (void *)v10;
    if (v6 == v4->_fakeEntireBinarySegment && v10) {
      objc_storeWeak((id *)(v10 + 32), 0);
    }
  }
  else
  {
LABEL_4:
    int v8 = 0;
  }

  objc_sync_exit(v4);
  return v8;
}

- (void)segmentWithCSSegment:(uint64_t)a3 symbolOwnerLayoutMatchesDisk:(int)a4 symbolOwnerBaseAddress:(uint64_t)a5
{
  if (!a1) {
    goto LABEL_11;
  }
  uint64_t Range = CSRegionGetRange();
  unint64_t v10 = v9;
  Name = (void *)CSRegionGetName();
  if (!Name) {
    goto LABEL_11;
  }
  char v12 = SANSStringForCString(Name);
  id v13 = CopyCleanSegmentName(v12);

  if (v13)
  {
    id v14 = a1;
    objc_sync_enter(v14);
    char v15 = -[SABinary segmentWithCleanName:](v14, v13);
    uint64_t v16 = v15;
    if (v15)
    {
      if (a4 && ([v15 hasOffsetIntoBinary] & 1) == 0) {
        v16[5] = Range - a5;
      }
      if (![v16 length] && v10) {
        -[SASegment setLength:](v16, v10);
      }
    }
    else
    {
      if (a4) {
        +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, v14, v13, v10, Range - a5);
      }
      else {
      uint64_t v16 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v14, v13, v10);
      }
      -[SABinary addSegment:](v14, v16);
    }
    objc_sync_exit(v14);
  }
  else
  {
LABEL_11:
    uint64_t v16 = 0;
  }
  return v16;
}

void __33__SABinary_addInfoFromDyldImage___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  int v8 = SANSStringForCString(a2);
  CopyCleanSegmentName(v8);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v9 = -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v14);
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = [v9 length];
    if (a4 && !v11) {
      -[SASegment setLength:](v10, a4);
    }
  }
  else
  {
    unint64_t v10 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, *(void **)(a1 + 32), v14, a4);
    -[SABinary addSegment:](*(void **)(a1 + 32), v10);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v12 + 24) < a4 + a3) {
    *(void *)(v12 + 24) = a4 + a3;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(void *)(v13 + 24) > a3) {
    *(void *)(v13 + 24) = a3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a4;
  if (!strcmp((const char *)a2, "__TEXT")) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  }
}

- (void)setLength:(void *)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
    int v6 = *__error();
    uint64_t v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 debugDescription];
      *(_DWORD *)long long buf = 136315138;
      uint64_t v34 = [v8 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);
    }
    *__error() = v6;
    a2 = [v3 debugDescription];
    char v9 = [(id)a2 UTF8String];
    _SASetCrashLogMessage(2597, "%s: setting length 0", v10, v11, v12, v13, v14, v15, v9);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (*((void *)v3 + 5))
  {
LABEL_13:
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v3 debugDescription];
      uint64_t v19 = [v18 UTF8String];
      uint64_t v20 = *((void *)v3 + 5);
      *(_DWORD *)long long buf = 136315650;
      uint64_t v34 = v19;
      __int16 v35 = 2048;
      unint64_t v36 = a2;
      __int16 v37 = 2048;
      uint64_t v38 = v20;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when it was already %llu", buf, 0x20u);
    }
    *__error() = v16;
    id v21 = [v3 debugDescription];
    char v22 = [v21 UTF8String];
    _SASetCrashLogMessage(2598, "%s: setting length to %llu when it was already %llu", v23, v24, v25, v26, v27, v28, v22);

    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  *((void *)v3 + 5) = a2;
  if (a2 >> 28)
  {
LABEL_16:
    int v29 = *__error();
    char v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      id v31 = [v3 debugDescription];
      uint64_t v32 = [v31 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v34 = v32;
      __int16 v35 = 2048;
      unint64_t v36 = a2;
      _os_log_fault_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);
    }
    *__error() = v29;
  }
  id v4 = (void *)*((void *)v3 + 6);
  if (v4)
  {
    -[SASegment setLength:](v4, *((void *)v3 + 5));
    if (-[SASegment isEmpty](*((void **)v3 + 6)))
    {
      uint64_t v5 = (void *)*((void *)v3 + 6);
      *((void *)v3 + 6) = 0;
    }
  }
  objc_sync_exit(v3);
}

void __33__SABinary_addInfoFromDyldImage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = SANSStringForCString(a2);
  CopyCleanSegmentName(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = -[SABinary segmentWithCleanName:](*(void **)(a1 + 32), v8);
  if (([(id)v6 hasOffsetIntoBinary] & 1) == 0)
  {
    if (v6) {
      *(void *)(v6 + 40) = a3 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
    if (v7) {
      -[SASegment grabInstructionsFromOtherSegment:]((id *)v6, v7);
    }
  }
}

+ (void)binaryForDyldImage:(int)a3 options:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  uint64_t v6 = (void *)MEMORY[0x1C18A6A20](v5);
  *(void *)uu = 0;
  uint64_t v57 = 0;
  if (!dyld_image_copy_uuid() || uuid_is_null(uu))
  {
    int v7 = *__error();
    id v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v21 = DyldImagePath(a2);
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "No UUID for dyld_image %s", buf, 0xCu);
    }

    char v9 = 0;
    *__error() = v7;
    goto LABEL_6;
  }
  uint64_t v11 = uuidForBytes((uint64_t)uu);
  uint64_t v12 = (char *)DyldImagePath(a2);
  if (v12 && *v12)
  {
    uint64_t v13 = SANSStringForCString(v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v14 = [v13 isAbsolutePath] ^ 1;
  if ((~a3 & 5) != 0) {
    LOBYTE(v14) = 1;
  }
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = +[SABinaryLocator sharedBinaryLocator];
    int v16 = v15;
    if (!v15)
    {
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v17 = -[SABinaryLocator urlForUUID:](v15, v11);
    id v18 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 path];
      if (v19)
      {
        uint64_t v20 = [v18 path];
        if ([v20 isEqualToString:v13])
        {

LABEL_28:
          [v16 done];

          goto LABEL_29;
        }
        uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
        __int16 v37 = [v18 path];
        if ([v38 fileExistsAtPath:v37])
        {

          goto LABEL_28;
        }
        char v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v36 = [v22 fileExistsAtPath:v13];

        if (!v36) {
          goto LABEL_28;
        }
      }
      int v23 = *__error();
      uint64_t v24 = _sa_logt();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = [v18 path];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v59 = v13;
        _os_log_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_INFO, "%{public}@ moved: replacing %@ with %@", buf, 0x20u);
      }
      *__error() = v23;
      -[SABinaryLocator removeURLForUUID:](v16, v11);
    }
    uint64_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];

    -[SABinaryLocator addURL:ForUUID:](v16, v26, v11);
    id v18 = v26;
    goto LABEL_28;
  }
LABEL_30:
  if ([v13 isAbsolutePath]) {
    uint64_t v27 = v13;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = +[SABinary binaryWithUUID:v11 absolutePath:v27];
  char v9 = (void *)v28;
  if (v28 && (!*(void *)(v28 + 80) || !*(void *)(v28 + 40) || ![*(id *)(v28 + 56) count]))
  {
    int v29 = v9;
    objc_sync_enter(v29);
    if (!v9[10])
    {
      uint64_t v33 = (char *)DyldImagePath(a2);
      if (v33)
      {
        if (*v33)
        {
          uint64_t v34 = SANSStringForCString(v33);
          __int16 v35 = (void *)v9[10];
          v9[10] = v34;
        }
      }
    }
    uint64_t v52 = 0;
    long long v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = -1;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    uint64_t v44 = 0;
    char v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    uint64_t v40 = 0;
    unint64_t v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __33__SABinary_addInfoFromDyldImage___block_invoke;
    v59 = &unk_1E63F8678;
    uint64_t v60 = v29;
    int v61 = &v48;
    v62 = &v52;
    int v63 = &v44;
    v64 = &v40;
    DyldImageEnumerateSegments(a2, buf);
    uint64_t v30 = v41[3];
    if (v30 == v53[3])
    {
      unint64_t v31 = v49[3] - v30;
      if (v31 == v45[3])
      {
        if (!v29[5]) {
          -[SABinary setLength:](v29, v31);
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __33__SABinary_addInfoFromDyldImage___block_invoke_2;
        v39[3] = &unk_1E63F86A0;
        v39[4] = v29;
        v39[5] = &v40;
        DyldImageEnumerateSegments(a2, v39);
      }
    }
    if (-[SASegment isEmpty]((void *)v29[6]))
    {
      uint64_t v32 = (void *)v29[6];
      v29[6] = 0;
    }
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    objc_sync_exit(v29);
  }
LABEL_6:
  return v9;
}

- (void)addInfoFromSymbolOwner:(uint64_t)a3 fromDisk:(char)a4 includeExpensiveInfo:(int)a5
{
  if (a1 && ((a5 & 1) != 0 || ![*(id *)(a1 + 80) isAbsolutePath] || !*(void *)(a1 + 40)))
  {
    uint64_t v10 = (void **)(id)a1;
    objc_sync_enter(v10);
    uint64_t v11 = v10 + 10;
    if (([v10[10] isAbsolutePath] & 1) == 0 && (CSSymbolOwnerIsDsym() & 1) == 0)
    {
      Path = (unsigned char *)CSSymbolOwnerGetPath();
      uint64_t v13 = SAFilepathForCString(Path);
      LOBYTE(v30) = 0;
      if (v13)
      {
        int v14 = SAFilepathMatches(*v11, v13, &v30);
        int v15 = (_BYTE)v30 ? v14 : 0;
        if (v15 == 1) {
          objc_storeStrong(v10 + 10, v13);
        }
      }
    }
    if (!v10[3] && !*v11)
    {
      Name = (unsigned char *)CSSymbolOwnerGetName();
      uint64_t v17 = SAFilepathForCString(Name);
      id v18 = v10[3];
      v10[3] = (void *)v17;
    }
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    unint64_t v29 = 0;
    BOOL IsContiguous = SASymbolOwnerIsContiguous(a2, a3, &v30, &v29);
    unint64_t v20 = v29;
    if (v20 > [v10[7] count])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke;
      v26[3] = &unk_1E63F86C8;
      char v27 = IsContiguous | a4;
      v26[4] = v10;
      v26[5] = a2;
      v26[6] = a3;
      char v28 = a5;
      SASymbolOwnerForeachSegment(a2, a3, v26);
    }
    if (-[SASegment isEmpty](v10[6]))
    {
      id v21 = v10[6];
      v10[6] = 0;
    }
    if (v10[5]) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = IsContiguous;
    }
    if (v22) {
      -[SABinary setLength:](v10, v31);
    }
    if (a5 && !v10[14])
    {
      Version = (void *)CSSymbolOwnerGetVersion();
      if (Version)
      {
        uint64_t v24 = SANSStringForCString(Version);
        uint64_t v25 = v10[14];
        v10[14] = (void *)v24;
      }
    }
    objc_sync_exit(v10);
  }
}

void __65__SABinary_addInfoFromSymbolOwner_fromDisk_includeExpensiveInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v6 = *(unsigned __int8 *)(a1 + 56);
  int v7 = *(void **)(a1 + 32);
  uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  id v18 = [(SABinary *)v7 segmentWithCSSegment:a3 symbolOwnerLayoutMatchesDisk:v6 symbolOwnerBaseAddress:BaseAddress];
  if (v18 && *(unsigned char *)(a1 + 57))
  {
    char v9 = (id *)v18;
    objc_sync_enter(v9);
    uint64_t Range = CSRegionGetRange();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__SASegment_addInfoFromCSSegment___block_invoke;
    v28[3] = &unk_1E63F8458;
    v28[5] = Range;
    v28[6] = v11;
    v28[4] = v9;
    uint64_t v12 = (void *)MEMORY[0x1C18A6C80](v28);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __34__SASegment_addInfoFromCSSegment___block_invoke_2;
    uint64_t v26 = &unk_1E63F84A8;
    id v27 = v12;
    CSRegionForeachSymbol();
    uint64_t v13 = [v9[7] allValues];

    objc_sync_exit(v9);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          -[SAInstruction checkForNewSymbol](*(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v15);
    }
  }
}

void __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    *(void *)uu2 = 0;
    uint64_t v18 = 0;
    dyld_image_copy_uuid();
    *(void *)uu1 = 0;
    uint64_t v16 = 0;
    [*(id *)(*(void *)(a1 + 32) + 72) getUUIDBytes:uu1];
    if (!uuid_compare(uu1, uu2))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      id v4 = (char *)DyldImagePath(a2);
      if (v4)
      {
        uint64_t v5 = SANSStringForCString(v4);
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = *(void **)(v6 + 80);
        *(void *)(v6 + 80) = v5;
      }
      else
      {
        int v8 = *__error();
        char v9 = _sa_logt();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = *(_DWORD *)(a1 + 48);
          uint64_t v11 = [*(id *)(a1 + 32) debugDescription];
          v12[0] = 67109378;
          v12[1] = v10;
          __int16 v13 = 2112;
          id v14 = v11;
          _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "dyld image has no installname in [%d] for %@", (uint8_t *)v12, 0x12u);
        }
        *__error() = v8;
      }
    }
  }
}

+ (id)dataFillingQueue
{
  self;
  if (qword_1EB699168 != -1) {
    dispatch_once(&qword_1EB699168, &__block_literal_global_154);
  }
  uint64_t v0 = (void *)qword_1EB699160;
  return v0;
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_143(uint64_t a1)
{
  _CopyLoadInfosForDyldSnapshot(*(void *)(a1 + 32), *(_DWORD *)(a1 + 48), 1, *(void *)(a1 + 40), 0, 0, 0, 0);
  return dyld_process_snapshot_dispose();
}

uint64_t __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_145()
{
  CSSymbolicatorForeachSymbolOwnerAtTime();
  return CSRelease();
}

id __89__SABinary_symbolOwnerWrapperWithOptions_pid_checkExclave_additionalCSSymbolicatorFlags___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SABinary binaryWithSymbolOwner:a3 fromDisk:0];
}

- (void)gatherInfoWithDataGatheringOptions:(unint64_t)a3 pid:(int)a4
{
  char v4 = a3;
  id obj = self;
  objc_sync_enter(obj);
  char v5 = [(NSString *)obj->_path isAbsolutePath];
  if ((v4 & 4) != 0) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0 && (obj->_alreadyAttempted & 4) == 0) {
    -[SABinary findPathViaBinaryLocator](obj);
  }
  int v7 = ![(NSString *)obj->_path isAbsolutePath];
  if ((v4 & 1) == 0) {
    LOBYTE(v7) = 1;
  }
  if ((v7 & 1) == 0)
  {
    unint64_t alreadyAttempted = obj->_alreadyAttempted;
    if ((alreadyAttempted & 1) == 0)
    {
      obj->_unint64_t alreadyAttempted = alreadyAttempted | 1;
      -[SABinary gatherBundleInfo](obj);
    }
  }
  objc_sync_exit(obj);
}

- (id)addSymbolWithOffsetIntoBinary:(unint64_t)a3 length:(void *)a4 name:
{
  id v7 = a4;
  if (a1)
  {
    int v8 = a1;
    objc_sync_enter(v8);
    char v9 = -[SABinary segmentAtOffsetIntoBinary:createFakeSegmentIfNeeded:](v8, a2, 1);
    unint64_t v10 = a2 - [v9 offsetIntoBinary];
    uint64_t v11 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v9, v10);
    uint64_t v12 = v11;
    if (v11)
    {
      if ([v11 offsetIntoSegment] == v10)
      {
        if (v7)
        {
          __int16 v13 = [v12 name];

          if (!v13) {
            objc_setProperty_atomic_copy(v12, v14, v7, 24);
          }
        }
      }
      else
      {
        uint64_t v15 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);

        uint64_t v12 = (void *)v15;
      }
    }
    else
    {
      uint64_t v12 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v9, v10, a3, v7);
    }

    objc_sync_exit(v8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)symbolicateAllInstructionsWithOptions:(unint64_t)a3 pid:(int)a4
{
}

- (void)symbolicateAllInstructionsWithOptions:(int)a3 pid:(int)a4 checkExclave:(int)a5 onlyDsym:(int)a6 additionalCSSymbolicatorFlags:
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v77 = a1;
    objc_sync_enter(v77);
    if (a2 & 0x48) == 0 && (a5) {
      goto LABEL_76;
    }
    unint64_t v70 = a2 & 0x66F;
    uint64_t v71 = (unsigned __int16)v70 & ~*((void *)v77 + 4);
    if (*((unsigned char *)v77 + 65)) {
      goto LABEL_5;
    }
    if ((*((unsigned char *)v77 + 64) & 8) != 0 || !v71) {
      goto LABEL_76;
    }
    if ((*((unsigned char *)v77 + 64) & 4) == 0)
    {
LABEL_5:
      unint64_t v68 = a2;
      int v67 = a5;
      int v69 = 0;
    }
    else
    {
      if ((v71 & 0x48) == 0)
      {
LABEL_76:
        objc_sync_exit(v77);

        return;
      }
      unint64_t v68 = a2;
      int v67 = a5;
      int v69 = 1;
    }
    uint64_t v91 = 0;
    v92 = &v91;
    uint64_t v93 = 0x2020000000;
    char v94 = 1;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    char v90 = 1;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    int v83 = __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke;
    unint64_t v84 = &unk_1E63F8778;
    id v85 = &v91;
    v86 = &v87;
    int v8 = v82;
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    unint64_t v10 = (id *)v77;
    objc_sync_enter(v10);
    id obj = v10;
    id Property = v10[6];
    if (Property) {
      id Property = objc_getProperty(Property, v11, 56, 1);
    }
    id v13 = Property;
    uint64_t v14 = [v13 count];

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v15 = v10[7];
    uint64_t v17 = [v15 countByEnumeratingWithState:&v105 objects:&dest count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v106 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(id *)(*((void *)&v105 + 1) + 8 * i);
          if (v20) {
            id v20 = objc_getProperty(v20, v16, 56, 1);
          }
          id v21 = v20;
          uint64_t v22 = [v21 count];

          v14 += v22;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v105 objects:&dest count:16];
      }
      while (v17);
    }

    objc_sync_exit(obj);
    uint64_t v23 = (void *)[v9 initWithCapacity:v14];
    uint64_t v24 = obj;
    v75 = obj;
    objc_sync_enter(v75);
    uint64_t v25 = obj[6];
    if (v25)
    {
      id v26 = v25;
      objc_sync_enter(v26);
      id v28 = obj[6];
      if (v28) {
        id v28 = objc_getProperty(v28, v27, 56, 1);
      }
      id v29 = v28;
      uint64_t v30 = [v29 allValues];

      objc_sync_exit(v26);
      if (v30) {
        [v23 addObjectsFromArray:v30];
      }

      uint64_t v24 = obj;
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v31 = v24[7];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v100 objects:&dest count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v101;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v101 != v33) {
            objc_enumerationMutation(v31);
          }
          id v35 = *(id *)(*((void *)&v100 + 1) + 8 * v34);
          objc_sync_enter(v35);
          if (v35) {
            id v37 = objc_getProperty(v35, v36, 56, 1);
          }
          else {
            id v37 = 0;
          }
          id v38 = v37;
          uint64_t v39 = [v38 allValues];

          objc_sync_exit(v35);
          if (v39) {
            [v23 addObjectsFromArray:v39];
          }

          ++v34;
        }
        while (v32 != v34);
        uint64_t v40 = [v31 countByEnumeratingWithState:&v100 objects:&dest count:16];
        uint64_t v32 = v40;
      }
      while (v40);
    }

    objc_sync_exit(v75);
    char v99 = 0;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v41 = v23;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v95 objects:&v105 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v96;
LABEL_38:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v96 != v43) {
          objc_enumerationMutation(v41);
        }
        v83((uint64_t)v8, *(void *)(*((void *)&v95 + 1) + 8 * v44), &v99);
        if (v99) {
          break;
        }
        if (v42 == ++v44)
        {
          uint64_t v42 = [v41 countByEnumeratingWithState:&v95 objects:&v105 count:16];
          if (v42) {
            goto LABEL_38;
          }
          break;
        }
      }
    }

    if (*((unsigned char *)v88 + 24))
    {
      if (*((unsigned char *)v92 + 24) || (int v69 = 1, ((_BYTE)v75[8] & 8) == 0) && (v71 & 0x48) == 0)
      {
        *((unsigned char *)v77 + 65) = 0;
LABEL_75:
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);
        goto LABEL_76;
      }
    }
    *((void *)v77 + 4) = v70;
    uint64_t v45 = -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](v75, v68, a3, a4, a6);
    uint64_t v46 = (void *)v45;
    if (v45)
    {
      objc_copyStruct(&dest, (const void *)(v45 + 16), 16, 1, 0);
      if (CSIsNull())
      {
        int v55 = *__error();
        uint64_t v56 = _sa_logt();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          id v57 = [v75 debugDescription];
          uint64_t v58 = [v57 UTF8String];
          int dest = 136315138;
          uint64_t dest_4 = v58;
          _os_log_error_impl(&dword_1BF22B000, v56, OS_LOG_TYPE_ERROR, "%s: null symbol owner in symbol owner wrapper", (uint8_t *)&dest, 0xCu);
        }
        *__error() = v55;
        id v59 = [v75 debugDescription];
        char v60 = [v59 UTF8String];
        _SASetCrashLogMessage(2558, "%s: null symbol owner in symbol owner wrapper", v61, v62, v63, v64, v65, v66, v60);

        _os_crash();
        __break(1u);
      }
      *((unsigned char *)v75 + 64) |= 4u;
      if (CSSymbolOwnerIsDsym()) {
        char v47 = 8;
      }
      else {
        char v47 = 0;
      }
      *((unsigned char *)v75 + 64) = (_BYTE)v75[8] & 0xF7 | v47;
      if (v69 | v67) != 1 || (CSSymbolOwnerIsDsym())
      {
        *((unsigned char *)v77 + 65) = 0;
        if (!v75[14])
        {
          Version = (void *)CSSymbolOwnerGetVersion();
          if (Version)
          {
            uint64_t v49 = SANSStringForCString(Version);
            uint64_t v50 = v75[14];
            v75[14] = (void *)v49;
          }
        }
        -[SASegment symbolicateWithSymbolOwnerWrapper:](obj[6], v46);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v51 = obj[7];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v104 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v79;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v79 != v53) {
                objc_enumerationMutation(v51);
              }
              -[SASegment symbolicateWithSymbolOwnerWrapper:](*(void **)(*((void *)&v78 + 1) + 8 * j), v46);
            }
            uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v104 count:16];
          }
          while (v52);
        }

        goto LABEL_74;
      }
      if ((v69 | v67 ^ 1) != 1)
      {
LABEL_74:

        goto LABEL_75;
      }
    }
    else
    {
      *((unsigned char *)v75 + 64) &= 0xF3u;
    }
    *((unsigned char *)v77 + 65) = 0;
    goto LABEL_74;
  }
}

uint64_t __106__SABinary_symbolicateAllInstructionsWithOptions_pid_checkExclave_onlyDsym_additionalCSSymbolicatorFlags___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (!a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
    return result;
  }
  if (!*(void *)(a2 + 16)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  if (!*(void *)(a2 + 8)) {
    goto LABEL_7;
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)clearCoreSymbolicationCache
{
  id obj = self;
  objc_sync_enter(obj);
  symbolOwnerWrapper = obj->_symbolOwnerWrapper;
  unint64_t v3 = obj->_alreadyAttempted & 0xFFFFFFFFFFFFFF9FLL;
  obj->_symbolOwnerWrapper = 0;
  obj->_unint64_t alreadyAttempted = v3;

  objc_sync_exit(obj);
}

- (void)clearSymbolCache
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  fakeEntireBinarySegment = v2->_fakeEntireBinarySegment;
  v2->_fakeEntireBinarySegment = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = v2->_segments;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          id v9 = v8;
          objc_sync_enter(v9);
          unint64_t v10 = (void *)v9[1];
          v9[1] = 0;

          uint64_t v11 = (void *)v9[2];
          v9[2] = 0;

          uint64_t v12 = (void *)v9[7];
          v9[7] = 0;

          objc_sync_exit(v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v2->_haveMoreInstructionsToSymbolicate = 0;
  v2->_optionsWhenLastSymbolicated = 0;
  *((unsigned char *)v2 + 64) &= 0xF3u;
  [(SABinary *)v2 clearCoreSymbolicationCache];
  objc_sync_exit(v2);
}

void __28__SABinary_dataFillingQueue__block_invoke()
{
  unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.SampleAnalysis.binaryDataFilling", v0);
  uint64_t v2 = (void *)qword_1EB699160;
  qword_1EB699160 = (uint64_t)v1;
}

- (NSString)debugDescription
{
  id v17 = [NSString alloc];
  path = self->_path;
  if (!path) {
    path = self->_name;
  }
  uuid = self->_uuid;
  unint64_t length = self->_length;
  bundleIdentifier = self->_bundleIdentifier;
  bundleVersion = self->_bundleVersion;
  bundleShortVersion = self->_bundleShortVersion;
  binaryVersion = self->_binaryVersion;
  codesigningID = self->_codesigningID;
  teamID = self->_teamID;
  uint64_t v12 = [(NSMutableArray *)self->_segments count];
  long long v13 = "has";
  if (!self->_fakeEntireBinarySegment) {
    long long v13 = "no";
  }
  if (self->_symbolOwnerWrapper) {
    long long v14 = @"has";
  }
  else {
    long long v14 = @"no";
  }
  long long v15 = (void *)[v17 initWithFormat:@"%@ <%@> length 0x%llx %@ %@ %@ %@ %@ %@: %lu segments (%s fake segment), (%@ symbol owner)", path, uuid, length, bundleIdentifier, bundleVersion, bundleShortVersion, binaryVersion, codesigningID, teamID, v12, v13, v14];
  return (NSString *)v15;
}

- (unint64_t)textSegmentLength
{
  unint64_t v3 = -[SABinary segmentWithCleanName:](self, @"__TEXT_EXEC");
  if (v3
    || (-[SABinary segmentWithCleanName:](self, @"__TEXT"),
        (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v4 = [v3 length];

    return v4;
  }
  else
  {
    return [(SABinary *)self length];
  }
}

- (BOOL)hasTextExecSegment
{
  uint64_t v2 = -[SABinary segmentWithCleanName:](self, @"__TEXT_EXEC");
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)instructionAtOffsetIntoTextSegment:(unint64_t)a3
{
  uint64_t v5 = -[SABinary segmentWithCleanName:](self, @"__TEXT_EXEC");
  if (v5
    || (-[SABinary segmentWithCleanName:](self, @"__TEXT"),
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [v5 instructionAtOffsetIntoSegment:a3];
  }
  else
  {
    uint64_t v6 = [(SABinary *)self instructionAtOffsetIntoBinary:a3];
  }
  return v6;
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)binaryVersion
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)codesigningID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_codesigningID, 0);
  objc_storeStrong((id *)&self->_binaryVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_fakeEntireBinarySegment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolOwnerWrapper, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  name = self->_name;
  long long v16 = v4;
  if (name) {
    SAJSONWriteDictionaryFirstEntry(v4, @"name", name);
  }
  if ([(SABinary *)self length])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SABinary length](self, "length"));
    SAJSONWriteDictionaryEntry(v16, @"length", v6);
  }
  path = self->_path;
  if (path) {
    SAJSONWriteDictionaryEntry(v16, @"path", path);
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    SAJSONWriteDictionaryEntry(v16, @"bundleID", bundleIdentifier);
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    SAJSONWriteDictionaryEntry(v16, @"bundleVersion", bundleVersion);
  }
  bundleShortVersion = self->_bundleShortVersion;
  if (bundleShortVersion) {
    SAJSONWriteDictionaryEntry(v16, @"bundleShortVersion", bundleShortVersion);
  }
  binaryVersion = self->_binaryVersion;
  if (binaryVersion) {
    SAJSONWriteDictionaryEntry(v16, @"binaryVersion", binaryVersion);
  }
  codesigningID = self->_codesigningID;
  if (codesigningID) {
    SAJSONWriteDictionaryEntry(v16, @"codesigningID", codesigningID);
  }
  teamID = self->_teamID;
  if (teamID) {
    SAJSONWriteDictionaryEntry(v16, @"teamID", teamID);
  }
  uint64_t v14 = [(NSMutableArray *)self->_segments count];
  long long v15 = v16;
  if (v14)
  {
    [v16 appendString:@",\"segments\":"];
    SAJSONWriteArray(v16, self->_segments);
    long long v15 = v16;
  }
}

+ (id)classDictionaryKey
{
  return @"SABinary";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * [(NSMutableArray *)self->_segments count] + 93;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SABinary *)self sizeInBytesForSerializedVersion] > a4)
  {
    int v14 = *__error();
    long long v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [(SABinary *)self debugDescription];
      uint64_t v17 = [v16 UTF8String];
      uint64_t v5 = [(SABinary *)self sizeInBytesForSerializedVersion];
      uint64_t v18 = [(NSMutableArray *)self->_segments count];
      *(_DWORD *)long long buf = 136315906;
      uint64_t v52 = v17;
      __int16 v53 = 2048;
      *(void *)uint64_t v54 = v5;
      *(_WORD *)&v54[8] = 2048;
      *(void *)&v54[10] = v18;
      *(_WORD *)&v54[18] = 2048;
      *(void *)&v54[20] = a4;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "%s: size %lu (%lu segments) > buffer length %lu", buf, 0x2Au);
    }
    *__error() = v14;
    id v19 = [(SABinary *)self debugDescription];
    char v20 = [v19 UTF8String];
    [(SABinary *)self sizeInBytesForSerializedVersion];
    [(NSMutableArray *)self->_segments count];
    _SASetCrashLogMessage(4708, "%s: size %lu (%lu segments) > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  *(_WORD *)&a3->var0 = 769;
  *(void *)&a3->var2[16] = [(SABinary *)self length];
  if ([(NSMutableArray *)self->_segments count] == 1)
  {
    unint64_t v10 = -[SABinary segmentWithCleanName:](self, @"__TEXT_EXEC");

    if (v10) {
      BYTE2(a3->var9) |= 1u;
    }
  }
  [(NSUUID *)self->_uuid getUUIDBytes:a3->var2];
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v9);
  *(unint64_t *)((char *)&a3->var4 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_path, v9);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleIdentifier, v9);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleVersion, v9);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_bundleShortVersion, v9);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_binaryVersion, v9);
  if ((unint64_t)[(NSMutableArray *)self->_segments count] >= 0xFFFF)
  {
LABEL_11:
    int v27 = *__error();
    _sa_logt();
    a3 = ($AA4C3D0BC6B134C2DB58CAEA44E8AB07 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      id v28 = [(SABinary *)self debugDescription];
      uint64_t v29 = [v28 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v52 = v29;
      __int16 v53 = 1024;
      *(_DWORD *)uint64_t v54 = 0xFFFF;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "%s: more than %d segments", buf, 0x12u);
    }
    *__error() = v27;
    self = [(SABinary *)self debugDescription];
    char v30 = [(SABinary *)self UTF8String];
    _SASetCrashLogMessage(4728, "%s: more than %d segments", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
LABEL_14:
    int v37 = *__error();
    id v38 = _sa_logt();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(SABinary *)self debugDescription];
      uint64_t v40 = [v39 UTF8String];
      int v41 = *(unsigned __int16 *)((char *)&a3->var9 + 3);
      unint64_t v42 = [(SABinary *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)long long buf = 136315906;
      uint64_t v52 = v40;
      __int16 v53 = 1024;
      *(_DWORD *)uint64_t v54 = v41;
      *(_WORD *)&v54[4] = 2048;
      *(void *)&v54[6] = v5;
      *(_WORD *)&v54[14] = 2048;
      *(void *)&v54[16] = v42;
      _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "%s: after serializing with %u segments, ended with length %ld, should be %lu", buf, 0x26u);
    }
    *__error() = v37;
    id v43 = [(SABinary *)self debugDescription];
    char v44 = [v43 UTF8String];
    [(SABinary *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(4735, "%s: after serializing with %u segments, ended with length %ld, should be %lu", v45, v46, v47, v48, v49, v50, v44);

    _os_crash();
    __break(1u);
  }
  unsigned __int16 v11 = [(NSMutableArray *)self->_segments count];
  *(_WORD *)((char *)&a3->var9 + 3) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var9 + 5, v11, self->_segments, v9);
  uint64_t v12 = (uint64_t *)((char *)&a3->var9 + 8 * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 5);
  uint64_t v5 = 8 * *(unsigned __int16 *)((char *)&a3->var9 + 3) + 93;
  if (v5 != [(SABinary *)self sizeInBytesForSerializedVersion]) {
    goto LABEL_14;
  }
  uint64_t *v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_codesigningID, v9);
  v12[1] = SASerializableIndexForPointerFromSerializationDictionary(self->_teamID, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    [(NSString *)self->_name addSelfToSerializationDictionary:v4];
    [(NSString *)self->_path addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleIdentifier addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleVersion addSelfToSerializationDictionary:v4];
    [(NSString *)self->_bundleShortVersion addSelfToSerializationDictionary:v4];
    [(NSString *)self->_binaryVersion addSelfToSerializationDictionary:v4];
    [(NSString *)self->_codesigningID addSelfToSerializationDictionary:v4];
    [(NSString *)self->_teamID addSelfToSerializationDictionary:v4];
    [(SASegment *)self->_fakeEntireBinarySegment addSelfToSerializationDictionary:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_segments;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  int v4 = *__error();
  uint64_t v5 = _sa_logt();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v13 = 0;
    _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "Called without dict/buff though it's defined", v13, 2u);
  }

  *__error() = v4;
  _SASetCrashLogMessage(4763, "Called without dict/buff though it's defined", v6, v7, v8, v9, v10, v11, v13[0]);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_28;
  }
  if (a4 <= 0x4A)
  {
    int v27 = *__error();
    id v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v37 = a4;
      __int16 v38 = 2048;
      uint64_t v39 = 75;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(4771, "bufferLength %lu < serialized SABinary struct %lu", v29, v30, v31, v32, v33, v34, a4);
    _os_crash();
    __break(1u);
LABEL_28:
    id v35 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SABinary version" userInfo:0];
    objc_exception_throw(v35);
  }
  uint64_t v11 = v10;
  long long v12 = uuidForBytes((uint64_t)a3 + 2);
  unint64_t v13 = *(void *)((char *)a3 + 34);
  long long v14 = objc_opt_class();
  long long v15 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v11, v14, 1);
  if (*(uint64_t *)gSASerializationEncodedVersionBeingDecoded() < 31)
  {
    uint64_t v18 = +[SABinary binaryWithUUID:v12 absolutePath:0];
    uint64_t v17 = v18;
    if (v15)
    {
      id v19 = [v18 path];

      if (!v19) {
        [v17 addPath:v15];
      }
    }
  }
  else
  {
    if ([v15 isAbsolutePath]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = +[SABinary binaryWithUUID:v12 absolutePath:v16];
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    if (*((unsigned char *)a3 + 74)) {
      uint64_t v21 = @"__TEXT_EXEC";
    }
    else {
      uint64_t v21 = @"__TEXT";
    }
    uint64_t v22 = v21;
    uint64_t v23 = -[SABinary segmentWithCleanName:](v17, v22);
    if (v23)
    {
      uint64_t v24 = v23;
      if (![v23 length])
      {
        unint64_t v25 = *(void *)((char *)a3 + 18);
        if (v25) {
          -[SASegment setLength:](v24, v25);
        }
      }
    }
    else
    {
      uint64_t v24 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v17, v22, *(void *)((char *)a3 + 18));
      -[SABinary addSegment:](v17, v24);
    }
  }
  else if (![v17 length])
  {
    unint64_t v20 = *(void *)((char *)a3 + 18);
    if (v20) {
      -[SABinary setLength:](v17, v20);
    }
  }

  return v17;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_58;
  }
  if (a4 <= 0x4A)
  {
    int v55 = *__error();
    uint64_t v56 = _sa_logt();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v107 = a4;
      __int16 v108 = 2048;
      *(void *)uint64_t v109 = 75;
      _os_log_error_impl(&dword_1BF22B000, v56, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v55;
    _SASetCrashLogMessage(4817, "bufferLength %lu < serialized SABinary struct %lu", v57, v58, v59, v60, v61, v62, a4);
    _os_crash();
    __break(1u);
    goto LABEL_46;
  }
  long long v14 = v13;
  unint64_t v15 = *(void *)((char *)a3 + 34);
  id v16 = objc_opt_class();
  uint64_t v17 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v12, v14, v16, 0);
  unint64_t p_path = (unint64_t)&self->_path;
  path = self->_path;
  if (path)
  {
    if (v17 && ![(NSString *)path isEqualToString:v17])
    {
      uint64_t v19 = *(void *)gSASerializationEncodedVersionBeingDecoded();
      int v20 = *__error();
      uint64_t v21 = _sa_logt();
      uint64_t v22 = v21;
      if (v19 < 31)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [(SABinary *)self debugDescription];
          *(_DWORD *)long long buf = 138412546;
          unint64_t v107 = (unint64_t)v17;
          __int16 v108 = 2112;
          *(void *)uint64_t v109 = v23;
          _os_log_error_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_ERROR, "Decoded SABinary path %@ doesn't match %@, not filling in bundle/codesign info", buf, 0x16u);
          goto LABEL_42;
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = [(SABinary *)self debugDescription];
        *(_DWORD *)long long buf = 138412546;
        unint64_t v107 = (unint64_t)v17;
        __int16 v108 = 2112;
        *(void *)uint64_t v109 = v23;
        _os_log_fault_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_FAULT, "Decoded SABinary path %@ doesn't match %@", buf, 0x16u);
LABEL_42:
      }
      *__error() = v20;
      goto LABEL_40;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_path, v17);
  }
  if (!self->_name && !*(void *)p_path)
  {
    unint64_t v24 = *(void *)((char *)a3 + 26);
    unint64_t v25 = objc_opt_class();
    uint64_t v26 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v12, v14, v25, 0);
    unint64_t p_path = (unint64_t)v26;
    if (v26)
    {
      int v27 = (NSString *)[v26 copy];
      name = self->_name;
      self->_name = v27;
    }
  }
  if (!self->_bundleIdentifier)
  {
    unint64_t p_path = *(void *)((char *)a3 + 42);
    uint64_t v29 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v29, 0);
    uint64_t v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v30;
  }
  if (!self->_bundleVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 50);
    uint64_t v32 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v32, 0);
    uint64_t v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleVersion = self->_bundleVersion;
    self->_bundleVersion = v33;
  }
  if (!self->_bundleShortVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 58);
    id v35 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v35, 0);
    uint64_t v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleShortVersion = self->_bundleShortVersion;
    self->_bundleShortVersion = v36;
  }
  if (!self->_binaryVersion)
  {
    unint64_t p_path = *(void *)((char *)a3 + 66);
    __int16 v38 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(p_path, v12, v14, v38, 0);
    uint64_t v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    binaryVersion = self->_binaryVersion;
    self->_binaryVersion = v39;
  }
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 > 0x4C)
    {
      unint64_t p_path = *(unsigned __int16 *)((char *)a3 + 75);
      uint64_t v41 = 8 * p_path;
      unint64_t v7 = 8 * p_path + 77;
      if (v7 <= a4)
      {
        unint64_t v105 = a4;
        unint64_t v42 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
        if (*v42 <= 30) {
          *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = self;
        }
        id v43 = objc_opt_class();
        unint64_t p_path = SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 77, p_path, v12, v14, v43);
        if (*v42 <= 30) {
          *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
        }
        unint64_t v44 = [(NSMutableArray *)self->_segments count];
        if (v44 >= [(id)p_path count])
        {
          if (*((unsigned __int8 *)a3 + 1) < 3u)
          {
LABEL_37:

            goto LABEL_40;
          }
          unint64_t v45 = v105;
          if (v41 + 93 <= v105)
          {
            uint64_t v46 = (unint64_t *)((char *)a3 + 8 * *(unsigned __int16 *)((char *)a3 + 75) + 77);
            if (!self->_codesigningID)
            {
              unint64_t v47 = *v46;
              uint64_t v48 = objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v47, v12, v14, v48, 0);
              uint64_t v49 = (NSString *)objc_claimAutoreleasedReturnValue();
              codesigningID = self->_codesigningID;
              self->_codesigningID = v49;
            }
            if (!self->_teamID)
            {
              unint64_t v51 = v46[1];
              uint64_t v52 = objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v51, v12, v14, v52, 0);
              __int16 v53 = (NSString *)objc_claimAutoreleasedReturnValue();
              teamID = self->_teamID;
              self->_teamID = v53;
            }
            goto LABEL_37;
          }
          goto LABEL_55;
        }
LABEL_52:
        unint64_t v45 = *__error();
        long long v79 = _sa_logt();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          id v80 = [(SABinary *)self debugDescription];
          uint64_t v81 = [v80 UTF8String];
          id v82 = [(NSMutableArray *)self->_segments debugDescription];
          a3 = (const void *)[v82 UTF8String];
          id v83 = [(id)p_path debugDescription];
          uint64_t v84 = [v83 UTF8String];
          *(_DWORD *)long long buf = 136315650;
          unint64_t v107 = v81;
          __int16 v108 = 2080;
          *(void *)uint64_t v109 = a3;
          *(_WORD *)&v109[8] = 2080;
          *(void *)&v109[10] = v84;
          _os_log_error_impl(&dword_1BF22B000, v79, OS_LOG_TYPE_ERROR, "Binary %s segments not added after deserializing segments: %s vs\n%s", buf, 0x20u);
        }
        *__error() = v45;
        id v85 = [(SABinary *)self debugDescription];
        char v86 = [v85 UTF8String];
        id v87 = [(NSMutableArray *)self->_segments debugDescription];
        [v87 UTF8String];
        id v88 = [(id)p_path debugDescription];
        [v88 UTF8String];
        _SASetCrashLogMessage(4869, "Binary %s segments not added after deserializing segments: %s vs\n%s", v89, v90, v91, v92, v93, v94, v86);

        _os_crash();
        __break(1u);
LABEL_55:
        int v95 = *__error();
        long long v96 = _sa_logt();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          int v97 = *(unsigned __int16 *)((char *)a3 + 75);
          *(_DWORD *)long long buf = 134218240;
          unint64_t v107 = v45;
          __int16 v108 = 1024;
          *(_DWORD *)uint64_t v109 = v97;
          _os_log_error_impl(&dword_1BF22B000, v96, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct v3 with %u segments", buf, 0x12u);
        }

        *__error() = v95;
        _SASetCrashLogMessage(4874, "bufferLength %lu < serialized SABinary struct v3 with %u segments", v98, v99, v100, v101, v102, v103, v45);
        _os_crash();
        __break(1u);
LABEL_58:
        id v104 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SABinary version" userInfo:0];
        objc_exception_throw(v104);
      }
LABEL_49:
      int v71 = *__error();
      _sa_logt();
      self = (SABinary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
      {
        int v72 = *(unsigned __int16 *)((char *)a3 + 75);
        *(_DWORD *)long long buf = 134218496;
        unint64_t v107 = a4;
        __int16 v108 = 1024;
        *(_DWORD *)uint64_t v109 = v72;
        *(_WORD *)&v109[4] = 2048;
        *(void *)&v109[6] = v7;
        _os_log_error_impl(&dword_1BF22B000, &self->super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct plus %u segments %llu", buf, 0x1Cu);
      }

      *__error() = v71;
      _SASetCrashLogMessage(4859, "bufferLength %lu < serialized SABinary struct plus %u segments %llu", v73, v74, v75, v76, v77, v78, a4);
      _os_crash();
      __break(1u);
      goto LABEL_52;
    }
LABEL_46:
    int v63 = *__error();
    uint64_t v64 = _sa_logt();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v107 = a4;
      __int16 v108 = 2048;
      *(void *)uint64_t v109 = 77;
      _os_log_error_impl(&dword_1BF22B000, v64, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinary struct %lu", buf, 0x16u);
    }

    *__error() = v63;
    _SASetCrashLogMessage(4856, "bufferLength %lu < serialized SABinary struct %lu", v65, v66, v67, v68, v69, v70, a4);
    _os_crash();
    __break(1u);
    goto LABEL_49;
  }
LABEL_40:
}

@end