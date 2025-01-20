@interface SISchemaAdaptiveVolumeUserPreferences
- (BOOL)hasIsPermanentOffsetEnabled;
- (BOOL)hasMostRecentIntent;
- (BOOL)hasPermanentOffsetFactor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPermanentOffsetEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAdaptiveVolumeUserPreferences)initWithDictionary:(id)a3;
- (SISchemaAdaptiveVolumeUserPreferences)initWithJSON:(id)a3;
- (float)permanentOffsetFactor;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mostRecentIntent;
- (unint64_t)hash;
- (void)deleteIsPermanentOffsetEnabled;
- (void)deleteMostRecentIntent;
- (void)deletePermanentOffsetFactor;
- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3;
- (void)setHasMostRecentIntent:(BOOL)a3;
- (void)setHasPermanentOffsetFactor:(BOOL)a3;
- (void)setIsPermanentOffsetEnabled:(BOOL)a3;
- (void)setMostRecentIntent:(int)a3;
- (void)setPermanentOffsetFactor:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAdaptiveVolumeUserPreferences

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

- (int)mostRecentIntent
{
  return self->_mostRecentIntent;
}

- (SISchemaAdaptiveVolumeUserPreferences)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaAdaptiveVolumeUserPreferences;
  v5 = [(SISchemaAdaptiveVolumeUserPreferences *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mostRecentIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAdaptiveVolumeUserPreferences setMostRecentIntent:](v5, "setMostRecentIntent:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isPermanentOffsetEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAdaptiveVolumeUserPreferences setIsPermanentOffsetEnabled:](v5, "setIsPermanentOffsetEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"permanentOffsetFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[SISchemaAdaptiveVolumeUserPreferences setPermanentOffsetFactor:](v5, "setPermanentOffsetFactor:");
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaAdaptiveVolumeUserPreferences)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAdaptiveVolumeUserPreferences *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAdaptiveVolumeUserPreferences *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAdaptiveVolumeUserPreferences isPermanentOffsetEnabled](self, "isPermanentOffsetEnabled"));
    [v3 setObject:v8 forKeyedSubscript:@"isPermanentOffsetEnabled"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v9 = [(SISchemaAdaptiveVolumeUserPreferences *)self mostRecentIntent] - 1;
  if (v9 > 3) {
    v10 = @"ADAPTIVEVOLUMEUSERINTENT_UNKNOWN";
  }
  else {
    v10 = off_1E5EB5140[v9];
  }
  [v3 setObject:v10 forKeyedSubscript:@"mostRecentIntent"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = NSNumber;
  [(SISchemaAdaptiveVolumeUserPreferences *)self permanentOffsetFactor];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"permanentOffsetFactor"];

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
LABEL_9:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  uint64_t v2 = 2654435761 * self->_mostRecentIntent;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isPermanentOffsetEnabled;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float permanentOffsetFactor = self->_permanentOffsetFactor;
  double v5 = permanentOffsetFactor;
  if (permanentOffsetFactor < 0.0) {
    double v5 = -permanentOffsetFactor;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  $0CBEF5873A4452135E3834B78C751B3F has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    int mostRecentIntent = self->_mostRecentIntent;
    if (mostRecentIntent != [v4 mostRecentIntent]) {
      goto LABEL_13;
    }
    $0CBEF5873A4452135E3834B78C751B3F has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isPermanentOffsetEnabled = self->_isPermanentOffsetEnabled;
      if (isPermanentOffsetEnabled != [v4 isPermanentOffsetEnabled]) {
        goto LABEL_13;
      }
      $0CBEF5873A4452135E3834B78C751B3F has = self->_has;
      unsigned int v6 = v4[20];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (float permanentOffsetFactor = self->_permanentOffsetFactor,
            [v4 permanentOffsetFactor],
            permanentOffsetFactor == v12))
      {
        BOOL v13 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v13 = 0;
LABEL_14:

  return v13;
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
  PBDataWriterWriteBOOLField();
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
  return SISchemaAdaptiveVolumeUserPreferencesReadFrom(self, (uint64_t)a3, v3);
}

- (void)deletePermanentOffsetFactor
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPermanentOffsetFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPermanentOffsetFactor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float permanentOffsetFactor = a3;
}

- (void)deleteIsPermanentOffsetEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsPermanentOffsetEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPermanentOffsetEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsPermanentOffsetEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isPermanentOffsetEnabled = a3;
}

- (void)deleteMostRecentIntent
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMostRecentIntent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMostRecentIntent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMostRecentIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int mostRecentIntent = a3;
}

@end