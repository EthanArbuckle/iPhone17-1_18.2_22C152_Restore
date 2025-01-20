@interface LTSchemaTask
- (BOOL)hasBundleIdentifier;
- (BOOL)hasDeviceOS;
- (BOOL)hasDeviceType;
- (BOOL)hasOsVersion;
- (BOOL)hasSourceLanguage;
- (BOOL)hasTargetLanguage;
- (BOOL)hasTranslationTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaTask)initWithDictionary:(id)a3;
- (LTSchemaTask)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)bundleIdentifier;
- (NSString)deviceOS;
- (NSString)deviceType;
- (NSString)osVersion;
- (NSString)sourceLanguage;
- (NSString)targetLanguage;
- (NSString)translationTask;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteBundleIdentifier;
- (void)deleteDeviceOS;
- (void)deleteDeviceType;
- (void)deleteOsVersion;
- (void)deleteSourceLanguage;
- (void)deleteTargetLanguage;
- (void)deleteTranslationTask;
- (void)setBundleIdentifier:(id)a3;
- (void)setDeviceOS:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setHasBundleIdentifier:(BOOL)a3;
- (void)setHasDeviceOS:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasOsVersion:(BOOL)a3;
- (void)setHasSourceLanguage:(BOOL)a3;
- (void)setHasTargetLanguage:(BOOL)a3;
- (void)setHasTranslationTask:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setSourceLanguage:(id)a3;
- (void)setTargetLanguage:(id)a3;
- (void)setTranslationTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaTask

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_targetLanguage, 0);
  objc_storeStrong((id *)&self->_sourceLanguage, 0);
  objc_storeStrong((id *)&self->_translationTask, 0);
}

- (void)setHasBundleIdentifier:(BOOL)a3
{
  self->_hasBundleIdentifier = a3;
}

- (void)setHasOsVersion:(BOOL)a3
{
  self->_hasOsVersion = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasDeviceOS:(BOOL)a3
{
  self->_hasDeviceOS = a3;
}

- (void)setHasTargetLanguage:(BOOL)a3
{
  self->_hasTargetLanguage = a3;
}

- (void)setHasSourceLanguage:(BOOL)a3
{
  self->_hasSourceLanguage = a3;
}

- (void)setHasTranslationTask:(BOOL)a3
{
  self->_hasTranslationTask = a3;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceOS:(id)a3
{
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (void)setTargetLanguage:(id)a3
{
}

- (NSString)targetLanguage
{
  return self->_targetLanguage;
}

- (void)setSourceLanguage:(id)a3
{
}

- (NSString)sourceLanguage
{
  return self->_sourceLanguage;
}

- (void)setTranslationTask:(id)a3
{
}

- (NSString)translationTask
{
  return self->_translationTask;
}

- (LTSchemaTask)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LTSchemaTask;
  v5 = [(LTSchemaTask *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"translationTask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaTask *)v5 setTranslationTask:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sourceLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaTask *)v5 setSourceLanguage:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"targetLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(LTSchemaTask *)v5 setTargetLanguage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"deviceOS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(LTSchemaTask *)v5 setDeviceOS:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(LTSchemaTask *)v5 setDeviceType:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"osVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(LTSchemaTask *)v5 setOsVersion:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(LTSchemaTask *)v5 setBundleIdentifier:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (LTSchemaTask)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaTask *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaTask *)self dictionaryRepresentation];
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
  if (self->_bundleIdentifier)
  {
    id v4 = [(LTSchemaTask *)self bundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_deviceOS)
  {
    v6 = [(LTSchemaTask *)self deviceOS];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"deviceOS"];
  }
  if (self->_deviceType)
  {
    v8 = [(LTSchemaTask *)self deviceType];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"deviceType"];
  }
  if (self->_osVersion)
  {
    v10 = [(LTSchemaTask *)self osVersion];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"osVersion"];
  }
  if (self->_sourceLanguage)
  {
    v12 = [(LTSchemaTask *)self sourceLanguage];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"sourceLanguage"];
  }
  if (self->_targetLanguage)
  {
    v14 = [(LTSchemaTask *)self targetLanguage];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"targetLanguage"];
  }
  if (self->_translationTask)
  {
    v16 = [(LTSchemaTask *)self translationTask];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"translationTask"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_translationTask hash];
  NSUInteger v4 = [(NSString *)self->_sourceLanguage hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_targetLanguage hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceOS hash];
  NSUInteger v7 = [(NSString *)self->_deviceType hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_osVersion hash];
  return v6 ^ v8 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  NSUInteger v5 = [(LTSchemaTask *)self translationTask];
  NSUInteger v6 = [v4 translationTask];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(LTSchemaTask *)self translationTask];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    v9 = [(LTSchemaTask *)self translationTask];
    v10 = [v4 translationTask];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self sourceLanguage];
  NSUInteger v6 = [v4 sourceLanguage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(LTSchemaTask *)self sourceLanguage];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(LTSchemaTask *)self sourceLanguage];
    v15 = [v4 sourceLanguage];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self targetLanguage];
  NSUInteger v6 = [v4 targetLanguage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(LTSchemaTask *)self targetLanguage];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(LTSchemaTask *)self targetLanguage];
    v20 = [v4 targetLanguage];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self deviceOS];
  NSUInteger v6 = [v4 deviceOS];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(LTSchemaTask *)self deviceOS];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(LTSchemaTask *)self deviceOS];
    v25 = [v4 deviceOS];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self deviceType];
  NSUInteger v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(LTSchemaTask *)self deviceType];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(LTSchemaTask *)self deviceType];
    v30 = [v4 deviceType];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self osVersion];
  NSUInteger v6 = [v4 osVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(LTSchemaTask *)self osVersion];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(LTSchemaTask *)self osVersion];
    v35 = [v4 osVersion];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaTask *)self bundleIdentifier];
  NSUInteger v6 = [v4 bundleIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(LTSchemaTask *)self bundleIdentifier];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    v39 = [(LTSchemaTask *)self bundleIdentifier];
    v40 = [v4 bundleIdentifier];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(LTSchemaTask *)self translationTask];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(LTSchemaTask *)self sourceLanguage];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(LTSchemaTask *)self targetLanguage];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(LTSchemaTask *)self deviceOS];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(LTSchemaTask *)self deviceType];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(LTSchemaTask *)self osVersion];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  v10 = [(LTSchemaTask *)self bundleIdentifier];

  int v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaTaskReadFrom(self, (uint64_t)a3);
}

- (void)deleteBundleIdentifier
{
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)deleteOsVersion
{
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceOS
{
}

- (BOOL)hasDeviceOS
{
  return self->_deviceOS != 0;
}

- (void)deleteTargetLanguage
{
}

- (BOOL)hasTargetLanguage
{
  return self->_targetLanguage != 0;
}

- (void)deleteSourceLanguage
{
}

- (BOOL)hasSourceLanguage
{
  return self->_sourceLanguage != 0;
}

- (void)deleteTranslationTask
{
}

- (BOOL)hasTranslationTask
{
  return self->_translationTask != 0;
}

@end