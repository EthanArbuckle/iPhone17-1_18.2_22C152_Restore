@interface OPTTSTextToSpeechRequestProsodyControlConfig
- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyControlConfig *)a4;
- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyControlConfig *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig>)addObjectToBuffer:(void *)a3;
- (float)global_energy;
- (float)global_pitch;
- (float)global_rate;
- (float)global_sent_duration;
- (float)global_sent_energy;
- (float)global_sent_pitch;
- (float)global_sent_pitchrange;
- (float)global_sent_tilt;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation OPTTSTextToSpeechRequestProsodyControlConfig

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
  v2.var0 = [(OPTTSTextToSpeechRequestProsodyControlConfig *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__60__OPTTSTextToSpeechRequestProsodyControlConfig_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig>)addObjectToBuffer:(void *)a3
{
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_rate];
  float v6 = v5;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_pitch];
  float v8 = v7;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_energy];
  float v10 = v9;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_sent_pitch];
  float v12 = v11;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_sent_pitchrange];
  float v14 = v13;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_sent_duration];
  float v16 = v15;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_sent_energy];
  float v18 = v17;
  [(OPTTSTextToSpeechRequestProsodyControlConfig *)self global_sent_tilt];
  float v20 = v19;
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v21 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 6, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 8, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v12);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 12, v14);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 14, v16);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 16, v18);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 18, v20);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v21);
}

- (float)global_sent_tilt
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x13u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[18].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)global_sent_energy
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (float)global_sent_duration
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

- (float)global_sent_pitchrange
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

- (float)global_sent_pitch
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

- (float)global_energy
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

- (float)global_pitch
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

- (float)global_rate
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyControlConfig *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechRequestProsodyControlConfig;
  float v10 = [(OPTTSTextToSpeechRequestProsodyControlConfig *)&v26 init];
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
    float v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRequestProsodyControlConfig *)v12 + *v12;
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
  float v19 = (siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    float v20 = 0;
  }
  else
  {
LABEL_14:
    float v20 = v10;
  }

  return v20;
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyControlConfig *)a4
{
  return [(OPTTSTextToSpeechRequestProsodyControlConfig *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestProsodyControlConfig *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestProsodyControlConfig *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end