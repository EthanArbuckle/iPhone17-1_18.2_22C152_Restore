@interface PNPAirplaneModeView
- (CGSize)intrinsicContentSize;
- (PNPAirplaneModeBluetoothViewDelegate)bluetoothDelegate;
- (PNPAirplaneModeView)initWithFrame:(CGRect)a3;
- (PNPDeviceState)deviceState;
- (id)_applePencilOff;
- (id)_applePencilOn;
- (id)_bluetoothOnString;
- (id)_turnOnString;
- (void)_configureConstraints;
- (void)layoutSubviews;
- (void)setBluetoothDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)turnOnBluetooth:(id)a3;
@end

@implementation PNPAirplaneModeView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PNPAirplaneModeView;
  [(PNPAirplaneModeView *)&v5 layoutSubviews];
  [(UILabel *)self->_deviceNameLabel setText:self->_pencilStatusString];
  [(UILabel *)self->_deviceNameLabel setTextAlignment:1];
  [(UIButton *)self->_turnOnBluetoothButton setTitle:self->_currentString forState:0];
  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  v4 = [MEMORY[0x263F1C550] defaultButtonColor];
  [(UIButton *)turnOnBluetoothButton setTitleColor:v4 forState:0];
}

- (CGSize)intrinsicContentSize
{
  deviceNameLabel = self->_deviceNameLabel;
  [(UILabel *)deviceNameLabel frame];
  -[UILabel sizeThatFits:](deviceNameLabel, "sizeThatFits:", v4, 1.79769313e308);
  double v6 = v5;
  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  [(UIButton *)turnOnBluetoothButton frame];
  -[UIButton sizeThatFits:](turnOnBluetoothButton, "sizeThatFits:", v8, 1.79769313e308);
  double v10 = fmax(fmax(v6, v9) + 60.0, 188.0);
  double v11 = 56.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  [(PNPAirplaneModeView *)self setNeedsLayout];
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPAirplaneModeView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PNPAirplaneModeView;
  v3 = -[PNPAirplaneModeView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  deviceNameLabel = v3->_deviceNameLabel;
  v3->_deviceNameLabel = v4;

  uint64_t v6 = [MEMORY[0x263F1C488] buttonWithType:1];
  turnOnBluetoothButton = v3->_turnOnBluetoothButton;
  v3->_turnOnBluetoothButton = (UIButton *)v6;

  [(UIButton *)v3->_turnOnBluetoothButton addTarget:v3 action:sel_turnOnBluetooth_ forControlEvents:64];
  double v8 = *MEMORY[0x263F81800];
  double v9 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81800]];
  double v10 = [(UIButton *)v3->_turnOnBluetoothButton titleLabel];
  [v10 setFont:v9];

  uint64_t v11 = [(PNPAirplaneModeView *)v3 _turnOnString];
  currentString = v3->_currentString;
  v3->_currentString = (NSString *)v11;

  v13 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  contentAreaView = v3->_contentAreaView;
  v3->_contentAreaView = v13;

  v15 = [MEMORY[0x263F81708] systemFontOfSize:13.0 weight:v8];
  [(UILabel *)v3->_deviceNameLabel setFont:v15];
  [(UILabel *)v3->_deviceNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v3->_contentAreaView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v3->_turnOnBluetoothButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PNPAirplaneModeView *)v3 addSubview:v3->_contentAreaView];
  [(PNPAirplaneModeView *)v3 addSubview:v3->_deviceNameLabel];
  [(PNPAirplaneModeView *)v3 addSubview:v3->_turnOnBluetoothButton];
  uint64_t v16 = [(PNPAirplaneModeView *)v3 _applePencilOff];
  pencilStatusString = v3->_pencilStatusString;
  v3->_pencilStatusString = (NSString *)v16;

  [(PNPAirplaneModeView *)v3 _configureConstraints];
  return v3;
}

- (void)_configureConstraints
{
  id v30 = [MEMORY[0x263EFF980] array];
  v3 = [(UIView *)self->_contentAreaView leadingAnchor];
  double v4 = [(PNPAirplaneModeView *)self leadingAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4 constant:30.0];
  [v30 addObject:v5];

  uint64_t v6 = [(UIView *)self->_contentAreaView trailingAnchor];
  v7 = [(PNPAirplaneModeView *)self trailingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7 constant:-30.0];
  [v30 addObject:v8];

  double v9 = [(UIView *)self->_contentAreaView centerYAnchor];
  double v10 = [(PNPAirplaneModeView *)self centerYAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v30 addObject:v11];

  v12 = [(UILabel *)self->_deviceNameLabel leadingAnchor];
  v13 = [(UIView *)self->_contentAreaView leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v30 addObject:v14];

  v15 = [(UILabel *)self->_deviceNameLabel trailingAnchor];
  uint64_t v16 = [(UIView *)self->_contentAreaView trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v30 addObject:v17];

  v18 = [(UILabel *)self->_deviceNameLabel topAnchor];
  objc_super v19 = [(UIView *)self->_contentAreaView topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:10.0];
  [v30 addObject:v20];

  v21 = [(UIButton *)self->_turnOnBluetoothButton lastBaselineAnchor];
  v22 = [(UILabel *)self->_deviceNameLabel lastBaselineAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:16.0];
  [v30 addObject:v23];

  v24 = [(UIButton *)self->_turnOnBluetoothButton bottomAnchor];
  v25 = [(UIView *)self->_contentAreaView bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v30 addObject:v26];

  v27 = [(UIButton *)self->_turnOnBluetoothButton centerXAnchor];
  v28 = [(UILabel *)self->_deviceNameLabel centerXAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v30 addObject:v29];

  [MEMORY[0x263F08938] activateConstraints:v30];
}

- (void)turnOnBluetooth:(id)a3
{
  double v4 = [(PNPAirplaneModeView *)self _bluetoothOnString];
  currentString = self->_currentString;
  self->_currentString = v4;

  uint64_t v6 = [(PNPAirplaneModeView *)self _applePencilOn];
  pencilStatusString = self->_pencilStatusString;
  self->_pencilStatusString = v6;

  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  double v9 = [MEMORY[0x263F1C550] defaultButtonPressedColor];
  [(UIButton *)turnOnBluetoothButton setTitleColor:v9 forState:0];

  [(UIButton *)self->_turnOnBluetoothButton setUserInteractionEnabled:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothDelegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_bluetoothDelegate);
    [v11 didTapOnBluetoothButton];
  }
  [(PNPAirplaneModeView *)self setNeedsLayout];
}

- (id)_applePencilOff
{
  v2 = PencilPairingUIBundle();
  v3 = [v2 localizedStringForKey:@"APPLE_PENCIL_OFF" value:&stru_26ECD9920 table:0];

  return v3;
}

- (id)_applePencilOn
{
  v2 = PencilPairingUIBundle();
  v3 = [v2 localizedStringForKey:@"APPLE_PENCIL_ON" value:&stru_26ECD9920 table:0];

  return v3;
}

- (id)_turnOnString
{
  v2 = PencilPairingUIBundle();
  v3 = [v2 localizedStringForKey:@"TURN_ON_BLUETOOTH" value:&stru_26ECD9920 table:0];

  return v3;
}

- (id)_bluetoothOnString
{
  v2 = PencilPairingUIBundle();
  v3 = [v2 localizedStringForKey:@"BLUETOOTH_TURNED_ON" value:&stru_26ECD9920 table:0];

  return v3;
}

- (PNPAirplaneModeBluetoothViewDelegate)bluetoothDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothDelegate);
  return (PNPAirplaneModeBluetoothViewDelegate *)WeakRetained;
}

- (void)setBluetoothDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bluetoothDelegate);
  objc_storeStrong((id *)&self->_pencilStatusString, 0);
  objc_storeStrong((id *)&self->_currentString, 0);
  objc_storeStrong((id *)&self->_turnOnBluetoothButton, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_contentAreaView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end