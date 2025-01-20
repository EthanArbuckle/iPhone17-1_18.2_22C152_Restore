@interface TTSSchemaTTSSynthesisFailed
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)errorCodes;
- (NSData)jsonData;
- (TTSSchemaTTSSynthesisFailed)initWithDictionary:(id)a3;
- (TTSSchemaTTSSynthesisFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCodesAtIndex:(unint64_t)a3;
- (unint64_t)errorCodesCount;
- (unint64_t)hash;
- (void)addErrorCodes:(int)a3;
- (void)clearErrorCodes;
- (void)setErrorCodes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSSynthesisFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setErrorCodes:(id)a3
{
}

- (NSArray)errorCodes
{
  return self->_errorCodes;
}

- (TTSSchemaTTSSynthesisFailed)initWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TTSSchemaTTSSynthesisFailed;
  v5 = [(TTSSchemaTTSSynthesisFailed *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorCodes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[TTSSchemaTTSSynthesisFailed addErrorCodes:](v5, "addErrorCodes:", objc_msgSend(v12, "intValue", (void)v15));
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v9);
      }
    }
    v13 = v5;
  }
  return v5;
}

- (TTSSchemaTTSSynthesisFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSSynthesisFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSSynthesisFailed *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_errorCodes count])
  {
    id v4 = [(TTSSchemaTTSSynthesisFailed *)self errorCodes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorCodes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_errorCodes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(TTSSchemaTTSSynthesisFailed *)self errorCodes];
    v6 = [v4 errorCodes];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(TTSSchemaTTSSynthesisFailed *)self errorCodes];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(TTSSchemaTTSSynthesisFailed *)self errorCodes];
      uint64_t v11 = [v4 errorCodes];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_errorCodes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "intValue", (void)v10);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSSynthesisFailedReadFrom(self, (uint64_t)a3);
}

- (int)errorCodesAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_errorCodes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)errorCodesCount
{
  return [(NSArray *)self->_errorCodes count];
}

- (void)addErrorCodes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  errorCodes = self->_errorCodes;
  if (!errorCodes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_errorCodes;
    self->_errorCodes = v6;

    errorCodes = self->_errorCodes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)errorCodes addObject:v8];
}

- (void)clearErrorCodes
{
}

@end