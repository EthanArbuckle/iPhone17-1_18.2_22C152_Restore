@interface TKPickerSelectableItem
- (BOOL)shouldPreventSelection;
- (BOOL)shouldTintText;
- (BOOL)showsCheckmark;
- (BOOL)showsDisclosureIndicator;
- (NSString)detailText;
- (NSString)text;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setDetailText:(id)a3;
- (void)_setShouldPreventSelection:(BOOL)a3;
- (void)_setShouldTintText:(BOOL)a3;
- (void)_setShowsCheckmark:(BOOL)a3;
- (void)_setShowsDisclosureIndicator:(BOOL)a3;
- (void)_setText:(id)a3;
@end

@implementation TKPickerSelectableItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v7 = a3;
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"section" withIntegerValue:[(TKPickerItem *)self section] toString:v7];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"row" withIntegerValue:[(TKPickerRowItem *)self row] toString:v7];
  if ([(TKPickerSelectableItem *)self conformsToProtocol:&unk_26D3116E0])
  {
    uint64_t v4 = [(TKPickerSelectableItem *)self numberOfChildren];
    if (v4 >= 1) {
      [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"numberOfChildren" withIntegerValue:v4 toString:v7];
    }
  }
  v5 = [(TKPickerSelectableItem *)self text];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"text" withStringValue:v5 toString:v7];

  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"shouldTintText" withBoolValue:[(TKPickerSelectableItem *)self shouldTintText] toString:v7];
  v6 = [(TKPickerSelectableItem *)self detailText];
  if (v6) {
    [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"detailText" withStringValue:v6 toString:v7];
  }
  if ([(TKPickerSelectableItem *)self showsCheckmark]) {
    [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"showsCheckmark" withBoolValue:1 toString:v7];
  }
  if ([(TKPickerSelectableItem *)self showsDisclosureIndicator]) {
    [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"showsDisclosureIndicator" withBoolValue:1 toString:v7];
  }
  if ([(TKPickerSelectableItem *)self shouldPreventSelection]) {
    [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"shouldPreventSelection" withBoolValue:1 toString:v7];
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
}

- (BOOL)shouldTintText
{
  return self->_shouldTintText;
}

- (void)_setShouldTintText:(BOOL)a3
{
  self->_shouldTintText = a3;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)_setDetailText:(id)a3
{
}

- (BOOL)showsCheckmark
{
  return self->_showsCheckmark;
}

- (void)_setShowsCheckmark:(BOOL)a3
{
  self->_showsCheckmark = a3;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (void)_setShowsDisclosureIndicator:(BOOL)a3
{
  self->_showsDisclosureIndicator = a3;
}

- (BOOL)shouldPreventSelection
{
  return self->_shouldPreventSelection;
}

- (void)_setShouldPreventSelection:(BOOL)a3
{
  self->_shouldPreventSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end