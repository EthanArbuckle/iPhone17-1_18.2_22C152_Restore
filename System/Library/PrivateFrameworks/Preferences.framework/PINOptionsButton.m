@interface PINOptionsButton
- (PINOptionsButton)init;
- (void)layoutSubviews;
@end

@implementation PINOptionsButton

- (PINOptionsButton)init
{
  v7.receiver = self;
  v7.super_class = (Class)PINOptionsButton;
  objc_msgSend(-[PINOptionsButton class](&v7, sel_class), "buttonWithType:", 1);
  v3 = (PINOptionsButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [(PINOptionsButton *)v3 titleLabel];
    v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v4 setFont:v5];

    [v4 setNumberOfLines:0];
    [v4 setTextAlignment:1];
    [v4 setAdjustsFontSizeToFitWidth:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PINOptionsButton;
  [(PINOptionsButton *)&v4 layoutSubviews];
  v3 = [(PINOptionsButton *)self titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];
  [(PINOptionsButton *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

@end