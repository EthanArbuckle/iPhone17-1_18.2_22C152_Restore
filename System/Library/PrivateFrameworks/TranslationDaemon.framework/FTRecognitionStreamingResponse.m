@interface FTRecognitionStreamingResponse
+ (Class)content_immutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForImmutableObject:(id)a3;
- (FLTBFBufferAccessor)content;
- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded;
- (FTCheckForSpeechResponse)contentAsFTCheckForSpeechResponse;
- (FTClientSetupInfo)contentAsFTClientSetupInfo;
- (FTEndPointCandidate)contentAsFTEndPointCandidate;
- (FTEndPointLikelihood)contentAsFTEndPointLikelihood;
- (FTFinalSpeechRecognitionResponse)contentAsFTFinalSpeechRecognitionResponse;
- (FTMultiUserFinalSpeechRecognitionResponse)contentAsFTMultiUserFinalSpeechRecognitionResponse;
- (FTMultiUserRecognitionCandidate)contentAsFTMultiUserRecognitionCandidate;
- (FTPartialSpeechRecognitionResponse)contentAsFTPartialSpeechRecognitionResponse;
- (FTRecognitionCandidate)contentAsFTRecognitionCandidate;
- (FTRecognitionProgress)contentAsFTRecognitionProgress;
- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3;
- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4;
- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4 verify:(BOOL)a5;
- (FTRequestStatsResponse)contentAsFTRequestStatsResponse;
- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures;
- (FTUpdatedAcousticProfile)contentAsFTUpdatedAcousticProfile;
- (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int64_t)content_type;
@end

@implementation FTRecognitionStreamingResponse

- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3
{
  return [(FTRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4
{
  return [(FTRecognitionStreamingResponse *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTRecognitionStreamingResponse;
  v10 = [(FTRecognitionStreamingResponse *)&v30 init];
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
      a4 = (const RecognitionStreamingResponse *)v13 + *v13;
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
      root = (siri::speech::qss_fb::RecognitionStreamingResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::RecognitionStreamingResponse::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (FTFinalSpeechRecognitionResponse)contentAsFTFinalSpeechRecognitionResponse
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMultiUserFinalSpeechRecognitionResponse)contentAsFTMultiUserFinalSpeechRecognitionResponse
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTPartialSpeechRecognitionResponse)contentAsFTPartialSpeechRecognitionResponse
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdatedAcousticProfile)contentAsFTUpdatedAcousticProfile
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointLikelihood)contentAsFTEndPointLikelihood
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 5)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointCandidate)contentAsFTEndPointCandidate
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 6)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionProgress)contentAsFTRecognitionProgress
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 7)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTCheckForSpeechResponse)contentAsFTCheckForSpeechResponse
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 8)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionCandidate)contentAsFTRecognitionCandidate
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 9)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMultiUserRecognitionCandidate)contentAsFTMultiUserRecognitionCandidate
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 10)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRequestStatsResponse)contentAsFTRequestStatsResponse
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 11)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 12)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTClientSetupInfo)contentAsFTClientSetupInfo
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 13)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded
{
  if ([(FTRecognitionStreamingResponse *)self content_type] == 14)
  {
    v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"content"];
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
      [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"content"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)content
{
  switch([(FTRecognitionStreamingResponse *)self content_type])
  {
    case 1:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTFinalSpeechRecognitionResponse];
      break;
    case 2:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTMultiUserFinalSpeechRecognitionResponse];
      break;
    case 3:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTPartialSpeechRecognitionResponse];
      break;
    case 4:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTUpdatedAcousticProfile];
      break;
    case 5:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTEndPointLikelihood];
      break;
    case 6:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTEndPointCandidate];
      break;
    case 7:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTRecognitionProgress];
      break;
    case 8:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTCheckForSpeechResponse];
      break;
    case 9:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTRecognitionCandidate];
      break;
    case 10:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTMultiUserRecognitionCandidate];
      break;
    case 11:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTRequestStatsResponse];
      break;
    case 12:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTServerEndpointFeatures];
      break;
    case 13:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTClientSetupInfo];
      break;
    case 14:
      v3 = [(FTRecognitionStreamingResponse *)self contentAsFTAudioLimitExceeded];
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)content_typeForImmutableObject:(id)a3
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
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5 = [(FTRecognitionStreamingResponse *)self content_type];
  if ([(FTRecognitionStreamingResponse *)self content_type] == 1)
  {
    v6 = [(FTRecognitionStreamingResponse *)self contentAsFTFinalSpeechRecognitionResponse];
    int v7 = [v6 addObjectToBuffer:a3];
  }
  else
  {
    int v7 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 2)
  {
    v8 = [(FTRecognitionStreamingResponse *)self contentAsFTMultiUserFinalSpeechRecognitionResponse];
    int v9 = [v8 addObjectToBuffer:a3];
  }
  else
  {
    int v9 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 3)
  {
    v10 = [(FTRecognitionStreamingResponse *)self contentAsFTPartialSpeechRecognitionResponse];
    int v11 = [v10 addObjectToBuffer:a3];
  }
  else
  {
    int v11 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 4)
  {
    v12 = [(FTRecognitionStreamingResponse *)self contentAsFTUpdatedAcousticProfile];
    int v13 = [v12 addObjectToBuffer:a3];
  }
  else
  {
    int v13 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 5)
  {
    unint64_t v14 = [(FTRecognitionStreamingResponse *)self contentAsFTEndPointLikelihood];
    int v15 = [v14 addObjectToBuffer:a3];
  }
  else
  {
    int v15 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 6)
  {
    v16 = [(FTRecognitionStreamingResponse *)self contentAsFTEndPointCandidate];
    int v17 = [v16 addObjectToBuffer:a3];
  }
  else
  {
    int v17 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 7)
  {
    uint64_t v18 = [(FTRecognitionStreamingResponse *)self contentAsFTRecognitionProgress];
    int v39 = [v18 addObjectToBuffer:a3];
  }
  else
  {
    int v39 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 8)
  {
    uint64_t v19 = [(FTRecognitionStreamingResponse *)self contentAsFTCheckForSpeechResponse];
    int v38 = [v19 addObjectToBuffer:a3];
  }
  else
  {
    int v38 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 9)
  {
    v20 = [(FTRecognitionStreamingResponse *)self contentAsFTRecognitionCandidate];
    int v37 = [v20 addObjectToBuffer:a3];
  }
  else
  {
    int v37 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 10)
  {
    uint64_t v21 = [(FTRecognitionStreamingResponse *)self contentAsFTMultiUserRecognitionCandidate];
    int v36 = [v21 addObjectToBuffer:a3];
  }
  else
  {
    int v36 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 11)
  {
    v22 = [(FTRecognitionStreamingResponse *)self contentAsFTRequestStatsResponse];
    int v35 = [v22 addObjectToBuffer:a3];
  }
  else
  {
    int v35 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 12)
  {
    v23 = [(FTRecognitionStreamingResponse *)self contentAsFTServerEndpointFeatures];
    int v34 = [v23 addObjectToBuffer:a3];
  }
  else
  {
    int v34 = 0;
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 13)
  {
    v24 = [(FTRecognitionStreamingResponse *)self contentAsFTClientSetupInfo];
    int v33 = [v24 addObjectToBuffer:a3];
  }
  else
  {
    int v33 = 0;
  }
  int v32 = v17;
  if ([(FTRecognitionStreamingResponse *)self content_type] == 14)
  {
    uint64_t v25 = [(FTRecognitionStreamingResponse *)self contentAsFTAudioLimitExceeded];
    unsigned int v26 = [v25 addObjectToBuffer:a3];

    uint64_t v30 = v26;
  }
  else
  {
    uint64_t v30 = 0;
  }
  *((unsigned char *)a3 + 70) = 1;
  uint64_t v27 = *((void *)a3 + 6);
  uint64_t v28 = *((void *)a3 + 4);
  uint64_t v40 = *((void *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 4, v5, 0);
  if ([(FTRecognitionStreamingResponse *)self content_type] == 1) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v7);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 2) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v9);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 3) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v11);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 4) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v13);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v15);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 6) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v32);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 7) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v39);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 8) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v38);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 9) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v37);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 10) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v36);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 11) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v35);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 12) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v34);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 13) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v33);
  }
  if ([(FTRecognitionStreamingResponse *)self content_type] == 14) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v31);
  }
  return (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v28- (unsigned __int16)v27+ (unsigned __int16)v40);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTRecognitionStreamingResponse *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__46__FTRecognitionStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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