@interface DIMSchemaEntitySyncSettings
- (BOOL)hasIsMediaEntitySyncEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaEntitySyncEnabled;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaEntitySyncSettings)initWithDictionary:(id)a3;
- (DIMSchemaEntitySyncSettings)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsMediaEntitySyncEnabled;
- (void)setHasIsMediaEntitySyncEnabled:(BOOL)a3;
- (void)setIsMediaEntitySyncEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaEntitySyncSettings

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isMediaEntitySyncEnabled
{
  return self->_isMediaEntitySyncEnabled;
}

- (DIMSchemaEntitySyncSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIMSchemaEntitySyncSettings;
  v5 = [(DIMSchemaEntitySyncSettings *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isMediaEntitySyncEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaEntitySyncSettings setIsMediaEntitySyncEnabled:](v5, "setIsMediaEntitySyncEnabled:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (DIMSchemaEntitySyncSettings)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaEntitySyncSettings *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaEntitySyncSettings *)self dictionaryRepresentation];
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
  if (*(&self->_isMediaEntitySyncEnabled + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[DIMSchemaEntitySyncSettings isMediaEntitySyncEnabled](self, "isMediaEntitySyncEnabled"));
    [v3 setObject:v4 forKeyedSubscript:@"isMediaEntitySyncEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isMediaEntitySyncEnabled + 1)) {
    return 2654435761 * self->_isMediaEntitySyncEnabled;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (*(&self->_isMediaEntitySyncEnabled + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isMediaEntitySyncEnabled + 1)
        || (int isMediaEntitySyncEnabled = self->_isMediaEntitySyncEnabled,
            isMediaEntitySyncEnabled == [v4 isMediaEntitySyncEnabled]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isMediaEntitySyncEnabled + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaEntitySyncSettingsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsMediaEntitySyncEnabled
{
  *(&self->_isMediaEntitySyncEnabled + 1) &= ~1u;
}

- (void)setHasIsMediaEntitySyncEnabled:(BOOL)a3
{
  *(&self->_isMediaEntitySyncEnabled + 1) = *(&self->_isMediaEntitySyncEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsMediaEntitySyncEnabled
{
  return *(&self->_isMediaEntitySyncEnabled + 1);
}

- (void)setIsMediaEntitySyncEnabled:(BOOL)a3
{
  *(&self->_isMediaEntitySyncEnabled + 1) |= 1u;
  self->_int isMediaEntitySyncEnabled = a3;
}

@end