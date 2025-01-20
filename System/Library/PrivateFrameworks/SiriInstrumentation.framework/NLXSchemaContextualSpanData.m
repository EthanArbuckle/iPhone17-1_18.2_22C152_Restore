@interface NLXSchemaContextualSpanData
- (BOOL)hasIsSurroundingTextMatched;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSurroundingTextMatched;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaContextualSpanData)initWithDictionary:(id)a3;
- (NLXSchemaContextualSpanData)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsSurroundingTextMatched;
- (void)setHasIsSurroundingTextMatched:(BOOL)a3;
- (void)setIsSurroundingTextMatched:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaContextualSpanData

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isSurroundingTextMatched
{
  return self->_isSurroundingTextMatched;
}

- (NLXSchemaContextualSpanData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaContextualSpanData;
  v5 = [(NLXSchemaContextualSpanData *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSurroundingTextMatched"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaContextualSpanData setIsSurroundingTextMatched:](v5, "setIsSurroundingTextMatched:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaContextualSpanData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaContextualSpanData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaContextualSpanData *)self dictionaryRepresentation];
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
  if (*(&self->_isSurroundingTextMatched + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaContextualSpanData isSurroundingTextMatched](self, "isSurroundingTextMatched"));
    [v3 setObject:v4 forKeyedSubscript:@"isSurroundingTextMatched"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isSurroundingTextMatched + 1)) {
    return 2654435761 * self->_isSurroundingTextMatched;
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
    if (*(&self->_isSurroundingTextMatched + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isSurroundingTextMatched + 1)
        || (int isSurroundingTextMatched = self->_isSurroundingTextMatched,
            isSurroundingTextMatched == [v4 isSurroundingTextMatched]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isSurroundingTextMatched + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaContextualSpanDataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSurroundingTextMatched
{
  *(&self->_isSurroundingTextMatched + 1) &= ~1u;
}

- (void)setHasIsSurroundingTextMatched:(BOOL)a3
{
  *(&self->_isSurroundingTextMatched + 1) = *(&self->_isSurroundingTextMatched + 1) & 0xFE | a3;
}

- (BOOL)hasIsSurroundingTextMatched
{
  return *(&self->_isSurroundingTextMatched + 1);
}

- (void)setIsSurroundingTextMatched:(BOOL)a3
{
  *(&self->_isSurroundingTextMatched + 1) |= 1u;
  self->_int isSurroundingTextMatched = a3;
}

@end