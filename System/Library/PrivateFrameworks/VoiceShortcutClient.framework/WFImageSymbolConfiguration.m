@interface WFImageSymbolConfiguration
+ (BOOL)supportsSecureCoding;
+ (WFImageSymbolConfiguration)configurationWithNSImageSymbolConfiguration:(id)a3;
+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3;
+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3 hierarchicalColors:(id)a4;
+ (WFImageSymbolConfiguration)configurationWithUIImageSymbolConfiguration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)hierarchicalColors;
- (WFImageSymbolConfiguration)initWithCoder:(id)a3;
- (WFImageSymbolConfiguration)initWithPlatformSymbolConfiguration:(id)a3;
- (WFImageSymbolConfiguration)initWithPointSize:(double)a3 hierarchicalColors:(id)a4;
- (double)pointSize;
- (id)platformHierarchicalColors;
- (id)platformSymbolConfiguration;
- (id)uiKitConfiguration;
- (int64_t)platformWeight;
- (unint64_t)representationType;
- (unint64_t)weight;
- (void)encodeWithCoder:(id)a3;
- (void)setWeight:(unint64_t)a3;
@end

@implementation WFImageSymbolConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_platformSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_hierarchicalColors, 0);
}

- (id)platformSymbolConfiguration
{
  return self->_platformSymbolConfiguration;
}

- (unint64_t)representationType
{
  return self->_representationType;
}

- (void)setWeight:(unint64_t)a3
{
  self->_weight = a3;
}

- (unint64_t)weight
{
  return self->_weight;
}

- (NSArray)hierarchicalColors
{
  return self->_hierarchicalColors;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFImageSymbolConfiguration representationType](self, "representationType"), @"representationType");
  v4 = [(WFImageSymbolConfiguration *)self platformSymbolConfiguration];
  [v7 encodeObject:v4 forKey:@"platformSymbolConfiguration"];

  [(WFImageSymbolConfiguration *)self pointSize];
  *(float *)&double v5 = v5;
  [v7 encodeFloat:@"pointSize" forKey:v5];
  v6 = [(WFImageSymbolConfiguration *)self hierarchicalColors];
  [v7 encodeObject:v6 forKey:@"hierarchicalColors"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFImageSymbolConfiguration weight](self, "weight"), @"weight");
}

- (WFImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"representationType"];
  if (!v5)
  {
    [v4 decodeFloatForKey:@"pointSize"];
    double v9 = v8;
    v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"hierarchicalColors"];
    id v7 = [(WFImageSymbolConfiguration *)self initWithPointSize:v6 hierarchicalColors:v9];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = [v4 decodeObjectOfClass:getUIImageSymbolConfigurationClass() forKey:@"platformSymbolConfiguration"];
    id v7 = [(WFImageSymbolConfiguration *)self initWithPlatformSymbolConfiguration:v6];
LABEL_5:
    self = v7;
  }
  self->_weight = [v4 decodeIntegerForKey:@"weight"];

  return self;
}

- (id)platformHierarchicalColors
{
  v2 = [(WFImageSymbolConfiguration *)self hierarchicalColors];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_4870);

  return v3;
}

uint64_t __56__WFImageSymbolConfiguration_platformHierarchicalColors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 platformColor];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFImageSymbolConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [(WFImageSymbolConfiguration *)self platformSymbolConfiguration];
      if (v7
        && (float v8 = (void *)v7,
            [(WFImageSymbolConfiguration *)v6 platformSymbolConfiguration],
            double v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        v10 = [(WFImageSymbolConfiguration *)self platformSymbolConfiguration];
        v11 = [(WFImageSymbolConfiguration *)v6 platformSymbolConfiguration];
        char v12 = [v10 isEqualToConfiguration:v11];
      }
      else
      {
        [(WFImageSymbolConfiguration *)v6 pointSize];
        double v14 = v13;
        [(WFImageSymbolConfiguration *)self pointSize];
        char v12 = v14 == v15;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (id)uiKitConfiguration
{
  v3 = [(WFImageSymbolConfiguration *)self platformSymbolConfiguration];

  if (v3)
  {
    id v4 = [(WFImageSymbolConfiguration *)self platformSymbolConfiguration];
  }
  else
  {
    Class UIImageSymbolConfigurationClass = getUIImageSymbolConfigurationClass();
    [(WFImageSymbolConfiguration *)self pointSize];
    id v4 = [(objc_class *)UIImageSymbolConfigurationClass configurationWithPointSize:[(WFImageSymbolConfiguration *)self platformWeight] weight:v6];
    uint64_t v7 = [(WFImageSymbolConfiguration *)self hierarchicalColors];

    if (v7)
    {
      float v8 = [(WFImageSymbolConfiguration *)self platformHierarchicalColors];
      double v9 = [(objc_class *)getUIImageSymbolConfigurationClass() _configurationWithHierarchicalColors:v8];
      uint64_t v10 = [v4 configurationByApplyingConfiguration:v9];

      id v4 = (void *)v10;
    }
  }
  return v4;
}

- (int64_t)platformWeight
{
  unint64_t v2 = [(WFImageSymbolConfiguration *)self weight];
  if (v2 - 1 > 7) {
    return 4;
  }
  else {
    return qword_1B3D88AC0[v2 - 1];
  }
}

- (WFImageSymbolConfiguration)initWithPlatformSymbolConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFImageSymbolConfiguration;
  double v6 = [(WFImageSymbolConfiguration *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_representationType = 1;
    objc_storeStrong(&v6->_platformSymbolConfiguration, a3);
    v7->_pointSize = 0.0;
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
    hierarchicalColors = v7->_hierarchicalColors;
    v7->_hierarchicalColors = (NSArray *)v8;

    v7->_weight = 0;
    uint64_t v10 = v7;
  }

  return v7;
}

- (WFImageSymbolConfiguration)initWithPointSize:(double)a3 hierarchicalColors:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFImageSymbolConfiguration;
  uint64_t v7 = [(WFImageSymbolConfiguration *)&v14 init];
  uint64_t v8 = v7;
  if (v7)
  {
    id platformSymbolConfiguration = v7->_platformSymbolConfiguration;
    v7->_representationType = 0;
    v7->_id platformSymbolConfiguration = 0;

    v8->_pointSize = a3;
    uint64_t v10 = [v6 copy];
    hierarchicalColors = v8->_hierarchicalColors;
    v8->_hierarchicalColors = (NSArray *)v10;

    v8->_weight = 0;
    objc_super v12 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WFImageSymbolConfiguration)configurationWithNSImageSymbolConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPlatformSymbolConfiguration:v4];

  return (WFImageSymbolConfiguration *)v5;
}

+ (WFImageSymbolConfiguration)configurationWithUIImageSymbolConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPlatformSymbolConfiguration:v4];

  return (WFImageSymbolConfiguration *)v5;
}

+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3 hierarchicalColors:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithPointSize:v6 hierarchicalColors:a3];

  return (WFImageSymbolConfiguration *)v7;
}

+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPointSize:0 hierarchicalColors:a3];
  return (WFImageSymbolConfiguration *)v3;
}

@end