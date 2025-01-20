@interface HDMHMostPrevalentDomainsBuilder
- (id).cxx_construct;
- (id)_winningSummaryForPleasant:(BOOL)a3;
- (id)mostPrevalentPleasantDomains;
- (id)mostPrevalentUnpleasantDomains;
- (void)_addStateOfMind:(id)a3 toMap:(void *)a4;
- (void)addStateOfMind:(id)a3;
@end

@implementation HDMHMostPrevalentDomainsBuilder

- (void)addStateOfMind:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 valenceClassification] - 1;
  if (v4 < 7 && ((0x77u >> v4) & 1) != 0)
  {
    uint64_t v5 = qword_255F4B468[v4];
    uint64_t v6 = qword_255F4B4A0[v4];
    ++*(Class *)((char *)&self->super.isa + v5);
    [(HDMHMostPrevalentDomainsBuilder *)self _addStateOfMind:v7 toMap:(char *)self + v6];
  }
}

- (id)mostPrevalentPleasantDomains
{
  return [(HDMHMostPrevalentDomainsBuilder *)self _winningSummaryForPleasant:1];
}

- (id)mostPrevalentUnpleasantDomains
{
  return [(HDMHMostPrevalentDomainsBuilder *)self _winningSummaryForPleasant:0];
}

- (void)_addStateOfMind:(id)a3 toMap:(void *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v15 = a3;
  v16 = [v15 endDate];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v15 domains];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v9 integerValue];
        if (HKStateOfMindDomainIsKnown())
        {
          uint64_t v17 = [v9 integerValue];
          v22 = &v17;
          id v10 = (id)std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v22)[3];
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "setCount:", objc_msgSend(v10, "count") + 1);
            [v11 setMostRecentDate:v16];
          }
          else
          {
            v12 = [[_HDMHDomainCount alloc] initWithCount:1 mostRecentDate:v16];
            uint64_t v17 = [v9 integerValue];
            v22 = &v17;
            v13 = std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v22);
            v14 = (void *)v13[3];
            v13[3] = v12;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
}

- (id)_winningSummaryForPleasant:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 48;
  if (a3) {
    uint64_t v5 = 8;
  }
  std::unordered_map<long,_HDMHDomainCount * {__strong}>::unordered_map((uint64_t)v40, (uint64_t)self + v5);
  if (v42)
  {
    v23 = self;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    unint64_t v39 = 0x8000000000000000;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    id v35 = 0;
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = v41; i; uint64_t i = (uint64_t **)*i)
    {
      uint64_t v8 = (uint64_t)i[2];
      v9 = i[3];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __62__HDMHMostPrevalentDomainsBuilder__winningSummaryForPleasant___block_invoke;
      v24[3] = &unk_2653F06D8;
      v27 = &v36;
      id v10 = v9;
      v25 = v10;
      v28 = &v30;
      id v11 = v6;
      id v26 = v11;
      uint64_t v29 = v8;
      v12 = (void (**)(void))MEMORY[0x25A29DA60](v24);
      uint64_t v13 = [v10 count];
      if (v13 >= v37[3])
      {
        uint64_t v14 = [v10 count];
        if (v14 <= v37[3])
        {
          id v15 = [v10 mostRecentDate];
          uint64_t v16 = [v15 compare:v31[5]];

          if (v16 == -1) {
            goto LABEL_11;
          }
          if (v16 != 1)
          {
            uint64_t v17 = [NSNumber numberWithInteger:v8];
            [v11 addObject:v17];

            goto LABEL_11;
          }
        }
        v12[2](v12);
      }
LABEL_11:
    }
    uint64_t v18 = 96;
    if (v3) {
      uint64_t v18 = 88;
    }
    uint64_t v19 = *(uint64_t *)((char *)&v23->super.isa + v18);
    id v20 = objc_alloc(MEMORY[0x263F55018]);
    long long v21 = (void *)[v20 initWithDomains:v6 count:v37[3] totalSampleCount:v19];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    long long v21 = 0;
  }
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)v40);
  return v21;
}

void __62__HDMHMostPrevalentDomainsBuilder__winningSummaryForPleasant___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) count];
  uint64_t v2 = [*(id *)(a1 + 32) mostRecentDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 40) removeAllObjects];
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  objc_msgSend(v5, "addObject:");
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)&self->_unpleasantCountsByDomain);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)&self->_pleasantCountsByDomain);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end