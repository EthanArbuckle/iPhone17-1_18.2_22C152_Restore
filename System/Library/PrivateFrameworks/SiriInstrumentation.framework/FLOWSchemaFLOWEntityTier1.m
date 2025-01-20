@interface FLOWSchemaFLOWEntityTier1
- (BOOL)hasEntityId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEntityTier1)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWEntityTier1)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)entityId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteEntityId;
- (void)setEntityId:(id)a3;
- (void)setHasEntityId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWEntityTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FLOWSchemaFLOWEntityTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(FLOWSchemaFLOWEntityTier1 *)self deleteEntityId];
  }
  if ([v4 isConditionSet:4]) {
    [(FLOWSchemaFLOWEntityTier1 *)self deleteEntityId];
  }
  if ([v4 isConditionSet:5]) {
    [(FLOWSchemaFLOWEntityTier1 *)self deleteEntityId];
  }
  if ([v4 isConditionSet:6]) {
    [(FLOWSchemaFLOWEntityTier1 *)self deleteEntityId];
  }
  if ([v4 isConditionSet:7]) {
    [(FLOWSchemaFLOWEntityTier1 *)self deleteEntityId];
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

- (void)setHasEntityId:(BOOL)a3
{
  self->_hasEntityId = a3;
}

- (void)setEntityId:(id)a3
{
}

- (NSString)entityId
{
  return self->_entityId;
}

- (FLOWSchemaFLOWEntityTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWEntityTier1;
  v5 = [(FLOWSchemaFLOWEntityTier1 *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entityId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWEntityTier1 *)v5 setEntityId:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWEntityTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWEntityTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWEntityTier1 *)self dictionaryRepresentation];
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
  if (self->_entityId)
  {
    id v4 = [(FLOWSchemaFLOWEntityTier1 *)self entityId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"entityId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_entityId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(FLOWSchemaFLOWEntityTier1 *)self entityId];
    v6 = [v4 entityId];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(FLOWSchemaFLOWEntityTier1 *)self entityId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(FLOWSchemaFLOWEntityTier1 *)self entityId];
      v11 = [v4 entityId];
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
  id v4 = [(FLOWSchemaFLOWEntityTier1 *)self entityId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWEntityTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntityId
{
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

@end