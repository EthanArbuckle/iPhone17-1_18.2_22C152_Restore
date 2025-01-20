@interface PETSchemaPETAggregationKey
- (BOOL)hasBucket;
- (BOOL)hasDatestamp;
- (BOOL)hasRaw_message;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PETSchemaPETAggregationKey)initWithDictionary:(id)a3;
- (PETSchemaPETAggregationKey)initWithJSON:(id)a3;
- (PETSchemaPETRawMessage)raw_message;
- (double)bucket;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)type;
- (unint64_t)hash;
- (unsigned)datestamp;
- (void)deleteBucket;
- (void)deleteDatestamp;
- (void)deleteRaw_message;
- (void)deleteType;
- (void)setBucket:(double)a3;
- (void)setDatestamp:(unsigned int)a3;
- (void)setHasBucket:(BOOL)a3;
- (void)setHasDatestamp:(BOOL)a3;
- (void)setHasRaw_message:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setRaw_message:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETAggregationKey

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PETSchemaPETAggregationKey;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PETSchemaPETAggregationKey *)self raw_message];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PETSchemaPETAggregationKey *)self deleteRaw_message];
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

- (void)setHasRaw_message:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRaw_message:(id)a3
{
}

- (PETSchemaPETRawMessage)raw_message
{
  return self->_raw_message;
}

- (double)bucket
{
  return self->_bucket;
}

- (unsigned)datestamp
{
  return self->_datestamp;
}

- (int)type
{
  return self->_type;
}

- (PETSchemaPETAggregationKey)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PETSchemaPETAggregationKey;
  v5 = [(PETSchemaPETAggregationKey *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETAggregationKey setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"datestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETAggregationKey setDatestamp:](v5, "setDatestamp:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"bucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[PETSchemaPETAggregationKey setBucket:](v5, "setBucket:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"rawMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[PETSchemaPETRawMessage alloc] initWithDictionary:v9];
      [(PETSchemaPETAggregationKey *)v5 setRaw_message:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (PETSchemaPETAggregationKey)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETAggregationKey *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETAggregationKey *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v5 = NSNumber;
    [(PETSchemaPETAggregationKey *)self bucket];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"bucket"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PETSchemaPETAggregationKey datestamp](self, "datestamp"));
    [v3 setObject:v7 forKeyedSubscript:@"datestamp"];
  }
  if (self->_raw_message)
  {
    v8 = [(PETSchemaPETAggregationKey *)self raw_message];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"rawMessage"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"rawMessage"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v11 = [(PETSchemaPETAggregationKey *)self type] - 1;
    if (v11 > 2) {
      v12 = @"UNKNOWN";
    }
    else {
      v12 = off_1E5EB3D48[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"type"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(PETSchemaPETRawMessage *)self->_raw_message hash];
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_datestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double bucket = self->_bucket;
  double v6 = -bucket;
  if (bucket >= 0.0) {
    double v6 = self->_bucket;
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
  return v4 ^ v3 ^ v9 ^ [(PETSchemaPETRawMessage *)self->_raw_message hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $E632653AB99B7EB6710B7D6523E5A2E9 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int type = self->_type;
    if (type != [v4 type]) {
      goto LABEL_18;
    }
    $E632653AB99B7EB6710B7D6523E5A2E9 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int datestamp = self->_datestamp;
      if (datestamp != [v4 datestamp]) {
        goto LABEL_18;
      }
      $E632653AB99B7EB6710B7D6523E5A2E9 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10 || (double bucket = self->_bucket, [v4 bucket], bucket == v12))
      {
        objc_super v13 = [(PETSchemaPETAggregationKey *)self raw_message];
        v14 = objc_msgSend(v4, "raw_message");
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          uint64_t v16 = [(PETSchemaPETAggregationKey *)self raw_message];
          if (!v16)
          {

LABEL_21:
            BOOL v21 = 1;
            goto LABEL_19;
          }
          v17 = (void *)v16;
          v18 = [(PETSchemaPETAggregationKey *)self raw_message];
          v19 = objc_msgSend(v4, "raw_message");
          char v20 = [v18 isEqual:v19];

          if (v20) {
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
  }
LABEL_18:
  BOOL v21 = 0;
LABEL_19:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  v5 = [(PETSchemaPETAggregationKey *)self raw_message];

  unsigned int v6 = v8;
  if (v5)
  {
    long double v7 = [(PETSchemaPETAggregationKey *)self raw_message];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETAggregationKeyReadFrom(self, (uint64_t)a3);
}

- (void)deleteRaw_message
{
}

- (BOOL)hasRaw_message
{
  return self->_raw_message != 0;
}

- (void)deleteBucket
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBucket
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBucket:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double bucket = a3;
}

- (void)deleteDatestamp
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDatestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDatestamp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int datestamp = a3;
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int type = a3;
}

@end