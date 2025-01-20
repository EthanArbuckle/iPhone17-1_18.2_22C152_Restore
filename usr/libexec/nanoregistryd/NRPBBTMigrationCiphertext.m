@interface NRPBBTMigrationCiphertext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBBTMigrationCiphertext

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBBTMigrationCiphertext;
  v3 = [(NRPBBTMigrationCiphertext *)&v7 description];
  v4 = [(NRPBBTMigrationCiphertext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  salt = self->_salt;
  if (salt) {
    [v3 setObject:salt forKey:@"salt"];
  }
  ciphertext = self->_ciphertext;
  if (ciphertext) {
    [v4 setObject:ciphertext forKey:@"ciphertext"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100070F04((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_salt)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_ciphertext)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_salt copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_ciphertext copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((salt = self->_salt, !((unint64_t)salt | v4[2])) || -[NSData isEqual:](salt, "isEqual:")))
  {
    ciphertext = self->_ciphertext;
    if ((unint64_t)ciphertext | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](ciphertext, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_salt hash];
  return (unint64_t)[(NSData *)self->_ciphertext hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);

  objc_storeStrong((id *)&self->_ciphertext, 0);
}

@end