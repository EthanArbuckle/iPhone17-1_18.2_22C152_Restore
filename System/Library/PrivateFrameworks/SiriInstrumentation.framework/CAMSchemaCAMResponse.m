@interface CAMSchemaCAMResponse
- (BOOL)hasAction;
- (BOOL)hasEnforcer;
- (BOOL)hasResponseStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMResponse)initWithDictionary:(id)a3;
- (CAMSchemaCAMResponse)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)enforcer;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)action;
- (unint64_t)hash;
- (unsigned)responseStatusCode;
- (void)deleteAction;
- (void)deleteEnforcer;
- (void)deleteResponseStatusCode;
- (void)setAction:(int)a3;
- (void)setEnforcer:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasEnforcer:(BOOL)a3;
- (void)setHasResponseStatusCode:(BOOL)a3;
- (void)setResponseStatusCode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasEnforcer:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setEnforcer:(id)a3
{
}

- (NSString)enforcer
{
  return self->_enforcer;
}

- (unsigned)responseStatusCode
{
  return self->_responseStatusCode;
}

- (int)action
{
  return self->_action;
}

- (CAMSchemaCAMResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMSchemaCAMResponse;
  v5 = [(CAMSchemaCAMResponse *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMResponse setAction:](v5, "setAction:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"responseStatusCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMResponse setResponseStatusCode:](v5, "setResponseStatusCode:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"enforcer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(CAMSchemaCAMResponse *)v5 setEnforcer:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (CAMSchemaCAMResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMResponse *)self dictionaryRepresentation];
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
    unsigned int v4 = [(CAMSchemaCAMResponse *)self action] - 1;
    if (v4 > 5) {
      v5 = @"CAMACTION_UNKNOWN";
    }
    else {
      v5 = off_1E5EACB68[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"action"];
  }
  if (self->_enforcer)
  {
    v6 = [(CAMSchemaCAMResponse *)self enforcer];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"enforcer"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAMSchemaCAMResponse responseStatusCode](self, "responseStatusCode"));
    [v3 setObject:v8 forKeyedSubscript:@"responseStatusCode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_action;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_enforcer hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_responseStatusCode;
  return v3 ^ v2 ^ [(NSString *)self->_enforcer hash];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $720251E915F890F13ABE09A91AC1D3AB has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int action = self->_action;
    if (action != [v4 action]) {
      goto LABEL_14;
    }
    $720251E915F890F13ABE09A91AC1D3AB has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (unsigned int responseStatusCode = self->_responseStatusCode,
          responseStatusCode == [v4 responseStatusCode]))
    {
      v10 = [(CAMSchemaCAMResponse *)self enforcer];
      v11 = [v4 enforcer];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(CAMSchemaCAMResponse *)self enforcer];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(CAMSchemaCAMResponse *)self enforcer];
        v16 = [v4 enforcer];
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
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(CAMSchemaCAMResponse *)self enforcer];

  unsigned int v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnforcer
{
}

- (BOOL)hasEnforcer
{
  return self->_enforcer != 0;
}

- (void)deleteResponseStatusCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResponseStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseStatusCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseStatusCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int responseStatusCode = a3;
}

- (void)deleteAction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int action = a3;
}

@end