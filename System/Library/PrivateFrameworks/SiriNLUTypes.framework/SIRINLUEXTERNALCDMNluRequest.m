@interface SIRINLUEXTERNALCDMNluRequest
+ (Class)previousTurnInputsType;
- (BOOL)hasCurrentTurnInput;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)previousTurnInputs;
- (SIRINLUEXTERNALRequestID)requestId;
- (SIRINLUEXTERNALTurnInput)currentTurnInput;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)previousTurnInputsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)previousTurnInputsCount;
- (void)addPreviousTurnInputs:(id)a3;
- (void)clearPreviousTurnInputs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentTurnInput:(id)a3;
- (void)setPreviousTurnInputs:(id)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDMNluRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_previousTurnInputs, 0);
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
}

- (void)setPreviousTurnInputs:(id)a3
{
}

- (NSMutableArray)previousTurnInputs
{
  return self->_previousTurnInputs;
}

- (void)setCurrentTurnInput:(id)a3
{
}

- (SIRINLUEXTERNALTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 3);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDMNluRequest setRequestId:](self, "setRequestId:");
  }
  currentTurnInput = self->_currentTurnInput;
  uint64_t v8 = *((void *)v4 + 1);
  if (currentTurnInput)
  {
    if (v8) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurnInput, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALCDMNluRequest setCurrentTurnInput:](self, "setCurrentTurnInput:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 2);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SIRINLUEXTERNALCDMNluRequest addPreviousTurnInputs:](self, "addPreviousTurnInputs:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALRequestID *)self->_requestId hash];
  unint64_t v4 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurnInput hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_previousTurnInputs hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((currentTurnInput = self->_currentTurnInput, !((unint64_t)currentTurnInput | v4[1]))
     || -[SIRINLUEXTERNALTurnInput isEqual:](currentTurnInput, "isEqual:")))
  {
    previousTurnInputs = self->_previousTurnInputs;
    if ((unint64_t)previousTurnInputs | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](previousTurnInputs, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALRequestID *)self->_requestId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurnInput copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_previousTurnInputs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addPreviousTurnInputs:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_requestId) {
    objc_msgSend(v8, "setRequestId:");
  }
  if (self->_currentTurnInput) {
    objc_msgSend(v8, "setCurrentTurnInput:");
  }
  if ([(SIRINLUEXTERNALCDMNluRequest *)self previousTurnInputsCount])
  {
    [v8 clearPreviousTurnInputs];
    unint64_t v4 = [(SIRINLUEXTERNALCDMNluRequest *)self previousTurnInputsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [(SIRINLUEXTERNALCDMNluRequest *)self previousTurnInputsAtIndex:i];
        [v8 addPreviousTurnInputs:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_currentTurnInput) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_previousTurnInputs;
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
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDMNluRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALRequestID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  currentTurnInput = self->_currentTurnInput;
  if (currentTurnInput)
  {
    uint64_t v7 = [(SIRINLUEXTERNALTurnInput *)currentTurnInput dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"current_turn_input"];
  }
  if ([(NSMutableArray *)self->_previousTurnInputs count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurnInputs, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_previousTurnInputs;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"previous_turn_inputs"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDMNluRequest;
  id v4 = [(SIRINLUEXTERNALCDMNluRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALCDMNluRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)previousTurnInputsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previousTurnInputs objectAtIndex:a3];
}

- (unint64_t)previousTurnInputsCount
{
  return [(NSMutableArray *)self->_previousTurnInputs count];
}

- (void)addPreviousTurnInputs:(id)a3
{
  id v4 = a3;
  previousTurnInputs = self->_previousTurnInputs;
  id v8 = v4;
  if (!previousTurnInputs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_previousTurnInputs;
    self->_previousTurnInputs = v6;

    id v4 = v8;
    previousTurnInputs = self->_previousTurnInputs;
  }
  [(NSMutableArray *)previousTurnInputs addObject:v4];
}

- (void)clearPreviousTurnInputs
{
}

- (BOOL)hasCurrentTurnInput
{
  return self->_currentTurnInput != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)previousTurnInputsType
{
  return (Class)objc_opt_class();
}

@end