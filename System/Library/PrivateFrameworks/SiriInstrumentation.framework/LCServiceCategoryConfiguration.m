@interface LCServiceCategoryConfiguration
- (BOOL)hasBlacklist;
- (BOOL)hasCategoryParameters;
- (BOOL)hasEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LCServiceBlacklistedFields)blacklist;
- (LCServiceCategoryConfiguration)initWithDictionary:(id)a3;
- (LCServiceCategoryConfiguration)initWithJSON:(id)a3;
- (LCServiceLoggingParameters)categoryParameters;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventType;
- (unint64_t)hash;
- (void)deleteBlacklist;
- (void)deleteCategoryParameters;
- (void)deleteEventType;
- (void)setBlacklist:(id)a3;
- (void)setCategoryParameters:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasBlacklist:(BOOL)a3;
- (void)setHasCategoryParameters:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LCServiceCategoryConfiguration

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCServiceCategoryConfiguration;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LCServiceCategoryConfiguration *)self categoryParameters];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LCServiceCategoryConfiguration *)self deleteCategoryParameters];
  }
  v9 = [(LCServiceCategoryConfiguration *)self blacklist];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LCServiceCategoryConfiguration *)self deleteBlacklist];
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
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_categoryParameters, 0);
}

- (void)setHasBlacklist:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCategoryParameters:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setBlacklist:(id)a3
{
}

- (LCServiceBlacklistedFields)blacklist
{
  return self->_blacklist;
}

- (void)setCategoryParameters:(id)a3
{
}

- (LCServiceLoggingParameters)categoryParameters
{
  return self->_categoryParameters;
}

- (int)eventType
{
  return self->_eventType;
}

- (LCServiceCategoryConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCServiceCategoryConfiguration;
  v5 = [(LCServiceCategoryConfiguration *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LCServiceCategoryConfiguration setEventType:](v5, "setEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"categoryParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[LCServiceLoggingParameters alloc] initWithDictionary:v7];
      [(LCServiceCategoryConfiguration *)v5 setCategoryParameters:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"blacklist"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[LCServiceBlacklistedFields alloc] initWithDictionary:v9];
      [(LCServiceCategoryConfiguration *)v5 setBlacklist:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (LCServiceCategoryConfiguration)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LCServiceCategoryConfiguration *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LCServiceCategoryConfiguration *)self dictionaryRepresentation];
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
  if (self->_blacklist)
  {
    id v4 = [(LCServiceCategoryConfiguration *)self blacklist];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"blacklist"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"blacklist"];
    }
  }
  if (self->_categoryParameters)
  {
    uint64_t v7 = [(LCServiceCategoryConfiguration *)self categoryParameters];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"categoryParameters"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"categoryParameters"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[LCServiceCategoryConfiguration eventType](self, "eventType"));
    [v3 setObject:v10 forKeyedSubscript:@"eventType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(LCServiceLoggingParameters *)self->_categoryParameters hash] ^ v3;
  return v4 ^ [(LCServiceBlacklistedFields *)self->_blacklist hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int eventType = self->_eventType;
    if (eventType != [v4 eventType]) {
      goto LABEL_15;
    }
  }
  v6 = [(LCServiceCategoryConfiguration *)self categoryParameters];
  uint64_t v7 = [v4 categoryParameters];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(LCServiceCategoryConfiguration *)self categoryParameters];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(LCServiceCategoryConfiguration *)self categoryParameters];
    int v11 = [v4 categoryParameters];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(LCServiceCategoryConfiguration *)self blacklist];
  uint64_t v7 = [v4 blacklist];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(LCServiceCategoryConfiguration *)self blacklist];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(LCServiceCategoryConfiguration *)self blacklist];
    v16 = [v4 blacklist];
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
  id v9 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(LCServiceCategoryConfiguration *)self categoryParameters];

  if (v4)
  {
    v5 = [(LCServiceCategoryConfiguration *)self categoryParameters];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(LCServiceCategoryConfiguration *)self blacklist];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(LCServiceCategoryConfiguration *)self blacklist];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceCategoryConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)deleteBlacklist
{
}

- (BOOL)hasBlacklist
{
  return self->_blacklist != 0;
}

- (void)deleteCategoryParameters
{
}

- (BOOL)hasCategoryParameters
{
  return self->_categoryParameters != 0;
}

- (void)deleteEventType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int eventType = a3;
}

@end