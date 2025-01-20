@interface NLXSchemaCDMSingleServiceSetupAttemptFailed
- (BOOL)hasErrorCode;
- (BOOL)hasReason;
- (BOOL)hasRetryNumber;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithDictionary:(id)a3;
- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (int)serviceType;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)retryNumber;
- (void)deleteErrorCode;
- (void)deleteReason;
- (void)deleteRetryNumber;
- (void)deleteServiceType;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRetryNumber:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setRetryNumber:(unsigned int)a3;
- (void)setServiceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSingleServiceSetupAttemptFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (int)reason
{
  return self->_reason;
}

- (unsigned)retryNumber
{
  return self->_retryNumber;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMSingleServiceSetupAttemptFailed;
  v5 = [(NLXSchemaCDMSingleServiceSetupAttemptFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setServiceType:](v5, "setServiceType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"retryNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setRetryNumber:](v5, "setRetryNumber:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setReason:](v5, "setReason:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSingleServiceSetupAttemptFailed setErrorCode:](v5, "setErrorCode:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSingleServiceSetupAttemptFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSingleServiceSetupAttemptFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSingleServiceSetupAttemptFailed *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMSingleServiceSetupAttemptFailed errorCode](self, "errorCode"));
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_13:
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMSingleServiceSetupAttemptFailed retryNumber](self, "retryNumber"));
      [v3 setObject:v9 forKeyedSubscript:@"retryNumber"];

      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_18;
      }
LABEL_14:
      unsigned int v10 = [(NLXSchemaCDMSingleServiceSetupAttemptFailed *)self serviceType] - 1;
      if (v10 > 0x24) {
        v11 = @"CDMSERVICETYPE_UNKNOWN";
      }
      else {
        v11 = off_1E5EB3000[v10];
      }
      [v3 setObject:v11 forKeyedSubscript:@"serviceType"];
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  int v6 = [(NLXSchemaCDMSingleServiceSetupAttemptFailed *)self reason];
  uint64_t v7 = @"CDMSERVICESETUPATTEMPTFAILUREREASON_UNKNOWN";
  if (v6 == 1) {
    uint64_t v7 = @"CDMSERVICESETUPATTEMPTFAILUREREASON_TIMED_OUT";
  }
  if (v6 == 2) {
    v8 = @"CDMSERVICESETUPATTEMPTFAILUREREASON_ERROR_DURING_SETUP";
  }
  else {
    v8 = v7;
  }
  [v3 setObject:v8 forKeyedSubscript:@"reason"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_4:
  if (has) {
    goto LABEL_14;
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_serviceType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_retryNumber;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_reason;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $8F5C2E41CBBBDFEB7D4EDF60B14B0D67 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int serviceType = self->_serviceType;
    if (serviceType != [v4 serviceType]) {
      goto LABEL_18;
    }
    $8F5C2E41CBBBDFEB7D4EDF60B14B0D67 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int retryNumber = self->_retryNumber;
    if (retryNumber != [v4 retryNumber]) {
      goto LABEL_18;
    }
    $8F5C2E41CBBBDFEB7D4EDF60B14B0D67 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int reason = self->_reason;
    if (reason == [v4 reason])
    {
      $8F5C2E41CBBBDFEB7D4EDF60B14B0D67 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    unsigned int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSingleServiceSetupAttemptFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int errorCode = a3;
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int reason = a3;
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