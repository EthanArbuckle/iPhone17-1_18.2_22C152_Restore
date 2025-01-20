@interface PUIDPointerClient
- (BSAuditToken)auditToken;
- (NSUUID)uniqueIdentifier;
- (PUIDPointerClient)initWithUniqueIdentifier:(id)a3 auditToken:(id)a4;
- (id)description;
- (int)pid;
@end

@implementation PUIDPointerClient

- (PUIDPointerClient)initWithUniqueIdentifier:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUIDPointerClient;
  v8 = [(PUIDPointerClient *)&v12 init];
  if (v8)
  {
    v9 = (NSUUID *)[v6 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = v9;

    objc_storeStrong((id *)&v8->_auditToken, a4);
  }

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; pid:%d>",
    v4,
    self,
  v5 = [(PUIDPointerClient *)self pid]);

  return v5;
}

- (int)pid
{
  return [(BSAuditToken *)self->_auditToken pid];
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end