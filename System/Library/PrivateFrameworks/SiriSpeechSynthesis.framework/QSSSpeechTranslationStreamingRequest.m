@interface QSSSpeechTranslationStreamingRequest
- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest>)addObjectToBuffer:(void *)a3;
- (QSSAudioPacket)contentAsQSSAudioPacket;
- (QSSFinishAudio)contentAsQSSFinishAudio;
- (QSSLanguageDetected)contentAsQSSLanguageDetected;
- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer;
- (QSSSetEndpointerState)contentAsQSSSetEndpointerState;
- (QSSSpeechTranslationAudioPacket)contentAsQSSSpeechTranslationAudioPacket;
- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3;
- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4;
- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4 verify:(BOOL)a5;
- (QSSStartSpeechTranslationLoggingRequest)contentAsQSSStartSpeechTranslationLoggingRequest;
- (QSSStartSpeechTranslationRequest)contentAsQSSStartSpeechTranslationRequest;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSSpeechTranslationStreamingRequest

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
  v2.var0 = [(QSSSpeechTranslationStreamingRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__52__QSSSpeechTranslationStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSSpeechTranslationStreamingRequest *)self content_type];
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 1)
  {
    char v6 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSStartSpeechTranslationRequest];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 2)
  {
    long long v8 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSLanguageDetected];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 3)
  {
    uint64_t v10 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSAudioPacket];
    unsigned int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 4)
  {
    __int16 v12 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSSpeechTranslationAudioPacket];
    unsigned int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v13 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 5)
  {
    v14 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSFinishAudio];
    unsigned int v15 = [v14 addObjectToBuffer:a3];

    unsigned int v16 = v15;
  }
  else
  {
    unsigned int v16 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 6)
  {
    v17 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSSetEndpointerState];
    unsigned int v18 = [v17 addObjectToBuffer:a3];

    unsigned int v31 = v18;
  }
  else
  {
    unsigned int v31 = 0;
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 7)
  {
    v19 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSResetServerEndpointer];
    unsigned int v20 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v20 = 0;
  }
  unsigned int v30 = v16;
  unsigned int v29 = v20;
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 8)
  {
    v21 = [(QSSSpeechTranslationStreamingRequest *)self contentAsQSSStartSpeechTranslationLoggingRequest];
    unsigned int v22 = [v21 addObjectToBuffer:a3];

    uint64_t v27 = v22;
  }
  else
  {
    uint64_t v27 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v24 = *((void *)a3 + 5);
  uint64_t v23 = *((void *)a3 + 6);
  uint64_t v25 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v13);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 5) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v30);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 6) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 7) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v29);
  }
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v28);
  }
  return (Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v25 - (int)v23 + (int)v24);
}

- (QSSStartSpeechTranslationLoggingRequest)contentAsQSSStartSpeechTranslationLoggingRequest
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSStartSpeechTranslationLoggingRequest alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSStartSpeechTranslationLoggingRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSResetServerEndpointer alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSResetServerEndpointer *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSetEndpointerState)contentAsQSSSetEndpointerState
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSetEndpointerState alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSetEndpointerState *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSFinishAudio)contentAsQSSFinishAudio
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSFinishAudio alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSFinishAudio *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSpeechTranslationAudioPacket)contentAsQSSSpeechTranslationAudioPacket
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationAudioPacket alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationAudioPacket *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSAudioPacket)contentAsQSSAudioPacket
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSAudioPacket alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSAudioPacket *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSLanguageDetected)contentAsQSSLanguageDetected
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSLanguageDetected alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSLanguageDetected *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSStartSpeechTranslationRequest)contentAsQSSStartSpeechTranslationRequest
{
  if ([(QSSSpeechTranslationStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSStartSpeechTranslationRequest alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSStartSpeechTranslationRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)content_type
{
  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return root[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSSpeechTranslationStreamingRequest;
  uint64_t v10 = [(QSSSpeechTranslationStreamingRequest *)&v33 init];
  unsigned int v11 = v10;
  if (!v10) {
    goto LABEL_50;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_51;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const SpeechTranslationStreamingRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_49;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_51;
  }
  uint64_t v18 = [*p_data bytes];
  unint64_t v19 = [*p_data length];
  uint64_t v28 = v18;
  unint64_t v29 = v19;
  long long v30 = xmmword_22B64D0E0;
  uint64_t v31 = 0;
  char v32 = 1;
  if (v19 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  root = (flatbuffers::Table *)v11->_root;
  if (!root) {
    goto LABEL_49;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), unsigned int v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_51:
    v26 = 0;
    goto LABEL_52;
  }
  if (v22 >= 7)
  {
    if (v21[3])
    {
      uint64_t v23 = (flatbuffers::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((unsigned char *)root + v21[2]))
      {
        case 0:
          goto LABEL_49;
        case 1:
          if (v23
            && !siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 2:
          if (v23 && !siri::speech::schema_fb::LanguageDetected::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 3:
          if (v23 && !siri::speech::schema_fb::AudioPacket::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 4:
          if (v23 && !siri::speech::schema_fb::SpeechTranslationAudioPacket::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 5:
          if (v23 && !siri::speech::schema_fb::FinishAudio::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 6:
          if (v23 && !siri::speech::schema_fb::SetEndpointerState::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 7:
          if (v23 && !siri::speech::schema_fb::ResetServerEndpointer::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 8:
          if (!v23
            || siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_49;
          }
          goto LABEL_51;
        default:
          goto LABEL_51;
      }
    }
    goto LABEL_49;
  }
  if (v22 >= 5) {
    goto LABEL_23;
  }
LABEL_49:
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_50:
  v26 = v11;
LABEL_52:

  return v26;
}

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4
{
  return [(QSSSpeechTranslationStreamingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end