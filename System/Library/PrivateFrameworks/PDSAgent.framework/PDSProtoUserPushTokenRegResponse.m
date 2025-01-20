@interface PDSProtoUserPushTokenRegResponse
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)message;
- (PDSProtoUserPushToken)userPushToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessage:(id)a3;
- (void)setStatus:(int)a3;
- (void)setUserPushToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDSProtoUserPushTokenRegResponse

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PDSProtoUserPushTokenRegResponse;
  v4 = [(PDSProtoUserPushTokenRegResponse *)&v8 description];
  v5 = [(PDSProtoUserPushTokenRegResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  userPushToken = self->_userPushToken;
  if (userPushToken)
  {
    v5 = [(PDSProtoUserPushToken *)userPushToken dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"user_push_token"];
  }
  v6 = [NSNumber numberWithInt:self->_status];
  [v3 setObject:v6 forKey:@"status"];

  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserPushTokenRegResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_userPushToken) {
    -[PDSProtoUserPushTokenRegResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setUserPushToken:self->_userPushToken];
  id v4 = v5;
  v5[4] = self->_status;
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDSProtoUserPushToken *)self->_userPushToken copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_status;
  uint64_t v8 = [(NSString *)self->_message copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userPushToken = self->_userPushToken, !((unint64_t)userPushToken | v4[3]))
     || -[PDSProtoUserPushToken isEqual:](userPushToken, "isEqual:"))
    && self->_status == *((_DWORD *)v4 + 4))
  {
    message = self->_message;
    if ((unint64_t)message | v4[1]) {
      char v7 = -[NSString isEqual:](message, "isEqual:");
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
  unint64_t v3 = [(PDSProtoUserPushToken *)self->_userPushToken hash];
  uint64_t v4 = 2654435761 * self->_status;
  return v4 ^ v3 ^ [(NSString *)self->_message hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  userPushToken = self->_userPushToken;
  uint64_t v6 = *((void *)v4 + 3);
  id v7 = v4;
  if (userPushToken)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDSProtoUserPushToken mergeFrom:](userPushToken, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDSProtoUserPushTokenRegResponse setUserPushToken:](self, "setUserPushToken:");
  }
  id v4 = v7;
LABEL_7:
  self->_status = *((_DWORD *)v4 + 4);
  if (*((void *)v4 + 1)) {
    -[PDSProtoUserPushTokenRegResponse setMessage:](self, "setMessage:");
  }
  MEMORY[0x270F9A758]();
}

- (PDSProtoUserPushToken)userPushToken
{
  return self->_userPushToken;
}

- (void)setUserPushToken:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPushToken, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoUserPushTokenRegResponse writeTo:]", "PDSProtoUserPushTokenRegResponse.m", 108, "self->_userPushToken != nil");
}

@end