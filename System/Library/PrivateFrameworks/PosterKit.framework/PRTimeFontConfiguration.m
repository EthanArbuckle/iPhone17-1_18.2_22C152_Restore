@interface PRTimeFontConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)timeFontIdentifier;
- (PRTimeFontConfiguration)init;
- (PRTimeFontConfiguration)initWithCustomFont:(id)a3;
- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3;
- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4;
- (UIFont)customFont;
- (UIFont)effectiveFont;
- (double)_defaultWeightForTimeFontIdentifier:(id)a3;
- (double)weight;
- (id)description;
- (id)effectiveFontForRole:(id)a3;
- (id)effectiveFontForRole:(id)a3 ignoringWeight:(BOOL)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation PRTimeFontConfiguration

- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3
{
  id v4 = a3;
  [(PRTimeFontConfiguration *)self _defaultWeightForTimeFontIdentifier:v4];
  v5 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](self, "initWithTimeFontIdentifier:weight:", v4);

  return v5;
}

- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRTimeFontConfiguration;
  v7 = [(PRTimeFontConfiguration *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    timeFontIdentifier = v7->_timeFontIdentifier;
    v7->_timeFontIdentifier = (NSString *)v8;

    v7->_weight = a4;
  }

  return v7;
}

- (PRTimeFontConfiguration)initWithCustomFont:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRTimeFontConfiguration;
  id v6 = [(PRTimeFontConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_customFont, a3);
  }

  return v7;
}

- (PRTimeFontConfiguration)init
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_defaultTimeFontIdentifier");
  id v4 = [(PRTimeFontConfiguration *)self initWithTimeFontIdentifier:v3];

  return v4;
}

- (UIFont)effectiveFont
{
  return (UIFont *)[(PRTimeFontConfiguration *)self effectiveFontForRole:@"PRPosterRoleLockScreen"];
}

- (id)effectiveFontForRole:(id)a3
{
  return [(PRTimeFontConfiguration *)self effectiveFontForRole:a3 ignoringWeight:0];
}

- (id)effectiveFontForRole:(id)a3 ignoringWeight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PRTimeFontConfiguration *)self customFont];

  if (v7)
  {
    uint64_t v8 = [(PRTimeFontConfiguration *)self customFont];
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x1E4FB08E0];
    v10 = [(PRTimeFontConfiguration *)self timeFontIdentifier];
    objc_super v11 = objc_msgSend(v9, "pr_fontWithTimeFontIdentifier:forRole:", v10, v6);

    if (v4)
    {
      id v12 = v11;
    }
    else
    {
      [(PRTimeFontConfiguration *)self weight];
      objc_msgSend(v11, "pr_fontWithVariantWeight:forRole:", (unint64_t)v13, v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v8 = v12;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PRTimeFontConfiguration *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      uint64_t v8 = [(PRTimeFontConfiguration *)self timeFontIdentifier];
      objc_super v9 = [(PRTimeFontConfiguration *)v7 timeFontIdentifier];
      int v10 = BSEqualObjects();

      if (v10
        && ([(PRTimeFontConfiguration *)self weight],
            [(PRTimeFontConfiguration *)v7 weight],
            BSFloatEqualToFloat()))
      {
        objc_super v11 = [(PRTimeFontConfiguration *)self customFont];
        id v12 = [(PRTimeFontConfiguration *)v7 customFont];
        char v13 = BSEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  BOOL v4 = [(PRTimeFontConfiguration *)self timeFontIdentifier];
  id v5 = (id)[v3 appendString:v4];

  [(PRTimeFontConfiguration *)self weight];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  v7 = [(PRTimeFontConfiguration *)self customFont];
  id v8 = (id)[v3 appendObject:v7];

  unint64_t v9 = [v3 hash];
  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __38__PRTimeFontConfiguration_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  objc_super v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __38__PRTimeFontConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PRTimeFontConfiguration *)self timeFontIdentifier];
  [v8 appendString:v4 withName:@"timeFontIdentifier" skipIfEmpty:1];

  [(PRTimeFontConfiguration *)self weight];
  id v5 = (id)objc_msgSend(v8, "appendFloat:withName:", @"weight");
  id v6 = [(PRTimeFontConfiguration *)self customFont];
  id v7 = (id)[v8 appendObject:v6 withName:@"customFont" skipIfNil:1];
}

- (double)_defaultWeightForTimeFontIdentifier:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithTimeFontIdentifier:", a3);
  double v4 = (double)(unint64_t)objc_msgSend(v3, "pr_variantWeight");

  return v4;
}

- (NSString)timeFontIdentifier
{
  return self->_timeFontIdentifier;
}

- (double)weight
{
  return self->_weight;
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_timeFontIdentifier, 0);
}

@end