@interface FLTSSUExampleEncodedVector
- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3;
- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4;
- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4 verify:(BOOL)a5;
- (NSArray)data;
- (Offset<SSUExampleEncodedVector>)addObjectToBuffer:(void *)a3;
- (id)data_objectAtIndex:(unint64_t)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (unint64_t)data_count;
- (void)data_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FLTSSUExampleEncodedVector

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
  v2.var0 = [(FLTSSUExampleEncodedVector *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FLTSSUExampleEncodedVector_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUExampleEncodedVector>)addObjectToBuffer:(void *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FLTSSUExampleEncodedVector *)self data];
  unint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6);
    long long v9 = &v7[4 * v8];
  }
  else
  {
    long long v7 = 0;
    long long v9 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v10 = [(FLTSSUExampleEncodedVector *)self data];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  v35 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  if (v11)
  {
    uint64_t v12 = *(void *)v37;
    uint64_t v13 = v7;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) floatValue];
        int v16 = v15;
        if (v13 >= v9)
        {
          uint64_t v17 = (v13 - v7) >> 2;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((v9 - v7) >> 1 > v18) {
            unint64_t v18 = (v9 - v7) >> 1;
          }
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v19);
          }
          else {
            uint64_t v20 = 0;
          }
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            int v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          long long v9 = (char *)(v19 + 4 * v20);
          if (v7) {
            operator delete(v7);
          }
          long long v7 = v21;
          uint64_t v13 = v22;
        }
        else
        {
          *(_DWORD *)uint64_t v13 = v15;
          v13 += 4;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = v7;
  }

  uint64_t v24 = v13 - v7;
  if (v13 == v7) {
    v25 = (char *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  }
  else {
    v25 = v7;
  }
  uint64_t v26 = v24 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v35, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    apple::aiml::flatbuffers2::vector_downward::ensure_space(v35, v13 - v7);
    v27 = (void *)(*((void *)v35 + 6) - v24);
    *((void *)v35 + 6) = v27;
    memcpy(v27, v25, v13 - v7);
  }
  unsigned int v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v35, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v35);
  *((unsigned char *)v35 + 70) = 1;
  uint64_t v29 = *((void *)v35 + 5);
  uint64_t v30 = *((void *)v35 + 6);
  uint64_t v31 = *((void *)v35 + 4);
  if (v28)
  {
    int v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v35, v28);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v35, 4, v32, 0);
  }
  v33.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v35, (int)v31 - (int)v30 + (int)v29);
  if (v7) {
    operator delete(v7);
  }
  return v33;
}

- (void)data_enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
  long long v7 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    long long v9 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v9->var0 >= 5u)
    {
      uint64_t v10 = *(unsigned __int16 *)v9[4].var0;
      if (v10)
      {
        unsigned __int8 v19 = 0;
        uint64_t v11 = *(unsigned int *)root[v10].var0;
        uint64_t v12 = *(unsigned int *)root[v10 + v11].var0;
        if (v12)
        {
          uint64_t v13 = 0;
          uint64_t v14 = 4 * v12 - 4;
          uint64_t v15 = (uint64_t)&root[v10 + 4 + v11];
          do
          {
            LODWORD(v6) = *(_DWORD *)(v15 + 4 * v13);
            int v16 = [NSNumber numberWithFloat:v6];
            v4[2](v4, v16, v13, &v19);
            int v17 = v19;

            ++v13;
            if (v17) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v14 == 0;
            }
            v14 -= 4;
          }
          while (!v18);
        }
      }
    }
  }
}

- (unint64_t)data_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)data_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
  long long v7 = v5;
  if (v5)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    long long v9 = (void *)v8;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v11 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v11->var0 >= 5u)
  {
    uint64_t v12 = *(unsigned __int16 *)v11[4].var0;
    if (v12)
    {
      uint64_t v13 = &root[v12 + *(unsigned int *)root[v12].var0];
      if (*(_DWORD *)v13->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      LODWORD(v6) = *(_DWORD *)v13[4 * a3 + 4].var0;
      uint64_t v8 = [NSNumber numberWithFloat:v6];
      goto LABEL_3;
    }
  }
  long long v9 = 0;
LABEL_9:

  return v9;
}

- (NSArray)data
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__FLTSSUExampleEncodedVector_data__block_invoke;
    v6[3] = &unk_1E6578F68;
    id v3 = v4;
    id v7 = v3;
    [(FLTSSUExampleEncodedVector *)self data_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"data"];
  }
  return (NSArray *)v3;
}

uint64_t __34__FLTSSUExampleEncodedVector_data__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUExampleEncodedVector;
  uint64_t v10 = [(FLTSSUExampleEncodedVector *)&v26 init];
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
    a4 = (const SSUExampleEncodedVector *)v12 + *v12;
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
  unsigned __int8 v19 = (SSUExampleEncodedVector *)v10->_root;
  if (v19 && !SSUExampleEncodedVector::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    uint64_t v20 = 0;
  else {
LABEL_14:
  }
    uint64_t v20 = v10;

  return v20;
}

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3 root:(const SSUExampleEncodedVector *)a4
{
  return [(FLTSSUExampleEncodedVector *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUExampleEncodedVector *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUExampleEncodedVector)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUExampleEncodedVector *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end