@interface WFTaskIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)defaultIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)processName;
- (NSUUID)UUID;
- (WFTaskIdentifier)init;
- (WFTaskIdentifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)pid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFTaskIdentifier

+ (id)defaultIdentifier
{
  v2 = objc_alloc_init(WFTaskIdentifier);
  return v2;
}

- (WFTaskIdentifier)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFTaskIdentifier;
  v2 = [(WFTaskIdentifier *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 bundleIdentifier];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [NSString stringWithUTF8String:getprogname()];
    }
    processName = v2->_processName;
    v2->_processName = v8;

    v2->_pid = getpid();
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(WFTaskIdentifier *)self processName];
  uint64_t v5 = [(WFTaskIdentifier *)self pid];
  v6 = [(WFTaskIdentifier *)self UUID];
  v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"%@[%d]: %@", v4, v5, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFTaskIdentifier *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(WFTaskIdentifier *)self UUID];
      v7 = [(WFTaskIdentifier *)v5 UUID];
      if (v6 == v7)
      {
        v9 = [(WFTaskIdentifier *)self processName];
        v10 = [(WFTaskIdentifier *)v5 processName];
        if (v9 == v10)
        {
          int v11 = [(WFTaskIdentifier *)self pid];
          BOOL v8 = v11 == [(WFTaskIdentifier *)v5 pid];
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(WFTaskIdentifier *)self UUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(WFTaskIdentifier *)self processName];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(WFTaskIdentifier *)self pid];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTaskIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFTaskIdentifier;
  uint64_t v5 = [(WFTaskIdentifier *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFTaskIdentifierUUIDKey"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFTaskIdentifierProcessNameKey"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFTaskIdentifierPidKey"];
    v5->_pid = [v10 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFTaskIdentifier *)self UUID];
  [v4 encodeObject:v5 forKey:@"WFTaskIdentifierUUIDKey"];

  uint64_t v6 = [(WFTaskIdentifier *)self processName];
  [v4 encodeObject:v6 forKey:@"WFTaskIdentifierProcessNameKey"];

  objc_msgSend(NSNumber, "numberWithInt:", -[WFTaskIdentifier pid](self, "pid"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"WFTaskIdentifierPidKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WFTaskIdentifier);
  uint64_t v5 = [(WFTaskIdentifier *)self UUID];
  UUID = v4->_UUID;
  v4->_UUID = (NSUUID *)v5;

  uint64_t v7 = [(WFTaskIdentifier *)self processName];
  processName = v4->_processName;
  v4->_processName = (NSString *)v7;

  v4->_pid = [(WFTaskIdentifier *)self pid];
  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)processName
{
  return self->_processName;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end