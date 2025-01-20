@interface QSSTranslationSupportedLanguagesResponse
- (NSArray)language_pairs;
- (NSString)request_id;
- (NSString)return_string;
- (Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse>)addObjectToBuffer:(void *)a3;
- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3;
- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4;
- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSTranslationSupportedLanguagesResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSTranslationSupportedLanguagesResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__56__QSSTranslationSupportedLanguagesResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSTranslationSupportedLanguagesResponse *)self request_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  int v46 = [(QSSTranslationSupportedLanguagesResponse *)self return_code];
  long long v9 = [(QSSTranslationSupportedLanguagesResponse *)self return_string];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v45 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(QSSTranslationSupportedLanguagesResponse *)self language_pairs];
  unint64_t v14 = [v13 count];
  if (v14)
  {
    if (v14 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v14);
    v17 = &v15[4 * v16];
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v18 = [(QSSTranslationSupportedLanguagesResponse *)self language_pairs];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v50;
    v21 = v15;
    v48 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v18);
        }
        int v23 = [*(id *)(*((void *)&v49 + 1) + 8 * i) addObjectToBuffer:a3];
        int v24 = v23;
        if (v21 >= v17)
        {
          uint64_t v25 = (v21 - v15) >> 2;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v17 - v15) >> 1 > v26) {
            unint64_t v26 = (v17 - v15) >> 1;
          }
          if ((unint64_t)(v17 - v15) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          v29 = (char *)(v27 + 4 * v25);
          *(_DWORD *)v29 = v24;
          v30 = v29 + 4;
          while (v21 != v15)
          {
            int v31 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v31;
            v29 -= 4;
          }
          v17 = (char *)(v27 + 4 * v28);
          if (v15) {
            operator delete(v15);
          }
          v15 = v29;
          v21 = v30;
          v18 = v48;
        }
        else
        {
          *(_DWORD *)v21 = v23;
          v21 += 4;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v19);
  }
  else
  {
    v21 = v15;
  }

  uint64_t v32 = v21 - v15;
  if (v21 == v15) {
    v33 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationSupportedLanguagesResponse_::LanguagePair>> const&)::t;
  }
  else {
    v33 = v15;
  }
  uint64_t v34 = v32 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v32 >> 2, 4uLL);
  if (v15 == v21)
  {
    LODWORD(v34) = 0;
  }
  else
  {
    v35 = v33 - 4;
    uint64_t v36 = v34;
    do
    {
      int v37 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v35[4 * v36]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v37);
      --v36;
    }
    while (v36);
  }
  unsigned int v38 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v34);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v39 = *((_DWORD *)a3 + 8);
  int v40 = *((_DWORD *)a3 + 12);
  int v41 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v45);
  if (v38)
  {
    int v42 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v38);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v42);
  }
  v43.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v39 - v40 + v41);
  if (v15) {
    operator delete(v15);
  }
  return v43;
}

- (NSArray)language_pairs
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"language_pairs"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            size_t v12 = [[QSSTranslationSupportedLanguagesResponse_LanguagePair alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"language_pairs"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__69__QSSTranslationSupportedLanguagesResponse_LanguagePair_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)return_string
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationSupportedLanguagesResponse;
  uint64_t v10 = [(QSSTranslationSupportedLanguagesResponse *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TranslationSupportedLanguagesResponse *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::TranslationSupportedLanguagesResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationSupportedLanguagesResponse::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3 root:(const TranslationSupportedLanguagesResponse *)a4
{
  return [(QSSTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTranslationSupportedLanguagesResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSTranslationSupportedLanguagesResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end