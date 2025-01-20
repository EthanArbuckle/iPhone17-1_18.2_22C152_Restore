@interface QSSRecognitionStreamingResponse
- (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)addObjectToBuffer:(void *)a3;
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSCheckForSpeechResponse)contentAsQSSCheckForSpeechResponse;
- (QSSClientSetupInfo)contentAsQSSClientSetupInfo;
- (QSSEndPointCandidate)contentAsQSSEndPointCandidate;
- (QSSEndPointLikelihood)contentAsQSSEndPointLikelihood;
- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse;
- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRecognitionProgress)contentAsQSSRecognitionProgress;
- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3;
- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4;
- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4 verify:(BOOL)a5;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures;
- (QSSUpdatedAcousticProfile)contentAsQSSUpdatedAcousticProfile;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSRecognitionStreamingResponse

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
  v2.var0 = [(QSSRecognitionStreamingResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__47__QSSRecognitionStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSRecognitionStreamingResponse *)self content_type];
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(QSSRecognitionStreamingResponse *)self contentAsQSSFinalSpeechRecognitionResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(QSSRecognitionStreamingResponse *)self contentAsQSSPartialSpeechRecognitionResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 3)
  {
    uint64_t v10 = [(QSSRecognitionStreamingResponse *)self contentAsQSSUpdatedAcousticProfile];
    unsigned int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 4)
  {
    __int16 v12 = [(QSSRecognitionStreamingResponse *)self contentAsQSSEndPointLikelihood];
    unsigned int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v13 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 5)
  {
    v14 = [(QSSRecognitionStreamingResponse *)self contentAsQSSEndPointCandidate];
    unsigned int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 6)
  {
    v16 = [(QSSRecognitionStreamingResponse *)self contentAsQSSRecognitionProgress];
    unsigned int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v17 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 7)
  {
    v18 = [(QSSRecognitionStreamingResponse *)self contentAsQSSCheckForSpeechResponse];
    unsigned int v37 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v37 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 8)
  {
    v19 = [(QSSRecognitionStreamingResponse *)self contentAsQSSRecognitionCandidate];
    unsigned int v36 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v36 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 9)
  {
    v20 = [(QSSRecognitionStreamingResponse *)self contentAsQSSRequestStatsResponse];
    unsigned int v35 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v35 = 0;
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 10)
  {
    v21 = [(QSSRecognitionStreamingResponse *)self contentAsQSSServerEndpointFeatures];
    unsigned int v34 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v34 = 0;
  }
  unsigned int v33 = v17;
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 11)
  {
    v22 = [(QSSRecognitionStreamingResponse *)self contentAsQSSClientSetupInfo];
    unsigned int v23 = [v22 addObjectToBuffer:a3];

    unsigned int v32 = v23;
  }
  else
  {
    unsigned int v32 = 0;
  }
  unsigned int v24 = v15;
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 12)
  {
    v25 = [(QSSRecognitionStreamingResponse *)self contentAsQSSAudioLimitExceeded];
    unsigned int v26 = [v25 addObjectToBuffer:a3];

    uint64_t v30 = v26;
  }
  else
  {
    uint64_t v30 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v27 = *((void *)a3 + 6);
  uint64_t v28 = *((void *)a3 + 4);
  uint64_t v38 = *((void *)a3 + 5);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v13);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 5) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v24);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 6) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v33);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 7) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v37);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v36);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v35);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v34);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 11) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v32);
  }
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 12) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  }
  return (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v38);
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 12)
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

- (QSSClientSetupInfo)contentAsQSSClientSetupInfo
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSClientSetupInfo alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSClientSetupInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSServerEndpointFeatures alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSServerEndpointFeatures *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 9)
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
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 8)
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

- (QSSCheckForSpeechResponse)contentAsQSSCheckForSpeechResponse
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSCheckForSpeechResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSCheckForSpeechResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSRecognitionProgress alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSRecognitionProgress *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSEndPointCandidate)contentAsQSSEndPointCandidate
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSEndPointCandidate alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSEndPointCandidate *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSEndPointLikelihood)contentAsQSSEndPointLikelihood
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSEndPointLikelihood alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSEndPointLikelihood *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSUpdatedAcousticProfile)contentAsQSSUpdatedAcousticProfile
{
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSUpdatedAcousticProfile alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSUpdatedAcousticProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 2)
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
  if ([(QSSRecognitionStreamingResponse *)self content_type] == 1)
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

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSRecognitionStreamingResponse;
  uint64_t v10 = [(QSSRecognitionStreamingResponse *)&v33 init];
  unsigned int v11 = v10;
  if (!v10) {
    goto LABEL_62;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_63;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    unsigned int v13 = (unsigned int *)[*p_data bytes];
    a4 = (const RecognitionStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5) {
    goto LABEL_61;
  }
  unint64_t v14 = [*p_data bytes];
  uint64_t v15 = [*p_data length];
  unint64_t var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15) {
    goto LABEL_63;
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
    goto LABEL_61;
  }
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), unsigned int v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_63:
    unsigned int v26 = 0;
    goto LABEL_64;
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
            goto LABEL_63;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 3:
          if (v23 && !siri::speech::schema_fb::UpdatedAcousticProfile::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 4:
          if (v23 && !siri::speech::schema_fb::EndPointLikelihood::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 5:
          if (v23 && !siri::speech::schema_fb::EndPointCandidate::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 6:
          if (v23 && !siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 7:
          if (v23 && !siri::speech::schema_fb::SetEndpointerState::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 8:
          if (!v23 || siri::speech::schema_fb::RecognitionCandidate::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            break;
          }
          goto LABEL_63;
        case 9:
          if (v23 && !siri::speech::schema_fb::RequestStatsResponse::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 0xA:
          if (v23 && !siri::speech::schema_fb::ServerEndpointFeatures::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 0xB:
          if (v23 && !siri::speech::schema_fb::ClientSetupInfo::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 0xC:
          if (v23
            && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, (const unsigned __int8 *)v23))
          {
            goto LABEL_63;
          }
          break;
        default:
          goto LABEL_63;
      }
    }
  }
LABEL_61:
  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v28);
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_62:
  unsigned int v26 = v11;
LABEL_64:

  return v26;
}

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4
{
  return [(QSSRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end