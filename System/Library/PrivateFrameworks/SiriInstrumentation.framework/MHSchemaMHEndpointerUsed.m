@interface MHSchemaMHEndpointerUsed
- (BOOL)hasEndpointer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHEndpointerUsed)initWithDictionary:(id)a3;
- (MHSchemaMHEndpointerUsed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)endpointer;
- (unint64_t)hash;
- (void)deleteEndpointer;
- (void)setEndpointer:(int)a3;
- (void)setHasEndpointer:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHEndpointerUsed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)endpointer
{
  return self->_endpointer;
}

- (MHSchemaMHEndpointerUsed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHEndpointerUsed;
  v5 = [(MHSchemaMHEndpointerUsed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"endpointer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHEndpointerUsed setEndpointer:](v5, "setEndpointer:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (MHSchemaMHEndpointerUsed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHEndpointerUsed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHEndpointerUsed *)self dictionaryRepresentation];
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
    unsigned int v4 = [(MHSchemaMHEndpointerUsed *)self endpointer] - 1;
    if (v4 > 6) {
      v5 = @"MHENDPOINTER_TYPE_UNDEFINED";
    }
    else {
      v5 = off_1E5EB1880[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"endpointer"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_endpointer;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int endpointer = self->_endpointer, endpointer == [v4 endpointer]))
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
  return MHSchemaMHEndpointerUsedReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndpointer
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEndpointer:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndpointer
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEndpointer:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int endpointer = a3;
}

@end