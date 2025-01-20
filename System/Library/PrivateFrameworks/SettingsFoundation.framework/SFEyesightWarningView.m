@interface SFEyesightWarningView
- (SFEyesightWarningView)init;
- (SFEyesightWarningView)initWithFrame:(CGRect)a3;
- (id)labelForString:(id)a3;
- (void)render;
@end

@implementation SFEyesightWarningView

- (SFEyesightWarningView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFEyesightWarningView;
  v3 = -[SFEyesightWarningView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFEyesightWarningView *)v3 render];
  }
  return v4;
}

- (SFEyesightWarningView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFEyesightWarningView;
  v2 = [(SFEyesightWarningView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFEyesightWarningView *)v2 render];
  }
  return v3;
}

- (void)render
{
  v25[2] = *MEMORY[0x263EF8340];
  v3 = [(SFEyesightWarningView *)self subviews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SFEyesightWarningView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
    objc_super v6 = [(SFEyesightWarningView *)self labelForString:@"國家通訊傳播委員會規定，應標示顯示器使用"];
    v25[0] = v6;
    v7 = [(SFEyesightWarningView *)self labelForString:@"相關警語。請參閱警語的簡介指南。"];
    v25[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v9 = (void *)[v5 initWithArrangedSubviews:v8];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setAxis:1];
    [v9 setAlignment:3];
    [(SFEyesightWarningView *)self addSubview:v9];
    v19 = (void *)MEMORY[0x263F08938];
    v23 = [(SFEyesightWarningView *)self leadingAnchor];
    v22 = [v9 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v24[0] = v21;
    v20 = [(SFEyesightWarningView *)self trailingAnchor];
    v10 = [v9 trailingAnchor];
    v11 = [v20 constraintEqualToAnchor:v10];
    v24[1] = v11;
    v12 = [v9 topAnchor];
    v13 = [(SFEyesightWarningView *)self topAnchor];
    v14 = [v12 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];
    v24[2] = v14;
    v15 = [(SFEyesightWarningView *)self bottomAnchor];
    v16 = [v9 bottomAnchor];
    v17 = [v15 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
    v24[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    [v19 activateConstraints:v18];
  }
}

- (id)labelForString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setText:v4];

  objc_super v6 = [MEMORY[0x263F1C658] systemFontOfSize:15.0];
  [v5 setFont:v6];

  return v5;
}

@end