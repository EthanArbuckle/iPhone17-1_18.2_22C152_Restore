@interface FTShortcutFuzzyMatchResponse
- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3;
- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4;
- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4 verify:(BOOL)a5;
- (NSArray)shortcut_score_pairs;
- (NSString)utterance;
- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)shortcut_score_pairs_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)shortcut_score_pairs_count;
- (void)shortcut_score_pairs_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTShortcutFuzzyMatchResponse

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4
{
  return [(FTShortcutFuzzyMatchResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTShortcutFuzzyMatchResponse;
  v10 = [(FTShortcutFuzzyMatchResponse *)&v26 init];
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
    a4 = (const ShortcutFuzzyMatchResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ShortcutFuzzyMatchResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::ShortcutFuzzyMatchResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)utterance
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

- (NSArray)shortcut_score_pairs
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcut_score_pairs"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__FTShortcutFuzzyMatchResponse_shortcut_score_pairs__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTShortcutFuzzyMatchResponse *)self shortcut_score_pairs_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"shortcut_score_pairs"];
  }
  return (NSArray *)v3;
}

uint64_t __52__FTShortcutFuzzyMatchResponse_shortcut_score_pairs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)shortcut_score_pairs_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcut_score_pairs"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTShortcutFuzzyMatchResponse_ShortcutScorePair alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)shortcut_score_pairs_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcut_score_pairs"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)shortcut_score_pairs_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTShortcutFuzzyMatchResponse_ShortcutScorePair *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcut_score_pairs"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
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
            uint64_t v17 = [[FTShortcutFuzzyMatchResponse_ShortcutScorePair alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (int)return_code
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTShortcutFuzzyMatchResponse *)self utterance];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v40, 0, sizeof(v40));
  uint64_t v9 = [(FTShortcutFuzzyMatchResponse *)self shortcut_score_pairs];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v40, [v9 count]);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v10 = [(FTShortcutFuzzyMatchResponse *)self shortcut_score_pairs];
  int v34 = (int)v7;
  v35 = self;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) addObjectToBuffer:a3];
        int v15 = v14;
        std::vector<int>::pointer end = v40.__end_;
        if (v40.__end_ >= v40.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v40.__begin_;
          int64_t v19 = v40.__end_ - v40.__begin_;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v21 = (char *)v40.__end_cap_.__value_ - (char *)v40.__begin_;
          if (((char *)v40.__end_cap_.__value_ - (char *)v40.__begin_) >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            long long v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v40.__end_cap_, v22);
            std::vector<int>::pointer begin = v40.__begin_;
            std::vector<int>::pointer end = v40.__end_;
          }
          else
          {
            long long v23 = 0;
          }
          uint64_t v24 = (int *)&v23[4 * v19];
          *uint64_t v24 = v15;
          uint64_t v17 = v24 + 1;
          while (end != begin)
          {
            int v25 = *--end;
            *--uint64_t v24 = v25;
          }
          v40.__begin_ = v24;
          v40.__end_ = v17;
          v40.__end_cap_.__value_ = (int *)&v23[4 * v22];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v40.__end_ = v14;
          uint64_t v17 = end + 1;
        }
        v40.__end_ = v17;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }

  if (v40.__end_ == v40.__begin_) {
    std::vector<int>::pointer v26 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>> const&)::t;
  }
  else {
    std::vector<int>::pointer v26 = v40.__begin_;
  }
  int v27 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v26, v40.__end_ - v40.__begin_);
  int v28 = [(FTShortcutFuzzyMatchResponse *)v35 return_code];
  *((unsigned char *)a3 + 70) = 1;
  int v29 = *((_DWORD *)a3 + 8);
  int v30 = *((_DWORD *)a3 + 12);
  int v31 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v34);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v27);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 8, v28, 0);
  v32.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v29 - (unsigned __int16)v30 + v31);
  if (v40.__begin_)
  {
    v40.__end_ = v40.__begin_;
    operator delete(v40.__begin_);
  }
  return v32;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTShortcutFuzzyMatchResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__44__FTShortcutFuzzyMatchResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__62__FTShortcutFuzzyMatchResponse_ShortcutScorePair_flatbuffData__block_invoke(uint64_t a1)
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