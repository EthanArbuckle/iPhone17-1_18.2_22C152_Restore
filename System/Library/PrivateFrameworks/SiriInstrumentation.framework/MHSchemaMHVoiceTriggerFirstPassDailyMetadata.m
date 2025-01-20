@interface MHSchemaMHVoiceTriggerFirstPassDailyMetadata
- (BOOL)hasConfigVersion;
- (BOOL)hasHardwareSampleRate;
- (BOOL)hasMitigationAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)configVersion;
- (NSString)mitigationAssetVersion;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)hardwareSampleRate;
- (unint64_t)hash;
- (void)deleteConfigVersion;
- (void)deleteHardwareSampleRate;
- (void)deleteMitigationAssetVersion;
- (void)setConfigVersion:(id)a3;
- (void)setHardwareSampleRate:(int)a3;
- (void)setHasConfigVersion:(BOOL)a3;
- (void)setHasHardwareSampleRate:(BOOL)a3;
- (void)setHasMitigationAssetVersion:(BOOL)a3;
- (void)setMitigationAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerFirstPassDailyMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

- (void)setHasMitigationAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMitigationAssetVersion:(id)a3
{
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (int)hardwareSampleRate
{
  return self->_hardwareSampleRate;
}

- (void)setConfigVersion:(id)a3
{
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHVoiceTriggerFirstPassDailyMetadata;
  v5 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"configVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)v5 setConfigVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"hardwareSampleRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata setHardwareSampleRate:](v5, "setHardwareSampleRate:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"mitigationAssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)v5 setMitigationAssetVersion:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerFirstPassDailyMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self dictionaryRepresentation];
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
  if (self->_configVersion)
  {
    id v4 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self configVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"configVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHVoiceTriggerFirstPassDailyMetadata hardwareSampleRate](self, "hardwareSampleRate"));
    [v3 setObject:v6 forKeyedSubscript:@"hardwareSampleRate"];
  }
  if (self->_mitigationAssetVersion)
  {
    uint64_t v7 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self mitigationAssetVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"mitigationAssetVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_configVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_hardwareSampleRate;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_mitigationAssetVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self configVersion];
  v6 = [v4 configVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self configVersion];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self configVersion];
    v10 = [v4 configVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int hardwareSampleRate = self->_hardwareSampleRate;
    if (hardwareSampleRate != [v4 hardwareSampleRate]) {
      goto LABEL_15;
    }
  }
  v5 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self mitigationAssetVersion];
  v6 = [v4 mitigationAssetVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self mitigationAssetVersion];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self mitigationAssetVersion];
    v16 = [v4 mitigationAssetVersion];
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
  uint64_t v4 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self configVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(MHSchemaMHVoiceTriggerFirstPassDailyMetadata *)self mitigationAssetVersion];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerFirstPassDailyMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteMitigationAssetVersion
{
}

- (BOOL)hasMitigationAssetVersion
{
  return self->_mitigationAssetVersion != 0;
}

- (void)deleteHardwareSampleRate
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHardwareSampleRate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHardwareSampleRate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHardwareSampleRate:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int hardwareSampleRate = a3;
}

- (void)deleteConfigVersion
{
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

@end