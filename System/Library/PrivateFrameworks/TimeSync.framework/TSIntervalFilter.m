@interface TSIntervalFilter
- (TSIntervalFilter)initWithExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4 filterSize:(unsigned __int8)a5;
- (id).cxx_construct;
- (unint64_t)_calculateNewTimestamp:(unint64_t)a3;
- (unint64_t)addTimestamp:(unint64_t)a3;
- (unint64_t)addTimestamp:(unint64_t)a3 entry:(int64_t *)a4;
- (unint64_t)filterCount;
- (unint64_t)filterCountForEntry:(int64_t)validEntry;
- (unint64_t)multiIntervalTime;
- (unint64_t)multiIntervalTimeForEntry:(int64_t)validEntry;
- (void)changeToNewFilterSize:(unsigned __int8)a3;
- (void)dealloc;
- (void)resetFilter;
- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3;
- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4;
@end

@implementation TSIntervalFilter

- (TSIntervalFilter)initWithExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4 filterSize:(unsigned __int8)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TSIntervalFilter;
  v8 = [(TSIntervalFilter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_expectedInterval = a3;
    v8->_multiIntervalCount = a4;
    v8->_filterCount = 0;
    v8->_timestampIndex = 0;
    v8->_validEntry = -1;
    v8->_filterSize = a5;
    v8->_filterOffset = a3 << a5;
    v8->_filteredTimestamps = (unint64_t *)malloc_type_calloc(a4 + 1, 8uLL, 0x100004000313F17uLL);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TimeSync.TSIntervalFilter", 0);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v10;

    if (!v9->_filteredTimestamps || !v9->_syncQueue)
    {

      return 0;
    }
  }
  return v9;
}

- (unint64_t)_calculateNewTimestamp:(unint64_t)a3
{
  unint64_t v4 = self->_filterOffset + a3;
  if (self->_filterCount)
  {
    unsigned int filterSize = self->_filterSize;
    unint64_t v6 = v4 << self->_filterSize;
    unint64_t v7 = v6;
    if (filterSize <= 0x3F) {
      unint64_t v6 = v4 >> -(char)filterSize;
    }
    else {
      unint64_t v7 = 0;
    }
    if (filterSize == 64)
    {
      unint64_t v7 = 0;
      unint64_t v6 = self->_filterOffset + a3;
    }
    if (self->_filterSize)
    {
      unint64_t v4 = v7;
      unint64_t v8 = v6;
    }
    else
    {
      unint64_t v8 = self->_filterSize;
    }
    v45.unint64_t lo = v4;
    v45.hi = v8;
    IIR(&self->_filteredSnapshot, v45, filterSize);
    IOTS_U128 v9 = (IOTS_U128)(__PAIR128__(v8 - self->_filteredSnapshot.hi, v4) - self->_filteredSnapshot.lo);
    p_filteredOffset = &self->_filteredOffset;
    unsigned int v11 = self->_filterSize;
  }
  else
  {
    unsigned int v12 = self->_filterSize;
    if (v12 == 64)
    {
      unint64_t v17 = 0;
      self->_filteredSnapshot.unint64_t lo = 0;
      self->_filteredSnapshot.hi = v4;
      p_filteredSnapshot = &self->_filteredSnapshot;
    }
    else
    {
      unint64_t expectedInterval = self->_expectedInterval;
      if (self->_filterSize)
      {
        unint64_t v19 = expectedInterval << v12;
        unint64_t v20 = expectedInterval >> -(char)v12;
        unint64_t v21 = expectedInterval << v12;
        if (v12 <= 0x3F) {
          unint64_t v19 = v20;
        }
        else {
          unint64_t v21 = 0;
        }
        BOOL v14 = v4 >= v21;
        unint64_t v22 = v4 - v21;
        if (v14) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = -1;
        }
        unint64_t v24 = v23 - v19;
        unint64_t v25 = v22 << v12;
        unint64_t v26 = (v24 << v12) | (v22 >> -(char)v12);
        unint64_t v27 = v22 << v12;
        if (v12 <= 0x3F) {
          unint64_t v28 = v27;
        }
        else {
          unint64_t v28 = 0;
        }
        if (v12 <= 0x3F) {
          unint64_t v29 = v26;
        }
        else {
          unint64_t v29 = v25;
        }
        self->_filteredSnapshot.unint64_t lo = v28;
        self->_filteredSnapshot.hi = v29;
        p_filteredSnapshot = &self->_filteredSnapshot;
        if (v12 <= 0x3F) {
          unint64_t v17 = v4 << v12;
        }
        else {
          unint64_t v17 = 0;
        }
        if (v12 <= 0x3F) {
          v4 >>= -(char)v12;
        }
        else {
          v4 <<= v12;
        }
      }
      else
      {
        BOOL v14 = v4 >= expectedInterval;
        unint64_t v15 = v4 - expectedInterval;
        if (v14) {
          unint64_t v16 = 0;
        }
        else {
          unint64_t v16 = -1;
        }
        self->_filteredSnapshot.unint64_t lo = v15;
        self->_filteredSnapshot.hi = v16;
        p_filteredSnapshot = &self->_filteredSnapshot;
        unint64_t v17 = v4;
        unint64_t v4 = 0;
      }
    }
    v46.unint64_t lo = v17;
    v46.hi = v4;
    IIR(p_filteredSnapshot, v46, v12);
    IOTS_U128 v30 = (IOTS_U128)(__PAIR128__(v4 - self->_filteredSnapshot.hi, v17) - self->_filteredSnapshot.lo);
    unint64_t v31 = IOTS_uint64mul(self->_expectedInterval, ~(-1 << self->_filterSize));
    unsigned int v11 = self->_filterSize;
    unsigned __int8 v33 = self->_filterSize;
    unint64_t v34 = v31 << v33;
    unint64_t v35 = (v31 >> -(char)v11) | (v32 << v33);
    unint64_t v36 = v31 << v33;
    if (v11 <= 0x3F) {
      unint64_t v34 = v35;
    }
    else {
      unint64_t v36 = 0;
    }
    if (v11 == 64)
    {
      unint64_t v36 = 0;
      unint64_t v34 = v31;
    }
    if (!self->_filterSize)
    {
      unint64_t v36 = v31;
      unint64_t v34 = v32;
    }
    self->_filteredOffset.unint64_t lo = v36;
    self->_filteredOffset.hi = v34;
    p_filteredOffset = &self->_filteredOffset;
    IOTS_U128 v9 = v30;
  }
  IIR(p_filteredOffset, v9, v11);
  unint64_t lo = self->_filteredOffset.lo;
  unint64_t v38 = self->_filteredSnapshot.lo;
  BOOL v14 = __CFADD__(v38, lo);
  unint64_t v39 = v38 + lo;
  LODWORD(v40) = v14;
  if (v39 < v38) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = v40;
  }
  unsigned int v41 = self->_filterSize;
  if (self->_filterSize)
  {
    unint64_t v42 = self->_filteredSnapshot.hi + self->_filteredOffset.hi + v40;
    if (v41 != 64)
    {
      unint64_t v43 = (v42 << -(char)v41) | (v39 >> v41);
      if (v41 <= 0x3F) {
        unint64_t v42 = v43;
      }
      else {
        v42 >>= v41;
      }
    }
  }
  else
  {
    unint64_t v42 = v39;
  }
  return v42 - self->_filterOffset;
}

- (unint64_t)addTimestamp:(unint64_t)a3
{
  return [(TSIntervalFilter *)self addTimestamp:a3 entry:0];
}

- (unint64_t)addTimestamp:(unint64_t)a3 entry:(int64_t *)a4
{
  uint64_t v8 = 0;
  IOTS_U128 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__TSIntervalFilter_addTimestamp_entry___block_invoke;
  v7[3] = &unk_1E622B280;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(syncQueue, v7);
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__TSIntervalFilter_addTimestamp_entry___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 24))
  {
    **(void **)(v2 + 32) = a1[6];
    *(void *)(*(void *)(a1[4] + 32) + 8 * *(unsigned int *)(a1[4] + 16)) = a1[6] - *(void *)(a1[4] + 8);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(unsigned int *)(v3 + 16);
    if (v4 >= 2)
    {
      do
      {
        uint64_t v5 = a1[4];
        uint64_t v6 = *(void *)(v5 + 32);
        uint64_t v7 = *(void *)(v6 + 8 * v4--) - *(void *)(v5 + 8);
        *(void *)(v6 + 8 * v4) = v7;
      }
      while ((v4 & 0xFFFFFFFE) != 0);
      uint64_t v3 = a1[4];
    }
    *(_DWORD *)(v3 + 40) = 0;
    uint64_t v2 = a1[4];
  }
  uint64_t result = [(id)v2 _calculateNewTimestamp:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  *(void *)(*(void *)(a1[4] + 32) + 8 * (*(_DWORD *)(a1[4] + 40))++) = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v9 = a1[4];
  if (*(_DWORD *)(v9 + 40) == *(_DWORD *)(v9 + 16) + 1)
  {
    *(_DWORD *)(v9 + 40) = 0;
    uint64_t v9 = a1[4];
  }
  ++*(void *)(v9 + 24);
  uint64_t v10 = a1[4];
  uint64_t v11 = (*(_DWORD *)(v10 + 176) + 1) & 7;
  *(void *)(v10 + 8 * v11 + 48) = *(void *)(v10 + 24);
  *(void *)(a1[4] + 8 * v11 + 112) = *(void *)(*(void *)(a1[5] + 8) + 24)
                                     - *(void *)(*(void *)(a1[4] + 32) + 8 * *(unsigned int *)(a1[4] + 40));
  *(void *)(a1[4] + 176) = v11;
  unsigned int v12 = (void *)a1[7];
  if (v12) {
    *unsigned int v12 = v11;
  }
  return result;
}

- (unint64_t)multiIntervalTime
{
  return [(TSIntervalFilter *)self multiIntervalTimeForEntry:-1];
}

- (unint64_t)multiIntervalTimeForEntry:(int64_t)validEntry
{
  unint64_t result = -1;
  if (validEntry < 0) {
    validEntry = self->_validEntry;
  }
  if ((unint64_t)validEntry <= 7) {
    return self->_timestampIntervals[validEntry];
  }
  return result;
}

- (unint64_t)filterCount
{
  return [(TSIntervalFilter *)self filterCountForEntry:-1];
}

- (unint64_t)filterCountForEntry:(int64_t)validEntry
{
  if (validEntry < 0) {
    validEntry = self->_validEntry;
  }
  if ((unint64_t)validEntry > 7) {
    return 0;
  }
  else {
    return self->_timestampCount[validEntry];
  }
}

- (void)resetFilter
{
  unint64_t v3 = [(TSIntervalFilter *)self multiIntervalTime];
  if (v3 == -1) {
    unint64_t expectedInterval = self->_expectedInterval;
  }
  else {
    unint64_t expectedInterval = v3 / self->_multiIntervalCount;
  }
  [(TSIntervalFilter *)self resetFilterWithNewExpectedInterval:expectedInterval];
}

- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3
{
}

- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TSIntervalFilter_resetFilterWithNewExpectedInterval_multiIntervalCount___block_invoke;
  block[3] = &unk_1E622B2A8;
  unsigned int v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(syncQueue, block);
}

void *__74__TSIntervalFilter_resetFilterWithNewExpectedInterval_multiIntervalCount___block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = result[4];
  if (*(_DWORD *)(v2 + 16) != *((_DWORD *)result + 12))
  {
    free(*(void **)(v2 + 32));
    *(_DWORD *)(v1[4] + 16) = *((_DWORD *)v1 + 12);
    unint64_t result = malloc_type_calloc((*(_DWORD *)(v1[4] + 16) + 1), 8uLL, 0x100004000313F17uLL);
    *(void *)(v1[4] + 32) = result;
    uint64_t v2 = v1[4];
  }
  *(void *)(v2 + 8) = v1[5];
  *(void *)(v1[4] + 200) = *(void *)(v1[4] + 8) << *(unsigned char *)(v1[4] + 192);
  *(void *)(v1[4] + 24) = 0;
  *(void *)(v1[4] + 176) = -1;
  return result;
}

- (void)changeToNewFilterSize:(unsigned __int8)a3
{
  self->_unsigned int filterSize = a3;
  [(TSIntervalFilter *)self resetFilter];
}

- (void)dealloc
{
  free(self->_filteredTimestamps);
  v3.receiver = self;
  v3.super_class = (Class)TSIntervalFilter;
  [(TSIntervalFilter *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

@end