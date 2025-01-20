@interface FTBatchTranslationResponse
- (BOOL)contains_masked_profanity;
- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4;
- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5;
- (NSArray)span;
- (NSArray)translated_sentences;
- (NSString)paragraph_id;
- (NSString)request_id;
- (NSString)return_string;
- (NSString)translated_text;
- (NSString)translated_text_romanized;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)span_objectAtIndex:(unint64_t)a3;
- (id)translated_sentences_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)span_count;
- (unint64_t)translated_sentences_count;
- (void)span_enumerateObjectsUsingBlock:(id)a3;
- (void)translated_sentences_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTBatchTranslationResponse

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4
{
  return [(FTBatchTranslationResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationResponse;
  v10 = [(FTBatchTranslationResponse *)&v26 init];
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
    a4 = (const BatchTranslationResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::BatchTranslationResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::BatchTranslationResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)request_id
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

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)return_string
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)paragraph_id
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

- (NSString)translated_text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (NSArray)span
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__FTBatchTranslationResponse_span__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationResponse *)self span_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"span"];
  }
  return (NSArray *)v3;
}

uint64_t __34__FTBatchTranslationResponse_span__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)span_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
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
      id v7 = [[FTRepeatedSpan alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)span_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
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

- (void)span_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
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

- (NSArray)translated_sentences
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_sentences"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__FTBatchTranslationResponse_translated_sentences__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationResponse *)self translated_sentences_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translated_sentences"];
  }
  return (NSArray *)v3;
}

uint64_t __50__FTBatchTranslationResponse_translated_sentences__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)translated_sentences_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_sentences"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0x11u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[16].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTBatchTranslationResponse_TranslatedSentence alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)translated_sentences_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_sentences"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x11u && (uint64_t v8 = *(unsigned __int16 *)v7[16].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)translated_sentences_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTBatchTranslationResponse_TranslatedSentence *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_sentences"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x11u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[16].var0;
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
            uint64_t v17 = [[FTBatchTranslationResponse_TranslatedSentence alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)translated_text_romanized
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (BOOL)contains_masked_profanity
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(FTBatchTranslationResponse *)self request_id];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  int v72 = [(FTBatchTranslationResponse *)self return_code];
  uint64_t v9 = [(FTBatchTranslationResponse *)self return_string];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(FTBatchTranslationResponse *)self paragraph_id];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  uint64_t v17 = [(FTBatchTranslationResponse *)self translated_text];
  int v18 = v17;
  if (!v17) {
    uint64_t v17 = &stru_270C008E8;
  }
  uint64_t v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  int v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  memset(&v84, 0, sizeof(v84));
  v21 = [(FTBatchTranslationResponse *)self span];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v84, [v21 count]);

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v22 = [(FTBatchTranslationResponse *)self span];
  v74 = self;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v81 != v24) {
          objc_enumerationMutation(v22);
        }
        int v26 = [*(id *)(*((void *)&v80 + 1) + 8 * i) addObjectToBuffer:a3];
        int v27 = v26;
        std::vector<int>::pointer end = v84.__end_;
        if (v84.__end_ >= v84.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v84.__begin_;
          int64_t v31 = v84.__end_ - v84.__begin_;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v33 = (char *)v84.__end_cap_.__value_ - (char *)v84.__begin_;
          if (((char *)v84.__end_cap_.__value_ - (char *)v84.__begin_) >> 1 > v32) {
            unint64_t v32 = v33 >> 1;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v84.__end_cap_, v34);
            std::vector<int>::pointer begin = v84.__begin_;
            std::vector<int>::pointer end = v84.__end_;
          }
          else
          {
            v35 = 0;
          }
          v36 = (int *)&v35[4 * v31];
          int *v36 = v27;
          v29 = v36 + 1;
          while (end != begin)
          {
            int v37 = *--end;
            *--v36 = v37;
          }
          v84.__begin_ = v36;
          v84.__end_ = v29;
          v84.__end_cap_.__value_ = (int *)&v35[4 * v34];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v84.__end_ = v26;
          v29 = end + 1;
        }
        v84.__end_ = v29;
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v23);
  }

  if (v84.__end_ == v84.__begin_) {
    std::vector<int>::pointer v38 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    std::vector<int>::pointer v38 = v84.__begin_;
  }
  int v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v38, v84.__end_ - v84.__begin_);
  memset(&v79, 0, sizeof(v79));
  v39 = [(FTBatchTranslationResponse *)v74 translated_sentences];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v79, [v39 count]);

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v40 = [(FTBatchTranslationResponse *)v74 translated_sentences];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v76 != v42) {
          objc_enumerationMutation(v40);
        }
        int v44 = [*(id *)(*((void *)&v75 + 1) + 8 * j) addObjectToBuffer:a3];
        int v45 = v44;
        std::vector<int>::pointer v46 = v79.__end_;
        if (v79.__end_ >= v79.__end_cap_.__value_)
        {
          std::vector<int>::pointer v48 = v79.__begin_;
          int64_t v49 = v79.__end_ - v79.__begin_;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v51 = (char *)v79.__end_cap_.__value_ - (char *)v79.__begin_;
          if (((char *)v79.__end_cap_.__value_ - (char *)v79.__begin_) >> 1 > v50) {
            unint64_t v50 = v51 >> 1;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52)
          {
            v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v79.__end_cap_, v52);
            std::vector<int>::pointer v48 = v79.__begin_;
            std::vector<int>::pointer v46 = v79.__end_;
          }
          else
          {
            v53 = 0;
          }
          v54 = (int *)&v53[4 * v49];
          int *v54 = v45;
          v47 = v54 + 1;
          while (v46 != v48)
          {
            int v55 = *--v46;
            *--v54 = v55;
          }
          v79.__begin_ = v54;
          v79.__end_ = v47;
          v79.__end_cap_.__value_ = (int *)&v53[4 * v52];
          if (v48) {
            operator delete(v48);
          }
        }
        else
        {
          *v79.__end_ = v44;
          v47 = v46 + 1;
        }
        v79.__end_ = v47;
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v41);
  }

  if (v79.__end_ == v79.__begin_) {
    std::vector<int>::pointer v56 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>> const&)::t;
  }
  else {
    std::vector<int>::pointer v56 = v79.__begin_;
  }
  int v57 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v56, v79.__end_ - v79.__begin_);
  v58 = [(FTBatchTranslationResponse *)v74 translated_text_romanized];
  v59 = v58;
  if (!v58) {
    v58 = &stru_270C008E8;
  }
  v60 = (const char *)[(__CFString *)v58 UTF8String];
  size_t v61 = strlen(v60);
  LODWORD(v60) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v60, v61);

  int v62 = [(FTBatchTranslationResponse *)v74 contains_masked_profanity];
  *((unsigned char *)a3 + 70) = 1;
  int v63 = *((_DWORD *)a3 + 8);
  int v64 = *((_DWORD *)a3 + 12);
  int v65 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v72, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v57);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, (int)v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 20, v62, 0);
  v66.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v63 - (unsigned __int16)v64 + v65);
  if (v79.__begin_)
  {
    v79.__end_ = v79.__begin_;
    operator delete(v79.__begin_);
  }
  if (v84.__begin_)
  {
    v84.__end_ = v84.__begin_;
    operator delete(v84.__begin_);
  }
  return v66;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FTBatchTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __62__FTBatchTranslationResponse_TranslationPhrase_repeated_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__60__FTBatchTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

uint64_t __63__FTBatchTranslationResponse_TranslatedSentence_n_best_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __73__FTBatchTranslationResponse_TranslatedSentence_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__61__FTBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke(uint64_t a1)
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