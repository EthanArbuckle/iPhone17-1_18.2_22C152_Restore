@interface WLQRCodeViewController
- (WLQRCode)qrcode;
- (void)initQRCode;
- (void)setQrcode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WLQRCodeViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLQRCodeViewController;
  [(WLQRCodeViewController *)&v4 viewWillAppear:a3];
  [(WLQRCodeViewController *)self initQRCode];
}

- (void)initQRCode
{
  v37[3] = *MEMORY[0x263EF8340];
  if (self->_qrcode && !self->_initialized)
  {
    self->_initialized = 1;
    v3 = [(WLQRCodeViewController *)self view];
    [v3 directionalLayoutMargins];
    double v5 = v4;
    v6 = [(WLQRCodeViewController *)self view];
    [v6 directionalLayoutMargins];
    double v8 = v5 + v7;

    v9 = [(WLQRCodeViewController *)self view];
    [v9 frame];
    double v11 = v10;

    v12 = [(WLQRCodeViewController *)self view];
    [v12 frame];
    double v14 = v13;

    if (v11 >= v14) {
      double v15 = v14;
    }
    else {
      double v15 = v11;
    }
    double v16 = v15 - v8;
    v17 = [MEMORY[0x263F82670] currentDevice];
    if ([v17 userInterfaceIdiom]) {
      double v18 = 3.0;
    }
    else {
      double v18 = 1.70000005;
    }

    double v19 = floor(floor((v16 - floor(v16 / v18)) * 0.5) * 0.5);
    v36 = -[WLQRCode createQRCodeImage:](self->_qrcode, "createQRCodeImage:");
    v20 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v36];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(WLQRCodeViewController *)self contentView];
    [v21 addSubview:v20];

    v31 = (void *)MEMORY[0x263F08938];
    v34 = [v20 topAnchor];
    v35 = [(WLQRCodeViewController *)self contentView];
    v33 = [v35 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:v19];
    v37[0] = v32;
    v22 = [v20 bottomAnchor];
    v23 = [(WLQRCodeViewController *)self contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:-v19];
    v37[1] = v25;
    v26 = [v20 centerXAnchor];
    v27 = [(WLQRCodeViewController *)self contentView];
    v28 = [v27 centerXAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v37[2] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
    [v31 activateConstraints:v30];
  }
}

- (WLQRCode)qrcode
{
  return self->_qrcode;
}

- (void)setQrcode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end