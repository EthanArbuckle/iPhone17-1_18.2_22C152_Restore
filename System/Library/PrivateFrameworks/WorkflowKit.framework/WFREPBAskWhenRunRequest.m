@interface WFREPBAskWhenRunRequest
+ (Class)parameterKeysAndStatesType;
+ (Class)parameterKeysType;
+ (Class)possibleStatesType;
- (BOOL)hasActionSerializedParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)actionSerializedParameters;
- (NSMutableArray)parameterKeys;
- (NSMutableArray)parameterKeysAndStates;
- (NSMutableArray)possibleStates;
- (NSString)actionIdentifier;
- (NSString)associatedRunRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parameterKeysAndStatesAtIndex:(unint64_t)a3;
- (id)parameterKeysAtIndex:(unint64_t)a3;
- (id)possibleStatesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)parameterKeysAndStatesCount;
- (unint64_t)parameterKeysCount;
- (unint64_t)possibleStatesCount;
- (void)addParameterKeys:(id)a3;
- (void)addParameterKeysAndStates:(id)a3;
- (void)addPossibleStates:(id)a3;
- (void)clearParameterKeys;
- (void)clearParameterKeysAndStates;
- (void)clearPossibleStates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setActionSerializedParameters:(id)a3;
- (void)setAssociatedRunRequestIdentifier:(id)a3;
- (void)setParameterKeys:(id)a3;
- (void)setParameterKeysAndStates:(id)a3;
- (void)setPossibleStates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAskWhenRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStates, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSerializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setPossibleStates:(id)a3
{
}

- (NSMutableArray)possibleStates
{
  return self->_possibleStates;
}

- (void)setActionSerializedParameters:(id)a3
{
}

- (NSData)actionSerializedParameters
{
  return self->_actionSerializedParameters;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setParameterKeysAndStates:(id)a3
{
}

- (NSMutableArray)parameterKeysAndStates
{
  return self->_parameterKeysAndStates;
}

- (void)setParameterKeys:(id)a3
{
}

- (NSMutableArray)parameterKeys
{
  return self->_parameterKeys;
}

- (void)setAssociatedRunRequestIdentifier:(id)a3
{
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[WFREPBAskWhenRunRequest setAssociatedRunRequestIdentifier:](self, "setAssociatedRunRequestIdentifier:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WFREPBAskWhenRunRequest *)self addParameterKeys:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WFREPBAskWhenRunRequest *)self addParameterKeysAndStates:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 1)) {
    -[WFREPBAskWhenRunRequest setActionIdentifier:](self, "setActionIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[WFREPBAskWhenRunRequest setActionSerializedParameters:](self, "setActionSerializedParameters:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[WFREPBAskWhenRunRequest addPossibleStates:](self, "addPossibleStates:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_associatedRunRequestIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_parameterKeys hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_parameterKeysAndStates hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_actionIdentifier hash];
  uint64_t v7 = [(NSData *)self->_actionSerializedParameters hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_possibleStates hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier,
         !((unint64_t)associatedRunRequestIdentifier | v4[3]))
     || -[NSString isEqual:](associatedRunRequestIdentifier, "isEqual:"))
    && ((parameterKeys = self->_parameterKeys, !((unint64_t)parameterKeys | v4[4]))
     || -[NSMutableArray isEqual:](parameterKeys, "isEqual:"))
    && ((parameterKeysAndStates = self->_parameterKeysAndStates, !((unint64_t)parameterKeysAndStates | v4[5]))
     || -[NSMutableArray isEqual:](parameterKeysAndStates, "isEqual:"))
    && ((actionIdentifier = self->_actionIdentifier, !((unint64_t)actionIdentifier | v4[1]))
     || -[NSString isEqual:](actionIdentifier, "isEqual:"))
    && ((actionSerializedParameters = self->_actionSerializedParameters,
         !((unint64_t)actionSerializedParameters | v4[2]))
     || -[NSData isEqual:](actionSerializedParameters, "isEqual:")))
  {
    possibleStates = self->_possibleStates;
    if ((unint64_t)possibleStates | v4[6]) {
      char v11 = -[NSMutableArray isEqual:](possibleStates, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_associatedRunRequestIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = self->_parameterKeys;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addParameterKeys:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v10);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v14 = self->_parameterKeysAndStates;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addParameterKeysAndStates:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  long long v21 = (void *)v5[1];
  v5[1] = v20;

  uint64_t v22 = [(NSData *)self->_actionSerializedParameters copyWithZone:a3];
  long long v23 = (void *)v5[2];
  v5[2] = v22;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v24 = self->_possibleStates;
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
        [v5 addPossibleStates:v29];

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
  [v16 setAssociatedRunRequestIdentifier:self->_associatedRunRequestIdentifier];
  if ([(WFREPBAskWhenRunRequest *)self parameterKeysCount])
  {
    [v16 clearParameterKeys];
    unint64_t v4 = [(WFREPBAskWhenRunRequest *)self parameterKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WFREPBAskWhenRunRequest *)self parameterKeysAtIndex:i];
        [v16 addParameterKeys:v7];
      }
    }
  }
  if ([(WFREPBAskWhenRunRequest *)self parameterKeysAndStatesCount])
  {
    [v16 clearParameterKeysAndStates];
    unint64_t v8 = [(WFREPBAskWhenRunRequest *)self parameterKeysAndStatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WFREPBAskWhenRunRequest *)self parameterKeysAndStatesAtIndex:j];
        [v16 addParameterKeysAndStates:v11];
      }
    }
  }
  [v16 setActionIdentifier:self->_actionIdentifier];
  if (self->_actionSerializedParameters) {
    objc_msgSend(v16, "setActionSerializedParameters:");
  }
  if ([(WFREPBAskWhenRunRequest *)self possibleStatesCount])
  {
    [v16 clearPossibleStates];
    unint64_t v12 = [(WFREPBAskWhenRunRequest *)self possibleStatesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WFREPBAskWhenRunRequest *)self possibleStatesAtIndex:k];
        [v16 addPossibleStates:v15];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_associatedRunRequestIdentifier) {
    __assert_rtn("-[WFREPBAskWhenRunRequest writeTo:]", "WFREPBAskWhenRunRequest.m", 243, "nil != self->_associatedRunRequestIdentifier");
  }
  unint64_t v5 = v4;
  PBDataWriterWriteStringField();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = self->_parameterKeys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = self->_parameterKeysAndStates;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  if (!self->_actionIdentifier) {
    __assert_rtn("-[WFREPBAskWhenRunRequest writeTo:]", "WFREPBAskWhenRunRequest.m", 262, "nil != self->_actionIdentifier");
  }
  PBDataWriterWriteStringField();
  if (self->_actionSerializedParameters) {
    PBDataWriterWriteDataField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = self->_possibleStates;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAskWhenRunRequestReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  if (associatedRunRequestIdentifier) {
    [v3 setObject:associatedRunRequestIdentifier forKey:@"associatedRunRequestIdentifier"];
  }
  parameterKeys = self->_parameterKeys;
  if (parameterKeys) {
    [v4 setObject:parameterKeys forKey:@"parameterKeys"];
  }
  if ([(NSMutableArray *)self->_parameterKeysAndStates count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_parameterKeysAndStates, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = self->_parameterKeysAndStates;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"parameterKeysAndStates"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  actionSerializedParameters = self->_actionSerializedParameters;
  if (actionSerializedParameters) {
    [v4 setObject:actionSerializedParameters forKey:@"actionSerializedParameters"];
  }
  if ([(NSMutableArray *)self->_possibleStates count])
  {
    id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_possibleStates, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = self->_possibleStates;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"possibleStates"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAskWhenRunRequest;
  id v4 = [(WFREPBAskWhenRunRequest *)&v8 description];
  unint64_t v5 = [(WFREPBAskWhenRunRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)possibleStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_possibleStates objectAtIndex:a3];
}

- (unint64_t)possibleStatesCount
{
  return [(NSMutableArray *)self->_possibleStates count];
}

- (void)addPossibleStates:(id)a3
{
  id v4 = a3;
  possibleStates = self->_possibleStates;
  id v8 = v4;
  if (!possibleStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_possibleStates;
    self->_possibleStates = v6;

    id v4 = v8;
    possibleStates = self->_possibleStates;
  }
  [(NSMutableArray *)possibleStates addObject:v4];
}

- (void)clearPossibleStates
{
}

- (BOOL)hasActionSerializedParameters
{
  return self->_actionSerializedParameters != 0;
}

- (id)parameterKeysAndStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parameterKeysAndStates objectAtIndex:a3];
}

- (unint64_t)parameterKeysAndStatesCount
{
  return [(NSMutableArray *)self->_parameterKeysAndStates count];
}

- (void)addParameterKeysAndStates:(id)a3
{
  id v4 = a3;
  parameterKeysAndStates = self->_parameterKeysAndStates;
  id v8 = v4;
  if (!parameterKeysAndStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_parameterKeysAndStates;
    self->_parameterKeysAndStates = v6;

    id v4 = v8;
    parameterKeysAndStates = self->_parameterKeysAndStates;
  }
  [(NSMutableArray *)parameterKeysAndStates addObject:v4];
}

- (void)clearParameterKeysAndStates
{
}

- (id)parameterKeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parameterKeys objectAtIndex:a3];
}

- (unint64_t)parameterKeysCount
{
  return [(NSMutableArray *)self->_parameterKeys count];
}

- (void)addParameterKeys:(id)a3
{
  id v4 = a3;
  parameterKeys = self->_parameterKeys;
  id v8 = v4;
  if (!parameterKeys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_parameterKeys;
    self->_parameterKeys = v6;

    id v4 = v8;
    parameterKeys = self->_parameterKeys;
  }
  [(NSMutableArray *)parameterKeys addObject:v4];
}

- (void)clearParameterKeys
{
}

+ (Class)possibleStatesType
{
  return (Class)objc_opt_class();
}

+ (Class)parameterKeysAndStatesType
{
  return (Class)objc_opt_class();
}

+ (Class)parameterKeysType
{
  return (Class)objc_opt_class();
}

@end