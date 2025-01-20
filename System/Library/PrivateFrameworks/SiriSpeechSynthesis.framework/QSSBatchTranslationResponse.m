@interface QSSBatchTranslationResponse
- (NSArray)span;
- (NSArray)translated_sentences;
- (NSString)paragraph_id;
- (NSString)request_id;
- (NSString)return_string;
- (NSString)translated_text;
- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3;
- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3;
- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4;
- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
@end

@implementation QSSBatchTranslationResponse

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
  v2.var0 = [(QSSBatchTranslationResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__43__QSSBatchTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v4 = [(QSSBatchTranslationResponse *)self request_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  int v75 = [(QSSBatchTranslationResponse *)self return_code];
  long long v8 = [(QSSBatchTranslationResponse *)self return_string];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v74 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  __int16 v12 = [(QSSBatchTranslationResponse *)self paragraph_id];
  uint64_t v13 = v12;
  if (!v12) {
    __int16 v12 = &stru_26DEBFAF8;
  }
  v14 = (const char *)[(__CFString *)v12 UTF8String];
  size_t v15 = strlen(v14);
  unsigned int v73 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = [(QSSBatchTranslationResponse *)self translated_text];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v20 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  memset(&v88, 0, sizeof(v88));
  v21 = [(QSSBatchTranslationResponse *)self span];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v88, [v21 count]);

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v22 = [(QSSBatchTranslationResponse *)self span];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v84 objects:v90 count:16];
  unsigned int v72 = v20;
  begin = v88.__begin_;
  if (v23)
  {
    uint64_t v25 = *(void *)v85;
    value = v88.__end_cap_.__value_;
    v78 = v22;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(v22);
        }
        int v28 = [*(id *)(*((void *)&v84 + 1) + 8 * i) addObjectToBuffer:a3];
        int v29 = v28;
        std::vector<int>::pointer end = v88.__end_;
        if (v88.__end_ >= value)
        {
          uint64_t v32 = v88.__end_ - begin;
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 62)
          {
            v88.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v33) {
            unint64_t v33 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v33;
          }
          if (v34) {
            unint64_t v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v34);
          }
          else {
            uint64_t v35 = 0;
          }
          v36 = (int *)(v34 + 4 * v32);
          int *v36 = v29;
          v31 = v36 + 1;
          while (end != begin)
          {
            int v37 = *--end;
            *--v36 = v37;
          }
          value = (int *)(v34 + 4 * v35);
          v88.__end_ = v31;
          if (begin) {
            operator delete(begin);
          }
          begin = v36;
          v22 = v78;
        }
        else
        {
          *v88.__end_ = v28;
          v31 = end + 1;
        }
        v88.__end_ = v31;
      }
      v88.__end_cap_.__value_ = value;
      v88.__begin_ = begin;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v84 objects:v90 count:16];
    }
    while (v23);
  }
  else
  {
    v31 = v88.__end_;
  }

  if (v31 == begin) {
    v38 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  }
  else {
    v38 = begin;
  }
  unsigned int v71 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v38, v31 - begin);
  v39 = [(QSSBatchTranslationResponse *)self translated_sentences];
  unint64_t v40 = [v39 count];
  if (v40)
  {
    if (v40 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v40);
    v43 = &v41[4 * v42];
  }
  else
  {
    v41 = 0;
    v43 = 0;
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v44 = [(QSSBatchTranslationResponse *)self translated_sentences];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v81;
    v47 = v41;
    v79 = v44;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v81 != v46) {
          objc_enumerationMutation(v44);
        }
        int v49 = [*(id *)(*((void *)&v80 + 1) + 8 * j) addObjectToBuffer:a3];
        int v50 = v49;
        if (v47 >= v43)
        {
          uint64_t v51 = (v47 - v41) >> 2;
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v43 - v41) >> 1 > v52) {
            unint64_t v52 = (v43 - v41) >> 1;
          }
          if ((unint64_t)(v43 - v41) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v53 = v52;
          }
          if (v53) {
            unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v53);
          }
          else {
            uint64_t v54 = 0;
          }
          v55 = (char *)(v53 + 4 * v51);
          *(_DWORD *)v55 = v50;
          v56 = v55 + 4;
          while (v47 != v41)
          {
            int v57 = *((_DWORD *)v47 - 1);
            v47 -= 4;
            *((_DWORD *)v55 - 1) = v57;
            v55 -= 4;
          }
          v43 = (char *)(v53 + 4 * v54);
          if (v41) {
            operator delete(v41);
          }
          v41 = v55;
          v47 = v56;
          v44 = v79;
        }
        else
        {
          *(_DWORD *)v47 = v49;
          v47 += 4;
        }
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v45);
  }
  else
  {
    v47 = v41;
  }

  uint64_t v58 = v47 - v41;
  if (v47 == v41) {
    v59 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>> const&)::t;
  }
  else {
    v59 = v41;
  }
  uint64_t v60 = v58 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v58 >> 2, 4uLL);
  if (v41 == v47)
  {
    LODWORD(v60) = 0;
  }
  else
  {
    v61 = v59 - 4;
    uint64_t v62 = v60;
    do
    {
      int v63 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v61[4 * v62]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v63);
      --v62;
    }
    while (v62);
  }
  unsigned int v64 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v60);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v65 = *((_DWORD *)a3 + 8);
  int v66 = *((_DWORD *)a3 + 12);
  int v67 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v74);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v73);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v72);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v71);
  if (v64)
  {
    int v68 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v64);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v68);
  }
  v69.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v65 - v66 + v67);
  if (v41) {
    operator delete(v41);
  }
  if (v88.__begin_) {
    operator delete(v88.__begin_);
  }
  return v69;
}

- (NSArray)translated_sentences
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"translated_sentences"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
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
            __int16 v12 = [[QSSBatchTranslationResponse_TranslatedSentence alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"translated_sentences"];
  }
  return (NSArray *)v3;
}

flatbuffers::DetachedBuffer *__62__QSSBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

flatbuffers::DetachedBuffer *__61__QSSBatchTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (NSArray)span
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"span"];
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
        size_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = [[QSSRepeatedSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"span"];
  }
  return (NSArray *)v3;
}

- (NSString)translated_text
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (NSString)paragraph_id
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
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
  size_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse;
  uint64_t v10 = [(QSSBatchTranslationResponse *)&v30 init];
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
      a4 = (const BatchTranslationResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          uint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  uint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4
{
  return [(QSSBatchTranslationResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSBatchTranslationResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end