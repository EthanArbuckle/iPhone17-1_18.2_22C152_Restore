@interface PKExternalDestinationDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExternalDestinationDevice:(id)a3;
- (NSString)deviceClass;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (NSString)osType;
- (NSString)serialNumber;
- (NSURL)imageURL2x;
- (NSURL)imageURL3x;
- (PKExternalDestinationDevice)init;
- (PKExternalDestinationDevice)initWithCoder:(id)a3;
- (PKExternalDestinationDevice)initWithDictionary:(id)a3;
- (PKExternalDestinationDevice)initWithIdentifier:(id)a3 serialNumber:(id)a4;
- (id)description;
- (int64_t)eligibilityStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageURL2x:(id)a3;
- (void)setImageURL3x:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOsType:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PKExternalDestinationDevice

- (PKExternalDestinationDevice)init
{
  return 0;
}

- (PKExternalDestinationDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  v24.receiver = self;
  v24.super_class = (Class)PKExternalDestinationDevice;
  v5 = [(PKExternalDestinationDevice *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"deviceIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"deviceSerialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    if (v5->_identifier && v5->_serialNumber)
    {
      uint64_t v10 = [v4 PKStringForKey:@"name"];
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v5->_eligibilityStatus = [v4 PKIntegerForKey:@"eligibilityStatus"];
      uint64_t v12 = [v4 PKStringForKey:@"deviceType"];
      osType = v5->_osType;
      v5->_osType = (NSString *)v12;

      uint64_t v14 = [v4 PKStringForKey:@"deviceModelType"];
      model = v5->_model;
      v5->_model = (NSString *)v14;

      v16 = [v4 PKDictionaryForKey:@"deviceImageUrl"];
      v17 = [v16 PKDictionaryForKey:@"infobox"];

      uint64_t v18 = [v17 PKURLForKey:@"2x"];
      imageURL2x = v5->_imageURL2x;
      v5->_imageURL2x = (NSURL *)v18;

      uint64_t v20 = [v17 PKURLForKey:@"3x"];
      imageURL3x = v5->_imageURL3x;
      v5->_imageURL3x = (NSURL *)v20;

      goto LABEL_6;
    }

    self = 0;
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
LABEL_6:
  self = v5;
  v22 = self;
LABEL_9:

  return v22;
}

- (PKExternalDestinationDevice)initWithIdentifier:(id)a3 serialNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKExternalDestinationDevice;
  v9 = [(PKExternalDestinationDevice *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_serialNumber, a4);
    v10->_eligibilityStatus = 1;
  }

  return v10;
}

- (NSString)deviceClass
{
  v3 = self->_osType;
  if (v3 == @"iOS") {
    return (NSString *)@"iPhone";
  }
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(__CFString *)v3 caseInsensitiveCompare:@"iOS"];

    if (!v5) {
      return (NSString *)@"iPhone";
    }
  }
  uint64_t v6 = self->_osType;
  if (v6 == @"iPadOS") {
    return (NSString *)@"iPad";
  }
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(__CFString *)v6 caseInsensitiveCompare:@"iPadOS"];

    if (!v8) {
      return (NSString *)@"iPad";
    }
  }
  v9 = self->_osType;
  if (v9 == @"WatchOS") {
    return (NSString *)@"Watch";
  }
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(__CFString *)v9 caseInsensitiveCompare:@"WatchOS"];

    if (!v11) {
      return (NSString *)@"Watch";
    }
  }
  objc_super v12 = self->_osType;
  if (v12 == @"macOS") {
    return (NSString *)@"Mac";
  }
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = [(__CFString *)v12 caseInsensitiveCompare:@"macOS"];

    if (!v14) {
      return (NSString *)@"Mac";
    }
  }
  v15 = self->_osType;
  if (v15 == @"visionOS") {
    return (NSString *)@"RealityDevice";
  }
  v16 = v15;
  if (v15
    && (uint64_t v17 = [(__CFString *)v15 caseInsensitiveCompare:@"visionOS"],
        v16,
        !v17))
  {
    return (NSString *)@"RealityDevice";
  }
  else
  {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalDestinationDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKExternalDestinationDevice;
  uint64_t v5 = [(PKExternalDestinationDevice *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibilityStatus"];
    v5->_eligibilityStatus = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osType"];
    osType = v5->_osType;
    v5->_osType = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL2x"];
    imageURL2x = v5->_imageURL2x;
    v5->_imageURL2x = (NSURL *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL3x"];
    imageURL3x = v5->_imageURL3x;
    v5->_imageURL3x = (NSURL *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v6 encodeObject:self->_name forKey:@"name"];
  uint64_t v5 = [NSNumber numberWithInteger:self->_eligibilityStatus];
  [v6 encodeObject:v5 forKey:@"eligibilityStatus"];

  [v6 encodeObject:self->_osType forKey:@"osType"];
  [v6 encodeObject:self->_model forKey:@"model"];
  [v6 encodeObject:self->_imageURL2x forKey:@"imageURL2x"];
  [v6 encodeObject:self->_imageURL3x forKey:@"imageURL3x"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v6 appendFormat:@"serialNumber: '%@'; ", self->_serialNumber];
  [v6 appendFormat:@"name: '%@'; ", self->_name];
  id v7 = [NSNumber numberWithInteger:self->_eligibilityStatus];
  [v6 appendFormat:@"eligibilityStatus: '%@'; ", v7];

  [v6 appendFormat:@"osType: '%@'; ", self->_osType];
  [v6 appendFormat:@"model: '%@'; ", self->_model];
  [v6 appendFormat:@"imageURL2x: '%@'; ", self->_imageURL2x];
  [v6 appendFormat:@"imageURL3x: '%@'; ", self->_imageURL3x];
  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_serialNumber];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_osType];
  [v3 safelyAddObject:self->_model];
  [v3 safelyAddObject:self->_imageURL2x];
  [v3 safelyAddObject:self->_imageURL3x];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_eligibilityStatus - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKExternalDestinationDevice *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKExternalDestinationDevice *)self isEqualToExternalDestinationDevice:v5];

  return v6;
}

- (BOOL)isEqualToExternalDestinationDevice:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_38;
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
      goto LABEL_38;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_38;
  }
  serialNumber = self->_serialNumber;
  v9 = (NSString *)v4[2];
  if (serialNumber && v9)
  {
    if ((-[NSString isEqual:](serialNumber, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (serialNumber != v9)
  {
    goto LABEL_38;
  }
  name = self->_name;
  uint64_t v11 = (NSString *)v4[3];
  if (name && v11)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (name != v11)
  {
    goto LABEL_38;
  }
  if (self->_eligibilityStatus != v4[4]) {
    goto LABEL_38;
  }
  osType = self->_osType;
  uint64_t v13 = (NSString *)v4[5];
  if (osType && v13)
  {
    if ((-[NSString isEqual:](osType, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (osType != v13)
  {
    goto LABEL_38;
  }
  model = self->_model;
  uint64_t v15 = (NSString *)v4[6];
  if (model && v15)
  {
    if ((-[NSString isEqual:](model, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (model != v15)
  {
    goto LABEL_38;
  }
  imageURL2x = self->_imageURL2x;
  uint64_t v17 = (NSURL *)v4[7];
  if (!imageURL2x || !v17)
  {
    if (imageURL2x == v17) {
      goto LABEL_34;
    }
LABEL_38:
    char v20 = 0;
    goto LABEL_39;
  }
  if ((-[NSURL isEqual:](imageURL2x, "isEqual:") & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  imageURL3x = self->_imageURL3x;
  uint64_t v19 = (NSURL *)v4[8];
  if (imageURL3x && v19) {
    char v20 = -[NSURL isEqual:](imageURL3x, "isEqual:");
  }
  else {
    char v20 = imageURL3x == v19;
  }
LABEL_39:

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (NSString)osType
{
  return self->_osType;
}

- (void)setOsType:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSURL)imageURL2x
{
  return self->_imageURL2x;
}

- (void)setImageURL2x:(id)a3
{
}

- (NSURL)imageURL3x
{
  return self->_imageURL3x;
}

- (void)setImageURL3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL3x, 0);
  objc_storeStrong((id *)&self->_imageURL2x, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_osType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end