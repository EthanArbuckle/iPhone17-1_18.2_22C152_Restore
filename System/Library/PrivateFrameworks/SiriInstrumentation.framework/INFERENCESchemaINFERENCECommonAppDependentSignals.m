@interface INFERENCESchemaINFERENCECommonAppDependentSignals
- (BOOL)hasAppBundleId;
- (BOOL)hasAppDependentEntityFrequencyAndRecencySignals;
- (BOOL)hasAppDependentFrequencyAndRecencySignals;
- (BOOL)hasAppScoreFromModel;
- (BOOL)hasCompoundActiveBundleScore;
- (BOOL)hasIsFirstPartyBundle;
- (BOOL)hasIsForegroundApp;
- (BOOL)hasIsResolvedApp;
- (BOOL)hasTimeSinceAppLastLaunchedInSec;
- (BOOL)hasTimeSpentByUserInAppToday;
- (BOOL)hasTotalTimeSpentByUserInAppPerDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyBundle;
- (BOOL)isForegroundApp;
- (BOOL)isResolvedApp;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)appDependentEntityFrequencyAndRecencySignals;
- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)appDependentFrequencyAndRecencySignals;
- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)appBundleId;
- (double)compoundActiveBundleScore;
- (float)appScoreFromModel;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)timeSinceAppLastLaunchedInSec;
- (unint64_t)hash;
- (unsigned)timeSpentByUserInAppToday;
- (unsigned)totalTimeSpentByUserInAppPerDay;
- (void)deleteAppBundleId;
- (void)deleteAppDependentEntityFrequencyAndRecencySignals;
- (void)deleteAppDependentFrequencyAndRecencySignals;
- (void)deleteAppScoreFromModel;
- (void)deleteCompoundActiveBundleScore;
- (void)deleteIsFirstPartyBundle;
- (void)deleteIsForegroundApp;
- (void)deleteIsResolvedApp;
- (void)deleteTimeSinceAppLastLaunchedInSec;
- (void)deleteTimeSpentByUserInAppToday;
- (void)deleteTotalTimeSpentByUserInAppPerDay;
- (void)setAppBundleId:(id)a3;
- (void)setAppDependentEntityFrequencyAndRecencySignals:(id)a3;
- (void)setAppDependentFrequencyAndRecencySignals:(id)a3;
- (void)setAppScoreFromModel:(float)a3;
- (void)setCompoundActiveBundleScore:(double)a3;
- (void)setHasAppBundleId:(BOOL)a3;
- (void)setHasAppDependentEntityFrequencyAndRecencySignals:(BOOL)a3;
- (void)setHasAppDependentFrequencyAndRecencySignals:(BOOL)a3;
- (void)setHasAppScoreFromModel:(BOOL)a3;
- (void)setHasCompoundActiveBundleScore:(BOOL)a3;
- (void)setHasIsFirstPartyBundle:(BOOL)a3;
- (void)setHasIsForegroundApp:(BOOL)a3;
- (void)setHasIsResolvedApp:(BOOL)a3;
- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3;
- (void)setHasTimeSpentByUserInAppToday:(BOOL)a3;
- (void)setHasTotalTimeSpentByUserInAppPerDay:(BOOL)a3;
- (void)setIsFirstPartyBundle:(BOOL)a3;
- (void)setIsForegroundApp:(BOOL)a3;
- (void)setIsResolvedApp:(BOOL)a3;
- (void)setTimeSinceAppLastLaunchedInSec:(int)a3;
- (void)setTimeSpentByUserInAppToday:(unsigned int)a3;
- (void)setTotalTimeSpentByUserInAppPerDay:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommonAppDependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentSignals;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self deleteAppDependentFrequencyAndRecencySignals];
  }
  v9 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self deleteAppDependentEntityFrequencyAndRecencySignals];
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
  objc_storeStrong((id *)&self->_appDependentEntityFrequencyAndRecencySignals, 0);
  objc_storeStrong((id *)&self->_appDependentFrequencyAndRecencySignals, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)setHasAppDependentEntityFrequencyAndRecencySignals:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAppDependentFrequencyAndRecencySignals:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAppDependentEntityFrequencyAndRecencySignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)appDependentEntityFrequencyAndRecencySignals
{
  return self->_appDependentEntityFrequencyAndRecencySignals;
}

- (void)setAppDependentFrequencyAndRecencySignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)appDependentFrequencyAndRecencySignals
{
  return self->_appDependentFrequencyAndRecencySignals;
}

- (int)timeSinceAppLastLaunchedInSec
{
  return self->_timeSinceAppLastLaunchedInSec;
}

- (unsigned)timeSpentByUserInAppToday
{
  return self->_timeSpentByUserInAppToday;
}

- (unsigned)totalTimeSpentByUserInAppPerDay
{
  return self->_totalTimeSpentByUserInAppPerDay;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (float)appScoreFromModel
{
  return self->_appScoreFromModel;
}

- (BOOL)isResolvedApp
{
  return self->_isResolvedApp;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (BOOL)isFirstPartyBundle
{
  return self->_isFirstPartyBundle;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentSignals;
  v5 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCECommonAppDependentSignals *)v5 setAppBundleId:v7];
    }
    v25 = v6;
    int v8 = [v4 objectForKeyedSubscript:@"isFirstPartyBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsFirstPartyBundle:](v5, "setIsFirstPartyBundle:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isForegroundApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isResolvedApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setIsResolvedApp:](v5, "setIsResolvedApp:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"appScoreFromModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setAppScoreFromModel:](v5, "setAppScoreFromModel:");
    }
    v12 = [v4 objectForKeyedSubscript:@"compoundActiveBundleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setCompoundActiveBundleScore:](v5, "setCompoundActiveBundleScore:");
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"totalTimeSpentByUserInAppPerDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTotalTimeSpentByUserInAppPerDay:](v5, "setTotalTimeSpentByUserInAppPerDay:", [v13 unsignedIntValue]);
    }
    v24 = v8;
    v14 = [v4 objectForKeyedSubscript:@"timeSpentByUserInAppToday"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSpentByUserInAppToday:](v5, "setTimeSpentByUserInAppToday:", [v14 unsignedIntValue]);
    }
    v23 = v9;
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"timeSinceAppLastLaunchedInSec", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentSignals setTimeSinceAppLastLaunchedInSec:](v5, "setTimeSinceAppLastLaunchedInSec:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"appDependentFrequencyAndRecencySignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals alloc] initWithDictionary:v16];
      [(INFERENCESchemaINFERENCECommonAppDependentSignals *)v5 setAppDependentFrequencyAndRecencySignals:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"appDependentEntityFrequencyAndRecencySignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals alloc] initWithDictionary:v18];
      [(INFERENCESchemaINFERENCECommonAppDependentSignals *)v5 setAppDependentEntityFrequencyAndRecencySignals:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self dictionaryRepresentation];
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
  if (self->_appBundleId)
  {
    id v4 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appBundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleId"];
  }
  if (self->_appDependentEntityFrequencyAndRecencySignals)
  {
    v6 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"appDependentEntityFrequencyAndRecencySignals"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"appDependentEntityFrequencyAndRecencySignals"];
    }
  }
  if (self->_appDependentFrequencyAndRecencySignals)
  {
    v9 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"appDependentFrequencyAndRecencySignals"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"appDependentFrequencyAndRecencySignals"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v15 = NSNumber;
    [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appScoreFromModel];
    v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"appScoreFromModel"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_15;
  }
  v17 = NSNumber;
  [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self compoundActiveBundleScore];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"compoundActiveBundleScore"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_16:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isFirstPartyBundle](self, "isFirstPartyBundle"));
  [v3 setObject:v19 forKeyedSubscript:@"isFirstPartyBundle"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  [v3 setObject:v20 forKeyedSubscript:@"isForegroundApp"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppDependentSignals isResolvedApp](self, "isResolvedApp"));
  [v3 setObject:v21 forKeyedSubscript:@"isResolvedApp"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_30:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals timeSinceAppLastLaunchedInSec](self, "timeSinceAppLastLaunchedInSec"));
  [v3 setObject:v22 forKeyedSubscript:@"timeSinceAppLastLaunchedInSec"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_31:
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals timeSpentByUserInAppToday](self, "timeSpentByUserInAppToday"));
  [v3 setObject:v23 forKeyedSubscript:@"timeSpentByUserInAppToday"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_21:
    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppDependentSignals totalTimeSpentByUserInAppPerDay](self, "totalTimeSpentByUserInAppPerDay"));
    [v3 setObject:v13 forKeyedSubscript:@"totalTimeSpentByUserInAppPerDay"];
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleId hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_isFirstPartyBundle;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_isForegroundApp;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_isResolvedApp;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float appScoreFromModel = self->_appScoreFromModel;
  double v9 = appScoreFromModel;
  if (appScoreFromModel < 0.0) {
    double v9 = -appScoreFromModel;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    double compoundActiveBundleScore = self->_compoundActiveBundleScore;
    double v15 = -compoundActiveBundleScore;
    if (compoundActiveBundleScore >= 0.0) {
      double v15 = self->_compoundActiveBundleScore;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 0x20) == 0)
  {
    uint64_t v18 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v19 = 0;
    if (has < 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v20 = 0;
    goto LABEL_30;
  }
  uint64_t v18 = 2654435761 * self->_totalTimeSpentByUserInAppPerDay;
  if ((has & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v19 = 2654435761 * self->_timeSpentByUserInAppToday;
  if ((has & 0x80) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v20 = 2654435761 * self->_timeSinceAppLastLaunchedInSec;
LABEL_30:
  unint64_t v21 = v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ [(INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *)self->_appDependentFrequencyAndRecencySignals hash];
  return v21 ^ [(INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *)self->_appDependentEntityFrequencyAndRecencySignals hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appBundleId];
  uint64_t v6 = [v4 appBundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appBundleId];
  if (v7)
  {
    int v8 = (void *)v7;
    double v9 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appBundleId];
    long double v10 = [v4 appBundleId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  $EDD110F34301AB61D693967E36C3E96A has = self->_has;
  unsigned int v13 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_48;
  }
  if (*(unsigned char *)&has)
  {
    int isFirstPartyBundle = self->_isFirstPartyBundle;
    if (isFirstPartyBundle != [v4 isFirstPartyBundle]) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_48;
  }
  if (v15)
  {
    int isForegroundApp = self->_isForegroundApp;
    if (isForegroundApp != [v4 isForegroundApp]) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_48;
  }
  if (v17)
  {
    int isResolvedApp = self->_isResolvedApp;
    if (isResolvedApp != [v4 isResolvedApp]) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_48;
  }
  if (v19)
  {
    float appScoreFromModel = self->_appScoreFromModel;
    [v4 appScoreFromModel];
    if (appScoreFromModel != v21) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v13 >> 4) & 1)) {
    goto LABEL_48;
  }
  if (v22)
  {
    double compoundActiveBundleScore = self->_compoundActiveBundleScore;
    [v4 compoundActiveBundleScore];
    if (compoundActiveBundleScore != v24) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v25 = (*(unsigned int *)&has >> 5) & 1;
  if (v25 != ((v13 >> 5) & 1)) {
    goto LABEL_48;
  }
  if (v25)
  {
    unsigned int totalTimeSpentByUserInAppPerDay = self->_totalTimeSpentByUserInAppPerDay;
    if (totalTimeSpentByUserInAppPerDay != [v4 totalTimeSpentByUserInAppPerDay]) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  int v27 = (*(unsigned int *)&has >> 6) & 1;
  if (v27 != ((v13 >> 6) & 1)) {
    goto LABEL_48;
  }
  if (v27)
  {
    unsigned int timeSpentByUserInAppToday = self->_timeSpentByUserInAppToday;
    if (timeSpentByUserInAppToday != [v4 timeSpentByUserInAppToday]) {
      goto LABEL_48;
    }
    $EDD110F34301AB61D693967E36C3E96A has = self->_has;
    unsigned int v13 = v4[64];
  }
  if (((v13 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    int timeSinceAppLastLaunchedInSec = self->_timeSinceAppLastLaunchedInSec;
    if (timeSinceAppLastLaunchedInSec != [v4 timeSinceAppLastLaunchedInSec]) {
      goto LABEL_48;
    }
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
  uint64_t v6 = [v4 appDependentFrequencyAndRecencySignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v30 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
    v33 = [v4 appDependentFrequencyAndRecencySignals];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
  uint64_t v6 = [v4 appDependentEntityFrequencyAndRecencySignals];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_47:

    goto LABEL_48;
  }
  uint64_t v35 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
  if (!v35)
  {

LABEL_51:
    BOOL v40 = 1;
    goto LABEL_49;
  }
  v36 = (void *)v35;
  v37 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
  v38 = [v4 appDependentEntityFrequencyAndRecencySignals];
  char v39 = [v37 isEqual:v38];

  if (v39) {
    goto LABEL_51;
  }
LABEL_48:
  BOOL v40 = 0;
LABEL_49:

  return v40;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appBundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_24:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_10:
  if ((has & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
LABEL_11:
  uint64_t v6 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];

  if (v6)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentFrequencyAndRecencySignals];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];

  double v9 = v11;
  if (v8)
  {
    long double v10 = [(INFERENCESchemaINFERENCECommonAppDependentSignals *)self appDependentEntityFrequencyAndRecencySignals];
    PBDataWriterWriteSubmessage();

    double v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAppDependentEntityFrequencyAndRecencySignals
{
}

- (BOOL)hasAppDependentEntityFrequencyAndRecencySignals
{
  return self->_appDependentEntityFrequencyAndRecencySignals != 0;
}

- (void)deleteAppDependentFrequencyAndRecencySignals
{
}

- (BOOL)hasAppDependentFrequencyAndRecencySignals
{
  return self->_appDependentFrequencyAndRecencySignals != 0;
}

- (void)deleteTimeSinceAppLastLaunchedInSec
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasTimeSinceAppLastLaunchedInSec:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTimeSinceAppLastLaunchedInSec
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTimeSinceAppLastLaunchedInSec:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int timeSinceAppLastLaunchedInSec = a3;
}

- (void)deleteTimeSpentByUserInAppToday
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasTimeSpentByUserInAppToday:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimeSpentByUserInAppToday
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTimeSpentByUserInAppToday:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int timeSpentByUserInAppToday = a3;
}

- (void)deleteTotalTimeSpentByUserInAppPerDay
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasTotalTimeSpentByUserInAppPerDay:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTotalTimeSpentByUserInAppPerDay
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTotalTimeSpentByUserInAppPerDay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int totalTimeSpentByUserInAppPerDay = a3;
}

- (void)deleteCompoundActiveBundleScore
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCompoundActiveBundleScore:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_double compoundActiveBundleScore = a3;
}

- (void)deleteAppScoreFromModel
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppScoreFromModel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppScoreFromModel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppScoreFromModel:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float appScoreFromModel = a3;
}

- (void)deleteIsResolvedApp
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsResolvedApp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsResolvedApp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsResolvedApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isResolvedApp = a3;
}

- (void)deleteIsForegroundApp
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsForegroundApp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsForegroundApp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isForegroundApp = a3;
}

- (void)deleteIsFirstPartyBundle
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsFirstPartyBundle:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFirstPartyBundle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsFirstPartyBundle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isFirstPartyBundle = a3;
}

- (void)deleteAppBundleId
{
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

@end