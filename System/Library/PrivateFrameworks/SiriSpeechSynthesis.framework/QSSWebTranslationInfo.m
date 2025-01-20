@interface QSSWebTranslationInfo
- (NSArray)spans;
- (NSString)text;
- (Offset<siri::speech::schema_fb::WebTranslationInfo>)addObjectToBuffer:(void *)a3;
- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3;
- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3 root:(const WebTranslationInfo *)a4;
- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3 root:(const WebTranslationInfo *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSWebTranslationInfo

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
  v2.var0 = [(QSSWebTranslationInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__37__QSSWebTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::WebTranslationInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSWebTranslationInfo *)self text];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  memset(&v39, 0, sizeof(v39));
  long long v9 = [(QSSWebTranslationInfo *)self spans];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v39, [v9 count]);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [(QSSWebTranslationInfo *)self spans];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  unsigned int v33 = v7;
  begin = v39.__begin_;
  if (v11)
  {
    uint64_t v13 = *(void *)v36;
    value = v39.__end_cap_.__value_;
    v34 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        int v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) addObjectToBuffer:a3];
        int v17 = v16;
        std::vector<int>::pointer end = v39.__end_;
        if (v39.__end_ >= value)
        {
          uint64_t v20 = v39.__end_ - begin;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62)
          {
            v39.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v21) {
            unint64_t v21 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          if (v22) {
            unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v22);
          }
          else {
            uint64_t v23 = 0;
          }
          v24 = (int *)(v22 + 4 * v20);
          int *v24 = v17;
          v19 = v24 + 1;
          while (end != begin)
          {
            int v25 = *--end;
            *--v24 = v25;
          }
          value = (int *)(v22 + 4 * v23);
          v39.__end_ = v19;
          if (begin) {
            operator delete(begin);
          }
          begin = v24;
          uint64_t v10 = v34;
        }
        else
        {
          *v39.__end_ = v16;
          v19 = end + 1;
        }
        v39.__end_ = v19;
      }
      v39.__end_cap_.__value_ = value;
      v39.__begin_ = begin;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    v19 = v39.__end_;
  }

  if (v19 == begin) {
    v26 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Span>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Span>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Span>> const&)::t;
  }
  else {
    v26 = begin;
  }
  unsigned int v27 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v26, v19 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v28 = *((_DWORD *)a3 + 8);
  int v29 = *((_DWORD *)a3 + 12);
  int v30 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v33);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v27);
  v31.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v28 - v29 + v30);
  if (begin)
  {
    v39.__end_ = begin;
    operator delete(begin);
  }
  return v31;
}

- (NSArray)spans
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"spans"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
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
            __int16 v12 = [[QSSSpan alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"spans"];
  }
  return (NSArray *)v3;
}

- (NSString)text
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

- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3 root:(const WebTranslationInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSWebTranslationInfo;
  uint64_t v10 = [(QSSWebTranslationInfo *)&v30 init];
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
      a4 = (const WebTranslationInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::WebTranslationInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::WebTranslationInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3 root:(const WebTranslationInfo *)a4
{
  return [(QSSWebTranslationInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSWebTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSWebTranslationInfo)initWithFlatbuffData:(id)a3
{
  return [(QSSWebTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end