@interface NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest
- (BOOL)hasActivationCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sharingMessageData;
- (NSString)activationCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationCode:(id)a3;
- (void)setSharingMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest

- (BOOL)hasActivationCode
{
  return self->_activationCode != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest;
  v4 = [(NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest *)&v8 description];
  v5 = [(NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sharingMessageData = self->_sharingMessageData;
  if (sharingMessageData) {
    [v3 setObject:sharingMessageData forKey:@"sharingMessageData"];
  }
  activationCode = self->_activationCode;
  if (activationCode) {
    [v4 setObject:activationCode forKey:@"activationCode"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_sharingMessageData) {
    -[NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_activationCode) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setSharingMessageData:self->_sharingMessageData];
  if (self->_activationCode) {
    objc_msgSend(v4, "setActivationCode:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_sharingMessageData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_activationCode copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sharingMessageData = self->_sharingMessageData, !((unint64_t)sharingMessageData | v4[2]))
     || -[NSData isEqual:](sharingMessageData, "isEqual:")))
  {
    activationCode = self->_activationCode;
    if ((unint64_t)activationCode | v4[1]) {
      char v7 = -[NSString isEqual:](activationCode, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_sharingMessageData hash];
  return [(NSString *)self->_activationCode hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest setSharingMessageData:](self, "setSharingMessageData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest setActivationCode:](self, "setActivationCode:");
    id v4 = v5;
  }
}

- (NSData)sharingMessageData
{
  return self->_sharingMessageData;
}

- (void)setSharingMessageData:(id)a3
{
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingMessageData, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest writeTo:]", "NPKProtoAcceptCarKeyShareForMessageWithActivationCodeRequest.m", 87, "nil != self->_sharingMessageData");
}

@end