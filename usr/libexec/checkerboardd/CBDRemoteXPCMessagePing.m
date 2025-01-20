@interface CBDRemoteXPCMessagePing
+ (BOOL)supportsSecureCoding;
+ (id)handshakeWithHandler:(id)a3;
- (CBDRemoteXPCMessagePing)init;
- (CBDRemoteXPCMessagePing)initWithCoder:(id)a3;
- (CBDRemoteXPCMessagePing)initWithHandler:(id)a3;
- (Class)replyClass;
- (NSString)description;
- (NSUUID)uuid;
- (OS_xpc_remote_connection)connection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (id)replyWithSuccess:(BOOL)a3 error:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation CBDRemoteXPCMessagePing

- (CBDRemoteXPCMessagePing)init
{
  return [(CBDRemoteXPCMessagePing *)self initWithHandler:0];
}

- (CBDRemoteXPCMessagePing)initWithHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBDRemoteXPCMessagePing;
  v5 = [(CBDRemoteXPCMessagePing *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSUUID UUID];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    id v8 = objc_retainBlock(v4);
    id handler = v5->_handler;
    v5->_id handler = v8;
  }
  return v5;
}

+ (id)handshakeWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHandler:v4];

  return v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CBDRemoteXPCMessagePing *)self uuid];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@;>",
    v4,
    self,
  uint64_t v6 = v5);

  return (NSString *)v6;
}

- (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (id)replyWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[CBDRemoteXPCMessagePingReply replyToRemoteMessage:self success:a3 error:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessagePing)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBDRemoteXPCMessagePing;
  id v5 = [(CBDRemoteXPCMessagePing *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CBDRemoteXPCMessagePing *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteXPCMessagePing);
  id v5 = [(CBDRemoteXPCMessagePing *)self uuid];
  uint64_t v6 = (NSUUID *)[v5 copy];
  uuid = v4->_uuid;
  v4->_uuid = v6;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (OS_xpc_remote_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end