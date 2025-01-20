@interface PRPosterColorVariationsConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)variationStorage;
- (PRPosterColorVariationsConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterColorVariationsConfiguration)initWithCoder:(id)a3;
- (PRPosterColorVariationsConfiguration)initWithVariationStorage:(id)a3 version:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)version;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterColorVariationsConfiguration

- (PRPosterColorVariationsConfiguration)initWithVariationStorage:(id)a3 version:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRPosterColorVariationsConfiguration;
  v8 = [(PRPosterColorVariationsConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_variationStorage, a3);
    v9->_version = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterColorVariationsConfiguration *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = [(PRPosterColorVariationsConfiguration *)self variationStorage];
      v9 = [(PRPosterColorVariationsConfiguration *)v7 variationStorage];
      int v10 = [v8 isEqualToDictionary:v9];

      if (v10)
      {
        unint64_t v11 = [(PRPosterColorVariationsConfiguration *)self version];
        BOOL v12 = v11 == [(PRPosterColorVariationsConfiguration *)v7 version];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(PRPosterColorVariationsConfiguration *)self variationStorage];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28F98];
  variationStorage = self->_variationStorage;
  id v6 = a3;
  id v8 = [v4 dataWithPropertyList:variationStorage format:200 options:0 error:0];
  [v6 encodeObject:v8 forKey:@"variationStorage"];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  [v6 encodeObject:v7 forKey:@"version"];
}

- (PRPosterColorVariationsConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"variationStorage"];

  if (!v6
    || ([MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0],
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v8 = self;
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"version"];

  if (v9) {
    unint64_t v10 = (unint64_t)(double)(unint64_t)[v9 unsignedIntegerValue];
  }
  else {
    unint64_t v10 = 1;
  }
  unint64_t v11 = [(PRPosterColorVariationsConfiguration *)self initWithVariationStorage:v7 version:v10];

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F98];
  variationStorage = self->_variationStorage;
  id v6 = a3;
  id v8 = [v4 dataWithPropertyList:variationStorage format:200 options:0 error:0];
  [v6 encodeObject:v8 forKey:@"variationStorage"];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterColorVariationsConfiguration version](self, "version"));
  [v6 encodeObject:v7 forKey:@"version"];
}

- (PRPosterColorVariationsConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"variationStorage"];

  if (!v6
    || ([MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0],
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v8 = self;
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"version"];

  if (v9) {
    unint64_t v10 = (unint64_t)(double)(unint64_t)[v9 unsignedIntegerValue];
  }
  else {
    unint64_t v10 = 1;
  }
  unint64_t v11 = [(PRPosterColorVariationsConfiguration *)self initWithVariationStorage:v7 version:v10];

  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = [(PRPosterColorVariationsConfiguration *)self variationStorage];
  id v5 = (id)[v6 appendObject:v4 withName:@"variationStorage"];
}

- (NSDictionary)variationStorage
{
  return self->_variationStorage;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end