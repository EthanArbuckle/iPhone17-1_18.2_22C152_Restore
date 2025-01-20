@interface VSPSPickerTableViewCell
+ (double)preferredHeight;
- (UIPickerView)pickerView;
- (VSPSPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)targetAsDelegate;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation VSPSPickerTableViewCell

+ (double)preferredHeight
{
  return 216.0;
}

- (VSPSPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)VSPSPickerTableViewCell;
  v9 = [(PSTableCell *)&v26 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(PSTableCell *)v9 setSpecifier:v8];
    v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x263F1C858]);
    pickerView = v10->_pickerView;
    v10->_pickerView = v11;

    [(UIPickerView *)v10->_pickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPickerView *)v10->_pickerView setDelegate:v10];
    [(UIPickerView *)v10->_pickerView setDataSource:v10];
    id v13 = objc_alloc(MEMORY[0x263F1CB60]);
    v14 = [(VSPSPickerTableViewCell *)v10 contentView];
    [v14 bounds];
    v15 = objc_msgSend(v13, "initWithFrame:");

    [v15 setAutoresizingMask:18];
    [v15 setClipsToBounds:1];
    v16 = [(VSPSPickerTableViewCell *)v10 contentView];
    [v16 addSubview:v15];

    [v15 addSubview:v10->_pickerView];
    v17 = [(VSPSPickerTableViewCell *)v10 targetAsDelegate];
    uint64_t v18 = [v17 pickerViewCellInitialSelectedRow:v10];

    [(UIPickerView *)v10->_pickerView selectRow:v18 inComponent:0 animated:0];
    v19 = [(UIPickerView *)v10->_pickerView leadingAnchor];
    v20 = [v15 leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(UIPickerView *)v10->_pickerView trailingAnchor];
    v23 = [v15 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];
  }
  return v10;
}

- (id)targetAsDelegate
{
  v3 = [(PSTableCell *)self specifier];
  v4 = [v3 target];
  int v5 = [v4 conformsToProtocol:&unk_26F3BFB40];

  if (v5)
  {
    v6 = [(PSTableCell *)self specifier];
    v7 = [v6 target];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int v5 = [(VSPSPickerTableViewCell *)self targetAsDelegate];
  int64_t v6 = [v5 pickerViewCellNumberOfRows:self];

  return v6;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = [(VSPSPickerTableViewCell *)self targetAsDelegate];
  id v8 = [v7 pickerViewCell:self titleForRow:a4];

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = [(VSPSPickerTableViewCell *)self targetAsDelegate];
  [v7 pickerViewCell:self didSelectRow:a4];
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void).cxx_destruct
{
}

@end