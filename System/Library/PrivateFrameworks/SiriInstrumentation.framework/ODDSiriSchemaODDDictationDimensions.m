@interface ODDSiriSchemaODDDictationDimensions
- (BOOL)hasAsrLocation;
- (BOOL)hasAudioInterfaceProductId;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasDictationLocale;
- (BOOL)hasSystemBuild;
- (BOOL)hasViewInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (NSString)systemBuild;
- (ODDSiriSchemaODDDictationDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationDimensions)initWithJSON:(id)a3;
- (SISchemaISOLocale)dictationLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)asrLocation;
- (int)dataSharingOptInStatus;
- (int)viewInterface;
- (unint64_t)hash;
- (void)deleteAsrLocation;
- (void)deleteAudioInterfaceProductId;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteDataSharingOptInStatus;
- (void)deleteDictationLocale;
- (void)deleteSystemBuild;
- (void)deleteViewInterface;
- (void)setAsrLocation:(int)a3;
- (void)setAudioInterfaceProductId:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setDataSharingOptInStatus:(int)a3;
- (void)setDictationLocale:(id)a3;
- (void)setHasAsrLocation:(BOOL)a3;
- (void)setHasAudioInterfaceProductId:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasDictationLocale:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasViewInterface:(BOOL)a3;
- (void)setSystemBuild:(id)a3;
- (void)setViewInterface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDDictationDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDDictationDimensions *)self deleteDictationLocale];
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
  objc_storeStrong((id *)&self->_dictationLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasDictationLocale:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasAudioInterfaceProductId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setDictationLocale:(id)a3
{
}

- (SISchemaISOLocale)dictationLocale
{
  return self->_dictationLocale;
}

- (int)asrLocation
{
  return self->_asrLocation;
}

- (void)setAudioInterfaceProductId:(id)a3
{
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (ODDSiriSchemaODDDictationDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDDictationDimensions;
  v5 = [(ODDSiriSchemaODDDictationDimensions *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ODDSiriSchemaODDDictationDimensions *)v5 setSystemBuild:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"dataSharingOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationDimensions setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"viewInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationDimensions setViewInterface:](v5, "setViewInterface:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDDictationDimensions *)v5 setAudioInterfaceVendorId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"audioInterfaceProductId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDDictationDimensions *)v5 setAudioInterfaceProductId:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"asrLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDDictationDimensions setAsrLocation:](v5, "setAsrLocation:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"dictationLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaISOLocale alloc] initWithDictionary:v15];
      [(ODDSiriSchemaODDDictationDimensions *)v5 setDictationLocale:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationDimensions *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = [(ODDSiriSchemaODDDictationDimensions *)self asrLocation];
    v5 = @"ORCHSIRIASRMODE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"ORCHSIRIASRMODE_SERVER";
    }
    if (v4 == 2) {
      v6 = @"ORCHSIRIASRMODE_DEVICE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"asrLocation"];
  }
  if (self->_audioInterfaceProductId)
  {
    uint64_t v7 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceProductId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"audioInterfaceProductId"];
  }
  if (self->_audioInterfaceVendorId)
  {
    objc_super v9 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceVendorId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v11 = [(ODDSiriSchemaODDDictationDimensions *)self dataSharingOptInStatus] - 1;
    if (v11 > 2) {
      v12 = @"UNKNOWN";
    }
    else {
      v12 = off_1E5EBD2B8[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"dataSharingOptInStatus"];
  }
  if (self->_dictationLocale)
  {
    v13 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"dictationLocale"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"dictationLocale"];
    }
  }
  if (self->_systemBuild)
  {
    v16 = [(ODDSiriSchemaODDDictationDimensions *)self systemBuild];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"systemBuild"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v18 = [(ODDSiriSchemaODDDictationDimensions *)self viewInterface] - 1;
    if (v18 > 7) {
      objc_super v19 = @"ASSISTANTVIEWMODE_UNKNOWN";
    }
    else {
      objc_super v19 = off_1E5EBD2D0[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"viewInterface"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_systemBuild hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_dataSharingOptInStatus;
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
      uint64_t v5 = 2654435761 * self->_viewInterface;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_audioInterfaceVendorId hash];
  NSUInteger v7 = [(NSString *)self->_audioInterfaceProductId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_asrLocation;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(SISchemaISOLocale *)self->_dictationLocale hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationDimensions *)self systemBuild];
  NSUInteger v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationDimensions *)self systemBuild];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    objc_super v9 = [(ODDSiriSchemaODDDictationDimensions *)self systemBuild];
    v10 = [v4 systemBuild];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  $95A3D8DBD031F8DA9D649EFC8CBA09F8 has = self->_has;
  unsigned int v13 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_32;
  }
  if (*(unsigned char *)&has)
  {
    int dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != [v4 dataSharingOptInStatus]) {
      goto LABEL_32;
    }
    $95A3D8DBD031F8DA9D649EFC8CBA09F8 has = self->_has;
    unsigned int v13 = v4[56];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_32;
  }
  if (v15)
  {
    int viewInterface = self->_viewInterface;
    if (viewInterface != [v4 viewInterface]) {
      goto LABEL_32;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceVendorId];
  NSUInteger v6 = [v4 audioInterfaceVendorId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceVendorId];
  if (v17)
  {
    unsigned int v18 = (void *)v17;
    objc_super v19 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceVendorId];
    v20 = [v4 audioInterfaceVendorId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceProductId];
  NSUInteger v6 = [v4 audioInterfaceProductId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceProductId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceProductId];
    v25 = [v4 audioInterfaceProductId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v27 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v27 != ((v4[56] >> 2) & 1)) {
    goto LABEL_32;
  }
  if (v27)
  {
    int asrLocation = self->_asrLocation;
    if (asrLocation != [v4 asrLocation]) {
      goto LABEL_32;
    }
  }
  uint64_t v5 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
  NSUInteger v6 = [v4 dictationLocale];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v29 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
  if (!v29)
  {

LABEL_35:
    BOOL v34 = 1;
    goto LABEL_33;
  }
  v30 = (void *)v29;
  v31 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
  v32 = [v4 dictationLocale];
  char v33 = [v31 isEqual:v32];

  if (v33) {
    goto LABEL_35;
  }
LABEL_32:
  BOOL v34 = 0;
LABEL_33:

  return v34;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDDictationDimensions *)self systemBuild];

  if (v4) {
    PBDataWriterWriteStringField();
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
  NSUInteger v6 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceVendorId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationDimensions *)self audioInterfaceProductId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v8 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];

  objc_super v9 = v11;
  if (v8)
  {
    v10 = [(ODDSiriSchemaODDDictationDimensions *)self dictationLocale];
    PBDataWriterWriteSubmessage();

    objc_super v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteDictationLocale
{
}

- (BOOL)hasDictationLocale
{
  return self->_dictationLocale != 0;
}

- (void)deleteAsrLocation
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAsrLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAsrLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAsrLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int asrLocation = a3;
}

- (void)deleteAudioInterfaceProductId
{
}

- (BOOL)hasAudioInterfaceProductId
{
  return self->_audioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteViewInterface
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasViewInterface:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasViewInterface
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setViewInterface:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int viewInterface = a3;
}

- (void)deleteDataSharingOptInStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int dataSharingOptInStatus = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

@end