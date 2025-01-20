@interface STUserID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserID:(id)a3;
- (NSNumber)dsid;
- (STUserID)initWithCoder:(id)a3;
- (STUserID)initWithDSID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STUserID

- (STUserID)initWithDSID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STUserID;
  id v3 = a3;
  v4 = [(STUserID *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  dsid = v4->_dsid;
  v4->_dsid = (NSNumber *)v5;

  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(STUserID *)self dsid];
  v6 = [v3 stringWithFormat:@"<%@ { DSID: %@ }>", v4, v5];

  return v6;
}

- (STUserID)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];

  v6 = [(STUserID *)self initWithDSID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STUserID *)self dsid];
  [v4 encodeObject:v5 forKey:@"dsid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  dsid = self->_dsid;
  return (id)[v4 initWithDSID:dsid];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STUserID *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(STUserID *)self isEqualToUserID:v4];
  }

  return v5;
}

- (BOOL)isEqualToUserID:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(STUserID *)self dsid];
  v6 = [v4 dsid];

  LOBYTE(v4) = [v5 isEqualToNumber:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(STUserID *)self dsid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end