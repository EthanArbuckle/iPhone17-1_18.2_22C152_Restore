@interface NETSchemaNETPathInterface
- (BOOL)hasIndex;
- (BOOL)hasName;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETPathInterface)initWithDictionary:(id)a3;
- (NETSchemaNETPathInterface)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)type;
- (unint64_t)hash;
- (unsigned)index;
- (void)deleteIndex;
- (void)deleteName;
- (void)deleteType;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETPathInterface

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

- (unsigned)index
{
  return self->_index;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (int)type
{
  return self->_type;
}

- (NETSchemaNETPathInterface)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NETSchemaNETPathInterface;
  v5 = [(NETSchemaNETPathInterface *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPathInterface setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(NETSchemaNETPathInterface *)v5 setName:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETPathInterface setIndex:](v5, "setIndex:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NETSchemaNETPathInterface)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETPathInterface *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETPathInterface *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETPathInterface index](self, "index"));
    [v3 setObject:v4 forKeyedSubscript:@"index"];
  }
  if (self->_name)
  {
    v5 = [(NETSchemaNETPathInterface *)self name];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(NETSchemaNETPathInterface *)self type] - 1;
    if (v7 > 3) {
      v8 = @"NETPATHTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EB2A30[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"type"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_index;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[28] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type != [v4 type]) {
      goto LABEL_15;
    }
  }
  v6 = [(NETSchemaNETPathInterface *)self name];
  unsigned int v7 = [v4 name];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(NETSchemaNETPathInterface *)self name];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(NETSchemaNETPathInterface *)self name];
    objc_super v12 = [v4 name];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v14 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1)) {
    goto LABEL_15;
  }
  if (v14)
  {
    unsigned int index = self->_index;
    if (index != [v4 index]) {
      goto LABEL_15;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(NETSchemaNETPathInterface *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETPathInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)deleteIndex
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int index = a3;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int type = a3;
}

@end