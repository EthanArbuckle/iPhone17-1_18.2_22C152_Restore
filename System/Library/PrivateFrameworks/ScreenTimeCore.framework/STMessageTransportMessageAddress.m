@interface STMessageTransportMessageAddress
+ (BOOL)supportsSecureCoding;
+ (id)createPartialAddressFromMessageAddress:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessageAddress:(id)a3;
- (NSNumber)userDSID;
- (NSString)deviceIdentifier;
- (STMessageTransportMessageAddress)initWithCoder:(id)a3;
- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3;
- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4;
- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4 addressType:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)addressType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMessageTransportMessageAddress

- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3
{
  return [(STMessageTransportMessageAddress *)self initWithUserDSID:a3 deviceIdentifier:0 addressType:0];
}

- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4
{
  return [(STMessageTransportMessageAddress *)self initWithUserDSID:a3 deviceIdentifier:a4 addressType:1];
}

- (STMessageTransportMessageAddress)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4 addressType:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)STMessageTransportMessageAddress;
  id v7 = a4;
  id v8 = a3;
  v9 = [(STMessageTransportMessageAddress *)&v15 init];
  v10 = (NSNumber *)objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  userDSID = v9->_userDSID;
  v9->_userDSID = v10;

  v12 = (NSString *)[v7 copy];
  deviceIdentifier = v9->_deviceIdentifier;
  v9->_deviceIdentifier = v12;

  v9->_addressType = a5;
  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STMessageTransportMessageAddress *)self userDSID];
  v5 = [(STMessageTransportMessageAddress *)self deviceIdentifier];
  int64_t v6 = [(STMessageTransportMessageAddress *)self addressType];
  CFStringRef v7 = @"UserDevice";
  if (!v6) {
    CFStringRef v7 = @"User";
  }
  id v8 = +[NSString stringWithFormat:@"<%@: {User: %@, Device: %@ Type: %@}>", v3, v4, v5, v7];

  return v8;
}

- (STMessageTransportMessageAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDSID"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  id v7 = [v4 decodeIntegerForKey:@"addressType"];

  id v8 = [(STMessageTransportMessageAddress *)self initWithUserDSID:v5 deviceIdentifier:v6 addressType:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  userDSID = self->_userDSID;
  id v5 = a3;
  [v5 encodeObject:userDSID forKey:@"userDSID"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeInteger:self->_addressType forKey:@"addressType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  userDSID = self->_userDSID;
  deviceIdentifier = self->_deviceIdentifier;
  int64_t addressType = self->_addressType;
  return [v4 initWithUserDSID:userDSID deviceIdentifier:deviceIdentifier addressType:addressType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STMessageTransportMessageAddress *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STMessageTransportMessageAddress *)self isEqualToMessageAddress:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToMessageAddress:(id)a3
{
  id v4 = (STMessageTransportMessageAddress *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    uint64_t v5 = [(STMessageTransportMessageAddress *)self deviceIdentifier];
    uint64_t v6 = [(STMessageTransportMessageAddress *)v4 deviceIdentifier];
    id v7 = [(STMessageTransportMessageAddress *)v4 addressType];
    if (v7 == (id)[(STMessageTransportMessageAddress *)self addressType])
    {
      id v8 = [(STMessageTransportMessageAddress *)v4 userDSID];
      v9 = [(STMessageTransportMessageAddress *)self userDSID];
      if ([v8 isEqualToNumber:v9])
      {
        if (v5 | v6) {
          unsigned __int8 v10 = [(id)v5 isEqualToString:v6];
        }
        else {
          unsigned __int8 v10 = 1;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(STMessageTransportMessageAddress *)self addressType];
  id v4 = [(STMessageTransportMessageAddress *)self userDSID];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;
  uint64_t v6 = [(STMessageTransportMessageAddress *)self deviceIdentifier];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

+ (id)createPartialAddressFromMessageAddress:(id)a3
{
  id v3 = a3;
  id v4 = [STMessageTransportMessageAddress alloc];
  unint64_t v5 = [v3 userDSID];

  uint64_t v6 = [(STMessageTransportMessageAddress *)v4 initWithUserDSID:v5];
  return v6;
}

- (int64_t)addressType
{
  return self->_addressType;
}

- (NSNumber)userDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
}

@end