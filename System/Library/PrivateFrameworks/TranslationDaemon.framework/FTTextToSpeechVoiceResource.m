@interface FTTextToSpeechVoiceResource
- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4;
- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4 verify:(BOOL)a5;
- (NSData)data;
- (Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)type;
- (void)data:(id)a3;
@end

@implementation FTTextToSpeechVoiceResource

- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechVoiceResource *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechVoiceResource *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4
{
  return [(FTTextToSpeechVoiceResource *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechVoiceResource;
  v10 = [(FTTextToSpeechVoiceResource *)&v26 init];
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
    a4 = (const TextToSpeechVoiceResource *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechVoiceResource *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechVoiceResource::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (int64_t)type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSData)data
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (void)data:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    id v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    id v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const TextToSpeechVoiceResource *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>)addObjectToBuffer:(void *)a3
{
  id v4 = self;
  int v5 = [(FTTextToSpeechVoiceResource *)self type];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3812000000;
  unint64_t v13 = __Block_byref_object_copy__12;
  uint64_t v14 = __Block_byref_object_dispose__12;
  v15 = &unk_2602B4E3D;
  int v16 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__FTTextToSpeechVoiceResource_addObjectToBuffer___block_invoke;
  v9[3] = &unk_265548F40;
  v9[4] = &v10;
  v9[5] = a3;
  [(FTTextToSpeechVoiceResource *)v4 data:v9];
  *((unsigned char *)a3 + 70) = 1;
  LODWORD(v4) = *((_DWORD *)a3 + 8);
  int v6 = *((_DWORD *)a3 + 12);
  int v7 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 4, v5, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v11 + 12));
  LODWORD(a3) = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v4 - (unsigned __int16)v6 + v7);
  _Block_object_dispose(&v10, 8);
  return (Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>)a3;
}

uint64_t __49__FTTextToSpeechVoiceResource_addObjectToBuffer___block_invoke(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechVoiceResource *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTTextToSpeechVoiceResource_flatbuffData__block_invoke(uint64_t a1)
{
  uint64_t result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
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