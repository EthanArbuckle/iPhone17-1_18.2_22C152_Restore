@interface WFLockView
- (UINavigationController)belongedNavigationController;
- (WFLockView)initWithFrame:(CGRect)a3;
- (WFLockView)initWithTitle:(id)a3 viewToCover:(id)a4;
- (void)didMoveToSuperview;
- (void)setBelongedNavigationController:(id)a3;
@end

@implementation WFLockView

- (WFLockView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WFLockView;
  v3 = -[WFLockView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WFLockView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v3->titleLabel;
    v3->titleLabel = v5;

    [(UILabel *)v3->titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v3->titleLabel setTextColor:v7];

    [(UILabel *)v3->titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->titleLabel setNumberOfLines:0];
    [(UILabel *)v3->titleLabel setTextAlignment:1];
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
    [(UILabel *)v3->titleLabel setFont:v8];

    [(WFLockView *)v3 addSubview:v3->titleLabel];
    id v9 = objc_alloc(MEMORY[0x263F82828]);
    v10 = [MEMORY[0x263F827E8] systemImageNamed:@"lock.fill"];
    uint64_t v11 = [v9 initWithImage:v10];
    lockImage = v3->lockImage;
    v3->lockImage = (UIImageView *)v11;

    [(UIImageView *)v3->lockImage setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UIImageView *)v3->lockImage setTintColor:v13];

    v14 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:-1 scale:140.0];
    [(UIImageView *)v3->lockImage setPreferredSymbolConfiguration:v14];

    [(WFLockView *)v3 addSubview:v3->lockImage];
    v15 = v3;
  }

  return v3;
}

- (WFLockView)initWithTitle:(id)a3 viewToCover:(id)a4
{
  id v6 = a3;
  [a4 bounds];
  v7 = -[WFLockView initWithFrame:](self, "initWithFrame:");
  [(UILabel *)v7->titleLabel setText:v6];

  return v7;
}

- (void)didMoveToSuperview
{
  v33[8] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)WFLockView;
  [(WFLockView *)&v32 didMoveToSuperview];
  v3 = [(WFLockView *)self superview];

  if (v3)
  {
    v4 = [(WFLockView *)self superview];
    v5 = [v4 safeAreaLayoutGuide];

    v22 = (void *)MEMORY[0x263F08938];
    v31 = [(UILabel *)self->titleLabel centerXAnchor];
    v30 = [v5 centerXAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v33[0] = v29;
    v28 = [(UILabel *)self->titleLabel topAnchor];
    v27 = [v5 centerYAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v33[1] = v26;
    v25 = [(UILabel *)self->titleLabel leadingAnchor];
    v24 = [v5 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v33[2] = v23;
    v21 = [(UILabel *)self->titleLabel trailingAnchor];
    v20 = [v5 trailingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v33[3] = v19;
    v18 = [(UILabel *)self->titleLabel bottomAnchor];
    objc_super v17 = [v5 bottomAnchor];
    v16 = [v18 constraintLessThanOrEqualToAnchor:v17];
    v33[4] = v16;
    v15 = [(UIImageView *)self->lockImage centerXAnchor];
    id v6 = [v5 centerXAnchor];
    v7 = [v15 constraintEqualToAnchor:v6];
    v33[5] = v7;
    v8 = [(UIImageView *)self->lockImage topAnchor];
    id v9 = [v5 topAnchor];
    v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9];
    v33[6] = v10;
    uint64_t v11 = [(UIImageView *)self->lockImage bottomAnchor];
    v12 = [v5 centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v33[7] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:8];
    [v22 activateConstraints:v14];
  }
}

- (UINavigationController)belongedNavigationController
{
  return self->_belongedNavigationController;
}

- (void)setBelongedNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_belongedNavigationController, 0);
  objc_storeStrong((id *)&self->lockImage, 0);
  objc_storeStrong((id *)&self->titleLabel, 0);
}

@end