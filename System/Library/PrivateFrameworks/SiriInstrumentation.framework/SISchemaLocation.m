@interface SISchemaLocation
- (BOOL)hasHorizontalAccuracyInMeters;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaLocation)initWithDictionary:(id)a3;
- (SISchemaLocation)initWithJSON:(id)a3;
- (float)horizontalAccuracyInMeters;
- (float)latitude;
- (float)longitude;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHorizontalAccuracyInMeters;
- (void)deleteLatitude;
- (void)deleteLongitude;
- (void)setHasHorizontalAccuracyInMeters:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHorizontalAccuracyInMeters:(float)a3;
- (void)setLatitude:(float)a3;
- (void)setLongitude:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaLocation

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)horizontalAccuracyInMeters
{
  return self->_horizontalAccuracyInMeters;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)latitude
{
  return self->_latitude;
}

- (SISchemaLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaLocation;
  v5 = [(SISchemaLocation *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"latitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[SISchemaLocation setLatitude:](v5, "setLatitude:");
    }
    v7 = [v4 objectForKeyedSubscript:@"longitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[SISchemaLocation setLongitude:](v5, "setLongitude:");
    }
    v8 = [v4 objectForKeyedSubscript:@"horizontalAccuracyInMeters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[SISchemaLocation setHorizontalAccuracyInMeters:](v5, "setHorizontalAccuracyInMeters:");
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaLocation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaLocation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaLocation *)self dictionaryRepresentation];
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
    v8 = NSNumber;
    [(SISchemaLocation *)self horizontalAccuracyInMeters];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"horizontalAccuracyInMeters"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(SISchemaLocation *)self latitude];
  objc_super v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"latitude"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = NSNumber;
    [(SISchemaLocation *)self longitude];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"longitude"];
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
    float latitude = self->_latitude;
    double v6 = latitude;
    if (latitude < 0.0) {
      double v6 = -latitude;
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
    float longitude = self->_longitude;
    double v11 = longitude;
    if (longitude < 0.0) {
      double v11 = -longitude;
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
    float horizontalAccuracyInMeters = self->_horizontalAccuracyInMeters;
    double v16 = horizontalAccuracyInMeters;
    if (horizontalAccuracyInMeters < 0.0) {
      double v16 = -horizontalAccuracyInMeters;
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
  $4147E10AC24541A3F7ABE106D04B30BF has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    float latitude = self->_latitude;
    [v4 latitude];
    if (latitude != v8) {
      goto LABEL_13;
    }
    $4147E10AC24541A3F7ABE106D04B30BF has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      float longitude = self->_longitude;
      [v4 longitude];
      if (longitude != v11) {
        goto LABEL_13;
      }
      $4147E10AC24541A3F7ABE106D04B30BF has = self->_has;
      unsigned int v6 = v4[20];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12
        || (float horizontalAccuracyInMeters = self->_horizontalAccuracyInMeters,
            [v4 horizontalAccuracyInMeters],
            horizontalAccuracyInMeters == v14))
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
    PBDataWriterWriteFloatField();
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
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaLocationReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteHorizontalAccuracyInMeters
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHorizontalAccuracyInMeters:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHorizontalAccuracyInMeters
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHorizontalAccuracyInMeters:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float horizontalAccuracyInMeters = a3;
}

- (void)deleteLongitude
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float longitude = a3;
}

- (void)deleteLatitude
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLatitude:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float latitude = a3;
}

@end