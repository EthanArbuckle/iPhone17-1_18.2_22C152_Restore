@interface PSESchemaPSEHomeFollowUp
- (BOOL)hasFollowUpAccessoryType;
- (BOOL)hasFollowUpDayOfWeek;
- (BOOL)hasFollowUpDurationSinceSiriRequestInSeconds;
- (BOOL)hasFollowUpHourOfDay;
- (BOOL)hasFollowUpSource;
- (BOOL)hasFollowUpType;
- (BOOL)hasIsFollowUpInSameContainerAsSiriRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFollowUpInSameContainerAsSiriRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)followUpAccessoryType;
- (PSESchemaPSEHomeFollowUp)initWithDictionary:(id)a3;
- (PSESchemaPSEHomeFollowUp)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)followUpSource;
- (int)followUpType;
- (unint64_t)hash;
- (unsigned)followUpDayOfWeek;
- (unsigned)followUpDurationSinceSiriRequestInSeconds;
- (unsigned)followUpHourOfDay;
- (void)deleteFollowUpAccessoryType;
- (void)deleteFollowUpDayOfWeek;
- (void)deleteFollowUpDurationSinceSiriRequestInSeconds;
- (void)deleteFollowUpHourOfDay;
- (void)deleteFollowUpSource;
- (void)deleteFollowUpType;
- (void)deleteIsFollowUpInSameContainerAsSiriRequest;
- (void)setFollowUpAccessoryType:(id)a3;
- (void)setFollowUpDayOfWeek:(unsigned int)a3;
- (void)setFollowUpDurationSinceSiriRequestInSeconds:(unsigned int)a3;
- (void)setFollowUpHourOfDay:(unsigned int)a3;
- (void)setFollowUpSource:(int)a3;
- (void)setFollowUpType:(int)a3;
- (void)setHasFollowUpAccessoryType:(BOOL)a3;
- (void)setHasFollowUpDayOfWeek:(BOOL)a3;
- (void)setHasFollowUpDurationSinceSiriRequestInSeconds:(BOOL)a3;
- (void)setHasFollowUpHourOfDay:(BOOL)a3;
- (void)setHasFollowUpSource:(BOOL)a3;
- (void)setHasFollowUpType:(BOOL)a3;
- (void)setHasIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3;
- (void)setIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSESchemaPSEHomeFollowUp

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasFollowUpAccessoryType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)followUpDurationSinceSiriRequestInSeconds
{
  return self->_followUpDurationSinceSiriRequestInSeconds;
}

- (unsigned)followUpHourOfDay
{
  return self->_followUpHourOfDay;
}

- (unsigned)followUpDayOfWeek
{
  return self->_followUpDayOfWeek;
}

- (BOOL)isFollowUpInSameContainerAsSiriRequest
{
  return self->_isFollowUpInSameContainerAsSiriRequest;
}

- (void)setFollowUpAccessoryType:(id)a3
{
}

- (NSString)followUpAccessoryType
{
  return self->_followUpAccessoryType;
}

- (int)followUpSource
{
  return self->_followUpSource;
}

- (int)followUpType
{
  return self->_followUpType;
}

- (PSESchemaPSEHomeFollowUp)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PSESchemaPSEHomeFollowUp;
  v5 = [(PSESchemaPSEHomeFollowUp *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"followUpType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setFollowUpType:](v5, "setFollowUpType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"followUpSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setFollowUpSource:](v5, "setFollowUpSource:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"followUpAccessoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PSESchemaPSEHomeFollowUp *)v5 setFollowUpAccessoryType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isFollowUpInSameContainerAsSiriRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setIsFollowUpInSameContainerAsSiriRequest:](v5, "setIsFollowUpInSameContainerAsSiriRequest:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"followUpDayOfWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setFollowUpDayOfWeek:](v5, "setFollowUpDayOfWeek:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"followUpHourOfDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setFollowUpHourOfDay:](v5, "setFollowUpHourOfDay:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"followUpDurationSinceSiriRequestInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSESchemaPSEHomeFollowUp setFollowUpDurationSinceSiriRequestInSeconds:](v5, "setFollowUpDurationSinceSiriRequestInSeconds:", [v13 unsignedIntValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (PSESchemaPSEHomeFollowUp)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PSESchemaPSEHomeFollowUp *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PSESchemaPSEHomeFollowUp *)self dictionaryRepresentation];
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
  if (self->_followUpAccessoryType)
  {
    id v4 = [(PSESchemaPSEHomeFollowUp *)self followUpAccessoryType];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"followUpAccessoryType"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpDayOfWeek](self, "followUpDayOfWeek"));
    [v3 setObject:v9 forKeyedSubscript:@"followUpDayOfWeek"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpDurationSinceSiriRequestInSeconds](self, "followUpDurationSinceSiriRequestInSeconds"));
  [v3 setObject:v10 forKeyedSubscript:@"followUpDurationSinceSiriRequestInSeconds"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PSESchemaPSEHomeFollowUp followUpHourOfDay](self, "followUpHourOfDay"));
  [v3 setObject:v11 forKeyedSubscript:@"followUpHourOfDay"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_16:
  unsigned int v12 = [(PSESchemaPSEHomeFollowUp *)self followUpSource] - 1;
  if (v12 > 3) {
    v13 = @"PSEHOMEFOLLOWUPSOURCE_UNKNOWN";
  }
  else {
    v13 = off_1E5EBB970[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"followUpSource"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_20:
  unsigned int v14 = [(PSESchemaPSEHomeFollowUp *)self followUpType] - 1;
  if (v14 > 3) {
    v15 = @"PSEHOMEFOLLOWUPTYPE_UNKNOWN";
  }
  else {
    v15 = off_1E5EBB990[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"followUpType"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PSESchemaPSEHomeFollowUp isFollowUpInSameContainerAsSiriRequest](self, "isFollowUpInSameContainerAsSiriRequest"));
  [v3 setObject:v7 forKeyedSubscript:@"isFollowUpInSameContainerAsSiriRequest"];

LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_followUpType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_followUpSource;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_followUpAccessoryType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isFollowUpInSameContainerAsSiriRequest;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_followUpDayOfWeek;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_followUpHourOfDay;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_followUpDurationSinceSiriRequestInSeconds;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  $3323D48D798CB196FD9081BB92D01970 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&has)
  {
    int followUpType = self->_followUpType;
    if (followUpType != [v4 followUpType]) {
      goto LABEL_31;
    }
    $3323D48D798CB196FD9081BB92D01970 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_31;
  }
  if (v8)
  {
    int followUpSource = self->_followUpSource;
    if (followUpSource != [v4 followUpSource]) {
      goto LABEL_31;
    }
  }
  v10 = [(PSESchemaPSEHomeFollowUp *)self followUpAccessoryType];
  v11 = [v4 followUpAccessoryType];
  unsigned int v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_31;
  }
  uint64_t v13 = [(PSESchemaPSEHomeFollowUp *)self followUpAccessoryType];
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    v15 = [(PSESchemaPSEHomeFollowUp *)self followUpAccessoryType];
    objc_super v16 = [v4 followUpAccessoryType];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  $3323D48D798CB196FD9081BB92D01970 v18 = self->_has;
  int v19 = (*(unsigned int *)&v18 >> 2) & 1;
  unsigned int v20 = v4[40];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_31:
    BOOL v28 = 0;
    goto LABEL_32;
  }
  if (v19)
  {
    int isFollowUpInSameContainerAsSiriRequest = self->_isFollowUpInSameContainerAsSiriRequest;
    if (isFollowUpInSameContainerAsSiriRequest != [v4 isFollowUpInSameContainerAsSiriRequest])goto LABEL_31; {
    $3323D48D798CB196FD9081BB92D01970 v18 = self->_has;
    }
    unsigned int v20 = v4[40];
  }
  int v22 = (*(unsigned int *)&v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v22)
  {
    unsigned int followUpDayOfWeek = self->_followUpDayOfWeek;
    if (followUpDayOfWeek != [v4 followUpDayOfWeek]) {
      goto LABEL_31;
    }
    $3323D48D798CB196FD9081BB92D01970 v18 = self->_has;
    unsigned int v20 = v4[40];
  }
  int v24 = (*(unsigned int *)&v18 >> 4) & 1;
  if (v24 != ((v20 >> 4) & 1)) {
    goto LABEL_31;
  }
  if (v24)
  {
    unsigned int followUpHourOfDay = self->_followUpHourOfDay;
    if (followUpHourOfDay == [v4 followUpHourOfDay])
    {
      $3323D48D798CB196FD9081BB92D01970 v18 = self->_has;
      unsigned int v20 = v4[40];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  int v26 = (*(unsigned int *)&v18 >> 5) & 1;
  if (v26 != ((v20 >> 5) & 1)) {
    goto LABEL_31;
  }
  if (v26)
  {
    unsigned int followUpDurationSinceSiriRequestInSeconds = self->_followUpDurationSinceSiriRequestInSeconds;
    if (followUpDurationSinceSiriRequestInSeconds != [v4 followUpDurationSinceSiriRequestInSeconds])goto LABEL_31; {
  }
    }
  BOOL v28 = 1;
LABEL_32:

  return v28;
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
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(PSESchemaPSEHomeFollowUp *)self followUpAccessoryType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEHomeFollowUpReadFrom(self, (uint64_t)a3);
}

- (void)deleteFollowUpDurationSinceSiriRequestInSeconds
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasFollowUpDurationSinceSiriRequestInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFollowUpDurationSinceSiriRequestInSeconds
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFollowUpDurationSinceSiriRequestInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int followUpDurationSinceSiriRequestInSeconds = a3;
}

- (void)deleteFollowUpHourOfDay
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasFollowUpHourOfDay:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFollowUpHourOfDay
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFollowUpHourOfDay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int followUpHourOfDay = a3;
}

- (void)deleteFollowUpDayOfWeek
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasFollowUpDayOfWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFollowUpDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFollowUpDayOfWeek:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int followUpDayOfWeek = a3;
}

- (void)deleteIsFollowUpInSameContainerAsSiriRequest
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsFollowUpInSameContainerAsSiriRequest
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsFollowUpInSameContainerAsSiriRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isFollowUpInSameContainerAsSiriRequest = a3;
}

- (void)deleteFollowUpAccessoryType
{
}

- (BOOL)hasFollowUpAccessoryType
{
  return self->_followUpAccessoryType != 0;
}

- (void)deleteFollowUpSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasFollowUpSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFollowUpSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFollowUpSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int followUpSource = a3;
}

- (void)deleteFollowUpType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFollowUpType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFollowUpType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFollowUpType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int followUpType = a3;
}

@end