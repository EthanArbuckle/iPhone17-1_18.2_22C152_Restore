@interface PKAccountUserInfoUpdate
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSDate)updatedDate;
- (NSString)description;
- (PKAccountUserInfoUpdate)initWithCoder:(id)a3;
- (PKAccountUserInfoUpdate)initWithRecord:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setUpdatedDate:(id)a3;
@end

@implementation PKAccountUserInfoUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserInfoUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserInfoUpdate;
  v5 = [(PKAccountUserInfoUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfoUpdatedDate"];
    updatedDate = v5->_updatedDate;
    v5->_updatedDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKAccountUserInfoUpdate)initWithRecord:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserInfoUpdate;
  v5 = [(PKAccountUserInfoUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"userInfoUpdatedDate");
    updatedDate = v5->_updatedDate;
    v5->_updatedDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4 = [a3 encryptedValues];
  [v4 setObject:self->_updatedDate forKey:@"userInfoUpdatedDate"];
}

+ (id)recordType
{
  return @"UserInfo";
}

+ (id)recordNamePrefix
{
  return @"userInfo-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    updatedDate = self->_updatedDate;
    uint64_t v6 = (NSDate *)v4[1];
    if (updatedDate && v6) {
      char v7 = -[NSDate isEqual:](updatedDate, "isEqual:");
    }
    else {
      char v7 = updatedDate == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_updatedDate];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(NSDate *)self->_updatedDate description];
  [v3 appendFormat:@"updateDate: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end