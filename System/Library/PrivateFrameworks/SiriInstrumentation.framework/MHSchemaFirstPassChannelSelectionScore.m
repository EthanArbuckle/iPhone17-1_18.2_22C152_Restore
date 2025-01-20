@interface MHSchemaFirstPassChannelSelectionScore
- (BOOL)hasChannelString;
- (BOOL)hasFirstPassScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaFirstPassChannelSelectionScore)initWithDictionary:(id)a3;
- (MHSchemaFirstPassChannelSelectionScore)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)channelString;
- (float)firstPassScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteChannelString;
- (void)deleteFirstPassScore;
- (void)setChannelString:(id)a3;
- (void)setFirstPassScore:(float)a3;
- (void)setHasChannelString:(BOOL)a3;
- (void)setHasFirstPassScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaFirstPassChannelSelectionScore

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasChannelString:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)firstPassScore
{
  return self->_firstPassScore;
}

- (void)setChannelString:(id)a3
{
}

- (NSString)channelString
{
  return self->_channelString;
}

- (MHSchemaFirstPassChannelSelectionScore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaFirstPassChannelSelectionScore;
  v5 = [(MHSchemaFirstPassChannelSelectionScore *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"channelString"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaFirstPassChannelSelectionScore *)v5 setChannelString:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"firstPassScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaFirstPassChannelSelectionScore setFirstPassScore:](v5, "setFirstPassScore:");
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaFirstPassChannelSelectionScore)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaFirstPassChannelSelectionScore *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaFirstPassChannelSelectionScore *)self dictionaryRepresentation];
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
  if (self->_channelString)
  {
    id v4 = [(MHSchemaFirstPassChannelSelectionScore *)self channelString];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"channelString"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = NSNumber;
    [(MHSchemaFirstPassChannelSelectionScore *)self firstPassScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"firstPassScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelString hash];
  if (*(unsigned char *)&self->_has)
  {
    float firstPassScore = self->_firstPassScore;
    double v6 = firstPassScore;
    if (firstPassScore < 0.0) {
      double v6 = -firstPassScore;
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
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  v5 = [(MHSchemaFirstPassChannelSelectionScore *)self channelString];
  double v6 = [v4 channelString];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(MHSchemaFirstPassChannelSelectionScore *)self channelString];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(MHSchemaFirstPassChannelSelectionScore *)self channelString];
      objc_super v11 = [v4 channelString];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ((*(unsigned char *)&self->_has & 1) == (v4[20] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (float firstPassScore = self->_firstPassScore, [v4 firstPassScore], firstPassScore == v14))
      {
        BOOL v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {
  }
LABEL_11:
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(MHSchemaFirstPassChannelSelectionScore *)self channelString];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaFirstPassChannelSelectionScoreReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteFirstPassScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstPassScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFirstPassScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float firstPassScore = a3;
}

- (void)deleteChannelString
{
}

- (BOOL)hasChannelString
{
  return self->_channelString != 0;
}

@end