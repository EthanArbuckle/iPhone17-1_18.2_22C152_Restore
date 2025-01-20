@interface SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest
+ (Class)matchingSpansType;
- (BOOL)hasEmbeddings;
- (BOOL)hasMaxNumParses;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasTokenisedUtterance;
- (BOOL)hasTurnInput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
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
- (unint64_t)maxNumParses;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddings:(id)a3;
- (void)setHasMaxNumParses:(BOOL)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setMaxNumParses:(unint64_t)a3;
- (void)setNluRequestId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTokenisedUtterance:(id)a3;
- (void)setTurnInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_tokenisedUtterance, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)nluRequestId
{
  return self->_nluRequestId;
}

- (unint64_t)maxNumParses
{
  return self->_maxNumParses;
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setRequestId:](self, "setRequestId:");
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
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setTokenisedUtterance:](self, "setTokenisedUtterance:");
  }
  embeddings = self->_embeddings;
  uint64_t v10 = *((void *)v4 + 2);
  if (embeddings)
  {
    if (v10) {
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddings, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setEmbeddings:](self, "setEmbeddings:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = *((id *)v4 + 3);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setTurnInput:](self, "setTurnInput:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_maxNumParses = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v19 = *((void *)v4 + 4);
  if (nluRequestId)
  {
    if (v19) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setNluRequestId:](self, "setNluRequestId:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  unint64_t v4 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)self->_tokenisedUtterance hash];
  unint64_t v5 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings hash];
  uint64_t v6 = [(NSMutableArray *)self->_matchingSpans hash];
  unint64_t v7 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v8 = 2654435761u * self->_maxNumParses;
  }
  else {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(SIRINLUEXTERNALRequestID *)self->_nluRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  tokenisedUtterance = self->_tokenisedUtterance;
  if ((unint64_t)tokenisedUtterance | *((void *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALNLV4_PARSERTokenisation isEqual:](tokenisedUtterance, "isEqual:")) {
      goto LABEL_19;
    }
  }
  embeddings = self->_embeddings;
  if ((unint64_t)embeddings | *((void *)v4 + 2))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddings, "isEqual:")) {
      goto LABEL_19;
    }
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:")) {
      goto LABEL_19;
    }
  }
  turnInput = self->_turnInput;
  if ((unint64_t)turnInput | *((void *)v4 + 7))
  {
    if (!-[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_maxNumParses != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((void *)v4 + 4)) {
    char v11 = -[SIRINLUEXTERNALRequestID isEqual:](nluRequestId, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(SIRINLUINTERNALNLV4_PARSERTokenisation *)self->_tokenisedUtterance copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(SIRINLUINTERNALNLv4EmbeddingTensor *)self->_embeddings copyWithZone:a3];
  char v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = self->_matchingSpans;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (void)v23);
        [(id)v5 addMatchingSpans:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  id v18 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxNumParses;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v20 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3, (void)v23);
  long long v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  return (id)v5;
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
  if ([(SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *)self matchingSpansCount])
  {
    [v9 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *)self matchingSpansAtIndex:i];
        [v9 addMatchingSpans:v7];
      }
    }
  }
  if (self->_turnInput) {
    objc_msgSend(v9, "setTurnInput:");
  }
  id v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v9 + 1) = self->_maxNumParses;
    *((unsigned char *)v9 + 64) |= 1u;
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNLV4_PARSERNLv4ParserRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v11 = self->_matchingSpans;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:self->_maxNumParses];
    [v3 setObject:v19 forKey:@"max_num_parses"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    long long v21 = [(SIRINLUEXTERNALRequestID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"nlu_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest;
  id v4 = [(SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasMaxNumParses
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMaxNumParses:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMaxNumParses:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxNumParses = a3;
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