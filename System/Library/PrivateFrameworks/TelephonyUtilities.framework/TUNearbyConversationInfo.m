@interface TUNearbyConversationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationInfo:(id)a3;
- (NSString)userProfileIdentifier;
- (NSUUID)conversationUUID;
- (TUNearbyConversationInfo)initWithCoder:(id)a3;
- (TUNearbyConversationInfo)initWithConversationUUID:(id)a3 userProfileIdentifier:(id)a4 deviceHandle:(id)a5 avMode:(unint64_t)a6;
- (TUNearbyDeviceHandle)deviceHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)avMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbyConversationInfo

- (TUNearbyConversationInfo)initWithConversationUUID:(id)a3 userProfileIdentifier:(id)a4 deviceHandle:(id)a5 avMode:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TUNearbyConversationInfo;
  v13 = [(TUNearbyConversationInfo *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    conversationUUID = v13->_conversationUUID;
    v13->_conversationUUID = (NSUUID *)v14;

    uint64_t v16 = [v11 copy];
    userProfileIdentifier = v13->_userProfileIdentifier;
    v13->_userProfileIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    deviceHandle = v13->_deviceHandle;
    v13->_deviceHandle = (TUNearbyDeviceHandle *)v18;

    v13->_avMode = a6;
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  v7 = [(TUNearbyConversationInfo *)self conversationUUID];
  [v6 appendFormat:@" conversationUUID=%@", v7];

  v8 = [(TUNearbyConversationInfo *)self userProfileIdentifier];
  [v6 appendFormat:@" userProfileIdentifier=%@", v8];

  v9 = [(TUNearbyConversationInfo *)self deviceHandle];
  id v10 = [v9 description];
  [v6 appendFormat:@" deviceHandle=%@", v10];

  objc_msgSend(v6, "appendFormat:", @" avMode=%lu", -[TUNearbyConversationInfo avMode](self, "avMode"));
  [v6 appendString:@">"];
  id v11 = (void *)[v6 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyConversationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_conversationUUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_userProfileIdentifier);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_deviceHandle);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = NSStringFromSelector(sel_avMode);
  uint64_t v15 = [v4 decodeIntegerForKey:v14];

  uint64_t v16 = [(TUNearbyConversationInfo *)self initWithConversationUUID:v7 userProfileIdentifier:v10 deviceHandle:v13 avMode:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUNearbyConversationInfo *)self conversationUUID];
  v6 = NSStringFromSelector(sel_conversationUUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUNearbyConversationInfo *)self userProfileIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_userProfileIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(TUNearbyConversationInfo *)self deviceHandle];
  id v10 = NSStringFromSelector(sel_deviceHandle);
  [v4 encodeObject:v9 forKey:v10];

  unint64_t v11 = [(TUNearbyConversationInfo *)self avMode];
  NSStringFromSelector(sel_avMode);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v11 forKey:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(TUNearbyConversationInfo *)self conversationUUID];
  v6 = (void *)[v5 copy];
  v7 = [(TUNearbyConversationInfo *)self userProfileIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  v9 = [(TUNearbyConversationInfo *)self deviceHandle];
  id v10 = (void *)[v9 copy];
  unint64_t v11 = objc_msgSend(v4, "initWithConversationUUID:userProfileIdentifier:deviceHandle:avMode:", v6, v8, v10, -[TUNearbyConversationInfo avMode](self, "avMode"));

  return v11;
}

- (unint64_t)hash
{
  v3 = [(TUNearbyConversationInfo *)self conversationUUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(TUNearbyConversationInfo *)self userProfileIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TUNearbyConversationInfo *)self deviceHandle];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(TUNearbyConversationInfo *)self avMode];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUNearbyConversationInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUNearbyConversationInfo *)self isEqualToConversationInfo:v4];
  }

  return v5;
}

- (BOOL)isEqualToConversationInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUNearbyConversationInfo *)self conversationUUID];
  uint64_t v6 = [v4 conversationUUID];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUNearbyConversationInfo *)self userProfileIdentifier];
    uint64_t v8 = [v4 userProfileIdentifier];
    if ([v7 isEqualToString:v8])
    {
      unint64_t v9 = [(TUNearbyConversationInfo *)self deviceHandle];
      id v10 = [v4 deviceHandle];
      if ([v9 isEquivalentToDeviceHandle:v10])
      {
        unint64_t v11 = [(TUNearbyConversationInfo *)self avMode];
        BOOL v12 = v11 == [v4 avMode];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSUUID)conversationUUID
{
  return self->_conversationUUID;
}

- (NSString)userProfileIdentifier
{
  return self->_userProfileIdentifier;
}

- (TUNearbyDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_userProfileIdentifier, 0);

  objc_storeStrong((id *)&self->_conversationUUID, 0);
}

@end