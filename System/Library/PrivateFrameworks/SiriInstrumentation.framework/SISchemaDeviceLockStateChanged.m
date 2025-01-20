@interface SISchemaDeviceLockStateChanged
- (BOOL)hasIsDeviceLocked;
- (BOOL)isDeviceLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaDeviceLockStateChanged)initWithDictionary:(id)a3;
- (SISchemaDeviceLockStateChanged)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsDeviceLocked;
- (void)setHasIsDeviceLocked:(BOOL)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDeviceLockStateChanged

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (SISchemaDeviceLockStateChanged)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDeviceLockStateChanged;
  v5 = [(SISchemaDeviceLockStateChanged *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDeviceLocked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDeviceLockStateChanged setIsDeviceLocked:](v5, "setIsDeviceLocked:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaDeviceLockStateChanged)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDeviceLockStateChanged *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDeviceLockStateChanged *)self dictionaryRepresentation];
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
  if (*(&self->_isDeviceLocked + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaDeviceLockStateChanged isDeviceLocked](self, "isDeviceLocked"));
    [v3 setObject:v4 forKeyedSubscript:@"isDeviceLocked"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isDeviceLocked + 1)) {
    return 2654435761 * self->_isDeviceLocked;
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
    if (*(&self->_isDeviceLocked + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isDeviceLocked + 1)
        || (int isDeviceLocked = self->_isDeviceLocked, isDeviceLocked == [v4 isDeviceLocked]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isDeviceLocked + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDeviceLockStateChangedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsDeviceLocked
{
  *(&self->_isDeviceLocked + 1) &= ~1u;
}

- (void)setHasIsDeviceLocked:(BOOL)a3
{
  *(&self->_isDeviceLocked + 1) = *(&self->_isDeviceLocked + 1) & 0xFE | a3;
}

- (BOOL)hasIsDeviceLocked
{
  return *(&self->_isDeviceLocked + 1);
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  *(&self->_isDeviceLocked + 1) |= 1u;
  self->_int isDeviceLocked = a3;
}

@end