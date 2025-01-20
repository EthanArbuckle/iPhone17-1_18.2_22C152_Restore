@interface SICoreAnalyticManager
- (SICoreAnalyticManager)initWithEventName:(id)a3 requiredKeys:(id)a4 minLogTimeInterval:(int)a5;
- (id).cxx_construct;
- (id)coreAnalyticDictionary;
- (void)accumulateStatisticDataForKey:(id)a3 value:(float)a4;
- (void)averageAccumulatedDataOverKey:(id)a3;
- (void)coreAnalyticDictionaryForPersonPetDetection:(id *)a3;
- (void)resetStatisticData;
- (void)summaryCoreAnalyticEvent;
@end

@implementation SICoreAnalyticManager

- (SICoreAnalyticManager)initWithEventName:(id)a3 requiredKeys:(id)a4 minLogTimeInterval:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SICoreAnalyticManager;
  v11 = [(SICoreAnalyticManager *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_coreAnalyticTimeInterval = a5;
    v11->_createdTime = CACurrentMediaTime();
    objc_storeStrong((id *)&v12->_coreAnalyticEventName, a3);
    objc_storeStrong((id *)&v12->_accumulatedDataKeys, a4);
    countItemKey = v12->_countItemKey;
    v12->_countItemKey = 0;

    [(SICoreAnalyticManager *)v12 resetStatisticData];
    v14 = v12;
  }

  return v12;
}

- (void)averageAccumulatedDataOverKey:(id)a3
{
}

- (void)resetStatisticData
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_lastSummaryTimestamp = CACurrentMediaTime();
  p_accumulatedData = &self->_accumulatedData;
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_accumulatedData);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(NSSet *)self->_accumulatedDataKeys allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        std::string::basic_string[abi:nn180100]<0>(__p, (char *)[*(id *)(*((void *)&v10 + 1) + 8 * v7) UTF8String]);
        v14 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v14)+ 10) = 0;
        if (v9 < 0) {
          operator delete(__p[0]);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)summaryCoreAnalyticEvent
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = CACurrentMediaTime() - self->_lastSummaryTimestamp;
  self->_elapseTime = v3;
  if (v3 > (double)self->_coreAnalyticTimeInterval)
  {
    if (self->_coreAnalyticEventName)
    {
      AnalyticsSendEventLazy();
    }
    else
    {
      v4 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SICoreAnalyticManager.mm";
        __int16 v7 = 1025;
        int v8 = 70;
        _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to send analytics event since the eventName is not assigned ***", buf, 0x12u);
      }
    }
    [(SICoreAnalyticManager *)self resetStatisticData];
    self->_lastSummaryTimestamp = CACurrentMediaTime();
  }
}

uint64_t __49__SICoreAnalyticManager_summaryCoreAnalyticEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) coreAnalyticDictionary];
}

- (void)accumulateStatisticDataForKey:(id)a3 value:(float)a4
{
  id v6 = a3;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v6 UTF8String]);
  long long v10 = __p;
  __int16 v7 = (float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10);
  v7[10] = v7[10] + a4;
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (void)coreAnalyticDictionaryForPersonPetDetection:(id *)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:nn180100]<0>(v103, "faceCount");
  v101[0] = v103;
  p_accumulatedData = &self->_accumulatedData;
  float v5 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v101)+ 10);
  if (v5 == 0.0)
  {
    char v9 = &unk_26CB84D00;
  }
  else
  {
    id v6 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v101, "fakeFaceCount");
    __p[0] = v101;
    float v7 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v101, (uint64_t)&std::piecewise_construct, (long long **)__p)+ 10);
    std::string::basic_string[abi:nn180100]<0>(__p, "faceCount");
    v97[0] = __p;
    *(float *)&double v8 = v7
                  / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (long long **)v97)+ 10);
    char v9 = [v6 numberWithFloat:v8];
  }
  [*a3 setObject:v9 forKeyedSubscript:@"fakeFaceRate"];
  if (v5 != 0.0)
  {

    if (v100 < 0) {
      operator delete(__p[0]);
    }
    if (v102 < 0) {
      operator delete(v101[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  std::string::basic_string[abi:nn180100]<0>(v103, "upperBodyCount");
  v97[0] = v103;
  float v10 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v97)+ 10);
  if (v10 == 0.0)
  {
    v14 = &unk_26CB84D00;
  }
  else
  {
    long long v11 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v97, "fakeUpperBodyCount");
    v95[0] = v97;
    float v12 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v97, (uint64_t)&std::piecewise_construct, (long long **)v95)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v95, "upperBodyCount");
    v93[0] = v95;
    *(float *)&double v13 = v12
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v95, (uint64_t)&std::piecewise_construct, (long long **)v93)+ 10);
    v14 = [v11 numberWithFloat:v13];
  }
  [*a3 setObject:v14 forKeyedSubscript:@"fakeUpperBodyRate"];
  if (v10 != 0.0)
  {

    if (v96 < 0) {
      operator delete(v95[0]);
    }
    if (v98 < 0) {
      operator delete(v97[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  std::string::basic_string[abi:nn180100]<0>(v103, "petCount");
  v93[0] = v103;
  float v15 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v93)+ 10);
  if (v15 == 0.0)
  {
    v19 = &unk_26CB84D00;
  }
  else
  {
    uint64_t v16 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v93, "fakePetCount");
    v91[0] = v93;
    float v17 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v93, (uint64_t)&std::piecewise_construct, (long long **)v91)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v91, "petCount");
    v89[0] = v91;
    *(float *)&double v18 = v17
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v91, (uint64_t)&std::piecewise_construct, (long long **)v89)+ 10);
    v19 = [v16 numberWithFloat:v18];
  }
  [*a3 setObject:v19 forKeyedSubscript:@"fakePetRate"];
  if (v15 != 0.0)
  {

    if (v92 < 0) {
      operator delete(v91[0]);
    }
    if (v94 < 0) {
      operator delete(v93[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  std::string::basic_string[abi:nn180100]<0>(v103, "travelTime");
  v89[0] = v103;
  float v20 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v89)+ 10);
  if (v20 == 0.0)
  {
    v24 = &unk_26CB84D00;
  }
  else
  {
    v21 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v89, "travelDistance");
    v87[0] = v89;
    float v22 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v89, (uint64_t)&std::piecewise_construct, (long long **)v87)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v87, "travelTime");
    v85[0] = v87;
    *(float *)&double v23 = v22
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v87, (uint64_t)&std::piecewise_construct, (long long **)v85)+ 10);
    v24 = [v21 numberWithFloat:v23];
  }
  [*a3 setObject:v24 forKeyedSubscript:@"velocity"];
  if (v20 != 0.0)
  {

    if (v88 < 0) {
      operator delete(v87[0]);
    }
    if (v90 < 0) {
      operator delete(v89[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  [*a3 removeObjectForKey:@"travelDistance"];
  [*a3 removeObjectForKey:@"travelTime"];
  std::string::basic_string[abi:nn180100]<0>(v103, "flickeringAuthenticityCount");
  v85[0] = v103;
  float v25 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v85)+ 10);
  if (v25 == 0.0)
  {
    v29 = &unk_26CB84D00;
  }
  else
  {
    v26 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v85, "flickeringAuthenticityRate");
    v83[0] = v85;
    float v27 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v85, (uint64_t)&std::piecewise_construct, (long long **)v83)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v83, "flickeringAuthenticityCount");
    v73[0] = v83;
    *(float *)&double v28 = v27
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v83, (uint64_t)&std::piecewise_construct, (long long **)v73)+ 10);
    v29 = [v26 numberWithFloat:v28];
  }
  [*a3 setObject:v29 forKeyedSubscript:@"flickeringAuthenticityRate"];
  if (v25 != 0.0)
  {

    if (v84 < 0) {
      operator delete(v83[0]);
    }
    if (v86 < 0) {
      operator delete(v85[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  [*a3 removeObjectForKey:@"flickeringAuthenticityCount"];
  v30 = [*a3 objectForKeyedSubscript:@"semanticsCount"];
  [v30 floatValue];
  float v32 = v31;

  if (v32 > 0.0)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v33 = [*a3 allKeys];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v107 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v80 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if (([v37 isEqualToString:@"semanticsCount"] & 1) == 0
            && [v37 hasPrefix:@"semantics"])
          {
            v38 = [*a3 objectForKeyedSubscript:v37];
            [v38 floatValue];
            float v40 = v39;

            [*a3 removeObjectForKey:v37];
            *(float *)&double v41 = v40 / v32;
            v42 = [NSNumber numberWithFloat:v41];
            [*a3 setObject:v42 forKeyedSubscript:v37];
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v107 count:16];
      }
      while (v34);
    }
  }
  [*a3 removeObjectForKey:@"semanticsCount"];
  v43 = [*a3 objectForKeyedSubscript:@"deviceOrientCount"];
  [v43 floatValue];
  float v45 = v44;

  if (v45 > 0.0)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v46 = [*a3 allKeys];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v106 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v76 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          if (([v50 isEqualToString:@"deviceOrientCount"] & 1) == 0
            && [v50 hasPrefix:@"deviceOrient"])
          {
            v51 = [*a3 objectForKeyedSubscript:v50];
            [v51 floatValue];
            float v53 = v52;

            [*a3 removeObjectForKey:v50];
            *(float *)&double v54 = v53 / v45;
            v55 = [NSNumber numberWithFloat:v54];
            [*a3 setObject:v55 forKeyedSubscript:v50];
          }
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v106 count:16];
      }
      while (v47);
    }
  }
  [*a3 removeObjectForKey:@"deviceOrientCount"];
  std::string::basic_string[abi:nn180100]<0>(v103, "monocularDepthCount");
  v73[0] = v103;
  float v56 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v73)+ 10);
  if (v56 == 0.0)
  {
    v60 = &unk_26CB84D00;
  }
  else
  {
    v57 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v73, "monocularDepthSum");
    v71[0] = v73;
    float v58 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v73, (uint64_t)&std::piecewise_construct, (long long **)v71)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v71, "monocularDepthCount");
    v69[0] = v71;
    *(float *)&double v59 = v58
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v71, (uint64_t)&std::piecewise_construct, (long long **)v69)+ 10);
    v60 = [v57 numberWithFloat:v59];
  }
  [*a3 setObject:v60 forKeyedSubscript:@"monocularDepth"];
  if (v56 != 0.0)
  {

    if (v72 < 0) {
      operator delete(v71[0]);
    }
    if (v74 < 0) {
      operator delete(v73[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  [*a3 removeObjectForKey:@"monocularDepthCount"];
  [*a3 removeObjectForKey:@"monocularDepthSum"];
  std::string::basic_string[abi:nn180100]<0>(v103, "metricDepthCount");
  v69[0] = v103;
  float v61 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (long long **)v69)+ 10);
  if (v61 == 0.0)
  {
    v65 = &unk_26CB84D00;
  }
  else
  {
    v62 = NSNumber;
    std::string::basic_string[abi:nn180100]<0>(v69, "metricDepthSum");
    v67[0] = v69;
    float v63 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v69, (uint64_t)&std::piecewise_construct, (long long **)v67)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v67, "metricDepthCount");
    v105 = v67;
    *(float *)&double v64 = v63
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v67, (uint64_t)&std::piecewise_construct, (long long **)&v105)+ 10);
    v65 = [v62 numberWithFloat:v64];
  }
  [*a3 setObject:v65 forKeyedSubscript:@"metricDepth"];
  if (v61 != 0.0)
  {

    if (v68 < 0) {
      operator delete(v67[0]);
    }
    if (v70 < 0) {
      operator delete(v69[0]);
    }
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  [*a3 removeObjectForKey:@"metricDepthCount"];
  [*a3 removeObjectForKey:@"metricDepthSum"];
}

- (id)coreAnalyticDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  countItemKey = self->_countItemKey;
  float v5 = 1.0;
  if (countItemKey)
  {
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[(NSString *)countItemKey UTF8String]);
    id v6 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_accumulatedData.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&__p);
    float v7 = v6;
    if ((char)v33 < 0)
    {
      operator delete(__p);
      if (!v7) {
        goto LABEL_9;
      }
    }
    else if (!v6)
    {
      goto LABEL_9;
    }
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[(NSString *)self->_countItemKey UTF8String]);
    p_p = &__p;
    float v5 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)&__p, (uint64_t)&std::piecewise_construct, (long long **)&p_p)+ 10);
    if ((char)v33 < 0) {
      operator delete(__p);
    }
    *(float *)&double v8 = v5;
    char v9 = [NSNumber numberWithFloat:v8];
    [v3 setObject:v9 forKeyedSubscript:self->_countItemKey];
  }
LABEL_9:
  float v10 = [NSNumber numberWithDouble:self->_elapseTime];
  [v3 setObject:v10 forKeyedSubscript:@"elapseTime"];

  long long v11 = [NSNumber numberWithDouble:v5 / self->_elapseTime];
  [v3 setObject:v11 forKeyedSubscript:@"countPerSecond"];

  float v12 = [NSNumber numberWithDouble:CACurrentMediaTime() - self->_createdTime];
  [v3 setObject:v12 forKeyedSubscript:@"modelAge"];

  next = (char *)self->_accumulatedData.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[(NSString *)self->_countItemKey UTF8String]);
      float v15 = (const void **)(next + 16);
      if ((v33 & 0x80u) == 0) {
        size_t v16 = v33;
      }
      else {
        size_t v16 = __n;
      }
      uint64_t v17 = next[39];
      int v18 = (char)v17;
      if ((v17 & 0x80u) != 0) {
        uint64_t v17 = *((void *)next + 3);
      }
      if (v16 != v17) {
        break;
      }
      if (v18 >= 0) {
        v19 = (unsigned __int8 *)(next + 16);
      }
      else {
        v19 = (unsigned __int8 *)*v15;
      }
      if ((v33 & 0x80) != 0)
      {
        v24 = __p;
        int v25 = memcmp(__p, v19, __n);
        operator delete(v24);
        if (v25) {
          goto LABEL_32;
        }
      }
      else if (v33)
      {
        uint64_t v20 = 0;
        do
        {
          int v21 = *((unsigned __int8 *)&__p + v20);
          int v22 = v19[v20];
        }
        while (v21 == v22 && v33 - 1 != v20++);
        if (v21 != v22) {
          goto LABEL_32;
        }
      }
LABEL_35:
      next = *(char **)next;
      if (!next) {
        goto LABEL_36;
      }
    }
    if ((v33 & 0x80) != 0) {
      operator delete(__p);
    }
LABEL_32:
    *(float *)&double v14 = *((float *)next + 10) / v5;
    v26 = [NSNumber numberWithFloat:v14];
    if (next[39] < 0) {
      float v15 = (const void **)*v15;
    }
    float v27 = [NSString stringWithUTF8String:v15];
    [v3 setObject:v26 forKeyedSubscript:v27];

    goto LABEL_35;
  }
LABEL_36:
  if ([(NSString *)self->_coreAnalyticEventName isEqualToString:@"com.apple.sceneUnderstanding.personPetDetection"])
  {
    id v30 = v3;
    [(SICoreAnalyticManager *)self coreAnalyticDictionaryForPersonPetDetection:&v30];
    id v28 = v30;

    id v3 = v28;
  }
  return v3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_accumulatedData);
  objc_storeStrong((id *)&self->_accumulatedDataKeys, 0);
  objc_storeStrong((id *)&self->_countItemKey, 0);
  objc_storeStrong((id *)&self->_coreAnalyticEventName, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end