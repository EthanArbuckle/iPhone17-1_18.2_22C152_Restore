@interface TransparencyIDSRegistrationData
+ (BOOL)supportsSecureCoding;
- (NSData)publicKey;
- (NSData)pushToken;
- (NSData)signature;
- (NSData)tbsKTIDSRegistrationData;
- (NSDate)createdAt;
- (NSDate)nextRetryAt;
- (NSDate)orderedTimestamp;
- (NSDate)signedAt;
- (NSDate)uploadedAt;
- (NSError)error;
- (NSString)altDSID;
- (NSString)application;
- (NSString)dsid;
- (NSString)state;
- (TransparencyIDSRegistrationData)initWithApplication:(id)a3 registrationData:(id)a4;
- (TransparencyIDSRegistrationData)initWithCoder:(id)a3;
- (id)diagnosticsJsonDictionary;
- (id)humanDiagnosticsString;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setApplication:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDsid:(id)a3;
- (void)setError:(id)a3;
- (void)setNextRetryAt:(id)a3;
- (void)setOrderedTimestamp:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSignedAt:(id)a3;
- (void)setState:(id)a3;
- (void)setTbsKTIDSRegistrationData:(id)a3;
- (void)setUploadedAt:(id)a3;
@end

@implementation TransparencyIDSRegistrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TransparencyIDSRegistrationData *)self application];
  [v4 encodeObject:v5 forKey:@"application"];

  v6 = [(TransparencyIDSRegistrationData *)self tbsKTIDSRegistrationData];
  [v4 encodeObject:v6 forKey:@"registrationData"];

  v7 = [(TransparencyIDSRegistrationData *)self signature];
  [v4 encodeObject:v7 forKey:@"signature"];

  v8 = [(TransparencyIDSRegistrationData *)self publicKey];
  [v4 encodeObject:v8 forKey:@"publicKey"];

  v9 = [(TransparencyIDSRegistrationData *)self pushToken];
  [v4 encodeObject:v9 forKey:@"pushToken"];

  v10 = [(TransparencyIDSRegistrationData *)self state];
  [v4 encodeObject:v10 forKey:@"state"];

  v11 = [(TransparencyIDSRegistrationData *)self error];
  [v4 encodeObject:v11 forKey:@"error"];

  v12 = [(TransparencyIDSRegistrationData *)self createdAt];
  [v4 encodeObject:v12 forKey:@"createdAt"];

  v13 = [(TransparencyIDSRegistrationData *)self signedAt];
  [v4 encodeObject:v13 forKey:@"signedAt"];

  v14 = [(TransparencyIDSRegistrationData *)self uploadedAt];
  [v4 encodeObject:v14 forKey:@"uploadedAt"];

  v15 = [(TransparencyIDSRegistrationData *)self nextRetryAt];
  [v4 encodeObject:v15 forKey:@"nextRetryAt"];

  v16 = [(TransparencyIDSRegistrationData *)self orderedTimestamp];
  [v4 encodeObject:v16 forKey:@"orderedTimestamp"];

  v17 = [(TransparencyIDSRegistrationData *)self altDSID];
  [v4 encodeObject:v17 forKey:@"altDSID"];

  id v18 = [(TransparencyIDSRegistrationData *)self dsid];
  [v4 encodeObject:v18 forKey:@"dsid"];
}

- (TransparencyIDSRegistrationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationData"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || (self = [(TransparencyIDSRegistrationData *)self initWithApplication:v5 registrationData:v6]) == 0)
  {
    v21 = 0;
  }
  else
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    [(TransparencyIDSRegistrationData *)self setSignature:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    [(TransparencyIDSRegistrationData *)self setPublicKey:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    [(TransparencyIDSRegistrationData *)self setPushToken:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    [(TransparencyIDSRegistrationData *)self setState:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    [(TransparencyIDSRegistrationData *)self setError:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt"];
    [(TransparencyIDSRegistrationData *)self setCreatedAt:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedAt"];
    [(TransparencyIDSRegistrationData *)self setSignedAt:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextRetryAt"];
    [(TransparencyIDSRegistrationData *)self setNextRetryAt:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadedAt"];
    [(TransparencyIDSRegistrationData *)self setUploadedAt:v17];

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderedTimestamp"];
    [(TransparencyIDSRegistrationData *)self setOrderedTimestamp:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    [(TransparencyIDSRegistrationData *)self setAltDSID:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    [(TransparencyIDSRegistrationData *)self setDsid:v20];

    self = self;
    v21 = self;
  }

  return v21;
}

- (TransparencyIDSRegistrationData)initWithApplication:(id)a3 registrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyIDSRegistrationData;
  BOOL v8 = [(TransparencyIDSRegistrationData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyIDSRegistrationData *)v8 setApplication:v6];
    [(TransparencyIDSRegistrationData *)v9 setTbsKTIDSRegistrationData:v7];
    [(TransparencyIDSRegistrationData *)v9 setPushToken:0];
    v10 = v9;
  }

  return v9;
}

- (id)humanDiagnosticsString
{
  v15 = NSString;
  v14 = [(TransparencyIDSRegistrationData *)self application];
  v17 = [(TransparencyIDSRegistrationData *)self signature];
  v16 = [(TransparencyIDSRegistrationData *)self createdAt];
  v3 = [v16 description];
  id v4 = [(TransparencyIDSRegistrationData *)self signedAt];
  v5 = [v4 description];
  id v6 = [(TransparencyIDSRegistrationData *)self uploadedAt];
  id v7 = [v6 description];
  BOOL v8 = [(TransparencyIDSRegistrationData *)self altDSID];
  v9 = [(TransparencyIDSRegistrationData *)self dsid];
  v10 = [(TransparencyIDSRegistrationData *)self pushToken];
  v11 = objc_msgSend(v10, "kt_hexString");
  objc_super v12 = [v15 stringWithFormat:@"app: %@ sig: %d created: %@ signed: %@ uploaded: %@ altDSID: %@[%@] push: %@", v14, v17 != 0, v3, v5, v7, v8, v9, v11];

  return v12;
}

- (id)diagnosticsJsonDictionary
{
  v35[10] = *MEMORY[0x263EF8340];
  v34[0] = @"app";
  v33 = [(TransparencyIDSRegistrationData *)self application];
  v35[0] = v33;
  v34[1] = @"signature";
  v32 = [(TransparencyIDSRegistrationData *)self signature];
  v31 = objc_msgSend(v32, "kt_hexString");
  v35[1] = v31;
  v34[2] = @"tbs";
  v30 = [(TransparencyIDSRegistrationData *)self tbsKTIDSRegistrationData];
  uint64_t v3 = objc_msgSend(v30, "kt_hexString");
  v29 = (void *)v3;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"-";
  }
  v35[2] = v4;
  v34[3] = @"createdAt";
  v28 = [(TransparencyIDSRegistrationData *)self createdAt];
  uint64_t v5 = [v28 description];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"-";
  }
  v35[3] = v7;
  v34[4] = @"signedAt";
  v27 = [(TransparencyIDSRegistrationData *)self signedAt];
  uint64_t v8 = [v27 description];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"-";
  }
  v35[4] = v10;
  v34[5] = @"uploadedAt";
  v11 = [(TransparencyIDSRegistrationData *)self uploadedAt];
  uint64_t v12 = [v11 description];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = @"-";
  }
  v35[5] = v14;
  v34[6] = @"publicKey";
  v15 = [(TransparencyIDSRegistrationData *)self publicKey];
  v16 = objc_msgSend(v15, "kt_hexString");
  v35[6] = v16;
  v34[7] = @"altDSID";
  uint64_t v17 = [(TransparencyIDSRegistrationData *)self altDSID];
  id v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"-";
  }
  v35[7] = v19;
  v34[8] = @"dsid";
  uint64_t v20 = [(TransparencyIDSRegistrationData *)self dsid];
  v21 = (void *)v20;
  if (v20) {
    v22 = (__CFString *)v20;
  }
  else {
    v22 = @"-";
  }
  v35[8] = v22;
  v34[9] = @"pushToken";
  v23 = [(TransparencyIDSRegistrationData *)self pushToken];
  v24 = objc_msgSend(v23, "kt_hexString");
  v35[9] = v24;
  id v26 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:10];

  return v26;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSData)tbsKTIDSRegistrationData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTbsKTIDSRegistrationData:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPushToken:(id)a3
{
}

- (NSDate)orderedTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOrderedTimestamp:(id)a3
{
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setState:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)createdAt
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)signedAt
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignedAt:(id)a3
{
}

- (NSDate)uploadedAt
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadedAt:(id)a3
{
}

- (NSDate)nextRetryAt
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextRetryAt:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_nextRetryAt, 0);
  objc_storeStrong((id *)&self->_uploadedAt, 0);
  objc_storeStrong((id *)&self->_signedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_orderedTimestamp, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_tbsKTIDSRegistrationData, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end