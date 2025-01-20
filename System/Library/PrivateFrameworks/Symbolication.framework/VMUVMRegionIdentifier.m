@interface VMUVMRegionIdentifier
+ (id)descriptionForRange:(_VMURange)a3 inSortedRegions:(id)a4 options:(unint64_t)a5;
- ($B3784314699B2BBEAD7DAC31D728563A)computedStatisticsForZoneWithName:(SEL)a3;
- ($B3784314699B2BBEAD7DAC31D728563A)summaryStatisticsOfAllZones;
- (BOOL)didPhysFootprintDirtyAccounting;
- (BOOL)hasFractionalPageSizes;
- (BOOL)recordedPhysFootprint;
- (NSArray)zoneNames;
- (NSDictionary)ledger;
- (VMUVMRegionIdentifier)init;
- (VMUVMRegionIdentifier)initWithGraph:(id)a3 options:(unint64_t)a4;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 pid:(int)a4 options:(unint64_t)a5;
- (VMUVMRegionIdentifier)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (id)descriptionForMallocZoneTotals:(unint64_t)a3;
- (id)descriptionForMallocZoneTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4;
- (id)descriptionForRange:(_VMURange)a3;
- (id)descriptionForRange:(_VMURange)a3 options:(unint64_t)a4;
- (id)descriptionForRegionTotals:(unint64_t)a3;
- (id)descriptionForRegionTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4;
- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4;
- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4 maximumLength:(unint64_t)a5 memorySizeDivisor:(unsigned int)a6;
- (id)nonSubmapRegionContainingAddress:(unint64_t)a3;
- (id)regions;
- (id)taskThreadStates;
- (int)_recordRegionsAroundAddress:(unint64_t)a3 regionDescriptionOptions:(unint64_t)a4;
- (void)_computeStatistics:(id *)a3;
@end

@implementation VMUVMRegionIdentifier

- (int)_recordRegionsAroundAddress:(unint64_t)a3 regionDescriptionOptions:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (_recordRegionsAroundAddress_regionDescriptionOptions__onceToken != -1) {
    dispatch_once(&_recordRegionsAroundAddress_regionDescriptionOptions__onceToken, &__block_literal_global_13);
  }
  v7 = getprogname();
  int v8 = strcmp(v7, "ReportCrash");
  unint64_t v9 = a4 | 0x500;
  if (v8) {
    unint64_t v9 = a4;
  }
  uint64_t v10 = v9 & 0x30000;
  unint64_t v11 = v9 & 0xFFFFFFFFFFFDFFFFLL;
  if ((v9 & 0x30000) == 0) {
    v9 |= 0x10000uLL;
  }
  if (v10 == 196608) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v9;
  }
  self->_recordedPhysFootprint = BYTE2(v12) & 1;
  if ((v12 & 0x10000) != 0) {
    self->_didPhysFootprintDirtyAccounting = 1;
  }
  [(id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock lock];
  int v13 = recordRegions(self->_task, a3, self->_regions, self->_threadStates, self->_mallocZoneStatisticsMap, self->_ledger, v12);
  [(id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock unlock];
  if (!v13)
  {
    if (*MEMORY[0x1E4F14AE0] >= *MEMORY[0x1E4F14AF0]) {
      uint64_t v14 = *MEMORY[0x1E4F14AF0];
    }
    else {
      uint64_t v14 = *MEMORY[0x1E4F14AE0];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_regions;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
LABEL_18:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        if (!self->_hasFractionalPageSizes)
        {
          uint64_t v20 = (*(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19) + 160) | *(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19)
                                                                                               + 16) | *(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19) + 184)) & v14;
          self->_hasFractionalPageSizes = v20 != 0;
          if (v20) {
            break;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v17) {
            goto LABEL_18;
          }
          break;
        }
      }
    }

    return 0;
  }
  return v13;
}

void __78__VMUVMRegionIdentifier__recordRegionsAroundAddress_regionDescriptionOptions___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock;
  _recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock = (uint64_t)v0;
}

- (VMUVMRegionIdentifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)VMUVMRegionIdentifier;
  v2 = [(VMUVMRegionIdentifier *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    regions = v2->_regions;
    v2->_regions = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:259];
    mallocZoneStatisticsMap = v2->_mallocZoneStatisticsMap;
    v2->_mallocZoneStatisticsMap = (NSMapTable *)v5;
  }
  return v2;
}

- (VMUVMRegionIdentifier)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  objc_super v8 = [(VMUVMRegionIdentifier *)self init];
  unint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_task, a3);
    uint64_t v10 = [[VMUTaskThreadStates alloc] initWithVMUTask:v7];
    threadStates = v9->_threadStates;
    v9->_threadStates = v10;

    uint64_t v12 = +[VMUProcessLedger ledgerForVMUTask:v9->_task];
    ledger = v9->_ledger;
    v9->_ledger = (NSDictionary *)v12;

    if ([(VMUTask *)v9->_task isCore]
      || (unsigned int v14 = [(VMUTask *)v9->_task taskPort], (a4 & 0x1000) == 0) && v14)
    {
      if ([(VMUVMRegionIdentifier *)v9 _recordRegionsAroundAddress:0 regionDescriptionOptions:a4])
      {

        unint64_t v9 = 0;
      }
    }
  }

  return v9;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 pid:(int)a4 options:(unint64_t)a5
{
  id v7 = [[VMUTask alloc] initWithTask:*(void *)&a3];
  objc_super v8 = [(VMUVMRegionIdentifier *)self initWithVMUTask:v7 options:a5];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mallocZoneStatisticsMap, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  v6 = [[VMUTask alloc] initWithTask:*(void *)&a3];
  id v7 = [(VMUVMRegionIdentifier *)self initWithVMUTask:v6 options:a4];

  return v7;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3
{
  return [(VMUVMRegionIdentifier *)self initWithTask:*(void *)&a3 options:0];
}

- (VMUVMRegionIdentifier)initWithGraph:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(VMUVMRegionIdentifier *)self init];
  if (v7)
  {
    if ([v6 zoneCount])
    {
      objc_super v8 = malloc_type_malloc(8 * [v6 zoneCount], 0x2004093837F09uLL);
      if ([v6 zoneCount])
      {
        unint64_t v9 = 0;
        do
        {
          v8[v9] = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
          NSMapInsertKnownAbsent(v7->_mallocZoneStatisticsMap, (const void *)[v6 zoneNameForIndex:v9], (const void *)v8[v9]);
          ++v9;
        }
        while (v9 < [v6 zoneCount]);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke;
      v22[3] = &unk_1E5D244F0;
      id v23 = v6;
      long long v24 = v8;
      VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v23, v22);
    }
    else
    {
      objc_super v8 = 0;
    }
    uint64_t v10 = [v6 vmPageSize] - 1;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__7;
    v20[4] = __Block_byref_object_dispose__7;
    id v21 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_137;
    v13[3] = &unk_1E5D24518;
    unint64_t v11 = v7;
    unsigned int v14 = v11;
    id v15 = v6;
    uint64_t v16 = v20;
    uint64_t v17 = v8;
    unint64_t v18 = a4;
    uint64_t v19 = v10;
    [v15 enumerateRegionsWithBlock:v13];
    coalesceIdenticalRegions(v11->_regions, a4);
    free(v8);
    v11->_recordedPhysFootprint = BYTE2(a4) & 1;
    if ((a4 & 0x10000) != 0) {
      v11->_didPhysFootprintDirtyAccounting = 1;
    }

    _Block_object_dispose(v20, 8);
  }

  return v7;
}

int64x2_t __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  if (*(void *)(a3 + 8) >> 60 == 1)
  {
    uint64_t v7 = a4[37];
    if (v7 != -1 && v7 >= [*(id *)(a1 + 32) zoneCount])
    {
      uint64_t v8 = [*(id *)(a1 + 32) zoneCount];
      unint64_t v9 = [a4 description];
      NSLog(&cfstr_MallocZoneCoun.isa, v8, v7, v9);
    }
    if (v7 < [*(id *)(a1 + 32) zoneCount])
    {
      unint64_t v11 = *(int64x2_t **)(*(void *)(a1 + 40) + 8 * v7);
      int64x2_t v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = *(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      int64x2_t result = vaddq_s64(*v11, v12);
      *unint64_t v11 = result;
    }
  }
  return result;
}

void __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v16 = a2;
  v4 = (void *)MEMORY[0x1AD0D9F90]();
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v16];
  int v5 = [*(id *)(a1 + 40) zoneCount];
  id v6 = v16;
  if (v5)
  {
    unsigned int v7 = v16[37];
    unsigned int v8 = [*(id *)(a1 + 40) zoneCount];
    id v6 = v16;
    if (v7 < v8 && v16[37] != -1 && (*((void *)v16 + 17) || v16[36]))
    {
      uint64_t v9 = [*(id *)(a1 + 40) zoneNameForIndex:];
      uint64_t v10 = (void *)*((void *)v16 + 5);
      *((void *)v16 + 5) = v9;

      addMallocRegionPageStatistics(v16, *(void **)(*(void *)(a1 + 56) + 8 * v16[37]));
      id v6 = v16;
      unint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v11)
      {
        if ((*(unsigned char *)(a1 + 64) & 0x80) == 0)
        {
          id v12 = v11;
          int v13 = v16;
          if (shouldProbablyCoalesceRegions(v12, v13) && [v12 hasSameInfoAsRegion:v13])
          {

            id v6 = v16;
            goto LABEL_13;
          }

          id v6 = v16;
        }
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v6[37]);
        ++*(void *)(v14 + 56);
      }
    }
  }
LABEL_13:
  setTypeIfMallocRegion(v6);
  uint64_t v15 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v15 + 48)) {
    *(unsigned char *)(v15 + 48) = ((*((void *)v16 + 20) | *((void *)v16 + 2) | *((void *)v16 + 23)) & *(void *)(a1 + 72)) != 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
}

- (id)regions
{
  return self->_regions;
}

- (id)taskThreadStates
{
  return self->_threadStates;
}

- (id)nonSubmapRegionContainingAddress:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_regions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isSubmap:v12] == NO && a3 - v9[1] < v9[2])
        {
          uint64_t v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)hasFractionalPageSizes
{
  return self->_hasFractionalPageSizes;
}

- (NSArray)zoneNames
{
  mallocZoneStatisticsMap = self->_mallocZoneStatisticsMap;
  if (mallocZoneStatisticsMap)
  {
    uint64_t v3 = NSAllMapTableKeys(mallocZoneStatisticsMap);
  }
  else
  {
    uint64_t v3 = 0;
  }
  v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- ($B3784314699B2BBEAD7DAC31D728563A)computedStatisticsForZoneWithName:(SEL)a3
{
  id v8 = a4;
  uint64_t v6 = NSMapGet(self->_mallocZoneStatisticsMap, v8);
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  if (v6)
  {
    *(_OWORD *)&retstr->var0 = *v6;
    *(_OWORD *)&retstr->var2 = v6[1];
    *(_OWORD *)&retstr->var4 = v6[2];
    *(_OWORD *)&retstr->var6 = v6[3];
  }
  else
  {
    NSLog(&cfstr_NoMallocZoneSt.isa, v8);
  }
  [(VMUVMRegionIdentifier *)self _computeStatistics:retstr];

  return result;
}

- ($B3784314699B2BBEAD7DAC31D728563A)summaryStatisticsOfAllZones
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  uint64_t v5 = [(VMUVMRegionIdentifier *)self zoneNames];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64x2_t v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    int64x2_t v13 = 0u;
    int64x2_t v14 = 0u;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = (char *)NSMapGet(self->_mallocZoneStatisticsMap, *(const void **)(*((void *)&v16 + 1) + 8 * v10));
        if (v11)
        {
          int64x2_t v14 = vaddq_s64(v14, *((int64x2_t *)v11 + 1));
          *(int64x2_t *)&retstr->var2 = v14;
          int64x2_t v13 = vaddq_s64(v13, *(int64x2_t *)(v11 + 40));
          *(int64x2_t *)&retstr->var5 = v13;
          int64x2_t v15 = vaddq_s64(v15, *(int64x2_t *)v11);
          *(int64x2_t *)&retstr->var0 = v15;
          v8 += *((void *)v11 + 7);
          retstr->var7 = v8;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  -[VMUVMRegionIdentifier _computeStatistics:](self, "_computeStatistics:", retstr, *(_OWORD *)&v13, *(_OWORD *)&v14);

  return result;
}

- (void)_computeStatistics:(id *)a3
{
  if (a3)
  {
    unint64_t var0 = a3->var0;
    unint64_t v4 = a3->var5 + a3->var6;
    if (v4) {
      BOOL v5 = v4 > var0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      unint64_t v6 = 100 - 100 * var0 / v4;
      unint64_t v7 = v4 - var0;
    }
    else
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
    }
    a3->var8 = v6;
    a3->var9 = v7;
  }
}

+ (id)descriptionForRange:(_VMURange)a3 inSortedRegions:(id)a4 options:(unint64_t)a5
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x1E4F28E78] string];
  uint64_t v9 = [v7 count];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    int v12 = 0;
    unint64_t v24 = location + length;
    unint64_t v23 = length;
    do
    {
      uint64_t v13 = [v7 objectAtIndexedSubscript:v11];
      if (VMURangeIntersectsRange(location, length, *(void *)(v13 + 8), *(void *)(v13 + 16)))
      {
        if ([(id)v13 isSubmap])
        {
          unint64_t v11 = (v12 + 1);
          if (v10 > v11)
          {
            uint64_t v21 = [(id)v13 address];
            int64x2_t v14 = [v7 objectAtIndexedSubscript:(v12 + 1)];
            uint64_t v15 = [v14 address];

            BOOL v16 = v21 == v15;
            unint64_t length = v23;
            if (v16) {
              goto LABEL_12;
            }
          }
        }
        uint64_t v17 = [v8 length];
        if (v17) {
          uint64_t v17 = [v8 appendString:@"\n"];
        }
        long long v18 = (void *)MEMORY[0x1AD0D9F90](v17);
        long long v19 = [(id)v13 descriptionWithOptions:a5 maximumLength:0];
        [v8 appendString:v19];

        unint64_t length = v23;
      }
      if (*(void *)(v13 + 8) >= v24)
      {

        break;
      }
      unint64_t v11 = (v12 + 1);
LABEL_12:

      int v12 = v11;
    }
    while (v10 > v11);
  }

  return v8;
}

- (id)descriptionForRange:(_VMURange)a3
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a3.location, a3.length, self->_regions, 1);
}

- (id)descriptionForRange:(_VMURange)a3 options:(unint64_t)a4
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a3.location, a3.length, self->_regions, a4);
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4
{
  return [(VMUVMRegionIdentifier *)self descriptionOfRegionsAroundAddress:a3 options:a4 maximumLength:0 memorySizeDivisor:1];
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4 maximumLength:(unint64_t)a5 memorySizeDivisor:(unsigned int)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_regions count])
  {
    a4 |= 0x80uLL;
    [(VMUVMRegionIdentifier *)self _recordRegionsAroundAddress:a3 regionDescriptionOptions:a4];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v32 = self;
  unint64_t v10 = self->_regions;
  unint64_t v11 = (void *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    unint64_t v31 = a4;
    int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (void *)((char *)i + 1))
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v10);
        }
        BOOL v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v17 = v16[1];
        unint64_t v18 = v16[2];
        if (v17 + v18 - 1 >= a3)
        {
          if (a3 - v17 >= v18)
          {
            unint64_t v11 = v16;
            goto LABEL_16;
          }
          long long v19 = v12;
          int v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        }
        else
        {
          long long v19 = v13;
          uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        }
        uint64_t v20 = v16;
      }
      unint64_t v11 = (void *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_16:
    a4 = v31;
  }
  else
  {
    int v12 = 0;
    uint64_t v13 = 0;
  }

  uint64_t v21 = [MEMORY[0x1E4F28E78] string];
  if (a5 <= 0x50) {
    unint64_t v22 = a5;
  }
  else {
    unint64_t v22 = a5 - 6;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke;
  v36[3] = &unk_1E5D24540;
  id v23 = v21;
  unint64_t v24 = a4;
  unint64_t v39 = a4;
  unint64_t v40 = v22;
  unsigned int v41 = a6;
  id v37 = v23;
  v38 = v32;
  long long v25 = (void (**)(void, void, void))MEMORY[0x1AD0DA230](v36);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2;
  v34[3] = &unk_1E5D24568;
  id v26 = v23;
  id v35 = v26;
  uint64_t v27 = (void (**)(void, void, void, void))MEMORY[0x1AD0DA230](v34);
  if (v12)
  {
    [v26 appendFormat:@"%#llx is in %#llx-%#llx;  bytes after start: %llu  bytes before end: %llu\n"];
      a3,
      v12[1],
      v12[2] + v12[1],
      a3 - v12[1],
      v12[2] + v12[1] + ~a3);
  }
  else
  {
    [v26 appendFormat:@"%#llx is not in any region.  ", a3];
    if (v13) {
      [v26 appendFormat:@"Bytes after previous region: %llu  ", a3 - (v13[1] + v13[2]) + 1];
    }
    if (v11) {
      [v26 appendFormat:@"Bytes before following region: %llu", v11[1] - a3];
    }
    [v26 appendString:@"\n"];
  }
  [v26 appendString:@"\n"];
  v28 = +[VMUVMRegion columnHeadersWithOptions:v24 maximumLength:v22 memorySizeDivisor:a6 hasFractionalPageSizes:v32->_hasFractionalPageSizes];
  [v26 appendFormat:@"%s%@\n", "      ", v28];

  if (v13) {
    ((void (**)(void, const char *, void *))v25)[2](v25, "      ", v13);
  }
  else {
    [v26 appendFormat:@"%sUNUSED SPACE AT START\n", "      "];
  }
  ((void (**)(void, const char *, void *, void *))v27)[2](v27, "      ", v13, v12);
  if (v12)
  {
    ((void (**)(void, const char *, void *))v25)[2](v25, "--->  ", v12);
  }
  else
  {
    if (v11 && v13)
    {
      ((void (**)(void, const char *, void *, void *))v27)[2](v27, "--->  ", v13, v11);
      ((void (**)(void, const char *, void, void *))v27)[2](v27, "      ", 0, v11);
      goto LABEL_38;
    }
    [v26 appendFormat:@"%s\n", "--->  "];
  }
  ((void (**)(void, const char *, void *, void *))v27)[2](v27, "      ", v12, v11);
  if (!v11)
  {
    [v26 appendFormat:@"%sUNUSED SPACE AT END\n", "      "];
    goto LABEL_40;
  }
LABEL_38:
  ((void (**)(void, const char *, void *))v25)[2](v25, "      ", v11);
LABEL_40:
  id v29 = v26;

  return v29;
}

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  if (a3)
  {
    id v5 = [a3 descriptionWithOptions:*(void *)(a1 + 48) maximumLength:*(void *)(a1 + 56) memorySizeDivisor:*(unsigned int *)(a1 + 64) hasFractionalPageSizes:*(unsigned __int8 *)(*(void *)(a1 + 40) + 48)];
    [v4 appendFormat:@"%s%@\n", a2, v5];
  }
  else
  {
    [v4 appendFormat:@"%s%@\n", a2, &stru_1EFE27F38];
  }
}

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7)
    {
      unint64_t v8 = v12[2] + v12[1];
      unint64_t v9 = v7[1];
      BOOL v10 = v9 > v8;
      uint64_t v11 = v9 - v8;
      if (v10) {
        [*(id *)(a1 + 32) appendFormat:@"%sGAP OF %#llx BYTES\n", a2, v11];
      }
    }
  }
}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3
{
  return [(VMUVMRegionIdentifier *)self descriptionForMallocZoneTotals:a3 memorySizeDivisor:1];
}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  int v4 = a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = objc_opt_new();
  id v7 = [(VMUVMRegionIdentifier *)self zoneNames];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke;
  v55[3] = &__block_descriptor_33_e22_Q16__0____QQQQQQQQQQ_8l;
  BOOL v56 = (v4 & 0x100000) != 0;
  unint64_t v8 = (void *)MEMORY[0x1AD0DA230](v55);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2;
  v53[3] = &unk_1E5D245B0;
  v53[4] = self;
  id v33 = v8;
  id v54 = v33;
  unint64_t v9 = [v7 sortedArrayUsingComparator:v53];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
  int v12 = v6;
  if (v11)
  {
    uint64_t v13 = v11;
    unsigned int v14 = 0;
    uint64_t v15 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v17 length] > (unint64_t)v14) {
          unsigned int v14 = [v17 length];
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v13);

    if (v14 <= 0xB) {
      unsigned int v18 = 11;
    }
    else {
      unsigned int v18 = v14;
    }
    if (v18 >= 0x3C) {
      uint64_t v19 = 60;
    }
    else {
      uint64_t v19 = v18;
    }
    unint64_t v6 = v12;
  }
  else
  {

    uint64_t v19 = 11;
  }
  appendMallocZoneTextLine(v6, v4, v19, (uint64_t)", (uint64_t)"VIRTUAL", (uint64_t)"RESIDENT", (uint64_t)"DIRTY", (uint64_t)"SWAPPED", (uint64_t)"DIRTY+SWAP", (uint64_t)"ALLOCATION", (uint64_t)"BYTES", (uint64_t)"DIRTY+SWAP", (uint64_t)", (uint64_t)"REGION");
  if (a4 <= 1) {
    uint64_t v20 = "SIZE";
  }
  else {
    uint64_t v20 = "PAGES";
  }
  appendMallocZoneTextLine(v6, v4, v19, (uint64_t)"MALLOC ZONE", (uint64_t)v20, (uint64_t)v20, (uint64_t)v20, (uint64_t)v20, (uint64_t)v20, (uint64_t)"COUNT", (uint64_t)"ALLOCATED", (uint64_t)"FRAG SIZE", (uint64_t)"% FRAG", (uint64_t)"COUNT");
  uint64_t v21 = objc_opt_new();
  appendMallocZoneTextLine(v21, v4, v19, (uint64_t)"===========", (uint64_t)"=======", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"=========", (uint64_t)"======", (uint64_t)"======");
  v32 = v21;
  [v6 appendString:v21];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v22 = v10;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
        [(VMUVMRegionIdentifier *)self computedStatisticsForZoneWithName:v27];
        char hasFractionalPageSizes = self->_hasFractionalPageSizes;
        uint64_t v29 = [v27 UTF8String];
        long long v37 = v42;
        long long v38 = v43;
        long long v39 = v44;
        long long v35 = v40;
        long long v36 = v41;
        unint64_t v6 = v12;
        appendMallocZoneStatsLine(v12, v4, a4, hasFractionalPageSizes, v19, v29, (unint64_t *)&v35);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v24);
  }

  if (![v22 count])
  {
    [v6 appendString:@"No malloc zones in target process\n"];
    *(void *)&long long v40 = 0;
    [(VMUTask *)self->_task hasStartedWithErrorString:&v40];
    if ((void)v40) {
      [v6 appendFormat:@"%s\n", v40];
    }
  }
  if ([(NSMapTable *)self->_mallocZoneStatisticsMap count] >= 2)
  {
    [v6 appendString:v32];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    [(VMUVMRegionIdentifier *)self summaryStatisticsOfAllZones];
    char v30 = self->_hasFractionalPageSizes;
    long long v37 = v42;
    long long v38 = v43;
    long long v39 = v44;
    long long v35 = v40;
    long long v36 = v41;
    appendMallocZoneStatsLine(v6, v4, a4, v30, v19, (uint64_t)"TOTAL", (unint64_t *)&v35);
  }

  return v6;
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 32)) {
    return a2[5] + a2[6];
  }
  return a2[2];
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2(uint64_t a1, const void *a2, void *a3)
{
  id v5 = *(NSMapTable **)(*(void *)(a1 + 32) + 40);
  id v6 = a3;
  NSMapGet(v5, a2);
  NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 40), v6);

  unint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v7 <= (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v9 < (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()) {
    return 1;
  }
  else {
    return v8;
  }
}

- (id)descriptionForRegionTotals:(unint64_t)a3
{
  return [(VMUVMRegionIdentifier *)self descriptionForRegionTotals:a3 memorySizeDivisor:1];
}

- (id)descriptionForRegionTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = self;
  v122[16] = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_regions count])
  {
    long long v35 = &stru_1EFE27F38;
    goto LABEL_100;
  }
  unint64_t v7 = getprogname();
  if (!strcmp(v7, "ReportCrash")) {
    unint64_t v8 = a3 | 0x100;
  }
  else {
    unint64_t v8 = a3;
  }
  unint64_t v9 = (__CFString *)objc_opt_new();
  v122[0] = 0;
  unint64_t v115 = 0;
  *(void *)&long long v116 = 0;
  cumulateLibraries(v6->_regions, @"__TEXT", v122, &v116, &v115);
  cumulateLibraries(v6->_regions, @"__LINKEDIT", v122, &v116, &v115);
  unint64_t v10 = v122[0];
  if (v122[0])
  {
    uint64_t v11 = memorySizeString(v122[0]);
    unint64_t v12 = v116;
    uint64_t v13 = memorySizeString(v116);
    [(__CFString *)v9 appendFormat:@"ReadOnly portion of Libraries: Total=%s resident=%s(%.0f%%) swapped_out_or_unallocated=%s(%.0f%%)\n", v11, v13, (float)((float)((float)v12 * 100.0) / (float)v10), memorySizeString(v115), (float)((float)((float)v115 * 100.0) / (float)v10)];
  }
  unint64_t v101 = v8;
  v98 = v9;
  unsigned int v14 = v6->_regions;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v116 objects:v122 count:16];
  unsigned int v97 = v4;
  v99 = (char *)v6;
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    unint64_t v19 = 0;
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    uint64_t v22 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v117 != v22) {
          objc_enumerationMutation(v14);
        }
        uint64_t v24 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        if (!*(unsigned char *)(v24 + 48) && (*(unsigned char *)(v24 + 24) & 2) != 0 && !*(unsigned char *)(v24 + 49))
        {
          if (*(unsigned char *)(v24 + 50) == 2)
          {
            uint64_t v25 = *(void *)(v24 + 160);
            uint64_t v26 = *(void *)(v24 + 176);
            uint64_t v27 = v26 + v25;
            unint64_t v28 = v20;
            unint64_t v20 = v26 + v25;
          }
          else
          {
            unint64_t v28 = *(void *)(v24 + 168);
            uint64_t v25 = *(void *)(v24 + 160);
            uint64_t v26 = *(void *)(v24 + 176);
            uint64_t v27 = v25 + v26;
          }
          uint64_t v29 = *(void *)(v24 + 16);
          v21 += v29;
          v20 += v28;
          v19 += v25;
          v17 += v26;
          unint64_t v18 = v29 + v18 - v27;
          *(unsigned char *)(v24 + 48) = 1;
        }
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v116 objects:v122 count:16];
    }
    while (v16);

    uint64_t v4 = v97;
    id v6 = (VMUVMRegionIdentifier *)v99;
    if (v21)
    {
      uint64_t v30 = memorySizeString(v21);
      uint64_t v31 = memorySizeString(v20);
      uint64_t v32 = memorySizeString(v19);
      double v33 = (float)((float)((float)v19 * 100.0) / (float)v21);
      uint64_t v34 = memorySizeString(v17);
      [(__CFString *)v98 appendFormat:@"Writable regions: Total=%s written=%s(%.0f%%) resident=%s(%.0f%%) swapped_out=%s(%.0f%%) unallocated=%s(%.0f%%)\n", v30, v31, (float)((float)((float)v20 * 100.0) / (float)v21), v32, *(void *)&v33, v34, (float)((float)((float)v17 * 100.0) / (float)v21), memorySizeString(v18), (float)((float)((float)v18 * 100.0) / (float)v21)];
    }
  }
  else
  {
  }
  long long v36 = v6->_regions;
  v102 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v37 = v36;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v116 objects:v122 count:16];
  if (!v38)
  {
    unsigned int v92 = 0;
    unint64_t v90 = 0;
    unint64_t v91 = 0;
    unint64_t v40 = 0;
    unint64_t v88 = 0;
    unint64_t v89 = 0;
    unint64_t v41 = 0;
    unint64_t v42 = 0;
    unint64_t v44 = v101;
    goto LABEL_56;
  }
  uint64_t v39 = v38;
  unsigned int v92 = 0;
  unint64_t v90 = 0;
  unint64_t v91 = 0;
  unint64_t v40 = 0;
  unint64_t v88 = 0;
  unint64_t v89 = 0;
  unint64_t v41 = 0;
  unint64_t v42 = 0;
  uint64_t v43 = *(void *)v117;
  unint64_t v44 = v101;
  v105 = v37;
  do
  {
    for (uint64_t j = 0; j != v39; ++j)
    {
      if (*(void *)v117 != v43) {
        objc_enumerationMutation(v37);
      }
      uint64_t v46 = *(void *)(*((void *)&v116 + 1) + 8 * j);
      if ((*(unsigned char *)(v46 + 132) & 1) == 0
        && ([*(id *)(*((void *)&v116 + 1) + 8 * j) isNullRegion] & 1) == 0
        && ((v44 & 0x40) != 0
         || (*(unsigned char *)(v46 + 132) & 8) != 0
         || ([*(id *)(v46 + 32) hasPrefix:VMUunusedSharedLibLabelPrefix] & 1) == 0))
      {
        unint64_t v47 = v40;
        unint64_t v48 = v41;
        long long v49 = *(__CFString **)(v46 + 32);
        if (!v49) {
          long long v49 = @"unknown type";
        }
        long long v50 = v49;
        if ([(__CFString *)v50 hasPrefix:@"MALLOC"])
        {
          if ((v44 & 0x100) == 0)
          {
LABEL_45:
            if ((*(unsigned char *)(v46 + 132) & 8) != 0)
            {

              long long v50 = @"unused but dirty shlib __DATA";
            }
            long long v52 = [v102 objectForKey:v50];
            if (!v52)
            {
              long long v52 = objc_alloc_init(VMUVMRegion);
              objc_storeStrong((id *)&v52->type, v50);
              [v102 setObject:v52 forKey:v50];
            }
            [(VMUVMRegion *)v52 addInfoFromRegion:v46];
            if (([(id)v46 isAnalysisToolRegion] & 1) == 0)
            {
              v47 += *(void *)(v46 + 16);
              v91 += *(void *)(v46 + 160);
              v90 += *(void *)(v46 + 184);
              v89 += *(void *)(v46 + 176);
              v48 += *(void *)(v46 + 192);
              ++v92;
              v88 += *(void *)(v46 + 200);
              v42 += *(void *)(v46 + 208);
            }

            unint64_t v44 = v101;
            unint64_t v41 = v48;
            unint64_t v40 = v47;
            long long v37 = v105;
            continue;
          }
        }
        else
        {
          char v51 = [(__CFString *)v50 hasPrefix:@"TC malloc"];
          if ((v44 & 0x100) == 0 || (v51 & 1) == 0) {
            goto LABEL_45;
          }
        }
        if (*(_DWORD *)(v46 + 24) && *(unsigned char *)(v46 + 50) != 3)
        {

          long long v50 = @"MALLOC";
        }
        goto LABEL_45;
      }
    }
    uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v116 objects:v122 count:16];
  }
  while (v39);
LABEL_56:
  unint64_t v84 = v42;

  long long v35 = v98;
  [(__CFString *)v98 appendString:@"\n"];
  unint64_t v86 = v41;
  if ((v44 & 0x100000) != 0)
  {
    id v54 = [v102 keysSortedByValueUsingComparator:&__block_literal_global_224];
  }
  else
  {
    v53 = [v102 allKeys];
    id v54 = [v53 sortedArrayUsingSelector:sel_compare_];
  }
  unint64_t v85 = v40;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v55 = v54;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v111 objects:v121 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    unsigned int v58 = 0;
    uint64_t v59 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v57; ++k)
      {
        if (*(void *)v112 != v59) {
          objc_enumerationMutation(v55);
        }
        v61 = *(void **)(*((void *)&v111 + 1) + 8 * k);
        if ([v61 length] > (unint64_t)v58) {
          unsigned int v58 = [v61 length];
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v111 objects:v121 count:16];
    }
    while (v57);
  }
  else
  {
    unsigned int v58 = 0;
  }

  if (v58 >= 0x3C) {
    unsigned int v62 = 60;
  }
  else {
    unsigned int v62 = v58;
  }
  unsigned int v63 = [@"TOTAL, minus reserved VM space" length];
  if (v62 <= v63) {
    uint64_t v64 = v63;
  }
  else {
    uint64_t v64 = v62;
  }
  if (v4 <= 1) {
    v65 = "SIZE";
  }
  else {
    v65 = "PAGES";
  }
  appendTextLine(v98, v44, v4 > 1, v64, (uint64_t)", (uint64_t)"VIRTUAL", (uint64_t)"RESIDENT", (uint64_t)"DIRTY", (uint64_t)"SWAPPED", (uint64_t)"VOLATILE", (uint64_t)"NONVOL", (uint64_t)"EMPTY", (uint64_t)" REGION", (uint64_t)");
  appendTextLine(v98, v44, v4 > 1, v64, (uint64_t)"REGION TYPE", (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)v65, (uint64_t)"   COUNT (non-coalesced)", (uint64_t)"");
  v66 = objc_opt_new();
  appendTextLine(v66, v44, v4 > 1, v64, (uint64_t)"===========", (uint64_t)"=======", (uint64_t)"========", (uint64_t)"=====", (uint64_t)"=======", (uint64_t)"========", (uint64_t)"======", (uint64_t)"=====", (uint64_t)"=======", (uint64_t)"");
  v87 = v66;
  [(__CFString *)v98 appendString:v66];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = v55;
  uint64_t v100 = [obj countByEnumeratingWithState:&v107 objects:v120 count:16];
  unsigned int v96 = v64;
  if (v100)
  {
    uint64_t v93 = 0;
    uint64_t v95 = *(void *)v108;
    do
    {
      for (uint64_t m = 0; m != v100; ++m)
      {
        if (*(void *)v108 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = [v102 objectForKeyedSubscript:*(void *)(*((void *)&v107 + 1) + 8 * m)];
        uint64_t v69 = v68;
        if ((v44 & 0x100) != 0 || ([*(id *)(v68 + 32) hasPrefix:@"MALLOC_"] & 1) == 0)
        {
          if ([*(id *)(v69 + 32) hasPrefix:off_1E973AFB8[0]])
          {
            v70 = @"        not counted in TOTAL below";
          }
          else if ([*(id *)(v69 + 32) hasSuffix:VMUreservedLabelSuffix])
          {
            v70 = [NSString stringWithFormat:@"        %@", VMUreservedVMaddressSpaceString];
            v93 += *(void *)(v69 + 16);
          }
          else
          {
            v70 = &stru_1EFE27F38;
          }
        }
        else
        {
          v70 = @"        see MALLOC ZONE table below";
        }
        char v106 = v99[48];
        uint64_t v104 = [*(id *)(v69 + 32) UTF8String];
        unint64_t v103 = *(void *)(v69 + 16);
        unint64_t v71 = *(void *)(v69 + 160);
        unint64_t v72 = *(void *)(v69 + 184);
        unint64_t v73 = *(void *)(v69 + 176);
        unint64_t v74 = *(void *)(v69 + 192);
        uint64_t v64 = *(void *)(v69 + 200);
        unint64_t v75 = *(void *)(v69 + 208);
        unsigned int v76 = *(_DWORD *)(v69 + 152);
        v77 = v70;
        unsigned int v83 = v76;
        unint64_t v82 = v64;
        unint64_t v81 = v73;
        unint64_t v80 = v72;
        long long v35 = v98;
        unint64_t v44 = v101;
        LODWORD(v64) = v96;
        uint64_t v4 = v97;
        appendStatsLine(v98, v101, v97, v106, v96, v104, v103, v71, v80, v81, v74, v82, v75, v83, [(__CFString *)v77 UTF8String]);
      }
      uint64_t v100 = [obj countByEnumeratingWithState:&v107 objects:v120 count:16];
    }
    while (v100);
  }
  else
  {
    uint64_t v93 = 0;
  }

  [(__CFString *)v35 appendString:v87];
  appendStatsLine(v35, v44, v4, v99[48], v64, (uint64_t)"TOTAL", v85, v91, v90, v89, v86, v88, v84, v92, (uint64_t)"");
  if (v93) {
    appendStatsLine(v35, v44, v4, v99[48], v96, [@"TOTAL, minus reserved VM space" UTF8String], v85 - v93, v91, v90, v89, v86, v88, v84, v92, (uint64_t)@"");
  }

  if ((v44 & 0x100) == 0)
  {
    [(__CFString *)v35 appendString:@"\n"];
    v78 = [v99 descriptionForMallocZoneTotals:v44 memorySizeDivisor:v4];
    [(__CFString *)v35 appendString:v78];
  }
LABEL_100:

  return v35;
}

BOOL __70__VMUVMRegionIdentifier_descriptionForRegionTotals_memorySizeDivisor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a3 + 176) + *(void *)(a3 + 184) > *(void *)(a2 + 176) + *(void *)(a2 + 184);
}

- (BOOL)recordedPhysFootprint
{
  return self->_recordedPhysFootprint;
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return self->_didPhysFootprintDirtyAccounting;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

@end