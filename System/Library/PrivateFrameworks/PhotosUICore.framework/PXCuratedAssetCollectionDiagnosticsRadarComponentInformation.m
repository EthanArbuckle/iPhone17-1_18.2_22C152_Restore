@interface PXCuratedAssetCollectionDiagnosticsRadarComponentInformation
- (NSString)componentID;
- (NSString)name;
- (NSString)version;
- (PXCuratedAssetCollectionDiagnosticsRadarComponentInformation)initWithComponentID:(id)a3 name:(id)a4 version:(id)a5;
@end

@implementation PXCuratedAssetCollectionDiagnosticsRadarComponentInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)componentID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (PXCuratedAssetCollectionDiagnosticsRadarComponentInformation)initWithComponentID:(id)a3 name:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXCuratedAssetCollectionDiagnosticsRadarComponentInformation;
  v11 = [(PXCuratedAssetCollectionDiagnosticsRadarComponentInformation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    componentID = v11->_componentID;
    v11->_componentID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    version = v11->_version;
    v11->_version = (NSString *)v16;
  }
  return v11;
}

@end