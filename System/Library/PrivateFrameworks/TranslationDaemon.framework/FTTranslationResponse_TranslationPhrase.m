@interface FTTranslationResponse_TranslationPhrase
- (BOOL)low_confidence;
- (FTTranslationPhraseMetaInfo)meta_info_data;
- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3;
- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4;
- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5;
- (NSArray)spans;
- (NSArray)translated_tokens;
- (NSString)lt_formattedString;
- (NSString)meta_info;
- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3;
- (float)confidence;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)spans_objectAtIndex:(unint64_t)a3;
- (id)translated_tokens_objectAtIndex:(unint64_t)a3;
- (unint64_t)spans_count;
- (unint64_t)translated_tokens_count;
- (void)spans_enumerateObjectsUsingBlock:(id)a3;
- (void)translated_tokens_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationResponse_TranslationPhrase

- (NSString)lt_formattedString
{
  v2 = [(FTTranslationResponse_TranslationPhrase *)self translated_tokens];
  v3 = [v2 _ltCompactMap:&__block_literal_global_21];
  v4 = [v3 componentsJoinedByString:&stru_270C008E8];

  return (NSString *)v4;
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return [(FTTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationResponse_TranslationPhrase;
  v10 = [(FTTranslationResponse_TranslationPhrase *)&v26 init];
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
    a4 = (const TranslationPhrase *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (float)confidence
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (NSArray)translated_tokens
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_tokens"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__FTTranslationResponse_TranslationPhrase_translated_tokens__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationResponse_TranslationPhrase *)self translated_tokens_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translated_tokens"];
  }
  return (NSArray *)v3;
}

- (id)translated_tokens_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_tokens"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTranslationResponse_TranslationToken alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)translated_tokens_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_tokens"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)translated_tokens_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTranslationResponse_TranslationToken *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_tokens"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
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
            uint64_t v17 = [[FTTranslationResponse_TranslationToken alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)meta_info
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)spans
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__FTTranslationResponse_TranslationPhrase_spans__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationResponse_TranslationPhrase *)self spans_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"spans"];
  }
  return (NSArray *)v3;
}

- (id)spans_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTRepeatedSpan alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)spans_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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

- (void)spans_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
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
            uint64_t v17 = [[FTRepeatedSpan alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (BOOL)low_confidence
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (FTTranslationPhraseMetaInfo)meta_info_data
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"meta_info_data"];
  if (!v3)
  {
    uint64_t v4 = [FTTranslationPhraseMetaInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (uint64_t v7 = *(unsigned __int16 *)v6[14].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FTTranslationPhraseMetaInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"meta_info_data"];
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  [(FTTranslationResponse_TranslationPhrase *)self confidence];
  float v6 = v5;
  memset(&v67, 0, sizeof(v67));
  uint64_t v7 = [(FTTranslationResponse_TranslationPhrase *)self translated_tokens];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v67, [v7 count]);

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v8 = [(FTTranslationResponse_TranslationPhrase *)self translated_tokens];
  v57 = self;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = [*(id *)(*((void *)&v63 + 1) + 8 * i) addObjectToBuffer:a3];
        int v13 = v12;
        std::vector<int>::pointer end = v67.__end_;
        if (v67.__end_ >= v67.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v67.__begin_;
          int64_t v17 = v67.__end_ - v67.__begin_;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v19 = (char *)v67.__end_cap_.__value_ - (char *)v67.__begin_;
          if (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 1 > v18) {
            unint64_t v18 = v19 >> 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v67.__end_cap_, v20);
            std::vector<int>::pointer begin = v67.__begin_;
            std::vector<int>::pointer end = v67.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          int *v22 = v13;
          uint64_t v15 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          v67.__begin_ = v22;
          v67.__end_ = v15;
          v67.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v67.__end_ = v12;
          uint64_t v15 = end + 1;
        }
        v67.__end_ = v15;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v9);
  }

  if (v67.__end_ == v67.__begin_) {
    std::vector<int>::pointer v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>> const&)::t;
  }
  else {
    std::vector<int>::pointer v24 = v67.__begin_;
  }
  int v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v67.__end_ - v67.__begin_);
  objc_super v26 = [(FTTranslationResponse_TranslationPhrase *)v57 meta_info];
  v27 = v26;
  if (!v26) {
    objc_super v26 = &stru_270C008E8;
  }
  v28 = (const char *)[(__CFString *)v26 UTF8String];
  size_t v29 = strlen(v28);
  LODWORD(v56) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28, v29);

  memset(&v62, 0, sizeof(v62));
  v30 = [(FTTranslationResponse_TranslationPhrase *)v57 spans];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v62, [v30 count]);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v31 = [(FTTranslationResponse_TranslationPhrase *)v57 spans];
  HIDWORD(v56) = v25;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v59 != v33) {
          objc_enumerationMutation(v31);
        }
        int v35 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * j), "addObjectToBuffer:", a3, v56);
        int v36 = v35;
        std::vector<int>::pointer v37 = v62.__end_;
        if (v62.__end_ >= v62.__end_cap_.__value_)
        {
          std::vector<int>::pointer v39 = v62.__begin_;
          int64_t v40 = v62.__end_ - v62.__begin_;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v42 = (char *)v62.__end_cap_.__value_ - (char *)v62.__begin_;
          if (((char *)v62.__end_cap_.__value_ - (char *)v62.__begin_) >> 1 > v41) {
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
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v62.__end_cap_, v43);
            std::vector<int>::pointer v39 = v62.__begin_;
            std::vector<int>::pointer v37 = v62.__end_;
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
          v62.__begin_ = v45;
          v62.__end_ = v38;
          v62.__end_cap_.__value_ = (int *)&v44[4 * v43];
          if (v39) {
            operator delete(v39);
          }
        }
        else
        {
          *v62.__end_ = v35;
          v38 = v37 + 1;
        }
        v62.__end_ = v38;
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v32);
  }

  if (v62.__end_ == v62.__begin_) {
    std::vector<int>::pointer v47 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    std::vector<int>::pointer v47 = v62.__begin_;
  }
  int v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v47, v62.__end_ - v62.__begin_);
  int v49 = [(FTTranslationResponse_TranslationPhrase *)v57 low_confidence];
  v50 = [(FTTranslationResponse_TranslationPhrase *)v57 meta_info_data];
  int v51 = [v50 addObjectToBuffer:a3];

  *((unsigned char *)a3 + 70) = 1;
  int v52 = *((_DWORD *)a3 + 8);
  int v53 = *((_DWORD *)a3 + 12);
  LODWORD(v50) = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>(a3, 4, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, SHIDWORD(v56));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 12, v49, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v51);
  v54.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v52 - (unsigned __int16)v53 + (unsigned __int16)v50);
  if (v62.__begin_)
  {
    v62.__end_ = v62.__begin_;
    operator delete(v62.__begin_);
  }
  if (v67.__begin_)
  {
    v67.__end_ = v67.__begin_;
    operator delete(v67.__begin_);
  }
  return v54;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationResponse_TranslationPhrase *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end