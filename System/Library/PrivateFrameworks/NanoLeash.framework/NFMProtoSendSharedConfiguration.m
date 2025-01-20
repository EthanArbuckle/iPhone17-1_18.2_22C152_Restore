@interface NFMProtoSendSharedConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sharedConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSharedConfiguration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NFMProtoSendSharedConfiguration

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NFMProtoSendSharedConfiguration;
  v4 = [(NFMProtoSendSharedConfiguration *)&v8 description];
  v5 = [(NFMProtoSendSharedConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sharedConfiguration = self->_sharedConfiguration;
  if (sharedConfiguration) {
    [v3 setObject:sharedConfiguration forKey:@"sharedConfiguration"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NFMProtoSendSharedConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_sharedConfiguration) {
    -[NFMProtoSendSharedConfiguration writeTo:]();
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
  uint64_t v6 = [(NSData *)self->_sharedConfiguration copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sharedConfiguration = self->_sharedConfiguration;
    if ((unint64_t)sharedConfiguration | v4[1]) {
      char v6 = -[NSData isEqual:](sharedConfiguration, "isEqual:");
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
  return [(NSData *)self->_sharedConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NFMProtoSendSharedConfiguration setSharedConfiguration:](self, "setSharedConfiguration:");
  }
}

- (NSData)sharedConfiguration
{
  return self->_sharedConfiguration;
}

- (void)setSharedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NFMProtoSendSharedConfiguration writeTo:]", "NFMProtoSendSharedConfiguration.m", 72, "nil != self->_sharedConfiguration");
}

@end