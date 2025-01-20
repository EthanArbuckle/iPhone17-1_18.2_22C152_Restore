@interface RTSSchemaRTSAccelerationData
- (BOOL)hasXAcceleration;
- (BOOL)hasYAcceleration;
- (BOOL)hasZAcceleration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RTSSchemaRTSAccelerationData)initWithDictionary:(id)a3;
- (RTSSchemaRTSAccelerationData)initWithJSON:(id)a3;
- (double)xAcceleration;
- (double)yAcceleration;
- (double)zAcceleration;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteXAcceleration;
- (void)deleteYAcceleration;
- (void)deleteZAcceleration;
- (void)setHasXAcceleration:(BOOL)a3;
- (void)setHasYAcceleration:(BOOL)a3;
- (void)setHasZAcceleration:(BOOL)a3;
- (void)setXAcceleration:(double)a3;
- (void)setYAcceleration:(double)a3;
- (void)setZAcceleration:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSAccelerationData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)zAcceleration
{
  return self->_zAcceleration;
}

- (double)yAcceleration
{
  return self->_yAcceleration;
}

- (double)xAcceleration
{
  return self->_xAcceleration;
}

- (RTSSchemaRTSAccelerationData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTSSchemaRTSAccelerationData;
  v5 = [(RTSSchemaRTSAccelerationData *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"xAcceleration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[RTSSchemaRTSAccelerationData setXAcceleration:](v5, "setXAcceleration:");
    }
    v7 = [v4 objectForKeyedSubscript:@"yAcceleration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[RTSSchemaRTSAccelerationData setYAcceleration:](v5, "setYAcceleration:");
    }
    v8 = [v4 objectForKeyedSubscript:@"zAcceleration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[RTSSchemaRTSAccelerationData setZAcceleration:](v5, "setZAcceleration:");
    }
    v9 = v5;
  }
  return v5;
}

- (RTSSchemaRTSAccelerationData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSAccelerationData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSAccelerationData *)self dictionaryRepresentation];
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
    v8 = NSNumber;
    [(RTSSchemaRTSAccelerationData *)self xAcceleration];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"xAcceleration"];

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
  v10 = NSNumber;
  [(RTSSchemaRTSAccelerationData *)self yAcceleration];
  objc_super v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"yAcceleration"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = NSNumber;
    [(RTSSchemaRTSAccelerationData *)self zAcceleration];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"zAcceleration"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double xAcceleration = self->_xAcceleration;
    double v6 = -xAcceleration;
    if (xAcceleration >= 0.0) {
      double v6 = self->_xAcceleration;
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
    double yAcceleration = self->_yAcceleration;
    double v11 = -yAcceleration;
    if (yAcceleration >= 0.0) {
      double v11 = self->_yAcceleration;
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
  if ((has & 4) != 0)
  {
    double zAcceleration = self->_zAcceleration;
    double v16 = -zAcceleration;
    if (zAcceleration >= 0.0) {
      double v16 = self->_zAcceleration;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  $E4F86EA8EFB2104F2CA202C88427587A has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    double xAcceleration = self->_xAcceleration;
    [v4 xAcceleration];
    if (xAcceleration != v8) {
      goto LABEL_13;
    }
    $E4F86EA8EFB2104F2CA202C88427587A has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      double yAcceleration = self->_yAcceleration;
      [v4 yAcceleration];
      if (yAcceleration != v11) {
        goto LABEL_13;
      }
      $E4F86EA8EFB2104F2CA202C88427587A has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12 || (double zAcceleration = self->_zAcceleration, [v4 zAcceleration], zAcceleration == v14))
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v15 = 0;
LABEL_14:

  return v15;
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
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSAccelerationDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteZAcceleration
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasZAcceleration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasZAcceleration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setZAcceleration:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double zAcceleration = a3;
}

- (void)deleteYAcceleration
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasYAcceleration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasYAcceleration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setYAcceleration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double yAcceleration = a3;
}

- (void)deleteXAcceleration
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasXAcceleration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasXAcceleration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setXAcceleration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double xAcceleration = a3;
}

@end