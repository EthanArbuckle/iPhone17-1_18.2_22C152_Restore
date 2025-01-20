@interface CarAddressWaypointsController
- (AddressBookAddress)address;
- (CarAddressWaypointsController)initWithAddress:(id)a3;
- (CarAddressWaypointsController)initWithAddress:(id)a3 overridingTitle:(id)a4;
- (NSString)titleOverride;
- (SearchResult)searchResult;
- (id)subtitleForCurrentDestination;
- (id)titleForCurrentDestination;
@end

@implementation CarAddressWaypointsController

- (CarAddressWaypointsController)initWithAddress:(id)a3 overridingTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CarAddressWaypointsController;
  v9 = [(CarAddressWaypointsController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_address, a3);
    objc_storeStrong((id *)&v10->_titleOverride, a4);
    v11 = [SearchResult alloc];
    v12 = [(CarAddressWaypointsController *)v10 address];
    v13 = [(SearchResult *)v11 initWithSearchResult:0 address:v12];
    searchResult = v10->_searchResult;
    v10->_searchResult = v13;
  }
  return v10;
}

- (CarAddressWaypointsController)initWithAddress:(id)a3
{
  return [(CarAddressWaypointsController *)self initWithAddress:a3 overridingTitle:0];
}

- (id)titleForCurrentDestination
{
  v3 = [(CarAddressWaypointsController *)self titleOverride];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(CarAddressWaypointsController *)self address];
    id v5 = [v6 compositeName];
  }

  return v5;
}

- (id)subtitleForCurrentDestination
{
  v2 = [(CarAddressWaypointsController *)self address];
  v3 = [v2 singleLineAddress];

  return v3;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end