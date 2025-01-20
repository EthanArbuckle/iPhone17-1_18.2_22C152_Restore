@interface FLOWLINKSchemaFLOWLINKActionParameter
- (BOOL)hasIsArray;
- (BOOL)hasName;
- (BOOL)hasType;
- (BOOL)isArray;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWLINKSchemaFLOWLINKActionParameter)initWithDictionary:(id)a3;
- (FLOWLINKSchemaFLOWLINKActionParameter)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)type;
- (unint64_t)hash;
- (void)deleteIsArray;
- (void)deleteName;
- (void)deleteType;
- (void)setHasIsArray:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsArray:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWLINKSchemaFLOWLINKActionParameter

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)type
{
  return self->_type;
}

- (BOOL)isArray
{
  return self->_isArray;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (FLOWLINKSchemaFLOWLINKActionParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWLINKSchemaFLOWLINKActionParameter;
  v5 = [(FLOWLINKSchemaFLOWLINKActionParameter *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(FLOWLINKSchemaFLOWLINKActionParameter *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isArray"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWLINKSchemaFLOWLINKActionParameter setIsArray:](v5, "setIsArray:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWLINKSchemaFLOWLINKActionParameter setType:](v5, "setType:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (FLOWLINKSchemaFLOWLINKActionParameter)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWLINKSchemaFLOWLINKActionParameter *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWLINKSchemaFLOWLINKActionParameter isArray](self, "isArray"));
    [v3 setObject:v4 forKeyedSubscript:@"isArray"];
  }
  if (self->_name)
  {
    v5 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self name];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"name"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v7 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self type] - 1;
    if (v7 > 0x16) {
      v8 = @"LINKPARAMETERTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EAE850[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"type"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_isArray;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self name];
  v6 = [v4 name];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self name];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self name];
    v11 = [v4 name];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $4539F306875B45855F1CA37ECBC062B6 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int isArray = self->_isArray;
    if (isArray == [v4 isArray])
    {
      $4539F306875B45855F1CA37ECBC062B6 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    int type = self->_type;
    if (type != [v4 type]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(FLOWLINKSchemaFLOWLINKActionParameter *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionParameterReadFrom(self, (uint64_t)a3);
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int type = a3;
}

- (void)deleteIsArray
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsArray:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsArray
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsArray:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isArray = a3;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end