@interface PKDeviceVersionRange
+ (BOOL)supportsSecureCoding;
- (BOOL)_matchesDeviceVersion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceVersionRange:(id)a3;
- (NSArray)models;
- (NSString)maximum;
- (NSString)minimum;
- (PKDeviceVersionRange)companion;
- (PKDeviceVersionRange)initWithCoder:(id)a3;
- (PKDeviceVersionRange)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDeviceVersionRange

- (PKDeviceVersionRange)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDeviceVersionRange;
  v5 = [(PKDeviceVersionRange *)&v20 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 PKStringForKey:@"minimum"];
  minimum = v5->_minimum;
  v5->_minimum = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"maximum"];
  maximum = v5->_maximum;
  v5->_maximum = (NSString *)v8;

  uint64_t v10 = [v4 PKArrayForKey:@"models"];
  models = v5->_models;
  v5->_models = (NSArray *)v10;

  v12 = [v4 PKDictionaryForKey:@"companion"];
  if (v12)
  {
    v13 = [[PKDeviceVersionRange alloc] initWithDictionary:v12];
    companion = v5->_companion;
    v5->_companion = v13;
  }
  if (v5->_minimum || v5->_maximum || v5->_models)
  {

LABEL_8:
    v15 = v5;
    goto LABEL_9;
  }
  v17 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    __int16 v23 = 2112;
    id v24 = v4;
    id v19 = v18;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Invalid %@: %@", buf, 0x16u);
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_minimum forKeyedSubscript:@"minimum"];
  [v3 setObject:self->_maximum forKeyedSubscript:@"maximum"];
  [v3 setObject:self->_models forKeyedSubscript:@"models"];
  id v4 = [(PKDeviceVersionRange *)self->_companion asDictionary];
  [v3 setObject:v4 forKeyedSubscript:@"companion"];

  v5 = (void *)[v3 copy];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDeviceVersionRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKDeviceVersionRange;
  v5 = [(PKDeviceVersionRange *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"minimum"];
    minimum = v5->_minimum;
    v5->_minimum = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"maximum"];
    maximum = v5->_maximum;
    v5->_maximum = (NSString *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v6, 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"models"];
    models = v5->_models;
    v5->_models = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companion"];
    companion = v5->_companion;
    v5->_companion = (PKDeviceVersionRange *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_minimum forKey:@"minimum"];
  [v5 encodeObject:self->_maximum forKey:@"maximum"];
  [v5 encodeObject:self->_models forKey:@"models"];
  companion = self->_companion;
  if (companion) {
    [v5 encodeObject:companion forKey:@"companion"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKDeviceVersionRange allocWithZone:](PKDeviceVersionRange, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_minimum copyWithZone:a3];
  minimum = v5->_minimum;
  v5->_minimum = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_maximum copyWithZone:a3];
  maximum = v5->_maximum;
  v5->_maximum = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_models copyWithZone:a3];
  models = v5->_models;
  v5->_models = (NSArray *)v10;

  uint64_t v12 = [(PKDeviceVersionRange *)self->_companion copyWithZone:a3];
  companion = v5->_companion;
  v5->_companion = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKDeviceVersionRange *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDeviceVersionRange *)self isEqualToDeviceVersionRange:v5];

  return v6;
}

- (BOOL)isEqualToDeviceVersionRange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_minimum;
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
      goto LABEL_7;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_23;
    }
  }
  v11 = (void *)v4[2];
  BOOL v6 = self->_maximum;
  uint64_t v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_16;
  }
  uint64_t v8 = v12;
  if (!v6 || !v12)
  {
LABEL_7:

    goto LABEL_23;
  }
  BOOL v13 = [(NSString *)v6 isEqualToString:v12];

  if (!v13) {
    goto LABEL_23;
  }
LABEL_16:
  models = self->_models;
  v15 = (NSArray *)v4[3];
  if (!models || !v15)
  {
    if (models == v15) {
      goto LABEL_19;
    }
LABEL_23:
    BOOL v18 = 0;
    goto LABEL_24;
  }
  if ((-[NSArray isEqual:](models, "isEqual:") & 1) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  companion = self->_companion;
  objc_super v17 = (PKDeviceVersionRange *)v4[4];
  if (companion && v17) {
    BOOL v18 = -[PKDeviceVersionRange isEqual:](companion, "isEqual:");
  }
  else {
    BOOL v18 = companion == v17;
  }
LABEL_24:

  return v18;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_minimum];
  [v3 safelyAddObject:self->_maximum];
  [v3 safelyAddObject:self->_models];
  [v3 safelyAddObject:self->_companion];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)_matchesDeviceVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDeviceVersionRange *)self models];

  if (v5)
  {
    BOOL v6 = [(PKDeviceVersionRange *)self models];
    uint64_t v7 = [v4 model];
    char v8 = [v6 containsObject:v7];
  }
  else
  {
    char v8 = 0;
  }
  uint64_t v9 = [(PKDeviceVersionRange *)self minimum];

  uint64_t v10 = [(PKDeviceVersionRange *)self maximum];

  if (v8) {
    goto LABEL_5;
  }
  v16 = [v4 generation];

  char v15 = 0;
  if (v16 && v9 | v10)
  {
    objc_super v17 = [v4 generation];
    uint64_t v18 = [v17 integerValue];

    id v19 = [(PKDeviceVersionRange *)self minimum];
    uint64_t v20 = [v19 integerValue];

    v21 = [(PKDeviceVersionRange *)self maximum];
    uint64_t v22 = [v21 integerValue];

    if (!v9 || !v10)
    {
      if (v9)
      {
        if (v18 < v20) {
          goto LABEL_20;
        }
      }
      else if (v18 > v22)
      {
        goto LABEL_20;
      }
LABEL_5:
      v11 = [(PKDeviceVersionRange *)self companion];

      if (!v11)
      {
        char v15 = 1;
        goto LABEL_21;
      }
      uint64_t v12 = [v4 companion];

      if (v12)
      {
        BOOL v13 = [(PKDeviceVersionRange *)self companion];
        uint64_t v14 = [v4 companion];
        char v15 = [v13 _matchesDeviceVersion:v14];

        goto LABEL_21;
      }
LABEL_20:
      char v15 = 0;
      goto LABEL_21;
    }
    char v15 = 0;
    if (v18 >= v20 && v18 <= v22) {
      goto LABEL_5;
    }
  }
LABEL_21:

  return v15;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"minimum: '%@'; ", self->_minimum];
  [v3 appendFormat:@"maximum: '%@'; ", self->_maximum];
  [v3 appendFormat:@"models: '%@'; ", self->_models];
  [v3 appendFormat:@"companion: '%@'; ", self->_companion];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)minimum
{
  return self->_minimum;
}

- (NSString)maximum
{
  return self->_maximum;
}

- (NSArray)models
{
  return self->_models;
}

- (PKDeviceVersionRange)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

@end