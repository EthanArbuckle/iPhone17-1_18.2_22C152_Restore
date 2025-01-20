@interface FLTSSUMetadata
- (FLTSSUMetadata)initWithFlatbuffData:(id)a3;
- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4;
- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4 verify:(BOOL)a5;
- (NSArray)user_data;
- (NSString)data_version;
- (NSString)encoder_version;
- (Offset<SSUMetadata>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)user_data_objectAtIndex:(unint64_t)a3;
- (int64_t)timestamp;
- (unint64_t)user_data_count;
- (void)user_data_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTSSUMetadata

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
  v2.var0 = [(FLTSSUMetadata *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__30__FLTSSUMetadata_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUMetadata>)addObjectToBuffer:(void *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [(FLTSSUMetadata *)self data_version];
  v4 = v3;
  if (!v3) {
    v3 = &stru_1F23304F0;
  }
  uint64_t v5 = (const char *)[(__CFString *)v3 UTF8String];
  size_t v6 = strlen(v5);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v5, v6);

  int64_t v53 = [(FLTSSUMetadata *)self timestamp];
  long long v7 = [(FLTSSUMetadata *)self user_data];
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

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  __int16 v12 = [(FLTSSUMetadata *)self user_data];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v57;
    v15 = v9;
    v16 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v12);
        }
        v18 = (const char *)[*(id *)(*((void *)&v56 + 1) + 8 * i) UTF8String];
        size_t v19 = strlen(v18);
        int v20 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);
        int v21 = v20;
        if (v15 >= v11)
        {
          uint64_t v22 = (v15 - v9) >> 2;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v11 - v9) >> 1 > v23) {
            unint64_t v23 = (v11 - v9) >> 1;
          }
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v24);
          }
          else {
            uint64_t v25 = 0;
          }
          v26 = (char *)(v24 + 4 * v22);
          *(_DWORD *)v26 = v21;
          v27 = v26 + 4;
          while (v15 != v9)
          {
            int v28 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v26 - 1) = v28;
            v26 -= 4;
          }
          uint64_t v11 = (char *)(v24 + 4 * v25);
          if (v9) {
            operator delete(v9);
          }
          long long v9 = v26;
          v15 = v27;
          __int16 v12 = v16;
        }
        else
        {
          *(_DWORD *)v15 = v20;
          v15 += 4;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  uint64_t v29 = v15 - v9;
  if (v15 == v9) {
    v30 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  }
  else {
    v30 = v9;
  }
  uint64_t v31 = v29 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v31) = 0;
    v34 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  else
  {
    v32 = v30 - 4;
    uint64_t v33 = v31;
    v34 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
    do
    {
      int v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v32[4 * v33]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v35);
      --v33;
    }
    while (v33);
  }
  unsigned int v36 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v34, v31);
  v37 = [(FLTSSUMetadata *)self encoder_version];
  v38 = v37;
  if (!v37) {
    v37 = &stru_1F23304F0;
  }
  v39 = (const char *)[(__CFString *)v37 UTF8String];
  size_t v40 = strlen(v39);
  unsigned int v41 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v39, v40);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v42 = *((_DWORD *)a3 + 8);
  int v43 = *((_DWORD *)a3 + 12);
  int v44 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  if (v53 || *((unsigned char *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    uint64_t v45 = *((void *)a3 + 6);
    *(void *)(v45 - 8) = v53;
    v45 -= 8;
    *((void *)a3 + 6) = v45;
    uint64_t v47 = *((void *)a3 + 4);
    uint64_t v46 = *((void *)a3 + 5);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((void **)a3 + 7) = (v47 - v45 + v46) | 0x600000000;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    unsigned int v48 = *((unsigned __int16 *)a3 + 34);
    if (v48 <= 6) {
      LOWORD(v48) = 6;
    }
    *((_WORD *)a3 + 34) = v48;
  }
  if (v36)
  {
    int v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v49, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v41);
  v50.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42 - v43 + v44);
  if (v9) {
    operator delete(v9);
  }
  return v50;
}

- (NSString)encoder_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    size_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    size_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (void)user_data_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_data"];
  size_t v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    unint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
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
            v16 = (void *)[[NSString alloc] initWithBytes:&v13[*(unsigned int *)v13->var0 + 4] length:*(unsigned int *)v13[*(unsigned int *)v13->var0].var0 encoding:4];
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

- (unint64_t)user_data_count
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_data"];
  uint64_t v4 = v3;
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

- (id)user_data_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_data"];
  size_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = (void *)v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      var0 = (unsigned int *)v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0].var0;
      uint64_t v7 = [[NSString alloc] initWithBytes:var0 + 1 length:*var0 encoding:4];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)user_data
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_data"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__FLTSSUMetadata_user_data__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUMetadata *)self user_data_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_data"];
  }
  return (NSArray *)v3;
}

uint64_t __27__FLTSSUMetadata_user_data__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (int64_t)timestamp
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)data_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    size_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    size_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUMetadata;
  uint64_t v10 = [(FLTSSUMetadata *)&v26 init];
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
    a4 = (const SSUMetadata *)v12 + *v12;
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
  unsigned __int8 v19 = (SSUMetadata *)v10->_root;
  if (v19 && !SSUMetadata::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    int v20 = 0;
  else {
LABEL_14:
  }
    int v20 = v10;

  return v20;
}

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4
{
  return [(FLTSSUMetadata *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUMetadata *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUMetadata *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end