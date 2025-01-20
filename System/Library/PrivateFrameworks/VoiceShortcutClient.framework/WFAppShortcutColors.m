@interface WFAppShortcutColors
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultTintColor;
- (WFAppShortcutColors)initWithCoder:(id)a3;
- (WFAppShortcutColors)initWithComplementingColors:(id)a3 tintColor:(id)a4;
- (WFColor)tintColor;
- (WFGradient)backgroundGradient;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppShortcutColors

- (WFColor)tintColor
{
  return self->_tintColor;
}

- (WFGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (BOOL)isDefaultTintColor
{
  return self->_isDefaultTintColor;
}

- (WFAppShortcutColors)initWithComplementingColors:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WFAppShortcutColors;
  v8 = [(WFAppShortcutColors *)&v22 init];
  if (!v8) {
    goto LABEL_11;
  }
  if ([v6 count] == 1)
  {
    v9 = [WFGradient alloc];
    v10 = [v6 objectAtIndexedSubscript:0];
    v11 = v6;
    uint64_t v12 = 0;
LABEL_6:
    v13 = [v11 objectAtIndexedSubscript:v12];
    uint64_t v14 = [(WFGradient *)v9 initWithStartColor:v10 endColor:v13];
    backgroundGradient = v8->_backgroundGradient;
    v8->_backgroundGradient = (WFGradient *)v14;

    goto LABEL_7;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    v9 = [WFGradient alloc];
    v10 = [v6 objectAtIndexedSubscript:0];
    v11 = v6;
    uint64_t v12 = 1;
    goto LABEL_6;
  }
LABEL_7:
  if (v7)
  {
    v16 = (WFColor *)v7;
    char v17 = 0;
    tintColor = v8->_tintColor;
    v8->_tintColor = v16;
  }
  else
  {
    uint64_t v19 = [(WFGradient *)v8->_backgroundGradient baseColor];
    tintColor = v8->_tintColor;
    v8->_tintColor = (WFColor *)v19;
    char v17 = 1;
  }

  v8->_isDefaultTintColor = v17;
  v20 = v8;
LABEL_11:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFAppShortcutColors *)self backgroundGradient];
  [v4 encodeObject:v5 forKey:@"backgroundGradient"];

  id v6 = [(WFAppShortcutColors *)self tintColor];
  [v4 encodeObject:v6 forKey:@"tintColor"];
}

- (WFAppShortcutColors)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAppShortcutColors;
  v5 = [(WFAppShortcutColors *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundGradient"];
    backgroundGradient = v5->_backgroundGradient;
    v5->_backgroundGradient = (WFGradient *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (WFColor *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end