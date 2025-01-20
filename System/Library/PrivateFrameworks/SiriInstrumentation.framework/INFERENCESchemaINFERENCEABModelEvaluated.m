@interface INFERENCESchemaINFERENCEABModelEvaluated
- (BOOL)hasIsDecisionCorrect;
- (BOOL)hasIsModelConfirmation;
- (BOOL)hasIsModelDisambiguation;
- (BOOL)hasModelVersion;
- (BOOL)hasNumCandidateApps;
- (BOOL)hasProjectIntent;
- (BOOL)hasUserPersona;
- (BOOL)isDecisionCorrect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModelConfirmation;
- (BOOL)isModelDisambiguation;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEABModelEvaluated)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEABModelEvaluated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)numCandidateApps;
- (int)projectIntent;
- (int)userPersona;
- (unint64_t)hash;
- (unsigned)modelVersion;
- (void)deleteIsDecisionCorrect;
- (void)deleteIsModelConfirmation;
- (void)deleteIsModelDisambiguation;
- (void)deleteModelVersion;
- (void)deleteNumCandidateApps;
- (void)deleteProjectIntent;
- (void)deleteUserPersona;
- (void)setHasIsDecisionCorrect:(BOOL)a3;
- (void)setHasIsModelConfirmation:(BOOL)a3;
- (void)setHasIsModelDisambiguation:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasNumCandidateApps:(BOOL)a3;
- (void)setHasProjectIntent:(BOOL)a3;
- (void)setHasUserPersona:(BOOL)a3;
- (void)setIsDecisionCorrect:(BOOL)a3;
- (void)setIsModelConfirmation:(BOOL)a3;
- (void)setIsModelDisambiguation:(BOOL)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setNumCandidateApps:(int)a3;
- (void)setProjectIntent:(int)a3;
- (void)setUserPersona:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEABModelEvaluated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (BOOL)isModelConfirmation
{
  return self->_isModelConfirmation;
}

- (BOOL)isModelDisambiguation
{
  return self->_isModelDisambiguation;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)isDecisionCorrect
{
  return self->_isDecisionCorrect;
}

- (int)numCandidateApps
{
  return self->_numCandidateApps;
}

- (int)projectIntent
{
  return self->_projectIntent;
}

- (INFERENCESchemaINFERENCEABModelEvaluated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEABModelEvaluated;
  v5 = [(INFERENCESchemaINFERENCEABModelEvaluated *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"projectIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setProjectIntent:](v5, "setProjectIntent:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numCandidateApps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setNumCandidateApps:](v5, "setNumCandidateApps:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isDecisionCorrect"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsDecisionCorrect:](v5, "setIsDecisionCorrect:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setModelVersion:](v5, "setModelVersion:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isModelDisambiguation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelDisambiguation:](v5, "setIsModelDisambiguation:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isModelConfirmation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelConfirmation:](v5, "setIsModelConfirmation:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"userPersona"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelEvaluated setUserPersona:](v5, "setUserPersona:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEABModelEvaluated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEABModelEvaluated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEABModelEvaluated *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isDecisionCorrect](self, "isDecisionCorrect"));
    [v3 setObject:v5 forKeyedSubscript:@"isDecisionCorrect"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isModelConfirmation](self, "isModelConfirmation"));
  [v3 setObject:v6 forKeyedSubscript:@"isModelConfirmation"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isModelDisambiguation](self, "isModelDisambiguation"));
  [v3 setObject:v7 forKeyedSubscript:@"isModelDisambiguation"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEABModelEvaluated modelVersion](self, "modelVersion"));
  [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    unsigned int v10 = [(INFERENCESchemaINFERENCEABModelEvaluated *)self projectIntent] - 1;
    if (v10 > 0xB) {
      v11 = @"INFERENCEPROJECTINTENT_UNKNOWN";
    }
    else {
      v11 = off_1E5EBA3C8[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"projectIntent"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEABModelEvaluated numCandidateApps](self, "numCandidateApps"));
  [v3 setObject:v9 forKeyedSubscript:@"numCandidateApps"];

  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_18:
    unsigned int v12 = [(INFERENCESchemaINFERENCEABModelEvaluated *)self userPersona] - 1;
    if (v12 > 5) {
      v13 = @"INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN";
    }
    else {
      v13 = off_1E5EBA428[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"userPersona"];
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_projectIntent;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_numCandidateApps;
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
    uint64_t v4 = 2654435761 * self->_isDecisionCorrect;
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
    uint64_t v5 = 2654435761 * self->_modelVersion;
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
    uint64_t v6 = 2654435761 * self->_isModelDisambiguation;
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
  uint64_t v7 = 2654435761 * self->_isModelConfirmation;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_userPersona;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    int projectIntent = self->_projectIntent;
    if (projectIntent != [v4 projectIntent]) {
      goto LABEL_30;
    }
    $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    int numCandidateApps = self->_numCandidateApps;
    if (numCandidateApps != [v4 numCandidateApps]) {
      goto LABEL_30;
    }
    $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    int isDecisionCorrect = self->_isDecisionCorrect;
    if (isDecisionCorrect != [v4 isDecisionCorrect]) {
      goto LABEL_30;
    }
    $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v12)
  {
    unsigned int modelVersion = self->_modelVersion;
    if (modelVersion != [v4 modelVersion]) {
      goto LABEL_30;
    }
    $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v14)
  {
    int isModelDisambiguation = self->_isModelDisambiguation;
    if (isModelDisambiguation != [v4 isModelDisambiguation]) {
      goto LABEL_30;
    }
    $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_30;
  }
  if (v16)
  {
    int isModelConfirmation = self->_isModelConfirmation;
    if (isModelConfirmation == [v4 isModelConfirmation])
    {
      $B487C517CABEB199DF0C40E001CE4676 has = self->_has;
      unsigned int v6 = v4[32];
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
    int userPersona = self->_userPersona;
    if (userPersona != [v4 userPersona]) {
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
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEABModelEvaluatedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserPersona
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasUserPersona:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserPersona
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setUserPersona:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int userPersona = a3;
}

- (void)deleteIsModelConfirmation
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsModelConfirmation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsModelConfirmation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsModelConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isModelConfirmation = a3;
}

- (void)deleteIsModelDisambiguation
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsModelDisambiguation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsModelDisambiguation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsModelDisambiguation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isModelDisambiguation = a3;
}

- (void)deleteModelVersion
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModelVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int modelVersion = a3;
}

- (void)deleteIsDecisionCorrect
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsDecisionCorrect:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDecisionCorrect
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsDecisionCorrect:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isDecisionCorrect = a3;
}

- (void)deleteNumCandidateApps
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumCandidateApps:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumCandidateApps
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumCandidateApps:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numCandidateApps = a3;
}

- (void)deleteProjectIntent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProjectIntent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProjectIntent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProjectIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int projectIntent = a3;
}

@end