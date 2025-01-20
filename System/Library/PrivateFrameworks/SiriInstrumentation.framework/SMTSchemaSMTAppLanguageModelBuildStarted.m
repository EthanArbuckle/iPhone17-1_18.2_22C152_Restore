@interface SMTSchemaSMTAppLanguageModelBuildStarted
- (BOOL)hasAppBundleId;
- (BOOL)hasArtifactSizeInBytes;
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)appBundleId;
- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithDictionary:(id)a3;
- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)artifactSizeInBytes;
- (unint64_t)hash;
- (void)deleteAppBundleId;
- (void)deleteArtifactSizeInBytes;
- (void)deleteLocale;
- (void)setAppBundleId:(id)a3;
- (void)setArtifactSizeInBytes:(unint64_t)a3;
- (void)setHasAppBundleId:(BOOL)a3;
- (void)setHasArtifactSizeInBytes:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SMTSchemaSMTAppLanguageModelBuildStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)locale
{
  return self->_locale;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (unint64_t)artifactSizeInBytes
{
  return self->_artifactSizeInBytes;
}

- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SMTSchemaSMTAppLanguageModelBuildStarted;
  v5 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"artifactSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildStarted setArtifactSizeInBytes:](v5, "setArtifactSizeInBytes:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"appBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SMTSchemaSMTAppLanguageModelBuildStarted *)v5 setAppBundleId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelBuildStarted setLocale:](v5, "setLocale:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (SMTSchemaSMTAppLanguageModelBuildStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self dictionaryRepresentation];
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
  if (self->_appBundleId)
  {
    id v4 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self appBundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SMTSchemaSMTAppLanguageModelBuildStarted artifactSizeInBytes](self, "artifactSizeInBytes"));
    [v3 setObject:v7 forKeyedSubscript:@"artifactSizeInBytes"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self locale] - 1;
    if (v8 > 0x3D) {
      v9 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v9 = off_1E5EB9198[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"locale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_artifactSizeInBytes;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_appBundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_locale;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t artifactSizeInBytes = self->_artifactSizeInBytes;
    if (artifactSizeInBytes != [v4 artifactSizeInBytes]) {
      goto LABEL_15;
    }
  }
  v6 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self appBundleId];
  uint64_t v7 = [v4 appBundleId];
  unsigned int v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self appBundleId];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self appBundleId];
    objc_super v12 = [v4 appBundleId];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    int locale = self->_locale;
    if (locale != [v4 locale]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v4 = [(SMTSchemaSMTAppLanguageModelBuildStarted *)self appBundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelBuildStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int locale = a3;
}

- (void)deleteAppBundleId
{
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)deleteArtifactSizeInBytes
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasArtifactSizeInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArtifactSizeInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setArtifactSizeInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t artifactSizeInBytes = a3;
}

@end