@interface WFCloudKitFolder
+ (BOOL)isFolderRecordID:(id)a3;
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (id)collectionIdentifierForRecordID:(id)a3;
+ (id)encryptedNameProperty;
+ (id)nameProperty;
+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4;
+ (int64_t)latestEncryptedSchemaVersion;
- (CKRecordID)identifier;
- (NSData)recordSystemFieldsData;
- (NSString)name;
- (WFCloudKitFolder)initWithCollectionRecord:(id)a3 identifier:(id)a4;
- (int64_t)encryptedSchemaVersion;
- (unsigned)icon;
- (void)setEncryptedSchemaVersion:(int64_t)a3;
- (void)setIcon:(unsigned __int16)a3;
- (void)setName:(id)a3;
- (void)setRecordSystemFieldsData:(id)a3;
@end

@implementation WFCloudKitFolder

+ (int64_t)latestEncryptedSchemaVersion
{
  return +[WFCloudKitSyncSession isWalrusEnabled];
}

+ (id)collectionIdentifierForRecordID:(id)a3
{
  v3 = [a3 recordName];
  v4 = [NSString stringWithFormat:@"%@-", @"WFFolder"];
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

+ (BOOL)isFolderRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 hasPrefix:@"WFFolder"];

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4
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
    [v13 handleFailureInMethod:a2, a1, @"WFCloudKitFolder.m", 54, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"WFCloudKitFolder.m", 55, @"Invalid parameter not satisfying: %@", @"collectionIdentifier" object file lineNumber description];

LABEL_3:
  v10 = [NSString stringWithFormat:@"%@-%@", @"WFFolder", v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10 zoneID:v7];

  return v11;
}

+ (id)encryptedNameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled]) {
    +[WFCloudKitItemProperty objectPropertyWithName:@"name" ignoredByDefault:0 encrypted:1];
  }
  else {
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"name" constantValue:0 encrypted:1];
  }
  return v2;
}

+ (id)nameProperty
{
  if (+[WFCloudKitSyncSession isWalrusEnabled]) {
    +[WFCloudKitItemProperty objectPropertyWithName:@"name" constantValue:0];
  }
  else {
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"name"];
  }
  return v2;
}

+ (NSDictionary)properties
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"icon";
  v3 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v10[0] = v3;
  v9[1] = @"name";
  char v4 = [a1 nameProperty];
  v10[1] = v4;
  v9[2] = @"encryptedSchemaVersion";
  v5 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v10[2] = v5;
  v9[3] = @"encryptedName";
  v6 = [a1 encryptedNameProperty];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

+ (NSString)recordType
{
  return (NSString *)@"ShortcutFolder";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setEncryptedSchemaVersion:(int64_t)a3
{
  self->_encryptedSchemaVersion = a3;
}

- (int64_t)encryptedSchemaVersion
{
  return self->_encryptedSchemaVersion;
}

- (void)setIcon:(unsigned __int16)a3
{
  self->_icon = a3;
}

- (unsigned)icon
{
  return self->_icon;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setRecordSystemFieldsData:(id)a3
{
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (WFCloudKitFolder)initWithCollectionRecord:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFCloudKitFolder *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    uint64_t v10 = [v6 name];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = [v6 icon];
    v9->_icon = [v12 glyphCharacter];

    v9->_encryptedSchemaVersion = [v6 wantedEncryptedSchemaVersion];
    v13 = v9;
  }

  return v9;
}

@end