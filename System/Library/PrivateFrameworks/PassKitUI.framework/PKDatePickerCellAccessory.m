@interface PKDatePickerCellAccessory
+ (id)accessoryWithDatePicker:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_initWithDatePicker:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKDatePickerCellAccessory

+ (id)accessoryWithDatePicker:(id)a3
{
  id v3 = a3;
  id v4 = [[PKDatePickerCellAccessory alloc] _initWithDatePicker:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v4 placement:1];
  [v5 setMaintainsFixedSize:1];
  [v5 setReservedLayoutWidth:0.0];

  return v5;
}

- (id)_initWithDatePicker:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDatePickerCellAccessory;
  v6 = [(PKDatePickerCellAccessory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_datePicker, a3);
    [(PKDatePickerCellAccessory *)v7 addSubview:v5];
    -[PKDatePickerCellAccessory sizeThatFits:](v7, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    -[PKDatePickerCellAccessory setFrame:](v7, "setFrame:", 0.0, 0.0, v8, v9);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIDatePicker systemLayoutSizeFittingSize:](self->_datePicker, "systemLayoutSizeFittingSize:", 50.0, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(PKDatePickerCellAccessory *)self bounds];
  -[PKDatePickerCellAccessory sizeThatFits:](self, "sizeThatFits:", v3, v4);
  datePicker = self->_datePicker;

  -[UIDatePicker setFrame:](datePicker, "setFrame:", 0.0, 0.0, v5, v6);
}

- (void).cxx_destruct
{
}

@end