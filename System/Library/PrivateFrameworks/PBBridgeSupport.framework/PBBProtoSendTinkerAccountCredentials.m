@interface PBBProtoSendTinkerAccountCredentials
- (BOOL)hasAcceptedTermsData;
- (BOOL)hasPairingParentAltDSID;
- (BOOL)hasPairingParentAppleID;
- (BOOL)hasPassword;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)acceptedTermsData;
- (NSString)pairingParentAltDSID;
- (NSString)pairingParentAppleID;
- (NSString)password;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcceptedTermsData:(id)a3;
- (void)setPairingParentAltDSID:(id)a3;
- (void)setPairingParentAppleID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSendTinkerAccountCredentials

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (BOOL)hasAcceptedTermsData
{
  return self->_acceptedTermsData != 0;
}

- (BOOL)hasPairingParentAltDSID
{
  return self->_pairingParentAltDSID != 0;
}

- (BOOL)hasPairingParentAppleID
{
  return self->_pairingParentAppleID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSendTinkerAccountCredentials;
  v4 = [(PBBProtoSendTinkerAccountCredentials *)&v8 description];
  v5 = [(PBBProtoSendTinkerAccountCredentials *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  username = self->_username;
  if (username) {
    [v3 setObject:username forKey:@"username"];
  }
  password = self->_password;
  if (password) {
    [v4 setObject:password forKey:@"password"];
  }
  acceptedTermsData = self->_acceptedTermsData;
  if (acceptedTermsData) {
    [v4 setObject:acceptedTermsData forKey:@"acceptedTermsData"];
  }
  pairingParentAltDSID = self->_pairingParentAltDSID;
  if (pairingParentAltDSID) {
    [v4 setObject:pairingParentAltDSID forKey:@"pairingParentAltDSID"];
  }
  pairingParentAppleID = self->_pairingParentAppleID;
  if (pairingParentAppleID) {
    [v4 setObject:pairingParentAppleID forKey:@"pairingParentAppleID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendTinkerAccountCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_acceptedTermsData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pairingParentAltDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pairingParentAppleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    id v4 = v5;
  }
  if (self->_password)
  {
    objc_msgSend(v5, "setPassword:");
    id v4 = v5;
  }
  if (self->_acceptedTermsData)
  {
    objc_msgSend(v5, "setAcceptedTermsData:");
    id v4 = v5;
  }
  if (self->_pairingParentAltDSID)
  {
    objc_msgSend(v5, "setPairingParentAltDSID:");
    id v4 = v5;
  }
  if (self->_pairingParentAppleID)
  {
    objc_msgSend(v5, "setPairingParentAppleID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_username copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_password copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSData *)self->_acceptedTermsData copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_pairingParentAltDSID copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSString *)self->_pairingParentAppleID copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((username = self->_username, !((unint64_t)username | v4[5]))
     || -[NSString isEqual:](username, "isEqual:"))
    && ((password = self->_password, !((unint64_t)password | v4[4]))
     || -[NSString isEqual:](password, "isEqual:"))
    && ((acceptedTermsData = self->_acceptedTermsData, !((unint64_t)acceptedTermsData | v4[1]))
     || -[NSData isEqual:](acceptedTermsData, "isEqual:"))
    && ((pairingParentAltDSID = self->_pairingParentAltDSID, !((unint64_t)pairingParentAltDSID | v4[2]))
     || -[NSString isEqual:](pairingParentAltDSID, "isEqual:")))
  {
    pairingParentAppleID = self->_pairingParentAppleID;
    if ((unint64_t)pairingParentAppleID | v4[3]) {
      char v10 = -[NSString isEqual:](pairingParentAppleID, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_username hash];
  NSUInteger v4 = [(NSString *)self->_password hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_acceptedTermsData hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_pairingParentAltDSID hash];
  return v6 ^ [(NSString *)self->_pairingParentAppleID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[5]) {
    -[PBBProtoSendTinkerAccountCredentials setUsername:](self, "setUsername:");
  }
  if (v4[4]) {
    -[PBBProtoSendTinkerAccountCredentials setPassword:](self, "setPassword:");
  }
  if (v4[1]) {
    -[PBBProtoSendTinkerAccountCredentials setAcceptedTermsData:](self, "setAcceptedTermsData:");
  }
  if (v4[2]) {
    -[PBBProtoSendTinkerAccountCredentials setPairingParentAltDSID:](self, "setPairingParentAltDSID:");
  }
  if (v4[3]) {
    -[PBBProtoSendTinkerAccountCredentials setPairingParentAppleID:](self, "setPairingParentAppleID:");
  }
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSData)acceptedTermsData
{
  return self->_acceptedTermsData;
}

- (void)setAcceptedTermsData:(id)a3
{
}

- (NSString)pairingParentAltDSID
{
  return self->_pairingParentAltDSID;
}

- (void)setPairingParentAltDSID:(id)a3
{
}

- (NSString)pairingParentAppleID
{
  return self->_pairingParentAppleID;
}

- (void)setPairingParentAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingParentAppleID, 0);
  objc_storeStrong((id *)&self->_pairingParentAltDSID, 0);
  objc_storeStrong((id *)&self->_acceptedTermsData, 0);
}

@end