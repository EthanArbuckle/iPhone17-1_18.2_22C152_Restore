@interface ODDSiriSchemaODDUserPersonalization
- (BOOL)hasIsPersonalDomainRequestsEnabled;
- (BOOL)hasVoiceSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalDomainRequestsEnabled;
- (BOOL)readFrom:(id)a3;
- (NSArray)activeSubscriptions;
- (NSData)jsonData;
- (ODDSiriSchemaODDUserPersonalization)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDUserPersonalization)initWithJSON:(id)a3;
- (SISchemaVoiceSettings)voiceSettings;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)activeSubscriptionsAtIndex:(unint64_t)a3;
- (unint64_t)activeSubscriptionsCount;
- (unint64_t)hash;
- (void)addActiveSubscriptions:(int)a3;
- (void)clearActiveSubscriptions;
- (void)deleteIsPersonalDomainRequestsEnabled;
- (void)deleteVoiceSettings;
- (void)setActiveSubscriptions:(id)a3;
- (void)setHasIsPersonalDomainRequestsEnabled:(BOOL)a3;
- (void)setHasVoiceSettings:(BOOL)a3;
- (void)setIsPersonalDomainRequestsEnabled:(BOOL)a3;
- (void)setVoiceSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDUserPersonalization

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDUserPersonalization;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDUserPersonalization *)self deleteVoiceSettings];
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
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setVoiceSettings:(id)a3
{
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setActiveSubscriptions:(id)a3
{
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (BOOL)isPersonalDomainRequestsEnabled
{
  return self->_isPersonalDomainRequestsEnabled;
}

- (ODDSiriSchemaODDUserPersonalization)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ODDSiriSchemaODDUserPersonalization;
  v5 = [(ODDSiriSchemaODDUserPersonalization *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isPersonalDomainRequestsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDUserPersonalization setIsPersonalDomainRequestsEnabled:](v5, "setIsPersonalDomainRequestsEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"activeSubscriptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODDSiriSchemaODDUserPersonalization addActiveSubscriptions:](v5, "addActiveSubscriptions:", objc_msgSend(v13, "intValue", (void)v18));
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v10);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"voiceSettings", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaVoiceSettings alloc] initWithDictionary:v14];
      [(ODDSiriSchemaODDUserPersonalization *)v5 setVoiceSettings:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDUserPersonalization)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDUserPersonalization *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDUserPersonalization *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_activeSubscriptions count])
  {
    id v4 = [(ODDSiriSchemaODDUserPersonalization *)self activeSubscriptions];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeSubscriptions"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDUserPersonalization isPersonalDomainRequestsEnabled](self, "isPersonalDomainRequestsEnabled"));
    [v3 setObject:v6 forKeyedSubscript:@"isPersonalDomainRequestsEnabled"];
  }
  if (self->_voiceSettings)
  {
    uint64_t v7 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
    id v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"voiceSettings"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"voiceSettings"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isPersonalDomainRequestsEnabled;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_activeSubscriptions hash] ^ v3;
  return v4 ^ [(SISchemaVoiceSettings *)self->_voiceSettings hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isPersonalDomainRequestsEnabled = self->_isPersonalDomainRequestsEnabled;
    if (isPersonalDomainRequestsEnabled != [v4 isPersonalDomainRequestsEnabled]) {
      goto LABEL_15;
    }
  }
  v6 = [(ODDSiriSchemaODDUserPersonalization *)self activeSubscriptions];
  uint64_t v7 = [v4 activeSubscriptions];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(ODDSiriSchemaODDUserPersonalization *)self activeSubscriptions];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(ODDSiriSchemaODDUserPersonalization *)self activeSubscriptions];
    uint64_t v11 = [v4 activeSubscriptions];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
  uint64_t v7 = [v4 voiceSettings];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
    v16 = [v4 voiceSettings];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_activeSubscriptions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "intValue", (void)v12);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];

  if (v10)
  {
    uint64_t v11 = [(ODDSiriSchemaODDUserPersonalization *)self voiceSettings];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDUserPersonalizationReadFrom(self, (uint64_t)a3);
}

- (void)deleteVoiceSettings
{
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_activeSubscriptions objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)activeSubscriptionsCount
{
  return [(NSArray *)self->_activeSubscriptions count];
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)activeSubscriptions addObject:v8];
}

- (void)clearActiveSubscriptions
{
}

- (void)deleteIsPersonalDomainRequestsEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsPersonalDomainRequestsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPersonalDomainRequestsEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsPersonalDomainRequestsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isPersonalDomainRequestsEnabled = a3;
}

@end