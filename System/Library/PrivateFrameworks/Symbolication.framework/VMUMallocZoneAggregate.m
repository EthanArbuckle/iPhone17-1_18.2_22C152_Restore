@interface VMUMallocZoneAggregate
- (VMUMallocZoneAggregate)initWithZoneName:(id)a3 options:(id)a4;
- (id)_classDisplayName:(id)a3;
- (id)classInfosSortedByName;
- (id)classInfosSortedBySizeOrCount:(unsigned int)a3;
- (id)classInfosSortedByTotalInternalFragmentation;
- (unint64_t)allocatedSize;
- (unint64_t)virtualSize;
- (unsigned)blockCount;
- (void)dealloc;
- (void)enumerateAllocationSizesWithBlock:(id)a3;
- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)incrementAllocationCountForClassInfo:(id)a3 size:(unint64_t)a4;
- (void)incrementVirtualSize:(int64_t)a3;
- (void)modifySize:(int64_t)a3 count:(int64_t)a4 forClassInfo:(id)a5;
@end

@implementation VMUMallocZoneAggregate

- (VMUMallocZoneAggregate)initWithZoneName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VMUMallocZoneAggregate;
  v9 = [(VMUMallocZoneAggregate *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_zoneName, a3);
    uint64_t v11 = objc_opt_new();
    quantaCounter = v10->_quantaCounter;
    v10->_quantaCounter = (NSCountedSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:259];
    classInfoToClassCountDataMap = v10->_classInfoToClassCountDataMap;
    v10->_classInfoToClassCountDataMap = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:259];
    binaryNameToBinaryCountDataMap = v10->_binaryNameToBinaryCountDataMap;
    v10->_binaryNameToBinaryCountDataMap = (NSMapTable *)v15;
  }
  return v10;
}

- (void)dealloc
{
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_classInfoToClassCountDataMap);
  value = 0;
  while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    v3 = (void *)*((void *)value + 4);
    if (v3)
    {
      free(v3);
      *((void *)value + 4) = 0;
    }
  }
  NSEndMapTableEnumeration(&enumerator);
  v4.receiver = self;
  v4.super_class = (Class)VMUMallocZoneAggregate;
  [(VMUMallocZoneAggregate *)&v4 dealloc];
}

- (void)incrementVirtualSize:(int64_t)a3
{
  self->_virtualSize += a3;
}

- (void)incrementAllocationCountForClassInfo:(id)a3 size:(unint64_t)a4
{
  self->_allocatedSize += a4;
  ++self->_blockCount;
  quantaCounter = self->_quantaCounter;
  id v7 = NSNumber;
  id v9 = a3;
  id v8 = [v7 numberWithUnsignedLongLong:a4];
  [(NSCountedSet *)quantaCounter addObject:v8];

  [(VMUMallocZoneAggregate *)self modifySize:a4 count:1 forClassInfo:v9];
}

- (void)modifySize:(int64_t)a3 count:(int64_t)a4 forClassInfo:(id)a5
{
  id key = a5;
  id v8 = (void *)MEMORY[0x1AD0D9F90]();
  if (a3 >= 0) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = -a3;
  }
  v10 = NSMapGet(self->_classInfoToClassCountDataMap, key);
  if (!v10)
  {
    v10 = malloc_type_malloc(0x30uLL, 0x102004095A10554uLL);
    void *v10 = 0;
    v10[1] = 0;
    *((_DWORD *)v10 + 10) = [key ivarGapForClassHierarchy];
    v10[3] = 0;
    v10[4] = 0;
    v10[2] = 0;
    NSMapInsert(self->_classInfoToClassCountDataMap, key, v10);
  }
  uint64_t v11 = [key binaryName];
  if (![(__CFString *)v11 length])
  {

    uint64_t v11 = @"non-object";
  }
  v12 = NSMapGet(self->_binaryNameToBinaryCountDataMap, v11);
  if (!v12)
  {
    v12 = malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL);
    void *v12 = 0;
    v12[1] = 0;
    NSMapInsert(self->_binaryNameToBinaryCountDataMap, v11, v12);
  }
  BOOL v13 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions showSizes];
  unint64_t v14 = *v10;
  if (v13 && v14)
  {
    if (!v10[3] && v10[1] / v14 != v9)
    {
      v10[3] = 4;
      uint64_t v15 = malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
      v10[4] = v15;
      v10[2] = 1;
      unint64_t v14 = *v10;
      *uint64_t v15 = v10[1] / *v10;
      v15[1] = v14;
    }
    unint64_t v16 = v10[2];
    if (v16)
    {
      unint64_t v17 = 0;
      objc_super v18 = (void *)v10[4];
      unsigned int v19 = 1;
      while (v16 != v17)
      {
        unint64_t v20 = v18[2 * v17];
        if (v9 < v20) {
          goto LABEL_23;
        }
        if (v9 == v20)
        {
          v18[2 * v17 + 1] += a4;
          goto LABEL_29;
        }
        unint64_t v17 = v19;
        if (v16 < v19++) {
          goto LABEL_29;
        }
      }
      unint64_t v17 = v10[2];
LABEL_23:
      if (v16 == v10[3])
      {
        v10[3] = 4 * v16;
        objc_super v18 = malloc_type_realloc(v18, v16 << 6, 0xDA27BE6uLL);
        v10[4] = v18;
        unint64_t v16 = v10[2];
      }
      if (v16 > v17)
      {
        memmove(&v18[2 * v19], &v18[2 * v17], 16 * (v16 - v17));
        objc_super v18 = (void *)v10[4];
        unint64_t v16 = v10[2];
      }
      v22 = &v18[2 * v17];
      unint64_t *v22 = v9;
      v22[1] = a4;
      v10[2] = v16 + 1;
      unint64_t v14 = *v10;
    }
  }
LABEL_29:
  int64_t v23 = v10[1] + a3;
  void *v10 = v14 + a4;
  v10[1] = v23;
  int64_t v24 = v12[1] + a3;
  *v12 += a4;
  v12[1] = v24;
}

- (id)_classDisplayName:(id)a3
{
  heapAndVMOptions = self->_heapAndVMOptions;
  id v4 = a3;
  if ([(VMUHeapAndVMAggregatorOptions *)heapAndVMOptions showRawClassNames]) {
    [v4 className];
  }
  else {
  v5 = [v4 displayName];
  }

  return v5;
}

- (id)classInfosSortedBySizeOrCount:(unsigned int)a3
{
  v5 = NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke;
  v8[3] = &unk_1E5D25560;
  v8[4] = self;
  unsigned int v9 = a3;
  v6 = [v5 sortedArrayUsingComparator:v8];

  return v6;
}

uint64_t __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)[v5 objectForKey:v7];
  unsigned int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v6];
  uint64_t v10 = v8[1];
  uint64_t v11 = *v8 - *v9;
  uint64_t v12 = v10 - v9[1];
  int v13 = *(_DWORD *)(a1 + 40);
  unint64_t v14 = [*(id *)(a1 + 32) _classDisplayName:v7];

  uint64_t v15 = [*(id *)(a1 + 32) _classDisplayName:v6];

  uint64_t v16 = _compareSizeCount(v13, v11, v12, v14, v15);
  return v16;
}

- (id)classInfosSortedByName
{
  v3 = NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke;
  v6[3] = &unk_1E5D25588;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 _classDisplayName:a2];
  id v8 = [*(id *)(a1 + 32) _classDisplayName:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)classInfosSortedByTotalInternalFragmentation
{
  v3 = NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke;
  v6[3] = &unk_1E5D25588;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v6];
  uint64_t v9 = *(void *)v8 * *(unsigned int *)(v8 + 40) - *(void *)v7 * *(unsigned int *)(v7 + 40);
  if (v9 <= 0)
  {
    if (v9 < 0)
    {
      uint64_t v10 = -1;
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) _classDisplayName:v5];
      uint64_t v12 = [*(id *)(a1 + 32) _classDisplayName:v6];
      uint64_t v10 = [v11 compare:v12];
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4 < 2)
  {
    uint64_t v7 = [(VMUMallocZoneAggregate *)self classInfosSortedBySizeOrCount:v4];
  }
  else if (v4 == 2)
  {
    uint64_t v7 = [(VMUMallocZoneAggregate *)self classInfosSortedByName];
  }
  else
  {
    if (v4 != 3) {
      -[VMUMallocZoneAggregate enumerateHeapAndVMSortedBy:withBlock:]();
    }
    uint64_t v7 = [(VMUMallocZoneAggregate *)self classInfosSortedByTotalInternalFragmentation];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v14 = -[NSMapTable objectForKey:](self->_classInfoToClassCountDataMap, "objectForKey:", v13, (void)v18);
        if ([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions showSizes] && v14[2])
        {
          uint64_t v15 = 0;
          unsigned int v16 = 1;
          do
          {
            (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v13, *(void *)(v14[4] + 16 * v15 + 8), *(void *)(v14[4] + 16 * v15) * *(void *)(v14[4] + 16 * v15 + 8));
            uint64_t v15 = v16;
          }
          while (v14[2] > (unint64_t)v16++);
        }
        else
        {
          (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v13, *v14, v14[1]);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = NSAllMapTableKeys(self->_binaryNameToBinaryCountDataMap);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke;
  v19[3] = &unk_1E5D255B0;
  v19[4] = self;
  unsigned int v20 = a3;
  id v8 = [v7 sortedArrayUsingComparator:v19];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v14 = [(NSMapTable *)self->_binaryNameToBinaryCountDataMap objectForKey:v13];
        (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v13, *v14, v14[1]);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }
}

uint64_t __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)[v5 objectForKey:v7];
  uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v6];
  uint64_t v10 = _compareSizeCount(*(_DWORD *)(a1 + 40), *v8 - *v9, v8[1] - v9[1], v7, v6);

  return v10;
}

- (void)enumerateAllocationSizesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, NSUInteger))a3;
  id v5 = [(NSCountedSet *)self->_quantaCounter allObjects];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_19];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v4[2](v4, [*(id *)(*((void *)&v12 + 1) + 8 * v11) unsignedLongLongValue], -[self->_quantaCounter countForObject:*(void *)(*((void *)&v12 + 1) + 8 * v11)]);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

uint64_t __60__VMUMallocZoneAggregate_enumerateAllocationSizesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 unsignedLongLongValue];
  uint64_t v6 = [v4 unsignedLongLongValue];

  if (v5 - v6 >= 1) {
    return 1;
  }
  else {
    return (v5 - v6) >> 63;
  }
}

- (unint64_t)virtualSize
{
  return self->_virtualSize;
}

- (unint64_t)allocatedSize
{
  return self->_allocatedSize;
}

- (unsigned)blockCount
{
  return self->_blockCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryNameToBinaryCountDataMap, 0);
  objc_storeStrong((id *)&self->_classInfoToClassCountDataMap, 0);
  objc_storeStrong((id *)&self->_quantaCounter, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_heapAndVMOptions, 0);
}

- (void)enumerateHeapAndVMSortedBy:withBlock:.cold.1()
{
}

@end