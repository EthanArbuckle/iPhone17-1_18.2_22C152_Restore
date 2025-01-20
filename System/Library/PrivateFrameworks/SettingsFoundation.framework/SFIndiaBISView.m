@interface SFIndiaBISView
- (SFIndiaBISView)init;
- (SFIndiaBISView)initWithFrame:(CGRect)a3;
- (void)render;
@end

@implementation SFIndiaBISView

- (SFIndiaBISView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFIndiaBISView;
  v3 = -[SFIndiaBISView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFIndiaBISView *)v3 render];
  }
  return v4;
}

- (SFIndiaBISView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFIndiaBISView;
  v2 = [(SFIndiaBISView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SFIndiaBISView *)v2 render];
  }
  return v3;
}

- (void)render
{
  v32[4] = *MEMORY[0x263EF8340];
  v3 = [(SFIndiaBISView *)self subviews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(SFIndiaBISView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_alloc_init(MEMORY[0x263F1C9B8]);
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setAxis:1];
    [v5 setAlignment:3];
    [(SFIndiaBISView *)self addSubview:v5];
    objc_super v6 = SFIndiaBISRegulatoryImage();
    uint64_t v7 = [v6 imageWithRenderingMode:2];

    v31 = (void *)v7;
    v8 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v7];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x263F1C550] labelColor];
    [v8 setTintColor:v9];

    v30 = v8;
    [v5 addArrangedSubview:v8];
    id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = SFIndiaBISNumber();
    [v10 setText:v11];

    v12 = [v10 text];

    if (!v12) {
      [v10 setText:@"Unknown"];
    }
    v13 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
    [v10 setFont:v13];

    [v5 addArrangedSubview:v10];
    id v14 = objc_alloc_init(MEMORY[0x263F1C768]);

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setText:@"www.bis.gov.in"];
    v15 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
    [v14 setFont:v15];

    [v5 addArrangedSubview:v14];
    v24 = (void *)MEMORY[0x263F08938];
    v29 = [(SFIndiaBISView *)self leadingAnchor];
    v28 = [v5 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    v26 = [(SFIndiaBISView *)self trailingAnchor];
    v25 = [v5 trailingAnchor];
    v16 = [v26 constraintEqualToAnchor:v25];
    v32[1] = v16;
    v17 = [v5 topAnchor];
    v18 = [(SFIndiaBISView *)self topAnchor];
    v19 = [v17 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v18 multiplier:1.0];
    v32[2] = v19;
    v20 = [(SFIndiaBISView *)self bottomAnchor];
    v21 = [v5 bottomAnchor];
    v22 = [v20 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v21 multiplier:1.0];
    v32[3] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
    [v24 activateConstraints:v23];
  }
}

@end