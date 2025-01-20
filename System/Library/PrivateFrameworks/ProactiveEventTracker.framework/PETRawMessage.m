@interface PETRawMessage
- (BOOL)hasName;
- (BOOL)hasRawBytes;
- (BOOL)hasTypeId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)rawBytes;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)typeId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTypeId:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRawBytes:(id)a3;
- (void)setTypeId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETRawMessage

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_rawBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBytes, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setTypeId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_typeId = a3;
}

- (void)setRawBytes:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSData)rawBytes
{
  return self->_rawBytes;
}

- (unsigned)typeId
{
  return self->_typeId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[7])
  {
    self->_typeId = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PETRawMessage setRawBytes:](self, "setRawBytes:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PETRawMessage setName:](self, "setName:");
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_typeId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_rawBytes hash] ^ v3;
  return v4 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_typeId != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  rawBytes = self->_rawBytes;
  if ((unint64_t)rawBytes | *((void *)v4 + 2) && !-[NSData isEqual:](rawBytes, "isEqual:")) {
    goto LABEL_11;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](name, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_typeId;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_rawBytes copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_typeId;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_rawBytes)
  {
    objc_msgSend(v4, "setRawBytes:");
    id v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETRawMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_typeId];
    [v3 setObject:v4 forKey:@"type_id"];
  }
  rawBytes = self->_rawBytes;
  if (rawBytes) {
    [v3 setObject:rawBytes forKey:@"raw_bytes"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PETRawMessage;
  id v4 = [(PETRawMessage *)&v8 description];
  uint64_t v5 = [(PETRawMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasRawBytes
{
  return self->_rawBytes != 0;
}

- (BOOL)hasTypeId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTypeId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

@end