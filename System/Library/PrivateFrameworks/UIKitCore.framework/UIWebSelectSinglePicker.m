@interface UIWebSelectSinglePicker
- (UIWebSelectSinglePicker)initWithDOMHTMLSelectElement:(id)a3 allItems:(id)a4;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)controlEndEditing;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation UIWebSelectSinglePicker

- (UIWebSelectSinglePicker)initWithDOMHTMLSelectElement:(id)a3 allItems:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)UIWebSelectSinglePicker;
  v6 = -[UIPickerView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    [(UIPickerView *)v6 setDelegate:v6];
    [(UIPickerView *)v7 setDataSource:v7];
    [(UIView *)v7 setAutoresizingMask:18];
    v7->_selectNode = (DOMHTMLSelectElement *)a3;
    v7->_optionItems = (NSArray *)a4;
    v7->_selectedOptionItem = 0;
    v7->_int64_t selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_optionToSelectWhenDone = 0;
    v7->_indexToSelectWhenDone = 0x7FFFFFFFFFFFFFFFLL;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    optionItems = v7->_optionItems;
    uint64_t v9 = [(NSArray *)optionItems countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int64_t v11 = 0;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(optionItems);
          }
          v14 = *(UIWebSelectedItemPrivate **)(*((void *)&v17 + 1) + 8 * i);
          if (([(UIWebSelectedItemPrivate *)v14 isGroup] & 1) == 0)
          {
            if ([(UIWebSelectedItemPrivate *)v14 selected])
            {
              v7->_selectedOptionItem = v14;
              v7->_int64_t selectedIndex = v11;
              goto LABEL_14;
            }
            ++v11;
          }
        }
        uint64_t v10 = [(NSArray *)optionItems countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
    [(UIPickerView *)v7 reloadAllComponents];
    int64_t selectedIndex = v7->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPickerView *)v7 selectRow:selectedIndex inComponent:0 animated:0];
    }
  }
  return v7;
}

- (void)dealloc
{
  [(UIPickerView *)self setDelegate:0];
  [(UIPickerView *)self setDataSource:0];

  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectSinglePicker;
  [(UIPickerView *)&v3 dealloc];
}

- (void)controlEndEditing
{
  optionToSelectWhenDone = self->_optionToSelectWhenDone;
  if (optionToSelectWhenDone && optionToSelectWhenDone != self->_selectedOptionItem)
  {
    WebThreadLock();
    [(UIWebSelectedItemPrivate *)self->_selectedOptionItem unselect];
    [(DOMHTMLSelectElement *)self->_selectNode _activateItemAtIndex:LODWORD(self->_indexToSelectWhenDone)];
    v4 = self->_optionToSelectWhenDone;
    [(UIWebSelectedItemPrivate *)v4 setSelected:1];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_optionItems count];
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  WebThreadLock();
  v7 = objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", a4), "node");
  v8 = objc_msgSend((id)objc_msgSend(v7, "text"), "_uikit_stringByTrimmingWhitespaceAndNewlines");
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  if ([v7 disabled]) {
    objc_msgSend(v9, "addAttribute:value:range:", *(void *)off_1E52D2048, +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3), 0, objc_msgSend(v8, "length"));
  }
  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  WebThreadLock();
  if (objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", a4), "node"), "disabled"))
  {
    uint64_t v7 = a4;
    while (v7 > 0)
    {
      if ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", --v7), "node"), "disabled") & 1) == 0)
      {
LABEL_10:
        [(UIPickerView *)self selectRow:v7 inComponent:0 animated:1];
        a4 = v7;
        goto LABEL_11;
      }
    }
    uint64_t v7 = a4;
    while (++v7 < [(NSArray *)self->_optionItems count])
    {
      if ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", v7), "node"), "disabled") & 1) == 0)
      {
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          return;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_11:
    self->_indexToSelectWhenDone = a4;
    self->_optionToSelectWhenDone = (UIWebSelectedItemPrivate *)[(NSArray *)self->_optionItems objectAtIndex:a4];
  }
}

@end