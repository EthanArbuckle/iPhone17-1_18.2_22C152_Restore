@interface FTAsrRecognitionMessage
+ (Class)session_message_immutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)session_message;
- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3;
- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4;
- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4 verify:(BOOL)a5;
- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded;
- (FTAudioPacket)session_messageAsFTAudioPacket;
- (FTCheckForSpeechRequest)session_messageAsFTCheckForSpeechRequest;
- (FTCheckForSpeechResponse)session_messageAsFTCheckForSpeechResponse;
- (FTClientSetupInfo)session_messageAsFTClientSetupInfo;
- (FTEndPointCandidate)session_messageAsFTEndPointCandidate;
- (FTEndPointLikelihood)session_messageAsFTEndPointLikelihood;
- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse;
- (FTFinishAudio)session_messageAsFTFinishAudio;
- (FTMultiUserFinalSpeechRecognitionResponse)session_messageAsFTMultiUserFinalSpeechRecognitionResponse;
- (FTMultiUserRecognitionCandidate)session_messageAsFTMultiUserRecognitionCandidate;
- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse;
- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate;
- (FTRecognitionProgress)session_messageAsFTRecognitionProgress;
- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse;
- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer;
- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures;
- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage;
- (FTSetEndpointerState)session_messageAsFTSetEndpointerState;
- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin;
- (FTSetSpeechContext)session_messageAsFTSetSpeechContext;
- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile;
- (FTStartSpeechRequest)session_messageAsFTStartSpeechRequest;
- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo;
- (FTUpdatedAcousticProfile)session_messageAsFTUpdatedAcousticProfile;
- (Offset<siri::speech::qss_fb::AsrRecognitionMessage>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)session_message_type;
@end

@implementation FTAsrRecognitionMessage

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3
{
  return [(FTAsrRecognitionMessage *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTAsrRecognitionMessage *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4
{
  return [(FTAsrRecognitionMessage *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTAsrRecognitionMessage;
  v10 = [(FTAsrRecognitionMessage *)&v30 init];
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
      a4 = (const AsrRecognitionMessage *)v13 + *v13;
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
      root = (siri::speech::qss_fb::AsrRecognitionMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::AsrRecognitionMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (FTStartSpeechRequest)session_messageAsFTStartSpeechRequest
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTStartSpeechRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTStartSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTUpdateAudioInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTUpdateAudioInfo *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSetRequestOrigin alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetRequestOrigin *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechContext)session_messageAsFTSetSpeechContext
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSetSpeechContext alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetSpeechContext *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSetSpeechProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetSpeechProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 6)
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

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 7)
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

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 8)
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

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 9)
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

- (FTCheckForSpeechRequest)session_messageAsFTCheckForSpeechRequest
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTCheckForSpeechRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTCheckForSpeechRequest *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTSetAlternateRecognitionSausage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTSetAlternateRecognitionSausage *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTFinalSpeechRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMultiUserFinalSpeechRecognitionResponse)session_messageAsFTMultiUserFinalSpeechRecognitionResponse
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 13)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTMultiUserFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTMultiUserFinalSpeechRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 14)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTPartialSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTPartialSpeechRecognitionResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdatedAcousticProfile)session_messageAsFTUpdatedAcousticProfile
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 15)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTUpdatedAcousticProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTUpdatedAcousticProfile *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointLikelihood)session_messageAsFTEndPointLikelihood
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 16)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTEndPointLikelihood alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTEndPointLikelihood *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"session_message"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointCandidate)session_messageAsFTEndPointCandidate
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 17)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTEndPointCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTEndPointCandidate *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 18)
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

- (FTCheckForSpeechResponse)session_messageAsFTCheckForSpeechResponse
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 19)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTCheckForSpeechResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTCheckForSpeechResponse *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 20)
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

- (FTMultiUserRecognitionCandidate)session_messageAsFTMultiUserRecognitionCandidate
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 21)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"session_message"];
    if (!v3)
    {
      uint64_t v4 = [FTMultiUserRecognitionCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (uint64_t v7 = *(unsigned __int16 *)v6[6].var0) != 0) {
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      }
      else {
        v8 = 0;
      }
      v3 = [(FTMultiUserRecognitionCandidate *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 22)
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 23)
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
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 24)
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

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 25)
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

- (FLTBFBufferAccessor)session_message
{
  switch([(FTAsrRecognitionMessage *)self session_message_type])
  {
    case 1:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTStartSpeechRequest];
      break;
    case 2:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTUpdateAudioInfo];
      break;
    case 3:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetRequestOrigin];
      break;
    case 4:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetSpeechContext];
      break;
    case 5:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetSpeechProfile];
      break;
    case 6:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetEndpointerState];
      break;
    case 7:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTAudioPacket];
      break;
    case 8:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTFinishAudio];
      break;
    case 9:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTResetServerEndpointer];
      break;
    case 10:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTCheckForSpeechRequest];
      break;
    case 11:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetAlternateRecognitionSausage];
      break;
    case 12:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTFinalSpeechRecognitionResponse];
      break;
    case 13:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTMultiUserFinalSpeechRecognitionResponse];
      break;
    case 14:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTPartialSpeechRecognitionResponse];
      break;
    case 15:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTUpdatedAcousticProfile];
      break;
    case 16:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTEndPointLikelihood];
      break;
    case 17:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTEndPointCandidate];
      break;
    case 18:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTRecognitionProgress];
      break;
    case 19:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTCheckForSpeechResponse];
      break;
    case 20:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTRecognitionCandidate];
      break;
    case 21:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTMultiUserRecognitionCandidate];
      break;
    case 22:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTRequestStatsResponse];
      break;
    case 23:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTServerEndpointFeatures];
      break;
    case 24:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTClientSetupInfo];
      break;
    case 25:
      v3 = [(FTAsrRecognitionMessage *)self session_messageAsFTAudioLimitExceeded];
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)session_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x18)
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 21;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 22;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 23;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 24;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 25;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::AsrRecognitionMessage>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTAsrRecognitionMessage *)self session_message_type];
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 1)
  {
    v6 = [(FTAsrRecognitionMessage *)self session_messageAsFTStartSpeechRequest];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 2)
  {
    v8 = [(FTAsrRecognitionMessage *)self session_messageAsFTUpdateAudioInfo];
    int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    int v9 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 3)
  {
    v10 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetRequestOrigin];
    int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    int v11 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 4)
  {
    v12 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetSpeechContext];
    int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    int v13 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 5)
  {
    unint64_t v14 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetSpeechProfile];
    int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    int v15 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 6)
  {
    v16 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetEndpointerState];
    int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    int v17 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 7)
  {
    uint64_t v18 = [(FTAsrRecognitionMessage *)self session_messageAsFTAudioPacket];
    int v57 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    int v57 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 8)
  {
    uint64_t v19 = [(FTAsrRecognitionMessage *)self session_messageAsFTFinishAudio];
    int v56 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    int v56 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 9)
  {
    v20 = [(FTAsrRecognitionMessage *)self session_messageAsFTResetServerEndpointer];
    int v55 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    int v55 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 10)
  {
    uint64_t v21 = [(FTAsrRecognitionMessage *)self session_messageAsFTCheckForSpeechRequest];
    int v54 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    int v54 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 11)
  {
    v22 = [(FTAsrRecognitionMessage *)self session_messageAsFTSetAlternateRecognitionSausage];
    int v53 = [v22 addObjectToBuffer:a3];
  }
  else
  {
    int v53 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 12)
  {
    v23 = [(FTAsrRecognitionMessage *)self session_messageAsFTFinalSpeechRecognitionResponse];
    int v52 = [v23 addObjectToBuffer:a3];
  }
  else
  {
    int v52 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 13)
  {
    v24 = [(FTAsrRecognitionMessage *)self session_messageAsFTMultiUserFinalSpeechRecognitionResponse];
    int v51 = [v24 addObjectToBuffer:a3];
  }
  else
  {
    int v51 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 14)
  {
    uint64_t v25 = [(FTAsrRecognitionMessage *)self session_messageAsFTPartialSpeechRecognitionResponse];
    int v50 = [v25 addObjectToBuffer:a3];
  }
  else
  {
    int v50 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 15)
  {
    uint64_t v26 = [(FTAsrRecognitionMessage *)self session_messageAsFTUpdatedAcousticProfile];
    int v49 = [v26 addObjectToBuffer:a3];
  }
  else
  {
    int v49 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 16)
  {
    long long v27 = [(FTAsrRecognitionMessage *)self session_messageAsFTEndPointLikelihood];
    int v48 = [v27 addObjectToBuffer:a3];
  }
  else
  {
    int v48 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 17)
  {
    uint64_t v28 = [(FTAsrRecognitionMessage *)self session_messageAsFTEndPointCandidate];
    int v47 = [v28 addObjectToBuffer:a3];
  }
  else
  {
    int v47 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 18)
  {
    uint64_t v29 = [(FTAsrRecognitionMessage *)self session_messageAsFTRecognitionProgress];
    int v46 = [v29 addObjectToBuffer:a3];
  }
  else
  {
    int v46 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 19)
  {
    objc_super v30 = [(FTAsrRecognitionMessage *)self session_messageAsFTCheckForSpeechResponse];
    int v45 = [v30 addObjectToBuffer:a3];
  }
  else
  {
    int v45 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 20)
  {
    v31 = [(FTAsrRecognitionMessage *)self session_messageAsFTRecognitionCandidate];
    int v44 = [v31 addObjectToBuffer:a3];
  }
  else
  {
    int v44 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 21)
  {
    v32 = [(FTAsrRecognitionMessage *)self session_messageAsFTMultiUserRecognitionCandidate];
    int v43 = [v32 addObjectToBuffer:a3];
  }
  else
  {
    int v43 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 22)
  {
    v33 = [(FTAsrRecognitionMessage *)self session_messageAsFTRequestStatsResponse];
    int v42 = [v33 addObjectToBuffer:a3];
  }
  else
  {
    int v42 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 23)
  {
    v34 = [(FTAsrRecognitionMessage *)self session_messageAsFTServerEndpointFeatures];
    int v41 = [v34 addObjectToBuffer:a3];
  }
  else
  {
    int v41 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 24)
  {
    v35 = [(FTAsrRecognitionMessage *)self session_messageAsFTClientSetupInfo];
    int v40 = [v35 addObjectToBuffer:a3];
  }
  else
  {
    int v40 = 0;
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 25)
  {
    v36 = [(FTAsrRecognitionMessage *)self session_messageAsFTAudioLimitExceeded];
    int v39 = [v36 addObjectToBuffer:a3];
  }
  else
  {
    int v39 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v37 = *((void *)a3 + 4);
  uint64_t v58 = *((void *)a3 + 6);
  uint64_t v59 = *((void *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v9);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v11);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 4) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v13);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v15);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 6) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v17);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 7) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v57);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 8) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v56);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 9) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v55);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 10) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v54);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 11) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v53);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 12) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v52);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 13) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v51);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 14) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v50);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 15) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v49);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 16) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v48);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 17) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v47);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 18) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v46);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 19) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v45);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 20) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v44);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 21) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v43);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 22) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v42);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 23) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v41);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 24) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v40);
  }
  if ([(FTAsrRecognitionMessage *)self session_message_type] == 25) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v39);
  }
  return (Offset<siri::speech::qss_fb::AsrRecognitionMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v37- (unsigned __int16)v58+ (unsigned __int16)v59);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTAsrRecognitionMessage *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__39__FTAsrRecognitionMessage_flatbuffData__block_invoke(uint64_t a1)
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