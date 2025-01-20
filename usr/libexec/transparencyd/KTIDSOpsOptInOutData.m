@interface KTIDSOpsOptInOutData
- (NSData)publicAccountKey;
- (NSNumber)optInStatus;
- (NSString)ktApplication;
- (id)description;
- (void)setKtApplication:(id)a3;
- (void)setOptInStatus:(id)a3;
- (void)setPublicAccountKey:(id)a3;
@end

@implementation KTIDSOpsOptInOutData

- (id)description
{
  v3 = [(KTIDSOpsOptInOutData *)self optInStatus];
  unsigned int v4 = [v3 BOOLValue];
  v5 = [(KTIDSOpsOptInOutData *)self publicAccountKey];
  v6 = [v5 kt_hexString];
  v7 = +[NSString stringWithFormat:@"<KTIDSOpsOptInOutData: %d publicKey: %@>", v4, v6];

  return v7;
}

- (NSData)publicAccountKey
{
  return self->_publicAccountKey;
}

- (void)setPublicAccountKey:(id)a3
{
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
}

- (NSString)ktApplication
{
  return self->_ktApplication;
}

- (void)setKtApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktApplication, 0);
  objc_storeStrong((id *)&self->_optInStatus, 0);

  objc_storeStrong((id *)&self->_publicAccountKey, 0);
}

@end