@interface SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest
+ (Class)previousTurnsType;
+ (Class)qrHypothesesType;
- (BOOL)hasCurrentTurn;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)previousTurns;
- (NSMutableArray)qrHypotheses;
- (NSString)resultCandidateId;
- (SIRINLUEXTERNALTurnInput)currentTurn;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (SIRINLUEXTERNALUUID)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)previousTurnsAtIndex:(unint64_t)a3;
- (id)qrHypothesesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)previousTurnsCount;
- (unint64_t)qrHypothesesCount;
- (void)addPreviousTurns:(id)a3;
- (void)addQrHypotheses:(id)a3;
- (void)clearPreviousTurns;
- (void)clearQrHypotheses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentTurn:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setPreviousTurns:(id)a3;
- (void)setQrHypotheses:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_qrHypotheses, 0);
  objc_storeStrong((id *)&self->_previousTurns, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_currentTurn, 0);
}

- (void)setNluRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setQrHypotheses:(id)a3
{
}

- (NSMutableArray)qrHypotheses
{
  return self->_qrHypotheses;
}

- (void)setPreviousTurns:(id)a3
{
}

- (NSMutableArray)previousTurns
{
  return self->_previousTurns;
}

- (void)setCurrentTurn:(id)a3
{
}

- (SIRINLUEXTERNALTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  currentTurn = self->_currentTurn;
  uint64_t v6 = *((void *)v4 + 1);
  if (currentTurn)
  {
    if (v6) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurn, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setCurrentTurn:](self, "setCurrentTurn:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self addPreviousTurns:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = *((id *)v4 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest addQrHypotheses:](self, "addQrHypotheses:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  requestId = self->_requestId;
  uint64_t v18 = *((void *)v4 + 5);
  if (requestId)
  {
    if (v18) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setRequestId:](self, "setRequestId:");
  }
  if (*((void *)v4 + 6)) {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setResultCandidateId:](self, "setResultCandidateId:");
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v20 = *((void *)v4 + 2);
  if (nluRequestId)
  {
    if (v20) {
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setNluRequestId:](self, "setNluRequestId:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurn hash];
  uint64_t v4 = [(NSMutableArray *)self->_previousTurns hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_qrHypotheses hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  NSUInteger v7 = [(NSString *)self->_resultCandidateId hash];
  return v6 ^ v7 ^ [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((currentTurn = self->_currentTurn, !((unint64_t)currentTurn | v4[1]))
     || -[SIRINLUEXTERNALTurnInput isEqual:](currentTurn, "isEqual:"))
    && ((previousTurns = self->_previousTurns, !((unint64_t)previousTurns | v4[3]))
     || -[NSMutableArray isEqual:](previousTurns, "isEqual:"))
    && ((qrHypotheses = self->_qrHypotheses, !((unint64_t)qrHypotheses | v4[4]))
     || -[NSMutableArray isEqual:](qrHypotheses, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
    && ((resultCandidateId = self->_resultCandidateId, !((unint64_t)resultCandidateId | v4[6]))
     || -[NSString isEqual:](resultCandidateId, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[2]) {
      char v11 = -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurn copyWithZone:a3];
  NSUInteger v7 = (void *)v5[1];
  v5[1] = v6;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = self->_previousTurns;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addPreviousTurns:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = self->_qrHypotheses;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (void)v27);
        [v5 addQrHypotheses:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  id v20 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  long long v21 = (void *)v5[5];
  v5[5] = v20;

  uint64_t v22 = [(NSString *)self->_resultCandidateId copyWithZone:a3];
  long long v23 = (void *)v5[6];
  v5[6] = v22;

  id v24 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  long long v25 = (void *)v5[2];
  v5[2] = v24;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_currentTurn) {
    objc_msgSend(v13, "setCurrentTurn:");
  }
  if ([(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self previousTurnsCount])
  {
    [v13 clearPreviousTurns];
    unint64_t v4 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self previousTurnsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        NSUInteger v7 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self previousTurnsAtIndex:i];
        [v13 addPreviousTurns:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self qrHypothesesCount])
  {
    [v13 clearQrHypotheses];
    unint64_t v8 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self qrHypothesesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self qrHypothesesAtIndex:j];
        [v13 addQrHypotheses:v11];
      }
    }
  }
  if (self->_requestId) {
    objc_msgSend(v13, "setRequestId:");
  }
  uint64_t v12 = v13;
  if (self->_resultCandidateId)
  {
    objc_msgSend(v13, "setResultCandidateId:");
    uint64_t v12 = v13;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v13, "setNluRequestId:");
    uint64_t v12 = v13;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_currentTurn) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_previousTurns;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_qrHypotheses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_resultCandidateId) {
    PBDataWriterWriteStringField();
  }
  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  currentTurn = self->_currentTurn;
  if (currentTurn)
  {
    unint64_t v5 = [(SIRINLUEXTERNALTurnInput *)currentTurn dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"current_turn"];
  }
  if ([(NSMutableArray *)self->_previousTurns count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurns, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = self->_previousTurns;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"previous_turns"];
  }
  if ([(NSMutableArray *)self->_qrHypotheses count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_qrHypotheses, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = self->_qrHypotheses;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (void)v26);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"qr_hypotheses"];
  }
  requestId = self->_requestId;
  if (requestId)
  {
    long long v21 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"request_id"];
  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId) {
    [v3 setObject:resultCandidateId forKey:@"result_candidate_id"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    id v24 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"nlu_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest;
  id v4 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (id)qrHypothesesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_qrHypotheses objectAtIndex:a3];
}

- (unint64_t)qrHypothesesCount
{
  return [(NSMutableArray *)self->_qrHypotheses count];
}

- (void)addQrHypotheses:(id)a3
{
  id v4 = a3;
  qrHypotheses = self->_qrHypotheses;
  id v8 = v4;
  if (!qrHypotheses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_qrHypotheses;
    self->_qrHypotheses = v6;

    id v4 = v8;
    qrHypotheses = self->_qrHypotheses;
  }
  [(NSMutableArray *)qrHypotheses addObject:v4];
}

- (void)clearQrHypotheses
{
}

- (id)previousTurnsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previousTurns objectAtIndex:a3];
}

- (unint64_t)previousTurnsCount
{
  return [(NSMutableArray *)self->_previousTurns count];
}

- (void)addPreviousTurns:(id)a3
{
  id v4 = a3;
  previousTurns = self->_previousTurns;
  id v8 = v4;
  if (!previousTurns)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_previousTurns;
    self->_previousTurns = v6;

    id v4 = v8;
    previousTurns = self->_previousTurns;
  }
  [(NSMutableArray *)previousTurns addObject:v4];
}

- (void)clearPreviousTurns
{
}

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

+ (Class)qrHypothesesType
{
  return (Class)objc_opt_class();
}

+ (Class)previousTurnsType
{
  return (Class)objc_opt_class();
}

@end