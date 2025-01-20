@interface FTBatchTranslationResponse_TranslatedSentence
- (BOOL)contains_masked_profanity;
- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4;
- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5;
- (FTSpan)source_span;
- (FTSpan)target_span;
- (NSArray)alternative_descriptions;
- (NSArray)n_best_choices;
- (NSString)engine_input;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3;
- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)n_best_choices_objectAtIndex:(unint64_t)a3;
- (unint64_t)alternative_descriptions_count;
- (unint64_t)n_best_choices_count;
- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3;
- (void)n_best_choices_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTBatchTranslationResponse_TranslatedSentence

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4
{
  return [(FTBatchTranslationResponse_TranslatedSentence *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationResponse_TranslatedSentence;
  v10 = [(FTBatchTranslationResponse_TranslatedSentence *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TranslatedSentence *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTSpan)source_span
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"source_span"];
  if (!v3)
  {
    v4 = [FTSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTSpan *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"source_span"];
  }
  return v3;
}

- (NSString)engine_input
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FTSpan)target_span
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"target_span"];
  if (!v3)
  {
    uint64_t v4 = [FTSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTSpan *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"target_span"];
  }
  return v3;
}

- (NSArray)n_best_choices
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_choices"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__FTBatchTranslationResponse_TranslatedSentence_n_best_choices__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationResponse_TranslatedSentence *)self n_best_choices_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_choices"];
  }
  return (NSArray *)v3;
}

- (id)n_best_choices_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_choices"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTBatchTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_choices_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_choices"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)n_best_choices_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTBatchTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_choices"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTBatchTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (NSArray)alternative_descriptions
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__FTBatchTranslationResponse_TranslatedSentence_alternative_descriptions__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationResponse_TranslatedSentence *)self alternative_descriptions_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"alternative_descriptions"];
  }
  return (NSArray *)v3;
}

- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTMTAlternativeDescription alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)alternative_descriptions_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (uint64_t v8 = *(unsigned __int16 *)v7[12].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTMTAlternativeDescription alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (BOOL)contains_masked_profanity
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTBatchTranslationResponse_TranslatedSentence *)self source_span];
  int v58 = [v5 addObjectToBuffer:a3];

  v6 = [(FTBatchTranslationResponse_TranslatedSentence *)self engine_input];
  id v7 = v6;
  if (!v6) {
    v6 = &stru_270C008E8;
  }
  uint64_t v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  v10 = [(FTBatchTranslationResponse_TranslatedSentence *)self target_span];
  int v56 = [v10 addObjectToBuffer:a3];

  memset(&v69, 0, sizeof(v69));
  uint64_t v11 = [(FTBatchTranslationResponse_TranslatedSentence *)self n_best_choices];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v69, [v11 count]);

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v12 = [(FTBatchTranslationResponse_TranslatedSentence *)self n_best_choices];
  v59 = self;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v12);
        }
        int v16 = [*(id *)(*((void *)&v65 + 1) + 8 * i) addObjectToBuffer:a3];
        int v17 = v16;
        std::vector<int>::pointer end = v69.__end_;
        if (v69.__end_ >= v69.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v69.__begin_;
          int64_t v21 = v69.__end_ - v69.__begin_;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v23 = (char *)v69.__end_cap_.__value_ - (char *)v69.__begin_;
          if (((char *)v69.__end_cap_.__value_ - (char *)v69.__begin_) >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            char v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v69.__end_cap_, v24);
            std::vector<int>::pointer begin = v69.__begin_;
            std::vector<int>::pointer end = v69.__end_;
          }
          else
          {
            char v25 = 0;
          }
          objc_super v26 = (int *)&v25[4 * v21];
          *objc_super v26 = v17;
          uint64_t v19 = v26 + 1;
          while (end != begin)
          {
            int v27 = *--end;
            *--objc_super v26 = v27;
          }
          v69.__begin_ = v26;
          v69.__end_ = v19;
          v69.__end_cap_.__value_ = (int *)&v25[4 * v24];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v69.__end_ = v16;
          uint64_t v19 = end + 1;
        }
        v69.__end_ = v19;
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v13);
  }

  if (v69.__end_ == v69.__begin_) {
    std::vector<int>::pointer v28 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    std::vector<int>::pointer v28 = v69.__begin_;
  }
  int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v28, v69.__end_ - v69.__begin_);
  memset(&v64, 0, sizeof(v64));
  v30 = [(FTBatchTranslationResponse_TranslatedSentence *)v59 alternative_descriptions];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v64, [v30 count]);

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v31 = [(FTBatchTranslationResponse_TranslatedSentence *)v59 alternative_descriptions];
  int v55 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v31);
        }
        int v35 = [*(id *)(*((void *)&v60 + 1) + 8 * j) addObjectToBuffer:a3];
        int v36 = v35;
        std::vector<int>::pointer v37 = v64.__end_;
        if (v64.__end_ >= v64.__end_cap_.__value_)
        {
          std::vector<int>::pointer v39 = v64.__begin_;
          int64_t v40 = v64.__end_ - v64.__begin_;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v42 = (char *)v64.__end_cap_.__value_ - (char *)v64.__begin_;
          if (((char *)v64.__end_cap_.__value_ - (char *)v64.__begin_) >> 1 > v41) {
            unint64_t v41 = v42 >> 1;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v64.__end_cap_, v43);
            std::vector<int>::pointer v39 = v64.__begin_;
            std::vector<int>::pointer v37 = v64.__end_;
          }
          else
          {
            v44 = 0;
          }
          v45 = (int *)&v44[4 * v40];
          int *v45 = v36;
          v38 = v45 + 1;
          while (v37 != v39)
          {
            int v46 = *--v37;
            *--v45 = v46;
          }
          v64.__begin_ = v45;
          v64.__end_ = v38;
          v64.__end_cap_.__value_ = (int *)&v44[4 * v43];
          if (v39) {
            operator delete(v39);
          }
        }
        else
        {
          *v64.__end_ = v35;
          v38 = v37 + 1;
        }
        v64.__end_ = v38;
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v32);
  }

  if (v64.__end_ == v64.__begin_) {
    std::vector<int>::pointer v47 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
  }
  else {
    std::vector<int>::pointer v47 = v64.__begin_;
  }
  int v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v47, v64.__end_ - v64.__begin_);
  int v49 = [(FTBatchTranslationResponse_TranslatedSentence *)v59 contains_masked_profanity];
  *((unsigned char *)a3 + 70) = 1;
  int v50 = *((_DWORD *)a3 + 8);
  int v51 = *((_DWORD *)a3 + 12);
  int v52 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 14, v49, 0);
  v53.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v50 - (unsigned __int16)v51 + v52);
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v69.__begin_)
  {
    v69.__end_ = v69.__begin_;
    operator delete(v69.__begin_);
  }
  return v53;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationResponse_TranslatedSentence *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end