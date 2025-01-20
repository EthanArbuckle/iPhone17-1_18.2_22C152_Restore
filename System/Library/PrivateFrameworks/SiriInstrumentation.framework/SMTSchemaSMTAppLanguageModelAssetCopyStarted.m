@interface SMTSchemaSMTAppLanguageModelAssetCopyStarted
- (BOOL)hasAppAssetPath;
- (BOOL)hasAppBundleId;
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)appAssetPath;
- (NSString)appBundleId;
- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithDictionary:(id)a3;
- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)hash;
- (void)deleteAppAssetPath;
- (void)deleteAppBundleId;
- (void)deleteLocale;
- (void)setAppAssetPath:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setHasAppAssetPath:(BOOL)a3;
- (void)setHasAppBundleId:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SMTSchemaSMTAppLanguageModelAssetCopyStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAssetPath, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)setHasAppAssetPath:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAppAssetPath:(id)a3
{
}

- (NSString)appAssetPath
{
  return self->_appAssetPath;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (int)locale
{
  return self->_locale;
}

- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SMTSchemaSMTAppLanguageModelAssetCopyStarted;
  v5 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SMTSchemaSMTAppLanguageModelAssetCopyStarted setLocale:](v5, "setLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"appBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)v5 setAppBundleId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"appAssetPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)v5 setAppAssetPath:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SMTSchemaSMTAppLanguageModelAssetCopyStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self dictionaryRepresentation];
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
  if (self->_appAssetPath)
  {
    id v4 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appAssetPath];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appAssetPath"];
  }
  if (self->_appBundleId)
  {
    v6 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appBundleId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"appBundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v8 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self locale] - 1;
    if (v8 > 0x3D) {
      v9 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v9 = off_1E5EB8FA8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"locale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_locale;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_appBundleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_appAssetPath hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int locale = self->_locale;
    if (locale != [v4 locale]) {
      goto LABEL_15;
    }
  }
  v6 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appBundleId];
  uint64_t v7 = [v4 appBundleId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appBundleId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appBundleId];
    v11 = [v4 appBundleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appAssetPath];
  uint64_t v7 = [v4 appAssetPath];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appAssetPath];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appAssetPath];
    v16 = [v4 appAssetPath];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appBundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SMTSchemaSMTAppLanguageModelAssetCopyStarted *)self appAssetPath];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SMTSchemaSMTAppLanguageModelAssetCopyStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppAssetPath
{
}

- (BOOL)hasAppAssetPath
{
  return self->_appAssetPath != 0;
}

- (void)deleteAppBundleId
{
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLocale:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int locale = a3;
}

@end