@interface PKPaymentPreferenceListItem
- (BOOL)isAddItem;
- (BOOL)isOptionItem;
- (BOOL)supportsInlineEditing;
- (BOOL)supportsSwipeActionType:(int)a3;
- (PKPaymentPreference)sectionPreference;
- (PKPaymentPreferenceListItem)initWithSectionPreference:(id)a3;
- (id)_image;
- (id)_internalConfiguration;
- (id)_secondaryText;
- (id)_text;
- (id)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultAccessories;
@end

@implementation PKPaymentPreferenceListItem

- (PKPaymentPreferenceListItem)initWithSectionPreference:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceListItem;
  v6 = [(PKPaymentPreferenceListItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sectionPreference, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)[(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong(v4 + 1, self->_sectionPreference);
  return v4;
}

- (id)_internalConfiguration
{
  return (id)[MEMORY[0x1E4FB1948] cellConfiguration];
}

- (id)configuration
{
  v3 = [(PKPaymentPreferenceListItem *)self _internalConfiguration];
  v4 = [(PKPaymentPreferenceListItem *)self _text];
  [v3 setText:v4];

  id v5 = [(PKPaymentPreferenceListItem *)self _secondaryText];
  [v3 setSecondaryText:v5];

  v6 = [(PKPaymentPreferenceListItem *)self _image];
  [v3 setImage:v6];

  v7 = [v3 secondaryTextProperties];
  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v7 setColor:v8];

  [v3 directionalLayoutMargins];
  [v3 setDirectionalLayoutMargins:10.0];

  return v3;
}

- (id)_text
{
  return 0;
}

- (id)_secondaryText
{
  return 0;
}

- (id)_image
{
  return 0;
}

- (id)defaultAccessories
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsSwipeActionType:(int)a3
{
  return 0;
}

- (BOOL)supportsInlineEditing
{
  return 0;
}

- (BOOL)isOptionItem
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isAddItem
{
  return objc_opt_isKindOfClass() & 1;
}

- (PKPaymentPreference)sectionPreference
{
  return self->_sectionPreference;
}

- (void).cxx_destruct
{
}

@end