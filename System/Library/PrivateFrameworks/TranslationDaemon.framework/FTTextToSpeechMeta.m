@interface FTTextToSpeechMeta
- (FTQSSVersionInfo)server_info;
- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4;
- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4 verify:(BOOL)a5;
- (FTTextToSpeechResource)resource;
- (FTTextToSpeechVoice)voice;
- (Offset<siri::speech::schema_fb::TextToSpeechMeta>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FTTextToSpeechMeta

- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechMeta *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechMeta *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4
{
  return [(FTTextToSpeechMeta *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechMeta)initWithFlatbuffData:(id)a3 root:(const TextToSpeechMeta *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechMeta;
  v10 = [(FTTextToSpeechMeta *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechMeta *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::TextToSpeechMeta *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechMeta::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (FTTextToSpeechVoice)voice
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"voice"];
  if (!v3)
  {
    v4 = [FTTextToSpeechVoice alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTTextToSpeechVoice *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"voice"];
  }
  return v3;
}

- (FTTextToSpeechResource)resource
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"resource"];
  if (!v3)
  {
    v4 = [FTTextToSpeechResource alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTTextToSpeechResource *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"resource"];
  }
  return v3;
}

- (FTQSSVersionInfo)server_info
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"server_info"];
  if (!v3)
  {
    v4 = [FTQSSVersionInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (uint64_t v7 = *(unsigned __int16 *)v6[8].var0) != 0) {
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      v8 = 0;
    }
    v3 = [(FTQSSVersionInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"server_info"];
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechMeta>)addObjectToBuffer:(void *)a3
{
  v4 = self;
  BOOL v5 = [(FTTextToSpeechMeta *)self voice];
  int v6 = [v5 addObjectToBuffer:a3];

  uint64_t v7 = [(FTTextToSpeechMeta *)v4 resource];
  int v8 = [v7 addObjectToBuffer:a3];

  id v9 = [(FTTextToSpeechMeta *)v4 server_info];
  LODWORD(v4) = [v9 addObjectToBuffer:a3];

  *((unsigned char *)a3 + 70) = 1;
  int v10 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, (int)v4);
  return (Offset<siri::speech::schema_fb::TextToSpeechMeta>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10);
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechMeta *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTTextToSpeechMeta_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end