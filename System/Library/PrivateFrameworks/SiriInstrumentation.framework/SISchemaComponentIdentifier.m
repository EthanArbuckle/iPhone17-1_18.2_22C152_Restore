@interface SISchemaComponentIdentifier
- (BOOL)hasComponent;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaComponentIdentifier)initWithDictionary:(id)a3;
- (SISchemaComponentIdentifier)initWithJSON:(id)a3;
- (SISchemaUUID)uuid;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)component;
- (unint64_t)hash;
- (void)deleteComponent;
- (void)deleteUuid;
- (void)setComponent:(int)a3;
- (void)setHasComponent:(BOOL)a3;
- (void)setHasUuid:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaComponentIdentifier

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaComponentIdentifier;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaComponentIdentifier *)self uuid];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaComponentIdentifier *)self deleteUuid];
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

- (void)setHasUuid:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)component
{
  return self->_component;
}

- (void)setUuid:(id)a3
{
}

- (SISchemaUUID)uuid
{
  return self->_uuid;
}

- (SISchemaComponentIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaComponentIdentifier;
  v5 = [(SISchemaComponentIdentifier *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaComponentIdentifier *)v5 setUuid:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"component"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaComponentIdentifier setComponent:](v5, "setComponent:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (SISchemaComponentIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaComponentIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaComponentIdentifier *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(SISchemaComponentIdentifier *)self component] - 1;
    if (v4 > 0x3E) {
      v5 = @"COMPONENTNAME_UNKNOWN";
    }
    else {
      v5 = off_1E5EBC428[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"component"];
  }
  if (self->_uuid)
  {
    v6 = [(SISchemaComponentIdentifier *)self uuid];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"uuid"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"uuid"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_uuid hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_component;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaComponentIdentifier *)self uuid];
  v6 = [v4 uuid];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SISchemaComponentIdentifier *)self uuid];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(SISchemaComponentIdentifier *)self uuid];
    objc_super v11 = [v4 uuid];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int component = self->_component;
    if (component != [v4 component]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SISchemaComponentIdentifier *)self uuid];

  if (v4)
  {
    v5 = [(SISchemaComponentIdentifier *)self uuid];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaComponentIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasComponent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComponent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int component = a3;
}

- (void)deleteUuid
{
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

@end