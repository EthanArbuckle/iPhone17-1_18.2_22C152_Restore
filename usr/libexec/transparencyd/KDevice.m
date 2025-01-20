@interface KDevice
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (KDevice)initWithPushToken:(id)a3 registrationData:(id)a4;
- (NSData)pushToken;
- (NSData)registrationData;
- (NSMutableSet)apps;
- (NSString)state;
- (unint64_t)hash;
- (void)addApplication:(id)a3;
- (void)markedSigned;
- (void)setApps:(id)a3;
- (void)setHasSignature:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setRegistrationData:(id)a3;
@end

@implementation KDevice

- (KDevice)initWithPushToken:(id)a3 registrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KDevice;
  v8 = [(KDevice *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(KDevice *)v8 setPushToken:v6];
    [(KDevice *)v9 setRegistrationData:v7];
    v10 = +[NSMutableSet set];
    [(KDevice *)v9 setApps:v10];

    v11 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(KDevice *)self pushToken];
    id v6 = [v4 pushToken];
    if ([v5 isEqual:v6])
    {
      id v7 = [(KDevice *)self registrationData];
      v8 = [v4 registrationData];
      unsigned __int8 v9 = [v7 isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(KDevice *)self pushToken];
  id v4 = (char *)[v3 hash];
  v5 = [(KDevice *)self registrationData];
  id v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (void)addApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(KDevice *)self apps];
  [v5 addObject:v4];
}

- (void)markedSigned
{
}

- (NSString)state
{
  if ([(KDevice *)self hasSignature]) {
    return (NSString *)@"signed";
  }
  else {
    return (NSString *)@"initial";
  }
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPushToken:(id)a3
{
}

- (NSData)registrationData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationData:(id)a3
{
}

- (NSMutableSet)apps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApps:(id)a3
{
}

- (BOOL)hasSignature
{
  return self->_hasSignature;
}

- (void)setHasSignature:(BOOL)a3
{
  self->_hasSignature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);

  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end