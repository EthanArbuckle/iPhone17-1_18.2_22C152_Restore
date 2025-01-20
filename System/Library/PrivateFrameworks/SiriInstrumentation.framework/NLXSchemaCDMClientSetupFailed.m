@interface NLXSchemaCDMClientSetupFailed
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMClientSetupFailed)initWithDictionary:(id)a3;
- (NLXSchemaCDMClientSetupFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)errorDomain;
- (int)reason;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteReason;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMClientSetupFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)reason
{
  return self->_reason;
}

- (NLXSchemaCDMClientSetupFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMClientSetupFailed;
  v5 = [(NLXSchemaCDMClientSetupFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupFailed setErrorDomain:](v5, "setErrorDomain:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMClientSetupFailed setErrorCode:](v5, "setErrorCode:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NLXSchemaCDMClientSetupFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMClientSetupFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMClientSetupFailed *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[NLXSchemaCDMClientSetupFailed errorCode](self, "errorCode"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_16;
      }
LABEL_12:
      unsigned int v9 = [(NLXSchemaCDMClientSetupFailed *)self reason] - 1;
      if (v9 > 2) {
        v10 = @"CDMCLIENTSETUPFAILUREREASON_UNKNOWN";
      }
      else {
        v10 = off_1E5EB2C18[v9];
      }
      [v3 setObject:v10 forKeyedSubscript:@"reason"];
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  int v6 = [(NLXSchemaCDMClientSetupFailed *)self errorDomain];
  uint64_t v7 = @"CDMCLIENTSETUPERRORDOMAIN_UNKNOWN";
  if (v6 == 1) {
    uint64_t v7 = @"CDMCLIENTSETUPERRORDOMAIN_FOUNDATION_CLIENT";
  }
  if (v6 == 2) {
    v8 = @"CDMCLIENTSETUPERRORDOMAIN_SERVICE_CENTER";
  }
  else {
    v8 = v7;
  }
  [v3 setObject:v8 forKeyedSubscript:@"errorDomain"];
  if (*(unsigned char *)&self->_has) {
    goto LABEL_12;
  }
LABEL_16:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_reason;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_errorDomain;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $95C9864D652A65CD1DE3D57B55E72EE0 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int reason = self->_reason;
    if (reason != [v4 reason]) {
      goto LABEL_14;
    }
    $95C9864D652A65CD1DE3D57B55E72EE0 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int errorDomain = self->_errorDomain;
    if (errorDomain == [v4 errorDomain])
    {
      $95C9864D652A65CD1DE3D57B55E72EE0 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMClientSetupFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int errorCode = a3;
}

- (void)deleteErrorDomain
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorDomain
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int errorDomain = a3;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end