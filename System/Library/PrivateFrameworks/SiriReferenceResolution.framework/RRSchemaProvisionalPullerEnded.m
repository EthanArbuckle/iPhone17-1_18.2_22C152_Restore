@interface RRSchemaProvisionalPullerEnded
- (BOOL)hasEntityCount;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (RRSchemaProvisionalPullerEnded)initWithDictionary:(id)a3;
- (RRSchemaProvisionalPullerEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)entityCount;
- (unint64_t)hash;
- (void)setEntityCount:(int)a3;
- (void)setHasEntityCount:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalPullerEnded

- (void).cxx_destruct
{
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (int)entityCount
{
  return self->_entityCount;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (RRSchemaProvisionalPullerEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RRSchemaProvisionalPullerEnded;
  v5 = [(RRSchemaProvisionalPullerEnded *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RRSchemaProvisionalPullerEnded *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"entityCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalPullerEnded setEntityCount:](v5, "setEntityCount:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalPullerEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalPullerEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalPullerEnded *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[RRSchemaProvisionalPullerEnded entityCount](self, "entityCount"));
    [v3 setObject:v4 forKeyedSubscript:@"entityCount"];
  }
  if (self->_name)
  {
    v5 = [(RRSchemaProvisionalPullerEnded *)self name];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"name"];
  }
  [(RRSchemaProvisionalPullerEnded *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_entityCount;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(RRSchemaProvisionalPullerEnded *)self name];
  v6 = [v4 name];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaProvisionalPullerEnded *)self name];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaProvisionalPullerEnded *)self name];
    objc_super v11 = [v4 name];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((v4[20] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int entityCount = self->_entityCount;
    if (entityCount != [v4 entityCount]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(RRSchemaProvisionalPullerEnded *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalPullerEndedReadFrom(self, (uint64_t)a3);
}

- (void)setHasEntityCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEntityCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int entityCount = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end