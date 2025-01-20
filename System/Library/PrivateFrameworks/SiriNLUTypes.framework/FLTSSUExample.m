@interface FLTSSUExample
+ (Class)data_immutableClassForType:(int64_t)a3;
+ (int64_t)data_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)data;
- (FLTSSUExample)initWithFlatbuffData:(id)a3;
- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4;
- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4 verify:(BOOL)a5;
- (FLTSSUExampleEncodedVector)dataAsFLTSSUExampleEncodedVector;
- (FLTSSUExampleUtterance)dataAsFLTSSUExampleUtterance;
- (Offset<SSUExample>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)data_type;
@end

@implementation FLTSSUExample

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
  v2.var0 = [(FLTSSUExample *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__29__FLTSSUExample_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUExample>)addObjectToBuffer:(void *)a3
{
  char v5 = [(FLTSSUExample *)self data_type];
  if ([(FLTSSUExample *)self data_type] == 1)
  {
    char v6 = [(FLTSSUExample *)self dataAsFLTSSUExampleUtterance];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(FLTSSUExample *)self data_type] == 2)
  {
    long long v8 = [(FLTSSUExample *)self dataAsFLTSSUExampleEncodedVector];
    unsigned int v9 = [v8 addObjectToBuffer:a3];

    unsigned int v10 = v9;
  }
  else
  {
    unsigned int v10 = 0;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v11 = *((void *)a3 + 5);
  uint64_t v12 = *((void *)a3 + 6);
  uint64_t v13 = *((void *)a3 + 4);
  if (v5 || *((unsigned char *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 1uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 1uLL);
    v14 = (unsigned char *)(*((void *)a3 + 6) - 1);
    *((void *)a3 + 6) = v14;
    unsigned char *v14 = v5;
    uint64_t v15 = (*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10));
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((void **)a3 + 7) = v15 | 0x400000000;
    *((void *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    if (*((unsigned __int16 *)a3 + 34) <= 4u) {
      __int16 v16 = 4;
    }
    else {
      __int16 v16 = *((_WORD *)a3 + 34);
    }
    *((_WORD *)a3 + 34) = v16;
  }
  if ([(FLTSSUExample *)self data_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7);
  }
  if ([(FLTSSUExample *)self data_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10);
  }
  return (Offset<SSUExample>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v13 - (int)v12 + (int)v11);
}

- (FLTBFBufferAccessor)data
{
  int64_t v3 = [(FLTSSUExample *)self data_type];
  if (v3 == 2)
  {
    v4 = [(FLTSSUExample *)self dataAsFLTSSUExampleEncodedVector];
  }
  else if (v3 == 1)
  {
    v4 = [(FLTSSUExample *)self dataAsFLTSSUExampleUtterance];
  }
  else
  {
    v4 = 0;
  }
  return (FLTBFBufferAccessor *)v4;
}

- (FLTSSUExampleEncodedVector)dataAsFLTSSUExampleEncodedVector
{
  if ([(FLTSSUExample *)self data_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
    if (!v3)
    {
      v4 = [FLTSSUExampleEncodedVector alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      int64_t v3 = [(FLTSSUExampleEncodedVector *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"data"];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (FLTSSUExampleUtterance)dataAsFLTSSUExampleUtterance
{
  if ([(FLTSSUExample *)self data_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"data"];
    if (!v3)
    {
      v4 = [FLTSSUExampleUtterance alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      int64_t v3 = [(FLTSSUExampleUtterance *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"data"];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (int64_t)data_type
{
  root = self->_root;
  int64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLTSSUExample;
  unsigned int v10 = [(FLTSSUExample *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      uint64_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const SSUExample *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_1C8C3EB50;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (SSUExample *)v11->_root;
      if (root)
      {
        if (!SSUExample::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (FLTSSUExample)initWithFlatbuffData:(id)a3 root:(const SSUExample *)a4
{
  return [(FLTSSUExample *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUExample *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUExample)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUExample *)self initWithFlatbuffData:a3 root:0 verify:0];
}

+ (int64_t)data_typeForImmutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (Class)data_immutableClassForType:(int64_t)a3
{
  if (a3 == 1 || a3 == 2)
  {
    int64_t v4 = objc_opt_class();
  }
  else
  {
    int64_t v4 = 0;
  }
  return (Class)v4;
}

@end