@interface REMNSPersistentHistoryChangeTombstone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)persistentHistoryChangeTombstone;
- (NSUUID)uuidForChangeTracking;
- (REMNSPersistentHistoryChangeTombstone)initWithCoder:(id)a3;
- (REMNSPersistentHistoryChangeTombstone)initWithDictionary:(id)a3;
- (id)assignmentOwningReminderIdentifier;
- (id)daIsEventOnlyContainer;
- (id)dueDateDeltaAlertReminderIdentifier;
- (id)externalIdentifier;
- (id)hashtagName;
- (id)hashtagReminderIdentifier;
- (id)objectIdentifier;
- (id)remObjectIdentifier;
- (id)shareeAddress;
- (id)shareeDisplayName;
- (id)shareeOwningListIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setPersistentHistoryChangeTombstone:(id)a3;
@end

@implementation REMNSPersistentHistoryChangeTombstone

- (REMNSPersistentHistoryChangeTombstone)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)REMNSPersistentHistoryChangeTombstone;
    v5 = [(REMNSPersistentHistoryChangeTombstone *)&v12 init];
    if (v5)
    {
      v6 = (NSDictionary *)[v4 mutableCopy];
      v7 = [(NSDictionary *)v6 objectForKeyedSubscript:@"externalIdentifier"];
      if (v7)
      {
        v8 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v7];
        [(NSDictionary *)v6 setObject:v8 forKeyedSubscript:@"externalIdentifier"];
      }
      persistentHistoryChangeTombstone = v5->_persistentHistoryChangeTombstone;
      v5->_persistentHistoryChangeTombstone = v6;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectIdentifier
{
  v3 = [(REMNSPersistentHistoryChangeTombstone *)self remObjectIdentifier];
  if (!v3)
  {
    v3 = [(REMNSPersistentHistoryChangeTombstone *)self uuidForChangeTracking];
  }

  return v3;
}

- (id)remObjectIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"identifier"];

  return v3;
}

- (id)externalIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"externalIdentifier"];

  return v3;
}

- (id)daIsEventOnlyContainer
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"daIsEventOnlyContainer"];

  return v3;
}

- (id)shareeOwningListIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"owningListIdentifier"];

  return v3;
}

- (id)shareeDisplayName
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"displayName"];

  return v3;
}

- (id)shareeAddress
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"address"];

  return v3;
}

- (id)assignmentOwningReminderIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"owningReminderIdentifier"];

  return v3;
}

- (id)hashtagName
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"name"];

  return v3;
}

- (id)hashtagReminderIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"reminderIdentifier"];

  return v3;
}

- (NSUUID)uuidForChangeTracking
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"uuidForChangeTracking"];

  return (NSUUID *)v3;
}

- (id)dueDateDeltaAlertReminderIdentifier
{
  v2 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
  v3 = [v2 objectForKey:@"reminderIdentifier"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMNSPersistentHistoryChangeTombstone *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
      uint64_t v8 = [(REMNSPersistentHistoryChangeTombstone *)v6 persistentHistoryChangeTombstone];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(REMNSPersistentHistoryChangeTombstone *)self persistentHistoryChangeTombstone];
        v11 = [(REMNSPersistentHistoryChangeTombstone *)v6 persistentHistoryChangeTombstone];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMNSPersistentHistoryChangeTombstone *)self remObjectIdentifier];
  [v4 encodeObject:v5 forKey:@"remObjectIdentifier"];

  v6 = [(REMNSPersistentHistoryChangeTombstone *)self externalIdentifier];
  [v4 encodeObject:v6 forKey:@"externalIdentifier"];

  v7 = [(REMNSPersistentHistoryChangeTombstone *)self daIsEventOnlyContainer];
  [v4 encodeObject:v7 forKey:@"daIsEventOnlyContainer"];

  uint64_t v8 = [(REMNSPersistentHistoryChangeTombstone *)self shareeOwningListIdentifier];
  [v4 encodeObject:v8 forKey:@"shareeOwningListIdentifier"];

  v9 = [(REMNSPersistentHistoryChangeTombstone *)self shareeDisplayName];
  [v4 encodeObject:v9 forKey:@"shareeDisplayName"];

  v10 = [(REMNSPersistentHistoryChangeTombstone *)self shareeAddress];
  [v4 encodeObject:v10 forKey:@"shareeAddress"];

  v11 = [(REMNSPersistentHistoryChangeTombstone *)self assignmentOwningReminderIdentifier];
  [v4 encodeObject:v11 forKey:@"assignmentOwningReminderIdentifier"];

  char v12 = [(REMNSPersistentHistoryChangeTombstone *)self hashtagName];
  [v4 encodeObject:v12 forKey:@"hashtagName"];

  v13 = [(REMNSPersistentHistoryChangeTombstone *)self hashtagReminderIdentifier];
  [v4 encodeObject:v13 forKey:@"hashtagReminderIdentifier"];

  v14 = [(REMNSPersistentHistoryChangeTombstone *)self uuidForChangeTracking];
  [v4 encodeObject:v14 forKey:@"uuidForChangeTracking"];

  id v15 = [(REMNSPersistentHistoryChangeTombstone *)self dueDateDeltaAlertReminderIdentifier];
  [v4 encodeObject:v15 forKey:@"dueDateDeltaAlertReminderIdentifier"];
}

- (REMNSPersistentHistoryChangeTombstone)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMNSPersistentHistoryChangeTombstone;
  v5 = [(REMNSPersistentHistoryChangeTombstone *)&v24 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remObjectIdentifier"];
    if (v7) {
      [v6 setObject:v7 forKeyedSubscript:@"identifier"];
    }
    v23 = (void *)v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    if (v8) {
      [v6 setObject:v8 forKeyedSubscript:@"externalIdentifier"];
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daIsEventOnlyContainer"];
    if (v9) {
      [v6 setObject:v9 forKeyedSubscript:@"daIsEventOnlyContainer"];
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareeOwningListIdentifier"];
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"owningListIdentifier"];
    }
    uint64_t v19 = v10;
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareeDisplayName"];
    if (v11) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, @"displayName", v19);
    }
    char v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareeAddress"];
    if (v12) {
      [v6 setObject:v12 forKeyedSubscript:@"address"];
    }
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assignmentOwningReminderIdentifier"];
    if (v13) {
      [v6 setObject:v13 forKeyedSubscript:@"owningReminderIdentifier"];
    }
    v22 = (void *)v8;
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashtagName"];
    if (v14) {
      [v6 setObject:v14 forKeyedSubscript:@"name"];
    }
    v21 = (void *)v9;
    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashtagReminderIdentifier"];
    if (v15) {
      [v6 setObject:v15 forKeyedSubscript:@"reminderIdentifier"];
    }
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidForChangeTracking"];
    if (v16) {
      [v6 setObject:v16 forKeyedSubscript:@"uuidForChangeTracking"];
    }
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDateDeltaAlertReminderIdentifier"];
    if (v17) {
      [v6 setObject:v17 forKeyedSubscript:@"reminderIdentifier"];
    }
    if (!objc_msgSend(v6, "count", v19))
    {

      v6 = 0;
    }
    v5 = [(REMNSPersistentHistoryChangeTombstone *)v5 initWithDictionary:v6];
  }
  return v5;
}

- (NSDictionary)persistentHistoryChangeTombstone
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersistentHistoryChangeTombstone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end