@interface OPTTSTextToSpeechRequestDevConfig
- (BOOL)return_log;
- (BOOL)return_server_info;
- (NSString)resource_asset_path;
- (NSString)voice_asset_path;
- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDevConfig *)a4;
- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDevConfig *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestDevConfig>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation OPTTSTextToSpeechRequestDevConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechRequestDevConfig *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__49__OPTTSTextToSpeechRequestDevConfig_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestDevConfig>)addObjectToBuffer:(void *)a3
{
  int v5 = [(OPTTSTextToSpeechRequestDevConfig *)self return_log];
  char v6 = [(OPTTSTextToSpeechRequestDevConfig *)self voice_asset_path];
  long long v7 = v6;
  if (!v6) {
    char v6 = &stru_1EEE20510;
  }
  long long v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  uint64_t v11 = [(OPTTSTextToSpeechRequestDevConfig *)self resource_asset_path];
  __int16 v12 = v11;
  if (!v11) {
    uint64_t v11 = &stru_1EEE20510;
  }
  uint64_t v13 = (const char *)[(__CFString *)v11 UTF8String];
  size_t v14 = strlen(v13);
  LODWORD(v13) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v13, v14);

  int v15 = [(OPTTSTextToSpeechRequestDevConfig *)self return_server_info];
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v16 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v13);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v15);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestDevConfig>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v16);
}

- (BOOL)return_server_info
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)resource_asset_path
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
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)voice_asset_path
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

- (BOOL)return_log
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0 && root[v4].var0[0] != 0;
}

- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDevConfig *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechRequestDevConfig;
  uint64_t v10 = [(OPTTSTextToSpeechRequestDevConfig *)&v26 init];
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
    a4 = (const TextToSpeechRequestDevConfig *)v12 + *v12;
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
  long long v23 = xmmword_19CEE1A20;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  v19 = (siri::speech::schema_fb::TextToSpeechRequestDevConfig *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    v20 = 0;
  }
  else
  {
LABEL_14:
    v20 = v10;
  }

  return v20;
}

- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDevConfig *)a4
{
  return [(OPTTSTextToSpeechRequestDevConfig *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestDevConfig *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequestDevConfig)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestDevConfig *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end