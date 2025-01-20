@interface REMCalDAVNotification
+ (BOOL)isChangeTrackableModel;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (BOOL)supportsSecureCoding;
+ (NSArray)rem_DA_propertiesAffectingIsConcealed;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUseExternalIdentifierAsDeletionKey;
- (NSString)daPushKey;
- (NSString)daSyncToken;
- (NSString)description;
- (NSString)externalIdentifier;
- (NSString)externalIdentifierForMarkedForDeletionObject;
- (NSString)externalModificationTag;
- (NSString)uuidString;
- (NSURL)hostURL;
- (REMCalDAVNotification)initWithCoder:(id)a3;
- (REMObjectID)accountID;
- (REMObjectID)listID;
- (REMObjectID)objectID;
- (id)initCalDAVNotificationWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 uuidString:(id)a6 hostURL:(id)a7 externalIdentifier:(id)a8 externalModificationTag:(id)a9;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)externalIdentifierForMarkedForDeletionObject;
- (void)setDaPushKey:(id)a3;
- (void)setDaSyncToken:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setHostURL:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation REMCalDAVNotification

- (id)initCalDAVNotificationWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 uuidString:(id)a6 hostURL:(id)a7 externalIdentifier:(id)a8 externalModificationTag:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)REMCalDAVNotification;
  v21 = [(REMCalDAVNotification *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_objectID, a3);
    objc_storeStrong((id *)&v22->_accountID, a4);
    objc_storeStrong((id *)&v22->_listID, a5);
    uint64_t v23 = objc_msgSend(v17, "copy", v30, v31);
    uuidString = v22->_uuidString;
    v22->_uuidString = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    hostURL = v22->_hostURL;
    v22->_hostURL = (NSURL *)v25;

    v27 = (void *)[v19 copy];
    [(REMCalDAVNotification *)v22 setExternalIdentifier:v27];

    v28 = (void *)[v20 copy];
    [(REMCalDAVNotification *)v22 setExternalModificationTag:v28];

    [(REMCalDAVNotification *)v22 setDaPushKey:&stru_1F1339A18];
    [(REMCalDAVNotification *)v22 setDaSyncToken:&stru_1F1339A18];
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMCalDAVNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMCalDAVNotification;
  v5 = [(REMCalDAVNotification *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidString"];
    uuidString = v5->_uuidString;
    v5->_uuidString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostURL"];
    hostURL = v5->_hostURL;
    v5->_hostURL = (NSURL *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    [(REMCalDAVNotification *)v5 setExternalIdentifier:v16];

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
    [(REMCalDAVNotification *)v5 setExternalModificationTag:v17];

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daSyncToken"];
    [(REMCalDAVNotification *)v5 setDaSyncToken:v18];

    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daPushKey"];
    [(REMCalDAVNotification *)v5 setDaPushKey:v19];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMCalDAVNotification *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  uint64_t v6 = [(REMCalDAVNotification *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  v7 = [(REMCalDAVNotification *)self listID];
  [v4 encodeObject:v7 forKey:@"listID"];

  uint64_t v8 = [(REMCalDAVNotification *)self uuidString];
  [v4 encodeObject:v8 forKey:@"uuidString"];

  v9 = [(REMCalDAVNotification *)self hostURL];
  [v4 encodeObject:v9 forKey:@"hostURL"];

  uint64_t v10 = [(REMCalDAVNotification *)self externalIdentifier];
  [v4 encodeObject:v10 forKey:@"externalIdentifier"];

  v11 = [(REMCalDAVNotification *)self externalModificationTag];
  [v4 encodeObject:v11 forKey:@"externalModificationTag"];

  uint64_t v12 = [(REMCalDAVNotification *)self daSyncToken];
  [v4 encodeObject:v12 forKey:@"daSyncToken"];

  id v13 = [(REMCalDAVNotification *)self daPushKey];
  [v4 encodeObject:v13 forKey:@"daPushKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMCalDAVNotification *)a3;
  v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMCalDAVNotification *)self objectID];
      uint64_t v8 = [(REMCalDAVNotification *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        uint64_t v10 = [(REMCalDAVNotification *)self objectID];
        v11 = [(REMCalDAVNotification *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_34;
        }
      }
      uint64_t v14 = [(REMCalDAVNotification *)self accountID];
      uint64_t v15 = [(REMCalDAVNotification *)v6 accountID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        id v16 = (void *)v15;
        id v17 = [(REMCalDAVNotification *)self accountID];
        id v18 = [(REMCalDAVNotification *)v6 accountID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_34;
        }
      }
      id v20 = [(REMCalDAVNotification *)self listID];
      uint64_t v21 = [(REMCalDAVNotification *)v6 listID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        uint64_t v23 = [(REMCalDAVNotification *)self listID];
        v24 = [(REMCalDAVNotification *)v6 listID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_34;
        }
      }
      v26 = [(REMCalDAVNotification *)self uuidString];
      uint64_t v27 = [(REMCalDAVNotification *)v6 uuidString];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMCalDAVNotification *)self uuidString];
        id v30 = [(REMCalDAVNotification *)v6 uuidString];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_34;
        }
      }
      objc_super v32 = [(REMCalDAVNotification *)self hostURL];
      uint64_t v33 = [(REMCalDAVNotification *)v6 hostURL];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(REMCalDAVNotification *)self hostURL];
        v36 = [(REMCalDAVNotification *)v6 hostURL];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_34;
        }
      }
      v38 = [(REMCalDAVNotification *)self externalIdentifier];
      uint64_t v39 = [(REMCalDAVNotification *)v6 externalIdentifier];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(REMCalDAVNotification *)self externalIdentifier];
        v42 = [(REMCalDAVNotification *)v6 externalIdentifier];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_34;
        }
      }
      v44 = [(REMCalDAVNotification *)self externalModificationTag];
      uint64_t v45 = [(REMCalDAVNotification *)v6 externalModificationTag];
      if (v44 == (void *)v45)
      {
      }
      else
      {
        v46 = (void *)v45;
        v47 = [(REMCalDAVNotification *)self externalModificationTag];
        v48 = [(REMCalDAVNotification *)v6 externalModificationTag];
        int v49 = [v47 isEqual:v48];

        if (!v49) {
          goto LABEL_34;
        }
      }
      v50 = [(REMCalDAVNotification *)self daSyncToken];
      uint64_t v51 = [(REMCalDAVNotification *)v6 daSyncToken];
      if (v50 == (void *)v51)
      {
      }
      else
      {
        v52 = (void *)v51;
        v53 = [(REMCalDAVNotification *)self daSyncToken];
        v54 = [(REMCalDAVNotification *)v6 daSyncToken];
        int v55 = [v53 isEqual:v54];

        if (!v55) {
          goto LABEL_34;
        }
      }
      v57 = [(REMCalDAVNotification *)self daPushKey];
      uint64_t v58 = [(REMCalDAVNotification *)v6 daPushKey];
      if (v57 == (void *)v58)
      {
        char v13 = 1;
        v59 = v57;
      }
      else
      {
        v59 = (void *)v58;
        v60 = [(REMCalDAVNotification *)self daPushKey];
        v61 = [(REMCalDAVNotification *)v6 daPushKey];
        char v13 = [v60 isEqual:v61];
      }
      goto LABEL_35;
    }
LABEL_34:
    char v13 = 0;
LABEL_35:

    goto LABEL_36;
  }
  char v13 = 1;
LABEL_36:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMCalDAVNotification *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMCalDAVNotification *)self objectID];
  uint64_t v6 = [(REMCalDAVNotification *)self listID];
  v7 = [(REMCalDAVNotification *)self uuidString];
  uint64_t v8 = [(REMCalDAVNotification *)self hostURL];
  v9 = [(REMCalDAVNotification *)self externalIdentifier];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p objectID: %@, owner: %@, uuid: %@, hostURL: %@, extID: %@>", v4, self, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  uint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDCalDAVNotification";
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  unint64_t v3 = +[REMLogStore read];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[REMCalDAVNotification externalIdentifierForMarkedForDeletionObject](v3);
  }

  id v4 = [(REMCalDAVNotification *)self externalIdentifier];
  v5 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v4];

  return (NSString *)v5;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  return 1;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (void)setDaPushKey:(id)a3
{
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (void)setDaSyncToken:(id)a3
{
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSURL)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);

  objc_storeStrong((id *)&self->externalIdentifier, 0);
}

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [a1 performSelector:sel_isChangeTrackableFetchableModel] != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 0;
}

+ (NSArray)rem_DA_propertiesAffectingIsConcealed
{
  return 0;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return 0;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return 0;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_345;
}

uint64_t __104__REMCalDAVNotification_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 externalIdentifier];
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return 0;
}

- (void)externalIdentifierForMarkedForDeletionObject
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "REMCalDAVNotification is designed to be immutable and does not do marked-for-deletion.", v1, 2u);
}

@end