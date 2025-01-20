@interface MTUIDateLabel
- (BOOL)_hasFontInfoForVerticalBaselineSpacing;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTUIDateLabel)initWithFrame:(CGRect)a3;
- (NSDate)date;
- (NSString)dateLabelText;
- (NSTimeZone)timeZone;
- (UIColor)textColor;
- (UIFont)font;
- (UIFont)timeDesignatorFont;
- (UILabel)dateLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_updateDateString;
- (void)_updateLabel;
- (void)_updateTextString;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
- (void)setDateLabelText:(id)a3;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeDesignatorFont:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation MTUIDateLabel

- (id)viewForLastBaselineLayout
{
  v2 = self;
  if ([(MTUIDateLabel *)self _wantsAutolayout]) {
    v2 = (MTUIDateLabel *)v2->_dateLabel;
  }

  return v2;
}

- (id)viewForFirstBaselineLayout
{
  v2 = self;
  if ([(MTUIDateLabel *)self _wantsAutolayout]) {
    v2 = (MTUIDateLabel *)v2->_dateLabel;
  }

  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTUIDateLabel;
  [(MTUIDateLabel *)&v3 layoutSubviews];
  [(MTUIDateLabel *)self bounds];
  -[UILabel setFrame:](self->_dateLabel, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_dateLabel intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);

  [(MTUIDateLabel *)self _updateLabel];
}

- (MTUIDateLabel)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MTUIDateLabel;
  double v3 = -[MTUIDateLabel initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTUIDateLabel *)v3 setOpaque:0];
    BOOL v5 = [(UIView *)v4 mtui_isRTL];
    uint64_t v6 = objc_opt_new();
    dateLabel = v4->_dateLabel;
    v4->_dateLabel = (UILabel *)v6;

    if (v5) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = 7;
    }
    [(UILabel *)v4->_dateLabel setContentMode:v8];
    [(MTUIDateLabel *)v4 addSubview:v4->_dateLabel];
    uint64_t v9 = [(UILabel *)v4->_dateLabel font];
    font = v4->_font;
    v4->_font = (UIFont *)v9;

    uint64_t v11 = [(UILabel *)v4->_dateLabel textColor];
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v11;

    uint64_t v13 = [(UILabel *)v4->_dateLabel font];
    timeDesignatorFont = v4->_timeDesignatorFont;
    v4->_timeDesignatorFont = (UIFont *)v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v4 selector:sel__updateLabel name:*MEMORY[0x263F55CE8] object:0];
    [v15 addObserver:v4 selector:sel__updateLabel name:*MEMORY[0x263F1D0A0] object:0];
    LODWORD(v16) = 1148829696;
    [(MTUIDateLabel *)v4 setContentHuggingPriority:1 forAxis:v16];
    LODWORD(v17) = 1148829696;
    [(MTUIDateLabel *)v4 setContentCompressionResistancePriority:0 forAxis:v17];
  }
  return v4;
}

- (void)setDateLabelText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_dateLabelText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    dateLabelText = self->_dateLabelText;
    self->_dateLabelText = v4;

    [(MTUIDateLabel *)self _updateLabel];
  }
}

- (void)setFont:(id)a3
{
  BOOL v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(UILabel *)self->_dateLabel setFont:v5];
    [(MTUIDateLabel *)self _updateLabel];
  }
}

- (void)setTimeDesignatorFont:(id)a3
{
  BOOL v5 = (UIFont *)a3;
  p_timeDesignatorFont = &self->_timeDesignatorFont;
  if (self->_timeDesignatorFont != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_timeDesignatorFont, a3);
    p_timeDesignatorFont = (UIFont **)[(MTUIDateLabel *)self _updateLabel];
    BOOL v5 = v7;
  }

  MEMORY[0x270F9A758](p_timeDesignatorFont, v5);
}

- (void)_updateLabel
{
  if (self->_date) {
    [(MTUIDateLabel *)self _updateDateString];
  }
  else {
    [(MTUIDateLabel *)self _updateTextString];
  }
}

- (void)_updateDateString
{
  v25[2] = *MEMORY[0x263EF8340];
  if (self->_date)
  {
    double v3 = [MEMORY[0x263F55D60] sharedInstance];
    date = self->_date;
    BOOL v5 = [(MTUIDateLabel *)self timeZone];
    id v21 = 0;
    id v6 = [v3 localizedTimeStringFromDate:date forTimeZone:v5 timeDesignator:&v21];
    id v7 = v21;
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x263F55D60] sharedInstance];
  int v9 = [v8 timeDesignatorAppearsBeforeTime];

  uint64_t v10 = *MEMORY[0x263F1C240];
  v24[0] = *MEMORY[0x263F1C240];
  uint64_t v11 = [(MTUIDateLabel *)self textColor];
  v25[0] = v11;
  uint64_t v12 = *MEMORY[0x263F1C238];
  v24[1] = *MEMORY[0x263F1C238];
  uint64_t v13 = [(MTUIDateLabel *)self font];
  v25[1] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  if ([v6 length]) {
    v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6 attributes:v14];
  }
  else {
    v15 = 0;
  }
  if ([v7 length])
  {
    v22[0] = v10;
    double v16 = [(MTUIDateLabel *)self textColor];
    v23[0] = v16;
    v22[1] = v12;
    double v17 = [(MTUIDateLabel *)self font];
    v22[2] = *MEMORY[0x263F1C2B8];
    uint64_t v18 = *MEMORY[0x263F1C2C0];
    v23[1] = v17;
    v23[2] = v18;
    objc_super v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    v20 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v19];
    if (v9) {
      [v15 insertAttributedString:v20 atIndex:0];
    }
    else {
      [v15 appendAttributedString:v20];
    }
  }
  [(UILabel *)self->_dateLabel setAttributedText:v15];
  [(MTUIDateLabel *)self invalidateIntrinsicContentSize];
}

- (void)_updateTextString
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F1C240];
  double v3 = [(MTUIDateLabel *)self textColor];
  v11[0] = v3;
  v10[1] = *MEMORY[0x263F1C238];
  v4 = [(MTUIDateLabel *)self font];
  v11[1] = v4;
  BOOL v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v6 = [(MTUIDateLabel *)self dateLabelText];
  if ([v6 length])
  {
    id v7 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v8 = [(MTUIDateLabel *)self dateLabelText];
    int v9 = (void *)[v7 initWithString:v8 attributes:v5];
  }
  else
  {
    int v9 = 0;
  }

  [(UILabel *)self->_dateLabel setAttributedText:v9];
  [(MTUIDateLabel *)self invalidateIntrinsicContentSize];
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)dateLabelText
{
  return self->_dateLabelText;
}

- (NSTimeZone)timeZone
{
  timeZone = self->_timeZone;
  if (timeZone)
  {
    double v3 = timeZone;
  }
  else
  {
    double v3 = [MEMORY[0x263EFFA18] systemTimeZone];
  }

  return v3;
}

- (void)setDate:(id)a3
{
  if (self->_date != a3)
  {
    v4 = (NSDate *)[a3 copy];
    date = self->_date;
    self->_date = v4;

    [(MTUIDateLabel *)self _updateLabel];
  }
}

- (void)setTimeZone:(id)a3
{
  BOOL v5 = (NSTimeZone *)a3;
  p_timeZone = &self->_timeZone;
  if (self->_timeZone != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_timeZone, a3);
    p_timeZone = (NSTimeZone **)[(MTUIDateLabel *)self _updateLabel];
    BOOL v5 = v7;
  }

  MEMORY[0x270F9A758](p_timeZone, v5);
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSDate)date
{
  return self->_date;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UIFont)timeDesignatorFont
{
  return self->_timeDesignatorFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeDesignatorFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_dateLabelText, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end