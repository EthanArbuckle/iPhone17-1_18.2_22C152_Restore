@interface PRPosterSolidColorHomeScreenAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PREditorColorPickerConfiguration)colorPickerConfiguration;
- (PRPosterColor)color;
- (PRPosterColor)effectiveColor;
- (PRPosterSolidColorHomeScreenAppearance)init;
- (PRPosterSolidColorHomeScreenAppearance)initWithBSXPCCoder:(id)a3;
- (PRPosterSolidColorHomeScreenAppearance)initWithCoder:(id)a3;
- (PRPosterSolidColorHomeScreenAppearance)initWithColor:(id)a3 colorPickerConfiguration:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterSolidColorHomeScreenAppearance

- (PRPosterSolidColorHomeScreenAppearance)initWithColor:(id)a3 colorPickerConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterSolidColorHomeScreenAppearance;
  v8 = [(PRPosterSolidColorHomeScreenAppearance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    color = v8->_color;
    v8->_color = (PRPosterColor *)v9;

    v11 = (PREditorColorPickerConfiguration *)v7;
    if (!v11)
    {
      v11 = objc_alloc_init(PREditorColorPickerConfiguration);
      [(PREditorColorPickerConfiguration *)v11 setIdentifier:@"solidHomeScreenAppearance"];
    }
    colorPickerConfiguration = v8->_colorPickerConfiguration;
    v8->_colorPickerConfiguration = v11;
  }
  return v8;
}

- (PRPosterSolidColorHomeScreenAppearance)init
{
  v3 = objc_alloc_init(PREditorColorPickerConfiguration);
  v4 = [(PRPosterSolidColorHomeScreenAppearance *)self initWithColor:0 colorPickerConfiguration:v3];

  return v4;
}

- (PRPosterColor)effectiveColor
{
  v3 = [(PRPosterSolidColorHomeScreenAppearance *)self color];
  if (!v3)
  {
    v4 = [(PRPosterSolidColorHomeScreenAppearance *)self colorPickerConfiguration];
    v3 = [v4 selectedColor];

    if (!v3)
    {
      v5 = [PRPosterColor alloc];
      id v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.984313725 green:0.921568627 blue:0.48627451 alpha:1.0];
      v3 = [(PRPosterColor *)v5 initWithColor:v6];
    }
  }
  id v7 = (void *)[(PRPosterColor *)v3 copy];

  return (PRPosterColor *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterSolidColorHomeScreenAppearance *)a3;
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
  uint64_t v9 = __53__PRPosterSolidColorHomeScreenAppearance_description__block_invoke;
  v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  char v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __53__PRPosterSolidColorHomeScreenAppearance_description__block_invoke(uint64_t a1)
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
  char v5 = [(PRPosterSolidColorHomeScreenAppearance *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  id v6 = [(PRPosterSolidColorHomeScreenAppearance *)self colorPickerConfiguration];
  [v4 encodeObject:v6 forKey:@"colorPickerConfiguration"];
}

- (PRPosterSolidColorHomeScreenAppearance)initWithCoder:(id)a3
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
  uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"colorPickerConfiguration"];

  v10 = [(PRPosterSolidColorHomeScreenAppearance *)self initWithColor:v5 colorPickerConfiguration:v9];
  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(PRPosterSolidColorHomeScreenAppearance *)self color];
  [v4 encodeObject:v5 forKey:@"color"];

  id v6 = [(PRPosterSolidColorHomeScreenAppearance *)self colorPickerConfiguration];
  [v4 encodeObject:v6 forKey:@"colorPickerConfiguration"];
}

- (PRPosterSolidColorHomeScreenAppearance)initWithBSXPCCoder:(id)a3
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
  uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"colorPickerConfiguration"];

  v10 = [(PRPosterSolidColorHomeScreenAppearance *)self initWithColor:v5 colorPickerConfiguration:v9];
  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PRPosterSolidColorHomeScreenAppearance *)self color];
  id v5 = (id)[v8 appendObject:v4 withName:@"color"];

  id v6 = [(PRPosterSolidColorHomeScreenAppearance *)self colorPickerConfiguration];
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