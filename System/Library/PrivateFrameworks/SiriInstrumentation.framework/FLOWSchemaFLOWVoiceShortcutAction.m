@interface FLOWSchemaFLOWVoiceShortcutAction
- (BOOL)hasAppId;
- (BOOL)hasIntentCategory;
- (BOOL)hasIntentNLDomain;
- (BOOL)hasIntentName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWVoiceShortcutAction)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWVoiceShortcutAction)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)appId;
- (NSString)intentCategory;
- (NSString)intentNLDomain;
- (NSString)intentName;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAppId;
- (void)deleteIntentCategory;
- (void)deleteIntentNLDomain;
- (void)deleteIntentName;
- (void)setAppId:(id)a3;
- (void)setHasAppId:(BOOL)a3;
- (void)setHasIntentCategory:(BOOL)a3;
- (void)setHasIntentNLDomain:(BOOL)a3;
- (void)setHasIntentName:(BOOL)a3;
- (void)setIntentCategory:(id)a3;
- (void)setIntentNLDomain:(id)a3;
- (void)setIntentName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWVoiceShortcutAction

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentNLDomain, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_intentCategory, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (void)setHasIntentNLDomain:(BOOL)a3
{
  self->_hasIntentNLDomain = a3;
}

- (void)setHasIntentName:(BOOL)a3
{
  self->_hasIntentName = a3;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  self->_hasIntentCategory = a3;
}

- (void)setHasAppId:(BOOL)a3
{
  self->_hasAppId = a3;
}

- (void)setIntentNLDomain:(id)a3
{
}

- (NSString)intentNLDomain
{
  return self->_intentNLDomain;
}

- (void)setIntentName:(id)a3
{
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentCategory:(id)a3
{
}

- (NSString)intentCategory
{
  return self->_intentCategory;
}

- (void)setAppId:(id)a3
{
}

- (NSString)appId
{
  return self->_appId;
}

- (FLOWSchemaFLOWVoiceShortcutAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWSchemaFLOWVoiceShortcutAction;
  v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWVoiceShortcutAction *)v5 setAppId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"intentCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWVoiceShortcutAction *)v5 setIntentCategory:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"intentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(FLOWSchemaFLOWVoiceShortcutAction *)v5 setIntentName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"intentNLDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(FLOWSchemaFLOWVoiceShortcutAction *)v5 setIntentNLDomain:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWVoiceShortcutAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWVoiceShortcutAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWVoiceShortcutAction *)self dictionaryRepresentation];
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
  if (self->_appId)
  {
    id v4 = [(FLOWSchemaFLOWVoiceShortcutAction *)self appId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appId"];
  }
  if (self->_intentCategory)
  {
    v6 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentCategory];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"intentCategory"];
  }
  if (self->_intentNLDomain)
  {
    v8 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentNLDomain];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"intentNLDomain"];
  }
  if (self->_intentName)
  {
    v10 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentName];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"intentName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appId hash];
  NSUInteger v4 = [(NSString *)self->_intentCategory hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_intentName hash];
  return v4 ^ v5 ^ [(NSString *)self->_intentNLDomain hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)self appId];
  v6 = [v4 appId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(FLOWSchemaFLOWVoiceShortcutAction *)self appId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWVoiceShortcutAction *)self appId];
    v10 = [v4 appId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentCategory];
  v6 = [v4 intentCategory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentCategory];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentCategory];
    v15 = [v4 intentCategory];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentName];
  v6 = [v4 intentName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentName];
    v20 = [v4 intentName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentNLDomain];
  v6 = [v4 intentNLDomain];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentNLDomain];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentNLDomain];
    v25 = [v4 intentNLDomain];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(FLOWSchemaFLOWVoiceShortcutAction *)self appId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentCategory];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(FLOWSchemaFLOWVoiceShortcutAction *)self intentNLDomain];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWVoiceShortcutActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIntentNLDomain
{
}

- (BOOL)hasIntentNLDomain
{
  return self->_intentNLDomain != 0;
}

- (void)deleteIntentName
{
}

- (BOOL)hasIntentName
{
  return self->_intentName != 0;
}

- (void)deleteIntentCategory
{
}

- (BOOL)hasIntentCategory
{
  return self->_intentCategory != 0;
}

- (void)deleteAppId
{
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

@end