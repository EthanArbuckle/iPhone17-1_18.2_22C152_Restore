@interface TUSplitSessionInfo
+ (BOOL)supportsSecureCoding;
- (NSUUID)conversationID;
- (TUNearbyDeviceHandle)device;
- (TUNeighborhoodHandoffContext)handoffContext;
- (TUSplitSessionInfo)initWithCoder:(id)a3;
- (TUSplitSessionInfo)initWithConversationID:(id)a3 device:(id)a4 handoffContext:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUSplitSessionInfo

- (TUSplitSessionInfo)initWithConversationID:(id)a3 device:(id)a4 handoffContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUSplitSessionInfo;
  v12 = [(TUSplitSessionInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversationID, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_handoffContext, a5);
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  v7 = [(NSUUID *)self->_conversationID UUIDString];
  [v6 appendFormat:@" conversationID=%@", v7];

  v8 = [(TUNearbyDeviceHandle *)self->_device description];
  [v6 appendFormat:@" device=%@", v8];

  id v9 = [(TUNeighborhoodHandoffContext *)self->_handoffContext description];
  [v6 appendFormat:@" handoffContext=%@", v9];

  [v6 appendString:@">"];
  id v10 = (void *)[v6 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSplitSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_conversationID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_device);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_handoffContext);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = [(TUSplitSessionInfo *)self initWithConversationID:v7 device:v10 handoffContext:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  conversationID = self->_conversationID;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_conversationID);
  [v5 encodeObject:conversationID forKey:v6];

  device = self->_device;
  uint64_t v8 = NSStringFromSelector(sel_device);
  [v5 encodeObject:device forKey:v8];

  handoffContext = self->_handoffContext;
  NSStringFromSelector(sel_handoffContext);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:handoffContext forKey:v10];
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (TUNearbyDeviceHandle)device
{
  return self->_device;
}

- (TUNeighborhoodHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end