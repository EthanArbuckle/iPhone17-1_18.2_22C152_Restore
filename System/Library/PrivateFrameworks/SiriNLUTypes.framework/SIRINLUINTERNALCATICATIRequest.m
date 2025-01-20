@interface SIRINLUINTERNALCATICATIRequest
- (BOOL)hasEmbeddings;
- (BOOL)hasNormalisedUtterance;
- (BOOL)hasOriginalUtterance;
- (BOOL)hasRequestId;
- (BOOL)hasTurnInput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)normalisedUtterance;
- (NSString)originalUtterance;
- (SIRINLUEXTERNALTurnInput)turnInput;
- (SIRINLUEXTERNALUUID)requestId;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddings:(id)a3;
- (void)setNormalisedUtterance:(id)a3;
- (void)setOriginalUtterance:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTurnInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCATICATIRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_originalUtterance, 0);
  objc_storeStrong((id *)&self->_normalisedUtterance, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
}

- (void)setTurnInput:(id)a3
{
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setNormalisedUtterance:(id)a3
{
}

- (NSString)normalisedUtterance
{
  return self->_normalisedUtterance;
}

- (void)setOriginalUtterance:(id)a3
{
}

- (NSString)originalUtterance
{
  return self->_originalUtterance;
}

- (void)setEmbeddings:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings
{
  return self->_embeddings;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  embeddings = self->_embeddings;
  v11 = v4;
  uint64_t v6 = v4[1];
  if (embeddings)
  {
    if (v6) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddings, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALCATICATIRequest setEmbeddings:](self, "setEmbeddings:");
  }
  if (v11[3]) {
    -[SIRINLUINTERNALCATICATIRequest setOriginalUtterance:](self, "setOriginalUtterance:");
  }
  if (v11[2]) {
    -[SIRINLUINTERNALCATICATIRequest setNormalisedUtterance:](self, "setNormalisedUtterance:");
  }
  requestId = self->_requestId;
  uint64_t v8 = v11[4];
  if (requestId)
  {
    if (v8) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALCATICATIRequest setRequestId:](self, "setRequestId:");
  }
  turnInput = self->_turnInput;
  uint64_t v10 = v11[5];
  if (turnInput)
  {
    if (v10) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALCATICATIRequest setTurnInput:](self, "setTurnInput:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings hash];
  NSUInteger v4 = [(NSString *)self->_originalUtterance hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_normalisedUtterance hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  return v6 ^ [(SIRINLUEXTERNALTurnInput *)self->_turnInput hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((embeddings = self->_embeddings, !((unint64_t)embeddings | v4[1]))
     || -[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddings, "isEqual:"))
    && ((originalUtterance = self->_originalUtterance, !((unint64_t)originalUtterance | v4[3]))
     || -[NSString isEqual:](originalUtterance, "isEqual:"))
    && ((normalisedUtterance = self->_normalisedUtterance, !((unint64_t)normalisedUtterance | v4[2]))
     || -[NSString isEqual:](normalisedUtterance, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")))
  {
    turnInput = self->_turnInput;
    if ((unint64_t)turnInput | v4[5]) {
      char v10 = -[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_originalUtterance copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_normalisedUtterance copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_embeddings)
  {
    objc_msgSend(v4, "setEmbeddings:");
    id v4 = v5;
  }
  if (self->_originalUtterance)
  {
    objc_msgSend(v5, "setOriginalUtterance:");
    id v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    objc_msgSend(v5, "setNormalisedUtterance:");
    id v4 = v5;
  }
  if (self->_requestId)
  {
    objc_msgSend(v5, "setRequestId:");
    id v4 = v5;
  }
  if (self->_turnInput)
  {
    objc_msgSend(v5, "setTurnInput:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_embeddings)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_originalUtterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_normalisedUtterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_requestId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_turnInput)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCATICATIRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  embeddings = self->_embeddings;
  if (embeddings)
  {
    id v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddings dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"embeddings"];
  }
  originalUtterance = self->_originalUtterance;
  if (originalUtterance) {
    [v3 setObject:originalUtterance forKey:@"original_utterance"];
  }
  normalisedUtterance = self->_normalisedUtterance;
  if (normalisedUtterance) {
    [v3 setObject:normalisedUtterance forKey:@"normalised_utterance"];
  }
  requestId = self->_requestId;
  if (requestId)
  {
    v9 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"request_id"];
  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    v11 = [(SIRINLUEXTERNALTurnInput *)turnInput dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"turn_input"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCATICATIRequest;
  id v4 = [(SIRINLUINTERNALCATICATIRequest *)&v8 description];
  id v5 = [(SIRINLUINTERNALCATICATIRequest *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTurnInput
{
  return self->_turnInput != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasNormalisedUtterance
{
  return self->_normalisedUtterance != 0;
}

- (BOOL)hasOriginalUtterance
{
  return self->_originalUtterance != 0;
}

- (BOOL)hasEmbeddings
{
  return self->_embeddings != 0;
}

@end