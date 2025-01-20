@interface NPKProtoPassAssociatedDataRequest
- (BOOL)hasPassRequestedData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)passRequestedData;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPassRequestedData:(BOOL)a3;
- (void)setPassRequestedData:(unint64_t)a3;
- (void)setPassUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassAssociatedDataRequest

- (void)setPassRequestedData:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passRequestedData = a3;
}

- (void)setHasPassRequestedData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassRequestedData
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassAssociatedDataRequest;
  v4 = [(NPKProtoPassAssociatedDataRequest *)&v8 description];
  v5 = [(NPKProtoPassAssociatedDataRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passUniqueID = self->_passUniqueID;
  if (passUniqueID) {
    [v3 setObject:passUniqueID forKey:@"passUniqueID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_passRequestedData];
    [v4 setObject:v6 forKey:@"passRequestedData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassAssociatedDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passUniqueID) {
    -[NPKProtoPassAssociatedDataRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setPassUniqueID:self->_passUniqueID];
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_passRequestedData;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passUniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_passRequestedData;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  passUniqueID = self->_passUniqueID;
  if ((unint64_t)passUniqueID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](passUniqueID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_passRequestedData == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passUniqueID hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_passRequestedData;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[NPKProtoPassAssociatedDataRequest setPassUniqueID:](self, "setPassUniqueID:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_passRequestedData = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (unint64_t)passRequestedData
{
  return self->_passRequestedData;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassAssociatedDataRequest writeTo:]", "NPKProtoPassAssociatedDataRequest.m", 96, "nil != self->_passUniqueID");
}

@end