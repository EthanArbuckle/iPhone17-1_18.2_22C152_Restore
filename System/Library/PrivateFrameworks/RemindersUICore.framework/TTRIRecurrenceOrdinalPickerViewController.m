@interface TTRIRecurrenceOrdinalPickerViewController
- (NSArray)columnWidths;
- (TTRIRecurrenceOrdinalPickerViewControllerDelegate)delegate;
- (UIFont)labelFont;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)_leftColumn;
- (id)_rightColumn;
- (id)computeColumnWidthsWithFont:(id)a3;
- (id)newLabel;
- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (id)roundedSystemFontOfSize:(int64_t)a3;
- (id)titleForRow:(int64_t)a3 forComponent:(int64_t)a4;
- (int)dayMask;
- (int)ordinalValue;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)computeLabelFontAndColumnWidths;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setColumnWidths:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIRecurrenceOrdinalPickerViewController

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1A98]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setDataSource:self];
  [v5 setDelegate:self];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v4];

  [(TTRIRecurrenceOrdinalPickerViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TTRIRecurrenceOrdinalPickerViewController;
  [(TTRIRecurrenceOrdinalPickerViewController *)&v4 viewDidLoad];
  id v3 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
  [v3 _setHostsLayoutEngine:0];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = [(TTRIRecurrenceOrdinalPickerViewController *)self _rightColumn];
  }
  else
  {
    if (a4)
    {
      int64_t v9 = 0;
      goto LABEL_7;
    }
    v7 = [(TTRIRecurrenceOrdinalPickerViewController *)self _leftColumn];
  }
  v8 = v7;
  int64_t v9 = [v7 count];

LABEL_7:
  return v9;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v6 = [(TTRIRecurrenceOrdinalPickerViewController *)self columnWidths];
  unint64_t v7 = [v6 count];

  if (v7 <= 1) {
    [(TTRIRecurrenceOrdinalPickerViewController *)self computeLabelFontAndColumnWidths];
  }
  v8 = [(TTRIRecurrenceOrdinalPickerViewController *)self columnWidths];
  int64_t v9 = [v8 objectAtIndexedSubscript:a4];

  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = [(TTRIRecurrenceOrdinalPickerViewController *)self newLabel];
  }
  double v11 = v10;
  v12 = [(TTRIRecurrenceOrdinalPickerViewController *)self titleForRow:a4 forComponent:a5];
  [v11 setText:v12];

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(TTRIRecurrenceOrdinalPickerViewController *)self delegate];
  [v6 frequencyPickerUpdated:self];
}

- (id)pickerView:(id)a3 accessibilityLabelForComponent:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = RemindersUICoreBundleGet();
    unint64_t v7 = v6;
    v8 = @"Day of The Week";
    goto LABEL_5;
  }
  if (!a4)
  {
    id v6 = RemindersUICoreBundleGet();
    unint64_t v7 = v6;
    v8 = @"Ordinal";
LABEL_5:
    id v9 = [v6 localizedStringForKey:v8 value:v8 table:@"Localizable"];

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (id)newLabel
{
  id v3 = [(TTRIRecurrenceOrdinalPickerViewController *)self labelFont];

  if (!v3) {
    [(TTRIRecurrenceOrdinalPickerViewController *)self computeLabelFontAndColumnWidths];
  }
  objc_super v4 = objc_opt_new();
  id v5 = [(TTRIRecurrenceOrdinalPickerViewController *)self labelFont];
  [v4 setFont:v5];

  [v4 setTextAlignment:1];
  return v4;
}

- (id)titleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  if (a4) {
    [(TTRIRecurrenceOrdinalPickerViewController *)self _rightColumn];
  }
  else {
  id v5 = [(TTRIRecurrenceOrdinalPickerViewController *)self _leftColumn];
  }
  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (void)computeLabelFontAndColumnWidths
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
  [v3 bounds];
  double v5 = v4 + -46.0;

  id v6 = [(TTRIRecurrenceOrdinalPickerViewController *)self roundedSystemFontOfSize:23];
  [(TTRIRecurrenceOrdinalPickerViewController *)self computeColumnWidthsWithFont:v6];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) doubleValue];
        double v11 = v11 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  if (v11 > v5)
  {
    double v14 = 23.0;
    do
    {
      v15 = v6;
      id v6 = [(TTRIRecurrenceOrdinalPickerViewController *)self roundedSystemFontOfSize:(uint64_t)v14];

      v16 = [(TTRIRecurrenceOrdinalPickerViewController *)self computeColumnWidthsWithFont:v6];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = v16;
      uint64_t v17 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        double v20 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * j) doubleValue];
            double v20 = v20 + v22;
          }
          uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v18);
      }
      else
      {
        double v20 = 0.0;
      }

      if (v20 < v5) {
        break;
      }
      double v14 = v14 + -1.0;
    }
    while (v14 > 12.0 && v20 > v5);
  }
  [(TTRIRecurrenceOrdinalPickerViewController *)self setLabelFont:v6];
  [(TTRIRecurrenceOrdinalPickerViewController *)self setColumnWidths:v7];
}

- (id)roundedSystemFontOfSize:(int64_t)a3
{
  double v3 = (double)a3;
  double v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:(double)a3 weight:*MEMORY[0x1E4FB09D8]];
  double v5 = [v4 fontDescriptor];
  id v6 = [v5 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];
  id v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:v3];

  return v7;
}

- (id)computeColumnWidthsWithFont:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = objc_opt_new();
  long long v27 = v4;
  [v5 setFont:v4];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v29 = self;
  obuint64_t j = [(TTRIRecurrenceOrdinalPickerViewController *)self _leftColumn];
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        double v13 = [(TTRIRecurrenceOrdinalPickerViewController *)v29 _rightColumn];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              [v5 setText:v12];
              [v5 intrinsicContentSize];
              double v20 = ceil(v19);
              [v5 setText:v18];
              [v5 intrinsicContentSize];
              double v22 = ceil(v21);
              if (v20 >= v10) {
                double v10 = v20;
              }
              if (v22 >= v9) {
                double v9 = v22;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v15);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
  }

  v23 = [NSNumber numberWithDouble:v10];
  v38[0] = v23;
  long long v24 = [NSNumber numberWithDouble:v9];
  v38[1] = v24;
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];

  return v25;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setDays:", -[TTRIRecurrenceOrdinalPickerViewController dayMask](self, "dayMask"));
  objc_msgSend(v4, "setOrdinalValue:", -[TTRIRecurrenceOrdinalPickerViewController ordinalValue](self, "ordinalValue"));
}

- (void)updateFromRecurrenceRule:(id)a3
{
  id v13 = a3;
  id v4 = [v13 setPositions];
  double v5 = [v4 firstObject];

  uint64_t v6 = [v13 daysOfTheWeek];
  if ([v6 count])
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    if ([v6 count] == 1)
    {
      uint64_t v8 = [v7 dayOfTheWeek] - 1;
    }
    else if ([v13 isWeekendRule])
    {
      uint64_t v8 = 9;
    }
    else if ([v13 isWeekdayRule])
    {
      uint64_t v8 = 8;
    }
    else if ([v13 isAnyDayRule])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v9 = [v7 weekNumber];

    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5) {
LABEL_14:
    }
      unint64_t v9 = [v5 integerValue];
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
    [v10 selectRow:v8 inComponent:1 animated:0];
  }
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 <= 5) {
      uint64_t v11 = v9 - 1;
    }
    else {
      uint64_t v11 = 5;
    }
    uint64_t v12 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
    [v12 selectRow:v11 inComponent:0 animated:0];
  }
}

- (int)dayMask
{
  v2 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
  uint64_t v3 = [v2 selectedRowInComponent:1];

  if (v3 > 6)
  {
    if ((unint64_t)(v3 - 7) > 2) {
      return 0;
    }
    else {
      return dword_1B9977FA8[v3 - 7];
    }
  }
  else
  {
    return +[TTRIRecurrenceChooserController dayFromNumber:v3 + 1];
  }
}

- (int)ordinalValue
{
  v2 = [(TTRIRecurrenceOrdinalPickerViewController *)self pickerView];
  int v3 = [v2 selectedRowInComponent:0];

  return v3 + 1;
}

- (id)_leftColumn
{
  if (_leftColumn_onceToken != -1) {
    dispatch_once(&_leftColumn_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_leftColumn___leftColumn;

  return v2;
}

void __56__TTRIRecurrenceOrdinalPickerViewController__leftColumn__block_invoke()
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v13 = RemindersUICoreBundleGet();
  uint64_t v12 = [v13 localizedStringForKey:@"first" value:@"first" table:@"Localizable"];
  v14[0] = v12;
  v0 = RemindersUICoreBundleGet();
  v1 = [v0 localizedStringForKey:@"second" value:@"second" table:@"Localizable"];
  v14[1] = v1;
  v2 = RemindersUICoreBundleGet();
  int v3 = [v2 localizedStringForKey:@"third" value:@"third" table:@"Localizable"];
  v14[2] = v3;
  id v4 = RemindersUICoreBundleGet();
  double v5 = [v4 localizedStringForKey:@"fourth" value:@"fourth" table:@"Localizable"];
  v14[3] = v5;
  uint64_t v6 = RemindersUICoreBundleGet();
  uint64_t v7 = [v6 localizedStringForKey:@"fifth" value:@"fifth" table:@"Localizable"];
  v14[4] = v7;
  uint64_t v8 = RemindersUICoreBundleGet();
  unint64_t v9 = [v8 localizedStringForKey:@"last" value:@"last" table:@"Localizable"];
  v14[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];
  uint64_t v11 = (void *)_leftColumn___leftColumn;
  _leftColumn___leftColumn = v10;
}

- (id)_rightColumn
{
  if (_rightColumn_onceToken != -1) {
    dispatch_once(&_rightColumn_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)_rightColumn___rightColumn;

  return v2;
}

void __57__TTRIRecurrenceOrdinalPickerViewController__rightColumn__block_invoke()
{
  v15[10] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = CUIKStringForDayOfWeekNotStandalone();
  v15[0] = v14;
  id v13 = CUIKStringForDayOfWeekNotStandalone();
  v15[1] = v13;
  uint64_t v12 = CUIKStringForDayOfWeekNotStandalone();
  v15[2] = v12;
  v0 = CUIKStringForDayOfWeekNotStandalone();
  v15[3] = v0;
  v1 = CUIKStringForDayOfWeekNotStandalone();
  v15[4] = v1;
  v2 = CUIKStringForDayOfWeekNotStandalone();
  v15[5] = v2;
  int v3 = CUIKStringForDayOfWeekNotStandalone();
  v15[6] = v3;
  id v4 = RemindersUICoreBundleGet();
  double v5 = [v4 localizedStringForKey:@"day" value:@"day" table:@"Localizable"];
  v15[7] = v5;
  uint64_t v6 = RemindersUICoreBundleGet();
  uint64_t v7 = [v6 localizedStringForKey:@"weekday" value:@"weekday" table:@"Localizable"];
  v15[8] = v7;
  uint64_t v8 = RemindersUICoreBundleGet();
  unint64_t v9 = [v8 localizedStringForKey:@"weekend day" value:@"weekend day" table:@"Localizable"];
  v15[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:10];
  uint64_t v11 = (void *)_rightColumn___rightColumn;
  _rightColumn___rightColumn = v10;
}

- (TTRIRecurrenceOrdinalPickerViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TTRIRecurrenceOrdinalPickerViewControllerDelegate *)a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (void)setColumnWidths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);

  objc_storeStrong((id *)&self->_labelFont, 0);
}

@end