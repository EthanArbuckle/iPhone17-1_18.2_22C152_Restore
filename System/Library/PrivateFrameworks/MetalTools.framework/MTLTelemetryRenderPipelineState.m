@interface MTLTelemetryRenderPipelineState
+ (unsigned)generateUniqueID;
- (MTLTelemetryRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6;
- (void)accumulateUsage;
- (void)dealloc;
@end

@implementation MTLTelemetryRenderPipelineState

+ (unsigned)generateUniqueID
{
  return atomic_fetch_add(&lastUniquePipelineID, 1u) + 1;
}

- (void)accumulateUsage
{
  uint64_t v3 = *(void *)&self->uniqueID + 272;
  v9 = &self->super.super._externalReferences + 1;
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, (unsigned int *)&self->super.super._externalReferences + 1, (uint64_t)&std::piecewise_construct, &v9);
  uint64_t v5 = *(void *)&self->uniqueID + 312;
  v9 = v4 + 5;
  v6 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, v4 + 5, (uint64_t)&std::piecewise_construct, &v9);
  ++*((_DWORD *)v6 + 8);
  uint64_t v7 = *(void *)&self->uniqueID + 312;
  v9 = v4 + 6;
  v8 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, v4 + 6, (uint64_t)&std::piecewise_construct, &v9);
  ++*((_DWORD *)v8 + 8);
  ++v4[7];
}

- (MTLTelemetryRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)MTLTelemetryRenderPipelineState;
  v10 = [(MTLToolsRenderPipelineState *)&v43 initWithBaseObject:a3 parent:a5];
  if (v10 && [a5 enableTelemetry])
  {
    *(&v10->super.super._externalReferences + 1) = +[MTLTelemetryRenderPipelineState generateUniqueID];
    *(void *)&v10->uniqueID = a5;
    v11 = (void *)[a4 performanceStatistics];
    v12 = (void *)[v11 objectForKey:*MEMORY[0x263F12768]];
    v13 = (void *)[v11 objectForKey:*MEMORY[0x263F126F8]];
    uint64_t v14 = [v12 objectForKey:@"Telemetry Statistics"];
    uint64_t v15 = [v13 objectForKey:@"Telemetry Statistics"];
    v16 = *((void *)a5 + 91);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__MTLTelemetryRenderPipelineState_initWithPipelineState_reflection_parent_descriptor___block_invoke;
    block[3] = &unk_264E13DC0;
    block[4] = a3;
    block[5] = v10;
    block[6] = v14;
    block[7] = v15;
    block[8] = a6;
    block[9] = a5;
    block[10] = a4;
    dispatch_sync(v16, block);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v17 = (void *)[a4 constantSamplerDescriptors];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        if ((unint64_t)[*(id *)(*((void *)&v38 + 1) + 8 * i) maxAnisotropy] >= 2)
        {
          LOBYTE(v10->device) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v19);
LABEL_13:
    v33 = v10;
    id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = (void *)[a4 fragmentArguments];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (!v25) {
      goto LABEL_25;
    }
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
LABEL_15:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v35 != v27) {
        objc_enumerationMutation(v24);
      }
      v29 = *(void **)(*((void *)&v34 + 1) + 8 * v28);
      if (![v29 isActive]) {
        goto LABEL_23;
      }
      uint64_t v30 = [v29 type];
      v31 = v22;
      if (v30 == 3) {
        goto LABEL_22;
      }
      if (v30 == 2) {
        break;
      }
LABEL_23:
      if (v26 == ++v28)
      {
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (!v26)
        {
LABEL_25:
          v10 = v33;
          *(void *)&v33->hasAnisoConstantSampler = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v22];
          v33->activeFragmentSamplers = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v23];

          return v10;
        }
        goto LABEL_15;
      }
    }
    v31 = v23;
LABEL_22:
    objc_msgSend(v31, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v29, "index")));
    goto LABEL_23;
  }
  return v10;
}

uint64_t __86__MTLTelemetryRenderPipelineState_initWithPipelineState_reflection_parent_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  unsigned int v3 = [v2 getVertexShaderTelemetryID];
  unsigned int v57 = v3;
  LODWORD(v2) = [v2 getFragmentShaderTelemetryID];
  unsigned int v56 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 40) + 272;
  __p[0] = (void *)(v4 + 36);
  v6 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)(v4 + 36), (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v6[5] = v3;
  v6[6] = v2;
  v6[7] = 0;
  uint64_t v7 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40) + 312;
  __p[0] = &v57;
  v9 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v8, &v57, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v9[3] = 1;
  *((_DWORD *)v9 + 8) = 0;
  v9[5] = v7;
  uint64_t v10 = [NSDictionary dictionaryWithDictionary:*(void *)(a1 + 56)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 40) + 312;
  __p[0] = &v56;
  v12 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v11, &v56, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v12[3] = 2;
  *((_DWORD *)v12 + 8) = 0;
  v12[5] = v10;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 40);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v14 = *(void **)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 UTF8String]);
        unsigned int v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v18), "unsignedIntValue");
        v58 = __p;
        uint64_t v20 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v13 + 360, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v58);
        if (v19)
        {
          int v21 = *((_DWORD *)v20 + 14);
          if (v21)
          {
            if (v19 > *((_DWORD *)v20 + 11)) {
              *((_DWORD *)v20 + 11) = v19;
            }
            if (v19 >= *((_DWORD *)v20 + 10)) {
              goto LABEL_14;
            }
          }
          else
          {
            *((_DWORD *)v20 + 11) = v19;
          }
          *((_DWORD *)v20 + 10) = v19;
LABEL_14:
          *((void *)v20 + 6) += v19;
          *((_DWORD *)v20 + 14) = v21 + 1;
        }
        if (v51 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v15);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = *(void **)(a1 + 56);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v13 + 400;
    uint64_t v25 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v27 UTF8String]);
        unsigned int v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v27), "unsignedIntValue");
        v58 = __p;
        v29 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v24, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v58);
        if (v28)
        {
          int v30 = *((_DWORD *)v29 + 14);
          if (v30)
          {
            if (v28 > *((_DWORD *)v29 + 11)) {
              *((_DWORD *)v29 + 11) = v28;
            }
            if (v28 >= *((_DWORD *)v29 + 10)) {
              goto LABEL_32;
            }
          }
          else
          {
            *((_DWORD *)v29 + 11) = v28;
          }
          *((_DWORD *)v29 + 10) = v28;
LABEL_32:
          *((void *)v29 + 6) += v28;
          *((_DWORD *)v29 + 14) = v30 + 1;
        }
        if (v51 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v23);
  }
  for (uint64_t k = 0; k != 8; ++k)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "colorAttachments"), "_descriptorAtIndex:", k), "isBlendingEnabled"))++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 352) + 4 * k); {
  }
    }
  uint64_t v32 = a1 + 72;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 352) + 32) += [*(id *)(a1 + 64) isAlphaTestEnabled];
  *(_DWORD *)(*(void *)(*(void *)v32 + 352) + 36) += [*(id *)(a1 + 64) isAlphaToOneEnabled];
  *(_DWORD *)(*(void *)(*(void *)v32 + 352) + 40) += [*(id *)(a1 + 64) isAlphaToCoverageEnabled];
  unsigned int v33 = [*(id *)(a1 + 64) rasterSampleCount];
  if (v33)
  {
    long long v34 = *(_DWORD **)(*(void *)(a1 + 72) + 352);
    if (v34[22])
    {
      if (v34[19] < v33)
      {
        v34[19] = v33;
        long long v34 = *(_DWORD **)(*(void *)(a1 + 72) + 352);
      }
      unsigned int v36 = v34[18];
      long long v35 = v34 + 18;
      if (v36 <= v33) {
        goto LABEL_49;
      }
    }
    else
    {
      v34[19] = v33;
      long long v35 = (unsigned int *)(*(void *)(*(void *)(a1 + 72) + 352) + 72);
    }
    *long long v35 = v33;
LABEL_49:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 352) + 80) += v33;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 352) + 88);
  }
  unsigned int v37 = [*(id *)(a1 + 64) colorSampleCount];
  if (v37)
  {
    long long v38 = *(_DWORD **)(*(void *)(a1 + 72) + 352);
    if (v38[16])
    {
      if (v38[13] < v37)
      {
        v38[13] = v37;
        long long v38 = *(_DWORD **)(*(void *)(a1 + 72) + 352);
      }
      unsigned int v40 = v38[12];
      long long v39 = v38 + 12;
      if (v40 <= v37) {
        goto LABEL_58;
      }
    }
    else
    {
      v38[13] = v37;
      long long v39 = (unsigned int *)(*(void *)(*(void *)(a1 + 72) + 352) + 48);
    }
    *long long v39 = v37;
LABEL_58:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 352) + 56) += v37;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 352) + 64);
  }
  long long v41 = (id *)(a1 + 80);
  char v42 = [*(id *)(a1 + 80) usageFlags];
  uint64_t v44 = *(void *)(a1 + 72);
  uint64_t v43 = a1 + 72;
  *(_DWORD *)(*(void *)(v44 + 352) + 96) += v42 & 1;
  *(_DWORD *)(*(void *)(*(void *)v43 + 352) + 100) += ([*v41 usageFlags] >> 1) & 1;
  *(_DWORD *)(*(void *)(*(void *)v43 + 352) + 104) += ([*v41 usageFlags] >> 2) & 1;
  *(_DWORD *)(*(void *)(*(void *)v43 + 352) + 108) += ([*v41 usageFlags] >> 3) & 1;
  *(_DWORD *)(*(void *)(*(void *)v43 + 352) + 112) += ([*v41 usageFlags] >> 4) & 1;
  uint64_t result = [*v41 usageFlags];
  *(_DWORD *)(*(void *)(*(void *)v43 + 352) + 116) += (result >> 5) & 1;
  ++*(_DWORD *)(*(void *)(*(void *)v43 + 352) + 120);
  return result;
}

- (void)dealloc
{
  if ([*(id *)&self->uniqueID enableTelemetry])
  {
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLTelemetryRenderPipelineState;
  [(MTLToolsRenderPipelineState *)&v3 dealloc];
}

@end