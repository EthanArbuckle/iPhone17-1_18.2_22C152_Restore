@interface QSSRecognitionPhraseTokens
- (NSArray)tokens;
- (Offset<siri::speech::schema_fb::RecognitionPhraseTokens>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3;
- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokens *)a4;
- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokens *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSRecognitionPhraseTokens

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
  v2.var0 = [(QSSRecognitionPhraseTokens *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__42__QSSRecognitionPhraseTokens_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecognitionPhraseTokens>)addObjectToBuffer:(void *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(&v34, 0, sizeof(v34));
  uint64_t v5 = [(QSSRecognitionPhraseTokens *)self tokens];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v34, [v5 count]);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  char v6 = [(QSSRecognitionPhraseTokens *)self tokens];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  id obj = v6;
  begin = v34.__begin_;
  if (v7)
  {
    uint64_t v9 = *(void *)v31;
    value = v34.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = [*(id *)(*((void *)&v30 + 1) + 8 * i) addObjectToBuffer:a3];
        int v13 = v12;
        std::vector<int>::pointer end = v34.__end_;
        if (v34.__end_ >= value)
        {
          uint64_t v16 = v34.__end_ - begin;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v34.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v17) {
            unint64_t v17 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v18) {
            unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          }
          else {
            uint64_t v19 = 0;
          }
          v20 = (int *)(v18 + 4 * v16);
          int *v20 = v13;
          v15 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--v20 = v21;
          }
          value = (int *)(v18 + 4 * v19);
          v34.__end_ = v15;
          if (begin) {
            operator delete(begin);
          }
          begin = v20;
        }
        else
        {
          *v34.__end_ = v12;
          v15 = end + 1;
        }
        v34.__end_ = v15;
      }
      v34.__end_cap_.__value_ = value;
      v34.__begin_ = begin;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
  else
  {
    v15 = v34.__end_;
  }

  if (v15 == begin) {
    v22 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>> const&)::t;
  }
  else {
    v22 = begin;
  }
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v22, v15 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v24 = *((void *)a3 + 5);
  uint64_t v25 = *((void *)a3 + 6);
  uint64_t v26 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v23);
  v27.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v26 - (int)v25 + (int)v24);
  if (begin)
  {
    v34.__end_ = begin;
    operator delete(begin);
  }
  return v27;
}

- (NSArray)tokens
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        uint64_t v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSRecognitionToken alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tokens"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokens *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionPhraseTokens;
  uint64_t v10 = [(QSSRecognitionPhraseTokens *)&v30 init];
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
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const RecognitionPhraseTokens *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionPhraseTokens *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionPhraseTokens::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unsigned int v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unsigned int v23 = v11;
LABEL_17:

  return v23;
}

- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokens *)a4
{
  return [(QSSRecognitionPhraseTokens *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionPhraseTokens *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionPhraseTokens)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionPhraseTokens *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end