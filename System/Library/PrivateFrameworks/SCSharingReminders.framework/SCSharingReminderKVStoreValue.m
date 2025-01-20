@interface SCSharingReminderKVStoreValue
+ (BOOL)supportsSecureCoding;
+ (id)defaultForKey:(int64_t)a3;
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (SCSharingReminderKVStoreValue)initWithBoolValue:(BOOL)a3;
- (SCSharingReminderKVStoreValue)initWithCoder:(id)a3;
- (SCSharingReminderKVStoreValue)initWithData:(id)a3;
- (SCSharingReminderKVStoreValue)initWithIntegerValue:(int64_t)a3;
- (id)classKey;
- (id)data;
- (id)description;
- (int64_t)integerValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCSharingReminderKVStoreValue

+ (id)defaultForKey:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:qword_25B664230[a3]];
  }
  return v4;
}

- (SCSharingReminderKVStoreValue)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderKVStoreValue;
  v6 = [(SCSharingReminderKVStoreValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (SCSharingReminderKVStoreValue)initWithIntegerValue:(int64_t)a3
{
  int64_t v7 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:8];
  id v5 = [(SCSharingReminderKVStoreValue *)self initWithData:v4];

  return v5;
}

- (SCSharingReminderKVStoreValue)initWithBoolValue:(BOOL)a3
{
  BOOL v7 = a3;
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:1];
  id v5 = [(SCSharingReminderKVStoreValue *)self initWithData:v4];

  return v5;
}

- (id)data
{
  return self->_data;
}

- (int64_t)integerValue
{
  id v3 = [(SCSharingReminderKVStoreValue *)self data];
  if (![v3 length])
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v6;
  }
  v4 = [(SCSharingReminderKVStoreValue *)self data];
  unint64_t v5 = [v4 length];

  if (v5 <= 8)
  {
    id v3 = [(SCSharingReminderKVStoreValue *)self data];
    int64_t v6 = *(void *)[v3 bytes];
    goto LABEL_6;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)BOOLValue
{
  BOOL v3 = 1;
  v4 = [[SCSharingReminderKVStoreValue alloc] initWithBoolValue:1];
  unint64_t v5 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:1];
  if (![(SCSharingReminderKVStoreValue *)self isEqual:v4]) {
    BOOL v3 = [(SCSharingReminderKVStoreValue *)self isEqual:v5];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(SCSharingReminderKVStoreValue *)self data];
  unint64_t v5 = [(SCSharingReminderKVStoreValue *)self classKey];
  [v4 encodeObject:v6 forKey:v5];
}

- (SCSharingReminderKVStoreValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(SCSharingReminderKVStoreValue *)self classKey];
  BOOL v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  if (v7)
  {
    self = [(SCSharingReminderKVStoreValue *)self initWithData:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)classKey
{
  return @"SCSharingReminderKVStoreValue";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SCSharingReminderKVStoreValue *)self data];
    BOOL v7 = [v5 data];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(SCSharingReminderKVStoreValue *)self data];
      objc_super v9 = [v5 data];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  BOOL v3 = NSString;
  int64_t v4 = [(SCSharingReminderKVStoreValue *)self integerValue];
  BOOL v5 = [(SCSharingReminderKVStoreValue *)self BOOLValue];
  id v6 = "No";
  if (v5) {
    id v6 = "Yes";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"SCSharingReminderKVStoreValue int: {%ld} BOOL: %s", v4, v6);
}

- (void).cxx_destruct
{
}

@end