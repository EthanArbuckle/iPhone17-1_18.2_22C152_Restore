@interface KTAccountState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenEnabled;
- (KTAccountState)initWithCoder:(id)a3;
- (NSString)altDSID;
- (unint64_t)environment;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setEnvironment:(unint64_t)a3;
- (void)setHasBeenEnabled:(BOOL)a3;
@end

@implementation KTAccountState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KTAccountState *)self altDSID];
  [v4 encodeObject:v5 forKey:@"altDSID"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(KTAccountState *)self environment]];
  [v4 encodeObject:v6 forKey:@"env"];

  id v7 = +[NSNumber numberWithBool:[(KTAccountState *)self hasBeenEnabled]];
  [v4 encodeObject:v7 forKey:@"hasBeen"];
}

- (KTAccountState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KTAccountState;
  v5 = [(KTAccountState *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    [(KTAccountState *)v5 setAltDSID:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasBeenEnabled"];
    -[KTAccountState setHasBeenEnabled:](v5, "setHasBeenEnabled:", [v7 BOOLValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"env"];
    unsigned int v9 = [v8 intValue];

    if (v9 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (v9 == 2);
    }
    [(KTAccountState *)v5 setEnvironment:v10];
    v11 = v5;
  }

  return v5;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (BOOL)hasBeenEnabled
{
  return self->_hasBeenEnabled;
}

- (void)setHasBeenEnabled:(BOOL)a3
{
  self->_hasBeenEnabled = a3;
}

- (void).cxx_destruct
{
}

@end