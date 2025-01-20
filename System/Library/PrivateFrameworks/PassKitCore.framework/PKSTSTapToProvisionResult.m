@interface PKSTSTapToProvisionResult
- (NSData)casdCertificate;
- (NSData)encryptedTapData;
- (PKSTSTapToProvisionResult)initWithSTSResult:(id)a3;
@end

@implementation PKSTSTapToProvisionResult

- (PKSTSTapToProvisionResult)initWithSTSResult:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSTSTapToProvisionResult;
  v5 = [(PKSTSTapToProvisionResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 provisionDataBlob];
    encryptedTapData = v5->_encryptedTapData;
    v5->_encryptedTapData = (NSData *)v6;

    uint64_t v8 = [v4 casdCertificate];
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v8;
  }
  return v5;
}

- (NSData)encryptedTapData
{
  return self->_encryptedTapData;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_encryptedTapData, 0);
}

@end