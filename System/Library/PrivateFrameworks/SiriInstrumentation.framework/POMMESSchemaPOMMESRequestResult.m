@interface POMMESSchemaPOMMESRequestResult
- (BOOL)hasIsFromResponseCache;
- (BOOL)hasIsLowConfidenceKnowledgeResult;
- (BOOL)hasPegasusDomain;
- (BOOL)hasPegasusPromptType;
- (BOOL)hasPommesConfidenceScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromResponseCache;
- (BOOL)isLowConfidenceKnowledgeResult;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)pegasusDomain;
- (POMMESSchemaPOMMESRequestResult)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESRequestResult)initWithJSON:(id)a3;
- (double)pommesConfidenceScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)pegasusPromptType;
- (unint64_t)hash;
- (void)deleteIsFromResponseCache;
- (void)deleteIsLowConfidenceKnowledgeResult;
- (void)deletePegasusDomain;
- (void)deletePegasusPromptType;
- (void)deletePommesConfidenceScore;
- (void)setHasIsFromResponseCache:(BOOL)a3;
- (void)setHasIsLowConfidenceKnowledgeResult:(BOOL)a3;
- (void)setHasPegasusDomain:(BOOL)a3;
- (void)setHasPegasusPromptType:(BOOL)a3;
- (void)setHasPommesConfidenceScore:(BOOL)a3;
- (void)setIsFromResponseCache:(BOOL)a3;
- (void)setIsLowConfidenceKnowledgeResult:(BOOL)a3;
- (void)setPegasusDomain:(id)a3;
- (void)setPegasusPromptType:(int)a3;
- (void)setPommesConfidenceScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESRequestResult

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 2) = a3;
}

- (BOOL)isLowConfidenceKnowledgeResult
{
  return self->_isLowConfidenceKnowledgeResult;
}

- (int)pegasusPromptType
{
  return self->_pegasusPromptType;
}

- (BOOL)isFromResponseCache
{
  return self->_isFromResponseCache;
}

- (void)setPegasusDomain:(id)a3
{
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (double)pommesConfidenceScore
{
  return self->_pommesConfidenceScore;
}

- (POMMESSchemaPOMMESRequestResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)POMMESSchemaPOMMESRequestResult;
  v5 = [(POMMESSchemaPOMMESRequestResult *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pommesConfidenceScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[POMMESSchemaPOMMESRequestResult setPommesConfidenceScore:](v5, "setPommesConfidenceScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"pegasusDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(POMMESSchemaPOMMESRequestResult *)v5 setPegasusDomain:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"isFromResponseCache"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestResult setIsFromResponseCache:](v5, "setIsFromResponseCache:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"pegasusPromptType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestResult setPegasusPromptType:](v5, "setPegasusPromptType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isLowConfidenceKnowledgeResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESRequestResult setIsLowConfidenceKnowledgeResult:](v5, "setIsLowConfidenceKnowledgeResult:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESRequestResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESRequestResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESRequestResult *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isLowConfidenceKnowledgeResult + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESRequestResult isFromResponseCache](self, "isFromResponseCache"));
    [v3 setObject:v5 forKeyedSubscript:@"isFromResponseCache"];

    char v4 = *(&self->_isLowConfidenceKnowledgeResult + 1);
  }
  if ((v4 & 8) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESRequestResult isLowConfidenceKnowledgeResult](self, "isLowConfidenceKnowledgeResult"));
    [v3 setObject:v6 forKeyedSubscript:@"isLowConfidenceKnowledgeResult"];
  }
  if (self->_pegasusDomain)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESRequestResult *)self pegasusDomain];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"pegasusDomain"];
  }
  char v9 = *(&self->_isLowConfidenceKnowledgeResult + 1);
  if ((v9 & 4) != 0)
  {
    int v10 = [(POMMESSchemaPOMMESRequestResult *)self pegasusPromptType];
    v11 = @"POMMESPEGASUSPROMPTTYPE_UNKNOWN";
    if (v10 == 1) {
      v11 = @"POMMESPEGASUSPROMPTTYPE_SHARE_DEVICE_LOCATION";
    }
    if (v10 == 2) {
      v12 = @"POMMESPEGASUSPROMPTTYPE_SHARE_PRECISE_DEVICE_LOCATION";
    }
    else {
      v12 = v11;
    }
    [v3 setObject:v12 forKeyedSubscript:@"pegasusPromptType"];
    char v9 = *(&self->_isLowConfidenceKnowledgeResult + 1);
  }
  if (v9)
  {
    v13 = NSNumber;
    [(POMMESSchemaPOMMESRequestResult *)self pommesConfidenceScore];
    objc_super v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"pommesConfidenceScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isLowConfidenceKnowledgeResult + 1))
  {
    double pommesConfidenceScore = self->_pommesConfidenceScore;
    double v5 = -pommesConfidenceScore;
    if (pommesConfidenceScore >= 0.0) {
      double v5 = self->_pommesConfidenceScore;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_pegasusDomain hash];
  if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_isFromResponseCache;
  if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_pegasusPromptType;
  if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_isLowConfidenceKnowledgeResult;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (*(&self->_isLowConfidenceKnowledgeResult + 1) != (v4[33] & 1)) {
    goto LABEL_23;
  }
  if (*(&self->_isLowConfidenceKnowledgeResult + 1))
  {
    double pommesConfidenceScore = self->_pommesConfidenceScore;
    [v4 pommesConfidenceScore];
    if (pommesConfidenceScore != v6) {
      goto LABEL_23;
    }
  }
  double v7 = [(POMMESSchemaPOMMESRequestResult *)self pegasusDomain];
  NSUInteger v8 = [v4 pegasusDomain];
  uint64_t v9 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_23;
  }
  uint64_t v10 = [(POMMESSchemaPOMMESRequestResult *)self pegasusDomain];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    v12 = [(POMMESSchemaPOMMESRequestResult *)self pegasusDomain];
    v13 = [v4 pegasusDomain];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  unsigned int v15 = *((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1);
  int v16 = (v15 >> 1) & 1;
  unsigned int v17 = v4[33];
  if (v16 != ((v17 >> 1) & 1))
  {
LABEL_23:
    BOOL v23 = 0;
    goto LABEL_24;
  }
  if (v16)
  {
    int isFromResponseCache = self->_isFromResponseCache;
    if (isFromResponseCache != [v4 isFromResponseCache]) {
      goto LABEL_23;
    }
    unsigned int v15 = *((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1);
    unsigned int v17 = v4[33];
  }
  int v19 = (v15 >> 2) & 1;
  if (v19 != ((v17 >> 2) & 1)) {
    goto LABEL_23;
  }
  if (v19)
  {
    int pegasusPromptType = self->_pegasusPromptType;
    if (pegasusPromptType == [v4 pegasusPromptType])
    {
      unsigned int v15 = *((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1);
      unsigned int v17 = v4[33];
      goto LABEL_19;
    }
    goto LABEL_23;
  }
LABEL_19:
  int v21 = (v15 >> 3) & 1;
  if (v21 != ((v17 >> 3) & 1)) {
    goto LABEL_23;
  }
  if (v21)
  {
    int isLowConfidenceKnowledgeResult = self->_isLowConfidenceKnowledgeResult;
    if (isLowConfidenceKnowledgeResult != [v4 isLowConfidenceKnowledgeResult]) {
      goto LABEL_23;
    }
  }
  BOOL v23 = 1;
LABEL_24:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(&self->_isLowConfidenceKnowledgeResult + 1)) {
    PBDataWriterWriteDoubleField();
  }
  char v4 = [(POMMESSchemaPOMMESRequestResult *)self pegasusDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char v5 = *(&self->_isLowConfidenceKnowledgeResult + 1);
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = *(&self->_isLowConfidenceKnowledgeResult + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if ((*(&self->_isLowConfidenceKnowledgeResult + 1) & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESRequestResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsLowConfidenceKnowledgeResult
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) &= ~8u;
}

- (void)setHasIsLowConfidenceKnowledgeResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLowConfidenceKnowledgeResult + 1) = *(&self->_isLowConfidenceKnowledgeResult + 1) & 0xF7 | v3;
}

- (BOOL)hasIsLowConfidenceKnowledgeResult
{
  return (*((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1) >> 3) & 1;
}

- (void)setIsLowConfidenceKnowledgeResult:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) |= 8u;
  self->_int isLowConfidenceKnowledgeResult = a3;
}

- (void)deletePegasusPromptType
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) &= ~4u;
}

- (void)setHasPegasusPromptType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLowConfidenceKnowledgeResult + 1) = *(&self->_isLowConfidenceKnowledgeResult + 1) & 0xFB | v3;
}

- (BOOL)hasPegasusPromptType
{
  return (*((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1) >> 2) & 1;
}

- (void)setPegasusPromptType:(int)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) |= 4u;
  self->_int pegasusPromptType = a3;
}

- (void)deleteIsFromResponseCache
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) &= ~2u;
}

- (void)setHasIsFromResponseCache:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isLowConfidenceKnowledgeResult + 1) = *(&self->_isLowConfidenceKnowledgeResult + 1) & 0xFD | v3;
}

- (BOOL)hasIsFromResponseCache
{
  return (*((unsigned __int8 *)&self->_isLowConfidenceKnowledgeResult + 1) >> 1) & 1;
}

- (void)setIsFromResponseCache:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) |= 2u;
  self->_int isFromResponseCache = a3;
}

- (void)deletePegasusDomain
{
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

- (void)deletePommesConfidenceScore
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) &= ~1u;
}

- (void)setHasPommesConfidenceScore:(BOOL)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) = *(&self->_isLowConfidenceKnowledgeResult + 1) & 0xFE | a3;
}

- (BOOL)hasPommesConfidenceScore
{
  return *(&self->_isLowConfidenceKnowledgeResult + 1);
}

- (void)setPommesConfidenceScore:(double)a3
{
  *(&self->_isLowConfidenceKnowledgeResult + 1) |= 1u;
  self->_double pommesConfidenceScore = a3;
}

@end