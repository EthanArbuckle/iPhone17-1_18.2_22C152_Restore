@interface CBDRemoteXPCMessageSetup
+ (BOOL)supportsSecureCoding;
+ (id)setProxyWithServer:(id)a3 port:(id)a4 token:(id)a5;
- (CBDRemoteXPCMessageSetup)init;
- (CBDRemoteXPCMessageSetup)initWithCoder:(id)a3;
- (CBDRemoteXPCMessageSetup)initWithServer:(id)a3 port:(id)a4 token:(id)a5;
- (Class)replyClass;
- (NSNumber)port;
- (NSString)description;
- (NSString)server;
- (NSString)token;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replyWithSuccess:(BOOL)a3 error:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CBDRemoteXPCMessageSetup

+ (id)setProxyWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithServer:v10 port:v9 token:v8];

  return v11;
}

- (CBDRemoteXPCMessageSetup)init
{
  return [(CBDRemoteXPCMessageSetup *)self initWithServer:&stru_1000108C0 port:&off_100010A80 token:0];
}

- (CBDRemoteXPCMessageSetup)initWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBDRemoteXPCMessageSetup;
  v12 = [(CBDRemoteXPCMessageSetup *)&v16 init];
  if (v12)
  {
    uint64_t v13 = +[NSUUID UUID];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_server, a3);
    objc_storeStrong((id *)&v12->_port, a4);
    objc_storeStrong((id *)&v12->_token, a5);
  }

  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CBDRemoteXPCMessageSetup *)self uuid];
  v6 = [(CBDRemoteXPCMessageSetup *)self server];
  v7 = [(CBDRemoteXPCMessageSetup *)self port];
  id v8 = [(CBDRemoteXPCMessageSetup *)self token];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@, server = %@, port = %@, token = %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (id)replyWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[CBDRemoteXPCMessageSuccessReply replyToRemoteMessage:self success:a3 error:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDRemoteXPCMessageSetup)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CBDRemoteXPCMessageSetup;
  v5 = [(CBDRemoteXPCMessageSetup *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"server"];
    server = v5->_server;
    v5->_server = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"port"];
    port = v5->_port;
    v5->_port = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CBDRemoteXPCMessageSetup *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  uint64_t v6 = [(CBDRemoteXPCMessageSetup *)self server];
  [v4 encodeObject:v6 forKey:@"server"];

  v7 = [(CBDRemoteXPCMessageSetup *)self port];
  [v4 encodeObject:v7 forKey:@"port"];

  id v8 = [(CBDRemoteXPCMessageSetup *)self token];
  [v4 encodeObject:v8 forKey:@"token"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteXPCMessageSetup);
  v5 = [(CBDRemoteXPCMessageSetup *)self uuid];
  uint64_t v6 = (NSUUID *)[v5 copy];
  uuid = v4->_uuid;
  v4->_uuid = v6;

  id v8 = [(CBDRemoteXPCMessageSetup *)self server];
  id v9 = (NSString *)[v8 copy];
  server = v4->_server;
  v4->_server = v9;

  id v11 = [(CBDRemoteXPCMessageSetup *)self port];
  uint64_t v12 = (NSNumber *)[v11 copy];
  port = v4->_port;
  v4->_port = v12;

  v14 = [(CBDRemoteXPCMessageSetup *)self token];
  objc_super v15 = (NSString *)[v14 copy];
  token = v4->_token;
  v4->_token = v15;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)server
{
  return self->_server;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end