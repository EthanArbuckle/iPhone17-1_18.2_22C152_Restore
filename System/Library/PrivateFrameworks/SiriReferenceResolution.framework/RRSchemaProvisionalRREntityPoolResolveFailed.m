@interface RRSchemaProvisionalRREntityPoolResolveFailed
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalRREntityPoolResolveFailed)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRREntityPoolResolveFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)reason;
- (unint64_t)hash;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRREntityPoolResolveFailed

- (int)reason
{
  return self->_reason;
}

- (RRSchemaProvisionalRREntityPoolResolveFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RRSchemaProvisionalRREntityPoolResolveFailed;
  v5 = [(RRSchemaProvisionalRREntityPoolResolveFailed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRREntityPoolResolveFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRREntityPoolResolveFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRREntityPoolResolveFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRREntityPoolResolveFailed *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(RRSchemaProvisionalRREntityPoolResolveFailed *)self reason] - 1;
    if (v4 > 2) {
      v5 = @"RRRESOLVEFAILUREREASON_UNKNOWN";
    }
    else {
      v5 = off_264463678[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"reason"];
  }
  [(RRSchemaProvisionalRREntityPoolResolveFailed *)self willProduceDictionaryRepresentation:v3];
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
  unsigned int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((v4[12] & 1) == (*(unsigned char *)&self->_has & 1))
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
  return RRSchemaProvisionalRREntityPoolResolveFailedReadFrom(self, (uint64_t)a3);
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