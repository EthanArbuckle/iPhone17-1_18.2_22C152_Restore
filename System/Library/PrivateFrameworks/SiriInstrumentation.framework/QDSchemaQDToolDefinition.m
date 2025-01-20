@interface QDSchemaQDToolDefinition
- (BOOL)hasDescription;
- (BOOL)hasOutput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)parameters;
- (NSData)jsonData;
- (NSString)description;
- (QDSchemaQDToolDefinition)initWithDictionary:(id)a3;
- (QDSchemaQDToolDefinition)initWithJSON:(id)a3;
- (QDSchemaQDToolOutputDefinition)output;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)deleteDescription;
- (void)deleteOutput;
- (void)setDescription:(id)a3;
- (void)setHasDescription:(BOOL)a3;
- (void)setHasOutput:(BOOL)a3;
- (void)setOutput:(id)a3;
- (void)setParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDToolDefinition

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)QDSchemaQDToolDefinition;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDToolDefinition *)self parameters];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(QDSchemaQDToolDefinition *)self setParameters:v7];

  v8 = [(QDSchemaQDToolDefinition *)self output];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(QDSchemaQDToolDefinition *)self deleteOutput];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setHasDescription:(BOOL)a3
{
  self->_hasDescription = a3;
}

- (void)setHasOutput:(BOOL)a3
{
  self->_hasOutput = a3;
}

- (void)setDescription:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (void)setOutput:(id)a3
{
}

- (QDSchemaQDToolOutputDefinition)output
{
  return self->_output;
}

- (void)setParameters:(id)a3
{
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (QDSchemaQDToolDefinition)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)QDSchemaQDToolDefinition;
  v5 = [(QDSchemaQDToolDefinition *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [QDSchemaQDToolParameterDefinition alloc];
              v14 = -[QDSchemaQDToolParameterDefinition initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
              [(QDSchemaQDToolDefinition *)v5 addParameters:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"output", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[QDSchemaQDToolOutputDefinition alloc] initWithDictionary:v15];
      [(QDSchemaQDToolDefinition *)v5 setOutput:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(QDSchemaQDToolDefinition *)v5 setDescription:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (QDSchemaQDToolDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDToolDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDToolDefinition *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_description)
  {
    id v4 = [(QDSchemaQDToolDefinition *)self description];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"description"];
  }
  if (self->_output)
  {
    v6 = [(QDSchemaQDToolDefinition *)self output];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"output"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"output"];
    }
  }
  if ([(NSArray *)self->_parameters count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_parameters;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"parameters"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_parameters hash];
  unint64_t v4 = [(QDSchemaQDToolOutputDefinition *)self->_output hash] ^ v3;
  return v4 ^ [(NSString *)self->_description hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(QDSchemaQDToolDefinition *)self parameters];
  v6 = [v4 parameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(QDSchemaQDToolDefinition *)self parameters];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(QDSchemaQDToolDefinition *)self parameters];
    uint64_t v10 = [v4 parameters];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDToolDefinition *)self output];
  v6 = [v4 output];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(QDSchemaQDToolDefinition *)self output];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(QDSchemaQDToolDefinition *)self output];
    v15 = [v4 output];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDToolDefinition *)self description];
  v6 = [v4 description];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(QDSchemaQDToolDefinition *)self description];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(QDSchemaQDToolDefinition *)self description];
    long long v20 = [v4 description];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_parameters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(QDSchemaQDToolDefinition *)self output];

  if (v10)
  {
    int v11 = [(QDSchemaQDToolDefinition *)self output];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(QDSchemaQDToolDefinition *)self description];

  if (v12) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDToolDefinitionReadFrom(self, (uint64_t)a3);
}

- (void)deleteDescription
{
}

- (BOOL)hasDescription
{
  return self->_description != 0;
}

- (void)deleteOutput
{
}

- (BOOL)hasOutput
{
  return self->_output != 0;
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameters objectAtIndexedSubscript:a3];
}

- (unint64_t)parametersCount
{
  return [(NSArray *)self->_parameters count];
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSArray *)parameters addObject:v4];
}

- (void)clearParameters
{
}

@end