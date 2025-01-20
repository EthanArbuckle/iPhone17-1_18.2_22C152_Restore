@interface SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing
+ (Class)matchingSpansType;
- (BOOL)hasTokenChain;
- (BOOL)hasTurnInput;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)matchingSpans;
- (NSString)utterance;
- (SIRINLUEXTERNALTurnInput)turnInput;
- (SIRINLUINTERNALTokenChain)tokenChain;
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
- (void)setMatchingSpans:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)setTurnInput:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
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

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setUtterance:](self, "setUtterance:");
  }
  tokenChain = self->_tokenChain;
  uint64_t v6 = *((void *)v4 + 2);
  if (tokenChain)
  {
    if (v6) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setTokenChain:](self, "setTokenChain:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing addMatchingSpans:](self, "addMatchingSpans:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  turnInput = self->_turnInput;
  uint64_t v13 = *((void *)v4 + 3);
  if (turnInput)
  {
    if (v13) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setTurnInput:](self, "setTurnInput:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_utterance hash];
  unint64_t v4 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_matchingSpans hash];
  return v4 ^ v5 ^ [(SIRINLUEXTERNALTurnInput *)self->_turnInput hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[4]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[2]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[1]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:")))
  {
    turnInput = self->_turnInput;
    if ((unint64_t)turnInput | v4[3]) {
      char v9 = -[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_utterance copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = self->_matchingSpans;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        [v5 addMatchingSpans:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = [(SIRINLUEXTERNALTurnInput *)self->_turnInput copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_utterance) {
    objc_msgSend(v8, "setUtterance:");
  }
  if (self->_tokenChain) {
    objc_msgSend(v8, "setTokenChain:");
  }
  if ([(SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing *)self matchingSpansCount])
  {
    [v8 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing *)self matchingSpansAtIndex:i];
        [v8 addMatchingSpans:v7];
      }
    }
  }
  if (self->_turnInput) {
    objc_msgSend(v8, "setTurnInput:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  if (self->_tokenChain) {
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
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  utterance = self->_utterance;
  if (utterance) {
    [v3 setObject:utterance forKey:@"utterance"];
  }
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    uint64_t v7 = [(SIRINLUINTERNALTokenChain *)tokenChain dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"token_chain"];
  }
  if ([(NSMutableArray *)self->_matchingSpans count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = self->_matchingSpans;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"matching_spans"];
  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    id v16 = [(SIRINLUEXTERNALTurnInput *)turnInput dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"turn_input"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing;
  id v4 = [(SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end