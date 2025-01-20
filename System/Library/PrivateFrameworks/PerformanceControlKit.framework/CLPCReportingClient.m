@interface CLPCReportingClient
- (BOOL)enableStats:(id)a3 error:(id *)a4;
- (BOOL)enableStats:error:;
- (__n128)buildSchemas:error:;
- (__n128)convertSampleList:error:;
- (__n128)enableStats:error:;
- (id).cxx_construct;
- (id)convertSampleList:(uint64_t)a1 error:;
- (id)enabledStats;
- (id)init:(id *)a3;
- (id)readDeltaStats:(id *)a3;
- (id)readStats:(id *)a3;
- (id)supportedStats;
- (uint64_t)buildSchemas:(void *)a3 error:;
- (uint64_t)buildSchemas:error:;
- (uint64_t)convertSampleList:error:;
- (uint64_t)enableStats:error:;
- (uint64_t)ensureStatsEnabled:(uint64_t)result;
- (uint64_t)init:;
- (uint64_t)obfuscate:(uint64_t)a3 context:(void *)a4 data:(void *)a5 bundle:;
- (unint64_t)schemaIDForStatID:(unint64_t)a3 error:(id *)a4;
- (void)buildSchemas:error:;
- (void)clearSchemas;
- (void)convertSampleList:error:;
- (void)enableStats:error:;
- (void)init:;
@end

@implementation CLPCReportingClient

- (id)readDeltaStats:(id *)a3
{
  if (-[CLPCReportingClient ensureStatsEnabled:]((uint64_t)self, a3)
    && (id v18 = 0, (v5 = (void *)IOReportCreateSamples()) != 0))
  {
    id v6 = v5;
    id v17 = v6;
    char v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)&v17, a3);

    if (v7)
    {
      p_prev_sample_list = &self->prev_sample_list;
      samples = self->prev_sample_list.samples;
      if (samples)
      {
        v10 = samples;
        id v18 = 0;
        SamplesDelta = (void *)IOReportCreateSamplesDelta();
        if (v18) {
          *a3 = v18;
        }

        if (SamplesDelta)
        {
          objc_storeStrong((id *)&self->prev_sample_list.samples, v5);
          v12 = SamplesDelta;
          v13 = -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
        }
        else
        {
          v14 = (NSMutableDictionary *)v6;
          v13 = 0;
          v12 = p_prev_sample_list->samples;
          p_prev_sample_list->samples = v14;
        }
      }
      else
      {
        objc_storeStrong((id *)&self->prev_sample_list.samples, v5);
        v16 = (NSMutableDictionary *)v6;
        v13 = -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
        v12 = v16;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (uint64_t)ensureStatsEnabled:(uint64_t)result
{
  v5[1] = *MEMORY[0x263EF8340];
  if (result)
  {
    if (*(void *)(result + 184) == *(void *)(result + 176))
    {
      if (a2)
      {
        uint64_t v4 = *MEMORY[0x263F07F80];
        v5[0] = @"No stats enabled.";
        v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
        *a2 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v3];
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)buildSchemas:(void *)a3 error:
{
  v42[4] = *MEMORY[0x263EF8340];
  uint64_t v29 = a1;
  if (!a1) {
    return 0;
  }
  if (![*(id *)(a1 + 264) count])
  {
    -[CLPCReportingClient clearSchemas]((void *)a1);
    v28 = &v29;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    id v6 = *(unint64_t **)(a1 + 176);
    v5 = *(unint64_t **)(a1 + 184);
    if (v6 == v5)
    {
LABEL_14:
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = qword_258FE9B00[v12];
        if (*((unsigned char *)&v34 + v13))
        {
          if ((-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v28, v13, 1, 1uLL, 0, 0, @"Time") & 1) == 0)break; {
        }
          }
        if (++v12 == 4)
        {
          uint64_t v14 = 0;
          while (1)
          {
            uint64_t v15 = qword_258FE9AE8[v14];
            if (*((unsigned char *)&v34 + v15))
            {
              if ((-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v28, v15, 2, 0, 1, 0, @"ID") & 1) == 0)break; {
            }
              }
            if (++v14 == 3)
            {
              for (uint64_t i = 0; i != 4; ++i)
              {
                uint64_t v17 = qword_258FE9B00[i];
                if (*((unsigned char *)&v34 + v17)) {
                  -[CLPCReportingSchema finalizeColumns](*(void *)(v29 + 200 + 8 * v17));
                }
                *((unsigned char *)&v36[-1] + v17) = 1;
              }
              LOBYTE(v36[0]) = 1;
              id v18 = operator new(0x40uLL);
              *id v18 = &unk_270715160;
              v18[1] = &v29;
              v18[2] = v36;
              v18[3] = &v35;
              v18[4] = &v34;
              v18[5] = &v27;
              v18[6] = &v28;
              v18[7] = &v26;
              v33[3] = v18;
              uint64_t v38 = MEMORY[0x263EF8330];
              uint64_t v39 = 3321888768;
              v40 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
              v41 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
              std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::__value_func[abi:ne180100]((uint64_t)v42, (uint64_t)v33);
              IOReportIterate();
              std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v42);
              std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v33);
              BOOL v4 = LOBYTE(v36[0]) != 0;
              if (LOBYTE(v36[0]))
              {
                v19 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
                for (uint64_t j = 0; j != 64; j += 8)
                {
                  uint64_t v21 = *(void *)(v29 + 200 + j);
                  if (v21 && [*(id *)(v21 + 24) count]) {
                    [v19 addObject:*(void *)(v29 + 200 + j)];
                  }
                }
                uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v19];
                v23 = *(void **)(v29 + 264);
                *(void *)(v29 + 264) = v22;
              }
              else
              {
              }
              return v4;
            }
          }
          break;
        }
      }
    }
    else
    {
      while (1)
      {
        unint64_t v7 = *v6;
        if (*v6 >> 35) {
          break;
        }
        if (BYTE4(v7))
        {
          *((unsigned char *)&v34 + BYTE4(v7)) = 1;
          if (BYTE4(v7) <= 7u && ((1 << SBYTE4(v7)) & 0x8E) != 0)
          {
            id v31 = 0;
            unint64_t v32 = v7;
            v30 = 0;
            v37 = 0;
            v9 = operator new(0x28uLL);
            void *v9 = &unk_270714F80;
            v9[1] = &v29;
            v9[2] = &v32;
            v9[3] = &v31;
            v9[4] = &v30;
            v37 = v9;
            uint64_t v38 = MEMORY[0x263EF8330];
            uint64_t v39 = 3321888768;
            v40 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
            v41 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
            std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::__value_func[abi:ne180100]((uint64_t)v42, (uint64_t)v36);
            IOReportIterate();
            std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v42);
            std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v36);
            id v10 = v31;
            v11 = v30;

            if ((-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v28, BYTE4(v7), 1, v7, 0, v11, v10) & 1) == 0)
            {

              return 0;
            }
          }
        }
        if (++v6 == v5) {
          goto LABEL_14;
        }
      }
    }
    return 0;
  }
  return 1;
}

- (id)convertSampleList:(uint64_t)a1 error:
{
  v31[4] = *MEMORY[0x263EF8340];
  uint64_t v26 = a1;
  if (a1)
  {
    uint64_t v1 = 0;
    uint64_t v25 = 0;
    memset(v24, 0, sizeof(v24));
    do
    {
      uint64_t v2 = *(void *)(v26 + 200 + v1);
      if (v2 && [*(id *)(v2 + 24) count])
      {
        uint64_t v3 = [MEMORY[0x263EFF980] array];
        BOOL v4 = *(void **)((char *)v24 + v1);
        *(void *)((char *)v24 + v1) = v3;
      }
      v1 += 8;
    }
    while (v1 != 64);
    v23[0] = &v26;
    v23[1] = v24;
    uint64_t v29 = 0;
    v5 = operator new(0x28uLL);
    void *v5 = &unk_2707151E0;
    v5[1] = &v26;
    void v5[2] = &v25;
    v5[3] = v23;
    v5[4] = v24;
    uint64_t v29 = v5;
    v30[0] = (void *)MEMORY[0x263EF8330];
    v30[1] = (void *)3321888768;
    v30[2] = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
    v30[3] = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
    std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::__value_func[abi:ne180100]((uint64_t)v31, (uint64_t)v28);
    IOReportIterate();
    std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v31);
    std::__function::__value_func<void ()(clpc::user::ioreport::Sample)>::~__value_func[abi:ne180100](v28);
    id v6 = objc_opt_new();
    unint64_t v7 = [NSNumber numberWithLongLong:v25];
    for (uint64_t i = 0; i != 8; ++i)
    {
      uint64_t v9 = *(void *)(v26 + 200 + 8 * i);
      if (v9 && [*(id *)(v9 + 24) count])
      {
        unint64_t v22 = 1;
        v30[0] = &v22;
        uint64_t v10 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v26 + 272 + 40 * i, &v22, (uint64_t)&std::piecewise_construct, v30)[3];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = *((id *)v24 + i);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v18 + 1) + 8 * j) setObject:v7 atIndexedSubscript:v10];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v27 count:16];
          }
          while (v12);
        }

        uint64_t v15 = objc_opt_new();
        [v15 setSchema:*(void *)(v26 + 200 + 8 * i)];
        [v15 setRows:*((void *)v24 + i)];
        -[CLPCReportingReadResult setStatRows:forIndex:]((uint64_t)v6, v15, i);
      }
    }

    for (uint64_t k = 56; k != -8; k -= 8)
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)convertSampleList:error:
{
}

- (__n128)convertSampleList:error:
{
  *(void *)a2 = &unk_2707151E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (id)init:(id *)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)CLPCReportingClient;
  v49 = 0;
  BOOL v4 = -[CLPCUserClient init:](&v48, sel_init_);
  v5 = v4;
  v49 = (unint64_t *)v4;
  if (!v4) {
    return 0;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4[4], @"CFBundleIdentifierKernel", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = [CFProperty dataUsingEncoding:4];
    if (v41)
    {
      v40 = (void *)IORegistryEntryCreateCFProperty(v5[4], @"#cpu-num-clusters", v6, 0);
      if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v5[10] = [v40 unsignedIntValue];
        uint64_t v38 = (void *)IORegistryEntryCreateCFProperty(v5[4], @"#cpu-num-cores", v6, 0);
        if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v5[13] = [v38 unsignedIntValue];
          uint64_t v34 = clpc::user::iokit::RegistryEntry::createProperty((clpc::user::iokit::RegistryEntry *)(v5 + 2), @"#ane-num-clusters");
          if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v5[11] = [v34 unsignedIntValue];
            for (uint64_t i = 1; ; uint64_t i = (v5[12] + 1))
            {
              v5[12] = i;
              objc_msgSend(NSString, "stringWithFormat:", @"#pkg-power-zone-target-%u", i);
              uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v10 = (void *)IORegistryEntryCreateCFProperty(v5[4], v9, v6, 0);
              BOOL v11 = v10 == 0;

              if (v11) {
                break;
              }
            }
            memcpy(__dst, "emit", sizeof(__dst));
            std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>((void *)v5 + 7, (uint64_t)__dst, (uint64_t)v52);
            if (v5[10])
            {
              unint64_t v13 = 0;
              uint64_t v35 = a3;
              v36 = CFProperty;
              do
              {
                int v14 = 48;
                if (v13 > 9) {
                  int v14 = 87;
                }
                int v15 = v14 + v13;
                v16 = (_DWORD *)((v14 + v13) | 0x7F0400004C506300);
                __dst[0] = v16;
                LODWORD(__dst[1]) = 2;
                *(void *)&long long v45 = __dst;
                std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v45)[3] = 0x400000001;
                v5 = v49;
                uint64_t v17 = (char *)(v49 + 12);
                __dst[0] = v16;
                LODWORD(__dst[1]) = 2;
                *(void *)&long long v45 = __dst;
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v49 + 12), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v45)+ 5) = v13;
                LODWORD(__dst[0]) = 1128489776;
                WORD2(__dst[0]) = 0;
                BYTE6(__dst[0]) = 6;
                *(_WORD *)((char *)__dst + 7) = 639;
                uint64_t v18 = v15 & 0xFFFF9CFF;
                *(void *)&long long v45 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000;
                DWORD2(v45) = __dst[1];
                __dst[0] = &v45;
                std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)&v45, (uint64_t)&std::piecewise_construct, __dst)[3] = 0x600000000;
                LODWORD(__dst[0]) = 1128489776;
                WORD2(__dst[0]) = 0;
                BYTE6(__dst[0]) = 6;
                *(_WORD *)((char *)__dst + 7) = 639;
                *(void *)&long long v45 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000;
                DWORD2(v45) = __dst[1];
                __dst[0] = &v45;
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v17, (unsigned int *)&v45, (uint64_t)&std::piecewise_construct, __dst)+ 5) = v13++;
                a3 = v35;
                CFProperty = v36;
              }
              while (v13 < v5[10]);
            }
            if (v5[11])
            {
              unint64_t v19 = 0;
              do
              {
                if (v19 <= 9) {
                  int v20 = 48;
                }
                else {
                  int v20 = 87;
                }
                long long v21 = (_DWORD *)((v20 + v19) | 0x7F040000414C6300);
                __dst[0] = v21;
                LODWORD(__dst[1]) = 2;
                *(void *)&long long v45 = __dst;
                std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v5 + 14), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v45)[3] = 0x400000003;
                v5 = v49;
                __dst[0] = v21;
                LODWORD(__dst[1]) = 2;
                *(void *)&long long v45 = __dst;
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)(v49 + 12), (unsigned int *)__dst, (uint64_t)&std::piecewise_construct, (_DWORD **)&v45)+ 5) = v19++;
              }
              while (v19 < v5[11]);
            }
            uint64_t v37 = CCDigestCreate();
            uint64_t v39 = [v5 reportingObfuscationData:a3];
            if (v37 && v39 && (unint64_t)[v39 length] > 0x1F)
            {
              memset(__dst, 0, 32);
              LODWORD(__dst[4]) = 1065353216;
              long long v45 = 0u;
              long long v46 = 0u;
              float v47 = 1.0;
              unint64_t v22 = v49;
              v23 = (char *)(v49 + 7);
              std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)__dst, (unint64_t)(float)v49[10]);
              std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)&v45, vcvtps_u32_f32((float)v22[15] / v47));
              v24 = (unsigned int *)*((void *)v23 + 2);
              if (v24)
              {
                do
                {
                  uint64_t v25 = v24[4];
                  unsigned int v44 = 0;
                  uint64_t v26 = v49;
                  unsigned int v44 = -[CLPCReportingClient obfuscate:context:data:bundle:]((uint64_t)v49, v25, v37, v39, v41);
                  uint64_t v27 = *((void *)v24 + 3);
                  v42 = &v44;
                  std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)__dst, &v44, (uint64_t)&std::piecewise_construct, &v42)[3] = v27;
                  v28 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>(v26 + 12, v24 + 4);
                  if (v28)
                  {
                    int v29 = *((_DWORD *)v28 + 5);
                    v42 = &v44;
                    *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)&v45, &v44, (uint64_t)&std::piecewise_construct, &v42)+ 5) = v29;
                  }
                  v24 = *(unsigned int **)v24;
                }
                while (v24);
                unint64_t v22 = v49;
              }
              if (v22 + 7 != (unint64_t *)__dst)
              {
                *((_DWORD *)v22 + 22) = __dst[4];
                std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>(v22 + 7, (uint64_t *)__dst[2], 0);
                unint64_t v22 = v49;
              }
              if (v22 + 12 != (unint64_t *)&v45)
              {
                *((float *)v22 + 32) = v47;
                std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>(v22 + 12, (uint64_t *)v46, 0);
              }
              CCDigestDestroy();
              v30 = v49;
              clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&v42);
              if (v43)
              {
                int ChannelCount = IOReportGetChannelCount();
                unsigned int v32 = ChannelCount & ~(ChannelCount >> 31);
                if (ChannelCount < 0) {
                  unsigned int v32 = 2;
                }
                std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)(v30 + 17), vcvtps_u32_f32((float)v32 / *((float *)v30 + 42)));
                v50[0] = &unk_270715040;
                v50[1] = &v49;
                v50[3] = v50;
                clpc::user::ioreport::ChannelList::iterate((uint64_t)&v42, (uint64_t)v50);
                std::__function::__value_func<void ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](v50);
                v49[23] = v49[22];
                uint64_t v12 = v49;
                if (v43) {
              }
                }
              else
              {
                uint64_t v12 = 0;
              }
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v45);
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)__dst);
            }
            else
            {
              uint64_t v12 = 0;
            }
          }
          else
          {
            uint64_t v12 = 0;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (uint64_t)obfuscate:(uint64_t)a3 context:(void *)a4 data:(void *)a5 bundle:
{
  id v7 = a4;
  id v8 = a5;
  if (a1)
  {
    id v9 = v7;
    [v9 bytes];
    CCDigestUpdate();
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    CCDigestUpdate();
    CCDigestUpdate();
    [v9 bytes];
    CCDigestUpdate();
    CCDigestFinal();
    CCDigestReset();
  }

  return 0;
}

- (unint64_t)schemaIDForStatID:(unint64_t)a3 error:(id *)a4
{
  if (!(a3 >> 35)) {
    return BYTE4(a3);
  }
  return 0;
}

- (id)supportedStats
{
  uint64_t v3 = (unsigned char *)objc_opt_new();
  for (uint64_t i = self->available_stat_ids.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    if (v3)
    {
      uint64_t v5 = 0;
      {
        if (++v5 == 25) {
          goto LABEL_8;
        }
      }
      v3[v5 + 8] = 1;
    }
LABEL_8:
    ;
  }
  return v3;
}

- (id)enabledStats
{
  uint64_t v3 = (unsigned char *)objc_opt_new();
  begin = self->configured_stat_ids.__begin_;
  for (uint64_t i = self->configured_stat_ids.__end_; begin != i; ++begin)
  {
    if (v3)
    {
      uint64_t v6 = 0;
      {
        if (++v6 == 25) {
          goto LABEL_8;
        }
      }
      v3[v6 + 8] = 1;
    }
LABEL_8:
    ;
  }
  return v3;
}

- (BOOL)enableStats:(id)a3 error:(id *)a4
{
  v56[4] = *MEMORY[0x263EF8340];
  id v36 = a3;
  p_configured_stat_ids = &self->configured_stat_ids;
  self->configured_stat_ids.__end_ = self->configured_stat_ids.__begin_;
  channels = self->reporting_channels.channels;
  self->reporting_channels.channels = 0;

  uint64_t v53 = 0;
  v54 = 0;
  unint64_t v52 = (unint64_t)&unk_270714DD0;
  p_subscribed_channels = &self->reporting_subscription.subscribed_channels;
  subscribed_channels = self->reporting_subscription.subscribed_channels;
  self->reporting_subscription.subscription = 0;
  self->reporting_subscription.subscribed_channels = 0;

  uint64_t v53 = 0;
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v52);
  long long v44 = 0u;
  long long v45 = 0u;
  int v46 = 1065353216;
  [(CLPCReportingStatSelection *)(uint64_t)v36 selectedStats];
  for (uint64_t i = v54; i; uint64_t i = *(uint64_t (**)(uint64_t, CFTypeRef))i)
  {
    *(void *)&long long v41 = *((void *)i + 2);
    if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v41))
    {
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>((uint64_t)&v44, (unint64_t *)&v41, &v41);
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v52);
  unint64_t v52 = 1;
  if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_, &v52))
  {
    unint64_t v52 = 1;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>((uint64_t)&v44, &v52, &v52);
  }
  [v36 deselectAll];
  p_reporting_subscription = &self->reporting_subscription;
  location = &self->reporting_channels;
  long long v41 = 0u;
  long long v42 = 0u;
  int v43 = 1065353216;
  std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>((uint64_t)&v41, (unint64_t)(float)(*((void *)&v45 + 1) + (unint64_t)(4 * self->num_cpu_clusters)));
  BOOL v11 = (void *)v45;
  if ((void)v45)
  {
    while (1)
    {
      next = (unsigned int *)self->channel_to_stat_map.__table_.__p1_.__value_.__next_;
      if (!next) {
        break;
      }
      int v13 = 0;
      uint64_t v14 = v11[2];
      do
      {
        if (*((void *)next + 3) == v14)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&v41, next + 4, next + 4);
          ++v13;
        }
        next = *(unsigned int **)next;
      }
      while (next);
      if (!v13) {
        break;
      }
      BOOL v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_15;
      }
    }
    goto LABEL_45;
  }
LABEL_15:
  clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&obj);
  int v15 = a4;
  if (!v40)
  {
    if (!a4)
    {
LABEL_45:
      BOOL v16 = 0;
      goto LABEL_56;
    }
    uint64_t v50 = *MEMORY[0x263F07F80];
    v51 = @"Failed to list AppleCLPC IOReporting channels.";
    id v31 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870212 userInfo:v31];

    goto LABEL_49;
  }
  int v38 = 0;
  v49[0] = &unk_2707150D0;
  v49[1] = &v41;
  v49[2] = &v38;
  v49[3] = v49;
  unint64_t v52 = MEMORY[0x263EF8330];
  uint64_t v53 = 3321888768;
  v54 = ___ZN4clpc4user8ioreport11ChannelList6filterENSt3__18functionIFbNS1_7ChannelEEEE_block_invoke;
  v55 = &__block_descriptor_64_ea8_32c55_ZTSNSt3__18functionIFbN4clpc4user8ioreport7ChannelEEEE_e25_i16__0____CFDictionary__8l;
  std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::__value_func[abi:ne180100]((uint64_t)v56, (uint64_t)v49);
  IOReportPrune();
  std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](v56);
  std::__function::__value_func<BOOL ()(clpc::user::ioreport::Channel)>::~__value_func[abi:ne180100](v49);
  if (*((void *)&v42 + 1) != v38)
  {
LABEL_49:
    BOOL v16 = 0;
    goto LABEL_54;
  }
  clpc::user::ioreport::ChannelList::subscribe((uint64_t)&v52);
  BOOL v16 = (_BYTE)v55 != 0;
  if ((_BYTE)v55)
  {
    std::vector<CLPCReportingStatID>::reserve((void **)&p_configured_stat_ids->__begin_, *((unint64_t *)&v45 + 1));
    do
    {
      unint64_t v37 = *(void *)v17;
      if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>(&v44, &v37))
      {
        end = p_configured_stat_ids->__end_;
        value = p_configured_stat_ids->__end_cap_.__value_;
        if (end >= value)
        {
          begin = p_configured_stat_ids->__begin_;
          uint64_t v22 = end - p_configured_stat_ids->__begin_;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            std::vector<CLPCReportingStatID>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v24 = (char *)value - (char *)begin;
          if (v24 >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            uint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLPCReportingStatID>>((uint64_t)&p_configured_stat_ids->__end_cap_, v25);
            begin = p_configured_stat_ids->__begin_;
            end = p_configured_stat_ids->__end_;
          }
          else
          {
            uint64_t v26 = 0;
          }
          uint64_t v27 = (unint64_t *)&v26[8 * v22];
          *uint64_t v27 = v37;
          int v20 = v27 + 1;
          while (end != begin)
          {
            unint64_t v28 = *--end;
            *--uint64_t v27 = v28;
          }
          p_configured_stat_ids->__begin_ = v27;
          p_configured_stat_ids->__end_ = v20;
          p_configured_stat_ids->__end_cap_.__value_ = (unint64_t *)&v26[8 * v25];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          unint64_t *end = v37;
          int v20 = end + 1;
        }
        p_configured_stat_ids->__end_ = v20;
        if (v36)
        {
          uint64_t v29 = 0;
          {
            if (++v29 == 25) {
              goto LABEL_42;
            }
          }
          *((unsigned char *)v36 + v29 + 8) = 1;
        }
      }
LABEL_42:
      v17 += 8;
    }
    while (v17 != "emit");
    objc_storeStrong((id *)&location->channels, obj);
    v30 = v54;
    p_reporting_subscription->subscription = (__IOReportSubscriptionCF *)v53;
    objc_storeStrong((id *)p_subscribed_channels, v30);
    uint64_t v53 = 0;
    goto LABEL_52;
  }
  if (v15)
  {
    uint64_t v47 = *MEMORY[0x263F07F80];
    objc_super v48 = @"Failed to subscribe to AppleCLPC IOReporting channels.";
    unsigned int v32 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    *int v15 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870212 userInfo:v32];

LABEL_52:
    if ((_BYTE)v55) {
      clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v52);
    }
  }
LABEL_54:
  if (v40) {

  }
LABEL_56:
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v41);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v44);

  return v16;
}

- (void)clearSchemas
{
  if (result)
  {
    uint64_t v1 = result;
    id v6 = 0;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)(result + 25), &v6);

    uint64_t v2 = [MEMORY[0x263EFF8C0] array];
    uint64_t v3 = (void *)v1[33];
    v1[33] = v2;

    uint64_t v4 = 0;
    uint64_t v5 = v1 + 34;
    do
    {
      __n128 result = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear(&v5[v4]);
      v4 += 5;
    }
    while (v4 != 40);
  }
  return result;
}

- (uint64_t)buildSchemas:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)readStats:(id *)a3
{
  if (-[CLPCReportingClient ensureStatsEnabled:]((uint64_t)self, a3)
    && (v11[1] = 0, (Samples = (void *)IOReportCreateSamples()) != 0))
  {
    id v6 = Samples;
    v11[0] = v6;
    char v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)v11, a3);

    if (v7)
    {
      id v10 = v6;
      id v8 = -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&self->reporting_subscription);
  for (uint64_t i = 280; i != -40; i -= 40)
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->schema_column_maps + i);
  objc_storeStrong((id *)&self->compactedSchemas, 0);
  for (uint64_t j = 7; j != -1; --j)

  begin = self->configured_stat_ids.__begin_;
  if (begin)
  {
    self->configured_stat_ids.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->available_stat_ids);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_cluster_map);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_stat_map);
}

- (id).cxx_construct
{
  uint64_t v2 = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  do
  {
    uint64_t v3 = (char *)self + v2 + 272;
    *(_OWORD *)uint64_t v3 = 0uLL;
    *((_OWORD *)v3 + 1) = 0uLL;
    *((_DWORD *)v3 + 8) = 1065353216;
    v2 += 40;
  }
  while (v2 != 320);
  *((void *)self + 74) = 0;
  *((void *)self + 75) = &unk_270714DD0;
  *((void *)self + 76) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 78) = 0;
  return self;
}

- (void)buildSchemas:error:
{
}

- (__n128)buildSchemas:error:
{
  *(void *)a2 = &unk_270715160;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  long long v4 = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = *(void *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)init:
{
}

- (uint64_t)init:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)enableStats:error:
{
}

- (__n128)enableStats:error:
{
  *(void *)a2 = &unk_2707150D0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (BOOL)enableStats:error:
{
  long long v3 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  v7[0] = &unk_270714E68;
  v7[1] = v3;
  unsigned int ChannelID = IOReportChannelGetChannelID();
  long long v4 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>(*(void **)(a1 + 8), &ChannelID);
  if (v4) {
    ++**(_DWORD **)(a1 + 16);
  }
  BOOL v5 = v4 != 0;
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

- (uint64_t)enableStats:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (uint64_t)convertSampleList:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end