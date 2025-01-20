@interface SEEndPointSignatureResponse
+ (BOOL)supportsSecureCoding;
+ (id)responseWithSignedData:(id)a3 signature:(id)a4;
+ (id)signature:(id)a3;
- (NSData)signature;
- (NSData)signedData;
- (SEEndPointSignatureResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedData:(id)a3;
@end

@implementation SEEndPointSignatureResponse

+ (id)responseWithSignedData:(id)a3 signature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = v7;
  if (v7)
  {
    [v7 setSignedData:v5];
    [v8 setSignature:v6];
  }

  return v8;
}

+ (id)signature:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = v4;
  if (v4) {
    [v4 setSignature:v3];
  }

  return v5;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(SEEndPointSignatureResponse *)self signedData];
  id v5 = [v4 asHexString];
  id v6 = [(SEEndPointSignatureResponse *)self signature];
  v7 = [v6 asHexString];
  v8 = [v3 stringWithFormat:@"{\n\tsignedData : %@,\n\tsignature : %@\n}", v5, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SEEndPointSignatureResponse *)self signedData];
  [v4 encodeObject:v5 forKey:@"signedData"];

  id v6 = [(SEEndPointSignatureResponse *)self signature];
  [v4 encodeObject:v6 forKey:@"signature"];
}

- (SEEndPointSignatureResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SEEndPointSignatureResponse;
  id v5 = [(SEEndPointSignatureResponse *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    v7 = [(SEEndPointSignatureResponse *)v5 signedData];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedData"];
    signedData = v6->_signedData;
    v6->_signedData = (NSData *)v8;

    v10 = [(SEEndPointSignatureResponse *)v6 signature];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v6->_signature;
    v6->_signature = (NSData *)v11;
  }
  return v6;
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
}

@end