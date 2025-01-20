@interface TLTransliterator
- (TLTransliterator)initWithLocale:(id)a3;
- (TLTransliterator)initWithParameters:(id)a3;
- (id).cxx_construct;
- (id)generateCandidatesForInputWord:(id)a3 candidateContext:(id)a4 maxCandidatesCount:(int64_t)a5;
- (id)generateCandidatesForInputWord:(id)a3 candidateContextStrings:(id)a4 maxCandidatesCount:(int64_t)a5;
@end

@implementation TLTransliterator

- (TLTransliterator)initWithLocale:(id)a3
{
  id v4 = a3;
  v5 = [[TLTransliteratorInitParameters alloc] initWithLocale:v4];
  v6 = [(TLTransliterator *)self initWithParameters:v5];

  return v6;
}

- (TLTransliterator)initWithParameters:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TLTransliterator;
  if ([(TLTransliterator *)&v6 init])
  {
    [v4 locale];
    objc_claimAutoreleasedReturnValue();
    [v4 modelURL];
    objc_claimAutoreleasedReturnValue();
    [v4 useLanguageModel];
    [v4 useSeq2SeqModel];
    operator new();
  }

  return 0;
}

- (id)generateCandidatesForInputWord:(id)a3 candidateContext:(id)a4 maxCandidatesCount:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  v11 = [v9 candidates];
  v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = objc_msgSend(v9, "candidates", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) transliteratedWord];
        [v12 addObject:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = [(TLTransliterator *)self generateCandidatesForInputWord:v8 candidateContextStrings:v12 maxCandidatesCount:a5];

  return v18;
}

- (id)generateCandidatesForInputWord:(id)a3 candidateContextStrings:(id)a4 maxCandidatesCount:(int64_t)a5
{
  int64_t v26 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v28 = a3;
  memset(&v35, 0, sizeof(v35));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "UTF8String", v26));
        std::vector<std::string>::pointer end = v35.__end_;
        if (v35.__end_ >= v35.__end_cap_.__value_)
        {
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3);
          unint64_t v13 = v12 + 1;
          if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) > v13) {
            unint64_t v13 = 0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v14 = v13;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v35.__end_cap_;
          if (v14) {
            uint64_t v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v35.__end_cap_, v14);
          }
          else {
            uint64_t v15 = 0;
          }
          v16 = v15 + v12;
          __v.__first_ = v15;
          __v.__begin_ = v16;
          __v.__end_cap_.__value_ = &v15[v14];
          long long v17 = *(_OWORD *)__p;
          v16->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          __p[1] = 0;
          std::string::size_type v30 = 0;
          __p[0] = 0;
          __v.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v35, &__v);
          v18 = v35.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v35.__end_ = v18;
          if (SHIBYTE(v30) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v11 = *(_OWORD *)__p;
          v35.__end_->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v11;
          v35.__end_ = end + 1;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  value = self->_compositeTransliterator.__ptr_.__value_;
  id v20 = v28;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v20 UTF8String]);
  TLCompositeTransliterator::getTransliterationCandidates((uint64_t)value, (uint64_t)&v35, (uint64_t)__p, v26, (uint64_t)&__v);
  if (SHIBYTE(v30) < 0) {
    operator delete(__p[0]);
  }
  long long v21 = objc_msgSend(MEMORY[0x263EFF980], "array", v26);
  std::__split_buffer<std::string>::pointer first = __v.__first_;
  for (std::__split_buffer<std::string>::pointer j = __v.__begin_; first != j; first = (std::__split_buffer<std::string>::pointer)((char *)first + 80))
  {
    v24 = +[TLTransliteratorCandidate createWithCompositeTransliteratorCandidate:first];
    [v21 addObject:v24];
  }
  __p[0] = &__v;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);

  return v21;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end