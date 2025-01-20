@interface UPParserModel
+ (UPParserModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4;
- (NSLocale)locale;
- (UPInferenceResult)forwardWithSpanLabels:(SEL)a3 embeddings:(UPGenericTensor *)a4 utterance:(UPGenericTensor *)a5;
- (UPLoadedModelConfiguration)_loadedModelConfiguration;
- (UPModelIdentifier)identifier;
- (UPParserModel)initWithLoadedModelConfiguration:(id)a3;
- (UPPreprocessor)preprocessor;
- (UPUsoSerializer)_usoSerializer;
- (id)_candidateForBeamSequence:(const void *)a3 utterance:(const void *)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7;
- (id)_candidateForUtterance:(const void *)a3 probability:(float)a4 labelledSpans:(const void *)a5 intent:(id)a6 sharedEntityResolution:(id)a7;
- (id)_resultFromInferenceResult:(const void *)a3 query:(id)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7;
- (id)predictionFromQuery:(id)a3 error:(id *)a4;
- (id)predictionFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5;
@end

@implementation UPParserModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadedModelConfiguration, 0);
  objc_storeStrong((id *)&self->__usoSerializer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UPLoadedModelConfiguration)_loadedModelConfiguration
{
  return self->__loadedModelConfiguration;
}

- (UPUsoSerializer)_usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 16, 1);
}

- (UPModelIdentifier)identifier
{
  return self->_identifier;
}

- (UPPreprocessor)preprocessor
{
  return [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration preprocessor];
}

- (NSLocale)locale
{
  return [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration locale];
}

- (id)predictionFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = SNLPOSLoggerForCategory(7);
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UaaP Prediction", "", buf, 2u);
  }

  v13 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Prediction\"", buf, 2u);
  }

  v14 = [UPSharedEntityResolution alloc];
  v15 = [v7 spans];
  v16 = [(UPSharedEntityResolution *)v14 initWithMatchingSpans:v15];

  uint64_t v17 = [v8 spanLabelsTensor];
  v31 = 0;
  v32 = 0;
  uint64_t v33 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v31, *(const void **)v17, *(void *)(v17 + 8), (uint64_t)(*(void *)(v17 + 8) - *(void *)v17) >> 3);
  v34 = 0;
  v35 = 0;
  uint64_t v36 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v34, *(const void **)(v17 + 24), *(void *)(v17 + 32), (uint64_t)(*(void *)(v17 + 32) - *(void *)(v17 + 24)) >> 2);
  uint64_t v18 = [v8 embeddingsTensor];
  v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v25, *(const void **)v18, *(void *)(v18 + 8), (uint64_t)(*(void *)(v18 + 8) - *(void *)v18) >> 3);
  __p = 0;
  v29 = 0;
  uint64_t v30 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(v18 + 24), *(void *)(v18 + 32), (uint64_t)(*(void *)(v18 + 32) - *(void *)(v18 + 24)) >> 2);
  v19 = [v7 utterance];
  [(UPParserModel *)self forwardWithSpanLabels:&v31 embeddings:&v25 utterance:v19];

  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  if (v25)
  {
    v26 = v25;
    operator delete(v25);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  v20 = -[UPParserModel _resultFromInferenceResult:query:outputTokens:resolver:sharedEntityResolution:](self, "_resultFromInferenceResult:query:outputTokens:resolver:sharedEntityResolution:", buf, v7, [v8 outputTokens], -[UPLoadedModelConfiguration resolver](self->__loadedModelConfiguration, "resolver"), v16);
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (*(void *)buf)
  {
    v38 = *(void **)buf;
    operator delete(*(void **)buf);
  }
  v21 = SNLPOSLoggerForCategory(7);
  v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v22, OS_SIGNPOST_INTERVAL_END, v10, "UaaP Prediction", "", buf, 2u);
  }

  v23 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v23, OS_LOG_TYPE_DEFAULT, "END \"UaaP Prediction\"", buf, 2u);
  }

  return v20;
}

- (id)_candidateForBeamSequence:(const void *)a3 utterance:(const void *)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v38 = a7;
  id v12 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration intentVocabPath];
  std::string::basic_string[abi:ne180100]<0>(v55, (char *)[v12 UTF8String]);
  id v13 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration bioLabelsVocabPath];
  std::string::basic_string[abi:ne180100]<0>(&v57, (char *)[v13 UTF8String]);
  memset(v59, 0, sizeof(v59));
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(v59, *(long long **)a5, *((long long **)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 4));

  uint64_t v48 = *((void *)a3 + 2);
  uint64_t v49 = 0;
  v50 = 0;
  uint64_t v51 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v49, *((const void **)a3 + 7), *((void *)a3 + 8), (uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 3);
  v52 = 0;
  v53 = 0;
  uint64_t v54 = 0;
  std::vector<std::optional<unsigned long>>::__init_with_size[abi:ne180100]<std::optional<unsigned long>*,std::optional<unsigned long>*>(&v52, *((const void **)a3 + 13), *((void *)a3 + 14), (uint64_t)(*((void *)a3 + 14) - *((void *)a3 + 13)) >> 4);
  nl_featurization::postprocessing::base::postProcessBaseModel((long long **)v55, (const nl_featurization::postprocessing::base::BaseModelQueryContext *)&v48, &v45);
  v14 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = 0x4EC4EC4EC4EC4EC5 * ((v47 - v46) >> 3);
    _os_log_impl(&dword_1C8DA9000, v14, OS_LOG_TYPE_DEBUG, "%ld", (uint8_t *)&buf, 0xCu);
  }

  v37 = (double *)a3;
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  unint64_t v44 = 0;
  uint64_t v16 = v46;
  for (uint64_t i = v47; v16 != i; v16 += 104)
  {
    u16Substring((uint64_t *)a4, *(void *)(v16 + 16), *(void *)(v16 + 24), &v41);
    uaap_orchestration::resolution::Resolver::lookupSemanticValueForLabel(a6, (unsigned __int16 *)(v16 + 32), (unsigned __int16 *)&v41, &__p);
    if (v40)
    {
      long long buf = *(_OWORD *)v16;
      long long v66 = *(_OWORD *)(v16 + 16);
      if (*(char *)(v16 + 55) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(&v67, *(const std::basic_string<char16_t>::value_type **)(v16 + 32), *(void *)(v16 + 40));
      }
      else
      {
        long long v17 = *(_OWORD *)(v16 + 32);
        v67.__r_.__value_.__r.__words[2] = *(void *)(v16 + 48);
        *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v17;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::basic_string<char16_t>::__init_copy_ctor_external(&v68, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::basic_string<char16_t> v68 = __p;
      }
      unsigned __int8 v69 = 1;
      uint64_t v20 = *(void *)(v16 + 88);
      char v71 = *(unsigned char *)(v16 + 96);
      uint64_t v70 = v20;
      unint64_t v21 = v43;
      if (v43 >= v44)
      {
        uint64_t v24 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v43 - v42) >> 3);
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) > 0x276276276276276) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        if (0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3) > v25) {
          unint64_t v25 = 0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3);
        }
        if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v44 - v42) >> 3)) >= 0x13B13B13B13B13BLL) {
          unint64_t v26 = 0x276276276276276;
        }
        else {
          unint64_t v26 = v25;
        }
        v64 = &v44;
        if (v26) {
          unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v26);
        }
        else {
          uint64_t v27 = 0;
        }
        unint64_t v60 = v26;
        uint64_t v61 = v26 + 104 * v24;
        uint64_t v62 = v61;
        unint64_t v63 = v26 + 104 * v27;
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v61, (uint64_t)&buf);
        v62 += 104;
        std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(&v42, &v60);
        unint64_t v22 = v43;
        std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&v60);
        int v23 = v69;
      }
      else
      {
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v43, (uint64_t)&buf);
        unint64_t v22 = v21 + 104;
        int v23 = 1;
      }
      unint64_t v43 = v22;
      if (v23 && SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v68.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v67.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      unint64_t v18 = v43;
      if (v43 >= v44)
      {
        uint64_t v28 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v43 - v42) >> 3);
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) > 0x276276276276276) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        if (0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3) > v29) {
          unint64_t v29 = 0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3);
        }
        if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v44 - v42) >> 3)) >= 0x13B13B13B13B13BLL) {
          unint64_t v30 = 0x276276276276276;
        }
        else {
          unint64_t v30 = v29;
        }
        v67.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v44;
        if (v30) {
          unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v30);
        }
        else {
          uint64_t v31 = 0;
        }
        *(void *)&long long buf = v30;
        *((void *)&buf + 1) = v30 + 104 * v28;
        *(void *)&long long v66 = *((void *)&buf + 1);
        *((void *)&v66 + 1) = v30 + 104 * v31;
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan const&>(*((uint64_t *)&buf + 1), v16);
        *(void *)&long long v66 = v66 + 104;
        std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(&v42, &buf);
        unint64_t v19 = v43;
        std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&buf);
      }
      else
      {
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan const&>(v43, v16);
        unint64_t v19 = v18 + 104;
      }
      unint64_t v43 = v19;
    }
    if (v40 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v41.__r_.__value_.__l.__data_);
    }
  }
  double v32 = *v37;
  uint64_t v33 = +[UPUtilities stdU16ToNSString:&v45];
  *(float *)&double v34 = v32;
  v35 = [(UPParserModel *)self _candidateForUtterance:a4 probability:&v42 labelledSpans:v33 intent:v38 sharedEntityResolution:v34];

  *(void *)&long long buf = &v42;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  *(void *)&long long buf = &v46;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  *(void *)&long long buf = v59;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v58 < 0) {
    operator delete(v57);
  }
  if (v56 < 0) {
    operator delete(v55[0]);
  }

  return v35;
}

- (id)_resultFromInferenceResult:(const void *)a3 query:(id)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v92 = a4;
  id v97 = a7;
  v9 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = SNLPOSLoggerForCategory(7);
  id v12 = v11;
  os_signpost_id_t spid = v10;
  unint64_t v88 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UaaP Post-Processing", "", buf, 2u);
  }

  id v13 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8DA9000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Post-Processing\"", buf, 2u);
  }

  v14 = [v92 utterance];
  +[UPUtilities nSStringToU16String:v14];

  v15 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration beamMaskInput];
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15[1] - *v15) >> 3);
  std::basic_string<char16_t> __p = 0;
  v106 = 0;
  v107 = 0;
  std::vector<double>::reserve(&__p, v16);
  long long v17 = (float *)*((void *)a3 + 3);
  unint64_t v18 = (float *)*((void *)a3 + 4);
  if (v17 != v18)
  {
    unint64_t v19 = v106;
    do
    {
      double v20 = *v17;
      if (v19 >= v107)
      {
        unint64_t v22 = (double *)__p;
        uint64_t v23 = ((char *)v19 - (unsigned char *)__p) >> 3;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v25 = (char *)v107 - (unsigned char *)__p;
        if (((char *)v107 - (unsigned char *)__p) >> 2 > v24) {
          unint64_t v24 = v25 >> 2;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26)
        {
          uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v107, v26);
          unint64_t v22 = (double *)__p;
          unint64_t v19 = v106;
        }
        else
        {
          uint64_t v27 = 0;
        }
        uint64_t v28 = (double *)&v27[8 * v23];
        *uint64_t v28 = v20;
        unint64_t v21 = v28 + 1;
        while (v19 != v22)
        {
          uint64_t v29 = *((void *)v19-- - 1);
          *((void *)v28-- - 1) = v29;
        }
        std::basic_string<char16_t> __p = v28;
        v106 = v21;
        v107 = (double *)&v27[8 * v26];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        double *v19 = v20;
        unint64_t v21 = v19 + 1;
      }
      v106 = v21;
      ++v17;
      unint64_t v19 = v21;
    }
    while (v17 != v18);
  }
  uint64_t v31 = *(void *)a5;
  uint64_t v30 = *((void *)a5 + 1);
  double v32 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration beamMaskInput];
  uint64_t v96 = v32[4];
  uint64_t v95 = v32[3];
  uint64_t v102 = 0;
  v103 = 0;
  unint64_t v104 = 0;
  if ((unint64_t)(v30 - v31 + 47) >= 0x5F)
  {
    if ((unint64_t)((v30 - v31) / 48) > 0xAAAAAAAAAAAAAAALL) {
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    }
    v114 = &v104;
    *(void *)long long buf = std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((v30 - v31) / 48);
    v111 = *(double **)buf;
    v112 = *(double **)buf;
    uint64_t v113 = *(void *)buf + 24 * v33;
    std::vector<std::vector<unsigned long>>::__swap_out_circular_buffer(&v102, buf);
    std::__split_buffer<std::vector<unsigned long>>::~__split_buffer((uint64_t)buf);
  }
  uint64_t v90 = v30;
  unint64_t v91 = (v30 - v31) / 48;
  uint64_t v89 = v31;
  if (v30 != v31)
  {
    uint64_t v34 = 0;
    unint64_t v35 = (v96 - v95) >> 3;
    if (v35 <= 1) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = (v96 - v95) >> 3;
    }
    uint64_t v37 = (v30 - v31) / 48;
    if (v91 <= 1) {
      uint64_t v37 = 1;
    }
    uint64_t v93 = v37;
    do
    {
      v100[0] = 0;
      v100[1] = 0;
      v101 = 0;
      std::vector<double>::reserve(v100, v35);
      if (v96 != v95)
      {
        uint64_t v38 = 0;
        v39 = (double *)v100[1];
        do
        {
          double v40 = *(float *)(*((void *)a3 + 9) + 4 * (v38 + v34 * v35));
          if (v39 >= v101)
          {
            uint64_t v42 = (double *)v100[0];
            uint64_t v43 = ((char *)v39 - (char *)v100[0]) >> 3;
            unint64_t v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61) {
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v45 = (char *)v101 - (char *)v100[0];
            if (((char *)v101 - (char *)v100[0]) >> 2 > v44) {
              unint64_t v44 = v45 >> 2;
            }
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v46 = v44;
            }
            if (v46)
            {
              uint64_t v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v101, v46);
              uint64_t v42 = (double *)v100[0];
              v39 = (double *)v100[1];
            }
            else
            {
              uint64_t v47 = 0;
            }
            uint64_t v48 = (double *)&v47[8 * v43];
            double *v48 = v40;
            std::basic_string<char16_t> v41 = v48 + 1;
            while (v39 != v42)
            {
              uint64_t v49 = *((void *)v39-- - 1);
              *((void *)v48-- - 1) = v49;
            }
            v100[0] = v48;
            v100[1] = v41;
            v101 = (double *)&v47[8 * v46];
            if (v42) {
              operator delete(v42);
            }
          }
          else
          {
            double *v39 = v40;
            std::basic_string<char16_t> v41 = v39 + 1;
          }
          v100[1] = v41;
          ++v38;
          v39 = (double *)v41;
        }
        while (v38 != v36);
      }
      v50 = v103;
      if ((unint64_t)v103 >= v104)
      {
        unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v103 - v102) >> 3);
        unint64_t v52 = v51 + 1;
        if (v51 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v104 - v102) >> 3) > v52) {
          unint64_t v52 = 0x5555555555555556 * ((uint64_t)(v104 - v102) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - v102) >> 3) >= 0x555555555555555) {
          unint64_t v53 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v53 = v52;
        }
        v114 = &v104;
        uint64_t v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v53);
        v55 = (double *)&v54[24 * v51];
        *(void *)long long buf = v54;
        v111 = v55;
        uint64_t v113 = (uint64_t)&v54[24 * v56];
        double *v55 = 0.0;
        v55[1] = 0.0;
        v55[2] = 0.0;
        *(_OWORD *)v55 = *(_OWORD *)v100;
        *((void *)v55 + 2) = v101;
        v100[0] = 0;
        v100[1] = 0;
        v101 = 0;
        v112 = v55 + 3;
        std::vector<std::vector<unsigned long>>::__swap_out_circular_buffer(&v102, buf);
        v57 = v103;
        std::__split_buffer<std::vector<unsigned long>>::~__split_buffer((uint64_t)buf);
        v103 = v57;
        if (v100[0])
        {
          v100[1] = v100[0];
          operator delete(v100[0]);
        }
      }
      else
      {
        void *v103 = 0;
        v50[1] = 0;
        v50[2] = 0;
        *(_OWORD *)v50 = *(_OWORD *)v100;
        v50[2] = v101;
        v100[0] = 0;
        v100[1] = 0;
        v101 = 0;
        v103 = v50 + 3;
      }
      ++v34;
    }
    while (v34 != v93);
  }
  *(void *)long long buf = 0;
  v111 = 0;
  v112 = 0;
  uint64_t v58 = v91;
  std::vector<double>::reserve((void **)buf, v91);
  if (v90 != v89)
  {
    uint64_t v59 = 0;
    if (v91 <= 1) {
      uint64_t v58 = 1;
    }
    unint64_t v60 = v111;
    do
    {
      double v61 = *(float *)(*((void *)a3 + 15) + 4 * v59);
      if (v60 >= v112)
      {
        unint64_t v63 = *(double **)buf;
        uint64_t v64 = ((uint64_t)v60 - *(void *)buf) >> 3;
        unint64_t v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 61) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v66 = (uint64_t)v112 - *(void *)buf;
        if (((uint64_t)v112 - *(void *)buf) >> 2 > v65) {
          unint64_t v65 = v66 >> 2;
        }
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v67 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v67 = v65;
        }
        if (v67)
        {
          std::basic_string<char16_t> v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v112, v67);
          unint64_t v63 = *(double **)buf;
          unint64_t v60 = v111;
        }
        else
        {
          std::basic_string<char16_t> v68 = 0;
        }
        unsigned __int8 v69 = (double *)&v68[8 * v64];
        *unsigned __int8 v69 = v61;
        uint64_t v62 = v69 + 1;
        while (v60 != v63)
        {
          uint64_t v70 = *((void *)v60-- - 1);
          *((void *)v69-- - 1) = v70;
        }
        *(void *)long long buf = v69;
        v111 = v62;
        v112 = (double *)&v68[8 * v67];
        if (v63) {
          operator delete(v63);
        }
      }
      else
      {
        *unint64_t v60 = v61;
        uint64_t v62 = v60 + 1;
      }
      v111 = v62;
      ++v59;
      unint64_t v60 = v62;
    }
    while (v59 != v58);
  }
  char v71 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration beamMaskInput];
  nl_featurization::beam_search::beamSearch((uint64_t *)&__p, (uint64_t)&v102, buf, v71, v71 + 3, v71 + 6, (uint64_t)(v71 + 9), (uint64_t)(v71 + 14), (uint64_t)v100, 5uLL);
  uint64_t v72 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v115 = 134217984;
    *(void *)&v115[4] = ((char *)v100[1] - (char *)v100[0]) >> 7;
    _os_log_impl(&dword_1C8DA9000, v72, OS_LOG_TYPE_DEBUG, "Number of BEAM sequences = %lu", v115, 0xCu);
  }

  v73 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((char *)v100[1] - (char *)v100[0]) >> 7];
  for (uint64_t i = (nl_featurization::beam_search::BeamSequence *)v100[0];
        i != v100[1];
        uint64_t i = (nl_featurization::beam_search::BeamSequence *)((char *)i + 128))
  {
    v75 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      nl_featurization::beam_search::BeamSequence::toString((uint64_t *)v115, i);
      v76 = v116 >= 0 ? v115 : *(unsigned char **)v115;
      *(_DWORD *)v117 = 136315138;
      v118 = v76;
      _os_log_impl(&dword_1C8DA9000, v75, OS_LOG_TYPE_DEBUG, "Processing BEAM sequence: %s", v117, 0xCu);
      if (v116 < 0) {
        operator delete(*(void **)v115);
      }
    }

    v77 = [(UPParserModel *)self _candidateForBeamSequence:i utterance:&v108 outputTokens:a5 resolver:a6 sharedEntityResolution:v97];
    v78 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      v79 = [v77 annotatedString];
      *(_DWORD *)v115 = 138412290;
      *(void *)&v115[4] = v79;
      _os_log_impl(&dword_1C8DA9000, v78, OS_LOG_TYPE_DEBUG, "Produced candidate: %@", v115, 0xCu);
    }
    [v73 addObject:v77];
  }
  v80 = SNLPOSLoggerForCategory(7);
  v81 = v80;
  if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
  {
    *(_WORD *)v115 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v81, OS_SIGNPOST_INTERVAL_END, spid, "UaaP Post-Processing", "", v115, 2u);
  }

  v82 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v115 = 0;
    _os_log_impl(&dword_1C8DA9000, v82, OS_LOG_TYPE_DEFAULT, "END \"UaaP Post-Processing\"", v115, 2u);
  }

  v83 = [UPResult alloc];
  v84 = [v92 uuid];
  v85 = [(UPResult *)v83 initWithCandidates:v73 queryUUID:v84];

  *(void *)v115 = v100;
  std::vector<nl_featurization::beam_search::BeamSequence>::__destroy_vector::operator()[abi:ne180100]((void ***)v115);
  if (*(void *)buf)
  {
    v111 = *(double **)buf;
    operator delete(*(void **)buf);
  }
  *(void *)long long buf = &v102;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (__p)
  {
    v106 = (double *)__p;
    operator delete(__p);
  }
  if (v109 < 0) {
    operator delete(v108);
  }

  return v85;
}

- (UPInferenceResult)forwardWithSpanLabels:(SEL)a3 embeddings:(UPGenericTensor *)a4 utterance:(UPGenericTensor *)a5
{
  os_signpost_id_t v10 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = SNLPOSLoggerForCategory(7);
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "UaaP EspressoInference", "", buf, 2u);
  }

  v14 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8DA9000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP EspressoInference\"", buf, 2u);
  }

  v15 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration parserEspressoModule];
  uaap::EspressoModule::reshape((uint64_t)v15, (uint64_t)a5, (uint64_t)a4);
  uaap::EspressoModule::buildPlan((uaap::EspressoModule *)v15);
  buf[23] = 12;
  strcpy((char *)buf, "span_indices");
  uaap::EspressoModule::setInput((uint64_t)v15, (uint64_t)buf, (uint64_t *)&a4->data);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  buf[23] = 16;
  strcpy((char *)buf, "token_embeddings");
  uaap::EspressoModule::setInput((uint64_t)v15, (uint64_t)buf, (uint64_t *)&a5->data);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  uaap::EspressoModule::executePlan((uaap::EspressoModule *)v15);
  std::string::basic_string[abi:ne180100]<0>(&v42, "intent_softmax");
  std::string::basic_string[abi:ne180100]<0>(&v40, "bio_labels_softmax");
  std::string::basic_string[abi:ne180100]<0>(&v38, "group_labels_softmax");
  uaap::EspressoModule::getOutput((uint64_t)buf);
  uaap::EspressoModule::getOutput((uint64_t)v31);
  uaap::EspressoModule::getOutput((uint64_t)v27);
  *(_OWORD *)&retstr->var0.shape.__begin_ = *(_OWORD *)buf;
  retstr->var0.shape.__end_cap_.__value_ = *(unint64_t **)&buf[16];
  long long v16 = *(_OWORD *)v36;
  v36[0] = 0;
  memset(buf, 0, sizeof(buf));
  long long v17 = v37;
  *(_OWORD *)&retstr->var0.data.__begin_ = v16;
  retstr->var0.data.__end_cap_.__value_ = v17;
  v36[1] = 0;
  uint64_t v37 = 0;
  unint64_t v18 = v32;
  *(_OWORD *)&retstr->var1.shape.__begin_ = *(_OWORD *)v31;
  retstr->var1.shape.__end_cap_.__value_ = v18;
  v31[0] = 0;
  v31[1] = 0;
  unint64_t v19 = v34;
  *(_OWORD *)&retstr->var1.data.__begin_ = *(_OWORD *)v33;
  retstr->var1.data.__end_cap_.__value_ = v19;
  double v32 = 0;
  v33[0] = 0;
  v33[1] = 0;
  uint64_t v34 = 0;
  double v20 = v28;
  *(_OWORD *)&retstr->var2.shape.__begin_ = *(_OWORD *)v27;
  retstr->var2.shape.__end_cap_.__value_ = v20;
  v27[0] = 0;
  v27[1] = 0;
  unint64_t v21 = v30;
  *(_OWORD *)&retstr->var2.data.__begin_ = *(_OWORD *)__p;
  retstr->var2.data.__end_cap_.__value_ = v21;
  uint64_t v28 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v30 = 0;
  uaap::EspressoModule::cleanPlan((uaap::EspressoModule *)v15);
  unint64_t v22 = SNLPOSLoggerForCategory(7);
  uint64_t v23 = v22;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)unint64_t v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v23, OS_SIGNPOST_INTERVAL_END, v11, "UaaP EspressoInference", "", v26, 2u);
  }

  unint64_t v24 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v26 = 0;
    _os_log_impl(&dword_1C8DA9000, v24, OS_LOG_TYPE_DEFAULT, "END \"UaaP EspressoInference\"", v26, 2u);
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  if (v31[0])
  {
    v31[1] = v31[0];
    operator delete(v31[0]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  result = *(UPInferenceResult **)buf;
  if (*(void *)buf)
  {
    *(void *)&uint8_t buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  if (v39 < 0) {
    operator delete(v38);
  }
  if (v41 < 0) {
    operator delete(v40);
  }
  if (v43 < 0) {
    operator delete(v42);
  }
  return result;
}

- (id)_candidateForUtterance:(const void *)a3 probability:(float)a4 labelledSpans:(const void *)a5 intent:(id)a6 sharedEntityResolution:(id)a7
{
  id v43 = a6;
  id v47 = a7;
  unint64_t v46 = [MEMORY[0x1E4F1CA48] array];
  if (*((char *)a3 + 23) >= 0) {
    unint64_t v11 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    unint64_t v11 = *((void *)a3 + 1);
  }
  id v12 = (void **)&off_1E657F000;
  if (v11)
  {
    unint64_t v13 = 0;
    unint64_t v44 = v11;
    uint64_t v45 = a3;
    do
    {
      uint64_t v14 = *(void *)a5;
      uint64_t v15 = *((void *)a5 + 1);
      if (*(void *)a5 != v15)
      {
        uint64_t v16 = 0;
        do
        {
          if (v13 == *(void *)(v14 + 16)) {
            uint64_t v16 = v14;
          }
          v14 += 104;
        }
        while (v14 != v15);
        if (v16)
        {
          u16Substring((uint64_t *)a3, *(void *)(v16 + 16), *(void *)(v16 + 24), &v51);
          uint64_t v49 = [v12[105] stdU16ToNSString:&v51];
          if (*(unsigned char *)(v16 + 80))
          {
            long long v17 = (char *)(v16 + 56);
            if (*(char *)(v16 + 79) < 0) {
              long long v17 = *(char **)v17;
            }
            unint64_t v18 = v12[105];
            std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, v17);
            uint64_t v48 = [v18 stdU16ToNSString:&__p];
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            uint64_t v48 = 0;
          }
          unint64_t v19 = [v12[105] stdU16ToNSString:v16 + 32];
          if (*(unsigned char *)(v16 + 96))
          {
            double v20 = [NSNumber numberWithUnsignedLong:*(void *)(v16 + 88)];
          }
          else
          {
            double v20 = 0;
          }
          unint64_t v21 = v12;
          uint64_t v22 = [v12[105] rangeFromStart:*(void *)v16 end:*(void *)(v16 + 8)];
          uint64_t v24 = v23;
          uint64_t v25 = NSString;
          toString(v16 + 32, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          uint64_t v27 = [v25 stringWithUTF8String:p_p];
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          uint64_t v28 = objc_msgSend(v47, "resolveSharedEntityForTokenRange:valueType:", v22, v24, v27);
          uint64_t v29 = [v21[105] rangeFromStart:*(void *)(v16 + 16) end:*(void *)(v16 + 24)];
          uint64_t v31 = -[UPResultCandidateEntity initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:]([UPResultCandidateEntity alloc], "initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:", v29, v30, v19, v49, v20, v48, v28);
          [v46 addObject:v31];
          uint64_t v34 = v16 + 16;
          uint64_t v33 = *(void *)(v16 + 16);
          uint64_t v32 = *(void *)(v34 + 8);

          if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v51.__r_.__value_.__l.__data_);
          }
          v13 += v32 + ~v33;
          unint64_t v11 = v44;
          a3 = v45;
          id v12 = v21;
        }
      }
      ++v13;
    }
    while (v13 < v11);
  }
  unint64_t v35 = [v12[105] stdU16ToNSString:a3];
  usoSerializer = self->__usoSerializer;
  uint64_t v37 = [(UPModelIdentifier *)self->_identifier appBundleId];
  uint64_t v38 = [(UPUsoSerializer *)usoSerializer serializeFromIntent:v43 andEntities:v46 forBundleId:v37];

  char v39 = (void *)[objc_alloc(MEMORY[0x1E4FA3A58]) initWithTask:v38];
  double v40 = [[UPResultCandidate alloc] initWithUncalibratedProbability:0 calibratedProbability:v35 utterance:v43 intent:v46 entities:self->_identifier modelIdentifier:v39 task:a4];

  return v40;
}

- (id)predictionFromQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration preprocessor];
  id v12 = 0;
  id v8 = [v7 preprocess:v6 error:&v12];
  id v9 = v12;

  if (v8)
  {
    os_signpost_id_t v10 = [(UPParserModel *)self predictionFromQuery:v6 preprocessorOutput:v8 error:a4];
  }
  else
  {
    os_signpost_id_t v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v10;
}

- (UPParserModel)initWithLoadedModelConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = SNLPOSLoggerForCategory(7);
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UaaP UPParserModelInit initWithLoadedModelConfiguration", "", buf, 2u);
  }

  os_signpost_id_t v10 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP UPParserModelInit initWithLoadedModelConfiguration\"", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)UPParserModel;
  unint64_t v11 = [(UPParserModel *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->__loadedModelConfiguration, a3);
    unint64_t v13 = [UPModelIdentifier alloc];
    uint64_t v14 = [(UPLoadedModelConfiguration *)v12->__loadedModelConfiguration bundleId];
    uint64_t v15 = [(UPModelIdentifier *)v13 initWithAppBundleId:v14];
    identifier = v12->_identifier;
    v12->_identifier = (UPModelIdentifier *)v15;

    long long v17 = objc_alloc_init(UPUsoSerializer);
    usoSerializer = v12->__usoSerializer;
    v12->__usoSerializer = v17;
  }
  unint64_t v19 = SNLPOSLoggerForCategory(7);
  double v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v20, OS_SIGNPOST_INTERVAL_END, v7, "UaaP UPParserModelInit initWithLoadedModelConfiguration", "", buf, 2u);
  }

  unint64_t v21 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C8DA9000, v21, OS_LOG_TYPE_DEFAULT, "END \"UaaP UPParserModelInit initWithLoadedModelConfiguration\"", buf, 2u);
  }

  return v12;
}

+ (UPParserModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[UPParserModel alloc] initWithLoadedModelConfiguration:v5];
  os_signpost_id_t v7 = v6;
  if (a4 && !v6)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:0 userInfo:0];
  }

  return v7;
}

@end