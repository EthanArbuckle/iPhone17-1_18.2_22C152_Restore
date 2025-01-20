@interface FLTSSUIntentParameter
- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3;
- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3 root:(const SSUIntentParameter *)a4;
- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3 root:(const SSUIntentParameter *)a4 verify:(BOOL)a5;
- (NSString)example_value;
- (NSString)name;
- (Offset<SSUIntentParameter>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FLTSSUIntentParameter

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
  v2.var0 = [(FLTSSUIntentParameter *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FLTSSUIntentParameter_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

- (Offset<SSUIntentParameter>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FLTSSUIntentParameter *)self name];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1F23304F0;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(FLTSSUIntentParameter *)self example_value];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_1F23304F0;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  LODWORD(v12) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v14 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v12);
  return (Offset<SSUIntentParameter>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14);
}

- (NSString)example_value
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3 root:(const SSUIntentParameter *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUIntentParameter;
  uint64_t v10 = [(FLTSSUIntentParameter *)&v26 init];
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
    __int16 v12 = (unsigned int *)[*p_data bytes];
    a4 = (const SSUIntentParameter *)v12 + *v12;
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
  v19 = (SSUIntentParameter *)v10->_root;
  if (v19 && !SSUIntentParameter::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    v20 = 0;
  else {
LABEL_14:
  }
    v20 = v10;

  return v20;
}

- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3 root:(const SSUIntentParameter *)a4
{
  return [(FLTSSUIntentParameter *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FLTSSUIntentParameter *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FLTSSUIntentParameter)initWithFlatbuffData:(id)a3
{
  return [(FLTSSUIntentParameter *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end