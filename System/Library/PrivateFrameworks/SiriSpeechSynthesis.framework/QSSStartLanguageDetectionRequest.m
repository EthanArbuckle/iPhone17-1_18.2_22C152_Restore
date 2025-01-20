@interface QSSStartLanguageDetectionRequest
- (NSArray)locales;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::StartLanguageDetectionRequest>)addObjectToBuffer:(void *)a3;
- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3;
- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4;
- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)codec;
@end

@implementation QSSStartLanguageDetectionRequest

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
  v2.var0 = [(QSSStartLanguageDetectionRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__48__QSSStartLanguageDetectionRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::StartLanguageDetectionRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v4 = [(QSSStartLanguageDetectionRequest *)self speech_id];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  long long v8 = [(QSSStartLanguageDetectionRequest *)self session_id];
  long long v9 = v8;
  if (!v8) {
    long long v8 = &stru_26DEBFAF8;
  }
  uint64_t v10 = (const char *)[(__CFString *)v8 UTF8String];
  size_t v11 = strlen(v10);
  unsigned int v12 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  memset(&v48, 0, sizeof(v48));
  uint64_t v13 = [(QSSStartLanguageDetectionRequest *)self locales];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, [v13 count]);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v14 = [(QSSStartLanguageDetectionRequest *)self locales];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  unsigned int v40 = v12;
  begin = v48.__begin_;
  if (v15)
  {
    uint64_t v17 = *(void *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = (const char *)[*(id *)(*((void *)&v44 + 1) + 8 * i) UTF8String];
        size_t v21 = strlen(v20);
        int v22 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);
        int v23 = v22;
        std::vector<int>::pointer end = v48.__end_;
        if (v48.__end_ >= value)
        {
          uint64_t v26 = v48.__end_ - begin;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v27) {
            unint64_t v27 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v28);
          }
          else {
            uint64_t v29 = 0;
          }
          v30 = (int *)(v28 + 4 * v26);
          int *v30 = v23;
          v25 = v30 + 1;
          while (end != begin)
          {
            int v31 = *--end;
            *--v30 = v31;
          }
          value = (int *)(v28 + 4 * v29);
          v48.__end_ = v25;
          if (begin) {
            operator delete(begin);
          }
          begin = v30;
          v14 = v43;
        }
        else
        {
          *v48.__end_ = v22;
          v25 = end + 1;
        }
        v48.__end_ = v25;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v15);
  }
  else
  {
    v25 = v48.__end_;
  }

  if (v25 == begin) {
    v32 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v32 = begin;
  }
  unsigned int v33 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v32, v25 - begin);
  int v34 = [(QSSStartLanguageDetectionRequest *)self codec];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v35 = *((_DWORD *)a3 + 8);
  int v36 = *((_DWORD *)a3 + 12);
  int v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v33);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (int64_t)codec
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSArray)locales
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"locales"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
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
            unsigned int v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"locales"];
  }
  return (NSArray *)v3;
}

- (NSString)session_id
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

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartLanguageDetectionRequest;
  uint64_t v10 = [(QSSStartLanguageDetectionRequest *)&v30 init];
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
      a4 = (const StartLanguageDetectionRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartLanguageDetectionRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartLanguageDetectionRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4
{
  return [(QSSStartLanguageDetectionRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSStartLanguageDetectionRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSStartLanguageDetectionRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end