@interface TUMomentsMessageSendRequest
+ (BOOL)supportsSecureCoding;
- (NSSet)destinationHandles;
- (NSUUID)conversationID;
- (NSUUID)sessionUUID;
- (TUHandle)senderHandle;
- (TUMomentsMessageSendRequest)initWithCoder:(id)a3;
- (TUMomentsMessageSendRequest)initWithSessionUUID:(id)a3 conversationID:(id)a4 senderHandle:(id)a5 destinationHandles:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMomentsMessageSendRequest

- (TUMomentsMessageSendRequest)initWithSessionUUID:(id)a3 conversationID:(id)a4 senderHandle:(id)a5 destinationHandles:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUMomentsMessageSendRequest;
  v15 = [(TUMomentsMessageSendRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionUUID, a3);
    objc_storeStrong((id *)&v16->_conversationID, a4);
    objc_storeStrong((id *)&v16->_senderHandle, a5);
    objc_storeStrong((id *)&v16->_destinationHandles, a6);
  }

  return v16;
}

- (TUMomentsMessageSendRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderHandle"];
  v8 = [v4 decodeObjectForKey:@"destinationHandles"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0)
  {
    id v12 = 0;
  }
  else
  {
    self = [(TUMomentsMessageSendRequest *)self initWithSessionUUID:v5 conversationID:v6 senderHandle:v7 destinationHandles:v8];
    id v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUMomentsMessageSendRequest *)self sessionUUID];
  [v4 encodeObject:v5 forKey:@"sessionUUID"];

  v6 = [(TUMomentsMessageSendRequest *)self conversationID];
  [v4 encodeObject:v6 forKey:@"conversationID"];

  v7 = [(TUMomentsMessageSendRequest *)self senderHandle];
  [v4 encodeObject:v7 forKey:@"senderHandle"];

  id v8 = [(TUMomentsMessageSendRequest *)self destinationHandles];
  [v4 encodeObject:v8 forKey:@"destinationHandles"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (TUHandle)senderHandle
{
  return self->_senderHandle;
}

- (NSSet)destinationHandles
{
  return self->_destinationHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationHandles, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end