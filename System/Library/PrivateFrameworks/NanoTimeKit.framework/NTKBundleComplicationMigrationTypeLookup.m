@interface NTKBundleComplicationMigrationTypeLookup
+ (BOOL)supportsSecureCoding;
- (NSDictionary)dictionary;
- (NSString)buildVersion;
- (NTKBundleComplicationMigrationTypeLookup)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDictionary:(id)a3;
@end

@implementation NTKBundleComplicationMigrationTypeLookup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  buildVersion = self->_buildVersion;
  id v5 = a3;
  [v5 encodeObject:buildVersion forKey:@"buildVersion"];
  [v5 encodeObject:self->_dictionary forKey:@"dictionary"];
}

- (NTKBundleComplicationMigrationTypeLookup)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKBundleComplicationMigrationTypeLookup;
  id v5 = [(NTKBundleComplicationMigrationTypeLookup *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;
  }
  return v5;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end