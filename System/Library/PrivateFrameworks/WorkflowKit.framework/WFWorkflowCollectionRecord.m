@interface WFWorkflowCollectionRecord
- (BOOL)isDeleted;
- (BOOL)isFolder;
- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4;
- (NSData)cloudKitFolderRecordMetadata;
- (NSData)cloudKitOrderingRecordMetadata;
- (NSOrderedSet)collectionOrdering;
- (NSOrderedSet)lastRemoteCollectionOrdering;
- (NSOrderedSet)lastRemoteCollectionOrderingSubset;
- (NSOrderedSet)lastRemoteShortcutOrdering;
- (NSOrderedSet)lastRemoteShortcutOrderingSubset;
- (NSOrderedSet)shortcutOrdering;
- (NSString)name;
- (WFWorkflowIcon)icon;
- (int64_t)computedSyncHash;
- (int64_t)lastSyncedEncryptedSchemaVersion;
- (int64_t)lastSyncedHash;
- (int64_t)wantedEncryptedSchemaVersion;
- (void)setCloudKitFolderRecordMetadata:(id)a3;
- (void)setCloudKitOrderingRecordMetadata:(id)a3;
- (void)setCollectionOrdering:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLastRemoteCollectionOrdering:(id)a3;
- (void)setLastRemoteCollectionOrderingSubset:(id)a3;
- (void)setLastRemoteShortcutOrdering:(id)a3;
- (void)setLastRemoteShortcutOrderingSubset:(id)a3;
- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3;
- (void)setLastSyncedHash:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setShortcutOrdering:(id)a3;
- (void)setWantedEncryptedSchemaVersion:(int64_t)a3;
@end

@implementation WFWorkflowCollectionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitOrderingRecordMetadata, 0);
  objc_storeStrong((id *)&self->_cloudKitFolderRecordMetadata, 0);
  objc_storeStrong((id *)&self->_shortcutOrdering, 0);
  objc_storeStrong((id *)&self->_lastRemoteShortcutOrderingSubset, 0);
  objc_storeStrong((id *)&self->_lastRemoteShortcutOrdering, 0);
  objc_storeStrong((id *)&self->_collectionOrdering, 0);
  objc_storeStrong((id *)&self->_lastRemoteCollectionOrderingSubset, 0);
  objc_storeStrong((id *)&self->_lastRemoteCollectionOrdering, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCloudKitOrderingRecordMetadata:(id)a3
{
}

- (NSData)cloudKitOrderingRecordMetadata
{
  return self->_cloudKitOrderingRecordMetadata;
}

- (void)setCloudKitFolderRecordMetadata:(id)a3
{
}

- (NSData)cloudKitFolderRecordMetadata
{
  return self->_cloudKitFolderRecordMetadata;
}

- (void)setShortcutOrdering:(id)a3
{
}

- (NSOrderedSet)shortcutOrdering
{
  return self->_shortcutOrdering;
}

- (void)setLastRemoteShortcutOrderingSubset:(id)a3
{
}

- (NSOrderedSet)lastRemoteShortcutOrderingSubset
{
  return self->_lastRemoteShortcutOrderingSubset;
}

- (void)setLastRemoteShortcutOrdering:(id)a3
{
}

- (NSOrderedSet)lastRemoteShortcutOrdering
{
  return self->_lastRemoteShortcutOrdering;
}

- (void)setCollectionOrdering:(id)a3
{
}

- (NSOrderedSet)collectionOrdering
{
  return self->_collectionOrdering;
}

- (void)setLastRemoteCollectionOrderingSubset:(id)a3
{
}

- (NSOrderedSet)lastRemoteCollectionOrderingSubset
{
  return self->_lastRemoteCollectionOrderingSubset;
}

- (void)setLastRemoteCollectionOrdering:(id)a3
{
}

- (NSOrderedSet)lastRemoteCollectionOrdering
{
  return self->_lastRemoteCollectionOrdering;
}

- (BOOL)isFolder
{
  return self->_folder;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
  self->_lastSyncedEncryptedSchemaVersion = a3;
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return self->_lastSyncedEncryptedSchemaVersion;
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
  self->_wantedEncryptedSchemaVersion = a3;
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return self->_wantedEncryptedSchemaVersion;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setIcon:(id)a3
{
}

- (WFWorkflowIcon)icon
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

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(WFWorkflowCollectionRecord *)self isFolder])
  {
    int64_t v7 = [(WFWorkflowCollectionRecord *)self wantedEncryptedSchemaVersion];
    int64_t v8 = +[WFCloudKitFolder latestEncryptedSchemaVersion];
    if (v7 != v8)
    {
      int64_t v9 = v8;
      v10 = getWFWalrusLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(WFWorkflowCollectionRecord *)self name];
        *(_DWORD *)buf = 136315906;
        v16 = "-[WFWorkflowCollectionRecord saveChangesToStorage:error:]";
        __int16 v17 = 2112;
        v18 = v11;
        __int16 v19 = 2048;
        int64_t v20 = v7;
        __int16 v21 = 2048;
        int64_t v22 = v9;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Saving %@ to storage, but Walrus version is wrong; fixing <old: %lld, new: %lld>",
          buf,
          0x2Au);
      }
      [(WFWorkflowCollectionRecord *)self setWantedEncryptedSchemaVersion:v9];
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowCollectionRecord;
  BOOL v12 = [(WFRecord *)&v14 saveChangesToStorage:v6 error:a4];

  return v12;
}

- (int64_t)computedSyncHash
{
  v3 = objc_opt_new();
  v4 = [(WFWorkflowCollectionRecord *)self name];

  if (v4)
  {
    v5 = [(WFWorkflowCollectionRecord *)self name];
    id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];
  }
  int64_t v7 = [(WFWorkflowCollectionRecord *)self icon];
  __int16 v8 = [v7 glyphCharacter];

  __int16 v14 = v8;
  id v9 = (id)[v3 combineBytes:&v14 size:2];
  id v10 = (id)objc_msgSend(v3, "combineBool:", -[WFWorkflowCollectionRecord isDeleted](self, "isDeleted"));
  if ([(WFWorkflowCollectionRecord *)self wantedEncryptedSchemaVersion] >= 1) {
    id v11 = (id)objc_msgSend(v3, "combineInteger:", -[WFWorkflowCollectionRecord wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion"));
  }
  int64_t v12 = [v3 finalize];

  return v12;
}

@end