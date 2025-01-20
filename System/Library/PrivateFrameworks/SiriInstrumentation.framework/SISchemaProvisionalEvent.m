@interface SISchemaProvisionalEvent
- (BOOL)hasAnyEvent;
- (BOOL)hasTypeId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)typeId;
- (SISchemaAnyEvent)anyEvent;
- (SISchemaProvisionalEvent)initWithDictionary:(id)a3;
- (SISchemaProvisionalEvent)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (int64_t)version;
- (unint64_t)hash;
- (void)deleteAnyEvent;
- (void)deleteTypeId;
- (void)deleteVersion;
- (void)setAnyEvent:(id)a3;
- (void)setHasAnyEvent:(BOOL)a3;
- (void)setHasTypeId:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setTypeId:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaProvisionalEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaProvisionalEvent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaProvisionalEvent *)self anyEvent];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaProvisionalEvent *)self deleteAnyEvent];
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
  objc_storeStrong((id *)&self->_typeId, 0);
  objc_storeStrong((id *)&self->_anyEvent, 0);
}

- (void)setHasTypeId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAnyEvent:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setTypeId:(id)a3
{
}

- (NSString)typeId
{
  return self->_typeId;
}

- (void)setAnyEvent:(id)a3
{
}

- (SISchemaAnyEvent)anyEvent
{
  return self->_anyEvent;
}

- (SISchemaProvisionalEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaProvisionalEvent;
  v5 = [(SISchemaProvisionalEvent *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anyEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaAnyEvent alloc] initWithDictionary:v6];
      [(SISchemaProvisionalEvent *)v5 setAnyEvent:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"typeId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaProvisionalEvent *)v5 setTypeId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaProvisionalEvent setVersion:](v5, "setVersion:", [v10 longLongValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaProvisionalEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaProvisionalEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaProvisionalEvent *)self dictionaryRepresentation];
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
  if (self->_anyEvent)
  {
    id v4 = [(SISchemaProvisionalEvent *)self anyEvent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"anyEvent"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"anyEvent"];
    }
  }
  if (self->_typeId)
  {
    uint64_t v7 = [(SISchemaProvisionalEvent *)self typeId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"typeId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaProvisionalEvent version](self, "version"));
    [v3 setObject:v9 forKeyedSubscript:@"version"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaAnyEvent *)self->_anyEvent hash];
  NSUInteger v4 = [(NSString *)self->_typeId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_version;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaProvisionalEvent *)self anyEvent];
  v6 = [v4 anyEvent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaProvisionalEvent *)self anyEvent];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaProvisionalEvent *)self anyEvent];
    v10 = [v4 anyEvent];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaProvisionalEvent *)self typeId];
  v6 = [v4 typeId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaProvisionalEvent *)self typeId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaProvisionalEvent *)self typeId];
    v15 = [v4 typeId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0 || (int64_t version = self->_version, version == [v4 version]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(SISchemaProvisionalEvent *)self anyEvent];

  if (v4)
  {
    uint64_t v5 = [(SISchemaProvisionalEvent *)self anyEvent];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaProvisionalEvent *)self typeId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaProvisionalEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteVersion
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t version = a3;
}

- (void)deleteTypeId
{
}

- (BOOL)hasTypeId
{
  return self->_typeId != 0;
}

- (void)deleteAnyEvent
{
}

- (BOOL)hasAnyEvent
{
  return self->_anyEvent != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.common.ProvisionalEvent";
}

- (int)getAnyEventType
{
  return 7;
}

@end