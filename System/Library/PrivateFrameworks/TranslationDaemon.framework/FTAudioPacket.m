@interface FTAudioPacket
- (FTAudioPacket)initWithFlatbuffData:(id)a3;
- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4;
- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4 verify:(BOOL)a5;
- (NSData)audio_bytes;
- (Offset<siri::speech::schema_fb::AudioPacket>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (void)audio_bytes:(id)a3;
@end

@implementation FTAudioPacket

- (FTAudioPacket)initWithFlatbuffData:(id)a3
{
  return [(FTAudioPacket *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTAudioPacket *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4
{
  return [(FTAudioPacket *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioPacket;
  v10 = [(FTAudioPacket *)&v26 init];
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
    a4 = (const AudioPacket *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::AudioPacket *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::AudioPacket::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSData)audio_bytes
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
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

- (void)audio_bytes:(id)a3
{
  id v4 = a3;
  root = self->_root;
  uint64_t v6 = *(int *)root->var0;
  uint64_t v7 = *(unsigned __int16 *)root[-v6 + 4].var0;
  if (*(_WORD *)root[-v6 + 4].var0)
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
  (*((void (**)(id, const AudioPacket *, void))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);
}

- (Offset<siri::speech::schema_fb::AudioPacket>)addObjectToBuffer:(void *)a3
{
  uint64_t v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3812000000;
  v12 = __Block_byref_object_copy__12;
  unint64_t v13 = __Block_byref_object_dispose__12;
  uint64_t v14 = &unk_2602B4E3D;
  int v15 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__FTAudioPacket_addObjectToBuffer___block_invoke;
  v8[3] = &unk_265548F40;
  v8[4] = &v9;
  v8[5] = a3;
  [(FTAudioPacket *)self audio_bytes:v8];
  v3[70] = 1;
  uint64_t v4 = *((void *)v3 + 5);
  uint64_t v5 = *((void *)v3 + 6);
  uint64_t v6 = *((void *)v3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)v3, 4, *((_DWORD *)v10 + 12));
  LODWORD(v3) = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)v3, (unsigned __int16)v6 - (unsigned __int16)v5 + (unsigned __int16)v4);
  _Block_object_dispose(&v9, 8);
  return (Offset<siri::speech::schema_fb::AudioPacket>)v3;
}

uint64_t __35__FTAudioPacket_addObjectToBuffer___block_invoke(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTAudioPacket *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__29__FTAudioPacket_flatbuffData__block_invoke(uint64_t a1)
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