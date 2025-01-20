@interface WBSCRDTPositionSortValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPositionSortValue:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)deviceIdentifier;
- (WBSCRDTPositionSortValue)init;
- (WBSCRDTPositionSortValue)initWithCoder:(id)a3;
- (WBSCRDTPositionSortValue)initWithDictionaryRepresentation:(id)a3;
- (WBSCRDTPositionSortValue)initWithSortValue:(int64_t)a3 deviceIdentifier:(id)a4 changeID:(int64_t)a5;
- (WBSCRDTPositionSortValue)positionSortValueWithChangeID:(int64_t)a3;
- (WBSCRDTPositionSortValue)positionSortValueWithSortValue:(int64_t)a3;
- (id)description;
- (int64_t)changeID;
- (int64_t)compare:(id)a3;
- (int64_t)sortValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSCRDTPositionSortValue

- (WBSCRDTPositionSortValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"sortValue"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  if ([v6 length])
  {
    self = -[WBSCRDTPositionSortValue initWithSortValue:deviceIdentifier:changeID:](self, "initWithSortValue:deviceIdentifier:changeID:", v5, v6, [v4 decodeInt64ForKey:@"changeID"]);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSCRDTPositionSortValue)initWithSortValue:(int64_t)a3 deviceIdentifier:(id)a4 changeID:(int64_t)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCRDTPositionSortValue;
  v9 = [(WBSCRDTPositionSortValue *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_sortValue = a3;
    uint64_t v11 = [v8 copy];
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v11;

    v10->_changeID = a5;
    v13 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCRDTPositionSortValue)init
{
  return 0;
}

- (WBSCRDTPositionSortValue)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "safari_numberForKey:", @"sortValue");
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_stringForKey:", @"deviceIdentifier");
    if ([v6 length])
    {
      v7 = objc_msgSend(v4, "safari_numberForKey:", @"changeID");
      if (v7)
      {
        self = -[WBSCRDTPositionSortValue initWithSortValue:deviceIdentifier:changeID:](self, "initWithSortValue:deviceIdentifier:changeID:", [v5 longLongValue], v6, objc_msgSend(v7, "longLongValue"));
        id v8 = self;
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sortValue = self->_sortValue;
  id v5 = a3;
  [v5 encodeInt64:sortValue forKey:@"sortValue"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeInt64:self->_changeID forKey:@"changeID"];
}

- (NSDictionary)dictionaryRepresentation
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"sortValue";
  v3 = [NSNumber numberWithLongLong:self->_sortValue];
  deviceIdentifier = self->_deviceIdentifier;
  int64_t changeID = self->_changeID;
  v10[0] = v3;
  v10[1] = deviceIdentifier;
  v9[1] = @"deviceIdentifier";
  v9[2] = @"changeID";
  v6 = [NSNumber numberWithLongLong:changeID];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCRDTPositionSortValue *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WBSCRDTPositionSortValue *)self isEqualToPositionSortValue:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v2 = self->_changeID ^ self->_sortValue;
  return v2 ^ [(NSString *)self->_deviceIdentifier hash];
}

- (BOOL)isEqualToPositionSortValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = self->_sortValue == v4[1]
    && self->_changeID == v4[3]
    && [(NSString *)self->_deviceIdentifier isEqualToString:v4[2]];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t sortValue = self->_sortValue;
  int64_t v6 = v4[1];
  if (sortValue < v6) {
    goto LABEL_2;
  }
  if (sortValue > v6)
  {
LABEL_4:
    NSComparisonResult v7 = NSOrderedDescending;
    goto LABEL_6;
  }
  NSComparisonResult v7 = [(NSString *)self->_deviceIdentifier compare:v4[2]];
  if (v7) {
    goto LABEL_6;
  }
  int64_t changeID = self->_changeID;
  uint64_t v10 = v4[3];
  if (changeID < 0)
  {
    if ((v10 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
LABEL_11:
    if (changeID < 0) {
      int64_t changeID = -changeID;
    }
    if (v10 < 0) {
      uint64_t v10 = -v10;
    }
    if (changeID >= (unint64_t)v10)
    {
      NSComparisonResult v7 = (unint64_t)(changeID > (unint64_t)v10);
      goto LABEL_6;
    }
    goto LABEL_2;
  }
  if ((v10 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_2:
  NSComparisonResult v7 = NSOrderedAscending;
LABEL_6:

  return v7;
}

- (WBSCRDTPositionSortValue)positionSortValueWithSortValue:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSortValue:a3 deviceIdentifier:self->_deviceIdentifier changeID:self->_changeID];
  return (WBSCRDTPositionSortValue *)v3;
}

- (WBSCRDTPositionSortValue)positionSortValueWithChangeID:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSortValue:self->_sortValue deviceIdentifier:self->_deviceIdentifier changeID:a3];
  return (WBSCRDTPositionSortValue *)v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ %lld, %@, %lld }", self->_sortValue, self->_deviceIdentifier, self->_changeID];
}

- (int64_t)sortValue
{
  return self->_sortValue;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (void).cxx_destruct
{
}

@end