@interface SISchemaIntercomMessageRecorded
- (BOOL)disambiguationRequired;
- (BOOL)hasDisambiguationRequired;
- (BOOL)hasDurationInMs;
- (BOOL)hasIntercomTarget;
- (BOOL)hasIsReply;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReply;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaIntercomMessageRecorded)initWithDictionary:(id)a3;
- (SISchemaIntercomMessageRecorded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)intercomTarget;
- (int64_t)durationInMs;
- (unint64_t)hash;
- (void)deleteDisambiguationRequired;
- (void)deleteDurationInMs;
- (void)deleteIntercomTarget;
- (void)deleteIsReply;
- (void)setDisambiguationRequired:(BOOL)a3;
- (void)setDurationInMs:(int64_t)a3;
- (void)setHasDisambiguationRequired:(BOOL)a3;
- (void)setHasDurationInMs:(BOOL)a3;
- (void)setHasIntercomTarget:(BOOL)a3;
- (void)setHasIsReply:(BOOL)a3;
- (void)setIntercomTarget:(int)a3;
- (void)setIsReply:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaIntercomMessageRecorded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)intercomTarget
{
  return self->_intercomTarget;
}

- (BOOL)disambiguationRequired
{
  return self->_disambiguationRequired;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (int64_t)durationInMs
{
  return self->_durationInMs;
}

- (SISchemaIntercomMessageRecorded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaIntercomMessageRecorded;
  v5 = [(SISchemaIntercomMessageRecorded *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"durationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaIntercomMessageRecorded setDurationInMs:](v5, "setDurationInMs:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isReply"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaIntercomMessageRecorded setIsReply:](v5, "setIsReply:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"disambiguationRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaIntercomMessageRecorded setDisambiguationRequired:](v5, "setDisambiguationRequired:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"intercomTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaIntercomMessageRecorded setIntercomTarget:](v5, "setIntercomTarget:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaIntercomMessageRecorded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaIntercomMessageRecorded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaIntercomMessageRecorded *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaIntercomMessageRecorded disambiguationRequired](self, "disambiguationRequired"));
    [v3 setObject:v7 forKeyedSubscript:@"disambiguationRequired"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaIntercomMessageRecorded durationInMs](self, "durationInMs"));
  [v3 setObject:v8 forKeyedSubscript:@"durationInMs"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  unsigned int v9 = [(SISchemaIntercomMessageRecorded *)self intercomTarget] - 1;
  if (v9 > 2) {
    v10 = @"INTERCOMTARGET_UNKNOWN_INTERCOM_TARGET";
  }
  else {
    v10 = off_1E5EB7BE8[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"intercomTarget"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaIntercomMessageRecorded isReply](self, "isReply"));
  [v3 setObject:v5 forKeyedSubscript:@"isReply"];

LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_durationInMs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isReply;
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
  uint64_t v4 = 2654435761 * self->_disambiguationRequired;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_intercomTarget;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $D8BE4932C0F054940469C5CF6B03147B has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int64_t durationInMs = self->_durationInMs;
    if (durationInMs != [v4 durationInMs]) {
      goto LABEL_18;
    }
    $D8BE4932C0F054940469C5CF6B03147B has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int isReply = self->_isReply;
    if (isReply != [v4 isReply]) {
      goto LABEL_18;
    }
    $D8BE4932C0F054940469C5CF6B03147B has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int disambiguationRequired = self->_disambiguationRequired;
    if (disambiguationRequired == [v4 disambiguationRequired])
    {
      $D8BE4932C0F054940469C5CF6B03147B has = self->_has;
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
    int intercomTarget = self->_intercomTarget;
    if (intercomTarget != [v4 intercomTarget]) {
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
    PBDataWriterWriteInt64Field();
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
  PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaIntercomMessageRecordedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIntercomTarget
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIntercomTarget:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntercomTarget
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIntercomTarget:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int intercomTarget = a3;
}

- (void)deleteDisambiguationRequired
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDisambiguationRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDisambiguationRequired
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDisambiguationRequired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int disambiguationRequired = a3;
}

- (void)deleteIsReply
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsReply:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsReply
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsReply:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isReply = a3;
}

- (void)deleteDurationInMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationInMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationInMs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t durationInMs = a3;
}

@end