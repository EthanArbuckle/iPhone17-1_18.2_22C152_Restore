@interface NETSchemaNETDebugSessionConnectionQuality
- (BOOL)hasSymptomsCellularHistorical;
- (BOOL)hasSymptomsCellularInstant;
- (BOOL)hasSymptomsWiFiHistorical;
- (BOOL)hasSymptomsWiFiInstant;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugSessionConnectionQuality)initWithDictionary:(id)a3;
- (NETSchemaNETDebugSessionConnectionQuality)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)symptomsCellularHistorical;
- (int)symptomsCellularInstant;
- (int)symptomsWiFiHistorical;
- (int)symptomsWiFiInstant;
- (unint64_t)hash;
- (void)deleteSymptomsCellularHistorical;
- (void)deleteSymptomsCellularInstant;
- (void)deleteSymptomsWiFiHistorical;
- (void)deleteSymptomsWiFiInstant;
- (void)setHasSymptomsCellularHistorical:(BOOL)a3;
- (void)setHasSymptomsCellularInstant:(BOOL)a3;
- (void)setHasSymptomsWiFiHistorical:(BOOL)a3;
- (void)setHasSymptomsWiFiInstant:(BOOL)a3;
- (void)setSymptomsCellularHistorical:(int)a3;
- (void)setSymptomsCellularInstant:(int)a3;
- (void)setSymptomsWiFiHistorical:(int)a3;
- (void)setSymptomsWiFiInstant:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugSessionConnectionQuality

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)symptomsWiFiInstant
{
  return self->_symptomsWiFiInstant;
}

- (int)symptomsWiFiHistorical
{
  return self->_symptomsWiFiHistorical;
}

- (int)symptomsCellularInstant
{
  return self->_symptomsCellularInstant;
}

- (int)symptomsCellularHistorical
{
  return self->_symptomsCellularHistorical;
}

- (NETSchemaNETDebugSessionConnectionQuality)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETDebugSessionConnectionQuality;
  v5 = [(NETSchemaNETDebugSessionConnectionQuality *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"symptomsCellularHistorical"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularHistorical:](v5, "setSymptomsCellularHistorical:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"symptomsCellularInstant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsCellularInstant:](v5, "setSymptomsCellularInstant:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"symptomsWiFiHistorical"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiHistorical:](v5, "setSymptomsWiFiHistorical:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"symptomsWiFiInstant"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugSessionConnectionQuality setSymptomsWiFiInstant:](v5, "setSymptomsWiFiInstant:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugSessionConnectionQuality)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugSessionConnectionQuality *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugSessionConnectionQuality *)self dictionaryRepresentation];
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
    unsigned int v5 = [(NETSchemaNETDebugSessionConnectionQuality *)self symptomsCellularHistorical] - 1;
    if (v5 > 2) {
      v6 = @"NETQUALITY_UNKNOWN";
    }
    else {
      v6 = off_1E5EB2920[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"symptomsCellularHistorical"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_14:
      unsigned int v9 = [(NETSchemaNETDebugSessionConnectionQuality *)self symptomsWiFiHistorical] - 1;
      if (v9 > 2) {
        v10 = @"NETQUALITY_UNKNOWN";
      }
      else {
        v10 = off_1E5EB2920[v9];
      }
      [v3 setObject:v10 forKeyedSubscript:@"symptomsWiFiHistorical"];
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v7 = [(NETSchemaNETDebugSessionConnectionQuality *)self symptomsCellularInstant] - 1;
  if (v7 > 2) {
    v8 = @"NETQUALITY_UNKNOWN";
  }
  else {
    v8 = off_1E5EB2920[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"symptomsCellularInstant"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_14;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_18:
    unsigned int v11 = [(NETSchemaNETDebugSessionConnectionQuality *)self symptomsWiFiInstant] - 1;
    if (v11 > 2) {
      objc_super v12 = @"NETQUALITY_UNKNOWN";
    }
    else {
      objc_super v12 = off_1E5EB2920[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"symptomsWiFiInstant"];
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_symptomsCellularHistorical;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_symptomsCellularInstant;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_symptomsWiFiHistorical;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_symptomsWiFiInstant;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $1C39BD4F6CB9A54C5A986A3946D95EF5 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int symptomsCellularHistorical = self->_symptomsCellularHistorical;
    if (symptomsCellularHistorical != [v4 symptomsCellularHistorical]) {
      goto LABEL_18;
    }
    $1C39BD4F6CB9A54C5A986A3946D95EF5 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int symptomsCellularInstant = self->_symptomsCellularInstant;
    if (symptomsCellularInstant != [v4 symptomsCellularInstant]) {
      goto LABEL_18;
    }
    $1C39BD4F6CB9A54C5A986A3946D95EF5 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int symptomsWiFiHistorical = self->_symptomsWiFiHistorical;
    if (symptomsWiFiHistorical == [v4 symptomsWiFiHistorical])
    {
      $1C39BD4F6CB9A54C5A986A3946D95EF5 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int symptomsWiFiInstant = self->_symptomsWiFiInstant;
    if (symptomsWiFiInstant != [v4 symptomsWiFiInstant]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugSessionConnectionQualityReadFrom(self, (uint64_t)a3);
}

- (void)deleteSymptomsWiFiInstant
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSymptomsWiFiInstant:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSymptomsWiFiInstant
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSymptomsWiFiInstant:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int symptomsWiFiInstant = a3;
}

- (void)deleteSymptomsWiFiHistorical
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSymptomsWiFiHistorical:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSymptomsWiFiHistorical
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSymptomsWiFiHistorical:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int symptomsWiFiHistorical = a3;
}

- (void)deleteSymptomsCellularInstant
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSymptomsCellularInstant:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSymptomsCellularInstant
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSymptomsCellularInstant:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int symptomsCellularInstant = a3;
}

- (void)deleteSymptomsCellularHistorical
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSymptomsCellularHistorical:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSymptomsCellularHistorical
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSymptomsCellularHistorical:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int symptomsCellularHistorical = a3;
}

@end