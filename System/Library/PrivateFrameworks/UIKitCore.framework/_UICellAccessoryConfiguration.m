@interface _UICellAccessoryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSystemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesDefaultLayoutWidth;
- (NSString)_identifier;
- (UIColor)_backgroundColor;
- (UIColor)tintColor;
- (_UICellAccessoryConfiguration)init;
- (_UICellAccessoryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (unint64_t)hash;
- (void)_setBackgroundColor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUsesDefaultLayoutWidth:(BOOL)a3;
@end

@implementation _UICellAccessoryConfiguration

- (_UICellAccessoryConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UICellAccessoryConfiguration;
  v3 = [(_UICellAccessoryConfiguration *)&v9 init];
  if (v3)
  {
    v4 = objc_opt_class();
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [v6 handleFailureInMethod:a2, v3, @"_UICellAccessoryConfiguration.m", 24, @"%@ is an abstract base class and should not be instantiated directly.", v8 object file lineNumber description];
    }
    v3->_usesDefaultLayoutWidth = 1;
  }
  return v3;
}

- (BOOL)_isSystemType
{
  return 1;
}

- (int64_t)_systemType
{
  return 0;
}

- (NSString)_identifier
{
  return (NSString *)&stru_1ED0E84C0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICellAccessoryConfiguration;
  v5 = [(_UICellAccessoryConfiguration *)&v11 init];
  if (v5)
  {
    v5->_usesDefaultLayoutWidth = [v4 decodeBoolForKey:@"usesDefaultLayoutWidth"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL usesDefaultLayoutWidth = self->_usesDefaultLayoutWidth;
  id v5 = a3;
  [v5 encodeBool:usesDefaultLayoutWidth forKey:@"usesDefaultLayoutWidth"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (id *)v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_usesDefaultLayoutWidth;
    objc_storeStrong((id *)(v4 + 16), self->_tintColor);
    objc_storeStrong(v5 + 3, self->_backgroundColor);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UICellAccessoryConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        v7 = v6;
        if (self->_usesDefaultLayoutWidth != v6->_usesDefaultLayoutWidth)
        {
          LOBYTE(v12) = 0;
LABEL_20:

          goto LABEL_21;
        }
        tintColor = v6->_tintColor;
        objc_super v9 = self->_tintColor;
        v10 = tintColor;
        if (v9 == v10)
        {
        }
        else
        {
          objc_super v11 = v10;
          LOBYTE(v12) = 0;
          if (!v9 || !v10)
          {
LABEL_19:

            goto LABEL_20;
          }
          BOOL v12 = [(UIColor *)v9 isEqual:v10];

          if (!v12) {
            goto LABEL_20;
          }
        }
        backgroundColor = self->_backgroundColor;
        v14 = v7->_backgroundColor;
        objc_super v9 = backgroundColor;
        v15 = v14;
        if (v9 == v15)
        {
          LOBYTE(v12) = 1;
          objc_super v11 = v9;
        }
        else
        {
          objc_super v11 = v15;
          LOBYTE(v12) = 0;
          if (v9 && v15) {
            LOBYTE(v12) = [(UIColor *)v9 isEqual:v15];
          }
        }
        goto LABEL_19;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  return self->_usesDefaultLayoutWidth;
}

- (BOOL)usesDefaultLayoutWidth
{
  return self->_usesDefaultLayoutWidth;
}

- (void)setUsesDefaultLayoutWidth:(BOOL)a3
{
  self->_BOOL usesDefaultLayoutWidth = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)_backgroundColor
{
  return self->_backgroundColor;
}

- (void)_setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end