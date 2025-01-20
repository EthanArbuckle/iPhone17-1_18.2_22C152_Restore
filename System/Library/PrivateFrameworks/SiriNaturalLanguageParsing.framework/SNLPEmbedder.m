@interface SNLPEmbedder
+ (const)getTokenCleanValueString:(id)a3 error:(id *)a4;
+ (id)convertCppSubwordTokenChainToObjC:(SubwordTokenChain *)a3;
- (id).cxx_construct;
- (id)getEmbeddings:(id)a3;
- (id)getEmbeddingsBySentence:(id)a3;
- (id)getEmbeddingsBySentenceWithError:(id)a3 error:(id *)a4;
- (id)getEmbeddingsWithError:(id)a3 error:(id *)a4;
- (id)initFromAssetDirectoryURL:(id)a3;
- (id)initFromAssetDirectoryURLWithError:(id)a3 error:(id *)a4;
- (id)initFromSourceVocabPath:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6;
- (id)initFromSourceVocabPathWithError:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6 error:(id *)a7;
- (void)warmup;
@end

@implementation SNLPEmbedder

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (id)getEmbeddings:(id)a3
{
  id v8 = 0;
  v3 = [(SNLPEmbedder *)self getEmbeddingsWithError:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    v5 = SNLPOSLoggerForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_ERROR, "OWL error in : getEmbeddings", v7, 2u);
    }
  }
  return v3;
}

- (id)getEmbeddingsWithError:(id)a3 error:(id *)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v4 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = SNLPOSLoggerForCategory(7);
  v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v65 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OWL Embeddings Overall", "", (uint8_t *)&buf, 2u);
  }

  id v8 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C8DA9000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embeddings Overall\"", (uint8_t *)&buf, 2u);
  }

  uint64_t v88 = 0;
  unint64_t v89 = 0;
  unint64_t v90 = 0;
  v9 = [v67 tokenChain];
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::reserve(&v88, [v9 tokensCount]);

  std::string::basic_string[abi:ne180100]<0>(&v87, "");
  std::string::basic_string[abi:ne180100]<0>(&v86, "");
  v10 = [v67 text];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    v12 = SNLPOSLoggerForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v67 text];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1C8DA9000, v12, OS_LOG_TYPE_DEBUG, "Incoming request.text: %@", (uint8_t *)&buf, 0xCu);
    }
    id v14 = [v67 text];
    uint64_t v15 = [v14 UTF8String];

    if (!v15)
    {
      v16 = SNLPOSLoggerForCategory(5);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v67 text];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1C8DA9000, v16, OS_LOG_TYPE_ERROR, "Bad request.text: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    MEMORY[0x1CB7755B0](&v87, v15);
    MEMORY[0x1CB7755B0](&v86, v15);
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v18 = [v67 tokenChain];
  id obj = [v18 tokens];

  uint64_t v19 = [obj countByEnumeratingWithState:&v82 objects:v105 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v83;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v83 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(id *)(*((void *)&v82 + 1) + 8 * i);
        v23 = objc_opt_class();
        id v81 = 0;
        v24 = (char *)[v23 getTokenCleanValueString:v22 error:&v81];
        id v25 = v81;
        v26 = v25;
        if (!v24)
        {
          if (a4) {
            *a4 = v25;
          }

          id v42 = 0;
          goto LABEL_85;
        }
        if (([v22 isWhitespace] & 1) == 0)
        {
          v27 = [v22 cleanValue];
          BOOL v28 = [v27 length] == 0;

          if (!v28)
          {
            std::string::basic_string[abi:ne180100]<0>(&buf, v24);
            *(void *)v93 = 0;
            *(void *)&v93[8] = [v22 begin];
            *(void *)&v93[16] = [v22 end];
            *(_WORD *)&v93[24] = 0;
            v93[26] = 0;
            memset(v94, 0, sizeof(v94));
            unint64_t v29 = v89;
            if (v89 >= v90)
            {
              uint64_t v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v89 - v88) >> 4);
              unint64_t v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) > 0x249249249249249) {
                std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
              }
              if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v90 - v88) >> 4) > v35) {
                unint64_t v35 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v90 - v88) >> 4);
              }
              if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v90 - v88) >> 4)) >= 0x124924924924924) {
                unint64_t v36 = 0x249249249249249;
              }
              else {
                unint64_t v36 = v35;
              }
              v79.__r_.__value_.__l.__size_ = (std::string::size_type)&v90;
              if (v36) {
                unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>>(v36);
              }
              else {
                uint64_t v37 = 0;
              }
              std::string::size_type v38 = v36 + 112 * v34;
              v78.__r_.__value_.__r.__words[0] = v36;
              v78.__r_.__value_.__l.__size_ = v38;
              v79.__r_.__value_.__r.__words[0] = v36 + 112 * v37;
              long long v39 = buf;
              *(void *)(v38 + 16) = v92;
              *(_OWORD *)std::string::size_type v38 = v39;
              uint64_t v92 = 0;
              long long buf = 0uLL;
              long long v40 = *(_OWORD *)v93;
              *(_OWORD *)(v38 + 35) = *(_OWORD *)&v93[11];
              *(_OWORD *)(v38 + 24) = v40;
              *(void *)(v38 + 64) = 0;
              *(void *)(v38 + 72) = 0;
              *(void *)(v38 + 56) = 0;
              *(_OWORD *)(v38 + 56) = *(_OWORD *)v94;
              *(void *)(v38 + 72) = *(void *)&v94[16];
              memset(v94, 0, 24);
              long long v41 = *(_OWORD *)&v94[40];
              *(_OWORD *)(v38 + 80) = *(_OWORD *)&v94[24];
              *(_OWORD *)(v38 + 96) = v41;
              v78.__r_.__value_.__r.__words[2] = v38 + 112;
              std::vector<nlv4_inference_orchestrator::orchestration::Token>::__swap_out_circular_buffer(&v88, &v78);
              unint64_t v33 = v89;
              std::__split_buffer<nlv4_inference_orchestrator::orchestration::Token>::~__split_buffer((uint64_t)&v78);
            }
            else
            {
              long long v30 = buf;
              *(void *)(v89 + 16) = v92;
              *(_OWORD *)unint64_t v29 = v30;
              uint64_t v92 = 0;
              long long buf = 0uLL;
              long long v31 = *(_OWORD *)&v93[11];
              *(_OWORD *)(v29 + 24) = *(_OWORD *)v93;
              *(_OWORD *)(v29 + 35) = v31;
              *(void *)(v29 + 64) = 0;
              *(void *)(v29 + 72) = 0;
              *(void *)(v29 + 56) = 0;
              *(_OWORD *)(v29 + 56) = *(_OWORD *)v94;
              *(void *)(v29 + 72) = *(void *)&v94[16];
              memset(v94, 0, 24);
              long long v32 = *(_OWORD *)&v94[40];
              *(_OWORD *)(v29 + 80) = *(_OWORD *)&v94[24];
              *(_OWORD *)(v29 + 96) = v32;
              unint64_t v33 = v29 + 112;
            }
            unint64_t v89 = v33;
            v78.__r_.__value_.__r.__words[0] = (std::string::size_type)v94;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
            if (SHIBYTE(v92) < 0) {
              operator delete((void *)buf);
            }
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v82 objects:v105 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v78, v87.__r_.__value_.__l.__data_, v87.__r_.__value_.__l.__size_);
  }
  else {
    std::string v78 = v87;
  }
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v79, v86.__r_.__value_.__l.__data_, v86.__r_.__value_.__l.__size_);
  }
  else {
    std::string v79 = v86;
  }
  memset(v80, 0, sizeof(v80));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v80, v88, v89, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v89 - v88) >> 4));
  uint64_t v43 = *(void *)(*((void *)self->_cppOrchestrator.__ptr_.__value_ + 23) + 8);
  (*(void (**)(uint64_t))(*(void *)v43 + 56))(v43);
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddings((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)&v78, (uint64_t)&buf);
  id v44 = objc_alloc_init(MEMORY[0x1E4FA2A30]);
  objc_msgSend(v44, "setValues:count:");
  [v44 setNumToken:*(void *)v93];
  [v44 setNumLayer:*(void *)&v93[8]];
  [v44 setEmbeddingDim:*(void *)&v93[16]];
  if (v94[15] >= 0) {
    v45 = &v93[24];
  }
  else {
    v45 = *(unsigned char **)&v93[24];
  }
  v46 = [NSString stringWithUTF8String:v45];
  [v44 setEmbedderId:v46];

  id v42 = objc_alloc_init(MEMORY[0x1E4FA29E8]);
  [v42 setEmbeddingTensor:v44];
  v47 = [v67 tokenChain];
  [v42 setTokenChain:v47];

  [v42 setNumToken:*(void *)v93];
  [v42 setNumLayer:*(void *)&v93[8]];
  [v42 setEmbeddingDim:*(void *)&v93[16]];
  v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v48 = objc_alloc_init(MEMORY[0x1E4FA29F0]);
  [v48 setEmbeddingTensor:v44];
  [v48 setEmbeddingDim:*(void *)&v93[16]];
  if (v103)
  {
    id v49 = objc_alloc_init(MEMORY[0x1E4FA2A30]);
    if (!v103) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    *(void *)v72 = 0;
    v73 = 0;
    uint64_t v74 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v72, v98, v99, (v99 - (uint64_t)v98) >> 2);
    long long v75 = v100;
    uint64_t v76 = v101;
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __s;
    }
    objc_msgSend(v49, "setValues:count:");
    [v49 setNumToken:(void)v75];
    [v49 setNumLayer:*((void *)&v75 + 1)];
    [v49 setEmbeddingDim:v76];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v51 = [NSString stringWithUTF8String:p_p];
    [v49 setEmbedderId:v51];

    [v48 setSentenceEmbeddingTensor:v49];
    [v42 setSentenceEmbeddingTensor:v49];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (*(void *)v72)
    {
      v73 = *(void **)v72;
      operator delete(*(void **)v72);
    }
  }
  [v70 addObject:v48];
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v53 = objc_alloc_init(MEMORY[0x1E4FA29F0]);
  if (v97)
  {
    id v54 = objc_alloc_init(MEMORY[0x1E4FA2A30]);
    if (!v97) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    *(void *)v72 = 0;
    v73 = 0;
    uint64_t v74 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v72, *(const void **)&v94[16], *(uint64_t *)&v94[24], (uint64_t)(*(void *)&v94[24] - *(void *)&v94[16]) >> 2);
    long long v75 = *(_OWORD *)&v94[40];
    uint64_t v76 = v95;
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v96.__r_.__value_.__l.__data_, v96.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v96;
    }
    objc_msgSend(v54, "setValues:count:");
    [v54 setNumToken:(void)v75];
    [v54 setNumLayer:*((void *)&v75 + 1)];
    [v54 setEmbeddingDim:v76];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v55 = &__p;
    }
    else {
      v55 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v56 = [NSString stringWithUTF8String:v55];
    [v54 setEmbedderId:v56];

    [v53 setEmbeddingTensor:v54];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (*(void *)v72)
    {
      v73 = *(void **)v72;
      operator delete(*(void **)v72);
    }
  }
  [v52 addObject:v53];
  [v42 setSubwordEmbeddingTensorOutputs:v52];
  [v42 setEmbeddingTensorOutputs:v70];
  MEMORY[0x1CB773E80](v71, &v104);
  v57 = +[SNLPEmbedder convertCppSubwordTokenChainToObjC:v71];
  MEMORY[0x1CB773EA0](v71);
  v58 = [v67 tokenChain];
  v59 = [v58 locale];
  [v57 setLocale:v59];

  [v42 setSubwordTokenChain:v57];
  v60 = SNLPOSLoggerForCategory(7);
  v61 = v60;
  if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)v72 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v61, OS_SIGNPOST_INTERVAL_END, spid, "OWL Embeddings Overall", "", v72, 2u);
  }

  v62 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_1C8DA9000, v62, OS_LOG_TYPE_DEFAULT, "END \"OWL Embeddings Overall\"", v72, 2u);
  }

  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&buf);
  *(void *)&long long buf = v80;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v79.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v78.__r_.__value_.__l.__data_);
  }
LABEL_85:
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v86.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v87.__r_.__value_.__l.__data_);
  }
  *(void *)&long long buf = &v88;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);

  return v42;
}

- (id)getEmbeddingsBySentence:(id)a3
{
  id v8 = 0;
  v3 = [(SNLPEmbedder *)self getEmbeddingsBySentenceWithError:a3 error:&v8];
  id v4 = v8;
  if (v4)
  {
    os_signpost_id_t v5 = SNLPOSLoggerForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_ERROR, "OWL error in : getEmbeddingsBySentence", v7, 2u);
    }
  }
  return v3;
}

- (id)getEmbeddingsBySentenceWithError:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  unint64_t v58 = 0;
  uint64_t v57 = 0;
  unint64_t v59 = 0;
  id v41 = a3;
  os_signpost_id_t v5 = [v41 tokenChain];
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::reserve(&v57, [v5 tokensCount]);

  std::string::basic_string[abi:ne180100]<0>(&__s, "");
  std::string::basic_string[abi:ne180100]<0>(&v55, "");
  v6 = [v41 text];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    id v8 = [v41 text];
    MEMORY[0x1CB7755B0](&__s, [v8 UTF8String]);

    id v9 = [v41 text];
    MEMORY[0x1CB7755B0](&v55, [v9 UTF8String]);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v10 = [v41 tokenChain];
  id obj = [v10 tokens];

  uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = objc_opt_class();
        id v50 = 0;
        v16 = (char *)[v15 getTokenCleanValueString:v14 error:&v50];
        id v17 = v50;
        v18 = v17;
        if (!v16)
        {
          if (a4) {
            *a4 = v17;
          }

          id v32 = 0;
          goto LABEL_41;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, v16);
        *(void *)v45 = 0;
        *(void *)&v45[8] = [v14 begin];
        *(void *)&v45[16] = [v14 end];
        *(_WORD *)&v45[24] = 0;
        v45[26] = 0;
        memset(v46, 0, 56);
        unint64_t v19 = v58;
        if (v58 >= v59)
        {
          uint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v58 - v57) >> 4);
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) > 0x249249249249249) {
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v59 - v57) >> 4) > v25) {
            unint64_t v25 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v59 - v57) >> 4);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v59 - v57) >> 4)) >= 0x124924924924924) {
            unint64_t v26 = 0x249249249249249;
          }
          else {
            unint64_t v26 = v25;
          }
          v48.__r_.__value_.__l.__size_ = (std::string::size_type)&v59;
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          std::string::size_type v28 = v26 + 112 * v24;
          v47.__r_.__value_.__r.__words[0] = v26;
          v47.__r_.__value_.__l.__size_ = v28;
          v48.__r_.__value_.__r.__words[0] = v26 + 112 * v27;
          long long v29 = *(_OWORD *)__p;
          *(void *)(v28 + 16) = v44;
          *(_OWORD *)std::string::size_type v28 = v29;
          __p[1] = 0;
          uint64_t v44 = 0;
          __p[0] = 0;
          long long v30 = *(_OWORD *)v45;
          *(_OWORD *)(v28 + 35) = *(_OWORD *)&v45[11];
          *(_OWORD *)(v28 + 24) = v30;
          *(void *)(v28 + 64) = 0;
          *(void *)(v28 + 72) = 0;
          *(void *)(v28 + 56) = 0;
          *(_OWORD *)(v28 + 56) = v46[0];
          *(void *)(v28 + 72) = *(void *)&v46[1];
          memset(v46, 0, 24);
          long long v31 = *(_OWORD *)((char *)&v46[2] + 8);
          *(_OWORD *)(v28 + 80) = *(_OWORD *)((char *)&v46[1] + 8);
          *(_OWORD *)(v28 + 96) = v31;
          v47.__r_.__value_.__r.__words[2] = v28 + 112;
          std::vector<nlv4_inference_orchestrator::orchestration::Token>::__swap_out_circular_buffer(&v57, &v47);
          unint64_t v23 = v58;
          std::__split_buffer<nlv4_inference_orchestrator::orchestration::Token>::~__split_buffer((uint64_t)&v47);
        }
        else
        {
          long long v20 = *(_OWORD *)__p;
          *(void *)(v58 + 16) = v44;
          *(_OWORD *)unint64_t v19 = v20;
          __p[1] = 0;
          uint64_t v44 = 0;
          __p[0] = 0;
          long long v21 = *(_OWORD *)&v45[11];
          *(_OWORD *)(v19 + 24) = *(_OWORD *)v45;
          *(_OWORD *)(v19 + 35) = v21;
          *(void *)(v19 + 64) = 0;
          *(void *)(v19 + 72) = 0;
          *(void *)(v19 + 56) = 0;
          *(_OWORD *)(v19 + 56) = v46[0];
          *(void *)(v19 + 72) = *(void *)&v46[1];
          memset(v46, 0, 24);
          long long v22 = *(_OWORD *)((char *)&v46[2] + 8);
          *(_OWORD *)(v19 + 80) = *(_OWORD *)((char *)&v46[1] + 8);
          *(_OWORD *)(v19 + 96) = v22;
          unint64_t v23 = v19 + 112;
        }
        unint64_t v58 = v23;
        v47.__r_.__value_.__r.__words[0] = (std::string::size_type)v46;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
        if (SHIBYTE(v44) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v47, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else {
    std::string v47 = __s;
  }
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v48, v55.__r_.__value_.__l.__data_, v55.__r_.__value_.__l.__size_);
  }
  else {
    std::string v48 = v55;
  }
  memset(v49, 0, sizeof(v49));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v49, v57, v58, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v58 - v57) >> 4));
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddingsBySentence((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)&v47, (uint64_t)__p);
  id v33 = objc_alloc_init(MEMORY[0x1E4FA2A30]);
  objc_msgSend(v33, "setValues:count:");
  [v33 setNumToken:*(void *)v45];
  [v33 setNumLayer:*(void *)&v45[8]];
  [v33 setEmbeddingDim:*(void *)&v45[16]];
  if (v46[0] >= 0) {
    uint64_t v34 = &v45[24];
  }
  else {
    uint64_t v34 = *(unsigned char **)&v45[24];
  }
  unint64_t v35 = [NSString stringWithUTF8String:v34];
  [v33 setEmbedderId:v35];

  id v32 = objc_alloc_init(MEMORY[0x1E4FA29E8]);
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v37 = objc_alloc_init(MEMORY[0x1E4FA29F0]);
  [v37 setEmbeddingTensor:v33];
  [v37 setEmbeddingDim:*(void *)&v45[16]];
  [v36 addObject:v37];
  [v32 setEmbeddingTensorOutputs:v36];
  [v32 setEmbeddingTensor:v33];
  std::string::size_type v38 = [v41 tokenChain];
  [v32 setTokenChain:v38];

  [v32 setNumToken:*(void *)v45];
  [v32 setNumLayer:*(void *)&v45[8]];
  [v32 setEmbeddingDim:*(void *)&v45[16]];

  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse(__p);
  __p[0] = v49;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
LABEL_41:
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  __p[0] = &v57;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v32;
}

- (void)warmup
{
  v49[5] = *MEMORY[0x1E4F143B8];
  v3 = SNLPOSLoggerForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C8DA9000, v3, OS_LOG_TYPE_DEBUG, "Warming up SNLPEmbedder", (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&__sz, "hello");
  *(void *)&v32[8] = 0;
  *(void *)id v32 = 0;
  *(void *)&v32[16] = 5;
  *(_WORD *)&v32[24] = 0;
  v32[26] = 0;
  memset(v33, 0, sizeof(v33));
  std::string::basic_string[abi:ne180100]<0>(&v28, "world");
  *(_OWORD *)long long v29 = xmmword_1C8F38600;
  *(void *)&v29[16] = 11;
  *(_WORD *)&v29[24] = 0;
  v29[26] = 0;
  memset(v30, 0, sizeof(v30));
  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&buf, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
  }
  else {
    std::string buf = __sz;
  }
  *(_OWORD *)unint64_t v35 = *(_OWORD *)v32;
  *(_OWORD *)&v35[11] = *(_OWORD *)&v32[11];
  uint64_t v37 = 0;
  *(void *)&v35[32] = 0;
  uint64_t v36 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v35[32], v33[0], v33[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v33[1] - (char *)v33[0]) >> 3));
  long long v38 = *(_OWORD *)&v33[3];
  long long v39 = *(_OWORD *)&v33[5];
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v40, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  }
  else {
    std::string v40 = v28;
  }
  *(_OWORD *)id v41 = *(_OWORD *)v29;
  *(_OWORD *)&v41[11] = *(_OWORD *)&v29[11];
  memset(&v42, 0, sizeof(v42));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v42, v30[0], v30[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v30[1] - (char *)v30[0]) >> 3));
  long long v43 = *(_OWORD *)&v30[3];
  long long v44 = *(_OWORD *)&v30[5];
  unint64_t v26 = 0;
  uint64_t v27 = 0;
  unint64_t v25 = 0;
  *(void *)&long long v6 = &v25;
  BYTE8(v6) = 0;
  unint64_t v25 = (char *)operator new(0xE0uLL);
  unint64_t v26 = v25;
  uint64_t v27 = v25 + 224;
  uint64_t v4 = 0;
  unint64_t v26 = (unsigned char *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlv4_inference_orchestrator::orchestration::Token>,nlv4_inference_orchestrator::orchestration::Token const*,nlv4_inference_orchestrator::orchestration::Token const*,nlv4_inference_orchestrator::orchestration::Token*>((uint64_t)&v27, (uint64_t)&buf, (uint64_t)v45, (uint64_t)v25);
  do
  {
    *(void *)&long long v6 = (char *)&v42 + v4 * 8;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
    if (SHIBYTE(v40.__r_.__value_.__r.__words[v4 + 2]) < 0) {
      operator delete(*(void **)((char *)&v40.__r_.__value_.__l.__data_ + v4 * 8));
    }
    v4 -= 14;
  }
  while (v4 != -28);
  std::string::basic_string[abi:ne180100]<0>(v20, "hello world");
  std::string::basic_string[abi:ne180100]<0>(&v22, "hello world");
  memset(v24, 0, sizeof(v24));
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__init_with_size[abi:ne180100]<nlv4_inference_orchestrator::orchestration::Token*,nlv4_inference_orchestrator::orchestration::Token*>(v24, (uint64_t)v25, (uint64_t)v26, 0x6DB6DB6DB6DB6DB7 * ((v26 - v25) >> 4));
  memset(&buf, 0, sizeof(buf));
  v41[8] = 0;
  v41[16] = 0;
  v45[0] = 0;
  memset(v48, 0, sizeof(v48));
  long long v46 = 0u;
  memset(v47, 0, sizeof(v47));
  *(void *)&v35[24] = 0;
  uint64_t v36 = 0;
  *(void *)&v35[32] = 0;
  LOBYTE(v37) = 0;
  sirinluinternal::SubwordTokenChain::SubwordTokenChain((sirinluinternal::SubwordTokenChain *)v49);
  nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator::getEmbeddings((nlv4_inference_orchestrator::orchestration::EmbedderOrchestrator *)self->_cppOrchestrator.__ptr_.__value_, (const nlv4_inference_orchestrator::orchestration::EmbedderRequest *)v20, (uint64_t)&v6);
  if (buf.__r_.__value_.__r.__words[0])
  {
    buf.__r_.__value_.__l.__size_ = buf.__r_.__value_.__r.__words[0];
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v6;
  std::string::size_type v5 = v7;
  std::string::size_type v7 = 0;
  long long v6 = 0uLL;
  *(_OWORD *)unint64_t v35 = v8;
  buf.__r_.__value_.__r.__words[2] = v5;
  *(void *)&v35[16] = v9;
  if (SHIBYTE(v36) < 0) {
    operator delete(*(void **)&v35[24]);
  }
  *(_OWORD *)&v35[24] = v10;
  uint64_t v36 = v11;
  HIBYTE(v11) = 0;
  LOBYTE(v10) = 0;
  std::__optional_storage_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>>((uint64_t)&v37, (uint64_t)&v12);
  std::__optional_storage_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<nlv4_inference_orchestrator::orchestration::EmbeddingTensor,false>>((uint64_t)&v41[16], (uint64_t)&v13);
  if (SHIBYTE(v47[0]) < 0) {
    operator delete((void *)v46);
  }
  long long v46 = v14;
  v47[0] = v15;
  HIBYTE(v15) = 0;
  LOBYTE(v14) = 0;
  if (SHIBYTE(v47[3]) < 0) {
    operator delete((void *)v47[1]);
  }
  *(_OWORD *)&v47[1] = v16;
  v47[3] = v17;
  HIBYTE(v17) = 0;
  LOBYTE(v16) = 0;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__vdeallocate(v48);
  v48[0] = v18;
  *(_OWORD *)&v48[1] = v19;
  long long v19 = 0uLL;
  v18 = 0;
  sirinluinternal::SubwordTokenChain::operator=();
  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&v6);
  nlv4_inference_orchestrator::orchestration::EmbedderResponse::~EmbedderResponse((void **)&buf.__r_.__value_.__l.__data_);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v25;
  std::vector<nlv4_inference_orchestrator::orchestration::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__sz.__r_.__value_.__l.__data_);
  }
}

- (id)initFromSourceVocabPath:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6
{
  id v12 = 0;
  id v6 = [(SNLPEmbedder *)self initFromSourceVocabPathWithError:a3 bertModelPath:a4 bertConfigPath:a5 reformulatorPath:a6 error:&v12];
  id v7 = v12;
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = SNLPOSLoggerForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_ERROR, "OWL error in : initFromSourceVocabPath", v11, 2u);
    }
  }
  return v8;
}

- (id)initFromSourceVocabPathWithError:(id)a3 bertModelPath:(id)a4 bertConfigPath:(id)a5 reformulatorPath:(id)a6 error:(id *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v20 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SNLPEmbedder;
  [(SNLPEmbedder *)&v26 init];
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)[v11 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)[v20 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&v23, (char *)[v12 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v13 UTF8String]);
  long long v14 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  long long v16 = SNLPOSLoggerForCategory(7);
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)std::string buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "OWL Embedder Orchestrator Init", "", buf, 2u);
  }

  v18 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C8DA9000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embedder Orchestrator Init\"", buf, 2u);
  }

  operator new();
}

- (id)initFromAssetDirectoryURL:(id)a3
{
  id v9 = 0;
  id v3 = [(SNLPEmbedder *)self initFromAssetDirectoryURLWithError:a3 error:&v9];
  id v4 = v9;
  id v5 = v3;
  if (v4)
  {
    id v6 = SNLPOSLoggerForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C8DA9000, v6, OS_LOG_TYPE_ERROR, "OWL error in : initFromAssetDirectoryURL", v8, 2u);
    }
  }
  return v5;
}

- (id)initFromAssetDirectoryURLWithError:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SNLPEmbedder;
  [(SNLPEmbedder *)&v14 init];
  *(void *)std::string buf = [v5 fileSystemRepresentation];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, (char **)buf);
  id v6 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = SNLPOSLoggerForCategory(7);
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)std::string buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "OWL Embedder Orchestrator Init", "", buf, 2u);
  }

  long long v10 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"OWL Embedder Orchestrator Init\"", buf, 2u);
  }

  operator new();
}

+ (const)getTokenCleanValueString:(id)a3 error:(id *)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 hasCleanValue]
    || ([v5 cleanValue], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    if (a4)
    {
      long long v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28588];
      v27[0] = *MEMORY[0x1E4F28568];
      v27[1] = v17;
      v28[0] = @"Encountered a token without a clean value";
      v28[1] = @"Encountered a token without a clean value";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      *a4 = [v16 errorWithDomain:@"SNLPNaturalLanguageParserErrorDomain" code:2 userInfo:v18];
LABEL_10:
    }
LABEL_11:
    id v8 = 0;
    goto LABEL_12;
  }
  id v7 = [v5 cleanValue];
  id v8 = (const char *)[v7 UTF8String];

  if (!v8)
  {
    if (a4)
    {
      id v9 = [MEMORY[0x1E4F28E78] string];
      for (unint64_t i = 0; ; ++i)
      {
        id v11 = [v5 cleanValue];
        unint64_t v12 = [v11 length];

        if (i >= v12) {
          break;
        }
        id v13 = [v5 cleanValue];
        unsigned int v14 = [v13 characterAtIndex:i];

        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"[%x]", v14);
        [v9 appendString:v15];
      }
      id v20 = NSString;
      id v18 = v9;
      char v21 = objc_msgSend(v20, "stringWithFormat:", @"Hit invalid token clean value: %s", objc_msgSend(v18, "UTF8String"));
      long long v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28588];
      v25[0] = *MEMORY[0x1E4F28568];
      v25[1] = v23;
      v26[0] = v21;
      v26[1] = v21;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      *a4 = [v22 errorWithDomain:@"SNLPNaturalLanguageParserErrorDomain" code:2 userInfo:v24];

      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

+ (id)convertCppSubwordTokenChainToObjC:(SubwordTokenChain *)a3
{
}

@end