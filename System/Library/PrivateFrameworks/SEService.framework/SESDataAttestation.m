@interface SESDataAttestation
+ (BOOL)supportsSecureCoding;
- (NSData)nonce;
- (NSData)signature;
- (NSData)signedData;
- (NSString)appBundleID;
- (SESDataAttestation)initWithAppBundleID:(id)a3 nonce:(id)a4 signedData:(id)a5 signature:(id)a6;
- (SESDataAttestation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedData:(id)a3;
@end

@implementation SESDataAttestation

- (SESDataAttestation)initWithAppBundleID:(id)a3 nonce:(id)a4 signedData:(id)a5 signature:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SESDataAttestation;
  v15 = [(SESDataAttestation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appBundleID, a3);
    objc_storeStrong((id *)&v16->_nonce, a4);
    objc_storeStrong((id *)&v16->_signedData, a5);
    objc_storeStrong((id *)&v16->_signature, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SESDataAttestation *)self appBundleID];
  [v4 encodeObject:v5 forKey:@"appBundleID"];

  v6 = [(SESDataAttestation *)self nonce];
  [v4 encodeObject:v6 forKey:@"nonce"];

  v7 = [(SESDataAttestation *)self signedData];
  [v4 encodeObject:v7 forKey:@"signedData"];

  id v8 = [(SESDataAttestation *)self signature];
  [v4 encodeObject:v8 forKey:@"signature"];
}

- (SESDataAttestation)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SESDataAttestation;
  v5 = [(SESDataAttestation *)&v20 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(SESDataAttestation *)v5 appBundleID];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleID"];
    appBundleID = v6->_appBundleID;
    v6->_appBundleID = (NSString *)v8;

    v10 = [(SESDataAttestation *)v6 nonce];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v6->_nonce;
    v6->_nonce = (NSData *)v11;

    id v13 = [(SESDataAttestation *)v6 signedData];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedData"];
    signedData = v6->_signedData;
    v6->_signedData = (NSData *)v14;

    v16 = [(SESDataAttestation *)v6 signature];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v6->_signature;
    v6->_signature = (NSData *)v17;
  }
  return v6;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end