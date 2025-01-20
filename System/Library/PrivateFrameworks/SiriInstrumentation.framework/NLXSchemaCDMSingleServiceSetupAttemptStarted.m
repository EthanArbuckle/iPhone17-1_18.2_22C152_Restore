@interface NLXSchemaCDMSingleServiceSetupAttemptStarted
- (BOOL)hasRetryNumber;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSingleServiceSetupAttemptStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMSingleServiceSetupAttemptStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)serviceType;
- (unint64_t)hash;
- (unsigned)retryNumber;
- (void)deleteRetryNumber;
- (void)deleteServiceType;
- (void)setHasRetryNumber:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setRetryNumber:(unsigned int)a3;
- (void)setServiceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSingleServiceSetupAttemptStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)retryNumber
{
  return self->_retryNumber;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (NLXSchemaCDMSingleServiceSetupAttemptStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMSingleServiceSetupAttemptStarted;
  v5 = [(NLXSchemaCDMSingleServiceSetupAttemptStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptStarted setServiceType:](v5, "setServiceType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"retryNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptStarted setRetryNumber:](v5, "setRetryNumber:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSingleServiceSetupAttemptStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSingleServiceSetupAttemptStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSingleServiceSetupAttemptStarted *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMSingleServiceSetupAttemptStarted retryNumber](self, "retryNumber"));
    [v3 setObject:v5 forKeyedSubscript:@"retryNumber"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(NLXSchemaCDMSingleServiceSetupAttemptStarted *)self serviceType] - 1;
    if (v6 > 0x24) {
      uint64_t v7 = @"CDMSERVICETYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB3128[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"serviceType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_serviceType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_retryNumber;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $27FE0C3D57BB0858902B99FE3BA7C441 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int serviceType = self->_serviceType;
    if (serviceType != [v4 serviceType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $27FE0C3D57BB0858902B99FE3BA7C441 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int retryNumber = self->_retryNumber;
    if (retryNumber != [v4 retryNumber]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSingleServiceSetupAttemptStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteRetryNumber
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRetryNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryNumber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRetryNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int retryNumber = a3;
}

- (void)deleteServiceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int serviceType = a3;
}

@end