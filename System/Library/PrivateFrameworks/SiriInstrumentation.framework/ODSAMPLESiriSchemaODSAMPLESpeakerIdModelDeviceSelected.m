@interface ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected
- (BOOL)hasIsDeviceSelected;
- (BOOL)isDeviceSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)initWithDictionary:(id)a3;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsDeviceSelected;
- (void)setHasIsDeviceSelected:(BOOL)a3;
- (void)setIsDeviceSelected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isDeviceSelected
{
  return self->_isDeviceSelected;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected;
  v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDeviceSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected setIsDeviceSelected:](v5, "setIsDeviceSelected:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected *)self dictionaryRepresentation];
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
  if (*(&self->_isDeviceSelected + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelected isDeviceSelected](self, "isDeviceSelected"));
    [v3 setObject:v4 forKeyedSubscript:@"isDeviceSelected"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isDeviceSelected + 1)) {
    return 2654435761 * self->_isDeviceSelected;
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
    if (*(&self->_isDeviceSelected + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isDeviceSelected + 1)
        || (int isDeviceSelected = self->_isDeviceSelected,
            isDeviceSelected == [v4 isDeviceSelected]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isDeviceSelected + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODSAMPLESiriSchemaODSAMPLESpeakerIdModelDeviceSelectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsDeviceSelected
{
  *(&self->_isDeviceSelected + 1) &= ~1u;
}

- (void)setHasIsDeviceSelected:(BOOL)a3
{
  *(&self->_isDeviceSelected + 1) = *(&self->_isDeviceSelected + 1) & 0xFE | a3;
}

- (BOOL)hasIsDeviceSelected
{
  return *(&self->_isDeviceSelected + 1);
}

- (void)setIsDeviceSelected:(BOOL)a3
{
  *(&self->_isDeviceSelected + 1) |= 1u;
  self->_int isDeviceSelected = a3;
}

@end