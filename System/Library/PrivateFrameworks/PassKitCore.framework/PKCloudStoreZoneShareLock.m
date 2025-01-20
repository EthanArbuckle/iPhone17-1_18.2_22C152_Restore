@interface PKCloudStoreZoneShareLock
+ (BOOL)supportsSecureCoding;
+ (id)recordNameForZoneName:(id)a3;
+ (id)recordNamePrefix;
+ (id)zoneNameFromRecordName:(id)a3;
+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3;
+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCloudStoreZoneShareLock:(id)a3;
- (NSDate)creationDate;
- (NSString)originDeviceIdentifier;
- (NSString)originDeviceName;
- (NSString)zoneName;
- (PKCloudStoreZoneShareLock)initWithCloudStoreCoder:(id)a3;
- (PKCloudStoreZoneShareLock)initWithCoder:(id)a3;
- (PKCloudStoreZoneShareLock)initWithZoneName:(id)a3 creationDate:(id)a4 originDeviceIdentifier:(id)a5 originDeviceName:(id)a6;
- (id)description;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCloudStoreZoneShareLock

- (PKCloudStoreZoneShareLock)initWithZoneName:(id)a3 creationDate:(id)a4 originDeviceIdentifier:(id)a5 originDeviceName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudStoreZoneShareLock;
  v15 = [(PKCloudStoreZoneShareLock *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_zoneName, a3);
    objc_storeStrong((id *)&v16->_creationDate, a4);
    objc_storeStrong((id *)&v16->_originDeviceIdentifier, a5);
    objc_storeStrong((id *)&v16->_originDeviceName, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneShareLock)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCloudStoreZoneShareLock;
  v5 = [(PKCloudStoreZoneShareLock *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockCreationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originDeviceIdentifier"];
    originDeviceIdentifier = v5->_originDeviceIdentifier;
    v5->_originDeviceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originDeviceName"];
    originDeviceName = v5->_originDeviceName;
    v5->_originDeviceName = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  zoneName = self->_zoneName;
  id v5 = a3;
  [v5 encodeObject:zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_creationDate forKey:@"lockCreationDate"];
  [v5 encodeObject:self->_originDeviceIdentifier forKey:@"originDeviceIdentifier"];
  [v5 encodeObject:self->_originDeviceName forKey:@"originDeviceName"];
}

- (PKCloudStoreZoneShareLock)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKCloudStoreZoneShareLock;
  id v5 = [(PKCloudStoreZoneShareLock *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(PKCloudStoreZoneShareLock *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"ShareCreationLock"];
  id v13 = [v4 firstObject];

  if (v13)
  {
    objc_msgSend(v13, "pk_encryptedStringForKey:", @"zoneName");
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    zoneName = self->_zoneName;
    self->_zoneName = v5;

    objc_msgSend(v13, "pk_encryptedDateForKey:", @"lockCreationDate");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    creationDate = self->_creationDate;
    self->_creationDate = v7;

    objc_msgSend(v13, "pk_encryptedStringForKey:", @"originDeviceIdentifier");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    originDeviceIdentifier = self->_originDeviceIdentifier;
    self->_originDeviceIdentifier = v9;

    objc_msgSend(v13, "pk_encryptedStringForKey:", @"originDeviceName");
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    originDeviceName = self->_originDeviceName;
    self->_originDeviceName = v11;
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [(PKCloudStoreZoneShareLock *)self _encodeDeviceDataForCloudStoreCoder:a3];
  }
}

- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"ShareCreationLock"];
  id v6 = [v4 firstObject];

  id v5 = [v6 encryptedValues];
  [v5 setObject:self->_zoneName forKey:@"zoneName"];
  [v5 setObject:self->_creationDate forKey:@"lockCreationDate"];
  [v5 setObject:self->_originDeviceIdentifier forKey:@"originDeviceIdentifier"];
  [v5 setObject:self->_originDeviceName forKey:@"originDeviceName"];
}

+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [a1 _deleteDeviceDataFromCloudStoreRecord:a3];
  }
}

+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3
{
  v3 = [a3 recordsWithRecordType:@"ShareCreationLock"];
  id v5 = [v3 firstObject];

  id v4 = [v5 encryptedValues];
  [v4 setObject:0 forKey:@"zoneName"];
  [v4 setObject:0 forKey:@"lockCreationDate"];
  [v4 setObject:0 forKey:@"originDeviceIdentifier"];
  [v4 setObject:0 forKey:@"originDeviceName"];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_zoneName length])
  {
    objc_super v8 = @"ShareCreationLock";
    id v4 = objc_msgSend((id)objc_opt_class(), "recordNameForZoneName:", self->_zoneName, @"ShareCreationLock");
    v9 = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v10[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)primaryIdentifier
{
  return self->_zoneName;
}

- (unint64_t)itemType
{
  return 8;
}

+ (id)recordNamePrefix
{
  return @"shareLock-";
}

+ (id)recordNameForZoneName:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [a1 recordNamePrefix];
  v7 = [v4 stringWithFormat:@"%@%@", v6, v5];

  return v7;
}

+ (id)zoneNameFromRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 recordNamePrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    v7 = [a1 recordNamePrefix];
    objc_super v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCloudStoreZoneShareLock *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCloudStoreZoneShareLock *)self isEqualToCloudStoreZoneShareLock:v5];

  return v6;
}

- (BOOL)isEqualToCloudStoreZoneShareLock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_zoneName;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  objc_super v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  BOOL v10 = [(NSString *)v6 isEqualToString:v7];

  if (v10)
  {
LABEL_11:
    creationDate = self->_creationDate;
    uint64_t v12 = (NSDate *)v4[2];
    if (creationDate && v12)
    {
      if (-[NSDate isEqual:](creationDate, "isEqual:"))
      {
LABEL_14:
        id v13 = (void *)v4[3];
        BOOL v6 = self->_originDeviceIdentifier;
        id v14 = v13;
        if (v6 == v14)
        {

LABEL_23:
          originDeviceName = self->_originDeviceName;
          v17 = (void *)v4[4];
          BOOL v6 = originDeviceName;
          objc_super v18 = v17;
          if (v6 == v18)
          {
            LOBYTE(v10) = 1;
            objc_super v8 = v6;
          }
          else
          {
            objc_super v8 = v18;
            LOBYTE(v10) = 0;
            if (v6 && v18) {
              LOBYTE(v10) = [(NSString *)v6 isEqualToString:v18];
            }
          }
          goto LABEL_8;
        }
        objc_super v8 = v14;
        LOBYTE(v10) = 0;
        if (v6 && v14)
        {
          BOOL v10 = [(NSString *)v6 isEqualToString:v14];

          if (!v10) {
            goto LABEL_21;
          }
          goto LABEL_23;
        }
LABEL_8:

        goto LABEL_21;
      }
    }
    else if (creationDate == v12)
    {
      goto LABEL_14;
    }
    LOBYTE(v10) = 0;
  }
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_zoneName];
  [v3 safelyAddObject:self->_creationDate];
  [v3 safelyAddObject:self->_originDeviceIdentifier];
  [v3 safelyAddObject:self->_originDeviceName];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"creationDate: '%@'; ", self->_creationDate];
  [v3 appendFormat:@"originDeviceIdentifier: '%@'; ", self->_originDeviceIdentifier];
  [v3 appendFormat:@"originDeviceName: '%@'; ", self->_originDeviceName];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)originDeviceIdentifier
{
  return self->_originDeviceIdentifier;
}

- (NSString)originDeviceName
{
  return self->_originDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originDeviceName, 0);
  objc_storeStrong((id *)&self->_originDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end