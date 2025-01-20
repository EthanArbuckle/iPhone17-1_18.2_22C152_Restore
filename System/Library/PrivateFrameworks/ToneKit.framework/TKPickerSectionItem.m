@interface TKPickerSectionItem
- (NSString)footerText;
- (NSString)text;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setFooterText:(id)a3;
- (void)_setText:(id)a3;
@end

@implementation TKPickerSectionItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TKPickerSectionItem;
  id v4 = a3;
  [(TKPickerItem *)&v7 _appendDescriptionOfAttributesToString:v4];
  v5 = [(TKPickerSectionItem *)self text];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"text" withStringValue:v5 toString:v4];

  v6 = [(TKPickerSectionItem *)self footerText];
  [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"footerText" withStringValue:v6 toString:v4];
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)_setFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end