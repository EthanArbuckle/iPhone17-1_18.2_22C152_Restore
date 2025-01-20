@interface QSSSpeechTranslationMtResponse
- (BOOL)is_final;
- (NSArray)n_best_translated_phrases;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)return_str;
- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3;
- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3;
- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4;
- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5;
- (QSSTranslationLocalePair)translation_locale_pair;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSSpeechTranslationMtResponse

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
  v2.var0 = [(QSSSpeechTranslationMtResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__46__QSSSpeechTranslationMtResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSSpeechTranslationMtResponse *)self conversation_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(QSSSpeechTranslationMtResponse *)self request_id];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  int v54 = [(QSSSpeechTranslationMtResponse *)self return_code];
  uint64_t v13 = [(QSSSpeechTranslationMtResponse *)self return_str];
  v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_26DEBFAF8;
  }
  v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  unsigned int v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  v17 = [(QSSSpeechTranslationMtResponse *)self translation_locale_pair];
  unsigned int v52 = [v17 addObjectToBuffer:a3];

  v18 = [(QSSSpeechTranslationMtResponse *)self n_best_translated_phrases];
  unint64_t v19 = [v18 count];
  if (v19)
  {
    if (v19 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
    v22 = &v20[4 * v21];
  }
  else
  {
    v20 = 0;
    v22 = 0;
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v23 = [(QSSSpeechTranslationMtResponse *)self n_best_translated_phrases];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
  v57 = self;
  v58 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v24)
  {
    uint64_t v25 = *(void *)v60;
    v26 = v20;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(v23);
        }
        int v28 = [*(id *)(*((void *)&v59 + 1) + 8 * i) addObjectToBuffer:a3];
        int v29 = v28;
        if (v26 >= v22)
        {
          uint64_t v30 = (v26 - v20) >> 2;
          unint64_t v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v22 - v20) >> 1 > v31) {
            unint64_t v31 = (v22 - v20) >> 1;
          }
          if ((unint64_t)(v22 - v20) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v32 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
          }
          else {
            uint64_t v33 = 0;
          }
          v34 = (char *)(v32 + 4 * v30);
          *(_DWORD *)v34 = v29;
          v35 = v34 + 4;
          while (v26 != v20)
          {
            int v36 = *((_DWORD *)v26 - 1);
            v26 -= 4;
            *((_DWORD *)v34 - 1) = v36;
            v34 -= 4;
          }
          v22 = (char *)(v32 + 4 * v33);
          if (v20) {
            operator delete(v20);
          }
          v20 = v34;
          v26 = v35;
          a3 = v58;
        }
        else
        {
          *(_DWORD *)v26 = v28;
          v26 += 4;
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v24);
  }
  else
  {
    v26 = v20;
  }

  uint64_t v37 = v26 - v20;
  v38 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v26 == v20) {
    v39 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    v39 = v20;
  }
  uint64_t v40 = v37 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v38, v37 >> 2, 4uLL);
  if (v20 == v26)
  {
    LODWORD(v40) = 0;
  }
  else
  {
    v41 = v39 - 4;
    uint64_t v42 = v40;
    do
    {
      int v43 = flatbuffers::FlatBufferBuilder::ReferTo(v58, *(_DWORD *)&v41[4 * v42]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v58, v43);
      --v42;
    }
    while (v42);
  }
  unsigned int v44 = flatbuffers::FlatBufferBuilder::EndVector(v58, v40);
  int v45 = [(QSSSpeechTranslationMtResponse *)v57 is_final];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v58);
  *((unsigned char *)v58 + 70) = 1;
  int v46 = *((_DWORD *)v58 + 8);
  int v47 = *((_DWORD *)v58 + 12);
  int v48 = *((_DWORD *)v58 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 6, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v58, 8, v54);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 10, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 12, v52);
  if (v44)
  {
    int v49 = flatbuffers::FlatBufferBuilder::ReferTo(v58, v44);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v58, 14, v49);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>(v58, 16, v45);
  v50.var0 = flatbuffers::FlatBufferBuilder::EndTable(v58, v46 - v47 + v48);
  if (v20) {
    operator delete(v20);
  }
  return v50;
}

- (BOOL)is_final
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)n_best_translated_phrases
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[14].var0;
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
            size_t v12 = [[QSSSpeechTranslationMtResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"n_best_translated_phrases"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__64__QSSSpeechTranslationMtResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (QSSTranslationLocalePair)translation_locale_pair
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translation_locale_pair"];
  if (!v3)
  {
    uint64_t v4 = [QSSTranslationLocalePair alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSTranslationLocalePair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translation_locale_pair"];
  }
  return v3;
}

- (NSString)return_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)conversation_id
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
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSpeechTranslationMtResponse;
  uint64_t v10 = [(QSSSpeechTranslationMtResponse *)&v30 init];
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
      a4 = (const SpeechTranslationMtResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SpeechTranslationMtResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4
{
  return [(QSSSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationMtResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end