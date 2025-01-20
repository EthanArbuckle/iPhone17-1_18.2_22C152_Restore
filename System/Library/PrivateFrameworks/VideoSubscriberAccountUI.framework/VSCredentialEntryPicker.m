@interface VSCredentialEntryPicker
- (NSArray)pickerItems;
- (NSString)title;
- (id)pickerItemAtCurrentIndex;
- (int64_t)selectedIndex;
- (void)setPickerItems:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSCredentialEntryPicker

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (id)pickerItemAtCurrentIndex
{
  v3 = [(VSCredentialEntryPicker *)self pickerItems];
  v4 = objc_msgSend(v3, "objectAtIndex:", -[VSCredentialEntryPicker selectedIndex](self, "selectedIndex"));

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void)setPickerItems:(id)a3
{
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItems, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end