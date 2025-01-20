@interface UPPreprocessorOutput
- (UPPreprocessorOutput)initWithEmbeddingsTensor:(UPGenericTensor *)a3 spanLabelsTensor:(UPGenericTensor *)a4 outputTokens:()vector<nl_featurization:(std::allocator<nl_featurization::Token>> *)a5 :Token;
- (id).cxx_construct;
- (void)embeddingsTensor;
- (void)outputTokens;
- (void)spanLabelsTensor;
@end

@implementation UPPreprocessorOutput

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_outputTokens = &self->_outputTokens;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputTokens);
  begin = self->_spanLabelsTensor.data.__begin_;
  if (begin)
  {
    self->_spanLabelsTensor.data.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_spanLabelsTensor.shape.__begin_;
  if (v4)
  {
    self->_spanLabelsTensor.shape.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_embeddingsTensor.data.__begin_;
  if (v5)
  {
    self->_embeddingsTensor.data.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_embeddingsTensor.shape.__begin_;
  if (v6)
  {
    self->_embeddingsTensor.shape.__end_ = v6;
    operator delete(v6);
  }
}

- (void)outputTokens
{
  return &self->_outputTokens;
}

- (void)spanLabelsTensor
{
  return &self->_spanLabelsTensor;
}

- (void)embeddingsTensor
{
  return &self->_embeddingsTensor;
}

- (UPPreprocessorOutput)initWithEmbeddingsTensor:(UPGenericTensor *)a3 spanLabelsTensor:(UPGenericTensor *)a4 outputTokens:()vector<nl_featurization:(std::allocator<nl_featurization::Token>> *)a5 :Token
{
  v34.receiver = self;
  v34.super_class = (Class)UPPreprocessorOutput;
  v8 = [(UPPreprocessorOutput *)&v34 init];
  v9 = v8;
  if (v8)
  {
    p_embeddingsTensor = &v8->_embeddingsTensor;
    begin = v8->_embeddingsTensor.shape.__begin_;
    if (begin)
    {
      v9->_embeddingsTensor.shape.__end_ = begin;
      operator delete(begin);
      p_embeddingsTensor->shape.__begin_ = 0;
      v9->_embeddingsTensor.shape.__end_ = 0;
      v9->_embeddingsTensor.shape.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_embeddingsTensor.shape.__begin_ = *(_OWORD *)&a3->shape.__begin_;
    v9->_embeddingsTensor.shape.__end_cap_.__value_ = a3->shape.__end_cap_.__value_;
    a3->shape.__begin_ = 0;
    a3->shape.__end_ = 0;
    a3->shape.__end_cap_.__value_ = 0;
    v12 = v9->_embeddingsTensor.data.__begin_;
    if (v12)
    {
      v9->_embeddingsTensor.data.__end_ = v12;
      operator delete(v12);
      v9->_embeddingsTensor.data.__begin_ = 0;
      v9->_embeddingsTensor.data.__end_ = 0;
      v9->_embeddingsTensor.data.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_embeddingsTensor.data.__begin_ = *(_OWORD *)&a3->data.__begin_;
    v9->_embeddingsTensor.data.__end_cap_.__value_ = a3->data.__end_cap_.__value_;
    a3->data.__begin_ = 0;
    a3->data.__end_ = 0;
    a3->data.__end_cap_.__value_ = 0;
    v13 = v9->_spanLabelsTensor.shape.__begin_;
    if (v13)
    {
      v9->_spanLabelsTensor.shape.__end_ = v13;
      operator delete(v13);
      v9->_spanLabelsTensor.shape.__begin_ = 0;
      v9->_spanLabelsTensor.shape.__end_ = 0;
      v9->_spanLabelsTensor.shape.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_spanLabelsTensor.shape.__begin_ = *(_OWORD *)&a4->shape.__begin_;
    v9->_spanLabelsTensor.shape.__end_cap_.__value_ = a4->shape.__end_cap_.__value_;
    a4->shape.__begin_ = 0;
    a4->shape.__end_ = 0;
    a4->shape.__end_cap_.__value_ = 0;
    v14 = v9->_spanLabelsTensor.data.__begin_;
    if (v14)
    {
      v9->_spanLabelsTensor.data.__end_ = v14;
      operator delete(v14);
      v9->_spanLabelsTensor.data.__begin_ = 0;
      v9->_spanLabelsTensor.data.__end_ = 0;
      v9->_spanLabelsTensor.data.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_spanLabelsTensor.data.__begin_ = *(_OWORD *)&a4->data.__begin_;
    v9->_spanLabelsTensor.data.__end_cap_.__value_ = a4->data.__end_cap_.__value_;
    a4->data.__begin_ = 0;
    a4->data.__end_ = 0;
    a4->data.__end_cap_.__value_ = 0;
    p_begin = (void **)&v9->_outputTokens.__begin_;
    if (&v9->_outputTokens != a5)
    {
      v17 = (long long *)a5->__begin_;
      end = (long long *)a5->__end_;
      uint64_t value = (uint64_t)v9->_outputTokens.__end_cap_.__value_;
      unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (end - v17);
      uint64_t v20 = (uint64_t)v9->_outputTokens.__begin_;
      if (0xAAAAAAAAAAAAAAABLL * ((value - v20) >> 4) < v19)
      {
        if (v20)
        {
          std::vector<nl_featurization::Token>::__clear[abi:ne180100]((uint64_t *)&v9->_outputTokens);
          operator delete(*p_begin);
          uint64_t value = 0;
          *p_begin = 0;
          v9->_outputTokens.__end_ = 0;
          v9->_outputTokens.__end_cap_.__value_ = 0;
        }
        if (v19 > 0x555555555555555) {
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (value >> 4);
        uint64_t v22 = 2 * v21;
        if (2 * v21 <= v19) {
          uint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (end - v17);
        }
        if (v21 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v23 = 0x555555555555555;
        }
        else {
          unint64_t v23 = v22;
        }
        std::vector<nl_featurization::Token>::__vallocate[abi:ne180100](&v9->_outputTokens.__begin_, v23);
        uint64_t v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::Token>,nl_featurization::Token*,nl_featurization::Token*,nl_featurization::Token*>((uint64_t)&v9->_outputTokens.__end_cap_, v17, end, (uint64_t)v9->_outputTokens.__end_);
LABEL_26:
        v9->_outputTokens.__end_ = (Token *)v24;
        return v9;
      }
      v25 = v9->_outputTokens.__end_;
      if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v25 - v20) >> 4) < v19)
      {
        v26 = &v17[((uint64_t)v25 - v20) >> 4];
        if (v25 != (Token *)v20)
        {
          do
          {
            long long v28 = *v17;
            v27 = v17 + 1;
            *(_OWORD *)uint64_t v20 = v28;
            uint64_t v29 = v20 + 16;
            std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)v29, (const std::basic_string<char16_t> *)v27);
            *(unsigned char *)(v29 + 24) = *((unsigned char *)v27 + 24);
            v17 = v27 + 2;
            uint64_t v20 = v29 + 32;
          }
          while (v17 != v26);
          uint64_t v20 = (uint64_t)v9->_outputTokens.__end_;
        }
        uint64_t v24 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nl_featurization::Token>,nl_featurization::Token*,nl_featurization::Token*,nl_featurization::Token*>((uint64_t)&v9->_outputTokens.__end_cap_, v26, end, v20);
        goto LABEL_26;
      }
      if (v17 != end)
      {
        do
        {
          uint64_t v30 = v20;
          long long v32 = *v17;
          v31 = v17 + 1;
          *(_OWORD *)uint64_t v20 = v32;
          std::basic_string<char16_t>::operator=((std::basic_string<char16_t> *)(v20 + 16), (const std::basic_string<char16_t> *)v31);
          *(unsigned char *)(v20 + 40) = *((unsigned char *)v31 + 24);
          v17 = v31 + 2;
          v20 += 48;
        }
        while (v17 != end);
        uint64_t v20 = v30 + 48;
        v25 = v9->_outputTokens.__end_;
      }
      while (v25 != (Token *)v20)
      {
        if (*((char *)v25 - 9) < 0) {
          operator delete(*((void **)v25 - 4));
        }
        v25 = (Token *)((char *)v25 - 48);
      }
      v9->_outputTokens.__end_ = (Token *)v20;
    }
  }
  return v9;
}

@end