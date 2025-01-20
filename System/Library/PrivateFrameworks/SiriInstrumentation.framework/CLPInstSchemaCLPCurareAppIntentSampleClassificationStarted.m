@interface CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted
- (BOOL)hasOriginalRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)originalRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteOriginalRequestId;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self deleteOriginalRequestId];
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
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  self->_hasOriginalRequestId = a3;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted;
  v5 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)v5 setOriginalRequestId:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self dictionaryRepresentation];
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
  if (self->_originalRequestId)
  {
    id v4 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"originalRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(SISchemaUUID *)self->_originalRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
    v6 = [v4 originalRequestId];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
      v11 = [v4 originalRequestId];
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
  id v6 = a3;
  id v4 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];

  if (v4)
  {
    v5 = [(CLPInstSchemaCLPCurareAppIntentSampleClassificationStarted *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCurareAppIntentSampleClassificationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

@end