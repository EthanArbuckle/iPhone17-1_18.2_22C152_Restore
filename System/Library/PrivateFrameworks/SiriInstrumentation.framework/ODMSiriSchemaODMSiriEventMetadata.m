@interface ODMSiriSchemaODMSiriEventMetadata
- (BOOL)hasOdmId;
- (BOOL)hasPluginVersion;
- (BOOL)hasTrialExperimentIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)pluginVersion;
- (ODMSiriSchemaODMSiriEventMetadata)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMSiriEventMetadata)initWithJSON:(id)a3;
- (ODMSiriSchemaODMTrialExperimentIdentifiers)trialExperimentIdentifiers;
- (SISchemaUUID)odmId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteOdmId;
- (void)deletePluginVersion;
- (void)deleteTrialExperimentIdentifiers;
- (void)setHasOdmId:(BOOL)a3;
- (void)setHasPluginVersion:(BOOL)a3;
- (void)setHasTrialExperimentIdentifiers:(BOOL)a3;
- (void)setOdmId:(id)a3;
- (void)setPluginVersion:(id)a3;
- (void)setTrialExperimentIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMSiriEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODMSiriSchemaODMSiriEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODMSiriSchemaODMSiriEventMetadata *)self deleteOdmId];
  }
  v9 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODMSiriSchemaODMSiriEventMetadata *)self deleteTrialExperimentIdentifiers];
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
  objc_storeStrong((id *)&self->_trialExperimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_pluginVersion, 0);
  objc_storeStrong((id *)&self->_odmId, 0);
}

- (void)setHasTrialExperimentIdentifiers:(BOOL)a3
{
  self->_hasTrialExperimentIdentifiers = a3;
}

- (void)setHasPluginVersion:(BOOL)a3
{
  self->_hasPluginVersion = a3;
}

- (void)setHasOdmId:(BOOL)a3
{
  self->_hasOdmId = a3;
}

- (void)setTrialExperimentIdentifiers:(id)a3
{
}

- (ODMSiriSchemaODMTrialExperimentIdentifiers)trialExperimentIdentifiers
{
  return self->_trialExperimentIdentifiers;
}

- (void)setPluginVersion:(id)a3
{
}

- (NSString)pluginVersion
{
  return self->_pluginVersion;
}

- (void)setOdmId:(id)a3
{
}

- (SISchemaUUID)odmId
{
  return self->_odmId;
}

- (ODMSiriSchemaODMSiriEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODMSiriSchemaODMSiriEventMetadata;
  v5 = [(ODMSiriSchemaODMSiriEventMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"odmId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODMSiriSchemaODMSiriEventMetadata *)v5 setOdmId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"pluginVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ODMSiriSchemaODMSiriEventMetadata *)v5 setPluginVersion:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"trialExperimentIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODMSiriSchemaODMTrialExperimentIdentifiers alloc] initWithDictionary:v10];
      [(ODMSiriSchemaODMSiriEventMetadata *)v5 setTrialExperimentIdentifiers:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMSiriEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMSiriEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMSiriEventMetadata *)self dictionaryRepresentation];
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
  if (self->_odmId)
  {
    id v4 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"odmId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"odmId"];
    }
  }
  if (self->_pluginVersion)
  {
    uint64_t v7 = [(ODMSiriSchemaODMSiriEventMetadata *)self pluginVersion];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"pluginVersion"];
  }
  if (self->_trialExperimentIdentifiers)
  {
    v9 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"trialExperimentIdentifiers"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"trialExperimentIdentifiers"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_odmId hash];
  NSUInteger v4 = [(NSString *)self->_pluginVersion hash] ^ v3;
  return v4 ^ [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self->_trialExperimentIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
  v6 = [v4 odmId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
    v10 = [v4 odmId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriEventMetadata *)self pluginVersion];
  v6 = [v4 pluginVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ODMSiriSchemaODMSiriEventMetadata *)self pluginVersion];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    objc_super v14 = [(ODMSiriSchemaODMSiriEventMetadata *)self pluginVersion];
    v15 = [v4 pluginVersion];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
  v6 = [v4 trialExperimentIdentifiers];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
    v20 = [v4 trialExperimentIdentifiers];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];

  if (v4)
  {
    v5 = [(ODMSiriSchemaODMSiriEventMetadata *)self odmId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODMSiriSchemaODMSiriEventMetadata *)self pluginVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];

  if (v7)
  {
    int v8 = [(ODMSiriSchemaODMSiriEventMetadata *)self trialExperimentIdentifiers];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialExperimentIdentifiers
{
}

- (BOOL)hasTrialExperimentIdentifiers
{
  return self->_trialExperimentIdentifiers != 0;
}

- (void)deletePluginVersion
{
}

- (BOOL)hasPluginVersion
{
  return self->_pluginVersion != 0;
}

- (void)deleteOdmId
{
}

- (BOOL)hasOdmId
{
  return self->_odmId != 0;
}

@end