@interface QSSTextToSpeechSpeechFeatureOutputFeature
- (NSString)phone_name;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureOutputFeature *)a4;
- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureOutputFeature *)a4 verify:(BOOL)a5;
- (float)begin_time;
- (float)duration;
- (float)end_time;
- (float)energy;
- (float)pitch;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechSpeechFeatureOutputFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSTextToSpeechSpeechFeatureOutputFeature *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__57__QSSTextToSpeechSpeechFeatureOutputFeature_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextToSpeechSpeechFeatureOutputFeature *)self phone_name];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  [(QSSTextToSpeechSpeechFeatureOutputFeature *)self begin_time];
  float v10 = v9;
  [(QSSTextToSpeechSpeechFeatureOutputFeature *)self end_time];
  float v12 = v11;
  [(QSSTextToSpeechSpeechFeatureOutputFeature *)self duration];
  float v14 = v13;
  [(QSSTextToSpeechSpeechFeatureOutputFeature *)self pitch];
  float v16 = v15;
  [(QSSTextToSpeechSpeechFeatureOutputFeature *)self energy];
  float v18 = v17;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v19 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v7);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 6, v10);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 8, v12);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 10, v14);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 12, v16);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 14, v18);
  return (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v19);
}

- (float)energy
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)pitch
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)duration
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)end_time
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 9u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[8].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)begin_time
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (NSString)phone_name
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

- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureOutputFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechSpeechFeatureOutputFeature;
  float v10 = [(QSSTextToSpeechSpeechFeatureOutputFeature *)&v30 init];
  float v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      float v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TextToSpeechSpeechFeatureOutputFeature *)v13 + *v13;
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
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureOutputFeature *)a4
{
  return [(QSSTextToSpeechSpeechFeatureOutputFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureOutputFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechSpeechFeatureOutputFeature)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechSpeechFeatureOutputFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end