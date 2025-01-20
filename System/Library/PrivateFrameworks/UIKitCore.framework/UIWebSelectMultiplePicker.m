@interface UIWebSelectMultiplePicker
- (DOMHTMLSelectElement)_selectionNode;
- (NSArray)_cachedItems;
- (UIWebSelectMultiplePicker)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7;
- (UIWebSelectedItemPrivate)_singleSelectionItem;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int)_itemIndexForRowIndex:(int)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6;
- (void)set_cachedItems:(id)a3;
- (void)set_selectionNode:(id)a3;
- (void)set_singleSelectionItem:(id)a3;
@end

@implementation UIWebSelectMultiplePicker

- (UIWebSelectMultiplePicker)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7
{
  BOOL v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)UIWebSelectMultiplePicker;
  v12 = -[UIPickerView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    [(UIView *)v12 setAutoresizingMask:18];
    [(UIPickerView *)v13 setDataSource:v13];
    [(UIPickerView *)v13 setDelegate:v13];
    [(UIPickerView *)v13 _setUsesCheckedSelection:1];
    [(UIPickerView *)v13 _setMagnifierEnabled:0];
    [(UIWebSelectMultiplePicker *)v13 set_selectionNode:a3];
    [(UIWebSelectMultiplePicker *)v13 set_cachedItems:a4];
    [(UIWebSelectMultiplePicker *)v13 set_singleSelectionItem:a5];
    v13->_unint64_t singleSelectionIndex = a6;
    uint64_t v16 = 0;
    [a3 getTextWritingDirection:&v16 override:0];
    v13->_textAlignment = 2 * (v16 != 0);
    [(UIPickerView *)v13 setAllowsMultipleSelection:v7];
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", [(id)UIApp _defaultSceneInterfaceOrientationReturningUnknownForNilScene:0]);
    -[UIView setSize:](v13, "setSize:");
    [(UIPickerView *)v13 reloadAllComponents];
    unint64_t singleSelectionIndex = v13->_singleSelectionIndex;
    if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPickerView *)v13 selectRow:singleSelectionIndex inComponent:0 animated:0];
    }
  }
  return v13;
}

- (void)dealloc
{
  [(UIPickerView *)self setDataSource:0];
  [(UIPickerView *)self setDelegate:0];
  [(UIWebSelectMultiplePicker *)self set_selectionNode:0];
  [(UIWebSelectMultiplePicker *)self set_cachedItems:0];
  [(UIWebSelectMultiplePicker *)self set_singleSelectionItem:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectMultiplePicker;
  [(UIPickerView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  BOOL v3 = [(UIPickerView *)self _needsLayout];
  v8.receiver = self;
  v8.super_class = (Class)UIWebSelectMultiplePicker;
  [(UIPickerView *)&v8 layoutSubviews];
  if (v3)
  {
    unint64_t singleSelectionIndex = self->_singleSelectionIndex;
    if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPickerView *)self selectRow:singleSelectionIndex inComponent:0 animated:0];
    }
  }
  double layoutWidth = self->_layoutWidth;
  [(UIView *)self frame];
  if (layoutWidth != v6)
  {
    [(UIPickerView *)self reloadAllComponents];
    [(UIView *)self frame];
    self->_double layoutWidth = v7;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  WebThreadLock();
  v9 = objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_cachedItems, "objectAtIndex:", a4), "node"), "createPickerCell");
  [(UIPickerView *)self _contentSizeForRow:a4 inComponent:a5];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v10, v12);
  v14 = (void *)[v9 titleLabel];
  objc_msgSend(v9, "labelWidthForBounds:", 0.0, 0.0, v11, v13);
  double v16 = v15;
  objc_super v17 = (void *)[v14 font];
  if (v16 != self->_maximumTextWidth || self->_fontSize == 0.0)
  {
    self->_maximumTextWidth = v16;
    objc_msgSend((id)objc_msgSend(v14, "font"), "pointSize");
    self->_fontSize = adjustedFontSize((uint64_t)v17, self->_cachedItems, v16, v18);
  }
  objc_msgSend(v14, "setFont:", objc_msgSend(v17, "fontWithSize:"));
  [v14 setLineBreakMode:0];
  [v14 setNumberOfLines:2];
  [v14 setTextAlignment:self->_textAlignment];
  return v9;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_cachedItems count];
}

- (int)_itemIndexForRowIndex:(int)a3
{
  unint64_t v4 = 0;
  unint64_t v5 = a3;
  int v6 = -1;
  do
    v6 += objc_msgSend(-[NSArray objectAtIndex:](self->_cachedItems, "objectAtIndex:", v4++), "isGroup") ^ 1;
  while (v4 <= v5);
  return v6;
}

- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  WebThreadLock();
  id v9 = [(NSArray *)self->_cachedItems objectAtIndex:(int)v7];
  if ([(UIPickerView *)self allowsMultipleSelection])
  {
    [(DOMHTMLSelectElement *)[(UIWebSelectMultiplePicker *)self _selectionNode] _activateItemAtIndex:[(UIWebSelectMultiplePicker *)self _itemIndexForRowIndex:v7] allowMultipleSelection:1];
  }
  else
  {
    [(UIWebSelectedItemPrivate *)self->_singleSelectionItem unselect];
    [(UIWebSelectMultiplePicker *)self set_singleSelectionItem:v9];
    self->_unint64_t singleSelectionIndex = (int)v7;
    if (!v6) {
      return;
    }
    [(DOMHTMLSelectElement *)[(UIWebSelectMultiplePicker *)self _selectionNode] _activateItemAtIndex:[(UIWebSelectMultiplePicker *)self _itemIndexForRowIndex:v7]];
  }
  [v9 setSelected:v6];
}

- (DOMHTMLSelectElement)_selectionNode
{
  return self->_selectionNode;
}

- (void)set_selectionNode:(id)a3
{
}

- (NSArray)_cachedItems
{
  return self->_cachedItems;
}

- (void)set_cachedItems:(id)a3
{
}

- (UIWebSelectedItemPrivate)_singleSelectionItem
{
  return self->_singleSelectionItem;
}

- (void)set_singleSelectionItem:(id)a3
{
}

@end