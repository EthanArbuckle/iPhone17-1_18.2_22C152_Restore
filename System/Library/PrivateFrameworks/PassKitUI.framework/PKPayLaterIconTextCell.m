@interface PKPayLaterIconTextCell
- (NSString)amountText;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSString)tertiaryText;
- (UIColor)amountTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (UIFont)amountFont;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (UIFont)tertiaryFont;
- (unint64_t)accessory;
- (void)_createViewIfNecessary;
- (void)prepareForReuse;
- (void)setAccessory:(unint64_t)a3;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setAmountTextColor:(id)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setTertiaryFont:(id)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
@end

@implementation PKPayLaterIconTextCell

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(PKTitleDetailValueTextView *)view setPrimaryText:v6];
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(PKTitleDetailValueTextView *)view setSecondaryText:v6];
}

- (void)setTertiaryText:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(PKTitleDetailValueTextView *)view setTertiaryText:v6];
}

- (void)setAmountText:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  view = self->_view;
  objc_msgSend(v4, "pk_attributedString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(PKTitleDetailValueTextView *)view setAmountText:v6];
}

- (void)setPrimaryFont:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setPrimaryFont:v4];
}

- (void)setSecondaryFont:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setSecondaryFont:v4];
}

- (void)setTertiaryFont:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setTertiaryFont:v4];
}

- (void)setAmountFont:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setAmountFont:v4];
}

- (void)setPrimaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setPrimaryTextColor:v4];
}

- (void)setSecondaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setSecondaryTextColor:v4];
}

- (void)setTertiaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setTertiaryTextColor:v4];
}

- (void)setAmountTextColor:(id)a3
{
  id v4 = a3;
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  [(PKTitleDetailValueTextView *)self->_view setAmountTextColor:v4];
}

- (void)setAccessory:(unint64_t)a3
{
  [(PKPayLaterIconTextCell *)self _createViewIfNecessary];
  view = self->_view;

  [(PKTitleDetailValueTextView *)view setAccessory:a3];
}

- (void)_createViewIfNecessary
{
  if (!self->_view)
  {
    v3 = objc_alloc_init(PKTitleDetailValueTextView);
    view = self->_view;
    self->_view = v3;

    v5 = self->_view;
    [(PKPayLaterIconCell *)self setView:v5];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterIconTextCell;
  [(PKPayLaterIconCell *)&v4 prepareForReuse];
  [(PKTitleDetailValueTextView *)self->_view removeFromSuperview];
  view = self->_view;
  self->_view = 0;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end