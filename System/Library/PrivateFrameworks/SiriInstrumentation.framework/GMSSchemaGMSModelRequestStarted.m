@interface GMSSchemaGMSModelRequestStarted
- (BOOL)hasAccountType;
- (BOOL)hasConfigVersion;
- (BOOL)hasExecutorTraceID;
- (BOOL)hasExternalPartner;
- (BOOL)hasGmsClientRequestIdentifier;
- (BOOL)hasIsUserSignedIn;
- (BOOL)hasIsWebSearchUsed;
- (BOOL)hasModelLocation;
- (BOOL)hasModelName;
- (BOOL)hasModelParty;
- (BOOL)hasModelVersion;
- (BOOL)hasPromptVersion;
- (BOOL)hasUseCase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserSignedIn;
- (BOOL)isWebSearchUsed;
- (BOOL)readFrom:(id)a3;
- (GMSSchemaGMSModelRequestStarted)initWithDictionary:(id)a3;
- (GMSSchemaGMSModelRequestStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)configVersion;
- (NSString)modelName;
- (NSString)modelVersion;
- (NSString)promptVersion;
- (SISchemaUUID)executorTraceID;
- (SISchemaUUID)gmsClientRequestIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)accountType;
- (int)externalPartner;
- (int)modelLocation;
- (int)modelParty;
- (int)useCase;
- (unint64_t)hash;
- (void)deleteAccountType;
- (void)deleteConfigVersion;
- (void)deleteExecutorTraceID;
- (void)deleteExternalPartner;
- (void)deleteGmsClientRequestIdentifier;
- (void)deleteIsUserSignedIn;
- (void)deleteIsWebSearchUsed;
- (void)deleteModelLocation;
- (void)deleteModelName;
- (void)deleteModelParty;
- (void)deleteModelVersion;
- (void)deletePromptVersion;
- (void)deleteUseCase;
- (void)setAccountType:(int)a3;
- (void)setConfigVersion:(id)a3;
- (void)setExecutorTraceID:(id)a3;
- (void)setExternalPartner:(int)a3;
- (void)setGmsClientRequestIdentifier:(id)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasConfigVersion:(BOOL)a3;
- (void)setHasExecutorTraceID:(BOOL)a3;
- (void)setHasExternalPartner:(BOOL)a3;
- (void)setHasGmsClientRequestIdentifier:(BOOL)a3;
- (void)setHasIsUserSignedIn:(BOOL)a3;
- (void)setHasIsWebSearchUsed:(BOOL)a3;
- (void)setHasModelLocation:(BOOL)a3;
- (void)setHasModelName:(BOOL)a3;
- (void)setHasModelParty:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasPromptVersion:(BOOL)a3;
- (void)setHasUseCase:(BOOL)a3;
- (void)setIsUserSignedIn:(BOOL)a3;
- (void)setIsWebSearchUsed:(BOOL)a3;
- (void)setModelLocation:(int)a3;
- (void)setModelName:(id)a3;
- (void)setModelParty:(int)a3;
- (void)setModelVersion:(id)a3;
- (void)setPromptVersion:(id)a3;
- (void)setUseCase:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GMSSchemaGMSModelRequestStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GMSSchemaGMSModelRequestStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GMSSchemaGMSModelRequestStarted *)self deleteGmsClientRequestIdentifier];
  }
  v9 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GMSSchemaGMSModelRequestStarted *)self deleteExecutorTraceID];
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
  objc_storeStrong((id *)&self->_executorTraceID, 0);
  objc_storeStrong((id *)&self->_gmsClientRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_promptVersion, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasExecutorTraceID:(BOOL)a3
{
  self->_hasPromptVersion = a3;
}

- (void)setHasGmsClientRequestIdentifier:(BOOL)a3
{
  self->_hasConfigVersion = a3;
}

- (void)setHasModelName:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasPromptVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setExecutorTraceID:(id)a3
{
}

- (SISchemaUUID)executorTraceID
{
  return self->_executorTraceID;
}

- (void)setGmsClientRequestIdentifier:(id)a3
{
}

- (SISchemaUUID)gmsClientRequestIdentifier
{
  return self->_gmsClientRequestIdentifier;
}

- (int)externalPartner
{
  return self->_externalPartner;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setPromptVersion:(id)a3
{
}

- (NSString)promptVersion
{
  return self->_promptVersion;
}

- (void)setConfigVersion:(id)a3
{
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (int)useCase
{
  return self->_useCase;
}

- (int)modelLocation
{
  return self->_modelLocation;
}

- (int)modelParty
{
  return self->_modelParty;
}

- (BOOL)isUserSignedIn
{
  return self->_isUserSignedIn;
}

- (BOOL)isWebSearchUsed
{
  return self->_isWebSearchUsed;
}

- (int)accountType
{
  return self->_accountType;
}

- (GMSSchemaGMSModelRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GMSSchemaGMSModelRequestStarted;
  v5 = [(GMSSchemaGMSModelRequestStarted *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"accountType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setAccountType:](v5, "setAccountType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isWebSearchUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setIsWebSearchUsed:](v5, "setIsWebSearchUsed:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"isUserSignedIn"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setIsUserSignedIn:](v5, "setIsUserSignedIn:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"modelParty"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setModelParty:](v5, "setModelParty:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"modelLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setModelLocation:](v5, "setModelLocation:", [v10 intValue]);
    }
    v30 = v8;
    v32 = v6;
    int v11 = [v4 objectForKeyedSubscript:@"useCase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setUseCase:](v5, "setUseCase:", [v11 intValue]);
    }
    v27 = v11;
    v12 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(GMSSchemaGMSModelRequestStarted *)v5 setModelVersion:v13];
    }
    v31 = v7;
    v14 = [v4 objectForKeyedSubscript:@"configVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(GMSSchemaGMSModelRequestStarted *)v5 setConfigVersion:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"promptVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(GMSSchemaGMSModelRequestStarted *)v5 setPromptVersion:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"modelName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(GMSSchemaGMSModelRequestStarted *)v5 setModelName:v19];
    }
    v28 = v10;
    v29 = v9;
    v20 = [v4 objectForKeyedSubscript:@"externalPartner"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestStarted setExternalPartner:](v5, "setExternalPartner:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"gmsClientRequestIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[SISchemaUUID alloc] initWithDictionary:v21];
      [(GMSSchemaGMSModelRequestStarted *)v5 setGmsClientRequestIdentifier:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"executorTraceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[SISchemaUUID alloc] initWithDictionary:v23];
      [(GMSSchemaGMSModelRequestStarted *)v5 setExecutorTraceID:v24];
    }
    v25 = v5;
  }
  return v5;
}

- (GMSSchemaGMSModelRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GMSSchemaGMSModelRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GMSSchemaGMSModelRequestStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(GMSSchemaGMSModelRequestStarted *)self accountType] - 1;
    if (v4 > 2) {
      v5 = @"GMSPARTNERACCOUNTTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EC1A10[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"accountType"];
  }
  if (self->_configVersion)
  {
    v6 = [(GMSSchemaGMSModelRequestStarted *)self configVersion];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"configVersion"];
  }
  if (self->_executorTraceID)
  {
    int v8 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"executorTraceID"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"executorTraceID"];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ([(GMSSchemaGMSModelRequestStarted *)self externalPartner] == 1) {
      int v11 = @"GMSEXTERNALPARTNER_OPENAI";
    }
    else {
      int v11 = @"GMSEXTERNALPARTNER_UNKNOWN";
    }
    [v3 setObject:v11 forKeyedSubscript:@"externalPartner"];
  }
  if (self->_gmsClientRequestIdentifier)
  {
    v12 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"gmsClientRequestIdentifier"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"gmsClientRequestIdentifier"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_25;
    }
LABEL_49:
    v31 = objc_msgSend(NSNumber, "numberWithBool:", -[GMSSchemaGMSModelRequestStarted isWebSearchUsed](self, "isWebSearchUsed"));
    [v3 setObject:v31 forKeyedSubscript:@"isWebSearchUsed"];

    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[GMSSchemaGMSModelRequestStarted isUserSignedIn](self, "isUserSignedIn"));
  [v3 setObject:v30 forKeyedSubscript:@"isUserSignedIn"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_49;
  }
LABEL_25:
  if ((has & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_26:
  int v16 = [(GMSSchemaGMSModelRequestStarted *)self modelLocation];
  v17 = @"GMSMODELLOCATION_UNKNOWN";
  if (v16 == 1) {
    v17 = @"GMSMODELLOCATION_CLOUD";
  }
  if (v16 == 2) {
    v18 = @"GMSMODELLOCATION_ON_DEVICE";
  }
  else {
    v18 = v17;
  }
  [v3 setObject:v18 forKeyedSubscript:@"modelLocation"];
LABEL_32:
  if (self->_modelName)
  {
    v19 = [(GMSSchemaGMSModelRequestStarted *)self modelName];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"modelName"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int v21 = [(GMSSchemaGMSModelRequestStarted *)self modelParty];
    v22 = @"GMSMODELPARTY_UNKNOWN";
    if (v21 == 1) {
      v22 = @"GMSMODELPARTY_THIRD_PARTY";
    }
    if (v21 == 2) {
      v23 = @"GMSMODELPARTY_APPLE_INTERNAL";
    }
    else {
      v23 = v22;
    }
    [v3 setObject:v23 forKeyedSubscript:@"modelParty"];
  }
  if (self->_modelVersion)
  {
    v24 = [(GMSSchemaGMSModelRequestStarted *)self modelVersion];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"modelVersion"];
  }
  if (self->_promptVersion)
  {
    v26 = [(GMSSchemaGMSModelRequestStarted *)self promptVersion];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"promptVersion"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    unsigned int v28 = [(GMSSchemaGMSModelRequestStarted *)self useCase] - 1;
    if (v28 > 4) {
      v29 = @"GMSUSECASE_UNKNOWN";
    }
    else {
      v29 = off_1E5EC1A28[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"useCase"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = 2654435761 * self->_accountType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v14 = 2654435761 * self->_isWebSearchUsed;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v3 = 2654435761 * self->_isUserSignedIn;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_modelParty;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v5 = 2654435761 * self->_modelLocation;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_useCase;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
LABEL_14:
  NSUInteger v7 = [(NSString *)self->_modelVersion hash];
  NSUInteger v8 = [(NSString *)self->_configVersion hash];
  NSUInteger v9 = [(NSString *)self->_promptVersion hash];
  NSUInteger v10 = [(NSString *)self->_modelName hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v11 = 2654435761 * self->_externalPartner;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(SISchemaUUID *)self->_gmsClientRequestIdentifier hash];
  return v12 ^ [(SISchemaUUID *)self->_executorTraceID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
  unsigned int v6 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    int accountType = self->_accountType;
    if (accountType != [v4 accountType]) {
      goto LABEL_58;
    }
    $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
    unsigned int v6 = v4[88];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int isWebSearchUsed = self->_isWebSearchUsed;
      if (isWebSearchUsed != [v4 isWebSearchUsed]) {
        goto LABEL_58;
      }
      $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
      unsigned int v6 = v4[88];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int isUserSignedIn = self->_isUserSignedIn;
        if (isUserSignedIn != [v4 isUserSignedIn]) {
          goto LABEL_58;
        }
        $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
        unsigned int v6 = v4[88];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int modelParty = self->_modelParty;
          if (modelParty != [v4 modelParty]) {
            goto LABEL_58;
          }
          $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
          unsigned int v6 = v4[88];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            int modelLocation = self->_modelLocation;
            if (modelLocation != [v4 modelLocation]) {
              goto LABEL_58;
            }
            $22C2202F60D67B2780A46D51F5E5EEA3 has = self->_has;
            unsigned int v6 = v4[88];
          }
          int v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 != ((v6 >> 5) & 1)) {
            goto LABEL_58;
          }
          if (v16)
          {
            int useCase = self->_useCase;
            if (useCase != [v4 useCase]) {
              goto LABEL_58;
            }
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self modelVersion];
          v19 = [v4 modelVersion];
          if ((v18 == 0) == (v19 != 0)) {
            goto LABEL_57;
          }
          uint64_t v20 = [(GMSSchemaGMSModelRequestStarted *)self modelVersion];
          if (v20)
          {
            int v21 = (void *)v20;
            v22 = [(GMSSchemaGMSModelRequestStarted *)self modelVersion];
            v23 = [v4 modelVersion];
            int v24 = [v22 isEqual:v23];

            if (!v24) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self configVersion];
          v19 = [v4 configVersion];
          if ((v18 == 0) == (v19 != 0)) {
            goto LABEL_57;
          }
          uint64_t v25 = [(GMSSchemaGMSModelRequestStarted *)self configVersion];
          if (v25)
          {
            v26 = (void *)v25;
            v27 = [(GMSSchemaGMSModelRequestStarted *)self configVersion];
            unsigned int v28 = [v4 configVersion];
            int v29 = [v27 isEqual:v28];

            if (!v29) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self promptVersion];
          v19 = [v4 promptVersion];
          if ((v18 == 0) == (v19 != 0)) {
            goto LABEL_57;
          }
          uint64_t v30 = [(GMSSchemaGMSModelRequestStarted *)self promptVersion];
          if (v30)
          {
            v31 = (void *)v30;
            v32 = [(GMSSchemaGMSModelRequestStarted *)self promptVersion];
            objc_super v33 = [v4 promptVersion];
            int v34 = [v32 isEqual:v33];

            if (!v34) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self modelName];
          v19 = [v4 modelName];
          if ((v18 == 0) == (v19 != 0)) {
            goto LABEL_57;
          }
          uint64_t v35 = [(GMSSchemaGMSModelRequestStarted *)self modelName];
          if (v35)
          {
            v36 = (void *)v35;
            v37 = [(GMSSchemaGMSModelRequestStarted *)self modelName];
            v38 = [v4 modelName];
            int v39 = [v37 isEqual:v38];

            if (!v39) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          int v40 = (*(unsigned char *)&self->_has >> 6) & 1;
          if (v40 != ((v4[88] >> 6) & 1)) {
            goto LABEL_58;
          }
          if (v40)
          {
            int externalPartner = self->_externalPartner;
            if (externalPartner != [v4 externalPartner]) {
              goto LABEL_58;
            }
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
          v19 = [v4 gmsClientRequestIdentifier];
          if ((v18 == 0) == (v19 != 0)) {
            goto LABEL_57;
          }
          uint64_t v42 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
          if (v42)
          {
            v43 = (void *)v42;
            v44 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
            v45 = [v4 gmsClientRequestIdentifier];
            int v46 = [v44 isEqual:v45];

            if (!v46) {
              goto LABEL_58;
            }
          }
          else
          {
          }
          v18 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
          v19 = [v4 executorTraceID];
          if ((v18 == 0) != (v19 != 0))
          {
            uint64_t v47 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
            if (!v47)
            {

LABEL_61:
              BOOL v52 = 1;
              goto LABEL_59;
            }
            v48 = (void *)v47;
            v49 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
            v50 = [v4 executorTraceID];
            char v51 = [v49 isEqual:v50];

            if (v51) {
              goto LABEL_61;
            }
          }
          else
          {
LABEL_57:
          }
        }
      }
    }
  }
LABEL_58:
  BOOL v52 = 0;
LABEL_59:

  return v52;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  uint64_t v5 = [(GMSSchemaGMSModelRequestStarted *)self modelVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(GMSSchemaGMSModelRequestStarted *)self configVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(GMSSchemaGMSModelRequestStarted *)self promptVersion];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(GMSSchemaGMSModelRequestStarted *)self modelName];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v9 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];

  if (v9)
  {
    int v10 = [(GMSSchemaGMSModelRequestStarted *)self gmsClientRequestIdentifier];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v11 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];

  int v12 = v14;
  if (v11)
  {
    objc_super v13 = [(GMSSchemaGMSModelRequestStarted *)self executorTraceID];
    PBDataWriterWriteSubmessage();

    int v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GMSSchemaGMSModelRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteExecutorTraceID
{
}

- (BOOL)hasExecutorTraceID
{
  return self->_executorTraceID != 0;
}

- (void)deleteGmsClientRequestIdentifier
{
}

- (BOOL)hasGmsClientRequestIdentifier
{
  return self->_gmsClientRequestIdentifier != 0;
}

- (void)deleteExternalPartner
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasExternalPartner:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasExternalPartner
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setExternalPartner:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int externalPartner = a3;
}

- (void)deleteModelName
{
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (void)deletePromptVersion
{
}

- (BOOL)hasPromptVersion
{
  return self->_promptVersion != 0;
}

- (void)deleteConfigVersion
{
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteUseCase
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasUseCase:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUseCase
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setUseCase:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int useCase = a3;
}

- (void)deleteModelLocation
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasModelLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModelLocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setModelLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int modelLocation = a3;
}

- (void)deleteModelParty
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasModelParty:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModelParty
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setModelParty:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int modelParty = a3;
}

- (void)deleteIsUserSignedIn
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsUserSignedIn:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsUserSignedIn
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsUserSignedIn:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isUserSignedIn = a3;
}

- (void)deleteIsWebSearchUsed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsWebSearchUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsWebSearchUsed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsWebSearchUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isWebSearchUsed = a3;
}

- (void)deleteAccountType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAccountType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAccountType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int accountType = a3;
}

@end