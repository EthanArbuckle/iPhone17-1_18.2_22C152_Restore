@interface NLXSchemaCDMSiriVocabularySpanDataTier1
- (BOOL)hasPriorOrdinality;
- (BOOL)hasPriorScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSiriVocabularySpanDataTier1)initWithDictionary:(id)a3;
- (NLXSchemaCDMSiriVocabularySpanDataTier1)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)priorScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)priorOrdinality;
- (void)deletePriorOrdinality;
- (void)deletePriorScore;
- (void)setHasPriorOrdinality:(BOOL)a3;
- (void)setHasPriorScore:(BOOL)a3;
- (void)setPriorOrdinality:(unsigned int)a3;
- (void)setPriorScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSiriVocabularySpanDataTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLXSchemaCDMSiriVocabularySpanDataTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorOrdinality];
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorScore];
  }
  if ([v4 isConditionSet:4])
  {
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorOrdinality];
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorScore];
  }
  if ([v4 isConditionSet:5])
  {
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorOrdinality];
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorScore];
  }
  if ([v4 isConditionSet:6])
  {
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorOrdinality];
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorScore];
  }
  if ([v4 isConditionSet:7])
  {
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorOrdinality];
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self deletePriorScore];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)priorScore
{
  return self->_priorScore;
}

- (unsigned)priorOrdinality
{
  return self->_priorOrdinality;
}

- (NLXSchemaCDMSiriVocabularySpanDataTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMSiriVocabularySpanDataTier1;
  v5 = [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"priorOrdinality"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSiriVocabularySpanDataTier1 setPriorOrdinality:](v5, "setPriorOrdinality:", [v6 unsignedIntValue]);
    }
    objc_super v7 = [v4 objectForKeyedSubscript:@"priorScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[NLXSchemaCDMSiriVocabularySpanDataTier1 setPriorScore:](v5, "setPriorScore:");
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSiriVocabularySpanDataTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaCDMSiriVocabularySpanDataTier1 priorOrdinality](self, "priorOrdinality"));
    [v3 setObject:v5 forKeyedSubscript:@"priorOrdinality"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = NSNumber;
    [(NLXSchemaCDMSiriVocabularySpanDataTier1 *)self priorScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"priorScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_priorOrdinality;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double priorScore = self->_priorScore;
  double v4 = -priorScore;
  if (priorScore >= 0.0) {
    double v4 = self->_priorScore;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $20159AE9411678C7E8E8722E236BB2B4 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int priorOrdinality = self->_priorOrdinality;
    if (priorOrdinality != [v4 priorOrdinality]) {
      goto LABEL_9;
    }
    $20159AE9411678C7E8E8722E236BB2B4 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (double priorScore = self->_priorScore, [v4 priorScore], priorScore == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSiriVocabularySpanDataTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deletePriorScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPriorScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPriorScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPriorScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double priorScore = a3;
}

- (void)deletePriorOrdinality
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPriorOrdinality:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPriorOrdinality
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPriorOrdinality:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int priorOrdinality = a3;
}

@end