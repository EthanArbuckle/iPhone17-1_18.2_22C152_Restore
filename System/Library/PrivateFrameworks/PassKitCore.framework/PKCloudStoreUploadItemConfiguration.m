@interface PKCloudStoreUploadItemConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)detectConflicts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)returnRecords;
- (NSDictionary)recordSpecificKeys;
- (NSSet)cloudStoreZones;
- (PKCloudStoreCoding)item;
- (PKCloudStoreUploadItemConfiguration)initWithCoder:(id)a3;
- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3;
- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3 recordSpecificKeys:(id)a4;
- (id)description;
- (unint64_t)codingType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudStoreZones:(id)a3;
- (void)setCodingType:(unint64_t)a3;
- (void)setDetectConflicts:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setRecordSpecificKeys:(id)a3;
- (void)setReturnRecords:(BOOL)a3;
@end

@implementation PKCloudStoreUploadItemConfiguration

- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3
{
  return [(PKCloudStoreUploadItemConfiguration *)self initWithItem:a3 recordSpecificKeys:0];
}

- (PKCloudStoreUploadItemConfiguration)initWithItem:(id)a3 recordSpecificKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudStoreUploadItemConfiguration;
  v9 = [(PKCloudStoreUploadItemConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_recordSpecificKeys, a4);
    v10->_itemType = [v7 itemType];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKCloudStoreUploadItemConfiguration *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCloudStoreUploadItemConfiguration *)self isEqualToConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_21;
  }
  item = self->_item;
  BOOL v6 = (PKCloudStoreCoding *)v4[3];
  if (item) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (item != v6) {
      goto LABEL_21;
    }
  }
  else if ((-[PKCloudStoreCoding isEqual:](item, "isEqual:") & 1) == 0)
  {
    goto LABEL_21;
  }
  recordSpecificKeys = self->_recordSpecificKeys;
  v9 = (NSDictionary *)v4[5];
  if (!recordSpecificKeys || !v9)
  {
    if (recordSpecificKeys == v9) {
      goto LABEL_15;
    }
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  if ((-[NSDictionary isEqual:](recordSpecificKeys, "isEqual:") & 1) == 0) {
    goto LABEL_21;
  }
LABEL_15:
  if (self->_codingType != v4[6]
    || self->_detectConflicts != *((unsigned __int8 *)v4 + 16)
    || self->_returnRecords != *((unsigned __int8 *)v4 + 17))
  {
    goto LABEL_21;
  }
  cloudStoreZones = self->_cloudStoreZones;
  v11 = (NSSet *)v4[4];
  if (cloudStoreZones && v11) {
    char v12 = -[NSSet isEqual:](cloudStoreZones, "isEqual:");
  }
  else {
    char v12 = cloudStoreZones == v11;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_item];
  [v3 safelyAddObject:self->_recordSpecificKeys];
  [v3 safelyAddObject:self->_cloudStoreZones];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_codingType - v4 + 32 * v4;
  uint64_t v6 = self->_detectConflicts - v5 + 32 * v5;
  unint64_t v7 = self->_returnRecords - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"item: '%@'; ", self->_item];
  [v3 appendFormat:@"accessLevel: '%@'; ", self->_item];
  [v3 appendFormat:@"recordSpecificKeys: '%@'; ", self->_recordSpecificKeys];
  [v3 appendFormat:@"cloudStoreZones: '%@'; ", self->_cloudStoreZones];
  if (self->_detectConflicts) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"detectConflicts: '%@'; ", v4];
  if (self->_returnRecords) {
    unint64_t v5 = @"YES";
  }
  else {
    unint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"returnRecords: '%@'; ", v5];
  uint64_t v6 = PKCloudStoreCodingTypeToString(self->_codingType);
  [v3 appendFormat:@"codingType: '%@'; ", v6];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreUploadItemConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKCloudStoreUploadItemConfiguration;
  unint64_t v5 = [(PKCloudStoreUploadItemConfiguration *)&v22 init];
  if (v5)
  {
    v5->_itemType = [v4 decodeIntegerForKey:@"itemType"];
    v5->_codingType = [v4 decodeIntegerForKey:@"codingType"];
    v5->_detectConflicts = [v4 decodeBoolForKey:@"detectConflicts"];
    v5->_returnRecords = [v4 decodeBoolForKey:@"returnRecords"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"recordSpecificKeys"];
    recordSpecificKeys = v5->_recordSpecificKeys;
    v5->_recordSpecificKeys = (NSDictionary *)v10;

    char v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"cloudStoreZones"];
    cloudStoreZones = v5->_cloudStoreZones;
    v5->_cloudStoreZones = (NSSet *)v15;

    switch(v5->_itemType)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 5uLL:
      case 9uLL:
      case 0xAuLL:
        uint64_t v17 = objc_opt_class();
        v18 = @"item";
        goto LABEL_5;
      case 8uLL:
        uint64_t v17 = objc_opt_class();
        v18 = @"shareLock";
LABEL_5:
        uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
        item = v5->_item;
        v5->_item = (PKCloudStoreCoding *)v19;

        break;
      default:
        break;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t itemType = self->_itemType;
  id v5 = a3;
  [v5 encodeInteger:itemType forKey:@"itemType"];
  [v5 encodeObject:self->_cloudStoreZones forKey:@"cloudStoreZones"];
  [v5 encodeInteger:self->_codingType forKey:@"codingType"];
  [v5 encodeBool:self->_detectConflicts forKey:@"detectConflicts"];
  [v5 encodeBool:self->_returnRecords forKey:@"returnRecords"];
  [v5 encodeObject:self->_recordSpecificKeys forKey:@"recordSpecificKeys"];
  [v5 encodeObject:self->_item forKey:@"item"];
}

- (PKCloudStoreCoding)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSSet)cloudStoreZones
{
  return self->_cloudStoreZones;
}

- (void)setCloudStoreZones:(id)a3
{
}

- (NSDictionary)recordSpecificKeys
{
  return self->_recordSpecificKeys;
}

- (void)setRecordSpecificKeys:(id)a3
{
}

- (unint64_t)codingType
{
  return self->_codingType;
}

- (void)setCodingType:(unint64_t)a3
{
  self->_codingType = a3;
}

- (BOOL)detectConflicts
{
  return self->_detectConflicts;
}

- (void)setDetectConflicts:(BOOL)a3
{
  self->_detectConflicts = a3;
}

- (BOOL)returnRecords
{
  return self->_returnRecords;
}

- (void)setReturnRecords:(BOOL)a3
{
  self->_returnRecords = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSpecificKeys, 0);
  objc_storeStrong((id *)&self->_cloudStoreZones, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end