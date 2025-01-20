@interface FTSpeechTranslationMtResponse
- (BOOL)contains_masked_profanity;
- (BOOL)is_final;
- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3;
- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4;
- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5;
- (FTTranslationLocalePair)translation_locale_pair;
- (NSArray)alternative_descriptions;
- (NSArray)n_best_translated_phrases;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)return_str;
- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3;
- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)alternative_descriptions_count;
- (unint64_t)n_best_translated_phrases_count;
- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3;
- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTSpeechTranslationMtResponse

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3
{
  return [(FTSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4
{
  return [(FTSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSpeechTranslationMtResponse;
  v10 = [(FTSpeechTranslationMtResponse *)&v26 init];
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
    a4 = (const SpeechTranslationMtResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SpeechTranslationMtResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)request_id
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)return_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FTTranslationLocalePair)translation_locale_pair
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pair"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationLocalePair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTTranslationLocalePair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pair"];
  }
  return v3;
}

- (NSArray)n_best_translated_phrases
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__FTSpeechTranslationMtResponse_n_best_translated_phrases__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSpeechTranslationMtResponse *)self n_best_translated_phrases_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_translated_phrases"];
  }
  return (NSArray *)v3;
}

uint64_t __58__FTSpeechTranslationMtResponse_n_best_translated_phrases__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTSpeechTranslationMtResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_translated_phrases_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (uint64_t v8 = *(unsigned __int16 *)v7[14].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTSpeechTranslationMtResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[14].var0;
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
            uint64_t v17 = [[FTSpeechTranslationMtResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (BOOL)is_final
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)alternative_descriptions
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"alternative_descriptions"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__FTSpeechTranslationMtResponse_alternative_descriptions__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTSpeechTranslationMtResponse *)self alternative_descriptions_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"alternative_descriptions"];
  }
  return (NSArray *)v3;
}

uint64_t __57__FTSpeechTranslationMtResponse_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x13u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[18].var0;
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
    if (*(unsigned __int16 *)v7->var0 >= 0x13u && (uint64_t v8 = *(unsigned __int16 *)v7[18].var0) != 0) {
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
    if (*(unsigned __int16 *)v8->var0 >= 0x13u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[18].var0;
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
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTSpeechTranslationMtResponse *)self conversation_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTSpeechTranslationMtResponse *)self request_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v66 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  int v65 = [(FTSpeechTranslationMtResponse *)self return_code];
  uint64_t v13 = [(FTSpeechTranslationMtResponse *)self return_str];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v64 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  uint64_t v17 = [(FTSpeechTranslationMtResponse *)self translation_locale_pair];
  int v63 = [v17 addObjectToBuffer:a3];

  memset(&v78, 0, sizeof(v78));
  int v18 = [(FTSpeechTranslationMtResponse *)self n_best_translated_phrases];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v78, [v18 count]);

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v19 = [(FTSpeechTranslationMtResponse *)self n_best_translated_phrases];
  v68 = self;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v75 != v21) {
          objc_enumerationMutation(v19);
        }
        int v23 = [*(id *)(*((void *)&v74 + 1) + 8 * i) addObjectToBuffer:a3];
        int v24 = v23;
        std::vector<int>::pointer end = v78.__end_;
        if (v78.__end_ >= v78.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v78.__begin_;
          int64_t v28 = v78.__end_ - v78.__begin_;
          unint64_t v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v30 = (char *)v78.__end_cap_.__value_ - (char *)v78.__begin_;
          if (((char *)v78.__end_cap_.__value_ - (char *)v78.__begin_) >> 1 > v29) {
            unint64_t v29 = v30 >> 1;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v29;
          }
          if (v31)
          {
            v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v78.__end_cap_, v31);
            std::vector<int>::pointer begin = v78.__begin_;
            std::vector<int>::pointer end = v78.__end_;
          }
          else
          {
            v32 = 0;
          }
          v33 = (int *)&v32[4 * v28];
          int *v33 = v24;
          objc_super v26 = v33 + 1;
          while (end != begin)
          {
            int v34 = *--end;
            *--v33 = v34;
          }
          v78.__begin_ = v33;
          v78.__end_ = v26;
          v78.__end_cap_.__value_ = (int *)&v32[4 * v31];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v78.__end_ = v23;
          objc_super v26 = end + 1;
        }
        v78.__end_ = v26;
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v20);
  }

  if (v78.__end_ == v78.__begin_) {
    std::vector<int>::pointer v35 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    std::vector<int>::pointer v35 = v78.__begin_;
  }
  int v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v35, v78.__end_ - v78.__begin_);
  int v61 = [(FTSpeechTranslationMtResponse *)v68 is_final];
  memset(&v73, 0, sizeof(v73));
  v36 = [(FTSpeechTranslationMtResponse *)v68 alternative_descriptions];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v73, [v36 count]);

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v37 = [(FTSpeechTranslationMtResponse *)v68 alternative_descriptions];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v70 != v39) {
          objc_enumerationMutation(v37);
        }
        int v41 = [*(id *)(*((void *)&v69 + 1) + 8 * j) addObjectToBuffer:a3];
        int v42 = v41;
        std::vector<int>::pointer v43 = v73.__end_;
        if (v73.__end_ >= v73.__end_cap_.__value_)
        {
          std::vector<int>::pointer v45 = v73.__begin_;
          int64_t v46 = v73.__end_ - v73.__begin_;
          unint64_t v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v48 = (char *)v73.__end_cap_.__value_ - (char *)v73.__begin_;
          if (((char *)v73.__end_cap_.__value_ - (char *)v73.__begin_) >> 1 > v47) {
            unint64_t v47 = v48 >> 1;
          }
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v47;
          }
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v73.__end_cap_, v49);
            std::vector<int>::pointer v45 = v73.__begin_;
            std::vector<int>::pointer v43 = v73.__end_;
          }
          else
          {
            v50 = 0;
          }
          v51 = (int *)&v50[4 * v46];
          int *v51 = v42;
          v44 = v51 + 1;
          while (v43 != v45)
          {
            int v52 = *--v43;
            *--v51 = v52;
          }
          v73.__begin_ = v51;
          v73.__end_ = v44;
          v73.__end_cap_.__value_ = (int *)&v50[4 * v49];
          if (v45) {
            operator delete(v45);
          }
        }
        else
        {
          *v73.__end_ = v41;
          v44 = v43 + 1;
        }
        v73.__end_ = v44;
      }
      uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v79 count:16];
    }
    while (v38);
  }

  if (v73.__end_ == v73.__begin_) {
    std::vector<int>::pointer v53 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
  }
  else {
    std::vector<int>::pointer v53 = v73.__begin_;
  }
  int v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v53, v73.__end_ - v73.__begin_);
  int v55 = [(FTSpeechTranslationMtResponse *)v68 contains_masked_profanity];
  *((unsigned char *)a3 + 70) = 1;
  int v56 = *((_DWORD *)a3 + 8);
  int v57 = *((_DWORD *)a3 + 12);
  int v58 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v65, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v64);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v63);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 16, v61, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 20, v55, 0);
  v59.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v56 - (unsigned __int16)v57 + v58);
  if (v73.__begin_)
  {
    v73.__end_ = v73.__begin_;
    operator delete(v73.__begin_);
  }
  if (v78.__begin_)
  {
    v78.__end_ = v78.__begin_;
    operator delete(v78.__begin_);
  }
  return v59;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTSpeechTranslationMtResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__45__FTSpeechTranslationMtResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTSpeechTranslationMtResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end