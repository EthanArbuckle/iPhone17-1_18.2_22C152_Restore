@interface CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded
- (BOOL)hasClassifiedSampleCount;
- (BOOL)hasPositiveCount;
- (BOOL)hasSampleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)classifiedSampleCount;
- (unsigned)positiveCount;
- (unsigned)sampleCount;
- (void)deleteClassifiedSampleCount;
- (void)deletePositiveCount;
- (void)deleteSampleCount;
- (void)setClassifiedSampleCount:(unsigned int)a3;
- (void)setHasClassifiedSampleCount:(BOOL)a3;
- (void)setHasPositiveCount:(BOOL)a3;
- (void)setHasSampleCount:(BOOL)a3;
- (void)setPositiveCount:(unsigned int)a3;
- (void)setSampleCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)positiveCount
{
  return self->_positiveCount;
}

- (unsigned)classifiedSampleCount
{
  return self->_classifiedSampleCount;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded;
  v5 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setSampleCount:](v5, "setSampleCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"classifiedSampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setClassifiedSampleCount:](v5, "setClassifiedSampleCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"positiveCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setPositiveCount:](v5, "setPositiveCount:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded classifiedSampleCount](self, "classifiedSampleCount"));
    [v3 setObject:v7 forKeyedSubscript:@"classifiedSampleCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded positiveCount](self, "positiveCount"));
  [v3 setObject:v8 forKeyedSubscript:@"positiveCount"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded sampleCount](self, "sampleCount"));
    [v3 setObject:v5 forKeyedSubscript:@"sampleCount"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_sampleCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_classifiedSampleCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_positiveCount;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $D70A7E6EFD736AC9BDAA4A2AD7007843 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int sampleCount = self->_sampleCount;
    if (sampleCount != [v4 sampleCount]) {
      goto LABEL_14;
    }
    $D70A7E6EFD736AC9BDAA4A2AD7007843 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int classifiedSampleCount = self->_classifiedSampleCount;
    if (classifiedSampleCount == [v4 classifiedSampleCount])
    {
      $D70A7E6EFD736AC9BDAA4A2AD7007843 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unsigned int positiveCount = self->_positiveCount;
    if (positiveCount != [v4 positiveCount]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
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
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCurareAppIntentTaskClassificationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deletePositiveCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPositiveCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPositiveCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPositiveCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int positiveCount = a3;
}

- (void)deleteClassifiedSampleCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasClassifiedSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClassifiedSampleCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClassifiedSampleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int classifiedSampleCount = a3;
}

- (void)deleteSampleCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSampleCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSampleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSampleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int sampleCount = a3;
}

@end