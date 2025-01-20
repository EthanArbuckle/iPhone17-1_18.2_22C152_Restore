@interface PKOSVersionRequirementRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOSVersionRequirementRange:(id)a3;
- (BOOL)versionMeetsRequirements:(id)a3 deviceClass:(id)a4;
- (PKOSVersionRequirement)maximum;
- (PKOSVersionRequirement)minimum;
- (PKOSVersionRequirementRange)initWithCoder:(id)a3;
- (PKOSVersionRequirementRange)initWithDictionary:(id)a3;
- (PKOSVersionRequirementRange)initWithMinimumVersion:(id)a3 maximumVersion:(id)a4;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKOSVersionRequirementRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

- (PKOSVersionRequirementRange)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKDictionaryForKey:@"minimum"];
  if (v5) {
    v6 = [[PKOSVersionRequirement alloc] initWithDictionary:v5];
  }
  else {
    v6 = 0;
  }
  v7 = [v4 PKDictionaryForKey:@"maximum"];
  if (v7) {
    v8 = [[PKOSVersionRequirement alloc] initWithDictionary:v7];
  }
  else {
    v8 = 0;
  }
  if ((unint64_t)v6 | (unint64_t)v8)
  {
    self = [(PKOSVersionRequirementRange *)self initWithMinimumVersion:v6 maximumVersion:v8];
    v9 = self;
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Invalid version range", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (PKOSVersionRequirementRange)initWithMinimumVersion:(id)a3 maximumVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKOSVersionRequirementRange;
  v9 = [(PKOSVersionRequirementRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minimum, a3);
    objc_storeStrong((id *)&v10->_maximum, a4);
  }

  return v10;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  minimum = self->_minimum;
  if (minimum)
  {
    v5 = [(PKOSVersionRequirement *)minimum asDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"minimum"];
  }
  maximum = self->_maximum;
  if (maximum)
  {
    id v7 = [(PKOSVersionRequirement *)maximum asDictionary];
    [v3 setObject:v7 forKeyedSubscript:@"maximum"];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (BOOL)versionMeetsRequirements:(id)a3 deviceClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  minimum = self->_minimum;
  if (minimum) {
    BOOL v9 = (unint64_t)([(PKOSVersionRequirement *)minimum compare:v6 deviceClass:v7] + 1) < 2;
  }
  else {
    BOOL v9 = 1;
  }
  maximum = self->_maximum;
  if (maximum) {
    BOOL v11 = [(PKOSVersionRequirement *)maximum compare:v6 deviceClass:v7] == 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v9 && v11)
  {
    if ([v7 isEqualToString:@"Watch"]) {
      BOOL v12 = [(PKOSVersionRequirementRange *)self versionMeetsRequirements:v6 deviceClass:@"iPhone"];
    }
    else {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKOSVersionRequirementRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKOSVersionRequirementRange;
  v5 = [(PKOSVersionRequirementRange *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimum"];
    minimum = v5->_minimum;
    v5->_minimum = (PKOSVersionRequirement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximum"];
    maximum = v5->_maximum;
    v5->_maximum = (PKOSVersionRequirement *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  minimum = self->_minimum;
  id v5 = a3;
  [v5 encodeObject:minimum forKey:@"minimum"];
  [v5 encodeObject:self->_maximum forKey:@"maximum"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKOSVersionRequirementRange allocWithZone:](PKOSVersionRequirementRange, "allocWithZone:") init];
  uint64_t v6 = [(PKOSVersionRequirement *)self->_maximum copyWithZone:a3];
  maximum = v5->_maximum;
  v5->_maximum = v6;

  uint64_t v8 = [(PKOSVersionRequirement *)self->_minimum copyWithZone:a3];
  minimum = v5->_minimum;
  v5->_minimum = v8;

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_minimum];
  [v3 safelyAddObject:self->_maximum];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKOSVersionRequirementRange *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKOSVersionRequirementRange *)self isEqualToOSVersionRequirementRange:v5];

  return v6;
}

- (BOOL)isEqualToOSVersionRequirementRange:(id)a3
{
  unint64_t v4 = a3;
  minimum = self->_minimum;
  BOOL v6 = (PKOSVersionRequirement *)v4[1];
  if (minimum) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKOSVersionRequirement isEqual:](minimum, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_13;
  }
  if (minimum != v6) {
    goto LABEL_7;
  }
LABEL_9:
  maximum = self->_maximum;
  v10 = (PKOSVersionRequirement *)v4[2];
  if (maximum && v10) {
    BOOL v8 = -[PKOSVersionRequirement isEqual:](maximum, "isEqual:");
  }
  else {
    BOOL v8 = maximum == v10;
  }
LABEL_13:

  return v8;
}

- (PKOSVersionRequirement)minimum
{
  return self->_minimum;
}

- (PKOSVersionRequirement)maximum
{
  return self->_maximum;
}

@end