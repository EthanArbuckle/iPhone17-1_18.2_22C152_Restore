@interface QSSTTSPhonemeSequence
- (NSArray)word_phonemes;
- (Offset<siri::speech::schema_fb::TTSPhonemeSequence>)addObjectToBuffer:(void *)a3;
- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3;
- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4;
- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTTSPhonemeSequence

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
  v2.var0 = [(QSSTTSPhonemeSequence *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__37__QSSTTSPhonemeSequence_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TTSPhonemeSequence>)addObjectToBuffer:(void *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(QSSTTSPhonemeSequence *)self word_phonemes];
  unint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    long long v9 = &v7[4 * v8];
  }
  else
  {
    long long v7 = 0;
    long long v9 = 0;
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [(QSSTTSPhonemeSequence *)self word_phonemes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    uint64_t v13 = v7;
    v37 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v38 + 1) + 8 * i) addObjectToBuffer:a3];
        int v16 = v15;
        if (v13 >= v9)
        {
          uint64_t v17 = (v13 - v7) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((v9 - v7) >> 1 > v18) {
            unint64_t v18 = (v9 - v7) >> 1;
          }
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            int v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          long long v9 = (char *)(v19 + 4 * v20);
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v21;
          uint64_t v13 = v22;
          uint64_t v10 = v37;
        }
        else
        {
          *(_DWORD *)uint64_t v13 = v15;
          v13 += 4;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = v7;
  }

  uint64_t v24 = v13 - v7;
  if (v13 == v7) {
    v25 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSWordPhonemes>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSWordPhonemes>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSWordPhonemes>> const&)::t;
  }
  else {
    v25 = v7;
  }
  uint64_t v26 = v24 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    uint64_t v28 = v26;
    do
    {
      int v29 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
  }
  unsigned int v30 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v26);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v31 = *((void *)a3 + 5);
  uint64_t v32 = *((void *)a3 + 6);
  uint64_t v33 = *((void *)a3 + 4);
  if (v30)
  {
    int v34 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v30);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v34);
  }
  v35.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v33 - (int)v32 + (int)v31);
  if (v7) {
    operator delete(v7);
  }
  return v35;
}

- (NSArray)word_phonemes
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"word_phonemes"];
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
            uint64_t v12 = [[QSSTTSWordPhonemes alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"word_phonemes"];
  }
  return (NSArray *)v3;
}

- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTTSPhonemeSequence;
  uint64_t v10 = [(QSSTTSPhonemeSequence *)&v30 init];
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
      a4 = (const TTSPhonemeSequence *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TTSPhonemeSequence *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TTSPhonemeSequence::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4
{
  return [(QSSTTSPhonemeSequence *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTTSPhonemeSequence *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTTSPhonemeSequence)initWithFlatbuffData:(id)a3
{
  return [(QSSTTSPhonemeSequence *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end