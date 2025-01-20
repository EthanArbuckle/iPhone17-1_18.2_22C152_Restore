@interface TSIntervalTimeLineFilter
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)rateRatio;
- (BOOL)canConvertTime;
- (TSIntervalTimeLineFilter)initWithExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 filterSize:(unsigned __int8)a5;
- (unint64_t)domainAIntervalFromDomainBInterval:(unint64_t)a3;
- (unint64_t)domainATimeFromDomainBTime:(unint64_t)a3;
- (unint64_t)domainBIntervalFromDomainAInterval:(unint64_t)a3;
- (unint64_t)domainBTimeFromDomainATime:(unint64_t)a3;
- (void)addTimestamps:(id)a3;
- (void)changeToNewFilterSize:(unsigned __int8)a3;
- (void)getAnchors:(id *)a3 andRateRatio:(id *)a4;
- (void)resetFilter;
- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4;
- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 multiIntervalCount:(unsigned int)a5;
@end

@implementation TSIntervalTimeLineFilter

- (TSIntervalTimeLineFilter)initWithExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 filterSize:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSIntervalTimeLineFilter;
  v8 = [(TSIntervalTimeLineFilter *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_validIndex = -1;
    v10 = [[TSIntervalFilter alloc] initWithExpectedInterval:a3 multiIntervalCount:1 filterSize:v5];
    aIntervalFilter = v9->_aIntervalFilter;
    v9->_aIntervalFilter = v10;

    v12 = [[TSIntervalFilter alloc] initWithExpectedInterval:a4 multiIntervalCount:1 filterSize:v5];
    bIntervalFilter = v9->_bIntervalFilter;
    v9->_bIntervalFilter = v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.TimeSync.TSIntervalTimeLineFilter", 0);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v14;

    if (!v9->_aIntervalFilter || !v9->_bIntervalFilter || !v9->_syncQueue)
    {

      return 0;
    }
  }
  return v9;
}

- (void)addTimestamps:(id)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TSIntervalTimeLineFilter_addTimestamps___block_invoke;
  block[3] = &unk_1E622A9F0;
  block[4] = self;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v5 = a3;
  dispatch_sync(syncQueue, block);
}

uint64_t __42__TSIntervalTimeLineFilter_addTimestamps___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (*(_DWORD *)(v2 + 272) + 1) & 7;
  *(void *)(v2 + 8 + 8 * v3) = [*(id *)(v2 + 280) addTimestamp:a1[5] entry:v2 + 136 + 8 * v3];
  uint64_t result = [*(id *)(a1[4] + 288) addTimestamp:a1[6] entry:a1[4] + 200 + 8 * v3];
  *(void *)(a1[4] + 72 + 8 * v3) = result;
  *(void *)(a1[4] + 272) = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)rateRatio
{
  unint64_t validIndex = self->_validIndex;
  if (validIndex > 7)
  {
    unint64_t v5 = -1;
    unint64_t v4 = -1;
  }
  else
  {
    unint64_t v4 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
    unint64_t v5 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
  }
  unint64_t v6 = v4;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (void)getAnchors:(id *)a3 andRateRatio:(id *)a4
{
  if (a3)
  {
    a3->var0 = -1;
    a3->var1 = -1;
  }
  if (a4)
  {
    a4->var0 = -1;
    a4->var1 = -1;
  }
  unint64_t validIndex = self->_validIndex;
  if (validIndex <= 7)
  {
    if (a3)
    {
      a3->var0 = self->_AAnchor[validIndex];
      a3->var1 = self->_BAnchor[validIndex];
    }
    if (a4)
    {
      a4->var0 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
      a4->var1 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
    }
  }
}

- (unint64_t)domainATimeFromDomainBTime:(unint64_t)a3
{
  int64_t validIndex = self->_validIndex;
  if (validIndex > 7) {
    return -1;
  }
  unint64_t v6 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
  unint64_t v7 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
  unint64_t v8 = self->_BAnchor[validIndex];
  uint64_t v9 = self->_AAnchor[validIndex];
  return TSTimeXtoTimeY(a3, v8, v7, v9, v6);
}

- (unint64_t)domainAIntervalFromDomainBInterval:(unint64_t)a3
{
  int64_t validIndex = self->_validIndex;
  if (validIndex > 7) {
    return -1;
  }
  unint64_t v6 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
  unint64_t v7 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
  return TSIntervalXtoIntervalY(a3, v7, v6);
}

- (unint64_t)domainBTimeFromDomainATime:(unint64_t)a3
{
  int64_t validIndex = self->_validIndex;
  if (validIndex > 7) {
    return -1;
  }
  unint64_t v6 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
  unint64_t v7 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
  unint64_t v8 = self->_AAnchor[validIndex];
  uint64_t v9 = self->_BAnchor[validIndex];
  return TSTimeXtoTimeY(a3, v8, v6, v9, v7);
}

- (unint64_t)domainBIntervalFromDomainAInterval:(unint64_t)a3
{
  int64_t validIndex = self->_validIndex;
  if (validIndex > 7) {
    return -1;
  }
  unint64_t v6 = [(TSIntervalFilter *)self->_aIntervalFilter multiIntervalTimeForEntry:self->_AEntries[validIndex]];
  unint64_t v7 = [(TSIntervalFilter *)self->_bIntervalFilter multiIntervalTimeForEntry:self->_BEntries[validIndex]];
  return TSIntervalXtoIntervalY(a3, v6, v7);
}

- (void)resetFilter
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__TSIntervalTimeLineFilter_resetFilter__block_invoke;
  block[3] = &unk_1E622AA18;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __39__TSIntervalTimeLineFilter_resetFilter__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 280) resetFilter];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 288);
  return [v2 resetFilter];
}

- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval___block_invoke;
  block[3] = &unk_1E622A9F0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(syncQueue, block);
}

uint64_t __94__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 280) resetFilterWithNewExpectedInterval:a1[5]];
  uint64_t v2 = *(void **)(a1[4] + 288);
  uint64_t v3 = a1[6];
  return [v2 resetFilterWithNewExpectedInterval:v3];
}

- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 multiIntervalCount:(unsigned int)a5
{
  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval_multiIntervalCount___block_invoke;
  v6[3] = &unk_1E622AA40;
  v6[4] = self;
  v6[5] = a3;
  unsigned int v7 = a5;
  v6[6] = a4;
  dispatch_sync(syncQueue, v6);
}

uint64_t __113__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval_multiIntervalCount___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 280) resetFilterWithNewExpectedInterval:*(void *)(a1 + 40) multiIntervalCount:*(unsigned int *)(a1 + 56)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 288);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  return [v2 resetFilterWithNewExpectedInterval:v3 multiIntervalCount:v4];
}

- (void)changeToNewFilterSize:(unsigned __int8)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__TSIntervalTimeLineFilter_changeToNewFilterSize___block_invoke;
  v4[3] = &unk_1E622AA68;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __50__TSIntervalTimeLineFilter_changeToNewFilterSize___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 280) changeToNewFilterSize:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 288);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 changeToNewFilterSize:v3];
}

- (BOOL)canConvertTime
{
  return self->_validIndex != -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bIntervalFilter, 0);
  objc_storeStrong((id *)&self->_aIntervalFilter, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end