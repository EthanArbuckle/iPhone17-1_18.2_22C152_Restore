@interface ODDSiriSchemaODDDeviceAndUsageDynamicDimensions
- (BOOL)hasAppTaskType;
- (BOOL)hasAudioInterface;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasTaskAppBundleId;
- (BOOL)hasViewInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appTaskType;
- (int)audioInterface;
- (int)taskAppBundleId;
- (int)viewInterface;
- (unint64_t)hash;
- (void)deleteAppTaskType;
- (void)deleteAudioInterface;
- (void)deleteSiriInputLocale;
- (void)deleteTaskAppBundleId;
- (void)deleteViewInterface;
- (void)setAppTaskType:(int)a3;
- (void)setAudioInterface:(int)a3;
- (void)setHasAppTaskType:(BOOL)a3;
- (void)setHasAudioInterface:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasTaskAppBundleId:(BOOL)a3;
- (void)setHasViewInterface:(BOOL)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setTaskAppBundleId:(int)a3;
- (void)setViewInterface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDeviceAndUsageDynamicDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDDeviceAndUsageDynamicDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self deleteSiriInputLocale];
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

- (int)appTaskType
{
  return self->_appTaskType;
}

- (int)audioInterface
{
  return self->_audioInterface;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODDSiriSchemaODDDeviceAndUsageDynamicDimensions;
  v5 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaISOLocale alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)v5 setSiriInputLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"viewInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setViewInterface:](v5, "setViewInterface:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"audioInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAudioInterface:](v5, "setAudioInterface:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appTaskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setAppTaskType:](v5, "setAppTaskType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"taskAppBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDeviceAndUsageDynamicDimensions setTaskAppBundleId:](v5, "setTaskAppBundleId:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDeviceAndUsageDynamicDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self dictionaryRepresentation];
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
    unsigned int v5 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self appTaskType] - 1;
    if (v5 > 3) {
      v6 = @"ODDAPPTASKTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBD4F8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"appTaskType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self audioInterface] - 1;
    if (v7 > 0xE) {
      v8 = @"AUDIOINPUTROUTE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBD518[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"audioInterface"];
  }
  if (self->_siriInputLocale)
  {
    objc_super v9 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    unsigned int v13 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self taskAppBundleId] - 1;
    if (v13 > 2) {
      objc_super v14 = @"ODDTASKAPPBUNDLEID_UNKNOWN";
    }
    else {
      objc_super v14 = off_1E5EBD590[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"taskAppBundleId"];
    char v12 = (char)self->_has;
  }
  if (v12)
  {
    unsigned int v15 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self viewInterface] - 1;
    if (v15 > 7) {
      v16 = @"ASSISTANTVIEWMODE_UNKNOWN";
    }
    else {
      v16 = off_1E5EBD5A8[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"viewInterface"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_viewInterface;
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
  uint64_t v6 = 2654435761 * self->_appTaskType;
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
  uint64_t v5 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
  uint64_t v6 = [v4 siriInputLocale];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
    v11 = [v4 siriInputLocale];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $8AA122162F5E67FA27E0DE1A795B73C2 has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    int viewInterface = self->_viewInterface;
    if (viewInterface != [v4 viewInterface]) {
      goto LABEL_24;
    }
    $8AA122162F5E67FA27E0DE1A795B73C2 has = self->_has;
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
    $8AA122162F5E67FA27E0DE1A795B73C2 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int appTaskType = self->_appTaskType;
    if (appTaskType == [v4 appTaskType])
    {
      $8AA122162F5E67FA27E0DE1A795B73C2 has = self->_has;
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
  uint64_t v4 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDDeviceAndUsageDynamicDimensions *)self siriInputLocale];
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
  return ODDSiriSchemaODDDeviceAndUsageDynamicDimensionsReadFrom(self, (uint64_t)a3);
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

- (void)deleteAppTaskType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAppTaskType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppTaskType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppTaskType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int appTaskType = a3;
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

- (void)deleteViewInterface
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasViewInterface:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasViewInterface
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setViewInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int viewInterface = a3;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

@end