@interface StaticKeyValidation
- (KTAccountPublicID)publicID;
- (NSString)idsURI;
- (id)description;
- (unint64_t)ktResult;
- (void)setIdsURI:(id)a3;
- (void)setKtResult:(unint64_t)a3;
- (void)setPublicID:(id)a3;
@end

@implementation StaticKeyValidation

- (id)description
{
  v3 = [(StaticKeyValidation *)self publicID];
  v4 = [(StaticKeyValidation *)self idsURI];
  v5 = +[NSString stringWithFormat:@"<StaticKeyValidation: %@ ids: %@ result: %d>", v3, v4, [(StaticKeyValidation *)self ktResult]];

  return v5;
}

- (KTAccountPublicID)publicID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPublicID:(id)a3
{
}

- (NSString)idsURI
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdsURI:(id)a3
{
}

- (unint64_t)ktResult
{
  return self->_ktResult;
}

- (void)setKtResult:(unint64_t)a3
{
  self->_ktResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsURI, 0);

  objc_storeStrong((id *)&self->_publicID, 0);
}

@end