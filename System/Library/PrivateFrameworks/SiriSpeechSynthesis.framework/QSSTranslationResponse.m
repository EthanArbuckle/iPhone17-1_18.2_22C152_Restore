@interface QSSTranslationResponse
- (BOOL)final_message;
- (NSArray)engine_output;
- (NSArray)n_best_translated_phrases;
- (NSString)engine_input;
- (NSString)request_id;
- (NSString)return_string;
- (NSString)sequence_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3;
- (QSSTranslationResponse)initWithFlatbuffData:(id)a3;
- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4;
- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSTranslationResponse

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
  v2.var0 = [(QSSTranslationResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__QSSTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  v4 = [(QSSTranslationResponse *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSTranslationResponse *)self request_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v72 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  int v71 = [(QSSTranslationResponse *)self return_code];
  __int16 v12 = [(QSSTranslationResponse *)self return_string];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v16 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  memset(&v86, 0, sizeof(v86));
  v17 = [(QSSTranslationResponse *)self n_best_translated_phrases];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v86, [v17 count]);

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v18 = [(QSSTranslationResponse *)self n_best_translated_phrases];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v82 objects:v88 count:16];
  unsigned int v70 = v16;
  begin = v86.__begin_;
  if (v19)
  {
    uint64_t v21 = *(void *)v83;
    value = v86.__end_cap_.__value_;
    v75 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v83 != v21) {
          objc_enumerationMutation(v18);
        }
        int v24 = [*(id *)(*((void *)&v82 + 1) + 8 * i) addObjectToBuffer:a3];
        int v25 = v24;
        std::vector<int>::pointer end = v86.__end_;
        if (v86.__end_ >= value)
        {
          uint64_t v28 = v86.__end_ - begin;
          unint64_t v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62)
          {
            v86.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v29) {
            unint64_t v29 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v29;
          }
          if (v30) {
            unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v30);
          }
          else {
            uint64_t v31 = 0;
          }
          v32 = (int *)(v30 + 4 * v28);
          int *v32 = v25;
          v27 = v32 + 1;
          while (end != begin)
          {
            int v33 = *--end;
            *--v32 = v33;
          }
          value = (int *)(v30 + 4 * v31);
          v86.__end_ = v27;
          if (begin) {
            operator delete(begin);
          }
          begin = v32;
          v18 = v75;
        }
        else
        {
          *v86.__end_ = v24;
          v27 = end + 1;
        }
        v86.__end_ = v27;
      }
      v86.__end_cap_.__value_ = value;
      v86.__begin_ = begin;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v19);
  }
  else
  {
    v27 = v86.__end_;
  }

  if (v27 == begin) {
    v34 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    v34 = begin;
  }
  unsigned int v69 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v34, v27 - begin);
  v35 = [(QSSTranslationResponse *)self engine_input];
  v36 = v35;
  if (!v35) {
    v35 = &stru_26DEBFAF8;
  }
  v37 = (const char *)[(__CFString *)v35 UTF8String];
  size_t v38 = strlen(v37);
  unsigned int v68 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v37, v38);

  memset(&v81, 0, sizeof(v81));
  v39 = [(QSSTranslationResponse *)self engine_output];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v81, [v39 count]);

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v40 = [(QSSTranslationResponse *)self engine_output];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v87 count:16];
  v42 = v81.__begin_;
  if (v41)
  {
    uint64_t v43 = *(void *)v78;
    v44 = v81.__end_cap_.__value_;
    v76 = v40;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v78 != v43) {
          objc_enumerationMutation(v40);
        }
        int v46 = [*(id *)(*((void *)&v77 + 1) + 8 * j) addObjectToBuffer:a3];
        int v47 = v46;
        std::vector<int>::pointer v48 = v81.__end_;
        if (v81.__end_ >= v44)
        {
          uint64_t v50 = v81.__end_ - v42;
          unint64_t v51 = v50 + 1;
          if ((unint64_t)(v50 + 1) >> 62)
          {
            v81.__begin_ = v42;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v44 - (char *)v42) >> 1 > v51) {
            unint64_t v51 = ((char *)v44 - (char *)v42) >> 1;
          }
          if ((unint64_t)((char *)v44 - (char *)v42) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v51;
          }
          if (v52) {
            unint64_t v52 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v52);
          }
          else {
            uint64_t v53 = 0;
          }
          v54 = (int *)(v52 + 4 * v50);
          int *v54 = v47;
          v49 = v54 + 1;
          while (v48 != v42)
          {
            int v55 = *--v48;
            *--v54 = v55;
          }
          v44 = (int *)(v52 + 4 * v53);
          v81.__end_ = v49;
          if (v42) {
            operator delete(v42);
          }
          v42 = v54;
          v40 = v76;
        }
        else
        {
          *v81.__end_ = v46;
          v49 = v48 + 1;
        }
        v81.__end_ = v49;
      }
      v81.__end_cap_.__value_ = v44;
      v81.__begin_ = v42;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v41);
  }
  else
  {
    v49 = v81.__end_;
  }

  if (v49 == v42) {
    v56 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  }
  else {
    v56 = v42;
  }
  unsigned int v57 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v56, v49 - v42);
  v58 = [(QSSTranslationResponse *)self sequence_id];
  v59 = v58;
  if (!v58) {
    v58 = &stru_26DEBFAF8;
  }
  v60 = (const char *)[(__CFString *)v58 UTF8String];
  size_t v61 = strlen(v60);
  unsigned int v62 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v60, v61);

  LODWORD(v60) = [(QSSTranslationResponse *)self final_message];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v63 = *((_DWORD *)a3 + 8);
  int v64 = *((_DWORD *)a3 + 12);
  int v65 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v72);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v71);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v69);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v57);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v62);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 20, (int)v60);
  v66.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v63 - v64 + v65);
  if (v42)
  {
    v81.__end_ = v42;
    operator delete(v42);
  }
  if (v86.__begin_) {
    operator delete(v86.__begin_);
  }
  return v66;
}

- (BOOL)final_message
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)sequence_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)engine_output
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"engine_output"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x11u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[16].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"engine_output"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__56__QSSTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

flatbuffers::DetachedBuffer *__55__QSSTranslationResponse_TranslationToken_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSString)engine_input
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSArray)n_best_translated_phrases
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"n_best_translated_phrases"];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSTranslationResponse_TranslationPhrase alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
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

- (NSString)return_string
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationResponse;
  uint64_t v10 = [(QSSTranslationResponse *)&v30 init];
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
      a4 = (const TranslationResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4
{
  return [(QSSTranslationResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end