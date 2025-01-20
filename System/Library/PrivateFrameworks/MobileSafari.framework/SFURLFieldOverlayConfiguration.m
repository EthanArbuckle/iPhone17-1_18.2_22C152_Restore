@interface SFURLFieldOverlayConfiguration
- (BOOL)placeFirstButtonInLeadingEdge;
- (BOOL)prefersSecondaryText;
- (BOOL)shouldTextShrinkToFit;
- (NSArray)buttonItems;
- (NSString)identifier;
- (NSString)secondaryText;
- (NSString)text;
- (SFURLFieldOverlayConfiguration)initWithIdentifier:(id)a3;
- (UIColor)primaryTextColor;
- (UIColor)prominentButtonBackgroundColor;
- (UIColor)prominentButtonTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)themeColor;
- (UIImage)icon;
- (int64_t)userInterfaceStyle;
- (void)setButtonItems:(id)a3;
- (void)setIcon:(id)a3;
- (void)setPlaceFirstButtonInLeadingEdge:(BOOL)a3;
- (void)setPrefersSecondaryText:(BOOL)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setProminentButtonBackgroundColor:(id)a3;
- (void)setProminentButtonTextColor:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setShouldTextShrinkToFit:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setThemeColor:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation SFURLFieldOverlayConfiguration

- (SFURLFieldOverlayConfiguration)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFURLFieldOverlayConfiguration;
  v5 = [(SFURLFieldOverlayConfiguration *)&v12 init];
  v6 = v5;
  if (v5)
  {
    buttonItems = v5->_buttonItems;
    v5->_buttonItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v8 = [v4 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = v6;
  }

  return v6;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)placeFirstButtonInLeadingEdge
{
  return self->_placeFirstButtonInLeadingEdge;
}

- (void)setPlaceFirstButtonInLeadingEdge:(BOOL)a3
{
  self->_placeFirstButtonInLeadingEdge = a3;
}

- (BOOL)prefersSecondaryText
{
  return self->_prefersSecondaryText;
}

- (void)setPrefersSecondaryText:(BOOL)a3
{
  self->_prefersSecondaryText = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)prominentButtonBackgroundColor
{
  return self->_prominentButtonBackgroundColor;
}

- (void)setProminentButtonBackgroundColor:(id)a3
{
}

- (UIColor)prominentButtonTextColor
{
  return self->_prominentButtonTextColor;
}

- (void)setProminentButtonTextColor:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (BOOL)shouldTextShrinkToFit
{
  return self->_shouldTextShrinkToFit;
}

- (void)setShouldTextShrinkToFit:(BOOL)a3
{
  self->_shouldTextShrinkToFit = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_prominentButtonTextColor, 0);
  objc_storeStrong((id *)&self->_prominentButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_buttonItems, 0);
}

@end