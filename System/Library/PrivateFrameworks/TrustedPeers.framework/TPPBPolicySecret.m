@interface TPPBPolicySecret
- (BOOL)hasName;
- (BOOL)hasSecret;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)secret;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setSecret:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicySecret

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSecret:(id)a3
{
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[TPPBPolicySecret setName:](self, "setName:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TPPBPolicySecret setSecret:](self, "setSecret:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSData *)self->_secret hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    secret = self->_secret;
    if ((unint64_t)secret | v4[2]) {
      char v7 = -[NSData isEqual:](secret, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_secret copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_secret)
  {
    objc_msgSend(v5, "setSecret:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_secret)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicySecretReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  secret = self->_secret;
  if (secret) {
    [v4 setObject:secret forKey:@"secret"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicySecret;
  id v4 = [(TPPBPolicySecret *)&v8 description];
  id v5 = [(TPPBPolicySecret *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSecret
{
  return self->_secret != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end