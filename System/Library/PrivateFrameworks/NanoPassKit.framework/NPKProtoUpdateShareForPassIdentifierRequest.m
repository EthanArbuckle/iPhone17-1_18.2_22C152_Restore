@interface NPKProtoUpdateShareForPassIdentifierRequest
- (BOOL)hasAuthorization;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authorization;
- (NSData)shareData;
- (NSString)passIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setPassIdentifier:(id)a3;
- (void)setShareData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdateShareForPassIdentifierRequest

- (BOOL)hasAuthorization
{
  return self->_authorization != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdateShareForPassIdentifierRequest;
  v4 = [(NPKProtoUpdateShareForPassIdentifierRequest *)&v8 description];
  v5 = [(NPKProtoUpdateShareForPassIdentifierRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier) {
    [v3 setObject:passIdentifier forKey:@"passIdentifier"];
  }
  shareData = self->_shareData;
  if (shareData) {
    [v4 setObject:shareData forKey:@"shareData"];
  }
  authorization = self->_authorization;
  if (authorization) {
    [v4 setObject:authorization forKey:@"authorization"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateShareForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passIdentifier) {
    -[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_shareData) {
    -[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (self->_authorization) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setPassIdentifier:self->_passIdentifier];
  [v4 setShareData:self->_shareData];
  if (self->_authorization) {
    objc_msgSend(v4, "setAuthorization:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_shareData copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_authorization copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passIdentifier = self->_passIdentifier, !((unint64_t)passIdentifier | v4[2]))
     || -[NSString isEqual:](passIdentifier, "isEqual:"))
    && ((shareData = self->_shareData, !((unint64_t)shareData | v4[3]))
     || -[NSData isEqual:](shareData, "isEqual:")))
  {
    authorization = self->_authorization;
    if ((unint64_t)authorization | v4[1]) {
      char v8 = -[NSData isEqual:](authorization, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passIdentifier hash];
  uint64_t v4 = [(NSData *)self->_shareData hash] ^ v3;
  return v4 ^ [(NSData *)self->_authorization hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[NPKProtoUpdateShareForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
  }
  if (v4[3]) {
    -[NPKProtoUpdateShareForPassIdentifierRequest setShareData:](self, "setShareData:");
  }
  if (v4[1]) {
    -[NPKProtoUpdateShareForPassIdentifierRequest setAuthorization:](self, "setAuthorization:");
  }
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
}

- (NSData)shareData
{
  return self->_shareData;
}

- (void)setShareData:(id)a3
{
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]", "NPKProtoUpdateShareForPassIdentifierRequest.m", 98, "nil != self->_passIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoUpdateShareForPassIdentifierRequest writeTo:]", "NPKProtoUpdateShareForPassIdentifierRequest.m", 103, "nil != self->_shareData");
}

@end