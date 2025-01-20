@interface FLTSSUCategoryGroup
- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3;
- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4;
- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4 verify:(BOOL)a5;
- (NSArray)negative_examples;
- (NSArray)positive_intents;
- (NSString)name;
- (Offset<SSUCategoryGroup>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)negative_examples_objectAtIndex:(unint64_t)a3;
- (id)positive_intents_objectAtIndex:(unint64_t)a3;
- (unint64_t)negative_examples_count;
- (unint64_t)positive_intents_count;
- (void)negative_examples_enumerateObjectsUsingBlock:(id)a3;
- (void)positive_intents_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTSSUCategoryGroup

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
  v2.var0 = [(FLTSSUCategoryGroup *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__35__FLTSSUCategoryGroup_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUCategoryGroup>)addObjectToBuffer:(void *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FLTSSUCategoryGroup *)self name];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1F23304F0;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  long long v9 = [(FLTSSUCategoryGroup *)self positive_intents];
  unint64_t v10 = [v9 count];
  if (v10)
  {
    if (v10 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v10);
    uint64_t v13 = &v11[4 * v12];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v14 = [(FLTSSUCategoryGroup *)self positive_intents];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v71 objects:v76 count:16];
  v61 = self;
  v63 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  if (v15)
  {
    uint64_t v16 = *(void *)v72;
    v17 = v11;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v72 != v16) {
          objc_enumerationMutation(v14);
        }
        int v19 = [*(id *)(*((void *)&v71 + 1) + 8 * i) addObjectToBuffer:v63];
        int v20 = v19;
        if (v17 >= v13)
        {
          uint64_t v21 = (v17 - v11) >> 2;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v13 - v11) >> 1 > v22) {
            unint64_t v22 = (v13 - v11) >> 1;
          }
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v22;
          }
          if (v23) {
            unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v23);
          }
          else {
            uint64_t v24 = 0;
          }
          v25 = (char *)(v23 + 4 * v21);
          *(_DWORD *)v25 = v20;
          v26 = v25 + 4;
          while (v17 != v11)
          {
            int v27 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v25 - 1) = v27;
            v25 -= 4;
          }
          uint64_t v13 = (char *)(v23 + 4 * v24);
          if (v11) {
            operator delete(v11);
          }
          uint64_t v11 = v25;
          v17 = v26;
        }
        else
        {
          *(_DWORD *)v17 = v19;
          v17 += 4;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  uint64_t v28 = v17 - v11;
  if (v17 == v11) {
    v29 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUIntent>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUIntent>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUIntent>> const&)::t;
  }
  else {
    v29 = v11;
  }
  uint64_t v30 = v28 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v63, v28 >> 2, 4uLL);
  if (v11 == v17)
  {
    LODWORD(v30) = 0;
  }
  else
  {
    v31 = v29 - 4;
    uint64_t v32 = v30;
    do
    {
      int v33 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v63, *(_DWORD *)&v31[4 * v32]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v63, v33);
      --v32;
    }
    while (v32);
  }
  unsigned int v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v63, v30);
  v68 = 0;
  v69 = 0;
  unint64_t v70 = 0;
  v35 = [(FLTSSUCategoryGroup *)v61 negative_examples];
  std::vector<apple::aiml::flatbuffers2::Offset<SSUExample>>::reserve((void **)&v68, [v35 count]);

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v36 = [(FLTSSUCategoryGroup *)v61 negative_examples];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v64 objects:v75 count:16];
  unsigned int v59 = v34;
  v38 = v68;
  if (v37)
  {
    uint64_t v62 = *(void *)v65;
    unint64_t v39 = v70;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v65 != v62) {
          objc_enumerationMutation(v36);
        }
        int v41 = [*(id *)(*((void *)&v64 + 1) + 8 * j) addObjectToBuffer:v63];
        int v42 = v41;
        v43 = v69;
        if ((unint64_t)v69 >= v39)
        {
          uint64_t v45 = (v69 - v38) >> 2;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
          {
            unint64_t v70 = v39;
            v68 = v38;
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v39 - (void)v38) >> 1 > v46) {
            unint64_t v46 = (uint64_t)(v39 - (void)v38) >> 1;
          }
          if (v39 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v47 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v46;
          }
          if (v47) {
            unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v47);
          }
          else {
            uint64_t v48 = 0;
          }
          v49 = (_DWORD *)(v47 + 4 * v45);
          _DWORD *v49 = v42;
          v44 = (char *)(v49 + 1);
          while (v43 != v38)
          {
            int v50 = *((_DWORD *)v43 - 1);
            v43 -= 4;
            *--v49 = v50;
          }
          unint64_t v39 = v47 + 4 * v48;
          v69 = v44;
          if (v38) {
            operator delete(v38);
          }
          v38 = v49;
        }
        else
        {
          *(_DWORD *)v69 = v41;
          v44 = v43 + 4;
        }
        v69 = v44;
      }
      unint64_t v70 = v39;
      v68 = v38;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v37);
  }
  else
  {
    v44 = v69;
  }

  if (v44 == v38) {
    v51 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUExample>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUExample>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUExample>> const&)::t;
  }
  else {
    v51 = v38;
  }
  unsigned int v52 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<SSUExample>(v63, (uint64_t)v51, (v44 - v38) >> 2);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v63);
  *((unsigned char *)v63 + 70) = 1;
  int v53 = *((_DWORD *)v63 + 8);
  int v54 = *((_DWORD *)v63 + 12);
  int v55 = *((_DWORD *)v63 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v63, 4, String);
  if (v59)
  {
    int v56 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v63, v59);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v63, 6, v56, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<SSUExample>>>(v63, v52);
  v57.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v63, v53 - v54 + v55);
  if (v38)
  {
    v69 = v38;
    operator delete(v38);
  }
  if (v11) {
    operator delete(v11);
  }
  return v57;
}

- (void)negative_examples_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FLTSSUExample *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"negative_examples"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    size_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        unint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            uint64_t v16 = [[FLTSSUExample alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)negative_examples_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"negative_examples"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)negative_examples_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"negative_examples"];
  char v6 = v5;
  if (v5)
  {
    long long v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  unint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      long long v7 = [[FLTSSUExample alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)negative_examples
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"negative_examples"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__FLTSSUCategoryGroup_negative_examples__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUCategoryGroup *)self negative_examples_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"negative_examples"];
  }
  return (NSArray *)v3;
}

uint64_t __40__FLTSSUCategoryGroup_negative_examples__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)positive_intents_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FLTSSUIntent *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"positive_intents"];
  char v6 = v5;
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
        unint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            uint64_t v16 = [[FLTSSUIntent alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)positive_intents_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"positive_intents"];
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

- (id)positive_intents_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"positive_intents"];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  unint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      id v7 = [[FLTSSUIntent alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)positive_intents
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"positive_intents"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__FLTSSUCategoryGroup_positive_intents__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUCategoryGroup *)self positive_intents_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"positive_intents"];
  }
  return (NSArray *)v3;
}

uint64_t __39__FLTSSUCategoryGroup_positive_intents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUCategoryGroup;
  unint64_t v10 = [(FLTSSUCategoryGroup *)&v26 init];
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
    a4 = (const SSUCategoryGroup *)v12 + *v12;
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
  unsigned __int8 v19 = (SSUCategoryGroup *)v10->_root;
  if (v19 && !SSUCategoryGroup::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    int v20 = 0;
  else {
LABEL_14:
  }
    int v20 = v10;

  return v20;
}

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4
{
  return [(FLTSSUCategoryGroup *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUCategoryGroup *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUCategoryGroup *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end