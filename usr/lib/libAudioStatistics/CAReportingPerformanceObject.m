@interface CAReportingPerformanceObject
- (CAReportingPerformanceObject)initWithProcessIdentifiers:(id)a3;
- (NSDictionary)configuration;
- (NSDictionary)performanceMetrics;
- (NSLock)sessionsLock;
- (NSMutableArray)processIdentifiers;
- (NSString)hostApplicationDisplayID;
- (id).cxx_construct;
- (id)endAndReturnPerformanceMetrics;
- (unsigned)serviceType;
- (void)abandon;
- (void)begin;
- (void)sessions;
- (void)setConfiguration:(id)a3;
- (void)setHostApplicationDisplayID:(id)a3;
- (void)setProcessIdentifiers:(id)a3;
- (void)setServiceType:(unsigned __int16)a3;
- (void)setSessions:(void *)a3;
- (void)setSessionsLock:(id)a3;
@end

@implementation CAReportingPerformanceObject

- (CAReportingPerformanceObject)initWithProcessIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CAReportingUtilityIsInternalBuild())
  {
    v20.receiver = self;
    v20.super_class = (Class)CAReportingPerformanceObject;
    v5 = [(CAReportingPerformanceObject *)&v20 init];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(CAReportingPerformanceObject *)v5 setProcessIdentifiers:v6];

      id v7 = objc_alloc_init(MEMORY[0x1E4F28E08]);
      [(CAReportingPerformanceObject *)v5 setSessionsLock:v7];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
            v13 = [(CAReportingPerformanceObject *)v5 processIdentifiers];
            [v13 addObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v6 lock];

  objc_storeStrong((id *)&self->_configuration, a3);
  id v7 = [(NSDictionary *)self->_configuration objectForKey:@"CAReportingPerfProcesses"];

  if (v7)
  {
    [(NSDictionary *)self->_configuration objectForKey:@"CAReportingPerfProcesses"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v13 = [(CAReportingPerformanceObject *)self processIdentifiers];
          char v14 = [v13 containsObject:v12];

          if ((v14 & 1) == 0)
          {
            v15 = [(CAReportingPerformanceObject *)self processIdentifiers];
            [v15 addObject:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  long long v16 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v16 unlock];
}

- (void)begin
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v2 lock];

  v3 = [(CAReportingPerformanceObject *)self sessions];
  if (v3[1] != *v3)
  {
    unint64_t v4 = 0;
    do
    {
      [(CAReportingPerformanceObject *)self sessions];
      int v5 = pc_session_destroy();
      if (v5)
      {
        id v6 = *(id *)AA_PerformanceUtilityCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v5);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 100;
          WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
          HIDWORD(buf.__r_.__value_.__r.__words[2]) = v5;
          __int16 v54 = 2080;
          *(void *)v55 = *(void *)&v58[6];
          _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
          if ((_BYTE)v57)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
        }
      }
      id v7 = [(CAReportingPerformanceObject *)self sessions];
      ++v4;
    }
    while (v4 < (uint64_t)(v7[1] - *v7) >> 3);
  }
  id v8 = [(CAReportingPerformanceObject *)self sessions];
  v8[1] = *v8;
  uint64_t v9 = [(CAReportingPerformanceObject *)self sessions];
  uint64_t v10 = [(CAReportingPerformanceObject *)self processIdentifiers];
  std::vector<pc_session *>::reserve(v9, [v10 count]);

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obj = [(CAReportingPerformanceObject *)self processIdentifiers];
  uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        char v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        int __errnum = 0;
        uint64_t v15 = pc_session_create();
        if (!v15)
        {
          long long v17 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v18 = __errnum;
            v47 = strerror(__errnum);
            caulk::slog::detail::string_converter::string_converter<char *>(&buf, (const char **)&v47);
            uint64_t v19 = *(void *)&v55[6];
            long long v20 = __error();
            v43 = strerror(*v20);
            caulk::slog::detail::string_converter::string_converter<char *>(&v44, (const char **)&v43);
            LODWORD(__p.__r_.__value_.__l.__data_) = 136316162;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 133;
            WORD1(__p.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(__p.__r_.__value_.__r.__words[2]) = v18;
            __int16 v57 = 2080;
            *(void *)v58 = v19;
            *(_WORD *)&v58[8] = 2080;
            *(void *)&v58[10] = v46;
            _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_create failed { (*__error())=%i, strerror=\"%s\", strerror((*__error()))=\"%s\" }", (uint8_t *)&__p, 0x2Cu);
            if (v45 && SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v44.__r_.__value_.__l.__data_);
            }
            if ((_BYTE)v54 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }
          goto LABEL_47;
        }
        [v14 intValue];
        int v16 = pc_session_set_procpid();
        if (v16)
        {
          long long v17 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v16);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 111;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v16;
            __int16 v54 = 2080;
            *(void *)v55 = *(void *)&v58[6];
            _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_set_procpid failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
LABEL_47:

          continue;
        }
        int v21 = pc_session_add_metric();
        if (v21)
        {
          uint64_t v22 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v21);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 117;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v21;
            __int16 v54 = 2080;
            *(void *)v55 = *(void *)&v58[6];
            _os_log_impl(&dword_19025C000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_add_metric for kPCMetricDirtyMemRecentPeakID failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
        }
        pc_session_add_metric();
        if (v21)
        {
          v23 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v21);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 122;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v21;
            __int16 v54 = 2080;
            *(void *)v55 = *(void *)&v58[6];
            _os_log_impl(&dword_19025C000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_add_metric for kPCMetricDirtyMemPeakDeltaID failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
        }
        int v24 = pc_session_begin();
        if (v24)
        {
          long long v17 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v24);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 127;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v24;
            __int16 v54 = 2080;
            *(void *)v55 = *(void *)&v58[6];
            _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_begin failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
          goto LABEL_47;
        }
        v25 = [(CAReportingPerformanceObject *)self sessions];
        unint64_t v26 = (unint64_t)v25[2];
        v27 = (uint64_t *)v25[1];
        if ((unint64_t)v27 >= v26)
        {
          uint64_t v29 = ((char *)v27 - (unsigned char *)*v25) >> 3;
          if ((unint64_t)(v29 + 1) >> 61) {
            std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v30 = v26 - (void)*v25;
          uint64_t v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
            uint64_t v31 = v29 + 1;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>((uint64_t)(v25 + 2), v32);
          }
          else {
            v33 = 0;
          }
          v34 = (uint64_t *)&v33[8 * v29];
          uint64_t *v34 = v15;
          v28 = v34 + 1;
          v36 = (char *)*v25;
          v35 = (char *)v25[1];
          if (v35 != *v25)
          {
            do
            {
              uint64_t v37 = *((void *)v35 - 1);
              v35 -= 8;
              *--v34 = v37;
            }
            while (v35 != v36);
            v35 = (char *)*v25;
          }
          *v25 = v34;
          v25[1] = v28;
          v25[2] = &v33[8 * v32];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          uint64_t *v27 = v15;
          v28 = v27 + 1;
        }
        v25[1] = v28;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v11);
  }

  [(CAReportingPerformanceObject *)self setHostApplicationDisplayID:@"unknown"];
  v38 = [(NSDictionary *)self->_configuration objectForKeyedSubscript:@"HostApplicationDisplayID"];
  [(CAReportingPerformanceObject *)self setHostApplicationDisplayID:v38];

  v39 = *(id *)AA_PerformanceUtilityCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 142;
    _os_log_impl(&dword_19025C000, v39, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=begin", (uint8_t *)&__p, 0x12u);
  }
  v40 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v40 unlock];
}

- (id)endAndReturnPerformanceMetrics
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = (id)objc_opt_new();
  if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::once != -1) {
    dispatch_once(&-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::once, &__block_literal_global_0);
  }
  v3 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v3 lock];

  unint64_t v4 = 0;
  *(void *)&long long v5 = 136315394;
  long long v29 = v5;
  while (1)
  {
    id v6 = [(CAReportingPerformanceObject *)self sessions];
    if (v4 >= (uint64_t)(v6[1] - *v6) >> 3) {
      break;
    }
    if (*(void *)(*(void *)[(CAReportingPerformanceObject *)self sessions] + 8 * v4))
    {
      [(CAReportingPerformanceObject *)self sessions];
      int v7 = pc_session_end();
      if (v7)
      {
        id v8 = *(id *)AA_PerformanceUtilityCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = strerror(v7);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
          *(_DWORD *)std::string buf = 136315906;
          v41 = "CAReportingPerformanceUtility.mm";
          __int16 v42 = 1024;
          int v43 = 172;
          __int16 v44 = 1024;
          int v45 = v7;
          __int16 v46 = 2080;
          uint64_t v47 = v39;
          _os_log_impl(&dword_19025C000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_end failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
          if (v38)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
        }
      }
      [(CAReportingPerformanceObject *)self sessions];
      uint64_t procname = pc_session_get_procname();
      if (procname)
      {
        uint64_t v10 = [NSString stringWithUTF8String:procname];
        if (v10) {
          uint64_t v11 = (__CFString *)v10;
        }
        else {
          uint64_t v11 = @"Unknown";
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(id)v32[5] setObject:v12 forKeyedSubscript:v11];

        [(CAReportingPerformanceObject *)self sessions];
        v13 = v11;
        int values = pc_session_get_values();
        if (values)
        {
          uint64_t v15 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = strerror(values);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
            *(_DWORD *)std::string buf = 136315906;
            v41 = "CAReportingPerformanceUtility.mm";
            __int16 v42 = 1024;
            int v43 = 199;
            __int16 v44 = 1024;
            int v45 = values;
            __int16 v46 = 2080;
            uint64_t v47 = v39;
            _os_log_impl(&dword_19025C000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_get_values failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v38)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
        }
        if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled)
        {
          int v16 = [(CAReportingPerformanceObject *)self hostApplicationDisplayID];
          long long v17 = [(id)v32[5] objectForKeyedSubscript:v13];
          [v17 setObject:v16 forKeyedSubscript:@"HostApplicationDisplayID"];

          int v18 = CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
          uint64_t v19 = [(id)v32[5] objectForKeyedSubscript:v13];
          [v19 setObject:v18 forKeyedSubscript:@"serviceType"];
        }
      }
      else
      {
        int v21 = *(id *)AA_PerformanceUtilityCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LODWORD(__p.__r_.__value_.__l.__data_) = v29;
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
          WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 207;
          _os_log_impl(&dword_19025C000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_get_procname failed", (uint8_t *)&__p, 0x12u);
        }
      }
      [(CAReportingPerformanceObject *)self sessions];
      int v22 = pc_session_destroy();
      if (v22)
      {
        v23 = *(id *)AA_PerformanceUtilityCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = strerror(v22);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
          *(_DWORD *)std::string buf = 136315906;
          v41 = "CAReportingPerformanceUtility.mm";
          __int16 v42 = 1024;
          int v43 = 212;
          __int16 v44 = 1024;
          int v45 = v22;
          __int16 v46 = 2080;
          uint64_t v47 = v39;
          _os_log_impl(&dword_19025C000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
          if (v38)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
        }
      }
    }
    else
    {
      long long v20 = *(id *)AA_PerformanceUtilityCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p.__r_.__value_.__l.__data_) = v29;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
        WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 166;
        _os_log_impl(&dword_19025C000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempting to end invalid pc_session", (uint8_t *)&__p, 0x12u);
      }
    }
    ++v4;
  }
  int v24 = [(CAReportingPerformanceObject *)self sessions];
  v24[1] = *v24;
  v25 = *(id *)AA_PerformanceUtilityCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = v29;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 218;
    _os_log_impl(&dword_19025C000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=destroy", (uint8_t *)&__p, 0x12u);
  }
  unint64_t v26 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v26 unlock];

  id v27 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v27;
}

BOOL __62__CAReportingPerformanceObject_endAndReturnPerformanceMetrics__block_invoke()
{
  BOOL result = CAReportingUtilityReadBooleanPref(&cfstr_CareportingEna.isa, &cfstr_ComAppleCoreau_0.isa);
  -[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled = result;
  return result;
}

void __62__CAReportingPerformanceObject_endAndReturnPerformanceMetrics__block_invoke_24(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v12 = [NSString stringWithUTF8String:a7];
  if (v12)
  {
    if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled)
    {
      v19[0] = @"value";
      v13 = [NSNumber numberWithDouble:a2];
      v19[1] = @"unit";
      v20[0] = v13;
      char v14 = [NSString stringWithUTF8String:a9];
      v20[1] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      int v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
      [v16 setObject:v15 forKeyedSubscript:v12];
    }
    else
    {
      v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
      long long v17 = v12;
      char v14 = [NSNumber numberWithDouble:a2];
      int v18 = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v13 addEntriesFromDictionary:v15];
    }
  }
}

- (void)abandon
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v3 lock];

  unint64_t v4 = [(CAReportingPerformanceObject *)self sessions];
  if (*v4 != v4[1])
  {
    long long v5 = [(CAReportingPerformanceObject *)self sessions];
    if (v5[1] != *v5)
    {
      unint64_t v7 = 0;
      *(void *)&long long v6 = 136315906;
      long long v19 = v6;
      do
      {
        [(CAReportingPerformanceObject *)self sessions];
        int v8 = pc_session_end();
        if (v8)
        {
          uint64_t v9 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            long long v20 = strerror(v8);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v20);
            *(_DWORD *)std::string buf = v19;
            v25 = "CAReportingPerformanceUtility.mm";
            __int16 v26 = 1024;
            int v27 = 239;
            __int16 v28 = 1024;
            int v29 = v8;
            __int16 v30 = 2080;
            uint64_t v31 = v23;
            _os_log_impl(&dword_19025C000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_end failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v22)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
        }
        [(CAReportingPerformanceObject *)self sessions];
        int v10 = pc_session_destroy();
        if (v10)
        {
          uint64_t v11 = *(id *)AA_PerformanceUtilityCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            long long v20 = strerror(v10);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v20);
            *(_DWORD *)std::string buf = v19;
            v25 = "CAReportingPerformanceUtility.mm";
            __int16 v26 = 1024;
            int v27 = 244;
            __int16 v28 = 1024;
            int v29 = v10;
            __int16 v30 = 2080;
            uint64_t v31 = v23;
            _os_log_impl(&dword_19025C000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v22)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
          }
        }
        id v12 = [(CAReportingPerformanceObject *)self sessions];
        ++v7;
      }
      while (v7 < (uint64_t)(v12[1] - *v12) >> 3);
    }
    v13 = [(CAReportingPerformanceObject *)self sessions];
    v13[1] = *v13;
  }
  char v14 = [(CAReportingPerformanceObject *)self processIdentifiers];
  BOOL v15 = [v14 count] == 0;

  if (!v15)
  {
    int v16 = [(CAReportingPerformanceObject *)self processIdentifiers];
    [v16 removeAllObjects];
  }
  long long v17 = *(id *)AA_PerformanceUtilityCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 254;
    _os_log_impl(&dword_19025C000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=abandon", (uint8_t *)&__p, 0x12u);
  }
  int v18 = [(CAReportingPerformanceObject *)self sessionsLock];
  [v18 unlock];
}

- (NSDictionary)performanceMetrics
{
  return self->_performanceMetrics;
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned __int16)a3
{
  self->_serviceType = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)sessions
{
  return &self->_sessions;
}

- (void)setSessions:(void *)a3
{
  p_sessions = (char *)&self->_sessions;
  if (p_sessions != a3) {
    std::vector<pc_session *>::__assign_with_size[abi:ne180100]<pc_session **,pc_session **>(p_sessions, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  }
}

- (NSMutableArray)processIdentifiers
{
  return self->_processIdentifiers;
}

- (void)setProcessIdentifiers:(id)a3
{
}

- (NSString)hostApplicationDisplayID
{
  return self->_hostApplicationDisplayID;
}

- (void)setHostApplicationDisplayID:(id)a3
{
}

- (NSLock)sessionsLock
{
  return self->_sessionsLock;
}

- (void)setSessionsLock:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_sessions.__begin_;
  if (begin)
  {
    self->_sessions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sessionsLock, 0);
  objc_storeStrong((id *)&self->_hostApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_processIdentifiers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_performanceMetrics, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end