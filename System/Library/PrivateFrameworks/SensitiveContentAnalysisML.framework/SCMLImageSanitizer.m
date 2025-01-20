@interface SCMLImageSanitizer
- (SCMLImageSanitizer)init;
- (SCMLImageSanitizer)initWithConfiguration:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)_sanitizeRequest:(id)a3 error:(id *)a4;
- (id)sanitizePixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)sanitizePixelBuffer:(__CVBuffer *)a3 keepGoing:(BOOL)a4 error:(id *)a5;
- (id)sanitizeRequest:(id)a3 error:(id *)a4;
- (uint64_t)_sanitizeRequest:error:;
- (uint64_t)initWithConfiguration:error:;
- (uint64_t)sanitizeRequest:error:;
- (void)_sanitizeRequest:error:;
- (void)initWithConfiguration:error:;
- (void)sanitizeRequest:error:;
- (void)updateSanitization:(id)a3 withAnalysisResult:(id)a4 forStyle:(unsigned int)a5 isChildPresent:(BOOL)a6;
- (void)updateSanitization:(id)a3 withObservations:(id)a4;
@end

@implementation SCMLImageSanitizer

- (SCMLImageSanitizer)init
{
  return [(SCMLImageSanitizer *)self initWithConfiguration:0 error:0];
}

- (SCMLImageSanitizer)initWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v207 = *MEMORY[0x263EF8340];
  v157 = (SCMLImageSanitizerConfiguration *)a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v186);
  v5 = v186;
  v6 = v5;
  os_signpost_id_t v7 = v187;
  if (v187 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SCMLImageSanitizer.init", "", buf, 2u);
  }

  v185[0] = &unk_270973670;
  v185[1] = &v186;
  v185[3] = v185;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v188, (uint64_t)v185);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v185);
  v8 = +[SCMLLog imageAnalyzer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(SCMLImageSanitizerConfiguration *)v157 mode];
    int v10 = [(SCMLImageSanitizerConfiguration *)v157 backends];
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v10;
    _os_log_impl(&dword_25BF41000, v8, OS_LOG_TYPE_DEFAULT, "Begin SCMLImageSanitizer init inst=%p mode=%d backends=0x%x", buf, 0x18u);
  }

  v167.receiver = self;
  v167.super_class = (Class)SCMLImageSanitizer;
  v161 = [(SCMLImageSanitizer *)&v167 init];

  if (v161)
  {
    v11 = v157;
    if (!v157) {
      v11 = objc_alloc_init(SCMLImageSanitizerConfiguration);
    }
    v157 = v11;
    v161->_granularity = [(SCMLImageSanitizerConfiguration *)v11 granularity];
    v161->_mode = [(SCMLImageSanitizerConfiguration *)v157 mode];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 resourceURL];
    v14 = [v13 path];

    v15 = [v14 stringByAppendingPathComponent:@"Models"];
    v16 = [v15 stringByAppendingPathComponent:@"ImageSanitizer_v1.0.0"];
    id v17 = [v16 stringByAppendingPathComponent:@"ImageSanitizer_v1.0.0"];
    std::string::basic_string[abi:ne180100]<0>(&v177, (char *)[v17 UTF8String]);

    v18 = std::string::append(&v177, ".config.json", 0xCuLL);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    *(void *)&buf[16] = *((void *)&v18->__r_.__value_.__l + 2);
    *(_OWORD *)buf = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if ((buf[23] & 0x80u) == 0) {
      v20 = buf;
    }
    else {
      v20 = *(uint8_t **)buf;
    }
    if ((buf[23] & 0x80u) == 0) {
      uint64_t v21 = buf[23];
    }
    else {
      uint64_t v21 = *(void *)&buf[8];
    }
    scml::Config::loadJson(v20, v21, (uint64_t)v183);
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v177.__r_.__value_.__l.__data_);
    }
    unint64_t backends = v161->_backends;
    if ((backends & 2) != 0)
    {
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
      v23 = *(id *)buf;
      v24 = v23;
      os_signpost_id_t v25 = *(void *)&buf[8];
      if ((unint64_t)(*(void *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        LOWORD(v177.__r_.__value_.__l.__data_) = 0;
        _os_signpost_emit_with_name_impl(&dword_25BF41000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "SCMLImageSanitizer.init.taboo", "", (uint8_t *)&v177, 2u);
      }

      v182[0] = &unk_2709736C8;
      v182[1] = buf;
      v182[3] = v182;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v182);
      std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v182);
      v177.__r_.__value_.__s.__data_[0] = 0;
      LOBYTE(v178) = 0;
      v26 = (uint64_t *)scml::Config::get<std::vector<scml::Config>>((uint64_t)v183, "taboo_thresholds", 0x10uLL, (uint64_t)&v177);
      if ((_BYTE)v178)
      {
        *(void *)v205 = &v177;
        std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)v205);
      }
      uint64_t v27 = *v26;
      uint64_t v28 = v26[1];
      if (*v26 != v28)
      {
        do
        {
          LOWORD(v177.__r_.__value_.__l.__data_) = 257;
          if (scml::Config::get<BOOL>(v27, "enabled", 7uLL, &v177))
          {
            LOBYTE(__p) = 0;
            BYTE4(__p) = 0;
            float v29 = scml::Config::get<float>(v27, "threshold", 9uLL, &__p);
            v177.__r_.__value_.__s.__data_[0] = 0;
            LOBYTE(v178) = 0;
            *(void *)v205 = scml::Config::get<std::string>(v27, "class", 5uLL, (uint64_t)&v177);
            *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v161->_tabooThresholds, *(unsigned __int8 **)v205, (uint64_t)&std::piecewise_construct, (long long **)v205)+ 10) = v29;
            if ((_BYTE)v178)
            {
              if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v177.__r_.__value_.__l.__data_);
              }
            }
          }
          v27 += 64;
        }
        while (v27 != v28);
      }
      v30 = (VNSession *)objc_alloc_init(MEMORY[0x263F1F000]);
      vnSession = v161->_vnSession;
      v161->_vnSession = v30;

      v34 = v32 = v161->_vnSession;
      v181 = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v181 count:1];
      id v166 = 0;
      uint64_t v4 = [(VNSession *)v32 prepareForPerformingRequests:v35 error:&v166];
      id v36 = v166;

      if ((v4 & 1) == 0)
      {
        v37 = +[SCMLLog imageAnalyzer];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v177.__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v177.__r_.__value_.__r.__words + 4) = (std::string::size_type)v36;
          _os_log_impl(&dword_25BF41000, v37, OS_LOG_TYPE_DEFAULT, "VNSession warmup failed: %@", (uint8_t *)&v177, 0xCu);
        }
      }
      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
      unint64_t backends = v161->_backends;
    }
    if ((backends & 0xC) != 0)
    {
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
      v38 = *(id *)buf;
      v39 = v38;
      os_signpost_id_t v40 = *(void *)&buf[8];
      if ((unint64_t)(*(void *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        LOWORD(v177.__r_.__value_.__l.__data_) = 0;
        _os_signpost_emit_with_name_impl(&dword_25BF41000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SCMLImageSanitizer.init.clip", "", (uint8_t *)&v177, 2u);
      }

      v180[0] = &unk_270973720;
      v180[1] = buf;
      v180[3] = v180;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&buf[16], (uint64_t)v180);
      std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v180);
      __p = 0;
      v169 = 0;
      unint64_t v170 = 0;
      v41 = [(SCMLImageSanitizerConfiguration *)v157 clipClassifierConfig];
      BOOL v42 = [v41 length] == 0;

      if (v42)
      {
        unint64_t v44 = v161->_backends;
        if ((v44 & 4) != 0)
        {
          scml::ClipEmbeddingClassifier::defaultASMConfigPath(v205);
          v45 = v169;
          if ((unint64_t)v169 >= v170)
          {
            uint64_t v47 = (v169 - (unsigned char *)__p) >> 5;
            unint64_t v48 = v47 + 1;
            if ((unint64_t)(v47 + 1) >> 59) {
              std::vector<_NSRange>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v49 = v170 - (void)__p;
            if ((uint64_t)(v170 - (void)__p) >> 4 > v48) {
              unint64_t v48 = v49 >> 4;
            }
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v50 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v50 = v48;
            }
            v179 = &v170;
            if (v50) {
              v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>>((uint64_t)&v170, v50);
            }
            else {
              v51 = 0;
            }
            std::string::size_type v52 = (std::string::size_type)&v51[32 * v47];
            v177.__r_.__value_.__r.__words[0] = (std::string::size_type)v51;
            v177.__r_.__value_.__l.__size_ = v52;
            v178 = &v51[32 * v50];
            *(void *)std::string::size_type v52 = 4;
            long long v53 = *(_OWORD *)v205;
            *(void *)(v52 + 24) = v206;
            *(_OWORD *)(v52 + 8) = v53;
            v206 = 0;
            memset(v205, 0, sizeof(v205));
            v177.__r_.__value_.__r.__words[2] = v52 + 32;
            std::vector<std::pair<unsigned long,std::string>>::__swap_out_circular_buffer((uint64_t *)&__p, &v177);
            v54 = v169;
            std::__split_buffer<std::pair<unsigned long,std::string>>::~__split_buffer((uint64_t)&v177);
            v169 = v54;
            if (SHIBYTE(v206) < 0) {
              operator delete(*(void **)v205);
            }
          }
          else
          {
            *(void *)v169 = 4;
            long long v46 = *(_OWORD *)v205;
            *((void *)v45 + 3) = v206;
            *(_OWORD *)(v45 + 8) = v46;
            v169 = v45 + 32;
          }
          unint64_t v44 = v161->_backends;
        }
        if ((v44 & 8) != 0)
        {
          scml::ClipEmbeddingClassifier::defaultStructuralIntegrityConfigPath(v205);
          v55 = v169;
          if ((unint64_t)v169 >= v170)
          {
            uint64_t v57 = (v169 - (unsigned char *)__p) >> 5;
            unint64_t v58 = v57 + 1;
            if ((unint64_t)(v57 + 1) >> 59) {
              std::vector<_NSRange>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v59 = v170 - (void)__p;
            if ((uint64_t)(v170 - (void)__p) >> 4 > v58) {
              unint64_t v58 = v59 >> 4;
            }
            if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v60 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v60 = v58;
            }
            v179 = &v170;
            if (v60) {
              v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>>((uint64_t)&v170, v60);
            }
            else {
              v61 = 0;
            }
            std::string::size_type v62 = (std::string::size_type)&v61[32 * v57];
            v177.__r_.__value_.__r.__words[0] = (std::string::size_type)v61;
            v177.__r_.__value_.__l.__size_ = v62;
            v178 = &v61[32 * v60];
            *(void *)std::string::size_type v62 = 8;
            long long v63 = *(_OWORD *)v205;
            *(void *)(v62 + 24) = v206;
            *(_OWORD *)(v62 + 8) = v63;
            v206 = 0;
            memset(v205, 0, sizeof(v205));
            v177.__r_.__value_.__r.__words[2] = v62 + 32;
            std::vector<std::pair<unsigned long,std::string>>::__swap_out_circular_buffer((uint64_t *)&__p, &v177);
            v64 = v169;
            std::__split_buffer<std::pair<unsigned long,std::string>>::~__split_buffer((uint64_t)&v177);
            v169 = v64;
            if (SHIBYTE(v206) < 0) {
              operator delete(*(void **)v205);
            }
          }
          else
          {
            *(void *)v169 = 8;
            long long v56 = *(_OWORD *)v205;
            *((void *)v55 + 3) = v206;
            *(_OWORD *)(v55 + 8) = v56;
            v169 = v55 + 32;
          }
        }
      }
      else
      {
        v43 = [(SCMLImageSanitizerConfiguration *)v157 clipClassifierConfig];
        scml::strFromNSString(v43, v205);
        *(_OWORD *)&v177.__r_.__value_.__r.__words[1] = *(_OWORD *)v205;
        v177.__r_.__value_.__r.__words[0] = 0;
        v178 = v206;
        memset(v205, 0, sizeof(v205));
        v206 = 0;
        std::vector<std::pair<unsigned long,std::string>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,std::string> const*,std::pair<unsigned long,std::string> const*>((uint64_t)&__p, &v177, &v179, 1uLL);
        if (SHIBYTE(v178) < 0) {
          operator delete((void *)v177.__r_.__value_.__l.__size_);
        }
        if (SHIBYTE(v206) < 0) {
          operator delete(*(void **)v205);
        }
      }
      v65 = __p;
      if (__p != v169)
      {
        scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v177);
        v66 = v177.__r_.__value_.__l.__data_;
        v67 = v66;
        std::string::size_type size = v177.__r_.__value_.__l.__size_;
        if (v177.__r_.__value_.__l.__size_ - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v66))
        {
          if (*((char *)v65 + 31) < 0) {
            v69 = (char *)v65[1];
          }
          else {
            v69 = (char *)(v65 + 1);
          }
          *(_DWORD *)v205 = 136315138;
          *(void *)&v205[4] = v69;
          _os_signpost_emit_with_name_impl(&dword_25BF41000, v67, OS_SIGNPOST_INTERVAL_BEGIN, size, "SCMLImageSanitizer.init.clip.classify", "config=%s", v205, 0xCu);
        }

        v176[0] = &off_270973778;
        v176[1] = &v177;
        v176[3] = v176;
        std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&v177.__r_.__value_.__r.__words[2], (uint64_t)v176);
        std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v176);
        operator new();
      }
      v177.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<unsigned long,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v177);
      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
      unint64_t backends = v161->_backends;
    }
    if (backends)
    {
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v177);
      v70 = v177.__r_.__value_.__l.__data_;
      v71 = v70;
      std::string::size_type v72 = v177.__r_.__value_.__l.__size_;
      if (v177.__r_.__value_.__l.__size_ - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25BF41000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v72, "SCMLImageSanitizer.init.ivs", "", buf, 2u);
      }

      v175[0] = &unk_270974268;
      v175[1] = &v177;
      v175[3] = v175;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](&v177.__r_.__value_.__r.__words[2], (uint64_t)v175);
      std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v175);
      buf[0] = 0;
      LOBYTE(v190) = 0;
      uint64_t v73 = scml::Config::get<std::vector<scml::Config>>((uint64_t)v183, "ivs_thresholds", 0xEuLL, (uint64_t)buf);
      if ((_BYTE)v190)
      {
        *(void *)v205 = buf;
        std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)v205);
      }
      v75 = *(_anonymous_namespace_ **)v73;
      v74 = *(_anonymous_namespace_ **)(v73 + 8);
      if (*(_anonymous_namespace_ **)v73 != v74)
      {
        p_p2 = &v161->_ivsThresholds.__table_.__p2_;
        p_unint64_t value = &v161->_ivsThresholds.__table_.__p3_.__value_;
        p_p1 = &v161->_ivsThresholds.__table_.__p1_;
        v152 = *(_anonymous_namespace_ **)(v73 + 8);
        while (1)
        {
          *(_WORD *)buf = 257;
          if (scml::Config::get<BOOL>((uint64_t)v75, "enabled", 7uLL, buf)) {
            break;
          }
LABEL_219:
          v75 = (_anonymous_namespace_ *)((char *)v75 + 64);
          if (v75 == v74) {
            goto LABEL_230;
          }
        }
        buf[0] = 0;
        LOBYTE(v190) = 0;
        uint64_t v76 = scml::Config::get<std::string>((uint64_t)v75, "class", 5uLL, (uint64_t)buf);
        if (*(char *)(v76 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v174, *(const std::string::value_type **)v76, *(void *)(v76 + 8));
        }
        else
        {
          long long v78 = *(_OWORD *)v76;
          v174.__r_.__value_.__r.__words[2] = *(void *)(v76 + 16);
          *(_OWORD *)&v174.__r_.__value_.__l.__data_ = v78;
        }
        if ((_BYTE)v190 && (char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }
        uint64_t v156 = v80;
        uint64_t v81 = IvsThresholdValue;
        memset(buf, 0, sizeof(buf));
        v206 = 0;
        memset(v205, 0, sizeof(v205));
        LOBYTE(v190) = 1;
        uint64_t v82 = scml::Config::get<std::vector<scml::Config>>((uint64_t)v75, "style_specific_thresholds", 0x19uLL, (uint64_t)buf);
        uint64_t v155 = v81;
        if ((_BYTE)v190)
        {
          __p = buf;
          std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        }
        __p = v205;
        std::vector<scml::Config>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        v83 = *(_anonymous_namespace_ **)v82;
        v163 = *(_anonymous_namespace_ **)(v82 + 8);
        if (*(_anonymous_namespace_ **)v82 == v163)
        {
          v86 = 0;
          long long v164 = 0u;
        }
        else
        {
          v153 = v75;
          v84 = 0;
          v85 = 0;
          v86 = 0;
          v87 = 0;
          do
          {
            LOBYTE(__p) = 0;
            char v171 = 0;
            v88 = (unsigned __int8 *)scml::Config::get<std::string>((uint64_t)v83, "style", 5uLL, (uint64_t)&__p);
            std::string::basic_string[abi:ne180100]<0>(buf, "unspecified");
            int v190 = 0;
            std::string::basic_string[abi:ne180100]<0>(v191, "illustration_output");
            int v192 = 1;
            std::string::basic_string[abi:ne180100]<0>(v193, "sketch_output");
            int v194 = 2;
            std::string::basic_string[abi:ne180100]<0>(v195, "animation_output");
            int v196 = 3;
            std::string::basic_string[abi:ne180100]<0>(v197, "genmoji_output");
            int v198 = 4;
            std::string::basic_string[abi:ne180100]<0>(v199, "scribble_input");
            int v200 = 5;
            std::string::basic_string[abi:ne180100]<0>(v201, "scribble_with_background_input");
            int v202 = 6;
            std::string::basic_string[abi:ne180100]<0>(v203, "other_input");
            int v204 = 7;
            std::unordered_map<std::string,SCMLImageSanitizerImageStyle>::unordered_map((uint64_t)v205, buf, 8);
            for (uint64_t i = 0; i != -32; i -= 4)
            {
              if (SHIBYTE(v203[i + 2]) < 0) {
                operator delete((void *)v203[i]);
              }
            }
            v90 = std::__hash_table<std::__hash_value_type<std::string,ik::E5BufferTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::E5BufferTensor>>>::find<std::string>(v205, v88);
            if (!v90)
            {
              exception = __cxa_allocate_exception(0x10uLL);
              std::operator+<char>();
              MEMORY[0x26117A7E0](exception, buf);
              __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
            }
            int v91 = *((_DWORD *)v90 + 10);
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v205);
            if (v171 && SHIBYTE(v170) < 0) {
              operator delete(__p);
            }
            v92 = (void *)scml::Config::as<std::unordered_map<std::string,scml::Config>>((uint64_t)v83);
            std::string::basic_string[abi:ne180100]<0>(buf, "is_child_present");
            v94 = std::__hash_table<std::__hash_value_type<std::string,scml::Config>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,scml::Config>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,scml::Config>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,scml::Config>>>::find<std::string>(v92, buf);
            if ((char)buf[23] < 0) {
              operator delete(*(void **)buf);
            }
            v95 = v86;
            if (v94)
            {
              *(_WORD *)buf = 0;
              __int16 v96 = scml::Config::get<BOOL>((uint64_t)v83, "is_child_present", 0x10uLL, buf);
              __int16 v97 = 1;
            }
            else
            {
              __int16 v96 = 0;
              __int16 v97 = 0;
            }
            uint64_t v100 = v98;
            uint64_t v4 = v99;
            __int16 v101 = v96 | (v97 << 8);
            v86 = v95;
            if (v87 >= v95)
            {
              unint64_t v102 = 0xAAAAAAAAAAAAAAABLL * ((v87 - v85) >> 3) + 1;
              if (v102 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<_NSRange>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((v95 - v85) >> 3) > v102) {
                unint64_t v102 = 0x5555555555555556 * ((v95 - v85) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v95 - v85) >> 3) >= 0x555555555555555) {
                unint64_t v103 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v103 = v102;
              }
              if (v103)
              {
                if (v103 > 0xAAAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v104 = (char *)operator new(24 * v103);
              }
              else
              {
                v104 = 0;
              }
              v105 = &v104[8 * ((v87 - v85) >> 3)];
              *(_DWORD *)v105 = v91;
              *((_WORD *)v105 + 2) = v101;
              *((void *)v105 + 1) = v100;
              *((void *)v105 + 2) = v4;
              if (v87 == v85)
              {
                v84 = &v104[8 * ((v87 - v85) >> 3)];
              }
              else
              {
                v106 = &v104[8 * ((v87 - v85) >> 3)];
                do
                {
                  long long v107 = *(_OWORD *)(v87 - 24);
                  v84 = v106 - 24;
                  *((void *)v106 - 1) = *((void *)v87 - 1);
                  *(_OWORD *)(v106 - 24) = v107;
                  v87 -= 24;
                  v106 -= 24;
                }
                while (v87 != v85);
              }
              v86 = &v104[24 * v103];
              v87 = v105 + 24;
              if (v85) {
                operator delete(v85);
              }
              v85 = v84;
            }
            else
            {
              *(_DWORD *)v87 = v91;
              *((_WORD *)v87 + 2) = v101;
              *((void *)v87 + 1) = v98;
              *((void *)v87 + 2) = v99;
              v87 += 24;
            }
            v83 = (_anonymous_namespace_ *)((char *)v83 + 64);
          }
          while (v83 != v163);
          *(void *)&long long v108 = v84;
          *((void *)&v108 + 1) = v87;
          long long v164 = v108;
          v74 = v152;
          v75 = v153;
        }
        unint64_t v109 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)p_p2, (uint64_t)&v174);
        unint64_t v110 = v109;
        unint64_t value = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (value)
        {
          v112 = v86;
          uint8x8_t v113 = (uint8x8_t)vcnt_s8((int8x8_t)value);
          v113.i16[0] = vaddlv_u8(v113);
          unint64_t v114 = v113.u32[0];
          if (v113.u32[0] > 1uLL)
          {
            uint64_t v4 = v109;
            if (v109 >= value) {
              uint64_t v4 = v109 % value;
            }
          }
          else
          {
            uint64_t v4 = (value - 1) & v109;
          }
          v115 = (uint64_t **)v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v4];
          if (v115)
          {
            v116 = *v115;
            if (*v115)
            {
              while (1)
              {
                unint64_t v117 = v116[1];
                if (v117 == v110)
                {
                  if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)p_value, (unsigned __int8 *)v116 + 16, (unsigned __int8 *)&v174))
                  {
                    v86 = v112;
                    v74 = v152;
                    goto LABEL_215;
                  }
                }
                else
                {
                  if (v114 > 1)
                  {
                    if (v117 >= value) {
                      v117 %= value;
                    }
                  }
                  else
                  {
                    v117 &= value - 1;
                  }
                  if (v117 != v4)
                  {
LABEL_155:
                    v86 = v112;
                    v74 = v152;
                    goto LABEL_157;
                  }
                }
                v116 = (uint64_t *)*v116;
                if (!v116) {
                  goto LABEL_155;
                }
              }
            }
          }
          v86 = v112;
        }
LABEL_157:
        v118 = (char *)operator new(0x50uLL);
        *(void *)buf = v118;
        *(void *)&buf[8] = &v161->_ivsThresholds.__table_.__p1_;
        buf[16] = 0;
        *(void *)v118 = 0;
        *((void *)v118 + 1) = v110;
        v119 = (std::string *)(v118 + 16);
        if (SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v119, v174.__r_.__value_.__l.__data_, v174.__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)&v119->__r_.__value_.__l.__data_ = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
          *((void *)v118 + 4) = *((void *)&v174.__r_.__value_.__l + 2);
        }
        *((void *)v118 + 9) = 0;
        *(_OWORD *)(v118 + 56) = 0u;
        *(_OWORD *)(v118 + 40) = 0u;
        buf[16] = 1;
        float v120 = (float)(p_p2->__value_ + 1);
        float v121 = *p_value;
        if (value && (float)(v121 * (float)value) >= v120)
        {
LABEL_206:
          v138 = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v4];
          if (v138)
          {
            **(void **)buf = *v138;
            void *v138 = *(void *)buf;
          }
          else
          {
            **(void **)buf = v161->_ivsThresholds.__table_.__p1_.__value_.__next_;
            v161->_ivsThresholds.__table_.__p1_.__value_.__next_ = *(void **)buf;
            v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v4] = p_p1;
            if (**(void **)buf)
            {
              unint64_t v139 = *(void *)(**(void **)buf + 8);
              if ((value & (value - 1)) != 0)
              {
                if (v139 >= value) {
                  v139 %= value;
                }
              }
              else
              {
                v139 &= value - 1;
              }
              v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v139] = *(void **)buf;
            }
          }
          v116 = *(uint64_t **)buf;
          *(void *)buf = 0;
          ++p_p2->__value_;
LABEL_215:
          v140 = (void *)v116[7];
          v116[5] = v155;
          v116[6] = v156;
          if (v140)
          {
            v116[8] = (uint64_t)v140;
            operator delete(v140);
            v116[7] = 0;
            v116[8] = 0;
            v116[9] = 0;
          }
          *(_OWORD *)(v116 + 7) = v164;
          v116[9] = (uint64_t)v86;
          if (SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v174.__r_.__value_.__l.__data_);
          }
          goto LABEL_219;
        }
        BOOL v122 = (value & (value - 1)) == 0;
        if (value < 3) {
          BOOL v122 = 0;
        }
        unint64_t v123 = (2 * value) | !v122;
        unint64_t v124 = vcvtps_u32_f32(v120 / v121);
        if (v123 <= v124) {
          int8x8_t prime = (int8x8_t)v124;
        }
        else {
          int8x8_t prime = (int8x8_t)v123;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t value = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (*(void *)&prime > value) {
          goto LABEL_172;
        }
        if (*(void *)&prime < value)
        {
          unint64_t v132 = vcvtps_u32_f32((float)p_p2->__value_ / *p_value);
          if (value < 3
            || (uint8x8_t v133 = (uint8x8_t)vcnt_s8((int8x8_t)value), v133.i16[0] = vaddlv_u8(v133), v133.u32[0] > 1uLL))
          {
            unint64_t v132 = std::__next_prime(v132);
          }
          else
          {
            uint64_t v134 = 1 << -(char)__clz(v132 - 1);
            if (v132 >= 2) {
              unint64_t v132 = v134;
            }
          }
          if (*(void *)&prime <= v132) {
            int8x8_t prime = (int8x8_t)v132;
          }
          if (*(void *)&prime >= value)
          {
            unint64_t value = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
            {
LABEL_172:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              v126 = (void **)operator new(8 * *(void *)&prime);
              v127 = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_;
              v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_ = v126;
              if (v127) {
                operator delete(v127);
              }
              uint64_t v128 = 0;
              v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v128++] = 0;
              while (*(void *)&prime != v128);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                unint64_t v130 = next[1];
                uint8x8_t v131 = (uint8x8_t)vcnt_s8(prime);
                v131.i16[0] = vaddlv_u8(v131);
                if (v131.u32[0] > 1uLL)
                {
                  if (v130 >= *(void *)&prime) {
                    v130 %= *(void *)&prime;
                  }
                }
                else
                {
                  v130 &= *(void *)&prime - 1;
                }
                v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v130] = p_p1;
                v135 = (void *)*next;
                if (*next)
                {
                  do
                  {
                    unint64_t v136 = v135[1];
                    if (v131.u32[0] > 1uLL)
                    {
                      if (v136 >= *(void *)&prime) {
                        v136 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v136 &= *(void *)&prime - 1;
                    }
                    if (v136 != v130)
                    {
                      v137 = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_;
                      if (!v137[v136])
                      {
                        v137[v136] = next;
                        goto LABEL_197;
                      }
                      void *next = *v135;
                      void *v135 = *(void *)v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v136];
                      *(void *)v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v136] = v135;
                      v135 = next;
                    }
                    unint64_t v136 = v130;
LABEL_197:
                    next = v135;
                    v135 = (void *)*v135;
                    unint64_t v130 = v136;
                  }
                  while (v135);
                }
              }
              unint64_t value = (unint64_t)prime;
              goto LABEL_201;
            }
            v141 = v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_;
            v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v141) {
              operator delete(v141);
            }
            unint64_t value = 0;
            v161->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
LABEL_201:
        if ((value & (value - 1)) != 0)
        {
          if (v110 >= value) {
            uint64_t v4 = v110 % value;
          }
          else {
            uint64_t v4 = v110;
          }
        }
        else
        {
          uint64_t v4 = (value - 1) & v110;
        }
        goto LABEL_206;
      }
LABEL_230:
      v172[0] = SCMLUseAnyAvailableDevice[0];
      v172[1] = SCMLTrackPerformance[0];
      v173[0] = MEMORY[0x263EFFA88];
      v142 = objc_msgSend(NSNumber, "numberWithBool:", -[SCMLImageSanitizerConfiguration trackPerformance](v157, "trackPerformance"));
      v173[1] = v142;
      v143 = [NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];

      id v165 = 0;
      v144 = [[SCMLHandler alloc] initWithOptions:v143 error:&v165];
      id v145 = v165;
      handler = v161->_handler;
      v161->_handler = v144;

      if (!v161->_handler)
      {
        v150 = __cxa_allocate_exception(0x10uLL);
        scml::makeException("make SCMLHandler failed", 0x17uLL, v145, (uint64_t)v150);
        __cxa_throw(v150, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }

      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v177);
    }
    if (v184) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v184);
    }
    std::__variant_detail::__dtor<std::__variant_detail::__traits<decltype(nullptr),long long,double,std::string,std::vector<scml::Config>,std::unordered_map<std::string,scml::Config>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v183);
  }
  v147 = +[SCMLLog imageAnalyzer];
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BF41000, v147, OS_LOG_TYPE_DEFAULT, "End SCMLImageSanitizer init", buf, 2u);
  }

  v162 = v161;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v186);

  return v162;
}

- (void)updateSanitization:(id)a3 withObservations:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v36;
    uint64_t v33 = *MEMORY[0x263F1F058];
    uint64_t v31 = *MEMORY[0x263F1F078];
    uint64_t v32 = *MEMORY[0x263F1F280];
    uint64_t v29 = *MEMORY[0x263F1F090];
    uint64_t v30 = *MEMORY[0x263F1F060];
    uint64_t v27 = *MEMORY[0x263F1F048];
    uint64_t v28 = *MEMORY[0x263F1F288];
    uint64_t v25 = *MEMORY[0x263F1F050];
    uint64_t v26 = *MEMORY[0x263F1F290];
    uint64_t v24 = *MEMORY[0x263F1F080];
    p_tabooThresholds = &self->_tabooThresholds;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        v12 = [v11 identifier];
        {
          v40[0] = v33;
          v40[1] = v32;
          v41[0] = kSCMLImageSanitizationSignalSignificantEventBlood[0];
          v41[1] = kSCMLImageSanitizationSignalSignificantEventDemonstration[0];
          v40[2] = v31;
          v40[3] = v30;
          BOOL v42 = kSCMLImageSanitizationSignalSignificantEventDestruction[0];
          v43 = kSCMLImageSanitizationSignalSignificantEventFireDevastation[0];
          v40[4] = v29;
          v40[5] = v28;
          unint64_t v44 = kSCMLImageSanitizationSignalSignificantEventFloodDevastation[0];
          v45 = kSCMLImageSanitizationSignalSignificantEventFuneral[0];
          v40[6] = v27;
          v40[7] = v26;
          long long v46 = kSCMLImageSanitizationSignalSignificantEventHospital[0];
          uint64_t v47 = kSCMLImageSanitizationSignalSignificantEventReligiousSetting[0];
          v40[8] = v25;
          v40[9] = v24;
          unint64_t v48 = kSCMLImageSanitizationSignalSignificantEventVehicleCrash[0];
          uint64_t v49 = kSCMLImageSanitizationSignalSignificantEventWar[0];
          [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:10];
        }
        v14 = [v13 objectForKeyedSubscript:v12];

        if (v14) {
          v15 = v14;
        }
        else {
          v15 = v12;
        }
        id v16 = v15;

        id v17 = v12;
        std::string::basic_string[abi:ne180100]<0>(v41, (char *)[v17 UTF8String]);
        v18 = std::__hash_table<std::__hash_value_type<std::string,ik::E5BufferTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::E5BufferTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::E5BufferTensor>>>::find<std::string>(p_tabooThresholds, (unsigned __int8 *)v41);
        long long v19 = v18;
        if (SHIBYTE(v42) < 0)
        {
          operator delete(v41[0]);
          if (v19)
          {
LABEL_12:
            [v11 confidence];
            BOOL v21 = v20 < *((float *)v19 + 10);
            goto LABEL_15;
          }
        }
        else if (v18)
        {
          goto LABEL_12;
        }
        BOOL v21 = 1;
LABEL_15:
        [v11 confidence];
        id v22 = (id)objc_msgSend(v6, "updateSignal:withSafe:withScore:", v16, v21);

        ++v10;
      }
      while (v7 != v10);
      uint64_t v23 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v7 = v23;
    }
    while (v23);
  }
}

- (void)updateSanitization:(id)a3 withAnalysisResult:(id)a4 forStyle:(unsigned int)a5 isChildPresent:(BOOL)a6
{
  int v6 = a6;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v46 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v51 = a4;
  unsigned int v9 = [v51 scoresForLabels];
  uint64_t v10 = [v9 allKeys];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
  v12 = self;
  if (!v11)
  {
    uint64_t v13 = 1;
    goto LABEL_61;
  }
  uint64_t v50 = *(void *)v57;
  LODWORD(v13) = 1;
  unint64_t v48 = v10;
  int v47 = v6;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v57 != v50) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      id v16 = [v51 scoresForLabels];
      long long v53 = [v16 objectForKeyedSubscript:v15];

      [v53 doubleValue];
      double v18 = v17;
      id v19 = v15;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v19 UTF8String]);
      int v52 = v13;
      uint64_t v20 = v11;
      unint64_t v21 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&self->_ivsThresholds.__table_.__p2_, (uint64_t)__p);
      int8x8_t value = (int8x8_t)v12->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (!*(void *)&value)
      {
        uint64_t v27 = 0;
        goto LABEL_29;
      }
      unint64_t v23 = v21;
      uint8x8_t v24 = (uint8x8_t)vcnt_s8(value);
      v24.i16[0] = vaddlv_u8(v24);
      unint64_t v25 = v24.u32[0];
      if (v24.u32[0] > 1uLL)
      {
        unint64_t v26 = v21;
        if (v21 >= *(void *)&value) {
          unint64_t v26 = v21 % *(void *)&value;
        }
      }
      else
      {
        unint64_t v26 = (*(void *)&value - 1) & v21;
      }
      uint64_t v28 = (uint64_t **)v12->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_[v26];
      if (!v28)
      {
        uint64_t v27 = 0;
LABEL_25:
        uint64_t v10 = v48;
        goto LABEL_28;
      }
      uint64_t v27 = *v28;
      if (!*v28) {
        goto LABEL_25;
      }
      while (1)
      {
        unint64_t v29 = v27[1];
        if (v29 == v23)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&self->_ivsThresholds.__table_.__p3_, (unsigned __int8 *)v27 + 16, (unsigned __int8 *)__p))goto LABEL_27; {
          goto LABEL_22;
          }
        }
        if (v25 > 1)
        {
          if (v29 >= *(void *)&value) {
            v29 %= *(void *)&value;
          }
        }
        else
        {
          v29 &= *(void *)&value - 1;
        }
        if (v29 != v26) {
          break;
        }
LABEL_22:
        uint64_t v27 = (uint64_t *)*v27;
        if (!v27) {
          goto LABEL_27;
        }
      }
      uint64_t v27 = 0;
LABEL_27:
      uint64_t v10 = v48;
      v12 = self;
LABEL_28:
      int v6 = v47;
LABEL_29:
      uint64_t v11 = v20;
      if (v55 < 0) {
        operator delete(__p[0]);
      }
      if (v27)
      {
        id v30 = v19;
        uint64_t v31 = v27[7];
        uint64_t v32 = v27[8];
        if (v31 == v32)
        {
LABEL_46:
          long long v36 = (double *)(v27 + 5);
          long long v37 = (int *)(v27 + 6);
        }
        else
        {
          uint64_t v33 = v27[7];
          do
          {
            if (*(unsigned char *)(v33 + 5)) {
              BOOL v34 = *(_DWORD *)v33 == a5;
            }
            else {
              BOOL v34 = 0;
            }
            if (v34 && *(unsigned __int8 *)(v33 + 4) == v6)
            {
              long long v36 = (double *)(v33 + 8);
              long long v37 = (int *)(v33 + 16);
              goto LABEL_50;
            }
            v33 += 24;
          }
          while (v33 != v32);
          while (*(unsigned char *)(v31 + 5) || *(_DWORD *)v31 != a5)
          {
            v31 += 24;
            if (v31 == v32) {
              goto LABEL_46;
            }
          }
          long long v36 = (double *)(v31 + 8);
          long long v37 = (int *)(v31 + 16);
        }
LABEL_50:
        int v39 = *v37;
        double v40 = *v36;
        id v41 = v30;
        if (v39)
        {
          if (v39 != 1) {
            std::__throw_bad_variant_access[abi:ne180100]();
          }
          uint64_t v38 = v18 < v40;
          v12 = self;
        }
        else
        {
          v12 = self;
          uint64_t v38 = +[SCMLHandler isImageSensitiveForLabel:v41 confidenceScore:*(void *)&v40 classificationMode:v18] ^ 1;
        }
      }
      else
      {
        uint64_t v38 = 1;
      }
      if (v12->_granularity != 1)
      {
        BOOL v42 = [NSString stringWithFormat:@"%@.%@", @"jwt", v19];
        *(float *)&double v43 = v18;
        id v44 = (id)[v46 updateSignal:v42 withSafe:v38 withScore:v43];
      }
      uint64_t v13 = v52 & v38;
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v11);
LABEL_61:

  if (v12->_granularity == 1) {
    id v45 = (id)[v46 updateSignal:kSCMLImageSanitizationSignalNSFWExplicit[0] withSafe:v13];
  }
}

- (id)sanitizePixelBuffer:(__CVBuffer *)a3 keepGoing:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = [[SCMLImageSanitizerRequest alloc] initWithPixelBuffer:a3];
  [(SCMLImageSanitizerRequest *)v8 setKeepGoing:v6];
  unsigned int v9 = [(SCMLImageSanitizer *)self sanitizeRequest:v8 error:a5];

  return v9;
}

- (id)sanitizeRequest:(id)a3 error:(id *)a4
{
  v43[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v41);
  uint64_t v7 = v41;
  uint64_t v8 = v7;
  os_signpost_id_t v9 = v42;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SCMLImageSanitizer.sanitizePixelBuffer", "", buf, 2u);
  }

  v40[0] = &unk_2709742E8;
  v40[1] = &v41;
  v40[3] = v40;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v43, (uint64_t)v40);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v40);
  memset(&v34, 0, sizeof(v34));
  if ([v6 isChildPresent])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "childPresent");
    std::vector<std::string>::pointer end = v34.__end_;
    if (v34.__end_ >= v34.__end_cap_.__value_)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<_NSRange>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v13) {
        unint64_t v13 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v14 = v13;
      }
      *(void *)long long v37 = &v34.__end_cap_;
      if (v14) {
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v34.__end_cap_, v14);
      }
      else {
        v15 = 0;
      }
      id v16 = &v15[24 * v12];
      *(void *)buf = v15;
      *(void *)&buf[8] = v16;
      long long v36 = &v15[24 * v14];
      long long v17 = *(_OWORD *)__p;
      *((void *)v16 + 2) = v33;
      *(_OWORD *)id v16 = v17;
      __p[1] = 0;
      std::string::size_type v33 = 0;
      __p[0] = 0;
      *(void *)&buf[16] = v16 + 24;
      std::vector<std::string>::__swap_out_circular_buffer(&v34, (std::__split_buffer<std::string> *)buf);
      double v18 = v34.__end_;
      std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)buf);
      v34.__end_ = v18;
      if (SHIBYTE(v33) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v11 = *(_OWORD *)__p;
      v34.__end_->__r_.__value_.__r.__words[2] = v33;
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v11;
      v34.__end_ = end + 1;
    }
  }
  scml::strJoin<std::vector<std::string>>((uint64_t *)&v34, (uint64_t)",", 1, __p);
  id v19 = +[SCMLLog imageAnalyzer];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 pixelBuffer]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 pixelBuffer]);
    int v22 = SHIBYTE(v33);
    unint64_t v23 = (void **)__p[0];
    int v24 = [v6 style];
    unint64_t v25 = __p;
    *(_DWORD *)buf = 134219010;
    if (v22 < 0) {
      unint64_t v25 = v23;
    }
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = Width;
    *(_WORD *)&buf[22] = 2048;
    long long v36 = (char *)Height;
    *(_WORD *)long long v37 = 2080;
    *(void *)&v37[2] = v25;
    __int16 v38 = 1024;
    int v39 = v24;
    _os_log_impl(&dword_25BF41000, v19, OS_LOG_TYPE_DEFAULT, "Begin sanitizePixelBuffer inst=%p width=%zu height=%zu attr=%s style=%u", buf, 0x30u);
  }

  id v31 = 0;
  unint64_t v26 = [(SCMLImageSanitizer *)self _sanitizeRequest:v6 error:&v31];
  id v27 = v31;
  if (v26)
  {
    uint64_t v28 = +[SCMLLog imageAnalyzer];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&buf[4] = v26;
      _os_log_impl(&dword_25BF41000, v28, OS_LOG_TYPE_DEFAULT, "End sanitizePixelBuffer %{private}@", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v29 = +[SCMLLog imageAnalyzer];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SCMLImageSanitizer sanitizeRequest:error:]((uint64_t)v27, v29);
    }

    if (a4) {
      *a4 = v27;
    }
  }

  if (SHIBYTE(v33) < 0) {
    operator delete(__p[0]);
  }
  *(void *)buf = &v34;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v41);

  return v26;
}

- (id)_sanitizeRequest:(id)a3 error:(id *)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v79 = a3;
  v74 = (__CVBuffer *)[v79 pixelBuffer];
  char v76 = [v79 keepGoing];
  uint64_t v4 = [[SCMLImageSanitization alloc] initWithGranularOutput:self->_granularity != 0];
  uint64_t v80 = v4;
  if ([v79 style] == 5) {
    goto LABEL_69;
  }
  if (v5)
  {
    uint64_t v6 = v5;
    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v95);
    uint64_t v7 = *(id *)v95;
    uint64_t v8 = v7;
    os_signpost_id_t v9 = v96;
    if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25BF41000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SCMLImageSanitizer.sanitizePixelBuffer.ivs", "", buf, 2u);
    }

    v94[0] = &unk_270973460;
    v94[1] = v95;
    v94[3] = v94;
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v97, (uint64_t)v94);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v94);
    handler = self->_handler;
    id v83 = 0;
    long long v11 = [(SCMLHandler *)handler analyzePixelBuffer:v74 error:&v83];
    id v12 = v83;
    if (v12)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      scml::makeException("Failed to compute IVS", 0x15uLL, v12, (uint64_t)exception);
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    -[SCMLImageSanitizer updateSanitization:withAnalysisResult:forStyle:isChildPresent:](self, "updateSanitization:withAnalysisResult:forStyle:isChildPresent:", v80, v11, [v79 style], objc_msgSend(v79, "isChildPresent"));
    if ((v76 & 1) == 0 && ![(SCMLImageSanitization *)v80 safe])
    {
      v68 = v80;

      goto LABEL_75;
    }

    scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v95);
    uint64_t v4 = v80;
    uint64_t v5 = v6;
  }
  uint64_t v78 = v5;
  if ((v5 & 0xC) == 0)
  {
LABEL_61:
    if ((v78 & 2) == 0)
    {
LABEL_69:
      v66 = v4;
      goto LABEL_70;
    }
    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v95);
    char v55 = *(id *)v95;
    long long v56 = v55;
    os_signpost_id_t v57 = v96;
    if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25BF41000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v57, "SCMLImageSanitizer.sanitizePixelBuffer.taboo", "", buf, 2u);
    }

    v88[0] = &unk_270974468;
    v88[1] = v95;
    v88[3] = v88;
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v97, (uint64_t)v88);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v88);
    long long v58 = self->_vnSession;
    id v59 = objc_alloc(MEMORY[0x263F1EF40]);
    v61 = unint64_t v60 = (_anonymous_namespace_ *)(id)[v59 initWithCVPixelBuffer:v74 options:MEMORY[0x263EFFA78] session:v58];
    *(void *)buf = v61;
    std::string::size_type v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
    id v91 = 0;
    char v63 = [(_anonymous_namespace_ *)v60 performRequests:v62 error:&v91];
    id v64 = v91;

    if ((v63 & 1) == 0)
    {
      uint64_t v73 = __cxa_allocate_exception(0x10uLL);
      scml::makeException("Failed vision request", 0x15uLL, v64, (uint64_t)v73);
      __cxa_throw(v73, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    v65 = [v61 results];

    [(SCMLImageSanitizer *)self updateSanitization:v80 withObservations:v65];
    if ((v76 & 1) != 0 || [(SCMLImageSanitization *)v80 safe])
    {

      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v95);
      uint64_t v4 = v80;
      goto LABEL_69;
    }
    v69 = v80;

LABEL_75:
    v70 = v95;
    goto LABEL_77;
  }
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v91);
  unint64_t v13 = v91;
  unint64_t v14 = v13;
  os_signpost_id_t v15 = v92;
  if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v95 = 0;
    _os_signpost_emit_with_name_impl(&dword_25BF41000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SCMLImageSanitizer.sanitizePixelBuffer.clip", "", v95, 2u);
  }

  v90[0] = &unk_270974368;
  v90[1] = &v91;
  v90[3] = v90;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v93, (uint64_t)v90);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v90);
  id v16 = [v79 embeddings];
  memset(v81, 0, sizeof(v81));
  int v82 = 1065353216;
  *(_OWORD *)buf = 0u;
  memset(v102, 0, sizeof(v102));
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:buf objects:v95 count:16];
  if (v18)
  {
    uint64_t v19 = **(void **)&v102[0];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (**(void **)&v102[0] != v19) {
          objc_enumerationMutation(v17);
        }
        unint64_t v21 = *(void **)(*(void *)&buf[8] + 8 * i);
        scml::ClipImageEncoder::toEmbeddingVec(v21, (uint64_t)__p);
        unint64_t v84 = 0;
        unint64_t v84 = [v21 version];
        v85 = &v84;
        int v22 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::__emplace_unique_key_args<MADUnifiedEmbeddingVersion,std::piecewise_construct_t const&,std::tuple<MADUnifiedEmbeddingVersion const&>,std::tuple<>>((uint64_t)v81, &v84, (uint64_t)&std::piecewise_construct, (uint64_t **)&v85);
        unint64_t v23 = (void *)v22[3];
        if (v23)
        {
          v22[4] = v23;
          operator delete(v23);
          v22[3] = 0;
          v22[4] = 0;
          v22[5] = 0;
        }
        *(_OWORD *)(v22 + 3) = *(_OWORD *)__p;
        v22[5] = v87;
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:buf objects:v95 count:16];
    }
    while (v18);
  }

  begin = (scml::ClipEmbeddingClassifier **)self->_clipEmbeddingClassifiers.__begin_;
  std::vector<std::string>::pointer end = (scml::ClipEmbeddingClassifier **)self->_clipEmbeddingClassifiers.__end_;
  uint64_t v4 = v80;
  if (begin == end)
  {
LABEL_60:
    std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::~__hash_table((uint64_t)v81);
    scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v91);
    goto LABEL_61;
  }
  v75 = (scml::ClipEmbeddingClassifier **)self->_clipEmbeddingClassifiers.__end_;
  while (1)
  {
    if (*begin) {
      BOOL v26 = ((unint64_t)*begin & v78) == 0;
    }
    else {
      BOOL v26 = 0;
    }
    if (v26) {
      goto LABEL_59;
    }
    v85 = 0;
    v85 = (unint64_t *)scml::ClipEmbeddingClassifier::embeddingVersion(begin[1]);
    id v27 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::find<MADUnifiedEmbeddingVersion>(v81, (unint64_t *)&v85);
    if (!v27)
    {
      scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)v95);
      uint64_t v28 = *(id *)v95;
      unint64_t v29 = v28;
      os_signpost_id_t v30 = v96;
      if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25BF41000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SCMLImageSanitizer.sanitizePixelBuffer.clip.embed", "", buf, 2u);
      }

      *(void *)buf = &off_2709743E8;
      *(void *)&buf[8] = v95;
      *((void *)&v102[0] + 1) = buf;
      std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v97, (uint64_t)buf);
      std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](buf);
      id v31 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::find<MADUnifiedEmbeddingVersion>(&self->_clipImageEncoders.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v85);
      if (!v31) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      scml::ClipImageEncoder::getEmbedding((scml::ClipImageEncoder *)v31[3], v74, (uint64_t)__p);
      scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v95);
      id v27 = std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::__emplace_unique_key_args<MADUnifiedEmbeddingVersion,MADUnifiedEmbeddingVersion const&,std::vector<float>>((uint64_t)v81, (unint64_t *)&v85, &v85, (uint64_t)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)buf);
    uint64_t v32 = *(id *)buf;
    std::string::size_type v33 = v32;
    os_signpost_id_t v34 = *(void *)&buf[8];
    if ((unint64_t)(*(void *)&buf[8] - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v95 = 0;
      _os_signpost_emit_with_name_impl(&dword_25BF41000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, "SCMLImageSanitizer.sanitizePixelBuffer.clip.classify", "", v95, 2u);
    }

    v89[0] = &off_2709734B8;
    v89[1] = buf;
    v89[3] = v89;
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v102, (uint64_t)v89);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v89);
    int v35 = [v79 style];
    id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v37 = v36;
    if ((v35 - 1) >= 4) {
      [v36 addObject:@"btn.ufsspsjtu_ibuf_hspvqt"];
    }
    __int16 v38 = (std::mutex **)begin[1];
    int v39 = v80;
    id v40 = v37;
    scml::ClipEmbeddingClassifier::predict(v38, v27 + 3, (uint64_t)v95);
    uint64_t v41 = scml::ClipEmbeddingClassifier::name((scml::ClipEmbeddingClassifier *)v38);
    uint64_t v42 = *(void *)(v41 + 8);
    if (*(char *)(v41 + 23) >= 0)
    {
      uint64_t v43 = *(unsigned __int8 *)(v41 + 23);
    }
    else
    {
      uint64_t v41 = *(void *)v41;
      uint64_t v43 = v42;
    }
    id v44 = scml::strToNSString(v41, v43);
    id v45 = +[SCMLImageLabelCoder instance];
    id v46 = [v45 encodeToP1:v44];

    os_signpost_id_t v47 = v96;
    if (v97[0] != v96)
    {
      uint64_t v48 = 0;
      unint64_t v49 = 0;
      do
      {
        uint64_t v50 = (uint64_t *)(v47 + v48);
        if (*((char *)v50 + 23) < 0) {
          uint64_t v50 = (uint64_t *)*v50;
        }
        id v51 = [NSString stringWithFormat:@"%@.%s", v46, v50];
        if ([v40 containsObject:v51]) {
          uint64_t v53 = 1;
        }
        else {
          uint64_t v53 = (*(void *)((char *)v98 + ((v49 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v49) & 1;
        }
        LODWORD(v52) = *((_DWORD *)v99 + v49);
        id v54 = [(SCMLImageSanitization *)v39 updateSignal:v51 withSafe:v53 withScore:v52];

        ++v49;
        os_signpost_id_t v47 = v96;
        v48 += 24;
      }
      while (v49 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v97[0] - v96) >> 3));
    }

    if (v99)
    {
      uint64_t v100 = v99;
      operator delete(v99);
    }
    if (v98) {
      operator delete(v98);
    }
    __p[0] = &v96;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

    if ((v76 & 1) == 0 && ![(SCMLImageSanitization *)v39 safe]) {
      break;
    }

    scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
    uint64_t v4 = v80;
    std::vector<std::string>::pointer end = v75;
LABEL_59:
    begin += 2;
    if (begin == end) {
      goto LABEL_60;
    }
  }
  v71 = v39;

  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)buf);
  std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::vector<float>>>>::~__hash_table((uint64_t)v81);
  v70 = (uint8_t *)&v91;
LABEL_77:
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)v70);
  uint64_t v4 = v80;
LABEL_70:

  return v80;
}

- (id)sanitizePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v6 = [[SCMLImageSanitizerRequest alloc] initWithPixelBuffer:a3];
  uint64_t v7 = [(SCMLImageSanitizer *)self sanitizeRequest:v6 error:a4];

  return v7;
}

- (void).cxx_destruct
{
  next = self->_ivsThresholds.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      uint64_t v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  int8x8_t value = self->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_;
  self->_ivsThresholds.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_tabooThresholds);
  std::__hash_table<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::__unordered_map_hasher<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::hash<MADUnifiedEmbeddingVersion>,std::equal_to<MADUnifiedEmbeddingVersion>,true>,std::__unordered_map_equal<MADUnifiedEmbeddingVersion,std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>,std::equal_to<MADUnifiedEmbeddingVersion>,std::hash<MADUnifiedEmbeddingVersion>,true>,std::allocator<std::__hash_value_type<MADUnifiedEmbeddingVersion,std::unique_ptr<scml::ClipImageEncoder>>>>::~__hash_table((uint64_t)&self->_clipImageEncoders);
  p_clipEmbeddingClassifiers = &self->_clipEmbeddingClassifiers;
  std::vector<std::pair<unsigned long,std::unique_ptr<scml::ClipEmbeddingClassifier>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_clipEmbeddingClassifiers);
  objc_storeStrong((id *)&self->_vnSession, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  return self;
}

- (void)initWithConfiguration:error:
{
}

- (uint64_t)initWithConfiguration:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)sanitizeRequest:error:
{
}

- (uint64_t)sanitizeRequest:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_sanitizeRequest:error:
{
}

- (uint64_t)_sanitizeRequest:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End SCMLImageSanitizer init with error: %s", (uint8_t *)&v4, 0xCu);
}

- (void)sanitizeRequest:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "End sanitizePixelBuffer with error: %@", (uint8_t *)&v2, 0xCu);
}

@end