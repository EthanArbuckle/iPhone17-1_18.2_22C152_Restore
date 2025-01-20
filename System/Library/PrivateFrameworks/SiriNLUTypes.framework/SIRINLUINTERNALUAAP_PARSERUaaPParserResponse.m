@interface SIRINLUINTERNALUAAP_PARSERUaaPParserResponse
+ (Class)hypothesesType;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)hypotheses;
- (SIRINLUEXTERNALUUID)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hypothesesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hypothesesCount;
- (void)addHypotheses:(id)a3;
- (void)clearHypotheses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHypotheses:(id)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALUAAP_PARSERUaaPParserResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_hypotheses, 0);
}

- (void)setHypotheses:(id)a3
{
}

- (NSMutableArray)hypotheses
{
  return self->_hypotheses;
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestId = self->_requestId;
  uint64_t v6 = *((void *)v4 + 2);
  if (requestId)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALUAAP_PARSERUaaPParserResponse setRequestId:](self, "setRequestId:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUINTERNALUAAP_PARSERUaaPParserResponse addHypotheses:](self, "addHypotheses:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_requestId hash];
  return [(NSMutableArray *)self->_hypotheses hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[2]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:")))
  {
    hypotheses = self->_hypotheses;
    if ((unint64_t)hypotheses | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](hypotheses, "isEqual:");
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_requestId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_hypotheses;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addHypotheses:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_requestId) {
    objc_msgSend(v8, "setRequestId:");
  }
  if ([(SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)self hypothesesCount])
  {
    [v8 clearHypotheses];
    unint64_t v4 = [(SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)self hypothesesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)self hypothesesAtIndex:i];
        [v8 addHypotheses:v7];
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_hypotheses;
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
  return SIRINLUINTERNALUAAP_PARSERUaaPParserResponseReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  requestId = self->_requestId;
  if (requestId)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)requestId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_id"];
  }
  if ([(NSMutableArray *)self->_hypotheses count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_hypotheses, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_hypotheses;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"hypotheses"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALUAAP_PARSERUaaPParserResponse;
  id v4 = [(SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)hypothesesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_hypotheses objectAtIndex:a3];
}

- (unint64_t)hypothesesCount
{
  return [(NSMutableArray *)self->_hypotheses count];
}

- (void)addHypotheses:(id)a3
{
  id v4 = a3;
  hypotheses = self->_hypotheses;
  id v8 = v4;
  if (!hypotheses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_hypotheses;
    self->_hypotheses = v6;

    id v4 = v8;
    hypotheses = self->_hypotheses;
  }
  [(NSMutableArray *)hypotheses addObject:v4];
}

- (void)clearHypotheses
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

+ (Class)hypothesesType
{
  return (Class)objc_opt_class();
}

@end