@interface FLTSSUCategory
- (FLTSSUCategory)initWithFlatbuffData:(id)a3;
- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4;
- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4 verify:(BOOL)a5;
- (NSArray)groups;
- (Offset<SSUCategory>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)groups_objectAtIndex:(unint64_t)a3;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)type;
- (unint64_t)groups_count;
- (void)groups_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTSSUCategory

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
  v2.var0 = [(FLTSSUCategory *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__30__FLTSSUCategory_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUCategory>)addObjectToBuffer:(void *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(FLTSSUCategory *)self type];
  char v6 = [(FLTSSUCategory *)self groups];
  unint64_t v7 = [v6 count];
  if (v7)
  {
    if (v7 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    long long v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7);
    uint64_t v10 = &v8[4 * v9];
  }
  else
  {
    long long v8 = 0;
    uint64_t v10 = 0;
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v11 = [(FLTSSUCategory *)self groups];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
  int64_t v43 = v5;
  if (v12)
  {
    uint64_t v13 = *(void *)v46;
    v14 = v8;
    v44 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v11);
        }
        int v16 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "addObjectToBuffer:", a3, v43);
        int v17 = v16;
        if (v14 >= v10)
        {
          uint64_t v18 = (v14 - v8) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v10 - v8) >> 1 > v19) {
            unint64_t v19 = (v10 - v8) >> 1;
          }
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            int v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          uint64_t v10 = (char *)(v20 + 4 * v21);
          if (v8) {
            operator delete(v8);
          }
          long long v8 = v22;
          v14 = v23;
          uint64_t v11 = v44;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  uint64_t v25 = v14 - v8;
  if (v14 == v8) {
    v26 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUCategoryGroup>> const&)::t;
  }
  else {
    v26 = v8;
  }
  uint64_t v27 = v25 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    uint64_t v29 = v27;
    do
    {
      int v30 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v28[4 * v29]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v30);
      --v29;
    }
    while (v29);
  }
  unsigned int v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v32 = *((_DWORD *)a3 + 8);
  int v33 = *((_DWORD *)a3 + 12);
  int v34 = *((_DWORD *)a3 + 10);
  if ((_BYTE)v43 || *((unsigned char *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 1uLL);
    uint64_t v35 = *((void *)a3 + 6);
    *((void *)a3 + 6) = v35 - 1;
    *(unsigned char *)(v35 - 1) = v43;
    uint64_t v36 = *((void *)a3 + 5);
    uint64_t v37 = *((void *)a3 + 6);
    uint64_t v38 = *((void *)a3 + 4);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((void **)a3 + 7) = (v38 - v37 + v36) | 0x400000000;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    unsigned int v39 = *((unsigned __int16 *)a3 + 34);
    if (v39 <= 4) {
      LOWORD(v39) = 4;
    }
    *((_WORD *)a3 + 34) = v39;
  }
  if (v31)
  {
    int v40 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v40, 0);
  }
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32 - v33 + v34);
  if (v8) {
    operator delete(v8);
  }
  return v41;
}

- (void)groups_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FLTSSUCategoryGroup *, uint64_t, unsigned __int8 *))a3;
  int64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"groups"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    long long v8 = &root[-*(int *)root->var0];
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
            int v16 = [[FLTSSUCategoryGroup alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)groups_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"groups"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    unint64_t v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)groups_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"groups"];
  char v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 objectAtIndexedSubscript:a3];
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
      unint64_t v7 = [[FLTSSUCategoryGroup alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)groups
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"groups"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __24__FLTSSUCategory_groups__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUCategory *)self groups_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"groups"];
  }
  return (NSArray *)v3;
}

uint64_t __24__FLTSSUCategory_groups__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (int64_t)type
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return (char)root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUCategory;
  uint64_t v10 = [(FLTSSUCategory *)&v26 init];
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
    a4 = (const SSUCategory *)v12 + *v12;
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
  long long v23 = xmmword_1C8C3EB50;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (SSUCategory *)v10->_root;
  if (v19 && !SSUCategory::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    unint64_t v20 = 0;
  else {
LABEL_14:
  }
    unint64_t v20 = v10;

  return v20;
}

- (FLTSSUCategory)initWithFlatbuffData:(id)a3 root:(const SSUCategory *)a4
{
  return [(FLTSSUCategory *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUCategory *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUCategory)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUCategory *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end