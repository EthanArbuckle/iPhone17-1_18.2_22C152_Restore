@interface FTTextToSpeechSpeechFeatureRequest
- (BOOL)support_homograph;
- (FTTextToSpeechSpeechFeatureInputText)text;
- (FTTextToSpeechSpeechFeatureInputWave)wave_data;
- (FTTextToSpeechSpeechFeatureModelIdentifier)model_id;
- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4;
- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4 verify:(BOOL)a5;
- (NSArray)lexicon;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)lexicon_objectAtIndex:(unint64_t)a3;
- (unint64_t)lexicon_count;
- (void)lexicon_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTTextToSpeechSpeechFeatureRequest

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4
{
  return [(FTTextToSpeechSpeechFeatureRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechSpeechFeatureRequest;
  v10 = [(FTTextToSpeechSpeechFeatureRequest *)&v26 init];
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
    a4 = (const TextToSpeechSpeechFeatureRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FTTextToSpeechSpeechFeatureModelIdentifier)model_id
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"model_id"];
  if (!v3)
  {
    uint64_t v4 = [FTTextToSpeechSpeechFeatureModelIdentifier alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTTextToSpeechSpeechFeatureModelIdentifier *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"model_id"];
  }
  return v3;
}

- (FTTextToSpeechSpeechFeatureInputText)text
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"text"];
  if (!v3)
  {
    uint64_t v4 = [FTTextToSpeechSpeechFeatureInputText alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (uint64_t v7 = *(unsigned __int16 *)v6[10].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTTextToSpeechSpeechFeatureInputText *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"text"];
  }
  return v3;
}

- (FTTextToSpeechSpeechFeatureInputWave)wave_data
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"wave_data"];
  if (!v3)
  {
    uint64_t v4 = [FTTextToSpeechSpeechFeatureInputWave alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    uint64_t v3 = [(FTTextToSpeechSpeechFeatureInputWave *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"wave_data"];
  }
  return v3;
}

- (NSArray)lexicon
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"lexicon"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__FTTextToSpeechSpeechFeatureRequest_lexicon__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTTextToSpeechSpeechFeatureRequest *)self lexicon_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"lexicon"];
  }
  return (NSArray *)v3;
}

uint64_t __45__FTTextToSpeechSpeechFeatureRequest_lexicon__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)lexicon_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"lexicon"];
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
  if (*(unsigned __int16 *)v10->var0 >= 0xFu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[14].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTTextToSpeechSpeechFeatureRequest_LexiconEntry alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)lexicon_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"lexicon"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (uint64_t v8 = *(unsigned __int16 *)v7[14].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)lexicon_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTTextToSpeechSpeechFeatureRequest_LexiconEntry *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"lexicon"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[14].var0;
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
            uint64_t v17 = [[FTTextToSpeechSpeechFeatureRequest_LexiconEntry alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (BOOL)support_homograph
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTTextToSpeechSpeechFeatureRequest *)self speech_id];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  v10 = [(FTTextToSpeechSpeechFeatureRequest *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    v10 = &stru_270C008E8;
  }
  uint64_t v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  int v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  uint64_t v15 = [(FTTextToSpeechSpeechFeatureRequest *)self model_id];
  LODWORD(v12) = [v15 addObjectToBuffer:a3];

  uint64_t v16 = [(FTTextToSpeechSpeechFeatureRequest *)self text];
  int v17 = [v16 addObjectToBuffer:a3];

  int v18 = [(FTTextToSpeechSpeechFeatureRequest *)self wave_data];
  int v44 = [v18 addObjectToBuffer:a3];

  memset(&v52, 0, sizeof(v52));
  uint64_t v19 = [(FTTextToSpeechSpeechFeatureRequest *)self lexicon];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v52, [v19 count]);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unsigned __int8 v20 = [(FTTextToSpeechSpeechFeatureRequest *)self lexicon];
  int v45 = v17;
  int v46 = (int)v12;
  int v47 = v14;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v20);
        }
        int v24 = [*(id *)(*((void *)&v48 + 1) + 8 * i) addObjectToBuffer:a3];
        int v25 = v24;
        std::vector<int>::pointer end = v52.__end_;
        if (v52.__end_ >= v52.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v52.__begin_;
          int64_t v29 = v52.__end_ - v52.__begin_;
          unint64_t v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v31 = (char *)v52.__end_cap_.__value_ - (char *)v52.__begin_;
          if (((char *)v52.__end_cap_.__value_ - (char *)v52.__begin_) >> 1 > v30) {
            unint64_t v30 = v31 >> 1;
          }
          if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v32 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v32 = v30;
          }
          if (v32)
          {
            v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v52.__end_cap_, v32);
            std::vector<int>::pointer begin = v52.__begin_;
            std::vector<int>::pointer end = v52.__end_;
          }
          else
          {
            v33 = 0;
          }
          v34 = (int *)&v33[4 * v29];
          int *v34 = v25;
          v27 = v34 + 1;
          while (end != begin)
          {
            int v35 = *--end;
            *--v34 = v35;
          }
          v52.__begin_ = v34;
          v52.__end_ = v27;
          v52.__end_cap_.__value_ = (int *)&v33[4 * v32];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v52.__end_ = v24;
          v27 = end + 1;
        }
        v52.__end_ = v27;
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v21);
  }

  if (v52.__end_ == v52.__begin_) {
    std::vector<int>::pointer v36 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>> const&)::t;
  }
  else {
    std::vector<int>::pointer v36 = v52.__begin_;
  }
  int v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v36, v52.__end_ - v52.__begin_);
  int v38 = [(FTTextToSpeechSpeechFeatureRequest *)self support_homograph];
  *((unsigned char *)a3 + 70) = 1;
  int v39 = *((_DWORD *)a3 + 8);
  int v40 = *((_DWORD *)a3 + 12);
  int v41 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v46);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v37);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 16, v38, 0);
  v42.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v39 - (unsigned __int16)v40 + v41);
  if (v52.__begin_)
  {
    v52.__end_ = v52.__begin_;
    operator delete(v52.__begin_);
  }
  return v42;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechSpeechFeatureRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__50__FTTextToSpeechSpeechFeatureRequest_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTTextToSpeechSpeechFeatureRequest_LexiconEntry_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

@end