@interface PKPassShareActivationOption
+ (BOOL)supportsSecureCoding;
+ (id)vehicleEnteredPin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassShareActivationOption:(id)a3;
- (NSString)identifier;
- (NSString)localizationKeyPostfix;
- (NSString)localizedName;
- (NSString)value;
- (PKPassShareActivationOption)init;
- (PKPassShareActivationOption)initWithCarKeyIdentifier:(id)a3;
- (PKPassShareActivationOption)initWithCoder:(id)a3;
- (PKPassShareActivationOption)initWithDefaultIdentifierForType:(unint64_t)a3;
- (PKPassShareActivationOption)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)valueLength;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueLength:(int64_t)a3;
@end

@implementation PKPassShareActivationOption

- (PKPassShareActivationOption)init
{
  return [(PKPassShareActivationOption *)self initWithDefaultIdentifierForType:0];
}

- (PKPassShareActivationOption)initWithDefaultIdentifierForType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    v4 = @"unknown";
  }
  else {
    v4 = off_1E56DFB60[a3 - 1];
  }
  return [(PKPassShareActivationOption *)self initWithIdentifier:v4 type:a3];
}

- (PKPassShareActivationOption)initWithCarKeyIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"sharingPasswordActivation") {
    goto LABEL_4;
  }
  if (!v4)
  {
LABEL_16:

    v8 = 0;
    goto LABEL_17;
  }
  char v6 = [(__CFString *)v4 isEqualToString:@"sharingPasswordActivation"];

  if ((v6 & 1) == 0)
  {
    v9 = v5;
    if (v9 == @"devicePinActivation"
      || (v10 = v9,
          char v11 = [(__CFString *)v9 isEqualToString:@"devicePinActivation"],
          v10,
          (v11 & 1) != 0))
    {
      uint64_t v7 = 1;
      goto LABEL_5;
    }
    v12 = v10;
    if (v12 == @"ownerKeyActivation") {
      goto LABEL_15;
    }
    v13 = v12;
    char v14 = [(__CFString *)v12 isEqualToString:@"ownerKeyActivation"];

    if (v14) {
      goto LABEL_15;
    }
    v15 = v13;
    if (v15 == @"friendKeyActivation"
      || (v16 = v15,
          char v17 = [(__CFString *)v15 isEqualToString:@"friendKeyActivation"],
          v16,
          (v17 & 1) != 0)
      || (v18 = v16, v18 == @"keyFobActivation")
      || (v19 = v18,
          char v20 = [(__CFString *)v18 isEqualToString:@"keyFobActivation"],
          v19,
          (v20 & 1) != 0))
    {
LABEL_15:
      uint64_t v7 = 3;
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_4:
  uint64_t v7 = 2;
LABEL_5:
  v8 = [(PKPassShareActivationOption *)self initWithIdentifier:v5 type:v7];
LABEL_17:

  return v8;
}

- (PKPassShareActivationOption)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassShareActivationOption;
  v8 = [(PKPassShareActivationOption *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (id)vehicleEnteredPin
{
  v2 = [[PKPassShareActivationOption alloc] initWithIdentifier:@"sharingPasswordActivation" type:2];
  return v2;
}

- (NSString)localizedName
{
  v2 = NSString;
  v3 = [(PKPassShareActivationOption *)self localizationKeyPostfix];
  v4 = [v2 stringWithFormat:@"SHARE_ACTIVATION_NAME_%@", v3];

  v5 = PKLocalizedShareableCredentialString(v4, 0);

  return (NSString *)v5;
}

- (NSString)localizationKeyPostfix
{
  unint64_t type = self->_type;
  switch(type)
  {
    case 1uLL:
      return (NSString *)@"PINCODE";
    case 3uLL:
      v8 = self->_identifier;
      if (v8 == @"ownerKeyActivation") {
        return (NSString *)@"OWNERKEY";
      }
      v9 = v8;
      if (v8
        && (char v10 = [(__CFString *)v8 isEqualToString:@"ownerKeyActivation"],
            v9,
            (v10 & 1) != 0))
      {
        return (NSString *)@"OWNERKEY";
      }
      else
      {
        objc_super v11 = self->_identifier;
        if (v11 == @"friendKeyActivation") {
          return (NSString *)@"FRIENDKEY";
        }
        v12 = v11;
        if (v11
          && (char v13 = [(__CFString *)v11 isEqualToString:@"friendKeyActivation"],
              v12,
              (v13 & 1) != 0))
        {
          return (NSString *)@"FRIENDKEY";
        }
        else
        {
          char v14 = self->_identifier;
          result = (NSString *)@"KEYFOB";
          if (v14 != @"keyFobActivation" && v14)
          {
            [(__CFString *)v14 isEqualToString:@"keyFobActivation"];

            return (NSString *)@"KEYFOB";
          }
        }
      }
      break;
    case 2uLL:
      v4 = self->_identifier;
      if (v4 != @"sharingPasswordActivation" && v4 != 0)
      {
        char v6 = v4;
        [(__CFString *)v4 isEqualToString:@"sharingPasswordActivation"];
      }
      return (NSString *)@"VEP";
    default:
      return (NSString *)@"UNKNOWN";
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareActivationOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassShareActivationOption;
  v5 = [(PKPassShareActivationOption *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_unint64_t type = PKPassShareActivationOptionTypeFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v9;

    v5->_valueLength = [v4 decodeIntegerForKey:@"valueLength"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"identifier"];
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56DFB60[v5];
  }
  [v7 encodeObject:v6 forKey:@"type"];
  [v7 encodeObject:self->_value forKey:@"value"];
  [v7 encodeInteger:self->_valueLength forKey:@"valueLength"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"<Option; "];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t v4 = self->_type - 1;
  if (v4 > 2) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56DFB60[v4];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  if (self->_value) {
    [v3 appendFormat:@"value: '%@'; ", self->_value];
  }
  if (self->_valueLength) {
    objc_msgSend(v3, "appendFormat:", @"valueLength: '%ld'; ", self->_valueLength);
  }
  [v3 appendFormat:@">"];
  uint64_t v6 = [NSString stringWithString:v3];

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_value) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = self->_valueLength - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPassShareActivationOption *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassShareActivationOption *)self isEqualToPassShareActivationOption:v5];

  return v6;
}

- (BOOL)isEqualToPassShareActivationOption:(id)a3
{
  unint64_t v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_16;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  if (self->_type != v4[2]) {
    goto LABEL_16;
  }
  value = self->_value;
  uint64_t v9 = (NSString *)v4[3];
  if (!value || !v9)
  {
    if (value == v9) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSString isEqual:](value, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  BOOL v10 = self->_valueLength == v4[4];
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(PKPassShareActivationOption);
  uint64_t v5 = [(NSString *)self->_identifier copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v4->_unint64_t type = self->_type;
  uint64_t v7 = [(NSString *)self->_value copy];
  value = v4->_value;
  v4->_value = (NSString *)v7;

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)valueLength
{
  return self->_valueLength;
}

- (void)setValueLength:(int64_t)a3
{
  self->_valueLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end