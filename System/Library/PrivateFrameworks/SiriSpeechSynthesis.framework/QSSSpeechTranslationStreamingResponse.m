@interface QSSSpeechTranslationStreamingResponse
- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingResponse>)addObjectToBuffer:(void *)a3;
- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded;
- (QSSClientSetupInfo)contentAsQSSClientSetupInfo;
- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse;
- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate;
- (QSSRecognitionProgress)contentAsQSSRecognitionProgress;
- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse;
- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures;
- (QSSSpeechTranslationFinalRecognitionResponse)contentAsQSSSpeechTranslationFinalRecognitionResponse;
- (QSSSpeechTranslationMtResponse)contentAsQSSSpeechTranslationMtResponse;
- (QSSSpeechTranslationPartialRecognitionResponse)contentAsQSSSpeechTranslationPartialRecognitionResponse;
- (QSSSpeechTranslationServerEndpointFeatures)contentAsQSSSpeechTranslationServerEndpointFeatures;
- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3;
- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4;
- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4 verify:(BOOL)a5;
- (QSSSpeechTranslationTextToSpeechResponse)contentAsQSSSpeechTranslationTextToSpeechResponse;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation QSSSpeechTranslationStreamingResponse

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
  v2.var0 = [(QSSSpeechTranslationStreamingResponse *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__53__QSSSpeechTranslationStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(QSSSpeechTranslationStreamingResponse *)self content_type];
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 1)
  {
    char v6 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSSpeechTranslationPartialRecognitionResponse];
    unsigned int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 2)
  {
    long long v8 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSSpeechTranslationFinalRecognitionResponse];
    unsigned int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 3)
  {
    uint64_t v10 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSAudioLimitExceeded];
    unsigned int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 4)
  {
    __int16 v12 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSSpeechTranslationMtResponse];
    unsigned int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v13 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 5)
  {
    v14 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSSpeechTranslationTextToSpeechResponse];
    unsigned int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 6)
  {
    v16 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSFinalBlazarResponse];
    unsigned int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v17 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 7)
  {
    v18 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSRecognitionProgress];
    unsigned int v37 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v37 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 8)
  {
    v19 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSRecognitionCandidate];
    unsigned int v36 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v36 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 9)
  {
    v20 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSRequestStatsResponse];
    unsigned int v35 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v35 = 0;
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 10)
  {
    v21 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSServerEndpointFeatures];
    unsigned int v34 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    unsigned int v34 = 0;
  }
  unsigned int v33 = v17;
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 11)
  {
    v22 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSClientSetupInfo];
    unsigned int v23 = [v22 addObjectToBuffer:a3];

    unsigned int v32 = v23;
  }
  else
  {
    unsigned int v32 = 0;
  }
  unsigned int v24 = v15;
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 12)
  {
    v25 = [(QSSSpeechTranslationStreamingResponse *)self contentAsQSSSpeechTranslationServerEndpointFeatures];
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 1) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 2) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 3) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 4) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v13);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 5) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v24);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 6) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v33);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 7) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v37);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 8) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v36);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 9) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v35);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 10) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v34);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 11) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v32);
  }
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 12) {
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  }
  return (Offset<siri::speech::qss_fb::SpeechTranslationStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v38);
}

- (QSSSpeechTranslationServerEndpointFeatures)contentAsQSSSpeechTranslationServerEndpointFeatures
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationServerEndpointFeatures alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationServerEndpointFeatures *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 11)
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 10)
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 9)
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 8)
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

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 7)
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

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 6)
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

- (QSSSpeechTranslationTextToSpeechResponse)contentAsQSSSpeechTranslationTextToSpeechResponse
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationTextToSpeechResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationTextToSpeechResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSpeechTranslationMtResponse)contentAsQSSSpeechTranslationMtResponse
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationMtResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationMtResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 3)
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

- (QSSSpeechTranslationFinalRecognitionResponse)contentAsQSSSpeechTranslationFinalRecognitionResponse
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationFinalRecognitionResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationFinalRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSpeechTranslationPartialRecognitionResponse)contentAsQSSSpeechTranslationPartialRecognitionResponse
{
  if ([(QSSSpeechTranslationStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
    if (!v3)
    {
      v4 = [QSSSpeechTranslationPartialRecognitionResponse alloc];
      root = self->_root;
      char v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        long long v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        long long v8 = 0;
      }
      v3 = [(QSSSpeechTranslationPartialRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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

- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSSpeechTranslationStreamingResponse;
  uint64_t v10 = [(QSSSpeechTranslationStreamingResponse *)&v33 init];
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
    a4 = (const SpeechTranslationStreamingResponse *)v13 + *v13;
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
    unsigned int v23 = (siri::speech::schema_fb::SpeechTranslationPartialRecognitionResponse *)v21[3];
    if (v21[3]) {
      unsigned int v23 = (siri::speech::schema_fb::SpeechTranslationPartialRecognitionResponse *)((char *)v23
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
            && !siri::speech::schema_fb::SpeechTranslationPartialRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 3:
          if (v23
            && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, (const unsigned __int8 *)v23))
          {
            goto LABEL_63;
          }
          break;
        case 4:
          if (v23 && !siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 5:
          if (v23
            && !siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 6:
          if (v23 && !siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28)) {
            goto LABEL_63;
          }
          break;
        case 7:
          if (v23 && !siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28)) {
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
            && !siri::speech::schema_fb::SpeechTranslationServerEndpointFeatures::Verify(v23, (flatbuffers::Verifier *)&v28))
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

- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4
{
  return [(QSSSpeechTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(QSSSpeechTranslationStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end