@interface UARPAssetVersionOS
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)versionString;
- (UARPAssetVersionOS)init;
- (UARPAssetVersionOS)initWithBVERString:(id)a3;
- (UARPAssetVersionOS)initWithCoder:(id)a3;
- (UARPAssetVersionOS)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6;
- (UARPAssetVersionOS)initWithVersionString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)buildVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)releaseVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetVersionOS

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersionOS)init
{
  return 0;
}

- (UARPAssetVersionOS)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)UARPAssetVersionOS;
  result = [(UARPAssetVersionOS *)&v11 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }
  return result;
}

- (UARPAssetVersionOS)initWithVersionString:(id)a3
{
  id v4 = (id)[a3 componentsSeparatedByString:@"."];
  if ([v4 count] == 1)
  {
    id v5 = (id)[v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = 0;
LABEL_5:
    uint64_t v9 = 0;
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if ([v4 count] == 2)
  {
    id v8 = (id)[v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v8 integerValue];

    id v5 = (id)[v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v5 integerValue];
    goto LABEL_5;
  }
  if ([v4 count] == 3)
  {
    id v13 = (id)[v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v13 integerValue];

    id v14 = (id)[v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v14 integerValue];

    id v5 = (id)[v4 objectAtIndexedSubscript:2];
    uint64_t v9 = [v5 integerValue];
    goto LABEL_6;
  }
  if ([v4 count] != 4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  id v15 = (id)[v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v15 integerValue];

  id v16 = (id)[v4 objectAtIndexedSubscript:1];
  uint64_t v7 = [v16 integerValue];

  id v17 = (id)[v4 objectAtIndexedSubscript:2];
  uint64_t v9 = [v17 integerValue];

  id v5 = (id)[v4 objectAtIndexedSubscript:3];
  uint64_t v10 = [v5 integerValue];
LABEL_7:

LABEL_8:
  objc_super v11 = [(UARPAssetVersionOS *)self initWithMajorVersion:v6 minorVersion:v7 releaseVersion:v9 buildVersion:v10];

  return v11;
}

- (UARPAssetVersionOS)initWithBVERString:(id)a3
{
  id v4 = (id)[a3 componentsSeparatedByString:@"|"];
  id v5 = (id)[v4 objectAtIndexedSubscript:0];
  id v6 = (id)[v5 componentsSeparatedByString:@"."];

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  if ([v6 count] == 3)
  {
    id v11 = (id)[v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v11 integerValue];

    id v12 = (id)[v6 objectAtIndexedSubscript:1];
    unint64_t v13 = [v12 longLongValue];

    unint64_t v9 = HIDWORD(v13);
    uint64_t v7 = v13;
    id v14 = (id)[v6 objectAtIndexedSubscript:2];
    uint64_t v8 = [v14 integerValue];
  }
  id v15 = [(UARPAssetVersionOS *)self initWithMajorVersion:v10 minorVersion:v9 releaseVersion:v7 buildVersion:v8];

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UARPAssetVersionOS alloc];
  unint64_t majorVersion = self->_majorVersion;
  unint64_t minorVersion = self->_minorVersion;
  unint64_t releaseVersion = self->_releaseVersion;
  unint64_t buildVersion = self->_buildVersion;

  return [(UARPAssetVersionOS *)v4 initWithMajorVersion:majorVersion minorVersion:minorVersion releaseVersion:releaseVersion buildVersion:buildVersion];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t majorVersion = self->_majorVersion;
  id v6 = a3;
  id v7 = (id)[v4 numberWithUnsignedInteger:majorVersion];
  [v6 encodeObject:v7 forKey:@"majorVersion"];

  id v8 = (id)[NSNumber numberWithUnsignedInteger:self->_minorVersion];
  [v6 encodeObject:v8 forKey:@"minorVersion"];

  id v9 = (id)[NSNumber numberWithUnsignedInteger:self->_releaseVersion];
  [v6 encodeObject:v9 forKey:@"releaseVersion"];

  id v10 = (id)[NSNumber numberWithUnsignedInteger:self->_buildVersion];
  [v6 encodeObject:v10 forKey:@"buildVersion"];
}

- (UARPAssetVersionOS)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
  id v6 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorVersion"];
  id v7 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseVersion"];
  id v8 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];

  id v9 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", [v5 unsignedIntegerValue], [v6 unsignedIntegerValue], [v7 unsignedIntegerValue], [v8 unsignedIntegerValue]);
  return v9;
}

- (NSString)versionString
{
  return (NSString *)[NSString stringWithFormat:@"%lu.%lu.%lu.%lu", self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion];
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