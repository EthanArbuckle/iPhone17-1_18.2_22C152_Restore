@interface OPTTSTextToSpeechSpeechFeatureInputWave
- (NSData)pcm_data;
- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4;
- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)sample_rate;
- (void)pcm_data:(id)a3;
@end

@implementation OPTTSTextToSpeechSpeechFeatureInputWave

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
  v2.var0 = [(OPTTSTextToSpeechSpeechFeatureInputWave *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__55__OPTTSTextToSpeechSpeechFeatureInputWave_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave>)addObjectToBuffer:(void *)a3
{
  v4 = self;
  int v5 = [(OPTTSTextToSpeechSpeechFeatureInputWave *)self sample_rate];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3812000000;
  uint64_t v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = &unk_19CF11BD2;
  int v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__OPTTSTextToSpeechSpeechFeatureInputWave_addObjectToBuffer___block_invoke;
  v9[3] = &unk_1E59202B8;
  v9[4] = &v10;
  v9[5] = a3;
  [(OPTTSTextToSpeechSpeechFeatureInputWave *)v4 pcm_data:v9];
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  LODWORD(v4) = *((_DWORD *)a3 + 8);
  int v6 = *((_DWORD *)a3 + 12);
  int v7 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v11 + 12));
  LODWORD(a3) = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v4 - v6 + v7);
  _Block_object_dispose(&v10, 8);
  return (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave>)a3;
}

uint64_t __61__OPTTSTextToSpeechSpeechFeatureInputWave_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (void)pcm_data:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    uint64_t v8 = *(unsigned int *)root[v7].var0;
    long long v9 = &root[v7 + v8];
  }
  else
  {
    uint64_t v7 = 0;
    long long v9 = 0;
    uint64_t v8 = *(unsigned int *)root->var0;
  }
  id v10 = v4;
  (*((void (**)(id, const TextToSpeechSpeechFeatureInputWave *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (NSData)pcm_data
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    uint64_t v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0];
}

- (int)sample_rate
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechSpeechFeatureInputWave;
  id v10 = [(OPTTSTextToSpeechSpeechFeatureInputWave *)&v26 init];
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
    a4 = (const TextToSpeechSpeechFeatureInputWave *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechVoiceResource *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechVoiceResource::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
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

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4
{
  return [(OPTTSTextToSpeechSpeechFeatureInputWave *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechSpeechFeatureInputWave *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechSpeechFeatureInputWave *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end