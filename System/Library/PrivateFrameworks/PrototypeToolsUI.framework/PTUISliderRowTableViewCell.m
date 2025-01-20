@interface PTUISliderRowTableViewCell
- (PTUISliderRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)valueForText:(id)a3;
- (void)_valueChanged:(id)a3;
- (void)numericKeypadDidUpdateValue:(id)a3;
- (void)numericKeypadWillDismiss:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateCellCharacteristics;
- (void)updateDisplayedValue;
- (void)updateLabel;
@end

@implementation PTUISliderRowTableViewCell

- (id)valueForText:(id)a3
{
  v3 = NSNumber;
  [a3 floatValue];

  return (id)objc_msgSend(v3, "numberWithFloat:");
}

- (PTUISliderRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)PTUISliderRowTableViewCell;
  v4 = [(PTUISliderRowTableViewCell *)&v22 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    slider = v4->_slider;
    v4->_slider = (UISlider *)v5;

    [(UISlider *)v4->_slider setContinuous:1];
    [(UISlider *)v4->_slider addTarget:v4 action:sel__valueChanged_ forControlEvents:4096];
    id v7 = objc_alloc(MEMORY[0x263F1CA98]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v8;

    [(UITextField *)v4->_textField setUserInteractionEnabled:1];
    [(UITextField *)v4->_textField setKeyboardType:8];
    [(UITextField *)v4->_textField setDelegate:v4];
    id v10 = objc_alloc(MEMORY[0x263F1C9B8]);
    v23[0] = v4->_slider;
    v23[1] = v4->_textField;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v12 = (void *)[v10 initWithArrangedSubviews:v11];

    [v12 setAxis:0];
    [v12 setSpacing:10.0];
    [v12 frame];
    double v14 = v13;
    [v12 frame];
    double v16 = v15;
    v17 = [(PTUISliderRowTableViewCell *)v4 _tableView];
    [v17 frame];
    double v19 = v18 * 0.5;
    v20 = [(PTUISliderRowTableViewCell *)v4 _tableView];
    [v20 frame];
    objc_msgSend(v12, "setFrame:", v14, v16, v19);

    [(PTUISliderRowTableViewCell *)v4 setAccessoryView:v12];
  }
  return v4;
}

- (void)updateLabel
{
}

void __41__PTUISliderRowTableViewCell_updateLabel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) row];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6
    && ([v6 valueStringFormatter], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    uint64_t v8 = [v6 valueStringFormatter];
    v9 = NSNumber;
    [*(id *)(*(void *)(a1 + 32) + 1024) value];
    id v10 = objc_msgSend(v9, "numberWithFloat:");
    v11 = [*(id *)(a1 + 32) row];
    v12 = [v11 settings];
    ((void (**)(void, void *, void *))v8)[2](v8, v10, v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = (uint64_t)v16;
  }
  else
  {
    double v14 = NSString;
    [*(id *)(*(void *)(a1 + 32) + 1024) value];
    uint64_t v13 = objc_msgSend(v14, "stringWithFormat:", @"%.02f", v15);
  }
  id v17 = (id)v13;
  [*(id *)(*(void *)(a1 + 32) + 1032) setText:v13];
}

- (void)updateCellCharacteristics
{
}

void __55__PTUISliderRowTableViewCell_updateCellCharacteristics__block_invoke(uint64_t a1)
{
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PTUISliderRowTableViewCell;
  objc_msgSendSuper2(&v7, sel_updateCellCharacteristics);
  v2 = [*(id *)(a1 + 32) row];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1024);
  [v2 minValue];
  *(float *)&double v4 = v4;
  [v3 setMinimumValue:v4];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1024);
  [v2 maxValue];
  *(float *)&double v6 = v6;
  [v5 setMaximumValue:v6];
}

- (void)updateDisplayedValue
{
}

void __50__PTUISliderRowTableViewCell_updateDisplayedValue__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) row];
  id v4 = [v2 value];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1024);
  [v4 floatValue];
  objc_msgSend(v3, "setValue:");
  [*(id *)(a1 + 32) updateLabel];
}

- (void)_valueChanged:(id)a3
{
}

uint64_t __44__PTUISliderRowTableViewCell__valueChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) value];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) row];
  uint64_t v5 = [NSNumber numberWithDouble:v3];
  [v4 setValue:v5];

  double v6 = *(void **)(a1 + 32);

  return [v6 updateLabel];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v7 = a3;
  if (PTUINumericKeypadIsNeeded())
  {
    id v4 = +[PTUINumericKeypad sharedKeypad];
    uint64_t v5 = [v7 text];
    [v4 setStringValue:v5];

    double v6 = +[PTUINumericKeypad sharedKeypad];
    [v6 showAnimated:1 forDelegate:self];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  [a3 setTextAlignment:2];
  id v7 = [(UITextField *)self->_textField text];
  id v4 = [(PTUIRowTableViewCell *)self row];
  uint64_t v5 = [(PTUISliderRowTableViewCell *)self valueForText:v7];
  [v4 setValue:v5];

  if (PTUINumericKeypadIsNeeded())
  {
    double v6 = +[PTUINumericKeypad sharedKeypad];
    [v6 hideAnimated:1];
  }
}

- (void)numericKeypadDidUpdateValue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __58__PTUISliderRowTableViewCell_numericKeypadDidUpdateValue___block_invoke(uint64_t a1)
{
  float v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  [*(id *)(a1 + 40) doubleValue];
  *(float *)&double v3 = v3;
  [v2 setValue:v3];
  [*(id *)(*(void *)(a1 + 32) + 1024) sendActionsForControlEvents:4096];
  id v4 = *(void **)(a1 + 32);

  return [v4 updateLabel];
}

- (void)numericKeypadWillDismiss:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __55__PTUISliderRowTableViewCell_numericKeypadWillDismiss___block_invoke(uint64_t a1)
{
  float v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  [*(id *)(a1 + 40) doubleValue];
  *(float *)&double v3 = v3;
  [v2 setValue:v3];
  [*(id *)(a1 + 32) updateLabel];
  if (PTUINumericKeypadIsNeeded())
  {
    id v4 = +[PTUINumericKeypad sharedKeypad];
    [v4 hideAnimated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_slider, 0);
}

@end