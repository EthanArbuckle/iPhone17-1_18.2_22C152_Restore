@interface RRSchemaProvisionalRRGroupIdentifier
- (BOOL)hasGroupId;
- (BOOL)hasSeq;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)groupId;
- (RRSchemaProvisionalRRGroupIdentifier)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRRGroupIdentifier)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)seq;
- (void)setGroupId:(id)a3;
- (void)setHasGroupId:(BOOL)a3;
- (void)setHasSeq:(BOOL)a3;
- (void)setSeq:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRRGroupIdentifier

- (void).cxx_destruct
{
}

- (void)setHasGroupId:(BOOL)a3
{
  self->_hasGroupId = a3;
}

- (unsigned)seq
{
  return self->_seq;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (RRSchemaProvisionalRRGroupIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RRSchemaProvisionalRRGroupIdentifier;
  v5 = [(RRSchemaProvisionalRRGroupIdentifier *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"groupId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RRSchemaProvisionalRRGroupIdentifier *)v5 setGroupId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"seq"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRRGroupIdentifier setSeq:](v5, "setSeq:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRRGroupIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRRGroupIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRRGroupIdentifier *)self dictionaryRepresentation];
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
  if (self->_groupId)
  {
    id v4 = [(RRSchemaProvisionalRRGroupIdentifier *)self groupId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"groupId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RRSchemaProvisionalRRGroupIdentifier seq](self, "seq"));
    [v3 setObject:v6 forKeyedSubscript:@"seq"];
  }
  [(RRSchemaProvisionalRRGroupIdentifier *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_seq;
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
  v5 = [(RRSchemaProvisionalRRGroupIdentifier *)self groupId];
  v6 = [v4 groupId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(RRSchemaProvisionalRRGroupIdentifier *)self groupId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaProvisionalRRGroupIdentifier *)self groupId];
    objc_super v11 = [v4 groupId];
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
    unsigned int seq = self->_seq;
    if (seq != [v4 seq]) {
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
  uint64_t v4 = [(RRSchemaProvisionalRRGroupIdentifier *)self groupId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRGroupIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)setHasSeq:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSeq
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSeq:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int seq = a3;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

@end