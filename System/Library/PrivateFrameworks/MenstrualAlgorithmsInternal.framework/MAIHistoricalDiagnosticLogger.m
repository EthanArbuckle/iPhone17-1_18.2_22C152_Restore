@interface MAIHistoricalDiagnosticLogger
- (basic_string<char,)jsonObjectName;
- (id)baseFileName;
- (id)notificationName;
- (void)finalizeHistoricalAnalyzerInput;
- (void)logHistoricalAnalyzerOutput:(MAIHistoricalAnalyzerOutput)a3;
@end

@implementation MAIHistoricalDiagnosticLogger

- (id)notificationName
{
  return @"com.apple.HealthAlgorithms.HistoricalAnalyzer.WriteToJson";
}

- (id)baseFileName
{
  return @"historical_analyzer";
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "historicalAnalyzer");
}

- (void)finalizeHistoricalAnalyzerInput
{
  [(MAIDiagnosticLogger *)self inputJson];
  if (__p[1]) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)__p[1]);
  }
  if (__p[0])
  {
    [(MAIDiagnosticLogger *)self inputJson];
    uint64_t v3 = v16;
    [(MAIHistoricalDiagnosticLogger *)self jsonObjectName];
    v4 = std::string::append(&v13, ".analyze", 8uLL);
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    std::string::size_type v15 = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<std::string>(v3, (uint64_t)__p);
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
    [(MAIDiagnosticLogger *)self inputFile];
    v6 = (uint64_t *)__p[0];
    [(MAIDiagnosticLogger *)self inputJson];
    v7 = nlohmann::operator<<(v6, (uint64_t)v13.__r_.__value_.__l.__data_);
    LOBYTE(v16) = 10;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v7, (uint64_t)&v16, 1);
    if (v13.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v13.__r_.__value_.__l.__size_);
    }
    if (__p[1]) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)__p[1]);
    }
    uint64_t v11 = 0;
    v12 = 0;
    [(MAIDiagnosticLogger *)self setInputFile:&v11];
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v12);
    }
    uint64_t v9 = 0;
    v10 = 0;
    [(MAIDiagnosticLogger *)self setInputJson:&v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    v8 = ha_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_22F10E000, v8, OS_LOG_TYPE_DEFAULT, "finished writing input file", (uint8_t *)__p, 2u);
    }
  }
}

- (void)logHistoricalAnalyzerOutput:(MAIHistoricalAnalyzerOutput)a3
{
  id var1 = a3.var1;
  id var0 = a3.var0;
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v41 = a3.var0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v69, 0, 0, 0, 2);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = var0;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v131, 16, v41);
  if (v4)
  {
    uint64_t v45 = *(void *)v66;
    do
    {
      uint64_t v46 = v4;
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v66 != v45) {
          objc_enumerationMutation(obj);
        }
        long long v5 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v63, 0, 0, 0, 2);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v6 = [v5 phases];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v130 count:16];
        v48 = v5;
        if (v7)
        {
          uint64_t v8 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v60 != v8) {
                objc_enumerationMutation(v6);
              }
              phase_to_string([*(id *)(*((void *)&v59 + 1) + 8 * j) intValue], __p);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<std::string>((uint64_t)v63, (uint64_t)__p);
              if (SHIBYTE(v115) < 0) {
                operator delete(__p[0]);
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v130 count:16];
          }
          while (v7);
        }

        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[29],char [29],0>((uint64_t)&v107, "julianDayOfMenstruationStart");
        v109 = &v107;
        char v110 = 1;
        unsigned int v10 = [v48 julianDayOfMenstruationStart];
        v111[0] = 6;
        v112[0] = v10;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v111);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v111);
        v112[1] = v111;
        char v113 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)__p, (uint64_t)&v107, 2, 1, 2);
        v115 = __p;
        char v116 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[27],char [27],0>((uint64_t)v101, "julianDayOfMenstruationEnd");
        v102[1] = (uint64_t *)v101;
        char v103 = 1;
        unsigned int v11 = [v48 julianDayOfMenstruationEnd];
        v104[0] = 6;
        v105[0] = v11;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v104);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v104);
        v105[1] = v104;
        char v106 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v117, (uint64_t)v101, 2, 1, 2);
        v117[2] = v117;
        char v118 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[14],char [14],0>((uint64_t)v96, "isDeterminant");
        v96[2] = (const char *)v96;
        char v97 = 1;
        unsigned int v12 = [v48 isDeterminant];
        v98[0] = 4;
        v99[0] = v12;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
        v99[1] = v98;
        char v100 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v119, (uint64_t)v96, 2, 1, 2);
        v119[2] = v119;
        char v120 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[24],char [24],0>((uint64_t)v90, "predictionPrimarySource");
        v91 = v90;
        char v92 = 1;
        std::string::basic_string[abi:nn180100]<0>(v55, off_2649FD8A0[(char)[v48 predictionPrimarySource]]);
        uint64_t v94 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v93, (uint64_t)v55);
        char v95 = 1;
        v121[2] = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v121, (uint64_t)v90, 2, 1, 2);
        char v122 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[7],char [7],0>((uint64_t)v84, "phases");
        v85 = v84;
        char v86 = 1;
        uint64_t v88 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v87, (uint64_t)v63);
        char v89 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v123, (uint64_t)v84, 2, 1, 2);
        v123[2] = v123;
        char v124 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[29],char [29],0>((uint64_t)v78, "ovulationConfirmationFailure");
        v79 = v78;
        char v80 = 1;
        unsigned int v13 = [v48 ovulationConfirmationFailure];
        v14 = "(invalid)";
        if (v13 <= 4) {
          v14 = off_2649FD8C0[(char)v13];
        }
        std::string::basic_string[abi:nn180100]<0>(v53, v14);
        uint64_t v82 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v81, (uint64_t)v53);
        char v83 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v125, (uint64_t)v78, 2, 1, 2);
        v125[2] = v125;
        char v126 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[35],char [35],0>((uint64_t)v72, "dailyEligibleWristTemperatureCount");
        v73 = v72;
        char v74 = 1;
        uint64_t v15 = [v48 dailyEligibleWristTemperatureCount];
        v75[0] = 5;
        v76[0] = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v75);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v75);
        v76[1] = v75;
        char v77 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v127, (uint64_t)v72, 2, 1, 2);
        v128 = v127;
        char v129 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v57, (uint64_t)__p, 7, 1, 2);
        for (uint64_t k = 0; k != -224; k -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v127[k]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v127[k + 8], v127[k]);
        }
        for (uint64_t m = 0; m != -8; m -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v75[m * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v76[m], v75[m * 8]);
        }
        for (uint64_t n = 0; n != -64; n -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v81[n]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v81[n + 8], v81[n]);
        }
        if (v54 < 0) {
          operator delete(v53[0]);
        }
        for (uint64_t ii = 0; ii != -64; ii -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v87[ii]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v87[ii + 8], v87[ii]);
        }
        for (juint64_t j = 0; jj != -64; jj -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v93[jj]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v93[jj + 8], v93[jj]);
        }
        if (v56 < 0) {
          operator delete(v55[0]);
        }
        for (kuint64_t k = 0; kk != -8; kk -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v98[kk * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v99[kk], v98[kk * 8]);
        }
        for (muint64_t m = 0; mm != -8; mm -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v104[mm * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v105[mm], v104[mm * 8]);
        }
        for (nuint64_t n = 0; nn != -8; nn -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v111[nn * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v112[nn], v111[nn * 8]);
        }
        v24 = [v48 fertilityStartJulianDay];
        v25 = v24;
        if (v24)
        {
          int v26 = [v24 intValue];
          v51[0] = 5;
          v52 = (uint64_t *)v26;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
          v27 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v57, "julianDayOfFertilityStart");
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
          unsigned __int8 v28 = *(unsigned char *)v27;
          *(unsigned char *)v27 = v51[0];
          v51[0] = v28;
          v29 = (uint64_t *)v27[1];
          v27[1] = (uint64_t)v52;
          v52 = v29;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v52, v51[0]);
        }

        v30 = [v48 fertilityEndJulianDay];
        v31 = v30;
        if (v30)
        {
          int v32 = [v30 intValue];
          v49[0] = 5;
          v50 = (uint64_t *)v32;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
          v33 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v57, "julianDayOfFertilityEnd");
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
          unsigned __int8 v34 = *(unsigned char *)v33;
          *(unsigned char *)v33 = v49[0];
          v49[0] = v34;
          v35 = (uint64_t *)v33[1];
          v33[1] = (uint64_t)v50;
          v50 = v35;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v50, v49[0]);
        }

        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v69, (uint64_t)v57);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v58, v57[0]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v63);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v64, v63[0]);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v65 objects:v131 count:16];
    }
    while (v4);
  }

  [(MAIDiagnosticLogger *)self outputJson];
  double v36 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[7],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v107, "cycles", (uint64_t)v69, (uint64_t)__p);
  if (v108) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v108);
  }
  v37 = var1;
  if (var1)
  {
    v38 = objc_msgSend(MEMORY[0x263F08900], "dataWithJSONObject:options:error:", var1, 0, 0, v36);
    v39 = (void *)[[NSString alloc] initWithData:v38 encoding:4];
    if ([v39 length])
    {
      [(MAIDiagnosticLogger *)self outputJson];
      uint64_t v40 = v107;
      v96[0] = (const char *)[v39 UTF8String];
      v71[3] = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(v96, (uint64_t)v71, 1, (uint64_t)v101);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[14],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v40, "coreAnalytics", (uint64_t)v101, (uint64_t)__p);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v101);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v102, v101[0]);
      std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:nn180100](v71);
      if (v108) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v108);
      }
    }

    v37 = var1;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v70, v69[0]);
}

@end