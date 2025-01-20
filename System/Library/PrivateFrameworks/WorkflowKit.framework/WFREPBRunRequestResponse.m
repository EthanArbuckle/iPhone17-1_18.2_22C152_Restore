@interface WFREPBRunRequestResponse
+ (Class)outputDataType;
+ (Class)variablesDataType;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)outputDatas;
- (NSMutableArray)variablesDatas;
- (NSString)runRequestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDataAtIndex:(unint64_t)a3;
- (id)variablesDataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)outputDatasCount;
- (unint64_t)variablesDatasCount;
- (void)addOutputData:(id)a3;
- (void)addVariablesData:(id)a3;
- (void)clearOutputDatas;
- (void)clearVariablesDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setOutputDatas:(id)a3;
- (void)setRunRequestIdentifier:(id)a3;
- (void)setVariablesDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBRunRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variablesDatas, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDatas, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

- (void)setErrorData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setOutputDatas:(id)a3
{
}

- (NSMutableArray)outputDatas
{
  return self->_outputDatas;
}

- (void)setVariablesDatas:(id)a3
{
}

- (NSMutableArray)variablesDatas
{
  return self->_variablesDatas;
}

- (void)setRunRequestIdentifier:(id)a3
{
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[WFREPBRunRequestResponse setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WFREPBRunRequestResponse *)self addVariablesData:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 2);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[WFREPBRunRequestResponse addOutputData:](self, "addOutputData:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 1)) {
    -[WFREPBRunRequestResponse setErrorData:](self, "setErrorData:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_runRequestIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_variablesDatas hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_outputDatas hash];
  return v4 ^ v5 ^ [(NSData *)self->_errorData hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((runRequestIdentifier = self->_runRequestIdentifier, !((unint64_t)runRequestIdentifier | v4[3]))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:"))
    && ((variablesDatas = self->_variablesDatas, !((unint64_t)variablesDatas | v4[4]))
     || -[NSMutableArray isEqual:](variablesDatas, "isEqual:"))
    && ((outputDatas = self->_outputDatas, !((unint64_t)outputDatas | v4[2]))
     || -[NSMutableArray isEqual:](outputDatas, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v9 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_runRequestIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = self->_variablesDatas;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addVariablesData:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = self->_outputDatas;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (void)v23);
        [v5 addOutputData:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSData *)self->_errorData copyWithZone:a3];
  long long v21 = (void *)v5[1];
  v5[1] = v20;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  [v12 setRunRequestIdentifier:self->_runRequestIdentifier];
  if ([(WFREPBRunRequestResponse *)self variablesDatasCount])
  {
    [v12 clearVariablesDatas];
    unint64_t v4 = [(WFREPBRunRequestResponse *)self variablesDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WFREPBRunRequestResponse *)self variablesDataAtIndex:i];
        [v12 addVariablesData:v7];
      }
    }
  }
  if ([(WFREPBRunRequestResponse *)self outputDatasCount])
  {
    [v12 clearOutputDatas];
    unint64_t v8 = [(WFREPBRunRequestResponse *)self outputDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WFREPBRunRequestResponse *)self outputDataAtIndex:j];
        [v12 addOutputData:v11];
      }
    }
  }
  if (self->_errorData) {
    objc_msgSend(v12, "setErrorData:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_runRequestIdentifier) {
    __assert_rtn("-[WFREPBRunRequestResponse writeTo:]", "WFREPBRunRequestResponse.m", 163, "nil != self->_runRequestIdentifier");
  }
  unint64_t v5 = v4;
  PBDataWriterWriteStringField();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = self->_variablesDatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = self->_outputDatas;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestResponseReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier) {
    [v3 setObject:runRequestIdentifier forKey:@"runRequestIdentifier"];
  }
  variablesDatas = self->_variablesDatas;
  if (variablesDatas) {
    [v4 setObject:variablesDatas forKey:@"variablesData"];
  }
  outputDatas = self->_outputDatas;
  if (outputDatas) {
    [v4 setObject:outputDatas forKey:@"outputData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequestResponse;
  id v4 = [(WFREPBRunRequestResponse *)&v8 description];
  unint64_t v5 = [(WFREPBRunRequestResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)outputDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDatas objectAtIndex:a3];
}

- (unint64_t)outputDatasCount
{
  return [(NSMutableArray *)self->_outputDatas count];
}

- (void)addOutputData:(id)a3
{
  id v4 = a3;
  outputDatas = self->_outputDatas;
  id v8 = v4;
  if (!outputDatas)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_outputDatas;
    self->_outputDatas = v6;

    id v4 = v8;
    outputDatas = self->_outputDatas;
  }
  [(NSMutableArray *)outputDatas addObject:v4];
}

- (void)clearOutputDatas
{
}

- (id)variablesDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_variablesDatas objectAtIndex:a3];
}

- (unint64_t)variablesDatasCount
{
  return [(NSMutableArray *)self->_variablesDatas count];
}

- (void)addVariablesData:(id)a3
{
  id v4 = a3;
  variablesDatas = self->_variablesDatas;
  id v8 = v4;
  if (!variablesDatas)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_variablesDatas;
    self->_variablesDatas = v6;

    id v4 = v8;
    variablesDatas = self->_variablesDatas;
  }
  [(NSMutableArray *)variablesDatas addObject:v4];
}

- (void)clearVariablesDatas
{
}

+ (Class)outputDataType
{
  return (Class)objc_opt_class();
}

+ (Class)variablesDataType
{
  return (Class)objc_opt_class();
}

@end