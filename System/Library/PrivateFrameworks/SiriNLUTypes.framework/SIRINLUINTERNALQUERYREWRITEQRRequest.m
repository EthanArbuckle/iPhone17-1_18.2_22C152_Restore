@interface SIRINLUINTERNALQUERYREWRITEQRRequest
+ (Class)interactionsType;
+ (Class)originalInteractionsType;
- (BOOL)hasCdmRequestId;
- (BOOL)hasNluRequestId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)interactions;
- (NSMutableArray)originalInteractions;
- (NSString)resultCandidateId;
- (SIRINLUEXTERNALRequestID)cdmRequestId;
- (SIRINLUEXTERNALUUID)nluRequestId;
- (SIRINLUEXTERNALUUID)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interactionsAtIndex:(unint64_t)a3;
- (id)originalInteractionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)interactionsCount;
- (unint64_t)originalInteractionsCount;
- (void)addInteractions:(id)a3;
- (void)addOriginalInteractions:(id)a3;
- (void)clearInteractions;
- (void)clearOriginalInteractions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdmRequestId:(id)a3;
- (void)setInteractions:(id)a3;
- (void)setNluRequestId:(id)a3;
- (void)setOriginalInteractions:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALQUERYREWRITEQRRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_originalInteractions, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

- (void)setCdmRequestId:(id)a3
{
}

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
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

- (void)setOriginalInteractions:(id)a3
{
}

- (NSMutableArray)originalInteractions
{
  return self->_originalInteractions;
}

- (void)setInteractions:(id)a3
{
}

- (NSMutableArray)interactions
{
  return self->_interactions;
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setRequestId:](self, "setRequestId:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *((id *)v4 + 2);
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
        [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self addInteractions:*(void *)(*((void *)&v25 + 1) + 8 * i)];
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
        -[SIRINLUINTERNALQUERYREWRITEQRRequest addOriginalInteractions:](self, "addOriginalInteractions:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  if (*((void *)v4 + 6)) {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setResultCandidateId:](self, "setResultCandidateId:");
  }
  nluRequestId = self->_nluRequestId;
  uint64_t v18 = *((void *)v4 + 3);
  if (nluRequestId)
  {
    if (v18) {
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setNluRequestId:](self, "setNluRequestId:");
  }
  cdmRequestId = self->_cdmRequestId;
  uint64_t v20 = *((void *)v4 + 1);
  if (cdmRequestId)
  {
    if (v20) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setCdmRequestId:](self, "setCdmRequestId:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  uint64_t v4 = [(NSMutableArray *)self->_interactions hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_originalInteractions hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_resultCandidateId hash];
  unint64_t v7 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId hash];
  return v6 ^ v7 ^ [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
    && ((interactions = self->_interactions, !((unint64_t)interactions | v4[2]))
     || -[NSMutableArray isEqual:](interactions, "isEqual:"))
    && ((originalInteractions = self->_originalInteractions, !((unint64_t)originalInteractions | v4[4]))
     || -[NSMutableArray isEqual:](originalInteractions, "isEqual:"))
    && ((resultCandidateId = self->_resultCandidateId, !((unint64_t)resultCandidateId | v4[6]))
     || -[NSString isEqual:](resultCandidateId, "isEqual:"))
    && ((nluRequestId = self->_nluRequestId, !((unint64_t)nluRequestId | v4[3]))
     || -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:")))
  {
    cdmRequestId = self->_cdmRequestId;
    if ((unint64_t)cdmRequestId | v4[1]) {
      char v11 = -[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = self->_interactions;
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
        [v5 addInteractions:v13];

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
  uint64_t v14 = self->_originalInteractions;
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
        [v5 addOriginalInteractions:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_resultCandidateId copyWithZone:a3];
  long long v21 = (void *)v5[6];
  v5[6] = v20;

  id v22 = [(SIRINLUEXTERNALUUID *)self->_nluRequestId copyWithZone:a3];
  long long v23 = (void *)v5[3];
  v5[3] = v22;

  id v24 = [(SIRINLUEXTERNALRequestID *)self->_cdmRequestId copyWithZone:a3];
  long long v25 = (void *)v5[1];
  v5[1] = v24;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_requestId) {
    objc_msgSend(v13, "setRequestId:");
  }
  if ([(SIRINLUINTERNALQUERYREWRITEQRRequest *)self interactionsCount])
  {
    [v13 clearInteractions];
    unint64_t v4 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self interactionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self interactionsAtIndex:i];
        [v13 addInteractions:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALQUERYREWRITEQRRequest *)self originalInteractionsCount])
  {
    [v13 clearOriginalInteractions];
    unint64_t v8 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self originalInteractionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self originalInteractionsAtIndex:j];
        [v13 addOriginalInteractions:v11];
      }
    }
  }
  if (self->_resultCandidateId) {
    objc_msgSend(v13, "setResultCandidateId:");
  }
  uint64_t v12 = v13;
  if (self->_nluRequestId)
  {
    objc_msgSend(v13, "setNluRequestId:");
    uint64_t v12 = v13;
  }
  if (self->_cdmRequestId)
  {
    objc_msgSend(v13, "setCdmRequestId:");
    uint64_t v12 = v13;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_interactions;
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
  uint64_t v10 = self->_originalInteractions;
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

  if (self->_resultCandidateId) {
    PBDataWriterWriteStringField();
  }
  if (self->_nluRequestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cdmRequestId) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"requestId"];
  }
  if ([(NSMutableArray *)self->_interactions count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_interactions, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = self->_interactions;
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

    [v3 setObject:v6 forKey:@"interactions"];
  }
  if ([(NSMutableArray *)self->_originalInteractions count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_originalInteractions, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = self->_originalInteractions;
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

    [v3 setObject:v13 forKey:@"original_interactions"];
  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId) {
    [v3 setObject:resultCandidateId forKey:@"result_candidate_id"];
  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    long long v22 = [(SIRINLUEXTERNALUUID *)nluRequestId dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"nlu_request_id"];
  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    id v24 = [(SIRINLUEXTERNALRequestID *)cdmRequestId dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"cdm_request_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRRequest;
  id v4 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALQUERYREWRITEQRRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (id)originalInteractionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_originalInteractions objectAtIndex:a3];
}

- (unint64_t)originalInteractionsCount
{
  return [(NSMutableArray *)self->_originalInteractions count];
}

- (void)addOriginalInteractions:(id)a3
{
  id v4 = a3;
  originalInteractions = self->_originalInteractions;
  id v8 = v4;
  if (!originalInteractions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_originalInteractions;
    self->_originalInteractions = v6;

    id v4 = v8;
    originalInteractions = self->_originalInteractions;
  }
  [(NSMutableArray *)originalInteractions addObject:v4];
}

- (void)clearOriginalInteractions
{
}

- (id)interactionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_interactions objectAtIndex:a3];
}

- (unint64_t)interactionsCount
{
  return [(NSMutableArray *)self->_interactions count];
}

- (void)addInteractions:(id)a3
{
  id v4 = a3;
  interactions = self->_interactions;
  id v8 = v4;
  if (!interactions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_interactions;
    self->_interactions = v6;

    id v4 = v8;
    interactions = self->_interactions;
  }
  [(NSMutableArray *)interactions addObject:v4];
}

- (void)clearInteractions
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)originalInteractionsType
{
  return (Class)objc_opt_class();
}

+ (Class)interactionsType
{
  return (Class)objc_opt_class();
}

@end