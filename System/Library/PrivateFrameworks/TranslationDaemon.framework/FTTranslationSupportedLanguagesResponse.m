@interface FTTranslationSupportedLanguagesResponse
- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3;
- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4;
- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4 verify:(BOOL)a5;
- (NSArray)language_pairs;
- (NSString)request_id;
- (NSString)return_string;
- (Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)language_pairs_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)language_pairs_count;
- (void)language_pairs_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTranslationSupportedLanguagesResponse

- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3
{
  return [(FTTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4
{
  return [(FTTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationSupportedLanguagesResponse;
  v10 = [(FTTranslationSupportedLanguagesResponse *)&v26 init];
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
    a4 = (const TranslationSupportedLanguagesResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationSupportedLanguagesResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TranslationSupportedLanguagesResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
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

- (NSArray)language_pairs
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"language_pairs"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__FTTranslationSupportedLanguagesResponse_language_pairs__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTranslationSupportedLanguagesResponse *)self language_pairs_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"language_pairs"];
  }
  return (NSArray *)v3;
}

uint64_t __57__FTTranslationSupportedLanguagesResponse_language_pairs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)language_pairs_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"language_pairs"];
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
      id v7 = [[FTTranslationSupportedLanguagesResponse_LanguagePair alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)language_pairs_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"language_pairs"];
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

- (void)language_pairs_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTranslationSupportedLanguagesResponse_LanguagePair *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"language_pairs"];
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
            uint64_t v17 = [[FTTranslationSupportedLanguagesResponse_LanguagePair alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTranslationSupportedLanguagesResponse *)self request_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  int v10 = [(FTTranslationSupportedLanguagesResponse *)self return_code];
  uint64_t v11 = [(FTTranslationSupportedLanguagesResponse *)self return_string];
  uint64_t v12 = v11;
  if (!v11) {
    uint64_t v11 = &stru_270C008E8;
  }
  uint64_t v13 = (const char *)[(__CFString *)v11 UTF8String];
  size_t v14 = strlen(v13);
  LODWORD(v13) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v13, v14);

  memset(&v46, 0, sizeof(v46));
  uint64_t v15 = [(FTTranslationSupportedLanguagesResponse *)self language_pairs];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v46, [v15 count]);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v16 = [(FTTranslationSupportedLanguagesResponse *)self language_pairs];
  int v39 = (int)v13;
  int v40 = String;
  int v41 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v16);
        }
        int v20 = [*(id *)(*((void *)&v42 + 1) + 8 * i) addObjectToBuffer:a3];
        int v21 = v20;
        std::vector<int>::pointer end = v46.__end_;
        if (v46.__end_ >= v46.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v46.__begin_;
          int64_t v25 = v46.__end_ - v46.__begin_;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v27 = (char *)v46.__end_cap_.__value_ - (char *)v46.__begin_;
          if (((char *)v46.__end_cap_.__value_ - (char *)v46.__begin_) >> 1 > v26) {
            unint64_t v26 = v27 >> 1;
          }
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v26;
          }
          if (v28)
          {
            v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v46.__end_cap_, v28);
            std::vector<int>::pointer begin = v46.__begin_;
            std::vector<int>::pointer end = v46.__end_;
          }
          else
          {
            v29 = 0;
          }
          v30 = (int *)&v29[4 * v25];
          int *v30 = v21;
          long long v23 = v30 + 1;
          while (end != begin)
          {
            int v31 = *--end;
            *--v30 = v31;
          }
          v46.__begin_ = v30;
          v46.__end_ = v23;
          v46.__end_cap_.__value_ = (int *)&v29[4 * v28];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v46.__end_ = v20;
          long long v23 = end + 1;
        }
        v46.__end_ = v23;
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v17);
  }

  if (v46.__end_ == v46.__begin_) {
    std::vector<int>::pointer v32 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>> const&)::t;
  }
  else {
    std::vector<int>::pointer v32 = v46.__begin_;
  }
  int v33 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v32, v46.__end_ - v46.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v34 = *((_DWORD *)a3 + 8);
  int v35 = *((_DWORD *)a3 + 12);
  int v36 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v40);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 6, v41, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v33);
  v37.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v34 - (unsigned __int16)v35 + v36);
  if (v46.__begin_)
  {
    v46.__end_ = v46.__begin_;
    operator delete(v46.__begin_);
  }
  return v37;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTranslationSupportedLanguagesResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__55__FTTranslationSupportedLanguagesResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__68__FTTranslationSupportedLanguagesResponse_LanguagePair_flatbuffData__block_invoke(uint64_t a1)
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