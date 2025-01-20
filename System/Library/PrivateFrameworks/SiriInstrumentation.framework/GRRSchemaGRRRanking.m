@interface GRRSchemaGRRRanking
- (BOOL)hasParseId;
- (BOOL)hasParseType;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRRanking)initWithDictionary:(id)a3;
- (GRRSchemaGRRRanking)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)parseId;
- (double)score;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)parseType;
- (unint64_t)hash;
- (void)deleteParseId;
- (void)deleteParseType;
- (void)deleteScore;
- (void)setHasParseId:(BOOL)a3;
- (void)setHasParseType:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setParseId:(id)a3;
- (void)setParseType:(int)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRRanking

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GRRSchemaGRRRanking;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(GRRSchemaGRRRanking *)self parseId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(GRRSchemaGRRRanking *)self deleteParseId];
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

- (void)setHasParseId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)score
{
  return self->_score;
}

- (int)parseType
{
  return self->_parseType;
}

- (void)setParseId:(id)a3
{
}

- (SISchemaUUID)parseId
{
  return self->_parseId;
}

- (GRRSchemaGRRRanking)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GRRSchemaGRRRanking;
  v5 = [(GRRSchemaGRRRanking *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"parseId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(GRRSchemaGRRRanking *)v5 setParseId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"parseType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRRanking setParseType:](v5, "setParseType:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[GRRSchemaGRRRanking setScore:](v5, "setScore:");
    }
    v10 = v5;
  }
  return v5;
}

- (GRRSchemaGRRRanking)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRRanking *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRRanking *)self dictionaryRepresentation];
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
  if (self->_parseId)
  {
    id v4 = [(GRRSchemaGRRRanking *)self parseId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"parseId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"parseId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v8 = [(GRRSchemaGRRRanking *)self parseType] - 1;
    if (v8 > 5) {
      objc_super v9 = @"GRRPARSETYPE_UNKNOWN";
    }
    else {
      objc_super v9 = off_1E5EB05B0[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"parseType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = NSNumber;
    [(GRRSchemaGRRRanking *)self score];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"score"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_parseId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_parseType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double score = self->_score;
  double v6 = -score;
  if (score >= 0.0) {
    double v6 = self->_score;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(GRRSchemaGRRRanking *)self parseId];
  double v6 = [v4 parseId];
  long double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(GRRSchemaGRRRanking *)self parseId];
    if (v8)
    {
      unint64_t v9 = (void *)v8;
      v10 = [(GRRSchemaGRRRanking *)self parseId];
      v11 = [v4 parseId];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    $23D9E48D5B502C3ED30316D3535A2798 has = self->_has;
    unsigned int v14 = v4[32];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        int parseType = self->_parseType;
        if (parseType != [v4 parseType]) {
          goto LABEL_15;
        }
        $23D9E48D5B502C3ED30316D3535A2798 has = self->_has;
        unsigned int v14 = v4[32];
      }
      int v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (!v16 || (double score = self->_score, [v4 score], score == v18))
        {
          BOOL v19 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(GRRSchemaGRRRanking *)self parseId];

  if (v4)
  {
    v5 = [(GRRSchemaGRRRanking *)self parseId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  long double v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    long double v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRRankingReadFrom(self, (uint64_t)a3);
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double score = a3;
}

- (void)deleteParseType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasParseType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParseType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setParseType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int parseType = a3;
}

- (void)deleteParseId
{
}

- (BOOL)hasParseId
{
  return self->_parseId != 0;
}

@end