@interface NPKProtoRegistrationDataRequest
- (BOOL)hasAuthToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)authToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRegistrationDataRequest

- (BOOL)hasAuthToken
{
  return self->_authToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRegistrationDataRequest;
  v4 = [(NPKProtoRegistrationDataRequest *)&v8 description];
  v5 = [(NPKProtoRegistrationDataRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  authToken = self->_authToken;
  if (authToken) {
    [v3 setObject:authToken forKey:@"authToken"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRegistrationDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_authToken) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  authToken = self->_authToken;
  if (authToken) {
    [a3 setAuthToken:authToken];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_authToken copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    authToken = self->_authToken;
    if ((unint64_t)authToken | v4[1]) {
      char v6 = -[NSString isEqual:](authToken, "isEqual:");
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
  return [(NSString *)self->_authToken hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoRegistrationDataRequest setAuthToken:](self, "setAuthToken:");
  }
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end