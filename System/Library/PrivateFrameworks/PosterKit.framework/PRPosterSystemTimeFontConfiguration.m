@interface PRPosterSystemTimeFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)defaultTimeFontIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemItem;
- (NSString)timeFontIdentifier;
- (PRPosterSystemTimeFontConfiguration)init;
- (PRPosterSystemTimeFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterSystemTimeFontConfiguration)initWithCoder:(id)a3;
- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3;
- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 systemItem:(BOOL)a4;
- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5;
- (PRPosterSystemTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3;
- (PRVariantWeightRange)_validWeightRangeForTimeFontIdentifier:(id)a3;
- (double)_defaultWeightForTimeFontIdentifier:(id)a3;
- (double)weight;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterSystemTimeFontConfiguration

+ (id)defaultTimeFontIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "pr_defaultTimeFontIdentifier");
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3
{
  return [(PRPosterSystemTimeFontConfiguration *)self initWithTimeFontIdentifier:a3 systemItem:0];
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 systemItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PRPosterSystemTimeFontConfiguration *)self _defaultWeightForTimeFontIdentifier:v6];
  v7 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, v4);

  return v7;
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PRPosterSystemTimeFontConfiguration;
  v9 = [(PRPosterTimeFontConfiguration *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    timeFontConfiguration = v9->_timeFontConfiguration;
    v9->_timeFontConfiguration = (PRTimeFontConfiguration *)v10;

    unint64_t v12 = [(PRPosterSystemTimeFontConfiguration *)v9 _validWeightRangeForTimeFontIdentifier:v8];
    unint64_t v14 = v13;
    if (BSFloatIsZero())
    {
      [(PRPosterSystemTimeFontConfiguration *)v9 _defaultWeightForTimeFontIdentifier:v8];
      a4 = v15;
    }
    double v16 = (double)v14;
    if (a4 < (double)v14) {
      double v16 = a4;
    }
    if (v16 < (double)v12) {
      double v16 = (double)v12;
    }
    *(double *)&v9->_timeFontIdentifier = v16;
    *(&v9->super._systemItem + 1) = a5;
  }

  return v9;
}

- (PRPosterSystemTimeFontConfiguration)init
{
  v3 = [(id)objc_opt_class() defaultTimeFontIdentifier];
  BOOL v4 = [(PRPosterSystemTimeFontConfiguration *)self initWithTimeFontIdentifier:v3];

  return v4;
}

- (PRPosterSystemTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PRPosterTimeFontConfiguration.m", 182, @"Invalid parameter not satisfying: %@", @"extensionBundleURL != nil" object file lineNumber description];
  }
  id v6 = *(void **)&self->_systemItem;
  if (!v6)
  {
    v7 = [PRTimeFontConfiguration alloc];
    id v8 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
    [(PRPosterSystemTimeFontConfiguration *)self weight];
    uint64_t v9 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](v7, "initWithTimeFontIdentifier:weight:", v8);
    uint64_t v10 = *(void **)&self->_systemItem;
    *(void *)&self->_systemItem = v9;

    id v6 = *(void **)&self->_systemItem;
  }
  v11 = v6;

  return v11;
}

- (id)uniqueIdentifier
{
  v3 = NSString;
  BOOL v4 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
  [(PRPosterSystemTimeFontConfiguration *)self weight];
  id v6 = [v3 stringWithFormat:@"%@ - %f", v4, v5];

  return v6;
}

- (BOOL)isSystemItem
{
  return *(&self->super._systemItem + 1);
}

- (PRVariantWeightRange)_validWeightRangeForTimeFontIdentifier:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithTimeFontIdentifier:", a3);
  uint64_t v4 = objc_msgSend(v3, "pr_variantWeightRange");
  unint64_t v6 = v5;

  unint64_t v7 = v4;
  unint64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)_defaultWeightForTimeFontIdentifier:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithTimeFontIdentifier:", a3);
  double v4 = (double)(unint64_t)objc_msgSend(v3, "pr_variantWeight");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PRPosterSystemTimeFontConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v7 = v4;
      unint64_t v8 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
      uint64_t v9 = [(PRPosterSystemTimeFontConfiguration *)v7 timeFontIdentifier];
      int v10 = BSEqualObjects();

      if (v10)
      {
        [(PRPosterSystemTimeFontConfiguration *)self weight];
        [(PRPosterSystemTimeFontConfiguration *)v7 weight];
        char v11 = BSFloatEqualToFloat();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  double v4 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
  id v5 = (id)[v3 appendString:v4];

  [(PRPosterSystemTimeFontConfiguration *)self weight];
  id v6 = (id)objc_msgSend(v3, "appendDouble:");
  unint64_t v7 = [v3 hash];

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  double v4 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
  [v7 appendString:v4 withName:@"timeFontIdentifier"];

  [(PRPosterSystemTimeFontConfiguration *)self weight];
  id v5 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", @"weight", 5);
  id v6 = (id)objc_msgSend(v7, "appendBool:withName:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  double v4 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
  [v7 encodeObject:v4 forKey:@"timeFontIdentifier"];

  id v5 = NSNumber;
  [(PRPosterSystemTimeFontConfiguration *)self weight];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v7 encodeObject:v6 forKey:@"weight"];

  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

- (PRPosterSystemTimeFontConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"timeFontIdentifier"];

  if (!v6)
  {
    id v6 = [(id)objc_opt_class() defaultTimeFontIdentifier];
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
  unint64_t v8 = v7;
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [(PRPosterSystemTimeFontConfiguration *)self _defaultWeightForTimeFontIdentifier:v6];
  }
  int v10 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, [v4 decodeBoolForKey:@"isSystemItem"], v9);

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(PRPosterSystemTimeFontConfiguration *)self timeFontIdentifier];
  [v7 encodeObject:v4 forKey:@"timeFontIdentifier"];

  id v5 = NSNumber;
  [(PRPosterSystemTimeFontConfiguration *)self weight];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v7 encodeObject:v6 forKey:@"weight"];

  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

- (PRPosterSystemTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"timeFontIdentifier"];

  if (!v6)
  {
    id v6 = [(id)objc_opt_class() defaultTimeFontIdentifier];
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
  unint64_t v8 = v7;
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [(PRPosterSystemTimeFontConfiguration *)self _defaultWeightForTimeFontIdentifier:v6];
  }
  int v10 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, [v4 decodeBoolForKey:@"isSystemItem"], v9);

  return v10;
}

- (NSString)timeFontIdentifier
{
  return (NSString *)&self->_timeFontConfiguration->super.isa;
}

- (double)weight
{
  return *(double *)&self->_timeFontIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
}

@end