@interface PKPaymentSetupChooseProductListItem
- (BOOL)loadingIndicatorVisible;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (PKPaymentSetupChooseProductListItem)initWithIdentifier:(id)a3 type:(unint64_t)a4 title:(id)a5 subtitle:(id)a6;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setLoadingIndicatorVisible:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentSetupChooseProductListItem

- (PKPaymentSetupChooseProductListItem)initWithIdentifier:(id)a3 type:(unint64_t)a4 title:(id)a5 subtitle:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupChooseProductListItem;
  v14 = [(PKPaymentSetupChooseProductListItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_type = a4;
    objc_storeStrong((id *)&v15->_title, a5);
    objc_storeStrong((id *)&v15->_subtitle, a6);
    v15->_loadingIndicatorVisible = 0;
  }

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)loadingIndicatorVisible
{
  return self->_loadingIndicatorVisible;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
  self->_loadingIndicatorVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end