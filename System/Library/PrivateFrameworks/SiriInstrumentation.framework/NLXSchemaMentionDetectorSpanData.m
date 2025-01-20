@interface NLXSchemaMentionDetectorSpanData
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMentionDetectorSpanData)initWithDictionary:(id)a3;
- (NLXSchemaMentionDetectorSpanData)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteScore;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMentionDetectorSpanData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)score
{
  return self->_score;
}

- (NLXSchemaMentionDetectorSpanData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaMentionDetectorSpanData;
  v5 = [(NLXSchemaMentionDetectorSpanData *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[NLXSchemaMentionDetectorSpanData setScore:](v5, "setScore:");
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaMentionDetectorSpanData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMentionDetectorSpanData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMentionDetectorSpanData *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = NSNumber;
    [(NLXSchemaMentionDetectorSpanData *)self score];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"score"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double score = self->_score;
  double v4 = -score;
  if (score >= 0.0) {
    double v4 = self->_score;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  BOOL v7 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (double score = self->_score, [v4 score], score == v6)) {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMentionDetectorSpanDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

@end