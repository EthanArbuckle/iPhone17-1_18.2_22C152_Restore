@interface ContactPlaceItem
- (BOOL)isContactPersisted;
- (BOOL)isMeCard;
- (CNLabeledValue)selectedAddress;
- (MapsLocationOfInterest)locationOfInterest;
- (SearchResult)searchResult;
- (id)name;
- (void)setIsMeCard:(BOOL)a3;
- (void)setLocationOfInterest:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setSelectedAddress:(id)a3;
@end

@implementation ContactPlaceItem

- (id)name
{
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    uint64_t v4 = [(MapsLocationOfInterest *)locationOfInterest name];
LABEL_3:
    id v5 = (id)v4;
    goto LABEL_4;
  }
  if ([(ContactPlaceItem *)self representsPerson])
  {
    v7 = [(ContactPlaceItem *)self contact];
    v8 = +[CNContactFormatter stringFromContact:v7 style:0];

    if ([v8 length])
    {
      id v5 = v8;
    }
    else
    {
      v13 = [(ContactPlaceItem *)self selectedAddress];
      v14 = [v13 label];
      v15 = +[CNLabeledValue localizedStringForLabel:v14];
      id v5 = [v15 capitalizedString];
    }
    goto LABEL_4;
  }
  if (![(ContactPlaceItem *)self isMeCard]
    || ([(ContactPlaceItem *)self selectedAddress],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v16.receiver = self;
    v16.super_class = (Class)ContactPlaceItem;
    uint64_t v4 = [(ContactPlaceItem *)&v16 name];
    goto LABEL_3;
  }
  v10 = [(ContactPlaceItem *)self selectedAddress];
  v11 = [v10 label];
  v12 = +[CNLabeledValue localizedStringForLabel:v11];
  id v5 = [v12 capitalizedString];

LABEL_4:

  return v5;
}

- (BOOL)isContactPersisted
{
  return 1;
}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (void)setIsMeCard:(BOOL)a3
{
  self->_isMeCard = a3;
}

- (CNLabeledValue)selectedAddress
{
  return self->_selectedAddress;
}

- (void)setSelectedAddress:(id)a3
{
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);

  objc_storeStrong((id *)&self->_selectedAddress, 0);
}

@end