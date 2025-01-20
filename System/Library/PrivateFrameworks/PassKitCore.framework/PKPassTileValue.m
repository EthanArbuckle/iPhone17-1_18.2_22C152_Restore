@interface PKPassTileValue
+ (BOOL)supportsSecureCoding;
+ (id)_createForDictionary:(id)a3;
+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnresolvedValue:(id)a3;
- (BOOL)isResolved;
- (PKPassTileValue)init;
- (PKPassTileValue)initWithCoder:(id)a3;
- (PKPassTileValueDate)valueTypeDate;
- (PKPassTileValueForeignReference)valueTypeForeignReference;
- (PKPassTileValueNumber)valueTypeNumber;
- (PKPassTileValueText)valueTypeText;
- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4;
- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassTileValue

+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4
{
  if ((unint64_t)a3 >= 4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  id v6 = objc_alloc(*off_1E56F40F0[a3]);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = v6;
  v11.super_class = (Class)PKPassTileValue;
  id v8 = objc_msgSendSuper2(&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    *((void *)v8 + 2) = a3;
    *((unsigned char *)v8 + 8) = a4;
  }
LABEL_7:

  return v9;
}

+ (id)_createForDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 PKStringForKey:@"type"];
    uint64_t v7 = PKPassTileValueTypeFromString(v6);

    id v8 = (void *)[a1 _createForType:v7 resolved:0];
    v9 = v8;
    if (v8 && [v8 _setUpWithDictionary:v5]) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (PKPassTileValue)init
{
  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  if (self->_resolved) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileValue attempting double resolution."];
  }
  int64_t type = self->_type;
  return +[PKPassTileValue _createForType:type resolved:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v6 = PKPassTileValueTypeFromString(v5);

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKPassTileValue;
      uint64_t v7 = [(PKPassTileValue *)&v11 init];
      if (v7)
      {
        v7->_int64_t type = v6;
        v7->_resolved = 1;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    self = v7;
    id v8 = self;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassTileValueDecoder" code:0 userInfo:0];
    [v4 failWithError:v9];

    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_resolved)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKPassTileValue %@ attempting unresolved XPC transfer.", objc_opt_class() format];
    id v4 = v7;
  }
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    uint64_t v6 = @"text";
  }
  else {
    uint64_t v6 = off_1E56F4110[v5];
  }
  [v4 encodeObject:v6 forKey:@"type"];
}

- (unint64_t)hash
{
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    BOOL v6 = [(PKPassTileValue *)self _isEqual:v4];
  }

  return v6;
}

- (BOOL)_isEqual:(id)a3
{
  return *((unsigned __int8 *)a3 + 8) == self->_resolved && *((void *)a3 + 2) == self->_type;
}

- (BOOL)isEqualToUnresolvedValue:(id)a3
{
  return !self->_resolved && [(PKPassTileValue *)self _isEqual:a3];
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (PKPassTileValueText)valueTypeText
{
  if (self->_type) {
    self = 0;
  }
  return (PKPassTileValueText *)self;
}

- (PKPassTileValueDate)valueTypeDate
{
  if (self->_type != 1) {
    self = 0;
  }
  return (PKPassTileValueDate *)self;
}

- (PKPassTileValueNumber)valueTypeNumber
{
  if (self->_type != 2) {
    self = 0;
  }
  return (PKPassTileValueNumber *)self;
}

- (PKPassTileValueForeignReference)valueTypeForeignReference
{
  if (self->_type != 3) {
    self = 0;
  }
  return (PKPassTileValueForeignReference *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

@end