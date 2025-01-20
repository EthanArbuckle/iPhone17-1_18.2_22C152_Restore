@interface SNLPSSUMatcher
+ (id)matcherWithDirectories:(id)a3 initializeModelsPreemptively:(BOOL)a4 error:(id *)a5;
+ (unordered_set<std::string,)_loadAppShortcutAlwaysTriggeredAllowList;
- (BOOL)_performFullCacheUpdateInnerWithUserShortcuts:(id)a3 applicationInfos:(id)a4 error:(id *)a5;
- (BOOL)deregisterApp:(id)a3 error:(id *)a4;
- (BOOL)handleUserShortcutsDatabaseChanged:(id)a3 error:(id *)a4;
- (BOOL)performFullCacheUpdate:(id)a3 error:(id *)a4;
- (BOOL)registerApp:(id)a3 error:(id *)a4;
- (NSObject)_systemEventLock;
- (NSURL)cacheDirectoryURL;
- (id).cxx_construct;
- (id)_initWithCacheDirectoryURL:(id)a3 cppMatcher:()unique_ptr<snlp:(std::default_delete<snlp::ssu::matcher::SSUMatcher>>)a4 :ssu::matcher::SSUMatcher;
- (id)responseForRequest:(id)a3 error:(id *)a4;
@end

@implementation SNLPSSUMatcher

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__systemEventLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  std::unique_ptr<snlp::ssu::matcher::SSUMatcher>::reset[abi:ne180100]((snlp::ssu::matcher::SSUMatcher **)&self->_cppMatcher, 0);
}

- (NSObject)_systemEventLock
{
  return self->__systemEventLock;
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_performFullCacheUpdateInnerWithUserShortcuts:(id)a3 applicationInfos:(id)a4 error:(id *)a5
{
  v90[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v61 = a4;
  v58 = self;
  v60 = self->__systemEventLock;
  objc_sync_enter(v60);
  v62 = v7;
  v90[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(3);
  v90[1] = v8;
  LOBYTE(v76) = 0;
  char v79 = 0;
  if (v7)
  {
    uint64_t v76 = 0;
    unint64_t v77 = 0;
    unint64_t v78 = 0;
    char v79 = 1;
    std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::reserve(&v76, [v7 count]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v73 != v10) {
            objc_enumerationMutation(obj);
          }
          if (!v79) {
            std::__throw_bad_optional_access[abi:ne180100]();
          }
          v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          id v13 = [v12 identifier];
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v13 UTF8String]);
          id v14 = [v12 phrase];
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v14 UTF8String]);
          unint64_t v15 = v77;
          if (v77 >= v78)
          {
            unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v77 - v76) >> 4);
            unint64_t v19 = v18 + 1;
            if (v18 + 1 > 0x555555555555555) {
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((uint64_t)(v78 - v76) >> 4) > v19) {
              unint64_t v19 = 0x5555555555555556 * ((uint64_t)(v78 - v76) >> 4);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - v76) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
              unint64_t v20 = 0x555555555555555;
            }
            else {
              unint64_t v20 = v19;
            }
            v82 = &v78;
            if (v20) {
              unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v20);
            }
            else {
              uint64_t v21 = 0;
            }
            std::string::size_type v22 = v20 + 48 * v18;
            v80.__r_.__value_.__r.__words[0] = v20;
            v80.__r_.__value_.__l.__size_ = v22;
            unint64_t v81 = v20 + 48 * v21;
            long long v23 = *(_OWORD *)buf;
            *(void *)(v22 + 16) = v87;
            *(_OWORD *)std::string::size_type v22 = v23;
            unint64_t v87 = 0;
            memset(buf, 0, sizeof(buf));
            long long v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *(void *)(v22 + 40) = *((void *)&__p.__r_.__value_.__l + 2);
            *(_OWORD *)(v22 + 24) = v24;
            memset(&__p, 0, sizeof(__p));
            v80.__r_.__value_.__r.__words[2] = v22 + 48;
            std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer(&v76, &v80);
            unint64_t v25 = v77;
            std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v80);
            unint64_t v77 = v25;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            long long v16 = *(_OWORD *)buf;
            *(void *)(v77 + 16) = v87;
            *(_OWORD *)unint64_t v15 = v16;
            unint64_t v87 = 0;
            memset(buf, 0, sizeof(buf));
            std::string::size_type v17 = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)(v15 + 24) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *(void *)(v15 + 40) = v17;
            memset(&__p, 0, sizeof(__p));
            unint64_t v77 = v15 + 48;
          }
          if (SHIBYTE(v87) < 0) {
            operator delete(*(void **)buf);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v72 objects:v89 count:16];
      }
      while (v9);
    }
  }
  v69 = 0;
  unint64_t v70 = 0;
  unint64_t v71 = 0;
  unint64_t v26 = [v61 count];
  if (v26)
  {
    if (v26 > 0x555555555555555) {
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    }
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)&v71;
    *(void *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v26);
    *(void *)&buf[8] = *(void *)buf + v70;
    unint64_t v87 = *(void *)buf + v70;
    __p.__r_.__value_.__r.__words[0] = *(void *)buf + 48 * v27;
    std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer((uint64_t *)&v69, buf);
    std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)buf);
  }
  id obja = [MEMORY[0x1E4F1CA80] set];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v28 = v61;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v66;
    while (2)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        v33 = [v32 bundleIdentifier];
        if ([obja containsObject:v33])
        {
          if (a5)
          {
            uint64_t v52 = *MEMORY[0x1E4F28568];
            v84[0] = @"Could not perform full cache update.";
            uint64_t v53 = *MEMORY[0x1E4F28588];
            v83[0] = v52;
            v83[1] = v53;
            v54 = [NSString stringWithFormat:@"There was a duplicate app bundle ID in applicationInfos: %@.", v33];
            v83[2] = *MEMORY[0x1E4F285A0];
            v84[1] = v54;
            v84[2] = @"Ensure that only unique apps are passed.";
            v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];

            *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:2 userInfo:v55];
          }
          snlp::ssu::selflogging::logBackgroundUpdateFailed(v90);

          BOOL v56 = 0;
          goto LABEL_68;
        }
        [obja addObject:v33];
        id v34 = [v32 bundleIdentifier];
        std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v34 UTF8String]);
        v35 = [v32 assetURL];
        id v36 = [v35 path];
        v80.__r_.__value_.__r.__words[0] = [v36 UTF8String];
        std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, &v80.__r_.__value_.__l.__data_);

        unint64_t v37 = v70;
        if (v70 >= v71)
        {
          unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (void)v69) >> 4);
          unint64_t v41 = v40 + 1;
          if (v40 + 1 > 0x555555555555555) {
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v71 - (void)v69) >> 4) > v41) {
            unint64_t v41 = 0x5555555555555556 * ((uint64_t)(v71 - (void)v69) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v71 - (void)v69) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v42 = 0x555555555555555;
          }
          else {
            unint64_t v42 = v41;
          }
          v82 = &v71;
          if (v42) {
            unint64_t v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v42);
          }
          else {
            uint64_t v43 = 0;
          }
          std::string::size_type v44 = v42 + 48 * v40;
          v80.__r_.__value_.__r.__words[0] = v42;
          v80.__r_.__value_.__l.__size_ = v44;
          unint64_t v81 = v42 + 48 * v43;
          long long v45 = *(_OWORD *)buf;
          *(void *)(v44 + 16) = v87;
          *(_OWORD *)std::string::size_type v44 = v45;
          unint64_t v87 = 0;
          memset(buf, 0, sizeof(buf));
          long long v46 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(void *)(v44 + 40) = *((void *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)(v44 + 24) = v46;
          memset(&__p, 0, sizeof(__p));
          v80.__r_.__value_.__r.__words[2] = v44 + 48;
          std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer((uint64_t *)&v69, &v80);
          unint64_t v47 = v70;
          std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v80);
          unint64_t v70 = v47;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          long long v38 = *(_OWORD *)buf;
          *(void *)(v70 + 16) = v87;
          *(_OWORD *)unint64_t v37 = v38;
          unint64_t v87 = 0;
          memset(buf, 0, sizeof(buf));
          std::string::size_type v39 = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)(v37 + 24) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(void *)(v37 + 40) = v39;
          memset(&__p, 0, sizeof(__p));
          unint64_t v70 = v37 + 48;
        }
        if (SHIBYTE(v87) < 0) {
          operator delete(*(void **)buf);
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v85 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  v48 = SNLPOSLoggerForCategory(8);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (void)v69) >> 4);
    _os_log_impl(&dword_1C8DA9000, v48, OS_LOG_TYPE_DEBUG, "Performing full cache update for %lu applications", buf, 0xCu);
  }

  if (v79)
  {
    v49 = SNLPOSLoggerForCategory(8);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      if (!v79) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v77 - v76) >> 4);
      _os_log_impl(&dword_1C8DA9000, v49, OS_LOG_TYPE_DEBUG, "Performing full cache update for %lu configured user shortcuts", buf, 0xCu);
    }
  }
  snlp::ssu::matcher::SSUMatcher::performFullCacheUpdate((uint64_t)v58->_cppMatcher.__ptr_.__value_, &v69, (uint64_t)&v76, (int64x2_t *)buf);
  value = v58->_cppMatcher.__ptr_.__value_;
  if (*((char *)value + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v80, *(const std::string::value_type **)value, *((void *)value + 1));
  }
  else
  {
    long long v51 = *(_OWORD *)value;
    v80.__r_.__value_.__r.__words[2] = *((void *)value + 2);
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v51;
  }
  snlp::ssu::selflogging::logBackgroundUpdateEnded(v90, (uint64_t *)&v80, (char ***)buf);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v80.__r_.__value_.__l.__data_);
  }
  v80.__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
  std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  BOOL v56 = 1;
LABEL_68:

  *(void *)buf = &v69;
  std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (v79)
  {
    *(void *)buf = &v76;
    std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  objc_sync_exit(v60);

  return v56;
}

- (id)_initWithCacheDirectoryURL:(id)a3 cppMatcher:()unique_ptr<snlp:(std::default_delete<snlp::ssu::matcher::SSUMatcher>>)a4 :ssu::matcher::SSUMatcher
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SNLPSSUMatcher;
  id v8 = [(SNLPSSUMatcher *)&v13 init];
  objc_storeStrong((id *)v8 + 2, a3);
  id v9 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  uint64_t v10 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v9;

  v11 = *(snlp::ssu::matcher::SSUMatcher **)a4.__ptr_.__value_;
  *(void *)a4.__ptr_.__value_ = 0;
  std::unique_ptr<snlp::ssu::matcher::SSUMatcher>::reset[abi:ne180100]((snlp::ssu::matcher::SSUMatcher **)v8 + 1, v11);

  return v8;
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SNLPOSLoggerForCategory(8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v6, OS_LOG_TYPE_DEBUG, "Handling call to [SNLPSSUMatcher responseForRequest:error:]", buf, 2u);
  }

  id v7 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = SNLPOSLoggerForCategory(7);
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SNLPSSUMatcher responseForRequest", "", buf, 2u);
  }

  v11 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPSSUMatcher responseForRequest\"", buf, 2u);
  }

  [MEMORY[0x1E4FA2B00] convertSSURequestFromObjCToCpp:v5];
  if (v22)
  {
    if (*(void *)(v22 + 48))
    {
      MEMORY[0x1CB773D80](buf);
      snlp::ssu::selflogging::logUserRequestStarted((snlp::ssu::selflogging *)buf, v12);
    }
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v23[0] = *MEMORY[0x1E4F28568];
    v23[1] = v16;
    v24[0] = @"Could not produce an SSU response for the given request.";
    std::string::size_type v17 = [NSString stringWithFormat:@"The SSU request has no request ID"];
    v24[1] = v17;
    unint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:10 userInfo:v18];
  }
  else
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v25[0] = *MEMORY[0x1E4F28568];
    v25[1] = v13;
    v26[0] = @"Could not produce an SSU response for the given request.";
    id v14 = [NSString stringWithFormat:@"Could not convert ObjC proto SSU request to C++ proto SSU request"];
    v26[1] = v14;
    unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:5 userInfo:v15];
  }
  a4 = 0;
LABEL_16:
  uint64_t v19 = v22;
  uint64_t v22 = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
LABEL_18:

  return a4;
}

- (BOOL)handleUserShortcutsDatabaseChanged:(id)a3 error:(id *)a4
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  uint64_t v30 = self->__systemEventLock;
  objc_sync_enter(v30);
  v60[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(4);
  v60[1] = v4;
  id v5 = SNLPOSLoggerForCategory(8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = [v32 count];
    _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_DEBUG, "Handling user shortcuts database changed event with %lu configured user shortcuts", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v42 = 0;
  unint64_t v43 = 0;
  unint64_t v44 = 0;
  std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::reserve(&v42, [v32 count]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v32;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v10 = [v9 identifier];
        std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v10 UTF8String]);
        id v11 = [v9 phrase];
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
        unint64_t v12 = v43;
        if (v43 >= v44)
        {
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - v42) >> 4);
          unint64_t v16 = v15 + 1;
          if (v15 + 1 > 0x555555555555555) {
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v44 - v42) >> 4) > v16) {
            unint64_t v16 = 0x5555555555555556 * ((uint64_t)(v44 - v42) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - v42) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v17 = 0x555555555555555;
          }
          else {
            unint64_t v17 = v16;
          }
          long long v51 = &v44;
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          std::string::size_type v19 = v17 + 48 * v15;
          v49.__r_.__value_.__r.__words[0] = v17;
          v49.__r_.__value_.__l.__size_ = v19;
          unint64_t v50 = v17 + 48 * v18;
          long long v20 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
          *(void *)(v19 + 16) = *((void *)&buf.__r_.__value_.__l + 2);
          *(_OWORD *)std::string::size_type v19 = v20;
          memset(&buf, 0, sizeof(buf));
          long long v21 = __p;
          *(void *)(v19 + 40) = v57;
          *(_OWORD *)(v19 + 24) = v21;
          uint64_t v57 = 0;
          long long __p = 0uLL;
          v49.__r_.__value_.__r.__words[2] = v19 + 48;
          std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer(&v42, &v49);
          unint64_t v22 = v43;
          std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v49);
          unint64_t v43 = v22;
          if (SHIBYTE(v57) < 0) {
            operator delete((void *)__p);
          }
        }
        else
        {
          long long v13 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
          *(void *)(v43 + 16) = *((void *)&buf.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v12 = v13;
          memset(&buf, 0, sizeof(buf));
          uint64_t v14 = v57;
          *(_OWORD *)(v12 + 24) = __p;
          *(void *)(v12 + 40) = v14;
          uint64_t v57 = 0;
          long long __p = 0uLL;
          unint64_t v43 = v12 + 48;
        }
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v59 count:16];
    }
    while (v6);
  }

  buf.__r_.__value_.__s.__data_[0] = 0;
  char v58 = 0;
  snlp::ssu::matcher::SSUMatcher::handleUserShortcutsDatabaseChanged((uint64_t)self->_cppMatcher.__ptr_.__value_, &v42, (uint64_t)&v49);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (long long *)&v49);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v49);
  if (v58)
  {
    value = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)value + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)value, *((void *)value + 1));
      if (!v58) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
    }
    else
    {
      long long v24 = *(_OWORD *)value;
      v37.__r_.__value_.__r.__words[2] = *((void *)value + 2);
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v24;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v49, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    }
    else {
      std::string v49 = buf;
    }
    LODWORD(v50) = __p;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    long long v51 = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&v51, *((const void **)&__p + 1), v57, (v57 - *((void *)&__p + 1)) >> 4);
    id v34 = 0;
    updated = 0;
    id v36 = 0;
    long long v45 = &v34;
    char v46 = 0;
    id v34 = (char **)operator new(0x38uLL);
    updated = v34;
    id v36 = v34 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v36, (uint64_t)&v49, (uint64_t)&v54, (uint64_t)v34);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v60, (uint64_t *)&v37, &v34);
    long long v45 = &v34;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
    if (v51)
    {
      uint64_t v52 = v51;
      operator delete(v51);
    }
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v49.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    BOOL v27 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v60);
    if (a4)
    {
      v47[0] = *MEMORY[0x1E4F28568];
      unint64_t v25 = [NSString stringWithFormat:@"Could not handle user shortcuts database changed event"];
      v47[1] = *MEMORY[0x1E4F28588];
      v48[0] = v25;
      v48[1] = @"A failure was encountered during handling.";
      unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:9 userInfo:v26];
    }
    BOOL v27 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v42;
  std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  objc_sync_exit(v30);

  return v27;
}

- (BOOL)deregisterApp:(id)a3 error:(id *)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = self->__systemEventLock;
  objc_sync_enter(v7);
  v37[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(2);
  v37[1] = v8;
  id v9 = SNLPOSLoggerForCategory(8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
    _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_DEBUG, "Attempting to deregister app with bundle ID: %@", (uint8_t *)&buf, 0xCu);
  }

  buf.__r_.__value_.__s.__data_[0] = 0;
  char v36 = 0;
  value = self->_cppMatcher.__ptr_.__value_;
  id v11 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
  snlp::ssu::matcher::SSUMatcher::deregisterApp((uint64_t)value, (char *)&__p, (uint64_t)&v26);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (long long *)&v26);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v26);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v36)
  {
    unint64_t v12 = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v12, *((void *)v12 + 1));
      if (!v36) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
    }
    else
    {
      long long v13 = *(_OWORD *)v12;
      __p.__r_.__value_.__r.__words[2] = *((void *)v12 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v26, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    }
    else {
      std::string v26 = buf;
    }
    int v27 = v33;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v28 = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&v28, v34, v35, (v35 - (uint64_t)v34) >> 4);
    uint64_t v18 = 0;
    updated = 0;
    long long v20 = 0;
    unint64_t v22 = &v18;
    char v23 = 0;
    uint64_t v18 = (char **)operator new(0x38uLL);
    updated = v18;
    long long v20 = v18 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v20, (uint64_t)&v26, (uint64_t)&v31, (uint64_t)v18);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v37, (uint64_t *)&__p, &v18);
    unint64_t v22 = &v18;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    if (v28)
    {
      uint64_t v29 = v28;
      operator delete(v28);
    }
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v26.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    BOOL v16 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v37);
    if (a4)
    {
      v24[0] = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithFormat:@"Could not deregister app: %@.", v11];
      v24[1] = *MEMORY[0x1E4F28588];
      v25[0] = v14;
      v25[1] = @"A failure was encountered during deregisteration.";
      unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:3 userInfo:v15];
    }
    BOOL v16 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  objc_sync_exit(v7);

  return v16;
}

- (BOOL)registerApp:(id)a3 error:(id *)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self->__systemEventLock;
  objc_sync_enter(v6);
  v36[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(1);
  v36[1] = v7;
  uint64_t v8 = SNLPOSLoggerForCategory(8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_1C8DA9000, v8, OS_LOG_TYPE_DEBUG, "Attempting to register app with info: %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [v5 bundleIdentifier];
  std::string::basic_string[abi:ne180100]<0>(v20, (char *)[v9 UTF8String]);
  id v10 = [v5 assetURL];
  id v11 = [v10 path];
  buf.__r_.__value_.__r.__words[0] = [v11 UTF8String];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v22, &buf.__r_.__value_.__l.__data_);

  buf.__r_.__value_.__s.__data_[0] = 0;
  char v35 = 0;
  snlp::ssu::matcher::SSUMatcher::registerApp((snlp::ssu::matcher::SSUMatcher *)self->_cppMatcher.__ptr_.__value_, (const snlp::ssu::matcher::SSUAppInfo *)v20, (uint64_t)&v25);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (long long *)&v25);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v25);
  if (v35)
  {
    value = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)value + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)value, *((void *)value + 1));
      if (!v35) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
    }
    else
    {
      long long v13 = *(_OWORD *)value;
      v19.__r_.__value_.__r.__words[2] = *((void *)value + 2);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v13;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v25, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    }
    else {
      std::string v25 = buf;
    }
    int v26 = v32;
    id v28 = 0;
    uint64_t v29 = 0;
    std::string __p = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&__p, v33, v34, (v34 - (uint64_t)v33) >> 4);
    BOOL v16 = 0;
    updated = 0;
    uint64_t v18 = 0;
    char v23 = &v16;
    char v24 = 0;
    BOOL v16 = (char **)operator new(0x38uLL);
    updated = v16;
    uint64_t v18 = v16 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v18, (uint64_t)&v25, (uint64_t)&v30, (uint64_t)v16);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v36, (uint64_t *)&v19, &v16);
    char v23 = &v16;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
    if (__p)
    {
      id v28 = __p;
      operator delete(__p);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    BOOL v14 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v36);
    BOOL v14 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  objc_sync_exit(v6);

  return v14;
}

- (BOOL)performFullCacheUpdate:(id)a3 error:(id *)a4
{
  return [(SNLPSSUMatcher *)self _performFullCacheUpdateInnerWithUserShortcuts:0 applicationInfos:a3 error:a4];
}

+ (unordered_set<std::string,)_loadAppShortcutAlwaysTriggeredAllowList
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[SNLPSSUConfig loadAppShortcutAlwaysTriggeredAllowList];
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, vcvtps_u32_f32((float)(unint64_t)[v4 count] / retstr->var0.var3.var0));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v12 + 1) + 8 * v8) UTF8String]);
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)retstr, (unsigned __int8 *)__p, (uint64_t)__p);
        if (v11 < 0) {
          operator delete(__p[0]);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return result;
}

+ (id)matcherWithDirectories:(id)a3 initializeModelsPreemptively:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 cacheDirectoryURL];
  __p[0] = (void *)[v8 fileSystemRepresentation];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v15, (char **)__p);
  id v9 = [v7 modelAssetsDirectoryURL];
  v13[0] = (char *)[v9 fileSystemRepresentation];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v16, v13);
  id v10 = [v7 datasetAssetsDirectoryURL];
  v12[0] = (char *)[v10 fileSystemRepresentation];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v17, v12);

  __p[5] = 0;
  [a1 _loadAppShortcutAlwaysTriggeredAllowList];
  +[SNLPAssetVersionChecker loadUInt32ListFromConfigPListResourceName:@"SSUSupportedGenerationList"];
  long long v18 = xmmword_1C8F38640;
  std::unordered_set<unsigned int>::unordered_set((uint64_t)v12, (unsigned int *)&v18, 4);
  if (v5) {
    snlp::ssu::matcher::SSUMatcher::buildFromPathsWithImmediateInitialize((uint64_t)__p, (uint64_t)v13, (uint64_t)v12, (uint64_t)&v15);
  }
  snlp::ssu::matcher::SSUMatcher::buildFromPathsWithLazyInitialize((uint64_t)__p, (uint64_t)v13, (uint64_t)v12, (uint64_t)&v15);
}

@end