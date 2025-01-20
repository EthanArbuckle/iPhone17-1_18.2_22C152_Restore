@interface IFTSchemaIFTResponseParameter
- (BOOL)hasIsRequired;
- (BOOL)hasProfanityFilter;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequired;
- (BOOL)profanityFilter;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTResponseParameter)initWithDictionary:(id)a3;
- (IFTSchemaIFTResponseParameter)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsRequired;
- (void)deleteProfanityFilter;
- (void)setHasIsRequired:(BOOL)a3;
- (void)setHasProfanityFilter:(BOOL)a3;
- (void)setIsRequired:(BOOL)a3;
- (void)setProfanityFilter:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTResponseParameter

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (BOOL)profanityFilter
{
  return self->_profanityFilter;
}

- (IFTSchemaIFTResponseParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTResponseParameter;
  v5 = [(IFTSchemaIFTResponseParameter *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"profanityFilter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTResponseParameter setProfanityFilter:](v5, "setProfanityFilter:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTResponseParameter setIsRequired:](v5, "setIsRequired:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (IFTSchemaIFTResponseParameter)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTResponseParameter *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTResponseParameter *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isRequired + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTResponseParameter isRequired](self, "isRequired"));
    [v3 setObject:v5 forKeyedSubscript:@"isRequired"];

    char v4 = *(&self->_isRequired + 1);
  }
  if (v4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTResponseParameter profanityFilter](self, "profanityFilter"));
    [v3 setObject:v6 forKeyedSubscript:@"profanityFilter"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isRequired + 1))
  {
    uint64_t v2 = 2654435761 * self->_profanityFilter;
    if ((*(&self->_isRequired + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isRequired + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isRequired;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isRequired + 1);
  unsigned int v6 = v4[10];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int profanityFilter = self->_profanityFilter;
    if (profanityFilter != [v4 profanityFilter])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isRequired + 1);
    unsigned int v6 = v4[10];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isRequired = self->_isRequired;
    if (isRequired != [v4 isRequired]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isRequired + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char v5 = *(&self->_isRequired + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTResponseParameterReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsRequired
{
  *(&self->_isRequired + 1) &= ~2u;
}

- (void)setHasIsRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isRequired + 1) = *(&self->_isRequired + 1) & 0xFD | v3;
}

- (BOOL)hasIsRequired
{
  return (*((unsigned __int8 *)&self->_isRequired + 1) >> 1) & 1;
}

- (void)setIsRequired:(BOOL)a3
{
  *(&self->_isRequired + 1) |= 2u;
  self->_int isRequired = a3;
}

- (void)deleteProfanityFilter
{
  *(&self->_isRequired + 1) &= ~1u;
}

- (void)setHasProfanityFilter:(BOOL)a3
{
  *(&self->_isRequired + 1) = *(&self->_isRequired + 1) & 0xFE | a3;
}

- (BOOL)hasProfanityFilter
{
  return *(&self->_isRequired + 1);
}

- (void)setProfanityFilter:(BOOL)a3
{
  *(&self->_isRequired + 1) |= 1u;
  self->_int profanityFilter = a3;
}

@end