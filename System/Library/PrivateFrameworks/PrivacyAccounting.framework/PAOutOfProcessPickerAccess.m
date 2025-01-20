@interface PAOutOfProcessPickerAccess
+ (BOOL)supportsSecureCoding;
+ (id)accessWithAccessor:(id)a3 forType:(int64_t)a4;
+ (id)accessWithAuditToken:(id *)a3 forType:(int64_t)a4;
+ (id)eventStreamIdentifier;
- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4;
- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 forType:(int64_t)a4;
- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forType:(int64_t)a6;
- (PAOutOfProcessPickerAccess)initWithAuditToken:(id *)a3 forType:(int64_t)a4;
- (PAOutOfProcessPickerAccess)initWithCoder:(id)a3;
- (PAOutOfProcessPickerAccess)initWithProto:(id)a3;
- (PAOutOfProcessPickerAccess)initWithProtoData:(id)a3;
- (id)JSONObject;
- (id)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForCategory;
- (id)proto;
- (int64_t)pickerType;
- (unint64_t)hashWithOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PAOutOfProcessPickerAccess

+ (id)eventStreamIdentifier
{
  return @"com.apple.privacy.accounting.stream.oop";
}

+ (id)accessWithAuditToken:(id *)a3 forType:(int64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v7;
  v8 = (void *)[v6 initWithAuditToken:v10 forType:a4];

  return v8;
}

+ (id)accessWithAccessor:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  long long v7 = (void *)[objc_alloc((Class)a1) initWithAccessor:v6 forType:a4];

  return v7;
}

- (PAOutOfProcessPickerAccess)initWithAuditToken:(id *)a3 forType:(int64_t)a4
{
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  long long v7 = +[PAApplication applicationWithAuditToken:v10];
  v8 = [(PAOutOfProcessPickerAccess *)self initWithAccessor:v7 forType:a4];

  return v8;
}

- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 forType:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PAOutOfProcessPickerAccess;
  result = [(PAAccess *)&v6 initWithAccessor:a3];
  if (result) {
    result->_pickerType = a4;
  }
  return result;
}

- (PAOutOfProcessPickerAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forType:(int64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PAOutOfProcessPickerAccess;
  result = [(PAAccess *)&v8 initWithAccessor:a3 identifier:a4 kind:a5];
  if (result) {
    result->_pickerType = a6;
  }
  return result;
}

- (id)JSONObject
{
  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  v2 = [(PAAccess *)&v5 JSONObject];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"outOfProcess"];

  return v3;
}

- (id)category
{
  int64_t pickerType = self->_pickerType;
  if (pickerType == 1)
  {
    v3 = @"outOfProcessPhotos";
  }
  else if (pickerType == 2)
  {
    v3 = @"outOfProcessContacts";
  }
  else
  {
    v3 = @"unknown";
  }

  return v3;
}

- (id)descriptionForCategory
{
  int64_t pickerType = self->_pickerType;
  v3 = @"unknown";
  if (pickerType == 2) {
    v3 = @"contacts";
  }
  if (pickerType == 1) {
    return @"photos";
  }
  else {
    return v3;
  }
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAOutOfProcessPickerAccess;
  unint64_t v4 = [(PAAccess *)&v6 hashWithOptions:a3];
  return self->_pickerType - v4 + 32 * v4;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PAOutOfProcessPickerAccess;
  if ([(PAAccess *)&v10 isEqualToAccess:v6 withOptions:a4])
  {
    int64_t pickerType = self->_pickerType;
    BOOL v8 = pickerType == [v6 pickerType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAOutOfProcessPickerAccess;
  unint64_t v4 = [(PAAccess *)&v8 description];
  objc_super v5 = [(PAOutOfProcessPickerAccess *)self descriptionForCategory];
  id v6 = [v3 stringWithFormat:@"%@ pickerType:<%@>", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAOutOfProcessPickerAccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PAOutOfProcessPickerAccess;
  objc_super v5 = [(PAAccess *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_int64_t pickerType = [v4 decodeIntegerForKey:@"pickerType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  id v4 = a3;
  [(PAAccess *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pickerType, @"pickerType", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PAOutOfProcessPickerAccess;
  id result = [(PAAccess *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 9) = self->_pickerType;
  }
  return result;
}

- (PAOutOfProcessPickerAccess)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 access];
    v11.receiver = self;
    v11.super_class = (Class)PAOutOfProcessPickerAccess;
    self = [(PAAccess *)&v11 initWithProto:v6];

    if (self)
    {
      int v7 = [v5 pickerType];
      if (v7 == 1)
      {
        int64_t v8 = 1;
        goto LABEL_9;
      }
      if (v7 == 2)
      {
        int64_t v8 = 2;
LABEL_9:
        self->_int64_t pickerType = v8;
        v9 = self;
        goto LABEL_10;
      }
    }
    v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (PAOutOfProcessPickerAccess)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PAPBOutOfProcessPickerAccess alloc] initWithData:v4];

    id v6 = [(PAOutOfProcessPickerAccess *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)PAOutOfProcessPickerAccess;
  id v4 = [(PAAccess *)&v9 proto];
  if (!v4) {
    goto LABEL_5;
  }
  [v3 setAccess:v4];
  int64_t pickerType = self->_pickerType;
  if (pickerType == 1)
  {
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  if (pickerType != 2)
  {
LABEL_5:
    id v7 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = 2;
LABEL_7:
  [v3 setPickerType:v6];
  id v7 = v3;
LABEL_8:

  return v7;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

@end