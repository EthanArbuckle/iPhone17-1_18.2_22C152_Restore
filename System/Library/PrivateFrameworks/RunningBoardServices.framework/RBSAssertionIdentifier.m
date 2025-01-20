@interface RBSAssertionIdentifier
+ (BOOL)supportsRBSXPCSecureCoding;
+ (RBSAssertionIdentifier)identifierWithClientPid:(int)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSAssertionIdentifier)init;
- (RBSAssertionIdentifier)initWithRBSXPCCoder:(id)a3;
- (id)_initWithServerPid:(uint64_t)a3 clientPid:(unint64_t)a4 count:;
- (int)clientPid;
- (int)serverPid;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAssertionIdentifier

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSAssertionIdentifier)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeInt64ForKey:@"serverPid"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"clientPid"];
  unint64_t v7 = [v4 decodeInt64ForKey:@"count"];

  return (RBSAssertionIdentifier *)-[RBSAssertionIdentifier _initWithServerPid:clientPid:count:](self, v5, v6, v7);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = self;
  objc_sync_enter(v2);
  desc = v2->_desc;
  if (!desc)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%d-%llu", v2->_serverPid, v2->_clientPid, v2->_count);
    int v5 = v2->_desc;
    v2->_desc = (NSString *)v4;

    desc = v2->_desc;
  }
  uint64_t v6 = desc;
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t serverPid = self->_serverPid;
  id v5 = a3;
  [v5 encodeInt64:serverPid forKey:@"serverPid"];
  [v5 encodeInt64:self->_clientPid forKey:@"clientPid"];
  [v5 encodeInt64:self->_count forKey:@"count"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBSAssertionIdentifier *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4
  }
      && (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())
      && self->_serverPid == v5->_serverPid
      && self->_clientPid == v5->_clientPid
      && self->_count == v5->_count;

  return v7;
}

+ (RBSAssertionIdentifier)identifierWithClientPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [RBSAssertionIdentifier alloc];
  pid_t v5 = getpid();
  self;
  id v6 = -[RBSAssertionIdentifier _initWithServerPid:clientPid:count:](v4, v5, v3, atomic_fetch_add_explicit(&_next___count, 1uLL, memory_order_relaxed));
  return (RBSAssertionIdentifier *)v6;
}

- (id)_initWithServerPid:(uint64_t)a3 clientPid:(unint64_t)a4 count:
{
  if (a1)
  {
    id v5 = 0;
    if (a2 >= 1 && (int)a3 >= 1)
    {
      v11.receiver = a1;
      v11.super_class = (Class)RBSAssertionIdentifier;
      v8 = objc_msgSendSuper2(&v11, sel_init);
      if (v8)
      {
        v8[6] = a2;
        v8[7] = a3;
        *((void *)v8 + 4) = a4;
        unint64_t v9 = 0x94D049BB133111EBLL
           * ((0xBF58476D1CE4E5B9 * (a4 ^ (a4 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a4 ^ (a4 >> 30))) >> 27));
        *((void *)v8 + 2) = (a2 | (unint64_t)(a3 << 32)) ^ (v9 >> 31) ^ v9;
      }
      a1 = v8;
      id v5 = a1;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (RBSAssertionIdentifier)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAssertionIdentifier.m" lineNumber:36 description:@"-init is not allowed on RBSAssertionIdentifier"];

  return 0;
}

- (int)serverPid
{
  return self->_serverPid;
}

- (unint64_t)count
{
  return self->_count;
}

@end