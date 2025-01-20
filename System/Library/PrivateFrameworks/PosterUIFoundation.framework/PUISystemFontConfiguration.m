@interface PUISystemFontConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)defaultFontIdentifier;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_validWeightRangeForFontIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemItem;
- (NSString)fontIdentifier;
- (PUISystemFontConfiguration)init;
- (PUISystemFontConfiguration)initWithBSXPCCoder:(id)a3;
- (PUISystemFontConfiguration)initWithCoder:(id)a3;
- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3;
- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 systemItem:(BOOL)a4;
- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5;
- (double)_defaultWeightForFontIdentifier:(id)a3;
- (double)weight;
- (id)fontWithExtensionBundleURL:(id)a3;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUISystemFontConfiguration

+ (id)defaultFontIdentifier
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "pui_defaultFontIdentifier");
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3
{
  return [(PUISystemFontConfiguration *)self initWithFontIdentifier:a3 systemItem:0];
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 systemItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PUISystemFontConfiguration *)self _defaultWeightForFontIdentifier:v6];
  v7 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, v4);

  return v7;
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUISystemFontConfiguration;
  v9 = [(PUIFontConfiguration *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    fontConfiguration = v9->_fontConfiguration;
    v9->_fontConfiguration = (PUIFont *)v10;

    unint64_t v12 = [(PUISystemFontConfiguration *)v9 _validWeightRangeForFontIdentifier:v8];
    unint64_t v14 = v13;
    if (BSFloatIsZero())
    {
      [(PUISystemFontConfiguration *)v9 _defaultWeightForFontIdentifier:v8];
      a4 = v15;
    }
    double v16 = (double)v14;
    if (a4 < (double)v14) {
      double v16 = a4;
    }
    if (v16 < (double)v12) {
      double v16 = (double)v12;
    }
    *(double *)&v9->_fontIdentifier = v16;
    *(&v9->super._systemItem + 1) = a5;
  }

  return v9;
}

- (PUISystemFontConfiguration)init
{
  v3 = [(id)objc_opt_class() defaultFontIdentifier];
  BOOL v4 = [(PUISystemFontConfiguration *)self initWithFontIdentifier:v3];

  return v4;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  BOOL v4 = *(void **)&self->_systemItem;
  if (!v4)
  {
    v5 = [PUIFont alloc];
    id v6 = [(PUISystemFontConfiguration *)self fontIdentifier];
    [(PUISystemFontConfiguration *)self weight];
    uint64_t v7 = -[PUIFont initWithFontIdentifier:weight:](v5, "initWithFontIdentifier:weight:", v6);
    id v8 = *(void **)&self->_systemItem;
    *(void *)&self->_systemItem = v7;

    BOOL v4 = *(void **)&self->_systemItem;
  }
  return v4;
}

- (id)uniqueIdentifier
{
  v3 = NSString;
  BOOL v4 = [(PUISystemFontConfiguration *)self fontIdentifier];
  [(PUISystemFontConfiguration *)self weight];
  id v6 = [v3 stringWithFormat:@"%@ - %f", v4, v5];

  return v6;
}

- (BOOL)isSystemItem
{
  return *(&self->super._systemItem + 1);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_validWeightRangeForFontIdentifier:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPUIFontIdentifier:", a3);
  uint64_t v4 = objc_msgSend(v3, "pui_variantWeightRange");
  unint64_t v6 = v5;

  unint64_t v7 = v4;
  unint64_t v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)_defaultWeightForFontIdentifier:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPUIFontIdentifier:", a3);
  double v4 = (double)(unint64_t)objc_msgSend(v3, "pui_variantWeight");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PUISystemFontConfiguration *)a3;
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
      unint64_t v8 = [(PUISystemFontConfiguration *)self fontIdentifier];
      v9 = [(PUISystemFontConfiguration *)v7 fontIdentifier];
      int v10 = BSEqualObjects();

      if (v10)
      {
        [(PUISystemFontConfiguration *)self weight];
        [(PUISystemFontConfiguration *)v7 weight];
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
  v3 = [MEMORY[0x263F29C60] builder];
  double v4 = [(PUISystemFontConfiguration *)self fontIdentifier];
  id v5 = (id)[v3 appendString:v4];

  [(PUISystemFontConfiguration *)self weight];
  id v6 = (id)objc_msgSend(v3, "appendDouble:");
  unint64_t v7 = [v3 hash];

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  double v4 = [(PUISystemFontConfiguration *)self fontIdentifier];
  [v7 appendString:v4 withName:@"fontIdentifier"];

  [(PUISystemFontConfiguration *)self weight];
  id v5 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", @"weight", 5);
  id v6 = (id)objc_msgSend(v7, "appendBool:withName:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  double v4 = [(PUISystemFontConfiguration *)self fontIdentifier];
  [v7 encodeObject:v4 forKey:@"fontIdentifier"];

  id v5 = NSNumber;
  [(PUISystemFontConfiguration *)self weight];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v7 encodeObject:v6 forKey:@"weight"];

  objc_msgSend(v7, "encodeBool:forKey:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

- (PUISystemFontConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontIdentifier"];

  if (!v6)
  {
    id v6 = [(id)objc_opt_class() defaultFontIdentifier];
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
  unint64_t v8 = v7;
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [(PUISystemFontConfiguration *)self _defaultWeightForFontIdentifier:v6];
  }
  int v10 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, [v4 decodeBoolForKey:@"isSystemItem"], v9);

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(PUISystemFontConfiguration *)self fontIdentifier];
  [v7 encodeObject:v4 forKey:@"fontIdentifier"];

  id v5 = NSNumber;
  [(PUISystemFontConfiguration *)self weight];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v7 encodeObject:v6 forKey:@"weight"];

  objc_msgSend(v7, "encodeBool:forKey:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), @"isSystemItem");
}

- (PUISystemFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontIdentifier"];

  if (!v6)
  {
    id v6 = [(id)objc_opt_class() defaultFontIdentifier];
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weight"];
  unint64_t v8 = v7;
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [(PUISystemFontConfiguration *)self _defaultWeightForFontIdentifier:v6];
  }
  int v10 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, [v4 decodeBoolForKey:@"isSystemItem"], v9);

  return v10;
}

- (NSString)fontIdentifier
{
  return (NSString *)&self->_fontConfiguration->super.isa;
}

- (double)weight
{
  return *(double *)&self->_fontIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontConfiguration, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
}

@end