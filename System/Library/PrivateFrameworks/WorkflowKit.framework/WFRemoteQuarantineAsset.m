@interface WFRemoteQuarantineAsset
+ (NSDictionary)properties;
+ (NSString)recordType;
- (CKRecordID)identifier;
- (NSString)configuration;
- (WFFileRepresentation)assetDataFile;
- (int64_t)compatibilityVersion;
- (int64_t)contentVersion;
- (void)setAssetDataFile:(id)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentVersion:(int64_t)a3;
@end

@implementation WFRemoteQuarantineAsset

+ (NSDictionary)properties
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"compatibilityVersion";
  v2 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v10[0] = v2;
  v9[1] = @"contentVersion";
  v3 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v10[1] = v3;
  v9[2] = @"assetData";
  v4 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
  v5 = +[WFCloudKitItemProperty assetPropertyWithName:@"assetDataFile" fileType:v4];
  v10[2] = v5;
  v9[3] = @"configuration";
  v6 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

+ (NSString)recordType
{
  return (NSString *)@"RemoteQuarantineAsset";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetDataFile, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setAssetDataFile:(id)a3
{
}

- (WFFileRepresentation)assetDataFile
{
  return self->_assetDataFile;
}

- (void)setContentVersion:(int64_t)a3
{
  self->_contentVersion = a3;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (CKRecordID)identifier
{
  return self->identifier;
}

@end