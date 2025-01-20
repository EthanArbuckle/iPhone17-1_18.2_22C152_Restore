@interface TTMSchemaTTMOverrideTCUResult
- (BOOL)hasOverrideType;
- (BOOL)hasRecommendation;
- (BOOL)hasTcuId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)overrideResults;
- (NSData)jsonData;
- (SISchemaUUID)tcuId;
- (TTMSchemaTTMOverrideTCUResult)initWithDictionary:(id)a3;
- (TTMSchemaTTMOverrideTCUResult)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)overrideResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)overrideType;
- (int)recommendation;
- (unint64_t)hash;
- (unint64_t)overrideResultsCount;
- (void)addOverrideResults:(id)a3;
- (void)clearOverrideResults;
- (void)deleteOverrideType;
- (void)deleteRecommendation;
- (void)deleteTcuId;
- (void)setHasOverrideType:(BOOL)a3;
- (void)setHasRecommendation:(BOOL)a3;
- (void)setHasTcuId:(BOOL)a3;
- (void)setOverrideResults:(id)a3;
- (void)setOverrideType:(int)a3;
- (void)setRecommendation:(int)a3;
- (void)setTcuId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMOverrideTCUResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TTMSchemaTTMOverrideTCUResult;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTMSchemaTTMOverrideTCUResult *)self deleteTcuId];
  }
  v9 = [(TTMSchemaTTMOverrideTCUResult *)self overrideResults];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(TTMSchemaTTMOverrideTCUResult *)self setOverrideResults:v10];

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
  objc_storeStrong((id *)&self->_overrideResults, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
}

- (void)setHasTcuId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOverrideResults:(id)a3
{
}

- (NSArray)overrideResults
{
  return self->_overrideResults;
}

- (int)overrideType
{
  return self->_overrideType;
}

- (int)recommendation
{
  return self->_recommendation;
}

- (void)setTcuId:(id)a3
{
}

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (TTMSchemaTTMOverrideTCUResult)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TTMSchemaTTMOverrideTCUResult;
  v5 = [(TTMSchemaTTMOverrideTCUResult *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tcuId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTMSchemaTTMOverrideTCUResult *)v5 setTcuId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"recommendation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMOverrideTCUResult setRecommendation:](v5, "setRecommendation:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"overrideType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMOverrideTCUResult setOverrideType:](v5, "setOverrideType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"overrideResults"];
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
              v17 = [[TTMSchemaTTMOverrideResult alloc] initWithDictionary:v16];
              [(TTMSchemaTTMOverrideTCUResult *)v5 addOverrideResults:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v6 = v21;
      v9 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (TTMSchemaTTMOverrideTCUResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMOverrideTCUResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMOverrideTCUResult *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_overrideResults count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = self->_overrideResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"overrideResults"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v13 = [(TTMSchemaTTMOverrideTCUResult *)self overrideType] - 1;
    if (v13 > 8) {
      uint64_t v14 = @"TTMOVERRIDETYPE_UNKNOWN";
    }
    else {
      uint64_t v14 = off_1E5EBB080[v13];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, @"overrideType", (void)v21);
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v15 = [(TTMSchemaTTMOverrideTCUResult *)self recommendation] - 1;
    if (v15 > 5) {
      uint64_t v16 = @"TTMTCUMITIGATIONDECISION_UNKNOWN";
    }
    else {
      uint64_t v16 = off_1E5EBB0C8[v15];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, @"recommendation", (void)v21);
  }
  if (self->_tcuId)
  {
    v17 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"tcuId"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"tcuId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_tcuId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_recommendation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_overrideResults hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_overrideType;
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_overrideResults hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uint64_t v5 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
  uint64_t v6 = [v4 tcuId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
    v10 = [v4 tcuId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $034A423F62881F9F2DCBC6443011B8FB has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int recommendation = self->_recommendation;
    if (recommendation != [v4 recommendation]) {
      goto LABEL_19;
    }
    $034A423F62881F9F2DCBC6443011B8FB has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v15)
  {
    int overrideType = self->_overrideType;
    if (overrideType != [v4 overrideType]) {
      goto LABEL_19;
    }
  }
  uint64_t v5 = [(TTMSchemaTTMOverrideTCUResult *)self overrideResults];
  uint64_t v6 = [v4 overrideResults];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(TTMSchemaTTMOverrideTCUResult *)self overrideResults];
  if (!v17)
  {

LABEL_22:
    BOOL v22 = 1;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  v19 = [(TTMSchemaTTMOverrideTCUResult *)self overrideResults];
  v20 = [v4 overrideResults];
  char v21 = [v19 isEqual:v20];

  if (v21) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];

  if (v5)
  {
    uint64_t v6 = [(TTMSchemaTTMOverrideTCUResult *)self tcuId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_overrideResults;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMOverrideTCUResultReadFrom(self, (uint64_t)a3);
}

- (id)overrideResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_overrideResults objectAtIndexedSubscript:a3];
}

- (unint64_t)overrideResultsCount
{
  return [(NSArray *)self->_overrideResults count];
}

- (void)addOverrideResults:(id)a3
{
  id v4 = a3;
  overrideResults = self->_overrideResults;
  id v8 = v4;
  if (!overrideResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_overrideResults;
    self->_overrideResults = v6;

    id v4 = v8;
    overrideResults = self->_overrideResults;
  }
  [(NSArray *)overrideResults addObject:v4];
}

- (void)clearOverrideResults
{
}

- (void)deleteOverrideType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasOverrideType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOverrideType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOverrideType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int overrideType = a3;
}

- (void)deleteRecommendation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRecommendation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecommendation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRecommendation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int recommendation = a3;
}

- (void)deleteTcuId
{
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

@end