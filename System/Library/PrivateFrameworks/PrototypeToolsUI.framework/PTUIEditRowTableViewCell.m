@interface PTUIEditRowTableViewCell
+ (int64_t)cellStyleForRow:(id)a3;
- (PTUIEditRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)textForValue:(id)a3;
- (id)valueForText:(id)a3;
- (void)numericKeypadDidUpdateValue:(id)a3;
- (void)numericKeypadWillDismiss:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateDisplayedValue;
@end

@implementation PTUIEditRowTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1000;
}

- (PTUIEditRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PTUIEditRowTableViewCell;
  v4 = [(PTUIEditRowTableViewCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PTUIEditRowTableViewCell *)v4 editableTextField];
    [v6 setTextAlignment:2];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(PTUIEditRowTableViewCell *)v5 editableTextField];
      v8 = v7;
      uint64_t v9 = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v7 = [(PTUIEditRowTableViewCell *)v5 editableTextField];
      v8 = v7;
      if (isKindOfClass)
      {
        [v7 setKeyboardType:8];

        v7 = [(PTUIEditRowTableViewCell *)v5 editableTextField];
        v8 = v7;
      }
      uint64_t v9 = 0;
    }
    [v7 setClearButtonMode:v9];

    v11 = [(PTUIEditRowTableViewCell *)v5 editableTextField];
    [v11 setDelegate:v5];
  }
  return v5;
}

- (void)updateDisplayedValue
{
  v3 = [(PTUIRowTableViewCell *)self row];
  id v6 = [v3 value];

  v4 = [(PTUIEditRowTableViewCell *)self editableTextField];
  v5 = [(PTUIEditRowTableViewCell *)self textForValue:v6];
  [v4 setText:v5];
}

- (id)textForValue:(id)a3
{
  return 0;
}

- (id)valueForText:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && PTUINumericKeypadIsNeeded())
  {
    v4 = +[PTUINumericKeypad sharedKeypad];
    v5 = [v7 text];
    [v4 setStringValue:v5];

    id v6 = +[PTUINumericKeypad sharedKeypad];
    [v6 showAnimated:1 forDelegate:self];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  [a3 setTextAlignment:2];
  v4 = [(PTUIEditRowTableViewCell *)self editableTextField];
  id v8 = [v4 text];

  v5 = [(PTUIRowTableViewCell *)self row];
  id v6 = [(PTUIEditRowTableViewCell *)self valueForText:v8];
  [v5 setValue:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && PTUINumericKeypadIsNeeded())
  {
    id v7 = +[PTUINumericKeypad sharedKeypad];
    [v7 hideAnimated:1];
  }
}

- (void)numericKeypadDidUpdateValue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __56__PTUIEditRowTableViewCell_numericKeypadDidUpdateValue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) editableTextField];
  id v3 = [*(id *)(a1 + 40) stringValue];
  [v2 setText:v3];

  id v4 = [*(id *)(a1 + 32) editableTextField];
  [v4 sendActionsForControlEvents:4096];
}

- (void)numericKeypadWillDismiss:(id)a3
{
}

void __53__PTUIEditRowTableViewCell_numericKeypadWillDismiss___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editableTextField];
  [v1 resignFirstResponder];
}

@end