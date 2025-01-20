@interface QSSRecognitionPhraseTokensAlternatives
- (BOOL)has_unsuggested_alternatives;
- (NSArray)tok_phrases;
- (Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>)addObjectToBuffer:(void *)a3;
- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3;
- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4;
- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSRecognitionPhraseTokensAlternatives

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
  v2.var0 = [(QSSRecognitionPhraseTokensAlternatives *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__54__QSSRecognitionPhraseTokensAlternatives_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecognitionPhraseTokensAlternatives>)addObjectToBuffer:(void *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  memset(&v35, 0, sizeof(v35));
  uint64_t v5 = [(QSSRecognitionPhraseTokensAlternatives *)self tok_phrases];
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v35, [v5 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(QSSRecognitionPhraseTokensAlternatives *)self tok_phrases];
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  v29 = self;
  begin = v35.__begin_;
  if (v6)
  {
    uint64_t v8 = *(void *)v32;
    value = v35.__end_cap_.__value_;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "addObjectToBuffer:", a3, v29);
        int v12 = v11;
        std::vector<int>::pointer end = v35.__end_;
        if (v35.__end_ >= value)
        {
          uint64_t v15 = v35.__end_ - begin;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
          {
            v35.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v16) {
            unint64_t v16 = ((char *)value - (char *)begin) >> 1;
          }
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          v19 = (int *)(v17 + 4 * v15);
          int *v19 = v12;
          v14 = v19 + 1;
          while (end != begin)
          {
            int v20 = *--end;
            *--v19 = v20;
          }
          value = (int *)(v17 + 4 * v18);
          v35.__end_ = v14;
          if (begin) {
            operator delete(begin);
          }
          begin = v19;
        }
        else
        {
          *v35.__end_ = v11;
          v14 = end + 1;
        }
        v35.__end_ = v14;
      }
      v35.__end_cap_.__value_ = value;
      v35.__begin_ = begin;
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }
  else
  {
    v14 = v35.__end_;
  }

  if (v14 == begin) {
    v21 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>> const&)::t;
  }
  else {
    v21 = begin;
  }
  unsigned int v22 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v21, v14 - begin);
  int v23 = [(QSSRecognitionPhraseTokensAlternatives *)v29 has_unsuggested_alternatives];
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v24 = *((_DWORD *)a3 + 8);
  int v25 = *((_DWORD *)a3 + 12);
  int v26 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v22);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 6, v23);
  v27.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v24 - v25 + v26);
  if (begin)
  {
    v35.__end_ = begin;
    operator delete(begin);
  }
  return v27;
}

- (BOOL)has_unsuggested_alternatives
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)tok_phrases
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tok_phrases"];
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
            int v12 = [[QSSRecognitionPhraseTokens alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tok_phrases"];
  }
  return (NSArray *)v3;
}

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionPhraseTokensAlternatives;
  uint64_t v10 = [(QSSRecognitionPhraseTokensAlternatives *)&v30 init];
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
      a4 = (const RecognitionPhraseTokensAlternatives *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionPhraseTokensAlternatives *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionPhraseTokensAlternatives::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3 root:(const RecognitionPhraseTokensAlternatives *)a4
{
  return [(QSSRecognitionPhraseTokensAlternatives *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionPhraseTokensAlternatives *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionPhraseTokensAlternatives)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionPhraseTokensAlternatives *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end