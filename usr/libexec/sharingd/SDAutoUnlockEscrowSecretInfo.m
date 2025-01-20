@interface SDAutoUnlockEscrowSecretInfo
- (BOOL)hasPairingID;
- (BOOL)hasSecret;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)secret;
- (NSString)pairingID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setSecret:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockEscrowSecretInfo

- (BOOL)hasSecret
{
  return self->_secret != 0;
}

- (BOOL)hasPairingID
{
  return self->_pairingID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockEscrowSecretInfo;
  v3 = [(SDAutoUnlockEscrowSecretInfo *)&v7 description];
  v4 = [(SDAutoUnlockEscrowSecretInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  secret = self->_secret;
  if (secret) {
    [v3 setObject:secret forKey:@"secret"];
  }
  pairingID = self->_pairingID;
  if (pairingID) {
    [v4 setObject:pairingID forKey:@"pairingID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockEscrowSecretInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_secret)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pairingID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_secret)
  {
    [v4 setSecret:];
    id v4 = v5;
  }
  if (self->_pairingID)
  {
    [v5 setPairingID:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_secret copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_pairingID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((secret = self->_secret, !((unint64_t)secret | v4[2]))
     || -[NSData isEqual:](secret, "isEqual:")))
  {
    pairingID = self->_pairingID;
    if ((unint64_t)pairingID | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](pairingID, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_secret hash];
  return [(NSString *)self->_pairingID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[SDAutoUnlockEscrowSecretInfo setSecret:](self, "setSecret:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[SDAutoUnlockEscrowSecretInfo setPairingID:](self, "setPairingID:");
    id v4 = v5;
  }
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end