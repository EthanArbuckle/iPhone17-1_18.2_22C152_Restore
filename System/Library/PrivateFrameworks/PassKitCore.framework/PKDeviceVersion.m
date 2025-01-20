@interface PKDeviceVersion
+ (BOOL)supportsSecureCoding;
+ (id)fromCurrentDeviceVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceVersion:(id)a3;
- (NSString)deviceClass;
- (NSString)generation;
- (NSString)model;
- (PKDeviceVersion)companion;
- (PKDeviceVersion)initWithCoder:(id)a3;
- (PKDeviceVersion)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDeviceVersion

- (PKDeviceVersion)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDeviceVersion;
  v5 = [(PKDeviceVersion *)&v22 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"deviceClass"];
  deviceClass = v5->_deviceClass;
  v5->_deviceClass = (NSString *)v6;

  uint64_t v8 = [v4 objectForKeyedSubscript:@"generation"];
  generation = v5->_generation;
  v5->_generation = (NSString *)v8;

  uint64_t v10 = [v4 objectForKeyedSubscript:@"model"];
  model = v5->_model;
  v5->_model = (NSString *)v10;

  v12 = [v4 objectForKeyedSubscript:@"companion"];
  if (v12)
  {
    v13 = [[PKDeviceVersion alloc] initWithDictionary:v12];
    companion = v5->_companion;
    v5->_companion = v13;

    if (!v5->_companion)
    {
      v16 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        __int16 v25 = 2112;
        id v26 = v12;
        id v18 = v20;
        v19 = "Invalid companion for %@: %@";
        goto LABEL_13;
      }
LABEL_14:

      v15 = 0;
      goto LABEL_15;
    }
  }
  if (!v5->_deviceClass || !v5->_generation || !v5->_model)
  {
    v16 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v4;
      id v18 = v17;
      v19 = "Invalid %@: %@";
LABEL_13:
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }

LABEL_8:
  v15 = v5;
LABEL_15:

  return v15;
}

+ (id)fromCurrentDeviceVersion
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = PKDeviceClass();
  id v4 = PKProductType();
  [v2 setObject:v3 forKeyedSubscript:@"deviceClass"];
  [v2 setObject:v4 forKeyedSubscript:@"model"];
  v5 = v3;
  id v6 = v4;
  v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v6 rangeOfString:v5];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        v17 = v5;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Invalid deviceClass: '%@' for model: '%@'", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v8 = 0;
    }
    else
    {
      v11 = [v7 substringFromIndex:v9 + v10];
      v12 = [v11 componentsSeparatedByString:@","];
      if ([v12 count])
      {
        uint64_t v8 = [v12 firstObject];
      }
      else
      {
        v13 = PKLogFacilityTypeGetObject(0x10uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          v17 = v11;
          __int16 v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Invalid numeric substring: '%@' for model: '%@'", (uint8_t *)&v16, 0x16u);
        }

        uint64_t v8 = 0;
      }
    }
  }

  [v2 setObject:v8 forKeyedSubscript:@"generation"];
  v14 = [[PKDeviceVersion alloc] initWithDictionary:v2];

  return v14;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_generation forKeyedSubscript:@"generation"];
  [v3 setObject:self->_model forKeyedSubscript:@"model"];
  id v4 = [(PKDeviceVersion *)self->_companion asDictionary];
  [v3 setObject:v4 forKeyedSubscript:@"companion"];

  v5 = (void *)[v3 copy];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDeviceVersion;
  v5 = [(PKDeviceVersion *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"deviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"generation"];
    generation = v5->_generation;
    v5->_generation = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companion"];
    companion = v5->_companion;
    v5->_companion = (PKDeviceVersion *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_deviceClass forKey:@"deviceClass"];
  [v5 encodeObject:self->_generation forKey:@"generation"];
  [v5 encodeObject:self->_model forKey:@"model"];
  companion = self->_companion;
  if (companion) {
    [v5 encodeObject:companion forKey:@"companion"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKDeviceVersion allocWithZone:](PKDeviceVersion, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_deviceClass copyWithZone:a3];
  deviceClass = v5->_deviceClass;
  v5->_deviceClass = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_generation copyWithZone:a3];
  generation = v5->_generation;
  v5->_generation = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_model copyWithZone:a3];
  model = v5->_model;
  v5->_model = (NSString *)v10;

  v12 = [(PKDeviceVersion *)self->_companion copyWithZone:a3];
  companion = v5->_companion;
  v5->_companion = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKDeviceVersion *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDeviceVersion *)self isEqualToDeviceVersion:v5];

  return v6;
}

- (BOOL)isEqualToDeviceVersion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_deviceClass;
  uint64_t v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_20;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_21;
    }
  }
  uint64_t v11 = (void *)v4[2];
  BOOL v6 = self->_generation;
  v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_20;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  v14 = (void *)v4[3];
  BOOL v6 = self->_model;
  v15 = v14;
  if (v6 != v15)
  {
    uint64_t v8 = v15;
    if (v6 && v15)
    {
      BOOL v16 = [(NSString *)v6 isEqualToString:v15];

      if (v16) {
        goto LABEL_24;
      }
LABEL_21:
      BOOL v17 = 0;
      goto LABEL_22;
    }
LABEL_20:

    goto LABEL_21;
  }

LABEL_24:
  companion = self->_companion;
  uint64_t v20 = (PKDeviceVersion *)v4[4];
  if (companion && v20) {
    BOOL v17 = -[PKDeviceVersion isEqual:](companion, "isEqual:");
  }
  else {
    BOOL v17 = companion == v20;
  }
LABEL_22:

  return v17;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_deviceClass];
  [v3 safelyAddObject:self->_generation];
  [v3 safelyAddObject:self->_model];
  [v3 safelyAddObject:self->_companion];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"deviceClass: '%@'; ", self->_deviceClass];
  [v3 appendFormat:@"generation: '%@'; ", self->_generation];
  [v3 appendFormat:@"model: '%@'; ", self->_model];
  [v3 appendFormat:@"companion: '%@'; ", self->_companion];
  [v3 appendFormat:@">"];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)generation
{
  return self->_generation;
}

- (NSString)model
{
  return self->_model;
}

- (PKDeviceVersion)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end