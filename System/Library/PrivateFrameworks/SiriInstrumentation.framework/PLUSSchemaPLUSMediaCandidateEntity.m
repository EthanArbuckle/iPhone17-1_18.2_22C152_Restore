@interface PLUSSchemaPLUSMediaCandidateEntity
- (BOOL)hasConfidence;
- (BOOL)hasEntityAdamId;
- (BOOL)hasNominated;
- (BOOL)isEqual:(id)a3;
- (BOOL)nominated;
- (BOOL)readFrom:(id)a3;
- (NSArray)entityFeedbackHistorys;
- (NSData)jsonData;
- (NSString)entityAdamId;
- (PLUSSchemaPLUSMediaCandidateEntity)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaCandidateEntity)initWithJSON:(id)a3;
- (double)confidence;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)entityFeedbackHistoryAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)entityFeedbackHistoryCount;
- (unint64_t)hash;
- (void)addEntityFeedbackHistory:(id)a3;
- (void)clearEntityFeedbackHistory;
- (void)deleteConfidence;
- (void)deleteEntityAdamId;
- (void)deleteNominated;
- (void)setConfidence:(double)a3;
- (void)setEntityAdamId:(id)a3;
- (void)setEntityFeedbackHistorys:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEntityAdamId:(BOOL)a3;
- (void)setHasNominated:(BOOL)a3;
- (void)setNominated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaCandidateEntity

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSMediaCandidateEntity;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(PLUSSchemaPLUSMediaCandidateEntity *)self deleteEntityAdamId];
  }
  if ([v4 isConditionSet:4]) {
    [(PLUSSchemaPLUSMediaCandidateEntity *)self deleteEntityAdamId];
  }
  if ([v4 isConditionSet:5]) {
    [(PLUSSchemaPLUSMediaCandidateEntity *)self deleteEntityAdamId];
  }
  if ([v4 isConditionSet:6]) {
    [(PLUSSchemaPLUSMediaCandidateEntity *)self deleteEntityAdamId];
  }
  if ([v4 isConditionSet:7]) {
    [(PLUSSchemaPLUSMediaCandidateEntity *)self deleteEntityAdamId];
  }
  v6 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityFeedbackHistorys];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(PLUSSchemaPLUSMediaCandidateEntity *)self setEntityFeedbackHistorys:v7];

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
  objc_storeStrong((id *)&self->_entityFeedbackHistorys, 0);
  objc_storeStrong((id *)&self->_entityAdamId, 0);
}

- (void)setHasEntityAdamId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setEntityFeedbackHistorys:(id)a3
{
}

- (NSArray)entityFeedbackHistorys
{
  return self->_entityFeedbackHistorys;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)nominated
{
  return self->_nominated;
}

- (void)setEntityAdamId:(id)a3
{
}

- (NSString)entityAdamId
{
  return self->_entityAdamId;
}

- (PLUSSchemaPLUSMediaCandidateEntity)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLUSSchemaPLUSMediaCandidateEntity;
  v5 = [(PLUSSchemaPLUSMediaCandidateEntity *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entityAdamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PLUSSchemaPLUSMediaCandidateEntity *)v5 setEntityAdamId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"nominated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaCandidateEntity setNominated:](v5, "setNominated:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[PLUSSchemaPLUSMediaCandidateEntity setConfidence:](v5, "setConfidence:");
    }
    v10 = [v4 objectForKeyedSubscript:@"entityFeedbackHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v9;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[PLUSSchemaPLUSMediaContributingGroundTruth alloc] initWithDictionary:v16];
              [(PLUSSchemaPLUSMediaCandidateEntity *)v5 addEntityFeedbackHistory:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v6 = v21;
      objc_super v9 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaCandidateEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaCandidateEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaCandidateEntity *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = NSNumber;
    [(PLUSSchemaPLUSMediaCandidateEntity *)self confidence];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"confidence"];
  }
  if (self->_entityAdamId)
  {
    v6 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityAdamId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"entityAdamId"];
  }
  if ([(NSArray *)self->_entityFeedbackHistorys count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v9 = self->_entityFeedbackHistorys;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"entityFeedbackHistory"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSMediaCandidateEntity nominated](self, "nominated"));
    [v3 setObject:v16 forKeyedSubscript:@"nominated"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_entityAdamId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_nominated;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(NSArray *)self->_entityFeedbackHistorys hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double confidence = self->_confidence;
  double v6 = -confidence;
  if (confidence >= 0.0) {
    double v6 = self->_confidence;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(NSArray *)self->_entityFeedbackHistorys hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  v5 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityAdamId];
  double v6 = [v4 entityAdamId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityAdamId];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityAdamId];
    uint64_t v10 = [v4 entityAdamId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $0C281733219A92D78213A4AECD4B2E07 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int nominated = self->_nominated;
    if (nominated != [v4 nominated]) {
      goto LABEL_19;
    }
    $0C281733219A92D78213A4AECD4B2E07 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    double confidence = self->_confidence;
    [v4 confidence];
    if (confidence != v17) {
      goto LABEL_19;
    }
  }
  v5 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityFeedbackHistorys];
  double v6 = [v4 entityFeedbackHistorys];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v18 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityFeedbackHistorys];
  if (!v18)
  {

LABEL_22:
    BOOL v23 = 1;
    goto LABEL_20;
  }
  long long v19 = (void *)v18;
  long long v20 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityFeedbackHistorys];
  long long v21 = [v4 entityFeedbackHistorys];
  char v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLUSSchemaPLUSMediaCandidateEntity *)self entityAdamId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_entityFeedbackHistorys;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaCandidateEntityReadFrom(self, (uint64_t)a3);
}

- (id)entityFeedbackHistoryAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityFeedbackHistorys objectAtIndexedSubscript:a3];
}

- (unint64_t)entityFeedbackHistoryCount
{
  return [(NSArray *)self->_entityFeedbackHistorys count];
}

- (void)addEntityFeedbackHistory:(id)a3
{
  id v4 = a3;
  entityFeedbackHistorys = self->_entityFeedbackHistorys;
  id v8 = v4;
  if (!entityFeedbackHistorys)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entityFeedbackHistorys;
    self->_entityFeedbackHistorys = v6;

    id v4 = v8;
    entityFeedbackHistorys = self->_entityFeedbackHistorys;
  }
  [(NSArray *)entityFeedbackHistorys addObject:v4];
}

- (void)clearEntityFeedbackHistory
{
}

- (void)deleteConfidence
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double confidence = a3;
}

- (void)deleteNominated
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNominated:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNominated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNominated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int nominated = a3;
}

- (void)deleteEntityAdamId
{
}

- (BOOL)hasEntityAdamId
{
  return self->_entityAdamId != 0;
}

@end