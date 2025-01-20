@interface SISchemaUEISiriCarCommandCancelled
- (BOOL)hasIsSiriDigitalCarKeyRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSiriDigitalCarKeyRequest;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEISiriCarCommandCancelled)initWithDictionary:(id)a3;
- (SISchemaUEISiriCarCommandCancelled)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsSiriDigitalCarKeyRequest;
- (void)setHasIsSiriDigitalCarKeyRequest:(BOOL)a3;
- (void)setIsSiriDigitalCarKeyRequest:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEISiriCarCommandCancelled

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isSiriDigitalCarKeyRequest
{
  return self->_isSiriDigitalCarKeyRequest;
}

- (SISchemaUEISiriCarCommandCancelled)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEISiriCarCommandCancelled;
  v5 = [(SISchemaUEISiriCarCommandCancelled *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSiriDigitalCarKeyRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEISiriCarCommandCancelled setIsSiriDigitalCarKeyRequest:](v5, "setIsSiriDigitalCarKeyRequest:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaUEISiriCarCommandCancelled)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEISiriCarCommandCancelled *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEISiriCarCommandCancelled *)self dictionaryRepresentation];
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
  if (*(&self->_isSiriDigitalCarKeyRequest + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEISiriCarCommandCancelled isSiriDigitalCarKeyRequest](self, "isSiriDigitalCarKeyRequest"));
    [v3 setObject:v4 forKeyedSubscript:@"isSiriDigitalCarKeyRequest"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isSiriDigitalCarKeyRequest + 1)) {
    return 2654435761 * self->_isSiriDigitalCarKeyRequest;
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
    if (*(&self->_isSiriDigitalCarKeyRequest + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isSiriDigitalCarKeyRequest + 1)
        || (int isSiriDigitalCarKeyRequest = self->_isSiriDigitalCarKeyRequest,
            isSiriDigitalCarKeyRequest == [v4 isSiriDigitalCarKeyRequest]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isSiriDigitalCarKeyRequest + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEISiriCarCommandCancelledReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSiriDigitalCarKeyRequest
{
  *(&self->_isSiriDigitalCarKeyRequest + 1) &= ~1u;
}

- (void)setHasIsSiriDigitalCarKeyRequest:(BOOL)a3
{
  *(&self->_isSiriDigitalCarKeyRequest + 1) = *(&self->_isSiriDigitalCarKeyRequest + 1) & 0xFE | a3;
}

- (BOOL)hasIsSiriDigitalCarKeyRequest
{
  return *(&self->_isSiriDigitalCarKeyRequest + 1);
}

- (void)setIsSiriDigitalCarKeyRequest:(BOOL)a3
{
  *(&self->_isSiriDigitalCarKeyRequest + 1) |= 1u;
  self->_int isSiriDigitalCarKeyRequest = a3;
}

@end