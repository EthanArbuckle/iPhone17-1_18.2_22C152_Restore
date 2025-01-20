@interface NRPBBTMigrationChallengeWrite
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBBTMigrationChallengeWrite

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBBTMigrationChallengeWrite;
  v3 = [(NRPBBTMigrationChallengeWrite *)&v7 description];
  v4 = [(NRPBBTMigrationChallengeWrite *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  challenge = self->_challenge;
  if (challenge) {
    [v3 setObject:challenge forKey:@"challenge"];
  }
  encryptedPhoneName = self->_encryptedPhoneName;
  if (encryptedPhoneName) {
    [v4 setObject:encryptedPhoneName forKey:@"encryptedPhoneName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100073484((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_challenge)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedPhoneName)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_challenge copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSData *)self->_encryptedPhoneName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((challenge = self->_challenge, !((unint64_t)challenge | v4[1]))
     || -[NSData isEqual:](challenge, "isEqual:")))
  {
    encryptedPhoneName = self->_encryptedPhoneName;
    if ((unint64_t)encryptedPhoneName | v4[2]) {
      unsigned __int8 v7 = -[NSData isEqual:](encryptedPhoneName, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_challenge hash];
  return (unint64_t)[(NSData *)self->_encryptedPhoneName hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedPhoneName, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end