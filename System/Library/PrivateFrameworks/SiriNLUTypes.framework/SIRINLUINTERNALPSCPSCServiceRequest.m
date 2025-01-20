@interface SIRINLUINTERNALPSCPSCServiceRequest
+ (Class)matchingSpansType;
- (BOOL)hasEmbeddings;
- (BOOL)hasLegacyContext;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasTokenisedUtterance;
- (BOOL)hasTurnInput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (SIRINLUEXTERNALLegacyNLContext)legacyContext;
- (SIRINLUEXTERNALRequestID)nluRequestId;
- (SIRINLUEXTERNALTurnInput)turnInput;
- (SIRINLUEXTERNALUUID)requestId;
- (SIRINLUINTERNALNLV4_PARSERTokenisation)tokenisedUtterance;
- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddings:(id)a3;
- (void)setLegacyContext:(id)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTokenisedUtterance:(id)a3;
- (void)setTurnInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALPSCPSCServiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_tokenisedUtterance, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_legacyContext, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setLegacyContext:(id)a3
{
}

- (SIRINLUEXTERNALLegacyNLContext)legacyContext
{
  return self->_legacyContext;
}

- (void)setTurnInput:(id)a3
{
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setEmbeddings:(id)a3
{
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings
{
  return self->_embeddings;
}

- (void)setTokenisedUtterance:(id)a3
{
}

- (SIRINLUINTERNALNLV4_PARSERTokenisation)tokenisedUtterance
{
  return self->_tokenisedUtterance;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 5);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setRequestId:](self, "setRequestId:");
  }
  tokenisedUtterance = self->_tokenisedUtterance;
  uint64_t v8 = *((void *)v4 + 6);
  if (tokenisedUtterance)
  {
    if (v8) {
      -[SIRINLUINTERNALNLV4_PARSERTokenisation mergeFrom:](tokenisedUtterance, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setTokenisedUtterance:](self, "setTokenisedUtterance:");
  }
  embeddings = self->_embeddings;
  uint64_t v10 = *((void *)v4 + 1);
  if (embeddings)
  {
    if (v10) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddings, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setEmbeddings:](self, "setEmbeddings:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = *((id *)v4 + 3);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SIRINLUINTERNALPSCPSCServiceRequest addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  turnInput = self->_turnInput;
  uint64_t v17 = *((void *)v4 + 7);
  if (turnInput)
  {
    if (v17) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setTurnInput:](self, "setTurnInput:");
  }
  legacyContext = self->_legacyContext;
  uint64_t v19 = *((void *)v4 + 2);
  if (legacyContext)
  {
    if (v19) {
      -[SIRINLUEXTERNALLegacyNLContext mergeFrom:](legacyContext, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setLegacyContext:](self, "setLegacyContext:");
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v21 = *((void *)v4 + 4);
  if (nluRequestId)
  {
    if (v21) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[SIRINLUINTERNALPSCPSCServiceRequest setNluRequestId:](self, "setNluRequestId:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  unint64_t v4 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)self->_tokenisedUtterance hash] ^ v3;
  unint64_t v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_matchingSpans hash];
  unint64_t v7 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput hash];
  unint64_t v8 = v7 ^ [(SIRINLUEXTERNALLegacyNLContext *)self->_legacyContext hash];
  return v6 ^ v8 ^ [(SIRINLUEXTERNALRequestID *)self->_nluRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
    && ((tokenisedUtterance = self->_tokenisedUtterance, !((unint64_t)tokenisedUtterance | v4[6]))
     || -[SIRINLUINTERNALNLV4_PARSERTokenisation isEqual:](tokenisedUtterance, "isEqual:"))
    && ((embeddings = self->_embeddings, !((unint64_t)embeddings | v4[1]))
     || -[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddings, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[3]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((turnInput = self->_turnInput, !((unint64_t)turnInput | v4[7]))
     || -[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:"))
    && ((legacyContext = self->_legacyContext, !((unint64_t)legacyContext | v4[2]))
     || -[SIRINLUEXTERNALLegacyNLContext isEqual:](legacyContext, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[4]) {
      char v12 = -[SIRINLUEXTERNALRequestID isEqual:](nluRequestId, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)self->_tokenisedUtterance copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings copyWithZone:a3];
  id v11 = (void *)v5[1];
  v5[1] = v10;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v12 = self->_matchingSpans;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v16), "copyWithZone:", a3, (void)v25);
        [v5 addMatchingSpans:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput copyWithZone:a3];
  uint64_t v19 = (void *)v5[7];
  v5[7] = v18;

  id v20 = [(SIRINLUEXTERNALLegacyNLContext *)self->_legacyContext copyWithZone:a3];
  uint64_t v21 = (void *)v5[2];
  v5[2] = v20;

  id v22 = [(SIRINLUEXTERNALRequestID *)self->_nluRequestId copyWithZone:a3];
  long long v23 = (void *)v5[4];
  v5[4] = v22;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_requestId) {
    objc_msgSend(v9, "setRequestId:");
  }
  if (self->_tokenisedUtterance) {
    objc_msgSend(v9, "setTokenisedUtterance:");
  }
  if (self->_embeddings) {
    objc_msgSend(v9, "setEmbeddings:");
  }
  if ([(SIRINLUINTERNALPSCPSCServiceRequest *)self matchingSpansCount])
  {
    [v9 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALPSCPSCServiceRequest *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUINTERNALPSCPSCServiceRequest *)self matchingSpansAtIndex:i];
        [v9 addMatchingSpans:v7];
      }
    }
  }
  if (self->_turnInput) {
    objc_msgSend(v9, "setTurnInput:");
  }
  id v8 = v9;
  if (self->_legacyContext)
  {
    objc_msgSend(v9, "setLegacyContext:");
    id v8 = v9;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v9, "setNluRequestId:");
    id v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tokenisedUtterance) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_embeddings) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_matchingSpans;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_turnInput) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_legacyContext) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALPSCPSCServiceRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  tokenisedUtterance = self->_tokenisedUtterance;
  if (tokenisedUtterance)
  {
    uint64_t v7 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)tokenisedUtterance dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"tokenised_utterance"];
  }
  embeddings = self->_embeddings;
  if (embeddings)
  {
    uint64_t v9 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)embeddings dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"embeddings"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v11 = self->_matchingSpans;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"matching_spans"];
  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    id v18 = [(SIRINLUEXTERNALTurnInput *)turnInput dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"turn_input"];
  }
  legacyContext = self->_legacyContext;
  if (legacyContext)
  {
    id v20 = [(SIRINLUEXTERNALLegacyNLContext *)legacyContext dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"legacy_context"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    id v22 = [(SIRINLUEXTERNALRequestID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"nlu_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALPSCPSCServiceRequest;
  id v4 = [(SIRINLUINTERNALPSCPSCServiceRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALPSCPSCServiceRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasLegacyContext
{
  return self->_legacyContext != 0;
}

- (BOOL)hasTurnInput
{
  return self->_turnInput != 0;
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_matchingSpans objectAtIndex:a3];
}

- (unint64_t)matchingSpansCount
{
  return [(NSMutableArray *)self->_matchingSpans count];
}

- (void)addMatchingSpans:(id)a3
{
  id v4 = a3;
  matchingSpans = self->_matchingSpans;
  id v8 = v4;
  if (!matchingSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    id v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  [(NSMutableArray *)matchingSpans addObject:v4];
}

- (void)clearMatchingSpans
{
}

- (BOOL)hasEmbeddings
{
  return self->_embeddings != 0;
}

- (BOOL)hasTokenisedUtterance
{
  return self->_tokenisedUtterance != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end