@interface PKSuggestionPickerCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)values;
- (PKSuggestionPickerCell)initWithFrame:(CGRect)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)selectionChanged;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setSelectionChanged:(id)a3;
- (void)setValues:(id)a3;
- (void)updateSelectedValue:(id)a3;
@end

@implementation PKSuggestionPickerCell

- (PKSuggestionPickerCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKSuggestionPickerCell;
  v3 = -[PKSuggestionPickerCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    pickerView = v3->_pickerView;
    v3->_pickerView = v4;

    [(UIPickerView *)v3->_pickerView setDelegate:v3];
    [(UIPickerView *)v3->_pickerView setDataSource:v3];
    uint64_t v6 = *MEMORY[0x1E4F85A70];
    [(UIPickerView *)v3->_pickerView setAccessibilityIdentifier:*MEMORY[0x1E4F85A70]];
    v7 = [(PKSuggestionPickerCell *)v3 contentView];
    [v7 addSubview:v3->_pickerView];
    v8 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v7 setBackgroundColor:v8];

    [(PKSuggestionPickerCell *)v3 setAccessibilityIdentifier:v6];
  }
  return v3;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
  id v5 = a3;
  [(UIPickerView *)self->_pickerView reloadAllComponents];
}

- (void)updateSelectedValue:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_values indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = v4;
    pickerView = self->_pickerView;
    [(UIPickerView *)pickerView selectRow:v5 inComponent:0 animated:1];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKSuggestionPickerCell;
  [(PKSuggestionPickerCell *)&v12 layoutSubviews];
  v3 = [(PKSuggestionPickerCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6 + 11.0;
  double v9 = v8 + 0.0;
  double v11 = v10 + -22.0;

  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v7, v9, v11, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_values count];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  selectionChanged = (void (**)(id, int64_t))self->_selectionChanged;
  if (selectionChanged) {
    selectionChanged[2](selectionChanged, a4);
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(NSArray *)self->_values objectAtIndex:a4];
}

- (NSArray)values
{
  return self->_values;
}

- (id)selectionChanged
{
  return self->_selectionChanged;
}

- (void)setSelectionChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionChanged, 0);
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end