@interface QSSSpeechTranslationInfo
- (NSArray)raw_nbest_choices;
- (Offset<siri::speech::schema_fb::SpeechTranslationInfo>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionSausage)raw_sausage;
- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3;
- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4;
- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSSpeechTranslationInfo

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
  v2.var0 = [(QSSSpeechTranslationInfo *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__40__QSSSpeechTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationInfo>)addObjectToBuffer:(void *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSSpeechTranslationInfo *)self raw_sausage];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  memset(&v37, 0, sizeof(v37));
  long long v7 = [(QSSSpeechTranslationInfo *)self raw_nbest_choices];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v37, [v7 count]);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v8 = [(QSSSpeechTranslationInfo *)self raw_nbest_choices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  unsigned int v31 = v6;
  begin = v37.__begin_;
  if (v9)
  {
    uint64_t v11 = *(void *)v34;
    value = v37.__end_cap_.__value_;
    v32 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        int v14 = [*(id *)(*((void *)&v33 + 1) + 8 * i) addObjectToBuffer:a3];
        int v15 = v14;
        std::vector<int>::pointer end = v37.__end_;
        if (v37.__end_ >= value)
        {
          uint64_t v18 = v37.__end_ - begin;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v37.__begin_ = begin;
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
          v37.__end_ = v17;
          if (begin) {
            operator delete(begin);
          }
          begin = v22;
          long long v8 = v32;
        }
        else
        {
          *v37.__end_ = v14;
          v17 = end + 1;
        }
        v37.__end_ = v17;
      }
      v37.__end_cap_.__value_ = value;
      v37.__begin_ = begin;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }
  else
  {
    v17 = v37.__end_;
  }

  if (v17 == begin) {
    v24 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  }
  else {
    v24 = begin;
  }
  unsigned int v25 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v24, v17 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v26 = *((_DWORD *)a3 + 8);
  int v27 = *((_DWORD *)a3 + 12);
  int v28 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v31);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v25);
  v29.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v26 - v27 + v28);
  if (begin)
  {
    v37.__end_ = begin;
    operator delete(begin);
  }
  return v29;
}

- (NSArray)raw_nbest_choices
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_nbest_choices"];
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
            __int16 v12 = [[QSSRecognitionChoice alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_nbest_choices"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionSausage)raw_sausage
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"raw_sausage"];
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    uint64_t v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    v3 = [(QSSRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"raw_sausage"];
  }
  return v3;
}

- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSpeechTranslationInfo;
  uint64_t v10 = [(QSSSpeechTranslationInfo *)&v30 init];
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
      a4 = (const SpeechTranslationInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SpeechTranslationInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SpeechTranslationInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4
{
  return [(QSSSpeechTranslationInfo *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSpeechTranslationInfo)initWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationInfo *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end