@interface MAIDiagnosticLogger
- (BOOL)notifyState;
- (MAIDiagnosticLogger)init;
- (NSString)baseFileName;
- (NSString)notificationName;
- (basic_string<char,)jsonObjectName;
- (id).cxx_construct;
- (int)notifyToken;
- (shared_ptr<nlohmann::basic_json<>>)inputJson;
- (shared_ptr<nlohmann::basic_json<>>)outputJson;
- (shared_ptr<std::ofstream>)inputFile;
- (shared_ptr<std::ofstream>)outputFile;
- (void)appendDay:;
- (void)appendDay:(id)a3;
- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)dealloc;
- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4;
- (void)init;
- (void)removeOldFiles;
- (void)setInputFile:(shared_ptr<std::ofstream>)a3;
- (void)setInputJson:(shared_ptr<nlohmann::basic_json<>>)a3;
- (void)setNotifyState:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setOutputFile:(shared_ptr<std::ofstream>)a3;
- (void)setOutputJson:(shared_ptr<nlohmann::basic_json<>>)a3;
@end

@implementation MAIDiagnosticLogger

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (MAIDiagnosticLogger)init
{
  v41[1] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)MAIDiagnosticLogger;
  v2 = [(MAIDiagnosticLogger *)&v39 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    p_notifyToken = &v2->_notifyToken;
    v5 = [(MAIDiagnosticLogger *)v2 notificationName];
    v6 = v5;
    if (v5)
    {
      notify_register_check((const char *)[v5 UTF8String], &v3->_notifyToken);
      if (*p_notifyToken != -1)
      {
        if ([(MAIDiagnosticLogger *)v3 notifyState] || (ha_sensitive_logging_is_enabled() & 1) != 0)
        {
          v7 = ha_get_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F10E000, v7, OS_LOG_TYPE_DEFAULT, "logging is enabled", buf, 2u);
          }

          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&__p, 0, 0, 0, 2);
          std::allocate_shared[abi:nn180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,void>((uint64_t)&__p, buf);
          shared_ptr<nlohmann::basic_json<>> v8 = *(shared_ptr<nlohmann::basic_json<>> *)buf;
          memset(buf, 0, sizeof(buf));
          cntrl = (std::__shared_weak_count *)v3->_inputJson.__cntrl_;
          v3->_inputJson = v8;
          if (cntrl)
          {
            std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
            if (*(void *)&buf[8]) {
              std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
            }
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v33, __p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&__p, 0, 0, 0, 1);
          std::allocate_shared[abi:nn180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,void>((uint64_t)&__p, buf);
          shared_ptr<nlohmann::basic_json<>> v10 = *(shared_ptr<nlohmann::basic_json<>> *)buf;
          memset(buf, 0, sizeof(buf));
          v11 = (std::__shared_weak_count *)v3->_outputJson.__cntrl_;
          v3->_outputJson = v10;
          if (v11)
          {
            std::__shared_weak_count::__release_shared[abi:nn180100](v11);
            if (*(void *)&buf[8]) {
              std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
            }
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v33, __p);
          v12 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v40 = *MEMORY[0x263F080A8];
          v41[0] = *MEMORY[0x263F08088];
          v13 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
          id v38 = 0;
          char v14 = [v12 createDirectoryAtPath:@"/var/mobile/Library/Logs/CycleTracking" withIntermediateDirectories:1 attributes:v13 error:&v38];
          id v15 = v38;

          if (v14)
          {
            v16 = [(MAIDiagnosticLogger *)v3 baseFileName];
            id v17 = [@"/var/mobile/Library/Logs/CycleTracking" stringByAppendingPathComponent:v16];
            std::string::basic_string[abi:nn180100]<0>(buf, (char *)[v17 UTF8String]);

            if ((v37 & 0x80u) == 0) {
              size_t v18 = v37;
            }
            else {
              size_t v18 = *(void *)&buf[8];
            }
            p_p = &__p;
            std::string::basic_string[abi:nn180100]((uint64_t)&__p, v18 + 11);
            if (v34 < 0) {
              p_p = __p;
            }
            if (v18)
            {
              if ((v37 & 0x80u) == 0) {
                v20 = buf;
              }
              else {
                v20 = *(uint8_t **)buf;
              }
              memmove(p_p, v20, v18);
            }
            strcpy((char *)p_p + v18, "_input.json");
            std::allocate_shared[abi:nn180100]<std::ofstream,std::allocator<std::ofstream>,std::string,void>(&v35);
            shared_ptr<std::ofstream> v21 = v35;
            shared_ptr<std::ofstream> v35 = (shared_ptr<std::ofstream>)0;
            v22 = (std::__shared_weak_count *)v3->_inputFile.__cntrl_;
            v3->_inputFile = v21;
            if (v22)
            {
              std::__shared_weak_count::__release_shared[abi:nn180100](v22);
              if (v35.__cntrl_) {
                std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v35.__cntrl_);
              }
            }
            if (v34 < 0) {
              operator delete(__p);
            }
            if ((v37 & 0x80u) == 0) {
              size_t v23 = v37;
            }
            else {
              size_t v23 = *(void *)&buf[8];
            }
            v24 = &__p;
            std::string::basic_string[abi:nn180100]((uint64_t)&__p, v23 + 12);
            if (v34 < 0) {
              v24 = __p;
            }
            if (v23)
            {
              if ((v37 & 0x80u) == 0) {
                v25 = buf;
              }
              else {
                v25 = *(uint8_t **)buf;
              }
              memmove(v24, v25, v23);
            }
            strcpy((char *)v24 + v23, "_output.json");
            std::allocate_shared[abi:nn180100]<std::ofstream,std::allocator<std::ofstream>,std::string,void>(&v35);
            shared_ptr<std::ofstream> v26 = v35;
            shared_ptr<std::ofstream> v35 = (shared_ptr<std::ofstream>)0;
            v27 = (std::__shared_weak_count *)v3->_outputFile.__cntrl_;
            v3->_outputFile = v26;
            if (v27)
            {
              std::__shared_weak_count::__release_shared[abi:nn180100](v27);
              if (v35.__cntrl_) {
                std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v35.__cntrl_);
              }
            }
            if (v34 < 0) {
              operator delete(__p);
            }
            v28 = v3;
            if ((char)v37 < 0) {
              operator delete(*(void **)buf);
            }
          }
          else
          {
            v29 = ha_get_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              [(MAIDiagnosticLogger *)(uint64_t)v15 init];
            }

            v28 = 0;
          }

          goto LABEL_56;
        }
        v30 = ha_get_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F10E000, v30, OS_LOG_TYPE_DEFAULT, "logging is disabled", buf, 2u);
        }

        [(MAIDiagnosticLogger *)v3 removeOldFiles];
      }
    }
    v28 = 0;
LABEL_56:

    goto LABEL_57;
  }
  v28 = 0;
LABEL_57:

  return v28;
}

- (void)setNotifyState:(BOOL)a3
{
  notify_set_state([(MAIDiagnosticLogger *)self notifyToken], a3);
  id v4 = [(MAIDiagnosticLogger *)self notificationName];
  notify_post((const char *)[v4 UTF8String]);
}

- (void)removeOldFiles
{
  v37[1] = *MEMORY[0x263EF8340];
  v2 = ha_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F10E000, v2, OS_LOG_TYPE_DEFAULT, "removing old JSON files", buf, 2u);
  }

  uint64_t v23 = *MEMORY[0x263EFF5D8];
  v37[0] = *MEMORY[0x263EFF5D8];
  shared_ptr<std::ofstream> v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [NSURL URLWithString:@"/var/mobile/Library/Logs/CycleTracking"];
  v20 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v21 options:1 errorHandler:0];

  v22 = [MEMORY[0x263EFF910] date];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v20;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        shared_ptr<nlohmann::basic_json<>> v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "pathExtension", v20);
        char v10 = [v9 isEqualToString:@"json"];

        if (v10)
        {
          id v26 = 0;
          id v27 = 0;
          [v8 getResourceValue:&v27 forKey:v23 error:&v26];
          id v11 = v27;
          id v12 = v26;
          if (v11 && ([v22 timeIntervalSinceDate:v11], v13 > 86400.0))
          {
            char v14 = [MEMORY[0x263F08850] defaultManager];
            id v25 = v12;
            int v15 = [v14 removeItemAtURL:v8 error:&v25];
            id v16 = v25;

            if (v15)
            {
              id v17 = ha_get_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                size_t v18 = [v8 lastPathComponent];
                *(_DWORD *)buf = 138543362;
                v33 = v18;
                _os_log_impl(&dword_22F10E000, v17, OS_LOG_TYPE_DEFAULT, "deleted %{public}@", buf, 0xCu);
              }
            }
            else
            {
              id v17 = ha_get_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v19 = [v8 lastPathComponent];
                *(_DWORD *)buf = 138543618;
                v33 = v19;
                __int16 v34 = 2114;
                id v35 = v16;
                _os_log_impl(&dword_22F10E000, v17, OS_LOG_TYPE_DEFAULT, "failed to delete %{public}@ with error: %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v16 = v12;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v5);
  }
}

- (BOOL)notifyState
{
  uint64_t state64 = 0;
  notify_get_state([(MAIDiagnosticLogger *)self notifyToken], &state64);
  return state64 != 0;
}

- (void)dealloc
{
  [(MAIDiagnosticLogger *)self inputFile];
  if (*(void *)buf)
  {
    [(MAIDiagnosticLogger *)self inputJson];
    BOOL v3 = v16 != 0;
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v19);
  }
  if (v3)
  {
    [(MAIDiagnosticLogger *)self inputFile];
    [(MAIDiagnosticLogger *)self inputJson];
    id v4 = nlohmann::operator<<(*(uint64_t **)buf, v16);
    char v20 = 10;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v4, (uint64_t)&v20, 1);
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v19);
    }
    uint64_t v14 = 0;
    int v15 = 0;
    [(MAIDiagnosticLogger *)self setInputFile:&v14];
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v15);
    }
    uint64_t v5 = ha_get_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F10E000, v5, OS_LOG_TYPE_DEFAULT, "finished writing input file in dealloc", buf, 2u);
    }
  }
  [(MAIDiagnosticLogger *)self outputFile];
  if (*(void *)buf)
  {
    [(MAIDiagnosticLogger *)self outputJson];
    BOOL v6 = v16 != 0;
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v19);
  }
  if (v6)
  {
    [(MAIDiagnosticLogger *)self outputFile];
    v7 = *(uint64_t **)buf;
    [(MAIDiagnosticLogger *)self outputJson];
    shared_ptr<nlohmann::basic_json<>> v8 = nlohmann::operator<<(v7, v16);
    char v20 = 10;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)&v20, 1);
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v17);
    }
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v19);
    }
    uint64_t v12 = 0;
    double v13 = 0;
    [(MAIDiagnosticLogger *)self setOutputFile:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    v9 = ha_get_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F10E000, v9, OS_LOG_TYPE_DEFAULT, "finished writing output file", buf, 2u);
    }
  }
  if ([(MAIDiagnosticLogger *)self notifyToken] != -1)
  {
    char v10 = ha_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F10E000, v10, OS_LOG_TYPE_DEFAULT, "clearing the logging notification state", buf, 2u);
    }

    [(MAIDiagnosticLogger *)self setNotifyState:0];
    notify_cancel([(MAIDiagnosticLogger *)self notifyToken]);
  }
  v11.receiver = self;
  v11.super_class = (Class)MAIDiagnosticLogger;
  [(MAIDiagnosticLogger *)&v11 dealloc];
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (shared_ptr<std::ofstream>)outputFile
{
  cntrl = self->_outputFile.__cntrl_;
  NSObject *v2 = self->_outputFile.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (shared_ptr<std::ofstream>)inputFile
{
  cntrl = self->_inputFile.__cntrl_;
  NSObject *v2 = self->_inputFile.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_outputFile.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_inputFile.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
  uint64_t v5 = self->_outputJson.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v5);
  }
  BOOL v6 = self->_inputJson.__cntrl_;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
  }
}

- (NSString)baseFileName
{
  return (NSString *)@"logger";
}

- (basic_string<char,)jsonObjectName
{
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::basic_string[abi:nn180100]<0>(retstr, "logger");
}

- (NSString)notificationName
{
  return 0;
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  unsigned int v5 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  [(MAIDiagnosticLogger *)self inputJson];
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v41);
  }
  if (v40)
  {
    [(MAIDiagnosticLogger *)self inputJson];
    v7 = v20[1];
    [(MAIDiagnosticLogger *)self jsonObjectName];
    shared_ptr<nlohmann::basic_json<>> v8 = std::string::append(&v16, ".beginPhase", 0xBuLL);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type v18 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)id v17 = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v40, (uint64_t)v17);
    v42 = &v40;
    char v43 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v28, "julianDay");
    long long v29 = v28;
    char v30 = 1;
    v31[0] = 6;
    v32[0] = a4;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v31);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v31);
    v32[1] = v31;
    char v33 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v34, (uint64_t)v28, 2, 1, 2);
    id v35 = v34;
    char v36 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)v22, "phase");
    uint64_t v23 = v22;
    char v24 = 1;
    phase_to_string(v5, __p);
    uint64_t v26 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v25, (uint64_t)__p);
    char v27 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v37, (uint64_t)v22, 2, 1, 2);
    id v38 = v37;
    char v39 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v44, (uint64_t)v34, 2, 1, 2);
    v45 = v44;
    char v46 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v47, (uint64_t)&v40, 2, 1, 2);
    v48[1] = (uint64_t *)v47;
    char v49 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v19, (uint64_t)v47, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v7, (uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v20, v19[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v47);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v48, v47[0]);
    for (uint64_t i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v44[i]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v44[i + 8], v44[i]);
    }
    for (uint64_t j = 0; j != -64; j -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v37[j]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[j + 8], v37[j]);
    }
    for (uint64_t k = 0; k != -64; k -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25[k]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[k + 8], v25[k]);
    }
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t m = 0; m != -8; m -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v31[m * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v32[m], v31[m * 8]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v21);
    }
  }
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  unsigned int v5 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  [(MAIDiagnosticLogger *)self inputJson];
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v41);
  }
  if (v40)
  {
    [(MAIDiagnosticLogger *)self inputJson];
    v7 = v20[1];
    [(MAIDiagnosticLogger *)self jsonObjectName];
    shared_ptr<nlohmann::basic_json<>> v8 = std::string::append(&v16, ".endPhase", 9uLL);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type v18 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)id v17 = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v40, (uint64_t)v17);
    v42 = &v40;
    char v43 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v28, "julianDay");
    long long v29 = v28;
    char v30 = 1;
    v31[0] = 6;
    v32[0] = a4;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v31);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v31);
    v32[1] = v31;
    char v33 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v34, (uint64_t)v28, 2, 1, 2);
    id v35 = v34;
    char v36 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)v22, "phase");
    uint64_t v23 = v22;
    char v24 = 1;
    phase_to_string(v5, __p);
    uint64_t v26 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v25, (uint64_t)__p);
    char v27 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v37, (uint64_t)v22, 2, 1, 2);
    id v38 = v37;
    char v39 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v44, (uint64_t)v34, 2, 1, 2);
    v45 = v44;
    char v46 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v47, (uint64_t)&v40, 2, 1, 2);
    v48[1] = (uint64_t *)v47;
    char v49 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v19, (uint64_t)v47, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v7, (uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v20, v19[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v47);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v48, v47[0]);
    for (uint64_t i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v44[i]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v44[i + 8], v44[i]);
    }
    for (uint64_t j = 0; j != -64; j -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v37[j]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[j + 8], v37[j]);
    }
    for (uint64_t k = 0; k != -64; k -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25[k]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[k + 8], v25[k]);
    }
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t m = 0; m != -8; m -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v31[m * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v32[m], v31[m * 8]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v21);
    }
  }
}

- (void)appendDay:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(MAIDiagnosticLogger *)self inputJson];
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v50);
  }
  if (v49)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)v69, "julianDay");
    v71 = v69;
    char v72 = 1;
    unsigned int v5 = [v4 julianDay];
    v73[0] = 6;
    uint64_t v74 = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v73);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v73);
    v75 = v73;
    char v76 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v49, (uint64_t)v69, 2, 1, 2);
    v51 = &v49;
    char v52 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[5],char [5],0>((uint64_t)&v62, "flow");
    v63 = &v62;
    char v64 = 1;
    unsigned int v6 = [v4 flow];
    if (v6 > 5) {
      v7 = "(invalid)";
    }
    else {
      v7 = off_2649FD850[(char)v6];
    }
    v32 = v7;
    v67 = (unsigned char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v65, &v32);
    char v68 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v53, (uint64_t)&v62, 2, 1, 2);
    v55 = v53;
    char v56 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[9],char [9],0>((uint64_t)&v44, "spotting");
    v44.__r_.__value_.__r.__words[2] = (std::string::size_type)&v44;
    char v45 = 1;
    unsigned int v8 = [v4 spotting];
    v46[0] = 4;
    v47[0] = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v46);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v46);
    v47[1] = v46;
    char v48 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v57, (uint64_t)&v44, 2, 1, 2);
    v57[2] = v57;
    char v58 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[20],char [20],0>((uint64_t)&v37, "ovulationTestResult");
    char v39 = &v37;
    char v40 = 1;
    unsigned int v9 = [v4 ovulationTestResult];
    if (v9 > 3) {
      char v10 = "(invalid)";
    }
    else {
      char v10 = off_2649FD880[(char)v9];
    }
    __int16 v34 = v10;
    uint64_t v42 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v41, &v34);
    char v43 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v59, (uint64_t)&v37, 2, 1, 2);
    v60 = v59;
    char v61 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v35, (uint64_t)&v49, 4, 1, 2);
    for (uint64_t i = 0; i != -128; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v59[i]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v59[i + 8], v59[i]);
    }
    for (uint64_t j = 0; j != -64; j -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v41[j]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v41[j + 8], v41[j]);
    }
    for (uint64_t k = 0; k != -8; k -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v46[k * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v47[k], v46[k * 8]);
    }
    for (uint64_t m = 0; m != -64; m -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v65[m]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v66 + m), v65[m]);
    }
    for (uint64_t n = 0; n != -64; n -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v73[n]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v74 + n), v73[n]);
    }
    std::string v16 = [v4 sedentaryHeartRateStatistics];
    id v17 = v16;
    if (v16)
    {
      -[MAIDiagnosticLogger appendDay:]::$_2::operator()(v16, (uint64_t)v69);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[29],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v35, "sedentaryHeartRateStatistics", (uint64_t)v69, (uint64_t)&v49);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v70, v69[0]);
    }

    std::string::size_type v18 = [v4 sleepHeartRateStatistics];
    v19 = v18;
    if (v18)
    {
      -[MAIDiagnosticLogger appendDay:]::$_2::operator()(v18, (uint64_t)v69);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[25],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v35, "sleepHeartRateStatistics", (uint64_t)v69, (uint64_t)&v49);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v70, v69[0]);
    }

    char v20 = [v4 wristTemperature];
    shared_ptr<std::ofstream> v21 = v20;
    if (v20)
    {
      id v22 = v20;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[16],char [16],0>((uint64_t)v69, "watchIdentifier");
      v71 = v69;
      char v72 = 1;
      id v23 = [v22 watchIdentifier];
      unsigned __int8 v37 = (char *)[v23 UTF8String];
      v75 = (unsigned char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v73, &v37);
      char v76 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v49, (uint64_t)v69, 2, 1, 2);
      v51 = &v49;
      char v52 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[19],char [19],0>((uint64_t)&v62, "temperatureCelsius");
      v63 = &v62;
      char v64 = 1;
      [v22 temperatureCelsius];
      v65[0] = 7;
      uint64_t v66 = v24;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v65);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v65);
      v67 = v65;
      char v68 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v53, (uint64_t)&v62, 2, 1, 2);
      v55 = v53;
      char v56 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v44, (uint64_t)&v49, 2, 1, 2);
      for (iuint64_t i = 0; ii != -8; ii -= 4)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v53[ii * 8]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v54)[ii], v53[ii * 8]);
      }
      for (juint64_t j = 0; jj != -64; jj -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v65[jj]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v66 + jj), v65[jj]);
      }
      for (kuint64_t k = 0; kk != -64; kk -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v73[kk]);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)((char *)&v74 + kk), v73[kk]);
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[17],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v35, "wristTemperature", (uint64_t)&v44, (uint64_t)&v49);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v44);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v44.__r_.__value_.__l.__size_, v44.__r_.__value_.__s.__data_[0]);
    }

    [(MAIDiagnosticLogger *)self inputJson];
    long long v28 = v37;
    [(MAIDiagnosticLogger *)self jsonObjectName];
    long long v29 = std::string::append(&v44, ".appendDay", 0xAuLL);
    long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    v63 = (long long *)v29->__r_.__value_.__r.__words[2];
    long long v62 = v30;
    v29->__r_.__value_.__l.__size_ = 0;
    v29->__r_.__value_.__r.__words[2] = 0;
    v29->__r_.__value_.__r.__words[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)&v49, (uint64_t)&v62);
    v51 = &v49;
    char v52 = 1;
    v53[0] = v35[0];
    v54 = v36;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v35);
    v35[0] = 0;
    char v36 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
    v55 = v53;
    char v56 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v69, (uint64_t)&v49, 2, 1, 2);
    v71 = v69;
    char v72 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v32, (uint64_t)v69, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v28, (uint64_t)&v32);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v32);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v33, v32);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v70, v69[0]);
    for (muint64_t m = 0; mm != -8; mm -= 4)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v53[mm * 8]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&(&v54)[mm], v53[mm * 8]);
    }
    if (SHIBYTE(v63) < 0) {
      operator delete((void *)v62);
    }
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v44.__r_.__value_.__l.__data_);
    }
    if (v38) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v38);
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v35);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v36, v35[0]);
  }
}

- (void)appendDay:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[12],char [12],0>((uint64_t)v9, "sampleCount");
  char v10 = v9;
  char v11 = 1;
  uint64_t v4 = [v3 sampleCount];
  v12[0] = 5;
  v13[0] = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
  v13[1] = v12;
  char v14 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v15, (uint64_t)v9, 2, 1, 2);
  v16[1] = &v15;
  char v17 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(a2, (uint64_t)&v15, 1, 1, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v15);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v16, v15);
  for (uint64_t i = 0; i != -8; i -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v12[i * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v13[i], v12[i * 8]);
  }
  unsigned int v6 = [v3 lowerPercentile];
  v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    uint64_t v15 = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[16],double>(a2, "lowerPercentile", &v15, (uint64_t)v9);
  }
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyTokeuint64_t n = a3;
}

- (shared_ptr<nlohmann::basic_json<>>)inputJson
{
  cntrl = self->_inputJson.__cntrl_;
  NSObject *v2 = self->_inputJson.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setInputJson:(shared_ptr<nlohmann::basic_json<>>)a3
{
  uint64_t v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_inputJson.__cntrl_;
  self->_inputJson.__ptr_ = v4;
  self->_inputJson.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<nlohmann::basic_json<>>)outputJson
{
  cntrl = self->_outputJson.__cntrl_;
  NSObject *v2 = self->_outputJson.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setOutputJson:(shared_ptr<nlohmann::basic_json<>>)a3
{
  uint64_t v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_outputJson.__cntrl_;
  self->_outputJson.__ptr_ = v4;
  self->_outputJson.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setInputFile:(shared_ptr<std::ofstream>)a3
{
  uint64_t v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_inputFile.__cntrl_;
  self->_inputFile.__ptr_ = v4;
  self->_inputFile.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setOutputFile:(shared_ptr<std::ofstream>)a3
{
  uint64_t v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_outputFile.__cntrl_;
  self->_outputFile.__ptr_ = v4;
  self->_outputFile.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22F10E000, a2, OS_LOG_TYPE_ERROR, "failed to create directory: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end