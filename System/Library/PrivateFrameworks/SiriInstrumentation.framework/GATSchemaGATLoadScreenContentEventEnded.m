@interface GATSchemaGATLoadScreenContentEventEnded
- (BOOL)hasOriginalMediaSizeInKBs;
- (BOOL)hasOriginalMediaType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATLoadScreenContentEventEnded)initWithDictionary:(id)a3;
- (GATSchemaGATLoadScreenContentEventEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)originalMediaSizeInKBs;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)originalMediaType;
- (unint64_t)hash;
- (void)deleteOriginalMediaSizeInKBs;
- (void)deleteOriginalMediaType;
- (void)setHasOriginalMediaSizeInKBs:(BOOL)a3;
- (void)setHasOriginalMediaType:(BOOL)a3;
- (void)setOriginalMediaSizeInKBs:(double)a3;
- (void)setOriginalMediaType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATLoadScreenContentEventEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)originalMediaSizeInKBs
{
  return self->_originalMediaSizeInKBs;
}

- (int)originalMediaType
{
  return self->_originalMediaType;
}

- (GATSchemaGATLoadScreenContentEventEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GATSchemaGATLoadScreenContentEventEnded;
  v5 = [(GATSchemaGATLoadScreenContentEventEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalMediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GATSchemaGATLoadScreenContentEventEnded setOriginalMediaType:](v5, "setOriginalMediaType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"originalMediaSizeInKBs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[GATSchemaGATLoadScreenContentEventEnded setOriginalMediaSizeInKBs:](v5, "setOriginalMediaSizeInKBs:");
    }
    v8 = v5;
  }
  return v5;
}

- (GATSchemaGATLoadScreenContentEventEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATLoadScreenContentEventEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATLoadScreenContentEventEnded *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = NSNumber;
    [(GATSchemaGATLoadScreenContentEventEnded *)self originalMediaSizeInKBs];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"originalMediaSizeInKBs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(GATSchemaGATLoadScreenContentEventEnded *)self originalMediaType] - 1;
    if (v7 > 0xA) {
      v8 = @"GATMEDIATYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EC15E8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"originalMediaType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_originalMediaType;
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
  double originalMediaSizeInKBs = self->_originalMediaSizeInKBs;
  double v4 = -originalMediaSizeInKBs;
  if (originalMediaSizeInKBs >= 0.0) {
    double v4 = self->_originalMediaSizeInKBs;
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
  $106261749DC6879E66CF08B343DD9517 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int originalMediaType = self->_originalMediaType;
    if (originalMediaType != [v4 originalMediaType]) {
      goto LABEL_9;
    }
    $106261749DC6879E66CF08B343DD9517 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (double originalMediaSizeInKBs = self->_originalMediaSizeInKBs,
          [v4 originalMediaSizeInKBs],
          originalMediaSizeInKBs == v10))
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
    PBDataWriterWriteInt32Field();
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
  return GATSchemaGATLoadScreenContentEventEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginalMediaSizeInKBs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasOriginalMediaSizeInKBs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginalMediaSizeInKBs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOriginalMediaSizeInKBs:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double originalMediaSizeInKBs = a3;
}

- (void)deleteOriginalMediaType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOriginalMediaType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginalMediaType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginalMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int originalMediaType = a3;
}

@end