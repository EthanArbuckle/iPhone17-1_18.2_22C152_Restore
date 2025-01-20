@interface EXPSiriSchemaEXPSiriPegasusResponseSummary
- (BOOL)hasCatId;
- (BOOL)hasConfidenceScore;
- (BOOL)hasResponseStatus;
- (BOOL)hasResultDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithDictionary:(id)a3;
- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithJSON:(id)a3;
- (NSArray)canonicalIds;
- (NSData)jsonData;
- (NSString)catId;
- (float)confidenceScore;
- (id)canonicalIdsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)responseStatus;
- (int)resultDomain;
- (unint64_t)canonicalIdsCount;
- (unint64_t)hash;
- (void)addCanonicalIds:(id)a3;
- (void)clearCanonicalIds;
- (void)deleteCatId;
- (void)deleteConfidenceScore;
- (void)deleteResponseStatus;
- (void)deleteResultDomain;
- (void)setCanonicalIds:(id)a3;
- (void)setCatId:(id)a3;
- (void)setConfidenceScore:(float)a3;
- (void)setHasCatId:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasResponseStatus:(BOOL)a3;
- (void)setHasResultDomain:(BOOL)a3;
- (void)setResponseStatus:(int)a3;
- (void)setResultDomain:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSiriSchemaEXPSiriPegasusResponseSummary

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_canonicalIds, 0);
}

- (void)setHasCatId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setCanonicalIds:(id)a3
{
}

- (NSArray)canonicalIds
{
  return self->_canonicalIds;
}

- (int)responseStatus
{
  return self->_responseStatus;
}

- (int)resultDomain
{
  return self->_resultDomain;
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EXPSiriSchemaEXPSiriPegasusResponseSummary;
  v5 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResultDomain:](v5, "setResultDomain:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"responseStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setResponseStatus:](v5, "setResponseStatus:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"canonicalIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = (void *)[v14 copy];
              [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)v5 addCanonicalIds:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }

      v6 = v21;
    }
    v16 = [v4 objectForKeyedSubscript:@"catId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)v5 setCatId:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"confidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[EXPSiriSchemaEXPSiriPegasusResponseSummary setConfidenceScore:](v5, "setConfidenceScore:");
    }
    v19 = v5;
  }
  return v5;
}

- (EXPSiriSchemaEXPSiriPegasusResponseSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self dictionaryRepresentation];
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
  if (self->_canonicalIds)
  {
    id v4 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self canonicalIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"canonicalIds"];
  }
  if (self->_catId)
  {
    v6 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self catId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"catId"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    unsigned int v11 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self responseStatus] - 1;
    if (v11 > 2) {
      uint64_t v12 = @"PEGASUSRESPONSESTATUS_UNKNOWN";
    }
    else {
      uint64_t v12 = off_1E5EB9FF0[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"responseStatus"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  id v9 = NSNumber;
  [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self confidenceScore];
  uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"confidenceScore"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if (has)
  {
LABEL_14:
    unsigned int v13 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self resultDomain] - 1;
    if (v13 > 0x1B) {
      v14 = @"PEGASUSDOMAIN_UNKNOWN";
    }
    else {
      v14 = off_1E5EBA008[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"resultDomain"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_resultDomain;
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
      uint64_t v4 = 2654435761 * self->_responseStatus;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSArray *)self->_canonicalIds hash];
  NSUInteger v6 = [(NSString *)self->_catId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    float confidenceScore = self->_confidenceScore;
    double v9 = confidenceScore;
    if (confidenceScore < 0.0) {
      double v9 = -confidenceScore;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  $A45F7D47595F4E6FCF4F2CAD6FEB87BE has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    int resultDomain = self->_resultDomain;
    if (resultDomain != [v4 resultDomain]) {
      goto LABEL_19;
    }
    $A45F7D47595F4E6FCF4F2CAD6FEB87BE has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int responseStatus = self->_responseStatus;
    if (responseStatus != [v4 responseStatus]) {
      goto LABEL_19;
    }
  }
  long double v10 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self canonicalIds];
  double v11 = [v4 canonicalIds];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_18;
  }
  uint64_t v12 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self canonicalIds];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    v14 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self canonicalIds];
    v15 = [v4 canonicalIds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  long double v10 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self catId];
  double v11 = [v4 catId];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v17 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self catId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self catId];
    v20 = [v4 catId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v24 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v24 == ((v4[36] >> 2) & 1))
  {
    if (!v24 || (float confidenceScore = self->_confidenceScore, [v4 confidenceScore], confidenceScore == v26))
    {
      BOOL v22 = 1;
      goto LABEL_20;
    }
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v6 = self->_canonicalIds;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  double v11 = [(EXPSiriSchemaEXPSiriPegasusResponseSummary *)self catId];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPSiriPegasusResponseSummaryReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteConfidenceScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConfidenceScore:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float confidenceScore = a3;
}

- (void)deleteCatId
{
}

- (BOOL)hasCatId
{
  return self->_catId != 0;
}

- (id)canonicalIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_canonicalIds objectAtIndexedSubscript:a3];
}

- (unint64_t)canonicalIdsCount
{
  return [(NSArray *)self->_canonicalIds count];
}

- (void)addCanonicalIds:(id)a3
{
  id v4 = a3;
  canonicalIds = self->_canonicalIds;
  id v8 = v4;
  if (!canonicalIds)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_canonicalIds;
    self->_canonicalIds = v6;

    id v4 = v8;
    canonicalIds = self->_canonicalIds;
  }
  [(NSArray *)canonicalIds addObject:v4];
}

- (void)clearCanonicalIds
{
}

- (void)deleteResponseStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasResponseStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int responseStatus = a3;
}

- (void)deleteResultDomain
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResultDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResultDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resultDomain = a3;
}

@end