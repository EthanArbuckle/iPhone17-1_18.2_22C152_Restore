@interface NETSchemaNETNetworkInterface
- (BOOL)hasConnectionType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETNetworkInterface)initWithDictionary:(id)a3;
- (NETSchemaNETNetworkInterface)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)connectionType;
- (unint64_t)hash;
- (void)deleteConnectionType;
- (void)deleteName;
- (void)setConnectionType:(int)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETNetworkInterface

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

- (int)connectionType
{
  return self->_connectionType;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NETSchemaNETNetworkInterface)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETNetworkInterface;
  v5 = [(NETSchemaNETNetworkInterface *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NETSchemaNETNetworkInterface *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"connectionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETNetworkInterface setConnectionType:](v5, "setConnectionType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NETSchemaNETNetworkInterface)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETNetworkInterface *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETNetworkInterface *)self dictionaryRepresentation];
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
    unsigned int v4 = [(NETSchemaNETNetworkInterface *)self connectionType] - 1;
    if (v4 > 0x16) {
      v5 = @"NETCONNECTIONTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EB2978[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"connectionType"];
  }
  if (self->_name)
  {
    v6 = [(NETSchemaNETNetworkInterface *)self name];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"name"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_connectionType;
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
  v5 = [(NETSchemaNETNetworkInterface *)self name];
  v6 = [v4 name];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(NETSchemaNETNetworkInterface *)self name];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NETSchemaNETNetworkInterface *)self name];
    objc_super v11 = [v4 name];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int connectionType = self->_connectionType;
    if (connectionType != [v4 connectionType]) {
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
  uint64_t v4 = [(NETSchemaNETNetworkInterface *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETNetworkInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)deleteConnectionType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasConnectionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConnectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int connectionType = a3;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end