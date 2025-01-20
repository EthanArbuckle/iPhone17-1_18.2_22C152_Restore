@interface QSSTextToSpeechSpeechFeatureInputWord
- (NSArray)phonemes;
- (NSString)word;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWord>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWord *)a4;
- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWord *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechSpeechFeatureInputWord

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
  v2.var0 = [(QSSTextToSpeechSpeechFeatureInputWord *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__53__QSSTextToSpeechSpeechFeatureInputWord_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWord>)addObjectToBuffer:(void *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v4 = [(QSSTextToSpeechSpeechFeatureInputWord *)self word];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = &stru_26DEBFAF8;
  }
  char v6 = (const char *)[(__CFString *)v4 UTF8String];
  size_t v7 = strlen(v6);
  LODWORD(v6) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  memset(&v41, 0, sizeof(v41));
  long long v8 = [(QSSTextToSpeechSpeechFeatureInputWord *)self phonemes];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v41, [v8 count]);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v9 = [(QSSTextToSpeechSpeechFeatureInputWord *)self phonemes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
  uint64_t v11 = v9;
  unsigned int v35 = v6;
  begin = v41.__begin_;
  if (v10)
  {
    uint64_t v13 = *(void *)v38;
    value = v41.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        v16 = (const char *)[*(id *)(*((void *)&v37 + 1) + 8 * i) UTF8String];
        size_t v17 = strlen(v16);
        int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);
        int v19 = String;
        std::vector<int>::pointer end = v41.__end_;
        if (v41.__end_ >= value)
        {
          uint64_t v22 = v41.__end_ - begin;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
          {
            v41.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v23) {
            unint64_t v23 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v24);
          }
          else {
            uint64_t v25 = 0;
          }
          v26 = (int *)(v24 + 4 * v22);
          int *v26 = v19;
          v21 = v26 + 1;
          while (end != begin)
          {
            int v27 = *--end;
            *--v26 = v27;
          }
          value = (int *)(v24 + 4 * v25);
          v41.__end_ = v21;
          if (begin) {
            operator delete(begin);
          }
          begin = v26;
        }
        else
        {
          *v41.__end_ = String;
          v21 = end + 1;
        }
        v41.__end_ = v21;
      }
      v41.__end_cap_.__value_ = value;
      v41.__begin_ = begin;
      uint64_t v10 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    v21 = v41.__end_;
  }

  if (v21 == begin) {
    v28 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  }
  else {
    v28 = begin;
  }
  unsigned int v29 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v28, v21 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v30 = *((_DWORD *)a3 + 8);
  int v31 = *((_DWORD *)a3 + 12);
  int v32 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v35);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v29);
  v33.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v30 - v31 + v32);
  if (begin)
  {
    v41.__end_ = begin;
    operator delete(begin);
  }
  return v33;
}

- (NSArray)phonemes
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
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
        size_t v7 = &root[v6];
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

- (NSString)word
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

- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWord *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechSpeechFeatureInputWord;
  uint64_t v10 = [(QSSTextToSpeechSpeechFeatureInputWord *)&v30 init];
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
      a4 = (const TextToSpeechSpeechFeatureInputWord *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ContextWithPronHints *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ContextWithPronHints::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          unint64_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  unint64_t v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWord *)a4
{
  return [(QSSTextToSpeechSpeechFeatureInputWord *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureInputWord *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechSpeechFeatureInputWord)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureInputWord *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end