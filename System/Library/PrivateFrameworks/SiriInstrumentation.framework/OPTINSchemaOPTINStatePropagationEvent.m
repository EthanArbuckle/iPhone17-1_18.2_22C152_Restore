@interface OPTINSchemaOPTINStatePropagationEvent
- (BOOL)hasHashedHomeKitAccessoryId;
- (BOOL)hasOptInState;
- (BOOL)hasPropagationState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (OPTINSchemaOPTINStatePropagationEvent)initWithDictionary:(id)a3;
- (OPTINSchemaOPTINStatePropagationEvent)initWithJSON:(id)a3;
- (SISchemaUUID)hashedHomeKitAccessoryId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (int)optInState;
- (int)propagationState;
- (unint64_t)hash;
- (void)deleteHashedHomeKitAccessoryId;
- (void)deleteOptInState;
- (void)deletePropagationState;
- (void)setHasHashedHomeKitAccessoryId:(BOOL)a3;
- (void)setHasOptInState:(BOOL)a3;
- (void)setHasPropagationState:(BOOL)a3;
- (void)setHashedHomeKitAccessoryId:(id)a3;
- (void)setOptInState:(int)a3;
- (void)setPropagationState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OPTINSchemaOPTINStatePropagationEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OPTINSchemaOPTINStatePropagationEvent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(OPTINSchemaOPTINStatePropagationEvent *)self deleteHashedHomeKitAccessoryId];
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

- (void)setHasHashedHomeKitAccessoryId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHashedHomeKitAccessoryId:(id)a3
{
}

- (SISchemaUUID)hashedHomeKitAccessoryId
{
  return self->_hashedHomeKitAccessoryId;
}

- (int)propagationState
{
  return self->_propagationState;
}

- (int)optInState
{
  return self->_optInState;
}

- (OPTINSchemaOPTINStatePropagationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OPTINSchemaOPTINStatePropagationEvent;
  v5 = [(OPTINSchemaOPTINStatePropagationEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"optInState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[OPTINSchemaOPTINStatePropagationEvent setOptInState:](v5, "setOptInState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"propagationState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[OPTINSchemaOPTINStatePropagationEvent setPropagationState:](v5, "setPropagationState:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hashedHomeKitAccessoryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(OPTINSchemaOPTINStatePropagationEvent *)v5 setHashedHomeKitAccessoryId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (OPTINSchemaOPTINStatePropagationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(OPTINSchemaOPTINStatePropagationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(OPTINSchemaOPTINStatePropagationEvent *)self dictionaryRepresentation];
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
  if (self->_hashedHomeKitAccessoryId)
  {
    id v4 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"hashedHomeKitAccessoryId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"hashedHomeKitAccessoryId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v8 = [(OPTINSchemaOPTINStatePropagationEvent *)self optInState] - 1;
    if (v8 > 2) {
      objc_super v9 = @"UNKNOWN";
    }
    else {
      objc_super v9 = off_1E5EB35D0[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"optInState"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v10 = [(OPTINSchemaOPTINStatePropagationEvent *)self propagationState] - 1;
    if (v10 > 3) {
      v11 = @"OPTINPROPAGATIONSTATE_UNKNOWN";
    }
    else {
      v11 = off_1E5EB35E8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"propagationState"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_optInState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaUUID *)self->_hashedHomeKitAccessoryId hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_propagationState;
  return v3 ^ v2 ^ [(SISchemaUUID *)self->_hashedHomeKitAccessoryId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $ED48CD6DDAEF413251824BA03510C4C3 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int optInState = self->_optInState;
    if (optInState != [v4 optInState]) {
      goto LABEL_14;
    }
    $ED48CD6DDAEF413251824BA03510C4C3 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int propagationState = self->_propagationState,
          propagationState == [v4 propagationState]))
    {
      unsigned int v10 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
      v11 = [v4 hashedHomeKitAccessoryId];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
        v16 = [v4 hashedHomeKitAccessoryId];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(OPTINSchemaOPTINStatePropagationEvent *)self hashedHomeKitAccessoryId];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OPTINSchemaOPTINStatePropagationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteHashedHomeKitAccessoryId
{
}

- (BOOL)hasHashedHomeKitAccessoryId
{
  return self->_hashedHomeKitAccessoryId != 0;
}

- (void)deletePropagationState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPropagationState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPropagationState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPropagationState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int propagationState = a3;
}

- (void)deleteOptInState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOptInState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOptInState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOptInState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int optInState = a3;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.siri.optin.OPTINStatePropagationEvent";
}

- (int)getAnyEventType
{
  return 48;
}

@end