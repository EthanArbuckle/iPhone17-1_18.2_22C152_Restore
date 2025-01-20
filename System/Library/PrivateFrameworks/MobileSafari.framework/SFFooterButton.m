@interface SFFooterButton
- (SFFooterButton)initWithCoder:(id)a3;
- (SFFooterButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation SFFooterButton

- (void)updateConfiguration
{
  id v6 = [(SFFooterButton *)self configuration];
  v3 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  v4 = [(SFFooterButton *)self traitCollection];
  if (objc_msgSend(v4, "sf_usesVibrantAppearance"))
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [v6 setBaseBackgroundColor:v5];
  }
  else
  {
    [v6 setBaseBackgroundColor:v3];
  }

  [(SFFooterButton *)self setConfiguration:v6];
}

- (SFFooterButton)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SFFooterButton;
  v3 = -[SFFooterButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFFooterButton *)v3 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    [(SFFooterButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFFooterButton *)v4 setRole:1];
    v5 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    [v5 setButtonSize:0];
    [v5 setCornerStyle:4];
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setBaseForegroundColor:v6];

    [v5 contentInsets];
    objc_msgSend(v5, "setContentInsets:");
    [(SFFooterButton *)v4 setConfiguration:v5];

    v12[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v8 = (id)[(SFFooterButton *)v4 registerForTraitChanges:v7 withTarget:v4 action:sel_setNeedsUpdateConfiguration];

    v9 = v4;
  }

  return v4;
}

- (SFFooterButton)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFFooterButton;
  return [(SFFooterButton *)&v4 initWithCoder:a3];
}

@end