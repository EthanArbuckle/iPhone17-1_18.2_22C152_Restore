@interface OPTTSTextToSpeechVoice
- (NSString)gender;
- (NSString)language;
- (NSString)name;
- (NSString)quality;
- (NSString)type;
- (NSString)version;
- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoice *)a4;
- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoice *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechVoice>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)vs_voice;
@end

@implementation OPTTSTextToSpeechVoice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_226CFFD00;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechVoice *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__OPTTSTextToSpeechVoice_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x22A667720);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechVoice>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(OPTTSTextToSpeechVoice *)self language];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DAD0E18;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(OPTTSTextToSpeechVoice *)self gender];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DAD0E18;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = [(OPTTSTextToSpeechVoice *)self name];
  v16 = v15;
  if (!v15) {
    v15 = &stru_26DAD0E18;
  }
  v17 = (const char *)[(__CFString *)v15 UTF8String];
  size_t v18 = strlen(v17);
  unsigned int v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  v20 = [(OPTTSTextToSpeechVoice *)self version];
  v21 = v20;
  if (!v20) {
    v20 = &stru_26DAD0E18;
  }
  v22 = (const char *)[(__CFString *)v20 UTF8String];
  size_t v23 = strlen(v22);
  unsigned int v24 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  v25 = [(OPTTSTextToSpeechVoice *)self quality];
  v26 = v25;
  if (!v25) {
    v25 = &stru_26DAD0E18;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  unsigned int v29 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  v30 = [(OPTTSTextToSpeechVoice *)self type];
  v31 = v30;
  if (!v30) {
    v30 = &stru_26DAD0E18;
  }
  v32 = (const char *)[(__CFString *)v30 UTF8String];
  size_t v33 = strlen(v32);
  LODWORD(v32) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v32, v33);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v34 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 8, v19);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v24);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v29);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 14, v32);
  return (Offset<siri::speech::schema_fb::TextToSpeechVoice>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v34);
}

- (NSString)type
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (NSString)quality
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (NSString)version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (NSString)gender
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

- (NSString)language
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

- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoice *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSTextToSpeechVoice;
  uint64_t v10 = [(OPTTSTextToSpeechVoice *)&v30 init];
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
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TextToSpeechVoice *)v13 + *v13;
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
      long long v27 = xmmword_226CFFD10;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::TextToSpeechVoice *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechVoice::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          size_t v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  size_t v23 = v11;
LABEL_17:

  return v23;
}

- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoice *)a4
{
  return [(OPTTSTextToSpeechVoice *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechVoice *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechVoice)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechVoice *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)vs_voice
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F84EC0]);
  uint64_t v4 = [(OPTTSTextToSpeechVoice *)self language];
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  v18[0] = v5;
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v3 setLanguages:v6];

  long long v7 = (void *)MEMORY[0x263F84EC0];
  size_t v8 = [(OPTTSTextToSpeechVoice *)self gender];
  objc_msgSend(v3, "setGender:", objc_msgSend(v7, "genderFromString:", v8));

  id v9 = [(OPTTSTextToSpeechVoice *)self name];
  [v3 setName:v9];

  uint64_t v10 = NSNumber;
  uint64_t v11 = [(OPTTSTextToSpeechVoice *)self version];
  __int16 v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
  [v3 setContentVersion:v12];

  size_t v13 = (void *)MEMORY[0x263F84EC0];
  unint64_t v14 = [(OPTTSTextToSpeechVoice *)self quality];
  objc_msgSend(v3, "setFootprint:", objc_msgSend(v13, "footprintFromString:", v14));

  uint64_t v15 = (void *)MEMORY[0x263F84EC0];
  v16 = [(OPTTSTextToSpeechVoice *)self type];
  objc_msgSend(v3, "setType:", objc_msgSend(v15, "typeFromString:", v16));

  return v3;
}

@end