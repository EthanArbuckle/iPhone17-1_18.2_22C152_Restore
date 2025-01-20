@interface ODMSiriSchemaODMDynamicDimensionsAll
- (BOOL)hasAudioInterface;
- (BOOL)hasProduct;
- (BOOL)hasSiriAsrLocation;
- (BOOL)hasSiriDataSharingOptInStatus;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasSiriNlLocation;
- (BOOL)hasViewMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODMSiriSchemaODMDynamicDimensionsAll)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMDynamicDimensionsAll)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioInterface;
- (int)product;
- (int)siriAsrLocation;
- (int)siriDataSharingOptInStatus;
- (int)siriNlLocation;
- (int)viewMode;
- (unint64_t)hash;
- (void)deleteAudioInterface;
- (void)deleteProduct;
- (void)deleteSiriAsrLocation;
- (void)deleteSiriDataSharingOptInStatus;
- (void)deleteSiriInputLocale;
- (void)deleteSiriNlLocation;
- (void)deleteViewMode;
- (void)setAudioInterface:(int)a3;
- (void)setHasAudioInterface:(BOOL)a3;
- (void)setHasProduct:(BOOL)a3;
- (void)setHasSiriAsrLocation:(BOOL)a3;
- (void)setHasSiriDataSharingOptInStatus:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasSiriNlLocation:(BOOL)a3;
- (void)setHasViewMode:(BOOL)a3;
- (void)setProduct:(int)a3;
- (void)setSiriAsrLocation:(int)a3;
- (void)setSiriDataSharingOptInStatus:(int)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setSiriNlLocation:(int)a3;
- (void)setViewMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMDynamicDimensionsAll

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMDynamicDimensionsAll;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODMSiriSchemaODMDynamicDimensionsAll *)self deleteSiriInputLocale];
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

- (int)siriDataSharingOptInStatus
{
  return self->_siriDataSharingOptInStatus;
}

- (int)siriNlLocation
{
  return self->_siriNlLocation;
}

- (int)siriAsrLocation
{
  return self->_siriAsrLocation;
}

- (int)product
{
  return self->_product;
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

- (ODMSiriSchemaODMDynamicDimensionsAll)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODMSiriSchemaODMDynamicDimensionsAll;
  v5 = [(ODMSiriSchemaODMDynamicDimensionsAll *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaISOLocale alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMDynamicDimensionsAll *)v5 setSiriInputLocale:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"viewMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setViewMode:](v5, "setViewMode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"audioInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setAudioInterface:](v5, "setAudioInterface:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"product"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setProduct:](v5, "setProduct:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"siriAsrLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriAsrLocation:](v5, "setSiriAsrLocation:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"siriNlLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriNlLocation:](v5, "setSiriNlLocation:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"siriDataSharingOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMDynamicDimensionsAll setSiriDataSharingOptInStatus:](v5, "setSiriDataSharingOptInStatus:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMDynamicDimensionsAll)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMDynamicDimensionsAll *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self dictionaryRepresentation];
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
    unsigned int v5 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self audioInterface] - 1;
    if (v5 > 0xE) {
      v6 = @"AUDIOINPUTROUTE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBC0A8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"audioInterface"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  int v7 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self product];
  v8 = @"PRODUCT_UNKNOWN";
  if (v7 == 1) {
    v8 = @"PRODUCT_ASSISTANT";
  }
  if (v7 == 2) {
    objc_super v9 = @"PRODUCT_DICTATION";
  }
  else {
    objc_super v9 = v8;
  }
  [v3 setObject:v9 forKeyedSubscript:@"product"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_16:
  int v10 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriAsrLocation];
  v11 = @"ORCHSIRIASRMODE_UNKNOWN";
  if (v10 == 1) {
    v11 = @"ORCHSIRIASRMODE_SERVER";
  }
  if (v10 == 2) {
    v12 = @"ORCHSIRIASRMODE_DEVICE";
  }
  else {
    v12 = v11;
  }
  [v3 setObject:v12 forKeyedSubscript:@"siriAsrLocation"];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    unsigned int v13 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriDataSharingOptInStatus] - 1;
    if (v13 > 2) {
      v14 = @"UNKNOWN";
    }
    else {
      v14 = off_1E5EBC120[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"siriDataSharingOptInStatus"];
  }
LABEL_26:
  if (self->_siriInputLocale)
  {
    v15 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
    objc_super v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  char v18 = (char)self->_has;
  if ((v18 & 0x10) != 0)
  {
    int v19 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriNlLocation];
    v20 = @"ORCHSIRINLMODE_UNKNOWN";
    if (v19 == 1) {
      v20 = @"ORCHSIRINLMODE_NLV3_SERVER";
    }
    if (v19 == 2) {
      v21 = @"ORCHSIRINLMODE_NLX_DEVICE";
    }
    else {
      v21 = v20;
    }
    [v3 setObject:v21 forKeyedSubscript:@"siriNlLocation"];
    char v18 = (char)self->_has;
  }
  if (v18)
  {
    unsigned int v22 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self viewMode] - 1;
    if (v22 > 6) {
      v23 = @"ODMSIRIUIVIEWMODE_UNKNOWN";
    }
    else {
      v23 = off_1E5EBC138[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"viewMode"];
  }
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
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_product;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_siriAsrLocation;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_siriNlLocation;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_siriDataSharingOptInStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
  uint64_t v6 = [v4 siriInputLocale];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_32;
  }
  uint64_t v8 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    int v10 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
    v11 = [v4 siriInputLocale];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
  unsigned int v14 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_32:
    BOOL v26 = 0;
    goto LABEL_33;
  }
  if (*(unsigned char *)&has)
  {
    int viewMode = self->_viewMode;
    if (viewMode != [v4 viewMode]) {
      goto LABEL_32;
    }
    $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_32;
  }
  if (v16)
  {
    int audioInterface = self->_audioInterface;
    if (audioInterface != [v4 audioInterface]) {
      goto LABEL_32;
    }
    $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_32;
  }
  if (v18)
  {
    int product = self->_product;
    if (product != [v4 product]) {
      goto LABEL_32;
    }
    $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_32;
  }
  if (v20)
  {
    int siriAsrLocation = self->_siriAsrLocation;
    if (siriAsrLocation != [v4 siriAsrLocation]) {
      goto LABEL_32;
    }
    $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
    unsigned int v14 = v4[40];
  }
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_32;
  }
  if (v22)
  {
    int siriNlLocation = self->_siriNlLocation;
    if (siriNlLocation == [v4 siriNlLocation])
    {
      $0D2C39329533C3CFC09EEDCB26174B17 has = self->_has;
      unsigned int v14 = v4[40];
      goto LABEL_28;
    }
    goto LABEL_32;
  }
LABEL_28:
  int v24 = (*(unsigned int *)&has >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_32;
  }
  if (v24)
  {
    int siriDataSharingOptInStatus = self->_siriDataSharingOptInStatus;
    if (siriDataSharingOptInStatus != [v4 siriDataSharingOptInStatus]) {
      goto LABEL_32;
    }
  }
  BOOL v26 = 1;
LABEL_33:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];

  if (v4)
  {
    uint64_t v5 = [(ODMSiriSchemaODMDynamicDimensionsAll *)self siriInputLocale];
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
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMDynamicDimensionsAllReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriDataSharingOptInStatus
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasSiriDataSharingOptInStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSiriDataSharingOptInStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSiriDataSharingOptInStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int siriDataSharingOptInStatus = a3;
}

- (void)deleteSiriNlLocation
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasSiriNlLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSiriNlLocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSiriNlLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int siriNlLocation = a3;
}

- (void)deleteSiriAsrLocation
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSiriAsrLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSiriAsrLocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSiriAsrLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int siriAsrLocation = a3;
}

- (void)deleteProduct
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasProduct:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProduct
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProduct:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int product = a3;
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