@interface NETSchemaNETEndpoint
- (BOOL)hasPort;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETEndpoint)initWithDictionary:(id)a3;
- (NETSchemaNETEndpoint)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)type;
- (unint64_t)hash;
- (unsigned)port;
- (void)deletePort;
- (void)deleteType;
- (void)setHasPort:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPort:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETEndpoint

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)port
{
  return self->_port;
}

- (int)type
{
  return self->_type;
}

- (NETSchemaNETEndpoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NETSchemaNETEndpoint;
  v5 = [(NETSchemaNETEndpoint *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETEndpoint setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"port"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETEndpoint setPort:](v5, "setPort:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NETSchemaNETEndpoint)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETEndpoint *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETEndpoint *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETEndpoint port](self, "port"));
    [v3 setObject:v5 forKeyedSubscript:@"port"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(NETSchemaNETEndpoint *)self type] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"NETENDPOINTTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB2938[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"type"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_port;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $5FEE3883993E78DC7B4520D512A656A2 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int type = self->_type;
    if (type != [v4 type])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $5FEE3883993E78DC7B4520D512A656A2 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int port = self->_port;
    if (port != [v4 port]) {
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
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETEndpointReadFrom(self, (uint64_t)a3);
}

- (void)deletePort
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPort:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPort
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPort:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int port = a3;
}

- (void)deleteType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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