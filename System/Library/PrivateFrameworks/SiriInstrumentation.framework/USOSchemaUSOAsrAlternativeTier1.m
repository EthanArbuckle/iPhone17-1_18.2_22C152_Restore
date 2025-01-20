@interface USOSchemaUSOAsrAlternativeTier1
- (BOOL)hasAlternative;
- (BOOL)hasProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)alternative;
- (USOSchemaUSOAsrAlternativeTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOAsrAlternativeTier1)initWithJSON:(id)a3;
- (float)probability;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAlternative;
- (void)deleteProbability;
- (void)setAlternative:(id)a3;
- (void)setHasAlternative:(BOOL)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setProbability:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOAsrAlternativeTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSOAsrAlternativeTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(USOSchemaUSOAsrAlternativeTier1 *)self deleteAlternative];
  }
  if ([v4 isConditionSet:4]) {
    [(USOSchemaUSOAsrAlternativeTier1 *)self deleteAlternative];
  }
  if ([v4 isConditionSet:5]) {
    [(USOSchemaUSOAsrAlternativeTier1 *)self deleteAlternative];
  }
  if ([v4 isConditionSet:6]) {
    [(USOSchemaUSOAsrAlternativeTier1 *)self deleteAlternative];
  }
  if ([v4 isConditionSet:7]) {
    [(USOSchemaUSOAsrAlternativeTier1 *)self deleteAlternative];
  }

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
}

- (void)setHasAlternative:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)probability
{
  return self->_probability;
}

- (void)setAlternative:(id)a3
{
}

- (NSString)alternative
{
  return self->_alternative;
}

- (USOSchemaUSOAsrAlternativeTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOSchemaUSOAsrAlternativeTier1;
  v5 = [(USOSchemaUSOAsrAlternativeTier1 *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"alternative"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(USOSchemaUSOAsrAlternativeTier1 *)v5 setAlternative:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"probability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[USOSchemaUSOAsrAlternativeTier1 setProbability:](v5, "setProbability:");
    }
    v9 = v5;
  }
  return v5;
}

- (USOSchemaUSOAsrAlternativeTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOAsrAlternativeTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOAsrAlternativeTier1 *)self dictionaryRepresentation];
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
  if (self->_alternative)
  {
    id v4 = [(USOSchemaUSOAsrAlternativeTier1 *)self alternative];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"alternative"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = NSNumber;
    [(USOSchemaUSOAsrAlternativeTier1 *)self probability];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"probability"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alternative hash];
  if (*(unsigned char *)&self->_has)
  {
    float probability = self->_probability;
    double v6 = probability;
    if (probability < 0.0) {
      double v6 = -probability;
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
  v5 = [(USOSchemaUSOAsrAlternativeTier1 *)self alternative];
  double v6 = [v4 alternative];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(USOSchemaUSOAsrAlternativeTier1 *)self alternative];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(USOSchemaUSOAsrAlternativeTier1 *)self alternative];
      objc_super v11 = [v4 alternative];
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
        || (float probability = self->_probability, [v4 probability], probability == v14))
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
  unint64_t v4 = [(USOSchemaUSOAsrAlternativeTier1 *)self alternative];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOAsrAlternativeTier1ReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteProbability
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProbability:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProbability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProbability:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float probability = a3;
}

- (void)deleteAlternative
{
}

- (BOOL)hasAlternative
{
  return self->_alternative != 0;
}

@end