@interface SISchemaClientFlow
- (BOOL)hasClientFlowPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)clientFlowPayload;
- (SISchemaClientFlow)initWithDictionary:(id)a3;
- (SISchemaClientFlow)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteClientFlowPayload;
- (void)setClientFlowPayload:(id)a3;
- (void)setHasClientFlowPayload:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientFlow

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasClientFlowPayload:(BOOL)a3
{
  self->_hasClientFlowPayload = a3;
}

- (void)setClientFlowPayload:(id)a3
{
}

- (NSString)clientFlowPayload
{
  return self->_clientFlowPayload;
}

- (SISchemaClientFlow)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaClientFlow;
  v5 = [(SISchemaClientFlow *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clientFlowPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaClientFlow *)v5 setClientFlowPayload:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaClientFlow)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaClientFlow *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaClientFlow *)self dictionaryRepresentation];
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
  if (self->_clientFlowPayload)
  {
    id v4 = [(SISchemaClientFlow *)self clientFlowPayload];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"clientFlowPayload"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_clientFlowPayload hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(SISchemaClientFlow *)self clientFlowPayload];
    v6 = [v4 clientFlowPayload];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SISchemaClientFlow *)self clientFlowPayload];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(SISchemaClientFlow *)self clientFlowPayload];
      v11 = [v4 clientFlowPayload];
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
  id v5 = a3;
  id v4 = [(SISchemaClientFlow *)self clientFlowPayload];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientFlowReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientFlowPayload
{
}

- (BOOL)hasClientFlowPayload
{
  return self->_clientFlowPayload != 0;
}

@end