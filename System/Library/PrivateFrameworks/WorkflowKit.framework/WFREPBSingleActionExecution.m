@interface WFREPBSingleActionExecution
+ (Class)inputType;
+ (Class)processedParametersType;
+ (Class)variablesType;
- (BOOL)hasSerializedParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedParameters;
- (NSMutableArray)inputs;
- (NSMutableArray)processedParameters;
- (NSMutableArray)variables;
- (NSString)actionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputAtIndex:(unint64_t)a3;
- (id)processedParametersAtIndex:(unint64_t)a3;
- (id)variablesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inputsCount;
- (unint64_t)processedParametersCount;
- (unint64_t)variablesCount;
- (void)addInput:(id)a3;
- (void)addProcessedParameters:(id)a3;
- (void)addVariables:(id)a3;
- (void)clearInputs;
- (void)clearProcessedParameters;
- (void)clearVariables;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setInputs:(id)a3;
- (void)setProcessedParameters:(id)a3;
- (void)setSerializedParameters:(id)a3;
- (void)setVariables:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBSingleActionExecution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setInputs:(id)a3
{
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setSerializedParameters:(id)a3
{
}

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setProcessedParameters:(id)a3
{
}

- (NSMutableArray)processedParameters
{
  return self->_processedParameters;
}

- (void)setVariables:(id)a3
{
}

- (NSMutableArray)variables
{
  return self->_variables;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[WFREPBSingleActionExecution setActionIdentifier:](self, "setActionIdentifier:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 5);
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
        [(WFREPBSingleActionExecution *)self addVariables:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 3);
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
        [(WFREPBSingleActionExecution *)self addProcessedParameters:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 4)) {
    -[WFREPBSingleActionExecution setSerializedParameters:](self, "setSerializedParameters:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 2);
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
        -[WFREPBSingleActionExecution addInput:](self, "addInput:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_actionIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_variables hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_processedParameters hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_serializedParameters hash];
  return v6 ^ [(NSMutableArray *)self->_inputs hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((actionIdentifier = self->_actionIdentifier, !((unint64_t)actionIdentifier | v4[1]))
     || -[NSString isEqual:](actionIdentifier, "isEqual:"))
    && ((variables = self->_variables, !((unint64_t)variables | v4[5]))
     || -[NSMutableArray isEqual:](variables, "isEqual:"))
    && ((processedParameters = self->_processedParameters, !((unint64_t)processedParameters | v4[3]))
     || -[NSMutableArray isEqual:](processedParameters, "isEqual:"))
    && ((serializedParameters = self->_serializedParameters, !((unint64_t)serializedParameters | v4[4]))
     || -[NSData isEqual:](serializedParameters, "isEqual:")))
  {
    inputs = self->_inputs;
    if ((unint64_t)inputs | v4[2]) {
      char v10 = -[NSMutableArray isEqual:](inputs, "isEqual:");
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
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = self->_variables;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addVariables:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v10);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v14 = self->_processedParameters;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addProcessedParameters:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSData *)self->_serializedParameters copyWithZone:a3];
  long long v21 = (void *)v5[4];
  v5[4] = v20;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v22 = self->_inputs;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v26), "copyWithZone:", a3, (void)v29);
        [v5 addInput:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  [v16 setActionIdentifier:self->_actionIdentifier];
  if ([(WFREPBSingleActionExecution *)self variablesCount])
  {
    [v16 clearVariables];
    unint64_t v4 = [(WFREPBSingleActionExecution *)self variablesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WFREPBSingleActionExecution *)self variablesAtIndex:i];
        [v16 addVariables:v7];
      }
    }
  }
  if ([(WFREPBSingleActionExecution *)self processedParametersCount])
  {
    [v16 clearProcessedParameters];
    unint64_t v8 = [(WFREPBSingleActionExecution *)self processedParametersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WFREPBSingleActionExecution *)self processedParametersAtIndex:j];
        [v16 addProcessedParameters:v11];
      }
    }
  }
  if (self->_serializedParameters) {
    objc_msgSend(v16, "setSerializedParameters:");
  }
  if ([(WFREPBSingleActionExecution *)self inputsCount])
  {
    [v16 clearInputs];
    unint64_t v12 = [(WFREPBSingleActionExecution *)self inputsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WFREPBSingleActionExecution *)self inputAtIndex:k];
        [v16 addInput:v15];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_actionIdentifier) {
    __assert_rtn("-[WFREPBSingleActionExecution writeTo:]", "WFREPBSingleActionExecution.m", 247, "nil != self->_actionIdentifier");
  }
  unint64_t v5 = v4;
  PBDataWriterWriteStringField();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = self->_variables;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v11 = self->_processedParameters;
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

  if (self->_serializedParameters) {
    PBDataWriterWriteDataField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = self->_inputs;
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
  return WFREPBSingleActionExecutionReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v3 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  if ([(NSMutableArray *)self->_variables count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_variables, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_variables;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"variables"];
  }
  if ([(NSMutableArray *)self->_processedParameters count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_processedParameters, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v14 = self->_processedParameters;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"processedParameters"];
  }
  serializedParameters = self->_serializedParameters;
  if (serializedParameters) {
    [v4 setObject:serializedParameters forKey:@"serializedParameters"];
  }
  if ([(NSMutableArray *)self->_inputs count])
  {
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_inputs, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v22 = self->_inputs;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (void)v29);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"input"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBSingleActionExecution;
  id v4 = [(WFREPBSingleActionExecution *)&v8 description];
  unint64_t v5 = [(WFREPBSingleActionExecution *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)inputAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inputs objectAtIndex:a3];
}

- (unint64_t)inputsCount
{
  return [(NSMutableArray *)self->_inputs count];
}

- (void)addInput:(id)a3
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

- (BOOL)hasSerializedParameters
{
  return self->_serializedParameters != 0;
}

- (id)processedParametersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_processedParameters objectAtIndex:a3];
}

- (unint64_t)processedParametersCount
{
  return [(NSMutableArray *)self->_processedParameters count];
}

- (void)addProcessedParameters:(id)a3
{
  id v4 = a3;
  processedParameters = self->_processedParameters;
  id v8 = v4;
  if (!processedParameters)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_processedParameters;
    self->_processedParameters = v6;

    id v4 = v8;
    processedParameters = self->_processedParameters;
  }
  [(NSMutableArray *)processedParameters addObject:v4];
}

- (void)clearProcessedParameters
{
}

- (id)variablesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_variables objectAtIndex:a3];
}

- (unint64_t)variablesCount
{
  return [(NSMutableArray *)self->_variables count];
}

- (void)addVariables:(id)a3
{
  id v4 = a3;
  variables = self->_variables;
  id v8 = v4;
  if (!variables)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_variables;
    self->_variables = v6;

    id v4 = v8;
    variables = self->_variables;
  }
  [(NSMutableArray *)variables addObject:v4];
}

- (void)clearVariables
{
}

+ (Class)inputType
{
  return (Class)objc_opt_class();
}

+ (Class)processedParametersType
{
  return (Class)objc_opt_class();
}

+ (Class)variablesType
{
  return (Class)objc_opt_class();
}

@end