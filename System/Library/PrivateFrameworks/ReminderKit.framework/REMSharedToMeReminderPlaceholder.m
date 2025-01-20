@interface REMSharedToMeReminderPlaceholder
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
- (BOOL)isEqualToSharedToMeReminderPlaceholder:(id)a3;
- (NSString)description;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMSharedToMeReminderPlaceholder)initWithCoder:(id)a3;
- (REMSharedToMeReminderPlaceholder)initWithObjectID:(id)a3 accountID:(id)a4;
- (id)objectIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSharedToMeReminderPlaceholder

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
  return &__block_literal_global_418;
}

uint64_t __115__REMSharedToMeReminderPlaceholder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke()
{
  return 0;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return 0;
}

- (REMSharedToMeReminderPlaceholder)initWithObjectID:(id)a3 accountID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMSharedToMeReminderPlaceholder;
  v9 = [(REMSharedToMeReminderPlaceholder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectID, a3);
    objc_storeStrong((id *)&v10->_accountID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharedToMeReminderPlaceholder)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSharedToMeReminderPlaceholder;
  v5 = [(REMSharedToMeReminderPlaceholder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSharedToMeReminderPlaceholder *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMSharedToMeReminderPlaceholder *)self isEqualToSharedToMeReminderPlaceholder:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToSharedToMeReminderPlaceholder:(id)a3
{
  id v4 = (REMSharedToMeReminderPlaceholder *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(REMSharedToMeReminderPlaceholder *)self objectID];
      uint64_t v8 = [(REMSharedToMeReminderPlaceholder *)v6 objectID];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        objc_super v9 = v7;
      }
      else
      {
        objc_super v9 = (void *)v8;
        v10 = [(REMSharedToMeReminderPlaceholder *)self objectID];
        v11 = [(REMSharedToMeReminderPlaceholder *)v6 objectID];
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

- (unint64_t)hash
{
  v2 = [(REMSharedToMeReminderPlaceholder *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMSharedToMeReminderPlaceholder *)self objectID];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p objectID: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)objectIdentifier
{
  v2 = [(REMSharedToMeReminderPlaceholder *)self objectID];
  unint64_t v3 = [v2 uuid];
  uint64_t v4 = [v3 UUIDString];

  return v4;
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
  uint64_t v5 = [a1 cdEntityName];
  uint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDSharedToMeReminderPlaceholder";
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end