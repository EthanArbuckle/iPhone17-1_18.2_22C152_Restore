@interface NTKBundleComplicationIdentifierCacheModel
+ (BOOL)supportsSecureCoding;
- (NSDictionary)dataSourceToBundleIdentifier;
- (NSDictionary)legacyComplicationTypeToDataSourceIdentifier;
- (NSString)buildVersion;
- (NTKBundleComplicationIdentifierCacheModel)initWithBuildVersion:(id)a3;
- (NTKBundleComplicationIdentifierCacheModel)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSourceToBundleIdentifier:(id)a3;
- (void)setLegacyComplicationTypeToDataSourceIdentifier:(id)a3;
@end

@implementation NTKBundleComplicationIdentifierCacheModel

- (NTKBundleComplicationIdentifierCacheModel)initWithBuildVersion:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKBundleComplicationIdentifierCacheModel;
  v6 = [(NTKBundleComplicationIdentifierCacheModel *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buildVersion, a3);
    uint64_t v8 = objc_opt_new();
    dataSourceToBundleIdentifier = v7->_dataSourceToBundleIdentifier;
    v7->_dataSourceToBundleIdentifier = (NSDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    legacyComplicationTypeToDataSourceIdentifier = v7->_legacyComplicationTypeToDataSourceIdentifier;
    v7->_legacyComplicationTypeToDataSourceIdentifier = (NSDictionary *)v10;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  buildVersion = self->_buildVersion;
  id v5 = a3;
  [v5 encodeObject:buildVersion forKey:@"NTKBundleComplicationIdentifierCacheModelBuildVersionKey"];
  [v5 encodeObject:self->_dataSourceToBundleIdentifier forKey:@"NTKBundleComplicationIdentifierCacheModelDatasourceToBundleIdentifierKey"];
  [v5 encodeObject:self->_legacyComplicationTypeToDataSourceIdentifier forKey:@"NTKBundleComplicationIdentifierCacheModeLegacyComplicationTypeToDataSourceIdentifierKey"];
}

- (NTKBundleComplicationIdentifierCacheModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKBundleComplicationIdentifierCacheModel;
  id v5 = [(NTKBundleComplicationIdentifierCacheModel *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NTKBundleComplicationIdentifierCacheModelBuildVersionKey"];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"NTKBundleComplicationIdentifierCacheModelDatasourceToBundleIdentifierKey"];
    dataSourceToBundleIdentifier = v5->_dataSourceToBundleIdentifier;
    v5->_dataSourceToBundleIdentifier = (NSDictionary *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v4 decodeDictionaryWithKeysOfClass:v11 objectsOfClass:objc_opt_class() forKey:@"NTKBundleComplicationIdentifierCacheModeLegacyComplicationTypeToDataSourceIdentifierKey"];
    legacyComplicationTypeToDataSourceIdentifier = v5->_legacyComplicationTypeToDataSourceIdentifier;
    v5->_legacyComplicationTypeToDataSourceIdentifier = (NSDictionary *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSDictionary)dataSourceToBundleIdentifier
{
  return self->_dataSourceToBundleIdentifier;
}

- (void)setDataSourceToBundleIdentifier:(id)a3
{
}

- (NSDictionary)legacyComplicationTypeToDataSourceIdentifier
{
  return self->_legacyComplicationTypeToDataSourceIdentifier;
}

- (void)setLegacyComplicationTypeToDataSourceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyComplicationTypeToDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSourceToBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end