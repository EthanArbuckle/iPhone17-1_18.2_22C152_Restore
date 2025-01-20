@interface WFRemoteConfigurationAsset
+ (NSDictionary)properties;
+ (NSString)recordType;
- (CKRecordID)identifier;
- (NSNumber)buildNumber;
- (NSString)assetType;
- (NSString)configuration;
- (NSString)shortVersion;
- (WFFileRepresentation)assetDataFile;
- (void)setAssetDataFile:(id)a3;
- (void)setAssetType:(id)a3;
- (void)setBuildNumber:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setShortVersion:(id)a3;
@end

@implementation WFRemoteConfigurationAsset

+ (NSString)recordType
{
  return (NSString *)@"RemoteConfigurationAsset";
}

+ (NSDictionary)properties
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"shortVersion";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[0] = v2;
  v10[1] = @"assetType";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[1] = v3;
  v10[2] = @"assetData";
  v4 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
  v5 = +[WFCloudKitItemProperty assetPropertyWithName:@"assetDataFile" fileType:v4];
  v11[2] = v5;
  v10[3] = @"buildNumber";
  v6 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[3] = v6;
  v10[4] = @"configuration";
  v7 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetDataFile, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setBuildNumber:(id)a3
{
}

- (NSNumber)buildNumber
{
  return self->_buildNumber;
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

- (void)setShortVersion:(id)a3
{
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (CKRecordID)identifier
{
  return self->identifier;
}

@end