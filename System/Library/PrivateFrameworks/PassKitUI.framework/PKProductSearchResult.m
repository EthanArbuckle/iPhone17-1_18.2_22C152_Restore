@interface PKProductSearchResult
- (PKPaymentSetupProductsSectionListItem)listItem;
- (PKProductSearchResult)initWithListItem:(id)a3 searchDistance:(double)a4;
- (double)searchDistance;
@end

@implementation PKProductSearchResult

- (PKProductSearchResult)initWithListItem:(id)a3 searchDistance:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProductSearchResult;
  v8 = [(PKProductSearchResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listItem, a3);
    v9->_searchDistance = a4;
  }

  return v9;
}

- (PKPaymentSetupProductsSectionListItem)listItem
{
  return self->_listItem;
}

- (double)searchDistance
{
  return self->_searchDistance;
}

- (void).cxx_destruct
{
}

@end