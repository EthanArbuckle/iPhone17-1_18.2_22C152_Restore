@interface SFMonthAndYearOfManufactureView
- (SFMonthAndYearOfManufactureView)init;
- (SFMonthAndYearOfManufactureView)initWithFrame:(CGRect)a3;
- (id)labelText;
- (void)render;
@end

@implementation SFMonthAndYearOfManufactureView

- (SFMonthAndYearOfManufactureView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFMonthAndYearOfManufactureView;
  v3 = -[SFMonthAndYearOfManufactureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFMonthAndYearOfManufactureView *)v3 render];
  }
  return v4;
}

- (SFMonthAndYearOfManufactureView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFMonthAndYearOfManufactureView;
  v2 = [(SFMonthAndYearOfManufactureView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFMonthAndYearOfManufactureView *)v2 render];
  }
  return v3;
}

- (void)render
{
  v23[4] = *MEMORY[0x263EF8340];
  v3 = [(SFMonthAndYearOfManufactureView *)self subviews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SFMonthAndYearOfManufactureView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = [(SFMonthAndYearOfManufactureView *)self labelText];
    if (v6)
    {
      [v5 setText:v6];
      v7 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
      [v5 setFont:v7];
    }
    [(SFMonthAndYearOfManufactureView *)self addSubview:v5];
    v17 = (void *)MEMORY[0x263F08938];
    v22 = [(SFMonthAndYearOfManufactureView *)self leadingAnchor];
    v21 = [v5 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v23[0] = v20;
    v19 = [(SFMonthAndYearOfManufactureView *)self trailingAnchor];
    v8 = [v5 trailingAnchor];
    v9 = [v19 constraintEqualToAnchor:v8];
    v23[1] = v9;
    v10 = [v5 topAnchor];
    v11 = [(SFMonthAndYearOfManufactureView *)self topAnchor];
    [v10 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v11 multiplier:1.0];
    v12 = v18 = (void *)v6;
    v23[2] = v12;
    v13 = [(SFMonthAndYearOfManufactureView *)self bottomAnchor];
    v14 = [v5 bottomAnchor];
    v15 = [v13 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];
    v23[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    [v17 activateConstraints:v16];
  }
}

- (id)labelText
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  v3 = objc_msgSend(v2, "sf_monthAndYearOfManufacture");

  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"year"];

    if (v4)
    {
      id v5 = NSString;
      uint64_t v6 = [v3 objectForKeyedSubscript:@"month"];
      v7 = [v3 objectForKeyedSubscript:@"year"];
      uint64_t v4 = [v5 stringWithFormat:@"제조년월: %@월-%@", v6, v7];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end