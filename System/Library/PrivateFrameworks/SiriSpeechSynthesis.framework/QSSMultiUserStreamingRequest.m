@interface QSSMultiUserStreamingRequest
- (Offset<siri::speech::qss_fb::MultiUserStreamingRequest>)addObjectToBuffer:(void *)a3;
- (QSSAudioPacket)contentAsQSSAudioPacket;
- (QSSFinishAudio)contentAsQSSFinishAudio;
- (QSSMultiUserStartSpeechRequest)contentAsQSSMultiUserStartSpeechRequest;
- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3;
- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStreamingRequest *)a4;
- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStreamingRequest *)a4 verify:(BOOL)a5;
- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer;
- (QSSSetAlternateRecognitionSausage)contentAsQSSSetAlternateRecognitionSausage;
- (QSSSetEndpointerState)contentAsQSSSetEndpointerState;
- (QSSSetRequestOrigin)contentAsQSSSetRequestOrigin;
- (QSSSetSpeechContext)contentAsQSSSetSpeechContext;
- (QSSSetSpeechProfile)contentAsQSSSetSpeechProfile;
- (QSSUpdateAudioInfo)contentAsQSSUpdateAudioInfo;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSMultiUserStreamingRequest

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
  v2.var0 = [(QSSMultiUserStreamingRequest *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__44__QSSMultiUserStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::MultiUserStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSMultiUserStreamingRequest *)self content_type];
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 1)
  {
    char v6 = [(QSSMultiUserStreamingRequest *)self contentAsQSSMultiUserStartSpeechRequest];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 2)
  {
    long long v8 = [(QSSMultiUserStreamingRequest *)self contentAsQSSUpdateAudioInfo];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 3)
  {
    uint64_t v10 = [(QSSMultiUserStreamingRequest *)self contentAsQSSSetRequestOrigin];
    unsigned int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 4)
  {
    __int16 v12 = [(QSSMultiUserStreamingRequest *)self contentAsQSSSetSpeechContext];
    unsigned int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v13 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 5)
  {
    v14 = [(QSSMultiUserStreamingRequest *)self contentAsQSSSetSpeechProfile];
    unsigned int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 6)
  {
    v16 = [(QSSMultiUserStreamingRequest *)self contentAsQSSSetEndpointerState];
    unsigned int v34 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v34 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 7)
  {
    v17 = [(QSSMultiUserStreamingRequest *)self contentAsQSSAudioPacket];
    unsigned int v33 = [v17 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v33 = 0;
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 8)
  {
    v18 = [(QSSMultiUserStreamingRequest *)self contentAsQSSFinishAudio];
    unsigned int v19 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v19 = 0;
  }
  unsigned int v32 = v15;
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 9)
  {
    v20 = [(QSSMultiUserStreamingRequest *)self contentAsQSSResetServerEndpointer];
    unsigned int v21 = [v20 addObjectToBuffer:a3];

    unsigned int v30 = v21;
  }
  else
  {
    unsigned int v30 = 0;
  }
  unsigned int v22 = v13;
  unsigned int v31 = v19;
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 10)
  {
    v23 = [(QSSMultiUserStreamingRequest *)self contentAsQSSSetAlternateRecognitionSausage];
    unsigned int v24 = [v23 addObjectToBuffer:a3];

    unsigned int v29 = v24;
  }
  else
  {
    unsigned int v29 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v26 = *((void *)a3 + 5);
  uint64_t v25 = *((void *)a3 + 6);
  uint64_t v27 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v22);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 5) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v32);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 6) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v34);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 7) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v33);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v30);
  }
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v29);
  }
  return (Offset<siri::speech::qss_fb::MultiUserStreamingRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v27 - (int)v25 + (int)v26);
}

- (QSSSetAlternateRecognitionSausage)contentAsQSSSetAlternateRecognitionSausage
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSetAlternateRecognitionSausage alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSetAlternateRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 9)
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

- (QSSFinishAudio)contentAsQSSFinishAudio
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 8)
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

- (QSSAudioPacket)contentAsQSSAudioPacket
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 7)
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

- (QSSSetEndpointerState)contentAsQSSSetEndpointerState
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 6)
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

- (QSSSetSpeechProfile)contentAsQSSSetSpeechProfile
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSetSpeechProfile alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSetSpeechProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSetSpeechContext)contentAsQSSSetSpeechContext
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSetSpeechContext alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSetSpeechContext *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSetRequestOrigin)contentAsQSSSetRequestOrigin
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSetRequestOrigin alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSetRequestOrigin *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSUpdateAudioInfo)contentAsQSSUpdateAudioInfo
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSUpdateAudioInfo alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSUpdateAudioInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSMultiUserStartSpeechRequest)contentAsQSSMultiUserStartSpeechRequest
{
  if ([(QSSMultiUserStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSMultiUserStartSpeechRequest alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSMultiUserStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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

- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStreamingRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSMultiUserStreamingRequest;
  uint64_t v10 = [(QSSMultiUserStreamingRequest *)&v33 init];
  unsigned int v11 = v10;
  if (!v10) {
    goto LABEL_56;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_57;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const MultiUserStreamingRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_55;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_57;
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
    goto LABEL_55;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (unsigned int v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_57:
    uint64_t v26 = 0;
    goto LABEL_58;
  }
  if (v22 >= 7)
  {
    if (v21[3])
    {
      v23 = (flatbuffers::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
      goto LABEL_24;
    }
LABEL_23:
    v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((unsigned char *)root + v21[2]))
      {
        case 0:
          goto LABEL_55;
        case 1:
          if (v23 && !siri::speech::schema_fb::MultiUserStartSpeechRequest::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 2:
          if (v23 && !siri::speech::schema_fb::UserParameters::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 3:
          if (v23 && !siri::speech::schema_fb::SetRequestOrigin::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 4:
          if (v23 && !siri::speech::schema_fb::SetSpeechContext::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 5:
          if (v23 && !siri::speech::schema_fb::SetSpeechProfile::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 6:
          if (v23 && !siri::speech::schema_fb::SetEndpointerState::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 7:
          if (v23 && !siri::speech::schema_fb::AudioPacket::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 8:
          if (!v23 || siri::speech::schema_fb::FinishAudio::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_55;
          }
          goto LABEL_57;
        case 9:
          if (v23 && !siri::speech::schema_fb::ResetServerEndpointer::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        case 0xA:
          if (v23 && !siri::speech::schema_fb::RecognitionSausage::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_57;
          }
          goto LABEL_55;
        default:
          goto LABEL_57;
      }
    }
    goto LABEL_55;
  }
  if (v22 >= 5) {
    goto LABEL_23;
  }
LABEL_55:
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_56:
  uint64_t v26 = v11;
LABEL_58:

  return v26;
}

- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3 root:(const MultiUserStreamingRequest *)a4
{
  return [(QSSMultiUserStreamingRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSMultiUserStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSMultiUserStreamingRequest)initWithFlatbuffData:(id)a3
{
  return [(QSSMultiUserStreamingRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end