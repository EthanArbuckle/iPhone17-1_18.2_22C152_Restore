@interface NPKProtoRemoteAdminPerformRequest
- (BOOL)hasInfoDictionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)infoDictionary;
- (NSData)url;
- (NSString)command;
- (NSString)seid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommand:(id)a3;
- (void)setInfoDictionary:(id)a3;
- (void)setSeid:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemoteAdminPerformRequest

- (BOOL)hasInfoDictionary
{
  return self->_infoDictionary != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemoteAdminPerformRequest;
  v4 = [(NPKProtoRemoteAdminPerformRequest *)&v8 description];
  v5 = [(NPKProtoRemoteAdminPerformRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  seid = self->_seid;
  if (seid) {
    [v4 setObject:seid forKey:@"seid"];
  }
  command = self->_command;
  if (command) {
    [v4 setObject:command forKey:@"command"];
  }
  infoDictionary = self->_infoDictionary;
  if (infoDictionary) {
    [v4 setObject:infoDictionary forKey:@"infoDictionary"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoteAdminPerformRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_url) {
    -[NPKProtoRemoteAdminPerformRequest writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (!self->_seid) {
    -[NPKProtoRemoteAdminPerformRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_command) {
    -[NPKProtoRemoteAdminPerformRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_infoDictionary) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setUrl:self->_url];
  [v4 setSeid:self->_seid];
  [v4 setCommand:self->_command];
  if (self->_infoDictionary) {
    objc_msgSend(v4, "setInfoDictionary:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_url copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_seid copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_command copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSData *)self->_infoDictionary copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((url = self->_url, !((unint64_t)url | v4[4])) || -[NSData isEqual:](url, "isEqual:"))
    && ((seid = self->_seid, !((unint64_t)seid | v4[3])) || -[NSString isEqual:](seid, "isEqual:"))
    && ((command = self->_command, !((unint64_t)command | v4[1]))
     || -[NSString isEqual:](command, "isEqual:")))
  {
    infoDictionary = self->_infoDictionary;
    if ((unint64_t)infoDictionary | v4[2]) {
      char v9 = -[NSData isEqual:](infoDictionary, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_url hash];
  NSUInteger v4 = [(NSString *)self->_seid hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_command hash];
  return v4 ^ v5 ^ [(NSData *)self->_infoDictionary hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4]) {
    -[NPKProtoRemoteAdminPerformRequest setUrl:](self, "setUrl:");
  }
  if (v4[3]) {
    -[NPKProtoRemoteAdminPerformRequest setSeid:](self, "setSeid:");
  }
  if (v4[1]) {
    -[NPKProtoRemoteAdminPerformRequest setCommand:](self, "setCommand:");
  }
  if (v4[2]) {
    -[NPKProtoRemoteAdminPerformRequest setInfoDictionary:](self, "setInfoDictionary:");
  }
}

- (NSData)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSData)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 109, "nil != self->_url");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 114, "nil != self->_seid");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[NPKProtoRemoteAdminPerformRequest writeTo:]", "NPKProtoRemoteAdminPerformRequest.m", 119, "nil != self->_command");
}

@end