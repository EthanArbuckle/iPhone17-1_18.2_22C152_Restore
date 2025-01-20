@interface UARPAssetVersionBackDeploy
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)versionString;
- (UARPAssetVersionBackDeploy)init;
- (UARPAssetVersionBackDeploy)initWithBVERString:(id)a3;
- (UARPAssetVersionBackDeploy)initWithCoder:(id)a3;
- (UARPAssetVersionBackDeploy)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6;
- (UARPAssetVersionBackDeploy)initWithVersionString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)buildVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)releaseVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetVersionBackDeploy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersionBackDeploy)init
{
  return 0;
}

- (UARPAssetVersionBackDeploy)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)UARPAssetVersionBackDeploy;
  result = [(UARPAssetVersionBackDeploy *)&v11 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }
  return result;
}

- (UARPAssetVersionBackDeploy)initWithVersionString:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"."];
  if ([v4 count] == (id)1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v5 integerValue];
    id v7 = 0;
LABEL_5:
    id v9 = 0;
LABEL_6:
    id v10 = 0;
    goto LABEL_7;
  }
  if ([v4 count] == (id)2)
  {
    id v8 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v8 integerValue];

    id v5 = [v4 objectAtIndexedSubscript:1];
    id v7 = [v5 integerValue];
    goto LABEL_5;
  }
  if ([v4 count] == (id)3)
  {
    id v13 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v13 integerValue];

    id v14 = [v4 objectAtIndexedSubscript:1];
    id v7 = [v14 integerValue];

    id v5 = [v4 objectAtIndexedSubscript:2];
    id v9 = [v5 integerValue];
    goto LABEL_6;
  }
  if ([v4 count] != (id)4)
  {
    id v6 = 0;
    id v7 = 0;
    id v9 = 0;
    id v10 = 0;
    goto LABEL_8;
  }
  id v15 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v15 integerValue];

  id v16 = [v4 objectAtIndexedSubscript:1];
  id v7 = [v16 integerValue];

  id v17 = [v4 objectAtIndexedSubscript:2];
  id v9 = [v17 integerValue];

  id v5 = [v4 objectAtIndexedSubscript:3];
  id v10 = [v5 integerValue];
LABEL_7:

LABEL_8:
  objc_super v11 = [(UARPAssetVersionBackDeploy *)self initWithMajorVersion:v6 minorVersion:v7 releaseVersion:v9 buildVersion:v10];

  return v11;
}

- (UARPAssetVersionBackDeploy)initWithBVERString:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"|"];
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v5 componentsSeparatedByString:@"."];

  uint64_t v7 = 0;
  id v8 = 0;
  unint64_t v9 = 0;
  id v10 = 0;
  if ([v6 count] == (id)3)
  {
    id v11 = [v6 objectAtIndexedSubscript:0];
    id v10 = [v11 integerValue];

    id v12 = [v6 objectAtIndexedSubscript:1];
    unint64_t v13 = (unint64_t)[v12 longLongValue];

    unint64_t v9 = HIDWORD(v13);
    uint64_t v7 = v13;
    id v14 = [v6 objectAtIndexedSubscript:2];
    id v8 = [v14 integerValue];
  }
  id v15 = [(UARPAssetVersionBackDeploy *)self initWithMajorVersion:v10 minorVersion:v9 releaseVersion:v7 buildVersion:v8];

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UARPAssetVersionBackDeploy alloc];
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  unint64_t releaseVersion = self->_releaseVersion;
  unint64_t buildVersion = self->_buildVersion;
  return [(UARPAssetVersionBackDeploy *)v4 initWithMajorVersion:majorVersion minorVersion:minorVersion releaseVersion:releaseVersion buildVersion:buildVersion];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t majorVersion = self->_majorVersion;
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:majorVersion];
  [v5 encodeObject:v6 forKey:@"majorVersion"];

  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:self->_minorVersion];
  [v5 encodeObject:v7 forKey:@"minorVersion"];

  id v8 = +[NSNumber numberWithUnsignedInteger:self->_releaseVersion];
  [v5 encodeObject:v8 forKey:@"releaseVersion"];

  unint64_t v9 = +[NSNumber numberWithUnsignedInteger:self->_buildVersion];
  [v5 encodeObject:v9 forKey:@"buildVersion"];
}

- (UARPAssetVersionBackDeploy)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorVersion"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseVersion"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];

  unint64_t v9 = -[UARPAssetVersionBackDeploy initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", [v5 unsignedIntegerValue], objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v8, "unsignedIntegerValue"));
  return v9;
}

- (id)description
{
  return [(UARPAssetVersionBackDeploy *)self versionString];
}

- (NSString)versionString
{
  return +[NSString stringWithFormat:@"%lu.%lu.%lu.%lu", self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion];
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)releaseVersion
{
  return self->_releaseVersion;
}

- (unint64_t)buildVersion
{
  return self->_buildVersion;
}

@end