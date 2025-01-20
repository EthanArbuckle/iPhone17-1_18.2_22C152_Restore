@interface PKDatePickerImpl_DateOfBirthDatePicker
- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8;
@end

@implementation PKDatePickerImpl_DateOfBirthDatePicker

- (id)initShowingDay:(BOOL)a3 month:(BOOL)a4 year:(BOOL)a5 useDarkAppearance:(BOOL)a6 locale:(id)a7 calendar:(id)a8
{
  v15.receiver = self;
  v15.super_class = (Class)PKDatePickerImpl_DateOfBirthDatePicker;
  id v8 = [(PKDatePickerImpl_DatePicker *)&v15 initShowingDay:a3 month:a4 year:a5 useDarkAppearance:a6 locale:a7 calendar:a8];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v10 setYear:-150];
    v11 = [v8 calendar];
    v12 = [v11 dateByAddingComponents:v10 toDate:v9 options:0];

    [v8 setMinimumDate:v12];
    v13 = PKEndOfYear();
    [v8 setMaximumDate:v13];
  }
  return v8;
}

@end