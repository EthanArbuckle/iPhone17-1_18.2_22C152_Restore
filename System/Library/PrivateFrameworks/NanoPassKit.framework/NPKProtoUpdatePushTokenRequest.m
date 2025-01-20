@interface NPKProtoUpdatePushTokenRequest
- (BOOL)hasPushToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pushToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPushToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdatePushTokenRequest

- (BOOL)hasPushToken
{
  return self->_pushToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdatePushTokenRequest;
  v4 = [(NPKProtoUpdatePushTokenRequest *)&v8 description];
  v5 = [(NPKProtoUpdatePushTokenRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  pushToken = self->_pushToken;
  if (pushToken) {
    [v3 setObject:pushToken forKey:@"pushToken"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatePushTokenRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_pushToken) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  pushToken = self->_pushToken;
  if (pushToken) {
    [a3 setPushToken:pushToken];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_pushToken copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    pushToken = self->_pushToken;
    if ((unint64_t)pushToken | v4[1]) {
      char v6 = -[NSString isEqual:](pushToken, "isEqual:");
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
  return [(NSString *)self->_pushToken hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoUpdatePushTokenRequest setPushToken:](self, "setPushToken:");
  }
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end