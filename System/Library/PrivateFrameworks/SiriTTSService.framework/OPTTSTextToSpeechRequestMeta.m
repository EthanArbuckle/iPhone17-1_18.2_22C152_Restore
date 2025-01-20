@interface OPTTSTextToSpeechRequestMeta
- (NSString)app_id;
- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestMeta *)a4;
- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestMeta *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestMeta>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)channel_type;
@end

@implementation OPTTSTextToSpeechRequestMeta

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
  v2.var0 = [(OPTTSTextToSpeechRequestMeta *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__44__OPTTSTextToSpeechRequestMeta_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestMeta>)addObjectToBuffer:(void *)a3
{
  int v5 = [(OPTTSTextToSpeechRequestMeta *)self channel_type];
  char v6 = [(OPTTSTextToSpeechRequestMeta *)self app_id];
  long long v7 = v6;
  if (!v6) {
    char v6 = &stru_1EEE20510;
  }
  long long v8 = (const char *)[(__CFString *)v6 UTF8String];
  size_t v9 = strlen(v8);
  LODWORD(v8) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v10 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v8);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestMeta>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10);
}

- (NSString)app_id
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

- (int64_t)channel_type
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestMeta *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechRequestMeta;
  int v10 = [(OPTTSTextToSpeechRequestMeta *)&v26 init];
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
    a4 = (const TextToSpeechRequestMeta *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechRequestMeta *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TextToSpeechRequestMeta::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    v20 = 0;
  else {
LABEL_14:
  }
    v20 = v10;

  return v20;
}

- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestMeta *)a4
{
  return [(OPTTSTextToSpeechRequestMeta *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestMeta *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequestMeta)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestMeta *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end