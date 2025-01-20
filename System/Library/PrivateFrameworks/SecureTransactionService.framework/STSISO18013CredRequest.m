@interface STSISO18013CredRequest
+ (BOOL)supportsSecureCoding;
- (STSISO18013CredRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSISO18013CredRequest

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSISO18013CredRequest;
  id v4 = a3;
  [(STSCredentialRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestByNamespace, @"requestByNamespace", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_authACL forKey:@"authACL"];
  [v4 encodeObject:self->_docType forKey:@"docType"];
}

- (STSISO18013CredRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STSISO18013CredRequest;
  objc_super v5 = [(STSCredentialRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"requestByNamespace"];
    requestByNamespace = v5->_requestByNamespace;
    v5->_requestByNamespace = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authACL"];
    authACL = v5->_authACL;
    v5->_authACL = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"docType"];
    docType = v5->_docType;
    v5->_docType = (NSString *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_readerAuthInfo, 0);
  objc_storeStrong((id *)&self->_authACL, 0);
  objc_storeStrong((id *)&self->_requestByNamespace, 0);
}

@end