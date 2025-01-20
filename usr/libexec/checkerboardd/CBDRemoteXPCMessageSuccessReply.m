@interface CBDRemoteXPCMessageSuccessReply
+ (BOOL)supportsSecureCoding;
+ (id)replyToRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5;
- (BOOL)success;
- (CBDRemoteXPCMessageSuccessReply)initWithCoder:(id)a3;
- (CBDRemoteXPCMessageSuccessReply)initWithRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5;
- (NSError)error;
- (NSString)description;
- (NSUUID)inReplyToUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CBDRemoteXPCMessageSuccessReply

+ (id)replyToRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithRemoteMessage:v9 success:v5 error:v8];

  return v10;
}

- (CBDRemoteXPCMessageSuccessReply)initWithRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBDRemoteXPCMessageSuccessReply;
  id v10 = [(CBDRemoteXPCMessageSuccessReply *)&v16 init];
  if (v10)
  {
    uint64_t v11 = +[NSUUID UUID];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    uint64_t v13 = [v8 uuid];
    inReplyToUUID = v10->_inReplyToUUID;
    v10->_inReplyToUUID = (NSUUID *)v13;

    v10->_success = a4;
    objc_storeStrong((id *)&v10->_error, a5);
  }

  return v10;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  BOOL v5 = [(CBDRemoteXPCMessageSuccessReply *)self uuid];
  v6 = [(CBDRemoteXPCMessageSuccessReply *)self inReplyToUUID];
  unsigned int v7 = [(CBDRemoteXPCMessageSuccessReply *)self success];
  id v8 = [(CBDRemoteXPCMessageSuccessReply *)self error];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@, inReplyToUUID = %@, success = %d, error = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessageSuccessReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CBDRemoteXPCMessageSuccessReply;
  BOOL v5 = [(CBDRemoteXPCMessageSuccessReply *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inReplyToUUID"];
    inReplyToUUID = v5->_inReplyToUUID;
    v5->_inReplyToUUID = (NSUUID *)v8;

    v5->_success = [v4 decodeBoolForKey:@"success"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBDRemoteXPCMessageSuccessReply *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  uint64_t v6 = [(CBDRemoteXPCMessageSuccessReply *)self inReplyToUUID];
  [v4 encodeObject:v6 forKey:@"inReplyToUUID"];

  [v4 encodeBool:-[CBDRemoteXPCMessageSuccessReply success](self, "success") forKey:@"success"];
  id v7 = [(CBDRemoteXPCMessageSuccessReply *)self error];
  [v4 encodeObject:v7 forKey:@"error"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteXPCMessageSuccessReply);
  if (v4)
  {
    BOOL v5 = [(CBDRemoteXPCMessageSuccessReply *)self uuid];
    uint64_t v6 = (NSUUID *)[v5 copy];
    uuid = v4->_uuid;
    v4->_uuid = v6;

    uint64_t v8 = [(CBDRemoteXPCMessageSuccessReply *)self inReplyToUUID];
    id v9 = (NSUUID *)[v8 copy];
    inReplyToUUID = v4->_inReplyToUUID;
    v4->_inReplyToUUID = v9;

    v4->_success = self->_success;
    objc_storeStrong((id *)&v4->_error, self->_error);
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)inReplyToUUID
{
  return self->_inReplyToUUID;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inReplyToUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end