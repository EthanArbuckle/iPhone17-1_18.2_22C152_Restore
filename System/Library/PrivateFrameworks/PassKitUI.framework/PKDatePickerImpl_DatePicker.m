@interface PKDatePickerImpl_DatePicker
- (NSDate)date;
- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8;
- (void)prepareToDie;
- (void)setDate:(id)a3;
- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4;
@end

@implementation PKDatePickerImpl_DatePicker

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a7;
  id v15 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKDatePickerImpl_DatePicker;
  v16 = [(PKDatePickerImpl_DatePicker *)&v28 init];
  v17 = v16;
  if (v16)
  {
    [(PKDatePickerImpl_DatePicker *)v16 setLocale:v14];
    [(PKDatePickerImpl_DatePicker *)v17 setCalendar:v15];
    [(PKDatePickerImpl_DatePicker *)v17 setPreferredDatePickerStyle:1];
    if (v9)
    {
      v18 = [MEMORY[0x1E4FB1618] colorWithRed:0.366 green:0.366 blue:0.366 alpha:1.0];
      [(PKDatePickerImpl_DatePicker *)v17 setBackgroundColor:v18];

      v19 = [MEMORY[0x1E4FB1618] whiteColor];
      [(PKDatePickerImpl_DatePicker *)v17 _setTextColor:v19];
    }
    int v20 = !v10;
    if (a3 && v11 && (v20 & 1) == 0)
    {
      v21 = v17;
      uint64_t v22 = 1;
LABEL_12:
      [(PKDatePickerImpl_DatePicker *)v21 setDatePickerMode:v22];
      goto LABEL_13;
    }
    if (((!v11 | v20) & 1) == 0)
    {
      v21 = v17;
      uint64_t v22 = 4;
      goto LABEL_12;
    }
    if (a3 && v11)
    {
      v21 = v17;
      uint64_t v22 = 4270;
      goto LABEL_12;
    }
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3B8];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v23 raise:v24, @"%@ does not support the specified flags.", v26 format];
  }
LABEL_13:

  return v17;
}

- (NSDate)date
{
  v4.receiver = self;
  v4.super_class = (Class)PKDatePickerImpl_DatePicker;
  v2 = [(PKDatePickerImpl_DatePicker *)&v4 date];

  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKDatePickerImpl_DatePicker;
  [(PKDatePickerImpl_DatePicker *)&v3 setDate:a3];
}

- (void)setDateValueChangedTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  [(PKDatePickerImpl_DatePicker *)self removeTarget:0 action:0 forControlEvents:4096];
  v6 = v7;
  if (v7 && a4)
  {
    [(PKDatePickerImpl_DatePicker *)self addTarget:v7 action:a4 forControlEvents:4096];
    v6 = v7;
  }
}

- (void)prepareToDie
{
}

@end