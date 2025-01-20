@interface PKAccountTransactionSyncReportItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)altDSID;
- (NSString)recordName;
- (NSString)recordType;
- (NSString)transactionServiceIdentifier;
- (NSString)zoneName;
- (PKAccountTransactionSyncReportItem)initWithCoder:(id)a3;
- (PKAccountTransactionSyncReportItem)initWithTransactionServiceIdentifier:(id)a3 recordName:(id)a4 recordType:(id)a5 zoneName:(id)a6 altDSID:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountTransactionSyncReportItem

- (PKAccountTransactionSyncReportItem)initWithTransactionServiceIdentifier:(id)a3 recordName:(id)a4 recordType:(id)a5 zoneName:(id)a6 altDSID:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountTransactionSyncReportItem;
  v17 = [(PKAccountTransactionSyncReportItem *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transactionServiceIdentifier, a3);
    objc_storeStrong((id *)&v18->_recordName, a4);
    objc_storeStrong((id *)&v18->_recordType, a5);
    objc_storeStrong((id *)&v18->_zoneName, a6);
    objc_storeStrong((id *)&v18->_altDSID, a7);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 safelySetObject:self->_transactionServiceIdentifier forKey:@"transactionIdentifier"];
  [v3 safelySetObject:self->_recordName forKey:@"recordIdentifier"];
  [v3 safelySetObject:self->_recordType forKey:@"recordType"];
  [v3 safelySetObject:self->_zoneName forKey:@"zoneName"];
  [v3 safelySetObject:self->_altDSID forKey:@"altDSID"];
  v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransactionSyncReportItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountTransactionSyncReportItem;
  v5 = [(PKAccountTransactionSyncReportItem *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionServiceIdentifier = v5->_transactionServiceIdentifier;
    v5->_transactionServiceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIdentifier"];
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordType"];
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  id v5 = a3;
  [v5 encodeObject:transactionServiceIdentifier forKey:@"transactionIdentifier"];
  [v5 encodeObject:self->_recordName forKey:@"recordIdentifier"];
  [v5 encodeObject:self->_recordType forKey:@"recordType"];
  [v5 encodeObject:self->_zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)v4[1];
    uint64_t v6 = self->_transactionServiceIdentifier;
    v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7) {
        goto LABEL_32;
      }
      BOOL v9 = [(NSString *)v6 isEqualToString:v7];

      if (!v9) {
        goto LABEL_33;
      }
    }
    uint64_t v10 = (void *)v4[2];
    uint64_t v6 = self->_recordName;
    v11 = v10;
    if (v6 == v11)
    {
    }
    else
    {
      uint64_t v8 = v11;
      LOBYTE(v9) = 0;
      if (!v6 || !v11) {
        goto LABEL_32;
      }
      BOOL v9 = [(NSString *)v6 isEqualToString:v11];

      if (!v9) {
        goto LABEL_33;
      }
    }
    uint64_t v12 = (void *)v4[3];
    uint64_t v6 = self->_recordType;
    id v13 = v12;
    if (v6 == v13)
    {
    }
    else
    {
      uint64_t v8 = v13;
      LOBYTE(v9) = 0;
      if (!v6 || !v13) {
        goto LABEL_32;
      }
      BOOL v9 = [(NSString *)v6 isEqualToString:v13];

      if (!v9) {
        goto LABEL_33;
      }
    }
    uint64_t v14 = (void *)v4[4];
    uint64_t v6 = self->_zoneName;
    id v15 = v14;
    if (v6 == v15)
    {

LABEL_27:
      altDSID = self->_altDSID;
      objc_super v17 = (void *)v4[5];
      uint64_t v6 = altDSID;
      v18 = v17;
      if (v6 == v18)
      {
        LOBYTE(v9) = 1;
        uint64_t v8 = v6;
      }
      else
      {
        uint64_t v8 = v18;
        LOBYTE(v9) = 0;
        if (v6 && v18) {
          LOBYTE(v9) = [(NSString *)v6 isEqualToString:v18];
        }
      }
      goto LABEL_32;
    }
    uint64_t v8 = v15;
    LOBYTE(v9) = 0;
    if (v6 && v15)
    {
      BOOL v9 = [(NSString *)v6 isEqualToString:v15];

      if (!v9) {
        goto LABEL_33;
      }
      goto LABEL_27;
    }
LABEL_32:

    goto LABEL_33;
  }
  LOBYTE(v9) = 0;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_transactionServiceIdentifier];
  [v3 safelyAddObject:self->_recordName];
  [v3 safelyAddObject:self->_recordType];
  [v3 safelyAddObject:self->_zoneName];
  [v3 safelyAddObject:self->_altDSID];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"transactionServiceIdentifier: '%@'; ", self->_transactionServiceIdentifier];
  [v3 appendFormat:@"recordName: '%@'; ", self->_recordName];
  [v3 appendFormat:@"recordType: '%@'; ", self->_recordType];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_transactionServiceIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_recordName copyWithZone:a3];
  BOOL v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_recordType copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_zoneName copyWithZone:a3];
  id v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_altDSID copyWithZone:a3];
  id v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_transactionServiceIdentifier, 0);
}

@end