@interface QSSTextToSpeechRequestProsodyTransferConfig
- (NSString)user_voice_profile_url;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4;
- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4 verify:(BOOL)a5;
- (QSSTextToSpeechSpeechFeatureInputWave)wave_data;
- (QSSTextToSpeechUserVoiceProfile)user_voice_profile;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechRequestProsodyTransferConfig

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
  v2.var0 = [(QSSTextToSpeechRequestProsodyTransferConfig *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__59__QSSTextToSpeechRequestProsodyTransferConfig_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSTextToSpeechRequestProsodyTransferConfig *)self wave_data];
  unsigned int v6 = [v5 addObjectToBuffer:a3];

  long long v7 = [(QSSTextToSpeechRequestProsodyTransferConfig *)self user_voice_profile];
  unsigned int v8 = [v7 addObjectToBuffer:a3];

  long long v9 = [(QSSTextToSpeechRequestProsodyTransferConfig *)self user_voice_profile_url];
  uint64_t v10 = v9;
  if (!v9) {
    long long v9 = &stru_26DEBFAF8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v15 = *((void *)a3 + 5);
  uint64_t v14 = *((void *)a3 + 6);
  uint64_t v16 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v6);
  if (v8)
  {
    int v17 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v8);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v17);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, String);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v16 - (int)v14 + (int)v15);
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

- (QSSTextToSpeechUserVoiceProfile)user_voice_profile
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"user_voice_profile"];
  if (!v3)
  {
    uint64_t v4 = [QSSTextToSpeechUserVoiceProfile alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    uint64_t v3 = [(QSSTextToSpeechUserVoiceProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"user_voice_profile"];
  }
  return v3;
}

- (QSSTextToSpeechSpeechFeatureInputWave)wave_data
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"wave_data"];
  if (!v3)
  {
    uint64_t v4 = [QSSTextToSpeechSpeechFeatureInputWave alloc];
    root = self->_root;
    unsigned int v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (uint64_t v7 = *(unsigned __int16 *)v6[4].var0) != 0) {
      unsigned int v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      unsigned int v8 = 0;
    }
    uint64_t v3 = [(QSSTextToSpeechSpeechFeatureInputWave *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"wave_data"];
  }
  return v3;
}

- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechRequestProsodyTransferConfig;
  uint64_t v10 = [(QSSTextToSpeechRequestProsodyTransferConfig *)&v30 init];
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
      a4 = (const TextToSpeechRequestProsodyTransferConfig *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestProsodyTransferConfig *)a4
{
  return [(QSSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechRequestProsodyTransferConfig)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechRequestProsodyTransferConfig *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end