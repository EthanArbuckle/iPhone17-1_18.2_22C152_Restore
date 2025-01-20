@interface RRSchemaProvisionalPullerFailed
- (BOOL)hasName;
- (BOOL)hasTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)timeout;
- (NSData)jsonData;
- (NSString)name;
- (RRSchemaProvisionalPullerFailed)initWithDictionary:(id)a3;
- (RRSchemaProvisionalPullerFailed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasName:(BOOL)a3;
- (void)setHasTimeout:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTimeout:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalPullerFailed

- (void).cxx_destruct
{
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (BOOL)timeout
{
  return self->_timeout;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (RRSchemaProvisionalPullerFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RRSchemaProvisionalPullerFailed;
  v5 = [(RRSchemaProvisionalPullerFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RRSchemaProvisionalPullerFailed *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"timeout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalPullerFailed setTimeout:](v5, "setTimeout:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalPullerFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalPullerFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalPullerFailed *)self dictionaryRepresentation];
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
  if (self->_name)
  {
    id v4 = [(RRSchemaProvisionalPullerFailed *)self name];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[RRSchemaProvisionalPullerFailed timeout](self, "timeout"));
    [v3 setObject:v6 forKeyedSubscript:@"timeout"];
  }
  [(RRSchemaProvisionalPullerFailed *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_timeout;
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
  v5 = [(RRSchemaProvisionalPullerFailed *)self name];
  v6 = [v4 name];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaProvisionalPullerFailed *)self name];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaProvisionalPullerFailed *)self name];
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
    int timeout = self->_timeout;
    if (timeout != [v4 timeout]) {
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
  uint64_t v4 = [(RRSchemaProvisionalPullerFailed *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalPullerFailedReadFrom(self, (uint64_t)a3);
}

- (void)setHasTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int timeout = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end