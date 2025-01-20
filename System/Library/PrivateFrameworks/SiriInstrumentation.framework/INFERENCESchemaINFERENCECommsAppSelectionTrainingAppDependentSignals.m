@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals
- (BOOL)hasAppTimeSpentAffinityScore;
- (BOOL)hasAppTimeSpentInSec;
- (BOOL)hasContactDependentSignals;
- (BOOL)hasIsFirstPartyApp;
- (BOOL)hasIsForegroundApp;
- (BOOL)hasIsResolvedApp;
- (BOOL)hasIsResolvedContactInApp;
- (BOOL)hasMessageSignals;
- (BOOL)hasPhoneCallSignals;
- (BOOL)hasTimeSinceAppContactLastLaunchedInSec;
- (BOOL)hasTimeSinceAppLastLaunchedInSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyApp;
- (BOOL)isForegroundApp;
- (BOOL)isResolvedApp;
- (BOOL)isResolvedContactInApp;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)messageSignals;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)phoneCallSignals;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)contactDependentSignals;
- (NSData)jsonData;
- (float)appTimeSpentAffinityScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)timeSinceAppContactLastLaunchedInSec;
- (int)timeSinceAppLastLaunchedInSec;
- (int64_t)appTimeSpentInSec;
- (unint64_t)hash;
- (void)deleteAppTimeSpentAffinityScore;
- (void)deleteAppTimeSpentInSec;
- (void)deleteContactDependentSignals;
- (void)deleteIsFirstPartyApp;
- (void)deleteIsForegroundApp;
- (void)deleteIsResolvedApp;
- (void)deleteIsResolvedContactInApp;
- (void)deleteMessageSignals;
- (void)deletePhoneCallSignals;
- (void)deleteTimeSinceAppContactLastLaunchedInSec;
- (void)deleteTimeSinceAppLastLaunchedInSec;
- (void)setAppTimeSpentAffinityScore:(float)a3;
- (void)setAppTimeSpentInSec:(int64_t)a3;
- (void)setContactDependentSignals:(id)a3;
- (void)setHasAppTimeSpentAffinityScore:(BOOL)a3;
- (void)setHasAppTimeSpentInSec:(BOOL)a3;
- (void)setHasContactDependentSignals:(BOOL)a3;
- (void)setHasIsFirstPartyApp:(BOOL)a3;
- (void)setHasIsForegroundApp:(BOOL)a3;
- (void)setHasIsResolvedApp:(BOOL)a3;
- (void)setHasIsResolvedContactInApp:(BOOL)a3;
- (void)setHasMessageSignals:(BOOL)a3;
- (void)setHasPhoneCallSignals:(BOOL)a3;
- (void)setHasTimeSinceAppContactLastLaunchedInSec:(BOOL)a3;
- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3;
- (void)setIsFirstPartyApp:(BOOL)a3;
- (void)setIsForegroundApp:(BOOL)a3;
- (void)setIsResolvedApp:(BOOL)a3;
- (void)setIsResolvedContactInApp:(BOOL)a3;
- (void)setMessageSignals:(id)a3;
- (void)setPhoneCallSignals:(id)a3;
- (void)setTimeSinceAppContactLastLaunchedInSec:(int)a3;
- (void)setTimeSinceAppLastLaunchedInSec:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self deleteMessageSignals];
  }
  v9 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self deletePhoneCallSignals];
  }
  v12 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self deleteContactDependentSignals];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDependentSignals, 0);
  objc_storeStrong((id *)&self->_phoneCallSignals, 0);
  objc_storeStrong((id *)&self->_messageSignals, 0);
}

- (void)setHasContactDependentSignals:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPhoneCallSignals:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasMessageSignals:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)timeSinceAppContactLastLaunchedInSec
{
  return self->_timeSinceAppContactLastLaunchedInSec;
}

- (int64_t)appTimeSpentInSec
{
  return self->_appTimeSpentInSec;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (void)setContactDependentSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)contactDependentSignals
{
  return self->_contactDependentSignals;
}

- (void)setPhoneCallSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)phoneCallSignals
{
  return self->_phoneCallSignals;
}

- (void)setMessageSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)messageSignals
{
  return self->_messageSignals;
}

- (int)timeSinceAppLastLaunchedInSec
{
  return self->_timeSinceAppLastLaunchedInSec;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (float)appTimeSpentAffinityScore
{
  return self->_appTimeSpentAffinityScore;
}

- (BOOL)isResolvedContactInApp
{
  return self->_isResolvedContactInApp;
}

- (BOOL)isResolvedApp
{
  return self->_isResolvedApp;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isResolvedApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedApp:](v5, "setIsResolvedApp:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isResolvedContactInApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsResolvedContactInApp:](v5, "setIsResolvedContactInApp:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"appTimeSpentAffinityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentAffinityScore:](v5, "setAppTimeSpentAffinityScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"isForegroundApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", [v9 BOOLValue]);
    }
    v26 = v7;
    v27 = v6;
    v10 = [v4 objectForKeyedSubscript:@"timeSinceAppLastLaunchedInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppLastLaunchedInSec:](v5, "setTimeSinceAppLastLaunchedInSec:", [v10 intValue]);
    }
    v25 = v10;
    uint64_t v11 = [v4 objectForKeyedSubscript:@"messageSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals alloc] initWithDictionary:v11];
      [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)v5 setMessageSignals:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"phoneCallSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals alloc] initWithDictionary:v13];
      [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)v5 setPhoneCallSignals:v14];
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"contactDependentSignals", v11);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v16 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals alloc] initWithDictionary:v15];
      [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)v5 setContactDependentSignals:v16];
    }
    v17 = v9;
    v18 = [v4 objectForKeyedSubscript:@"isFirstPartyApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setIsFirstPartyApp:](v5, "setIsFirstPartyApp:", [v18 BOOLValue]);
    }
    v19 = v8;
    v20 = [v4 objectForKeyedSubscript:@"appTimeSpentInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setAppTimeSpentInSec:](v5, "setAppTimeSpentInSec:", [v20 longLongValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"timeSinceAppContactLastLaunchedInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals setTimeSinceAppContactLastLaunchedInSec:](v5, "setTimeSinceAppContactLastLaunchedInSec:", [v21 intValue]);
    }
    v22 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self dictionaryRepresentation];
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
    v5 = NSNumber;
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self appTimeSpentAffinityScore];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"appTimeSpentAffinityScore"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals appTimeSpentInSec](self, "appTimeSpentInSec"));
    [v3 setObject:v7 forKeyedSubscript:@"appTimeSpentInSec"];
  }
  if (self->_contactDependentSignals)
  {
    int v8 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"contactDependentSignals"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"contactDependentSignals"];
    }
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isFirstPartyApp](self, "isFirstPartyApp"));
    [v3 setObject:v15 forKeyedSubscript:@"isFirstPartyApp"];

    char v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_12:
      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  objc_super v16 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  [v3 setObject:v16 forKeyedSubscript:@"isForegroundApp"];

  char v11 = (char)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_13:
    if ((v11 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_20:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isResolvedApp](self, "isResolvedApp"));
  [v3 setObject:v17 forKeyedSubscript:@"isResolvedApp"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals isResolvedContactInApp](self, "isResolvedContactInApp"));
    [v3 setObject:v12 forKeyedSubscript:@"isResolvedContactInApp"];
  }
LABEL_15:
  if (self->_messageSignals)
  {
    v13 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"messageSignals"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"messageSignals"];
    }
  }
  if (self->_phoneCallSignals)
  {
    v19 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"phoneCallSignals"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"phoneCallSignals"];
    }
  }
  $629F197D9C6E6A37295ABA71DDD7F7A9 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v22 & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals timeSinceAppContactLastLaunchedInSec](self, "timeSinceAppContactLastLaunchedInSec"));
  [v3 setObject:v25 forKeyedSubscript:@"timeSinceAppContactLastLaunchedInSec"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_31:
    v23 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals timeSinceAppLastLaunchedInSec](self, "timeSinceAppLastLaunchedInSec"));
    [v3 setObject:v23 forKeyedSubscript:@"timeSinceAppLastLaunchedInSec"];
  }
LABEL_32:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_isResolvedApp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isResolvedContactInApp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float appTimeSpentAffinityScore = self->_appTimeSpentAffinityScore;
  double v7 = appTimeSpentAffinityScore;
  if (appTimeSpentAffinityScore < 0.0) {
    double v7 = -appTimeSpentAffinityScore;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isForegroundApp;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_15:
      uint64_t v12 = 2654435761 * self->_timeSinceAppLastLaunchedInSec;
      goto LABEL_18;
    }
  }
  uint64_t v12 = 0;
LABEL_18:
  unint64_t v13 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self->_messageSignals hash];
  unint64_t v14 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self->_phoneCallSignals hash];
  unint64_t v15 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self->_contactDependentSignals hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v18 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  uint64_t v16 = 2654435761 * self->_isFirstPartyApp;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v17 = 2654435761 * self->_appTimeSpentInSec;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v18 = 2654435761 * self->_timeSinceAppContactLastLaunchedInSec;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  $629F197D9C6E6A37295ABA71DDD7F7A9 has = self->_has;
  unsigned int v6 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&has)
  {
    int isResolvedApp = self->_isResolvedApp;
    if (isResolvedApp != [v4 isResolvedApp]) {
      goto LABEL_36;
    }
    $629F197D9C6E6A37295ABA71DDD7F7A9 has = self->_has;
    unsigned int v6 = v4[68];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isResolvedContactInApp = self->_isResolvedContactInApp;
      if (isResolvedContactInApp != [v4 isResolvedContactInApp]) {
        goto LABEL_36;
      }
      $629F197D9C6E6A37295ABA71DDD7F7A9 has = self->_has;
      unsigned int v6 = v4[68];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        float appTimeSpentAffinityScore = self->_appTimeSpentAffinityScore;
        [v4 appTimeSpentAffinityScore];
        if (appTimeSpentAffinityScore != v12) {
          goto LABEL_36;
        }
        $629F197D9C6E6A37295ABA71DDD7F7A9 has = self->_has;
        unsigned int v6 = v4[68];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          int isForegroundApp = self->_isForegroundApp;
          if (isForegroundApp != [v4 isForegroundApp]) {
            goto LABEL_36;
          }
          $629F197D9C6E6A37295ABA71DDD7F7A9 has = self->_has;
          unsigned int v6 = v4[68];
        }
        int v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 != ((v6 >> 4) & 1)) {
          goto LABEL_36;
        }
        if (v15)
        {
          int timeSinceAppLastLaunchedInSec = self->_timeSinceAppLastLaunchedInSec;
          if (timeSinceAppLastLaunchedInSec != [v4 timeSinceAppLastLaunchedInSec]) {
            goto LABEL_36;
          }
        }
        uint64_t v17 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
        uint64_t v18 = [v4 messageSignals];
        if ((v17 == 0) == (v18 != 0)) {
          goto LABEL_35;
        }
        uint64_t v19 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
          $629F197D9C6E6A37295ABA71DDD7F7A9 v22 = [v4 messageSignals];
          int v23 = [v21 isEqual:v22];

          if (!v23) {
            goto LABEL_36;
          }
        }
        else
        {
        }
        uint64_t v17 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
        uint64_t v18 = [v4 phoneCallSignals];
        if ((v17 == 0) == (v18 != 0)) {
          goto LABEL_35;
        }
        uint64_t v24 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
        if (v24)
        {
          v25 = (void *)v24;
          v26 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
          v27 = [v4 phoneCallSignals];
          int v28 = [v26 isEqual:v27];

          if (!v28) {
            goto LABEL_36;
          }
        }
        else
        {
        }
        uint64_t v17 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
        uint64_t v18 = [v4 contactDependentSignals];
        if ((v17 == 0) == (v18 != 0))
        {
LABEL_35:

          goto LABEL_36;
        }
        uint64_t v29 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
        if (v29)
        {
          v30 = (void *)v29;
          v31 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
          v32 = [v4 contactDependentSignals];
          int v33 = [v31 isEqual:v32];

          if (!v33) {
            goto LABEL_36;
          }
        }
        else
        {
        }
        $629F197D9C6E6A37295ABA71DDD7F7A9 v36 = self->_has;
        int v37 = (*(unsigned int *)&v36 >> 5) & 1;
        unsigned int v38 = v4[68];
        if (v37 == ((v38 >> 5) & 1))
        {
          if (v37)
          {
            int isFirstPartyApp = self->_isFirstPartyApp;
            if (isFirstPartyApp != [v4 isFirstPartyApp]) {
              goto LABEL_36;
            }
            $629F197D9C6E6A37295ABA71DDD7F7A9 v36 = self->_has;
            unsigned int v38 = v4[68];
          }
          int v40 = (*(unsigned int *)&v36 >> 6) & 1;
          if (v40 == ((v38 >> 6) & 1))
          {
            if (v40)
            {
              int64_t appTimeSpentInSec = self->_appTimeSpentInSec;
              if (appTimeSpentInSec != [v4 appTimeSpentInSec]) {
                goto LABEL_36;
              }
              $629F197D9C6E6A37295ABA71DDD7F7A9 v36 = self->_has;
              unsigned int v38 = v4[68];
            }
            if (((v38 ^ *(_DWORD *)&v36) & 0x80) == 0)
            {
              if ((*(unsigned char *)&v36 & 0x80) == 0
                || (int timeSinceAppContactLastLaunchedInSec = self->_timeSinceAppContactLastLaunchedInSec,
                    timeSinceAppContactLastLaunchedInSec == [v4 timeSinceAppContactLastLaunchedInSec]))
              {
                BOOL v34 = 1;
                goto LABEL_37;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  BOOL v34 = 0;
LABEL_37:

  return v34;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
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
      goto LABEL_21;
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
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  uint64_t v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];

  if (v5)
  {
    unsigned int v6 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self messageSignals];
    PBDataWriterWriteSubmessage();
  }
  double v7 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];

  if (v7)
  {
    int v8 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self phoneCallSignals];
    PBDataWriterWriteSubmessage();
  }
  double v9 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];

  if (v9)
  {
    int v10 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignals *)self contactDependentSignals];
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_15;
    }
LABEL_25:
    PBDataWriterWriteInt64Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
  PBDataWriterWriteBOOLField();
  char v11 = (char)self->_has;
  if ((v11 & 0x40) != 0) {
    goto LABEL_25;
  }
LABEL_15:
  if ((v11 & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTimeSinceAppContactLastLaunchedInSec
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasTimeSinceAppContactLastLaunchedInSec:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTimeSinceAppContactLastLaunchedInSec
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTimeSinceAppContactLastLaunchedInSec:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int timeSinceAppContactLastLaunchedInSec = a3;
}

- (void)deleteAppTimeSpentInSec
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasAppTimeSpentInSec:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAppTimeSpentInSec
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAppTimeSpentInSec:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int64_t appTimeSpentInSec = a3;
}

- (void)deleteIsFirstPartyApp
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsFirstPartyApp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsFirstPartyApp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsFirstPartyApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isFirstPartyApp = a3;
}

- (void)deleteContactDependentSignals
{
}

- (BOOL)hasContactDependentSignals
{
  return self->_contactDependentSignals != 0;
}

- (void)deletePhoneCallSignals
{
}

- (BOOL)hasPhoneCallSignals
{
  return self->_phoneCallSignals != 0;
}

- (void)deleteMessageSignals
{
}

- (BOOL)hasMessageSignals
{
  return self->_messageSignals != 0;
}

- (void)deleteTimeSinceAppLastLaunchedInSec
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeSinceAppLastLaunchedInSec
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimeSinceAppLastLaunchedInSec:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int timeSinceAppLastLaunchedInSec = a3;
}

- (void)deleteIsForegroundApp
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsForegroundApp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsForegroundApp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isForegroundApp = a3;
}

- (void)deleteAppTimeSpentAffinityScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAppTimeSpentAffinityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppTimeSpentAffinityScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppTimeSpentAffinityScore:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float appTimeSpentAffinityScore = a3;
}

- (void)deleteIsResolvedContactInApp
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsResolvedContactInApp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsResolvedContactInApp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsResolvedContactInApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isResolvedContactInApp = a3;
}

- (void)deleteIsResolvedApp
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsResolvedApp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsResolvedApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsResolvedApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isResolvedApp = a3;
}

@end