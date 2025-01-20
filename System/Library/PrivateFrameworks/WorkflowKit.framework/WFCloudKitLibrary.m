@interface WFCloudKitLibrary
+ (BOOL)isLibraryRecordID:(id)a3;
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (id)libraryIdentifierFromRecordID:(id)a3 error:(id *)a4;
+ (id)recordIDWithZoneID:(id)a3 libraryIdentifier:(id)a4;
- (CKRecordID)identifier;
- (NSData)recordSystemFieldsData;
- (NSString)version;
- (WFCloudKitLibrary)init;
- (WFCloudKitLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5 syncHash:(int64_t)a6;
- (WFCloudKitLibrary)initWithLibraryRecord:(id)a3 zoneID:(id)a4;
- (WFFileRepresentation)dataFileRepresentation;
- (id)libraryIdentifierWithError:(id *)a3;
- (int64_t)syncHash;
- (void)setDataFileRepresentation:(id)a3;
- (void)setRecordSystemFieldsData:(id)a3;
- (void)setSyncHash:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation WFCloudKitLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileRepresentation, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSyncHash:(int64_t)a3
{
  self->_syncHash = a3;
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (void)setDataFileRepresentation:(id)a3
{
}

- (WFFileRepresentation)dataFileRepresentation
{
  return self->_dataFileRepresentation;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
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

- (id)libraryIdentifierWithError:(id *)a3
{
  v5 = [(WFCloudKitLibrary *)self identifier];

  if (!v5)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitLibraryErrorDomain" code:0 userInfo:0];
  }
  v6 = objc_opt_class();
  v7 = [(WFCloudKitLibrary *)self identifier];
  v8 = [v6 libraryIdentifierFromRecordID:v7 error:0];

  return v8;
}

- (WFCloudKitLibrary)initWithLibraryRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFCloudKitLibrary *)self init];
  if (v8)
  {
    v9 = objc_opt_class();
    v10 = [v6 identifier];
    uint64_t v11 = [v9 recordIDWithZoneID:v7 libraryIdentifier:v10];
    identifier = v8->_identifier;
    v8->_identifier = (CKRecordID *)v11;

    uint64_t v13 = [v6 version];
    version = v8->_version;
    v8->_version = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F5A900];
    v16 = [v6 data];
    v17 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
    uint64_t v18 = [v15 fileWithData:v16 ofType:v17 proposedFilename:0];
    dataFileRepresentation = v8->_dataFileRepresentation;
    v8->_dataFileRepresentation = (WFFileRepresentation *)v18;

    v8->_syncHash = [v6 lastSyncedHash];
    v20 = v8;
  }

  return v8;
}

- (WFCloudKitLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5 syncHash:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(WFCloudKitLibrary *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_version, a4);
    v16 = (void *)MEMORY[0x1E4F5A900];
    v17 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
    uint64_t v18 = [v16 fileWithData:v13 ofType:v17 proposedFilename:0];
    dataFileRepresentation = v15->_dataFileRepresentation;
    v15->_dataFileRepresentation = (WFFileRepresentation *)v18;

    v15->_syncHash = a6;
    v20 = v15;
  }

  return v15;
}

- (WFCloudKitLibrary)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFCloudKitLibrary;
  v2 = [(WFCloudKitLibrary *)&v9 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    version = v3->_version;
    v3->_version = 0;

    dataFileRepresentation = v3->_dataFileRepresentation;
    v3->_dataFileRepresentation = 0;

    id v7 = v3;
  }

  return v3;
}

+ (BOOL)isLibraryRecordID:(id)a3
{
  v4 = [a3 recordName];
  v5 = [a1 recordType];
  char v6 = [v4 hasPrefix:v5];

  return v6;
}

+ (id)libraryIdentifierFromRecordID:(id)a3 error:(id *)a4
{
  char v6 = [a3 recordName];
  id v7 = NSString;
  v8 = [a1 recordType];
  objc_super v9 = [v7 stringWithFormat:@"%@-", v8];

  if (([v6 hasPrefix:v9] & 1) == 0)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitLibraryErrorDomain" code:1 userInfo:0];
  }
  v10 = [v6 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F229A4D8];

  return v10;
}

+ (id)recordIDWithZoneID:(id)a3 libraryIdentifier:(id)a4
{
  char v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [a1 recordType];
  v10 = [v6 stringWithFormat:@"%@-%@", v9, v7];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10 zoneID:v8];
  return v11;
}

+ (NSDictionary)properties
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"data";
  v2 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44378]];
  v3 = +[WFCloudKitItemProperty assetPropertyWithName:@"dataFileRepresentation" fileType:v2];
  v9[0] = v3;
  v8[1] = @"version";
  v4 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v9[1] = v4;
  v8[2] = @"syncHash";
  v5 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:ignoredByDefault:encrypted:");
  v9[2] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

+ (NSString)recordType
{
  return (NSString *)@"CoherenceLibrary";
}

@end