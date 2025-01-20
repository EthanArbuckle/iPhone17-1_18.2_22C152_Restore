@interface NLXSchemaMentionResolverSpanData
- (BOOL)hasJointScore;
- (BOOL)hasModelScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMentionResolverSpanData)initWithDictionary:(id)a3;
- (NLXSchemaMentionResolverSpanData)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)jointScore;
- (double)modelScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteJointScore;
- (void)deleteModelScore;
- (void)setHasJointScore:(BOOL)a3;
- (void)setHasModelScore:(BOOL)a3;
- (void)setJointScore:(double)a3;
- (void)setModelScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMentionResolverSpanData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)modelScore
{
  return self->_modelScore;
}

- (double)jointScore
{
  return self->_jointScore;
}

- (NLXSchemaMentionResolverSpanData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaMentionResolverSpanData;
  v5 = [(NLXSchemaMentionResolverSpanData *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"jointScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[NLXSchemaMentionResolverSpanData setJointScore:](v5, "setJointScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"modelScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[NLXSchemaMentionResolverSpanData setModelScore:](v5, "setModelScore:");
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaMentionResolverSpanData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMentionResolverSpanData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMentionResolverSpanData *)self dictionaryRepresentation];
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
    [(NLXSchemaMentionResolverSpanData *)self jointScore];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"jointScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(NLXSchemaMentionResolverSpanData *)self modelScore];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"modelScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double jointScore = self->_jointScore;
    double v6 = -jointScore;
    if (jointScore >= 0.0) {
      double v6 = self->_jointScore;
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
    double modelScore = self->_modelScore;
    double v11 = -modelScore;
    if (modelScore >= 0.0) {
      double v11 = self->_modelScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $4250D57894D845E96145F3AD30AC539D has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    double jointScore = self->_jointScore;
    [v4 jointScore];
    if (jointScore != v8) {
      goto LABEL_9;
    }
    $4250D57894D845E96145F3AD30AC539D has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (!v9 || (double modelScore = self->_modelScore, [v4 modelScore], modelScore == v11))
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v12 = 0;
LABEL_10:

  return v12;
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
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMentionResolverSpanDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasModelScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModelScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setModelScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double modelScore = a3;
}

- (void)deleteJointScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasJointScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasJointScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setJointScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double jointScore = a3;
}

@end