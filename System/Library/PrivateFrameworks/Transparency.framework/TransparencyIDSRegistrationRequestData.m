@interface TransparencyIDSRegistrationRequestData
+ (BOOL)supportsSecureCoding;
- (NSData)pushToken;
- (NSData)tbsKTIDSRegistrationData;
- (NSString)application;
- (TransparencyIDSRegistrationRequestData)initWithApplication:(id)a3 registrationData:(id)a4;
- (TransparencyIDSRegistrationRequestData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setTbsKTIDSRegistrationData:(id)a3;
@end

@implementation TransparencyIDSRegistrationRequestData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TransparencyIDSRegistrationRequestData *)self application];
  [v4 encodeObject:v5 forKey:@"application"];

  v6 = [(TransparencyIDSRegistrationRequestData *)self tbsKTIDSRegistrationData];
  [v4 encodeObject:v6 forKey:@"registrationData"];

  id v7 = [(TransparencyIDSRegistrationRequestData *)self pushToken];
  [v4 encodeObject:v7 forKey:@"pushToken"];
}

- (TransparencyIDSRegistrationRequestData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationData"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    self = [(TransparencyIDSRegistrationRequestData *)self initWithApplication:v5 registrationData:v6];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    [(TransparencyIDSRegistrationRequestData *)self setPushToken:v9];

    v10 = self;
  }

  return v10;
}

- (TransparencyIDSRegistrationRequestData)initWithApplication:(id)a3 registrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyIDSRegistrationRequestData;
  BOOL v8 = [(TransparencyIDSRegistrationRequestData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(TransparencyIDSRegistrationRequestData *)v8 setApplication:v6];
    [(TransparencyIDSRegistrationRequestData *)v9 setTbsKTIDSRegistrationData:v7];
    [(TransparencyIDSRegistrationRequestData *)v9 setPushToken:0];
    v10 = v9;
  }

  return v9;
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

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_tbsKTIDSRegistrationData, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end