@interface PREditingFontAndContentStylePickerSelectionChange
- (NSNumber)fontWeight;
- (NSNumber)isSuggestedContentStyle;
- (NSNumber)isSystemItem;
- (NSNumber)preferredTitleAlignment;
- (NSNumber)preferredTitleLayout;
- (NSString)numberingSystem;
- (NSString)timeFontIdentifier;
- (PRPosterContentStyle)contentStyle;
- (UIFont)customFont;
- (void)setContentStyle:(id)a3;
- (void)setCustomFont:(id)a3;
- (void)setFontWeight:(id)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setPreferredTitleAlignment:(id)a3;
- (void)setPreferredTitleLayout:(id)a3;
- (void)setSuggestedContentStyle:(id)a3;
- (void)setSystemItem:(id)a3;
- (void)setTimeFontIdentifier:(id)a3;
@end

@implementation PREditingFontAndContentStylePickerSelectionChange

- (NSString)timeFontIdentifier
{
  return self->_timeFontIdentifier;
}

- (void)setTimeFontIdentifier:(id)a3
{
}

- (NSNumber)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setPreferredTitleAlignment:(id)a3
{
}

- (NSNumber)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleLayout:(id)a3
{
}

- (NSNumber)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(id)a3
{
}

- (NSNumber)isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(id)a3
{
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void)setCustomFont:(id)a3
{
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (void)setContentStyle:(id)a3
{
}

- (NSNumber)isSuggestedContentStyle
{
  return self->_suggestedContentStyle;
}

- (void)setSuggestedContentStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContentStyle, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
  objc_storeStrong((id *)&self->_fontWeight, 0);
  objc_storeStrong((id *)&self->_preferredTitleLayout, 0);
  objc_storeStrong((id *)&self->_preferredTitleAlignment, 0);
  objc_storeStrong((id *)&self->_timeFontIdentifier, 0);
}

@end