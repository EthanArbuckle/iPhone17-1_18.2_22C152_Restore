@interface UPPreprocessor
+ (vector<nl_featurization::span_matching::MatchedSpan,)buildMatchedSpanListFromQuerySpans:(id)a2;
- (NSLocale)locale;
- (UPPreprocessor)initWithLocale:(id)a3 featurizer:(const AbstractFeaturizer *)a4;
- (id)preprocess:(id)a3 error:(id *)a4;
@end

@implementation UPPreprocessor

- (void).cxx_destruct
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)preprocess:(id)a3 error:(id *)a4
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v99 = a3;
  v5 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = SNLPOSLoggerForCategory(7);
  v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v94 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UaaP Preprocessing", "", buf, 2u);
  }

  v9 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Preprocessing\"", buf, 2u);
  }

  id v10 = [(NSLocale *)self->_locale localeIdentifier];
  std::string::basic_string[abi:ne180100]<0>(&v151, (char *)[v10 UTF8String]);
  id v11 = [v99 utterance];
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v11 UTF8String]);
  if ((v123.__r_.__value_.__r.__words[0] & 0x8000000000000000) == 0) {
    v12 = buf;
  }
  else {
    v12 = *(uint8_t **)buf;
  }
  if ((v123.__r_.__value_.__r.__words[0] & 0x8000000000000000) == 0) {
    std::basic_string<char16_t>::size_type v13 = HIBYTE(v123.__r_.__value_.__r.__words[0]);
  }
  else {
    std::basic_string<char16_t>::size_type v13 = *(void *)&buf[8];
  }
  toU16String((const char *)v12, v13, &v153);
  if (SHIBYTE(v123.__r_.__value_.__r.__words[0]) < 0) {
    operator delete(*(void **)buf);
  }

  v100 = [MEMORY[0x1E4F1CA48] array];
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v14 = [v99 tokens];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v147 objects:v161 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v148;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v148 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v147 + 1) + 8 * i);
        v19 = [v99 embeddingsByToken];
        v20 = [v19 objectForKeyedSubscript:v18];
        v21 = [v20 firstObject];

        if (!v21)
        {
          v46 = NSString;
          v47 = [v18 value];
          v48 = [v46 stringWithFormat:@"No embeddings are associated with token \"%@\"", v47];

          v49 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v159 = *MEMORY[0x1E4F28568];
          v160 = v48;
          v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
          *a4 = [v49 errorWithDomain:@"com.apple.uaapcustomluframework" code:10 userInfo:v50];

          v51 = 0;
          goto LABEL_133;
        }
        [v100 addObject:v21];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v147 objects:v161 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v145 = 0uLL;
  v146[0] = 0;
  v22 = [v99 tokens];
  unint64_t v23 = [v22 count];
  uint64_t v24 = v145;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v146[0] - v145) >> 4) < v23)
  {
    if (v23 > 0x555555555555555) {
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v25 = *((void *)&v145 + 1);
    v123.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v146;
    *(void *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v23);
    *(void *)&buf[8] = *(void *)buf + v25 - v24;
    v123.__r_.__value_.__r.__words[0] = *(void *)&buf[8];
    v123.__r_.__value_.__l.__size_ = *(void *)buf + 48 * v26;
    std::vector<nl_featurization::Token>::__swap_out_circular_buffer((uint64_t *)&v145, buf);
    std::__split_buffer<nl_featurization::Token>::~__split_buffer((uint64_t)buf);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obuint64_t j = [v99 tokens];
  uint64_t v27 = [obj countByEnumeratingWithState:&v141 objects:v158 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v142;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v142 != v28) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v141 + 1) + 8 * j);
        *(void *)buf = (int)[v30 begin];
        *(void *)&buf[8] = (int)[v30 end];
        id v31 = [v30 value];
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v31 UTF8String]);
        if (v136 >= 0) {
          p_p = (const char *)&__p;
        }
        else {
          p_p = (const char *)__p;
        }
        if (v136 >= 0) {
          std::basic_string<char16_t>::size_type v33 = HIBYTE(v136);
        }
        else {
          std::basic_string<char16_t>::size_type v33 = *((void *)&__p + 1);
        }
        toU16String(p_p, v33, &v123);
        LOBYTE(v124) = 0;
        uint64_t v34 = *((void *)&v145 + 1);
        if (*((void *)&v145 + 1) >= v146[0])
        {
          unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v145 + 1) - v145) >> 4);
          unint64_t v37 = v36 + 1;
          if (v36 + 1 > 0x555555555555555) {
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v146[0] - v145) >> 4) > v37) {
            unint64_t v37 = 0x5555555555555556 * ((uint64_t)(v146[0] - v145) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v146[0] - v145) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v38 = 0x555555555555555;
          }
          else {
            unint64_t v38 = v37;
          }
          v132 = (char *)v146;
          v39 = (long long *)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v38);
          v40 = &v39[3 * v36];
          v128 = (char *)v39;
          v129 = (char *)v40;
          v131 = &v39[3 * v41];
          long long *v40 = *(_OWORD *)buf;
          long long v42 = *(_OWORD *)&v123.__r_.__value_.__l.__data_;
          *((void *)v40 + 4) = *((void *)&v123.__r_.__value_.__l + 2);
          v40[1] = v42;
          memset(&v123, 0, sizeof(v123));
          *((unsigned char *)v40 + 40) = v124;
          v130 = v40 + 3;
          std::vector<nl_featurization::Token>::__swap_out_circular_buffer((uint64_t *)&v145, &v128);
          uint64_t v43 = *((void *)&v145 + 1);
          std::__split_buffer<nl_featurization::Token>::~__split_buffer((uint64_t)&v128);
          *((void *)&v145 + 1) = v43;
          if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v123.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          **((_OWORD **)&v145 + 1) = *(_OWORD *)buf;
          long long v35 = *(_OWORD *)&v123.__r_.__value_.__l.__data_;
          *(void *)(v34 + 32) = *((void *)&v123.__r_.__value_.__l + 2);
          *(_OWORD *)(v34 + 16) = v35;
          memset(&v123, 0, sizeof(v123));
          *(unsigned char *)(v34 + 40) = v124;
          *((void *)&v145 + 1) = v34 + 48;
        }
        if (SHIBYTE(v136) < 0) {
          operator delete((void *)__p);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v141 objects:v158 count:16];
    }
    while (v27);
  }

  v44 = objc_opt_class();
  v45 = [v99 spans];
  if (v44)
  {
    [v44 buildMatchedSpanListFromQuerySpans:v45];
  }
  else
  {
    long long v139 = 0uLL;
    uint64_t v140 = 0;
  }

  long long __p = v145;
  uint64_t v52 = v146[0];
  long long v145 = 0uLL;
  v146[0] = 0;
  long long v137 = v139;
  uint64_t v136 = v52;
  uint64_t v138 = v140;
  long long v139 = 0uLL;
  uint64_t v140 = 0;
  (*((void (**)(char **__return_ptr))self->__featurizer->var0 + 2))(&v128);
  v91 = v128;
  v92 = v129;
  unint64_t v95 = (v129 - v128) / 48;
  if (v129 != v128)
  {
    uint64_t v53 = 0;
    if (v95 <= 1) {
      int64_t v54 = 1;
    }
    else {
      int64_t v54 = (v129 - v128) / 48;
    }
    do
    {
      v55 = (const std::basic_string<char16_t>::value_type **)&v128[v53 + 16];
      if (v128[v53 + 39] < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)buf, *v55, *(void *)&v128[v53 + 24]);
      }
      else
      {
        long long v56 = *(_OWORD *)v55;
        v123.__r_.__value_.__r.__words[0] = *(void *)&v128[v53 + 32];
        *(_OWORD *)buf = v56;
      }
      v57 = SNLPOSLoggerForCategory(3);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        morphun::util::StringUtils::to_string();
        v58 = v118 >= 0 ? &v116 : (void **)v116;
        LODWORD(v156) = 136315138;
        *(void *)((char *)&v156 + 4) = v58;
        _os_log_impl(&dword_1C8DA9000, v57, OS_LOG_TYPE_DEBUG, "Featurized token with text=%s", (uint8_t *)&v156, 0xCu);
        if (SHIBYTE(v118) < 0) {
          operator delete(v116);
        }
      }

      if (SHIBYTE(v123.__r_.__value_.__r.__words[0]) < 0) {
        operator delete(*(void **)buf);
      }
      v53 += 48;
      --v54;
    }
    while (v54);
  }
  long long v156 = 0uLL;
  uint64_t v157 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v156, v131, (uint64_t)v132, (v132 - (unsigned char *)v131) >> 3);
  if (*((void *)&v156 + 1) - (void)v156 != 16 || *(void *)v156 != v95)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Span label shape incorrect.");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (v92 != v91)
  {
    uint64_t v59 = 0;
    uint64_t v60 = *(void *)(v156 + 8);
    uint64_t obja = *MEMORY[0x1E4FBA408];
    std::basic_string<char16_t>::size_type v96 = *(void *)(MEMORY[0x1E4FBA408] + 72);
    uint64_t v98 = *(void *)(MEMORY[0x1E4FBA408] + 64);
    if (v95 <= 1) {
      uint64_t v61 = 1;
    }
    else {
      uint64_t v61 = v95;
    }
    std::basic_string<char16_t>::size_type v62 = MEMORY[0x1E4FBA470] + 16;
    do
    {
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buf);
      LOBYTE(v116) = 91;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v123, (uint64_t)&v116, 1);
      if (v60)
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (k)
          {
            LOBYTE(v116) = 32;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v123, (uint64_t)&v116, 1);
          }
          v64 = (uint64_t *)operator new(0x10uLL);
          uint64_t *v64 = v59;
          v64[1] = k;
          unint64_t v65 = nl_featurization::tensor::Tensor<unsigned long>::computeAddress((uint64_t *)v131, v132, v64, (uint64_t)(v64 + 2));
          if (v65 >= ((char *)v134 - (unsigned char *)v133) >> 3) {
            std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
          }
          operator delete(v64);
          std::ostream::operator<<();
        }
      }
      LOBYTE(v116) = 93;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v123, (uint64_t)&v116, 1);
      v66 = SNLPOSLoggerForCategory(3);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        std::stringbuf::str();
        v67 = &v116;
        if (v118 < 0) {
          v67 = v116;
        }
        LODWORD(v155[0]) = 136315138;
        *(void *)((char *)v155 + 4) = v67;
        _os_log_impl(&dword_1C8DA9000, v66, OS_LOG_TYPE_DEBUG, "Token span labels: %s", (uint8_t *)v155, 0xCu);
        if (SHIBYTE(v118) < 0) {
          operator delete(v116);
        }
      }

      *(void *)buf = obja;
      *(void *)&buf[*(void *)(obja - 24)] = v98;
      v123.__r_.__value_.__r.__words[0] = v96;
      v123.__r_.__value_.__l.__size_ = v62;
      if (v126 < 0) {
        operator delete(v125);
      }
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      MEMORY[0x1CB775B50](&v127);
      ++v59;
    }
    while (v59 != v61);
  }
  v68 = [v100 firstObject];
  uint64_t v69 = [v68 getDimension];

  *(_DWORD *)buf = 0;
  std::vector<float>::vector(v155, v69 * v95, buf);
  if (v92 != v91)
  {
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    if (v95 <= 1) {
      uint64_t v72 = 1;
    }
    else {
      uint64_t v72 = v95;
    }
    do
    {
      v73 = [v100 objectAtIndexedSubscript:v71];
      v74 = [v73 getCoordinates];

      if (v69)
      {
        for (uint64_t m = 0; m != v69; ++m)
        {
          v76 = [v74 objectAtIndexedSubscript:m];
          [v76 floatValue];
          *(_DWORD *)(*(void *)&v155[0] + v70 + 4 * m) = v77;
        }
      }

      ++v71;
      v70 += 4 * v69;
    }
    while (v71 != v72);
  }
  memset(buf, 0, sizeof(buf));
  v123.__r_.__value_.__r.__words[0] = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(buf, v131, (uint64_t)v132, (v132 - (unsigned char *)v131) >> 3);
  v78 = (unint64_t *)v133;
  v79 = v134;
  uint64_t v124 = 0;
  *(_OWORD *)&v123.__r_.__value_.__r.__words[1] = 0uLL;
  if (v134 != v133)
  {
    std::vector<int>::__vallocate[abi:ne180100](&v123.__r_.__value_.__l.__size_, ((char *)v134 - (unsigned char *)v133) >> 3);
    v80 = (float *)v123.__r_.__value_.__r.__words[2];
    do
    {
      unint64_t v81 = *v78++;
      *v80++ = (float)v81;
    }
    while (v78 != v79);
    v123.__r_.__value_.__r.__words[2] = (std::basic_string<char16_t>::size_type)v80;
  }
  v82 = v129;
  v83 = v128;
  v84 = operator new(0x18uLL);
  void *v84 = 0xAAAAAAAAAAAAAAABLL * ((v82 - v83) >> 4);
  v84[1] = 1;
  v84[2] = v69;
  v116 = 0;
  v117 = 0;
  uint64_t v118 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v116, v84, (uint64_t)(v84 + 3), 3uLL);
  v119 = 0;
  v120 = 0;
  uint64_t v121 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v119, *(const void **)&v155[0], *((uint64_t *)&v155[0] + 1), (uint64_t)(*((void *)&v155[0] + 1) - *(void *)&v155[0]) >> 2);
  v85 = SNLPOSLoggerForCategory(7);
  v86 = v85;
  if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
  {
    *(_WORD *)v154 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v86, OS_SIGNPOST_INTERVAL_END, spid, "UaaP Preprocessing", "", v154, 2u);
  }

  v87 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v154 = 0;
    _os_log_impl(&dword_1C8DA9000, v87, OS_LOG_TYPE_DEFAULT, "END \"UaaP Preprocessing\"", v154, 2u);
  }

  v88 = [UPPreprocessorOutput alloc];
  v110 = 0;
  v111 = 0;
  uint64_t v112 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v110, v116, (uint64_t)v117, (v117 - (unsigned char *)v116) >> 3);
  v113 = 0;
  v114 = 0;
  uint64_t v115 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v113, v119, (uint64_t)v120, (v120 - (unsigned char *)v119) >> 2);
  v104 = 0;
  v105 = 0;
  uint64_t v106 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v104, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
  v107 = 0;
  v108 = 0;
  uint64_t v109 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v107, (const void *)v123.__r_.__value_.__l.__size_, v123.__r_.__value_.__r.__words[2], (uint64_t)(v123.__r_.__value_.__r.__words[2] - v123.__r_.__value_.__l.__size_) >> 2);
  memset(v103, 0, sizeof(v103));
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(v103, (long long *)v128, (long long *)v129, 0xAAAAAAAAAAAAAAABLL * ((v129 - v128) >> 4));
  v51 = [(UPPreprocessorOutput *)v88 initWithEmbeddingsTensor:&v110 spanLabelsTensor:&v104 outputTokens:v103];
  *(void *)v154 = v103;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v154);
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  if (v104)
  {
    v105 = v104;
    operator delete(v104);
  }
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  if (v110)
  {
    v111 = v110;
    operator delete(v110);
  }
  if (v119)
  {
    v120 = v119;
    operator delete(v119);
  }
  if (v116)
  {
    v117 = v116;
    operator delete(v116);
  }
  operator delete(v84);
  if (v123.__r_.__value_.__l.__size_)
  {
    v123.__r_.__value_.__r.__words[2] = v123.__r_.__value_.__l.__size_;
    operator delete((void *)v123.__r_.__value_.__l.__size_);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  if (*(void *)&v155[0])
  {
    *((void *)&v155[0] + 1) = *(void *)&v155[0];
    operator delete(*(void **)&v155[0]);
  }
  if ((void)v156)
  {
    *((void *)&v156 + 1) = v156;
    operator delete((void *)v156);
  }
  if (v133)
  {
    v134 = (unint64_t *)v133;
    operator delete(v133);
  }
  if (v131)
  {
    v132 = (char *)v131;
    operator delete(v131);
  }
  *(void *)buf = &v128;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &v137;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &__p;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &v139;
  std::vector<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &v145;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_133:

  if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v153.__r_.__value_.__l.__data_);
  }
  if (v152 < 0) {
    operator delete(v151);
  }

  return v51;
}

- (UPPreprocessor)initWithLocale:(id)a3 featurizer:(const AbstractFeaturizer *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UPPreprocessor;
  v8 = [(UPPreprocessor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->__featurizer = a4;
  }

  return v9;
}

+ (vector<nl_featurization::span_matching::MatchedSpan,)buildMatchedSpanListFromQuerySpans:(id)a2
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v45;
    p_var2 = &retstr->var2;
    *(void *)&long long v8 = 138412290;
    long long v35 = v8;
    unint64_t v37 = retstr;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v35) == 2)
        {
          id v12 = [v11 category];
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v12 UTF8String]);
          if (SHIBYTE(v50) >= 0) {
            p_long long buf = (const char *)&buf;
          }
          else {
            p_long long buf = (const char *)buf;
          }
          if (SHIBYTE(v50) >= 0) {
            std::basic_string<char16_t>::size_type v14 = HIBYTE(v50);
          }
          else {
            std::basic_string<char16_t>::size_type v14 = *((void *)&buf + 1);
          }
          toU16String(p_buf, v14, &v43);
          if (SHIBYTE(v50) < 0) {
            operator delete((void *)buf);
          }

          uaap::UPDataDetector::labelToUaapType((unsigned __int16 *)&v43, (uint64_t)&v40);
          int v15 = v42;
          if (v42)
          {
            LODWORD(v38) = [v11 range];
            int v16 = [v11 range];
            [v11 range];
            HIDWORD(v38) = v17 + v16;
            if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
              std::basic_string<char16_t>::__init_copy_ctor_external(&__p, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
            }
            else {
              std::basic_string<char16_t> __p = v43;
            }
            v20 = SNLPOSLoggerForCategory(3);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v21 = +[UPUtilities stdU16ToNSString:&__p];
              LODWORD(buf) = 67109634;
              DWORD1(buf) = v38;
              WORD4(buf) = 1024;
              *(_DWORD *)((char *)&buf + 10) = HIDWORD(v38);
              HIWORD(buf) = 2112;
              v50 = v21;
              _os_log_impl(&dword_1C8DA9000, v20, OS_LOG_TYPE_DEBUG, "Adding matching span (%u -> %u) with label %@", (uint8_t *)&buf, 0x18u);

              retstr = v37;
            }

            var1 = retstr->var1;
            var0 = retstr->var2.var0;
            if (var1 >= var0)
            {
              uint64_t v25 = (var1 - retstr->var0) >> 5;
              unint64_t v26 = v25 + 1;
              if ((unint64_t)(v25 + 1) >> 59) {
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v27 = var0 - retstr->var0;
              if (v27 >> 4 > v26) {
                unint64_t v26 = v27 >> 4;
              }
              if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v28 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v28 = v26;
              }
              uint64_t v52 = p_var2;
              if (v28) {
                unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::vector<unsigned long>>>>(v28);
              }
              else {
                uint64_t v29 = 0;
              }
              unint64_t v30 = v28 + 32 * v25;
              *(void *)&long long buf = v28;
              *((void *)&buf + 1) = v30;
              unint64_t v51 = v28 + 32 * v29;
              *(void *)unint64_t v30 = v38;
              long long v31 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              *(void *)(v30 + 24) = *((void *)&__p.__r_.__value_.__l + 2);
              *(_OWORD *)(v30 + 8) = v31;
              memset(&__p, 0, sizeof(__p));
              v50 = (void *)(v30 + 32);
              std::vector<nl_featurization::span_matching::MatchedSpan>::__swap_out_circular_buffer((uint64_t *)retstr, &buf);
              v32 = v37->var1;
              std::__split_buffer<std::pair<sirinluinternal::MatchingSpan_MatcherName,std::string>>::~__split_buffer((uint64_t)&buf);
              int v33 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
              v37->var1 = v32;
              retstr = v37;
              if (v33 < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }
            else
            {
              *(void *)var1 = v38;
              long long v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              *((void *)var1 + 3) = *((void *)&__p.__r_.__value_.__l + 2);
              *(_OWORD *)((char *)var1 + 8) = v24;
              memset(&__p, 0, sizeof(__p));
              retstr->var1 = (MatchedSpan *)((char *)var1 + 32);
            }
            if (v15 && v41 < 0) {
              operator delete(v40);
            }
          }
          else
          {
            v18 = SNLPOSLoggerForCategory(3);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v19 = [v11 category];
              LODWORD(buf) = v35;
              *(void *)((char *)&buf + 4) = v19;
              _os_log_impl(&dword_1C8DA9000, v18, OS_LOG_TYPE_DEBUG, "Warning: discarding data detector matching span with unknown category %@", (uint8_t *)&buf, 0xCu);
            }
          }
          if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v43.__r_.__value_.__l.__data_);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v7);
  }

  return result;
}

@end