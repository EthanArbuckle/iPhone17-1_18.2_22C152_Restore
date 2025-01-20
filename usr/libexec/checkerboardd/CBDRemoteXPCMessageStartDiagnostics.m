@interface CBDRemoteXPCMessageStartDiagnostics
+ (BOOL)supportsSecureCoding;
- (CBDRemoteXPCMessageStartDiagnostics)init;
- (CBDRemoteXPCMessageStartDiagnostics)initWithCoder:(id)a3;
- (Class)replyClass;
- (NSString)description;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replyWithSuccess:(BOOL)a3 error:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CBDRemoteXPCMessageStartDiagnostics

- (CBDRemoteXPCMessageStartDiagnostics)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBDRemoteXPCMessageStartDiagnostics;
  v2 = [(CBDRemoteXPCMessageStartDiagnostics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }
  return v2;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CBDRemoteXPCMessageStartDiagnostics *)self uuid];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uuid = %@;>",
    v4,
    self,
  objc_super v6 = v5);

  return (NSString *)v6;
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

- (CBDRemoteXPCMessageStartDiagnostics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBDRemoteXPCMessageStartDiagnostics;
  v5 = [(CBDRemoteXPCMessageStartDiagnostics *)&v9 init];
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
  id v5 = [(CBDRemoteXPCMessageStartDiagnostics *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBDRemoteXPCMessageStartDiagnostics);
  id v5 = [(CBDRemoteXPCMessageStartDiagnostics *)self uuid];
  uint64_t v6 = (NSUUID *)[v5 copy];
  uuid = v4->_uuid;
  v4->_uuid = v6;

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end