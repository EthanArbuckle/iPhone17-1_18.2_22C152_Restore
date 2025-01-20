@interface SFAlertMarkView
- (SFAlertMarkView)init;
- (SFAlertMarkView)initWithFrame:(CGRect)a3;
- (id)alertImage;
- (id)labelForString:(id)a3;
- (void)render;
@end

@implementation SFAlertMarkView

- (SFAlertMarkView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFAlertMarkView;
  v3 = -[SFAlertMarkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFAlertMarkView *)v3 render];
  }
  return v4;
}

- (SFAlertMarkView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFAlertMarkView;
  v2 = [(SFAlertMarkView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFAlertMarkView *)v2 render];
  }
  return v3;
}

- (void)render
{
  v26[3] = *MEMORY[0x263EF8340];
  v3 = [(SFAlertMarkView *)self subviews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SFAlertMarkView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
    objc_super v6 = [(SFAlertMarkView *)self alertImage];
    v26[0] = v6;
    v7 = [(SFAlertMarkView *)self labelForString:@"Lihat Panduan Pengguna untuk"];
    v26[1] = v7;
    v8 = [(SFAlertMarkView *)self labelForString:@"Penggunaan Yang Tepat"];
    v26[2] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
    v10 = (void *)[v5 initWithArrangedSubviews:v9];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAxis:1];
    [v10 setAlignment:3];
    [(SFAlertMarkView *)self addSubview:v10];
    v20 = (void *)MEMORY[0x263F08938];
    v24 = [(SFAlertMarkView *)self leadingAnchor];
    v23 = [v10 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v25[0] = v22;
    v21 = [(SFAlertMarkView *)self trailingAnchor];
    v11 = [v10 trailingAnchor];
    v12 = [v21 constraintEqualToAnchor:v11];
    v25[1] = v12;
    v13 = [v10 topAnchor];
    v14 = [(SFAlertMarkView *)self topAnchor];
    v15 = [v13 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v14 multiplier:1.0];
    v25[2] = v15;
    v16 = [(SFAlertMarkView *)self bottomAnchor];
    v17 = [v10 bottomAnchor];
    v18 = [v16 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v17 multiplier:1.0];
    v25[3] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [v20 activateConstraints:v19];
  }
}

- (id)alertImage
{
  v2 = [MEMORY[0x263F1C6C8] configurationWithPointSize:3 weight:3 scale:42.0];
  v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle" withConfiguration:v2];
  uint64_t v4 = [v3 imageWithRenderingMode:2];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [MEMORY[0x263F1C550] labelColor];
  [v5 setTintColor:v6];

  return v5;
}

- (id)labelForString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setText:v4];

  objc_super v6 = [MEMORY[0x263F1C658] boldSystemFontOfSize:13.0];
  [v5 setFont:v6];

  return v5;
}

@end