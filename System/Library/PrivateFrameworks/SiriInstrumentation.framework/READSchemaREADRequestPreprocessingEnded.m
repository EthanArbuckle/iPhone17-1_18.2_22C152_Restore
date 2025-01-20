@interface READSchemaREADRequestPreprocessingEnded
- (BOOL)hasArticleTextLength;
- (BOOL)hasEstimatedDuration;
- (BOOL)hasUtteranceCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (READSchemaREADRequestPreprocessingEnded)initWithDictionary:(id)a3;
- (READSchemaREADRequestPreprocessingEnded)initWithJSON:(id)a3;
- (float)estimatedDuration;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)articleTextLength;
- (unsigned)utteranceCount;
- (void)deleteArticleTextLength;
- (void)deleteEstimatedDuration;
- (void)deleteUtteranceCount;
- (void)setArticleTextLength:(unsigned int)a3;
- (void)setEstimatedDuration:(float)a3;
- (void)setHasArticleTextLength:(BOOL)a3;
- (void)setHasEstimatedDuration:(BOOL)a3;
- (void)setHasUtteranceCount:(BOOL)a3;
- (void)setUtteranceCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation READSchemaREADRequestPreprocessingEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)estimatedDuration
{
  return self->_estimatedDuration;
}

- (unsigned)utteranceCount
{
  return self->_utteranceCount;
}

- (unsigned)articleTextLength
{
  return self->_articleTextLength;
}

- (READSchemaREADRequestPreprocessingEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)READSchemaREADRequestPreprocessingEnded;
  v5 = [(READSchemaREADRequestPreprocessingEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"articleTextLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[READSchemaREADRequestPreprocessingEnded setArticleTextLength:](v5, "setArticleTextLength:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"utteranceCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[READSchemaREADRequestPreprocessingEnded setUtteranceCount:](v5, "setUtteranceCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"estimatedDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[READSchemaREADRequestPreprocessingEnded setEstimatedDuration:](v5, "setEstimatedDuration:");
    }
    v9 = v5;
  }
  return v5;
}

- (READSchemaREADRequestPreprocessingEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(READSchemaREADRequestPreprocessingEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(READSchemaREADRequestPreprocessingEnded *)self dictionaryRepresentation];
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
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[READSchemaREADRequestPreprocessingEnded articleTextLength](self, "articleTextLength"));
    [v3 setObject:v7 forKeyedSubscript:@"articleTextLength"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = NSNumber;
  [(READSchemaREADRequestPreprocessingEnded *)self estimatedDuration];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"estimatedDuration"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[READSchemaREADRequestPreprocessingEnded utteranceCount](self, "utteranceCount"));
    [v3 setObject:v5 forKeyedSubscript:@"utteranceCount"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  uint64_t v2 = 2654435761 * self->_articleTextLength;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_utteranceCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float estimatedDuration = self->_estimatedDuration;
  double v5 = estimatedDuration;
  if (estimatedDuration < 0.0) {
    double v5 = -estimatedDuration;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  $DC4C8EB819992658C1F1D1E577E5C16A has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int articleTextLength = self->_articleTextLength;
    if (articleTextLength != [v4 articleTextLength]) {
      goto LABEL_13;
    }
    $DC4C8EB819992658C1F1D1E577E5C16A has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int utteranceCount = self->_utteranceCount;
      if (utteranceCount != [v4 utteranceCount]) {
        goto LABEL_13;
      }
      $DC4C8EB819992658C1F1D1E577E5C16A has = self->_has;
      unsigned int v6 = v4[20];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (float estimatedDuration = self->_estimatedDuration, [v4 estimatedDuration],
                                                          estimatedDuration == v12))
      {
        BOOL v13 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
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
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return READSchemaREADRequestPreprocessingEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteEstimatedDuration
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEstimatedDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEstimatedDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEstimatedDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float estimatedDuration = a3;
}

- (void)deleteUtteranceCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUtteranceCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUtteranceCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUtteranceCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int utteranceCount = a3;
}

- (void)deleteArticleTextLength
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasArticleTextLength:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleTextLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setArticleTextLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int articleTextLength = a3;
}

@end