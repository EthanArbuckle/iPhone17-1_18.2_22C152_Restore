@interface SCLInterruptEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAlwaysInterrupt;
- (SCLContact)sender;
- (SCLInterruptEvent)init;
- (SCLInterruptEvent)initWithCoder:(id)a3;
- (id)_initWithEvent:(id)a3;
- (id)_initWithType:(unint64_t)a3 urgency:(unint64_t)a4 sender:(id)a5;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (unint64_t)urgency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLInterruptEvent

- (SCLInterruptEvent)init
{
  return (SCLInterruptEvent *)[(SCLInterruptEvent *)self _initWithEvent:0];
}

- (id)_initWithEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 type];
    uint64_t v7 = [v5 urgency];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  v8 = [v5 sender];
  id v9 = [(SCLInterruptEvent *)self _initWithType:v6 urgency:v7 sender:v8];

  return v9;
}

- (id)_initWithType:(unint64_t)a3 urgency:(unint64_t)a4 sender:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SCLInterruptEvent;
  id v9 = [(SCLInterruptEvent *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_urgency = a4;
    uint64_t v11 = [v8 copy];
    sender = v10->_sender;
    v10->_sender = (SCLContact *)v11;
  }
  return v10;
}

- (BOOL)shouldAlwaysInterrupt
{
  return self->_urgency == 1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLInterruptEvent *)self type];
  unint64_t v4 = [(SCLInterruptEvent *)self urgency] ^ v3;
  v5 = [(SCLInterruptEvent *)self sender];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SCLInterruptEvent *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(SCLInterruptEvent *)self type];
      if (v6 == [(SCLInterruptEvent *)v5 type]
        && (unint64_t v7 = [(SCLInterruptEvent *)self urgency], v7 == [(SCLInterruptEvent *)v5 urgency]))
      {
        id v8 = [(SCLInterruptEvent *)self sender];
        id v9 = [(SCLInterruptEvent *)v5 sender];
        if (v8 == v9)
        {
          char v12 = 1;
        }
        else
        {
          v10 = [(SCLInterruptEvent *)self sender];
          uint64_t v11 = [(SCLInterruptEvent *)v5 sender];
          char v12 = [v10 isEqual:v11];
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v4 = [(SCLInterruptEvent *)self type];
  v5 = @"<unknown>";
  if (v4 <= 2) {
    v5 = off_2648ACBA8[v4];
  }
  [v3 appendString:v5 withName:@"type"];
  unint64_t v6 = [(SCLInterruptEvent *)self urgency];
  unint64_t v7 = @"critical";
  if (v6 != 1) {
    unint64_t v7 = @"<unknown>";
  }
  if (v6) {
    id v8 = v7;
  }
  else {
    id v8 = @"default";
  }
  [v3 appendString:v8 withName:@"urgency"];
  id v9 = [(SCLInterruptEvent *)self sender];
  id v10 = (id)[v3 appendObject:v9 withName:@"sender" skipIfNil:1];

  uint64_t v11 = [v3 build];

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [SCLInterruptEvent alloc];
  return [(SCLInterruptEvent *)v4 _initWithEvent:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLInterruptEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"urgency"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];

  id v8 = [(SCLInterruptEvent *)self _initWithType:v5 urgency:v6 sender:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLInterruptEvent type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLInterruptEvent urgency](self, "urgency"), @"urgency");
  id v5 = [(SCLInterruptEvent *)self sender];
  [v4 encodeObject:v5 forKey:@"sender"];
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)urgency
{
  return self->_urgency;
}

- (SCLContact)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
}

@end