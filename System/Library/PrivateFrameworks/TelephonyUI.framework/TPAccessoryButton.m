@interface TPAccessoryButton
- (void)configureForImage:(id)a3;
@end

@implementation TPAccessoryButton

- (void)configureForImage:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D8];
  id v5 = a3;
  id v13 = [v4 filledButtonConfiguration];
  [v13 setImage:v5];

  v6 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
  [v13 setPreferredSymbolConfigurationForImage:v6];

  [v13 setCornerStyle:4];
  [v13 contentInsets];
  objc_msgSend(v13, "setContentInsets:", v7 + 2.0, v8 + 2.0, v9 + 2.0, v10 + 2.0);
  v11 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  [v13 setBaseBackgroundColor:v11];

  v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v13 setBaseForegroundColor:v12];

  [(TPAccessoryButton *)self setConfiguration:v13];
}

@end