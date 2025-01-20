@interface ODDSiriSchemaODDtvOSAssistantProperties
- (BOOL)hasHomePodProperties;
- (BOOL)hasMultiUserState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDHomePodProperties)homePodProperties;
- (ODDSiriSchemaODDMultiUserState)multiUserState;
- (ODDSiriSchemaODDtvOSAssistantProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDtvOSAssistantProperties)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHomePodProperties;
- (void)deleteMultiUserState;
- (void)setHasHomePodProperties:(BOOL)a3;
- (void)setHasMultiUserState:(BOOL)a3;
- (void)setHomePodProperties:(id)a3;
- (void)setMultiUserState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDtvOSAssistantProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDtvOSAssistantProperties;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDtvOSAssistantProperties *)self deleteMultiUserState];
  }
  v9 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDtvOSAssistantProperties *)self deleteHomePodProperties];
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
  objc_storeStrong((id *)&self->_homePodProperties, 0);
  objc_storeStrong((id *)&self->_multiUserState, 0);
}

- (void)setHasHomePodProperties:(BOOL)a3
{
  self->_hasHomePodProperties = a3;
}

- (void)setHasMultiUserState:(BOOL)a3
{
  self->_hasMultiUserState = a3;
}

- (void)setHomePodProperties:(id)a3
{
}

- (ODDSiriSchemaODDHomePodProperties)homePodProperties
{
  return self->_homePodProperties;
}

- (void)setMultiUserState:(id)a3
{
}

- (ODDSiriSchemaODDMultiUserState)multiUserState
{
  return self->_multiUserState;
}

- (ODDSiriSchemaODDtvOSAssistantProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDtvOSAssistantProperties;
  v5 = [(ODDSiriSchemaODDtvOSAssistantProperties *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"multiUserState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDMultiUserState alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDtvOSAssistantProperties *)v5 setMultiUserState:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"homePodProperties"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDHomePodProperties alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDtvOSAssistantProperties *)v5 setHomePodProperties:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDtvOSAssistantProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDtvOSAssistantProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self dictionaryRepresentation];
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
  if (self->_homePodProperties)
  {
    id v4 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"homePodProperties"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"homePodProperties"];
    }
  }
  if (self->_multiUserState)
  {
    uint64_t v7 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"multiUserState"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"multiUserState"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDMultiUserState *)self->_multiUserState hash];
  return [(ODDSiriSchemaODDHomePodProperties *)self->_homePodProperties hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
  v6 = [v4 multiUserState];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
    v10 = [v4 multiUserState];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
  v6 = [v4 homePodProperties];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
    v15 = [v4 homePodProperties];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];

  if (v4)
  {
    v5 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self multiUserState];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDtvOSAssistantProperties *)self homePodProperties];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDtvOSAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteHomePodProperties
{
}

- (BOOL)hasHomePodProperties
{
  return self->_homePodProperties != 0;
}

- (void)deleteMultiUserState
{
}

- (BOOL)hasMultiUserState
{
  return self->_multiUserState != 0;
}

@end