@interface SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest
- (BOOL)hasRequestId;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)utterance;
- (SIRINLUEXTERNALRequestID)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (requestId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest setUtterance:](self, "setUtterance:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALRequestID *)self->_requestId hash];
  return [(NSString *)self->_utterance hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[1]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:")))
  {
    utterance = self->_utterance;
    if ((unint64_t)utterance | v4[2]) {
      char v7 = -[NSString isEqual:](utterance, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALRequestID *)self->_requestId copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_utterance copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    id v5 = [(SIRINLUEXTERNALRequestID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest;
  id v4 = [(SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

@end