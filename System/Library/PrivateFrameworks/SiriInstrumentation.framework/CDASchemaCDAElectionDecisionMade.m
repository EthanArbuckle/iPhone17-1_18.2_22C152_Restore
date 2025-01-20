@interface CDASchemaCDAElectionDecisionMade
- (BOOL)hasDecision;
- (BOOL)hasGoodnessScoreBoosts;
- (BOOL)hasPreviousDecision;
- (BOOL)hasRawGoodnessScore;
- (BOOL)hasThisDevice;
- (BOOL)hasTimeSinceLastDecisionInMs;
- (BOOL)hasVersion;
- (BOOL)hasWinningDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAElectionDecisionMade)initWithDictionary:(id)a3;
- (CDASchemaCDAElectionDecisionMade)initWithJSON:(id)a3;
- (CDASchemaCDAParticipant)thisDevice;
- (CDASchemaCDAParticipant)winningDevice;
- (CDASchemaCDAScoreBoosters)goodnessScoreBoosts;
- (NSArray)heardParticipants;
- (NSData)jsonData;
- (float)version;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)heardParticipantsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)decision;
- (int)previousDecision;
- (unint64_t)hash;
- (unint64_t)heardParticipantsCount;
- (unint64_t)timeSinceLastDecisionInMs;
- (unsigned)rawGoodnessScore;
- (void)addHeardParticipants:(id)a3;
- (void)clearHeardParticipants;
- (void)deleteDecision;
- (void)deleteGoodnessScoreBoosts;
- (void)deletePreviousDecision;
- (void)deleteRawGoodnessScore;
- (void)deleteThisDevice;
- (void)deleteTimeSinceLastDecisionInMs;
- (void)deleteVersion;
- (void)deleteWinningDevice;
- (void)setDecision:(int)a3;
- (void)setGoodnessScoreBoosts:(id)a3;
- (void)setHasDecision:(BOOL)a3;
- (void)setHasGoodnessScoreBoosts:(BOOL)a3;
- (void)setHasPreviousDecision:(BOOL)a3;
- (void)setHasRawGoodnessScore:(BOOL)a3;
- (void)setHasThisDevice:(BOOL)a3;
- (void)setHasTimeSinceLastDecisionInMs:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWinningDevice:(BOOL)a3;
- (void)setHeardParticipants:(id)a3;
- (void)setPreviousDecision:(int)a3;
- (void)setRawGoodnessScore:(unsigned int)a3;
- (void)setThisDevice:(id)a3;
- (void)setTimeSinceLastDecisionInMs:(unint64_t)a3;
- (void)setVersion:(float)a3;
- (void)setWinningDevice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAElectionDecisionMade

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDASchemaCDAElectionDecisionMade;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CDASchemaCDAElectionDecisionMade *)self deleteThisDevice];
  }
  v9 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CDASchemaCDAElectionDecisionMade *)self deleteWinningDevice];
  }
  v12 = [(CDASchemaCDAElectionDecisionMade *)self heardParticipants];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(CDASchemaCDAElectionDecisionMade *)self setHeardParticipants:v13];

  v14 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(CDASchemaCDAElectionDecisionMade *)self deleteGoodnessScoreBoosts];
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
  objc_storeStrong((id *)&self->_goodnessScoreBoosts, 0);
  objc_storeStrong((id *)&self->_heardParticipants, 0);
  objc_storeStrong((id *)&self->_winningDevice, 0);
  objc_storeStrong((id *)&self->_thisDevice, 0);
}

- (void)setHasGoodnessScoreBoosts:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasWinningDevice:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasThisDevice:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setGoodnessScoreBoosts:(id)a3
{
}

- (CDASchemaCDAScoreBoosters)goodnessScoreBoosts
{
  return self->_goodnessScoreBoosts;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (unint64_t)timeSinceLastDecisionInMs
{
  return self->_timeSinceLastDecisionInMs;
}

- (void)setHeardParticipants:(id)a3
{
}

- (NSArray)heardParticipants
{
  return self->_heardParticipants;
}

- (void)setWinningDevice:(id)a3
{
}

- (CDASchemaCDAParticipant)winningDevice
{
  return self->_winningDevice;
}

- (void)setThisDevice:(id)a3
{
}

- (CDASchemaCDAParticipant)thisDevice
{
  return self->_thisDevice;
}

- (int)previousDecision
{
  return self->_previousDecision;
}

- (int)decision
{
  return self->_decision;
}

- (float)version
{
  return self->_version;
}

- (CDASchemaCDAElectionDecisionMade)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CDASchemaCDAElectionDecisionMade;
  v5 = [(CDASchemaCDAElectionDecisionMade *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[CDASchemaCDAElectionDecisionMade setVersion:](v5, "setVersion:");
    }
    v7 = [v4 objectForKeyedSubscript:@"decision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAElectionDecisionMade setDecision:](v5, "setDecision:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"previousDecision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAElectionDecisionMade setPreviousDecision:](v5, "setPreviousDecision:", [v8 intValue]);
    }
    uint64_t v9 = [v4 objectForKeyedSubscript:@"thisDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[CDASchemaCDAParticipant alloc] initWithDictionary:v9];
      [(CDASchemaCDAElectionDecisionMade *)v5 setThisDevice:v10];
    }
    v30 = (void *)v9;
    uint64_t v11 = [v4 objectForKeyedSubscript:@"winningDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[CDASchemaCDAParticipant alloc] initWithDictionary:v11];
      [(CDASchemaCDAElectionDecisionMade *)v5 setWinningDevice:v12];
    }
    v29 = (void *)v11;
    v13 = [v4 objectForKeyedSubscript:@"heardParticipants"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v8;
      v28 = v6;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[CDASchemaCDAParticipant alloc] initWithDictionary:v19];
              [(CDASchemaCDAElectionDecisionMade *)v5 addHeardParticipants:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v16);
      }

      v6 = v28;
      int v8 = v27;
    }
    v21 = [v4 objectForKeyedSubscript:@"timeSinceLastDecisionInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAElectionDecisionMade setTimeSinceLastDecisionInMs:](v5, "setTimeSinceLastDecisionInMs:", [v21 unsignedLongLongValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"rawGoodnessScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAElectionDecisionMade setRawGoodnessScore:](v5, "setRawGoodnessScore:", [v22 unsignedIntValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"goodnessScoreBoosts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[CDASchemaCDAScoreBoosters alloc] initWithDictionary:v23];
      [(CDASchemaCDAElectionDecisionMade *)v5 setGoodnessScoreBoosts:v24];
    }
    v25 = v5;
  }
  return v5;
}

- (CDASchemaCDAElectionDecisionMade)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAElectionDecisionMade *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAElectionDecisionMade *)self dictionaryRepresentation];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = [(CDASchemaCDAElectionDecisionMade *)self decision];
    if (v4 == 1) {
      v5 = @"CDADECISION_WIN";
    }
    else {
      v5 = @"CDADECISION_UNKNOWN";
    }
    if (v4 == 2) {
      v6 = @"CDADECISION_LOSS";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"decision"];
  }
  if (self->_goodnessScoreBoosts)
  {
    uint64_t v7 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"goodnessScoreBoosts"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"goodnessScoreBoosts"];
    }
  }
  if ([(NSArray *)self->_heardParticipants count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v11 = self->_heardParticipants;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"heardParticipants"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int v19 = [(CDASchemaCDAElectionDecisionMade *)self previousDecision];
    if (v19 == 1) {
      v20 = @"CDADECISION_WIN";
    }
    else {
      v20 = @"CDADECISION_UNKNOWN";
    }
    if (v19 == 2) {
      v21 = @"CDADECISION_LOSS";
    }
    else {
      v21 = v20;
    }
    [v3 setObject:v21 forKeyedSubscript:@"previousDecision"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CDASchemaCDAElectionDecisionMade rawGoodnessScore](self, "rawGoodnessScore"));
    [v3 setObject:v22 forKeyedSubscript:@"rawGoodnessScore"];
  }
  if (self->_thisDevice)
  {
    v23 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"thisDevice"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"thisDevice"];
    }
  }
  char v26 = (char)self->_has;
  if ((v26 & 8) != 0)
  {
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CDASchemaCDAElectionDecisionMade timeSinceLastDecisionInMs](self, "timeSinceLastDecisionInMs"));
    [v3 setObject:v27 forKeyedSubscript:@"timeSinceLastDecisionInMs"];

    char v26 = (char)self->_has;
  }
  if (v26)
  {
    v28 = NSNumber;
    [(CDASchemaCDAElectionDecisionMade *)self version];
    v29 = objc_msgSend(v28, "numberWithFloat:");
    [v3 setObject:v29 forKeyedSubscript:@"version"];
  }
  if (self->_winningDevice)
  {
    v30 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
    long long v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"winningDevice"];
    }
    else
    {
      long long v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"winningDevice"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float version = self->_version;
    double v6 = version;
    if (version < 0.0) {
      double v6 = -version;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_decision;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_previousDecision;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  unint64_t v11 = [(CDASchemaCDAParticipant *)self->_thisDevice hash];
  unint64_t v12 = [(CDASchemaCDAParticipant *)self->_winningDevice hash];
  uint64_t v13 = [(NSArray *)self->_heardParticipants hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v14 = 2654435761u * self->_timeSinceLastDecisionInMs;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v15 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(CDASchemaCDAScoreBoosters *)self->_goodnessScoreBoosts hash];
  }
  unint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v15 = 2654435761 * self->_rawGoodnessScore;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(CDASchemaCDAScoreBoosters *)self->_goodnessScoreBoosts hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  $572E99BF377DA6E946E8D50FD10EE0C7 has = self->_has;
  unsigned int v6 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_40;
  }
  if (*(unsigned char *)&has)
  {
    float version = self->_version;
    [v4 version];
    if (version != v8) {
      goto LABEL_40;
    }
    $572E99BF377DA6E946E8D50FD10EE0C7 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_40;
  }
  if (v9)
  {
    int decision = self->_decision;
    if (decision != [v4 decision]) {
      goto LABEL_40;
    }
    $572E99BF377DA6E946E8D50FD10EE0C7 has = self->_has;
    unsigned int v6 = v4[72];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_40;
  }
  if (v11)
  {
    int previousDecision = self->_previousDecision;
    if (previousDecision != [v4 previousDecision]) {
      goto LABEL_40;
    }
  }
  uint64_t v13 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
  unint64_t v14 = [v4 thisDevice];
  if ((v13 == 0) == (v14 != 0)) {
    goto LABEL_39;
  }
  uint64_t v15 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
    objc_super v18 = [v4 thisDevice];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v13 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
  unint64_t v14 = [v4 winningDevice];
  if ((v13 == 0) == (v14 != 0)) {
    goto LABEL_39;
  }
  uint64_t v20 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
    v23 = [v4 winningDevice];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  uint64_t v13 = [(CDASchemaCDAElectionDecisionMade *)self heardParticipants];
  unint64_t v14 = [v4 heardParticipants];
  if ((v13 == 0) == (v14 != 0)) {
    goto LABEL_39;
  }
  uint64_t v25 = [(CDASchemaCDAElectionDecisionMade *)self heardParticipants];
  if (v25)
  {
    char v26 = (void *)v25;
    v27 = [(CDASchemaCDAElectionDecisionMade *)self heardParticipants];
    v28 = [v4 heardParticipants];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_40;
    }
  }
  else
  {
  }
  $572E99BF377DA6E946E8D50FD10EE0C7 v30 = self->_has;
  int v31 = (*(unsigned int *)&v30 >> 3) & 1;
  unsigned int v32 = v4[72];
  if (v31 != ((v32 >> 3) & 1)) {
    goto LABEL_40;
  }
  if (v31)
  {
    unint64_t timeSinceLastDecisionInMs = self->_timeSinceLastDecisionInMs;
    if (timeSinceLastDecisionInMs != [v4 timeSinceLastDecisionInMs]) {
      goto LABEL_40;
    }
    $572E99BF377DA6E946E8D50FD10EE0C7 v30 = self->_has;
    unsigned int v32 = v4[72];
  }
  int v34 = (*(unsigned int *)&v30 >> 4) & 1;
  if (v34 != ((v32 >> 4) & 1)) {
    goto LABEL_40;
  }
  if (v34)
  {
    unsigned int rawGoodnessScore = self->_rawGoodnessScore;
    if (rawGoodnessScore != [v4 rawGoodnessScore]) {
      goto LABEL_40;
    }
  }
  uint64_t v13 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
  unint64_t v14 = [v4 goodnessScoreBoosts];
  if ((v13 == 0) == (v14 != 0))
  {
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v36 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
  if (!v36)
  {

LABEL_43:
    BOOL v41 = 1;
    goto LABEL_41;
  }
  long long v37 = (void *)v36;
  v38 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
  uint64_t v39 = [v4 goodnessScoreBoosts];
  char v40 = [v38 isEqual:v39];

  if (v40) {
    goto LABEL_43;
  }
LABEL_40:
  BOOL v41 = 0;
LABEL_41:

  return v41;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  unsigned int v6 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];

  if (v6)
  {
    long double v7 = [(CDASchemaCDAElectionDecisionMade *)self thisDevice];
    PBDataWriterWriteSubmessage();
  }
  float v8 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];

  if (v8)
  {
    int v9 = [(CDASchemaCDAElectionDecisionMade *)self winningDevice];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_heardParticipants;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  char v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v15 = (char)self->_has;
  }
  if ((v15 & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v16 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];

  if (v16)
  {
    uint64_t v17 = [(CDASchemaCDAElectionDecisionMade *)self goodnessScoreBoosts];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAElectionDecisionMadeReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteGoodnessScoreBoosts
{
}

- (BOOL)hasGoodnessScoreBoosts
{
  return self->_goodnessScoreBoosts != 0;
}

- (void)deleteRawGoodnessScore
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasRawGoodnessScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRawGoodnessScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRawGoodnessScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int rawGoodnessScore = a3;
}

- (void)deleteTimeSinceLastDecisionInMs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTimeSinceLastDecisionInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeSinceLastDecisionInMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTimeSinceLastDecisionInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t timeSinceLastDecisionInMs = a3;
}

- (id)heardParticipantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_heardParticipants objectAtIndexedSubscript:a3];
}

- (unint64_t)heardParticipantsCount
{
  return [(NSArray *)self->_heardParticipants count];
}

- (void)addHeardParticipants:(id)a3
{
  id v4 = a3;
  heardParticipants = self->_heardParticipants;
  id v8 = v4;
  if (!heardParticipants)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    long double v7 = self->_heardParticipants;
    self->_heardParticipants = v6;

    id v4 = v8;
    heardParticipants = self->_heardParticipants;
  }
  [(NSArray *)heardParticipants addObject:v4];
}

- (void)clearHeardParticipants
{
}

- (void)deleteWinningDevice
{
}

- (BOOL)hasWinningDevice
{
  return self->_winningDevice != 0;
}

- (void)deleteThisDevice
{
}

- (BOOL)hasThisDevice
{
  return self->_thisDevice != 0;
}

- (void)deletePreviousDecision
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPreviousDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreviousDecision
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreviousDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int previousDecision = a3;
}

- (void)deleteDecision
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDecision
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int decision = a3;
}

- (void)deleteVersion
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVersion:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float version = a3;
}

@end