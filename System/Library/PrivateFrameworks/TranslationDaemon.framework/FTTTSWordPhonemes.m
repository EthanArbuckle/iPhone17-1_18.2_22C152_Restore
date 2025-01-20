@interface FTTTSWordPhonemes
- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3;
- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4;
- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4 verify:(BOOL)a5;
- (NSArray)phonemes;
- (Offset<siri::speech::schema_fb::TTSWordPhonemes>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)phonemes_objectAtIndex:(unint64_t)a3;
- (unint64_t)phonemes_count;
- (void)phonemes_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTTSWordPhonemes

- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3
{
  return [(FTTTSWordPhonemes *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTTSWordPhonemes *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4
{
  return [(FTTTSWordPhonemes *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTTSWordPhonemes;
  v10 = [(FTTTSWordPhonemes *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TTSWordPhonemes *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::AudioPacket *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::AudioPacket::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSArray)phonemes
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__FTTTSWordPhonemes_phonemes__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTTSWordPhonemes *)self phonemes_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phonemes"];
  }
  return (NSArray *)v3;
}

uint64_t __29__FTTTSWordPhonemes_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)phonemes_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      unint64_t v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
      uint64_t v7 = [[NSString alloc] initWithBytes:v13 + 1 length:*v13 encoding:4];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)phonemes_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)phonemes_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phonemes"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        uint64_t v11 = *(unsigned int *)v10->var0;
        if (v11)
        {
          uint64_t v12 = 4 - 4 * v11;
          uint64_t v13 = 1;
          uint64_t v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)[[NSString alloc] initWithBytes:&v10[v14 + *var0] length:*(unsigned int *)((char *)var0 + *var0) encoding:4];
            v4[2](v4, v16, v13 - 1, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            uint64_t v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }
}

- (Offset<siri::speech::schema_fb::TTSWordPhonemes>)addObjectToBuffer:(void *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  memset(&v35, 0, sizeof(v35));
  unint64_t v5 = [(FTTTSWordPhonemes *)self phonemes];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v35, [v5 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = [(FTTTSWordPhonemes *)self phonemes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = (const char *)[*(id *)(*((void *)&v31 + 1) + 8 * i) UTF8String];
        size_t v11 = strlen(v10);
        int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);
        int v13 = String;
        std::vector<int>::pointer end = v35.__end_;
        if (v35.__end_ >= v35.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v35.__begin_;
          int64_t v17 = v35.__end_ - v35.__begin_;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v19 = (char *)v35.__end_cap_.__value_ - (char *)v35.__begin_;
          if (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 1 > v18) {
            unint64_t v18 = v19 >> 1;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v35.__end_cap_, v20);
            std::vector<int>::pointer begin = v35.__begin_;
            std::vector<int>::pointer end = v35.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          int *v22 = v13;
          v15 = v22 + 1;
          while (end != begin)
          {
            int v23 = *--end;
            *--v22 = v23;
          }
          v35.__begin_ = v22;
          v35.__end_ = v15;
          v35.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v35.__end_ = String;
          v15 = end + 1;
        }
        v35.__end_ = v15;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  if (v35.__end_ == v35.__begin_) {
    std::vector<int>::pointer v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v24 = v35.__begin_;
  }
  int v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v35.__end_ - v35.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v26 = *((void *)a3 + 5);
  uint64_t v27 = *((void *)a3 + 6);
  uint64_t v28 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v25);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v28 - (unsigned __int16)v27 + (unsigned __int16)v26);
  if (v35.__begin_)
  {
    v35.__end_ = v35.__begin_;
    operator delete(v35.__begin_);
  }
  return v29;
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTTSWordPhonemes *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__33__FTTTSWordPhonemes_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end