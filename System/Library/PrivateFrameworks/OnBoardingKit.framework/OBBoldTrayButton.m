@interface OBBoldTrayButton
+ (id)boldButton;
- (CGSize)intrinsicContentSize;
- (NSNumber)buttonStateRequiredHeight;
- (id)boldConfiguration;
- (void)hidesBusyIndicator;
- (void)setButtonStateRequiredHeight:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)showsBusyIndicator;
- (void)tintColorDidChange;
- (void)updateConfiguration;
@end

@implementation OBBoldTrayButton

+ (id)boldButton
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBBoldTrayButton;
  v2 = objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  v3 = [v2 boldConfiguration];
  [v2 setConfiguration:v3];

  return v2;
}

- (id)boldConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  [v2 setButtonSize:3];
  v3 = [v2 background];
  [v3 setCornerRadius:14.0];

  return v2;
}

- (void)showsBusyIndicator
{
  v3 = [(OBBoldTrayButton *)self configuration];
  char v4 = [v3 showsActivityIndicator];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [(OBBoldTrayButton *)self buttonStateRequiredHeight];

    if (!v5)
    {
      v6 = NSNumber;
      [(OBBoldTrayButton *)self bounds];
      *(float *)&double v8 = v7;
      v9 = [v6 numberWithFloat:v8];
      [(OBBoldTrayButton *)self setButtonStateRequiredHeight:v9];
    }
    v10.receiver = self;
    v10.super_class = (Class)OBBoldTrayButton;
    [(OBTrayButton *)&v10 showsBusyIndicator];
  }
}

- (void)hidesBusyIndicator
{
  v3 = [(OBBoldTrayButton *)self configuration];
  int v4 = [v3 showsActivityIndicator];

  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBBoldTrayButton;
    [(OBTrayButton *)&v6 hidesBusyIndicator];
    objc_super v5 = [(OBBoldTrayButton *)self buttonStateRequiredHeight];

    if (v5) {
      [(OBBoldTrayButton *)self setButtonStateRequiredHeight:0];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(OBBoldTrayButton *)self configuration];
  int v6 = [v5 showsActivityIndicator];

  if (v6)
  {
    double v7 = _OBLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[OBBoldTrayButton setEnabled:](v7);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBBoldTrayButton;
    [(OBBoldTrayButton *)&v8 setEnabled:v3];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(OBBoldTrayButton *)self buttonStateRequiredHeight];

  if (v3)
  {
    [(OBBoldTrayButton *)self bounds];
    double v5 = v4;
    int v6 = [(OBBoldTrayButton *)self buttonStateRequiredHeight];
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)OBBoldTrayButton;
    [(OBBoldTrayButton *)&v13 intrinsicContentSize];
    double v5 = v9;
    double v8 = v10;
  }
  double v11 = v5;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateConfiguration
{
  v19.receiver = self;
  v19.super_class = (Class)OBBoldTrayButton;
  [(OBBoldTrayButton *)&v19 updateConfiguration];
  BOOL v3 = [(OBBoldTrayButton *)self configuration];
  double v4 = [(OBBoldTrayButton *)self tintColor];
  [v3 setBaseBackgroundColor:v4];

  double v5 = [(OBBoldTrayButton *)self configuration];
  int v6 = [v5 showsActivityIndicator];

  if (v6) {
    [v3 setTitle:0];
  }
  v18.receiver = self;
  v18.super_class = (Class)OBBoldTrayButton;
  float v7 = [(OBTrayButton *)&v18 buttonFont];
  double v8 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  double v9 = (void *)[v8 mutableCopy];

  [v9 setAlignment:1];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __39__OBBoldTrayButton_updateConfiguration__block_invoke;
  v15 = &unk_1E58AEA38;
  id v16 = v7;
  id v17 = v9;
  id v10 = v9;
  id v11 = v7;
  [v3 setTitleTextAttributesTransformer:&v12];
  -[OBBoldTrayButton setConfiguration:](self, "setConfiguration:", v3, v12, v13, v14, v15);
}

id __39__OBBoldTrayButton_updateConfiguration__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4FB0738];
  v7[0] = *MEMORY[0x1E4FB06F8];
  v7[1] = v1;
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = v2;
  v7[2] = *MEMORY[0x1E4FB0808];
  BOOL v3 = UIAccessibilityButtonShapesEnabled();
  double v4 = &unk_1EEC37940;
  if (v3) {
    double v4 = &unk_1EEC37928;
  }
  v8[2] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  return v5;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)OBBoldTrayButton;
  [(OBBoldTrayButton *)&v3 tintColorDidChange];
  [(OBBoldTrayButton *)self setNeedsUpdateConfiguration];
}

- (NSNumber)buttonStateRequiredHeight
{
  return self->_buttonStateRequiredHeight;
}

- (void)setButtonStateRequiredHeight:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setEnabled:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BF0F000, log, OS_LOG_TYPE_ERROR, "OBBoldTrayButton does not support setting enabled when showing the busy indicator", v1, 2u);
}

@end