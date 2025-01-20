@interface NCNotificationManagementBlueButton
+ (NCNotificationManagementBlueButton)buttonWithTitle:(id)a3;
- (NCNotificationManagementBlueButton)initWithFrame:(CGRect)a3;
- (id)backgroundColor;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NCNotificationManagementBlueButton

+ (NCNotificationManagementBlueButton)buttonWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[NCNotificationManagementBlueButton buttonWithType:0];
  [v4 setTitle:v3 forState:0];

  return (NCNotificationManagementBlueButton *)v4;
}

- (NCNotificationManagementBlueButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationManagementBlueButton;
  id v3 = -[NCNotificationManagementBlueButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NCNotificationManagementBlueButton *)v3 setTitleColor:v4 forState:0];

    v5 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
    [(NCNotificationManagementBlueButton *)v3 setTitleColor:v5 forState:1];

    v6 = [(NCNotificationManagementBlueButton *)v3 titleLabel];
    [v6 setNumberOfLines:1];
    [v6 setTextAlignment:1];
    v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2908] addingSymbolicTraits:0 options:3];
    v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];
    [v6 setFont:v8];

    v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(NCNotificationManagementBlueButton *)v3 setBackgroundColor:v9];

    v10 = [(NCNotificationManagementBlueButton *)v3 layer];
    [v10 setCornerRadius:8.0];

    v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
      [(NCNotificationManagementBlueButton *)v3 addInteraction:v13];
    }
  }
  return v3;
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (([(NCNotificationManagementBlueButton *)self isHighlighted] & 1) == 0)
  {
    v5 = (UIColor *)[v4 copy];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v5;
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationManagementBlueButton;
  [(NCNotificationManagementBlueButton *)&v7 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    double v14 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    double v12 = 0.0;
    [(UIColor *)self->_backgroundColor getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
    v5 = [MEMORY[0x1E4FB1618] colorWithRed:v15 green:v14 blue:v13 alpha:v12 * 0.5];
  }
  else
  {
    v5 = self->_backgroundColor;
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationManagementBlueButton;
  [(NCNotificationManagementBlueButton *)&v11 setHighlighted:v3];
  objc_super v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__NCNotificationManagementBlueButton_setHighlighted___block_invoke;
  v9[3] = &unk_1E6A91A68;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  [v7 animateWithDuration:v9 animations:0 completion:0.2];
}

uint64_t __53__NCNotificationManagementBlueButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  id v5 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v4];
  v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:0];

  return v6;
}

- (void).cxx_destruct
{
}

@end