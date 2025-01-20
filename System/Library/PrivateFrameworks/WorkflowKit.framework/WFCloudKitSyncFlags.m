@interface WFCloudKitSyncFlags
+ (BOOL)isCloudKitSyncFlagsRecordID:(id)a3;
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (id)recordIDWithZoneID:(id)a3;
- (BOOL)migratedVoiceShortcuts;
- (CKRecordID)identifier;
- (NSData)recordSystemFieldsData;
- (WFCloudKitSyncFlags)initWithZoneID:(id)a3;
- (int64_t)defaultShortcutsVersion;
- (void)setDefaultShortcutsVersion:(int64_t)a3;
- (void)setMigratedVoiceShortcuts:(BOOL)a3;
- (void)setRecordSystemFieldsData:(id)a3;
@end

@implementation WFCloudKitSyncFlags

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDefaultShortcutsVersion:(int64_t)a3
{
  self->_defaultShortcutsVersion = a3;
}

- (int64_t)defaultShortcutsVersion
{
  return self->_defaultShortcutsVersion;
}

- (void)setMigratedVoiceShortcuts:(BOOL)a3
{
  self->_migratedVoiceShortcuts = a3;
}

- (BOOL)migratedVoiceShortcuts
{
  return self->_migratedVoiceShortcuts;
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

- (WFCloudKitSyncFlags)initWithZoneID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFCloudKitSyncFlags.m", 38, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFCloudKitSyncFlags;
  v6 = [(WFCloudKitSyncFlags *)&v12 init];
  if (v6)
  {
    uint64_t v7 = +[WFCloudKitSyncFlags recordIDWithZoneID:v5];
    identifier = v6->_identifier;
    v6->_identifier = (CKRecordID *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)isCloudKitSyncFlagsRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 isEqualToString:@"ShortcutFlags"];

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFCloudKitSyncFlags.m", 33, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"ShortcutFlags" zoneID:v5];

  return v6;
}

+ (NSDictionary)properties
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"migratedVoiceShortcuts";
  v2 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v6[1] = @"defaultShortcutsVersion";
  v7[0] = v2;
  v3 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v7[1] = v3;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

+ (NSString)recordType
{
  return (NSString *)@"ShortcutFlags";
}

@end