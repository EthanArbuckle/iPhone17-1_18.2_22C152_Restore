@interface WFCloudKitAutoShortcutsPreferences
+ (BOOL)isAutoShortcutsPreferencesRecordID:(id)a3;
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (id)identifierForRecordID:(id)a3;
+ (id)recordIDWithZoneID:(id)a3 identifier:(id)a4;
- (BOOL)isSiriEnabled;
- (BOOL)isSpotlightEnabled;
- (CKRecordID)identifier;
- (INAppDescriptor)appDescriptor;
- (NSData)recordSystemFieldsData;
- (NSSet)disabledAutoShortcuts;
- (NSString)appName;
- (WFCloudKitAutoShortcutsPreferences)initWithAutoShortcutsPreferences:(id)a3 identifier:(id)a4;
- (WFFileRepresentation)appDescriptorFileRepresentation;
- (WFFileRepresentation)disabledAutoShortcutsFileRepresentation;
- (id)dataFromObject:(id)a3 error:(id *)a4;
- (id)fileRepresentationFromObject:(id)a3;
- (id)fileRepresentations;
- (void)setAppDescriptor:(id)a3;
- (void)setAppDescriptorFileRepresentation:(id)a3;
- (void)setAppName:(id)a3;
- (void)setDisabledAutoShortcuts:(id)a3;
- (void)setDisabledAutoShortcutsFileRepresentation:(id)a3;
- (void)setIsSiriEnabled:(BOOL)a3;
- (void)setIsSpotlightEnabled:(BOOL)a3;
- (void)setRecordSystemFieldsData:(id)a3;
@end

@implementation WFCloudKitAutoShortcutsPreferences

+ (id)identifierForRecordID:(id)a3
{
  v3 = [a3 recordName];
  v4 = [NSString stringWithFormat:@"%@-", @"AutoShortcutsPreferences"];
  if ([v3 hasPrefix:v4])
  {
    v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAutoShortcutsPreferencesRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 hasPrefix:@"AutoShortcutsPreferences"];

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WFCloudKitAutoShortcutsPreferences.m", 36, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"WFCloudKitAutoShortcutsPreferences.m", 37, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  v10 = [NSString stringWithFormat:@"%@-%@", @"AutoShortcutsPreferences", v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10 zoneID:v7];

  return v11;
}

+ (NSDictionary)properties
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"appDescriptor";
  uint64_t v2 = *MEMORY[0x1E4F44378];
  v3 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
  char v4 = +[WFCloudKitItemProperty assetPropertyWithName:@"appDescriptorFileRepresentation" fileType:v3];
  v13[0] = v4;
  v12[1] = @"appName";
  v5 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[1] = v5;
  v12[2] = @"disabledAutoShortcuts";
  v6 = [MEMORY[0x1E4FB4718] typeWithUTType:v2];
  id v7 = +[WFCloudKitItemProperty assetPropertyWithName:@"disabledAutoShortcutsFileRepresentation" fileType:v6];
  v13[2] = v7;
  v12[3] = @"isSiriEnabled";
  id v8 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v13[3] = v8;
  v12[4] = @"isSpotlightEnabled";
  v9 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v13[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return (NSDictionary *)v10;
}

+ (NSString)recordType
{
  return (NSString *)@"AutoShortcutsPreferences";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledAutoShortcutsFileRepresentation, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appDescriptorFileRepresentation, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDisabledAutoShortcutsFileRepresentation:(id)a3
{
}

- (WFFileRepresentation)disabledAutoShortcutsFileRepresentation
{
  return self->_disabledAutoShortcutsFileRepresentation;
}

- (void)setIsSpotlightEnabled:(BOOL)a3
{
  self->_isSpotlightEnabled = a3;
}

- (BOOL)isSpotlightEnabled
{
  return self->_isSpotlightEnabled;
}

- (void)setIsSiriEnabled:(BOOL)a3
{
  self->_isSiriEnabled = a3;
}

- (BOOL)isSiriEnabled
{
  return self->_isSiriEnabled;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppDescriptorFileRepresentation:(id)a3
{
}

- (WFFileRepresentation)appDescriptorFileRepresentation
{
  return self->_appDescriptorFileRepresentation;
}

- (void)setRecordSystemFieldsData:(id)a3
{
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (void)setDisabledAutoShortcuts:(id)a3
{
}

- (void)setAppDescriptor:(id)a3
{
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (id)fileRepresentations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v4 = [(WFCloudKitAutoShortcutsPreferences *)self appDescriptorFileRepresentation];

  if (v4)
  {
    v5 = [(WFCloudKitAutoShortcutsPreferences *)self appDescriptorFileRepresentation];
    [v3 addObject:v5];
  }
  v6 = [(WFCloudKitAutoShortcutsPreferences *)self disabledAutoShortcutsFileRepresentation];

  if (v6)
  {
    id v7 = [(WFCloudKitAutoShortcutsPreferences *)self disabledAutoShortcutsFileRepresentation];
    [v3 addObject:v7];
  }
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return v8;
}

- (NSSet)disabledAutoShortcuts
{
  disabledAutoShortcuts = self->_disabledAutoShortcuts;
  if (!disabledAutoShortcuts)
  {
    char v4 = [(WFCloudKitAutoShortcutsPreferences *)self disabledAutoShortcutsFileRepresentation];
    v5 = [v4 data];

    v6 = +[WFDatabase disabledAutoShortcutsFromData:v5];
    id v7 = self->_disabledAutoShortcuts;
    self->_disabledAutoShortcuts = v6;

    disabledAutoShortcuts = self->_disabledAutoShortcuts;
  }
  return disabledAutoShortcuts;
}

- (INAppDescriptor)appDescriptor
{
  appDescriptor = self->_appDescriptor;
  if (!appDescriptor)
  {
    char v4 = [(WFCloudKitAutoShortcutsPreferences *)self appDescriptorFileRepresentation];
    v5 = [v4 data];

    v6 = +[WFDatabase appDescriptorFromData:v5];
    id v7 = self->_appDescriptor;
    self->_appDescriptor = v6;

    appDescriptor = self->_appDescriptor;
  }
  return appDescriptor;
}

- (id)fileRepresentationFromObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  id v3 = [(WFCloudKitAutoShortcutsPreferences *)self dataFromObject:a3 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFCloudKitAutoShortcutsPreferences fileRepresentationFromObject:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Error converting object to data: %{public}@", buf, 0x16u);
    }
  }
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E4F5A900];
    id v7 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
    id v8 = [v6 fileWithData:v3 ofType:v7 proposedFilename:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)dataFromObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

- (WFCloudKitAutoShortcutsPreferences)initWithAutoShortcutsPreferences:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFCloudKitAutoShortcutsPreferences *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    uint64_t v10 = [v6 appDescriptor];
    appDescriptor = v9->_appDescriptor;
    v9->_appDescriptor = (INAppDescriptor *)v10;

    v12 = [v6 appDescriptor];
    uint64_t v13 = [(WFCloudKitAutoShortcutsPreferences *)v9 fileRepresentationFromObject:v12];
    appDescriptorFileRepresentation = v9->_appDescriptorFileRepresentation;
    v9->_appDescriptorFileRepresentation = (WFFileRepresentation *)v13;

    uint64_t v15 = [v6 appName];
    appName = v9->_appName;
    v9->_appName = (NSString *)v15;

    v9->_isSiriEnabled = [v6 isSiriEnabled];
    v9->_isSpotlightEnabled = [v6 isSpotlightEnabled];
    uint64_t v17 = [v6 disabledAutoShortcuts];
    disabledAutoShortcuts = v9->_disabledAutoShortcuts;
    v9->_disabledAutoShortcuts = (NSSet *)v17;

    v19 = [v6 disabledAutoShortcuts];
    uint64_t v20 = [(WFCloudKitAutoShortcutsPreferences *)v9 fileRepresentationFromObject:v19];
    disabledAutoShortcutsFileRepresentation = v9->_disabledAutoShortcutsFileRepresentation;
    v9->_disabledAutoShortcutsFileRepresentation = (WFFileRepresentation *)v20;

    uint64_t v22 = [v6 cloudKitMetadata];
    recordSystemFieldsData = v9->_recordSystemFieldsData;
    v9->_recordSystemFieldsData = (NSData *)v22;

    v24 = v9;
  }

  return v9;
}

@end