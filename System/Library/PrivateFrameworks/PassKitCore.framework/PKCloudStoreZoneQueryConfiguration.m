@interface PKCloudStoreZoneQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)recordName;
- (NSString)transactionSourceIdentifier;
- (NSString)zoneName;
- (PKCloudStoreZoneQueryConfiguration)initWithCoder:(id)a3;
- (PKCloudStoreZoneQueryConfiguration)initWithItemType:(unint64_t)a3 recordName:(id)a4;
- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 accountEventIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8;
- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 serviceIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8;
- (id)description;
- (int64_t)accountType;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(int64_t)a3;
- (void)setAltDSID:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
@end

@implementation PKCloudStoreZoneQueryConfiguration

- (PKCloudStoreZoneQueryConfiguration)initWithItemType:(unint64_t)a3 recordName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudStoreZoneQueryConfiguration;
  v8 = [(PKCloudStoreZoneQueryConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_itemType = a3;
    objc_storeStrong((id *)&v8->_recordName, a4);
  }

  return v9;
}

- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 serviceIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8
{
  id v21 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v18 = [(PKCloudStoreZoneQueryConfiguration *)self initWithItemType:1 recordName:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_transactionSourceIdentifier, a3);
    objc_storeStrong((id *)&v19->_accountIdentifier, a4);
    v19->_accountType = a5;
    objc_storeStrong((id *)&v19->_altDSID, a7);
    objc_storeStrong((id *)&v19->_zoneName, a8);
  }

  return v19;
}

- (PKCloudStoreZoneQueryConfiguration)initWithTransactionSourceIdentifier:(id)a3 accountIdentifier:(id)a4 accountType:(int64_t)a5 accountEventIdentifier:(id)a6 altDSID:(id)a7 zoneName:(id)a8
{
  id v28 = a3;
  id v27 = a4;
  id v14 = a6;
  id v26 = a7;
  id v15 = a8;
  id v16 = v14;
  id v17 = +[PKAccountEvent recordNamePrefix];
  char v18 = [v16 hasPrefix:v17];

  v19 = v16;
  if ((v18 & 1) == 0)
  {
    v20 = NSString;
    id v21 = +[PKAccountEvent recordNamePrefix];
    v19 = [v20 stringWithFormat:@"%@%@", v21, v16];
  }
  v22 = [(PKCloudStoreZoneQueryConfiguration *)self initWithItemType:5 recordName:v19];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_transactionSourceIdentifier, a3);
    objc_storeStrong((id *)&v23->_accountIdentifier, a4);
    v23->_accountType = a5;
    objc_storeStrong((id *)&v23->_altDSID, a7);
    objc_storeStrong((id *)&v23->_zoneName, a8);
  }

  return v23;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_recordName];
  [v3 safelyAddObject:self->_transactionSourceIdentifier];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_zoneName];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_accountType - v4 + 32 * v4;
  unint64_t v6 = self->_itemType - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKCloudStoreZoneQueryConfiguration *)a3;
  int64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        recordName = v6->_recordName;
        v8 = self->_recordName;
        v9 = recordName;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_35;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_36;
          }
        }
        transactionSourceIdentifier = v6->_transactionSourceIdentifier;
        v8 = self->_transactionSourceIdentifier;
        id v14 = transactionSourceIdentifier;
        if (v8 == v14)
        {
        }
        else
        {
          v10 = v14;
          if (!v8 || !v14) {
            goto LABEL_35;
          }
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_36;
          }
        }
        accountIdentifier = v6->_accountIdentifier;
        v8 = self->_accountIdentifier;
        id v17 = accountIdentifier;
        if (v8 == v17)
        {
        }
        else
        {
          v10 = v17;
          if (!v8 || !v17) {
            goto LABEL_35;
          }
          BOOL v18 = [(NSString *)v8 isEqualToString:v17];

          if (!v18) {
            goto LABEL_36;
          }
        }
        altDSID = v6->_altDSID;
        v8 = self->_altDSID;
        v20 = altDSID;
        if (v8 == v20)
        {
        }
        else
        {
          v10 = v20;
          if (!v8 || !v20) {
            goto LABEL_35;
          }
          BOOL v21 = [(NSString *)v8 isEqualToString:v20];

          if (!v21) {
            goto LABEL_36;
          }
        }
        zoneName = v6->_zoneName;
        v8 = self->_zoneName;
        v23 = zoneName;
        if (v8 == v23)
        {

LABEL_40:
          if (self->_accountType == v6->_accountType)
          {
            BOOL v12 = self->_itemType == v6->_itemType;
            goto LABEL_37;
          }
LABEL_36:
          BOOL v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          BOOL v24 = [(NSString *)v8 isEqualToString:v23];

          if (!v24) {
            goto LABEL_36;
          }
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    BOOL v12 = 0;
  }
LABEL_38:

  return v12;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  uint64_t v4 = PKCloudStoreItemTypeToString(self->_itemType);
  [v3 appendFormat:@"itemType: '%@'; ", v4];

  [v3 appendFormat:@"recordName: '%@'; ", self->_recordName];
  if (self->_transactionSourceIdentifier) {
    [v3 appendFormat:@"_transactionSourceIdentifier: '%@'; ", self->_transactionSourceIdentifier];
  }
  if (self->_zoneName) {
    [v3 appendFormat:@"_zoneName: '%@'; ", self->_zoneName];
  }
  if (self->_accountIdentifier) {
    [v3 appendFormat:@"_accountIdentifier: '%@'; ", self->_accountIdentifier];
  }
  if (self->_altDSID) {
    [v3 appendFormat:@"_accountIdentifier: '%@'; ", self->_altDSID];
  }
  unint64_t accountType = self->_accountType;
  if (accountType)
  {
    unint64_t v6 = PKPaymentTransactionAccountTypeToString(accountType);
    [v3 appendFormat:@"_accountType: '%@'; ", v6];
  }
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudStoreZoneQueryConfiguration;
  int64_t v5 = [(PKCloudStoreZoneQueryConfiguration *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordName"];
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

    v5->_itemType = [v4 decodeIntegerForKey:@"itemType"];
    v5->_unint64_t accountType = [v4 decodeIntegerForKey:@"accountType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t accountType = self->_accountType;
  id v5 = a3;
  [v5 encodeInteger:accountType forKey:@"accountType"];
  [v5 encodeInteger:self->_itemType forKey:@"itemType"];
  [v5 encodeObject:self->_recordName forKey:@"recordName"];
  [v5 encodeObject:self->_zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_int64_t accountType = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end