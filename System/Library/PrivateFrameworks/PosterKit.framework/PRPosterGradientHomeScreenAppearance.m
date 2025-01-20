@interface PRPosterGradientHomeScreenAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)gradientColors;
- (PREditorColorPickerConfiguration)colorPickerConfiguration;
- (PRPosterColor)color;
- (PRPosterColor)effectiveColor;
- (PRPosterGradientHomeScreenAppearance)init;
- (PRPosterGradientHomeScreenAppearance)initWithBSXPCCoder:(id)a3;
- (PRPosterGradientHomeScreenAppearance)initWithCoder:(id)a3;
- (PRPosterGradientHomeScreenAppearance)initWithColor:(id)a3 colorPickerConfiguration:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterGradientHomeScreenAppearance

- (PRPosterGradientHomeScreenAppearance)initWithColor:(id)a3 colorPickerConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterGradientHomeScreenAppearance;
  v8 = [(PRPosterGradientHomeScreenAppearance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    color = v8->_color;
    v8->_color = (PRPosterColor *)v9;

    v11 = (PREditorColorPickerConfiguration *)v7;
    if (!v11)
    {
      v11 = objc_alloc_init(PREditorColorPickerConfiguration);
      [(PREditorColorPickerConfiguration *)v11 setIdentifier:@"gradientHomeScreenAppearance"];
    }
    colorPickerConfiguration = v8->_colorPickerConfiguration;
    v8->_colorPickerConfiguration = v11;
  }
  return v8;
}

- (PRPosterGradientHomeScreenAppearance)init
{
  v3 = objc_alloc_init(PREditorColorPickerConfiguration);
  v4 = [(PRPosterGradientHomeScreenAppearance *)self initWithColor:0 colorPickerConfiguration:v3];

  return v4;
}

- (PRPosterColor)effectiveColor
{
  v3 = [(PRPosterGradientHomeScreenAppearance *)self color];
  if (!v3)
  {
    v4 = [(PRPosterGradientHomeScreenAppearance *)self colorPickerConfiguration];
    v3 = [v4 selectedColor];

    if (!v3)
    {
      v5 = [PRPosterColor alloc];
      id v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.215686275 green:0.270588235 blue:0.333333333 alpha:1.0];
      v3 = [(PRPosterColor *)v5 initWithColor:v6];
    }
  }
  id v7 = (void *)[(PRPosterColor *)v3 copy];

  return (PRPosterColor *)v7;
}

- (NSArray)gradientColors
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PRPosterGradientHomeScreenAppearance *)self effectiveColor];
  v3 = [v2 color];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.215686275 green:0.270588235 blue:0.333333333 alpha:1.0];
  }
  id v6 = v5;

  double v14 = 0.0;
  double v15 = 0.0;
  double v13 = 0.0;
  [v6 getHue:&v15 saturation:&v14 brightness:&v13 alpha:0];
  if (v15 + -0.06 < 0.0) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  v8 = [MEMORY[0x1E4FB1618] colorWithHue:v15 + -0.06 + v7 saturation:v14 brightness:v13 + 0.0 alpha:1.0];
  v16[0] = v8;
  v16[1] = v6;
  if (v15 + 0.06 > 1.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  v10 = [MEMORY[0x1E4FB1618] colorWithHue:v15 + 0.06 - v9 saturation:v14 brightness:v13 + -0.1 alpha:1.0];
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  return (NSArray *)v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterGradientHomeScreenAppearance *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if (BSEqualObjects())
  {
    char v5 = BSEqualObjects();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PRPosterColor *)self->_color hash];
  return [(PREditorColorPickerConfiguration *)self->_colorPickerConfiguration hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __51__PRPosterGradientHomeScreenAppearance_description__block_invoke;
  v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  char v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __51__PRPosterGradientHomeScreenAppearance_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(PRPosterGradientHomeScreenAppearance *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  id v6 = [(PRPosterGradientHomeScreenAppearance *)self colorPickerConfiguration];
  [v4 encodeObject:v6 forKey:@"colorPickerConfiguration"];
}

- (PRPosterGradientHomeScreenAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
  if (!v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"color"];

    if (v7) {
      char v5 = [[PRPosterColor alloc] initWithColor:v7 preferredStyle:1];
    }
    else {
      char v5 = 0;
    }
  }
  uint64_t v8 = self;
  double v9 = [v4 decodeObjectOfClass:v8 forKey:@"colorPickerConfiguration"];

  v10 = [(PRPosterGradientHomeScreenAppearance *)self initWithColor:v5 colorPickerConfiguration:v9];
  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(PRPosterGradientHomeScreenAppearance *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  id v6 = [(PRPosterGradientHomeScreenAppearance *)self colorPickerConfiguration];
  [v4 encodeObject:v6 forKey:@"colorPickerConfiguration"];
}

- (PRPosterGradientHomeScreenAppearance)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
  if (!v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"color"];

    if (v7) {
      char v5 = [[PRPosterColor alloc] initWithColor:v7 preferredStyle:1];
    }
    else {
      char v5 = 0;
    }
  }
  uint64_t v8 = self;
  double v9 = [v4 decodeObjectOfClass:v8 forKey:@"colorPickerConfiguration"];

  v10 = [(PRPosterGradientHomeScreenAppearance *)self initWithColor:v5 colorPickerConfiguration:v9];
  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PRPosterGradientHomeScreenAppearance *)self color];
  id v5 = (id)[v8 appendObject:v4 withName:@"color"];

  id v6 = [(PRPosterGradientHomeScreenAppearance *)self colorPickerConfiguration];
  id v7 = (id)[v8 appendObject:v6 withName:@"colorPickerConfiguration"];
}

- (PRPosterColor)color
{
  return self->_color;
}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end