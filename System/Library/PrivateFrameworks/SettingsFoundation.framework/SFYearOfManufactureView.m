@interface SFYearOfManufactureView
- (SFYearOfManufactureView)init;
- (SFYearOfManufactureView)initWithFrame:(CGRect)a3;
- (void)render;
@end

@implementation SFYearOfManufactureView

- (SFYearOfManufactureView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFYearOfManufactureView;
  v3 = -[SFYearOfManufactureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFYearOfManufactureView *)v3 render];
  }
  return v4;
}

- (SFYearOfManufactureView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFYearOfManufactureView;
  v2 = [(SFYearOfManufactureView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFYearOfManufactureView *)v2 render];
  }
  return v3;
}

- (void)render
{
  v24[4] = *MEMORY[0x263EF8340];
  v3 = [(SFYearOfManufactureView *)self subviews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SFYearOfManufactureView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = objc_msgSend(v5, "sf_yearOfManufacture");

    id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v6)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"製造年份 %lu", v6);
      [v7 setText:v8];

      v9 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
      [v7 setFont:v9];
    }
    [(SFYearOfManufactureView *)self addSubview:v7];
    v19 = (void *)MEMORY[0x263F08938];
    v23 = [(SFYearOfManufactureView *)self leadingAnchor];
    v22 = [v7 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v24[0] = v21;
    v20 = [(SFYearOfManufactureView *)self trailingAnchor];
    v10 = [v7 trailingAnchor];
    v11 = [v20 constraintEqualToAnchor:v10];
    v24[1] = v11;
    v12 = [v7 topAnchor];
    v13 = [(SFYearOfManufactureView *)self topAnchor];
    v14 = [v12 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];
    v24[2] = v14;
    v15 = [(SFYearOfManufactureView *)self bottomAnchor];
    v16 = [v7 bottomAnchor];
    v17 = [v15 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
    v24[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    [v19 activateConstraints:v18];
  }
}

@end