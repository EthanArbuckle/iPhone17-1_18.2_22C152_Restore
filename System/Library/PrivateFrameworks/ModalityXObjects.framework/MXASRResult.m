@interface MXASRResult
- (BOOL)hasFinalSpeechRecognitionResponse;
- (BOOL)hasPayload;
- (BOOL)hasRecognitionCandidate;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXFinalSpeechRecognitionResponse)finalSpeechRecognitionResponse;
- (MXRecognitionCandidate)recognitionCandidate;
- (NSString)requestId;
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
- (void)setFinalSpeechRecognitionResponse:(id)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setPayload:(int)a3;
- (void)setRecognitionCandidate:(id)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXASRResult

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasRecognitionCandidate
{
  return self->_recognitionCandidate != 0;
}

- (void)setRecognitionCandidate:(id)a3
{
  v4 = (MXRecognitionCandidate *)a3;
  [(MXASRResult *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 1;
  recognitionCandidate = self->_recognitionCandidate;
  self->_recognitionCandidate = v4;
}

- (BOOL)hasFinalSpeechRecognitionResponse
{
  return self->_finalSpeechRecognitionResponse != 0;
}

- (void)setFinalSpeechRecognitionResponse:(id)a3
{
  v4 = (MXFinalSpeechRecognitionResponse *)a3;
  [(MXASRResult *)self clearOneofValuesForPayload];
  *(unsigned char *)&self->_has |= 1u;
  self->_payload = 2;
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  self->_finalSpeechRecognitionResponse = v4;
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
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_265420E18[a3];
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
  else if ([v3 isEqualToString:@"recognition_candidate"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"final_speech_recognition_response"])
  {
    int v4 = 2;
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
  recognitionCandidate = self->_recognitionCandidate;
  self->_recognitionCandidate = 0;

  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  self->_finalSpeechRecognitionResponse = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXASRResult;
  int v4 = [(MXASRResult *)&v8 description];
  v5 = [(MXASRResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  recognitionCandidate = self->_recognitionCandidate;
  if (recognitionCandidate)
  {
    v7 = [(MXRecognitionCandidate *)recognitionCandidate dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"recognition_candidate"];
  }
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  if (finalSpeechRecognitionResponse)
  {
    v9 = [(MXFinalSpeechRecognitionResponse *)finalSpeechRecognitionResponse dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"final_speech_recognition_response"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t payload = self->_payload;
    if (payload >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_payload);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_265420E18[payload];
    }
    [v4 setObject:v11 forKey:@"payload"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXASRResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recognitionCandidate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_finalSpeechRecognitionResponse)
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
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (self->_recognitionCandidate)
  {
    objc_msgSend(v5, "setRecognitionCandidate:");
    id v4 = v5;
  }
  if (self->_finalSpeechRecognitionResponse)
  {
    objc_msgSend(v5, "setFinalSpeechRecognitionResponse:");
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
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_requestId copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(MXRecognitionCandidate *)self->_recognitionCandidate copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(MXFinalSpeechRecognitionResponse *)self->_finalSpeechRecognitionResponse copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 4) && !-[NSString isEqual:](requestId, "isEqual:")) {
    goto LABEL_13;
  }
  recognitionCandidate = self->_recognitionCandidate;
  if ((unint64_t)recognitionCandidate | *((void *)v4 + 3))
  {
    if (!-[MXRecognitionCandidate isEqual:](recognitionCandidate, "isEqual:")) {
      goto LABEL_13;
    }
  }
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  if ((unint64_t)finalSpeechRecognitionResponse | *((void *)v4 + 1)) {
    char v8 = -[MXFinalSpeechRecognitionResponse isEqual:](finalSpeechRecognitionResponse, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_payload;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_requestId hash] ^ v3;
  unint64_t v5 = [(MXRecognitionCandidate *)self->_recognitionCandidate hash];
  return v4 ^ v5 ^ [(MXFinalSpeechRecognitionResponse *)self->_finalSpeechRecognitionResponse hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  unint64_t v5 = v4;
  if (v4[10])
  {
    self->_uint64_t payload = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  v10 = v4;
  if (*((void *)v4 + 4))
  {
    -[MXASRResult setRequestId:](self, "setRequestId:");
    unint64_t v5 = v10;
  }
  recognitionCandidate = self->_recognitionCandidate;
  uint64_t v7 = *((void *)v5 + 3);
  if (recognitionCandidate)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[MXRecognitionCandidate mergeFrom:](recognitionCandidate, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[MXASRResult setRecognitionCandidate:](self, "setRecognitionCandidate:");
  }
  unint64_t v5 = v10;
LABEL_11:
  finalSpeechRecognitionResponse = self->_finalSpeechRecognitionResponse;
  uint64_t v9 = *((void *)v5 + 1);
  if (finalSpeechRecognitionResponse)
  {
    if (v9) {
      -[MXFinalSpeechRecognitionResponse mergeFrom:](finalSpeechRecognitionResponse, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[MXASRResult setFinalSpeechRecognitionResponse:](self, "setFinalSpeechRecognitionResponse:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (MXRecognitionCandidate)recognitionCandidate
{
  return self->_recognitionCandidate;
}

- (MXFinalSpeechRecognitionResponse)finalSpeechRecognitionResponse
{
  return self->_finalSpeechRecognitionResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_recognitionCandidate, 0);

  objc_storeStrong((id *)&self->_finalSpeechRecognitionResponse, 0);
}

@end