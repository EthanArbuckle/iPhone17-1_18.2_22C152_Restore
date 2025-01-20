@interface PKProtobufCommonSharingMessageTypeChecker
- (BOOL)hasMessageType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)messageType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCommonSharingMessageTypeChecker

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCommonSharingMessageTypeChecker;
  v4 = [(PKProtobufCommonSharingMessageTypeChecker *)&v8 description];
  v5 = [(PKProtobufCommonSharingMessageTypeChecker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  messageType = self->_messageType;
  if (messageType) {
    [v3 setObject:messageType forKey:@"messageType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCommonSharingMessageTypeCheckerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_messageType) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_version;
  messageType = self->_messageType;
  if (messageType) {
    [a3 setMessageType:messageType];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_version;
  uint64_t v6 = [(NSString *)self->_messageType copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_version == *((_DWORD *)v4 + 4))
  {
    messageType = self->_messageType;
    if ((unint64_t)messageType | v4[1]) {
      char v6 = -[NSString isEqual:](messageType, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_version;
  return [(NSString *)self->_messageType hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 4);
  if (*((void *)a3 + 1)) {
    -[PKProtobufCommonSharingMessageTypeChecker setMessageType:](self, "setMessageType:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end