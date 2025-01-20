@interface POMMESSchemaPOMMESCacheInvalidationFailed
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESCacheInvalidationFailed)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheInvalidationFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (void)deleteReason;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheInvalidationFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (POMMESSchemaPOMMESCacheInvalidationFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheInvalidationFailed;
  v5 = [(POMMESSchemaPOMMESCacheInvalidationFailed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheInvalidationFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheInvalidationFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheInvalidationFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheInvalidationFailed *)self dictionaryRepresentation];
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
    int v4 = [(POMMESSchemaPOMMESCacheInvalidationFailed *)self reason];
    v5 = @"POMMESCACHEINVALIDATIONFAILEDREASON_UNKNOWN";
    if (v4 == 1) {
      v5 = @"POMMESCACHEINVALIDATIONFAILEDREASON_UNABLE_TO_OPEN_DATABASE";
    }
    if (v4 == 2) {
      v6 = @"POMMESCACHEINVALIDATIONFAILEDREASON_INVALIDATION_FAILURE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_reason;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int reason = self->_reason, reason == [v4 reason]))
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
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheInvalidationFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end