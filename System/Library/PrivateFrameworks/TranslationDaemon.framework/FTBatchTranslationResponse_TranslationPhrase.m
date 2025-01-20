@interface FTBatchTranslationResponse_TranslationPhrase
- (BOOL)contains_masked_profanity;
- (BOOL)low_confidence;
- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3;
- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4;
- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5;
- (FTTranslationPhraseMetaInfo)meta_info_data;
- (NSArray)repeated_spans;
- (NSString)meta_info;
- (NSString)translation_phrase;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3;
- (float)confidence;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)repeated_spans_objectAtIndex:(unint64_t)a3;
- (unint64_t)repeated_spans_count;
- (void)repeated_spans_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTBatchTranslationResponse_TranslationPhrase

- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return [(FTBatchTranslationResponse_TranslationPhrase *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationResponse_TranslationPhrase;
  v10 = [(FTBatchTranslationResponse_TranslationPhrase *)&v26 init];
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
  v19 = (siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
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

- (NSString)translation_phrase
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
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (BOOL)low_confidence
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)repeated_spans
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"repeated_spans"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__FTBatchTranslationResponse_TranslationPhrase_repeated_spans__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTBatchTranslationResponse_TranslationPhrase *)self repeated_spans_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"repeated_spans"];
  }
  return (NSArray *)v3;
}

- (id)repeated_spans_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"repeated_spans"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
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

- (unint64_t)repeated_spans_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"repeated_spans"];
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

- (void)repeated_spans_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"repeated_spans"];
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

- (BOOL)contains_masked_profanity
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  [(FTBatchTranslationResponse_TranslationPhrase *)self confidence];
  float v6 = v5;
  uint64_t v7 = [(FTBatchTranslationResponse_TranslationPhrase *)self translation_phrase];
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v7 = &stru_270C008E8;
  }
  uint64_t v9 = (const char *)[(__CFString *)v7 UTF8String];
  size_t v10 = strlen(v9);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9, v10);

  uint64_t v12 = [(FTBatchTranslationResponse_TranslationPhrase *)self meta_info];
  uint64_t v13 = v12;
  if (!v12) {
    uint64_t v12 = &stru_270C008E8;
  }
  uint64_t v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  int v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14, v15);

  int v43 = [(FTBatchTranslationResponse_TranslationPhrase *)self low_confidence];
  memset(&v51, 0, sizeof(v51));
  uint64_t v16 = [(FTBatchTranslationResponse_TranslationPhrase *)self repeated_spans];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v51, [v16 count]);

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v17 = [(FTBatchTranslationResponse_TranslationPhrase *)self repeated_spans];
  int v45 = String;
  v46 = self;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v17);
        }
        int v21 = [*(id *)(*((void *)&v47 + 1) + 8 * i) addObjectToBuffer:a3];
        int v22 = v21;
        std::vector<int>::pointer end = v51.__end_;
        if (v51.__end_ >= v51.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v51.__begin_;
          int64_t v26 = v51.__end_ - v51.__begin_;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v28 = (char *)v51.__end_cap_.__value_ - (char *)v51.__begin_;
          if (((char *)v51.__end_cap_.__value_ - (char *)v51.__begin_) >> 1 > v27) {
            unint64_t v27 = v28 >> 1;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v51.__end_cap_, v29);
            std::vector<int>::pointer begin = v51.__begin_;
            std::vector<int>::pointer end = v51.__end_;
          }
          else
          {
            v30 = 0;
          }
          v31 = (int *)&v30[4 * v26];
          int *v31 = v22;
          uint64_t v24 = v31 + 1;
          while (end != begin)
          {
            int v32 = *--end;
            *--v31 = v32;
          }
          v51.__begin_ = v31;
          v51.__end_ = v24;
          v51.__end_cap_.__value_ = (int *)&v30[4 * v29];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v51.__end_ = v21;
          uint64_t v24 = end + 1;
        }
        v51.__end_ = v24;
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v18);
  }

  if (v51.__end_ == v51.__begin_) {
    std::vector<int>::pointer v33 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    std::vector<int>::pointer v33 = v51.__begin_;
  }
  int v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v33, v51.__end_ - v51.__begin_);
  v35 = [(FTBatchTranslationResponse_TranslationPhrase *)v46 meta_info_data];
  int v36 = [v35 addObjectToBuffer:a3];

  int v37 = [(FTBatchTranslationResponse_TranslationPhrase *)v46 contains_masked_profanity];
  *((unsigned char *)a3 + 70) = 1;
  int v38 = *((_DWORD *)a3 + 8);
  int v39 = *((_DWORD *)a3 + 12);
  int v40 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>(a3, 4, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 10, v43, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v34);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v36);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 16, v37, 0);
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38 - (unsigned __int16)v39 + v40);
  if (v51.__begin_)
  {
    v51.__end_ = v51.__begin_;
    operator delete(v51.__begin_);
  }
  return v41;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBatchTranslationResponse_TranslationPhrase *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end