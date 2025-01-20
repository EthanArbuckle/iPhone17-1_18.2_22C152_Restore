@interface CBDRemoteXPCMessagePingReply
+ (BOOL)supportsSecureCoding;
+ (id)replyToRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5;
- (BOOL)success;
- (CBDRemoteXPCMessagePingReply)initWithCoder:(id)a3;
- (CBDRemoteXPCMessagePingReply)initWithRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5;
- (NSError)error;
- (NSString)description;
- (NSString)ip;
- (NSUUID)inReplyToUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIp:(id)a3;
- (void)triggerWithRemoteMessage:(id)a3;
@end

@implementation CBDRemoteXPCMessagePingReply

+ (id)replyToRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithRemoteMessage:v9 success:v5 error:v8];

  return v10;
}

- (CBDRemoteXPCMessagePingReply)initWithRemoteMessage:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBDRemoteXPCMessagePingReply;
  id v10 = [(CBDRemoteXPCMessagePingReply *)&v16 init];
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
  BOOL v5 = [(CBDRemoteXPCMessagePingReply *)self uuid];
  v6 = [(CBDRemoteXPCMessagePingReply *)self inReplyToUUID];
  unsigned int v7 = [(CBDRemoteXPCMessagePingReply *)self success];
  id v8 = [(CBDRemoteXPCMessagePingReply *)self error];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@; inReplyToUUID = %@; success = %d; error = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (void)triggerWithRemoteMessage:(id)a3
{
  id v7 = a3;
  v4 = [v7 handler];

  if (v4)
  {
    BOOL v5 = [v7 handler];
    v6 = [(CBDRemoteXPCMessagePingReply *)self ip];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessagePingReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CBDRemoteXPCMessagePingReply;
  BOOL v5 = [(CBDRemoteXPCMessagePingReply *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inReplyToUUID"];
    inReplyToUUID = v5->_inReplyToUUID;
    v5->_inReplyToUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IP"];
    ip = v5->_ip;
    v5->_ip = (NSString *)v10;

    v5->_success = [v4 decodeBoolForKey:@"success"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBDRemoteXPCMessagePingReply *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  uint64_t v6 = [(CBDRemoteXPCMessagePingReply *)self inReplyToUUID];
  [v4 encodeObject:v6 forKey:@"inReplyToUUID"];

  id v7 = [(CBDRemoteXPCMessagePingReply *)self ip];
  [v4 encodeObject:v7 forKey:@"IP"];

  [v4 encodeBool:-[CBDRemoteXPCMessagePingReply success](self, "success") forKey:@"success"];
  id v8 = [(CBDRemoteXPCMessagePingReply *)self error];
  [v4 encodeObject:v8 forKey:@"error"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteXPCMessagePingReply);
  BOOL v5 = [(CBDRemoteXPCMessagePingReply *)self uuid];
  uint64_t v6 = (NSUUID *)[v5 copy];
  uuid = v4->_uuid;
  v4->_uuid = v6;

  id v8 = [(CBDRemoteXPCMessagePingReply *)self inReplyToUUID];
  id v9 = (NSUUID *)[v8 copy];
  inReplyToUUID = v4->_inReplyToUUID;
  v4->_inReplyToUUID = v9;

  uint64_t v11 = [(CBDRemoteXPCMessagePingReply *)self ip];
  uint64_t v12 = (NSString *)[v11 copy];
  ip = v4->_ip;
  v4->_ip = v12;

  v4->_success = self->_success;
  objc_storeStrong((id *)&v4->_error, self->_error);
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

- (NSString)ip
{
  return self->_ip;
}

- (void)setIp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ip, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inReplyToUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end