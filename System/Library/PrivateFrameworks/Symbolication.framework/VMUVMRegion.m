@interface VMUVMRegion
+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4;
+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6;
+ (void)initialize;
- (BOOL)hasSameInfoAsRegion:(id)a3;
- (BOOL)ignoreRegionDuringScanning;
- (BOOL)isActivityTracing;
- (BOOL)isAnalysisToolRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFoundation;
- (BOOL)isIOSurface;
- (BOOL)isJavascriptJitExecutableAllocator;
- (BOOL)isKernelPageTableMemory;
- (BOOL)isMallocHeapRelated;
- (BOOL)isNullRegion;
- (BOOL)isOwnedUnmappedMemory;
- (BOOL)isRootRegion;
- (BOOL)isSanitizer;
- (BOOL)isSpecialPhysFootprintRegion;
- (BOOL)isStack;
- (BOOL)isSubmap;
- (BOOL)isUnsharedPmap;
- (BOOL)isUntaggedRegion;
- (BOOL)isWired;
- (BOOL)willNotHoldPointers;
- (VMUVMRegion)init;
- (VMUVMRegion)initWithVMRegionData:(_VMUVMRegionData *)a3 encodedVersion:(int64_t)a4 simpleSerializer:(id)a5 error:(id *)a6;
- (_VMURange)range;
- (id)breakAtLength:(unint64_t)a3;
- (id)description;
- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4;
- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6;
- (id)path;
- (id)splitOutRange:(_VMURange)a3 fromRegionIndex:(unint64_t)a4 regions:(id)a5 newZoneName:(id)a6 reason:(id)a7;
- (id)type;
- (unint64_t)address;
- (unint64_t)dirtyLength;
- (unint64_t)length;
- (unsigned)maxProtection;
- (unsigned)protection;
- (void)addInfoFromRegion:(id)a3;
- (void)getVMRegionData:(_VMUVMRegionData *)a3 withSimpleSerializer:(id)a4;
- (void)getVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3;
- (void)getVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3;
- (void)setAsMallocRegion;
- (void)setVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3;
- (void)setVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3;
@end

@implementation VMUVMRegion

- (BOOL)isStack
{
  if (self->isExclaveRegion) {
    int v2 = 12;
  }
  else {
    int v2 = 30;
  }
  return self->user_tag == v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->path, 0);

  objc_storeStrong((id *)&self->type, 0);
}

- (id)breakAtLength:(unint64_t)a3
{
  if (self->range.length <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VMUVMRegion breakAtLength:](a3, self);
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    unint64_t v6 = self->range.length - a3;
    *(void *)(v5 + 8) = self->range.location + a3;
    *(void *)(v5 + 16) = v6;
    self->range.length = a3;
    *(_DWORD *)(v5 + 24) = self->prot;
    *(_DWORD *)(v5 + 28) = self->maxProt;
    objc_storeStrong((id *)(v5 + 32), self->type);
    objc_storeStrong((id *)(v5 + 40), self->path);
    *(unsigned char *)(v5 + 48) = self->summarized;
    *(unsigned char *)(v5 + 49) = self->external_pager;
    *(unsigned char *)(v5 + 50) = self->share_mode;
    *(_DWORD *)(v5 + 52) = self->purgeable;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    self->virtual_pages = 0;
    *(void *)(v5 + 88) = 0;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_DWORD *)(v5 + 104) = self->user_tag;
    *(void *)(v5 + 112) = self->object_id;
    *(_DWORD *)(v5 + 128) = self->nesting_depth;
    int v7 = *(unsigned char *)(v5 + 132) & 0xFE | *((unsigned char *)self + 132) & 1;
    *(unsigned char *)(v5 + 132) = v7;
    unsigned int v8 = v7 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 132) >> 1) & 1));
    *(unsigned char *)(v5 + 132) = v8;
    unsigned int v9 = v8 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 132) >> 2) & 1));
    *(unsigned char *)(v5 + 132) = v9;
    unsigned int v10 = v9 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 132) >> 3) & 1));
    *(unsigned char *)(v5 + 132) = v10;
    *(unsigned char *)(v5 + 132) = v10 & 0xEF | *((unsigned char *)self + 132) & 0x10;
    *(void *)(v5 + 136) = self->mallocBlockCount;
    *(_DWORD *)(v5 + 144) = self->mallocTypeFlag;
    *(_DWORD *)(v5 + 236) = self->exclaveFlags;
    *(unsigned char *)(v5 + 232) = self->isExclaveRegion;
    *(_DWORD *)(v5 + 148) = self->zone_index;
  }

  return (id)v5;
}

- (VMUVMRegion)init
{
  v3.receiver = self;
  v3.super_class = (Class)VMUVMRegion;
  result = [(VMUVMRegion *)&v3 init];
  if (result) {
    result->zone_index = -1;
  }
  return result;
}

- (BOOL)hasSameInfoAsRegion:(id)a3
{
  v4 = a3;
  BOOL v5 = *(void *)&self->prot == v4[3]
    && self->share_mode == *((unsigned __int8 *)v4 + 50)
    && self->user_tag == *((_DWORD *)v4 + 26)
    && self->purgeable == *((_DWORD *)v4 + 13)
    && self->object_id == v4[14];

  return v5;
}

- (BOOL)isSanitizer
{
  return !self->isExclaveRegion && self->user_tag == 99;
}

- (BOOL)isUnsharedPmap
{
  return !self->isExclaveRegion && self->user_tag == 35;
}

- (BOOL)isOwnedUnmappedMemory
{
  return !self->isExclaveRegion && self->user_tag == -1;
}

- (BOOL)isSubmap
{
  return *((unsigned char *)self + 132) & 1;
}

- (BOOL)isNullRegion
{
  return !self->user_tag && !self->prot && self->maxProt == 0;
}

- (void)addInfoFromRegion:(id)a3
{
  self->range.length += *((void *)a3 + 2);
  unint64_t shared_now_private_size = self->shared_now_private_size;
  self->resident_size += *((void *)a3 + 20);
  self->unint64_t shared_now_private_size = shared_now_private_size + *((void *)a3 + 21);
  unint64_t dirty_size = self->dirty_size;
  self->swapped_out_size += *((void *)a3 + 22);
  self->unint64_t dirty_size = dirty_size + *((void *)a3 + 23);
  unint64_t purgable_non_vol_size = self->purgable_non_vol_size;
  self->purgable_vol_size += *((void *)a3 + 24);
  self->unint64_t purgable_non_vol_size = purgable_non_vol_size + *((void *)a3 + 25);
  self->purgable_empty_size += *((void *)a3 + 26);
  unint64_t pages_resident = self->pages_resident;
  self->virtual_pages += *((void *)a3 + 7);
  self->unint64_t pages_resident = pages_resident + *((void *)a3 + 8);
  unint64_t pages_swapped_out = self->pages_swapped_out;
  self->pages_shared_now_private += *((void *)a3 + 9);
  self->unint64_t pages_swapped_out = pages_swapped_out + *((void *)a3 + 10);
  self->pages_dirtied += *((void *)a3 + 11);
  ++self->coalesced_region_count;
}

- (BOOL)isAnalysisToolRegion
{
  return !self->isExclaveRegion && self->user_tag == 10;
}

- (_VMURange)range
{
  unint64_t length = self->range.length;
  unint64_t location = self->range.location;
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:2];
  }
}

- (VMUVMRegion)initWithVMRegionData:(_VMUVMRegionData *)a3 encodedVersion:(int64_t)a4 simpleSerializer:(id)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VMUVMRegion;
  v11 = [(VMUVMRegion *)&v28 init];
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v27 = 0;
  if (!a6) {
    a6 = (id *)&v27;
  }
  if (a4 == 1)
  {
    fwrite("Memory graph file content is obsolete development version, no longer supported\n", 0x4FuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    exit(1);
  }
  if ([[objc_opt_class() version] compare:a4] == NSOrderedAscending) {
    goto LABEL_6;
  }
  if (!a3)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"The provided memory graph file is corrupted";
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = (__CFString **)v32;
    v24 = &v31;
LABEL_14:
    v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    *a6 = [v21 errorWithDomain:@"VMUVMRegionDomain" code:1 userInfo:v25];

LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  *(_OWORD *)(v11 + 8) = *(_OWORD *)&a3->var0;
  *((_DWORD *)v11 + 6) = a3->var3;
  *((_DWORD *)v11 + 7) = a3->var4;
  if (!v10)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30 = @"The provided memory graph file is corrupted";
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v30;
    v24 = &v29;
    goto LABEL_14;
  }
  uint64_t v13 = [v10 copyDeserializedStringWithID:a3->var5 error:a6];
  v14 = (void *)*((void *)v11 + 4);
  *((void *)v11 + 4) = v13;

  if (*a6) {
    goto LABEL_15;
  }
  uint64_t v15 = [v10 copyDeserializedStringWithID:a3->var6 error:a6];
  v16 = (void *)*((void *)v11 + 5);
  *((void *)v11 + 5) = v15;

  if (*a6) {
    goto LABEL_15;
  }
  *((_DWORD *)v11 + 26) = a3->var7;
  *((_DWORD *)v11 + 32) = a3->var8;
  *((void *)v11 + 12) = a3->var9;
  *((_DWORD *)v11 + 13) = a3->var10;
  *((void *)v11 + 14) = a3->var11;
  v11[49] = a3->var12;
  v11[50] = a3->var13;
  *((void *)v11 + 17) = a3->var15;
  *((_DWORD *)v11 + 36) = a3->var16;
  *((_DWORD *)v11 + 37) = a3->var2;
  int v17 = v11[132] & 0xFE | *((unsigned char *)a3 + 68) & 1;
  v11[132] = v17;
  unsigned int v18 = v17 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)a3 + 68) >> 1) & 1));
  v11[132] = v18;
  unsigned int v19 = v18 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)a3 + 68) >> 2) & 1));
  v11[132] = v19;
  unsigned int v20 = v19 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)a3 + 68) >> 3) & 1));
  v11[132] = v20;
  v11[132] = v20 & 0xEF | *((unsigned char *)a3 + 68) & 0x10;
  *((void *)v11 + 20) = a3->var23;
  *((void *)v11 + 21) = a3->var24;
  *((void *)v11 + 22) = a3->var25;
  *((void *)v11 + 23) = a3->var26;
  *((void *)v11 + 24) = a3->var27;
  *((void *)v11 + 25) = a3->var28;
  *((void *)v11 + 26) = a3->var29;
  *((_DWORD *)v11 + 38) = 1;
LABEL_6:
  v12 = v11;
LABEL_16:

  return v12;
}

- (void)setVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3
{
  self->offset = a3->var0;
  self->reusable_size = a3->var1;
}

- (void)setVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3
{
  self->exclaveFlags = a3->var0;
  self->isExclaveRegion = 1;
}

- (void)getVMRegionData:(_VMUVMRegionData *)a3 withSimpleSerializer:(id)a4
{
  *(_VMURange *)&a3->var0 = self->range;
  a3->var3 = self->prot;
  a3->var4 = self->maxProt;
  type = self->type;
  id v7 = a4;
  a3->var5 = [v7 serializeString:type];
  LODWORD(type) = [v7 serializeString:self->path];

  a3->var6 = type;
  a3->var7 = self->user_tag;
  unint64_t ref_count = self->ref_count;
  a3->var8 = self->nesting_depth;
  a3->var9 = ref_count;
  unint64_t object_id = self->object_id;
  a3->var10 = self->purgeable;
  a3->var11 = object_id;
  a3->var12 = self->external_pager;
  a3->var13 = self->share_mode;
  a3->var15 = self->mallocBlockCount;
  a3->var16 = self->mallocTypeFlag;
  a3->var2 = self->zone_index;
  LODWORD(object_id) = *((_DWORD *)a3 + 17) & 0xFFFFFFFE | *((unsigned char *)self + 132) & 1;
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 132) >> 1) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 132) >> 2) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 132) >> 3) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  *((_DWORD *)a3 + 17) = object_id & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 132) >> 4) & 1));
  a3->var23 = self->resident_size;
  a3->var24 = self->shared_now_private_size;
  a3->var25 = self->swapped_out_size;
  a3->var26 = self->dirty_size;
  a3->var27 = self->purgable_vol_size;
  a3->var28 = self->purgable_non_vol_size;
  a3->var29 = self->purgable_empty_size;
}

- (void)getVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3
{
  a3->var0 = self->offset;
  a3->var1 = self->reusable_size;
}

- (void)getVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3
{
  a3->var0 = self->exclaveFlags;
}

+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  return (id)[a1 columnHeadersWithOptions:a3 maximumLength:a4 memorySizeDivisor:1 hasFractionalPageSizes:0];
}

+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6
{
  BOOL v6 = a6;
  __int16 v7 = a3;
  BOOL v8 = a5 > 1;
  id v9 = objc_alloc(MEMORY[0x1E4F28E78]);
  BOOL v10 = !v8 || !v6;
  uint64_t v11 = 6;
  if (v8 && v6) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = 6;
  }
  if (!v10) {
    uint64_t v11 = 8;
  }
  uint64_t v13 = [v9 initWithFormat:@"%*s", v11, "VSIZE"];
  v14 = v13;
  if ((v7 & 4) != 0)
  {
    [v13 appendFormat:@" %*s", v12, "RSDNT"];
    if ((v7 & 8) == 0)
    {
LABEL_8:
      if ((v7 & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_8;
  }
  [v14 appendFormat:@" %*s", v12, "DIRTY"];
  if ((v7 & 0x800) != 0) {
LABEL_9:
  }
    [v14 appendFormat:@" %*s", v12, "SWAP"];
LABEL_10:
  uint64_t v15 = maxVMAddressWidth_addressWidth;
  if (!maxVMAddressWidth_addressWidth)
  {
    int v16 = flsll(0xFC0000000);
    int v17 = v16 + 3;
    if (v16 < -3) {
      int v17 = v16 + 6;
    }
    uint64_t v15 = (v17 >> 2);
    maxVMAddressWidth_addressWidth = v17 >> 2;
  }
  if ((v7 & 0x10) != 0) {
    unsigned int v18 = " PURGE  ";
  }
  else {
    unsigned int v18 = "";
  }
  unsigned int v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%-*s %*s-%-*s [%@] %s/%s %s%s  %s", 24, "REGION TYPE", v15, "START ", v15, " END", v14, "PRT", "MAX", "SHRMOD", v18, "REGION DETAIL"];

  return v19;
}

- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  return [(VMUVMRegion *)self descriptionWithOptions:a3 maximumLength:a4 memorySizeDivisor:1 hasFractionalPageSizes:0];
}

- (BOOL)isIOSurface
{
  return !self->isExclaveRegion && self->user_tag == 88;
}

- (BOOL)isKernelPageTableMemory
{
  return !self->isExclaveRegion && self->user_tag == -2;
}

- (BOOL)isMallocHeapRelated
{
  if (!self->isExclaveRegion) {
    return MEMORY[0x1F4115C48](self->user_tag, a2);
  }
  if ((self->exclaveFlags & 0x10000) != 0) {
    return 1;
  }
  return self->user_tag == 13;
}

- (void)setAsMallocRegion
{
  self->user_tag = 1;
}

- (BOOL)ignoreRegionDuringScanning
{
  return !self->isExclaveRegion && self->user_tag == 10;
}

- (BOOL)willNotHoldPointers
{
  if (self->isExclaveRegion)
  {
    return (BYTE2(self->exclaveFlags) >> 2) & 1;
  }
  else
  {
    unsigned int user_tag = self->user_tag;
    BOOL v4 = user_tag == 100;
    if (user_tag == 88) {
      BOOL v4 = 1;
    }
    BOOL v5 = user_tag > 0x3D;
    uint64_t v6 = (1 << user_tag) & 0x3000000080300000;
    LOBYTE(v2) = !v5 && v6 != 0 || v4;
  }
  return v2;
}

- (BOOL)isActivityTracing
{
  return !self->isExclaveRegion && self->user_tag == 78;
}

- (BOOL)isFoundation
{
  return !self->isExclaveRegion && self->user_tag == 41;
}

- (BOOL)isJavascriptJitExecutableAllocator
{
  return !self->isExclaveRegion && self->user_tag == 64;
}

- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6
{
  uint64_t v11 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  path = self->path;
  if (!path)
  {
    v14 = &stru_1EFE27F38;
    goto LABEL_23;
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v13 = [(NSString *)path lastPathComponent];
  }
  else
  {
    uint64_t v13 = path;
  }
  v14 = v13;
  BOOL v15 = [(VMUVMRegion *)self isIOSurface];
  if ((a3 & 1) == 0 && v15)
  {
    uint64_t v16 = getPathWidth_nonPathLength;
    if (!getPathWidth_nonPathLength)
    {
      int v17 = objc_alloc_init(VMUVMRegion);
      type = v17->type;
      v17->type = (NSString *)&stru_1EFE27F38;

      unsigned int v19 = [(VMUVMRegion *)v17 descriptionWithOptions:a3 maximumLength:0];
      getPathWidth_nonPathLength = [v19 length];

      uint64_t v16 = getPathWidth_nonPathLength;
    }
    unint64_t v20 = v16 + 16;
    unint64_t v21 = a4 - v16;
    if (v20 <= a4) {
      unint64_t v22 = v21;
    }
    else {
      unint64_t v22 = 16;
    }
    if (v22 < [(__CFString *)v14 length])
    {
      uint64_t v23 = [(__CFString *)v14 length] - v22 + 3;
      v24 = NSString;
      v25 = [(__CFString *)v14 substringFromIndex:v23];
      uint64_t v26 = [v24 stringWithFormat:@"...%@", v25];

      v14 = (__CFString *)v26;
    }
  }
  if ((a3 & 0x80000) != 0)
  {
    int v27 = [(__CFString *)v14 hasPrefix:@"/System/Library/Frameworks/"];
    char v28 = v27;
    uint64_t v29 = v14;
    if (v27)
    {
      v30 = -[__CFString substringFromIndex:](v14, "substringFromIndex:", [@"/System/Library/Frameworks/" length]);
      uint64_t v29 = [@"/S/L/F/" stringByAppendingString:v30];
    }
    uint64_t v31 = v29;

    if (v28) {
      goto LABEL_19;
    }
    int v32 = [(__CFString *)v31 hasPrefix:@"/System/Library/PrivateFrameworks/"];
    char v33 = v32;
    v34 = v31;
    if (v32)
    {
      v35 = -[__CFString substringFromIndex:](v31, "substringFromIndex:", [@"/System/Library/PrivateFrameworks/" length]);
      v34 = [@"/S/L/PF/" stringByAppendingString:v35];
    }
    v14 = v34;

    if ((v33 & 1) == 0)
    {
      int v61 = [(__CFString *)v14 hasPrefix:@"/System/Library/"];
      char v62 = v61;
      v63 = v14;
      if (v61)
      {
        v64 = -[__CFString substringFromIndex:](v14, "substringFromIndex:", [@"/System/Library/" length]);
        v63 = [@"/S/L/" stringByAppendingString:v64];
      }
      uint64_t v31 = v63;

      if ((v62 & 1) == 0)
      {
        int v65 = [(__CFString *)v31 hasPrefix:@"/usr/lib/system/"];
        char v66 = v65;
        v67 = v31;
        if (v65)
        {
          v68 = -[__CFString substringFromIndex:](v31, "substringFromIndex:", [@"/usr/lib/system/" length]);
          v67 = [@"/u/l/s/" stringByAppendingString:v68];
        }
        v14 = v67;

        if (v66) {
          goto LABEL_23;
        }
        int v69 = [(__CFString *)v14 hasPrefix:@"/usr/lib/"];
        char v70 = v69;
        v71 = v14;
        if (v69)
        {
          v72 = -[__CFString substringFromIndex:](v14, "substringFromIndex:", [@"/usr/lib/" length]);
          v71 = [@"/u/l/" stringByAppendingString:v72];
        }
        uint64_t v31 = v71;

        if ((v70 & 1) == 0)
        {
          v73 = v31;
          if ([(__CFString *)v31 hasPrefix:@"/private/var/mobile/"])
          {
            v74 = -[__CFString substringFromIndex:](v31, "substringFromIndex:", [@"/private/var/mobile/" length]);
            v73 = [@"~mobile/" stringByAppendingString:v74];
          }
          v14 = v73;

          goto LABEL_23;
        }
      }
LABEL_19:
      v14 = v31;
    }
  }
LABEL_23:
  if (a5 > 1 && a6) {
    unsigned int v36 = 8;
  }
  else {
    unsigned int v36 = 6;
  }
  if ((a3 & 0x200) != 0) {
    uint64_t v37 = 0;
  }
  else {
    uint64_t v37 = v36;
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v39 = v38;
  if ((a3 & 0x200) != 0) {
    [v38 appendString:@"V="];
  }
  [v39 appendFormat:@"%*s", v37, pageCountString(self->range.length, a5, a6)];
  if ((a3 & 4) != 0)
  {
    if ((a3 & 0x200) != 0) {
      v43 = @" R=";
    }
    else {
      v43 = @" ";
    }
    [v39 appendString:v43];
    [v39 appendFormat:@"%*s", v37, pageCountString(self->resident_size, a5, a6)];
    if ((a3 & 8) == 0)
    {
LABEL_33:
      if ((a3 & 0x800) == 0) {
        goto LABEL_38;
      }
      goto LABEL_34;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_33;
  }
  if ((a3 & 0x200) != 0) {
    v44 = @" D=";
  }
  else {
    v44 = @" ";
  }
  [v39 appendString:v44];
  [v39 appendFormat:@"%*s", v37, pageCountString(self->dirty_size, a5, a6)];
  if ((a3 & 0x800) != 0)
  {
LABEL_34:
    if ((a3 & 0x200) != 0) {
      v40 = @" S=";
    }
    else {
      v40 = @" ";
    }
    [v39 appendString:v40];
    [v39 appendFormat:@"%*s", v37, pageCountString(self->swapped_out_size, a5, a6)];
  }
LABEL_38:
  v41 = &stru_1EFE27F38;
  if ((a3 & 0x10) != 0)
  {
    if (self->purgeable == 3)
    {
      if ([(NSString *)self->path length]) {
        BOOL v42 = (a3 & 0x80000) == 0;
      }
      else {
        BOOL v42 = 0;
      }
      if (v42) {
        v41 = @"        ";
      }
      else {
        v41 = &stru_1EFE27F38;
      }
    }
    else
    {
      id v45 = [NSString alloc];
      uint64_t purgeable = self->purgeable;
      if (purgeable > 3) {
        uint64_t v47 = 63;
      }
      else {
        uint64_t v47 = dword_1A7D79C30[purgeable];
      }
      v41 = (__CFString *)[v45 initWithFormat:v47 ? @" PURGE=1" : @" PURGE=0"];
    }
  }
  v48 = (__CFString *)self->type;
  if (!v48) {
    v48 = &stru_1EFE27F38;
  }
  v49 = v48;
  if ((unint64_t)[(__CFString *)v49 length] >= 0x19)
  {
    uint64_t v50 = [(__CFString *)v49 substringToIndex:24];

    v49 = (__CFString *)v50;
  }
  if ((a3 & 0x2000) == 0)
  {
    if ((a3 & 0x200) == 0)
    {
      uint64_t v51 = maxVMAddressWidth_addressWidth;
      if (!maxVMAddressWidth_addressWidth)
      {
        int v52 = flsll(0xFC0000000);
        int v53 = v52 + 3;
        if (v52 < -3) {
          int v53 = v52 + 6;
        }
        uint64_t v51 = (v53 >> 2);
        maxVMAddressWidth_addressWidth = v53 >> 2;
      }
      if ([(VMUVMRegion *)self isOwnedUnmappedMemory])
      {
        v54 = NSString;
        v55 = "unmapped";
      }
      else
      {
        if (![(VMUVMRegion *)self isKernelPageTableMemory])
        {
          unint64_t location = self->range.location;
          if (location < 0xFC0000001)
          {
            uint64_t v60 = 24;
          }
          else
          {
            int v76 = flsll(location);
            int v77 = v76 + 3;
            if (v76 < -3) {
              int v77 = v76 + 6;
            }
            uint64_t v78 = (v77 >> 2);
            if ((int)v78 < (int)v51) {
              -[VMUVMRegion descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:]();
            }
            uint64_t v60 = (v51 - v78 + 24);
            unint64_t location = self->range.location;
            uint64_t v51 = v78;
          }
          [NSString stringWithFormat:@"%*llx", v51, location];
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v59 = [NSString stringWithFormat:@"%-*llx", v51, self->range.length + self->range.location];
          goto LABEL_103;
        }
        v54 = NSString;
        v55 = "kernel";
      }
      [v54 stringWithFormat:@"%*s", v51, v55];
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v59 = [NSString stringWithFormat:@"%-*s", v51, v55];
      uint64_t v60 = 24;
LABEL_103:
      v79 = NSString;
      uint64_t v80 = [(__CFString *)v49 UTF8String];
      unsigned int v81 = self->share_mode - 1;
      if (v81 > 6) {
        v82 = "   ";
      }
      else {
        v82 = off_1E5D25848[(char)v81];
      }
      [v79 stringWithFormat:@"%-*s %@-%@ [%@] %s/%s SM=%s%@  %@", v60, v80, v58, v59, v39, off_1E5D25808[self->prot & 7], off_1E5D25808[self->maxProt & 7], v82, v41, v14];
      goto LABEL_107;
    }
    if ([(VMUVMRegion *)self isOwnedUnmappedMemory])
    {
      v58 = @"unmapped";
    }
    else
    {
      if (![(VMUVMRegion *)self isKernelPageTableMemory])
      {
        [NSString stringWithFormat:@"%#llx", self->range.location];
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v59 = [NSString stringWithFormat:@"%#llx", self->range.length + self->range.location];
        goto LABEL_100;
      }
      v58 = @"kernel";
    }
    v59 = v58;
LABEL_100:
    [NSString stringWithFormat:@"%s %@-%@ [%@] %s/%s %@", -[__CFString UTF8String](v49, "UTF8String"), v58, v59, v39, off_1E5D25808[self->prot & 7], off_1E5D25808[self->maxProt & 7], v14, v84, v85, v86];
    v57 = LABEL_107:;

    goto LABEL_108;
  }
  if ([(__CFString *)v49 isEqualToString:@"__DATA"])
  {
    uint64_t v56 = [(__CFString *)v14 lastPathComponent];

    v14 = (__CFString *)v56;
  }
  v57 = (void *)[[NSString alloc] initWithFormat:@"%@ %@", v49, v14];
LABEL_108:

  return v57;
}

- (id)description
{
  return [(VMUVMRegion *)self descriptionWithOptions:513 maximumLength:0];
}

- (unint64_t)address
{
  return self->range.location;
}

- (unint64_t)length
{
  return self->range.length;
}

- (id)type
{
  return self->type;
}

- (id)path
{
  return self->path;
}

- (unsigned)protection
{
  return self->prot;
}

- (unsigned)maxProtection
{
  return self->maxProt;
}

- (BOOL)isWired
{
  return (*((unsigned __int8 *)self + 132) >> 4) & 1;
}

- (unint64_t)dirtyLength
{
  unint64_t v2 = self->swapped_out_size + self->dirty_size;
  unint64_t purgable_vol_size = self->purgable_vol_size;
  BOOL v4 = v2 >= purgable_vol_size;
  unint64_t v5 = v2 - purgable_vol_size;
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isUntaggedRegion
{
  unsigned int user_tag = self->user_tag;
  if (!self->isExclaveRegion) {
    return !user_tag && !self->external_pager && self->share_mode != 5;
  }
  return !user_tag && !self->external_pager;
}

- (BOOL)isRootRegion
{
  return (*((unsigned char *)self + 132) & 6) != 0 || [(VMUVMRegion *)self isStack];
}

- (BOOL)isSpecialPhysFootprintRegion
{
  if ([(VMUVMRegion *)self isOwnedUnmappedMemory]) {
    return 1;
  }

  return [(VMUVMRegion *)self isKernelPageTableMemory];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (char *)a3;
  unint64_t v5 = (void **)v4;
  BOOL v6 = *(_OWORD *)&self->range == *(_OWORD *)(v4 + 8)
    && sameString(self->type, *((void **)v4 + 4))
    && sameString(self->path, v5[5])
    && [(VMUVMRegion *)self hasSameInfoAsRegion:v5];

  return v6;
}

- (id)splitOutRange:(_VMURange)a3 fromRegionIndex:(unint64_t)a4 regions:(id)a5 newZoneName:(id)a6 reason:(id)a7
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((VMUVMRegion *)objc_claimAutoreleasedReturnValue() ! = [v13 objectAtIndexedSubscript:a4]; {
    -[VMUVMRegion splitOutRange:fromRegionIndex:regions:newZoneName:reason:]();
  }

  unint64_t v16 = VMUIntersectionRange(location, length, self->range.location, self->range.length);
  if (location == v16 && length == v17)
  {
    unint64_t v18 = location;
  }
  else
  {
    unint64_t length = v17;
    unint64_t v18 = v16;
  }
  unint64_t v19 = self->range.location;
  unint64_t v20 = self->range.length;
  if (v18 == v19 && v20 == length)
  {
    uint64_t v23 = self;
  }
  else
  {
    if (v18 == v19)
    {
      unint64_t v22 = [(VMUVMRegion *)self breakAtLength:length];
      if (v22) {
        [v13 insertObject:v22 atIndex:a4 + 1];
      }
      uint64_t v23 = self;
LABEL_13:

      goto LABEL_15;
    }
    if (v20 + v19 == v18 + length)
    {
      uint64_t v23 = [(VMUVMRegion *)self breakAtLength:v20 - length];
      if (v23) {
        [v13 insertObject:v23 atIndex:a4 + 1];
      }
    }
    else if (v18 <= v19 || v18 + length >= v20 + v19)
    {
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v26 = [(VMUVMRegion *)self breakAtLength:v18 - v19];
      uint64_t v23 = (VMUVMRegion *)v26;
      if (v26)
      {
        [v13 insertObject:v26 atIndex:a4 + 1];
        unint64_t v22 = [(VMUVMRegion *)v23 breakAtLength:length];
        if (v22) {
          [v13 insertObject:v22 atIndex:a4 + 2];
        }
        goto LABEL_13;
      }
    }
  }
LABEL_15:

  return v23;
}

- (void)descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:.cold.1()
{
  __assert_rtn("-[VMUVMRegion descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:]", "VMUVMRegion.m", 561, "newAddressWidth >= addressWidth");
}

- (void)breakAtLength:(unint64_t)a1 .cold.1(unint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = memorySizeString(a1);
  id v5 = [a2 description];
  int v6 = 134218498;
  unint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  __int16 v10 = 2080;
  uint64_t v11 = [v5 UTF8String];
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ignoring request to break region at excess length %llu (%s) for %s\n", (uint8_t *)&v6, 0x20u);
}

- (void)splitOutRange:fromRegionIndex:regions:newZoneName:reason:.cold.1()
{
  __assert_rtn("-[VMUVMRegion splitOutRange:fromRegionIndex:regions:newZoneName:reason:]", "VMUVMRegion.m", 796, "regions[regionIndex] == self");
}

@end