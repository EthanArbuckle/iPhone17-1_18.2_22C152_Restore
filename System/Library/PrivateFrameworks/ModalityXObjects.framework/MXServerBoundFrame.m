@interface MXServerBoundFrame
- (BOOL)hasAudioFrame;
- (BOOL)hasBeginDictation;
- (BOOL)hasBeginRequest;
- (BOOL)hasCancelRequest;
- (BOOL)hasPayload;
- (BOOL)hasSessionMetadata;
- (BOOL)hasSpeechProfile;
- (BOOL)hasSpeechProfileRequest;
- (BOOL)hasStreamingSpeechProfileCommit;
- (BOOL)hasStreamingSpeechProfileData;
- (BOOL)hasStreamingSpeechProfileRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXAudioFrame)audioFrame;
- (MXBeginDictation)beginDictation;
- (MXBeginRequest)beginRequest;
- (MXCancelRequest)cancelRequest;
- (MXSessionMetadata)sessionMetadata;
- (MXSpeechProfile)speechProfile;
- (MXSpeechProfileBuildRequest)speechProfileRequest;
- (MXStreamingSpeechProfileAddData)streamingSpeechProfileData;
- (MXStreamingSpeechProfileBegin)streamingSpeechProfileRequest;
- (MXStreamingSpeechProfileCommit)streamingSpeechProfileCommit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadAsString:(int)a3;
- (int)StringAsPayload:(id)a3;
- (int)payload;
- (unint64_t)hash;
- (void)clearOneofValuesForPayload;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioFrame:(id)a3;
- (void)setBeginDictation:(id)a3;
- (void)setBeginRequest:(id)a3;
- (void)setCancelRequest:(id)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setPayload:(int)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setSpeechProfile:(id)a3;
- (void)setSpeechProfileRequest:(id)a3;
- (void)setStreamingSpeechProfileCommit:(id)a3;
- (void)setStreamingSpeechProfileData:(id)a3;
- (void)setStreamingSpeechProfileRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXServerBoundFrame

- (BOOL)hasSessionMetadata
{
  return self->_sessionMetadata != 0;
}

- (void)setSessionMetadata:(id)a3
{
  v4 = (MXSessionMetadata *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 1;
  sessionMetadata = self->_sessionMetadata;
  self->_sessionMetadata = v4;
}

- (BOOL)hasBeginRequest
{
  return self->_beginRequest != 0;
}

- (void)setBeginRequest:(id)a3
{
  v4 = (MXBeginRequest *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 2;
  beginRequest = self->_beginRequest;
  self->_beginRequest = v4;
}

- (BOOL)hasAudioFrame
{
  return self->_audioFrame != 0;
}

- (void)setAudioFrame:(id)a3
{
  v4 = (MXAudioFrame *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 3;
  audioFrame = self->_audioFrame;
  self->_audioFrame = v4;
}

- (BOOL)hasSpeechProfile
{
  return self->_speechProfile != 0;
}

- (void)setSpeechProfile:(id)a3
{
  v4 = (MXSpeechProfile *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 4;
  speechProfile = self->_speechProfile;
  self->_speechProfile = v4;
}

- (BOOL)hasCancelRequest
{
  return self->_cancelRequest != 0;
}

- (void)setCancelRequest:(id)a3
{
  v4 = (MXCancelRequest *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 5;
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;
}

- (BOOL)hasBeginDictation
{
  return self->_beginDictation != 0;
}

- (void)setBeginDictation:(id)a3
{
  v4 = (MXBeginDictation *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 6;
  beginDictation = self->_beginDictation;
  self->_beginDictation = v4;
}

- (BOOL)hasSpeechProfileRequest
{
  return self->_speechProfileRequest != 0;
}

- (void)setSpeechProfileRequest:(id)a3
{
  v4 = (MXSpeechProfileBuildRequest *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 7;
  speechProfileRequest = self->_speechProfileRequest;
  self->_speechProfileRequest = v4;
}

- (BOOL)hasStreamingSpeechProfileRequest
{
  return self->_streamingSpeechProfileRequest != 0;
}

- (void)setStreamingSpeechProfileRequest:(id)a3
{
  v4 = (MXStreamingSpeechProfileBegin *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 8;
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  self->_streamingSpeechProfileRequest = v4;
}

- (BOOL)hasStreamingSpeechProfileData
{
  return self->_streamingSpeechProfileData != 0;
}

- (void)setStreamingSpeechProfileData:(id)a3
{
  v4 = (MXStreamingSpeechProfileAddData *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 9;
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  self->_streamingSpeechProfileData = v4;
}

- (BOOL)hasStreamingSpeechProfileCommit
{
  return self->_streamingSpeechProfileCommit != 0;
}

- (void)setStreamingSpeechProfileCommit:(id)a3
{
  v4 = (MXStreamingSpeechProfileCommit *)a3;
  [(MXServerBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 10;
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  self->_streamingSpeechProfileCommit = v4;
}

- (int)payload
{
  if (*(unsigned char *)&self->_has) {
    return self->_payload;
  }
  else {
    return 0;
  }
}

- (void)setPayload:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayload
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)payloadAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_265420DC0[a3];
  }

  return v3;
}

- (int)StringAsPayload:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"session_metadata"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"begin_request"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"audio_frame"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"speech_profile"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"cancel_request"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"begin_dictation"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"speech_profile_request"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"streaming_speech_profile_request"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"streaming_speech_profile_data"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"streaming_speech_profile_commit"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForPayload
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_payload = 0;
  sessionMetadata = self->_sessionMetadata;
  self->_sessionMetadata = 0;

  beginRequest = self->_beginRequest;
  self->_beginRequest = 0;

  audioFrame = self->_audioFrame;
  self->_audioFrame = 0;

  speechProfile = self->_speechProfile;
  self->_speechProfile = 0;

  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = 0;

  beginDictation = self->_beginDictation;
  self->_beginDictation = 0;

  speechProfileRequest = self->_speechProfileRequest;
  self->_speechProfileRequest = 0;

  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  self->_streamingSpeechProfileRequest = 0;

  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  self->_streamingSpeechProfileData = 0;

  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  self->_streamingSpeechProfileCommit = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXServerBoundFrame;
  int v4 = [(MXServerBoundFrame *)&v8 description];
  v5 = [(MXServerBoundFrame *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  sessionMetadata = self->_sessionMetadata;
  if (sessionMetadata)
  {
    v5 = [(MXSessionMetadata *)sessionMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"session_metadata"];
  }
  beginRequest = self->_beginRequest;
  if (beginRequest)
  {
    v7 = [(MXBeginRequest *)beginRequest dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"begin_request"];
  }
  audioFrame = self->_audioFrame;
  if (audioFrame)
  {
    v9 = [(MXAudioFrame *)audioFrame dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"audio_frame"];
  }
  speechProfile = self->_speechProfile;
  if (speechProfile)
  {
    v11 = [(MXSpeechProfile *)speechProfile dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"speech_profile"];
  }
  cancelRequest = self->_cancelRequest;
  if (cancelRequest)
  {
    v13 = [(MXCancelRequest *)cancelRequest dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"cancel_request"];
  }
  beginDictation = self->_beginDictation;
  if (beginDictation)
  {
    v15 = [(MXBeginDictation *)beginDictation dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"begin_dictation"];
  }
  speechProfileRequest = self->_speechProfileRequest;
  if (speechProfileRequest)
  {
    v17 = [(MXSpeechProfileBuildRequest *)speechProfileRequest dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"speech_profile_request"];
  }
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  if (streamingSpeechProfileRequest)
  {
    v19 = [(MXStreamingSpeechProfileBegin *)streamingSpeechProfileRequest dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"streaming_speech_profile_request"];
  }
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  if (streamingSpeechProfileData)
  {
    v21 = [(MXStreamingSpeechProfileAddData *)streamingSpeechProfileData dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"streaming_speech_profile_data"];
  }
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  if (streamingSpeechProfileCommit)
  {
    v23 = [(MXStreamingSpeechProfileCommit *)streamingSpeechProfileCommit dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"streaming_speech_profile_commit"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t payload = self->_payload;
    if (payload >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_payload);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_265420DC0[payload];
    }
    [v3 setObject:v25 forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXServerBoundFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sessionMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_beginRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_audioFrame)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_speechProfile)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cancelRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_beginDictation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_speechProfileRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileCommit)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_payload;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  id v5 = v4;
  if (self->_sessionMetadata)
  {
    objc_msgSend(v4, "setSessionMetadata:");
    id v4 = v5;
  }
  if (self->_beginRequest)
  {
    objc_msgSend(v5, "setBeginRequest:");
    id v4 = v5;
  }
  if (self->_audioFrame)
  {
    objc_msgSend(v5, "setAudioFrame:");
    id v4 = v5;
  }
  if (self->_speechProfile)
  {
    objc_msgSend(v5, "setSpeechProfile:");
    id v4 = v5;
  }
  if (self->_cancelRequest)
  {
    objc_msgSend(v5, "setCancelRequest:");
    id v4 = v5;
  }
  if (self->_beginDictation)
  {
    objc_msgSend(v5, "setBeginDictation:");
    id v4 = v5;
  }
  if (self->_speechProfileRequest)
  {
    objc_msgSend(v5, "setSpeechProfileRequest:");
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileRequest)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileRequest:");
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileData)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileData:");
    id v4 = v5;
  }
  if (self->_streamingSpeechProfileCommit)
  {
    objc_msgSend(v5, "setStreamingSpeechProfileCommit:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_payload;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v7 = [(MXSessionMetadata *)self->_sessionMetadata copyWithZone:a3];
  objc_super v8 = (void *)v6[6];
  v6[6] = v7;

  id v9 = [(MXBeginRequest *)self->_beginRequest copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(MXAudioFrame *)self->_audioFrame copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(MXSpeechProfile *)self->_speechProfile copyWithZone:a3];
  v14 = (void *)v6[7];
  v6[7] = v13;

  id v15 = [(MXCancelRequest *)self->_cancelRequest copyWithZone:a3];
  v16 = (void *)v6[4];
  v6[4] = v15;

  id v17 = [(MXBeginDictation *)self->_beginDictation copyWithZone:a3];
  v18 = (void *)v6[2];
  v6[2] = v17;

  id v19 = [(MXSpeechProfileBuildRequest *)self->_speechProfileRequest copyWithZone:a3];
  v20 = (void *)v6[8];
  v6[8] = v19;

  id v21 = [(MXStreamingSpeechProfileBegin *)self->_streamingSpeechProfileRequest copyWithZone:a3];
  v22 = (void *)v6[11];
  v6[11] = v21;

  id v23 = [(MXStreamingSpeechProfileAddData *)self->_streamingSpeechProfileData copyWithZone:a3];
  v24 = (void *)v6[10];
  v6[10] = v23;

  id v25 = [(MXStreamingSpeechProfileCommit *)self->_streamingSpeechProfileCommit copyWithZone:a3];
  v26 = (void *)v6[9];
  v6[9] = v25;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
LABEL_27:
    char v15 = 0;
    goto LABEL_28;
  }
  sessionMetadata = self->_sessionMetadata;
  if ((unint64_t)sessionMetadata | *((void *)v4 + 6)
    && !-[MXSessionMetadata isEqual:](sessionMetadata, "isEqual:"))
  {
    goto LABEL_27;
  }
  beginRequest = self->_beginRequest;
  if ((unint64_t)beginRequest | *((void *)v4 + 3))
  {
    if (!-[MXBeginRequest isEqual:](beginRequest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  audioFrame = self->_audioFrame;
  if ((unint64_t)audioFrame | *((void *)v4 + 1))
  {
    if (!-[MXAudioFrame isEqual:](audioFrame, "isEqual:")) {
      goto LABEL_27;
    }
  }
  speechProfile = self->_speechProfile;
  if ((unint64_t)speechProfile | *((void *)v4 + 7))
  {
    if (!-[MXSpeechProfile isEqual:](speechProfile, "isEqual:")) {
      goto LABEL_27;
    }
  }
  cancelRequest = self->_cancelRequest;
  if ((unint64_t)cancelRequest | *((void *)v4 + 4))
  {
    if (!-[MXCancelRequest isEqual:](cancelRequest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  beginDictation = self->_beginDictation;
  if ((unint64_t)beginDictation | *((void *)v4 + 2))
  {
    if (!-[MXBeginDictation isEqual:](beginDictation, "isEqual:")) {
      goto LABEL_27;
    }
  }
  speechProfileRequest = self->_speechProfileRequest;
  if ((unint64_t)speechProfileRequest | *((void *)v4 + 8))
  {
    if (!-[MXSpeechProfileBuildRequest isEqual:](speechProfileRequest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  if ((unint64_t)streamingSpeechProfileRequest | *((void *)v4 + 11))
  {
    if (!-[MXStreamingSpeechProfileBegin isEqual:](streamingSpeechProfileRequest, "isEqual:")) {
      goto LABEL_27;
    }
  }
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  if ((unint64_t)streamingSpeechProfileData | *((void *)v4 + 10))
  {
    if (!-[MXStreamingSpeechProfileAddData isEqual:](streamingSpeechProfileData, "isEqual:")) {
      goto LABEL_27;
    }
  }
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  if ((unint64_t)streamingSpeechProfileCommit | *((void *)v4 + 9)) {
    char v15 = -[MXStreamingSpeechProfileCommit isEqual:](streamingSpeechProfileCommit, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_payload;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MXSessionMetadata *)self->_sessionMetadata hash] ^ v3;
  unint64_t v5 = [(MXBeginRequest *)self->_beginRequest hash];
  unint64_t v6 = v4 ^ v5 ^ [(MXAudioFrame *)self->_audioFrame hash];
  unint64_t v7 = [(MXSpeechProfile *)self->_speechProfile hash];
  unint64_t v8 = v7 ^ [(MXCancelRequest *)self->_cancelRequest hash];
  unint64_t v9 = v6 ^ v8 ^ [(MXBeginDictation *)self->_beginDictation hash];
  unint64_t v10 = [(MXSpeechProfileBuildRequest *)self->_speechProfileRequest hash];
  unint64_t v11 = v10 ^ [(MXStreamingSpeechProfileBegin *)self->_streamingSpeechProfileRequest hash];
  unint64_t v12 = v11 ^ [(MXStreamingSpeechProfileAddData *)self->_streamingSpeechProfileData hash];
  return v9 ^ v12 ^ [(MXStreamingSpeechProfileCommit *)self->_streamingSpeechProfileCommit hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 96))
  {
    self->_uint64_t payload = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  sessionMetadata = self->_sessionMetadata;
  uint64_t v7 = v5[6];
  v26 = v5;
  if (sessionMetadata)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MXSessionMetadata mergeFrom:](sessionMetadata, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MXServerBoundFrame setSessionMetadata:](self, "setSessionMetadata:");
  }
  unint64_t v5 = v26;
LABEL_9:
  beginRequest = self->_beginRequest;
  uint64_t v9 = v5[3];
  if (beginRequest)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MXBeginRequest mergeFrom:](beginRequest, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MXServerBoundFrame setBeginRequest:](self, "setBeginRequest:");
  }
  unint64_t v5 = v26;
LABEL_15:
  audioFrame = self->_audioFrame;
  uint64_t v11 = v5[1];
  if (audioFrame)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MXAudioFrame mergeFrom:](audioFrame, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MXServerBoundFrame setAudioFrame:](self, "setAudioFrame:");
  }
  unint64_t v5 = v26;
LABEL_21:
  speechProfile = self->_speechProfile;
  uint64_t v13 = v5[7];
  if (speechProfile)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MXSpeechProfile mergeFrom:](speechProfile, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MXServerBoundFrame setSpeechProfile:](self, "setSpeechProfile:");
  }
  unint64_t v5 = v26;
LABEL_27:
  cancelRequest = self->_cancelRequest;
  uint64_t v15 = v5[4];
  if (cancelRequest)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MXCancelRequest mergeFrom:](cancelRequest, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MXServerBoundFrame setCancelRequest:](self, "setCancelRequest:");
  }
  unint64_t v5 = v26;
LABEL_33:
  beginDictation = self->_beginDictation;
  uint64_t v17 = v5[2];
  if (beginDictation)
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[MXBeginDictation mergeFrom:](beginDictation, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[MXServerBoundFrame setBeginDictation:](self, "setBeginDictation:");
  }
  unint64_t v5 = v26;
LABEL_39:
  speechProfileRequest = self->_speechProfileRequest;
  uint64_t v19 = v5[8];
  if (speechProfileRequest)
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[MXSpeechProfileBuildRequest mergeFrom:](speechProfileRequest, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[MXServerBoundFrame setSpeechProfileRequest:](self, "setSpeechProfileRequest:");
  }
  unint64_t v5 = v26;
LABEL_45:
  streamingSpeechProfileRequest = self->_streamingSpeechProfileRequest;
  uint64_t v21 = v5[11];
  if (streamingSpeechProfileRequest)
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[MXStreamingSpeechProfileBegin mergeFrom:](streamingSpeechProfileRequest, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[MXServerBoundFrame setStreamingSpeechProfileRequest:](self, "setStreamingSpeechProfileRequest:");
  }
  unint64_t v5 = v26;
LABEL_51:
  streamingSpeechProfileData = self->_streamingSpeechProfileData;
  uint64_t v23 = v5[10];
  if (streamingSpeechProfileData)
  {
    if (!v23) {
      goto LABEL_57;
    }
    -[MXStreamingSpeechProfileAddData mergeFrom:](streamingSpeechProfileData, "mergeFrom:");
  }
  else
  {
    if (!v23) {
      goto LABEL_57;
    }
    -[MXServerBoundFrame setStreamingSpeechProfileData:](self, "setStreamingSpeechProfileData:");
  }
  unint64_t v5 = v26;
LABEL_57:
  streamingSpeechProfileCommit = self->_streamingSpeechProfileCommit;
  uint64_t v25 = v5[9];
  if (streamingSpeechProfileCommit)
  {
    if (v25) {
      -[MXStreamingSpeechProfileCommit mergeFrom:](streamingSpeechProfileCommit, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[MXServerBoundFrame setStreamingSpeechProfileCommit:](self, "setStreamingSpeechProfileCommit:");
  }

  MEMORY[0x270F9A758]();
}

- (MXSessionMetadata)sessionMetadata
{
  return self->_sessionMetadata;
}

- (MXBeginRequest)beginRequest
{
  return self->_beginRequest;
}

- (MXAudioFrame)audioFrame
{
  return self->_audioFrame;
}

- (MXSpeechProfile)speechProfile
{
  return self->_speechProfile;
}

- (MXCancelRequest)cancelRequest
{
  return self->_cancelRequest;
}

- (MXBeginDictation)beginDictation
{
  return self->_beginDictation;
}

- (MXSpeechProfileBuildRequest)speechProfileRequest
{
  return self->_speechProfileRequest;
}

- (MXStreamingSpeechProfileBegin)streamingSpeechProfileRequest
{
  return self->_streamingSpeechProfileRequest;
}

- (MXStreamingSpeechProfileAddData)streamingSpeechProfileData
{
  return self->_streamingSpeechProfileData;
}

- (MXStreamingSpeechProfileCommit)streamingSpeechProfileCommit
{
  return self->_streamingSpeechProfileCommit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingSpeechProfileRequest, 0);
  objc_storeStrong((id *)&self->_streamingSpeechProfileData, 0);
  objc_storeStrong((id *)&self->_streamingSpeechProfileCommit, 0);
  objc_storeStrong((id *)&self->_speechProfileRequest, 0);
  objc_storeStrong((id *)&self->_speechProfile, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_beginRequest, 0);
  objc_storeStrong((id *)&self->_beginDictation, 0);

  objc_storeStrong((id *)&self->_audioFrame, 0);
}

@end