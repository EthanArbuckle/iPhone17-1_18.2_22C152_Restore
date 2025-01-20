@interface PKProtobufIDSSharingMessageWrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)underlyingMessageData;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setUnderlyingMessageData:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufIDSSharingMessageWrapper

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufIDSSharingMessageWrapper;
  v4 = [(PKProtobufIDSSharingMessageWrapper *)&v8 description];
  v5 = [(PKProtobufIDSSharingMessageWrapper *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  underlyingMessageData = self->_underlyingMessageData;
  if (underlyingMessageData) {
    [v3 setObject:underlyingMessageData forKey:@"underlyingMessageData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufIDSSharingMessageWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_version;
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 setSessionIdentifier:sessionIdentifier];
  [v5 setUnderlyingMessageData:self->_underlyingMessageData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_version;
  uint64_t v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_underlyingMessageData copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 6)
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[1]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:")))
  {
    underlyingMessageData = self->_underlyingMessageData;
    if ((unint64_t)underlyingMessageData | v4[2]) {
      char v7 = -[NSData isEqual:](underlyingMessageData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_version;
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash];
  return v4 ^ [(NSData *)self->_underlyingMessageData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_version = v4[6];
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[PKProtobufIDSSharingMessageWrapper setSessionIdentifier:](self, "setSessionIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufIDSSharingMessageWrapper setUnderlyingMessageData:](self, "setUnderlyingMessageData:");
    NSUInteger v4 = v5;
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

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSData)underlyingMessageData
{
  return self->_underlyingMessageData;
}

- (void)setUnderlyingMessageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessageData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end