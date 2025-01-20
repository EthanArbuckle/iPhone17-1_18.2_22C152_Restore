@interface PBBProtoSendBuysOnWatchCredentials
- (BOOL)hasPassword;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)password;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSendBuysOnWatchCredentials

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSendBuysOnWatchCredentials;
  v4 = [(PBBProtoSendBuysOnWatchCredentials *)&v8 description];
  v5 = [(PBBProtoSendBuysOnWatchCredentials *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  username = self->_username;
  if (username) {
    [v3 setObject:username forKey:@"username"];
  }
  password = self->_password;
  if (password) {
    [v4 setObject:password forKey:@"password"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendBuysOnWatchCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    id v4 = v5;
  }
  if (self->_password)
  {
    objc_msgSend(v5, "setPassword:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_username copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_password copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((username = self->_username, !((unint64_t)username | v4[2]))
     || -[NSString isEqual:](username, "isEqual:")))
  {
    password = self->_password;
    if ((unint64_t)password | v4[1]) {
      char v7 = -[NSString isEqual:](password, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_username hash];
  return [(NSString *)self->_password hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[PBBProtoSendBuysOnWatchCredentials setUsername:](self, "setUsername:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[PBBProtoSendBuysOnWatchCredentials setPassword:](self, "setPassword:");
    id v4 = v5;
  }
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end