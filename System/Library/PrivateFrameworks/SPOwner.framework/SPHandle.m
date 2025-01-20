@interface SPHandle
+ (BOOL)supportsSecureCoding;
+ (SPHandle)handleWithEmailAddress:(id)a3;
+ (SPHandle)handleWithPhoneNumber:(id)a3;
+ (SPHandle)handleWithString:(id)a3;
+ (SPHandle)handleWithWeb:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)destination;
- (SPHandle)initWithCoder:(id)a3;
- (SPHandle)initWithType:(int64_t)a3 destination:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPHandle)handleWithString:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"@"]) {
    +[SPHandle handleWithEmailAddress:v3];
  }
  else {
  v4 = +[SPHandle handleWithPhoneNumber:v3];
  }

  return (SPHandle *)v4;
}

+ (SPHandle)handleWithEmailAddress:(id)a3
{
  id v3 = a3;
  v4 = [[SPHandle alloc] initWithType:0 destination:v3];

  return v4;
}

+ (SPHandle)handleWithPhoneNumber:(id)a3
{
  id v3 = a3;
  v4 = [[SPHandle alloc] initWithType:1 destination:v3];

  return v4;
}

+ (SPHandle)handleWithWeb:(id)a3
{
  id v3 = a3;
  v4 = [[SPHandle alloc] initWithType:2 destination:v3];

  return v4;
}

- (SPHandle)initWithType:(int64_t)a3 destination:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPHandle;
  v8 = [(SPHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_destination, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPHandle *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(SPHandle *)self type];
      if (v6 == [(SPHandle *)v5 type])
      {
        id v7 = [(SPHandle *)self destination];
        v8 = [(SPHandle *)v5 destination];
        char v9 = [v7 isEqualToString:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(SPHandle *)self destination];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SPHandle *)self type] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SPHandle alloc];
  int64_t v5 = [(SPHandle *)self type];
  int64_t v6 = [(SPHandle *)self destination];
  id v7 = [(SPHandle *)v4 initWithType:v5 destination:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_destination forKey:@"destination"];
}

- (SPHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t type = [v4 decodeIntegerForKey:@"type"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];

  destination = self->_destination;
  self->_destination = v5;

  return self;
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(SPHandle *)self type];
  int64_t v6 = [(SPHandle *)self destination];
  id v7 = [v3 stringWithFormat:@"<%@: %p %ld:%@>", v4, self, v5, v6];

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end