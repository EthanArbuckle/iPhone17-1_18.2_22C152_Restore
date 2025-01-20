@interface PKPassTileAccessory
+ (BOOL)supportsSecureCoding;
+ (id)_createForDictionary:(id)a3;
+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnresolvedAccessory:(id)a3;
- (BOOL)isResolved;
- (PKPassTileAccessory)init;
- (PKPassTileAccessory)initWithCoder:(id)a3;
- (PKPassTileAccessoryButton)accessoryTypeButton;
- (PKPassTileAccessoryImage)accessoryTypeImage;
- (PKPassTileAccessorySpinner)accessoryTypeSpinner;
- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassTileAccessory

+ (id)_createForType:(int64_t)a3 resolved:(BOOL)a4
{
  if ((unint64_t)a3 >= 3)
  {
    v7 = 0;
    goto LABEL_6;
  }
  id v6 = objc_alloc(*off_1E56DDAA0[a3]);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = v6;
  v11.super_class = (Class)PKPassTileAccessory;
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
    uint64_t v12 = 0;
    id v6 = [v4 PKStringForKey:@"type"];
    int v7 = PKPassTileAccessoryTypeFromString(v6, &v12);

    id v8 = 0;
    if (v7)
    {
      v9 = (void *)[a1 _createForType:v12 resolved:0];
      v10 = v9;
      if (v9 && [v9 _setUpWithDictionary:v5]) {
        id v8 = v10;
      }
      else {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (PKPassTileAccessory)init
{
  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  return 1;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  if (self->_resolved) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileAccessory attempting double resolution."];
  }
  int64_t type = self->_type;
  return +[PKPassTileAccessory _createForType:type resolved:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v12 = 0;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  char v6 = PKPassTileAccessoryTypeFromString(v5, &v12);

  if (v6 & 1) != 0 && v12 <= 2 && objc_opt_class() && (objc_opt_isKindOfClass())
  {
    if (self)
    {
      unint64_t v7 = v12;
      v13.receiver = self;
      v13.super_class = (Class)PKPassTileAccessory;
      id v8 = [(PKPassTileAccessory *)&v13 init];
      if (v8)
      {
        v8->_int64_t type = v7;
        v8->_resolved = 1;
      }
    }
    else
    {
      id v8 = 0;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassTileAccessoryDecoder" code:0 userInfo:0];
    [v4 failWithError:v10];

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_resolved)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKPassTileAccessory %@ attempting unresolved XPC transfer.", objc_opt_class() format];
    id v4 = v7;
  }
  unint64_t type = self->_type;
  if (type > 2) {
    char v6 = 0;
  }
  else {
    char v6 = off_1E56DDAB8[type];
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
    BOOL v6 = [(PKPassTileAccessory *)self _isEqual:v4];
  }

  return v6;
}

- (BOOL)_isEqual:(id)a3
{
  return *((unsigned __int8 *)a3 + 8) == self->_resolved && *((void *)a3 + 2) == self->_type;
}

- (BOOL)isEqualToUnresolvedAccessory:(id)a3
{
  return !self->_resolved && [(PKPassTileAccessory *)self _isEqual:a3];
}

- (PKPassTileAccessoryButton)accessoryTypeButton
{
  if (self->_type) {
    self = 0;
  }
  return (PKPassTileAccessoryButton *)self;
}

- (PKPassTileAccessorySpinner)accessoryTypeSpinner
{
  if (self->_type != 1) {
    self = 0;
  }
  return (PKPassTileAccessorySpinner *)self;
}

- (PKPassTileAccessoryImage)accessoryTypeImage
{
  if (self->_type != 2) {
    self = 0;
  }
  return (PKPassTileAccessoryImage *)self;
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