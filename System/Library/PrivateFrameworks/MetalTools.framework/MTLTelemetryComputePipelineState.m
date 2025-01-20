@interface MTLTelemetryComputePipelineState
+ (unsigned)generateUniqueID;
- (MTLTelemetryComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6;
- (void)accumulateUsage;
@end

@implementation MTLTelemetryComputePipelineState

+ (unsigned)generateUniqueID
{
  return atomic_fetch_add(&lastUniquePipelineID, 1u) + 1;
}

- (void)accumulateUsage
{
  queue = self->device->queue;
  if (queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__MTLTelemetryComputePipelineState_accumulateUsage__block_invoke;
    block[3] = &unk_264E13C28;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void *__51__MTLTelemetryComputePipelineState_accumulateUsage__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56) + 472;
  v7 = (_DWORD *)(v2 + 52);
  v4 = (unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, (unsigned int *)(v2 + 52), (uint64_t)&std::piecewise_construct, &v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56) + 512;
  v7 = v4 + 5;
  result = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, v4 + 5, (uint64_t)&std::piecewise_construct, &v7);
  ++*((_DWORD *)result + 6);
  ++v4[6];
  return result;
}

- (MTLTelemetryComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)MTLTelemetryComputePipelineState;
  v9 = [(MTLToolsObject *)&v14 initWithBaseObject:a3 parent:a5];
  if (v9)
  {
    if ([a5 enableTelemetry])
    {
      v9->device = (MTLTelemetryDevice *)a5;
      *(&v9->uniqueID + 1) = +[MTLTelemetryComputePipelineState generateUniqueID];
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "performanceStatistics"), "objectForKey:", @"Telemetry Statistics");
      v11 = *((void *)a5 + 91);
      if (v11)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __94__MTLTelemetryComputePipelineState_initWithComputePipelineState_reflection_parent_descriptor___block_invoke;
        block[3] = &unk_264E13C50;
        block[4] = a3;
        void block[5] = v9;
        block[6] = v10;
        block[7] = a5;
        block[8] = a4;
        dispatch_sync(v11, block);
      }
    }
  }
  return v9;
}

uint64_t __94__MTLTelemetryComputePipelineState_initWithComputePipelineState_reflection_parent_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned int v2 = [*(id *)(a1 + 32) getComputeKernelTelemetryID];
  unsigned int v30 = v2;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 56) + 472;
  __p[0] = (void *)(v3 + 52);
  uint64_t v5 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v4, (unsigned int *)(v3 + 52), (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  *((_DWORD *)v5 + 5) = v2;
  *((_DWORD *)v5 + 6) = 0;
  uint64_t v6 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 56) + 512;
  __p[0] = &v30;
  v8 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v30, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  *((_DWORD *)v8 + 6) = 0;
  v8[4] = v6;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 56);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v9 + 560;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);
        unsigned int v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15), "unsignedIntValue");
        v31 = __p;
        v17 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v12, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v31);
        if (v16)
        {
          int v18 = *((_DWORD *)v17 + 14);
          if (v18)
          {
            if (v16 > *((_DWORD *)v17 + 11)) {
              *((_DWORD *)v17 + 11) = v16;
            }
            if (v16 >= *((_DWORD *)v17 + 10)) {
              goto LABEL_14;
            }
          }
          else
          {
            *((_DWORD *)v17 + 11) = v16;
          }
          *((_DWORD *)v17 + 10) = v16;
LABEL_14:
          *((void *)v17 + 6) += v16;
          *((_DWORD *)v17 + 14) = v18 + 1;
        }
        if (v25 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }
  v19 = (id *)(a1 + 64);
  char v20 = [*(id *)(a1 + 64) usageFlags];
  uint64_t v22 = *(void *)(a1 + 56);
  uint64_t v21 = a1 + 56;
  *(_DWORD *)(*(void *)(v22 + 552) + 4) += v20 & 1;
  *(_DWORD *)(*(void *)(*(void *)v21 + 552) + 8) += ([*v19 usageFlags] >> 1) & 1;
  *(_DWORD *)(*(void *)(*(void *)v21 + 552) + 12) += ([*v19 usageFlags] >> 2) & 1;
  uint64_t result = [*v19 usageFlags];
  *(_DWORD *)(*(void *)(*(void *)v21 + 552) + 16) += (result >> 3) & 1;
  ++**(_DWORD **)(*(void *)v21 + 552);
  return result;
}

@end