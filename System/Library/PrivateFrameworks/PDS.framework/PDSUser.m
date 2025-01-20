@interface PDSUser
+ (BOOL)supportsSecureCoding;
+ (PDSUser)userWithDSID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUser:(id)a3;
- (NSString)userID;
- (PDSUser)initWithCoder:(id)a3;
- (PDSUser)initWithUserID:(id)a3 userType:(char)a4;
- (char)userType;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDSUser

+ (PDSUser)userWithDSID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PDSUser.m", 18, @"Invalid parameter not satisfying: %@", @"DSID" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc((Class)a1) initWithUserID:v5 userType:1];

  return (PDSUser *)v6;
}

- (PDSUser)initWithUserID:(id)a3 userType:(char)a4
{
  int v4 = a4;
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PDSUser.m", 23, @"Invalid parameter not satisfying: %@", @"userID" object file lineNumber description];
  }
  if (v4 != 1)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PDSUser.m", 24, @"Invalid parameter not satisfying: %@", @"userType == PDSUserTypeDSID" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PDSUser;
  v9 = [(PDSUser *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userID, a3);
    v10->_userType = v4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PDSUser *)self isEqualToUser:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(PDSUser *)self userID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(PDSUser *)self userType];

  return v5;
}

- (BOOL)isEqualToUser:(id)a3
{
  uint64_t v4 = (PDSUser *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    int v5 = [(PDSUser *)self userType];
    if (v5 == [(PDSUser *)v4 userType])
    {
      v6 = [(PDSUser *)self userID];
      v7 = [(PDSUser *)v4 userID];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PDSUser *)self userID];
  [v5 encodeObject:v4 forKey:@"userID"];

  objc_msgSend(v5, "encodeInt32:forKey:", -[PDSUser userType](self, "userType"), @"userType");
}

- (PDSUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  char v6 = [v4 decodeIntForKey:@"userType"];

  v7 = [(PDSUser *)self initWithUserID:v5 userType:v6];
  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PDSUser *)self userID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; userID = \"%@\"; userType = %d>",
    v4,
    self,
    v5,
  char v6 = [(PDSUser *)self userType]);

  return v6;
}

- (NSString)userID
{
  return self->_userID;
}

- (char)userType
{
  return self->_userType;
}

- (void).cxx_destruct
{
}

@end