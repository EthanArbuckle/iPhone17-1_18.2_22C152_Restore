@interface QSSMultilingualStreamingResponse
- (Offset<siri::speech::qss_fb::MultilingualStreamingResponse>)addObjectToBuffer:(void *)a3;
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse;
- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse;
- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3;
- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4;
- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4 verify:(BOOL)a5;
- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSMultilingualStreamingResponse

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
  v2.var0 = [(QSSMultilingualStreamingResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__48__QSSMultilingualStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::MultilingualStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSMultilingualStreamingResponse *)self content_type];
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(QSSMultilingualStreamingResponse *)self contentAsQSSFinalSpeechRecognitionResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(QSSMultilingualStreamingResponse *)self contentAsQSSPartialSpeechRecognitionResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];

    unsigned int v10 = v9;
  }
  else
  {
    unsigned int v10 = 0;
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 3)
  {
    uint64_t v11 = [(QSSMultilingualStreamingResponse *)self contentAsQSSRecognitionCandidate];
    unsigned int v12 = [v11 addObjectToBuffer:a3];

    unsigned int v13 = v12;
  }
  else
  {
    unsigned int v13 = 0;
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 4)
  {
    v14 = [(QSSMultilingualStreamingResponse *)self contentAsQSSRequestStatsResponse];
    unsigned int v15 = [v14 addObjectToBuffer:a3];

    unsigned int v16 = v15;
  }
  else
  {
    unsigned int v16 = 0;
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 5)
  {
    v17 = [(QSSMultilingualStreamingResponse *)self contentAsQSSAudioLimitExceeded];
    unsigned int v18 = [v17 addObjectToBuffer:a3];

    uint64_t v28 = v18;
  }
  else
  {
    uint64_t v28 = 0;
  }
  unsigned __int8 v19 = v5;
  unsigned int v30 = v16;
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 6)
  {
    v20 = [(QSSMultilingualStreamingResponse *)self contentAsQSSFinalBlazarResponse];
    unsigned int v21 = [v20 addObjectToBuffer:a3];
    unsigned int v22 = v13;

    unsigned int v23 = v21;
  }
  else
  {
    unsigned int v22 = v13;
    unsigned int v23 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v25 = *((void *)a3 + 5);
  uint64_t v24 = *((void *)a3 + 6);
  uint64_t v26 = *((void *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v19);
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v10);
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v22);
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v30);
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 5) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v29);
  }
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 6) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v23);
  }
  return (Offset<siri::speech::qss_fb::MultilingualStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v26 - (int)v24 + (int)v25);
}

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSFinalBlazarResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSFinalBlazarResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSAudioLimitExceeded alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSAudioLimitExceeded *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSRequestStatsResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSRequestStatsResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSRecognitionCandidate alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSRecognitionCandidate *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSPartialSpeechRecognitionResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSPartialSpeechRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse
{
  if ([(QSSMultilingualStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSFinalSpeechRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSMultilingualStreamingResponse;
  unsigned int v10 = [(QSSMultilingualStreamingResponse *)&v33 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_44;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_45;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const MultilingualStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_43;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_45;
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
    goto LABEL_43;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (unsigned int v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_45:
    uint64_t v26 = 0;
    goto LABEL_46;
  }
  if (v22 >= 7)
  {
    unsigned int v23 = (siri::speech::schema_fb::FinalSpeechRecognitionResponse *)v21[3];
    if (v21[3]) {
      unsigned int v23 = (siri::speech::schema_fb::FinalSpeechRecognitionResponse *)((char *)v23
    }
                                                                      + (void)root
                                                                      + *(unsigned int *)((char *)v23 + (void)root));
    goto LABEL_24;
  }
  if (v22 >= 5)
  {
    unsigned int v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((unsigned char *)root + v21[2]))
      {
        case 0:
          break;
        case 1:
          if (v23
            && !siri::speech::schema_fb::FinalSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_45;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_45;
          }
          break;
        case 3:
          if (v23 && !siri::speech::schema_fb::RecognitionCandidate::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_45;
          }
          break;
        case 4:
          if (v23 && !siri::speech::schema_fb::RequestStatsResponse::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_45;
          }
          break;
        case 5:
          if (v23
            && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, (const unsigned __int8 *)v23))
          {
            goto LABEL_45;
          }
          break;
        case 6:
          if (!v23 || siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            break;
          }
          goto LABEL_45;
        default:
          goto LABEL_45;
      }
    }
  }
LABEL_43:
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_44:
  uint64_t v26 = v11;
LABEL_46:

  return v26;
}

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4
{
  return [(QSSMultilingualStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSMultilingualStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSMultilingualStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end