@interface OTICDPRecordSilentContext
- (BOOL)hasAuthInfo;
- (BOOL)hasCdpInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTCDPRecoveryInformation)cdpInfo;
- (OTEscrowAuthenticationInformation)authInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthInfo:(id)a3;
- (void)setCdpInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTICDPRecordSilentContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpInfo, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

- (void)setAuthInfo:(id)a3
{
}

- (OTEscrowAuthenticationInformation)authInfo
{
  return self->_authInfo;
}

- (void)setCdpInfo:(id)a3
{
}

- (OTCDPRecoveryInformation)cdpInfo
{
  return self->_cdpInfo;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  cdpInfo = self->_cdpInfo;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (cdpInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTCDPRecoveryInformation mergeFrom:](cdpInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTICDPRecordSilentContext setCdpInfo:](self, "setCdpInfo:");
  }
  v4 = v9;
LABEL_7:
  authInfo = self->_authInfo;
  uint64_t v8 = v4[1];
  if (authInfo)
  {
    if (v8) {
      -[OTEscrowAuthenticationInformation mergeFrom:](authInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[OTICDPRecordSilentContext setAuthInfo:](self, "setAuthInfo:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(OTCDPRecoveryInformation *)self->_cdpInfo hash];
  return [(OTEscrowAuthenticationInformation *)self->_authInfo hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((cdpInfo = self->_cdpInfo, !((unint64_t)cdpInfo | v4[2]))
     || -[OTCDPRecoveryInformation isEqual:](cdpInfo, "isEqual:")))
  {
    authInfo = self->_authInfo;
    if ((unint64_t)authInfo | v4[1]) {
      char v7 = -[OTEscrowAuthenticationInformation isEqual:](authInfo, "isEqual:");
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
  id v6 = [(OTCDPRecoveryInformation *)self->_cdpInfo copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(OTEscrowAuthenticationInformation *)self->_authInfo copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cdpInfo)
  {
    objc_msgSend(v4, "setCdpInfo:");
    id v4 = v5;
  }
  if (self->_authInfo)
  {
    objc_msgSend(v5, "setAuthInfo:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cdpInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_authInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTICDPRecordSilentContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  cdpInfo = self->_cdpInfo;
  if (cdpInfo)
  {
    id v5 = [(OTCDPRecoveryInformation *)cdpInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"cdpInfo"];
  }
  authInfo = self->_authInfo;
  if (authInfo)
  {
    char v7 = [(OTEscrowAuthenticationInformation *)authInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"authInfo"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTICDPRecordSilentContext;
  id v4 = [(OTICDPRecordSilentContext *)&v8 description];
  id v5 = [(OTICDPRecordSilentContext *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAuthInfo
{
  return self->_authInfo != 0;
}

- (BOOL)hasCdpInfo
{
  return self->_cdpInfo != 0;
}

@end