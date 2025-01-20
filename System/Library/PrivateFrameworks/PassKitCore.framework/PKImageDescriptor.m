@interface PKImageDescriptor
+ (BOOL)supportsSecureCoding;
+ (void)_createForType:(uint64_t)a3 withTintColor:(char)a4 hasBackground:;
- (BOOL)hasBackground;
- (BOOL)isEqual:(id)a3;
- (PKImageDescriptor)init;
- (PKImageDescriptor)initWithCoder:(id)a3;
- (int64_t)tintColor;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKImageDescriptor

+ (void)_createForType:(uint64_t)a3 withTintColor:(char)a4 hasBackground:
{
  self;
  if (a2)
  {
    if (a2 != 1)
    {
      v9 = 0;
LABEL_9:

      return 0;
    }
    v7 = off_1E56D5250;
  }
  else
  {
    v7 = off_1E56D5248;
  }
  id v8 = objc_alloc(*v7);
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  v13.receiver = v8;
  v13.super_class = (Class)PKImageDescriptor;
  v10 = objc_msgSendSuper2(&v13, sel_init);
  if (!v10) {
    goto LABEL_9;
  }
  v11 = v10;
  v10[2] = a2;

  v11[3] = a3;
  *((unsigned char *)v11 + 8) = a4;
  return v11;
}

- (PKImageDescriptor)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = v5;
  if (v5 == @"bitmap"
    || v5
    && (char v7 = [(__CFString *)v5 isEqualToString:@"bitmap"], v6, (v7 & 1) != 0))
  {
    uint64_t v8 = 0;
  }
  else
  {

    v9 = v6;
    if (v9 != @"symbol")
    {
      v10 = v9;
      if (!v6
        || (char v11 = [(__CFString *)v9 isEqualToString:@"symbol"],
            v10,
            (v11 & 1) == 0))
      {

LABEL_15:
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKImageDescriptorDecoder" code:0 userInfo:0];
        [v4 failWithError:v15];

        v16 = 0;
        goto LABEL_18;
      }
    }
    uint64_t v8 = 1;
  }

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  if (self
    && (v18.receiver = self,
        v18.super_class = (Class)PKImageDescriptor,
        (v12 = [(PKImageDescriptor *)&v18 init]) != 0))
  {
    objc_super v13 = v12;
    v12->_type = v8;
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    PKSemanticColorFromString(v14, &v13->_tintColor);

    v13->_hasBackground = [v4 decodeBoolForKey:@"hasBackground"];
  }
  else
  {
    objc_super v13 = 0;
  }
  self = v13;
  v16 = self;
LABEL_18:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  v5 = @"symbol";
  if (type != 1) {
    v5 = 0;
  }
  if (type) {
    v6 = v5;
  }
  else {
    v6 = @"bitmap";
  }
  id v8 = a3;
  [v8 encodeObject:v6 forKey:@"type"];
  char v7 = PKSemanticColorToString(self->_tintColor);
  [v8 encodeObject:v7 forKey:@"tintColor"];

  [v8 encodeBool:self->_hasBackground forKey:@"hasBackground"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKImageDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      char v7 = v4;
      id v8 = v7;
      if (!self) {
        goto LABEL_26;
      }
      int64_t type = v7->_type;
      if (type != self->_type || v7->_tintColor != self->_tintColor) {
        goto LABEL_26;
      }
      if (type != 1)
      {
        if (type) {
          goto LABEL_23;
        }
        v10 = v7;
        char v11 = v10;
        v12 = (objc_class *)v10[4];
        Class isa = self[1].super.isa;
        if (v12 && isa)
        {
          char v14 = [v10[4] isEqual:isa];

          if ((v14 & 1) == 0) {
            goto LABEL_26;
          }
LABEL_23:
          BOOL v6 = 1;
LABEL_27:

          goto LABEL_28;
        }

        if (v12 == isa) {
          goto LABEL_23;
        }
LABEL_26:
        BOOL v6 = 0;
        goto LABEL_27;
      }
      v15 = v7;
      Class v16 = self[1].super.isa;
      v17 = (objc_class *)v15[4];
      objc_super v18 = v16;
      if (v17 == v18)
      {
      }
      else
      {
        v19 = v18;
        if (!v17 || !v18)
        {

LABEL_25:
          goto LABEL_26;
        }
        char v20 = [(objc_class *)v17 isEqualToString:v18];

        if ((v20 & 1) == 0) {
          goto LABEL_25;
        }
      }

      goto LABEL_23;
    }
  }
LABEL_28:

  return v6;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  if (!type)
  {
    v3 = &OBJC_IVAR___PKImageDescriptorBitmap__imageHash;
    goto LABEL_5;
  }
  if (type == 1)
  {
    v3 = &OBJC_IVAR___PKImageDescriptorSymbol__name;
LABEL_5:
    [*(id *)((char *)&self->super.isa + *v3) hash];
  }
  return SipHash();
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (BOOL)hasBackground
{
  return self->_hasBackground;
}

@end