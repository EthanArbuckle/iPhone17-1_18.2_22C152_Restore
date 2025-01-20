@interface FTShortcutFuzzyMatchRequest
- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3;
- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4;
- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5;
- (FTShortcutFuzzyMatchRequest_StringTokenPair)utterance;
- (NSArray)shortcuts;
- (NSString)context;
- (NSString)device_type;
- (NSString)interaction_id;
- (NSString)locale;
- (NSString)request_id;
- (NSString)session_id;
- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)shortcuts_objectAtIndex:(unint64_t)a3;
- (unint64_t)shortcuts_count;
- (void)shortcuts_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTShortcutFuzzyMatchRequest

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4
{
  return [(FTShortcutFuzzyMatchRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTShortcutFuzzyMatchRequest;
  v10 = [(FTShortcutFuzzyMatchRequest *)&v26 init];
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
    a4 = (const ShortcutFuzzyMatchRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ShortcutFuzzyMatchRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::ShortcutFuzzyMatchRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTShortcutFuzzyMatchRequest_StringTokenPair)utterance
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"utterance"];
  if (!v3)
  {
    v4 = [FTShortcutFuzzyMatchRequest_StringTokenPair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTShortcutFuzzyMatchRequest_StringTokenPair *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"utterance"];
  }
  return v3;
}

- (NSArray)shortcuts
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcuts"];
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__FTShortcutFuzzyMatchRequest_shortcuts__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTShortcutFuzzyMatchRequest *)self shortcuts_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"shortcuts"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FTShortcutFuzzyMatchRequest_shortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)shortcuts_objectAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcuts"];
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
      id v7 = [[FTShortcutFuzzyMatchRequest_StringTokenPair alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)shortcuts_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcuts"];
  v4 = v3;
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

- (void)shortcuts_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FTShortcutFuzzyMatchRequest_StringTokenPair *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"shortcuts"];
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
            uint64_t v17 = [[FTShortcutFuzzyMatchRequest_StringTokenPair alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (NSString)request_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)interaction_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)device_type
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)context
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(FTShortcutFuzzyMatchRequest *)self utterance];
  int v5 = [v4 addObjectToBuffer:a3];

  memset(&v65, 0, sizeof(v65));
  v6 = [(FTShortcutFuzzyMatchRequest *)self shortcuts];
  int v58 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v65, [v6 count]);

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v7 = [(FTShortcutFuzzyMatchRequest *)self shortcuts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = [*(id *)(*((void *)&v61 + 1) + 8 * i) addObjectToBuffer:a3];
        int v12 = v11;
        std::vector<int>::pointer end = v65.__end_;
        if (v65.__end_ >= v65.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v65.__begin_;
          int64_t v16 = v65.__end_ - v65.__begin_;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v18 = (char *)v65.__end_cap_.__value_ - (char *)v65.__begin_;
          if (((char *)v65.__end_cap_.__value_ - (char *)v65.__begin_) >> 1 > v17) {
            unint64_t v17 = v18 >> 1;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          if (v19)
          {
            unsigned __int8 v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v65.__end_cap_, v19);
            std::vector<int>::pointer begin = v65.__begin_;
            std::vector<int>::pointer end = v65.__end_;
          }
          else
          {
            unsigned __int8 v20 = 0;
          }
          v21 = (int *)&v20[4 * v16];
          int *v21 = v12;
          uint64_t v14 = v21 + 1;
          while (end != begin)
          {
            int v22 = *--end;
            *--v21 = v22;
          }
          v65.__begin_ = v21;
          v65.__end_ = v14;
          v65.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v65.__end_ = v11;
          uint64_t v14 = end + 1;
        }
        v65.__end_ = v14;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v8);
  }

  if (v65.__end_ == v65.__begin_) {
    std::vector<int>::pointer v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>> const&)::t;
  }
  else {
    std::vector<int>::pointer v23 = v65.__begin_;
  }
  int v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v65.__end_ - v65.__begin_);
  char v25 = [(FTShortcutFuzzyMatchRequest *)self request_id];
  objc_super v26 = v25;
  if (!v25) {
    char v25 = &stru_270C008E8;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v30 = [(FTShortcutFuzzyMatchRequest *)self session_id];
  v31 = v30;
  if (!v30) {
    v30 = &stru_270C008E8;
  }
  v32 = (const char *)[(__CFString *)v30 UTF8String];
  size_t v33 = strlen(v32);
  int v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32, v33);

  v35 = [(FTShortcutFuzzyMatchRequest *)self interaction_id];
  v36 = v35;
  if (!v35) {
    v35 = &stru_270C008E8;
  }
  v37 = (const char *)[(__CFString *)v35 UTF8String];
  size_t v38 = strlen(v37);
  int v39 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v37, v38);

  v40 = [(FTShortcutFuzzyMatchRequest *)self locale];
  v41 = v40;
  if (!v40) {
    v40 = &stru_270C008E8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  int v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42, v43);

  v45 = [(FTShortcutFuzzyMatchRequest *)self device_type];
  v46 = v45;
  if (!v45) {
    v45 = &stru_270C008E8;
  }
  v47 = (const char *)[(__CFString *)v45 UTF8String];
  size_t v48 = strlen(v47);
  int v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);

  v50 = [(FTShortcutFuzzyMatchRequest *)self context];
  v51 = v50;
  if (!v50) {
    v50 = &stru_270C008E8;
  }
  v52 = (const char *)[(__CFString *)v50 UTF8String];
  size_t v53 = strlen(v52);
  LODWORD(v52) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v52, v53);

  *((unsigned char *)a3 + 70) = 1;
  int v60 = *((_DWORD *)a3 + 8);
  int v54 = *((_DWORD *)a3 + 12);
  int v55 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v34);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 14, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, (int)v52);
  v56.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v60 - (unsigned __int16)v54 + v55);
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  return v56;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTShortcutFuzzyMatchRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTShortcutFuzzyMatchRequest_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __53__FTShortcutFuzzyMatchRequest_StringTokenPair_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

apple::aiml::flatbuffers2::DetachedBuffer *__59__FTShortcutFuzzyMatchRequest_StringTokenPair_flatbuffData__block_invoke(uint64_t a1)
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