@interface FLTCDMCATIBloomFilters
- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3;
- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4;
- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4 verify:(BOOL)a5;
- (FLTCDMCATISwiftBloomFilter)general_bf;
- (NSArray)array_bf;
- (Offset<CDMCATIBloomFilters>)addObjectToBuffer:(void *)a3;
- (id)array_bf_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)array_bf_count;
- (void)array_bf_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTCDMCATIBloomFilters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_1C8C3EB40;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(FLTCDMCATIBloomFilters *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FLTCDMCATIBloomFilters_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<CDMCATIBloomFilters>)addObjectToBuffer:(void *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FLTCDMCATIBloomFilters *)self general_bf];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  long long v7 = [(FLTCDMCATIBloomFilters *)self array_bf];
  unint64_t v8 = [v7 count];
  if (v8)
  {
    if (v8 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    long long v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v8);
    uint64_t v11 = &v9[4 * v10];
  }
  else
  {
    long long v9 = 0;
    uint64_t v11 = 0;
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  __int16 v12 = [(FLTCDMCATIBloomFilters *)self array_bf];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  unsigned int v40 = v6;
  if (v13)
  {
    uint64_t v14 = *(void *)v43;
    v15 = v9;
    v41 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v12);
        }
        int v17 = [*(id *)(*((void *)&v42 + 1) + 8 * i) addObjectToBuffer:a3];
        int v18 = v17;
        if (v15 >= v11)
        {
          uint64_t v19 = (v15 - v9) >> 2;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v11 - v9) >> 1 > v20) {
            unint64_t v20 = (v11 - v9) >> 1;
          }
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v21) {
            unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v21);
          }
          else {
            uint64_t v22 = 0;
          }
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            int v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          uint64_t v11 = (char *)(v21 + 4 * v22);
          if (v9) {
            operator delete(v9);
          }
          long long v9 = v23;
          v15 = v24;
          __int16 v12 = v41;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  uint64_t v26 = v15 - v9;
  if (v15 == v9) {
    v27 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>,std::allocator<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>>>(std::vector<apple::aiml::flatbuffers2::Offset<CDMCATISwiftBloomFilter>> const&)::t;
  }
  else {
    v27 = v9;
  }
  uint64_t v28 = v26 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    uint64_t v30 = v28;
    do
    {
      int v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
  }
  unsigned int v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v33 = *((_DWORD *)a3 + 8);
  int v34 = *((_DWORD *)a3 + 12);
  int v35 = *((_DWORD *)a3 + 10);
  if (v40)
  {
    int v36 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v40);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v36, 0);
  }
  if (v32)
  {
    int v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v37, 0);
  }
  v38.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v33 - v34 + v35);
  if (v9) {
    operator delete(v9);
  }
  return v38;
}

- (void)array_bf_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FLTCDMCATISwiftBloomFilter *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"array_bf"];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    unint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            v16 = [[FLTCDMCATISwiftBloomFilter alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)array_bf_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"array_bf"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)array_bf_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"array_bf"];
  unsigned int v6 = v5;
  if (v5)
  {
    long long v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      long long v7 = [[FLTCDMCATISwiftBloomFilter alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)array_bf
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"array_bf"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__FLTCDMCATIBloomFilters_array_bf__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTCDMCATIBloomFilters *)self array_bf_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"array_bf"];
  }
  return (NSArray *)v3;
}

uint64_t __34__FLTCDMCATIBloomFilters_array_bf__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (FLTCDMCATISwiftBloomFilter)general_bf
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"general_bf"];
  if (!v3)
  {
    v4 = [FLTCDMCATISwiftBloomFilter alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v3 = [(FLTCDMCATISwiftBloomFilter *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"general_bf"];
  }
  return v3;
}

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FLTCDMCATIBloomFilters;
  uint64_t v10 = [(FLTCDMCATIBloomFilters *)&v33 init];
  if (!v10) {
    goto LABEL_28;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_29;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const CDMCATIBloomFilters *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_28;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_29;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v29[0] = v17;
  v29[1] = v18;
  long long v30 = xmmword_1C8C3EB50;
  uint64_t v31 = 0;
  char v32 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
  if (!v19) {
    goto LABEL_28;
  }
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)v29, v10->_root->var0))goto LABEL_29; {
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)v29, 4u))
  }
    goto LABEL_29;
  unint64_t v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  if (*v20 >= 5u)
  {
    uint64_t v21 = v20[2];
    if (v21)
    {
      if (!CDMCATISwiftBloomFilter::Verify((CDMCATISwiftBloomFilter *)v19 + v21 + *(unsigned int *)((char *)v19 + v21), (apple::aiml::flatbuffers2::Verifier *)v29))goto LABEL_29; {
    }
      }
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)v29, 6u)) {
    goto LABEL_29;
  }
  uint64_t v22 = *(int *)v19;
  if (*(unsigned __int16 *)((char *)v19 - v22) < 7u) {
    goto LABEL_28;
  }
  if (*(_WORD *)((char *)v19 - v22 + 6))
  {
    if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)v29, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v22 + 6)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v22 + 6)), 4uLL, 0))
    {
      uint64_t v22 = *(int *)v19;
      if (*(unsigned __int16 *)((char *)v19 - v22) < 7u) {
        goto LABEL_28;
      }
      goto LABEL_23;
    }
LABEL_29:
    v27 = 0;
    goto LABEL_30;
  }
LABEL_23:
  uint64_t v23 = *(unsigned __int16 *)((char *)v19 - v22 + 6);
  if (v23)
  {
    v24 = (CDMCATISwiftBloomFilter *)v19 + v23 + *(unsigned int *)((char *)v19 + v23);
    if (*(_DWORD *)v24->var0)
    {
      unint64_t v25 = 0;
      uint64_t v26 = v24 + 4;
      while (CDMCATISwiftBloomFilter::Verify(&v26[*(unsigned int *)v26->var0], (apple::aiml::flatbuffers2::Verifier *)v29))
      {
        ++v25;
        v26 += 4;
        if (v25 >= *(unsigned int *)v24->var0) {
          goto LABEL_28;
        }
      }
      goto LABEL_29;
    }
  }
LABEL_28:
  v27 = v10;
LABEL_30:

  return v27;
}

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3 root:(const CDMCATIBloomFilters *)a4
{
  return [(FLTCDMCATIBloomFilters *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATIBloomFilters *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTCDMCATIBloomFilters)initWithFlatbuffData:(id)a3
{
  return [(FLTCDMCATIBloomFilters *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end