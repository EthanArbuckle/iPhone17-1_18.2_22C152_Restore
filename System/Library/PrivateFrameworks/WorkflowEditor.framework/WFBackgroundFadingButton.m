@interface WFBackgroundFadingButton
- (BOOL)derivesBackgroundColorFromTintColor;
- (BOOL)derivesTitleColorFromTintColor;
- (NSMutableDictionary)backgroundColorsByState;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setBackgroundColorsByState:(id)a3;
- (void)setDerivesBackgroundColorFromTintColor:(BOOL)a3;
- (void)setDerivesTitleColorFromTintColor:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateBackgroundColorAnimated:(BOOL)a3;
@end

@implementation WFBackgroundFadingButton

- (void).cxx_destruct
{
}

- (void)setBackgroundColorsByState:(id)a3
{
}

- (BOOL)derivesBackgroundColorFromTintColor
{
  return self->_derivesBackgroundColorFromTintColor;
}

- (BOOL)derivesTitleColorFromTintColor
{
  return self->_derivesTitleColorFromTintColor;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WFBackgroundFadingButton *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  [(WFBackgroundFadingButton *)&v6 setEnabled:v3];
  if (v5 != v3) {
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:1];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WFBackgroundFadingButton *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  [(WFBackgroundFadingButton *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:1];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WFBackgroundFadingButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)WFBackgroundFadingButton;
  [(WFBackgroundFadingButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:1];
  }
}

- (void)updateBackgroundColorAnimated:(BOOL)a3
{
  double v3 = 0.100000001;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__WFBackgroundFadingButton_updateBackgroundColorAnimated___block_invoke;
  v4[3] = &unk_264BFDBA0;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:v3];
}

void __58__WFBackgroundFadingButton_updateBackgroundColorAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if ([*(id *)(a1 + 32) derivesBackgroundColorFromTintColor])
  {
    if (v2)
    {
      if ((v2 & 2) != 0)
      {
        uint64_t v8 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_12;
      }
      if ((v2 & 5) == 0) {
        goto LABEL_12;
      }
      double v3 = [*(id *)(a1 + 32) tintColor];
      v4 = v3;
      double v5 = 0.300000012;
    }
    else
    {
      double v3 = [*(id *)(a1 + 32) tintColor];
      v4 = v3;
      double v5 = 0.100000001;
    }
    id v11 = [v3 colorWithAlphaComponent:v5];
  }
  else
  {
    objc_super v6 = [*(id *)(a1 + 32) backgroundColorsByState];
    v7 = [NSNumber numberWithUnsignedInteger:v2];
    id v11 = [v6 objectForKeyedSubscript:v7];
  }
  uint64_t v8 = (uint64_t)v11;
  if (v11)
  {
LABEL_10:
    v9 = *(void **)(a1 + 32);
    id v12 = (id)v8;
    uint64_t v10 = v8;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v10 = [MEMORY[0x263F825C8] clearColor];
  v9 = *(void **)(a1 + 32);
  id v12 = (id)v10;
LABEL_13:
  [v9 setBackgroundColor:v10];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)WFBackgroundFadingButton;
  [(WFBackgroundFadingButton *)&v4 tintColorDidChange];
  if ([(WFBackgroundFadingButton *)self derivesTitleColorFromTintColor])
  {
    double v3 = [(WFBackgroundFadingButton *)self tintColor];
    [(WFBackgroundFadingButton *)self setTitleColor:v3 forState:0];
  }
  if ([(WFBackgroundFadingButton *)self derivesBackgroundColorFromTintColor]) {
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:0];
  }
}

- (void)setDerivesBackgroundColorFromTintColor:(BOOL)a3
{
  if (self->_derivesBackgroundColorFromTintColor != a3)
  {
    self->_derivesBackgroundColorFromTintColor = a3;
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:0];
  }
}

- (void)setDerivesTitleColorFromTintColor:(BOOL)a3
{
  if (self->_derivesTitleColorFromTintColor != a3)
  {
    self->_derivesTitleColorFromTintColor = a3;
    if (a3)
    {
      objc_super v4 = [(WFBackgroundFadingButton *)self tintColor];
      [(WFBackgroundFadingButton *)self setTitleColor:v4 forState:0];

      id v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
      [(WFBackgroundFadingButton *)self setTitleColor:v5 forState:2];
    }
  }
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v8 = a3;
  objc_super v6 = [(WFBackgroundFadingButton *)self backgroundColorsByState];
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  if (v8) {
    [v6 setObject:v8 forKey:v7];
  }
  else {
    [v6 removeObjectForKey:v7];
  }

  if ([(WFBackgroundFadingButton *)self state] == a4) {
    [(WFBackgroundFadingButton *)self updateBackgroundColorAnimated:0];
  }
}

- (NSMutableDictionary)backgroundColorsByState
{
  backgroundColorsByState = self->_backgroundColorsByState;
  if (!backgroundColorsByState)
  {
    objc_super v4 = (NSMutableDictionary *)objc_opt_new();
    id v5 = self->_backgroundColorsByState;
    self->_backgroundColorsByState = v4;

    backgroundColorsByState = self->_backgroundColorsByState;
  }
  return backgroundColorsByState;
}

@end