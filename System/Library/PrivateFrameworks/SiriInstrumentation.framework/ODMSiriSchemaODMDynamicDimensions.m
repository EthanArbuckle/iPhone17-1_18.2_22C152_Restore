@interface ODMSiriSchemaODMDynamicDimensions
- (BOOL)hasAudioInterface;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasTaskAppBundleId;
- (BOOL)hasTaskType;
- (BOOL)hasViewMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMDynamicDimensions)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMDynamicDimensions)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioInterface;
- (int)taskAppBundleId;
- (int)taskType;
- (int)viewMode;
- (unint64_t)hash;
- (void)deleteAudioInterface;
- (void)deleteSiriInputLocale;
- (void)deleteTaskAppBundleId;
- (void)deleteTaskType;
- (void)deleteViewMode;
- (void)setAudioInterface:(int)a3;
- (void)setHasAudioInterface:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasTaskAppBundleId:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setHasViewMode:(BOOL)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setTaskAppBundleId:(int)a3;
- (void)setTaskType:(int)a3;
- (void)setViewMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMDynamicDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMDynamicDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODMSiriSchemaODMDynamicDimensions *)self deleteSiriInputLocale];
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

- (void)setHasSiriInputLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)taskAppBundleId
{
  return self->_taskAppBundleId;
}

- (int)taskType
{
  return self->_taskType;
}

- (int)audioInterface
{
  return self->_audioInterface;
}

- (int)viewMode
{
  return self->_viewMode;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (ODMSiriSchemaODMDynamicDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODMSiriSchemaODMDynamicDimensions;
  v5 = [(ODMSiriSchemaODMDynamicDimensions *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaISOLocale alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMDynamicDimensions *)v5 setSiriInputLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"viewMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensions setViewMode:](v5, "setViewMode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"audioInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensions setAudioInterface:](v5, "setAudioInterface:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"taskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensions setTaskType:](v5, "setTaskType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"taskAppBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensions setTaskAppBundleId:](v5, "setTaskAppBundleId:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMDynamicDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMDynamicDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMDynamicDimensions *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = [(ODMSiriSchemaODMDynamicDimensions *)self audioInterface] - 1;
    if (v4 > 0xE) {
      v5 = @"AUDIOINPUTROUTE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBB350[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioInterface"];
  }
  if (self->_siriInputLocale)
  {
    v6 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_13;
    }
LABEL_19:
    unsigned int v12 = [(ODMSiriSchemaODMDynamicDimensions *)self taskType] - 1;
    if (v12 > 3) {
      v13 = @"ODMSIRITASKTYPE_UNKNOWN";
    }
    else {
      v13 = off_1E5EBB3E0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"taskType"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  unsigned int v10 = [(ODMSiriSchemaODMDynamicDimensions *)self taskAppBundleId] - 1;
  if (v10 > 2) {
    v11 = @"ODMSIRITASKAPPBUNDLEID_UNKNOWN";
  }
  else {
    v11 = off_1E5EBB3C8[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"taskAppBundleId"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_19;
  }
LABEL_13:
  if (has)
  {
LABEL_23:
    unsigned int v14 = [(ODMSiriSchemaODMDynamicDimensions *)self viewMode] - 1;
    if (v14 > 6) {
      v15 = @"ODMSIRIUIVIEWMODE_UNKNOWN";
    }
    else {
      v15 = off_1E5EBB400[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"viewMode"];
  }
LABEL_27:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_viewMode;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_audioInterface;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_taskType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_taskAppBundleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
  uint64_t v6 = [v4 siriInputLocale];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    unsigned int v10 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
    v11 = [v4 siriInputLocale];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $23F3F1D064460F7B771191FA2FA872D8 has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    int viewMode = self->_viewMode;
    if (viewMode != [v4 viewMode]) {
      goto LABEL_24;
    }
    $23F3F1D064460F7B771191FA2FA872D8 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    int audioInterface = self->_audioInterface;
    if (audioInterface != [v4 audioInterface]) {
      goto LABEL_24;
    }
    $23F3F1D064460F7B771191FA2FA872D8 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int taskType = self->_taskType;
    if (taskType == [v4 taskType])
    {
      $23F3F1D064460F7B771191FA2FA872D8 has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int taskAppBundleId = self->_taskAppBundleId;
    if (taskAppBundleId != [v4 taskAppBundleId]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];

  if (v4)
  {
    uint64_t v5 = [(ODMSiriSchemaODMDynamicDimensions *)self siriInputLocale];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMDynamicDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTaskAppBundleId
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTaskAppBundleId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTaskAppBundleId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTaskAppBundleId:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int taskAppBundleId = a3;
}

- (void)deleteTaskType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTaskType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTaskType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTaskType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int taskType = a3;
}

- (void)deleteAudioInterface
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioInterface:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioInterface
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int audioInterface = a3;
}

- (void)deleteViewMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasViewMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasViewMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setViewMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int viewMode = a3;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

@end