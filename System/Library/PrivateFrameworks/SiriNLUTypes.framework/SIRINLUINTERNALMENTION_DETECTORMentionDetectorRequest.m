@interface SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest
- (BOOL)hasCdmRequestId;
- (BOOL)hasEmbeddingTensor;
- (BOOL)hasMaxCandidates;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasTokenChain;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)resultCandidateId;
- (NSString)utterance;
- (SIRINLUEXTERNALRequestID)cdmRequestId;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (SIRINLUEXTERNALUUID)requestId;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)maxCandidates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmRequestId:(id)a3;
- (void)setEmbeddingTensor:(id)a3;
- (void)setHasMaxCandidates:(BOOL)a3;
- (void)setMaxCandidates:(unint64_t)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

- (void)setCdmRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (void)setEmbeddingTensor:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setTokenChain:(id)a3
{
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = v4[5];
  v15 = v4;
  if (requestId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setRequestId:](self, "setRequestId:");
  }
  v4 = v15;
LABEL_7:
  nluRequestId = self->_nluRequestId;
  uint64_t v8 = v4[4];
  if (nluRequestId)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setNluRequestId:](self, "setNluRequestId:");
  }
  v4 = v15;
LABEL_13:
  if (v4[6])
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setResultCandidateId:](self, "setResultCandidateId:");
    v4 = v15;
  }
  if (v4[8])
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setUtterance:](self, "setUtterance:");
    v4 = v15;
  }
  tokenChain = self->_tokenChain;
  uint64_t v10 = v4[7];
  if (tokenChain)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setTokenChain:](self, "setTokenChain:");
  }
  v4 = v15;
LABEL_23:
  embeddingTensor = self->_embeddingTensor;
  uint64_t v12 = v4[3];
  if (embeddingTensor)
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  v4 = v15;
LABEL_29:
  if (v4[9])
  {
    self->_maxCandidates = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  cdmRequestId = self->_cdmRequestId;
  uint64_t v14 = v4[2];
  if (cdmRequestId)
  {
    if (v14) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest setCdmRequestId:](self, "setCdmRequestId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  unint64_t v4 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
  NSUInteger v5 = [(NSString *)self->_resultCandidateId hash];
  NSUInteger v6 = [(NSString *)self->_utterance hash];
  unint64_t v7 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash];
  unint64_t v8 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v9 = 2654435761u * self->_maxCandidates;
  }
  else {
    unint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((void *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  resultCandidateId = self->_resultCandidateId;
  if ((unint64_t)resultCandidateId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](resultCandidateId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:")) {
      goto LABEL_21;
    }
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((void *)v4 + 7))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:")) {
      goto LABEL_21;
    }
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((void *)v4 + 3))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_maxCandidates != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  cdmRequestId = self->_cdmRequestId;
  if ((unint64_t)cdmRequestId | *((void *)v4 + 2)) {
    char v12 = -[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_resultCandidateId copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_utterance copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  id v14 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddingTensor copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxCandidates;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v18 = [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  return (id)v5;
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
  if (self->_nluRequestId)
  {
    objc_msgSend(v5, "setNluRequestId:");
    id v4 = v5;
  }
  if (self->_resultCandidateId)
  {
    objc_msgSend(v5, "setResultCandidateId:");
    id v4 = v5;
  }
  if (self->_utterance)
  {
    objc_msgSend(v5, "setUtterance:");
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    objc_msgSend(v5, "setTokenChain:");
    id v4 = v5;
  }
  if (self->_embeddingTensor)
  {
    objc_msgSend(v5, "setEmbeddingTensor:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_maxCandidates;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_cdmRequestId)
  {
    objc_msgSend(v5, "setCdmRequestId:");
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
  if (self->_nluRequestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_resultCandidateId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_tokenChain)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_embeddingTensor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_cdmRequestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    id v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    unint64_t v7 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"nlu_request_id"];
  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId) {
    [v3 setObject:resultCandidateId forKey:@"result_candidate_id"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    v11 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"token_chain"];
  }
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    v13 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddingTensor dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"embedding_tensor"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v14 = [NSNumber numberWithUnsignedLongLong:self->_maxCandidates];
    [v3 setObject:v14 forKey:@"max_candidates"];
  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    id v16 = [(SIRINLUEXTERNALRequestID *)cdmRequestId dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"cdm_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest;
  id v4 = [(SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequest *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
}

- (BOOL)hasMaxCandidates
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMaxCandidates:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMaxCandidates:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxCandidates = a3;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

@end