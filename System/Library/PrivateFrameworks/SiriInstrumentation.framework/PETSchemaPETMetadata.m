@interface PETSchemaPETMetadata
- (BOOL)hasBuild;
- (BOOL)hasConfig_version;
- (BOOL)hasCountry;
- (BOOL)hasDevice;
- (BOOL)hasIs_config_enabled;
- (BOOL)hasIs_gm;
- (BOOL)hasIs_internal;
- (BOOL)hasIs_internal_carry;
- (BOOL)hasIs_seed;
- (BOOL)hasIs_testing_data;
- (BOOL)hasIs_trial_upload;
- (BOOL)hasLanguage;
- (BOOL)hasMessage_group;
- (BOOL)hasMsg_type;
- (BOOL)hasPlatform;
- (BOOL)hasPseudo_device_id;
- (BOOL)hasUpload_time;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_config_enabled;
- (BOOL)is_gm;
- (BOOL)is_internal;
- (BOOL)is_internal_carry;
- (BOOL)is_seed;
- (BOOL)is_testing_data;
- (BOOL)is_trial_upload;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)build;
- (NSString)country;
- (NSString)device;
- (NSString)language;
- (NSString)message_group;
- (NSString)msg_type;
- (NSString)platform;
- (NSString)pseudo_device_id;
- (PETSchemaPETMetadata)initWithDictionary:(id)a3;
- (PETSchemaPETMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)upload_time;
- (unsigned)config_version;
- (void)deleteBuild;
- (void)deleteConfig_version;
- (void)deleteCountry;
- (void)deleteDevice;
- (void)deleteIs_config_enabled;
- (void)deleteIs_gm;
- (void)deleteIs_internal;
- (void)deleteIs_internal_carry;
- (void)deleteIs_seed;
- (void)deleteIs_testing_data;
- (void)deleteIs_trial_upload;
- (void)deleteLanguage;
- (void)deleteMessage_group;
- (void)deleteMsg_type;
- (void)deletePlatform;
- (void)deletePseudo_device_id;
- (void)deleteUpload_time;
- (void)setBuild:(id)a3;
- (void)setConfig_version:(unsigned int)a3;
- (void)setCountry:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHasBuild:(BOOL)a3;
- (void)setHasConfig_version:(BOOL)a3;
- (void)setHasCountry:(BOOL)a3;
- (void)setHasDevice:(BOOL)a3;
- (void)setHasIs_config_enabled:(BOOL)a3;
- (void)setHasIs_gm:(BOOL)a3;
- (void)setHasIs_internal:(BOOL)a3;
- (void)setHasIs_internal_carry:(BOOL)a3;
- (void)setHasIs_seed:(BOOL)a3;
- (void)setHasIs_testing_data:(BOOL)a3;
- (void)setHasIs_trial_upload:(BOOL)a3;
- (void)setHasLanguage:(BOOL)a3;
- (void)setHasMessage_group:(BOOL)a3;
- (void)setHasMsg_type:(BOOL)a3;
- (void)setHasPlatform:(BOOL)a3;
- (void)setHasPseudo_device_id:(BOOL)a3;
- (void)setHasUpload_time:(BOOL)a3;
- (void)setIs_config_enabled:(BOOL)a3;
- (void)setIs_gm:(BOOL)a3;
- (void)setIs_internal:(BOOL)a3;
- (void)setIs_internal_carry:(BOOL)a3;
- (void)setIs_seed:(BOOL)a3;
- (void)setIs_testing_data:(BOOL)a3;
- (void)setIs_trial_upload:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMessage_group:(id)a3;
- (void)setMsg_type:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPseudo_device_id:(id)a3;
- (void)setUpload_time:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msg_type, 0);
  objc_storeStrong((id *)&self->_message_group, 0);
  objc_storeStrong((id *)&self->_pseudo_device_id, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

- (void)setHasMsg_type:(BOOL)a3
{
  self->_hasCountry = a3;
}

- (void)setHasMessage_group:(BOOL)a3
{
  self->_hasBuild = a3;
}

- (void)setHasPseudo_device_id:(BOOL)a3
{
  self->_hasDevice = a3;
}

- (void)setHasLanguage:(BOOL)a3
{
  self->_hasPlatform = a3;
}

- (void)setHasCountry:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDevice:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasPlatform:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)is_trial_upload
{
  return self->_is_trial_upload;
}

- (BOOL)is_testing_data
{
  return self->_is_testing_data;
}

- (void)setMsg_type:(id)a3
{
}

- (NSString)msg_type
{
  return self->_msg_type;
}

- (void)setMessage_group:(id)a3
{
}

- (NSString)message_group
{
  return self->_message_group;
}

- (BOOL)is_config_enabled
{
  return self->_is_config_enabled;
}

- (BOOL)is_internal_carry
{
  return self->_is_internal_carry;
}

- (void)setPseudo_device_id:(id)a3
{
}

- (NSString)pseudo_device_id
{
  return self->_pseudo_device_id;
}

- (unsigned)config_version
{
  return self->_config_version;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (BOOL)is_gm
{
  return self->_is_gm;
}

- (BOOL)is_seed
{
  return self->_is_seed;
}

- (BOOL)is_internal
{
  return self->_is_internal;
}

- (void)setBuild:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setDevice:(id)a3
{
}

- (NSString)device
{
  return self->_device;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (unint64_t)upload_time
{
  return self->_upload_time;
}

- (PETSchemaPETMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PETSchemaPETMetadata;
  v5 = [(PETSchemaPETMetadata *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uploadTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setUpload_time:](v5, "setUpload_time:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"platform"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(PETSchemaPETMetadata *)v5 setPlatform:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"device"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PETSchemaPETMetadata *)v5 setDevice:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"build"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(PETSchemaPETMetadata *)v5 setBuild:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"isInternal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_internal:](v5, "setIs_internal:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isSeed"];
    objc_opt_class();
    v41 = v14;
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_seed:](v5, "setIs_seed:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isGm"];
    objc_opt_class();
    v40 = v15;
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_gm:](v5, "setIs_gm:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"country"];
    objc_opt_class();
    v39 = v16;
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(PETSchemaPETMetadata *)v5 setCountry:v17];
    }
    v38 = v6;
    v18 = [v4 objectForKeyedSubscript:@"language"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(PETSchemaPETMetadata *)v5 setLanguage:v19];
    }
    v33 = v18;
    v37 = v7;
    v20 = [v4 objectForKeyedSubscript:@"configVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setConfig_version:](v5, "setConfig_version:", [v20 unsignedIntValue]);
    }
    v36 = v9;
    v21 = [v4 objectForKeyedSubscript:@"pseudoDeviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(PETSchemaPETMetadata *)v5 setPseudo_device_id:v22];
    }
    v35 = v11;
    v23 = [v4 objectForKeyedSubscript:@"isInternalCarry"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_internal_carry:](v5, "setIs_internal_carry:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"isConfigEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_config_enabled:](v5, "setIs_config_enabled:", [v24 BOOLValue]);
    }
    v34 = v13;
    v25 = [v4 objectForKeyedSubscript:@"messageGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (void *)[v25 copy];
      [(PETSchemaPETMetadata *)v5 setMessage_group:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"msgType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      [(PETSchemaPETMetadata *)v5 setMsg_type:v28];
    }
    v29 = [v4 objectForKeyedSubscript:@"isTestingData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_testing_data:](v5, "setIs_testing_data:", [v29 BOOLValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"isTrialUpload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETMetadata setIs_trial_upload:](v5, "setIs_trial_upload:", [v30 BOOLValue]);
    }
    v31 = v5;
  }
  return v5;
}

- (PETSchemaPETMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETMetadata *)self dictionaryRepresentation];
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
  if (self->_build)
  {
    id v4 = [(PETSchemaPETMetadata *)self build];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"build"];
  }
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PETSchemaPETMetadata config_version](self, "config_version"));
    [v3 setObject:v6 forKeyedSubscript:@"configVersion"];
  }
  if (self->_country)
  {
    uint64_t v7 = [(PETSchemaPETMetadata *)self country];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"country"];
  }
  if (self->_device)
  {
    v9 = [(PETSchemaPETMetadata *)self device];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"device"];
  }
  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x40) != 0)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_config_enabled](self, "is_config_enabled"));
    [v3 setObject:v25 forKeyedSubscript:@"isConfigEnabled"];

    __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
    if ((v11 & 8) == 0)
    {
LABEL_11:
      if ((v11 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_11;
  }
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_gm](self, "is_gm"));
  [v3 setObject:v26 forKeyedSubscript:@"isGm"];

  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 2) == 0)
  {
LABEL_12:
    if ((v11 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_internal](self, "is_internal"));
  [v3 setObject:v27 forKeyedSubscript:@"isInternal"];

  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x20) == 0)
  {
LABEL_13:
    if ((v11 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_internal_carry](self, "is_internal_carry"));
  [v3 setObject:v28 forKeyedSubscript:@"isInternalCarry"];

  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 4) == 0)
  {
LABEL_14:
    if ((v11 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_seed](self, "is_seed"));
  [v3 setObject:v29 forKeyedSubscript:@"isSeed"];

  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x80) == 0)
  {
LABEL_15:
    if ((v11 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_37:
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_testing_data](self, "is_testing_data"));
  [v3 setObject:v30 forKeyedSubscript:@"isTestingData"];

  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) != 0)
  {
LABEL_16:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETMetadata is_trial_upload](self, "is_trial_upload"));
    [v3 setObject:v12 forKeyedSubscript:@"isTrialUpload"];
  }
LABEL_17:
  if (self->_language)
  {
    v13 = [(PETSchemaPETMetadata *)self language];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"language"];
  }
  if (self->_message_group)
  {
    v15 = [(PETSchemaPETMetadata *)self message_group];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"messageGroup"];
  }
  if (self->_msg_type)
  {
    v17 = [(PETSchemaPETMetadata *)self msg_type];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"msgType"];
  }
  if (self->_platform)
  {
    v19 = [(PETSchemaPETMetadata *)self platform];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"platform"];
  }
  if (self->_pseudo_device_id)
  {
    v21 = [(PETSchemaPETMetadata *)self pseudo_device_id];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"pseudoDeviceId"];
  }
  if (*(_WORD *)(&self->_is_trial_upload + 1))
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PETSchemaPETMetadata upload_time](self, "upload_time"));
    [v3 setObject:v23 forKeyedSubscript:@"uploadTime"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(_WORD *)(&self->_is_trial_upload + 1)) {
    unint64_t v22 = 2654435761u * self->_upload_time;
  }
  else {
    unint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_platform hash];
  NSUInteger v20 = [(NSString *)self->_device hash];
  NSUInteger v19 = [(NSString *)self->_build hash];
  __int16 v3 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v3 & 2) == 0)
  {
    uint64_t v18 = 0;
    if ((v3 & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v17 = 0;
    if ((v3 & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v18 = 2654435761 * self->_is_internal;
  if ((v3 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v17 = 2654435761 * self->_is_seed;
  if ((v3 & 8) != 0)
  {
LABEL_7:
    uint64_t v16 = 2654435761 * self->_is_gm;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v16 = 0;
LABEL_11:
  NSUInteger v4 = [(NSString *)self->_country hash];
  NSUInteger v5 = [(NSString *)self->_language hash];
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_config_version;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_pseudo_device_id hash];
  __int16 v8 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v8 & 0x20) != 0)
  {
    uint64_t v9 = 2654435761 * self->_is_internal_carry;
    if ((v8 & 0x40) != 0) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((v8 & 0x40) != 0)
    {
LABEL_16:
      uint64_t v10 = 2654435761 * self->_is_config_enabled;
      goto LABEL_19;
    }
  }
  uint64_t v10 = 0;
LABEL_19:
  NSUInteger v11 = [(NSString *)self->_message_group hash];
  NSUInteger v12 = [(NSString *)self->_msg_type hash];
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x80) != 0)
  {
    uint64_t v13 = 2654435761 * self->_is_testing_data;
    if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) != 0) {
      goto LABEL_21;
    }
LABEL_23:
    uint64_t v14 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x100) == 0) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v14 = 2654435761 * self->_is_trial_upload;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 1) != (v4[53] & 1)) {
    goto LABEL_66;
  }
  if (*(_WORD *)(&self->_is_trial_upload + 1))
  {
    unint64_t upload_time = self->_upload_time;
    if (upload_time != objc_msgSend(v4, "upload_time")) {
      goto LABEL_66;
    }
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self platform];
  NSUInteger v7 = [v4 platform];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v8 = [(PETSchemaPETMetadata *)self platform];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(PETSchemaPETMetadata *)self platform];
    NSUInteger v11 = [v4 platform];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self device];
  NSUInteger v7 = [v4 device];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v13 = [(PETSchemaPETMetadata *)self device];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(PETSchemaPETMetadata *)self device];
    uint64_t v16 = [v4 device];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self build];
  NSUInteger v7 = [v4 build];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v18 = [(PETSchemaPETMetadata *)self build];
  if (v18)
  {
    NSUInteger v19 = (void *)v18;
    NSUInteger v20 = [(PETSchemaPETMetadata *)self build];
    NSUInteger v21 = [v4 build];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  unsigned int v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  int v24 = (v23 >> 1) & 1;
  unsigned int v25 = (unsigned __int16)v4[53];
  if (v24 != ((v25 >> 1) & 1)) {
    goto LABEL_66;
  }
  if (v24)
  {
    int is_internal = self->_is_internal;
    if (is_internal != objc_msgSend(v4, "is_internal")) {
      goto LABEL_66;
    }
    unsigned int v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    unsigned int v25 = (unsigned __int16)v4[53];
  }
  int v27 = (v23 >> 2) & 1;
  if (v27 != ((v25 >> 2) & 1)) {
    goto LABEL_66;
  }
  if (v27)
  {
    int is_seed = self->_is_seed;
    if (is_seed != objc_msgSend(v4, "is_seed")) {
      goto LABEL_66;
    }
    unsigned int v23 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    unsigned int v25 = (unsigned __int16)v4[53];
  }
  int v29 = (v23 >> 3) & 1;
  if (v29 != ((v25 >> 3) & 1)) {
    goto LABEL_66;
  }
  if (v29)
  {
    int is_gm = self->_is_gm;
    if (is_gm != objc_msgSend(v4, "is_gm")) {
      goto LABEL_66;
    }
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self country];
  NSUInteger v7 = [v4 country];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v31 = [(PETSchemaPETMetadata *)self country];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(PETSchemaPETMetadata *)self country];
    v34 = [v4 country];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self language];
  NSUInteger v7 = [v4 language];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v36 = [(PETSchemaPETMetadata *)self language];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(PETSchemaPETMetadata *)self language];
    v39 = [v4 language];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  int v41 = (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 4) & 1;
  if (v41 != (((unsigned __int16)v4[53] >> 4) & 1)) {
    goto LABEL_66;
  }
  if (v41)
  {
    unsigned int config_version = self->_config_version;
    if (config_version != objc_msgSend(v4, "config_version")) {
      goto LABEL_66;
    }
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self pseudo_device_id];
  NSUInteger v7 = objc_msgSend(v4, "pseudo_device_id");
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v43 = [(PETSchemaPETMetadata *)self pseudo_device_id];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(PETSchemaPETMetadata *)self pseudo_device_id];
    v46 = objc_msgSend(v4, "pseudo_device_id");
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  unsigned int v48 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  int v49 = (v48 >> 5) & 1;
  unsigned int v50 = (unsigned __int16)v4[53];
  if (v49 != ((v50 >> 5) & 1)) {
    goto LABEL_66;
  }
  if (v49)
  {
    int is_internal_carry = self->_is_internal_carry;
    if (is_internal_carry != objc_msgSend(v4, "is_internal_carry")) {
      goto LABEL_66;
    }
    unsigned int v48 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
    unsigned int v50 = (unsigned __int16)v4[53];
  }
  int v52 = (v48 >> 6) & 1;
  if (v52 != ((v50 >> 6) & 1)) {
    goto LABEL_66;
  }
  if (v52)
  {
    int is_config_enabled = self->_is_config_enabled;
    if (is_config_enabled != objc_msgSend(v4, "is_config_enabled")) {
      goto LABEL_66;
    }
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self message_group];
  NSUInteger v7 = objc_msgSend(v4, "message_group");
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v54 = [(PETSchemaPETMetadata *)self message_group];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [(PETSchemaPETMetadata *)self message_group];
    v57 = objc_msgSend(v4, "message_group");
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self msg_type];
  NSUInteger v7 = objc_msgSend(v4, "msg_type");
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_65:

    goto LABEL_66;
  }
  uint64_t v59 = [(PETSchemaPETMetadata *)self msg_type];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(PETSchemaPETMetadata *)self msg_type];
    v62 = objc_msgSend(v4, "msg_type");
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  unsigned int v66 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
  int v67 = (v66 >> 7) & 1;
  unsigned int v68 = (unsigned __int16)v4[53];
  if (v67 == ((v68 >> 7) & 1))
  {
    if (v67)
    {
      int is_testing_data = self->_is_testing_data;
      if (is_testing_data != objc_msgSend(v4, "is_testing_data")) {
        goto LABEL_66;
      }
      unsigned int v66 = *(unsigned __int16 *)(&self->_is_trial_upload + 1);
      unsigned int v68 = (unsigned __int16)v4[53];
    }
    int v70 = (v66 >> 8) & 1;
    if (v70 == ((v68 >> 8) & 1))
    {
      if (!v70
        || (int is_trial_upload = self->_is_trial_upload,
            is_trial_upload == objc_msgSend(v4, "is_trial_upload")))
      {
        BOOL v64 = 1;
        goto LABEL_67;
      }
    }
  }
LABEL_66:
  BOOL v64 = 0;
LABEL_67:

  return v64;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  if (*(_WORD *)(&self->_is_trial_upload + 1)) {
    PBDataWriterWriteUint64Field();
  }
  NSUInteger v4 = [(PETSchemaPETMetadata *)self platform];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(PETSchemaPETMetadata *)self device];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(PETSchemaPETMetadata *)self build];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  __int16 v7 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = *(_WORD *)(&self->_is_trial_upload + 1);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 8) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
  uint64_t v8 = [(PETSchemaPETMetadata *)self country];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(PETSchemaPETMetadata *)self language];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)(&self->_is_trial_upload + 1) & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v10 = [(PETSchemaPETMetadata *)self pseudo_device_id];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = *(_WORD *)(&self->_is_trial_upload + 1);
  }
  if ((v11 & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v12 = [(PETSchemaPETMetadata *)self message_group];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = [(PETSchemaPETMetadata *)self msg_type];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  __int16 v14 = *(_WORD *)(&self->_is_trial_upload + 1);
  if ((v14 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v14 = *(_WORD *)(&self->_is_trial_upload + 1);
  }
  if ((v14 & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIs_trial_upload
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x100u;
}

- (void)setHasIs_trial_upload:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFEFF | v3;
}

- (BOOL)hasIs_trial_upload
{
  return HIBYTE(*(unsigned __int16 *)(&self->_is_trial_upload + 1)) & 1;
}

- (void)setIs_trial_upload:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x100u;
  self->_int is_trial_upload = a3;
}

- (void)deleteIs_testing_data
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x80u;
}

- (void)setHasIs_testing_data:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFF7F | v3;
}

- (BOOL)hasIs_testing_data
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 7) & 1;
}

- (void)setIs_testing_data:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x80u;
  self->_int is_testing_data = a3;
}

- (void)deleteMsg_type
{
}

- (BOOL)hasMsg_type
{
  return self->_msg_type != 0;
}

- (void)deleteMessage_group
{
}

- (BOOL)hasMessage_group
{
  return self->_message_group != 0;
}

- (void)deleteIs_config_enabled
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x40u;
}

- (void)setHasIs_config_enabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFBF | v3;
}

- (BOOL)hasIs_config_enabled
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 6) & 1;
}

- (void)setIs_config_enabled:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x40u;
  self->_int is_config_enabled = a3;
}

- (void)deleteIs_internal_carry
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x20u;
}

- (void)setHasIs_internal_carry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFDF | v3;
}

- (BOOL)hasIs_internal_carry
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 5) & 1;
}

- (void)setIs_internal_carry:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x20u;
  self->_int is_internal_carry = a3;
}

- (void)deletePseudo_device_id
{
}

- (BOOL)hasPseudo_device_id
{
  return self->_pseudo_device_id != 0;
}

- (void)deleteConfig_version
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~0x10u;
}

- (void)setHasConfig_version:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFEF | v3;
}

- (BOOL)hasConfig_version
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 4) & 1;
}

- (void)setConfig_version:(unsigned int)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 0x10u;
  self->_unsigned int config_version = a3;
}

- (void)deleteLanguage
{
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)deleteCountry
{
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (void)deleteIs_gm
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~8u;
}

- (void)setHasIs_gm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFF7 | v3;
}

- (BOOL)hasIs_gm
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 3) & 1;
}

- (void)setIs_gm:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 8u;
  self->_int is_gm = a3;
}

- (void)deleteIs_seed
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~4u;
}

- (void)setHasIs_seed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFB | v3;
}

- (BOOL)hasIs_seed
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 2) & 1;
}

- (void)setIs_seed:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 4u;
  self->_int is_seed = a3;
}

- (void)deleteIs_internal
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~2u;
}

- (void)setHasIs_internal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFD | v3;
}

- (BOOL)hasIs_internal
{
  return (*(unsigned __int16 *)(&self->_is_trial_upload + 1) >> 1) & 1;
}

- (void)setIs_internal:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 2u;
  self->_int is_internal = a3;
}

- (void)deleteBuild
{
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)deleteDevice
{
}

- (BOOL)hasDevice
{
  return self->_device != 0;
}

- (void)deletePlatform
{
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
}

- (void)deleteUpload_time
{
  *(_WORD *)(&self->_is_trial_upload + 1) &= ~1u;
}

- (void)setHasUpload_time:(BOOL)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) = *(_WORD *)(&self->_is_trial_upload + 1) & 0xFFFE | a3;
}

- (BOOL)hasUpload_time
{
  return *(_WORD *)(&self->_is_trial_upload + 1) & 1;
}

- (void)setUpload_time:(unint64_t)a3
{
  *(_WORD *)(&self->_is_trial_upload + 1) |= 1u;
  self->_unint64_t upload_time = a3;
}

@end