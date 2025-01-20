@interface SIRINLUINTERNALOVERRIDESOverridesRequest
+ (Class)inputsType;
+ (Class)matchingSpansType;
+ (Class)systemDialogActsType;
- (BOOL)hasTokenChain;
- (BOOL)hasTurnContext;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)inputs;
- (NSMutableArray)matchingSpans;
- (NSMutableArray)systemDialogActs;
- (NSString)utterance;
- (SIRINLUEXTERNALTurnContext)turnContext;
- (SIRINLUINTERNALTokenChain)tokenChain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputsAtIndex:(unint64_t)a3;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (id)systemDialogActsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inputsCount;
- (unint64_t)matchingSpansCount;
- (unint64_t)systemDialogActsCount;
- (void)addInputs:(id)a3;
- (void)addMatchingSpans:(id)a3;
- (void)addSystemDialogActs:(id)a3;
- (void)clearInputs;
- (void)clearMatchingSpans;
- (void)clearSystemDialogActs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInputs:(id)a3;
- (void)setMatchingSpans:(id)a3;
- (void)setSystemDialogActs:(id)a3;
- (void)setTokenChain:(id)a3;
- (void)setTurnContext:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALOVERRIDESOverridesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

- (void)setInputs:(id)a3
{
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setTurnContext:(id)a3
{
}

- (SIRINLUEXTERNALTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setSystemDialogActs:(id)a3
{
}

- (NSMutableArray)systemDialogActs
{
  return self->_systemDialogActs;
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setUtterance:](self, "setUtterance:");
  }
  tokenChain = self->_tokenChain;
  uint64_t v6 = *((void *)v4 + 4);
  if (tokenChain)
  {
    if (v6) {
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setTokenChain:](self, "setTokenChain:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self addMatchingSpans:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self addSystemDialogActs:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  turnContext = self->_turnContext;
  uint64_t v18 = *((void *)v4 + 5);
  if (turnContext)
  {
    if (v18) {
      -[SIRINLUEXTERNALTurnContext mergeFrom:](turnContext, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setTurnContext:](self, "setTurnContext:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = *((id *)v4 + 1);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[SIRINLUINTERNALOVERRIDESOverridesRequest addInputs:](self, "addInputs:", *(void *)(*((void *)&v24 + 1) + 8 * k), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_utterance hash];
  unint64_t v4 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_matchingSpans hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_systemDialogActs hash];
  unint64_t v7 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_inputs hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[4]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[2]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((systemDialogActs = self->_systemDialogActs, !((unint64_t)systemDialogActs | v4[3]))
     || -[NSMutableArray isEqual:](systemDialogActs, "isEqual:"))
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[5]))
     || -[SIRINLUEXTERNALTurnContext isEqual:](turnContext, "isEqual:")))
  {
    inputs = self->_inputs;
    if ((unint64_t)inputs | v4[1]) {
      char v11 = -[NSMutableArray isEqual:](inputs, "isEqual:");
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_utterance copyWithZone:a3];
  unint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(SIRINLUINTERNALTokenChain *)self->_tokenChain copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = self->_matchingSpans;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addMatchingSpans:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v12);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = self->_systemDialogActs;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addSystemDialogActs:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v18);
  }

  id v22 = [(SIRINLUEXTERNALTurnContext *)self->_turnContext copyWithZone:a3];
  v23 = (void *)v5[5];
  v5[5] = v22;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v24 = self->_inputs;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (void)v31);
        [v5 addInputs:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v26);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_utterance) {
    objc_msgSend(v16, "setUtterance:");
  }
  if (self->_tokenChain) {
    objc_msgSend(v16, "setTokenChain:");
  }
  if ([(SIRINLUINTERNALOVERRIDESOverridesRequest *)self matchingSpansCount])
  {
    [v16 clearMatchingSpans];
    unint64_t v4 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self matchingSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self matchingSpansAtIndex:i];
        [v16 addMatchingSpans:v7];
      }
    }
  }
  if ([(SIRINLUINTERNALOVERRIDESOverridesRequest *)self systemDialogActsCount])
  {
    [v16 clearSystemDialogActs];
    unint64_t v8 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self systemDialogActsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self systemDialogActsAtIndex:j];
        [v16 addSystemDialogActs:v11];
      }
    }
  }
  if (self->_turnContext) {
    objc_msgSend(v16, "setTurnContext:");
  }
  if ([(SIRINLUINTERNALOVERRIDESOverridesRequest *)self inputsCount])
  {
    [v16 clearInputs];
    unint64_t v12 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self inputsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self inputsAtIndex:k];
        [v16 addInputs:v15];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_utterance) {
    PBDataWriterWriteStringField();
  }
  if (self->_tokenChain) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = self->_matchingSpans;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_systemDialogActs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (self->_turnContext) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_inputs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOVERRIDESOverridesRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
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
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v9 = self->_matchingSpans;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"matching_spans"];
  }
  if ([(NSMutableArray *)self->_systemDialogActs count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_systemDialogActs, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v16 = self->_systemDialogActs;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"system_dialog_acts"];
  }
  turnContext = self->_turnContext;
  if (turnContext)
  {
    long long v23 = [(SIRINLUEXTERNALTurnContext *)turnContext dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"turn_context"];
  }
  if ([(NSMutableArray *)self->_inputs count])
  {
    long long v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_inputs, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v25 = self->_inputs;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (void)v32);
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v27);
    }

    [v4 setObject:v24 forKey:@"inputs"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALOVERRIDESOverridesRequest;
  id v4 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALOVERRIDESOverridesRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)inputsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inputs objectAtIndex:a3];
}

- (unint64_t)inputsCount
{
  return [(NSMutableArray *)self->_inputs count];
}

- (void)addInputs:(id)a3
{
  id v4 = a3;
  inputs = self->_inputs;
  id v8 = v4;
  if (!inputs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_inputs;
    self->_inputs = v6;

    id v4 = v8;
    inputs = self->_inputs;
  }
  [(NSMutableArray *)inputs addObject:v4];
}

- (void)clearInputs
{
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (id)systemDialogActsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_systemDialogActs objectAtIndex:a3];
}

- (unint64_t)systemDialogActsCount
{
  return [(NSMutableArray *)self->_systemDialogActs count];
}

- (void)addSystemDialogActs:(id)a3
{
  id v4 = a3;
  systemDialogActs = self->_systemDialogActs;
  id v8 = v4;
  if (!systemDialogActs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_systemDialogActs;
    self->_systemDialogActs = v6;

    id v4 = v8;
    systemDialogActs = self->_systemDialogActs;
  }
  [(NSMutableArray *)systemDialogActs addObject:v4];
}

- (void)clearSystemDialogActs
{
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

+ (Class)inputsType
{
  return (Class)objc_opt_class();
}

+ (Class)systemDialogActsType
{
  return (Class)objc_opt_class();
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end