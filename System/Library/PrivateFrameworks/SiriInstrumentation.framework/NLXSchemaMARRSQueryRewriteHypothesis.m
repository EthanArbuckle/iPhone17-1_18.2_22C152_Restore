@interface NLXSchemaMARRSQueryRewriteHypothesis
- (BOOL)hasConfidence;
- (BOOL)hasRewriteType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMARRSQueryRewriteHypothesis)initWithDictionary:(id)a3;
- (NLXSchemaMARRSQueryRewriteHypothesis)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)confidence;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)rewriteType;
- (unint64_t)hash;
- (void)deleteConfidence;
- (void)deleteRewriteType;
- (void)setConfidence:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasRewriteType:(BOOL)a3;
- (void)setRewriteType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMARRSQueryRewriteHypothesis

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (double)confidence
{
  return self->_confidence;
}

- (NLXSchemaMARRSQueryRewriteHypothesis)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaMARRSQueryRewriteHypothesis;
  v5 = [(NLXSchemaMARRSQueryRewriteHypothesis *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[NLXSchemaMARRSQueryRewriteHypothesis setConfidence:](v5, "setConfidence:");
    }
    v7 = [v4 objectForKeyedSubscript:@"rewriteType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaMARRSQueryRewriteHypothesis setRewriteType:](v5, "setRewriteType:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaMARRSQueryRewriteHypothesis)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMARRSQueryRewriteHypothesis *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMARRSQueryRewriteHypothesis *)self dictionaryRepresentation];
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
    v5 = NSNumber;
    [(NLXSchemaMARRSQueryRewriteHypothesis *)self confidence];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"confidence"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v7 = [(NLXSchemaMARRSQueryRewriteHypothesis *)self rewriteType];
    v8 = @"MARRSQUERYREWRITETYPE_UNKNOWN";
    if (v7 == 1) {
      v8 = @"MARRSQUERYREWRITETYPE_CORRECTION";
    }
    if (v7 == 2) {
      v9 = @"MARRSQUERYREWRITETYPE_ANAPHORA_ELLIPSIS_RESOLUTION";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"rewriteType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double confidence = self->_confidence;
    double v6 = -confidence;
    if (confidence >= 0.0) {
      double v6 = self->_confidence;
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
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_rewriteType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $8514A43581E4C1E10D41781FC0FD2A4E has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    double confidence = self->_confidence;
    [v4 confidence];
    if (confidence != v8)
    {
LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    $8514A43581E4C1E10D41781FC0FD2A4E has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v9)
  {
    int rewriteType = self->_rewriteType;
    if (rewriteType != [v4 rewriteType]) {
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSQueryRewriteHypothesisReadFrom(self, (uint64_t)a3);
}

- (void)deleteRewriteType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRewriteType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRewriteType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRewriteType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int rewriteType = a3;
}

- (void)deleteConfidence
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double confidence = a3;
}

@end