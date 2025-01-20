@interface SSBagProfileConfig
- (BOOL)isEqual:(id)a3;
- (NSArray)bagKeys;
- (NSDictionary)bagKeysDictionary;
- (NSString)profile;
- (NSString)profileVersion;
- (SSBagProfileConfig)init;
- (double)bagLoadTimeout;
- (id)bagKeyForStringRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBagKeysDictionary:(id)a3;
- (void)setBagLoadTimeout:(double)a3;
- (void)setProfile:(id)a3;
- (void)setProfileVersion:(id)a3;
@end

@implementation SSBagProfileConfig

- (SSBagProfileConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSBagProfileConfig;
  result = [(SSBagProfileConfig *)&v3 init];
  if (result) {
    result->_bagLoadTimeout = 60.0;
  }
  return result;
}

- (NSArray)bagKeys
{
  v2 = [(SSBagProfileConfig *)self bagKeysDictionary];
  objc_super v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)bagKeyForStringRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(SSBagProfileConfig *)self bagKeysDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)SSBagProfileConfig;
  id v4 = [(SSBagProfileConfig *)&v9 description];
  v5 = [v3 stringWithFormat:@"%@: {\n", v4];

  v6 = [(SSBagProfileConfig *)self profile];
  [v5 appendFormat:@"  profile: %@\n", v6];

  v7 = [(SSBagProfileConfig *)self profileVersion];
  [v5 appendFormat:@"  profileVersion: %@\n", v7];

  [v5 appendString:@"}"];
  return v5;
}

- (unint64_t)hash
{
  objc_super v3 = [(SSBagProfileConfig *)self profile];
  uint64_t v4 = [v3 hash];
  v5 = [(SSBagProfileConfig *)self profileVersion];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SSBagProfileConfig *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(SSBagProfileConfig *)self profile],
          v5 = objc_claimAutoreleasedReturnValue(),
          [(SSBagProfileConfig *)v4 profile],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 isEqualToString:v6],
          v6,
          v5,
          v7))
    {
      v8 = [(SSBagProfileConfig *)self profileVersion];
      objc_super v9 = [(SSBagProfileConfig *)v4 profileVersion];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SSBagProfileConfig allocWithZone:](SSBagProfileConfig, "allocWithZone:") init];
  unint64_t v6 = [(SSBagProfileConfig *)self bagKeysDictionary];
  uint64_t v7 = [v6 copyWithZone:a3];
  bagKeysDictionary = v5->_bagKeysDictionary;
  v5->_bagKeysDictionary = (NSDictionary *)v7;

  [(SSBagProfileConfig *)self bagLoadTimeout];
  v5->_bagLoadTimeout = v9;
  char v10 = [(SSBagProfileConfig *)self profile];
  uint64_t v11 = [v10 copyWithZone:a3];
  profile = v5->_profile;
  v5->_profile = (NSString *)v11;

  v13 = [(SSBagProfileConfig *)self profileVersion];
  uint64_t v14 = [v13 copyWithZone:a3];
  profileVersion = v5->_profileVersion;
  v5->_profileVersion = (NSString *)v14;

  return v5;
}

- (double)bagLoadTimeout
{
  return self->_bagLoadTimeout;
}

- (void)setBagLoadTimeout:(double)a3
{
  self->_bagLoadTimeout = a3;
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
}

- (NSDictionary)bagKeysDictionary
{
  return self->_bagKeysDictionary;
}

- (void)setBagKeysDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagKeysDictionary, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end