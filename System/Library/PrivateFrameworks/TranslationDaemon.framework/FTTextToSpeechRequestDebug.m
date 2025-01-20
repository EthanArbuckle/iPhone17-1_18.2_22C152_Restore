@interface FTTextToSpeechRequestDebug
- (BOOL)disable_cache;
- (BOOL)force_use_tts_service;
- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3;
- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDebug *)a4;
- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDebug *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechRequestDebug>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FTTextToSpeechRequestDebug

- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechRequestDebug *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTTextToSpeechRequestDebug *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDebug *)a4
{
  return [(FTTextToSpeechRequestDebug *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTTextToSpeechRequestDebug)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestDebug *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechRequestDebug;
  v10 = [(FTTextToSpeechRequestDebug *)&v26 init];
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
    a4 = (const TextToSpeechRequestDebug *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechRequestDebug *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::TextToSpeechRequestDebug::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (BOOL)force_use_tts_service
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)disable_cache
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequestDebug>)addObjectToBuffer:(void *)a3
{
  uint64_t v4 = self;
  int v5 = [(FTTextToSpeechRequestDebug *)self force_use_tts_service];
  LODWORD(v4) = [(FTTextToSpeechRequestDebug *)v4 disable_cache];
  *((unsigned char *)a3 + 70) = 1;
  int v6 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 6, (int)v4, 0);
  return (Offset<siri::speech::schema_fb::TextToSpeechRequestDebug>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTTextToSpeechRequestDebug *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FTTextToSpeechRequestDebug_flatbuffData__block_invoke(uint64_t a1)
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