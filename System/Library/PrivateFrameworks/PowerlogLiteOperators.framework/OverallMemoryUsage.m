@interface OverallMemoryUsage
+ (id)accumulateMemoryAcrossPrioritiesWithFootprints:(id)a3 withComparator:(id)a4;
- (OverallMemoryUsage)init;
- (id)memoryAvailableAtOrBelowEachPriority;
- (id)memoryUsageAtEachPriority;
- (id)memoryUsedAtOrAboveEachPriority;
- (id)systemMemoryStatsDictionary;
- (void)addProcessFootprint:(unint64_t)a3 withPriority:(int)a4;
@end

@implementation OverallMemoryUsage

- (OverallMemoryUsage)init
{
  v29.receiver = self;
  v29.super_class = (Class)OverallMemoryUsage;
  v2 = [(OverallMemoryUsage *)&v29 init];
  if (v2)
  {
    host_t v3 = MEMORY[0x1D942A0E0]();
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    *(_OWORD *)host_info64_out = 0u;
    mach_msg_type_number_t host_info64_outCnt = 38;
    if (host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt))
    {

      v2 = 0;
    }
    else
    {
      uint64_t v4 = host_info64_out[3];
      integer_t v5 = host_info64_out[0];
      uint64_t v6 = HIDWORD(v24);
      uint64_t v7 = v27;
      uint64_t v8 = v28;
      uint64_t v10 = DWORD2(v27);
      uint64_t v9 = HIDWORD(v27);
      int v17 = 0;
      size_t v16 = 4;
      if (sysctlbyname("vm.pagesize", &v17, &v16, 0, 0))
      {
        v11 = v2;
        v2 = 0;
      }
      else
      {
        _wiredBytes = v17 * v4;
        _filebackedBytes = v17 * v10;
        _freeBytes = v17 * (unint64_t)(v5 - v6);
        _occupiedByCompressorBytes = v17 * v7;
        _storedInCompressorBytes = v8 * v17;
        _speculativeBytes = v17 * v6;
        _anonymousBytes = v17 * v9;
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v13 = (void *)_sumMemoryAtEachPriority;
        _sumMemoryAtEachPriority = (uint64_t)v12;

        v14 = [NSNumber numberWithUnsignedLongLong:_filebackedBytes + _freeBytes];
        [(id)_sumMemoryAtEachPriority setObject:v14 forKeyedSubscript:&unk_1F29E65F8];

        v11 = [NSNumber numberWithUnsignedLongLong:_wiredBytes];
        [(id)_sumMemoryAtEachPriority setObject:v11 forKeyedSubscript:&unk_1F29E6610];
      }
    }
    mach_port_deallocate(*MEMORY[0x1E4F14960], v3);
  }
  return v2;
}

- (void)addProcessFootprint:(unint64_t)a3 withPriority:(int)a4
{
  id v11 = [NSNumber numberWithInt:*(void *)&a4];
  integer_t v5 = objc_msgSend((id)_sumMemoryAtEachPriority, "objectForKeyedSubscript:");

  if (v5)
  {
    uint64_t v6 = [(id)_sumMemoryAtEachPriority objectForKeyedSubscript:v11];
    uint64_t v7 = [v6 unsignedLongValue];

    uint64_t v8 = NSNumber;
    unint64_t v9 = v7 + a3;
  }
  else
  {
    uint64_t v8 = NSNumber;
    unint64_t v9 = a3;
  }
  uint64_t v10 = [v8 numberWithUnsignedLongLong:v9];
  [(id)_sumMemoryAtEachPriority setObject:v10 forKeyedSubscript:v11];
}

- (id)memoryUsageAtEachPriority
{
  return (id)_sumMemoryAtEachPriority;
}

+ (id)accumulateMemoryAcrossPrioritiesWithFootprints:(id)a3 withComparator:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [v5 allKeys];
  long long v20 = v6;
  unint64_t v9 = [v8 sortedArrayUsingComparator:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int v17 = [v5 objectForKeyedSubscript:v16];
        v13 += [v17 unsignedLongValue];

        v18 = [NSNumber numberWithUnsignedLongLong:v13];
        [v7 setObject:v18 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v7;
}

- (id)memoryUsedAtOrAboveEachPriority
{
  return +[OverallMemoryUsage accumulateMemoryAcrossPrioritiesWithFootprints:_sumMemoryAtEachPriority withComparator:&__block_literal_global_181];
}

uint64_t __53__OverallMemoryUsage_memoryUsedAtOrAboveEachPriority__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)memoryAvailableAtOrBelowEachPriority
{
  return +[OverallMemoryUsage accumulateMemoryAcrossPrioritiesWithFootprints:_sumMemoryAtEachPriority withComparator:&__block_literal_global_184];
}

uint64_t __58__OverallMemoryUsage_memoryAvailableAtOrBelowEachPriority__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)systemMemoryStatsDictionary
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"wired_down";
  v2 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_wiredBytes >> 10];
  v12[0] = v2;
  v11[1] = @"file_backed";
  host_t v3 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_filebackedBytes >> 10];
  v12[1] = v3;
  v11[2] = @"free";
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_freeBytes >> 10];
  v12[2] = v4;
  v11[3] = @"occupied_by_compressor";
  id v5 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_occupiedByCompressorBytes >> 10];
  v12[3] = v5;
  v11[4] = @"stored_in_compressor";
  id v6 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_storedInCompressorBytes >> 10];
  v12[4] = v6;
  v11[5] = @"speculative";
  id v7 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_speculativeBytes >> 10];
  v12[5] = v7;
  v11[6] = @"anonymous";
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:(unint64_t)_anonymousBytes >> 10];
  v12[6] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

@end