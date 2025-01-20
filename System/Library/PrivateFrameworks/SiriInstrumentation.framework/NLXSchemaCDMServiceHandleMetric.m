@interface NLXSchemaCDMServiceHandleMetric
- (BOOL)hasEndLogicalTimestampInNs;
- (BOOL)hasErrorCode;
- (BOOL)hasFailureReason;
- (BOOL)hasServiceName;
- (BOOL)hasStartLogicalTimestampInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMServiceHandleMetric)initWithDictionary:(id)a3;
- (NLXSchemaCDMServiceHandleMetric)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)failureReason;
- (int)serviceName;
- (int64_t)endLogicalTimestampInNs;
- (int64_t)startLogicalTimestampInNs;
- (unint64_t)hash;
- (void)deleteEndLogicalTimestampInNs;
- (void)deleteErrorCode;
- (void)deleteFailureReason;
- (void)deleteServiceName;
- (void)deleteStartLogicalTimestampInNs;
- (void)setEndLogicalTimestampInNs:(int64_t)a3;
- (void)setErrorCode:(int)a3;
- (void)setFailureReason:(int)a3;
- (void)setHasEndLogicalTimestampInNs:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)setHasServiceName:(BOOL)a3;
- (void)setHasStartLogicalTimestampInNs:(BOOL)a3;
- (void)setServiceName:(int)a3;
- (void)setStartLogicalTimestampInNs:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMServiceHandleMetric

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

- (int)failureReason
{
  return self->_failureReason;
}

- (int64_t)endLogicalTimestampInNs
{
  return self->_endLogicalTimestampInNs;
}

- (int64_t)startLogicalTimestampInNs
{
  return self->_startLogicalTimestampInNs;
}

- (int)serviceName
{
  return self->_serviceName;
}

- (NLXSchemaCDMServiceHandleMetric)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMServiceHandleMetric;
  v5 = [(NLXSchemaCDMServiceHandleMetric *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"serviceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMServiceHandleMetric setServiceName:](v5, "setServiceName:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"startLogicalTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMServiceHandleMetric setStartLogicalTimestampInNs:](v5, "setStartLogicalTimestampInNs:", [v7 longLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"endLogicalTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMServiceHandleMetric setEndLogicalTimestampInNs:](v5, "setEndLogicalTimestampInNs:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"failureReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMServiceHandleMetric setFailureReason:](v5, "setFailureReason:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMServiceHandleMetric setErrorCode:](v5, "setErrorCode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (NLXSchemaCDMServiceHandleMetric)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMServiceHandleMetric *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMServiceHandleMetric *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NLXSchemaCDMServiceHandleMetric endLogicalTimestampInNs](self, "endLogicalTimestampInNs"));
    [v3 setObject:v7 forKeyedSubscript:@"endLogicalTimestampInNs"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[NLXSchemaCDMServiceHandleMetric errorCode](self, "errorCode"));
  [v3 setObject:v8 forKeyedSubscript:@"errorCode"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_12:
  unsigned int v9 = [(NLXSchemaCDMServiceHandleMetric *)self failureReason] - 1;
  if (v9 > 4) {
    v10 = @"CDMSERVICEFAILURECODE_UNKNOWN";
  }
  else {
    v10 = off_1E5EBC188[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"failureReason"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  unsigned int v11 = [(NLXSchemaCDMServiceHandleMetric *)self serviceName] - 1;
  if (v11 > 0x29) {
    v12 = @"CDMSERVICENAME_UNKNOWN";
  }
  else {
    v12 = off_1E5EBC1B0[v11];
  }
  [v3 setObject:v12 forKeyedSubscript:@"serviceName"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NLXSchemaCDMServiceHandleMetric startLogicalTimestampInNs](self, "startLogicalTimestampInNs"));
  [v3 setObject:v5 forKeyedSubscript:@"startLogicalTimestampInNs"];

LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_serviceName;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_startLogicalTimestampInNs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_endLogicalTimestampInNs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_failureReason;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $F8FB87B3F4B9E1F970A64CE8C57F9AB5 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int serviceName = self->_serviceName;
    if (serviceName != [v4 serviceName]) {
      goto LABEL_22;
    }
    $F8FB87B3F4B9E1F970A64CE8C57F9AB5 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int64_t startLogicalTimestampInNs = self->_startLogicalTimestampInNs;
    if (startLogicalTimestampInNs != [v4 startLogicalTimestampInNs]) {
      goto LABEL_22;
    }
    $F8FB87B3F4B9E1F970A64CE8C57F9AB5 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int64_t endLogicalTimestampInNs = self->_endLogicalTimestampInNs;
    if (endLogicalTimestampInNs != [v4 endLogicalTimestampInNs]) {
      goto LABEL_22;
    }
    $F8FB87B3F4B9E1F970A64CE8C57F9AB5 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int failureReason = self->_failureReason;
    if (failureReason == [v4 failureReason])
    {
      $F8FB87B3F4B9E1F970A64CE8C57F9AB5 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
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
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMServiceHandleMetricReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int errorCode = a3;
}

- (void)deleteFailureReason
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFailureReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFailureReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int failureReason = a3;
}

- (void)deleteEndLogicalTimestampInNs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEndLogicalTimestampInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndLogicalTimestampInNs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEndLogicalTimestampInNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t endLogicalTimestampInNs = a3;
}

- (void)deleteStartLogicalTimestampInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasStartLogicalTimestampInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartLogicalTimestampInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartLogicalTimestampInNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t startLogicalTimestampInNs = a3;
}

- (void)deleteServiceName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasServiceName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServiceName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int serviceName = a3;
}

@end