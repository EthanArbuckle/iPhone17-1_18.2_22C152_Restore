@interface ORProvisionResult
+ (BOOL)supportsSecureCoding;
- (NSData)authenticationTag;
- (NSData)casdCertificate;
- (NSData)casdSignature;
- (NSData)ephemeralPublicKey;
- (NSData)keyIdentifier;
- (NSData)provisionDataBlob;
- (NSString)configId;
- (NSString)formatVersion;
- (NSString)platformId;
- (NSString)transactionId;
- (ORProvisionResult)initWithCoder:(id)a3;
- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4;
- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ORProvisionResult

- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 casdCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ORProvisionResult;
  v13 = [(ORProvisionResult *)&v24 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    provisionDataBlob = v13->_provisionDataBlob;
    v13->_provisionDataBlob = (NSData *)v14;

    uint64_t v21 = objc_msgSend_copy(v7, v16, v17, v18, v19, v20);
    casdCertificate = v13->_casdCertificate;
    v13->_casdCertificate = (NSData *)v21;
  }
  return v13;
}

- (id)description
{
  uint64_t v7 = objc_msgSend_length(self->_casdCertificate, a2, v2, v3, v4, v5);
  v8 = @"present";
  if (!v7) {
    v8 = &stru_26D31DBA0;
  }
  uint64_t v9 = NSString;
  provisionDataBlob = self->_provisionDataBlob;
  uint64_t v11 = v8;
  uint64_t v17 = objc_msgSend_asHexString(provisionDataBlob, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_stringWithFormat_(v9, v18, @"{provisionDataBlob: %@, casdCertificate: %@}", v19, v20, v21, v17, v11);

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  provisionDataBlob = self->_provisionDataBlob;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)provisionDataBlob, @"provisionDataBlob", v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_casdCertificate, @"casdCertificate", v9, v10);
}

- (ORProvisionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ORProvisionResult;
  uint64_t v5 = [(ORProvisionResult *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"provisionDataBlob", v8, v9);
    provisionDataBlob = v5->_provisionDataBlob;
    v5->_provisionDataBlob = (NSData *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"casdCertificate", v14, v15);
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v16;
  }
  return v5;
}

- (ORProvisionResult)initWithProvisionDataBlob:(id)a3 platformId:(id)a4 configId:(id)a5 transactionId:(id)a6 casdCertificate:(id)a7 casdSignature:(id)a8 authenticationTag:(id)a9 ephemeralPublicKey:(id)a10 formatVersion:(id)a11 keyIdentifier:(id)a12
{
  return (ORProvisionResult *)MEMORY[0x270F9A6D0](self, sel_initWithProvisionDataBlob_casdCertificate_, a3, a7, a5, a6);
}

- (NSData)provisionDataBlob
{
  return self->_provisionDataBlob;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)configId
{
  return self->_configId;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)casdSignature
{
  return self->_casdSignature;
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_authenticationTag, 0);
  objc_storeStrong((id *)&self->_casdSignature, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_configId, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_provisionDataBlob, 0);
}

@end