@interface FTTextToSpeechSpeechFeatureInputText
- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputText *)a4;
- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputText *)a4 verify:(BOOL)a5;
- (NSArray)words;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)words_objectAtIndex:(unint64_t)a3;
- (unint64_t)words_count;
- (void)words_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTextToSpeechSpeechFeatureInputText

- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechSpeechFeatureInputText *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechSpeechFeatureInputText *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputText *)a4
{
  return [(FTTextToSpeechSpeechFeatureInputText *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechSpeechFeatureInputText)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputText *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechSpeechFeatureInputText;
  v10 = [(FTTextToSpeechSpeechFeatureInputText *)&v26 init];
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
    a4 = (const TextToSpeechSpeechFeatureInputText *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)words
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"words"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__FTTextToSpeechSpeechFeatureInputText_words__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechSpeechFeatureInputText *)self words_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"words"];
  }
  return (NSArray *)v3;
}

uint64_t __45__FTTextToSpeechSpeechFeatureInputText_words__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)words_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"words"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
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
      id v7 = [[FTTextToSpeechSpeechFeatureInputWord alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)words_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"words"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)words_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTTextToSpeechSpeechFeatureInputWord *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"words"];
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
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTTextToSpeechSpeechFeatureInputWord alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputText>)addObjectToBuffer:(void *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  memset(&v33, 0, sizeof(v33));
  unint64_t v5 = [(FTTextToSpeechSpeechFeatureInputText *)self words];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v33, [v5 count]);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = [(FTTextToSpeechSpeechFeatureInputText *)self words];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) addObjectToBuffer:a3];
        int v11 = v10;
        std::vector<int>::pointer end = v33.__end_;
        if (v33.__end_ >= v33.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v33.__begin_;
          int64_t v15 = v33.__end_ - v33.__begin_;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v17 = (char *)v33.__end_cap_.__value_ - (char *)v33.__begin_;
          if (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v33.__end_cap_, v18);
            std::vector<int>::pointer begin = v33.__begin_;
            std::vector<int>::pointer end = v33.__end_;
          }
          else
          {
            uint64_t v19 = 0;
          }
          unsigned __int8 v20 = (int *)&v19[4 * v15];
          int *v20 = v11;
          uint64_t v13 = v20 + 1;
          while (end != begin)
          {
            int v21 = *--end;
            *--unsigned __int8 v20 = v21;
          }
          v33.__begin_ = v20;
          v33.__end_ = v13;
          v33.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v33.__end_ = v10;
          uint64_t v13 = end + 1;
        }
        v33.__end_ = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  if (v33.__end_ == v33.__begin_) {
    std::vector<int>::pointer v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWord>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWord>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWord>> const&)::t;
  }
  else {
    std::vector<int>::pointer v22 = v33.__begin_;
  }
  int v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v33.__end_ - v33.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v24 = *((void *)a3 + 5);
  uint64_t v25 = *((void *)a3 + 6);
  uint64_t v26 = *((void *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v23);
  v27.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26 - (unsigned __int16)v25 + (unsigned __int16)v24);
  if (v33.__begin_)
  {
    v33.__end_ = v33.__begin_;
    operator delete(v33.__begin_);
  }
  return v27;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechSpeechFeatureInputText *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__52__FTTextToSpeechSpeechFeatureInputText_flatbuffData__block_invoke(uint64_t a1)
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