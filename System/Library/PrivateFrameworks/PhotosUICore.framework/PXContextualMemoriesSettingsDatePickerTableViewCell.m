@interface PXContextualMemoriesSettingsDatePickerTableViewCell
- (PXContextualMemoriesSettingsDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIDatePicker)datePicker;
@end

@implementation PXContextualMemoriesSettingsDatePickerTableViewCell

- (void).cxx_destruct
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (PXContextualMemoriesSettingsDatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PXContextualMemoriesSettingsDatePickerTableViewCell;
  v4 = [(PXContextualMemoriesSettingsDatePickerTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PXContextualMemoriesSettingsDatePickerTableViewCell *)v4 setSelectionStyle:0];
    id v6 = objc_alloc(MEMORY[0x1E4FB16B0]);
    v7 = [(PXContextualMemoriesSettingsDatePickerTableViewCell *)v5 contentView];
    [v7 bounds];
    uint64_t v8 = objc_msgSend(v6, "initWithFrame:");
    datePicker = v5->_datePicker;
    v5->_datePicker = (UIDatePicker *)v8;

    [(UIDatePicker *)v5->_datePicker setAutoresizingMask:18];
    [(UIDatePicker *)v5->_datePicker setDatePickerMode:1];
    v10 = [(PXContextualMemoriesSettingsDatePickerTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_datePicker];
  }
  return v5;
}

@end