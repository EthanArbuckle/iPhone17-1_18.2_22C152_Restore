@interface PKPlugInRecordProxy
- (LSApplicationExtensionRecord)lsRecord;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSUUID)uniqueIdentifier;
- (PKPlugInProxy)compatibilityObject;
- (PKPlugInRecordProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4;
- (PKPlugInRecordProxy)initWithUUID:(id)a3 error:(id *)a4;
- (PKPropertyList)entitlements;
- (void)setLsRecord:(id)a3;
@end

@implementation PKPlugInRecordProxy

- (PKPlugInRecordProxy)initWithUUID:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPlugInRecordProxy;
  id v5 = a3;
  v6 = [(PKPlugInRecordProxy *)&v12 init];
  id v7 = objc_alloc(MEMORY[0x1E4F223A0]);
  uint64_t v8 = objc_msgSend(v7, "initWithUUID:error:", v5, a4, v12.receiver, v12.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v8;

  if (v6->_lsRecord) {
    v10 = v6;
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (PKPlugInRecordProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPlugInRecordProxy;
  id v5 = a3;
  v6 = [(PKPlugInRecordProxy *)&v12 init];
  id v7 = objc_alloc(MEMORY[0x1E4F223A0]);
  uint64_t v8 = objc_msgSend(v7, "initWithBundleIdentifier:error:", v5, a4, v12.receiver, v12.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v8;

  if (v6->_lsRecord) {
    v10 = v6;
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (NSString)localizedName
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSString)localizedShortName
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 localizedShortName];

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)bundleVersion
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 bundleVersion];

  return (NSString *)v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (PKPlugInProxy)compatibilityObject
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 compatibilityObject];

  return (PKPlugInProxy *)v3;
}

- (PKPropertyList)entitlements
{
  v2 = [(PKPlugInRecordProxy *)self lsRecord];
  v3 = [v2 entitlements];

  return (PKPropertyList *)v3;
}

- (LSApplicationExtensionRecord)lsRecord
{
  return self->_lsRecord;
}

- (void)setLsRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end