@interface TIDynamicLanguageLikelihoodModel
- (NSLinguisticTagger)linguisticTagger;
- (TIDynamicLanguageLikelihoodModel)init;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (float)_priorProbabilityForLanguage:(const void *)a3;
- (id).cxx_construct;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)addEvidence:(id)a3 forRecipient:(id)a4 language:(id)a5;
- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
@end

@implementation TIDynamicLanguageLikelihoodModel

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linguisticTagger, 0);
  left = (char *)self->m_counts_for_language.__tree_.__pair1_.__value_.__left_;
  std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(left);
}

- (NSLinguisticTagger)linguisticTagger
{
  return self->_linguisticTagger;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0;
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, id, unsigned char *, float))a5;
  char v22 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = *(id *)(*((void *)&v18 + 1) + 8 * v12);
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v13 UTF8String]);
      [(TIDynamicLanguageLikelihoodModel *)self _priorProbabilityForLanguage:__p];
      float v15 = v14;
      if (v17 < 0) {
        operator delete(__p[0]);
      }
      v8[2](v8, v13, &v22, v15);
      if (v22) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (float)_priorProbabilityForLanguage:(const void *)a3
{
  p_pair1 = &self->m_counts_for_language.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)self->m_counts_for_language.__tree_.__pair1_.__value_.__left_;
  float v5 = 0.0;
  if (left)
  {
    v8 = &self->m_counts_for_language.__tree_.__pair1_;
    do
    {
      char v9 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&left[4].__value_.__left_, a3);
      if (v9 >= 0) {
        uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> **)left;
      }
      else {
        uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> **)&left[1];
      }
      if (v9 >= 0) {
        v8 = left;
      }
      left = *v10;
    }
    while (*v10);
    if (v8 != p_pair1
      && (std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, &v8[4].__value_.__left_) & 0x80) == 0)
    {
      int64_t m_total_counts = self->m_total_counts;
      if (m_total_counts >= 1) {
        return (float)(uint64_t)v8[7].__value_.__left_ / (float)m_total_counts;
      }
    }
  }
  return v5;
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  id v4 = a3;
  float v5 = [MEMORY[0x263EFF980] array];
  long long v36 = 0uLL;
  value = 0;
  p_m_counts_for_language = (uint64_t **)&self->m_counts_for_language;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)self->m_counts_for_language.__tree_.__begin_node_;
  if (begin_node == &self->m_counts_for_language.__tree_.__pair1_)
  {
    v8 = 0;
    unint64_t v27 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      char v9 = begin_node + 4;
      if (v8 >= value)
      {
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v8 - v36) >> 3);
        unint64_t v12 = v11 + 1;
        if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        if (0x5555555555555556 * ((uint64_t)((uint64_t)value - v36) >> 3) > v12) {
          unint64_t v12 = 0x5555555555555556 * ((uint64_t)((uint64_t)value - v36) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)value - v36) >> 3) >= 0x555555555555555) {
          unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v13 = v12;
        }
        v38.__end_cap_.__value_ = (std::allocator<std::string> *)&value;
        if (v13)
        {
          float v15 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v13);
        }
        else
        {
          float v15 = 0;
          uint64_t v14 = 0;
        }
        std::__split_buffer<std::string>::pointer begin = v15 + v11;
        v38.__first_ = v15;
        v38.__begin_ = begin;
        v38.__end_ = begin;
        v38.__end_cap_.__value_ = &v15[v14];
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          std::string::__init_copy_ctor_external(begin, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
          std::__split_buffer<std::string>::pointer begin = v38.__begin_;
          std::__split_buffer<std::string>::pointer end = v38.__end_;
        }
        else
        {
          long long v17 = *(_OWORD *)&v9->__value_.__left_;
          begin->__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
          *(_OWORD *)&begin->__r_.__value_.__l.__data_ = v17;
          std::__split_buffer<std::string>::pointer end = v15 + v11;
        }
        uint64_t v19 = *((void *)&v36 + 1);
        uint64_t v20 = v36;
        if (*((void *)&v36 + 1) == (void)v36)
        {
          int64x2_t v22 = vdupq_n_s64(*((unint64_t *)&v36 + 1));
        }
        else
        {
          do
          {
            long long v21 = *(_OWORD *)(v19 - 24);
            begin[-1].__r_.__value_.__r.__words[2] = *(void *)(v19 - 8);
            *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v21;
            --begin;
            *(void *)(v19 - 16) = 0;
            *(void *)(v19 - 8) = 0;
            *(void *)(v19 - 24) = 0;
            v19 -= 24;
          }
          while (v19 != v20);
          int64x2_t v22 = (int64x2_t)v36;
        }
        v8 = end + 1;
        *(void *)&long long v36 = begin;
        *((void *)&v36 + 1) = end + 1;
        *(int64x2_t *)&v38.__begin_ = v22;
        v23 = value;
        value = v38.__end_cap_.__value_;
        v38.__end_cap_.__value_ = v23;
        v38.__first_ = (std::__split_buffer<std::string>::pointer)v22.i64[0];
        std::__split_buffer<std::string>::~__split_buffer(&v38);
      }
      else
      {
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          std::string::__init_copy_ctor_external(v8, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
        }
        else
        {
          long long v10 = *(_OWORD *)&v9->__value_.__left_;
          v8->__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
          *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
        }
        ++v8;
      }
      *((void *)&v36 + 1) = v8;
      left = (TIDynamicLanguageLikelihoodModel *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v25 = left;
          left = (TIDynamicLanguageLikelihoodModel *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v25 = (TIDynamicLanguageLikelihoodModel *)begin_node[2].__value_.__left_;
          BOOL v26 = v25->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v25;
        }
        while (!v26);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v25;
    }
    while (v25 != (TIDynamicLanguageLikelihoodModel *)&self->m_counts_for_language.__tree_.__pair1_);
    unint64_t v27 = v36;
  }
  unint64_t v28 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v8 - v27) >> 3));
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __64__TIDynamicLanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke;
  v35[3] = &unk_26504F8A0;
  v35[4] = self;
  if (v8 == (std::string *)v27) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v28;
  }
  v38.__first_ = (std::__split_buffer<std::string>::pointer)v35;
  std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(v27, (unint64_t)v8, (uint64_t)&v38, v29, 1);

  uint64_t v30 = *((void *)&v36 + 1);
  for (uint64_t i = v36; i != v30; i += 24)
  {
    if ((uint64_t)std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_m_counts_for_language, (void *)i, i)[7] >= 5)
    {
      uint64_t v32 = i;
      if (*(char *)(i + 23) < 0) {
        uint64_t v32 = *(void *)i;
      }
      v33 = [NSString stringWithUTF8String:v32];
      [v5 addObject:v33];
    }
  }
  v38.__first_ = (std::__split_buffer<std::string>::pointer)&v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v38);

  return v5;
}

BOOL __64__TIDynamicLanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(void *)(a1 + 32) + 8), a2, (uint64_t)a2)[7];
  return (uint64_t)v5 > (uint64_t)std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(void *)(a1 + 32) + 8), a3, (uint64_t)a3)[7];
}

- (void)addEvidence:(id)a3 forRecipient:(id)a4 language:(id)a5
{
  id v6 = a3;
  id v7 = [(TIDynamicLanguageLikelihoodModel *)self linguisticTagger];
  [v7 setString:v6];

  v8 = [(TIDynamicLanguageLikelihoodModel *)self linguisticTagger];
  uint64_t v9 = [v6 length];
  uint64_t v10 = *MEMORY[0x263F082A8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__TIDynamicLanguageLikelihoodModel_addEvidence_forRecipient_language___block_invoke;
  v11[3] = &unk_26504FA18;
  v11[4] = self;
  objc_msgSend(v8, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v9, v10, 14, v11);
}

void __70__TIDynamicLanguageLikelihoodModel_addEvidence_forRecipient_language___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
      float v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(void *)(a1 + 32) + 8), __p, (uint64_t)__p);
      v5[7] = (uint64_t *)((char *)v5[7] + 1);
      ++*(void *)(*(void *)(a1 + 32) + 32);
      if (v7 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8
{
  id v9 = a3;
  uint64_t v10 = [(TIDynamicLanguageLikelihoodModel *)self linguisticTagger];
  [v10 setString:v9];

  unint64_t v11 = [(TIDynamicLanguageLikelihoodModel *)self linguisticTagger];
  uint64_t v12 = [v9 length];
  uint64_t v13 = *MEMORY[0x263F082A8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__TIDynamicLanguageLikelihoodModel_addEvidence_timestamp_adaptationType_forRecipient_app_language___block_invoke;
  v14[3] = &unk_26504FA18;
  v14[4] = self;
  objc_msgSend(v11, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v12, v13, 14, v14);
}

void __99__TIDynamicLanguageLikelihoodModel_addEvidence_timestamp_adaptationType_forRecipient_app_language___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v4 UTF8String]);
      float v5 = std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(*(void *)(a1 + 32) + 8), __p, (uint64_t)__p);
      v5[7] = (uint64_t *)((char *)v5[7] + 1);
      ++*(void *)(*(void *)(a1 + 32) + 32);
      if (v7 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

- (TIDynamicLanguageLikelihoodModel)init
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)TIDynamicLanguageLikelihoodModel;
  v2 = [(TIDynamicLanguageLikelihoodModel *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08948]);
    v9[0] = *MEMORY[0x263F082A8];
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    uint64_t v5 = [v3 initWithTagSchemes:v4 options:0];
    linguisticTagger = v2->_linguisticTagger;
    v2->_linguisticTagger = (NSLinguisticTagger *)v5;
  }
  return v2;
}

@end