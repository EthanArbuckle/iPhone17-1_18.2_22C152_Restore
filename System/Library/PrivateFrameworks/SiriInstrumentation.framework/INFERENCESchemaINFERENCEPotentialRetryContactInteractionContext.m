@interface INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext
- (BOOL)hasInteractionDurationInSecBucket;
- (BOOL)hasIsExactMatchPriorSiriContactDisplayName;
- (BOOL)hasIsExactMatchPriorSiriContactFamilyName;
- (BOOL)hasIsExactMatchPriorSiriContactGivenName;
- (BOOL)hasIsExactMatchPriorSiriContactHandleValue;
- (BOOL)hasIsExactMatchPriorSiriContactId;
- (BOOL)hasPotentialRetryIntervalInSecBucket;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatchPriorSiriContactDisplayName;
- (BOOL)isExactMatchPriorSiriContactFamilyName;
- (BOOL)isExactMatchPriorSiriContactGivenName;
- (BOOL)isExactMatchPriorSiriContactHandleValue;
- (BOOL)isExactMatchPriorSiriContactId;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)interactionDurationInSecBucket;
- (unsigned)potentialRetryIntervalInSecBucket;
- (void)deleteInteractionDurationInSecBucket;
- (void)deleteIsExactMatchPriorSiriContactDisplayName;
- (void)deleteIsExactMatchPriorSiriContactFamilyName;
- (void)deleteIsExactMatchPriorSiriContactGivenName;
- (void)deleteIsExactMatchPriorSiriContactHandleValue;
- (void)deleteIsExactMatchPriorSiriContactId;
- (void)deletePotentialRetryIntervalInSecBucket;
- (void)setHasInteractionDurationInSecBucket:(BOOL)a3;
- (void)setHasIsExactMatchPriorSiriContactDisplayName:(BOOL)a3;
- (void)setHasIsExactMatchPriorSiriContactFamilyName:(BOOL)a3;
- (void)setHasIsExactMatchPriorSiriContactGivenName:(BOOL)a3;
- (void)setHasIsExactMatchPriorSiriContactHandleValue:(BOOL)a3;
- (void)setHasIsExactMatchPriorSiriContactId:(BOOL)a3;
- (void)setHasPotentialRetryIntervalInSecBucket:(BOOL)a3;
- (void)setInteractionDurationInSecBucket:(unsigned int)a3;
- (void)setIsExactMatchPriorSiriContactDisplayName:(BOOL)a3;
- (void)setIsExactMatchPriorSiriContactFamilyName:(BOOL)a3;
- (void)setIsExactMatchPriorSiriContactGivenName:(BOOL)a3;
- (void)setIsExactMatchPriorSiriContactHandleValue:(BOOL)a3;
- (void)setIsExactMatchPriorSiriContactId:(BOOL)a3;
- (void)setPotentialRetryIntervalInSecBucket:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)potentialRetryIntervalInSecBucket
{
  return self->_potentialRetryIntervalInSecBucket;
}

- (unsigned)interactionDurationInSecBucket
{
  return self->_interactionDurationInSecBucket;
}

- (BOOL)isExactMatchPriorSiriContactHandleValue
{
  return self->_isExactMatchPriorSiriContactHandleValue;
}

- (BOOL)isExactMatchPriorSiriContactId
{
  return self->_isExactMatchPriorSiriContactId;
}

- (BOOL)isExactMatchPriorSiriContactDisplayName
{
  return self->_isExactMatchPriorSiriContactDisplayName;
}

- (BOOL)isExactMatchPriorSiriContactFamilyName
{
  return self->_isExactMatchPriorSiriContactFamilyName;
}

- (BOOL)isExactMatchPriorSiriContactGivenName
{
  return self->_isExactMatchPriorSiriContactGivenName;
}

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext;
  v5 = [(INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isExactMatchPriorSiriContactGivenName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactGivenName:](v5, "setIsExactMatchPriorSiriContactGivenName:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isExactMatchPriorSiriContactFamilyName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactFamilyName:](v5, "setIsExactMatchPriorSiriContactFamilyName:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isExactMatchPriorSiriContactDisplayName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactDisplayName:](v5, "setIsExactMatchPriorSiriContactDisplayName:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isExactMatchPriorSiriContactId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactId:](v5, "setIsExactMatchPriorSiriContactId:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isExactMatchPriorSiriContactHandleValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactHandleValue:](v5, "setIsExactMatchPriorSiriContactHandleValue:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"interactionDurationInSecBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setInteractionDurationInSecBucket:](v5, "setInteractionDurationInSecBucket:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"potentialRetryIntervalInSecBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setPotentialRetryIntervalInSecBucket:](v5, "setPotentialRetryIntervalInSecBucket:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *)self dictionaryRepresentation];
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
  if ((has & 0x20) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext interactionDurationInSecBucket](self, "interactionDurationInSecBucket"));
    [v3 setObject:v7 forKeyedSubscript:@"interactionDurationInSecBucket"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactDisplayName](self, "isExactMatchPriorSiriContactDisplayName"));
  [v3 setObject:v8 forKeyedSubscript:@"isExactMatchPriorSiriContactDisplayName"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactFamilyName](self, "isExactMatchPriorSiriContactFamilyName"));
  [v3 setObject:v9 forKeyedSubscript:@"isExactMatchPriorSiriContactFamilyName"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactGivenName](self, "isExactMatchPriorSiriContactGivenName"));
  [v3 setObject:v10 forKeyedSubscript:@"isExactMatchPriorSiriContactGivenName"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactHandleValue](self, "isExactMatchPriorSiriContactHandleValue"));
  [v3 setObject:v11 forKeyedSubscript:@"isExactMatchPriorSiriContactHandleValue"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactId](self, "isExactMatchPriorSiriContactId"));
  [v3 setObject:v12 forKeyedSubscript:@"isExactMatchPriorSiriContactId"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext potentialRetryIntervalInSecBucket](self, "potentialRetryIntervalInSecBucket"));
    [v3 setObject:v5 forKeyedSubscript:@"potentialRetryIntervalInSecBucket"];
  }
LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isExactMatchPriorSiriContactGivenName;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isExactMatchPriorSiriContactFamilyName;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
    uint64_t v4 = 2654435761 * self->_isExactMatchPriorSiriContactDisplayName;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isExactMatchPriorSiriContactId;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isExactMatchPriorSiriContactHandleValue;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_interactionDurationInSecBucket;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_potentialRetryIntervalInSecBucket;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    int isExactMatchPriorSiriContactGivenName = self->_isExactMatchPriorSiriContactGivenName;
    if (isExactMatchPriorSiriContactGivenName != [v4 isExactMatchPriorSiriContactGivenName])goto LABEL_30; {
    $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
    }
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    int isExactMatchPriorSiriContactFamilyName = self->_isExactMatchPriorSiriContactFamilyName;
    if (isExactMatchPriorSiriContactFamilyName != [v4 isExactMatchPriorSiriContactFamilyName])goto LABEL_30; {
    $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
    }
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    int isExactMatchPriorSiriContactDisplayName = self->_isExactMatchPriorSiriContactDisplayName;
    if (isExactMatchPriorSiriContactDisplayName != [v4 isExactMatchPriorSiriContactDisplayName])goto LABEL_30; {
    $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
    }
    unsigned int v6 = v4[24];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v12)
  {
    int isExactMatchPriorSiriContactId = self->_isExactMatchPriorSiriContactId;
    if (isExactMatchPriorSiriContactId != [v4 isExactMatchPriorSiriContactId]) {
      goto LABEL_30;
    }
    $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v14)
  {
    int isExactMatchPriorSiriContactHandleValue = self->_isExactMatchPriorSiriContactHandleValue;
    if (isExactMatchPriorSiriContactHandleValue != [v4 isExactMatchPriorSiriContactHandleValue])goto LABEL_30; {
    $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
    }
    unsigned int v6 = v4[24];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_30;
  }
  if (v16)
  {
    unsigned int interactionDurationInSecBucket = self->_interactionDurationInSecBucket;
    if (interactionDurationInSecBucket == [v4 interactionDurationInSecBucket])
    {
      $1DDC0A022069D6190EEA24EBC7F6B3B0 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_26;
    }
LABEL_30:
    BOOL v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_30;
  }
  if (v18)
  {
    unsigned int potentialRetryIntervalInSecBucket = self->_potentialRetryIntervalInSecBucket;
    if (potentialRetryIntervalInSecBucket != [v4 potentialRetryIntervalInSecBucket]) {
      goto LABEL_30;
    }
  }
  BOOL v20 = 1;
LABEL_31:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
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
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPotentialRetryContactInteractionContextReadFrom(self, (uint64_t)a3);
}

- (void)deletePotentialRetryIntervalInSecBucket
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasPotentialRetryIntervalInSecBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPotentialRetryIntervalInSecBucket
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPotentialRetryIntervalInSecBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int potentialRetryIntervalInSecBucket = a3;
}

- (void)deleteInteractionDurationInSecBucket
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasInteractionDurationInSecBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasInteractionDurationInSecBucket
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setInteractionDurationInSecBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int interactionDurationInSecBucket = a3;
}

- (void)deleteIsExactMatchPriorSiriContactHandleValue
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsExactMatchPriorSiriContactHandleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsExactMatchPriorSiriContactHandleValue
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsExactMatchPriorSiriContactHandleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isExactMatchPriorSiriContactHandleValue = a3;
}

- (void)deleteIsExactMatchPriorSiriContactId
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsExactMatchPriorSiriContactId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsExactMatchPriorSiriContactId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsExactMatchPriorSiriContactId:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isExactMatchPriorSiriContactId = a3;
}

- (void)deleteIsExactMatchPriorSiriContactDisplayName
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsExactMatchPriorSiriContactDisplayName:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExactMatchPriorSiriContactDisplayName
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsExactMatchPriorSiriContactDisplayName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isExactMatchPriorSiriContactDisplayName = a3;
}

- (void)deleteIsExactMatchPriorSiriContactFamilyName
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsExactMatchPriorSiriContactFamilyName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsExactMatchPriorSiriContactFamilyName
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsExactMatchPriorSiriContactFamilyName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isExactMatchPriorSiriContactFamilyName = a3;
}

- (void)deleteIsExactMatchPriorSiriContactGivenName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsExactMatchPriorSiriContactGivenName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactGivenName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsExactMatchPriorSiriContactGivenName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isExactMatchPriorSiriContactGivenName = a3;
}

@end