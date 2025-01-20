@interface ODDSiriSchemaODDGeneralProperties
- (BOOL)hasAssetSetStatus;
- (BOOL)hasBuildInstallationTimestampInSecondsSince1970;
- (BOOL)hasDeviceOS;
- (BOOL)hasDeviceType;
- (BOOL)hasIsStoreDemoMode;
- (BOOL)hasModelNumber;
- (BOOL)hasStorefrontId;
- (BOOL)hasSystemLocale;
- (BOOL)hasUTCOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreDemoMode;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)deviceOS;
- (NSString)deviceType;
- (NSString)modelNumber;
- (ODDSiriSchemaODDGeneralProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDGeneralProperties)initWithJSON:(id)a3;
- (SISchemaISOLocale)systemLocale;
- (UAFSchemaUAFAssetSetStatus)assetSetStatus;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)UTCOffset;
- (int)storefrontId;
- (unint64_t)buildInstallationTimestampInSecondsSince1970;
- (unint64_t)hash;
- (void)deleteAssetSetStatus;
- (void)deleteBuildInstallationTimestampInSecondsSince1970;
- (void)deleteDeviceOS;
- (void)deleteDeviceType;
- (void)deleteIsStoreDemoMode;
- (void)deleteModelNumber;
- (void)deleteStorefrontId;
- (void)deleteSystemLocale;
- (void)deleteUTCOffset;
- (void)setAssetSetStatus:(id)a3;
- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3;
- (void)setDeviceOS:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setHasAssetSetStatus:(BOOL)a3;
- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3;
- (void)setHasDeviceOS:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasIsStoreDemoMode:(BOOL)a3;
- (void)setHasModelNumber:(BOOL)a3;
- (void)setHasStorefrontId:(BOOL)a3;
- (void)setHasSystemLocale:(BOOL)a3;
- (void)setHasUTCOffset:(BOOL)a3;
- (void)setIsStoreDemoMode:(BOOL)a3;
- (void)setModelNumber:(id)a3;
- (void)setStorefrontId:(int)a3;
- (void)setSystemLocale:(id)a3;
- (void)setUTCOffset:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDGeneralProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDGeneralProperties;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDGeneralProperties *)self deleteSystemLocale];
  }
  v9 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDGeneralProperties *)self deleteAssetSetStatus];
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
  objc_storeStrong((id *)&self->_assetSetStatus, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
}

- (void)setHasAssetSetStatus:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasDeviceOS:(BOOL)a3
{
  self->_hasSystemLocale = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAssetSetStatus:(id)a3
{
}

- (UAFSchemaUAFAssetSetStatus)assetSetStatus
{
  return self->_assetSetStatus;
}

- (unint64_t)buildInstallationTimestampInSecondsSince1970
{
  return self->_buildInstallationTimestampInSecondsSince1970;
}

- (BOOL)isStoreDemoMode
{
  return self->_isStoreDemoMode;
}

- (void)setDeviceOS:(id)a3
{
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (int)UTCOffset
{
  return self->_UTCOffset;
}

- (int)storefrontId
{
  return self->_storefrontId;
}

- (void)setSystemLocale:(id)a3
{
}

- (SISchemaISOLocale)systemLocale
{
  return self->_systemLocale;
}

- (ODDSiriSchemaODDGeneralProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ODDSiriSchemaODDGeneralProperties;
  v5 = [(ODDSiriSchemaODDGeneralProperties *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"systemLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaISOLocale alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDGeneralProperties *)v5 setSystemLocale:v7];
    }
    v23 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"storefrontId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDGeneralProperties setStorefrontId:](v5, "setStorefrontId:", [v8 intValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"UTCOffset", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDGeneralProperties setUTCOffset:](v5, "setUTCOffset:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDGeneralProperties *)v5 setDeviceType:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"modelNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDGeneralProperties *)v5 setModelNumber:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"deviceOS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(ODDSiriSchemaODDGeneralProperties *)v5 setDeviceOS:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"isStoreDemoMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDGeneralProperties setIsStoreDemoMode:](v5, "setIsStoreDemoMode:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDGeneralProperties setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", [v17 unsignedLongLongValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"assetSetStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[UAFSchemaUAFAssetSetStatus alloc] initWithDictionary:v18];
      [(ODDSiriSchemaODDGeneralProperties *)v5 setAssetSetStatus:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDGeneralProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDGeneralProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDGeneralProperties *)self dictionaryRepresentation];
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
    unsigned int v4 = [(ODDSiriSchemaODDGeneralProperties *)self UTCOffset] - 1;
    if (v4 > 0x25) {
      v5 = @"UTCOFFSET_UNKNOWN";
    }
    else {
      v5 = off_1E5EBD670[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"UTCOffset"];
  }
  if (self->_assetSetStatus)
  {
    uint64_t v6 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"assetSetStatus"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"assetSetStatus"];
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDGeneralProperties buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    [v3 setObject:v9 forKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
  }
  if (self->_deviceOS)
  {
    v10 = [(ODDSiriSchemaODDGeneralProperties *)self deviceOS];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"deviceOS"];
  }
  if (self->_deviceType)
  {
    v12 = [(ODDSiriSchemaODDGeneralProperties *)self deviceType];
    objc_super v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"deviceType"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDGeneralProperties isStoreDemoMode](self, "isStoreDemoMode"));
    [v3 setObject:v14 forKeyedSubscript:@"isStoreDemoMode"];
  }
  if (self->_modelNumber)
  {
    v15 = [(ODDSiriSchemaODDGeneralProperties *)self modelNumber];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"modelNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInt:", -[ODDSiriSchemaODDGeneralProperties storefrontId](self, "storefrontId"));
    [v3 setObject:v17 forKeyedSubscript:@"storefrontId"];
  }
  if (self->_systemLocale)
  {
    v18 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"systemLocale"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"systemLocale"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaISOLocale *)self->_systemLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_storefrontId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_UTCOffset;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_deviceType hash];
  NSUInteger v7 = [(NSString *)self->_modelNumber hash];
  NSUInteger v8 = [(NSString *)self->_deviceOS hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_isStoreDemoMode;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(UAFSchemaUAFAssetSetStatus *)self->_assetSetStatus hash];
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v10 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(UAFSchemaUAFAssetSetStatus *)self->_assetSetStatus hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
  NSUInteger v6 = [v4 systemLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
    unint64_t v10 = [v4 systemLocale];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  $911EABDD144D96B5C286D3B90FC5BECC has = self->_has;
  unsigned int v13 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_41;
  }
  if (*(unsigned char *)&has)
  {
    int storefrontId = self->_storefrontId;
    if (storefrontId != [v4 storefrontId]) {
      goto LABEL_41;
    }
    $911EABDD144D96B5C286D3B90FC5BECC has = self->_has;
    unsigned int v13 = v4[72];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_41;
  }
  if (v15)
  {
    int UTCOffset = self->_UTCOffset;
    if (UTCOffset != [v4 UTCOffset]) {
      goto LABEL_41;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self deviceType];
  NSUInteger v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v17 = [(ODDSiriSchemaODDGeneralProperties *)self deviceType];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDGeneralProperties *)self deviceType];
    v20 = [v4 deviceType];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self modelNumber];
  NSUInteger v6 = [v4 modelNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v22 = [(ODDSiriSchemaODDGeneralProperties *)self modelNumber];
  if (v22)
  {
    v23 = (void *)v22;
    objc_super v24 = [(ODDSiriSchemaODDGeneralProperties *)self modelNumber];
    v25 = [v4 modelNumber];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self deviceOS];
  NSUInteger v6 = [v4 deviceOS];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v27 = [(ODDSiriSchemaODDGeneralProperties *)self deviceOS];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(ODDSiriSchemaODDGeneralProperties *)self deviceOS];
    v30 = [v4 deviceOS];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  $911EABDD144D96B5C286D3B90FC5BECC v32 = self->_has;
  int v33 = (*(unsigned int *)&v32 >> 2) & 1;
  unsigned int v34 = v4[72];
  if (v33 != ((v34 >> 2) & 1)) {
    goto LABEL_41;
  }
  if (v33)
  {
    int isStoreDemoMode = self->_isStoreDemoMode;
    if (isStoreDemoMode != [v4 isStoreDemoMode]) {
      goto LABEL_41;
    }
    $911EABDD144D96B5C286D3B90FC5BECC v32 = self->_has;
    unsigned int v34 = v4[72];
  }
  int v36 = (*(unsigned int *)&v32 >> 3) & 1;
  if (v36 != ((v34 >> 3) & 1)) {
    goto LABEL_41;
  }
  if (v36)
  {
    unint64_t buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != [v4 buildInstallationTimestampInSecondsSince1970])goto LABEL_41; {
  }
    }
  uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
  NSUInteger v6 = [v4 assetSetStatus];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v38 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
  if (!v38)
  {

LABEL_44:
    BOOL v43 = 1;
    goto LABEL_42;
  }
  v39 = (void *)v38;
  v40 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
  v41 = [v4 assetSetStatus];
  char v42 = [v40 isEqual:v41];

  if (v42) {
    goto LABEL_44;
  }
LABEL_41:
  BOOL v43 = 0;
LABEL_42:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];

  if (v4)
  {
    uint64_t v5 = [(ODDSiriSchemaODDGeneralProperties *)self systemLocale];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(ODDSiriSchemaODDGeneralProperties *)self deviceType];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(ODDSiriSchemaODDGeneralProperties *)self modelNumber];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(ODDSiriSchemaODDGeneralProperties *)self deviceOS];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  int v11 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];

  v12 = v14;
  if (v11)
  {
    unsigned int v13 = [(ODDSiriSchemaODDGeneralProperties *)self assetSetStatus];
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDGeneralPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetSetStatus
{
}

- (BOOL)hasAssetSetStatus
{
  return self->_assetSetStatus != 0;
}

- (void)deleteBuildInstallationTimestampInSecondsSince1970
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBuildInstallationTimestampInSecondsSince1970
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t buildInstallationTimestampInSecondsSince1970 = a3;
}

- (void)deleteIsStoreDemoMode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsStoreDemoMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsStoreDemoMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsStoreDemoMode:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isStoreDemoMode = a3;
}

- (void)deleteDeviceOS
{
}

- (BOOL)hasDeviceOS
{
  return self->_deviceOS != 0;
}

- (void)deleteModelNumber
{
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteUTCOffset
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUTCOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUTCOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUTCOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int UTCOffset = a3;
}

- (void)deleteStorefrontId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStorefrontId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStorefrontId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStorefrontId:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int storefrontId = a3;
}

- (void)deleteSystemLocale
{
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

@end