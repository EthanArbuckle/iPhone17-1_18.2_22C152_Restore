@interface ODDSiriSchemaODDAdaptiveVolumeProperties
- (BOOL)hasAdaptiveVolume;
- (BOOL)hasIsAdaptiveVolumeEnabled;
- (BOOL)hasIsPermanentOffsetEnabled;
- (BOOL)hasPermanentOffsetFactor;
- (BOOL)isAdaptiveVolumeEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPermanentOffsetEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithJSON:(id)a3;
- (float)permanentOffsetFactor;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)adaptiveVolume;
- (unint64_t)hash;
- (void)deleteAdaptiveVolume;
- (void)deleteIsAdaptiveVolumeEnabled;
- (void)deleteIsPermanentOffsetEnabled;
- (void)deletePermanentOffsetFactor;
- (void)setAdaptiveVolume:(int)a3;
- (void)setHasAdaptiveVolume:(BOOL)a3;
- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3;
- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3;
- (void)setHasPermanentOffsetFactor:(BOOL)a3;
- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3;
- (void)setIsPermanentOffsetEnabled:(BOOL)a3;
- (void)setPermanentOffsetFactor:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAdaptiveVolumeProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)permanentOffsetFactor
{
  return self->_permanentOffsetFactor;
}

- (BOOL)isPermanentOffsetEnabled
{
  return self->_isPermanentOffsetEnabled;
}

- (int)adaptiveVolume
{
  return self->_adaptiveVolume;
}

- (BOOL)isAdaptiveVolumeEnabled
{
  return self->_isAdaptiveVolumeEnabled;
}

- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDAdaptiveVolumeProperties;
  v5 = [(ODDSiriSchemaODDAdaptiveVolumeProperties *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAdaptiveVolumeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsAdaptiveVolumeEnabled:](v5, "setIsAdaptiveVolumeEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"adaptiveVolume"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setAdaptiveVolume:](v5, "setAdaptiveVolume:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isPermanentOffsetEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setIsPermanentOffsetEnabled:](v5, "setIsPermanentOffsetEnabled:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"permanentOffsetFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[ODDSiriSchemaODDAdaptiveVolumeProperties setPermanentOffsetFactor:](v5, "setPermanentOffsetFactor:");
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAdaptiveVolumeProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAdaptiveVolumeProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAdaptiveVolumeProperties *)self dictionaryRepresentation];
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
    unsigned int v5 = [(ODDSiriSchemaODDAdaptiveVolumeProperties *)self adaptiveVolume] - 1;
    if (v5 > 3) {
      v6 = @"ODDADAPTIVEVOLUMEUSERINTENT_UNKNOWN";
    }
    else {
      v6 = off_1E5EBD5E8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"adaptiveVolume"];
    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAdaptiveVolumeProperties isAdaptiveVolumeEnabled](self, "isAdaptiveVolumeEnabled"));
    [v3 setObject:v10 forKeyedSubscript:@"isAdaptiveVolumeEnabled"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAdaptiveVolumeProperties isPermanentOffsetEnabled](self, "isPermanentOffsetEnabled"));
  [v3 setObject:v11 forKeyedSubscript:@"isPermanentOffsetEnabled"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v7 = NSNumber;
    [(ODDSiriSchemaODDAdaptiveVolumeProperties *)self permanentOffsetFactor];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"permanentOffsetFactor"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isAdaptiveVolumeEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_adaptiveVolume;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v9 = 0;
      return v3 ^ v2 ^ v4 ^ v9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isPermanentOffsetEnabled;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float permanentOffsetFactor = self->_permanentOffsetFactor;
  double v6 = permanentOffsetFactor;
  if (permanentOffsetFactor < 0.0) {
    double v6 = -permanentOffsetFactor;
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
  return v3 ^ v2 ^ v4 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  $3FAB968AB4C877F155AA3EB238C08006 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int isAdaptiveVolumeEnabled = self->_isAdaptiveVolumeEnabled;
    if (isAdaptiveVolumeEnabled != [v4 isAdaptiveVolumeEnabled]) {
      goto LABEL_17;
    }
    $3FAB968AB4C877F155AA3EB238C08006 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int adaptiveVolume = self->_adaptiveVolume;
      if (adaptiveVolume != [v4 adaptiveVolume]) {
        goto LABEL_17;
      }
      $3FAB968AB4C877F155AA3EB238C08006 has = self->_has;
      unsigned int v6 = v4[24];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int isPermanentOffsetEnabled = self->_isPermanentOffsetEnabled;
        if (isPermanentOffsetEnabled != [v4 isPermanentOffsetEnabled]) {
          goto LABEL_17;
        }
        $3FAB968AB4C877F155AA3EB238C08006 has = self->_has;
        unsigned int v6 = v4[24];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12
          || (float permanentOffsetFactor = self->_permanentOffsetFactor,
              [v4 permanentOffsetFactor],
              permanentOffsetFactor == v14))
        {
          BOOL v15 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAdaptiveVolumePropertiesReadFrom(self, (uint64_t)a3, v3);
}

- (void)deletePermanentOffsetFactor
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasPermanentOffsetFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPermanentOffsetFactor
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float permanentOffsetFactor = a3;
}

- (void)deleteIsPermanentOffsetEnabled
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsPermanentOffsetEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsPermanentOffsetEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isPermanentOffsetEnabled = a3;
}

- (void)deleteAdaptiveVolume
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAdaptiveVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdaptiveVolume
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAdaptiveVolume:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int adaptiveVolume = a3;
}

- (void)deleteIsAdaptiveVolumeEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAdaptiveVolumeEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAdaptiveVolumeEnabled = a3;
}

@end