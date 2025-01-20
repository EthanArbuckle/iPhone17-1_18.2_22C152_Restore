@interface PKSystemIconConfigurationColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)hexString;
- (PKSystemIconConfigurationColor)initWithCoder:(id)a3;
- (PKSystemIconConfigurationColor)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)builtInColor;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSystemIconConfigurationColor

- (PKSystemIconConfigurationColor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSystemIconConfigurationColor;
  v5 = [(PKSystemIconConfigurationColor *)&v11 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_unint64_t type = PKSystemIconConfigurationColorTypeFromString(v6);

    v7 = [v4 PKStringForKey:@"colorValue"];
    v8 = v7;
    unint64_t type = v5->_type;
    if (type == 1)
    {
      v5->_builtInColor = PKSystemIconConfigurationColorBuiltInFromString(v7);
    }
    else if (!type)
    {
      objc_storeStrong((id *)&v5->_hexString, v7);
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  if (self->_type) {
    v5 = @"builtIn";
  }
  else {
    v5 = @"hex";
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  unint64_t v6 = self->_builtInColor - 1;
  if (v6 > 2) {
    v7 = @"primary";
  }
  else {
    v7 = off_1E56F3850[v6];
  }
  [v4 setObject:v7 forKeyedSubscript:@"builtInColor"];
  [v4 setObject:self->_hexString forKeyedSubscript:@"hexString"];
  v8 = (void *)[v4 copy];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSystemIconConfigurationColor *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        hexString = v6->_hexString;
        v8 = self->_hexString;
        v9 = hexString;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

            goto LABEL_15;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_15;
          }
        }
        if (self->_type == v6->_type)
        {
          BOOL v12 = self->_builtInColor == v6->_builtInColor;
LABEL_16:

          goto LABEL_17;
        }
LABEL_15:
        BOOL v12 = 0;
        goto LABEL_16;
      }
    }
    BOOL v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_hexString];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_builtInColor - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  if (self->_type) {
    uint64_t v4 = @"builtIn";
  }
  else {
    uint64_t v4 = @"hex";
  }
  [v3 appendFormat:@"type: '%@'; ", v4];
  unint64_t v5 = self->_builtInColor - 1;
  if (v5 > 2) {
    unint64_t v6 = @"primary";
  }
  else {
    unint64_t v6 = off_1E56F3850[v5];
  }
  [v3 appendFormat:@"builtInColor: '%@'; ", v6];
  [v3 appendFormat:@"hexString: '%@'; ", self->_hexString];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSystemIconConfigurationColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSystemIconConfigurationColor;
  unint64_t v5 = [(PKSystemIconConfigurationColor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hexString"];
    hexString = v5->_hexString;
    v5->_hexString = (NSString *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_builtInColor = [v4 decodeIntegerForKey:@"builtInColor"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  hexString = self->_hexString;
  id v5 = a3;
  [v5 encodeObject:hexString forKey:@"hexString"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_builtInColor forKey:@"builtInColor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKSystemIconConfigurationColor allocWithZone:](PKSystemIconConfigurationColor, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_hexString copyWithZone:a3];
  hexString = v5->_hexString;
  v5->_hexString = (NSString *)v6;

  v5->_unint64_t type = self->_type;
  v5->_builtInColor = self->_builtInColor;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)hexString
{
  return self->_hexString;
}

- (unint64_t)builtInColor
{
  return self->_builtInColor;
}

- (void).cxx_destruct
{
}

@end