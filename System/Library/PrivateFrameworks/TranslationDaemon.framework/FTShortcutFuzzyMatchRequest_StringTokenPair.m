@interface FTShortcutFuzzyMatchRequest_StringTokenPair
- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3;
- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4;
- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4 verify:(BOOL)a5;
- (NSArray)tokens;
- (NSString)raw_string;
- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)tokens_objectAtIndex:(unint64_t)a3;
- (unint64_t)tokens_count;
- (void)tokens_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTShortcutFuzzyMatchRequest_StringTokenPair

- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4
{
  return [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTShortcutFuzzyMatchRequest_StringTokenPair;
  v10 = [(FTShortcutFuzzyMatchRequest_StringTokenPair *)&v26 init];
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
    a4 = (const StringTokenPair *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ContextWithPronHints *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::ContextWithPronHints::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)raw_string
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

- (NSArray)tokens
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__FTShortcutFuzzyMatchRequest_StringTokenPair_tokens__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self tokens_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tokens"];
  }
  return (NSArray *)v3;
}

- (id)tokens_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
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
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
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

- (unint64_t)tokens_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    uint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)tokens_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
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

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>)addObjectToBuffer:(void *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self raw_string];
  v6 = v5;
  if (!v5) {
    unint64_t v5 = &stru_270C008E8;
  }
  uint64_t v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v40, 0, sizeof(v40));
  uint64_t v9 = [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self tokens];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v40, [v9 count]);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v10 = [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self tokens];
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
        uint64_t v14 = (const char *)[*(id *)(*((void *)&v36 + 1) + 8 * i) UTF8String];
        size_t v15 = strlen(v14);
        int v16 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14, v15);
        int v17 = v16;
        std::vector<int>::pointer end = v40.__end_;
        if (v40.__end_ >= v40.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v40.__begin_;
          int64_t v21 = v40.__end_ - v40.__begin_;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v23 = (char *)v40.__end_cap_.__value_ - (char *)v40.__begin_;
          if (((char *)v40.__end_cap_.__value_ - (char *)v40.__begin_) >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            char v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v40.__end_cap_, v24);
            std::vector<int>::pointer begin = v40.__begin_;
            std::vector<int>::pointer end = v40.__end_;
          }
          else
          {
            char v25 = 0;
          }
          objc_super v26 = (int *)&v25[4 * v21];
          *objc_super v26 = v17;
          unsigned __int8 v19 = v26 + 1;
          while (end != begin)
          {
            int v27 = *--end;
            *--objc_super v26 = v27;
          }
          v40.__begin_ = v26;
          v40.__end_ = v19;
          v40.__end_cap_.__value_ = (int *)&v25[4 * v24];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v40.__end_ = v16;
          unsigned __int8 v19 = end + 1;
        }
        v40.__end_ = v19;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }

  if (v40.__end_ == v40.__begin_) {
    std::vector<int>::pointer v28 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    std::vector<int>::pointer v28 = v40.__begin_;
  }
  int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v28, v40.__end_ - v40.__begin_);
  *((unsigned char *)a3 + 70) = 1;
  int v30 = *((_DWORD *)a3 + 8);
  int v31 = *((_DWORD *)a3 + 12);
  int v32 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v29);
  v33.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v30 - (unsigned __int16)v31 + v32);
  if (v40.__begin_)
  {
    v40.__end_ = v40.__begin_;
    operator delete(v40.__begin_);
  }
  return v33;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTShortcutFuzzyMatchRequest_StringTokenPair *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end