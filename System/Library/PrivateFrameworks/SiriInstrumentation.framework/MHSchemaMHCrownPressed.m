@interface MHSchemaMHCrownPressed
- (BOOL)hasIsAlwaysOnMicAudioUsed;
- (BOOL)isAlwaysOnMicAudioUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHCrownPressed)initWithDictionary:(id)a3;
- (MHSchemaMHCrownPressed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsAlwaysOnMicAudioUsed;
- (void)setHasIsAlwaysOnMicAudioUsed:(BOOL)a3;
- (void)setIsAlwaysOnMicAudioUsed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHCrownPressed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isAlwaysOnMicAudioUsed
{
  return self->_isAlwaysOnMicAudioUsed;
}

- (MHSchemaMHCrownPressed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHCrownPressed;
  v5 = [(MHSchemaMHCrownPressed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAlwaysOnMicAudioUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCrownPressed setIsAlwaysOnMicAudioUsed:](v5, "setIsAlwaysOnMicAudioUsed:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MHSchemaMHCrownPressed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHCrownPressed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHCrownPressed *)self dictionaryRepresentation];
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
  if (*(&self->_isAlwaysOnMicAudioUsed + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHCrownPressed isAlwaysOnMicAudioUsed](self, "isAlwaysOnMicAudioUsed"));
    [v3 setObject:v4 forKeyedSubscript:@"isAlwaysOnMicAudioUsed"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isAlwaysOnMicAudioUsed + 1)) {
    return 2654435761 * self->_isAlwaysOnMicAudioUsed;
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
    if (*(&self->_isAlwaysOnMicAudioUsed + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isAlwaysOnMicAudioUsed + 1)
        || (int isAlwaysOnMicAudioUsed = self->_isAlwaysOnMicAudioUsed,
            isAlwaysOnMicAudioUsed == [v4 isAlwaysOnMicAudioUsed]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isAlwaysOnMicAudioUsed + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHCrownPressedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsAlwaysOnMicAudioUsed
{
  *(&self->_isAlwaysOnMicAudioUsed + 1) &= ~1u;
}

- (void)setHasIsAlwaysOnMicAudioUsed:(BOOL)a3
{
  *(&self->_isAlwaysOnMicAudioUsed + 1) = *(&self->_isAlwaysOnMicAudioUsed + 1) & 0xFE | a3;
}

- (BOOL)hasIsAlwaysOnMicAudioUsed
{
  return *(&self->_isAlwaysOnMicAudioUsed + 1);
}

- (void)setIsAlwaysOnMicAudioUsed:(BOOL)a3
{
  *(&self->_isAlwaysOnMicAudioUsed + 1) |= 1u;
  self->_int isAlwaysOnMicAudioUsed = a3;
}

@end