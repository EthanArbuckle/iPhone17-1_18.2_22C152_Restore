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
  v17.receiver = self;
  v17.super_class = (Class)STSISO18013CredRequest;
  objc_super v5 = [(STSCredentialRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"requestByNamespace"];
    requestByNamespace = v5->_requestByNamespace;
    v5->_requestByNamespace = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authACL"];
    authACL = v5->_authACL;
    v5->_authACL = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"docType"];
    docType = v5->_docType;
    v5->_docType = (NSString *)v14;
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