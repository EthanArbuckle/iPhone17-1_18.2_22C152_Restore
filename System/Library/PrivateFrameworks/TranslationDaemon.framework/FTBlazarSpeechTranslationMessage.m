@interface FTBlazarSpeechTranslationMessage
+ (Class)session_message_immutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)session_message;
- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded;
- (FTAudioPacket)session_messageAsFTAudioPacket;
- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3;
- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4;
- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4 verify:(BOOL)a5;
- (FTClientSetupInfo)session_messageAsFTClientSetupInfo;
- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse;
- (FTFinishAudio)session_messageAsFTFinishAudio;
- (FTLanguageDetected)session_messageAsFTLanguageDetected;
- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate;
- (FTRecognitionProgress)session_messageAsFTRecognitionProgress;
- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse;
- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer;
- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures;
- (FTSetEndpointerState)session_messageAsFTSetEndpointerState;
- (FTSpeechTranslationAudioPacket)session_messageAsFTSpeechTranslationAudioPacket;
- (FTSpeechTranslationFinalRecognitionResponse)session_messageAsFTSpeechTranslationFinalRecognitionResponse;
- (FTSpeechTranslationMtResponse)session_messageAsFTSpeechTranslationMtResponse;
- (FTSpeechTranslationPartialRecognitionResponse)session_messageAsFTSpeechTranslationPartialRecognitionResponse;
- (FTSpeechTranslationServerEndpointFeatures)session_messageAsFTSpeechTranslationServerEndpointFeatures;
- (FTSpeechTranslationTextToSpeechResponse)session_messageAsFTSpeechTranslationTextToSpeechResponse;
- (FTStartSpeechTranslationLoggingRequest)session_messageAsFTStartSpeechTranslationLoggingRequest;
- (FTStartSpeechTranslationRequest)session_messageAsFTStartSpeechTranslationRequest;
- (Offset<siri::speech::qss_fb::BlazarSpeechTranslationMessage>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)session_message_type;
@end

@implementation FTBlazarSpeechTranslationMessage

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3
{
  return [(FTBlazarSpeechTranslationMessage *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTBlazarSpeechTranslationMessage *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4
{
  return [(FTBlazarSpeechTranslationMessage *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTBlazarSpeechTranslationMessage;
  v10 = [(FTBlazarSpeechTranslationMessage *)&v30 init];
  v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_15;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)[*p_data bytes];
      a4 = (const BlazarSpeechTranslationMessage *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_15;
      }
      uint64_t v18 = [*p_data bytes];
      uint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      long long v27 = xmmword_26027B7E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      root = (siri::speech::qss_fb::BlazarSpeechTranslationMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::BlazarSpeechTranslationMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_15:
          v23 = 0;
          goto LABEL_16;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_16:

  return v23;
}

- (int64_t)session_message_type
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

- (FTStartSpeechTranslationRequest)session_messageAsFTStartSpeechTranslationRequest
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTStartSpeechTranslationRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTStartSpeechTranslationRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTLanguageDetected)session_messageAsFTLanguageDetected
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTLanguageDetected alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTLanguageDetected *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAudioPacket *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationAudioPacket)session_messageAsFTSpeechTranslationAudioPacket
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationAudioPacket *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTFinishAudio alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTFinishAudio *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetEndpointerState)session_messageAsFTSetEndpointerState
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSetEndpointerState alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetEndpointerState *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTResetServerEndpointer alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTResetServerEndpointer *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTStartSpeechTranslationLoggingRequest)session_messageAsFTStartSpeechTranslationLoggingRequest
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTStartSpeechTranslationLoggingRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTStartSpeechTranslationLoggingRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationPartialRecognitionResponse)session_messageAsFTSpeechTranslationPartialRecognitionResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 9)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationPartialRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationPartialRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationFinalRecognitionResponse)session_messageAsFTSpeechTranslationFinalRecognitionResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationFinalRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationFinalRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTAudioLimitExceeded alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTAudioLimitExceeded *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationMtResponse)session_messageAsFTSpeechTranslationMtResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationMtResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationMtResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationTextToSpeechResponse)session_messageAsFTSpeechTranslationTextToSpeechResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 13)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationTextToSpeechResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationTextToSpeechResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 14)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTFinalBlazarResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTFinalBlazarResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionProgress)session_messageAsFTRecognitionProgress
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 15)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTRecognitionProgress alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTRecognitionProgress *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 16)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTRecognitionCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTRecognitionCandidate *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 17)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTRequestStatsResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTRequestStatsResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 18)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTServerEndpointFeatures alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTServerEndpointFeatures *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTClientSetupInfo)session_messageAsFTClientSetupInfo
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 19)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTClientSetupInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTClientSetupInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationServerEndpointFeatures)session_messageAsFTSpeechTranslationServerEndpointFeatures
{
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 20)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSpeechTranslationServerEndpointFeatures alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSpeechTranslationServerEndpointFeatures *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)session_message
{
  switch([(FTBlazarSpeechTranslationMessage *)self session_message_type])
  {
    case 1:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTStartSpeechTranslationRequest];
      break;
    case 2:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTLanguageDetected];
      break;
    case 3:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTAudioPacket];
      break;
    case 4:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationAudioPacket];
      break;
    case 5:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTFinishAudio];
      break;
    case 6:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSetEndpointerState];
      break;
    case 7:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTResetServerEndpointer];
      break;
    case 8:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTStartSpeechTranslationLoggingRequest];
      break;
    case 9:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationPartialRecognitionResponse];
      break;
    case 10:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationFinalRecognitionResponse];
      break;
    case 11:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTAudioLimitExceeded];
      break;
    case 12:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationMtResponse];
      break;
    case 13:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationTextToSpeechResponse];
      break;
    case 14:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTFinalBlazarResponse];
      break;
    case 15:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRecognitionProgress];
      break;
    case 16:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRecognitionCandidate];
      break;
    case 17:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRequestStatsResponse];
      break;
    case 18:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTServerEndpointFeatures];
      break;
    case 19:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTClientSetupInfo];
      break;
    case 20:
      v3 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationServerEndpointFeatures];
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)session_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)session_message_typeForImmutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 20;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::BlazarSpeechTranslationMessage>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTBlazarSpeechTranslationMessage *)self session_message_type];
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 1)
  {
    v6 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTStartSpeechTranslationRequest];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 2)
  {
    v8 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTLanguageDetected];
    int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    int v9 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 3)
  {
    v10 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTAudioPacket];
    int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    int v11 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 4)
  {
    v12 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationAudioPacket];
    int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    int v13 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 5)
  {
    unint64_t v14 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTFinishAudio];
    int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    int v15 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 6)
  {
    v16 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSetEndpointerState];
    int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    int v17 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 7)
  {
    uint64_t v18 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTResetServerEndpointer];
    int v47 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    int v47 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 8)
  {
    uint64_t v19 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTStartSpeechTranslationLoggingRequest];
    int v46 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    int v46 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 9)
  {
    v20 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationPartialRecognitionResponse];
    int v45 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    int v45 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 10)
  {
    uint64_t v21 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationFinalRecognitionResponse];
    int v44 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    int v44 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 11)
  {
    v22 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTAudioLimitExceeded];
    int v43 = [v22 addObjectToBuffer:a3];
  }
  else
  {
    int v43 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 12)
  {
    v23 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationMtResponse];
    int v42 = [v23 addObjectToBuffer:a3];
  }
  else
  {
    int v42 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 13)
  {
    v24 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationTextToSpeechResponse];
    int v41 = [v24 addObjectToBuffer:a3];
  }
  else
  {
    int v41 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 14)
  {
    uint64_t v25 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTFinalBlazarResponse];
    int v40 = [v25 addObjectToBuffer:a3];
  }
  else
  {
    int v40 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 15)
  {
    uint64_t v26 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRecognitionProgress];
    int v39 = [v26 addObjectToBuffer:a3];
  }
  else
  {
    int v39 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 16)
  {
    long long v27 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRecognitionCandidate];
    int v38 = [v27 addObjectToBuffer:a3];
  }
  else
  {
    int v38 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 17)
  {
    uint64_t v28 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTRequestStatsResponse];
    int v37 = [v28 addObjectToBuffer:a3];
  }
  else
  {
    int v37 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 18)
  {
    uint64_t v29 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTServerEndpointFeatures];
    int v36 = [v29 addObjectToBuffer:a3];
  }
  else
  {
    int v36 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 19)
  {
    objc_super v30 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTClientSetupInfo];
    int v35 = [v30 addObjectToBuffer:a3];
  }
  else
  {
    int v35 = 0;
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 20)
  {
    v31 = [(FTBlazarSpeechTranslationMessage *)self session_messageAsFTSpeechTranslationServerEndpointFeatures];
    int v34 = [v31 addObjectToBuffer:a3];
  }
  else
  {
    int v34 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v32 = *((void *)a3 + 4);
  uint64_t v48 = *((void *)a3 + 6);
  uint64_t v49 = *((void *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v9);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v11);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 4) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v13);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v15);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 6) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v17);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 7) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v47);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 8) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v46);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 9) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v45);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 10) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v44);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 11) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v43);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 12) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v42);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 13) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v41);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 14) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v40);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 15) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v39);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 16) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v38);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 17) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v37);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 18) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v36);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 19) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v35);
  }
  if ([(FTBlazarSpeechTranslationMessage *)self session_message_type] == 20) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v34);
  }
  return (Offset<siri::speech::qss_fb::BlazarSpeechTranslationMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v32- (unsigned __int16)v48+ (unsigned __int16)v49);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTBlazarSpeechTranslationMessage *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTBlazarSpeechTranslationMessage_flatbuffData__block_invoke(uint64_t a1)
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