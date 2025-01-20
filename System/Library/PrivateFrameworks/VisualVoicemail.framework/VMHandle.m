@interface VMHandle
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandle:(id)a3;
- (NSString)value;
- (VMHandle)init;
- (VMHandle)initWithCoder:(id)a3;
- (VMHandle)initWithHandle:(id)a3;
- (VMHandle)initWithType:(int64_t)a3 value:(id)a4;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMHandle

- (VMHandle)init
{
  return 0;
}

- (VMHandle)initWithHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  v6 = [v4 value];

  v7 = [(VMHandle *)self initWithType:v5 value:v6];
  return v7;
}

- (VMHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VMHandle;
  v7 = [(VMHandle *)&v11 init];
  if (v7)
  {
    if (a3)
    {
      if (v6)
      {
LABEL_4:
        v7->_type = a3;
        uint64_t v8 = [v6 copy];
        value = v7->_value;
        v7->_value = (NSString *)v8;

        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%s: parameter '%@' cannot be nil", "-[VMHandle initWithType:value:]", @"type" format];
      if (v6) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%s: parameter '%@' cannot be nil", "-[VMHandle initWithType:value:]", @"value" format];
    goto LABEL_4;
  }
LABEL_5:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[VMHandle allocWithZone:a3];
  return [(VMHandle *)v4 initWithHandle:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_type);
  [v5 encodeInteger:type forKey:v6];

  value = self->_value;
  NSStringFromSelector(sel_value);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:value forKey:v8];
}

- (VMHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VMHandle;
  id v5 = [(VMHandle *)&v12 init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_type);
    v5->_int64_t type = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(sel_value);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    value = v5->_value;
    v5->_value = (NSString *)v9;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_type);
  [v3 appendFormat:@"%@=%ld", v4, -[VMHandle type](self, "type")];

  [v3 appendFormat:@", "];
  id v5 = NSStringFromSelector(sel_value);
  id v6 = [(VMHandle *)self value];
  [v3 appendFormat:@"%@=%@", v5, v6];

  [v3 appendFormat:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)hash
{
  int64_t v3 = [(VMHandle *)self type];
  id v4 = [(VMHandle *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VMHandle *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(VMHandle *)self isEqualToHandle:v4];
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  id v4 = (VMHandle *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    int64_t v5 = [(VMHandle *)self type];
    if (v5 == [(VMHandle *)v4 type])
    {
      uint64_t v6 = [(VMHandle *)self value];
      uint64_t v7 = [(VMHandle *)v4 value];
      char v8 = (v6 | v7) == 0;
      if (v7) {
        char v8 = [(id)v6 isEqualToString:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  id v7 = a3;
  char v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end