@interface SBFLockScreenAlternateDateLabel
+ (BOOL)showAlternateDate;
+ (id)_lunarCalendarIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)date;
- (SBFLockScreenAlternateDateLabel)initWithSettings:(id)a3 strength:(double)a4 font:(id)a5;
- (SBUILegibilityLabel)label;
- (UIEdgeInsets)characterOverflowInsets;
- (UIFont)font;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (id)_alternateDateString;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
- (void)setFont:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation SBFLockScreenAlternateDateLabel

- (SBFLockScreenAlternateDateLabel)initWithSettings:(id)a3 strength:(double)a4 font:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFLockScreenAlternateDateLabel;
  v9 = [(SBFLockScreenAlternateDateLabel *)&v18 init];
  if (v9)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v10 = (void *)getSBUILegibilityLabelClass_softClass_1;
    uint64_t v23 = getSBUILegibilityLabelClass_softClass_1;
    if (!getSBUILegibilityLabelClass_softClass_1)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getSBUILegibilityLabelClass_block_invoke_1;
      v19[3] = &unk_1E548C938;
      v19[4] = &v20;
      __getSBUILegibilityLabelClass_block_invoke_1((uint64_t)v19);
      v10 = (void *)v21[3];
    }
    v11 = v10;
    _Block_object_dispose(&v20, 8);
    id v12 = [v11 alloc];
    uint64_t v13 = [v12 initWithSettings:v7 strength:0 string:v8 font:*MEMORY[0x1E4F440E0]];
    label = v9->_label;
    v9->_label = (SBUILegibilityLabel *)v13;

    v15 = v9->_label;
    v16 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUILegibilityLabel *)v15 setBackgroundColor:v16];

    [(SBFLockScreenAlternateDateLabel *)v9 addSubview:v9->_label];
  }

  return v9;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenAlternateDateLabel;
  [(SBFLockScreenAlternateDateLabel *)&v4 layoutSubviews];
  label = self->_label;
  [(SBFLockScreenAlternateDateLabel *)self bounds];
  -[SBUILegibilityLabel setFrame:](label, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)showAlternateDate
{
  v2 = [a1 _lunarCalendarIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)setDate:(id)a3
{
  v5 = (NSDate *)a3;
  p_date = &self->_date;
  if (self->_date != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_date, a3);
    label = self->_label;
    id v8 = [(SBFLockScreenAlternateDateLabel *)self _alternateDateString];
    [(SBUILegibilityLabel *)label setString:v8];

    v5 = v9;
  }
  MEMORY[0x1F41817F8](p_date, v5);
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return (UIFont *)[(SBUILegibilityLabel *)self->_label font];
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setStrength:(double)a3
{
}

- (UIEdgeInsets)characterOverflowInsets
{
  [(SBUILegibilityLabel *)self->_label characterOverflowInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)_lunarCalendarIdentifier
{
  if (_lunarCalendarIdentifier_onceToken != -1) {
    dispatch_once(&_lunarCalendarIdentifier_onceToken, &__block_literal_global_35);
  }
  double v2 = (void *)_lunarCalendarIdentifier_lunarCalendarIdentifier;
  return v2;
}

void __59__SBFLockScreenAlternateDateLabel__lunarCalendarIdentifier__block_invoke()
{
  v0 = [MEMORY[0x1E4F256B0] sharedPreferences];
  uint64_t v1 = [v0 overlayCalendarID];
  double v2 = (void *)_lunarCalendarIdentifier_lunarCalendarIdentifier;
  _lunarCalendarIdentifier_lunarCalendarIdentifier = v1;

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F256A8];
  double v4 = [MEMORY[0x1E4F28F08] mainQueue];
  id v5 = (id)[v6 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_8_1];
}

void __59__SBFLockScreenAlternateDateLabel__lunarCalendarIdentifier__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F256B0] sharedPreferences];
  uint64_t v0 = [v2 overlayCalendarID];
  uint64_t v1 = (void *)_lunarCalendarIdentifier_lunarCalendarIdentifier;
  _lunarCalendarIdentifier_lunarCalendarIdentifier = v0;
}

- (id)_alternateDateString
{
  id v2 = [(id)objc_opt_class() _lunarCalendarIdentifier];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v2];
    if (v3)
    {
      double v4 = [MEMORY[0x1E4F70FE8] localeForCalendarID:v2];
      if (v4)
      {
        id v5 = objc_opt_new();
        [v5 setCalendar:v3];
        [v5 setLocale:v4];
        [v5 setDateStyle:2];
        [v5 setLocalizedDateFormatFromTemplate:@"UMMMd"];
        id v6 = [MEMORY[0x1E4F1C9C8] date];
        id v7 = [v5 stringFromDate:v6];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_strength;
}

- (NSDate)date
{
  return self->_date;
}

- (SBUILegibilityLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end