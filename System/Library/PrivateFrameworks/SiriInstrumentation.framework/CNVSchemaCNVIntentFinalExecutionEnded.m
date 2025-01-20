@interface CNVSchemaCNVIntentFinalExecutionEnded
- (BOOL)hasBypassReason;
- (BOOL)hasEagerStatus;
- (BOOL)hasMaxRss;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionEnded)initWithDictionary:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)bypassReason;
- (int)eagerStatus;
- (unint64_t)hash;
- (unint64_t)maxRss;
- (void)deleteBypassReason;
- (void)deleteEagerStatus;
- (void)deleteMaxRss;
- (void)setBypassReason:(int)a3;
- (void)setEagerStatus:(int)a3;
- (void)setHasBypassReason:(BOOL)a3;
- (void)setHasEagerStatus:(BOOL)a3;
- (void)setHasMaxRss:(BOOL)a3;
- (void)setMaxRss:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVIntentFinalExecutionEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)maxRss
{
  return self->_maxRss;
}

- (int)bypassReason
{
  return self->_bypassReason;
}

- (int)eagerStatus
{
  return self->_eagerStatus;
}

- (CNVSchemaCNVIntentFinalExecutionEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNVSchemaCNVIntentFinalExecutionEnded;
  v5 = [(CNVSchemaCNVIntentFinalExecutionEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eagerStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVIntentFinalExecutionEnded setEagerStatus:](v5, "setEagerStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"bypassReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVIntentFinalExecutionEnded setBypassReason:](v5, "setBypassReason:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"maxRss"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVIntentFinalExecutionEnded setMaxRss:](v5, "setMaxRss:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVIntentFinalExecutionEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVIntentFinalExecutionEnded *)self dictionaryRepresentation];
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
    if ([(CNVSchemaCNVIntentFinalExecutionEnded *)self bypassReason] == 1) {
      uint64_t v7 = @"CNVBYPASSREASON_EMERGENCY_CALL";
    }
    else {
      uint64_t v7 = @"CNVBYPASSREASON_UNKNOWN";
    }
    [v3 setObject:v7 forKeyedSubscript:@"bypassReason"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(CNVSchemaCNVIntentFinalExecutionEnded *)self eagerStatus] - 1;
  if (v8 > 2) {
    v9 = @"CNVEAGERSTATUS_UNKNOWN";
  }
  else {
    v9 = off_1E5EAD5C8[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"eagerStatus"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CNVSchemaCNVIntentFinalExecutionEnded maxRss](self, "maxRss"));
  [v3 setObject:v5 forKeyedSubscript:@"maxRss"];

LABEL_5:
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
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_eagerStatus;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_bypassReason;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_maxRss;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $A452E09500BDD7A3C4AF49C0EB2EBA77 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int eagerStatus = self->_eagerStatus;
    if (eagerStatus != [v4 eagerStatus]) {
      goto LABEL_14;
    }
    $A452E09500BDD7A3C4AF49C0EB2EBA77 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int bypassReason = self->_bypassReason;
    if (bypassReason == [v4 bypassReason])
    {
      $A452E09500BDD7A3C4AF49C0EB2EBA77 has = self->_has;
      unsigned int v6 = v4[24];
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
    unint64_t maxRss = self->_maxRss;
    if (maxRss != [v4 maxRss]) {
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMaxRss
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMaxRss:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxRss
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMaxRss:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t maxRss = a3;
}

- (void)deleteBypassReason
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasBypassReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBypassReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBypassReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int bypassReason = a3;
}

- (void)deleteEagerStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEagerStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEagerStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEagerStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int eagerStatus = a3;
}

@end