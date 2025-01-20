@interface PKSharedAccountCloudStoreZone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharedAccountCloudStoreZone:(id)a3;
- (NSSet)sharedUsersAltDSIDs;
- (NSString)accountIdentifier;
- (NSString)originatorAltDSID;
- (NSString)zoneName;
- (PKSharedAccountCloudStoreZone)initWithCoder:(id)a3;
- (PKSharedAccountCloudStoreZone)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)access;
- (unint64_t)accountType;
- (unint64_t)hash;
- (unint64_t)mode;
- (unint64_t)zoneType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccess:(unint64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(unint64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOriginatorAltDSID:(id)a3;
- (void)setSharedUsersAltDSIDs:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation PKSharedAccountCloudStoreZone

- (PKSharedAccountCloudStoreZone)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKSharedAccountCloudStoreZone;
  v5 = [(PKSharedAccountCloudStoreZone *)&v37 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = [v4 PKStringForKey:@"zoneName"];
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"accountIdentifier"];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  v10 = [v4 PKStringForKey:@"featureIdentifier"];
  v11 = v10;
  BOOL v13 = 1;
  if (v10 != @"ccs")
  {
    if (!v10 || (int v12 = [(__CFString *)v10 isEqualToString:@"ccs"], v11, !v12)) {
      BOOL v13 = 0;
    }
  }

  v5->_accountType = v13;
  v14 = [v4 PKStringForKey:@"access"];
  v15 = v14;
  if (v14 == @"private") {
    goto LABEL_10;
  }
  if (!v14) {
    goto LABEL_17;
  }
  char v16 = [(__CFString *)v14 isEqualToString:@"private"];

  if (v16)
  {
LABEL_10:
    uint64_t v17 = 1;
    goto LABEL_18;
  }
  v18 = v15;
  if (v18 == @"shared"
    || (v19 = v18,
        char v20 = [(__CFString *)v18 isEqualToString:@"shared"],
        v19,
        (v20 & 1) != 0))
  {
    uint64_t v17 = 2;
    goto LABEL_18;
  }
  v21 = v19;
  if (v21 == @"public"
    || (v22 = v21, int v23 = [(__CFString *)v21 isEqualToString:@"public"],
                   v22,
                   v23))
  {
    uint64_t v17 = 3;
  }
  else
  {
LABEL_17:
    uint64_t v17 = 0;
  }
LABEL_18:

  v5->_access = v17;
  v24 = [v4 PKStringForKey:@"mode"];
  v25 = v24;
  if (v24 != @"readwrite")
  {
    if (v24)
    {
      char v26 = [(__CFString *)v24 isEqualToString:@"readwrite"];

      if (v26) {
        goto LABEL_21;
      }
      v28 = v25;
      if (v28 == @"readonly"
        || (v29 = v28,
            int v30 = [(__CFString *)v28 isEqualToString:@"readonly"],
            v29,
            v30))
      {
        uint64_t v27 = 2;
        goto LABEL_26;
      }
    }
    uint64_t v27 = 0;
    goto LABEL_26;
  }
LABEL_21:
  uint64_t v27 = 1;
LABEL_26:

  v5->_mode = v27;
  uint64_t v31 = [v4 PKStringForKey:@"originatorAltDSID"];
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v31;

  v33 = [v4 PKArrayContaining:objc_opt_class() forKey:@"sharedUsersAltDSIDs"];
  if ([v33 count])
  {
    uint64_t v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
    sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
    v5->_sharedUsersAltDSIDs = (NSSet *)v34;
  }
LABEL_29:

  return v5;
}

- (unint64_t)zoneType
{
  unint64_t v3 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:self->_zoneName outZoneType:&v3 outAccountIdentifier:0 altDSID:0];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharedAccountCloudStoreZone)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKSharedAccountCloudStoreZone;
  v5 = [(PKSharedAccountCloudStoreZone *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    v5->_accountType = [v4 decodeIntegerForKey:@"accountType"];
    v5->_access = [v4 decodeIntegerForKey:@"access"];
    v5->_mode = [v4 decodeIntegerForKey:@"mode"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorAltDSID"];
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v10;

    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sharedUsersAltDSIDs"];
    sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
    v5->_sharedUsersAltDSIDs = (NSSet *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  zoneName = self->_zoneName;
  id v5 = a3;
  [v5 encodeObject:zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_accountType forKey:@"accountType"];
  [v5 encodeInteger:self->_access forKey:@"access"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeObject:self->_originatorAltDSID forKey:@"originatorAltDSID"];
  [v5 encodeObject:self->_sharedUsersAltDSIDs forKey:@"sharedUsersAltDSIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharedAccountCloudStoreZone *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharedAccountCloudStoreZone *)self isEqualToSharedAccountCloudStoreZone:v5];

  return v6;
}

- (BOOL)isEqualToSharedAccountCloudStoreZone:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_zoneName;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_23;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_24;
    }
  }
  v11 = (void *)v4[2];
  BOOL v6 = self->_accountIdentifier;
  int v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_23;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_24;
    }
  }
  if (self->_accountType != v4[3] || self->_access != v4[4] || self->_mode != v4[5]) {
    goto LABEL_24;
  }
  v14 = (void *)v4[6];
  BOOL v6 = self->_originatorAltDSID;
  uint64_t v15 = v14;
  if (v6 != v15)
  {
    uint64_t v8 = v15;
    if (v6 && v15)
    {
      BOOL v16 = [(NSString *)v6 isEqualToString:v15];

      if (v16) {
        goto LABEL_27;
      }
LABEL_24:
      char v17 = 0;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }

LABEL_27:
  sharedUsersAltDSIDs = self->_sharedUsersAltDSIDs;
  char v20 = (NSSet *)v4[7];
  if (sharedUsersAltDSIDs && v20) {
    char v17 = -[NSSet isEqual:](sharedUsersAltDSIDs, "isEqual:");
  }
  else {
    char v17 = sharedUsersAltDSIDs == v20;
  }
LABEL_25:

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_zoneName];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_originatorAltDSID];
  [v3 safelyAddObject:self->_sharedUsersAltDSIDs];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_accountType - v4 + 32 * v4;
  unint64_t v6 = self->_access - v5 + 32 * v5;
  unint64_t v7 = self->_mode - v6 + 32 * v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKSharedAccountCloudStoreZone allocWithZone:](PKSharedAccountCloudStoreZone, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_zoneName copyWithZone:a3];
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_originatorAltDSID copyWithZone:a3];
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v10;

  uint64_t v12 = [(NSSet *)self->_sharedUsersAltDSIDs copyWithZone:a3];
  sharedUsersAltDSIDs = v5->_sharedUsersAltDSIDs;
  v5->_sharedUsersAltDSIDs = (NSSet *)v12;

  v5->_accountType = self->_accountType;
  v5->_access = self->_access;
  v5->_mode = self->_mode;
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [NSString stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"zoneName: %@; ", self->_zoneName];
  [v5 appendFormat:@"accountIdentifier: %@; ", self->_accountIdentifier];
  if (self->_accountType == 1) {
    uint64_t v6 = @"ccs";
  }
  else {
    uint64_t v6 = @"unknown";
  }
  [v5 appendFormat:@"accountType: %@ ", v6];
  unint64_t access = self->_access;
  if (access > 3) {
    uint64_t v8 = @"private";
  }
  else {
    uint64_t v8 = off_1E56F4F40[access];
  }
  [v5 appendFormat:@"access: %@ ", v8];
  unint64_t mode = self->_mode;
  uint64_t v10 = @"readwrite";
  if (mode == 2) {
    uint64_t v10 = @"readonly";
  }
  if (mode) {
    v11 = v10;
  }
  else {
    v11 = @"unknown";
  }
  [v5 appendFormat:@"mode: %@ ", v11];
  [v5 appendFormat:@"originatorAltDSID: %@; ", self->_originatorAltDSID];
  [v5 appendFormat:@"sharedUsersAltDSIDs: %@; ", self->_sharedUsersAltDSIDs];
  [v5 appendString:@">"];
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (unint64_t)access
{
  return self->_access;
}

- (void)setAccess:(unint64_t)a3
{
  self->_unint64_t access = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
}

- (NSSet)sharedUsersAltDSIDs
{
  return self->_sharedUsersAltDSIDs;
}

- (void)setSharedUsersAltDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUsersAltDSIDs, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end