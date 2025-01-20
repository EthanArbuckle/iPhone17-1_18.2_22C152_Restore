@interface MXClientBoundFrame
- (BOOL)hasAsrResult;
- (BOOL)hasPayload;
- (BOOL)hasProcessingError;
- (BOOL)hasRequestComplete;
- (BOOL)hasRequestMitigated;
- (BOOL)hasSpeechProfileRebuildNeeded;
- (BOOL)hasSpeechProfileResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXASRResult)asrResult;
- (MXProcessingError)processingError;
- (MXRequestComplete)requestComplete;
- (MXRequestMitigated)requestMitigated;
- (MXSpeechProfileBuildResponse)speechProfileResponse;
- (MXSpeechProfileRebuildNeeded)speechProfileRebuildNeeded;
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
- (void)setAsrResult:(id)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setPayload:(int)a3;
- (void)setProcessingError:(id)a3;
- (void)setRequestComplete:(id)a3;
- (void)setRequestMitigated:(id)a3;
- (void)setSpeechProfileRebuildNeeded:(id)a3;
- (void)setSpeechProfileResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXClientBoundFrame

- (BOOL)hasRequestComplete
{
  return self->_requestComplete != 0;
}

- (void)setRequestComplete:(id)a3
{
  v4 = (MXRequestComplete *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 1;
  requestComplete = self->_requestComplete;
  self->_requestComplete = v4;
}

- (BOOL)hasProcessingError
{
  return self->_processingError != 0;
}

- (void)setProcessingError:(id)a3
{
  v4 = (MXProcessingError *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 2;
  processingError = self->_processingError;
  self->_processingError = v4;
}

- (BOOL)hasAsrResult
{
  return self->_asrResult != 0;
}

- (void)setAsrResult:(id)a3
{
  v4 = (MXASRResult *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 3;
  asrResult = self->_asrResult;
  self->_asrResult = v4;
}

- (BOOL)hasSpeechProfileRebuildNeeded
{
  return self->_speechProfileRebuildNeeded != 0;
}

- (void)setSpeechProfileRebuildNeeded:(id)a3
{
  v4 = (MXSpeechProfileRebuildNeeded *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 4;
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  self->_speechProfileRebuildNeeded = v4;
}

- (BOOL)hasRequestMitigated
{
  return self->_requestMitigated != 0;
}

- (void)setRequestMitigated:(id)a3
{
  v4 = (MXRequestMitigated *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 5;
  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = v4;
}

- (BOOL)hasSpeechProfileResponse
{
  return self->_speechProfileResponse != 0;
}

- (void)setSpeechProfileResponse:(id)a3
{
  v4 = (MXSpeechProfileBuildResponse *)a3;
  [(MXClientBoundFrame *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 6;
  speechProfileResponse = self->_speechProfileResponse;
  self->_speechProfileResponse = v4;
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
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_265420D08[a3];
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
  else if ([v3 isEqualToString:@"request_complete"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"processing_error"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"asr_result"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"speech_profile_rebuild_needed"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"request_mitigated"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"speech_profile_response"])
  {
    int v4 = 6;
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
  requestComplete = self->_requestComplete;
  self->_requestComplete = 0;

  processingError = self->_processingError;
  self->_processingError = 0;

  asrResult = self->_asrResult;
  self->_asrResult = 0;

  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  self->_speechProfileRebuildNeeded = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  speechProfileResponse = self->_speechProfileResponse;
  self->_speechProfileResponse = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXClientBoundFrame;
  int v4 = [(MXClientBoundFrame *)&v8 description];
  v5 = [(MXClientBoundFrame *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestComplete = self->_requestComplete;
  if (requestComplete)
  {
    v5 = [(MXRequestComplete *)requestComplete dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_complete"];
  }
  processingError = self->_processingError;
  if (processingError)
  {
    v7 = [(MXProcessingError *)processingError dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"processing_error"];
  }
  asrResult = self->_asrResult;
  if (asrResult)
  {
    v9 = [(MXASRResult *)asrResult dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"asr_result"];
  }
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  if (speechProfileRebuildNeeded)
  {
    v11 = [(MXSpeechProfileRebuildNeeded *)speechProfileRebuildNeeded dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"speech_profile_rebuild_needed"];
  }
  requestMitigated = self->_requestMitigated;
  if (requestMitigated)
  {
    v13 = [(MXRequestMitigated *)requestMitigated dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"request_mitigated"];
  }
  speechProfileResponse = self->_speechProfileResponse;
  if (speechProfileResponse)
  {
    v15 = [(MXSpeechProfileBuildResponse *)speechProfileResponse dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"speech_profile_response"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t payload = self->_payload;
    if (payload >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_payload);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_265420D08[payload];
    }
    [v3 setObject:v17 forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXClientBoundFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestComplete)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_processingError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_asrResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_speechProfileRebuildNeeded)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_requestMitigated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_speechProfileResponse)
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
    v4[4] = self->_payload;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v5 = v4;
  if (self->_requestComplete)
  {
    objc_msgSend(v4, "setRequestComplete:");
    id v4 = v5;
  }
  if (self->_processingError)
  {
    objc_msgSend(v5, "setProcessingError:");
    id v4 = v5;
  }
  if (self->_asrResult)
  {
    objc_msgSend(v5, "setAsrResult:");
    id v4 = v5;
  }
  if (self->_speechProfileRebuildNeeded)
  {
    objc_msgSend(v5, "setSpeechProfileRebuildNeeded:");
    id v4 = v5;
  }
  if (self->_requestMitigated)
  {
    objc_msgSend(v5, "setRequestMitigated:");
    id v4 = v5;
  }
  if (self->_speechProfileResponse)
  {
    objc_msgSend(v5, "setSpeechProfileResponse:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_payload;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v7 = [(MXRequestComplete *)self->_requestComplete copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(MXProcessingError *)self->_processingError copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(MXASRResult *)self->_asrResult copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(MXSpeechProfileRebuildNeeded *)self->_speechProfileRebuildNeeded copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(MXRequestMitigated *)self->_requestMitigated copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  id v17 = [(MXSpeechProfileBuildResponse *)self->_speechProfileResponse copyWithZone:a3];
  v18 = (void *)v6[7];
  v6[7] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  requestComplete = self->_requestComplete;
  if ((unint64_t)requestComplete | *((void *)v4 + 4)
    && !-[MXRequestComplete isEqual:](requestComplete, "isEqual:"))
  {
    goto LABEL_19;
  }
  processingError = self->_processingError;
  if ((unint64_t)processingError | *((void *)v4 + 3))
  {
    if (!-[MXProcessingError isEqual:](processingError, "isEqual:")) {
      goto LABEL_19;
    }
  }
  asrResult = self->_asrResult;
  if ((unint64_t)asrResult | *((void *)v4 + 1))
  {
    if (!-[MXASRResult isEqual:](asrResult, "isEqual:")) {
      goto LABEL_19;
    }
  }
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  if ((unint64_t)speechProfileRebuildNeeded | *((void *)v4 + 6))
  {
    if (!-[MXSpeechProfileRebuildNeeded isEqual:](speechProfileRebuildNeeded, "isEqual:")) {
      goto LABEL_19;
    }
  }
  requestMitigated = self->_requestMitigated;
  if ((unint64_t)requestMitigated | *((void *)v4 + 5))
  {
    if (!-[MXRequestMitigated isEqual:](requestMitigated, "isEqual:")) {
      goto LABEL_19;
    }
  }
  speechProfileResponse = self->_speechProfileResponse;
  if ((unint64_t)speechProfileResponse | *((void *)v4 + 7)) {
    char v11 = -[MXSpeechProfileBuildResponse isEqual:](speechProfileResponse, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_payload;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MXRequestComplete *)self->_requestComplete hash] ^ v3;
  unint64_t v5 = [(MXProcessingError *)self->_processingError hash];
  unint64_t v6 = v4 ^ v5 ^ [(MXASRResult *)self->_asrResult hash];
  unint64_t v7 = [(MXSpeechProfileRebuildNeeded *)self->_speechProfileRebuildNeeded hash];
  unint64_t v8 = v7 ^ [(MXRequestMitigated *)self->_requestMitigated hash];
  return v6 ^ v8 ^ [(MXSpeechProfileBuildResponse *)self->_speechProfileResponse hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 64))
  {
    self->_uint64_t payload = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  requestComplete = self->_requestComplete;
  uint64_t v7 = v5[4];
  v18 = v5;
  if (requestComplete)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MXRequestComplete mergeFrom:](requestComplete, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MXClientBoundFrame setRequestComplete:](self, "setRequestComplete:");
  }
  unint64_t v5 = v18;
LABEL_9:
  processingError = self->_processingError;
  uint64_t v9 = v5[3];
  if (processingError)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MXProcessingError mergeFrom:](processingError, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MXClientBoundFrame setProcessingError:](self, "setProcessingError:");
  }
  unint64_t v5 = v18;
LABEL_15:
  asrResult = self->_asrResult;
  uint64_t v11 = v5[1];
  if (asrResult)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MXASRResult mergeFrom:](asrResult, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MXClientBoundFrame setAsrResult:](self, "setAsrResult:");
  }
  unint64_t v5 = v18;
LABEL_21:
  speechProfileRebuildNeeded = self->_speechProfileRebuildNeeded;
  uint64_t v13 = v5[6];
  if (speechProfileRebuildNeeded)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MXSpeechProfileRebuildNeeded mergeFrom:](speechProfileRebuildNeeded, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MXClientBoundFrame setSpeechProfileRebuildNeeded:](self, "setSpeechProfileRebuildNeeded:");
  }
  unint64_t v5 = v18;
LABEL_27:
  requestMitigated = self->_requestMitigated;
  uint64_t v15 = v5[5];
  if (requestMitigated)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MXRequestMitigated mergeFrom:](requestMitigated, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MXClientBoundFrame setRequestMitigated:](self, "setRequestMitigated:");
  }
  unint64_t v5 = v18;
LABEL_33:
  speechProfileResponse = self->_speechProfileResponse;
  uint64_t v17 = v5[7];
  if (speechProfileResponse)
  {
    if (v17) {
      -[MXSpeechProfileBuildResponse mergeFrom:](speechProfileResponse, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[MXClientBoundFrame setSpeechProfileResponse:](self, "setSpeechProfileResponse:");
  }

  MEMORY[0x270F9A758]();
}

- (MXRequestComplete)requestComplete
{
  return self->_requestComplete;
}

- (MXProcessingError)processingError
{
  return self->_processingError;
}

- (MXASRResult)asrResult
{
  return self->_asrResult;
}

- (MXSpeechProfileRebuildNeeded)speechProfileRebuildNeeded
{
  return self->_speechProfileRebuildNeeded;
}

- (MXRequestMitigated)requestMitigated
{
  return self->_requestMitigated;
}

- (MXSpeechProfileBuildResponse)speechProfileResponse
{
  return self->_speechProfileResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileResponse, 0);
  objc_storeStrong((id *)&self->_speechProfileRebuildNeeded, 0);
  objc_storeStrong((id *)&self->_requestMitigated, 0);
  objc_storeStrong((id *)&self->_requestComplete, 0);
  objc_storeStrong((id *)&self->_processingError, 0);

  objc_storeStrong((id *)&self->_asrResult, 0);
}

@end