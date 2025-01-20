@interface MAIDayStreamDiagnosticLogger
- (MAIDayStreamDiagnosticLogger)initWithConfig:(id)a3;
- (basic_string<char,)jsonObjectName;
- (id)baseFileName;
- (id)notificationName;
- (void)finalizeDayStreamInputWithDay:(unsigned int)a3;
- (void)logDayStreamProcessorOutput:;
- (void)logDayStreamProcessorOutput:(MAIDayStreamProcessorOutput *)a3;
@end

@implementation MAIDayStreamDiagnosticLogger

- (MAIDayStreamDiagnosticLogger)initWithConfig:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MAIDayStreamDiagnosticLogger;
  v5 = [(MAIDiagnosticLogger *)&v40 init];
  if (v5)
  {
    id v6 = v4;
    v38[0] = 0;
    v39 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v38);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v38);
    v7 = [v6 userReportedCycleLength];
    v8 = v7;
    if (v7)
    {
      int v56 = [v7 intValue];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[24],int>((uint64_t)v38, "userReportedCycleLength", &v56, (uint64_t)v63);
    }

    v9 = [v6 julianDayOfUserReportedCycleLength];
    v10 = v9;
    if (v9)
    {
      int v56 = [v9 intValue];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[35],int>((uint64_t)v38, "julianDayOfUserReportedCycleLength", &v56, (uint64_t)v63);
    }

    v11 = [v6 userReportedMenstruationLength];
    v12 = v11;
    if (v11)
    {
      int v56 = [v11 intValue];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[31],int>((uint64_t)v38, "userReportedMenstruationLength", &v56, (uint64_t)v63);
    }

    v13 = [v6 julianDayOfUserReportedMenstruationLength];
    v14 = v13;
    if (v13)
    {
      int v56 = [v13 intValue];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[42],int>((uint64_t)v38, "julianDayOfUserReportedMenstruationLength", &v56, (uint64_t)v63);
    }

    v15 = [v6 birthDateComponents];
    if (v15)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[5],char [5],0>((uint64_t)&v56, "year");
      v58 = &v56;
      char v59 = 1;
      uint64_t v16 = [v15 year];
      v60[0] = 5;
      v61[0] = v16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v60);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v60);
      v61[1] = v60;
      char v62 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v63, (uint64_t)&v56, 2, 1, 2);
      v64 = v63;
      char v65 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)__p, "month");
      v51 = __p;
      char v52 = 1;
      uint64_t v17 = [v15 month];
      v53[0] = 5;
      v54[0] = v17;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
      v54[1] = v53;
      char v55 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v66, (uint64_t)__p, 2, 1, 2);
      v68 = v66;
      char v69 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[4],char [4],0>((uint64_t)&v45, "day");
      v45.__r_.__value_.__r.__words[2] = (std::string::size_type)&v45;
      char v46 = 1;
      uint64_t v18 = [v15 day];
      v47[0] = 5;
      v48[0] = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v47);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v47);
      v48[1] = v47;
      char v49 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v70, (uint64_t)&v45, 2, 1, 2);
      v71 = v70;
      char v72 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v43, (uint64_t)v63, 3, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v38, "birthDateComponents", (uint64_t)v43, (uint64_t)&v41);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v43);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v44, v43[0]);
      for (uint64_t i = 0; i != -96; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v70[i]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v70[i + 8], v70[i]);
      }
      for (uint64_t j = 0; j != -8; j -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v47[j * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v48[j], v47[j * 8]);
      }
      for (uint64_t k = 0; k != -8; k -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v53[k * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v54[k], v53[k * 8]);
      }
      for (uint64_t m = 0; m != -8; m -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v60[m * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v61[m], v60[m * 8]);
      }
    }

    int v56 = [v6 todayAsJulianDay];
    v23 = objc_msgSend(v6, "deviationInput", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[17],unsigned int>((uint64_t)v38, "todayAsJulianDay", (unsigned int *)&v56, (uint64_t)v63));
    if (v23)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v56, 0, 0, 0, 1);
      v24 = [v23 julianDayMinAnalysisWindowStartIrregular];
      if (v24)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowStartIrregular" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v24 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v25 = [v23 julianDayMinAnalysisWindowStartInfrequent];
      if (v25)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowStartInfrequent" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v25 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v26 = [v23 julianDayMinAnalysisWindowStartProlonged];
      if (v26)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowStartProlonged" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v26 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v27 = [v23 julianDayMinAnalysisWindowStartSpotting];
      if (v27)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowStartSpotting" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v27 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v28 = [v23 julianDayMinAnalysisWindowEndIrregular];
      if (v28)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowEndIrregular" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v28 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v29 = [v23 julianDayMinAnalysisWindowEndInfrequent];
      if (v29)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowEndInfrequent" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v29 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v30 = [v23 julianDayMinAnalysisWindowEndProlonged];
      if (v30)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowEndProlonged" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v30 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      v31 = [v23 julianDayMinAnalysisWindowEndSpotting];
      if (v31)
      {
        __p[0] = (void *)[@"julianDayMinAnalysisWindowEndSpotting" UTF8String];
        LODWORD(v45.__r_.__value_.__l.__data_) = [v31 intValue];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)&v56, (char **)__p, (int *)&v45, (uint64_t)v63);
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>&>((uint64_t)v38, "deviation", (uint64_t)&v56, (uint64_t)v63);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v56);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v57, v56);
    }

    [(MAIDiagnosticLogger *)v5 inputJson];
    uint64_t v32 = v41;
    [(MAIDayStreamDiagnosticLogger *)v5 jsonObjectName];
    v33 = std::string::append(&v45, ".init", 5uLL);
    long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
    v51 = (void **)v33->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v34;
    v33->__r_.__value_.__l.__size_ = 0;
    v33->__r_.__value_.__r.__words[2] = 0;
    v33->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v63, (uint64_t)__p);
    v64 = v63;
    char v65 = 1;
    v66[0] = v38[0];
    v67 = v39;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v38);
    v38[0] = 0;
    v39 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v66);
    v68 = v66;
    char v69 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v56, (uint64_t)v63, 2, 1, 2);
    v58 = &v56;
    char v59 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v43, (uint64_t)&v56, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v32, (uint64_t)v43);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v43);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v44, v43[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v56);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v57, v56);
    for (uint64_t n = 0; n != -8; n -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v66[n * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v67)[n], v66[n * 8]);
    }
    if (SHIBYTE(v51) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v45.__r_.__value_.__l.__data_);
    }
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v42);
    }
    v36 = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v38);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v39, v38[0]);
  }

  return v5;
}

- (id)notificationName
{
  return @"com.apple.HealthAlgorithms.DayStreamProcessor.WriteToJson";
}

- (id)baseFileName
{
  return @"day_stream_processor";
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "dayStreamProcessor");
}

- (void)finalizeDayStreamInputWithDay:(unsigned int)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  [(MAIDiagnosticLogger *)self inputJson];
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v34);
  }
  if (*(void *)buf)
  {
    [(MAIDiagnosticLogger *)self inputJson];
    v5 = v21[1];
    [(MAIDayStreamDiagnosticLogger *)self jsonObjectName];
    id v6 = std::string::append(&v17, ".analyze", 8uLL);
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v19 = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)buf, (uint64_t)__p);
    v35 = buf;
    char v36 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[40],char [40],0>((uint64_t)&v23, "mostRecentMenstrualFlowJulianDayUpdated");
    v25 = &v23;
    char v26 = 1;
    v27[0] = 6;
    v28[0] = a3;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
    v28[1] = v27;
    char v29 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v30, (uint64_t)&v23, 2, 1, 2);
    v31[1] = (uint64_t *)v30;
    char v32 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v37, (uint64_t)v30, 1, 1, 2);
    v38 = v37;
    char v39 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v40, (uint64_t)buf, 2, 1, 2);
    v41[1] = (uint64_t *)v40;
    char v42 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v20, (uint64_t)v40, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v5, (uint64_t)v20);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v21, v20[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v40);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v41, v40[0]);
    for (uint64_t i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v37[i]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[i + 8], v37[i]);
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30[0]);
    for (uint64_t j = 0; j != -8; j -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v27[j * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v28[j], v27[j * 8]);
    }
    if (SHIBYTE(v19) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v22);
    }
    [(MAIDiagnosticLogger *)self inputFile];
    v10 = *(uint64_t **)buf;
    [(MAIDiagnosticLogger *)self inputJson];
    v11 = nlohmann::operator<<(v10, v23);
    v40[0] = 10;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)v40, 1);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v24);
    }
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v34);
    }
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    [(MAIDiagnosticLogger *)self setInputFile:&v15];
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    }
    uint64_t v13 = 0;
    v14 = 0;
    [(MAIDiagnosticLogger *)self setInputJson:&v13];
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    }
    v12 = ha_get_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F10E000, v12, OS_LOG_TYPE_DEFAULT, "finished writing input file", buf, 2u);
    }
  }
}

- (void)logDayStreamProcessorOutput:(MAIDayStreamProcessorOutput *)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a3->var0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v68, 0, 0, 0, 2);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v6 = [v5 menstruationPredictions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_5::operator()(*(void **)(*((void *)&v64 + 1) + 8 * i), (uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v68, (uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v71, v70[0]);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v7);
  }

  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v62, 0, 0, 0, 2);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v10 = [v5 fertilityPredictions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v10);
        }
        -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_5::operator()(*(void **)(*((void *)&v58 + 1) + 8 * j), (uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v62, (uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v71, v70[0]);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v76 count:16];
    }
    while (v11);
  }

  v56[0] = 0;
  v57 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  v14 = [v5 stats];
  uint64_t v15 = [v14 medianCycleLength];

  if (v15)
  {
    LODWORD(v72) = [v15 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[18],int>((uint64_t)v56, "medianCycleLength", (int *)&v72, (uint64_t)v70);
  }

  uint64_t v16 = [v5 stats];
  std::string v17 = [v16 medianMenstruationLength];

  if (v17)
  {
    LODWORD(v72) = [v17 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[25],int>((uint64_t)v56, "medianMenstruationLength", (int *)&v72, (uint64_t)v70);
  }

  uint64_t v18 = [v5 stats];
  std::string::size_type v19 = [v18 lowerCycleLengthPercentile];

  if (v19)
  {
    LODWORD(v72) = [v19 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v56, "lowerCycleLengthPercentile", (int *)&v72, (uint64_t)v70);
  }

  v20 = [v5 stats];
  v21 = [v20 lowerMenstruationLengthPercentile];

  if (v21)
  {
    LODWORD(v72) = [v21 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],int>((uint64_t)v56, "lowerMenstruationLengthPercentile", (int *)&v72, (uint64_t)v70);
  }

  v22 = [v5 stats];
  uint64_t v23 = [v22 upperCycleLengthPercentile];

  if (v23)
  {
    LODWORD(v72) = [v23 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v56, "upperCycleLengthPercentile", (int *)&v72, (uint64_t)v70);
  }

  v24 = [v5 stats];
  v25 = [v24 upperMenstruationLengthPercentile];

  if (v25)
  {
    LODWORD(v72) = [v25 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],int>((uint64_t)v56, "upperMenstruationLengthPercentile", (int *)&v72, (uint64_t)v70);
  }

  char v26 = [v5 stats];
  v27 = [v26 numberOfCyclesFound];

  if (v27)
  {
    LODWORD(v72) = [v27 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],int>((uint64_t)v56, "numberOfCyclesFound", (int *)&v72, (uint64_t)v70);
  }

  v28 = [v5 stats];
  char v29 = [v28 julianDayOfFirstCycleStart];

  if (v29)
  {
    LODWORD(v72) = [v29 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[27],int>((uint64_t)v56, "julianDayOfFirstCycleStart", (int *)&v72, (uint64_t)v70);
  }

  v30 = [v5 stats];
  v31 = [v30 julianDayOfLastCycleStart];

  if (v31)
  {
    LODWORD(v72) = [v31 intValue];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[26],int>((uint64_t)v56, "julianDayOfLastCycleStart", (int *)&v72, (uint64_t)v70);
  }

  id v32 = [v5 deviationAnalysis];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v54, 0, 0, 0, 1);
  v33 = [v32 irregularBleeding];
  if (v33)
  {
    char v52 = (char *)[@"irregularBleeding" UTF8String];
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v33, (uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v54, &v52, (uint64_t)&v72, (uint64_t)v70);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v73, v72);
  }

  long long v34 = [v32 infrequentBleeding];
  if (v34)
  {
    char v52 = (char *)[@"infrequentBleeding" UTF8String];
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v34, (uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v54, &v52, (uint64_t)&v72, (uint64_t)v70);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v73, v72);
  }

  v35 = [v32 prolongedBleeding];
  if (v35)
  {
    char v52 = (char *)[@"prolongedBleeding" UTF8String];
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v35, (uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v54, &v52, (uint64_t)&v72, (uint64_t)v70);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v73, v72);
  }

  char v36 = [v32 spotting];
  if (v36)
  {
    char v52 = (char *)[@"spotting" UTF8String];
    -[MAIDayStreamDiagnosticLogger logDayStreamProcessorOutput:]::$_6::operator() const(HAMenstrualAlgorithmsDeviationAnalysis *)::{lambda(HAMenstrualAlgorithmsDeviation *)#1}::operator()(v36, (uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v54, &v52, (uint64_t)&v72, (uint64_t)v70);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v72);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v73, v72);
  }

  [(MAIDiagnosticLogger *)self outputJson];
  double v37 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[24],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v72, "menstruationPredictions", (uint64_t)v68, (uint64_t)v70);
  if (v73) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v73);
  }
  [(MAIDiagnosticLogger *)self outputJson];
  double v38 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v72, "fertilityPredictions", (uint64_t)v62, (uint64_t)v70);
  if (v73) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v73);
  }
  [(MAIDiagnosticLogger *)self outputJson];
  double v39 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[6],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v72, "stats", (uint64_t)v56, (uint64_t)v70);
  if (v73) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v73);
  }
  [(MAIDiagnosticLogger *)self outputJson];
  double v40 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[11],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v72, "deviations", (uint64_t)v54, (uint64_t)v70);
  if (v73) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v73);
  }
  [(MAIDiagnosticLogger *)self outputJson];
  uint64_t v41 = v72;
  LOBYTE(v52) = [v5 isUserInactive];
  double v42 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>(v41, "userInactive", (unsigned __int8 *)&v52, (uint64_t)v70);
  if (v73) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v73);
  }
  id var1 = a3->var1;
  if (var1)
  {
    v44 = objc_msgSend(MEMORY[0x263F08900], "dataWithJSONObject:options:error:", var1, 0, 0, v42);
    std::string v45 = (void *)[[NSString alloc] initWithData:v44 encoding:4];
    if ([v45 length])
    {
      [(MAIDiagnosticLogger *)self outputJson];
      uint64_t v46 = v72;
      v51 = (const char *)[v45 UTF8String];
      v75[3] = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(&v51, (uint64_t)v75, 1, (uint64_t)&v52);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v46, "coreAnalyticsForDayStreamAnalysis", (uint64_t)&v52, (uint64_t)v70);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v52);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v53, v52);
      std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:nn180100](v75);
      if (v73) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v73);
      }
    }
  }
  id var2 = a3->var2;
  if (var2)
  {
    v48 = objc_msgSend(MEMORY[0x263F08900], "dataWithJSONObject:options:error:", var2, 0, 0, v42);
    char v49 = (void *)[[NSString alloc] initWithData:v48 encoding:4];
    if ([v49 length])
    {
      [(MAIDiagnosticLogger *)self outputJson];
      uint64_t v50 = v72;
      v51 = (const char *)[v49 UTF8String];
      v74[3] = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(&v51, (uint64_t)v74, 1, (uint64_t)&v52);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[34],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v50, "coreAnalyticsForDeviationAnalysis", (uint64_t)&v52, (uint64_t)v70);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v52);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v53, v52);
      std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:nn180100](v74);
      if (v73) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v73);
      }
    }
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v54);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v55, v54[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v57, v56[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v62);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v63, v62[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v68);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v69, v68[0]);
}

- (void)logDayStreamProcessorOutput:
{
  uint64_t v21 = a2;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v22 = a1;
  v28 = (char *)[@"julianDayOfAnalysisWindowStart" UTF8String];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v36, &v28);
  v37[1] = (uint64_t *)v36;
  char v38 = 1;
  unsigned int v2 = [v22 julianDayOfAnalysisWindowStart];
  v39[0] = 6;
  v40[0] = v2;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v39);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v39);
  v40[1] = v39;
  char v41 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v42, (uint64_t)v36, 2, 1, 2);
  uint64_t v43 = v42;
  char v44 = 1;
  v27 = (char *)[@"julianDayOfAnalysisWindowEnd" UTF8String];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v31, &v27);
  v31[2] = (char *)v31;
  char v32 = 1;
  unsigned int v3 = [v22 julianDayOfAnalysisWindowEnd];
  v33[0] = 6;
  v34[0] = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  v34[1] = v33;
  char v35 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v45, (uint64_t)v31, 2, 1, 2);
  uint64_t v46 = v45;
  char v47 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v21, (uint64_t)v42, 2, 1, 2);
  for (uint64_t i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45[i]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45[i + 8], v45[i]);
  }
  for (uint64_t j = 0; j != -8; j -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33[j * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v34[j], v33[j * 8]);
  }
  for (uint64_t k = 0; k != -8; k -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v39[k * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v40[k], v39[k * 8]);
  }
  uint64_t v7 = [v22 metricsForCoreAnalytics];
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    v30[0] = @"deviationTrueBeforeRules";
    v30[1] = @"passedRuleMinWindowStart";
    v30[2] = @"passedRuleMinWindowEnd";
    v30[3] = @"passedRuleEnoughData";
    v30[4] = @"passedRuleFactorEndInWashout";
    v30[5] = @"passedRuleFactorInWindow";
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:6];
    v10 = [v8 setWithArray:v9];

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v36, 0, 0, 0, 1);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v11 = [v7 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t m = 0; m != v12; ++m)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * m);
          uint64_t v16 = objc_msgSend(v7, "objectForKeyedSubscript:", v15, v21);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            if ([v10 containsObject:v15])
            {
              id v18 = v15;
              v31[0] = (char *)[v18 UTF8String];
              std::string::size_type v19 = [v7 objectForKeyedSubscript:v18];
              LOBYTE(v28) = [v19 BOOLValue];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,BOOL>((uint64_t)v36, v31, (unsigned __int8 *)&v28, (uint64_t)v42);
            }
            else
            {
              id v20 = v15;
              v31[0] = (char *)[v20 UTF8String];
              std::string::size_type v19 = [v7 objectForKeyedSubscript:v20];
              LODWORD(v28) = [v19 intValue];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,int>((uint64_t)v36, v31, (int *)&v28, (uint64_t)v42);
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
    }

    v31[0] = (char *)[@"metricsForCoreAnalytics" UTF8String];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>&>(v21, v31, (uint64_t)v36, (uint64_t)v42);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v36);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v37, v36[0]);
  }
}

@end