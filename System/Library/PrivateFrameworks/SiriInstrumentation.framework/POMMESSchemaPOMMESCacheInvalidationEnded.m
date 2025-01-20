@interface POMMESSchemaPOMMESCacheInvalidationEnded
- (BOOL)hasNumberOfCacheKeysInvalidated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESCacheInvalidationEnded)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheInvalidationEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numberOfCacheKeysInvalidated;
- (void)deleteNumberOfCacheKeysInvalidated;
- (void)setHasNumberOfCacheKeysInvalidated:(BOOL)a3;
- (void)setNumberOfCacheKeysInvalidated:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheInvalidationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numberOfCacheKeysInvalidated
{
  return self->_numberOfCacheKeysInvalidated;
}

- (POMMESSchemaPOMMESCacheInvalidationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheInvalidationEnded;
  v5 = [(POMMESSchemaPOMMESCacheInvalidationEnded *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfCacheKeysInvalidated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheInvalidationEnded setNumberOfCacheKeysInvalidated:](v5, "setNumberOfCacheKeysInvalidated:", [v6 unsignedIntValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheInvalidationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheInvalidationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheInvalidationEnded *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheInvalidationEnded numberOfCacheKeysInvalidated](self, "numberOfCacheKeysInvalidated"));
    [v3 setObject:v4 forKeyedSubscript:@"numberOfCacheKeysInvalidated"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_numberOfCacheKeysInvalidated;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int numberOfCacheKeysInvalidated = self->_numberOfCacheKeysInvalidated,
            numberOfCacheKeysInvalidated == [v4 numberOfCacheKeysInvalidated]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheInvalidationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumberOfCacheKeysInvalidated
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumberOfCacheKeysInvalidated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfCacheKeysInvalidated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfCacheKeysInvalidated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numberOfCacheKeysInvalidated = a3;
}

@end