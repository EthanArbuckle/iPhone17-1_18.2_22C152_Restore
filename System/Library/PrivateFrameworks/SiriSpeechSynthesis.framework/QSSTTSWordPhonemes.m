@interface QSSTTSWordPhonemes
- (NSArray)phonemes;
- (Offset<siri::speech::schema_fb::TTSWordPhonemes>)addObjectToBuffer:(void *)a3;
- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3;
- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4;
- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTTSWordPhonemes

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
  v2.var0 = [(QSSTTSWordPhonemes *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__34__QSSTTSWordPhonemes_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TTSWordPhonemes>)addObjectToBuffer:(void *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v36, 0, sizeof(v36));
  v4 = [(QSSTTSWordPhonemes *)self phonemes];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v36, [v4 count]);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [(QSSTTSWordPhonemes *)self phonemes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  long long v7 = v5;
  begin = v36.__begin_;
  if (v6)
  {
    uint64_t v9 = *(void *)v33;
    value = v36.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = (const char *)[*(id *)(*((void *)&v32 + 1) + 8 * i) UTF8String];
        size_t v13 = strlen(v12);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);
        int v15 = String;
        std::vector<int>::pointer end = v36.__end_;
        if (v36.__end_ >= value)
        {
          uint64_t v18 = v36.__end_ - begin;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v36.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v19) {
            unint64_t v19 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (int *)(v20 + 4 * v18);
          int *v22 = v15;
          v17 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          value = (int *)(v20 + 4 * v21);
          v36.__end_ = v17;
          if (begin) {
            operator delete(begin);
          }
          begin = v22;
        }
        else
        {
          *v36.__end_ = String;
          v17 = end + 1;
        }
        v36.__end_ = v17;
      }
      v36.__end_cap_.__value_ = value;
      v36.__begin_ = begin;
      uint64_t v6 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
  else
  {
    v17 = v36.__end_;
  }

  if (v17 == begin) {
    v24 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v24 = begin;
  }
  unsigned int v25 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v24, v17 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v26 = *((void *)a3 + 5);
  uint64_t v27 = *((void *)a3 + 6);
  uint64_t v28 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v25);
  v29.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v26);
  if (begin)
  {
    v36.__end_ = begin;
    operator delete(begin);
  }
  return v29;
}

- (NSArray)phonemes
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
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
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            __int16 v12 = (void *)[[NSString alloc] initWithBytes:&v10[*(unsigned int *)v10->var0 + 4] length:*(unsigned int *)v10[*(unsigned int *)v10->var0].var0 encoding:4];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phonemes"];
  }
  return (NSArray *)v3;
}

- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTTSWordPhonemes;
  uint64_t v10 = [(QSSTTSWordPhonemes *)&v30 init];
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
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TTSWordPhonemes *)v13 + *v13;
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
      root = (siri::speech::schema_fb::AudioPacket *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioPacket::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4
{
  return [(QSSTTSWordPhonemes *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTTSWordPhonemes *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTTSWordPhonemes)initWithFlatbuffData:(id)a3
{
  return [(QSSTTSWordPhonemes *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end