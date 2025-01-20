@interface SRSchemaSRErrorChecked
- (BOOL)hasCheckErrorResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SRSchemaSRCheckErrorResponse)checkErrorResponse;
- (SRSchemaSRErrorChecked)initWithDictionary:(id)a3;
- (SRSchemaSRErrorChecked)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCheckErrorResponse;
- (void)setCheckErrorResponse:(id)a3;
- (void)setHasCheckErrorResponse:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SRSchemaSRErrorChecked

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SRSchemaSRErrorChecked;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SRSchemaSRErrorChecked *)self deleteCheckErrorResponse];
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

- (void)setHasCheckErrorResponse:(BOOL)a3
{
  self->_hasCheckErrorResponse = a3;
}

- (void)setCheckErrorResponse:(id)a3
{
}

- (SRSchemaSRCheckErrorResponse)checkErrorResponse
{
  return self->_checkErrorResponse;
}

- (SRSchemaSRErrorChecked)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SRSchemaSRErrorChecked;
  v5 = [(SRSchemaSRErrorChecked *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"checkErrorResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SRSchemaSRCheckErrorResponse alloc] initWithDictionary:v6];
      [(SRSchemaSRErrorChecked *)v5 setCheckErrorResponse:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (SRSchemaSRErrorChecked)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SRSchemaSRErrorChecked *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SRSchemaSRErrorChecked *)self dictionaryRepresentation];
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
  if (self->_checkErrorResponse)
  {
    id v4 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"checkErrorResponse"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"checkErrorResponse"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(SRSchemaSRCheckErrorResponse *)self->_checkErrorResponse hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
    v6 = [v4 checkErrorResponse];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
      v11 = [v4 checkErrorResponse];
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
  id v4 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];

  if (v4)
  {
    v5 = [(SRSchemaSRErrorChecked *)self checkErrorResponse];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SRSchemaSRErrorCheckedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCheckErrorResponse
{
}

- (BOOL)hasCheckErrorResponse
{
  return self->_checkErrorResponse != 0;
}

@end