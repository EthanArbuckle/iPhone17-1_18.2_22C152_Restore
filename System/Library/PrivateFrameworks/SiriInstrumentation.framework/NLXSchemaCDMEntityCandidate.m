@interface NLXSchemaCDMEntityCandidate
- (BOOL)hasEntity;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMEntityCandidate)initWithDictionary:(id)a3;
- (NLXSchemaCDMEntityCandidate)initWithJSON:(id)a3;
- (NSData)jsonData;
- (USOSchemaUSOGraph)entity;
- (double)score;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteEntity;
- (void)deleteScore;
- (void)setEntity:(id)a3;
- (void)setHasEntity:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMEntityCandidate

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMEntityCandidate;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMEntityCandidate *)self entity];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMEntityCandidate *)self deleteEntity];
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

- (void)setHasEntity:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setEntity:(id)a3
{
}

- (USOSchemaUSOGraph)entity
{
  return self->_entity;
}

- (NLXSchemaCDMEntityCandidate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMEntityCandidate;
  v5 = [(NLXSchemaCDMEntityCandidate *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSOGraph alloc] initWithDictionary:v6];
      [(NLXSchemaCDMEntityCandidate *)v5 setEntity:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[NLXSchemaCDMEntityCandidate setScore:](v5, "setScore:");
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (NLXSchemaCDMEntityCandidate)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMEntityCandidate *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMEntityCandidate *)self dictionaryRepresentation];
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
  if (self->_entity)
  {
    id v4 = [(NLXSchemaCDMEntityCandidate *)self entity];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entity"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entity"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = NSNumber;
    [(NLXSchemaCDMEntityCandidate *)self score];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"score"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USOSchemaUSOGraph *)self->_entity hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
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
  v5 = [(NLXSchemaCDMEntityCandidate *)self entity];
  double v6 = [v4 entity];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(NLXSchemaCDMEntityCandidate *)self entity];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      v10 = [(NLXSchemaCDMEntityCandidate *)self entity];
      objc_super v11 = [v4 entity];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (double score = self->_score, [v4 score], score == v14))
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
  id v6 = a3;
  unint64_t v4 = [(NLXSchemaCDMEntityCandidate *)self entity];

  if (v4)
  {
    v5 = [(NLXSchemaCDMEntityCandidate *)self entity];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMEntityCandidateReadFrom(self, (uint64_t)a3);
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

- (void)deleteEntity
{
}

- (BOOL)hasEntity
{
  return self->_entity != 0;
}

@end