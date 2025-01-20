@interface PDSProtoUserPushToken
- (BOOL)hasUserAuth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pushToken;
- (NSString)userId;
- (PDSProtoUserAuth)userAuth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setUserAuth:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoUserPushToken

- (BOOL)hasUserAuth
{
  return self->_userAuth != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoUserPushToken;
  v4 = [(PDSProtoUserPushToken *)&v8 description];
  v5 = [(PDSProtoUserPushToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"user_id"];
  }
  userAuth = self->_userAuth;
  if (userAuth)
  {
    v7 = [(PDSProtoUserAuth *)userAuth dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"user_auth"];
  }
  pushToken = self->_pushToken;
  if (pushToken) {
    [v4 setObject:pushToken forKey:@"push_token"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserPushTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_userId) {
    -[PDSProtoUserPushToken writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_userAuth) {
    PBDataWriterWriteSubmessage();
  }
  if (!self->_pushToken) {
    -[PDSProtoUserPushToken writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setUserId:self->_userId];
  if (self->_userAuth) {
    objc_msgSend(v4, "setUserAuth:");
  }
  [v4 setPushToken:self->_pushToken];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PDSProtoUserAuth *)self->_userAuth copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_pushToken copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userId = self->_userId, !((unint64_t)userId | v4[3]))
     || -[NSString isEqual:](userId, "isEqual:"))
    && ((userAuth = self->_userAuth, !((unint64_t)userAuth | v4[2]))
     || -[PDSProtoUserAuth isEqual:](userAuth, "isEqual:")))
  {
    pushToken = self->_pushToken;
    if ((unint64_t)pushToken | v4[1]) {
      char v8 = -[NSString isEqual:](pushToken, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_userId hash];
  unint64_t v4 = [(PDSProtoUserAuth *)self->_userAuth hash] ^ v3;
  return v4 ^ [(NSString *)self->_pushToken hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[PDSProtoUserPushToken setUserId:](self, "setUserId:");
    unint64_t v4 = v7;
  }
  userAuth = self->_userAuth;
  uint64_t v6 = v4[2];
  if (userAuth)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDSProtoUserAuth mergeFrom:](userAuth, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDSProtoUserPushToken setUserAuth:](self, "setUserAuth:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[1]) {
    -[PDSProtoUserPushToken setPushToken:](self, "setPushToken:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (PDSProtoUserAuth)userAuth
{
  return self->_userAuth;
}

- (void)setUserAuth:(id)a3
{
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
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_userAuth, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoUserPushToken writeTo:]", "PDSProtoUserPushToken.m", 112, "nil != self->_userId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[PDSProtoUserPushToken writeTo:]", "PDSProtoUserPushToken.m", 124, "nil != self->_pushToken");
}

@end