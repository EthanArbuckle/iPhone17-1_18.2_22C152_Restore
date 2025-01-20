@interface FLTSSUFile
- (FLTSSUFile)initWithFlatbuffData:(id)a3;
- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4;
- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4 verify:(BOOL)a5;
- (FLTSSUMetadata)metadata;
- (NSArray)categories;
- (NSString)locale;
- (Offset<SSUFile>)addObjectToBuffer:(void *)a3;
- (id)categories_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)categories_count;
- (unsigned)format_version;
- (void)categories_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTSSUFile

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
  v2.var0 = [(FLTSSUFile *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__26__FLTSSUFile_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUFile>)addObjectToBuffer:(void *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int v51 = [(FLTSSUFile *)self format_version];
  v4 = [(FLTSSUFile *)self metadata];
  unsigned int v5 = [v4 addObjectToBuffer:a3];

  char v6 = [(FLTSSUFile *)self locale];
  long long v7 = v6;
  if (!v6) {
    char v6 = &stru_1F23304F0;
  }
  long long v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  uint64_t v10 = [(FLTSSUFile *)self categories];
  unint64_t v11 = [v10 count];
  __int16 v12 = a3;
  if (v11)
  {
    if (v11 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v11);
    v15 = &v13[4 * v14];
  }
  else
  {
    uint64_t v13 = 0;
    v15 = 0;
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v16 = [(FLTSSUFile *)self categories];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
  unsigned int v50 = v5;
  if (v17)
  {
    uint64_t v18 = *(void *)v54;
    v19 = v13;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(v16);
        }
        int v21 = [*(id *)(*((void *)&v53 + 1) + 8 * i) addObjectToBuffer:v12];
        int v22 = v21;
        if (v19 >= v15)
        {
          uint64_t v23 = (v19 - v13) >> 2;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v15 - v13) >> 1 > v24) {
            unint64_t v24 = (v15 - v13) >> 1;
          }
          if ((unint64_t)(v15 - v13) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v24;
          }
          if (v25) {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          v27 = (char *)(v25 + 4 * v23);
          *(_DWORD *)v27 = v22;
          v28 = v27 + 4;
          while (v19 != v13)
          {
            int v29 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v29;
            v27 -= 4;
          }
          v15 = (char *)(v25 + 4 * v26);
          if (v13) {
            operator delete(v13);
          }
          uint64_t v13 = v27;
          v19 = v28;
          __int16 v12 = a3;
        }
        else
        {
          *(_DWORD *)v19 = v21;
          v19 += 4;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v17);
  }
  else
  {
    v19 = v13;
  }

  uint64_t v30 = v19 - v13;
  if (v19 == v13) {
    v31 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUCategory>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUCategory>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUCategory>> const&)::t;
  }
  else {
    v31 = v13;
  }
  uint64_t v32 = v30 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v30 >> 2, 4uLL);
  if (v13 == v19)
  {
    LODWORD(v32) = 0;
  }
  else
  {
    v33 = v31 - 4;
    uint64_t v34 = v32;
    do
    {
      int v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v33[4 * v34]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v35);
      --v34;
    }
    while (v34);
  }
  v36 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  unsigned int v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v38 = *((_DWORD *)a3 + 8);
  int v39 = *((_DWORD *)a3 + 12);
  int v40 = *((_DWORD *)a3 + 10);
  if (v51 || *((unsigned char *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 2uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 2uLL);
    uint64_t v41 = *((void *)a3 + 6);
    *(_WORD *)(v41 - 2) = v51;
    v41 -= 2;
    *((void *)a3 + 6) = v41;
    uint64_t v43 = *((void *)a3 + 4);
    uint64_t v42 = *((void *)a3 + 5);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((void **)a3 + 7) = (v43 - v41 + v42) | 0x400000000;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    unsigned int v44 = *((unsigned __int16 *)a3 + 34);
    if (v44 <= 4) {
      LOWORD(v44) = 4;
    }
    *((_WORD *)a3 + 34) = v44;
    v36 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  if (v50)
  {
    int v45 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v36, v50);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v36, 6, v45, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v36, 8, String);
  if (v37)
  {
    int v46 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v36, v37);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v36, 10, v46, 0);
  }
  v47.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v36, v38 - v39 + v40);
  if (v13) {
    operator delete(v13);
  }
  return v47;
}

- (void)categories_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, FLTSSUCategory *, uint64_t, unsigned __int8 *))a3;
  unsigned int v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"categories"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    long long v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
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
            v16 = [[FLTSSUCategory alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
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

- (unint64_t)categories_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"categories"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)categories_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"categories"];
  char v6 = v5;
  if (v5)
  {
    long long v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      long long v7 = [[FLTSSUCategory alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)categories
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"categories"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __24__FLTSSUFile_categories__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUFile *)self categories_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"categories"];
  }
  return (NSArray *)v3;
}

uint64_t __24__FLTSSUFile_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (FLTSSUMetadata)metadata
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"metadata"];
  if (!v3)
  {
    uint64_t v4 = [FLTSSUMetadata alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      uint64_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v3 = [(FLTSSUMetadata *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"metadata"];
  }
  return v3;
}

- (unsigned)format_version
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_WORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FLTSSUFile;
  uint64_t v10 = [(FLTSSUFile *)&v35 init];
  if (!v10) {
    goto LABEL_37;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_38;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const SSUFile *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_37;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_38;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  uint64_t v30 = v17;
  unint64_t v31 = v18;
  long long v32 = xmmword_1C8C3EB50;
  uint64_t v33 = 0;
  char v34 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
  if (!v19) {
    goto LABEL_37;
  }
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v30, v10->_root->var0))goto LABEL_38; {
  v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  }
  unsigned int v21 = *v20;
  if (v21 >= 5 && v20[2] && (v31 < 3 || v31 - 2 < (unint64_t)v19 + v20[2] - v30)) {
    goto LABEL_38;
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 6u)
    || v21 >= 7
    && v20[3]
    && !SSUMetadata::Verify((SSUMetadata *)v19 + v20[3] + *(unsigned int *)((char *)v19 + v20[3]), (apple::aiml::flatbuffers2::Verifier *)&v30)|| !apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 8u))
  {
    goto LABEL_38;
  }
  int v22 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  if (*v22 >= 9u && (uint64_t v23 = v22[4]) != 0) {
    unint64_t v24 = (const unsigned __int8 *)v19 + v23 + *(unsigned int *)((char *)v19 + v23);
  }
  else {
    unint64_t v24 = 0;
  }
  if (!apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v30, v24)
    || !apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 0xAu))
  {
    goto LABEL_38;
  }
  unint64_t v25 = 0;
  uint64_t v26 = *(int *)v19;
  if (*(unsigned __int16 *)((char *)v19 - v26) < 0xBu) {
    goto LABEL_36;
  }
  if (*(_WORD *)((char *)v19 - v26 + 10))
  {
    if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v30, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v26 + 10)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v26 + 10)), 4uLL, 0))
    {
      unint64_t v25 = 0;
      uint64_t v26 = *(int *)v19;
      if (*(unsigned __int16 *)((char *)v19 - v26) < 0xBu) {
        goto LABEL_36;
      }
      goto LABEL_33;
    }
LABEL_38:
    v28 = 0;
    goto LABEL_39;
  }
LABEL_33:
  uint64_t v27 = *(unsigned __int16 *)((char *)v19 - v26 + 10);
  if (v27) {
    unint64_t v25 = (SSUCategory *)v19 + v27 + *(unsigned int *)((char *)v19 + v27);
  }
  else {
    unint64_t v25 = 0;
  }
LABEL_36:
  if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<SSUCategory>((apple::aiml::flatbuffers2::Verifier *)&v30, v25))goto LABEL_38; {
LABEL_37:
  }
  v28 = v10;
LABEL_39:

  return v28;
}

- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4
{
  return [(FLTSSUFile *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUFile *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUFile)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUFile *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end