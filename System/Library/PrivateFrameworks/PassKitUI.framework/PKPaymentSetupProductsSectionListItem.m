@interface PKPaymentSetupProductsSectionListItem
- (NSOrderedSet)searchTerms;
- (NSString)sectionIdentifier;
- (PKPaymentSetupProduct)product;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)isLoadingIcon;
- (void)setIsLoadingIcon:(unint64_t)a3;
- (void)setProduct:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSectionIdentifier:(id)a3;
@end

@implementation PKPaymentSetupProductsSectionListItem

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupProductsSectionListItem;
  id v5 = -[PKPaymentSetupListItem copyWithZone:](&v11, sel_copyWithZone_);
  uint64_t v6 = [(PKPaymentSetupProduct *)self->_product copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v6;

  uint64_t v8 = [(NSOrderedSet *)self->_searchTerms copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v8;

  *((void *)v5 + 10) = self->_isLoadingIcon;
  objc_storeStrong((id *)v5 + 11, self->_sectionIdentifier);
  return v5;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (NSOrderedSet)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (unint64_t)isLoadingIcon
{
  return self->_isLoadingIcon;
}

- (void)setIsLoadingIcon:(unint64_t)a3
{
  self->_isLoadingIcon = a3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);

  objc_storeStrong((id *)&self->_product, 0);
}

@end