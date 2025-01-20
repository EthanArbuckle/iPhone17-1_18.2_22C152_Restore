@interface FTLmScorerResponse
- (FTLmScorerResponse)initWithFlatbuffData:(id)a3;
- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4;
- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5;
- (NSArray)tokens;
- (NSString)return_str;
- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3;
- (double)ppl;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)tokens_objectAtIndex:(unint64_t)a3;
- (int)return_code;
- (unint64_t)tokens_count;
- (void)tokens_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTLmScorerResponse

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3
{
  return [(FTLmScorerResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTLmScorerResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4
{
  return [(FTLmScorerResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTLmScorerResponse;
  v10 = [(FTLmScorerResponse *)&v26 init];
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
    a4 = (const LmScorerResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::LmScorerResponse *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::LmScorerResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (int)return_code
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)return_str
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

- (NSArray)tokens
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28__FTLmScorerResponse_tokens__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTLmScorerResponse *)self tokens_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"tokens"];
  }
  return (NSArray *)v3;
}

uint64_t __28__FTLmScorerResponse_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)tokens_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"tokens"];
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
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTLmScorerToken alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
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
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
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
  uint64_t v4 = (void (**)(id, FTLmScorerToken *, uint64_t, unsigned __int8 *))a3;
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
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
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
            uint64_t v17 = [[FTLmScorerToken alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
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

- (double)ppl
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v5 = [(FTLmScorerResponse *)self return_code];
  v6 = [(FTLmScorerResponse *)self return_str];
  id v7 = v6;
  if (!v6) {
    v6 = &stru_270C008E8;
  }
  uint64_t v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  LODWORD(v8) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  memset(&v43, 0, sizeof(v43));
  v10 = [(FTLmScorerResponse *)self tokens];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v43, [v10 count]);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v11 = [(FTLmScorerResponse *)self tokens];
  int v36 = (int)v8;
  v37 = self;
  int v38 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        int v15 = [*(id *)(*((void *)&v39 + 1) + 8 * i) addObjectToBuffer:a3];
        int v16 = v15;
        std::vector<int>::pointer end = v43.__end_;
        if (v43.__end_ >= v43.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v43.__begin_;
          int64_t v20 = v43.__end_ - v43.__begin_;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v22 = (char *)v43.__end_cap_.__value_ - (char *)v43.__begin_;
          if (((char *)v43.__end_cap_.__value_ - (char *)v43.__begin_) >> 1 > v21) {
            unint64_t v21 = v22 >> 1;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v21;
          }
          if (v23)
          {
            uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v43.__end_cap_, v23);
            std::vector<int>::pointer begin = v43.__begin_;
            std::vector<int>::pointer end = v43.__end_;
          }
          else
          {
            uint64_t v24 = 0;
          }
          char v25 = (int *)&v24[4 * v20];
          *char v25 = v16;
          int v18 = v25 + 1;
          while (end != begin)
          {
            int v26 = *--end;
            *--char v25 = v26;
          }
          v43.__begin_ = v25;
          v43.__end_ = v18;
          v43.__end_cap_.__value_ = (int *)&v24[4 * v23];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v43.__end_ = v15;
          int v18 = end + 1;
        }
        v43.__end_ = v18;
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v12);
  }

  if (v43.__end_ == v43.__begin_) {
    std::vector<int>::pointer v27 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>> const&)::t;
  }
  else {
    std::vector<int>::pointer v27 = v43.__begin_;
  }
  int v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v27, v43.__end_ - v43.__begin_);
  [(FTLmScorerResponse *)v37 ppl];
  double v30 = v29;
  *((unsigned char *)a3 + 70) = 1;
  int v31 = *((_DWORD *)a3 + 8);
  int v32 = *((_DWORD *)a3 + 12);
  int v33 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 4, v38, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v36);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v28);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>(a3, 10, v30, 0.0);
  v34.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v31 - (unsigned __int16)v32 + v33);
  if (v43.__begin_)
  {
    v43.__end_ = v43.__begin_;
    operator delete(v43.__begin_);
  }
  return v34;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTLmScorerResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTLmScorerResponse_flatbuffData__block_invoke(uint64_t a1)
{
  double result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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