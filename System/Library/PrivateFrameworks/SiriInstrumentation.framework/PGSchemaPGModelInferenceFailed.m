@interface PGSchemaPGModelInferenceFailed
- (BOOL)hasCriticalError;
- (BOOL)hasModelIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTIntelligenceFlowError)criticalError;
- (NSData)jsonData;
- (NSString)modelIdentifier;
- (PGSchemaPGModelInferenceFailed)initWithDictionary:(id)a3;
- (PGSchemaPGModelInferenceFailed)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCriticalError;
- (void)deleteModelIdentifier;
- (void)setCriticalError:(id)a3;
- (void)setHasCriticalError:(BOOL)a3;
- (void)setHasModelIdentifier:(BOOL)a3;
- (void)setModelIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PGSchemaPGModelInferenceFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PGSchemaPGModelInferenceFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PGSchemaPGModelInferenceFailed *)self deleteCriticalError];
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
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_criticalError, 0);
}

- (void)setHasModelIdentifier:(BOOL)a3
{
  self->_hasModelIdentifier = a3;
}

- (void)setHasCriticalError:(BOOL)a3
{
  self->_hasCriticalError = a3;
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setCriticalError:(id)a3
{
}

- (IFTSchemaIFTIntelligenceFlowError)criticalError
{
  return self->_criticalError;
}

- (PGSchemaPGModelInferenceFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGSchemaPGModelInferenceFailed;
  v5 = [(PGSchemaPGModelInferenceFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"criticalError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTIntelligenceFlowError alloc] initWithDictionary:v6];
      [(PGSchemaPGModelInferenceFailed *)v5 setCriticalError:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"modelIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(PGSchemaPGModelInferenceFailed *)v5 setModelIdentifier:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PGSchemaPGModelInferenceFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PGSchemaPGModelInferenceFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PGSchemaPGModelInferenceFailed *)self dictionaryRepresentation];
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
  if (self->_criticalError)
  {
    id v4 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"criticalError"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"criticalError"];
    }
  }
  if (self->_modelIdentifier)
  {
    uint64_t v7 = [(PGSchemaPGModelInferenceFailed *)self modelIdentifier];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelIdentifier"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTIntelligenceFlowError *)self->_criticalError hash];
  return [(NSString *)self->_modelIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
  v6 = [v4 criticalError];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
    v10 = [v4 criticalError];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PGSchemaPGModelInferenceFailed *)self modelIdentifier];
  v6 = [v4 modelIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PGSchemaPGModelInferenceFailed *)self modelIdentifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PGSchemaPGModelInferenceFailed *)self modelIdentifier];
    v15 = [v4 modelIdentifier];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(PGSchemaPGModelInferenceFailed *)self criticalError];

  if (v4)
  {
    v5 = [(PGSchemaPGModelInferenceFailed *)self criticalError];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PGSchemaPGModelInferenceFailed *)self modelIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGModelInferenceFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelIdentifier
{
}

- (BOOL)hasModelIdentifier
{
  return self->_modelIdentifier != 0;
}

- (void)deleteCriticalError
{
}

- (BOOL)hasCriticalError
{
  return self->_criticalError != 0;
}

@end