@interface MSDAccountContext
+ (BOOL)supportsSecureCoding;
- (BOOL)resetCDP;
- (MSDAccountContext)initWithCoder:(id)a3;
- (NSDictionary)features;
- (NSString)localSecret;
- (NSString)password;
- (NSString)recoveryKey;
- (NSString)username;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLocalSecret:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setResetCDP:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation MSDAccountContext

- (id)description
{
  int has_internal_content = os_variant_has_internal_content();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MSDAccountContext *)self username];
  v7 = (void *)v6;
  if (has_internal_content)
  {
    v8 = [(MSDAccountContext *)self password];
    v9 = [(MSDAccountContext *)self recoveryKey];
    v10 = +[NSString stringWithFormat:@"<%@[%p]: Username=%@ Password=%@ RecoveryKey=%@>", v5, self, v7, v8, v9];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"<%@[%p]: Username=%@>", v5, self, v6];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDAccountContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSDAccountContext;
  v5 = [(MSDAccountContext *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    [(MSDAccountContext *)v5 setUsername:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    [(MSDAccountContext *)v5 setPassword:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSecret"];
    [(MSDAccountContext *)v5 setLocalSecret:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryKey"];
    [(MSDAccountContext *)v5 setRecoveryKey:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resetCDP"];
    -[MSDAccountContext setResetCDP:](v5, "setResetCDP:", [v10 BOOLValue]);

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"features"];
    [(MSDAccountContext *)v5 setFeatures:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDAccountContext *)self username];
  [v4 encodeObject:v5 forKey:@"username"];

  uint64_t v6 = [(MSDAccountContext *)self password];
  [v4 encodeObject:v6 forKey:@"password"];

  v7 = [(MSDAccountContext *)self localSecret];
  [v4 encodeObject:v7 forKey:@"localSecret"];

  v8 = [(MSDAccountContext *)self recoveryKey];
  [v4 encodeObject:v8 forKey:@"recoveryKey"];

  v9 = +[NSNumber numberWithBool:[(MSDAccountContext *)self resetCDP]];
  [v4 encodeObject:v9 forKey:@"resetCDP"];

  id v10 = [(MSDAccountContext *)self features];
  [v4 encodeObject:v10 forKey:@"features"];
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (BOOL)resetCDP
{
  return self->_resetCDP;
}

- (void)setResetCDP:(BOOL)a3
{
  self->_resetCDP = a3;
}

- (NSDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end