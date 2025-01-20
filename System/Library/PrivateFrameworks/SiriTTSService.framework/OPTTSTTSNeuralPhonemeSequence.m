@interface OPTTSTTSNeuralPhonemeSequence
- (NSArray)phonemes;
- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3;
- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSNeuralPhonemeSequence *)a4;
- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSNeuralPhonemeSequence *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)phonemes_objectAtIndex:(unint64_t)a3;
- (unint64_t)phonemes_count;
- (void)phonemes_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSTTSNeuralPhonemeSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTTSNeuralPhonemeSequence *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__45__OPTTSTTSNeuralPhonemeSequence_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>)addObjectToBuffer:(void *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v36 = 0;
  v37 = 0;
  unint64_t v38 = 0;
  v4 = [(OPTTSTTSNeuralPhonemeSequence *)self phonemes];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v36, [v4 count]);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [(OPTTSTTSNeuralPhonemeSequence *)self phonemes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  long long v7 = v5;
  long long v8 = v36;
  if (v6)
  {
    uint64_t v9 = *(void *)v33;
    unint64_t v10 = v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = (const char *)[*(id *)(*((void *)&v32 + 1) + 8 * i) UTF8String];
        size_t v13 = strlen(v12);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);
        int v15 = String;
        v16 = v37;
        if ((unint64_t)v37 >= v10)
        {
          uint64_t v18 = (v37 - v8) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v36 = v8;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v10 - (void)v8) >> 1 > v19) {
            unint64_t v19 = (uint64_t)(v10 - (void)v8) >> 1;
          }
          if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (_DWORD *)(v20 + 4 * v18);
          _DWORD *v22 = v15;
          v17 = (char *)(v22 + 1);
          while (v16 != v8)
          {
            int v23 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *--v22 = v23;
          }
          unint64_t v10 = v20 + 4 * v21;
          v37 = v17;
          if (v8) {
            operator delete(v8);
          }
          long long v8 = v22;
        }
        else
        {
          *(_DWORD *)v37 = String;
          v17 = v16 + 4;
        }
        v37 = v17;
      }
      unint64_t v38 = v10;
      v36 = v8;
      uint64_t v6 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v6);
  }
  else
  {
    v17 = v37;
  }

  if (v17 == v8) {
    v24 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    v24 = v8;
  }
  unsigned int v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, (v17 - v8) >> 2);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v26 = *((void *)a3 + 5);
  uint64_t v27 = *((void *)a3 + 6);
  uint64_t v28 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v26);
  if (v8)
  {
    v37 = v8;
    operator delete(v8);
  }
  return v29;
}

- (void)phonemes_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    long long v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        unint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        size_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            v16 = (void *)[[NSString alloc] initWithBytes:&v13[*(unsigned int *)v13->var0 + 4] length:*(unsigned int *)v13[*(unsigned int *)v13->var0].var0 encoding:4];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)phonemes_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)phonemes_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = (void *)v7;
    goto LABEL_9;
  }
  root = self->_root;
  unint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      var0 = (unsigned int *)v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0].var0;
      uint64_t v7 = [[NSString alloc] initWithBytes:var0 + 1 length:*var0 encoding:4];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)phonemes
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__OPTTSTTSNeuralPhonemeSequence_phonemes__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTTSNeuralPhonemeSequence *)self phonemes_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phonemes"];
  }
  return (NSArray *)v3;
}

uint64_t __41__OPTTSTTSNeuralPhonemeSequence_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSNeuralPhonemeSequence *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTTSNeuralPhonemeSequence;
  unint64_t v10 = [(OPTTSTTSNeuralPhonemeSequence *)&v26 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_15;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TTSNeuralPhonemeSequence *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_15;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_19CEE1A20;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (siri::speech::schema_fb::TTSWordPhonemes *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TTSWordPhonemes::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    unint64_t v20 = 0;
  else {
LABEL_14:
  }
    unint64_t v20 = v10;

  return v20;
}

- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSNeuralPhonemeSequence *)a4
{
  return [(OPTTSTTSNeuralPhonemeSequence *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTTSNeuralPhonemeSequence *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTTSNeuralPhonemeSequence)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTTSNeuralPhonemeSequence *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end