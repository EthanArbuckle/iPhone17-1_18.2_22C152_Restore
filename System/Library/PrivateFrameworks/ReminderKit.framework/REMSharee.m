@interface REMSharee
+ (BOOL)isChangeTrackableModel;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (BOOL)supportsSecureCoding;
+ (NSArray)rem_DA_propertiesAffectingIsConcealed;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)nullifiedAssignmentOriginatorID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharee:(id)a3;
- (NSPersonNameComponents)personNameComponents;
- (NSString)address;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (REMObjectID)accountID;
- (REMObjectID)listID;
- (REMObjectID)objectID;
- (REMSharee)initWithCoder:(id)a3;
- (id)formattedName;
- (id)formattedNameWithStyle:(int64_t)a3;
- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 lastName:(id)a8 address:(id)a9 status:(int64_t)a10 accessLevel:(int64_t)a11;
- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 middleName:(id)a8 lastName:(id)a9 namePrefix:(id)a10 nameSuffix:(id)a11 nickname:(id)a12 address:(id)a13 status:(int64_t)a14 accessLevel:(int64_t)a15;
- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 personNameComponents:(id)a6 address:(id)a7 status:(int64_t)a8 accessLevel:(int64_t)a9;
- (id)shortName;
- (int64_t)accessLevel;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSharee

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
  return &__block_literal_global_330;
}

REMDAShareeTombstone *__92__REMSharee_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(REMDAShareeTombstone);
  v4 = [v2 objectIdentifier];
  [(REMDAShareeTombstone *)v3 setObjectIdentifier:v4];

  v5 = [v2 shareeOwningListIdentifier];
  [(REMDAShareeTombstone *)v3 setOwningListIdentifier:v5];

  v6 = [v2 shareeDisplayName];
  [(REMDAShareeTombstone *)v3 setDisplayName:v6];

  v7 = [v2 shareeAddress];

  [(REMDAShareeTombstone *)v3 setAddress:v7];

  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return 0;
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 middleName:(id)a8 lastName:(id)a9 namePrefix:(id)a10 nameSuffix:(id)a11 nickname:(id)a12 address:(id)a13 status:(int64_t)a14 accessLevel:(int64_t)a15
{
  id v53 = a3;
  id obj = a4;
  id v52 = a4;
  id v51 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v54 = a9;
  v24 = v21;
  id v25 = a10;
  id v26 = a11;
  v27 = v23;
  id v28 = a12;
  id v29 = a13;
  v55.receiver = self;
  v55.super_class = (Class)REMSharee;
  v30 = [(REMSharee *)&v55 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_objectID, a3);
    objc_storeStrong((id *)&v31->_accountID, obj);
    objc_storeStrong((id *)&v31->_listID, a5);
    uint64_t v32 = [v24 copy];
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    firstName = v31->_firstName;
    v31->_firstName = (NSString *)v34;

    uint64_t v36 = [v27 copy];
    middleName = v31->_middleName;
    v31->_middleName = (NSString *)v36;

    uint64_t v38 = [v54 copy];
    lastName = v31->_lastName;
    v31->_lastName = (NSString *)v38;

    uint64_t v40 = [v25 copy];
    namePrefix = v31->_namePrefix;
    v31->_namePrefix = (NSString *)v40;

    uint64_t v42 = [v26 copy];
    nameSuffix = v31->_nameSuffix;
    v31->_nameSuffix = (NSString *)v42;

    uint64_t v44 = [v28 copy];
    nickname = v31->_nickname;
    v31->_nickname = (NSString *)v44;

    uint64_t v46 = [v29 copy];
    address = v31->_address;
    v31->_address = (NSString *)v46;

    v31->_status = a14;
    v31->_accessLevel = a15;
  }

  return v31;
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 lastName:(id)a8 address:(id)a9 status:(int64_t)a10 accessLevel:(int64_t)a11
{
  return [(REMSharee *)self initShareeWithObjectID:a3 accountID:a4 listID:a5 displayName:a6 firstName:a7 middleName:0 lastName:a8 namePrefix:0 nameSuffix:0 nickname:0 address:a9 status:a10 accessLevel:a11];
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 personNameComponents:(id)a6 address:(id)a7 status:(int64_t)a8 accessLevel:(int64_t)a9
{
  id v24 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v13 givenName];
  v18 = [v13 middleName];
  v19 = [v13 familyName];
  v20 = [v13 namePrefix];
  id v21 = [v13 nameSuffix];
  id v22 = [v13 nickname];

  id v27 = [(REMSharee *)self initShareeWithObjectID:v16 accountID:v15 listID:v14 displayName:0 firstName:v17 middleName:v18 lastName:v19 namePrefix:v20 nameSuffix:v21 nickname:v22 address:v24 status:a8 accessLevel:a9];
  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharee)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)REMSharee;
  v5 = [(REMSharee *)&v33 init];
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"middleName"];
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namePrefix"];
    namePrefix = v5->_namePrefix;
    v5->_namePrefix = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameSuffix"];
    nameSuffix = v5->_nameSuffix;
    v5->_nameSuffix = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v26;

    unint64_t v28 = [v4 decodeIntegerForKey:@"status"];
    if (v28 >= 6)
    {
      id v29 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[REMSharee initWithCoder:](v28, v29);
      }

      unint64_t v28 = 0;
    }
    v5->_status = v28;
    unint64_t v30 = [v4 decodeIntegerForKey:@"accessLevel"];
    if (v30 >= 4)
    {
      v31 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[REMSharee initWithCoder:](v30, v31);
      }

      unint64_t v30 = 0;
    }
    v5->_accessLevel = v30;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = [(REMSharee *)self objectID];
  [v15 encodeObject:v4 forKey:@"objectID"];

  v5 = [(REMSharee *)self accountID];
  [v15 encodeObject:v5 forKey:@"accountID"];

  uint64_t v6 = [(REMSharee *)self listID];
  [v15 encodeObject:v6 forKey:@"listID"];

  v7 = [(REMSharee *)self displayName];
  [v15 encodeObject:v7 forKey:@"displayName"];

  uint64_t v8 = [(REMSharee *)self firstName];
  [v15 encodeObject:v8 forKey:@"firstName"];

  v9 = [(REMSharee *)self middleName];
  [v15 encodeObject:v9 forKey:@"middleName"];

  uint64_t v10 = [(REMSharee *)self lastName];
  [v15 encodeObject:v10 forKey:@"lastName"];

  v11 = [(REMSharee *)self namePrefix];
  [v15 encodeObject:v11 forKey:@"namePrefix"];

  uint64_t v12 = [(REMSharee *)self nameSuffix];
  [v15 encodeObject:v12 forKey:@"nameSuffix"];

  id v13 = [(REMSharee *)self nickname];
  [v15 encodeObject:v13 forKey:@"nickname"];

  uint64_t v14 = [(REMSharee *)self address];
  [v15 encodeObject:v14 forKey:@"address"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharee status](self, "status"), @"status");
  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharee accessLevel](self, "accessLevel"), @"accessLevel");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMSharee *)self isEqualToSharee:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToSharee:(id)a3
{
  id v4 = (REMSharee *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    int64_t v7 = [(REMSharee *)self status];
    if (v7 != [(REMSharee *)v6 status]) {
      goto LABEL_44;
    }
    int64_t v8 = [(REMSharee *)self accessLevel];
    if (v8 != [(REMSharee *)v6 accessLevel]) {
      goto LABEL_44;
    }
    v9 = [(REMSharee *)self objectID];
    uint64_t v10 = [(REMSharee *)v6 objectID];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      uint64_t v12 = [(REMSharee *)self objectID];
      id v13 = [(REMSharee *)v6 objectID];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_44;
      }
    }
    uint64_t v16 = [(REMSharee *)self accountID];
    uint64_t v17 = [(REMSharee *)v6 accountID];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      uint64_t v18 = (void *)v17;
      v19 = [(REMSharee *)self accountID];
      uint64_t v20 = [(REMSharee *)v6 accountID];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_44;
      }
    }
    uint64_t v22 = [(REMSharee *)self listID];
    uint64_t v23 = [(REMSharee *)v6 listID];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      uint64_t v24 = (void *)v23;
      id v25 = [(REMSharee *)self listID];
      uint64_t v26 = [(REMSharee *)v6 listID];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_44;
      }
    }
    unint64_t v28 = [(REMSharee *)self displayName];
    uint64_t v29 = [(REMSharee *)v6 displayName];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      unint64_t v30 = (void *)v29;
      v31 = [(REMSharee *)self displayName];
      uint64_t v32 = [(REMSharee *)v6 displayName];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_44;
      }
    }
    uint64_t v34 = [(REMSharee *)self firstName];
    uint64_t v35 = [(REMSharee *)v6 firstName];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      uint64_t v36 = (void *)v35;
      v37 = [(REMSharee *)self firstName];
      uint64_t v38 = [(REMSharee *)v6 firstName];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_44;
      }
    }
    uint64_t v40 = [(REMSharee *)self middleName];
    uint64_t v41 = [(REMSharee *)v6 middleName];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      uint64_t v42 = (void *)v41;
      v43 = [(REMSharee *)self middleName];
      uint64_t v44 = [(REMSharee *)v6 middleName];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_44;
      }
    }
    uint64_t v46 = [(REMSharee *)self lastName];
    uint64_t v47 = [(REMSharee *)v6 lastName];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(REMSharee *)self lastName];
      v50 = [(REMSharee *)v6 lastName];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_44;
      }
    }
    id v52 = [(REMSharee *)self namePrefix];
    uint64_t v53 = [(REMSharee *)v6 namePrefix];
    if (v52 == (void *)v53)
    {
    }
    else
    {
      id v54 = (void *)v53;
      objc_super v55 = [(REMSharee *)self namePrefix];
      v56 = [(REMSharee *)v6 namePrefix];
      int v57 = [v55 isEqual:v56];

      if (!v57) {
        goto LABEL_44;
      }
    }
    v58 = [(REMSharee *)self nameSuffix];
    uint64_t v59 = [(REMSharee *)v6 nameSuffix];
    if (v58 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      v61 = [(REMSharee *)self nameSuffix];
      v62 = [(REMSharee *)v6 nameSuffix];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_44;
      }
    }
    v64 = [(REMSharee *)self nickname];
    uint64_t v65 = [(REMSharee *)v6 nickname];
    if (v64 == (void *)v65)
    {
    }
    else
    {
      v66 = (void *)v65;
      v67 = [(REMSharee *)self nickname];
      v68 = [(REMSharee *)v6 nickname];
      int v69 = [v67 isEqual:v68];

      if (!v69)
      {
LABEL_44:
        char v15 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    v71 = [(REMSharee *)self address];
    uint64_t v72 = [(REMSharee *)v6 address];
    if (v71 == (void *)v72)
    {
      char v15 = 1;
      v73 = v71;
    }
    else
    {
      v73 = (void *)v72;
      v74 = [(REMSharee *)self address];
      v75 = [(REMSharee *)v6 address];
      char v15 = [v74 isEqual:v75];
    }
    goto LABEL_45;
  }
  char v15 = 1;
LABEL_46:

  return v15;
}

- (unint64_t)hash
{
  id v2 = [(REMSharee *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSPersonNameComponents)personNameComponents
{
  unint64_t v3 = [(REMSharee *)self firstName];
  if (v3
    || ([(REMSharee *)self middleName], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(REMSharee *)self lastName], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_5:
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    uint64_t v5 = [(REMSharee *)self firstName];
    [v4 setGivenName:v5];

    uint64_t v6 = [(REMSharee *)self middleName];
    [v4 setMiddleName:v6];

    int64_t v7 = [(REMSharee *)self lastName];
    [v4 setFamilyName:v7];

    int64_t v8 = [(REMSharee *)self namePrefix];
    [v4 setNamePrefix:v8];

    v9 = [(REMSharee *)self nameSuffix];
    [v4 setNameSuffix:v9];

    uint64_t v10 = [(REMSharee *)self nickname];
    [v4 setNickname:v10];

    goto LABEL_6;
  }
  id v4 = [(REMSharee *)self nickname];

  if (v4) {
    goto LABEL_5;
  }
LABEL_6:

  return (NSPersonNameComponents *)v4;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMSharee *)self objectID];
  uint64_t v6 = [(REMSharee *)self listID];
  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMSharee status](self, "status"));
  int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMSharee accessLevel](self, "accessLevel"));
  v9 = [v3 stringWithFormat:@"<%@: %p objectID: %@, listID: %@, status: %@, access: %@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMSharee *)self objectID];
  uint64_t v6 = [(REMSharee *)self listID];
  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMSharee status](self, "status"));
  int64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMSharee accessLevel](self, "accessLevel"));
  v9 = [(REMSharee *)self address];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p objectID: %@, listID: %@, status: %@, access: %@, address: %@>", v4, self, v5, v6, v7, v8, v9];

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
  uint64_t v5 = [a1 cdEntityName];
  uint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDSharee";
}

+ (id)nullifiedAssignmentOriginatorID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"0D5A5BA9-302D-4518-AE2D-58DDA388E850"];
  unint64_t v3 = +[REMSharee objectIDWithUUID:v2];

  return v3;
}

- (id)formattedName
{
  unint64_t v3 = [(REMSharee *)self displayName];
  id v4 = objc_msgSend(v3, "rem_tidyFormattedNameString");

  if (!v4)
  {
    id v4 = [(REMSharee *)self formattedNameWithStyle:2];
  }

  return v4;
}

- (id)shortName
{
  unint64_t v3 = [(REMSharee *)self formattedNameWithStyle:1];
  if (!v3)
  {
    unint64_t v3 = [(REMSharee *)self displayName];
  }

  return v3;
}

- (id)formattedNameWithStyle:(int64_t)a3
{
  uint64_t v5 = [(REMSharee *)self personNameComponents];

  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = [(REMSharee *)self personNameComponents];
  int64_t v7 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v6 style:a3 options:0];
  int64_t v8 = objc_msgSend(v7, "rem_tidyFormattedNameString");

  if (!v8)
  {
LABEL_13:
    v9 = [(REMSharee *)self address];
    int v10 = objc_msgSend(v9, "rem_hasMailto");

    if (!v10) {
      goto LABEL_5;
    }
    v11 = [(REMSharee *)self address];
    uint64_t v12 = objc_msgSend(v11, "rem_removingMailto");
    int64_t v8 = objc_msgSend(v12, "rem_tidyFormattedNameString");

    if (!v8)
    {
LABEL_5:
      id v13 = [(REMSharee *)self address];
      int v14 = objc_msgSend(v13, "rem_hasTel");

      if (v14)
      {
        char v15 = [(REMSharee *)self address];
        id v16 = objc_alloc(MEMORY[0x1E4F1BA70]);
        uint64_t v17 = objc_msgSend(v15, "rem_removingTel");
        uint64_t v18 = (void *)[v16 initWithStringValue:v17];
        v19 = [v18 formattedStringValue];

        int64_t v8 = objc_msgSend(v19, "rem_tidyFormattedNameString");
      }
      else
      {
        int64_t v8 = 0;
      }
    }
  }

  return v8;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSString)address
{
  return self->_address;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
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
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMShareeAccessLevel %ld", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMShareeStatus %ld", (uint8_t *)&v2, 0xCu);
}

@end