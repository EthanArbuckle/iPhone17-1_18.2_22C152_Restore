@interface PKHardwareVersionRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHardwareVersionRange:(id)a3;
- (BOOL)matchesDeviceVersion:(id)a3;
- (PKDeviceVersionRange)appletv;
- (PKDeviceVersionRange)ipad;
- (PKDeviceVersionRange)iphone;
- (PKDeviceVersionRange)ipod;
- (PKDeviceVersionRange)vision;
- (PKDeviceVersionRange)watch;
- (PKHardwareVersionRange)initWithCoder:(id)a3;
- (PKHardwareVersionRange)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKHardwareVersionRange

- (PKHardwareVersionRange)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKHardwareVersionRange;
  v5 = [(PKHardwareVersionRange *)&v25 init];
  if (v5)
  {
    v6 = [v4 PKDictionaryForKey:@"iPhone"];
    if (v6)
    {
      v7 = [[PKDeviceVersionRange alloc] initWithDictionary:v6];
      iphone = v5->_iphone;
      v5->_iphone = v7;
    }
    v9 = [v4 PKDictionaryForKey:@"Watch"];

    if (v9)
    {
      v10 = [[PKDeviceVersionRange alloc] initWithDictionary:v9];
      watch = v5->_watch;
      v5->_watch = v10;
    }
    v12 = [v4 PKDictionaryForKey:@"iPad"];

    if (v12)
    {
      v13 = [[PKDeviceVersionRange alloc] initWithDictionary:v12];
      ipad = v5->_ipad;
      v5->_ipad = v13;
    }
    v15 = [v4 PKDictionaryForKey:@"iPod"];

    if (v15)
    {
      v16 = [[PKDeviceVersionRange alloc] initWithDictionary:v15];
      ipod = v5->_ipod;
      v5->_ipod = v16;
    }
    v18 = [v4 PKDictionaryForKey:@"AppleTV"];

    if (v18)
    {
      v19 = [[PKDeviceVersionRange alloc] initWithDictionary:v18];
      appletv = v5->_appletv;
      v5->_appletv = v19;
    }
    v21 = [v4 PKDictionaryForKey:@"RealityDevice"];

    if (v21)
    {
      v22 = [[PKDeviceVersionRange alloc] initWithDictionary:v21];
      vision = v5->_vision;
      v5->_vision = v22;
    }
  }

  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKDeviceVersionRange *)self->_iphone asDictionary];
  [v3 setObject:v4 forKeyedSubscript:@"iPhone"];

  v5 = [(PKDeviceVersionRange *)self->_watch asDictionary];
  [v3 setObject:v5 forKeyedSubscript:@"Watch"];

  v6 = [(PKDeviceVersionRange *)self->_ipad asDictionary];
  [v3 setObject:v6 forKeyedSubscript:@"iPad"];

  v7 = [(PKDeviceVersionRange *)self->_ipod asDictionary];
  [v3 setObject:v7 forKeyedSubscript:@"iPod"];

  v8 = [(PKDeviceVersionRange *)self->_appletv asDictionary];
  [v3 setObject:v8 forKeyedSubscript:@"AppleTV"];

  v9 = [(PKDeviceVersionRange *)self->_vision asDictionary];
  [v3 setObject:v9 forKeyedSubscript:@"RealityDevice"];

  v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)matchesDeviceVersion:(id)a3
{
  id v4 = a3;
  v5 = [v4 deviceClass];
  v6 = v5;
  if (v5 == @"iPhone") {
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  int v7 = [@"iPhone" isEqualToString:v5];

  if (v7)
  {
LABEL_4:
    v8 = [(PKHardwareVersionRange *)self iphone];
  }
  else
  {
    v11 = v6;
    if (v11 == @"Watch"
      || (v12 = v11, int v13 = [@"Watch" isEqualToString:v11], v12, v13))
    {
      v8 = [(PKHardwareVersionRange *)self watch];
    }
    else
    {
      v14 = v12;
      if (v14 == @"iPad"
        || (v15 = v14, int v16 = [@"iPad" isEqualToString:v14], v15, v16))
      {
        v8 = [(PKHardwareVersionRange *)self ipad];
      }
      else
      {
        v17 = v15;
        if (v17 == @"iPod"
          || (v18 = v17, int v19 = [@"iPod" isEqualToString:v17], v18, v19))
        {
          v8 = [(PKHardwareVersionRange *)self ipod];
        }
        else
        {
          v20 = v18;
          if (v20 == @"AppleTV"
            || (v21 = v20, int v22 = [@"AppleTV" isEqualToString:v20], v21, v22))
          {
            v8 = [(PKHardwareVersionRange *)self appletv];
          }
          else
          {
            v23 = v21;
            if (v23 != @"RealityDevice")
            {
              v24 = v23;
              int v25 = [@"RealityDevice" isEqualToString:v23];

              if (!v25) {
                goto LABEL_22;
              }
            }
            v8 = [(PKHardwareVersionRange *)self vision];
          }
        }
      }
    }
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_22;
  }
  char v10 = [v8 _matchesDeviceVersion:v4];

LABEL_23:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKHardwareVersionRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKHardwareVersionRange;
  v5 = [(PKHardwareVersionRange *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"iPhone"];
    iphone = v5->_iphone;
    v5->_iphone = (PKDeviceVersionRange *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"Watch"];
    watch = v5->_watch;
    v5->_watch = (PKDeviceVersionRange *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"iPad"];
    ipad = v5->_ipad;
    v5->_ipad = (PKDeviceVersionRange *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v6 forKey:@"iPod"];
    ipod = v5->_ipod;
    v5->_ipod = (PKDeviceVersionRange *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"AppleTV"];
    appletv = v5->_appletv;
    v5->_appletv = (PKDeviceVersionRange *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v6 forKey:@"RealityDevice"];
    vision = v5->_vision;
    v5->_vision = (PKDeviceVersionRange *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  iphone = self->_iphone;
  id v5 = a3;
  [v5 encodeObject:iphone forKey:@"iPhone"];
  [v5 encodeObject:self->_watch forKey:@"Watch"];
  [v5 encodeObject:self->_ipad forKey:@"iPad"];
  [v5 encodeObject:self->_ipod forKey:@"iPod"];
  [v5 encodeObject:self->_appletv forKey:@"AppleTV"];
  [v5 encodeObject:self->_vision forKey:@"RealityDevice"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKHardwareVersionRange allocWithZone:](PKHardwareVersionRange, "allocWithZone:") init];
  uint64_t v6 = [(PKDeviceVersionRange *)self->_iphone copyWithZone:a3];
  iphone = v5->_iphone;
  v5->_iphone = v6;

  v8 = [(PKDeviceVersionRange *)self->_watch copyWithZone:a3];
  watch = v5->_watch;
  v5->_watch = v8;

  char v10 = [(PKDeviceVersionRange *)self->_ipad copyWithZone:a3];
  ipad = v5->_ipad;
  v5->_ipad = v10;

  v12 = [(PKDeviceVersionRange *)self->_ipod copyWithZone:a3];
  ipod = v5->_ipod;
  v5->_ipod = v12;

  v14 = [(PKDeviceVersionRange *)self->_appletv copyWithZone:a3];
  appletv = v5->_appletv;
  v5->_appletv = v14;

  int v16 = [(PKDeviceVersionRange *)self->_vision copyWithZone:a3];
  vision = v5->_vision;
  v5->_vision = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKHardwareVersionRange *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKHardwareVersionRange *)self isEqualToHardwareVersionRange:v5];

  return v6;
}

- (BOOL)isEqualToHardwareVersionRange:(id)a3
{
  id v4 = a3;
  iphone = self->_iphone;
  BOOL v6 = (PKDeviceVersionRange *)v4[1];
  if (iphone) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (iphone != v6) {
      goto LABEL_31;
    }
  }
  else if (!-[PKDeviceVersionRange isEqual:](iphone, "isEqual:"))
  {
    goto LABEL_31;
  }
  watch = self->_watch;
  uint64_t v9 = (PKDeviceVersionRange *)v4[2];
  if (watch && v9)
  {
    if (!-[PKDeviceVersionRange isEqual:](watch, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (watch != v9)
  {
    goto LABEL_31;
  }
  ipad = self->_ipad;
  uint64_t v11 = (PKDeviceVersionRange *)v4[3];
  if (ipad && v11)
  {
    if (!-[PKDeviceVersionRange isEqual:](ipad, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (ipad != v11)
  {
    goto LABEL_31;
  }
  ipod = self->_ipod;
  uint64_t v13 = (PKDeviceVersionRange *)v4[4];
  if (ipod && v13)
  {
    if (!-[PKDeviceVersionRange isEqual:](ipod, "isEqual:")) {
      goto LABEL_31;
    }
  }
  else if (ipod != v13)
  {
    goto LABEL_31;
  }
  appletv = self->_appletv;
  uint64_t v15 = (PKDeviceVersionRange *)v4[5];
  if (!appletv || !v15)
  {
    if (appletv == v15) {
      goto LABEL_27;
    }
LABEL_31:
    BOOL v18 = 0;
    goto LABEL_32;
  }
  if (!-[PKDeviceVersionRange isEqual:](appletv, "isEqual:")) {
    goto LABEL_31;
  }
LABEL_27:
  vision = self->_vision;
  uint64_t v17 = (PKDeviceVersionRange *)v4[6];
  if (vision && v17) {
    BOOL v18 = -[PKDeviceVersionRange isEqual:](vision, "isEqual:");
  }
  else {
    BOOL v18 = vision == v17;
  }
LABEL_32:

  return v18;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_iphone];
  [v3 safelyAddObject:self->_watch];
  [v3 safelyAddObject:self->_ipad];
  [v3 safelyAddObject:self->_ipod];
  [v3 safelyAddObject:self->_appletv];
  [v3 safelyAddObject:self->_vision];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"iphone: '%@'; ", self->_iphone];
  [v3 appendFormat:@"watch: '%@'; ", self->_watch];
  [v3 appendFormat:@"ipad: '%@'; ", self->_ipad];
  [v3 appendFormat:@"ipod: '%@'; ", self->_ipod];
  [v3 appendFormat:@"appletv: '%@'; ", self->_appletv];
  [v3 appendFormat:@"vision: '%@'; ", self->_vision];
  [v3 appendFormat:@">"];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (PKDeviceVersionRange)iphone
{
  return self->_iphone;
}

- (PKDeviceVersionRange)watch
{
  return self->_watch;
}

- (PKDeviceVersionRange)ipad
{
  return self->_ipad;
}

- (PKDeviceVersionRange)ipod
{
  return self->_ipod;
}

- (PKDeviceVersionRange)appletv
{
  return self->_appletv;
}

- (PKDeviceVersionRange)vision
{
  return self->_vision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vision, 0);
  objc_storeStrong((id *)&self->_appletv, 0);
  objc_storeStrong((id *)&self->_ipod, 0);
  objc_storeStrong((id *)&self->_ipad, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_iphone, 0);
}

@end