@interface SABinaryLoadInfo
+ (id)addBinaryLoadInfoForDyldImage:(void *)a3 toLoadInfos:(int)a4 isKernel:(int)a5 dataGatheringOptions:;
+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4;
+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4 libraryCache:(id)a5;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4;
+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
+ (id)binaryLoadInfoForSymbolicator:(uint64_t)a1 isKernel:(uint64_t)a2 dataGatheringOptions:(uint64_t)a3 excludeRange:(uint64_t)a4 ignoreSharedCache:(char)a5;
+ (id)binaryLoadInfoWithBinary:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)binaryLoadInfoWithSegment:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)classDictionaryKey;
+ (id)loadInfosForSegmentsInBinary:(uint64_t)a3 binaryBaseAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:(uint64_t)a1;
+ (void)sortBinaryLoadInfos:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isInKernelAddressSpace;
- (NSString)debugDescription;
- (SABinary)binary;
- (SABinaryLoadInfo)initWithBinary:(id)a3 segment:(id)a4 loadAddress:(unint64_t)a5;
- (SAExclave)exclave;
- (SASegment)segment;
- (id)instructionAtOffsetIntoLoadInfo:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)loadAddress;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)textSegmentLoadAddress;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedImageInfo:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SABinaryLoadInfo

- (id)instructionAtOffsetIntoLoadInfo:(unint64_t)a3
{
  segment = self->_segment;
  if (segment) {
    [(SASegment *)segment instructionAtOffsetIntoSegment:a3];
  }
  else {
  v5 = [(SABinary *)self->_binary instructionAtOffsetIntoBinary:a3];
  }
  return v5;
}

- (SASegment)segment
{
  return (SASegment *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)loadAddress
{
  return self->_loadAddress;
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4 libraryCache:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (!v8)
  {
    v12 = 0;
    if (!v7) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  v10 = [v8 binaryLoadInfos];
  if (!v10)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  unint64_t v11 = [v9 startAddress];
  v12 = 0;
  if (v11 != -1 && v11 <= a3)
  {
    if ([v9 endAddress] > a3)
    {
      v12 = +[SABinaryLoadInfo binaryLoadInfoForAddress:a3 inBinaryLoadInfos:v10];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  if (!v7) {
    goto LABEL_18;
  }
LABEL_11:
  if (!v12)
  {
    uint64_t v13 = +[SABinaryLoadInfo binaryLoadInfoForAddress:a3 inBinaryLoadInfos:v7];
    v12 = (void *)v13;
    if (v9)
    {
      if (v13)
      {
        if ([v9 startAddress] != -1)
        {
          unint64_t v14 = [v12 loadAddress];
          if (v14 < [v9 startAddress] && objc_msgSend(v9, "startAddress") <= a3)
          {

            v12 = 0;
          }
        }
      }
    }
  }
LABEL_18:

  return v12;
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4
{
  id v5 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke;
  v14[3] = &__block_descriptor_40_e26_q16__0__SABinaryLoadInfo_8l;
  v14[4] = a3;
  uint64_t v6 = SABinarySearchArray(v5, 1536, (uint64_t)v14);
  if (v6)
  {
    id v7 = [v5 objectAtIndexedSubscript:v6 - 1];
    id v8 = [v7 segment];
    uint64_t v9 = [v8 length];
    if (!v9)
    {
      v10 = [v7 binary];
      uint64_t v11 = [v10 length];
      if (v11) {
        uint64_t v9 = v11;
      }
      else {
        uint64_t v9 = 0x10000000;
      }
    }
    if ([v7 loadAddress] + v9 <= a3) {
      id v12 = 0;
    }
    else {
      id v12 = v7;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 loadAddress];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = v4 >= v3;
  BOOL v6 = v4 > v3;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (SABinary)binary
{
  return (SABinary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
  objc_storeStrong((id *)&self->_binary, 0);
}

- (SABinaryLoadInfo)initWithBinary:(id)a3 segment:(id)a4 loadAddress:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SABinaryLoadInfo;
  uint64_t v11 = [(SABinaryLoadInfo *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_binary, a3);
    objc_storeStrong((id *)&v12->_segment, a4);
    v12->_loadAddress = a5;
  }

  return v12;
}

+ (id)binaryLoadInfoWithSegment:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  self;
  uint64_t v11 = [v9 binary];
  if (!v11)
  {
    int v16 = *__error();
    id v10 = _sa_logt();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      a1 = [v9 debugDescription];
      *(_DWORD *)buf = 136315138;
      uint64_t v43 = [a1 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_ERROR, "Getting a load info for segment %s when the binary has already been deallcoated", buf, 0xCu);
    }
    *__error() = v16;
    id v9 = [v9 debugDescription];
    char v17 = [v9 UTF8String];
    _SASetCrashLogMessage(2803, "Getting a load info for segment %s when the binary has already been deallcoated", v18, v19, v20, v21, v22, v23, v17);

    _os_crash();
    __break(1u);
LABEL_16:
    int v24 = *__error();
    v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [a1 debugDescription];
      uint64_t v27 = [v26 UTF8String];
      id v28 = [v9 debugDescription];
      uint64_t v29 = [v28 UTF8String];
      id v30 = [v10 debugDescription];
      uint64_t v31 = [v30 UTF8String];
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = v27;
      __int16 v44 = 2080;
      uint64_t v45 = v29;
      __int16 v46 = 2080;
      uint64_t v47 = v31;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "%s segment %s has exclave %s in user space", buf, 0x20u);
    }
    *__error() = v24;
    id v32 = [a1 debugDescription];
    char v33 = [v32 UTF8String];
    id v34 = [v9 debugDescription];
    [v34 UTF8String];
    id v35 = [v10 debugDescription];
    [v35 UTF8String];
    _SASetCrashLogMessage(2804, "%s segment %s has exclave %s in user space", v36, v37, v38, v39, v40, v41, v33);

    _os_crash();
    __break(1u);
  }
  a1 = (id)v11;
  if (v10 && (a4 & 1) == 0) {
    goto LABEL_16;
  }
  if (a4)
  {
    if (v10)
    {
      id v12 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]([SAExclaveBinaryLoadInfo alloc], v11, (uint64_t)v9, a3, v10);
      goto LABEL_10;
    }
    uint64_t v13 = SAKernelBinaryLoadInfo;
  }
  else
  {
    uint64_t v13 = SAUserBinaryLoadInfo;
  }
  id v12 = (id *)[[v13 alloc] initWithBinary:a1 segment:v9 loadAddress:a3];
LABEL_10:
  objc_super v14 = v12;

  return v14;
}

+ (id)binaryLoadInfoWithBinary:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  self;
  if (v9 && (a4 & 1) == 0)
  {
    int v14 = *__error();
    v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 debugDescription];
      uint64_t v17 = [v16 UTF8String];
      id v18 = [v9 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = v17;
      __int16 v30 = 2080;
      uint64_t v31 = [v18 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "%s has exclave %s in user space", buf, 0x16u);
    }
    *__error() = v14;
    id v19 = [v8 debugDescription];
    char v20 = [v19 UTF8String];
    id v21 = [v9 debugDescription];
    [v21 UTF8String];
    _SASetCrashLogMessage(2819, "%s has exclave %s in user space", v22, v23, v24, v25, v26, v27, v20);

    _os_crash();
    __break(1u);
  }
  if (a4)
  {
    if (v9)
    {
      id v10 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]([SAExclaveBinaryLoadInfo alloc], (uint64_t)v8, 0, a3, v9);
      goto LABEL_9;
    }
    uint64_t v11 = SAKernelBinaryLoadInfo;
  }
  else
  {
    uint64_t v11 = SAUserBinaryLoadInfo;
  }
  id v10 = (id *)[[v11 alloc] initWithBinary:v8 segment:0 loadAddress:a3];
LABEL_9:
  id v12 = v10;

  return v12;
}

- (unint64_t)length
{
  segment = self->_segment;
  if (!segment) {
    segment = self->_binary;
  }
  return [segment length];
}

- (BOOL)isInKernelAddressSpace
{
  return 0;
}

- (SAExclave)exclave
{
  return 0;
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3
{
  return (id)[a1 binaryLoadInfoForLiveProcessWithPid:*(void *)&a3 dataGatheringOptions:1026 additionalCSSymbolicatorFlags:0];
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4
{
  return (id)[a1 binaryLoadInfoForLiveProcessWithPid:*(void *)&a3 dataGatheringOptions:a4 additionalCSSymbolicatorFlags:0];
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  if ((a4 & 2) != 0 && (!a3 || (a4 & 0x400) != 0))
  {
    v9[1] = v5;
    uint64_t v10 = v6;
    v9[0] = 0;
    CopyLoadInfosForLiveProcess(*(BOOL *)&a3, a4, v9, 0, 0, 0, 0, a5);
    id v7 = v9[0];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (id)binaryLoadInfoForSymbolicator:(uint64_t)a1 isKernel:(uint64_t)a2 dataGatheringOptions:(uint64_t)a3 excludeRange:(uint64_t)a4 ignoreSharedCache:(char)a5
{
  char v5 = ~a5;
  uint64_t v6 = self;
  id v7 = (void *)MEMORY[0x1C18A6A20](v6);
  if ((v5 & 5) != 0) {
    id v8 = 0;
  }
  else {
    id v8 = +[SABinaryLocator sharedBinaryLocator];
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v10 = v8;
  id v11 = v9;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  [v10 done];
  +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v11);
  id v12 = (void *)[v11 copy];

  return v12;
}

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 64) || (CSSymbolOwnerIsDyldSharedCache() & 1) == 0)
  {
    v18[0] = 0;
    v18[1] = 0;
    BOOL IsContiguous = SASymbolOwnerIsContiguous(a2, a3, v18, 0);
    if ((CSRangeContainsRange() & 1) == 0)
    {
      id v7 = +[SABinary binaryWithSymbolOwner:a3 fromDisk:IsContiguous];
      id v8 = v7;
      if (v7)
      {
        if (IsContiguous)
        {
          uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
          id v10 = +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v8, BaseAddress, *(unsigned __int8 *)(a1 + 65), 0);
          [*(id *)(a1 + 32) addObject:v10];
        }
        else
        {
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2;
          v11[3] = &unk_1E63F87C0;
          long long v14 = *(_OWORD *)(a1 + 48);
          id v12 = v7;
          uint64_t v15 = a2;
          uint64_t v16 = a3;
          char v17 = *(unsigned char *)(a1 + 65);
          id v13 = *(id *)(a1 + 32);
          SASymbolOwnerForeachSegment(a2, a3, v11);

          id v10 = v12;
        }

        if (*(void *)(a1 + 40))
        {
          if ((CSSymbolOwnerIsDsym() & 1) == 0) {
            -[SABinaryLocator addURLForSymbolOwner:](*(unsigned char **)(a1 + 40));
          }
        }
      }
    }
  }
}

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CSRegionGetRange();
  if ((CSRangeIntersectsRange() & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
    id v10 = [(SABinary *)v6 segmentWithCSSegment:a3 symbolOwnerLayoutMatchesDisk:0 symbolOwnerBaseAddress:BaseAddress];
    uint64_t Range = CSRegionGetRange();
    id v9 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v10, Range, *(unsigned __int8 *)(a1 + 80), 0);
    [*(id *)(a1 + 40) addObject:v9];
  }
}

+ (void)sortBinaryLoadInfos:(uint64_t)a1
{
  id v2 = a2;
  self;
  [v2 sortUsingComparator:&__block_literal_global_361];
}

+ (id)addBinaryLoadInfoForDyldImage:(void *)a3 toLoadInfos:(int)a4 isKernel:(int)a5 dataGatheringOptions:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = (void *)MEMORY[0x1C18A6A20](v9);
  id v11 = +[SABinary binaryForDyldImage:options:]((uint64_t)SABinary, a2, a5);
  id v12 = v11;
  if (v11)
  {
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = -1;
    uint64_t v43 = 0;
    __int16 v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = -1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke;
    v29[3] = &unk_1E63F8678;
    id v13 = v11;
    id v30 = v13;
    uint64_t v31 = &v43;
    uint64_t v32 = &v47;
    char v33 = &v39;
    id v34 = &v35;
    int v14 = DyldImageEnumerateSegments(a2, v29);
    if (v14 < 0 || (v15 = v36[3], v15 == -1) || !v15 || (uint64_t v16 = v48[3], (unint64_t)(v16 + 1) <= 1))
    {
      int v17 = *__error();
      id v18 = _sa_logt();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [v13 debugDescription];
        uint64_t v23 = v36[3];
        uint64_t v24 = v48[3];
        *(_DWORD *)buf = 138413058;
        v52 = v22;
        __int16 v53 = 2048;
        uint64_t v54 = v23;
        __int16 v55 = 2048;
        uint64_t v56 = v24;
        __int16 v57 = 1024;
        int v58 = v14;
        _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "Bad segments in dyld image for %@: imageTextStartAddress:%llu, imageStartAddress:%llu, ret %d", buf, 0x26u);
      }
      id v19 = 0;
      *__error() = v17;
    }
    else
    {
      if (v15 == v16 && v44[3] - v15 == v40[3])
      {
        id v21 = +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v13, v15, a4, 0);
        [v8 addObject:v21];
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_358;
        v25[3] = &unk_1E63F8810;
        id v26 = v13;
        char v28 = a4;
        id v27 = v8;
        DyldImageEnumerateSegments(a2, v25);

        id v21 = v26;
      }

      id v19 = v13;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

uint64_t __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke(uint64_t a1, char *__s1, unint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v8 = *__error();
    uint64_t v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 32) debugDescription];
      int v14 = 136315650;
      uint64_t v15 = __s1;
      __int16 v16 = 2048;
      uint64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "Segment %s load address is 0 (length 0x%llx) for %@", (uint8_t *)&v14, 0x20u);
    }
    *__error() = v8;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v10 + 24) < a4 + a3) {
    *(void *)(v10 + 24) = a4 + a3;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(void *)(v11 + 24) > a3) {
    *(void *)(v11 + 24) = a3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a4;
  uint64_t result = strcmp(__s1, "__TEXT");
  if (!result) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  }
  return result;
}

void __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_358(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = SANSStringForCString(a2);
  int v8 = CopyCleanSegmentName(v7);
  uint64_t v9 = -[SABinary segmentWithCleanName:](v6, v8);

  if (v9)
  {
    uint64_t v10 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v9, a3, *(unsigned __int8 *)(a1 + 48), 0);
    [*(id *)(a1 + 40) addObject:v10];
  }
  else
  {
    int v11 = *__error();
    id v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v13 = [*(id *)(a1 + 32) debugDescription];
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2082;
      uint64_t v17 = a2;
      _os_log_fault_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_FAULT, "%@: No segment for %{public}s", (uint8_t *)&v14, 0x16u);
    }
    *__error() = v11;
  }
}

+ (id)loadInfosForSegmentsInBinary:(uint64_t)a3 binaryBaseAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  self;
  uint64_t v20 = v8;
  uint64_t v10 = [v8 segments];
  int v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 hasOffsetIntoBinary])
        {
          uint64_t v18 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v17, [v17 offsetIntoBinary] + a3, a4, v9);
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  return v11;
}

uint64_t __40__SABinaryLoadInfo_sortBinaryLoadInfos___block_invoke(uint64_t a1, void *a2, void *a3)
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
  BOOL v4 = [(SABinaryLoadInfo *)self isInKernelAddressSpace];
  segment = self->_segment;
  unint64_t loadAddress = self->_loadAddress;
  if (!segment) {
    segment = self->_binary;
  }
  uint64_t v7 = [segment debugDescription];
  unint64_t v8 = (void *)v7;
  id v9 = @" ";
  if (v4) {
    id v9 = @"*";
  }
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@0x%llx: %@", v9, loadAddress, v7];

  return (NSString *)v10;
}

- (unint64_t)textSegmentLoadAddress
{
  if (self->_segment) {
    return self->_loadAddress;
  }
  id v3 = -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT_EXEC");
  if (!v3
    && (-[SABinary segmentWithCleanName:](self->_binary, @"__TEXT"),
        (id v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([v3 hasOffsetIntoBinary] & 1) == 0)
  {

    return self->_loadAddress;
  }
  unint64_t loadAddress = self->_loadAddress;
  unint64_t v5 = [v3 offsetIntoBinary] + loadAddress;

  return v5;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(SABinary *)self->_binary uuid];
  unint64_t v5 = [v4 UUIDString];
  SAJSONWriteDictionaryFirstEntry(v20, @"binary", v5);

  segment = self->_segment;
  if (segment)
  {
    uint64_t v7 = [(SASegment *)segment name];
    SAJSONWriteDictionaryEntry(v20, @"segment", v7);
  }
  unint64_t v8 = [NSNumber numberWithUnsignedLongLong:self->_loadAddress];
  SAJSONWriteDictionaryEntry(v20, @"loadAddress", v8);

  if ([(SABinaryLoadInfo *)self isInKernelAddressSpace])
  {
    SAJSONWriteDictionaryEntry(v20, @"isInKernelAddressSpace", MEMORY[0x1E4F1CC38]);
    id v9 = [(SABinaryLoadInfo *)self exclave];

    if (v9)
    {
      uint64_t v10 = [(SABinaryLoadInfo *)self exclave];
      int v11 = [v10 name];
      if (v11)
      {
        SAJSONWriteDictionaryEntry(v20, @"exclave", v11);
      }
      else
      {
        id v12 = NSNumber;
        uint64_t v13 = [(SABinaryLoadInfo *)self exclave];
        uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "identifier"));
        SAJSONWriteDictionaryEntry(v20, @"exclave", v14);
      }
    }
  }
  uint64_t v15 = [(SABinary *)self->_binary path];
  if (v15)
  {
    __int16 v16 = (void *)v15;
    uint64_t v17 = [(SABinary *)self->_binary uuid];
    int v18 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)SABinary, v17);

    if (v18)
    {
      id v19 = [(SABinary *)self->_binary path];
      SAJSONWriteDictionaryEntry(v20, @"binaryPath", v19);
    }
  }
}

+ (id)classDictionaryKey
{
  return @"SABinaryLoadInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 35;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SABinaryLoadInfo *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v11 = *__error();
    id v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SABinaryLoadInfo *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v13 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = [(SABinaryLoadInfo *)self sizeInBytesForSerializedVersion];
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v11;
    id v14 = [(SABinaryLoadInfo *)self debugDescription];
    char v15 = [v14 UTF8String];
    [(SABinaryLoadInfo *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5093, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 769;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_loadAddress;
  BYTE2(a3->var3) = BYTE2(a3->var3) & 0xFE | [(SABinaryLoadInfo *)self isInKernelAddressSpace];
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_binary, v8);
  *(unint64_t *)((char *)&a3->var3 + 3) = SASerializableIndexForPointerFromSerializationDictionary(self->_segment, v8);
  id v9 = [(SABinaryLoadInfo *)self exclave];
  *(void *)((char *)&a3->var4.var1 + 3) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    [(SABinary *)self->_binary addSelfToSerializationDictionary:v7];
    [(SASegment *)self->_segment addSelfToSerializationDictionary:v7];
    unint64_t v6 = [(SABinaryLoadInfo *)self exclave];
    [v6 addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_13;
  }
  if (a4 <= 0x12)
  {
    int v8 = *__error();
    id v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v18 = a4;
      __int16 v19 = 2048;
      uint64_t v20 = 19;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5123, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    id v16 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SABinaryLoadInfo version" userInfo:0];
    objc_exception_throw(v16);
  }
  if (*((unsigned char *)a3 + 18))
  {
    if (*((unsigned __int8 *)a3 + 1) < 3u || *(void *)((char *)a3 + 27) == -1) {
      unint64_t v6 = off_1E63F6D88;
    }
    else {
      unint64_t v6 = off_1E63F6D38;
    }
  }
  else
  {
    unint64_t v6 = off_1E63F6E68;
  }
  id result = objc_alloc_init(*v6);
  *((void *)result + 3) = *(void *)((char *)a3 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v55 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_29;
  }
  if (a4 <= 0x12)
  {
    int v30 = *__error();
    uint64_t v31 = _sa_logt();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 19;
      _os_log_error_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", buf, 0x16u);
    }

    *__error() = v30;
    _SASetCrashLogMessage(5144, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", v32, v33, v34, v35, v36, v37, a4);
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v55, v11, v13);
  uint64_t v14 = (SABinary *)objc_claimAutoreleasedReturnValue();
  binary = self->_binary;
  self->_binary = v14;

  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    uint64_t v23 = -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT_EXEC");
    __int16 v24 = v23;
    if (v23)
    {
      unint64_t v25 = v23;
    }
    else
    {
      -[SABinary segmentWithCleanName:](self->_binary, @"__TEXT");
      unint64_t v25 = (SASegment *)objc_claimAutoreleasedReturnValue();
    }
    segment = self->_segment;
    self->_segment = v25;

    goto LABEL_13;
  }
  if (a4 <= 0x1A)
  {
LABEL_23:
    int v38 = *__error();
    uint64_t v39 = _sa_logt();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 27;
      _os_log_error_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu", buf, 0x16u);
    }

    *__error() = v38;
    _SASetCrashLogMessage(5150, "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu", v40, v41, v42, v43, v44, v45, a4);
    _os_crash();
    __break(1u);
LABEL_26:
    int v46 = *__error();
    uint64_t v47 = _sa_logt();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v57 = a4;
      __int16 v58 = 2048;
      uint64_t v59 = 35;
      _os_log_error_impl(&dword_1BF22B000, v47, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu", buf, 0x16u);
    }

    *__error() = v46;
    _SASetCrashLogMessage(5162, "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu", v48, v49, v50, v51, v52, v53, a4);
    _os_crash();
    __break(1u);
LABEL_29:
    id v54 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SABinaryLoadInfo version" userInfo:0];
    objc_exception_throw(v54);
  }
  id v16 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
  if (*v16 <= 30)
  {
    uint64_t v17 = (void *)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    *uint64_t v17 = v18;
  }
  unint64_t v19 = *(void *)((char *)a3 + 19);
  uint64_t v20 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v55, v11, v20, 0);
  uint64_t v21 = (SASegment *)objc_claimAutoreleasedReturnValue();
  long long v22 = self->_segment;
  self->_segment = v21;

  if (*v16 <= 30) {
    *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
  }
LABEL_13:
  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a4 > 0x22)
      {
        unint64_t v27 = *(void *)((char *)a3 + 27);
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v55, v11, v28);
        objc_storeWeak((id *)&self[1].super.isa, v29);

        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
LABEL_17:
}

+ (void)binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:(uint64_t)a1
{
  self;
  if (*(void *)(a2 + 16) <= 0x8000000000000000) {
    id v3 = off_1E63F6E68;
  }
  else {
    id v3 = off_1E63F6D88;
  }
  BOOL v4 = objc_alloc_init(*v3);
  v4[3] = *(void *)(a2 + 16);
  return v4;
}

- (void)populateReferencesUsingPAStyleSerializedImageInfo:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  if (a1)
  {
    unint64_t v6 = *(void *)(a2 + 8);
    id v7 = a4;
    id v8 = a3;
    id v9 = objc_opt_class();
    SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v8, v7, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = +[SABinary binaryWithUUID:v16 absolutePath:0];
    uint64_t v11 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v10;

    unint64_t v12 = -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), @"__TEXT_EXEC");
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), @"__TEXT");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v14;
  }
}

@end