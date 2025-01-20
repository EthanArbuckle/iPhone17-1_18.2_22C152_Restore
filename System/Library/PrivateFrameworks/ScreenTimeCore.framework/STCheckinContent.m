@interface STCheckinContent
+ (BOOL)supportsSecureCoding;
+ (int64_t)contentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCheckinContent:(id)a3;
- (NSString)description;
- (STCheckinContent)initWithCoder:(id)a3;
- (STCheckinContent)initWithUserID:(id)a3 deviceID:(id)a4;
- (STDeviceID)deviceID;
- (STUserID)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCheckinContent

- (STCheckinContent)initWithUserID:(id)a3 deviceID:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STCheckinContent;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STCheckinContent *)&v13 init];
  v8 = (STUserID *)objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  userID = v7->_userID;
  v7->_userID = v8;

  v10 = (STDeviceID *)[v5 copy];
  deviceID = v7->_deviceID;
  v7->_deviceID = v10;

  return v7;
}

+ (int64_t)contentType
{
  return 4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STCheckinContent *)self userID];
  id v5 = [(STCheckinContent *)self deviceID];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ { User: %@, Device: %@, Type: %ld }>", v3, v4, v5, [(id)objc_opt_class() contentType]);

  return (NSString *)v6;
}

- (STCheckinContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];

  v7 = [(STCheckinContent *)self initWithUserID:v5 deviceID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STCheckinContent *)self userID];
  [v4 encodeObject:v5 forKey:@"userID"];

  id v6 = [(STCheckinContent *)self deviceID];
  [v4 encodeObject:v6 forKey:@"deviceID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  userID = self->_userID;
  deviceID = self->_deviceID;
  return [v4 initWithUserID:userID deviceID:deviceID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STCheckinContent *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STCheckinContent *)self isEqualToCheckinContent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCheckinContent:(id)a3
{
  id v4 = (STCheckinContent *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    BOOL v5 = [(STCheckinContent *)self userID];
    id v6 = [(STCheckinContent *)v4 userID];
    if ([v5 isEqualToUserID:v6])
    {
      v7 = [(STCheckinContent *)self deviceID];
      v8 = [(STCheckinContent *)v4 deviceID];
      unsigned __int8 v9 = [v7 isEqualToDeviceID:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STCheckinContent *)self userID];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STCheckinContent *)self deviceID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (STUserID)userID
{
  return (STUserID *)objc_getProperty(self, a2, 8, 1);
}

- (STDeviceID)deviceID
{
  return (STDeviceID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end