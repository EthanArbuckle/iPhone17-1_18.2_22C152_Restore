@interface PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported
- (BOOL)hasMultistepGatingExecution;
- (BOOL)hasMultistepSubSearchExecution;
- (BOOL)hasMultiturnExecution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)multistepSubSearchExecutions;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSMultistepGatingExecution)multistepGatingExecution;
- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)multistepSubSearchExecution;
- (PEGASUSSchemaPEGASUSMultiturnExecution)multiturnExecution;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)multistepSubSearchExecutionsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)multistepSubSearchExecutionsCount;
- (void)addMultistepSubSearchExecutions:(id)a3;
- (void)clearMultistepSubSearchExecutions;
- (void)deleteMultistepGatingExecution;
- (void)deleteMultistepSubSearchExecution;
- (void)deleteMultiturnExecution;
- (void)setHasMultistepGatingExecution:(BOOL)a3;
- (void)setHasMultistepSubSearchExecution:(BOOL)a3;
- (void)setHasMultiturnExecution:(BOOL)a3;
- (void)setMultistepGatingExecution:(id)a3;
- (void)setMultistepSubSearchExecution:(id)a3;
- (void)setMultistepSubSearchExecutions:(id)a3;
- (void)setMultiturnExecution:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self deleteMultistepGatingExecution];
  }
  v9 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self deleteMultistepSubSearchExecution];
  }
  v12 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self deleteMultiturnExecution];
  }
  v15 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecutions];
  v16 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v15 underConditions:v4];
  [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self setMultistepSubSearchExecutions:v16];

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
  objc_storeStrong((id *)&self->_multistepSubSearchExecutions, 0);
  objc_storeStrong((id *)&self->_multiturnExecution, 0);
  objc_storeStrong((id *)&self->_multistepSubSearchExecution, 0);
  objc_storeStrong((id *)&self->_multistepGatingExecution, 0);
}

- (void)setHasMultiturnExecution:(BOOL)a3
{
  self->_hasMultiturnExecution = a3;
}

- (void)setHasMultistepSubSearchExecution:(BOOL)a3
{
  self->_hasMultistepSubSearchExecution = a3;
}

- (void)setHasMultistepGatingExecution:(BOOL)a3
{
  self->_hasMultistepGatingExecution = a3;
}

- (void)setMultistepSubSearchExecutions:(id)a3
{
}

- (NSArray)multistepSubSearchExecutions
{
  return self->_multistepSubSearchExecutions;
}

- (void)setMultiturnExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMultiturnExecution)multiturnExecution
{
  return self->_multiturnExecution;
}

- (void)setMultistepSubSearchExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)multistepSubSearchExecution
{
  return self->_multistepSubSearchExecution;
}

- (void)setMultistepGatingExecution:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMultistepGatingExecution)multistepGatingExecution
{
  return self->_multistepGatingExecution;
}

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported;
  v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"multistepGatingExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PEGASUSSchemaPEGASUSMultistepGatingExecution alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)v5 setMultistepGatingExecution:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"multistepSubSearchExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PEGASUSSchemaPEGASUSMultistepSubSearchExecution alloc] initWithDictionary:v8];
      [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)v5 setMultistepSubSearchExecution:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"multiturnExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PEGASUSSchemaPEGASUSMultiturnExecution alloc] initWithDictionary:v10];
      [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)v5 setMultiturnExecution:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"multistepSubSearchExecutions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v10;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[PEGASUSSchemaPEGASUSMultistepSubSearchExecution alloc] initWithDictionary:v18];
              [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)v5 addMultistepSubSearchExecutions:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    v20 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_multistepGatingExecution)
  {
    id v4 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"multistepGatingExecution"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"multistepGatingExecution"];
    }
  }
  if (self->_multistepSubSearchExecution)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"multistepSubSearchExecution"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"multistepSubSearchExecution"];
    }
  }
  if ([(NSArray *)self->_multistepSubSearchExecutions count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v11 = self->_multistepSubSearchExecutions;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"multistepSubSearchExecutions"];
  }
  if (self->_multiturnExecution)
  {
    uint64_t v18 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"multiturnExecution"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"multiturnExecution"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v22);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PEGASUSSchemaPEGASUSMultistepGatingExecution *)self->_multistepGatingExecution hash];
  unint64_t v4 = [(PEGASUSSchemaPEGASUSMultistepSubSearchExecution *)self->_multistepSubSearchExecution hash] ^ v3;
  unint64_t v5 = [(PEGASUSSchemaPEGASUSMultiturnExecution *)self->_multiturnExecution hash];
  return v4 ^ v5 ^ [(NSArray *)self->_multistepSubSearchExecutions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
  v6 = [v4 multistepGatingExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
    v10 = [v4 multistepGatingExecution];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
  v6 = [v4 multistepSubSearchExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
    uint64_t v15 = [v4 multistepSubSearchExecution];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
  v6 = [v4 multiturnExecution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
    v20 = [v4 multiturnExecution];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecutions];
  v6 = [v4 multistepSubSearchExecutions];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecutions];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    long long v23 = (void *)v22;
    long long v24 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecutions];
    long long v25 = [v4 multistepSubSearchExecutions];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];

  if (v5)
  {
    v6 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepGatingExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];

  if (v7)
  {
    int v8 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multistepSubSearchExecution];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];

  if (v9)
  {
    v10 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self multiturnExecution];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_multistepSubSearchExecutions;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReportedReadFrom(self, (uint64_t)a3);
}

- (id)multistepSubSearchExecutionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_multistepSubSearchExecutions objectAtIndexedSubscript:a3];
}

- (unint64_t)multistepSubSearchExecutionsCount
{
  return [(NSArray *)self->_multistepSubSearchExecutions count];
}

- (void)addMultistepSubSearchExecutions:(id)a3
{
  id v4 = a3;
  multistepSubSearchExecutions = self->_multistepSubSearchExecutions;
  id v8 = v4;
  if (!multistepSubSearchExecutions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_multistepSubSearchExecutions;
    self->_multistepSubSearchExecutions = v6;

    id v4 = v8;
    multistepSubSearchExecutions = self->_multistepSubSearchExecutions;
  }
  [(NSArray *)multistepSubSearchExecutions addObject:v4];
}

- (void)clearMultistepSubSearchExecutions
{
}

- (void)deleteMultiturnExecution
{
}

- (BOOL)hasMultiturnExecution
{
  return self->_multiturnExecution != 0;
}

- (void)deleteMultistepSubSearchExecution
{
}

- (BOOL)hasMultistepSubSearchExecution
{
  return self->_multistepSubSearchExecution != 0;
}

- (void)deleteMultistepGatingExecution
{
}

- (BOOL)hasMultistepGatingExecution
{
  return self->_multistepGatingExecution != 0;
}

@end