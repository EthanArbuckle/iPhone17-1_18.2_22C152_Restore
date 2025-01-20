@interface PFARepackagingExecution
- (BOOL)hasClockIdentifier;
- (BOOL)hasEnvelopeStatistics;
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAClockEnvelopeStatistics)envelopeStatistics;
- (PFARepackagingExecution)initWithDictionary:(id)a3;
- (PFARepackagingExecution)initWithJSON:(id)a3;
- (PFARepackagingExecutionResult)result;
- (SISchemaUUID)clockIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteClockIdentifier;
- (void)deleteEnvelopeStatistics;
- (void)deleteResult;
- (void)setClockIdentifier:(id)a3;
- (void)setEnvelopeStatistics:(id)a3;
- (void)setHasClockIdentifier:(BOOL)a3;
- (void)setHasEnvelopeStatistics:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFARepackagingExecution

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PFARepackagingExecution;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PFARepackagingExecution *)self clockIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PFARepackagingExecution *)self deleteClockIdentifier];
  }
  v9 = [(PFARepackagingExecution *)self envelopeStatistics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PFARepackagingExecution *)self deleteEnvelopeStatistics];
  }
  v12 = [(PFARepackagingExecution *)self result];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PFARepackagingExecution *)self deleteResult];
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
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_envelopeStatistics, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

- (void)setHasResult:(BOOL)a3
{
  self->_hasResult = a3;
}

- (void)setHasEnvelopeStatistics:(BOOL)a3
{
  self->_hasEnvelopeStatistics = a3;
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  self->_hasClockIdentifier = a3;
}

- (void)setResult:(id)a3
{
}

- (PFARepackagingExecutionResult)result
{
  return self->_result;
}

- (void)setEnvelopeStatistics:(id)a3
{
}

- (PFAClockEnvelopeStatistics)envelopeStatistics
{
  return self->_envelopeStatistics;
}

- (void)setClockIdentifier:(id)a3
{
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (PFARepackagingExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PFARepackagingExecution;
  v5 = [(PFARepackagingExecution *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clockIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PFARepackagingExecution *)v5 setClockIdentifier:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"envelopeStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PFAClockEnvelopeStatistics alloc] initWithDictionary:v8];
      [(PFARepackagingExecution *)v5 setEnvelopeStatistics:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PFARepackagingExecutionResult alloc] initWithDictionary:v10];
      [(PFARepackagingExecution *)v5 setResult:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PFARepackagingExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFARepackagingExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFARepackagingExecution *)self dictionaryRepresentation];
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
  if (self->_clockIdentifier)
  {
    id v4 = [(PFARepackagingExecution *)self clockIdentifier];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clockIdentifier"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clockIdentifier"];
    }
  }
  if (self->_envelopeStatistics)
  {
    uint64_t v7 = [(PFARepackagingExecution *)self envelopeStatistics];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"envelopeStatistics"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"envelopeStatistics"];
    }
  }
  if (self->_result)
  {
    v10 = [(PFARepackagingExecution *)self result];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"result"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"result"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clockIdentifier hash];
  unint64_t v4 = [(PFAClockEnvelopeStatistics *)self->_envelopeStatistics hash] ^ v3;
  return v4 ^ [(PFARepackagingExecutionResult *)self->_result hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PFARepackagingExecution *)self clockIdentifier];
  v6 = [v4 clockIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PFARepackagingExecution *)self clockIdentifier];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PFARepackagingExecution *)self clockIdentifier];
    v10 = [v4 clockIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PFARepackagingExecution *)self envelopeStatistics];
  v6 = [v4 envelopeStatistics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PFARepackagingExecution *)self envelopeStatistics];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PFARepackagingExecution *)self envelopeStatistics];
    v15 = [v4 envelopeStatistics];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PFARepackagingExecution *)self result];
  v6 = [v4 result];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PFARepackagingExecution *)self result];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PFARepackagingExecution *)self result];
    v20 = [v4 result];
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
  id v10 = a3;
  id v4 = [(PFARepackagingExecution *)self clockIdentifier];

  if (v4)
  {
    v5 = [(PFARepackagingExecution *)self clockIdentifier];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PFARepackagingExecution *)self envelopeStatistics];

  if (v6)
  {
    uint64_t v7 = [(PFARepackagingExecution *)self envelopeStatistics];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PFARepackagingExecution *)self result];

  if (v8)
  {
    v9 = [(PFARepackagingExecution *)self result];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFARepackagingExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteResult
{
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteEnvelopeStatistics
{
}

- (BOOL)hasEnvelopeStatistics
{
  return self->_envelopeStatistics != 0;
}

- (void)deleteClockIdentifier
{
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

@end