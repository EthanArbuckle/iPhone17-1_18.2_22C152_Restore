@interface PNRODSchemaPNRODSiriTurnGrainSummary
- (BOOL)hasAssistantPerformanceData;
- (BOOL)hasDictationPerformanceData;
- (BOOL)hasEpd;
- (BOOL)hasFailureInfo;
- (BOOL)hasHasAssistantPerformanceData;
- (BOOL)hasHasDictationPerformanceData;
- (BOOL)hasHasReliabilityData;
- (BOOL)hasLaunch;
- (BOOL)hasReliabilityData;
- (BOOL)hasSrt;
- (BOOL)hasStatus;
- (BOOL)hasTtfw;
- (BOOL)hasTurnid;
- (BOOL)hasUufr;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODMetricDuration)epd;
- (PNRODSchemaPNRODMetricDuration)launch;
- (PNRODSchemaPNRODMetricDuration)srt;
- (PNRODSchemaPNRODMetricDuration)ttfw;
- (PNRODSchemaPNRODMetricDuration)uufr;
- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithJSON:(id)a3;
- (SISchemaUUID)turnid;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)status;
- (unint64_t)hash;
- (void)deleteEpd;
- (void)deleteFailureInfo;
- (void)deleteHasAssistantPerformanceData;
- (void)deleteHasDictationPerformanceData;
- (void)deleteHasReliabilityData;
- (void)deleteLaunch;
- (void)deleteSrt;
- (void)deleteStatus;
- (void)deleteTtfw;
- (void)deleteTurnid;
- (void)deleteUufr;
- (void)setEpd:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasAssistantPerformanceData:(BOOL)a3;
- (void)setHasDictationPerformanceData:(BOOL)a3;
- (void)setHasEpd:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasHasAssistantPerformanceData:(BOOL)a3;
- (void)setHasHasDictationPerformanceData:(BOOL)a3;
- (void)setHasHasReliabilityData:(BOOL)a3;
- (void)setHasLaunch:(BOOL)a3;
- (void)setHasReliabilityData:(BOOL)a3;
- (void)setHasSrt:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTtfw:(BOOL)a3;
- (void)setHasTurnid:(BOOL)a3;
- (void)setHasUufr:(BOOL)a3;
- (void)setLaunch:(id)a3;
- (void)setSrt:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTtfw:(id)a3;
- (void)setTurnid:(id)a3;
- (void)setUufr:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODSiriTurnGrainSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PNRODSchemaPNRODSiriTurnGrainSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteTurnid];
  }
  v9 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteSrt];
  }
  v12 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteLaunch];
  }
  v15 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteEpd];
  }
  v18 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteUufr];
  }
  v21 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteTtfw];
  }
  v24 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODSiriTurnGrainSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_ttfw, 0);
  objc_storeStrong((id *)&self->_uufr, 0);
  objc_storeStrong((id *)&self->_epd, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_srt, 0);
  objc_storeStrong((id *)&self->_turnid, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasEpd = a3;
}

- (void)setHasTtfw:(BOOL)a3
{
  self->_hasLaunch = a3;
}

- (void)setHasUufr:(BOOL)a3
{
  self->_hasSrt = a3;
}

- (void)setHasEpd:(BOOL)a3
{
  self->_hasTurnid = a3;
}

- (void)setHasLaunch:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSrt:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTurnid:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFailureInfo:(id)a3
{
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setTtfw:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)ttfw
{
  return self->_ttfw;
}

- (void)setUufr:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)uufr
{
  return self->_uufr;
}

- (void)setEpd:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)epd
{
  return self->_epd;
}

- (void)setLaunch:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)launch
{
  return self->_launch;
}

- (void)setSrt:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)srt
{
  return self->_srt;
}

- (BOOL)hasReliabilityData
{
  return self->_hasReliabilityData;
}

- (BOOL)hasDictationPerformanceData
{
  return self->_hasDictationPerformanceData;
}

- (BOOL)hasAssistantPerformanceData
{
  return self->_hasAssistantPerformanceData;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setTurnid:(id)a3
{
}

- (SISchemaUUID)turnid
{
  return self->_turnid;
}

- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PNRODSchemaPNRODSiriTurnGrainSummary;
  v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"turnid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setTurnid:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODSiriTurnGrainSummary setStatus:](v5, "setStatus:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasAssistantPerformanceData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasAssistantPerformanceData:](v5, "setHasAssistantPerformanceData:", [v9 BOOLValue]);
    }
    v27 = v9;
    v10 = [v4 objectForKeyedSubscript:@"hasDictationPerformanceData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasDictationPerformanceData:](v5, "setHasDictationPerformanceData:", [v10 BOOLValue]);
    }
    objc_super v28 = v8;
    int v11 = objc_msgSend(v4, "objectForKeyedSubscript:", @"hasReliabilityData", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasReliabilityData:](v5, "setHasReliabilityData:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"srt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setSrt:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"launch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v14];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setLaunch:v15];
    }
    v29 = (void *)v6;
    v16 = [v4 objectForKeyedSubscript:@"epd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v16];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setEpd:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"uufr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setUufr:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"ttfw"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v20];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setTtfw:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v22];
      [(PNRODSchemaPNRODSiriTurnGrainSummary *)v5 setFailureInfo:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self dictionaryRepresentation];
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
  if (self->_epd)
  {
    id v4 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"epd"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"epd"];
    }
  }
  if (self->_failureInfo)
  {
    uint64_t v7 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"failureInfo"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasAssistantPerformanceData](self, "hasAssistantPerformanceData"));
    [v3 setObject:v14 forKeyedSubscript:@"hasAssistantPerformanceData"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasDictationPerformanceData](self, "hasDictationPerformanceData"));
  [v3 setObject:v15 forKeyedSubscript:@"hasDictationPerformanceData"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasReliabilityData](self, "hasReliabilityData"));
    [v3 setObject:v11 forKeyedSubscript:@"hasReliabilityData"];
  }
LABEL_15:
  if (self->_launch)
  {
    v12 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"launch"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"launch"];
    }
  }
  if (self->_srt)
  {
    int v17 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"srt"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"srt"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v20 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODSiriTurnGrainSummary status](self, "status"));
    [v3 setObject:v20 forKeyedSubscript:@"status"];
  }
  if (self->_ttfw)
  {
    v21 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"ttfw"];
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"ttfw"];
    }
  }
  if (self->_turnid)
  {
    v24 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"turnid"];
    }
    else
    {
      int v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"turnid"];
    }
  }
  if (self->_uufr)
  {
    v27 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
    objc_super v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"uufr"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"uufr"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_turnid hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_hasAssistantPerformanceData;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_hasDictationPerformanceData;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_hasReliabilityData;
LABEL_10:
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(PNRODSchemaPNRODMetricDuration *)self->_srt hash];
  unint64_t v9 = [(PNRODSchemaPNRODMetricDuration *)self->_launch hash];
  unint64_t v10 = v9 ^ [(PNRODSchemaPNRODMetricDuration *)self->_epd hash];
  unint64_t v11 = v8 ^ v10 ^ [(PNRODSchemaPNRODMetricDuration *)self->_uufr hash];
  unint64_t v12 = [(PNRODSchemaPNRODMetricDuration *)self->_ttfw hash];
  return v11 ^ v12 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
  uint64_t v6 = [v4 turnid];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
    unint64_t v10 = [v4 turnid];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  $1DDDFEDC4C1F10C0721AED53D45981CD has = self->_has;
  unsigned int v13 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_52;
  }
  if (*(unsigned char *)&has)
  {
    int64_t status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_52;
    }
    $1DDDFEDC4C1F10C0721AED53D45981CD has = self->_has;
    unsigned int v13 = v4[80];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_52;
  }
  if (v15)
  {
    int hasAssistantPerformanceData = self->_hasAssistantPerformanceData;
    if (hasAssistantPerformanceData != [v4 hasAssistantPerformanceData]) {
      goto LABEL_52;
    }
    $1DDDFEDC4C1F10C0721AED53D45981CD has = self->_has;
    unsigned int v13 = v4[80];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_52;
  }
  if (v17)
  {
    int hasDictationPerformanceData = self->_hasDictationPerformanceData;
    if (hasDictationPerformanceData != [v4 hasDictationPerformanceData]) {
      goto LABEL_52;
    }
    $1DDDFEDC4C1F10C0721AED53D45981CD has = self->_has;
    unsigned int v13 = v4[80];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_52;
  }
  if (v19)
  {
    int hasReliabilityData = self->_hasReliabilityData;
    if (hasReliabilityData != [v4 hasReliabilityData]) {
      goto LABEL_52;
    }
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
  uint64_t v6 = [v4 srt];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v21 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
  if (v21)
  {
    v22 = (void *)v21;
    int v23 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
    v24 = [v4 srt];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
  uint64_t v6 = [v4 launch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v26 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
  if (v26)
  {
    v27 = (void *)v26;
    objc_super v28 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
    v29 = [v4 launch];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
  uint64_t v6 = [v4 epd];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v31 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
    v34 = [v4 epd];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
  uint64_t v6 = [v4 uufr];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v36 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
    v39 = [v4 uufr];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
  uint64_t v6 = [v4 ttfw];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v41 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
    v44 = [v4 ttfw];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
  uint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v46 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
  if (!v46)
  {

LABEL_55:
    BOOL v51 = 1;
    goto LABEL_53;
  }
  v47 = (void *)v46;
  v48 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
  v49 = [v4 failureInfo];
  char v50 = [v48 isEqual:v49];

  if (v50) {
    goto LABEL_55;
  }
LABEL_52:
  BOOL v51 = 0;
LABEL_53:

  return v51;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];

  if (v4)
  {
    uint64_t v5 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self turnid];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
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
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  uint64_t v7 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];

  if (v7)
  {
    unint64_t v8 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self srt];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];

  if (v9)
  {
    unint64_t v10 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self launch];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];

  if (v11)
  {
    unint64_t v12 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self epd];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v13 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];

  if (v13)
  {
    int v14 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self uufr];
    PBDataWriterWriteSubmessage();
  }
  int v15 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];

  if (v15)
  {
    v16 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self ttfw];
    PBDataWriterWriteSubmessage();
  }
  int v17 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];

  v18 = v20;
  if (v17)
  {
    int v19 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    v18 = v20;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODSiriTurnGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteTtfw
{
}

- (BOOL)hasTtfw
{
  return self->_ttfw != 0;
}

- (void)deleteUufr
{
}

- (BOOL)hasUufr
{
  return self->_uufr != 0;
}

- (void)deleteEpd
{
}

- (BOOL)hasEpd
{
  return self->_epd != 0;
}

- (void)deleteLaunch
{
}

- (BOOL)hasLaunch
{
  return self->_launch != 0;
}

- (void)deleteSrt
{
}

- (BOOL)hasSrt
{
  return self->_srt != 0;
}

- (void)deleteHasReliabilityData
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasHasReliabilityData:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasReliabilityData
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasReliabilityData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int hasReliabilityData = a3;
}

- (void)deleteHasDictationPerformanceData
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasDictationPerformanceData:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasDictationPerformanceData
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDictationPerformanceData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasDictationPerformanceData = a3;
}

- (void)deleteHasAssistantPerformanceData
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasAssistantPerformanceData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasAssistantPerformanceData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAssistantPerformanceData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int hasAssistantPerformanceData = a3;
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t status = a3;
}

- (void)deleteTurnid
{
}

- (BOOL)hasTurnid
{
  return self->_turnid != 0;
}

@end