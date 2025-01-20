@interface NFMProtoSendWatchToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)discoveryToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDiscoveryToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NFMProtoSendWatchToken

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NFMProtoSendWatchToken;
  v4 = [(NFMProtoSendWatchToken *)&v8 description];
  v5 = [(NFMProtoSendWatchToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  discoveryToken = self->_discoveryToken;
  if (discoveryToken) {
    [v3 setObject:discoveryToken forKey:@"discoveryToken"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NFMProtoSendWatchTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_discoveryToken) {
    -[NFMProtoSendWatchToken writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_discoveryToken copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    discoveryToken = self->_discoveryToken;
    if ((unint64_t)discoveryToken | v4[1]) {
      char v6 = -[NSData isEqual:](discoveryToken, "isEqual:");
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
  return [(NSData *)self->_discoveryToken hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NFMProtoSendWatchToken setDiscoveryToken:](self, "setDiscoveryToken:");
  }
}

- (NSData)discoveryToken
{
  return self->_discoveryToken;
}

- (void)setDiscoveryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NFMProtoSendWatchToken writeTo:]", "NFMProtoSendWatchToken.m", 72, "nil != self->_discoveryToken");
}

@end