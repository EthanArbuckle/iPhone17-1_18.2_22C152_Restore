@interface PKDatePicker
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)showsDay;
- (BOOL)showsMonth;
- (BOOL)showsYear;
- (BOOL)usesDarkAppearance;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)_classForDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6;
- (NSCalendar)calendar;
- (NSDate)date;
- (NSLocale)locale;
- (PKDatePicker)initWithCoder:(id)a3;
- (PKDatePicker)initWithFrame:(CGRect)a3;
- (PKDatePickerDelegate)delegate;
- (id)pk_childrenForAppearance;
- (unint64_t)style;
- (void)_dateValueChanged:(id)a3;
- (void)_forceReloadInternalPicker;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)reconfigureToShowDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6 locale:(id)a7 calendar:(id)a8;
- (void)setBackgroundColor:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUsesDarkAppearance:(BOOL)a3;
@end

@implementation PKDatePicker

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:(id)a3
{
}

- (PKDatePicker)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PKDatePicker;
  v7 = -[PKDatePicker initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v9 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    [(PKDatePicker *)v7 reconfigureToShowDay:1 month:1 year:1 style:0 locale:v8 calendar:v9];

    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    if (CGRectEqualToRect(v12, *MEMORY[0x1E4F1DB28])) {
      [(PKDatePicker *)v7 sizeToFit];
    }
  }
  return v7;
}

- (PKDatePicker)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  [v4 raise:v5 format:@"This class is not NSCoding compliant."];
  v9.receiver = self;
  v9.super_class = (Class)PKDatePicker;
  v7 = [(PKDatePicker *)&v9 initWithCoder:v6];

  return v7;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker prepareToDie];
  v3.receiver = self;
  v3.super_class = (Class)PKDatePicker;
  [(PKDatePicker *)&v3 dealloc];
}

- (void)reconfigureToShowDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6 locale:(id)a7 calendar:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v28 = a7;
  id v27 = a8;
  internalPicker = self->_internalPicker;
  if (!internalPicker
    || self->_showsDay != v13
    || self->_showsMonth != v12
    || self->_showsYear != v11
    || self->_style != a6)
  {
    v16 = [(PKDatePickerInternalImplementationProtocol *)internalPicker date];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1C9C8] date];
    }
    v19 = v18;

    v20 = [(PKDatePicker *)self _classForDay:v13 month:v12 year:v11 style:a6];
    if (!v20)
    {
      BOOL v13 = 1;
      v21 = [(PKDatePicker *)self _classForDay:1 month:1 year:1 style:0];
      if (!v21)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to find an required PKDatePicker_Impl class."];
        goto LABEL_13;
      }
      v20 = v21;
      BOOL v12 = 1;
      BOOL v11 = 1;
    }
    [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker removeFromSuperview];
    [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker prepareToDie];
    v22 = (PKDatePickerInternalImplementationProtocol *)[[v20 alloc] initShowingDay:v13 month:v12 year:v11 useDarkAppearance:self->_usesDarkAppearance locale:v28 calendar:v27];
    v23 = self->_internalPicker;
    self->_internalPicker = v22;

    [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker setDateValueChangedTarget:self action:sel__dateValueChanged_];
    [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker setDate:v19];
    [(PKDatePicker *)self addSubview:self->_internalPicker];
    v24 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKDatePicker *)self setBackgroundColor:v24];

    [(PKDatePicker *)self setNeedsDisplay];
    [(PKDatePicker *)self setNeedsLayout];
    self->_showsDaCGFloat y = v13;
    self->_showsMonth = v12;
    self->_showsYear = v11;
    self->_style = a6;
    objc_storeStrong((id *)&self->_locale, a7);
    objc_storeStrong((id *)&self->_calendar, a8);
    v25 = [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker date];
    date = self->_date;
    self->_date = v25;

LABEL_13:
  }
}

- (void)setDate:(id)a3
{
  p_date = &self->_date;
  objc_storeStrong((id *)&self->_date, a3);
  id v6 = a3;
  [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker setDate:*p_date];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDatePicker;
  id v4 = a3;
  [(PKDatePicker *)&v5 setBackgroundColor:v4];
  -[PKDatePickerInternalImplementationProtocol setBackgroundColor:](self->_internalPicker, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  if (self->_usesDarkAppearance != a3)
  {
    self->_usesDarkAppearance = a3;
    [(PKDatePicker *)self _forceReloadInternalPicker];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKDatePicker;
  [(PKDatePicker *)&v14 layoutSubviews];
  [(PKDatePicker *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    BOOL v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v12 = [v11 keyWindow];
    [v12 safeAreaInsets];
    double v10 = v10 - v13;
  }
  -[PKDatePickerInternalImplementationProtocol setFrame:](self->_internalPicker, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDatePickerInternalImplementationProtocol sizeThatFits:](self->_internalPicker, "sizeThatFits:", a3.width, a3.height);
  double v4 = v3;
  double v6 = v5;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v8 = [v7 keyWindow];
    [v8 safeAreaInsets];
    double v6 = v6 + v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker intrinsicContentSize];
  double v3 = v2;
  double v5 = v4;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v7 = [v6 keyWindow];
    [v7 safeAreaInsets];
    double v5 = v5 + v8;
  }
  double v9 = v3;
  double v10 = v5;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (Class)_classForDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 style:(unint64_t)a6
{
  BOOL v7 = a3 && a4;
  if (a6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a5;
  }
  if (v7 && v8 || a6 == 2 && a3 && a4 && a5 || a6 == 1 && a4 && a5) {
    goto LABEL_14;
  }
  if (v7)
  {
    if (a6) {
      goto LABEL_19;
    }
LABEL_14:
    double v9 = objc_opt_class();
    return (Class)v9;
  }
  if (!a6 && a4 && a5) {
    goto LABEL_14;
  }
  if ((a3 ^ a4) != 1 || a5)
  {
    if (v8 && !a3 && !a4) {
      goto LABEL_14;
    }
  }
  else if (!a6)
  {
    goto LABEL_14;
  }
LABEL_19:
  double v9 = 0;
  return (Class)v9;
}

- (void)_dateValueChanged:(id)a3
{
  double v4 = [a3 date];
  date = self->_date;
  self->_date = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 datePicker:self didChangeDate:self->_date];
  }
}

- (void)_forceReloadInternalPicker
{
  double v3 = [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker date];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v7 = v5;

  [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker removeFromSuperview];
  [(PKDatePickerInternalImplementationProtocol *)self->_internalPicker prepareToDie];
  internalPicker = self->_internalPicker;
  self->_internalPicker = 0;

  [(PKDatePicker *)self reconfigureToShowDay:self->_showsDay month:self->_showsMonth year:self->_showsYear style:self->_style locale:self->_locale calendar:self->_calendar];
  [(PKDatePicker *)self setDate:v7];
}

- (BOOL)showsDay
{
  return self->_showsDay;
}

- (BOOL)showsMonth
{
  return self->_showsMonth;
}

- (BOOL)showsYear
{
  return self->_showsYear;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)date
{
  return self->_date;
}

- (PKDatePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDatePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_internalPicker, 0);
}

@end