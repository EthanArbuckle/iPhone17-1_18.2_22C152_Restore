@interface NTKBundleComplicationDataSourceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)useComplicationDescriptorsOnCompanion;
- (Class)dataSourceClass;
- (NSNumber)legacyNTKComplicationType;
- (NSString)appGroupIdentifier;
- (NSString)appIdentifier;
- (NSString)bundleIdentifier;
- (NSString)localizedAppName;
- (NSString)localizedComplicationName;
- (NSString)sectionIdentifier;
- (NTKBundleComplicationDataSourceInfo)initWithDataSourceClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation NTKBundleComplicationDataSourceInfo

- (NTKBundleComplicationDataSourceInfo)initWithDataSourceClass:(Class)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NTKBundleComplicationDataSourceInfo;
  v4 = [(NTKBundleComplicationDataSourceInfo *)&v21 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dataSourceClass, a3);
    uint64_t v6 = [(objc_class *)a3 bundleIdentifier];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [(objc_class *)a3 appIdentifier];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;

    uint64_t v10 = [(objc_class *)a3 localizedAppName];
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v10;

    uint64_t v12 = [(objc_class *)a3 localizedComplicationName];
    localizedComplicationName = v5->_localizedComplicationName;
    v5->_localizedComplicationName = (NSString *)v12;

    uint64_t v14 = [(objc_class *)a3 sectionIdentifier];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v14;

    uint64_t v16 = [(objc_class *)a3 appGroupIdentifier];
    appGroupIdentifier = v5->_appGroupIdentifier;
    v5->_appGroupIdentifier = (NSString *)v16;

    uint64_t v18 = [(objc_class *)a3 legacyNTKComplicationType];
    legacyNTKComplicationType = v5->_legacyNTKComplicationType;
    v5->_legacyNTKComplicationType = (NSNumber *)v18;

    v5->_useComplicationDescriptorsOnCompanion = [(objc_class *)a3 useComplicationDescriptorsOnCompanion];
    v5->_hash = [(objc_class *)a3 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (Class *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[3] == self->_dataSourceClass;

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (NSString)localizedComplicationName
{
  return self->_localizedComplicationName;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (NSNumber)legacyNTKComplicationType
{
  return self->_legacyNTKComplicationType;
}

- (BOOL)useComplicationDescriptorsOnCompanion
{
  return self->_useComplicationDescriptorsOnCompanion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNTKComplicationType, 0);
  objc_storeStrong((id *)&self->_appGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedComplicationName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
}

@end