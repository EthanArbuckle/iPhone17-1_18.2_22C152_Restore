@interface TransparencyIDSRegistrationResponse
+ (BOOL)supportsSecureCoding;
- (NSDictionary)registrationData;
- (TransparencyIDSRegistrationResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRegistrationData:(id)a3;
@end

@implementation TransparencyIDSRegistrationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyIDSRegistrationResponse *)self registrationData];
  [v4 encodeObject:v5 forKey:@"registrationData"];
}

- (TransparencyIDSRegistrationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransparencyIDSRegistrationResponse;
  id v5 = [(TransparencyIDSRegistrationResponse *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"registrationData"];
    [(TransparencyIDSRegistrationResponse *)v5 setRegistrationData:v7];

    v8 = v5;
  }

  return v5;
}

- (NSDictionary)registrationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegistrationData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end