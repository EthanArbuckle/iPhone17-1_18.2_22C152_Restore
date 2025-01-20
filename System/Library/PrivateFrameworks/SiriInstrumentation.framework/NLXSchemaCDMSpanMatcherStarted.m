@interface NLXSchemaCDMSpanMatcherStarted
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSpanMatcherStarted)initWithDictionary:(id)a3;
- (NLXSchemaCDMSpanMatcherStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)name;
- (unint64_t)hash;
- (void)deleteName;
- (void)setHasName:(BOOL)a3;
- (void)setName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSpanMatcherStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)name
{
  return self->_name;
}

- (NLXSchemaCDMSpanMatcherStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMSpanMatcherStarted;
  v5 = [(NLXSchemaCDMSpanMatcherStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMSpanMatcherStarted setName:](v5, "setName:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSpanMatcherStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSpanMatcherStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSpanMatcherStarted *)self dictionaryRepresentation];
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
    unsigned int v4 = [(NLXSchemaCDMSpanMatcherStarted *)self name] - 1;
    if (v4 > 8) {
      v5 = @"CDMMATCHERNAME_UNKNOWN";
    }
    else {
      v5 = off_1E5EB3250[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_name;
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
      if ((*(unsigned char *)&self->_has & 1) == 0 || (int name = self->_name, name == [v4 name])) {
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
  return NLXSchemaCDMSpanMatcherStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteName
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int name = a3;
}

@end