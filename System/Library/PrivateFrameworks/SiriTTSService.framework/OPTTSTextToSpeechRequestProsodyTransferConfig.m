@interface OPTTSTextToSpeechRequestProsodyTransferConfig
- (NSString)user_voice_profile_url;
- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4;
- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4 verify:(BOOL)a5;
- (OPTTSTextToSpeechSpeechFeatureInputWave)wave_data;
- (OPTTSTextToSpeechUserVoiceProfile)user_voice_profile;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation OPTTSTextToSpeechRequestProsodyTransferConfig

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
  v2.var0 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__61__OPTTSTextToSpeechRequestProsodyTransferConfig_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self wave_data];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  long long v7 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self user_voice_profile];
  unsigned int v8 = [v7 addObjectToBuffer:a3];

  long long v9 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self user_voice_profile_url];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_1EEE20510;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v14 = *((void *)a3 + 5);
  uint64_t v15 = *((void *)a3 + 6);
  uint64_t v16 = *((void *)a3 + 4);
  if (v6)
  {
    int v17 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v17);
  }
  if (v8)
  {
    int v18 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v18);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, String);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v16 - (int)v15 + (int)v14);
}

- (NSString)user_voice_profile_url
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    unsigned int v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (OPTTSTextToSpeechUserVoiceProfile)user_voice_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_voice_profile"];
  if (!v3)
  {
    uint64_t v4 = [OPTTSTextToSpeechUserVoiceProfile alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    uint64_t v3 = [(OPTTSTextToSpeechUserVoiceProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_voice_profile"];
  }
  return v3;
}

- (OPTTSTextToSpeechSpeechFeatureInputWave)wave_data
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"wave_data"];
  if (!v3)
  {
    uint64_t v4 = [OPTTSTextToSpeechSpeechFeatureInputWave alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    uint64_t v3 = [(OPTTSTextToSpeechSpeechFeatureInputWave *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"wave_data"];
  }
  return v3;
}

- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechRequestProsodyTransferConfig;
  uint64_t v10 = [(OPTTSTextToSpeechRequestProsodyTransferConfig *)&v26 init];
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
    size_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechRequestProsodyTransferConfig *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
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

- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4
{
  return [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end