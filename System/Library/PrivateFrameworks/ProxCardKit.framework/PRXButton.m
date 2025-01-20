@interface PRXButton
+ (PRXButton)buttonWithProximityType:(int64_t)a3;
+ (PRXButton)buttonWithProximityType:(int64_t)a3 usesLegacyStyling:(BOOL)a4;
+ (PRXButton)buttonWithProximityType:(int64_t)a3 usesLegacyStyling:(BOOL)a4 usingCustomColors:(id)a5;
- (BOOL)isActive;
- (CGSize)intrinsicContentSize;
- (double)_minimumIntrinsicHeight;
- (int64_t)proximityButtonType;
- (void)setActive:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)toggleActive;
@end

@implementation PRXButton

+ (PRXButton)buttonWithProximityType:(int64_t)a3
{
  return +[PRXButton buttonWithProximityType:a3 usesLegacyStyling:0];
}

+ (PRXButton)buttonWithProximityType:(int64_t)a3 usesLegacyStyling:(BOOL)a4 usingCustomColors:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5)
  {
    v9 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F1D180]];
    v10 = [MEMORY[0x263F1C550] colorWithRed:0.831373 green:0.827451 blue:0.854902 alpha:1.0];
  }
  else
  {
    v10 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    v9 = 0;
  }
  switch(a3)
  {
    case 0:
      v47.receiver = a1;
      v47.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v47, sel_buttonWithType_, 1);
      v12 = [MEMORY[0x263F1C668] defaultMetrics];
      v13 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D330]];
      uint64_t v14 = [v12 scaledFontForFont:v13 compatibleWithTraitCollection:v9];
      goto LABEL_10;
    case 1:
      v46.receiver = a1;
      v46.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v46, sel_buttonWithType_, 0);
      [v11 _setContinuousCornerRadius:12.0];
      [v11 setBackgroundColor:v10];
      v15 = [MEMORY[0x263F1C668] defaultMetrics];
      v16 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D330]];
      v17 = [v15 scaledFontForFont:v16 compatibleWithTraitCollection:v9];
      v18 = [v11 titleLabel];
      [v18 setFont:v17];

      v19 = [MEMORY[0x263F1C550] labelColor];
      [v11 setTitleColor:v19 forState:0];

      v20 = [MEMORY[0x263F1C550] secondaryLabelColor];
      v21 = v11;
      v22 = v20;
      uint64_t v23 = 2;
      goto LABEL_23;
    case 2:
      v48.receiver = a1;
      v48.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v48, sel_buttonWithType_, 7);
      v24 = [MEMORY[0x263F1C6B0] kitImageNamed:@"UICloseButtonBackgroundCompact"];
      v25 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
      v26 = [v24 imageWithTintColor:v25];
      [v11 setBackgroundImage:v26 forState:0];

      v12 = [MEMORY[0x263F1C6C8] configurationWithPointSize:7 weight:1 scale:15.0];
      [v11 setPreferredSymbolConfiguration:v12 forImageInState:0];
      goto LABEL_13;
    case 3:
      v43.receiver = a1;
      v43.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v43, sel_buttonWithType_, 1);
      v12 = [MEMORY[0x263F1C668] defaultMetrics];
      v13 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D330]];
      uint64_t v14 = [v12 scaledFontForFont:v13];
LABEL_10:
      v27 = (void *)v14;
      v28 = [v11 titleLabel];
      [v28 setFont:v27];

      goto LABEL_12;
    case 4:
      v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"info"];
      v42.receiver = a1;
      v42.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v42, sel_systemButtonWithImage_target_action_, v12, 0, 0);
      v29 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [v11 setTintColor:v29];

      v30 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
      [v11 setBackgroundColor:v30];

      v31 = [v11 layer];
      [v31 setCornerRadius:12.0];

      v13 = [MEMORY[0x263F1C6C8] configurationWithPointSize:7 weight:1 scale:15.0];
      [v11 setPreferredSymbolConfiguration:v13 forImageInState:0];
LABEL_12:

LABEL_13:
      if (v11) {
        goto LABEL_14;
      }
      break;
    case 5:
      if (!v8)
      {
        v36 = PRXDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C6D2000, v36, OS_LOG_TYPE_DEFAULT, "[WARN] customColor must be set if using PRXButtonTypeProminentCustom", buf, 2u);
        }
      }
      v44.receiver = a1;
      v44.super_class = (Class)&OBJC_METACLASS___PRXButton;
      v11 = objc_msgSendSuper2(&v44, sel_buttonWithType_, 1);
      v37 = [v8 backgroundColor];
      [v11 setBackgroundColor:v37];

      [v11 _setContinuousCornerRadius:12.0];
      v38 = [MEMORY[0x263F1C668] defaultMetrics];
      v39 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D330]];
      v40 = [v38 scaledFontForFont:v39 compatibleWithTraitCollection:v9];
      v41 = [v11 titleLabel];
      [v41 setFont:v40];

      v20 = [v8 textColor];
      v21 = v11;
      v22 = v20;
      uint64_t v23 = 0;
LABEL_23:
      [v21 setTitleColor:v22 forState:v23];

      objc_msgSend(v11, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 12.0);
      if (!v11) {
        break;
      }
LABEL_14:
      v11[94] = a3;
      break;
    default:
      v11 = 0;
      break;
  }
  v32 = [v11 titleLabel];
  [v32 setAdjustsFontSizeToFitWidth:1];

  v33 = [v11 titleLabel];
  [v33 setAdjustsFontForContentSizeCategory:!v5];

  LODWORD(v34) = 1148846080;
  [v11 setContentHuggingPriority:1 forAxis:v34];

  return (PRXButton *)v11;
}

+ (PRXButton)buttonWithProximityType:(int64_t)a3 usesLegacyStyling:(BOOL)a4
{
  return +[PRXButton buttonWithProximityType:a3 usesLegacyStyling:a4 usingCustomColors:0];
}

- (double)_minimumIntrinsicHeight
{
  unint64_t proximityButtonType = self->_proximityButtonType;
  double result = 0.0;
  if (proximityButtonType <= 5) {
    return dbl_21C6F1378[proximityButtonType];
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)PRXButton;
  [(PRXButton *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(PRXButton *)self _minimumIntrinsicHeight];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PRXButton;
  -[PRXButton setHighlighted:](&v6, sel_setHighlighted_);
  if ((self->_proximityButtonType | 4) == 5)
  {
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.5;
    }
    [(PRXButton *)self setAlpha:v5];
  }
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PRXButton *)self proximityButtonType] == 4)
  {
    self->_active = v3;
    if (v3)
    {
      double v5 = [MEMORY[0x263F1C550] systemBlueColor];
      [(PRXButton *)self setBackgroundColor:v5];

      [MEMORY[0x263F1C550] whiteColor];
    }
    else
    {
      objc_super v6 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
      [(PRXButton *)self setBackgroundColor:v6];

      [MEMORY[0x263F1C550] secondaryLabelColor];
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(PRXButton *)self setTintColor:v7];
  }
}

- (void)toggleActive
{
  uint64_t v3 = [(PRXButton *)self isActive] ^ 1;
  [(PRXButton *)self setActive:v3];
}

- (int64_t)proximityButtonType
{
  return self->_proximityButtonType;
}

- (BOOL)isActive
{
  return self->_active;
}

@end